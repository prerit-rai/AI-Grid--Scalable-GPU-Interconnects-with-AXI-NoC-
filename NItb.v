`timescale 1ns/1ps
module NItb;

    reg clk, reset;
    reg [15:0] gpu_data_in;
    reg gpu_valid_in;
    wire gpu_ready_out;
    wire [15:0] gpu_data_out;
    wire gpu_valid_out;
    reg gpu_ready_in;

    wire [15:0] router_data_out;
    wire router_valid_out;
    reg router_ready_in;
    reg [15:0] router_data_in;
    reg router_valid_in;

    // Instantiate NI
    ni #(
        .GPU_ID(3),      // Testing for GPU ID 3
        .DATA_W(16)
    ) NI_inst (
        .clk(clk),
        .reset(reset),
        .gpu_data_in(gpu_data_in),
        .gpu_valid_in(gpu_valid_in),
        .gpu_ready_out(gpu_ready_out),
        .gpu_data_out(gpu_data_out),
        .gpu_valid_out(gpu_valid_out),
        .gpu_ready_in(gpu_ready_in),
        .router_data_out(router_data_out),
        .router_valid_out(router_valid_out),
        .router_ready_in(router_ready_in),
        .router_data_in(router_data_in),
        .router_valid_in(router_valid_in)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; gpu_valid_in = 0; gpu_ready_in = 1;
        router_ready_in = 1; router_data_in = 0; router_valid_in = 0;

        #20 reset = 0;

        // GPU -> Router test - Send to different GPUs
        // Format: {6-bit dest_gpu_id, 10-bit payload}
        gpu_send({6'd5, 10'h2AA});  // Send to GPU 5
        gpu_send({6'd7, 10'h3BB});  // Send to GPU 7
        gpu_send({6'd2, 10'h0CC});  // Send to GPU 2

        // Router -> GPU test - Send packets destined for GPU 3
        // GPU 3 routing header: 6'b000110
        router_send({6'b000110, 10'h211});  // To GPU 3
        router_send({6'b000110, 10'h222});  // To GPU 3  
        router_send({6'b000110, 10'h233});  // To GPU 3

        #100 $finish;
    end

    // Task to send from GPU - format: {6-bit dest_gpu_id, 10-bit data}
    task gpu_send(input [15:0] data);
        begin
            @(posedge clk);
            gpu_data_in = data;
            gpu_valid_in = 1;
            wait (gpu_ready_out == 1); // wait for ready
            @(posedge clk);
            gpu_valid_in = 0;
        end
    endtask

    // Task to send from Router - format: {6-bit routing_header, 10-bit data}
    task router_send(input [15:0] data);
        begin
            @(posedge clk);
            router_data_in = data;
            router_valid_in = 1;
            @(posedge clk); // Wait one cycle
            router_valid_in = 0;
        end
    endtask

    // Monitor - Simple display without decoding logic
    always @(posedge clk) begin
        if (router_valid_out)
            $display("Time=%0t | GPU->Router | FullData=%h | Header=%b Data=%h | Valid=%b", 
                     $time, router_data_out, router_data_out[15:10], router_data_out[9:0], router_valid_out);
        
        if (gpu_valid_out)
            $display("Time=%0t | Router->GPU | FullData=%h | DestGPU=%0d Data=%h | Valid=%b", 
                     $time, gpu_data_out, gpu_data_out[15:10], gpu_data_out[9:0], gpu_valid_out);
    end

endmodule