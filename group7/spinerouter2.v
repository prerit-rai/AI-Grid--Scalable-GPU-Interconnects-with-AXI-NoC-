`timescale 1ns/1ps

module spine_router #(
    parameter GROUP_ID = 4'b0111, //group 7
    parameter SPINE_ROUTER_ID = 2,
    parameter DWIDTH = 16,
    parameter FIFO_DEPTH = 8
)(
    input  wire clk,
    input  wire reset,
    input dir_local,
    
    // Port 1-4 (leaf ports)
    input [DWIDTH-1:0] spine21_in_data, spine22_in_data, spine23_in_data, spine24_in_data,
    input spine21_in_valid, spine22_in_valid, spine23_in_valid, spine24_in_valid,
    output reg [DWIDTH-1:0] spine21_out_data, spine22_out_data, spine23_out_data, spine24_out_data,
    output reg spine21_out_valid, spine22_out_valid, spine23_out_valid, spine24_out_valid,
    
    // Port 5-11 (group ports)
    input [DWIDTH-1:0] group712_out_data, group722_out_data, group732_out_data, group742_out_data,
    input [DWIDTH-1:0] group752_out_data, group762_out_data, group872_out_data,
    input group712_out_valid, group722_out_valid, group732_out_valid, group742_out_valid,
    input group752_out_valid, group762_out_valid, group872_out_valid,
    output reg [DWIDTH-1:0] group712_in_data, group722_in_data, group732_in_data, group742_in_data,
    output reg [DWIDTH-1:0] group752_in_data, group762_in_data, group872_in_data,
    output reg group712_in_valid, group722_in_valid, group732_in_valid, group742_in_valid,
    output reg group752_in_valid, group762_in_valid, group872_in_valid
);

    // Internal port connections
    wire [DWIDTH-1:0] P_in_data [1:11];
    wire [1:11] P_in_valid;
    wire [DWIDTH-1:0] P_out_data [1:11];
    reg [1:11] P_out_valid;
    wire [1:11] P_in_fifo_full;
    wire [1:11] P_out_fifo_full;

    // FSM signals
    wire [5:0] rt_dest_addr;

    // ==========================
    // Port Instantiations - USING FIXED PORTS
    // ==========================
    
    // Port 1 (leaf1)
    router_port #(.PORT_ID(1), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port1 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(spine21_in_data), .in_incoming_valid(spine21_in_valid),
        .in_outgoing_data(P_in_data[1]), .in_outgoing_valid(P_in_valid[1]),
        .out_incoming_data(P_out_data[1]), .out_incoming_valid(P_out_valid[1]),
        .out_outgoing_data(spine21_out_data), .out_outgoing_valid(spine21_out_valid),
        .in_fifo_full(P_in_fifo_full[1]), .out_fifo_full(P_out_fifo_full[1])
    );

    // Port 2 (leaf2)
    router_port #(.PORT_ID(2), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port2 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(spine22_in_data), .in_incoming_valid(spine22_in_valid),
        .in_outgoing_data(P_in_data[2]), .in_outgoing_valid(P_in_valid[2]),
        .out_incoming_data(P_out_data[2]), .out_incoming_valid(P_out_valid[2]),
        .out_outgoing_data(spine22_out_data), .out_outgoing_valid(spine22_out_valid),
        .in_fifo_full(P_in_fifo_full[2]), .out_fifo_full(P_out_fifo_full[2])
    );

    // Port 3 (leaf3)
    router_port #(.PORT_ID(3), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port3 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(spine23_in_data), .in_incoming_valid(spine23_in_valid),
        .in_outgoing_data(P_in_data[3]), .in_outgoing_valid(P_in_valid[3]),
        .out_incoming_data(P_out_data[3]), .out_incoming_valid(P_out_valid[3]),
        .out_outgoing_data(spine23_out_data), .out_outgoing_valid(spine23_out_valid),
        .in_fifo_full(P_in_fifo_full[3]), .out_fifo_full(P_out_fifo_full[3])
    );

    // Port 4 (leaf4)
    router_port #(.PORT_ID(4), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port4 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(spine24_in_data), .in_incoming_valid(spine24_in_valid),
        .in_outgoing_data(P_in_data[4]), .in_outgoing_valid(P_in_valid[4]),
        .out_incoming_data(P_out_data[4]), .out_incoming_valid(P_out_valid[4]),
        .out_outgoing_data(spine24_out_data), .out_outgoing_valid(spine24_out_valid),
        .in_fifo_full(P_in_fifo_full[4]), .out_fifo_full(P_out_fifo_full[4])
    );

    // Port 5 (group1)
    router_port #(.PORT_ID(5), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port5 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[5]), .in_incoming_valid(P_out_valid[5]),
        .in_outgoing_data(group712_in_data), .in_outgoing_valid(group712_in_valid),
        .out_incoming_data(group712_out_data), .out_incoming_valid(group712_out_valid),
        .out_outgoing_data(P_in_data[5]), .out_outgoing_valid(P_in_valid[5]),
        .in_fifo_full(P_in_fifo_full[5]), .out_fifo_full(P_out_fifo_full[5])
    );

    // Port 6 (group2)
    router_port #(.PORT_ID(6), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port6 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[6]), .in_incoming_valid(P_out_valid[6]),
        .in_outgoing_data(group722_in_data), .in_outgoing_valid(group722_in_valid),
        .out_incoming_data(group722_out_data), .out_incoming_valid(group722_out_valid),
        .out_outgoing_data(P_in_data[6]), .out_outgoing_valid(P_in_valid[6]),
        .in_fifo_full(P_in_fifo_full[6]), .out_fifo_full(P_out_fifo_full[6])
    );

    // Port 7 (group3)
    router_port #(.PORT_ID(7), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port7 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[7]), .in_incoming_valid(P_out_valid[7]),
        .in_outgoing_data(group732_in_data), .in_outgoing_valid(group732_in_valid),
        .out_incoming_data(group732_out_data), .out_incoming_valid(group732_out_valid),
        .out_outgoing_data(P_in_data[7]), .out_outgoing_valid(P_in_valid[7]),
        .in_fifo_full(P_in_fifo_full[7]), .out_fifo_full(P_out_fifo_full[7])
    );

    // Port 8 (group4)
    router_port #(.PORT_ID(8), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port8 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[8]), .in_incoming_valid(P_out_valid[8]),
        .in_outgoing_data(group742_in_data), .in_outgoing_valid(group742_in_valid),
        .out_incoming_data(group742_out_data), .out_incoming_valid(group742_out_valid),
        .out_outgoing_data(P_in_data[8]), .out_outgoing_valid(P_in_valid[8]),
        .in_fifo_full(P_in_fifo_full[8]), .out_fifo_full(P_out_fifo_full[8])
    );

    // Port 9 (group5)
    router_port #(.PORT_ID(9), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port9 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[9]), .in_incoming_valid(P_out_valid[9]),
        .in_outgoing_data(group752_in_data), .in_outgoing_valid(group752_in_valid),
        .out_incoming_data(group752_out_data), .out_incoming_valid(group752_out_valid),
        .out_outgoing_data(P_in_data[9]), .out_outgoing_valid(P_in_valid[9]),
        .in_fifo_full(P_in_fifo_full[9]), .out_fifo_full(P_out_fifo_full[9])
    );

    // Port 10 (group6)
    router_port #(.PORT_ID(10), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port10 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[10]), .in_incoming_valid(P_out_valid[10]),
        .in_outgoing_data(group762_in_data), .in_outgoing_valid(group762_in_valid),
        .out_incoming_data(group762_out_data), .out_incoming_valid(group762_out_valid),
        .out_outgoing_data(P_in_data[10]), .out_outgoing_valid(P_in_valid[10]),
        .in_fifo_full(P_in_fifo_full[10]), .out_fifo_full(P_out_fifo_full[10])
    );

    // Port 11 (group7)
    router_port #(.PORT_ID(11), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) port11 (
        .clk(clk), .reset(reset), .dir_incoming(dir_local),
        .in_incoming_data(P_out_data[11]), .in_incoming_valid(P_out_valid[11]),
        .in_outgoing_data(group872_in_data), .in_outgoing_valid(group872_in_valid),
        .out_incoming_data(group872_out_data), .out_incoming_valid(group872_out_valid),
        .out_outgoing_data(P_in_data[11]), .out_outgoing_valid(P_in_valid[11]),
        .in_fifo_full(P_in_fifo_full[11]), .out_fifo_full(P_out_fifo_full[11])
    );

    // ==========================
    // FSM Instantiation
    // ==========================
    spine_router_fsm #(
        .GROUP_ID(4'b0111),
        .DWIDTH(DWIDTH),
        .NUM_PORTS(11)
    ) router_fsm (
        .clk(clk),
        .reset(reset),
        .port_in_data(P_in_data),
        .port_in_valid(P_in_valid),
        .port_out_data(P_out_data),
        .port_out_valid(P_out_valid),
        .port_in_fifo_full(P_in_fifo_full),
        .port_out_fifo_full(P_out_fifo_full),
        .rt_dest_addr(rt_dest_addr)
    );

endmodule