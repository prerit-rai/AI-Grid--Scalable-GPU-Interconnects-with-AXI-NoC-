`timescale 1ns/1ps
module group4(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group411_out_data, group421_out_data, group431_out_data, group541_out_data,
  output wire [15:0] group641_out_data, group741_out_data, group841_out_data,
  output wire group411_out_valid, group421_out_valid, group431_out_valid, group541_out_valid,
  output wire group641_out_valid, group741_out_valid, group841_out_valid,
  input wire [15:0] group411_in_data, group421_in_data, group431_in_data, group541_in_data,
  input wire [15:0] group641_in_data, group741_in_data, group841_in_data,
  input wire group411_in_valid, group421_in_valid, group431_in_valid, group541_in_valid,
  input wire group641_in_valid, group741_in_valid, group841_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group412_out_data, group422_out_data, group432_out_data, group542_out_data,
  output wire [15:0] group642_out_data, group742_out_data, group842_out_data,
  output wire group412_out_valid, group422_out_valid, group432_out_valid, group542_out_valid,
  output wire group642_out_valid, group742_out_valid, group842_out_valid,
  input wire [15:0] group412_in_data, group422_in_data, group432_in_data, group542_in_data,
  input wire [15:0] group642_in_data, group742_in_data, group842_in_data,
  input wire group412_in_valid, group422_in_valid, group432_in_valid, group542_in_valid,
  input wire group642_in_valid, group742_in_valid, group842_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group413_out_data, group423_out_data, group433_out_data, group543_out_data,
  output wire [15:0] group643_out_data, group743_out_data, group843_out_data,
  output wire group413_out_valid, group423_out_valid, group433_out_valid, group543_out_valid,
  output wire group643_out_valid, group743_out_valid, group843_out_valid,
  input wire [15:0] group413_in_data, group423_in_data, group433_in_data, group543_in_data,
  input wire [15:0] group643_in_data, group743_in_data, group843_in_data,
  input wire group413_in_valid, group423_in_valid, group433_in_valid, group543_in_valid,
  input wire group643_in_valid, group743_in_valid, group843_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group414_out_data, group424_out_data, group434_out_data, group544_out_data,
  output wire [15:0] group644_out_data, group744_out_data, group844_out_data,
  output wire group414_out_valid, group424_out_valid, group434_out_valid, group544_out_valid,
  output wire group644_out_valid, group744_out_valid, group844_out_valid,
  input wire [15:0] group414_in_data, group424_in_data, group434_in_data, group544_in_data,
  input wire [15:0] group644_in_data, group744_in_data, group844_in_data,
  input wire group414_in_valid, group424_in_valid, group434_in_valid, group544_in_valid,
  input wire group644_in_valid, group744_in_valid, group844_in_valid
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

  // Instantiate GPU modules (GPUs 13-16)
  top13 gpu13 (
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

  top14 gpu14 (
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

  top15 gpu15 (
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

  top16 gpu16 (
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
    .GROUP_ID(4'b0100),
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
    .group411_out_data(group411_out_data),
    .group411_out_valid(group411_out_valid),
    .group411_in_data(group411_in_data),
    .group411_in_valid(group411_in_valid),
    
    .group421_out_data(group421_out_data),
    .group421_out_valid(group421_out_valid),
    .group421_in_data(group421_in_data),
    .group421_in_valid(group421_in_valid),
    
    .group431_out_data(group431_out_data),
    .group431_out_valid(group431_out_valid),
    .group431_in_data(group431_in_data),
    .group431_in_valid(group431_in_valid),
    
    .group541_out_data(group541_out_data),
    .group541_out_valid(group541_out_valid),
    .group541_in_data(group541_in_data),
    .group541_in_valid(group541_in_valid),
    
    .group641_out_data(group641_out_data),
    .group641_out_valid(group641_out_valid),
    .group641_in_data(group641_in_data),
    .group641_in_valid(group641_in_valid),
    
    .group741_out_data(group741_out_data),
    .group741_out_valid(group741_out_valid),
    .group741_in_data(group741_in_data),
    .group741_in_valid(group741_in_valid),
    
    .group841_out_data(group841_out_data),
    .group841_out_valid(group841_out_valid),
    .group841_in_data(group841_in_data),
    .group841_in_valid(group841_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0100),
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
    .group412_out_data(group412_out_data),
    .group412_out_valid(group412_out_valid),
    .group412_in_data(group412_in_data),
    .group412_in_valid(group412_in_valid),
    
    .group422_out_data(group422_out_data),
    .group422_out_valid(group422_out_valid),
    .group422_in_data(group422_in_data),
    .group422_in_valid(group422_in_valid),
    
    .group432_out_data(group432_out_data),
    .group432_out_valid(group432_out_valid),
    .group432_in_data(group432_in_data),
    .group432_in_valid(group432_in_valid),
    
    .group542_out_data(group542_out_data),
    .group542_out_valid(group542_out_valid),
    .group542_in_data(group542_in_data),
    .group542_in_valid(group542_in_valid),
    
    .group642_out_data(group642_out_data),
    .group642_out_valid(group642_out_valid),
    .group642_in_data(group642_in_data),
    .group642_in_valid(group642_in_valid),
    
    .group742_out_data(group742_out_data),
    .group742_out_valid(group742_out_valid),
    .group742_in_data(group742_in_data),
    .group742_in_valid(group742_in_valid),
    
    .group842_out_data(group842_out_data),
    .group842_out_valid(group842_out_valid),
    .group842_in_data(group842_in_data),
    .group842_in_valid(group842_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b0100),
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
    .group413_out_data(group413_out_data),
    .group413_out_valid(group413_out_valid),
    .group413_in_data(group413_in_data),
    .group413_in_valid(group413_in_valid),
    
    .group423_out_data(group423_out_data),
    .group423_out_valid(group423_out_valid),
    .group423_in_data(group423_in_data),
    .group423_in_valid(group423_in_valid),
    
    .group433_out_data(group433_out_data),
    .group433_out_valid(group433_out_valid),
    .group433_in_data(group433_in_data),
    .group433_in_valid(group433_in_valid),
    
    .group543_out_data(group543_out_data),
    .group543_out_valid(group543_out_valid),
    .group543_in_data(group543_in_data),
    .group543_in_valid(group543_in_valid),
    
    .group643_out_data(group643_out_data),
    .group643_out_valid(group643_out_valid),
    .group643_in_data(group643_in_data),
    .group643_in_valid(group643_in_valid),
    
    .group743_out_data(group743_out_data),
    .group743_out_valid(group743_out_valid),
    .group743_in_data(group743_in_data),
    .group743_in_valid(group743_in_valid),
    
    .group843_out_data(group843_out_data),
    .group843_out_valid(group843_out_valid),
    .group843_in_data(group843_in_data),
    .group843_in_valid(group843_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b0100),
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
    .group414_out_data(group414_out_data),
    .group414_out_valid(group414_out_valid),
    .group414_in_data(group414_in_data),
    .group414_in_valid(group414_in_valid),
    
    .group424_out_data(group424_out_data),
    .group424_out_valid(group424_out_valid),
    .group424_in_data(group424_in_data),
    .group424_in_valid(group424_in_valid),
    
    .group434_out_data(group434_out_data),
    .group434_out_valid(group434_out_valid),
    .group434_in_data(group434_in_data),
    .group434_in_valid(group434_in_valid),
    
    .group544_out_data(group544_out_data),
    .group544_out_valid(group544_out_valid),
    .group544_in_data(group544_in_data),
    .group544_in_valid(group544_in_valid),
    
    .group644_out_data(group644_out_data),
    .group644_out_valid(group644_out_valid),
    .group644_in_data(group644_in_data),
    .group644_in_valid(group644_in_valid),
    
    .group744_out_data(group744_out_data),
    .group744_out_valid(group744_out_valid),
    .group744_in_data(group744_in_data),
    .group744_in_valid(group744_in_valid),
    
    .group844_out_data(group844_out_data),
    .group844_out_valid(group844_out_valid),
    .group844_in_data(group844_in_data),
    .group844_in_valid(group844_in_valid)
  );

endmodule