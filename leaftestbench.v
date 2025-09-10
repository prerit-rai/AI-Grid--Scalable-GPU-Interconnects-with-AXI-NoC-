`timescale 1ns/1ps

module enhanced_router_isolation_tb;

    // Parameters
    localparam DWIDTH = 16;
    localparam FIFO_DEPTH = 4;
    localparam CLK_PERIOD = 10;
    localparam GROUP_ID = 4'b1000;

    // DUT IO
    reg clk, reset;
    reg arb_enable;

    // GPU side
    reg  [DWIDTH-1:0] gpu_in_data;
    reg               gpu_in_valid;
    reg  [5:0]        gpu_dest_addr;
    wire [DWIDTH-1:0] gpu_out_data;
    wire              gpu_out_valid;

    // Spine sides
    reg  [DWIDTH-1:0] spine11_in_data, spine21_in_data, spine31_in_data, spine41_in_data;
    reg               spine11_in_valid, spine21_in_valid, spine31_in_valid, spine41_in_valid;
    reg  [5:0]        spine11_dest_addr, spine21_dest_addr, spine31_dest_addr, spine41_dest_addr;
    wire [DWIDTH-1:0] spine11_out_data, spine21_out_data, spine31_out_data, spine41_out_data;
    wire              spine11_out_valid, spine21_out_valid, spine31_out_valid, spine41_out_valid;

    // Status
    wire [3:0] spine_fifo_in_full;
    wire [3:0] spine_fifo_in_empty;
    wire [3:0] spine_fifo_out_full;
    wire [3:0] spine_fifo_out_empty;
    wire       gpu_fifo_in_full;
    wire       gpu_fifo_in_empty;
    wire       gpu_fifo_out_full;
    wire       gpu_fifo_out_empty;
    wire       crossbar_busy;
    wire [2:0] current_grant;
    wire [1:0] routing_direction;

    // DUT
    enhanced_router #(
        .ROUTER_ID(1),
        .DWIDTH(DWIDTH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .GROUP_ID(GROUP_ID)
    ) dut (
        .clk(clk),
        .reset(reset),
        .arb_enable(arb_enable),

        .gpu_in_data(gpu_in_data),
        .gpu_in_valid(gpu_in_valid),
        .gpu_dest_addr(gpu_dest_addr),
        .gpu_out_data(gpu_out_data),
        .gpu_out_valid(gpu_out_valid),

        .spine11_in_data(spine11_in_data),
        .spine11_in_valid(spine11_in_valid),
        .spine11_dest_addr(spine11_dest_addr),
        .spine11_out_data(spine11_out_data),
        .spine11_out_valid(spine11_out_valid),

        .spine21_in_data(spine21_in_data),
        .spine21_in_valid(spine21_in_valid),
        .spine21_dest_addr(spine21_dest_addr),
        .spine21_out_data(spine21_out_data),
        .spine21_out_valid(spine21_out_valid),

        .spine31_in_data(spine31_in_data),
        .spine31_in_valid(spine31_in_valid),
        .spine31_dest_addr(spine31_dest_addr),
        .spine31_out_data(spine31_out_data),
        .spine31_out_valid(spine31_out_valid),

        .spine41_in_data(spine41_in_data),
        .spine41_in_valid(spine41_in_valid),
        .spine41_dest_addr(spine41_dest_addr),
        .spine41_out_data(spine41_out_data),
        .spine41_out_valid(spine41_out_valid),

        .spine_fifo_in_full(spine_fifo_in_full),
        .spine_fifo_in_empty(spine_fifo_in_empty),
        .spine_fifo_out_full(spine_fifo_out_full),
        .spine_fifo_out_empty(spine_fifo_out_empty),
        .gpu_fifo_in_full(gpu_fifo_in_full),
        .gpu_fifo_in_empty(gpu_fifo_in_empty),
        .gpu_fifo_out_full(gpu_fifo_out_full),
        .gpu_fifo_out_empty(gpu_fifo_out_empty),
        .crossbar_busy(crossbar_busy),
        .current_grant(current_grant),
        .routing_direction(routing_direction)
    );

    // Clock
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Stimulus
    initial begin
        // Init
        reset = 1'b1;
        arb_enable = 1'b0;
        gpu_in_data = 'h00; gpu_in_valid = 1'b0; gpu_dest_addr = 6'b0;
        spine11_in_data = 'h00; spine11_in_valid = 1'b0; spine11_dest_addr = 6'b0;
        spine21_in_data = 'h00; spine21_in_valid = 1'b0; spine21_dest_addr = 6'b0;
        spine31_in_data = 'h00; spine31_in_valid = 1'b0; spine31_dest_addr = 6'b0;
        spine41_in_data = 'h00; spine41_in_valid = 1'b0; spine41_dest_addr = 6'b0;

        #(3*CLK_PERIOD);
        reset = 1'b0;
        #(CLK_PERIOD);

        $display("=== Router Isolation TB start ===");

        // Test A: GPU -> Spine routing (fixed priority)
        $display("\n-- Test A: GPU routes by dest group --");
        send_gpu(8'hA1, 6'b000100); // -> Spine1
        #(3*CLK_PERIOD);
        send_gpu(8'hA2, 6'b001000); // -> Spine2
        #(3*CLK_PERIOD);
        send_gpu(8'hA3, 6'b001100); // -> Spine3
        #(3*CLK_PERIOD);
        send_gpu(8'hA4, 6'b010000); // -> Spine4
        #(6*CLK_PERIOD);

        // Test B: Spine -> GPU routing
        $display("\n-- Test B: Spine to GPU --");
        send_spine(1, 8'hB1, 6'b100000);
        #(3*CLK_PERIOD);
        send_spine(2, 8'hB2, 6'b100001);
        #(3*CLK_PERIOD);
        send_spine(3, 8'hB3, 6'b100010);
        #(3*CLK_PERIOD);
        send_spine(4, 8'hB4, 6'b100011);
        #(6*CLK_PERIOD);

        // Test C: Round-robin arbitration
        $display("\n-- Test C: Round-robin with simultaneous requests --");
        arb_enable = 1'b1;
        fork
            begin
                #1; send_gpu(8'hC1, 6'b000100); // GPU -> Spine1
            end
            begin
                #2; send_spine(1, 8'hC2, 6'b100000); // Spine1 -> GPU
            end
            begin
                #3; send_spine(2, 8'hC3, 6'b100001); // Spine2 -> GPU
            end
        join
        #(12*CLK_PERIOD);
        arb_enable = 1'b0;

        $display("\n=== Router Isolation TB done ===");
        $finish;
    end

    // Tasks
    task send_gpu;
        input [DWIDTH-1:0] data;
        input [5:0] dest;
        begin
            gpu_in_data  = data;
            gpu_dest_addr= dest;
            gpu_in_valid = 1'b1;
            #(CLK_PERIOD);
            gpu_in_valid = 1'b0;
            $display("[%0t] GPU send data=%h dest=%b grp=%0d", $time, data, dest, dest[5:2]);
        end
    endtask

    task send_spine;
        input [2:0] which;
        input [DWIDTH-1:0] data;
        input [5:0] dest;
        begin
            case (which)
                1: begin spine11_in_data=data; spine11_dest_addr=dest; spine11_in_valid=1'b1; end
                2: begin spine21_in_data=data; spine21_dest_addr=dest; spine21_in_valid=1'b1; end
                3: begin spine31_in_data=data; spine31_dest_addr=dest; spine31_in_valid=1'b1; end
                4: begin spine41_in_data=data; spine41_dest_addr=dest; spine41_in_valid=1'b1; end
            endcase
            #(CLK_PERIOD);
            case (which)
                1: spine11_in_valid=1'b0;
                2: spine21_in_valid=1'b0;
                3: spine31_in_valid=1'b0;
                4: spine41_in_valid=1'b0;
            endcase
            $display("[%0t] Spine%0d send data=%h dest=%b", $time, which, data, dest);
        end
    endtask

    // Monitors
    always @(posedge clk) begin
        if (!reset) begin
            if (spine11_out_valid) $display("[%0t] Spine1 recv data=%h", $time, spine11_out_data);
            if (spine21_out_valid) $display("[%0t] Spine2 recv data=%h", $time, spine21_out_data);
            if (spine31_out_valid) $display("[%0t] Spine3 recv data=%h", $time, spine31_out_data);
            if (spine41_out_valid) $display("[%0t] Spine4 recv data=%h", $time, spine41_out_data);
            if (gpu_out_valid)    $display("[%0t] GPU recv data=%h", $time, gpu_out_data);
        end
    end

    // Waveform
    initial begin
        $dumpfile("enhanced_router_isolation_tb.vcd");
        $dumpvars(0, enhanced_router_isolation_tb);
    end

endmodule


