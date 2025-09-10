`timescale 1ns/1ps
module top10(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  
  // Exposed spine ports for external connection
  // Spine 1
  output wire [15:0] spine12_out_data,
  output wire        spine12_out_valid,
  input  wire [15:0] spine12_in_data,
  input  wire        spine12_in_valid,
  input  wire [5:0]  spine12_dest_addr,
  
  // Spine 2
  output wire [15:0] spine22_out_data,
  output wire        spine22_out_valid,
  input  wire [15:0] spine22_in_data,
  input  wire        spine22_in_valid,
  input  wire [5:0]  spine22_dest_addr,
  
  // Spine 3
  output wire [15:0] spine32_out_data,
  output wire        spine32_out_valid,
  input  wire [15:0] spine32_in_data,
  input  wire        spine32_in_valid,
  input  wire [5:0]  spine32_dest_addr,
  
  // Spine 4
  output wire [15:0] spine42_out_data,
  output wire        spine42_out_valid,
  input  wire [15:0] spine42_in_data,
  input  wire        spine42_in_valid,
  input  wire [5:0]  spine42_dest_addr
);

  // Network interface wires connecting GPU and NI
  wire [15:0] net_data_gpu_to_ni;
  wire        net_valid_gpu_to_ni;
  wire        net_ready_ni_to_gpu;

  wire [15:0] net_data_ni_to_gpu;
  wire        net_valid_ni_to_gpu;
  wire        net_ready_gpu_to_ni;

  // Router interface wires connecting NI and Router
  wire [15:0] router_to_ni_data;
  wire        router_to_ni_valid;
  wire [15:0] ni_to_router_data;
  wire        ni_to_router_valid;

  // GPU instance
  axi_gpu #(
    .GPU_ID(10)
  ) gpu (
    .ACLK(ACLK),
    .ARESETn(ARESETn),

    // Network Interface connected to NI
    .net_data_out(net_data_gpu_to_ni),
    .net_valid_out(net_valid_gpu_to_ni),
    .net_ready_in(net_ready_ni_to_gpu),
    .net_data_in(net_data_ni_to_gpu),
    .net_valid_in(net_valid_ni_to_gpu),
    .net_ready_out(net_ready_gpu_to_ni),

    // AXI Master and Slave interfaces tied off
    .M_AWID(), .M_AWADDR(), .M_AWLEN(), .M_AWSIZE(), .M_AWBURST(), .M_AWVALID(), .M_AWREADY(1'b0),
    .M_WDATA(), .M_WSTRB(), .M_WLAST(), .M_WVALID(), .M_WREADY(1'b0),
    .M_BID(4'd0), .M_BRESP(2'd0), .M_BVALID(1'b0), .M_BREADY(),
    .M_ARID(), .M_ARADDR(), .M_ARLEN(), .M_ARSIZE(), .M_ARBURST(), .M_ARVALID(), .M_ARREADY(1'b0),
    .M_RID(4'd0), .M_RDATA(64'd0), .M_RRESP(2'd0), .M_RLAST(1'b0), .M_RVALID(1'b0), .M_RREADY(),
    .S_AWID(4'd0), .S_AWADDR(32'd0), .S_AWLEN(8'd0), .S_AWSIZE(3'd0), .S_AWBURST(2'd0), .S_AWVALID(1'b0), .S_AWREADY(),
    .S_WDATA(64'd0), .S_WSTRB(8'h00), .S_WLAST(1'b0), .S_WVALID(1'b0), .S_WREADY(),
    .S_BID(), .S_BRESP(), .S_BVALID(), .S_BREADY(1'b0),
    .S_ARID(4'd0), .S_ARADDR(32'd0), .S_ARLEN(8'd0), .S_ARSIZE(3'd0), .S_ARBURST(2'd0), .S_ARVALID(1'b0), .S_ARREADY(),
    .S_RID(), .S_RDATA(), .S_RRESP(), .S_RLAST(), .S_RVALID(), .S_RREADY(1'b0)
  );

  // NI instance
  ni #(
    .GPU_ID(10)
  ) network_interface (
    .clk(ACLK),
    .reset(~ARESETn),

    // GPU side interface
    .gpu_data_in(net_data_gpu_to_ni),
    .gpu_valid_in(net_valid_gpu_to_ni),
    .gpu_ready_out(net_ready_ni_to_gpu),
    .gpu_data_out(net_data_ni_to_gpu),
    .gpu_valid_out(net_valid_ni_to_gpu),
    .gpu_ready_in(net_ready_gpu_to_ni),

    // Router side - connected to router's GPU interface
    .router_data_out(ni_to_router_data),      // To router GPU input
    .router_valid_out(ni_to_router_valid),    // To router GPU input
    .router_ready_in(1'b1),                   // Router always ready
    
    .router_data_in(router_to_ni_data),       // From router GPU output
    .router_valid_in(router_to_ni_valid)      // From router GPU output
  );

  // Router instance - connected to NI
  enhanced_router #(
    .ROUTER_ID(2),
    .DWIDTH(16),
    .GROUP_ID(4'b0011)
  ) router (
    .clk(ACLK),
    .reset(~ARESETn),
    .arb_enable(1'b1),  // Enable arbitration
    
    // GPU Interface (connected to NI)
    .gpu_in_data(ni_to_router_data),       // From NI -> Router input
    .gpu_in_valid(ni_to_router_valid),     // From NI -> Router input
    .gpu_dest_addr(ni_to_router_data[15:10]), // Extract dest addr from NI data
    
    .gpu_out_data(router_to_ni_data),      // From Router -> NI input
    .gpu_out_valid(router_to_ni_valid),    // From Router -> NI input
    
    // Spine interfaces - connected to module ports
    .spine12_in_data(spine12_in_data),
    .spine12_in_valid(spine12_in_valid),
    .spine12_dest_addr(spine12_dest_addr),
    .spine12_out_data(spine12_out_data),
    .spine12_out_valid(spine12_out_valid),
    
    .spine22_in_data(spine22_in_data),
    .spine22_in_valid(spine22_in_valid),
    .spine22_dest_addr(spine22_dest_addr),
    .spine22_out_data(spine22_out_data),
    .spine22_out_valid(spine22_out_valid),
    
    .spine32_in_data(spine32_in_data),
    .spine32_in_valid(spine32_in_valid),
    .spine32_dest_addr(spine32_dest_addr),
    .spine32_out_data(spine32_out_data),
    .spine32_out_valid(spine32_out_valid),
    
    .spine42_in_data(spine42_in_data),
    .spine42_in_valid(spine42_in_valid),
    .spine42_dest_addr(spine42_dest_addr),
    .spine42_out_data(spine42_out_data),
    .spine42_out_valid(spine42_out_valid),
    
    // Status buses - tie off
    .spine_fifo_in_full(),
    .spine_fifo_in_empty(),
    .spine_fifo_out_full(),
    .spine_fifo_out_empty(),
    .gpu_fifo_in_full(),
    .gpu_fifo_in_empty(),
    .gpu_fifo_out_full(),
    .gpu_fifo_out_empty(),
    
    // Crossbar status
    .crossbar_busy(),
    .current_grant(),
    .routing_direction()
  );

endmodule