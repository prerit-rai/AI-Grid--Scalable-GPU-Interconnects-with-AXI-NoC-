`timescale 1ns/1ps
module group8(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn,
  input wire dir_local,
  
  // Exposed group ports for inter-group connections
  // Spine 1 group ports
  output wire [15:0] group811_out_data, group821_out_data, group831_out_data, group841_out_data,
  output wire [15:0] group851_out_data, group861_out_data, group871_out_data,
  output wire group811_out_valid, group821_out_valid, group831_out_valid, group841_out_valid,
  output wire group851_out_valid, group861_out_valid, group871_out_valid,
  input wire [15:0] group811_in_data, group821_in_data, group831_in_data, group841_in_data,
  input wire [15:0] group851_in_data, group861_in_data, group871_in_data,
  input wire group811_in_valid, group821_in_valid, group831_in_valid, group841_in_valid,
  input wire group851_in_valid, group861_in_valid, group871_in_valid,
  
  // Spine 2 group ports
  output wire [15:0] group812_out_data, group822_out_data, group832_out_data, group842_out_data,
  output wire [15:0] group852_out_data, group862_out_data, group872_out_data,
  output wire group812_out_valid, group822_out_valid, group832_out_valid, group842_out_valid,
  output wire group852_out_valid, group862_out_valid, group872_out_valid,
  input wire [15:0] group812_in_data, group822_in_data, group832_in_data, group842_in_data,
  input wire [15:0] group852_in_data, group862_in_data, group872_in_data,
  input wire group812_in_valid, group822_in_valid, group832_in_valid, group842_in_valid,
  input wire group852_in_valid, group862_in_valid, group872_in_valid,
  
  // Spine 3 group ports
  output wire [15:0] group813_out_data, group823_out_data, group833_out_data, group843_out_data,
  output wire [15:0] group853_out_data, group863_out_data, group873_out_data,
  output wire group813_out_valid, group823_out_valid, group833_out_valid, group843_out_valid,
  output wire group853_out_valid, group863_out_valid, group873_out_valid,
  input wire [15:0] group813_in_data, group823_in_data, group833_in_data, group843_in_data,
  input wire [15:0] group853_in_data, group863_in_data, group873_in_data,
  input wire group813_in_valid, group823_in_valid, group833_in_valid, group843_in_valid,
  input wire group853_in_valid, group863_in_valid, group873_in_valid,
  
  // Spine 4 group ports
  output wire [15:0] group814_out_data, group824_out_data, group834_out_data, group844_out_data,
  output wire [15:0] group854_out_data, group864_out_data, group874_out_data,
  output wire group814_out_valid, group824_out_valid, group834_out_valid, group844_out_valid,
  output wire group854_out_valid, group864_out_valid, group874_out_valid,
  input wire [15:0] group814_in_data, group824_in_data, group834_in_data, group844_in_data,
  input wire [15:0] group854_in_data, group864_in_data, group874_in_data,
  input wire group814_in_valid, group824_in_valid, group834_in_valid, group844_in_valid,
  input wire group854_in_valid, group864_in_valid, group874_in_valid
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

  // Instantiate GPU modules (GPUs 29-32)
  top29 gpu29 (
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

  top30 gpu30 (
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

  top31 gpu31 (
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

  top32 gpu32 (
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
    .GROUP_ID(4'b1000),
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
    .group811_out_data(group811_out_data),
    .group811_out_valid(group811_out_valid),
    .group811_in_data(group811_in_data),
    .group811_in_valid(group811_in_valid),
    
    .group821_out_data(group821_out_data),
    .group821_out_valid(group821_out_valid),
    .group821_in_data(group821_in_data),
    .group821_in_valid(group821_in_valid),
    
    .group831_out_data(group831_out_data),
    .group831_out_valid(group831_out_valid),
    .group831_in_data(group831_in_data),
    .group831_in_valid(group831_in_valid),
    
    .group841_out_data(group841_out_data),
    .group841_out_valid(group841_out_valid),
    .group841_in_data(group841_in_data),
    .group841_in_valid(group841_in_valid),
    
    .group851_out_data(group851_out_data),
    .group851_out_valid(group851_out_valid),
    .group851_in_data(group851_in_data),
    .group851_in_valid(group851_in_valid),
    
    .group861_out_data(group861_out_data),
    .group861_out_valid(group861_out_valid),
    .group861_in_data(group861_in_data),
    .group861_in_valid(group861_in_valid),
    
    .group871_out_data(group871_out_data),
    .group871_out_valid(group871_out_valid),
    .group871_in_data(group871_in_data),
    .group871_in_valid(group871_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b1000),
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
    .group812_out_data(group812_out_data),
    .group812_out_valid(group812_out_valid),
    .group812_in_data(group812_in_data),
    .group812_in_valid(group812_in_valid),
    
    .group822_out_data(group822_out_data),
    .group822_out_valid(group822_out_valid),
    .group822_in_data(group822_in_data),
    .group822_in_valid(group822_in_valid),
    
    .group832_out_data(group832_out_data),
    .group832_out_valid(group832_out_valid),
    .group832_in_data(group832_in_data),
    .group832_in_valid(group832_in_valid),
    
    .group842_out_data(group842_out_data),
    .group842_out_valid(group842_out_valid),
    .group842_in_data(group842_in_data),
    .group842_in_valid(group842_in_valid),
    
    .group852_out_data(group852_out_data),
    .group852_out_valid(group852_out_valid),
    .group852_in_data(group852_in_data),
    .group852_in_valid(group852_in_valid),
    
    .group862_out_data(group862_out_data),
    .group862_out_valid(group862_out_valid),
    .group862_in_data(group862_in_data),
    .group862_in_valid(group862_in_valid),
    
    .group872_out_data(group872_out_data),
    .group872_out_valid(group872_out_valid),
    .group872_in_data(group872_in_data),
    .group872_in_valid(group872_in_valid)
  );

  // Instantiate Spine 3 and Spine 4 similarly...
  spine_router #(
    .GROUP_ID(4'b1000),
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
    .group813_out_data(group813_out_data),
    .group813_out_valid(group813_out_valid),
    .group813_in_data(group813_in_data),
    .group813_in_valid(group813_in_valid),
    
    .group823_out_data(group823_out_data),
    .group823_out_valid(group823_out_valid),
    .group823_in_data(group823_in_data),
    .group823_in_valid(group823_in_valid),
    
    .group833_out_data(group833_out_data),
    .group833_out_valid(group833_out_valid),
    .group833_in_data(group833_in_data),
    .group833_in_valid(group833_in_valid),
    
    .group843_out_data(group843_out_data),
    .group843_out_valid(group843_out_valid),
    .group843_in_data(group843_in_data),
    .group843_in_valid(group843_in_valid),
    
    .group853_out_data(group853_out_data),
    .group853_out_valid(group853_out_valid),
    .group853_in_data(group853_in_data),
    .group853_in_valid(group853_in_valid),
    
    .group863_out_data(group863_out_data),
    .group863_out_valid(group863_out_valid),
    .group863_in_data(group863_in_data),
    .group863_in_valid(group863_in_valid),
    
    .group873_out_data(group873_out_data),
    .group873_out_valid(group873_out_valid),
    .group873_in_data(group873_in_data),
    .group873_in_valid(group873_in_valid)
  );

  spine_router #(
    .GROUP_ID(4'b1000),
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
    .group814_out_data(group814_out_data),
    .group814_out_valid(group814_out_valid),
    .group814_in_data(group814_in_data),
    .group814_in_valid(group814_in_valid),
    
    .group824_out_data(group824_out_data),
    .group824_out_valid(group824_out_valid),
    .group824_in_data(group824_in_data),
    .group824_in_valid(group824_in_valid),
    
    .group834_out_data(group834_out_data),
    .group834_out_valid(group834_out_valid),
    .group834_in_data(group834_in_data),
    .group834_in_valid(group834_in_valid),
    
    .group844_out_data(group844_out_data),
    .group844_out_valid(group844_out_valid),
    .group844_in_data(group844_in_data),
    .group844_in_valid(group844_in_valid),
    
    .group854_out_data(group854_out_data),
    .group854_out_valid(group854_out_valid),
    .group854_in_data(group854_in_data),
    .group854_in_valid(group854_in_valid),
    
    .group864_out_data(group864_out_data),
    .group864_out_valid(group864_out_valid),
    .group864_in_data(group864_in_data),
    .group864_in_valid(group864_in_valid),
    
    .group874_out_data(group874_out_data),
    .group874_out_valid(group874_out_valid),
    .group874_in_data(group874_in_data),
    .group874_in_valid(group874_in_valid)
  );

endmodule