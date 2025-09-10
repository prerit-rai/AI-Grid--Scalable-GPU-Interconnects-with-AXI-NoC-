// 4-Leaf x 4-Spine Group with hard-coded spine↔leaf wiring
module group (
    parameter GROUP_ID = 4'b1000,
    parameter DWIDTH = 16,
    parameter FIFO_DEPTH = 8
)(
    input  wire clk,
    input  wire reset,

    // You can drive these separately if needed
    input  wire dir_leaf,   // drives all leaf_router.dir_local
    input  wire dir_spine,  // drives all spine_router.dir_local

    // =========================
    // GPU-side ports (one per leaf)
    // =========================
    input  wire [DWIDTH-1:0] gpu1_incoming_data,
    input  wire              gpu1_incoming_valid,
    output wire [DWIDTH-1:0] gpu1_outgoing_data,
    output wire              gpu1_outgoing_valid,

    input  wire [DWIDTH-1:0] gpu2_incoming_data,
    input  wire              gpu2_incoming_valid,
    output wire [DWIDTH-1:0] gpu2_outgoing_data,
    output wire              gpu2_outgoing_valid,

    input  wire [DWIDTH-1:0] gpu3_incoming_data,
    input  wire              gpu3_incoming_valid,
    output wire [DWIDTH-1:0] gpu3_outgoing_data,
    output wire              gpu3_outgoing_valid,

    input  wire [DWIDTH-1:0] gpu4_incoming_data,
    input  wire              gpu4_incoming_valid,
    output wire [DWIDTH-1:0] gpu4_outgoing_data,
    output wire              gpu4_outgoing_valid,

    // =========================
    // Inter-group links exposed (exact nomenclature)
    // For spine1:
    input  wire [DWIDTH-1:0] group811_out_data,
    input  wire              group811_out_valid,
    output wire [DWIDTH-1:0] group811_in_data,
    output wire              group811_in_valid,

    input  wire [DWIDTH-1:0] group821_out_data,
    input  wire              group821_out_valid,
    output wire [DWIDTH-1:0] group821_in_data,
    output wire              group821_in_valid,

    input  wire [DWIDTH-1:0] group831_out_data,
    input  wire              group831_out_valid,
    output wire [DWIDTH-1:0] group831_in_data,
    output wire              group831_in_valid,

    input  wire [DWIDTH-1:0] group841_out_data,
    input  wire              group841_out_valid,
    output wire [DWIDTH-1:0] group841_in_data,
    output wire              group841_in_valid,

    input  wire [DWIDTH-1:0] group851_out_data,
    input  wire              group851_out_valid,
    output wire [DWIDTH-1:0] group851_in_data,
    output wire              group851_in_valid,

    input  wire [DWIDTH-1:0] group861_out_data,
    input  wire              group861_out_valid,
    output wire [DWIDTH-1:0] group861_in_data,
    output wire              group861_in_valid,

    input  wire [DWIDTH-1:0] group871_out_data,
    input  wire              group871_out_valid,
    output wire [DWIDTH-1:0] group871_in_data,
    output wire              group871_in_valid,

    // For spine2:
    input  wire [DWIDTH-1:0] group812_out_data,
    input  wire              group812_out_valid,
    output wire [DWIDTH-1:0] group812_in_data,
    output wire              group812_in_valid,

    input  wire [DWIDTH-1:0] group822_out_data,
    input  wire              group822_out_valid,
    output wire [DWIDTH-1:0] group822_in_data,
    output wire              group822_in_valid,

    input  wire [DWIDTH-1:0] group832_out_data,
    input  wire              group832_out_valid,
    output wire [DWIDTH-1:0] group832_in_data,
    output wire              group832_in_valid,

    input  wire [DWIDTH-1:0] group842_out_data,
    input  wire              group842_out_valid,
    output wire [DWIDTH-1:0] group842_in_data,
    output wire              group842_in_valid,

    input  wire [DWIDTH-1:0] group852_out_data,
    input  wire              group852_out_valid,
    output wire [DWIDTH-1:0] group852_in_data,
    output wire              group852_in_valid,

    input  wire [DWIDTH-1:0] group862_out_data,
    input  wire              group862_out_valid,
    output wire [DWIDTH-1:0] group862_in_data,
    output wire              group862_in_valid,

    input  wire [DWIDTH-1:0] group872_out_data,
    input  wire              group872_out_valid,
    output wire [DWIDTH-1:0] group872_in_data,
    output wire              group872_in_valid,

    // For spine3:
    input  wire [DWIDTH-1:0] group813_out_data,
    input  wire              group813_out_valid,
    output wire [DWIDTH-1:0] group813_in_data,
    output wire              group813_in_valid,

    input  wire [DWIDTH-1:0] group823_out_data,
    input  wire              group823_out_valid,
    output wire [DWIDTH-1:0] group823_in_data,
    output wire              group823_in_valid,

    input  wire [DWIDTH-1:0] group833_out_data,
    input  wire              group833_out_valid,
    output wire [DWIDTH-1:0] group833_in_data,
    output wire              group833_in_valid,

    input  wire [DWIDTH-1:0] group843_out_data,
    input  wire              group843_out_valid,
    output wire [DWIDTH-1:0] group843_in_data,
    output wire              group843_in_valid,

    input  wire [DWIDTH-1:0] group853_out_data,
    input  wire              group853_out_valid,
    output wire [DWIDTH-1:0] group853_in_data,
    output wire              group853_in_valid,

    input  wire [DWIDTH-1:0] group863_out_data,
    input  wire              group863_out_valid,
    output wire [DWIDTH-1:0] group863_in_data,
    output wire              group863_in_valid,

    input  wire [DWIDTH-1:0] group873_out_data,
    input  wire              group873_out_valid,
    output wire [DWIDTH-1:0] group873_in_data,
    output wire              group873_in_valid,

    // For spine4:
    input  wire [DWIDTH-1:0] group814_out_data,
    input  wire              group814_out_valid,
    output wire [DWIDTH-1:0] group814_in_data,
    output wire              group814_in_valid,

    input  wire [DWIDTH-1:0] group824_out_data,
    input  wire              group824_out_valid,
    output wire [DWIDTH-1:0] group824_in_data,
    output wire              group824_in_valid,

    input  wire [DWIDTH-1:0] group834_out_data,
    input  wire              group834_out_valid,
    output wire [DWIDTH-1:0] group834_in_data,
    output wire              group834_in_valid,

    input  wire [DWIDTH-1:0] group844_out_data,
    input  wire              group844_out_valid,
    output wire [DWIDTH-1:0] group844_in_data,
    output wire              group844_in_valid,

    input  wire [DWIDTH-1:0] group854_out_data,
    input  wire              group854_out_valid,
    output wire [DWIDTH-1:0] group854_in_data,
    output wire              group854_in_valid,

    input  wire [DWIDTH-1:0] group864_out_data,
    input  wire              group864_out_valid,
    output wire [DWIDTH-1:0] group864_in_data,
    output wire              group864_in_valid,

    input  wire [DWIDTH-1:0] group874_out_data,
    input  wire              group874_out_valid,
    output wire [DWIDTH-1:0] group874_in_data,
    output wire              group874_in_valid
);

    // ====================================================
    // Internal spine<j><i> wires (exact names)
    // j = spine {1..4}, i = leaf {1..4}
    // ====================================================
    // spine1 <-> leaves
    wire [DWIDTH-1:0] spine11_in_data; wire spine11_in_valid;
    wire [DWIDTH-1:0] spine11_out_data; wire spine11_out_valid;
    wire [DWIDTH-1:0] spine12_in_data; wire spine12_in_valid;
    wire [DWIDTH-1:0] spine12_out_data; wire spine12_out_valid;
    wire [DWIDTH-1:0] spine13_in_data; wire spine13_in_valid;
    wire [DWIDTH-1:0] spine13_out_data; wire spine13_out_valid;
    wire [DWIDTH-1:0] spine14_in_data; wire spine14_in_valid;
    wire [DWIDTH-1:0] spine14_out_data; wire spine14_out_valid;

    // spine2 <-> leaves
    wire [DWIDTH-1:0] spine21_in_data; wire spine21_in_valid;
    wire [DWIDTH-1:0] spine21_out_data; wire spine21_out_valid;
    wire [DWIDTH-1:0] spine22_in_data; wire spine22_in_valid;
    wire [DWIDTH-1:0] spine22_out_data; wire spine22_out_valid;
    wire [DWIDTH-1:0] spine23_in_data; wire spine23_in_valid;
    wire [DWIDTH-1:0] spine23_out_data; wire spine23_out_valid;
    wire [DWIDTH-1:0] spine24_in_data; wire spine24_in_valid;
    wire [DWIDTH-1:0] spine24_out_data; wire spine24_out_valid;

    // spine3 <-> leaves
    wire [DWIDTH-1:0] spine31_in_data; wire spine31_in_valid;
    wire [DWIDTH-1:0] spine31_out_data; wire spine31_out_valid;
    wire [DWIDTH-1:0] spine32_in_data; wire spine32_in_valid;
    wire [DWIDTH-1:0] spine32_out_data; wire spine32_out_valid;
    wire [DWIDTH-1:0] spine33_in_data; wire spine33_in_valid;
    wire [DWIDTH-1:0] spine33_out_data; wire spine33_out_valid;
    wire [DWIDTH-1:0] spine34_in_data; wire spine34_in_valid;
    wire [DWIDTH-1:0] spine34_out_data; wire spine34_out_valid;

    // spine4 <-> leaves
    wire [DWIDTH-1:0] spine41_in_data; wire spine41_in_valid;
    wire [DWIDTH-1:0] spine41_out_data; wire spine41_out_valid;
    wire [DWIDTH-1:0] spine42_in_data; wire spine42_in_valid;
    wire [DWIDTH-1:0] spine42_out_data; wire spine42_out_valid;
    wire [DWIDTH-1:0] spine43_in_data; wire spine43_in_valid;
    wire [DWIDTH-1:0] spine43_out_data; wire spine43_out_valid;
    wire [DWIDTH-1:0] spine44_in_data; wire spine44_in_valid;
    wire [DWIDTH-1:0] spine44_out_data; wire spine44_out_valid;

    // =========================
    // Leaf routers (1..4)
    // =========================
    // Leaf 1 uses spine11, spine21, spine31, spine41
    leaf_router #(.LEAF_ROUTER_ID(1), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_leaf1 (
        .clk(clk), .reset(reset), .dir_local(dir_leaf),
        .gpu_incoming_data(gpu1_incoming_data),
        .gpu_incoming_valid(gpu1_incoming_valid),
        .gpu_outgoing_data(gpu1_outgoing_data),
        .gpu_outgoing_valid(gpu1_outgoing_valid),
        .spine11_out_data(spine11_out_data), .spine11_out_valid(spine11_out_valid),
        .spine11_in_data (spine11_in_data),  .spine11_in_valid (spine11_in_valid),
        .spine21_out_data(spine21_out_data), .spine21_out_valid(spine21_out_valid),
        .spine21_in_data (spine21_in_data),  .spine21_in_valid (spine21_in_valid),
        .spine31_out_data(spine31_out_data), .spine31_out_valid(spine31_out_valid),
        .spine31_in_data (spine31_in_data),  .spine31_in_valid (spine31_in_valid),
        .spine41_out_data(spine41_out_data), .spine41_out_valid(spine41_out_valid),
        .spine41_in_data (spine41_in_data),  .spine41_in_valid (spine41_in_valid)
    );

    // Leaf 2 uses spine12, spine22, spine32, spine42
    leaf_router #(.LEAF_ROUTER_ID(2), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_leaf2 (
        .clk(clk), .reset(reset), .dir_local(dir_leaf),
        .gpu_incoming_data(gpu2_incoming_data),
        .gpu_incoming_valid(gpu2_incoming_valid),
        .gpu_outgoing_data(gpu2_outgoing_data),
        .gpu_outgoing_valid(gpu2_outgoing_valid),
        .spine12_out_data(spine12_out_data), .spine12_out_valid(spine12_out_valid),
        .spine12_in_data (spine12_in_data),  .spine12_in_valid (spine12_in_valid),
        .spine22_out_data(spine22_out_data), .spine22_out_valid(spine22_out_valid),
        .spine22_in_data (spine22_in_data),  .spine22_in_valid (spine22_in_valid),
        .spine32_out_data(spine32_out_data), .spine32_out_valid(spine32_out_valid),
        .spine32_in_data (spine32_in_data),  .spine32_in_valid (spine32_in_valid),
        .spine42_out_data(spine42_out_data), .spine42_out_valid(spine42_out_valid),
        .spine42_in_data (spine42_in_data),  .spine42_in_valid (spine42_in_valid)
    );

    // Leaf 3 uses spine13, spine23, spine33, spine43
    leaf_router #(.LEAF_ROUTER_ID(3), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_leaf3 (
        .clk(clk), .reset(reset), .dir_local(dir_leaf),
        .gpu_incoming_data(gpu3_incoming_data),
        .gpu_incoming_valid(gpu3_incoming_valid),
        .gpu_outgoing_data(gpu3_outgoing_data),
        .gpu_outgoing_valid(gpu3_outgoing_valid),
        .spine13_out_data(spine13_out_data), .spine13_out_valid(spine13_out_valid),
        .spine13_in_data (spine13_in_data),  .spine13_in_valid (spine13_in_valid),
        .spine23_out_data(spine23_out_data), .spine23_out_valid(spine23_out_valid),
        .spine23_in_data (spine23_in_data),  .spine23_in_valid (spine23_in_valid),
        .spine33_out_data(spine33_out_data), .spine33_out_valid(spine33_out_valid),
        .spine33_in_data (spine33_in_data),  .spine33_in_valid (spine33_in_valid),
        .spine43_out_data(spine43_out_data), .spine43_out_valid(spine43_out_valid),
        .spine43_in_data (spine43_in_data),  .spine43_in_valid (spine43_in_valid)
    );

    // Leaf 4 uses spine14, spine24, spine34, spine44
    leaf_router #(.LEAF_ROUTER_ID(4), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_leaf4 (
        .clk(clk), .reset(reset), .dir_local(dir_leaf),
        .gpu_incoming_data(gpu4_incoming_data),
        .gpu_incoming_valid(gpu4_incoming_valid),
        .gpu_outgoing_data(gpu4_outgoing_data),
        .gpu_outgoing_valid(gpu4_outgoing_valid),
        .spine14_out_data(spine14_out_data), .spine14_out_valid(spine14_out_valid),
        .spine14_in_data (spine14_in_data),  .spine14_in_valid (spine14_in_valid),
        .spine24_out_data(spine24_out_data), .spine24_out_valid(spine24_out_valid),
        .spine24_in_data (spine24_in_data),  .spine24_in_valid (spine24_in_valid),
        .spine34_out_data(spine34_out_data), .spine34_out_valid(spine34_out_valid),
        .spine34_in_data (spine34_in_data),  .spine34_in_valid (spine34_in_valid),
        .spine44_out_data(spine44_out_data), .spine44_out_valid(spine44_out_valid),
        .spine44_in_data (spine44_in_data),  .spine44_in_valid (spine44_in_valid)
    );

    // =========================
    // Spine routers (1..4)
    // =========================
    spine_router #(.SPINE_ROUTER_ID(1), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_spine1 (
        .clk(clk), .reset(reset), .dir_local(dir_spine),
        // leaf links
        .spine11_in_data(spine11_in_data), .spine11_in_valid(spine11_in_valid),
        .spine11_out_data(spine11_out_data), .spine11_out_valid(spine11_out_valid),

        .spine12_in_data(spine12_in_data), .spine12_in_valid(spine12_in_valid),
        .spine12_out_data(spine12_out_data), .spine12_out_valid(spine12_out_valid),

        .spine13_in_data(spine13_in_data), .spine13_in_valid(spine13_in_valid),
        .spine13_out_data(spine13_out_data), .spine13_out_valid(spine13_out_valid),

        .spine14_in_data(spine14_in_data), .spine14_in_valid(spine14_in_valid),
        .spine14_out_data(spine14_out_data), .spine14_out_valid(spine14_out_valid),

        // inter-group
        .group811_out_data(group811_out_data), .group811_out_valid(group811_out_valid),
        .group811_in_data (group811_in_data),  .group811_in_valid (group811_in_valid),

        .group821_out_data(group821_out_data), .group821_out_valid(group821_out_valid),
        .group821_in_data (group821_in_data),  .group821_in_valid (group821_in_valid),

        .group831_out_data(group831_out_data), .group831_out_valid(group831_out_valid),
        .group831_in_data (group831_in_data),  .group831_in_valid (group831_in_valid),

        .group841_out_data(group841_out_data), .group841_out_valid(group841_out_valid),
        .group841_in_data (group841_in_data),  .group841_in_valid (group841_in_valid),

        .group851_out_data(group851_out_data), .group851_out_valid(group851_out_valid),
        .group851_in_data (group851_in_data),  .group851_in_valid (group851_in_valid),

        .group861_out_data(group861_out_data), .group861_out_valid(group861_out_valid),
        .group861_in_data (group861_in_data),  .group861_in_valid (group861_in_valid),

        .group871_out_data(group871_out_data), .group871_out_valid(group871_out_valid),
        .group871_in_data (group871_in_data),  .group871_in_valid (group871_in_valid)
    );

    spine_router #(.SPINE_ROUTER_ID(2), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_spine2 (
        .clk(clk), .reset(reset), .dir_local(dir_spine),

        .spine21_in_data(spine21_in_data), .spine21_in_valid(spine21_in_valid),
        .spine21_out_data(spine21_out_data), .spine21_out_valid(spine21_out_valid),

        .spine22_in_data(spine22_in_data), .spine22_in_valid(spine22_in_valid),
        .spine22_out_data(spine22_out_data), .spine22_out_valid(spine22_out_valid),

        .spine23_in_data(spine23_in_data), .spine23_in_valid(spine23_in_valid),
        .spine23_out_data(spine23_out_data), .spine23_out_valid(spine23_out_valid),

        .spine24_in_data(spine24_in_data), .spine24_in_valid(spine24_in_valid),
        .spine24_out_data(spine24_out_data), .spine24_out_valid(spine24_out_valid),

        .group812_out_data(group812_out_data), .group812_out_valid(group812_out_valid),
        .group812_in_data (group812_in_data),  .group812_in_valid (group812_in_valid),

        .group822_out_data(group822_out_data), .group822_out_valid(group822_out_valid),
        .group822_in_data (group822_in_data),  .group822_in_valid (group822_in_valid),

        .group832_out_data(group832_out_data), .group832_out_valid(group832_out_valid),
        .group832_in_data (group832_in_data),  .group832_in_valid (group832_in_valid),

        .group842_out_data(group842_out_data), .group842_out_valid(group842_out_valid),
        .group842_in_data (group842_in_data),  .group842_in_valid (group842_in_valid),

        .group852_out_data(group852_out_data), .group852_out_valid(group852_out_valid),
        .group852_in_data (group852_in_data),  .group852_in_valid (group852_in_valid),

        .group862_out_data(group862_out_data), .group862_out_valid(group862_out_valid),
        .group862_in_data (group862_in_data),  .group862_in_valid (group862_in_valid),

        .group872_out_data(group872_out_data), .group872_out_valid(group872_out_valid),
        .group872_in_data (group872_in_data),  .group872_in_valid (group872_in_valid)
    );

    spine_router #(.SPINE_ROUTER_ID(3), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_spine3 (
        .clk(clk), .reset(reset), .dir_local(dir_spine),

        .spine31_in_data(spine31_in_data), .spine31_in_valid(spine31_in_valid),
        .spine31_out_data(spine31_out_data), .spine31_out_valid(spine31_out_valid),

        .spine32_in_data(spine32_in_data), .spine32_in_valid(spine32_in_valid),
        .spine32_out_data(spine32_out_data), .spine32_out_valid(spine32_out_valid),

        .spine33_in_data(spine33_in_data), .spine33_in_valid(spine33_in_valid),
        .spine33_out_data(spine33_out_data), .spine33_out_valid(spine33_out_valid),

        .spine34_in_data(spine34_in_data), .spine34_in_valid(spine34_in_valid),
        .spine34_out_data(spine34_out_data), .spine34_out_valid(spine34_out_valid),

        .group813_out_data(group813_out_data), .group813_out_valid(group813_out_valid),
        .group813_in_data (group813_in_data),  .group813_in_valid (group813_in_valid),

        .group823_out_data(group823_out_data), .group823_out_valid(group823_out_valid),
        .group823_in_data (group823_in_data),  .group823_in_valid (group823_in_valid),

        .group833_out_data(group833_out_data), .group833_out_valid(group833_out_valid),
        .group833_in_data (group833_in_data),  .group833_in_valid (group833_in_valid),

        .group843_out_data(group843_out_data), .group843_out_valid(group843_out_valid),
        .group843_in_data (group843_in_data),  .group843_in_valid (group843_in_valid),

        .group853_out_data(group853_out_data), .group853_out_valid(group853_out_valid),
        .group853_in_data (group853_in_data),  .group853_in_valid (group853_in_valid),

        .group863_out_data(group863_out_data), .group863_out_valid(group863_out_valid),
        .group863_in_data (group863_in_data),  .group863_in_valid (group863_in_valid),

        .group873_out_data(group873_out_data), .group873_out_valid(group873_out_valid),
        .group873_in_data (group873_in_data),  .group873_in_valid (group873_in_valid)
    );

    spine_router #(.SPINE_ROUTER_ID(4), .DWIDTH(DWIDTH), .FIFO_DEPTH(FIFO_DEPTH)) u_spine4 (
        .clk(clk), .reset(reset), .dir_local(dir_spine),

        .spine41_in_data(spine41_in_data), .spine41_in_valid(spine41_in_valid),
        .spine41_out_data(spine41_out_data), .spine41_out_valid(spine41_out_valid),

        .spine42_in_data(spine42_in_data), .spine42_in_valid(spine42_in_valid),
        .spine42_out_data(spine42_out_data), .spine42_out_valid(spine42_out_valid),

        .spine43_in_data(spine43_in_data), .spine43_in_valid(spine43_in_valid),
        .spine43_out_data(spine43_out_data), .spine43_out_valid(spine43_out_valid),

        .spine44_in_data(spine44_in_data), .spine44_in_valid(spine44_in_valid),
        .spine44_out_data(spine44_out_data), .spine44_out_valid(spine44_out_valid),

        .group814_out_data(group814_out_data), .group814_out_valid(group814_out_valid),
        .group814_in_data (group814_in_data),  .group814_in_valid (group814_in_valid),

        .group824_out_data(group824_out_data), .group824_out_valid(group824_out_valid),
        .group824_in_data (group824_in_data),  .group824_in_valid (group824_in_valid),

        .group834_out_data(group834_out_data), .group834_out_valid(group834_out_valid),
        .group834_in_data (group834_in_data),  .group834_in_valid (group834_in_valid),

        .group844_out_data(group844_out_data), .group844_out_valid(group844_out_valid),
        .group844_in_data (group844_in_data),  .group844_in_valid (group844_in_valid),

        .group854_out_data(group854_out_data), .group854_out_valid(group854_out_valid),
        .group854_in_data (group854_in_data),  .group854_in_valid (group854_in_valid),

        .group864_out_data(group864_out_data), .group864_out_valid(group864_out_valid),
        .group864_in_data (group864_in_data),  .group864_in_valid (group864_in_valid),

        .group874_out_data(group874_out_data), .group874_out_valid(group874_out_valid),
        .group874_in_data (group874_in_data),  .group874_in_valid (group874_in_valid)
    );

endmodule