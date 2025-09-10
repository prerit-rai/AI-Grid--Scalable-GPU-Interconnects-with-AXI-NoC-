`timescale 1ns/1ps
module group6(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group611_out_data, group621_out_data, group631_out_data, group641_out_data,
  output wire [15:0] group651_out_data, group761_out_data, group861_out_data,
  output wire group611_out_valid, group621_out_valid, group631_out_valid, group641_out_valid,
  output wire group651_out_valid, group761_out_valid, group861_out_valid,
  input wire [15:0] group611_in_data, group621_in_data, group631_in_data, group641_in_data,
  input wire [15:0] group651_in_data, group761_in_data, group861_in_data,
  input wire group611_in_valid, group621_in_valid, group631_in_valid, group641_in_valid,
  input wire group651_in_valid, group761_in_valid, group861_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group612_out_data, group622_out_data, group632_out_data, group642_out_data,
  output wire [15:0] group652_out_data, group762_out_data, group862_out_data,
  output wire group612_out_valid, group622_out_valid, group632_out_valid, group642_out_valid,
  output wire group652_out_valid, group762_out_valid, group862_out_valid,
  input wire [15:0] group612_in_data, group622_in_data, group632_in_data, group642_in_data,
  input wire [15:0] group652_in_data, group762_in_data, group862_in_data,
  input wire group612_in_valid, group622_in_valid, group632_in_valid, group642_in_valid,
  input wire group652_in_valid, group762_in_valid, group862_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group613_out_data, group623_out_data, group633_out_data, group643_out_data,
  output wire [15:0] group653_out_data, group763_out_data, group863_out_data,
  output wire group613_out_valid, group623_out_valid, group633_out_valid, group643_out_valid,
  output wire group653_out_valid, group763_out_valid, group863_out_valid,
  input wire [15:0] group613_in_data, group623_in_data, group633_in_data, group643_in_data,
  input wire [15:0] group653_in_data, group763_in_data, group863_in_data,
  input wire group613_in_valid, group623_in_valid, group633_in_valid, group643_in_valid,
  input wire group653_in_valid, group763_in_valid, group863_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group614_out_data, group624_out_data, group634_out_data, group644_out_data,
  output wire [15:0] group654_out_data, group764_out_data, group864_out_data,
  output wire group614_out_valid, group624_out_valid, group634_out_valid, group644_out_valid,
  output wire group654_out_valid, group764_out_valid, group864_out_valid,
  input wire [15:0] group614_in_data, group624_in_data, group634_in_data, group644_in_data,
  input wire [15:0] group654_in_data, group764_in_data, group864_in_data,
  input wire group614_in_valid, group624_in_valid, group634_in_valid, group644_in_valid,
  input wire group654_in_valid, group764_in_valid, group864_in_valid
);

  // Internal connections between GPU modules and spine routers
  wire [15:0] spine11_out_data, spine12_out_data, spine13_out_data, spine14_out_data;
  wire spine11_out_valid, spine12_out_valid, spine13_out_valid, spine14_out_valid;
  wire [15:0] spine11_in_data, spine12_in_data, spine13_in_data, spine14_in_data;
  wire spine11_in_valid, spine12_in_valid, spine13_in_valid, spine14_in_valid;
  wire [5:0] spine11_dest_addr, spine12_dest_addr, spine13_dest_addr, spine14_dest_addr;
  
  wire [15:0] spine21_out_data, spine22_out_data, spine23_out_data, spine24_out_data;
  wire spine21_out_valid, spine22_out_valid, spine23_out_valid, spine24_out_valid;
  wire [15:0] spine21_in_data, spine22_in_data, spine23_in_data, spine24_in_data;
  wire spine21_in_valid, spine22_in_valid, spine23_in_valid, spine24_in_valid;
  wire [5:0] spine21_dest_addr, spine22_dest_addr, spine23_dest_addr, spine24_dest_addr;
  
  wire [15:0] spine31_out_data, spine32_out_data, spine33_out_data, spine34_out_data;
  wire spine31_out_valid, spine32_out_valid, spine33_out_valid, spine34_out_valid;
  wire [15:0] spine31_in_data, spine32_in_data, spine33_in_data, spine34_in_data;
  wire spine31_in_valid, spine32_in_valid, spine33_in_valid, spine34_in_valid;
  wire [5:0] spine31_dest_addr, spine32_dest_addr, spine33_dest_addr, spine34_dest_addr;
  
  wire [15:0] spine41_out_data, spine42_out_data, spine43_out_data, spine44_out_data;
  wire spine41_out_valid, spine42_out_valid, spine43_out_valid, spine44_out_valid;
  wire [15:0] spine41_in_data, spine42_in_data, spine43_in_data, spine44_in_data;
  wire spine41_in_valid, spine42_in_valid, spine43_in_valid, spine44_in_valid;
  wire [5:0] spine41_dest_addr, spine42_dest_addr, spine43_dest_addr, spine44_dest_addr;

  // Instantiate GPU modules (GPUs 21-24)
  top21 gpu21 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    .spine11_out_data(spine11_out_data),
    .spine11_out_valid(spine11_out_valid),
    .spine11_in_data(spine11_in_data),
    .spine11_in_valid(spine11_in_valid),
    .spine11_dest_addr(spine11_dest_addr),
    .spine21_out_data(spine21_out_data),
    .spine21_out_valid(spine21_out_valid),
    .spine21_in_data(spine21_in_data),
    .spine21_in_valid(spine21_in_valid),
    .spine21_dest_addr(spine21_dest_addr),
    .spine31_out_data(spine31_out_data),
    .spine31_out_valid(spine31_out_valid),
    .spine31_in_data(spine31_in_data),
    .spine31_in_valid(spine31_in_valid),
    .spine31_dest_addr(spine31_dest_addr),
    .spine41_out_data(spine41_out_data),
    .spine41_out_valid(spine41_out_valid),
    .spine41_in_data(spine41_in_data),
    .spine41_in_valid(spine41_in_valid),
    .spine41_dest_addr(spine41_dest_addr)
  );

  top22 gpu22 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    .spine12_out_data(spine12_out_data),
    .spine12_out_valid(spine12_out_valid),
    .spine12_in_data(spine12_in_data),
    .spine12_in_valid(spine12_in_valid),
    .spine12_dest_addr(spine12_dest_addr),
    .spine22_out_data(spine22_out_data),
    .spine22_out_valid(spine22_out_valid),
    .spine22_in_data(spine22_in_data),
    .spine22_in_valid(spine22_in_valid),
    .spine22_dest_addr(spine22_dest_addr),
    .spine32_out_data(spine32_out_data),
    .spine32_out_valid(spine32_out_valid),
    .spine32_in_data(spine32_in_data),
    .spine32_in_valid(spine32_in_valid),
    .spine32_dest_addr(spine32_dest_addr),
    .spine42_out_data(spine42_out_data),
    .spine42_out_valid(spine42_out_valid),
    .spine42_in_data(spine42_in_data),
    .spine42_in_valid(spine42_in_valid),
    .spine42_dest_addr(spine42_dest_addr)
  );

  top23 gpu23 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    .spine13_out_data(spine13_out_data),
    .spine13_out_valid(spine13_out_valid),
    .spine13_in_data(spine13_in_data),
    .spine13_in_valid(spine13_in_valid),
    .spine13_dest_addr(spine13_dest_addr),
    .spine23_out_data(spine23_out_data),
    .spine23_out_valid(spine23_out_valid),
    .spine23_in_data(spine23_in_data),
    .spine23_in_valid(spine23_in_valid),
    .spine23_dest_addr(spine23_dest_addr),
    .spine33_out_data(spine33_out_data),
    .spine33_out_valid(spine33_out_valid),
    .spine33_in_data(spine33_in_data),
    .spine33_in_valid(spine33_in_valid),
    .spine33_dest_addr(spine33_dest_addr),
    .spine43_out_data(spine43_out_data),
    .spine43_out_valid(spine43_out_valid),
    .spine43_in_data(spine43_in_data),
    .spine43_in_valid(spine43_in_valid),
    .spine43_dest_addr(spine43_dest_addr)
  );

  top24 gpu24 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    .spine14_out_data(spine14_out_data),
    .spine14_out_valid(spine14_out_valid),
    .spine14_in_data(spine14_in_data),
    .spine14_in_valid(spine14_in_valid),
    .spine14_dest_addr(spine14_dest_addr),
    .spine24_out_data(spine24_out_data),
    .spine24_out_valid(spine24_out_valid),
    .spine24_in_data(spine24_in_data),
    .spine24_in_valid(spine24_in_valid),
    .spine24_dest_addr(spine24_dest_addr),
    .spine34_out_data(spine34_out_data),
    .spine34_out_valid(spine34_out_valid),
    .spine34_in_data(spine34_in_data),
    .spine34_in_valid(spine34_in_valid),
    .spine34_dest_addr(spine34_dest_addr),
    .spine44_out_data(spine44_out_data),
    .spine44_out_valid(spine44_out_valid),
    .spine44_in_data(spine44_in_data),
    .spine44_in_valid(spine44_in_valid),
    .spine44_dest_addr(spine44_dest_addr)
  );

  // Instantiate Spine Routers
  spine_router #(
    .GROUP_ID(4'b0110),
    .SPINE_ROUTER_ID(1),
    .DWIDTH(16),
    .FIFO_DEPTH(8)
  ) spine1 (
    .clk(ACLK),
    .reset(~ARESETn),
    .dir_local(dir_local),
    
    // Leaf connections
    .spine11_in_data(spine11_out_data),
    .spine11_in_valid(spine11_out_valid),
    .spine11_out_data(spine11_in_data),
    .spine11_out_valid(spine11_in_valid),
    
    .spine12_in_data(spine12_out_data),
    .spine12_in_valid(spine12_out_valid),
    .spine12_out_data(spine12_in_data),
    .spine12_out_valid(spine12_in_valid),
    
    .spine13_in_data(spine13_out_data),
    .spine13_in_valid(spine13_out_valid),
    .spine13_out_data(spine13_in_data),
    .spine13_out_valid(spine13_in_valid),
    
    .spine14_in_data(spine14_out_data),
    .spine14_in_valid(spine14_out_valid),
    .spine14_out_data(spine14_in_data),
    .spine14_out_valid(spine14_in_valid),
    
    // Group connections (exposed)
    .group611_out_data(group611_out_data),
    .group611_out_valid(group611_out_valid),
    .group611_in_data(group611_in_data),
    .group611_in_valid(group611_in_valid),
    
    .group621_out_data(group621_out_data),
    .group621_out_valid(group621_out_valid),
    .group621_in_data(group621_in_data),
    .group621_in_valid(group621_in_valid),
    
    .group631_out_data(group631_out_data),
    .group631_out_valid(group631_out_valid),
    .group631_in_data(group631_in_data),
    .group631_in_valid(group631_in_valid),
    
    .group641_out_data(group641_out_data),
    .group641_out_valid(group641_out_valid),
    .group641_in_data(group641_in_data),
    .group641_in_valid(group641_in_valid),
    
    .group651_out_data(group651_out_data),
    .group651_out_valid(group651_out_valid),
    .group651_in_data(group651_in_data),
    .group651_in_valid(group651_in_valid),
    
    .group761_out_data(group761_out_data),
    .group761_out_valid(group761_out_valid),
    .group761_in_data(group761_in_data),
    .group761_in_valid(group761_in_valid),
    
    .group861_out_data(group861_out_data),
    .group861_out_valid(group861_out_valid),
    .group861_in_data(group861_in_data),
    .group861_in_valid(group861_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0110),
    .SPINE_ROUTER_ID(2),
    .DWIDTH(16),
    .FIFO_DEPTH(8)
  ) spine2 (
    .clk(ACLK),
    .reset(~ARESETn),
    .dir_local(dir_local),
    
    // Leaf connections
    .spine21_in_data(spine21_out_data),
    .spine21_in_valid(spine21_out_valid),
    .spine21_out_data(spine21_in_data),
    .spine21_out_valid(spine21_in_valid),
    
    .spine22_in_data(spine22_out_data),
    .spine22_in_valid(spine22_out_valid),
    .spine22_out_data(spine22_in_data),
    .spine22_out_valid(spine22_in_valid),
    
    .spine23_in_data(spine23_out_data),
    .spine23_in_valid(spine23_out_valid),
    .spine23_out_data(spine23_in_data),
    .spine23_out_valid(spine23_in_valid),
    
    .spine24_in_data(spine24_out_data),
    .spine24_in_valid(spine24_out_valid),
    .spine24_out_data(spine24_in_data),
    .spine24_out_valid(spine24_in_valid),
    
    // Group connections (exposed)
    .group612_out_data(group612_out_data),
    .group612_out_valid(group612_out_valid),
    .group612_in_data(group612_in_data),
    .group612_in_valid(group612_in_valid),
    
    .group622_out_data(group622_out_data),
    .group622_out_valid(group622_out_valid),
    .group622_in_data(group622_in_data),
    .group622_in_valid(group622_in_valid),
    
    .group632_out_data(group632_out_data),
    .group632_out_valid(group632_out_valid),
    .group632_in_data(group632_in_data),
    .group632_in_valid(group632_in_valid),
    
    .group642_out_data(group642_out_data),
    .group642_out_valid(group642_out_valid),
    .group642_in_data(group642_in_data),
    .group642_in_valid(group642_in_valid),
    
    .group652_out_data(group652_out_data),
    .group652_out_valid(group652_out_valid),
    .group652_in_data(group652_in_data),
    .group652_in_valid(group652_in_valid),
    
    .group762_out_data(group762_out_data),
    .group762_out_valid(group762_out_valid),
    .group762_in_data(group762_in_data),
    .group762_in_valid(group762_in_valid),
    
    .group862_out_data(group862_out_data),
    .group862_out_valid(group862_out_valid),
    .group862_in_data(group862_in_data),
    .group862_in_valid(group862_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0110),
    .SPINE_ROUTER_ID(3),
    .DWIDTH(16),
    .FIFO_DEPTH(8)
  ) spine3 (
    .clk(ACLK),
    .reset(~ARESETn),
    .dir_local(dir_local),
    
    // Leaf connections
    .spine31_in_data(spine31_out_data),
    .spine31_in_valid(spine31_out_valid),
    .spine31_out_data(spine31_in_data),
    .spine31_out_valid(spine31_in_valid),
    
    .spine32_in_data(spine32_out_data),
    .spine32_in_valid(spine32_out_valid),
    .spine32_out_data(spine32_in_data),
    .spine32_out_valid(spine32_in_valid),
    
    .spine33_in_data(spine33_out_data),
    .spine33_in_valid(spine33_out_valid),
    .spine33_out_data(spine33_in_data),
    .spine33_out_valid(spine33_in_valid),
    
    .spine34_in_data(spine34_out_data),
    .spine34_in_valid(spine34_out_valid),
    .spine34_out_data(spine34_in_data),
    .spine34_out_valid(spine34_in_valid),
    
    // Group connections (exposed)
    .group613_out_data(group613_out_data),
    .group613_out_valid(group613_out_valid),
    .group613_in_data(group613_in_data),
    .group613_in_valid(group613_in_valid),
    
    .group623_out_data(group623_out_data),
    .group623_out_valid(group623_out_valid),
    .group623_in_data(group623_in_data),
    .group623_in_valid(group623_in_valid),
    
    .group633_out_data(group633_out_data),
    .group633_out_valid(group633_out_valid),
    .group633_in_data(group633_in_data),
    .group633_in_valid(group633_in_valid),
    
    .group643_out_data(group643_out_data),
    .group643_out_valid(group643_out_valid),
    .group643_in_data(group643_in_data),
    .group643_in_valid(group643_in_valid),
    
    .group653_out_data(group653_out_data),
    .group653_out_valid(group653_out_valid),
    .group653_in_data(group653_in_data),
    .group653_in_valid(group653_in_valid),
    
    .group763_out_data(group763_out_data),
    .group763_out_valid(group763_out_valid),
    .group763_in_data(group763_in_data),
    .group763_in_valid(group763_in_valid),
    
    .group863_out_data(group863_out_data),
    .group863_out_valid(group863_out_valid),
    .group863_in_data(group863_in_data),
    .group863_in_valid(group863_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0110),
    .SPINE_ROUTER_ID(4),
    .DWIDTH(16),
    .FIFO_DEPTH(8)
  ) spine4 (
    .clk(ACLK),
    .reset(~ARESETn),
    .dir_local(dir_local),
    
    // Leaf connections
    .spine41_in_data(spine41_out_data),
    .spine41_in_valid(spine41_out_valid),
    .spine41_out_data(spine41_in_data),
    .spine41_out_valid(spine41_in_valid),
    
    .spine42_in_data(spine42_out_data),
    .spine42_in_valid(spine42_out_valid),
    .spine42_out_data(spine42_in_data),
    .spine42_out_valid(spine42_in_valid),
    
    .spine43_in_data(spine43_out_data),
    .spine43_in_valid(spine43_out_valid),
    .spine43_out_data(spine43_in_data),
    .spine43_out_valid(spine43_in_valid),
    
    .spine44_in_data(spine44_out_data),
    .spine44_in_valid(spine44_out_valid),
    .spine44_out_data(spine44_in_data),
    .spine44_out_valid(spine44_in_valid),
    
    // Group connections (exposed)
    .group614_out_data(group614_out_data),
    .group614_out_valid(group614_out_valid),
    .group614_in_data(group614_in_data),
    .group614_in_valid(group614_in_valid),
    
    .group624_out_data(group624_out_data),
    .group624_out_valid(group624_out_valid),
    .group624_in_data(group624_in_data),
    .group624_in_valid(group624_in_valid),
    
    .group634_out_data(group634_out_data),
    .group634_out_valid(group634_out_valid),
    .group634_in_data(group634_in_data),
    .group634_in_valid(group634_in_valid),
    
    .group644_out_data(group644_out_data),
    .group644_out_valid(group644_out_valid),
    .group644_in_data(group644_in_data),
    .group644_in_valid(group644_in_valid),
    
    .group654_out_data(group654_out_data),
    .group654_out_valid(group654_out_valid),
    .group654_in_data(group654_in_data),
    .group654_in_valid(group654_in_valid),
    
    .group764_out_data(group764_out_data),
    .group764_out_valid(group764_out_valid),
    .group764_in_data(group764_in_data),
    .group764_in_valid(group764_in_valid),
    
    .group864_out_data(group864_out_data),
    .group864_out_valid(group864_out_valid),
    .group864_in_data(group864_in_data),
    .group864_in_valid(group864_in_valid)
  );

endmodule