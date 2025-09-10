`timescale 1ns/1ps

module enhanced_router #(
    parameter ROUTER_ID = 2,
    parameter DWIDTH = 16,
    parameter FIFO_DEPTH = 8,
    parameter GROUP_ID = 4'b0100 //group 4
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
    input  wire [DWIDTH-1:0] spine12_in_data,
    input  wire              spine12_in_valid,
    input  wire [5:0]        spine12_dest_addr,
    output wire [DWIDTH-1:0] spine12_out_data,
    output wire              spine12_out_valid,

    input  wire [DWIDTH-1:0] spine22_in_data,
    input  wire              spine22_in_valid,
    input  wire [5:0]        spine22_dest_addr,
    output wire [DWIDTH-1:0] spine22_out_data,
    output wire              spine22_out_valid,

    input  wire [DWIDTH-1:0] spine32_in_data,
    input  wire              spine32_in_valid,
    input  wire [5:0]        spine32_dest_addr,
    output wire [DWIDTH-1:0] spine32_out_data,
    output wire              spine32_out_valid,

    input  wire [DWIDTH-1:0] spine42_in_data,
    input  wire              spine42_in_valid,
    input  wire [5:0]        spine42_dest_addr,
    output wire [DWIDTH-1:0] spine42_out_data,
    output wire              spine42_out_valid,

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

        .spine1_out_data(spine12_in_data),
        .spine1_out_valid(spine12_in_valid),
        .spine1_ready(1'b1),
        .spine1_dest_addr(spine12_dest_addr),
        .spine1_in_data(spine12_out_data),
        .spine1_in_valid(spine12_out_valid),

        .spine2_out_data(spine22_in_data),
        .spine2_out_valid(spine22_in_valid),
        .spine2_ready(1'b1),
        .spine2_dest_addr(spine22_dest_addr),
        .spine2_in_data(spine22_out_data),
        .spine2_in_valid(spine22_out_valid),

        .spine3_out_data(spine32_in_data),
        .spine3_out_valid(spine32_in_valid),
        .spine3_ready(1'b1),
        .spine3_dest_addr(spine32_dest_addr),
        .spine3_in_data(spine32_out_data),
        .spine3_in_valid(spine32_out_valid),

        .spine4_out_data(spine42_in_data),
        .spine4_out_valid(spine42_in_valid),
        .spine4_ready(1'b1),
        .spine4_dest_addr(spine42_dest_addr),
        .spine4_in_data(spine42_out_data),
        .spine4_in_valid(spine42_out_valid),

        .busy(crossbar_busy),
        .current_grant(current_grant),
        .direction(routing_direction)
    );

endmodule
