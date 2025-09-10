`timescale 1ns/1ps
module group2(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group211_out_data, group321_out_data, group421_out_data, group521_out_data,
  output wire [15:0] group621_out_data, group721_out_data, group821_out_data,
  output wire group211_out_valid, group321_out_valid, group421_out_valid, group521_out_valid,
  output wire group621_out_valid, group721_out_valid, group821_out_valid,
  input wire [15:0] group211_in_data, group321_in_data, group421_in_data, group521_in_data,
  input wire [15:0] group621_in_data, group721_in_data, group821_in_data,
  input wire group211_in_valid, group321_in_valid, group421_in_valid, group521_in_valid,
  input wire group621_in_valid, group721_in_valid, group821_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group212_out_data, group322_out_data, group422_out_data, group522_out_data,
  output wire [15:0] group622_out_data, group722_out_data, group822_out_data,
  output wire group212_out_valid, group322_out_valid, group422_out_valid, group522_out_valid,
  output wire group622_out_valid, group722_out_valid, group822_out_valid,
  input wire [15:0] group212_in_data, group322_in_data, group422_in_data, group522_in_data,
  input wire [15:0] group622_in_data, group722_in_data, group822_in_data,
  input wire group212_in_valid, group322_in_valid, group422_in_valid, group522_in_valid,
  input wire group622_in_valid, group722_in_valid, group822_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group213_out_data, group323_out_data, group423_out_data, group523_out_data,
  output wire [15:0] group623_out_data, group723_out_data, group823_out_data,
  output wire group213_out_valid, group323_out_valid, group423_out_valid, group523_out_valid,
  output wire group623_out_valid, group723_out_valid, group823_out_valid,
  input wire [15:0] group213_in_data, group323_in_data, group423_in_data, group523_in_data,
  input wire [15:0] group623_in_data, group723_in_data, group823_in_data,
  input wire group213_in_valid, group323_in_valid, group423_in_valid, group523_in_valid,
  input wire group623_in_valid, group723_in_valid, group823_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group214_out_data, group324_out_data, group424_out_data, group524_out_data,
  output wire [15:0] group624_out_data, group724_out_data, group824_out_data,
  output wire group214_out_valid, group324_out_valid, group424_out_valid, group524_out_valid,
  output wire group624_out_valid, group724_out_valid, group824_out_valid,
  input wire [15:0] group214_in_data, group324_in_data, group424_in_data, group524_in_data,
  input wire [15:0] group624_in_data, group724_in_data, group824_in_data,
  input wire group214_in_valid, group324_in_valid, group424_in_valid, group524_in_valid,
  input wire group624_in_valid, group724_in_valid, group824_in_valid
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

  // Instantiate GPU modules (GPUs 5-8)
  top5 gpu5 (
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

  top6 gpu6 (
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

  top7 gpu7 (
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

  top8 gpu8 (
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
    .GROUP_ID(4'b0010),
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
    .group211_out_data(group211_out_data),
    .group211_out_valid(group211_out_valid),
    .group211_in_data(group211_in_data),
    .group211_in_valid(group211_in_valid),
    
    .group321_out_data(group321_out_data),
    .group321_out_valid(group321_out_valid),
    .group321_in_data(group321_in_data),
    .group321_in_valid(group321_in_valid),
    
    .group421_out_data(group421_out_data),
    .group421_out_valid(group421_out_valid),
    .group421_in_data(group421_in_data),
    .group421_in_valid(group421_in_valid),
    
    .group521_out_data(group521_out_data),
    .group521_out_valid(group521_out_valid),
    .group521_in_data(group521_in_data),
    .group521_in_valid(group521_in_valid),
    
    .group621_out_data(group621_out_data),
    .group621_out_valid(group621_out_valid),
    .group621_in_data(group621_in_data),
    .group621_in_valid(group621_in_valid),
    
    .group721_out_data(group721_out_data),
    .group721_out_valid(group721_out_valid),
    .group721_in_data(group721_in_data),
    .group721_in_valid(group721_in_valid),
    
    .group821_out_data(group821_out_data),
    .group821_out_valid(group821_out_valid),
    .group821_in_data(group821_in_data),
    .group821_in_valid(group821_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0010),
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
    .group212_out_data(group212_out_data),
    .group212_out_valid(group212_out_valid),
    .group212_in_data(group212_in_data),
    .group212_in_valid(group212_in_valid),
    
    .group322_out_data(group322_out_data),
    .group322_out_valid(group322_out_valid),
    .group322_in_data(group322_in_data),
    .group322_in_valid(group322_in_valid),
    
    .group422_out_data(group422_out_data),
    .group422_out_valid(group422_out_valid),
    .group422_in_data(group422_in_data),
    .group422_in_valid(group422_in_valid),
    
    .group522_out_data(group522_out_data),
    .group522_out_valid(group522_out_valid),
    .group522_in_data(group522_in_data),
    .group522_in_valid(group522_in_valid),
    
    .group622_out_data(group622_out_data),
    .group622_out_valid(group622_out_valid),
    .group622_in_data(group622_in_data),
    .group622_in_valid(group622_in_valid),
    
    .group722_out_data(group722_out_data),
    .group722_out_valid(group722_out_valid),
    .group722_in_data(group722_in_data),
    .group722_in_valid(group722_in_valid),
    
    .group822_out_data(group822_out_data),
    .group822_out_valid(group822_out_valid),
    .group822_in_data(group822_in_data),
    .group822_in_valid(group822_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0010),
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
    .group213_out_data(group213_out_data),
    .group213_out_valid(group213_out_valid),
    .group213_in_data(group213_in_data),
    .group213_in_valid(group213_in_valid),
    
    .group323_out_data(group323_out_data),
    .group323_out_valid(group323_out_valid),
    .group323_in_data(group323_in_data),
    .group323_in_valid(group323_in_valid),
    
    .group423_out_data(group423_out_data),
    .group423_out_valid(group423_out_valid),
    .group423_in_data(group423_in_data),
    .group423_in_valid(group423_in_valid),
    
    .group523_out_data(group523_out_data),
    .group523_out_valid(group523_out_valid),
    .group523_in_data(group523_in_data),
    .group523_in_valid(group523_in_valid),
    
    .group623_out_data(group623_out_data),
    .group623_out_valid(group623_out_valid),
    .group623_in_data(group623_in_data),
    .group623_in_valid(group623_in_valid),
    
    .group723_out_data(group723_out_data),
    .group723_out_valid(group723_out_valid),
    .group723_in_data(group723_in_data),
    .group723_in_valid(group723_in_valid),
    
    .group823_out_data(group823_out_data),
    .group823_out_valid(group823_out_valid),
    .group823_in_data(group823_in_data),
    .group823_in_valid(group823_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0010),
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
    .group214_out_data(group214_out_data),
    .group214_out_valid(group214_out_valid),
    .group214_in_data(group214_in_data),
    .group214_in_valid(group214_in_valid),
    
    .group324_out_data(group324_out_data),
    .group324_out_valid(group324_out_valid),
    .group324_in_data(group324_in_data),
    .group324_in_valid(group324_in_valid),
    
    .group424_out_data(group424_out_data),
    .group424_out_valid(group424_out_valid),
    .group424_in_data(group424_in_data),
    .group424_in_valid(group424_in_valid),
    
    .group524_out_data(group524_out_data),
    .group524_out_valid(group524_out_valid),
    .group524_in_data(group524_in_data),
    .group524_in_valid(group524_in_valid),
    
    .group624_out_data(group624_out_data),
    .group624_out_valid(group624_out_valid),
    .group624_in_data(group624_in_data),
    .group624_in_valid(group624_in_valid),
    
    .group724_out_data(group724_out_data),
    .group724_out_valid(group724_out_valid),
    .group724_in_data(group724_in_data),
    .group724_in_valid(group724_in_valid),
    
    .group824_out_data(group824_out_data),
    .group824_out_valid(group824_out_valid),
    .group824_in_data(group824_in_data),
    .group824_in_valid(group824_in_valid)
  );

endmodule