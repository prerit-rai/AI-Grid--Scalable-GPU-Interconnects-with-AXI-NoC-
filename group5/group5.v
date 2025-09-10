`timescale 1ns/1ps
module group5(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group511_out_data, group521_out_data, group531_out_data, group541_out_data,
  output wire [15:0] group651_out_data, group751_out_data, group851_out_data,
  output wire group511_out_valid, group521_out_valid, group531_out_valid, group541_out_valid,
  output wire group651_out_valid, group751_out_valid, group851_out_valid,
  input wire [15:0] group511_in_data, group521_in_data, group531_in_data, group541_in_data,
  input wire [15:0] group651_in_data, group751_in_data, group851_in_data,
  input wire group511_in_valid, group521_in_valid, group531_in_valid, group541_in_valid,
  input wire group651_in_valid, group751_in_valid, group851_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group512_out_data, group522_out_data, group532_out_data, group542_out_data,
  output wire [15:0] group652_out_data, group752_out_data, group852_out_data,
  output wire group512_out_valid, group522_out_valid, group532_out_valid, group542_out_valid,
  output wire group652_out_valid, group752_out_valid, group852_out_valid,
  input wire [15:0] group512_in_data, group522_in_data, group532_in_data, group542_in_data,
  input wire [15:0] group652_in_data, group752_in_data, group852_in_data,
  input wire group512_in_valid, group522_in_valid, group532_in_valid, group542_in_valid,
  input wire group652_in_valid, group752_in_valid, group852_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group513_out_data, group523_out_data, group533_out_data, group543_out_data,
  output wire [15:0] group653_out_data, group753_out_data, group853_out_data,
  output wire group513_out_valid, group523_out_valid, group533_out_valid, group543_out_valid,
  output wire group653_out_valid, group753_out_valid, group853_out_valid,
  input wire [15:0] group513_in_data, group523_in_data, group533_in_data, group543_in_data,
  input wire [15:0] group653_in_data, group753_in_data, group853_in_data,
  input wire group513_in_valid, group523_in_valid, group533_in_valid, group543_in_valid,
  input wire group653_in_valid, group753_in_valid, group853_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group514_out_data, group524_out_data, group534_out_data, group544_out_data,
  output wire [15:0] group654_out_data, group754_out_data, group854_out_data,
  output wire group514_out_valid, group524_out_valid, group534_out_valid, group544_out_valid,
  output wire group654_out_valid, group754_out_valid, group854_out_valid,
  input wire [15:0] group514_in_data, group524_in_data, group534_in_data, group544_in_data,
  input wire [15:0] group654_in_data, group754_in_data, group854_in_data,
  input wire group514_in_valid, group524_in_valid, group534_in_valid, group544_in_valid,
  input wire group654_in_valid, group754_in_valid, group854_in_valid
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

  // Instantiate GPU modules (GPUs 17-20)
  top17 gpu17 (
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

  top18 gpu18 (
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

  top19 gpu19 (
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

  top20 gpu20 (
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
    .GROUP_ID(4'b0101),
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
    .group511_out_data(group511_out_data),
    .group511_out_valid(group511_out_valid),
    .group511_in_data(group511_in_data),
    .group511_in_valid(group511_in_valid),
    
    .group521_out_data(group521_out_data),
    .group521_out_valid(group521_out_valid),
    .group521_in_data(group521_in_data),
    .group521_in_valid(group521_in_valid),
    
    .group531_out_data(group531_out_data),
    .group531_out_valid(group531_out_valid),
    .group531_in_data(group531_in_data),
    .group531_in_valid(group531_in_valid),
    
    .group541_out_data(group541_out_data),
    .group541_out_valid(group541_out_valid),
    .group541_in_data(group541_in_data),
    .group541_in_valid(group541_in_valid),
    
    .group651_out_data(group651_out_data),
    .group651_out_valid(group651_out_valid),
    .group651_in_data(group651_in_data),
    .group651_in_valid(group651_in_valid),
    
    .group751_out_data(group751_out_data),
    .group751_out_valid(group751_out_valid),
    .group751_in_data(group751_in_data),
    .group751_in_valid(group751_in_valid),
    
    .group851_out_data(group851_out_data),
    .group851_out_valid(group851_out_valid),
    .group851_in_data(group851_in_data),
    .group851_in_valid(group851_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0101),
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
    .group512_out_data(group512_out_data),
    .group512_out_valid(group512_out_valid),
    .group512_in_data(group512_in_data),
    .group512_in_valid(group512_in_valid),
    
    .group522_out_data(group522_out_data),
    .group522_out_valid(group522_out_valid),
    .group522_in_data(group522_in_data),
    .group522_in_valid(group522_in_valid),
    
    .group532_out_data(group532_out_data),
    .group532_out_valid(group532_out_valid),
    .group532_in_data(group532_in_data),
    .group532_in_valid(group532_in_valid),
    
    .group542_out_data(group542_out_data),
    .group542_out_valid(group542_out_valid),
    .group542_in_data(group542_in_data),
    .group542_in_valid(group542_in_valid),
    
    .group652_out_data(group652_out_data),
    .group652_out_valid(group652_out_valid),
    .group652_in_data(group652_in_data),
    .group652_in_valid(group652_in_valid),
    
    .group752_out_data(group752_out_data),
    .group752_out_valid(group752_out_valid),
    .group752_in_data(group752_in_data),
    .group752_in_valid(group752_in_valid),
    
    .group852_out_data(group852_out_data),
    .group852_out_valid(group852_out_valid),
    .group852_in_data(group852_in_data),
    .group852_in_valid(group852_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0101),
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
    .group513_out_data(group513_out_data),
    .group513_out_valid(group513_out_valid),
    .group513_in_data(group513_in_data),
    .group513_in_valid(group513_in_valid),
    
    .group523_out_data(group523_out_data),
    .group523_out_valid(group523_out_valid),
    .group523_in_data(group523_in_data),
    .group523_in_valid(group523_in_valid),
    
    .group533_out_data(group533_out_data),
    .group533_out_valid(group533_out_valid),
    .group533_in_data(group533_in_data),
    .group533_in_valid(group533_in_valid),
    
    .group543_out_data(group543_out_data),
    .group543_out_valid(group543_out_valid),
    .group543_in_data(group543_in_data),
    .group543_in_valid(group543_in_valid),
    
    .group653_out_data(group653_out_data),
    .group653_out_valid(group653_out_valid),
    .group653_in_data(group653_in_data),
    .group653_in_valid(group653_in_valid),
    
    .group753_out_data(group753_out_data),
    .group753_out_valid(group753_out_valid),
    .group753_in_data(group753_in_data),
    .group753_in_valid(group753_in_valid),
    
    .group853_out_data(group853_out_data),
    .group853_out_valid(group853_out_valid),
    .group853_in_data(group853_in_data),
    .group853_in_valid(group853_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0101),
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
    .group514_out_data(group514_out_data),
    .group514_out_valid(group514_out_valid),
    .group514_in_data(group514_in_data),
    .group514_in_valid(group514_in_valid),
    
    .group524_out_data(group524_out_data),
    .group524_out_valid(group524_out_valid),
    .group524_in_data(group524_in_data),
    .group524_in_valid(group524_in_valid),
    
    .group534_out_data(group534_out_data),
    .group534_out_valid(group534_out_valid),
    .group534_in_data(group534_in_data),
    .group534_in_valid(group534_in_valid),
    
    .group544_out_data(group544_out_data),
    .group544_out_valid(group544_out_valid),
    .group544_in_data(group544_in_data),
    .group544_in_valid(group544_in_valid),
    
    .group654_out_data(group654_out_data),
    .group654_out_valid(group654_out_valid),
    .group654_in_data(group654_in_data),
    .group654_in_valid(group654_in_valid),
    
    .group754_out_data(group754_out_data),
    .group754_out_valid(group754_out_valid),
    .group754_in_data(group754_in_data),
    .group754_in_valid(group754_in_valid),
    
    .group854_out_data(group854_out_data),
    .group854_out_valid(group854_out_valid),
    .group854_in_data(group854_in_data),
    .group854_in_valid(group854_in_valid)
  );

endmodule