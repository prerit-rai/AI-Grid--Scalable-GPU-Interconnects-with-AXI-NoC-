`timescale 1ns/1ps
module group3(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group311_out_data, group321_out_data, group431_out_data, group531_out_data,
  output wire [15:0] group631_out_data, group731_out_data, group831_out_data,
  output wire group311_out_valid, group321_out_valid, group431_out_valid, group531_out_valid,
  output wire group631_out_valid, group731_out_valid, group831_out_valid,
  input wire [15:0] group311_in_data, group321_in_data, group431_in_data, group531_in_data,
  input wire [15:0] group631_in_data, group731_in_data, group831_in_data,
  input wire group311_in_valid, group321_in_valid, group431_in_valid, group531_in_valid,
  input wire group631_in_valid, group731_in_valid, group831_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group312_out_data, group322_out_data, group432_out_data, group532_out_data,
  output wire [15:0] group632_out_data, group732_out_data, group832_out_data,
  output wire group312_out_valid, group322_out_valid, group432_out_valid, group532_out_valid,
  output wire group632_out_valid, group732_out_valid, group832_out_valid,
  input wire [15:0] group312_in_data, group322_in_data, group432_in_data, group532_in_data,
  input wire [15:0] group632_in_data, group732_in_data, group832_in_data,
  input wire group312_in_valid, group322_in_valid, group432_in_valid, group532_in_valid,
  input wire group632_in_valid, group732_in_valid, group832_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group313_out_data, group323_out_data, group433_out_data, group533_out_data,
  output wire [15:0] group633_out_data, group733_out_data, group833_out_data,
  output wire group313_out_valid, group323_out_valid, group433_out_valid, group533_out_valid,
  output wire group633_out_valid, group733_out_valid, group833_out_valid,
  input wire [15:0] group313_in_data, group323_in_data, group433_in_data, group533_in_data,
  input wire [15:0] group633_in_data, group733_in_data, group833_in_data,
  input wire group313_in_valid, group323_in_valid, group433_in_valid, group533_in_valid,
  input wire group633_in_valid, group733_in_valid, group833_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group314_out_data, group324_out_data, group434_out_data, group534_out_data,
  output wire [15:0] group634_out_data, group734_out_data, group834_out_data,
  output wire group314_out_valid, group324_out_valid, group434_out_valid, group534_out_valid,
  output wire group634_out_valid, group734_out_valid, group834_out_valid,
  input wire [15:0] group314_in_data, group324_in_data, group434_in_data, group534_in_data,
  input wire [15:0] group634_in_data, group734_in_data, group834_in_data,
  input wire group314_in_valid, group324_in_valid, group434_in_valid, group534_in_valid,
  input wire group634_in_valid, group734_in_valid, group834_in_valid
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

  // Instantiate GPU modules (GPUs 9-12)
  top9 gpu9 (
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

  top9 gpu9 (
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

  top10 gpu10 (
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

  top11 gpu11 (
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
    .GROUP_ID(4'b0011),
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
    .group311_out_data(group311_out_data),
    .group311_out_valid(group311_out_valid),
    .group311_in_data(group311_in_data),
    .group311_in_valid(group311_in_valid),
    
    .group321_out_data(group321_out_data),
    .group321_out_valid(group321_out_valid),
    .group321_in_data(group321_in_data),
    .group321_in_valid(group321_in_valid),
    
    .group431_out_data(group431_out_data),
    .group431_out_valid(group431_out_valid),
    .group431_in_data(group431_in_data),
    .group431_in_valid(group431_in_valid),
    
    .group531_out_data(group531_out_data),
    .group531_out_valid(group531_out_valid),
    .group531_in_data(group531_in_data),
    .group531_in_valid(group531_in_valid),
    
    .group631_out_data(group631_out_data),
    .group631_out_valid(group631_out_valid),
    .group631_in_data(group631_in_data),
    .group631_in_valid(group631_in_valid),
    
    .group731_out_data(group731_out_data),
    .group731_out_valid(group731_out_valid),
    .group731_in_data(group731_in_data),
    .group731_in_valid(group731_in_valid),
    
    .group831_out_data(group831_out_data),
    .group831_out_valid(group831_out_valid),
    .group831_in_data(group831_in_data),
    .group831_in_valid(group831_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0011),
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
    .group312_out_data(group312_out_data),
    .group312_out_valid(group312_out_valid),
    .group312_in_data(group312_in_data),
    .group312_in_valid(group312_in_valid),
    
    .group322_out_data(group322_out_data),
    .group322_out_valid(group322_out_valid),
    .group322_in_data(group322_in_data),
    .group322_in_valid(group322_in_valid),
    
    .group432_out_data(group432_out_data),
    .group432_out_valid(group432_out_valid),
    .group432_in_data(group432_in_data),
    .group432_in_valid(group432_in_valid),
    
    .group532_out_data(group532_out_data),
    .group532_out_valid(group532_out_valid),
    .group532_in_data(group532_in_data),
    .group532_in_valid(group532_in_valid),
    
    .group632_out_data(group632_out_data),
    .group632_out_valid(group632_out_valid),
    .group632_in_data(group632_in_data),
    .group632_in_valid(group632_in_valid),
    
    .group732_out_data(group732_out_data),
    .group732_out_valid(group732_out_valid),
    .group732_in_data(group732_in_data),
    .group732_in_valid(group732_in_valid),
    
    .group832_out_data(group832_out_data),
    .group832_out_valid(group832_out_valid),
    .group832_in_data(group832_in_data),
    .group832_in_valid(group832_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0011),
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
    .group313_out_data(group313_out_data),
    .group313_out_valid(group313_out_valid),
    .group313_in_data(group313_in_data),
    .group313_in_valid(group313_in_valid),
    
    .group323_out_data(group323_out_data),
    .group323_out_valid(group323_out_valid),
    .group323_in_data(group323_in_data),
    .group323_in_valid(group323_in_valid),
    
    .group433_out_data(group433_out_data),
    .group433_out_valid(group433_out_valid),
    .group433_in_data(group433_in_data),
    .group433_in_valid(group433_in_valid),
    
    .group533_out_data(group533_out_data),
    .group533_out_valid(group533_out_valid),
    .group533_in_data(group533_in_data),
    .group533_in_valid(group533_in_valid),
    
    .group633_out_data(group633_out_data),
    .group633_out_valid(group633_out_valid),
    .group633_in_data(group633_in_data),
    .group633_in_valid(group633_in_valid),
    
    .group733_out_data(group733_out_data),
    .group733_out_valid(group733_out_valid),
    .group733_in_data(group733_in_data),
    .group733_in_valid(group733_in_valid),
    
    .group833_out_data(group833_out_data),
    .group833_out_valid(group833_out_valid),
    .group833_in_data(group833_in_data),
    .group833_in_valid(group833_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0011),
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
    .group314_out_data(group314_out_data),
    .group314_out_valid(group314_out_valid),
    .group314_in_data(group314_in_data),
    .group314_in_valid(group314_in_valid),
    
    .group324_out_data(group324_out_data),
    .group324_out_valid(group324_out_valid),
    .group324_in_data(group324_in_data),
    .group324_in_valid(group324_in_valid),
    
    .group434_out_data(group434_out_data),
    .group434_out_valid(group434_out_valid),
    .group434_in_data(group434_in_data),
    .group434_in_valid(group434_in_valid),
    
    .group534_out_data(group534_out_data),
    .group534_out_valid(group534_out_valid),
    .group534_in_data(group534_in_data),
    .group534_in_valid(group534_in_valid),
    
    .group634_out_data(group634_out_data),
    .group634_out_valid(group634_out_valid),
    .group634_in_data(group634_in_data),
    .group634_in_valid(group634_in_valid),
    
    .group734_out_data(group734_out_data),
    .group734_out_valid(group734_out_valid),
    .group734_in_data(group734_in_data),
    .group734_in_valid(group734_in_valid),
    
    .group834_out_data(group834_out_data),
    .group834_out_valid(group834_out_valid),
    .group834_in_data(group834_in_data),
    .group834_in_valid(group834_in_valid)
  );

endmodule