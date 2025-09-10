`timescale 1ns/1ps
module group7(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group711_out_data, group721_out_data, group731_out_data, group741_out_data,
  output wire [15:0] group751_out_data, group761_out_data, group871_out_data,
  output wire group711_out_valid, group721_out_valid, group731_out_valid, group741_out_valid,
  output wire group751_out_valid, group761_out_valid, group871_out_valid,
  input wire [15:0] group711_in_data, group721_in_data, group731_in_data, group741_in_data,
  input wire [15:0] group751_in_data, group761_in_data, group871_in_data,
  input wire group711_in_valid, group721_in_valid, group731_in_valid, group741_in_valid,
  input wire group751_in_valid, group761_in_valid, group871_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group712_out_data, group722_out_data, group732_out_data, group742_out_data,
  output wire [15:0] group752_out_data, group762_out_data, group872_out_data,
  output wire group712_out_valid, group722_out_valid, group732_out_valid, group742_out_valid,
  output wire group752_out_valid, group762_out_valid, group872_out_valid,
  input wire [15:0] group712_in_data, group722_in_data, group732_in_data, group742_in_data,
  input wire [15:0] group752_in_data, group762_in_data, group872_in_data,
  input wire group712_in_valid, group722_in_valid, group732_in_valid, group742_in_valid,
  input wire group752_in_valid, group762_in_valid, group872_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group713_out_data, group723_out_data, group733_out_data, group743_out_data,
  output wire [15:0] group753_out_data, group763_out_data, group873_out_data,
  output wire group713_out_valid, group723_out_valid, group733_out_valid, group743_out_valid,
  output wire group753_out_valid, group763_out_valid, group873_out_valid,
  input wire [15:0] group713_in_data, group723_in_data, group733_in_data, group743_in_data,
  input wire [15:0] group753_in_data, group763_in_data, group873_in_data,
  input wire group713_in_valid, group723_in_valid, group733_in_valid, group743_in_valid,
  input wire group753_in_valid, group763_in_valid, group873_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group714_out_data, group724_out_data, group734_out_data, group744_out_data,
  output wire [15:0] group754_out_data, group764_out_data, group874_out_data,
  output wire group714_out_valid, group724_out_valid, group734_out_valid, group744_out_valid,
  output wire group754_out_valid, group764_out_valid, group874_out_valid,
  input wire [15:0] group714_in_data, group724_in_data, group734_in_data, group744_in_data,
  input wire [15:0] group754_in_data, group764_in_data, group874_in_data,
  input wire group714_in_valid, group724_in_valid, group734_in_valid, group744_in_valid,
  input wire group754_in_valid, group764_in_valid, group874_in_valid
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

  // Instantiate GPU modules (GPUs 25-28)
  top25 gpu25 (
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

  top26 gpu26 (
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

  top27 gpu27 (
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

  top28 gpu28 (
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
    .GROUP_ID(4'b0111),
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
    .group711_out_data(group711_out_data),
    .group711_out_valid(group711_out_valid),
    .group711_in_data(group711_in_data),
    .group711_in_valid(group711_in_valid),
    
    .group721_out_data(group721_out_data),
    .group721_out_valid(group721_out_valid),
    .group721_in_data(group721_in_data),
    .group721_in_valid(group721_in_valid),
    
    .group731_out_data(group731_out_data),
    .group731_out_valid(group731_out_valid),
    .group731_in_data(group731_in_data),
    .group731_in_valid(group731_in_valid),
    
    .group741_out_data(group741_out_data),
    .group741_out_valid(group741_out_valid),
    .group741_in_data(group741_in_data),
    .group741_in_valid(group741_in_valid),
    
    .group751_out_data(group751_out_data),
    .group751_out_valid(group751_out_valid),
    .group751_in_data(group751_in_data),
    .group751_in_valid(group751_in_valid),
    
    .group761_out_data(group761_out_data),
    .group761_out_valid(group761_out_valid),
    .group761_in_data(group761_in_data),
    .group761_in_valid(group761_in_valid),
    
    .group871_out_data(group871_out_data),
    .group871_out_valid(group871_out_valid),
    .group871_in_data(group871_in_data),
    .group871_in_valid(group871_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0111),
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
    .group712_out_data(group712_out_data),
    .group712_out_valid(group712_out_valid),
    .group712_in_data(group712_in_data),
    .group712_in_valid(group712_in_valid),
    
    .group722_out_data(group722_out_data),
    .group722_out_valid(group722_out_valid),
    .group722_in_data(group722_in_data),
    .group722_in_valid(group722_in_valid),
    
    .group732_out_data(group732_out_data),
    .group732_out_valid(group732_out_valid),
    .group732_in_data(group732_in_data),
    .group732_in_valid(group732_in_valid),
    
    .group742_out_data(group742_out_data),
    .group742_out_valid(group742_out_valid),
    .group742_in_data(group742_in_data),
    .group742_in_valid(group742_in_valid),
    
    .group752_out_data(group752_out_data),
    .group752_out_valid(group752_out_valid),
    .group752_in_data(group752_in_data),
    .group752_in_valid(group752_in_valid),
    
    .group762_out_data(group762_out_data),
    .group762_out_valid(group762_out_valid),
    .group762_in_data(group762_in_data),
    .group762_in_valid(group762_in_valid),
    
    .group872_out_data(group872_out_data),
    .group872_out_valid(group872_out_valid),
    .group872_in_data(group872_in_data),
    .group872_in_valid(group872_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0111),
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
    .group713_out_data(group713_out_data),
    .group713_out_valid(group713_out_valid),
    .group713_in_data(group713_in_data),
    .group713_in_valid(group713_in_valid),
    
    .group723_out_data(group723_out_data),
    .group723_out_valid(group723_out_valid),
    .group723_in_data(group723_in_data),
    .group723_in_valid(group723_in_valid),
    
    .group733_out_data(group733_out_data),
    .group733_out_valid(group733_out_valid),
    .group733_in_data(group733_in_data),
    .group733_in_valid(group733_in_valid),
    
    .group743_out_data(group743_out_data),
    .group743_out_valid(group743_out_valid),
    .group743_in_data(group743_in_data),
    .group743_in_valid(group743_in_valid),
    
    .group753_out_data(group753_out_data),
    .group753_out_valid(group753_out_valid),
    .group753_in_data(group753_in_data),
    .group753_in_valid(group753_in_valid),
    
    .group763_out_data(group763_out_data),
    .group763_out_valid(group763_out_valid),
    .group763_in_data(group763_in_data),
    .group763_in_valid(group763_in_valid),
    
    .group873_out_data(group873_out_data),
    .group873_out_valid(group873_out_valid),
    .group873_in_data(group873_in_data),
    .group873_in_valid(group873_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0111),
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
    .group714_out_data(group714_out_data),
    .group714_out_valid(group714_out_valid),
    .group714_in_data(group714_in_data),
    .group714_in_valid(group714_in_valid),
    
    .group724_out_data(group724_out_data),
    .group724_out_valid(group724_out_valid),
    .group724_in_data(group724_in_data),
    .group724_in_valid(group724_in_valid),
    
    .group734_out_data(group734_out_data),
    .group734_out_valid(group734_out_valid),
    .group734_in_data(group734_in_data),
    .group734_in_valid(group734_in_valid),
    
    .group744_out_data(group744_out_data),
    .group744_out_valid(group744_out_valid),
    .group744_in_data(group744_in_data),
    .group744_in_valid(group744_in_valid),
    
    .group754_out_data(group754_out_data),
    .group754_out_valid(group754_out_valid),
    .group754_in_data(group754_in_data),
    .group754_in_valid(group754_in_valid),
    
    .group764_out_data(group764_out_data),
    .group764_out_valid(group764_out_valid),
    .group764_in_data(group764_in_data),
    .group764_in_valid(group764_in_valid),
    
    .group874_out_data(group874_out_data),
    .group874_out_valid(group874_out_valid),
    .group874_in_data(group874_in_data),
    .group874_in_valid(group874_in_valid)
  );

endmodule