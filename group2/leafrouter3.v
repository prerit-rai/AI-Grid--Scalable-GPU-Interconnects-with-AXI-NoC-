`timescale 1ns/1ps

module enhanced_router #(
    parameter ROUTER_ID = 3,
    parameter DWIDTH = 16,
    parameter FIFO_DEPTH = 8,
    parameter GROUP_ID = 4'b0010 //group 2
)(
    input  wire clk,
    input  wire reset,
    input  wire arb_enable,

    // GPU
    input  wire [DWIDTH-1:0] gpu_in_data,
    input  wire              gpu_in_valid,
    input  wire [5:0]        gpu_dest_addr,
    output wire [DWIDTH-1:0] gpu_out_data,
    output wire              gpu_out_valid,

    // Spines in (to router)
    input  wire [DWIDTH-1:0] spine13_in_data,
    input  wire              spine13_in_valid,
    input  wire [5:0]        spine13_dest_addr,
    output wire [DWIDTH-1:0] spine13_out_data,
    output wire              spine13_out_valid,

    input  wire [DWIDTH-1:0] spine23_in_data,
    input  wire              spine23_in_valid,
    input  wire [5:0]        spine23_dest_addr,
    output wire [DWIDTH-1:0] spine23_out_data,
    output wire              spine23_out_valid,

    input  wire [DWIDTH-1:0] spine33_in_data,
    input  wire              spine33_in_valid,
    input  wire [5:0]        spine33_dest_addr,
    output wire [DWIDTH-1:0] spine33_out_data,
    output wire              spine33_out_valid,

    input  wire [DWIDTH-1:0] spine43_in_data,
    input  wire              spine43_in_valid,
    input  wire [5:0]        spine43_dest_addr,
    output wire [DWIDTH-1:0] spine43_out_data,
    output wire              spine43_out_valid,

    // Status buses (tie-offs here)
    output wire [3:0] spine_fifo_in_full,
    output wire [3:0] spine_fifo_in_empty,
    output wire [3:0] spine_fifo_out_full,
    output wire [3:0] spine_fifo_out_empty,
    output wire       gpu_fifo_in_full,
    output wire       gpu_fifo_in_empty,
    output wire       gpu_fifo_out_full,
    output wire       gpu_fifo_out_empty,

    // Crossbar status
    output wire       crossbar_busy,
    output wire [2:0] current_grant,
    output wire [1:0] routing_direction
);

    // Tie off FIFO status (no FIFOs at this top level)
    assign spine_fifo_in_full   = 4'b0000;
    assign spine_fifo_in_empty  = 4'b0000;
    assign spine_fifo_out_full  = 4'b0000;
    assign spine_fifo_out_empty = 4'b0000;
    assign gpu_fifo_in_full     = 1'b0;
    assign gpu_fifo_in_empty    = 1'b0;
    assign gpu_fifo_out_full    = 1'b0;
    assign gpu_fifo_out_empty   = 1'b0;

    // Crossbar instance
    bidirectional_fsm_crossbar #(
        .DWIDTH(DWIDTH),
        .GROUP_ID(GROUP_ID)
    ) crossbar (
        .clk(clk),
        .reset(reset),
        .arb_enable(arb_enable),

        .gpu_incoming_data(gpu_in_data),
        .gpu_incoming_valid(gpu_in_valid),
        .gpu_ready(1'b1),
        .gpu_dest_addr(gpu_dest_addr),
        .gpu_outgoing_data(gpu_out_data),
        .gpu_outgoing_valid(gpu_out_valid),

        .spine1_out_data(spine13_in_data),
        .spine1_out_valid(spine13_in_valid),
        .spine1_ready(1'b1),
        .spine1_dest_addr(spine13_dest_addr),
        .spine1_in_data(spine13_out_data),
        .spine1_in_valid(spine13_out_valid),

        .spine2_out_data(spine23_in_data),
        .spine2_out_valid(spine23_in_valid),
        .spine2_ready(1'b1),
        .spine2_dest_addr(spine23_dest_addr),
        .spine2_in_data(spine23_out_data),
        .spine2_in_valid(spine23_out_valid),

        .spine3_out_data(spine33_in_data),
        .spine3_out_valid(spine33_in_valid),
        .spine3_ready(1'b1),
        .spine3_dest_addr(spine33_dest_addr),
        .spine3_in_data(spine33_out_data),
        .spine3_in_valid(spine33_out_valid),

        .spine4_out_data(spine43_in_data),
        .spine4_out_valid(spine43_in_valid),
        .spine4_ready(1'b1),
        .spine4_dest_addr(spine43_dest_addr),
        .spine4_in_data(spine43_out_data),
        .spine4_in_valid(spine43_out_valid),

        .busy(crossbar_busy),
        .current_grant(current_grant),
        .direction(routing_direction)
    );

endmodule
