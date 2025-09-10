`timescale 1ns/1ps
module top_tb;

  // Clock and Reset
  reg ACLK;
  reg ARESETn;

  // Instantiate top module
  top uut();

  // Connect clock and reset
  initial begin
    force uut.ACLK = ACLK;
    force uut.ARESETn = ARESETn;
  end

  // Test variables
  reg [15:0] test_packet;
  reg test_inject_valid;
  reg [2:0] test_spine_select;
  integer test_counter;
  reg test1_complete;
  reg test2_complete;
  reg test3_complete;
  
  // Monitoring signals
  reg [15:0] last_gpu_tx_packet;
  reg [15:0] last_spine_rx_packet;
  reg [2:0]  last_spine_rx_port;

  // Wires to drive spine inputs (since router inputs are wires)
  wire [15:0] spine1_in_data_tb;
  wire        spine1_in_valid_tb;
  wire [5:0]  spine1_dest_addr_tb;
  
  wire [15:0] spine2_in_data_tb;
  wire        spine2_in_valid_tb;
  wire [5:0]  spine2_dest_addr_tb;
  
  wire [15:0] spine3_in_data_tb;
  wire        spine3_in_valid_tb;
  wire [5:0]  spine3_dest_addr_tb;
  
  wire [15:0] spine4_in_data_tb;
  wire        spine4_in_valid_tb;
  wire [5:0]  spine4_dest_addr_tb;

  // Connect spine inputs to router
  assign uut.router.spine11_in_data = spine1_in_data_tb;
  assign uut.router.spine11_in_valid = spine1_in_valid_tb;
  assign uut.router.spine11_dest_addr = spine1_dest_addr_tb;
  
  assign uut.router.spine21_in_data = spine2_in_data_tb;
  assign uut.router.spine21_in_valid = spine2_in_valid_tb;
  assign uut.router.spine21_dest_addr = spine2_dest_addr_tb;
  
  assign uut.router.spine31_in_data = spine3_in_data_tb;
  assign uut.router.spine31_in_valid = spine3_in_valid_tb;
  assign uut.router.spine31_dest_addr = spine3_dest_addr_tb;
  
  assign uut.router.spine41_in_data = spine4_in_data_tb;
  assign uut.router.spine41_in_valid = spine4_in_valid_tb;
  assign uut.router.spine41_dest_addr = spine4_dest_addr_tb;

  // Clock generation
  initial begin
    ACLK = 0;
    forever #5 ACLK = ~ACLK;
  end

  // Reset sequence
  initial begin
    ARESETn = 0;
    #20;
    ARESETn = 1;
  end

  // Test sequence
  initial begin
    test_inject_valid = 0;
    test_spine_select = 0;
    test_counter = 0;
    test1_complete = 0;
    test2_complete = 0;
    test3_complete = 0;
    last_gpu_tx_packet = 0;
    last_spine_rx_packet = 0;
    last_spine_rx_port = 0;
    
    // Wait for reset to complete
    #30;
    
    $display("=== Starting Comprehensive Router Test ===");
    $display("GPU ID: 1, Router ID: 1");
    
    // Test 1: Monitor GPU → NI → Router → Spine (outgoing)
    $display("=== Test 1: GPU to NI to Router to Spine ===");
    $display("Waiting for GPU to send packet (should happen around 10,000ps)...");
    
    fork
      begin : timeout1
        #20000; // 20,000ps timeout
        if (!test1_complete) begin
          $display("ERROR: No data detected at spine output within 20,000ps");
          $finish;
        end
      end
      
      begin : monitor1
        // Wait for any spine to receive data
        wait((uut.router.spine11_out_valid || uut.router.spine21_out_valid || 
              uut.router.spine31_out_valid || uut.router.spine41_out_valid));
        
        test1_complete = 1;
        
        // Determine which spine received the data
        if (uut.router.spine11_out_valid) begin
          last_spine_rx_packet = uut.router.spine11_out_data;
          last_spine_rx_port = 1;
        end else if (uut.router.spine21_out_valid) begin
          last_spine_rx_packet = uut.router.spine21_out_data;
          last_spine_rx_port = 2;
        end else if (uut.router.spine31_out_valid) begin
          last_spine_rx_packet = uut.router.spine31_out_data;
          last_spine_rx_port = 3;
        end else if (uut.router.spine41_out_valid) begin
          last_spine_rx_packet = uut.router.spine41_out_data;
          last_spine_rx_port = 4;
        end
        
        $display("SUCCESS: GPU data routed to spine %0d at %0tps", last_spine_rx_port, $time);
        $display("Spine %0d received: %h (Routing Addr: %b, Payload: %h)", 
                 last_spine_rx_port, last_spine_rx_packet, 
                 last_spine_rx_packet[15:10], last_spine_rx_packet[9:0]);
        disable timeout1;
      end
    join
    
    // Wait a bit
    #100;
    
    // Test 2: Spine → Router → NI → GPU (incoming to same GPU)
    $display("=== Test 2: Spine to Router to NI to GPU (Same GPU) ===");
    
    // Create test packet for GPU 1 (routing address 6'b000100)
    test_packet = {6'b000100, 10'h2AB}; // Destination GPU 1, payload 0x2AB
    test_spine_select = $random % 4 + 1; // Random spine 1-4
    test_inject_valid = 1;
    
    $display("Injecting packet to spine %0d: %h", test_spine_select, test_packet);
    
    fork
      begin : timeout2
        #10000; // 10,000ps timeout
        if (!test2_complete) begin
          $display("ERROR: Injected packet not received by GPU within 10,000ps");
          $finish;
        end
      end
      
      begin : monitor2
        wait(uut.net_valid_ni_to_gpu && uut.net_ready_gpu_to_ni);
        test2_complete = 1;
        $display("SUCCESS: Injected data received by GPU at %0tps", $time);
        $display("GPU received: %h (Src GPU ID: %0d, Payload: %h)", 
                 uut.net_data_ni_to_gpu,
                 uut.net_data_ni_to_gpu[15:10],
                 uut.net_data_ni_to_gpu[9:0]);
        disable timeout2;
      end
    join
    
    // Complete injection
    #10;
    test_inject_valid = 0;
    
    // Wait a bit
    #100;
    
    // Test 3: Spine → Router → Different Destination (should not reach GPU 1)
    $display("=== Test 3: Spine → Router → Different Destination (Filter Test) ===");
    
    // Create test packet for different GPU (not GPU 1)
    test_packet = {6'b000101, 10'h3CD}; // Destination GPU 2, payload 0x3CD
    test_spine_select = $random % 4 + 1; // Random spine 1-4
    test_inject_valid = 1;
    
    $display("Injecting packet to spine %0d for different GPU: %h", test_spine_select, test_packet);
    
    fork
      begin : timeout3
        #5000; // 5,000ps timeout - should NOT receive this
        if (!test3_complete) begin
          $display("SUCCESS: Packet correctly filtered - not received by GPU 1");
          test3_complete = 1;
        end
      end
      
      begin : monitor3
        wait(uut.net_valid_ni_to_gpu && uut.net_ready_gpu_to_ni);
        if (uut.net_data_ni_to_gpu[15:10] != 1) begin
          $display("ERROR: GPU 1 received packet intended for GPU %0d!", uut.net_data_ni_to_gpu[15:10]);
          $finish;
        end
      end
    join
    
    // Complete injection
    #10;
    test_inject_valid = 0;
    
    // Final results
    #100;
    $display("=== TEST RESULTS ===");
    $display("Test 1 (GPU → Spine): %s", test1_complete ? "PASS" : "FAIL");
    $display("Test 2 (Spine → GPU): %s", test2_complete ? "PASS" : "FAIL");
    $display("Test 3 (Filter Test): %s", test3_complete ? "PASS" : "FAIL");
    
    if (test1_complete && test2_complete && test3_complete) begin
      $display("=== ALL TESTS PASSED ===");
    end else begin
      $display("=== SOME TESTS FAILED ===");
    end
    
    $finish;
  end

  // Drive spine inputs for Test 2 and 3 using continuous assignments
  assign spine1_in_data_tb = (test_spine_select == 1 && test_inject_valid) ? test_packet : 16'd0;
  assign spine1_in_valid_tb = (test_spine_select == 1 && test_inject_valid) ? 1'b1 : 1'b0;
  assign spine1_dest_addr_tb = (test_spine_select == 1 && test_inject_valid) ? test_packet[15:10] : 6'd0;
  
  assign spine2_in_data_tb = (test_spine_select == 2 && test_inject_valid) ? test_packet : 16'd0;
  assign spine2_in_valid_tb = (test_spine_select == 2 && test_inject_valid) ? 1'b1 : 1'b0;
  assign spine2_dest_addr_tb = (test_spine_select == 2 && test_inject_valid) ? test_packet[15:10] : 6'd0;
  
  assign spine3_in_data_tb = (test_spine_select == 3 && test_inject_valid) ? test_packet : 16'd0;
  assign spine3_in_valid_tb = (test_spine_select == 3 && test_inject_valid) ? 1'b1 : 1'b0;
  assign spine3_dest_addr_tb = (test_spine_select == 3 && test_inject_valid) ? test_packet[15:10] : 6'd0;
  
  assign spine4_in_data_tb = (test_spine_select == 4 && test_inject_valid) ? test_packet : 16'd0;
  assign spine4_in_valid_tb = (test_spine_select == 4 && test_inject_valid) ? 1'b1 : 1'b0;
  assign spine4_dest_addr_tb = (test_spine_select == 4 && test_inject_valid) ? test_packet[15:10] : 6'd0;

  // Debug monitoring
  always @(posedge ACLK) begin
    // GPU → NI
    if (uut.net_valid_gpu_to_ni && uut.net_ready_ni_to_gpu) begin
      last_gpu_tx_packet = uut.net_data_gpu_to_ni;
      $display("[%0t] GPU -> NI: %h (Dest GPU: %0d)", $time, 
               uut.net_data_gpu_to_ni, uut.net_data_gpu_to_ni[15:10]);
    end
    
    // NI → Router
    if (uut.ni_to_router_valid) begin
      $display("[%0t] NI -> Router: %h (Routing Addr: %b)", $time, 
               uut.ni_to_router_data, uut.ni_to_router_data[15:10]);
    end
    
    // Router → Spine outputs
    if (uut.router.spine11_out_valid) begin
      $display("[%0t] Router -> Spine1: %h (Dest: %b)", $time, 
               uut.router.spine11_out_data, uut.router.spine11_out_data[15:10]);
    end
    if (uut.router.spine21_out_valid) begin
      $display("[%0t] Router -> Spine2: %h (Dest: %b)", $time, 
               uut.router.spine21_out_data, uut.router.spine21_out_data[15:10]);
    end
    if (uut.router.spine31_out_valid) begin
      $display("[%0t] Router -> Spine3: %h (Dest: %b)", $time, 
               uut.router.spine31_out_data, uut.router.spine31_out_data[15:10]);
    end
    if (uut.router.spine41_out_valid) begin
      $display("[%0t] Router -> Spine4: %h (Dest: %b)", $time, 
               uut.router.spine41_out_data, uut.router.spine41_out_data[15:10]);
    end
    
    // Router → NI (GPU output)
    if (uut.router_to_ni_valid) begin
      $display("[%0t] Router -> NI: %h (Routing Addr: %b)", $time, 
               uut.router_to_ni_data, uut.router_to_ni_data[15:10]);
    end
    
    // NI → GPU
    if (uut.net_valid_ni_to_gpu && uut.net_ready_gpu_to_ni) begin
      $display("[%0t] NI -> GPU: %h (Src GPU: %0d)", $time, 
               uut.net_data_ni_to_gpu, uut.net_data_ni_to_gpu[15:10]);
    end
  end

  // VCD dump
  initial begin
    $dumpfile("router_test.vcd");
    $dumpvars(0, top_tb);
  end

endmodule