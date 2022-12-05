
module normalize_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_s (
        ap_clk,
        ap_rst,
        data_0_V_read,
        data_1_V_read,
        data_2_V_read,
        data_3_V_read,
        data_4_V_read,
        data_5_V_read,
        data_6_V_read,
        data_7_V_read,
        data_8_V_read,
        data_9_V_read,
        data_10_V_read,
        data_11_V_read,
        data_12_V_read,
        data_13_V_read,
        data_14_V_read,
        data_15_V_read,
        data_16_V_read,
        data_17_V_read,
        data_18_V_read,
        data_19_V_read,
        data_20_V_read,
        data_21_V_read,
        data_22_V_read,
        data_23_V_read,
        data_24_V_read,
        data_25_V_read,
        data_26_V_read,
        data_27_V_read,
        data_28_V_read,
        data_29_V_read,
        data_30_V_read,
        data_31_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6,
        ap_return_7,
        ap_return_8,
        ap_return_9,
        ap_return_10,
        ap_return_11,
        ap_return_12,
        ap_return_13,
        ap_return_14,
        ap_return_15,
        ap_return_16,
        ap_return_17,
        ap_return_18,
        ap_return_19,
        ap_return_20,
        ap_return_21,
        ap_return_22,
        ap_return_23,
        ap_return_24,
        ap_return_25,
        ap_return_26,
        ap_return_27,
        ap_return_28,
        ap_return_29,
        ap_return_30,
        ap_return_31,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [15:0] data_0_V_read;
input  [15:0] data_1_V_read;
input  [15:0] data_2_V_read;
input  [15:0] data_3_V_read;
input  [15:0] data_4_V_read;
input  [15:0] data_5_V_read;
input  [15:0] data_6_V_read;
input  [15:0] data_7_V_read;
input  [15:0] data_8_V_read;
input  [15:0] data_9_V_read;
input  [15:0] data_10_V_read;
input  [15:0] data_11_V_read;
input  [15:0] data_12_V_read;
input  [15:0] data_13_V_read;
input  [15:0] data_14_V_read;
input  [15:0] data_15_V_read;
input  [15:0] data_16_V_read;
input  [15:0] data_17_V_read;
input  [15:0] data_18_V_read;
input  [15:0] data_19_V_read;
input  [15:0] data_20_V_read;
input  [15:0] data_21_V_read;
input  [15:0] data_22_V_read;
input  [15:0] data_23_V_read;
input  [15:0] data_24_V_read;
input  [15:0] data_25_V_read;
input  [15:0] data_26_V_read;
input  [15:0] data_27_V_read;
input  [15:0] data_28_V_read;
input  [15:0] data_29_V_read;
input  [15:0] data_30_V_read;
input  [15:0] data_31_V_read;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;
output  [15:0] ap_return_4;
output  [15:0] ap_return_5;
output  [15:0] ap_return_6;
output  [15:0] ap_return_7;
output  [15:0] ap_return_8;
output  [15:0] ap_return_9;
output  [15:0] ap_return_10;
output  [15:0] ap_return_11;
output  [15:0] ap_return_12;
output  [15:0] ap_return_13;
output  [15:0] ap_return_14;
output  [15:0] ap_return_15;
output  [15:0] ap_return_16;
output  [15:0] ap_return_17;
output  [15:0] ap_return_18;
output  [15:0] ap_return_19;
output  [15:0] ap_return_20;
output  [15:0] ap_return_21;
output  [15:0] ap_return_22;
output  [15:0] ap_return_23;
output  [15:0] ap_return_24;
output  [15:0] ap_return_25;
output  [15:0] ap_return_26;
output  [15:0] ap_return_27;
output  [15:0] ap_return_28;
output  [15:0] ap_return_29;
output  [15:0] ap_return_30;
output  [15:0] ap_return_31;
input   ap_ce;

reg[15:0] ap_return_0;
reg[15:0] ap_return_1;
reg[15:0] ap_return_2;
reg[15:0] ap_return_3;
reg[15:0] ap_return_4;
reg[15:0] ap_return_5;
reg[15:0] ap_return_6;
reg[15:0] ap_return_7;
reg[15:0] ap_return_8;
reg[15:0] ap_return_9;
reg[15:0] ap_return_10;
reg[15:0] ap_return_11;
reg[15:0] ap_return_12;
reg[15:0] ap_return_13;
reg[15:0] ap_return_14;
reg[15:0] ap_return_15;
reg[15:0] ap_return_16;
reg[15:0] ap_return_17;
reg[15:0] ap_return_18;
reg[15:0] ap_return_19;
reg[15:0] ap_return_20;
reg[15:0] ap_return_21;
reg[15:0] ap_return_22;
reg[15:0] ap_return_23;
reg[15:0] ap_return_24;
reg[15:0] ap_return_25;
reg[15:0] ap_return_26;
reg[15:0] ap_return_27;
reg[15:0] ap_return_28;
reg[15:0] ap_return_29;
reg[15:0] ap_return_30;
reg[15:0] ap_return_31;

wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [14:0] trunc_ln708_22_reg_5489;
reg   [14:0] trunc_ln708_22_reg_5489_pp0_iter1_reg;
reg   [14:0] trunc_ln708_27_reg_5514;
reg   [14:0] trunc_ln708_27_reg_5514_pp0_iter1_reg;
reg   [13:0] tmp_386_reg_5519;
reg   [13:0] tmp_386_reg_5519_pp0_iter1_reg;
reg   [14:0] trunc_ln_reg_5539;
reg   [14:0] trunc_ln708_1_reg_5544;
reg   [14:0] trunc_ln708_2_reg_5549;
reg   [14:0] trunc_ln708_3_reg_5554;
reg   [14:0] trunc_ln708_4_reg_5559;
reg   [14:0] trunc_ln708_5_reg_5564;
reg   [15:0] trunc_ln708_6_reg_5569;
reg   [14:0] trunc_ln708_7_reg_5574;
reg   [14:0] trunc_ln708_8_reg_5579;
reg   [15:0] trunc_ln708_9_reg_5584;
reg   [14:0] trunc_ln708_10_reg_5589;
reg   [15:0] trunc_ln708_11_reg_5594;
reg   [14:0] trunc_ln708_12_reg_5599;
reg   [14:0] trunc_ln708_13_reg_5604;
reg   [14:0] trunc_ln708_14_reg_5609;
reg   [14:0] trunc_ln708_15_reg_5614;
reg   [15:0] trunc_ln708_16_reg_5619;
reg   [15:0] trunc_ln708_17_reg_5624;
reg   [14:0] trunc_ln708_18_reg_5629;
reg   [15:0] trunc_ln708_19_reg_5634;
reg   [14:0] trunc_ln708_20_reg_5639;
reg   [14:0] trunc_ln708_21_reg_5644;
reg   [14:0] trunc_ln708_23_reg_5649;
reg   [14:0] trunc_ln708_24_reg_5654;
reg   [14:0] trunc_ln708_25_reg_5659;
reg   [14:0] trunc_ln708_26_reg_5664;
reg   [14:0] trunc_ln708_29_reg_5669;
reg   [14:0] trunc_ln708_30_reg_5674;
reg   [15:0] trunc_ln708_31_reg_5679;
wire   [8:0] grp_fu_428_p1;
wire    ap_block_pp0_stage0;
wire   [8:0] grp_fu_430_p1;
wire   [8:0] grp_fu_431_p1;
wire   [8:0] grp_fu_432_p1;
wire   [8:0] grp_fu_433_p1;
wire   [8:0] grp_fu_435_p1;
wire   [8:0] grp_fu_436_p1;
wire   [9:0] grp_fu_437_p1;
wire   [9:0] grp_fu_438_p1;
wire   [9:0] grp_fu_439_p1;
wire   [9:0] grp_fu_440_p1;
wire   [8:0] grp_fu_441_p1;
wire   [8:0] grp_fu_442_p1;
wire   [8:0] grp_fu_443_p1;
wire   [8:0] grp_fu_444_p1;
wire   [9:0] grp_fu_445_p1;
wire   [8:0] grp_fu_446_p1;
wire   [8:0] grp_fu_447_p1;
wire   [8:0] grp_fu_448_p1;
wire   [8:0] grp_fu_449_p1;
wire   [8:0] grp_fu_451_p1;
wire   [8:0] grp_fu_452_p1;
wire   [9:0] grp_fu_453_p1;
wire   [8:0] grp_fu_454_p1;
wire   [9:0] grp_fu_455_p1;
wire   [8:0] grp_fu_456_p1;
wire   [8:0] grp_fu_457_p1;
wire   [8:0] grp_fu_458_p1;
wire   [8:0] grp_fu_459_p1;
wire   [15:0] sext_ln1118_22_fu_4486_p0;
wire   [15:0] shl_ln_fu_4490_p1;
wire   [23:0] shl_ln_fu_4490_p3;
wire   [24:0] sext_ln1118_23_fu_4498_p1;
wire   [24:0] sext_ln1118_22_fu_4486_p1;
wire   [24:0] add_ln1118_fu_4502_p2;
wire   [23:0] shl_ln1118_1_fu_4538_p3;
wire   [21:0] shl_ln1118_2_fu_4550_p3;
wire   [24:0] sext_ln1118_29_fu_4558_p1;
wire   [24:0] sext_ln1118_28_fu_4546_p1;
wire   [24:0] add_ln1118_1_fu_4562_p2;
wire   [22:0] shl_ln1118_3_fu_4578_p3;
wire   [20:0] shl_ln1118_4_fu_4590_p3;
wire   [23:0] sext_ln1118_31_fu_4598_p1;
wire   [23:0] sext_ln1118_30_fu_4586_p1;
wire   [23:0] add_ln1118_2_fu_4602_p2;
wire   [24:0] grp_fu_435_p2;
wire   [24:0] grp_fu_442_p2;
wire   [24:0] grp_fu_446_p2;
wire   [24:0] grp_fu_458_p2;
wire   [24:0] grp_fu_444_p2;
wire   [24:0] grp_fu_454_p2;
wire   [25:0] grp_fu_437_p2;
wire   [24:0] grp_fu_452_p2;
wire   [24:0] grp_fu_436_p2;
wire   [25:0] grp_fu_445_p2;
wire   [24:0] grp_fu_448_p2;
wire   [25:0] grp_fu_438_p2;
wire   [24:0] grp_fu_443_p2;
wire   [24:0] grp_fu_431_p2;
wire   [24:0] grp_fu_428_p2;
wire   [24:0] grp_fu_456_p2;
wire   [25:0] grp_fu_455_p2;
wire   [25:0] grp_fu_439_p2;
wire   [24:0] grp_fu_433_p2;
wire   [25:0] grp_fu_453_p2;
wire   [24:0] grp_fu_451_p2;
wire   [24:0] grp_fu_430_p2;
wire   [24:0] grp_fu_447_p2;
wire   [24:0] grp_fu_449_p2;
wire   [24:0] grp_fu_441_p2;
wire   [24:0] grp_fu_459_p2;
wire   [24:0] grp_fu_457_p2;
wire   [24:0] grp_fu_432_p2;
wire   [25:0] grp_fu_440_p2;
wire   [15:0] sext_ln708_fu_4923_p1;
wire   [15:0] sext_ln708_1_fu_4932_p1;
wire   [15:0] sext_ln708_2_fu_4941_p1;
wire   [15:0] sext_ln708_3_fu_4950_p1;
wire   [15:0] sext_ln708_4_fu_4959_p1;
wire   [15:0] sext_ln708_5_fu_4968_p1;
wire   [15:0] sext_ln708_6_fu_4982_p1;
wire   [15:0] sext_ln708_7_fu_4991_p1;
wire   [15:0] sext_ln708_8_fu_5005_p1;
wire   [15:0] sext_ln708_9_fu_5019_p1;
wire   [15:0] sext_ln708_10_fu_5028_p1;
wire   [15:0] sext_ln708_11_fu_5037_p1;
wire   [15:0] sext_ln708_12_fu_5046_p1;
wire   [15:0] sext_ln708_13_fu_5065_p1;
wire   [15:0] sext_ln708_14_fu_5079_p1;
wire   [15:0] sext_ln708_15_fu_5088_p1;
wire   [15:0] sext_ln708_16_fu_5097_p1;
wire   [15:0] sext_ln708_17_fu_5106_p1;
wire   [15:0] sext_ln708_18_fu_5115_p1;
wire   [15:0] sext_ln708_19_fu_5124_p1;
wire   [15:0] sext_ln708_20_fu_5133_p1;
wire   [15:0] sext_ln708_21_fu_5142_p1;
wire   [14:0] sext_ln703_fu_5151_p1;
wire   [14:0] add_ln703_126_fu_5154_p2;
wire   [15:0] sext_ln708_22_fu_5164_p1;
wire   [15:0] sext_ln708_23_fu_5173_p1;
wire   [15:0] add_ln703_fu_4926_p2;
wire   [15:0] add_ln703_99_fu_4935_p2;
wire   [15:0] add_ln703_100_fu_4944_p2;
wire   [15:0] add_ln703_101_fu_4953_p2;
wire   [15:0] add_ln703_102_fu_4962_p2;
wire   [15:0] add_ln703_103_fu_4971_p2;
wire   [15:0] add_ln703_104_fu_4977_p2;
wire   [15:0] add_ln703_105_fu_4985_p2;
wire   [15:0] add_ln703_106_fu_4994_p2;
wire   [15:0] add_ln703_107_fu_5000_p2;
wire   [15:0] add_ln703_108_fu_5008_p2;
wire   [15:0] add_ln703_109_fu_5014_p2;
wire   [15:0] add_ln703_110_fu_5022_p2;
wire   [15:0] add_ln703_111_fu_5031_p2;
wire   [15:0] add_ln703_112_fu_5040_p2;
wire   [15:0] add_ln703_113_fu_5049_p2;
wire   [15:0] add_ln703_114_fu_5055_p2;
wire   [15:0] add_ln703_115_fu_5060_p2;
wire   [15:0] add_ln703_116_fu_5068_p2;
wire   [15:0] add_ln703_117_fu_5074_p2;
wire   [15:0] add_ln703_118_fu_5082_p2;
wire   [15:0] add_ln703_119_fu_5091_p2;
wire   [15:0] add_ln703_120_fu_5100_p2;
wire   [15:0] add_ln703_121_fu_5109_p2;
wire   [15:0] add_ln703_122_fu_5118_p2;
wire   [15:0] add_ln703_123_fu_5127_p2;
wire   [15:0] add_ln703_124_fu_5136_p2;
wire   [15:0] add_ln703_125_fu_5145_p2;
wire   [15:0] sext_ln703_3_fu_5160_p1;
wire   [15:0] add_ln703_127_fu_5167_p2;
wire   [15:0] add_ln703_128_fu_5176_p2;
wire   [15:0] add_ln703_129_fu_5182_p2;
reg    grp_fu_428_ce;
reg    grp_fu_430_ce;
reg    grp_fu_431_ce;
reg    grp_fu_432_ce;
reg    grp_fu_433_ce;
reg    grp_fu_435_ce;
reg    grp_fu_436_ce;
reg    grp_fu_437_ce;
reg    grp_fu_438_ce;
reg    grp_fu_439_ce;
reg    grp_fu_440_ce;
reg    grp_fu_441_ce;
reg    grp_fu_442_ce;
reg    grp_fu_443_ce;
reg    grp_fu_444_ce;
reg    grp_fu_445_ce;
reg    grp_fu_446_ce;
reg    grp_fu_447_ce;
reg    grp_fu_448_ce;
reg    grp_fu_449_ce;
reg    grp_fu_451_ce;
reg    grp_fu_452_ce;
reg    grp_fu_453_ce;
reg    grp_fu_454_ce;
reg    grp_fu_455_ce;
reg    grp_fu_456_ce;
reg    grp_fu_457_ce;
reg    grp_fu_458_ce;
reg    grp_fu_459_ce;
reg    ap_ce_reg;
reg   [15:0] data_0_V_read_int_reg;
reg   [15:0] data_1_V_read_int_reg;
reg   [15:0] data_2_V_read_int_reg;
reg   [15:0] data_3_V_read_int_reg;
reg   [15:0] data_4_V_read_int_reg;
reg   [15:0] data_5_V_read_int_reg;
reg   [15:0] data_6_V_read_int_reg;
reg   [15:0] data_7_V_read_int_reg;
reg   [15:0] data_8_V_read_int_reg;
reg   [15:0] data_9_V_read_int_reg;
reg   [15:0] data_10_V_read_int_reg;
reg   [15:0] data_11_V_read_int_reg;
reg   [15:0] data_12_V_read_int_reg;
reg   [15:0] data_13_V_read_int_reg;
reg   [15:0] data_14_V_read_int_reg;
reg   [15:0] data_15_V_read_int_reg;
reg   [15:0] data_16_V_read_int_reg;
reg   [15:0] data_17_V_read_int_reg;
reg   [15:0] data_18_V_read_int_reg;
reg   [15:0] data_19_V_read_int_reg;
reg   [15:0] data_20_V_read_int_reg;
reg   [15:0] data_21_V_read_int_reg;
reg   [15:0] data_22_V_read_int_reg;
reg   [15:0] data_23_V_read_int_reg;
reg   [15:0] data_24_V_read_int_reg;
reg   [15:0] data_25_V_read_int_reg;
reg   [15:0] data_26_V_read_int_reg;
reg   [15:0] data_27_V_read_int_reg;
reg   [15:0] data_28_V_read_int_reg;
reg   [15:0] data_29_V_read_int_reg;
reg   [15:0] data_30_V_read_int_reg;
reg   [15:0] data_31_V_read_int_reg;
reg   [15:0] ap_return_0_int_reg;
reg   [15:0] ap_return_1_int_reg;
reg   [15:0] ap_return_2_int_reg;
reg   [15:0] ap_return_3_int_reg;
reg   [15:0] ap_return_4_int_reg;
reg   [15:0] ap_return_5_int_reg;
reg   [15:0] ap_return_6_int_reg;
reg   [15:0] ap_return_7_int_reg;
reg   [15:0] ap_return_8_int_reg;
reg   [15:0] ap_return_9_int_reg;
reg   [15:0] ap_return_10_int_reg;
reg   [15:0] ap_return_11_int_reg;
reg   [15:0] ap_return_12_int_reg;
reg   [15:0] ap_return_13_int_reg;
reg   [15:0] ap_return_14_int_reg;
reg   [15:0] ap_return_15_int_reg;
reg   [15:0] ap_return_16_int_reg;
reg   [15:0] ap_return_17_int_reg;
reg   [15:0] ap_return_18_int_reg;
reg   [15:0] ap_return_19_int_reg;
reg   [15:0] ap_return_20_int_reg;
reg   [15:0] ap_return_21_int_reg;
reg   [15:0] ap_return_22_int_reg;
reg   [15:0] ap_return_23_int_reg;
reg   [15:0] ap_return_24_int_reg;
reg   [15:0] ap_return_25_int_reg;
reg   [15:0] ap_return_26_int_reg;
reg   [15:0] ap_return_27_int_reg;
reg   [15:0] ap_return_28_int_reg;
reg   [15:0] ap_return_29_int_reg;
reg   [15:0] ap_return_30_int_reg;
reg   [15:0] ap_return_31_int_reg;

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U258(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_14_V_read_int_reg),
    .din1(grp_fu_428_p1),
    .ce(grp_fu_428_ce),
    .dout(grp_fu_428_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U259(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_21_V_read_int_reg),
    .din1(grp_fu_430_p1),
    .ce(grp_fu_430_ce),
    .dout(grp_fu_430_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U260(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_13_V_read_int_reg),
    .din1(grp_fu_431_p1),
    .ce(grp_fu_431_ce),
    .dout(grp_fu_431_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U261(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_30_V_read_int_reg),
    .din1(grp_fu_432_p1),
    .ce(grp_fu_432_ce),
    .dout(grp_fu_432_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U262(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_18_V_read_int_reg),
    .din1(grp_fu_433_p1),
    .ce(grp_fu_433_ce),
    .dout(grp_fu_433_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U263(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_0_V_read_int_reg),
    .din1(grp_fu_435_p1),
    .ce(grp_fu_435_ce),
    .dout(grp_fu_435_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U264(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_8_V_read_int_reg),
    .din1(grp_fu_436_p1),
    .ce(grp_fu_436_ce),
    .dout(grp_fu_436_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U265(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_6_V_read_int_reg),
    .din1(grp_fu_437_p1),
    .ce(grp_fu_437_ce),
    .dout(grp_fu_437_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U266(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_11_V_read_int_reg),
    .din1(grp_fu_438_p1),
    .ce(grp_fu_438_ce),
    .dout(grp_fu_438_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U267(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_17_V_read_int_reg),
    .din1(grp_fu_439_p1),
    .ce(grp_fu_439_ce),
    .dout(grp_fu_439_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U268(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_31_V_read_int_reg),
    .din1(grp_fu_440_p1),
    .ce(grp_fu_440_ce),
    .dout(grp_fu_440_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U269(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_25_V_read_int_reg),
    .din1(grp_fu_441_p1),
    .ce(grp_fu_441_ce),
    .dout(grp_fu_441_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U270(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_1_V_read_int_reg),
    .din1(grp_fu_442_p1),
    .ce(grp_fu_442_ce),
    .dout(grp_fu_442_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U271(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_12_V_read_int_reg),
    .din1(grp_fu_443_p1),
    .ce(grp_fu_443_ce),
    .dout(grp_fu_443_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U272(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_4_V_read_int_reg),
    .din1(grp_fu_444_p1),
    .ce(grp_fu_444_ce),
    .dout(grp_fu_444_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U273(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_9_V_read_int_reg),
    .din1(grp_fu_445_p1),
    .ce(grp_fu_445_ce),
    .dout(grp_fu_445_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U274(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_2_V_read_int_reg),
    .din1(grp_fu_446_p1),
    .ce(grp_fu_446_ce),
    .dout(grp_fu_446_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U275(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_23_V_read_int_reg),
    .din1(grp_fu_447_p1),
    .ce(grp_fu_447_ce),
    .dout(grp_fu_447_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U276(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_10_V_read_int_reg),
    .din1(grp_fu_448_p1),
    .ce(grp_fu_448_ce),
    .dout(grp_fu_448_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U277(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_24_V_read_int_reg),
    .din1(grp_fu_449_p1),
    .ce(grp_fu_449_ce),
    .dout(grp_fu_449_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U278(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_20_V_read_int_reg),
    .din1(grp_fu_451_p1),
    .ce(grp_fu_451_ce),
    .dout(grp_fu_451_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U279(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_7_V_read_int_reg),
    .din1(grp_fu_452_p1),
    .ce(grp_fu_452_ce),
    .dout(grp_fu_452_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U280(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_19_V_read_int_reg),
    .din1(grp_fu_453_p1),
    .ce(grp_fu_453_ce),
    .dout(grp_fu_453_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U281(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_5_V_read_int_reg),
    .din1(grp_fu_454_p1),
    .ce(grp_fu_454_ce),
    .dout(grp_fu_454_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U282(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_16_V_read_int_reg),
    .din1(grp_fu_455_p1),
    .ce(grp_fu_455_ce),
    .dout(grp_fu_455_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U283(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_15_V_read_int_reg),
    .din1(grp_fu_456_p1),
    .ce(grp_fu_456_ce),
    .dout(grp_fu_456_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U284(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_29_V_read_int_reg),
    .din1(grp_fu_457_p1),
    .ce(grp_fu_457_ce),
    .dout(grp_fu_457_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U285(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_3_V_read_int_reg),
    .din1(grp_fu_458_p1),
    .ce(grp_fu_458_ce),
    .dout(grp_fu_458_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U286(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_26_V_read_int_reg),
    .din1(grp_fu_459_p1),
    .ce(grp_fu_459_ce),
    .dout(grp_fu_459_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_0_int_reg <= add_ln703_fu_4926_p2;
        ap_return_10_int_reg <= add_ln703_108_fu_5008_p2;
        ap_return_11_int_reg <= add_ln703_109_fu_5014_p2;
        ap_return_12_int_reg <= add_ln703_110_fu_5022_p2;
        ap_return_13_int_reg <= add_ln703_111_fu_5031_p2;
        ap_return_14_int_reg <= add_ln703_112_fu_5040_p2;
        ap_return_15_int_reg <= add_ln703_113_fu_5049_p2;
        ap_return_16_int_reg <= add_ln703_114_fu_5055_p2;
        ap_return_17_int_reg <= add_ln703_115_fu_5060_p2;
        ap_return_18_int_reg <= add_ln703_116_fu_5068_p2;
        ap_return_19_int_reg <= add_ln703_117_fu_5074_p2;
        ap_return_1_int_reg <= add_ln703_99_fu_4935_p2;
        ap_return_20_int_reg <= add_ln703_118_fu_5082_p2;
        ap_return_21_int_reg <= add_ln703_119_fu_5091_p2;
        ap_return_22_int_reg <= add_ln703_120_fu_5100_p2;
        ap_return_23_int_reg <= add_ln703_121_fu_5109_p2;
        ap_return_24_int_reg <= add_ln703_122_fu_5118_p2;
        ap_return_25_int_reg <= add_ln703_123_fu_5127_p2;
        ap_return_26_int_reg <= add_ln703_124_fu_5136_p2;
        ap_return_27_int_reg <= add_ln703_125_fu_5145_p2;
        ap_return_28_int_reg <= sext_ln703_3_fu_5160_p1;
        ap_return_29_int_reg <= add_ln703_127_fu_5167_p2;
        ap_return_2_int_reg <= add_ln703_100_fu_4944_p2;
        ap_return_30_int_reg <= add_ln703_128_fu_5176_p2;
        ap_return_31_int_reg <= add_ln703_129_fu_5182_p2;
        ap_return_3_int_reg <= add_ln703_101_fu_4953_p2;
        ap_return_4_int_reg <= add_ln703_102_fu_4962_p2;
        ap_return_5_int_reg <= add_ln703_103_fu_4971_p2;
        ap_return_6_int_reg <= add_ln703_104_fu_4977_p2;
        ap_return_7_int_reg <= add_ln703_105_fu_4985_p2;
        ap_return_8_int_reg <= add_ln703_106_fu_4994_p2;
        ap_return_9_int_reg <= add_ln703_107_fu_5000_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        data_0_V_read_int_reg <= data_0_V_read;
        data_10_V_read_int_reg <= data_10_V_read;
        data_11_V_read_int_reg <= data_11_V_read;
        data_12_V_read_int_reg <= data_12_V_read;
        data_13_V_read_int_reg <= data_13_V_read;
        data_14_V_read_int_reg <= data_14_V_read;
        data_15_V_read_int_reg <= data_15_V_read;
        data_16_V_read_int_reg <= data_16_V_read;
        data_17_V_read_int_reg <= data_17_V_read;
        data_18_V_read_int_reg <= data_18_V_read;
        data_19_V_read_int_reg <= data_19_V_read;
        data_1_V_read_int_reg <= data_1_V_read;
        data_20_V_read_int_reg <= data_20_V_read;
        data_21_V_read_int_reg <= data_21_V_read;
        data_22_V_read_int_reg <= data_22_V_read;
        data_23_V_read_int_reg <= data_23_V_read;
        data_24_V_read_int_reg <= data_24_V_read;
        data_25_V_read_int_reg <= data_25_V_read;
        data_26_V_read_int_reg <= data_26_V_read;
        data_27_V_read_int_reg <= data_27_V_read;
        data_28_V_read_int_reg <= data_28_V_read;
        data_29_V_read_int_reg <= data_29_V_read;
        data_2_V_read_int_reg <= data_2_V_read;
        data_30_V_read_int_reg <= data_30_V_read;
        data_31_V_read_int_reg <= data_31_V_read;
        data_3_V_read_int_reg <= data_3_V_read;
        data_4_V_read_int_reg <= data_4_V_read;
        data_5_V_read_int_reg <= data_5_V_read;
        data_6_V_read_int_reg <= data_6_V_read;
        data_7_V_read_int_reg <= data_7_V_read;
        data_8_V_read_int_reg <= data_8_V_read;
        data_9_V_read_int_reg <= data_9_V_read;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        tmp_386_reg_5519 <= {{add_ln1118_2_fu_4602_p2[23:10]}};
        tmp_386_reg_5519_pp0_iter1_reg <= tmp_386_reg_5519;
        trunc_ln708_10_reg_5589 <= {{grp_fu_448_p2[24:10]}};
        trunc_ln708_11_reg_5594 <= {{grp_fu_438_p2[25:10]}};
        trunc_ln708_12_reg_5599 <= {{grp_fu_443_p2[24:10]}};
        trunc_ln708_13_reg_5604 <= {{grp_fu_431_p2[24:10]}};
        trunc_ln708_14_reg_5609 <= {{grp_fu_428_p2[24:10]}};
        trunc_ln708_15_reg_5614 <= {{grp_fu_456_p2[24:10]}};
        trunc_ln708_16_reg_5619 <= {{grp_fu_455_p2[25:10]}};
        trunc_ln708_17_reg_5624 <= {{grp_fu_439_p2[25:10]}};
        trunc_ln708_18_reg_5629 <= {{grp_fu_433_p2[24:10]}};
        trunc_ln708_19_reg_5634 <= {{grp_fu_453_p2[25:10]}};
        trunc_ln708_1_reg_5544 <= {{grp_fu_442_p2[24:10]}};
        trunc_ln708_20_reg_5639 <= {{grp_fu_451_p2[24:10]}};
        trunc_ln708_21_reg_5644 <= {{grp_fu_430_p2[24:10]}};
        trunc_ln708_22_reg_5489 <= {{add_ln1118_fu_4502_p2[24:10]}};
        trunc_ln708_22_reg_5489_pp0_iter1_reg <= trunc_ln708_22_reg_5489;
        trunc_ln708_23_reg_5649 <= {{grp_fu_447_p2[24:10]}};
        trunc_ln708_24_reg_5654 <= {{grp_fu_449_p2[24:10]}};
        trunc_ln708_25_reg_5659 <= {{grp_fu_441_p2[24:10]}};
        trunc_ln708_26_reg_5664 <= {{grp_fu_459_p2[24:10]}};
        trunc_ln708_27_reg_5514 <= {{add_ln1118_1_fu_4562_p2[24:10]}};
        trunc_ln708_27_reg_5514_pp0_iter1_reg <= trunc_ln708_27_reg_5514;
        trunc_ln708_29_reg_5669 <= {{grp_fu_457_p2[24:10]}};
        trunc_ln708_2_reg_5549 <= {{grp_fu_446_p2[24:10]}};
        trunc_ln708_30_reg_5674 <= {{grp_fu_432_p2[24:10]}};
        trunc_ln708_31_reg_5679 <= {{grp_fu_440_p2[25:10]}};
        trunc_ln708_3_reg_5554 <= {{grp_fu_458_p2[24:10]}};
        trunc_ln708_4_reg_5559 <= {{grp_fu_444_p2[24:10]}};
        trunc_ln708_5_reg_5564 <= {{grp_fu_454_p2[24:10]}};
        trunc_ln708_6_reg_5569 <= {{grp_fu_437_p2[25:10]}};
        trunc_ln708_7_reg_5574 <= {{grp_fu_452_p2[24:10]}};
        trunc_ln708_8_reg_5579 <= {{grp_fu_436_p2[24:10]}};
        trunc_ln708_9_reg_5584 <= {{grp_fu_445_p2[25:10]}};
        trunc_ln_reg_5539 <= {{grp_fu_435_p2[24:10]}};
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_0 = ap_return_0_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_0 = add_ln703_fu_4926_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_1 = ap_return_1_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_1 = add_ln703_99_fu_4935_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_10 = ap_return_10_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_10 = add_ln703_108_fu_5008_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_11 = ap_return_11_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_11 = add_ln703_109_fu_5014_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_12 = ap_return_12_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_12 = add_ln703_110_fu_5022_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_13 = ap_return_13_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_13 = add_ln703_111_fu_5031_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_14 = ap_return_14_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_14 = add_ln703_112_fu_5040_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_15 = ap_return_15_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_15 = add_ln703_113_fu_5049_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_16 = ap_return_16_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_16 = add_ln703_114_fu_5055_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_17 = ap_return_17_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_17 = add_ln703_115_fu_5060_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_18 = ap_return_18_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_18 = add_ln703_116_fu_5068_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_19 = ap_return_19_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_19 = add_ln703_117_fu_5074_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_2 = ap_return_2_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_2 = add_ln703_100_fu_4944_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_20 = ap_return_20_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_20 = add_ln703_118_fu_5082_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_21 = ap_return_21_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_21 = add_ln703_119_fu_5091_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_22 = ap_return_22_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_22 = add_ln703_120_fu_5100_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_23 = ap_return_23_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_23 = add_ln703_121_fu_5109_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_24 = ap_return_24_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_24 = add_ln703_122_fu_5118_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_25 = ap_return_25_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_25 = add_ln703_123_fu_5127_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_26 = ap_return_26_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_26 = add_ln703_124_fu_5136_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_27 = ap_return_27_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_27 = add_ln703_125_fu_5145_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_28 = ap_return_28_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_28 = sext_ln703_3_fu_5160_p1;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_29 = ap_return_29_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_29 = add_ln703_127_fu_5167_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_3 = ap_return_3_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_3 = add_ln703_101_fu_4953_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_30 = ap_return_30_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_30 = add_ln703_128_fu_5176_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_31 = ap_return_31_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_31 = add_ln703_129_fu_5182_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_4 = ap_return_4_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_4 = add_ln703_102_fu_4962_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_5 = ap_return_5_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_5 = add_ln703_103_fu_4971_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_6 = ap_return_6_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_6 = add_ln703_104_fu_4977_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_7 = ap_return_7_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_7 = add_ln703_105_fu_4985_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_8 = ap_return_8_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_8 = add_ln703_106_fu_4994_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_9 = ap_return_9_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_9 = add_ln703_107_fu_5000_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_428_ce = 1'b1;
    end else begin
        grp_fu_428_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_430_ce = 1'b1;
    end else begin
        grp_fu_430_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_431_ce = 1'b1;
    end else begin
        grp_fu_431_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_432_ce = 1'b1;
    end else begin
        grp_fu_432_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_433_ce = 1'b1;
    end else begin
        grp_fu_433_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_435_ce = 1'b1;
    end else begin
        grp_fu_435_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_436_ce = 1'b1;
    end else begin
        grp_fu_436_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_437_ce = 1'b1;
    end else begin
        grp_fu_437_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_438_ce = 1'b1;
    end else begin
        grp_fu_438_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_439_ce = 1'b1;
    end else begin
        grp_fu_439_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_440_ce = 1'b1;
    end else begin
        grp_fu_440_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_441_ce = 1'b1;
    end else begin
        grp_fu_441_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_442_ce = 1'b1;
    end else begin
        grp_fu_442_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_443_ce = 1'b1;
    end else begin
        grp_fu_443_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_444_ce = 1'b1;
    end else begin
        grp_fu_444_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_445_ce = 1'b1;
    end else begin
        grp_fu_445_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_446_ce = 1'b1;
    end else begin
        grp_fu_446_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_447_ce = 1'b1;
    end else begin
        grp_fu_447_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_448_ce = 1'b1;
    end else begin
        grp_fu_448_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_449_ce = 1'b1;
    end else begin
        grp_fu_449_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_451_ce = 1'b1;
    end else begin
        grp_fu_451_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_452_ce = 1'b1;
    end else begin
        grp_fu_452_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_453_ce = 1'b1;
    end else begin
        grp_fu_453_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_454_ce = 1'b1;
    end else begin
        grp_fu_454_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_455_ce = 1'b1;
    end else begin
        grp_fu_455_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_456_ce = 1'b1;
    end else begin
        grp_fu_456_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_457_ce = 1'b1;
    end else begin
        grp_fu_457_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_458_ce = 1'b1;
    end else begin
        grp_fu_458_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_459_ce = 1'b1;
    end else begin
        grp_fu_459_ce = 1'b0;
    end
end

assign add_ln1118_1_fu_4562_p2 = ((sext_ln1118_29_fu_4558_p1) + (sext_ln1118_28_fu_4546_p1));

assign add_ln1118_2_fu_4602_p2 = ((sext_ln1118_31_fu_4598_p1) + (sext_ln1118_30_fu_4586_p1));

assign add_ln1118_fu_4502_p2 = ((sext_ln1118_23_fu_4498_p1) + (sext_ln1118_22_fu_4486_p1));

assign add_ln703_100_fu_4944_p2 = ((sext_ln708_2_fu_4941_p1) + (16'd176));

assign add_ln703_101_fu_4953_p2 = ((sext_ln708_3_fu_4950_p1) + (16'd64535));

assign add_ln703_102_fu_4962_p2 = ((sext_ln708_4_fu_4959_p1) + (16'd65060));

assign add_ln703_103_fu_4971_p2 = ((sext_ln708_5_fu_4968_p1) + (16'd65037));

assign add_ln703_104_fu_4977_p2 = (trunc_ln708_6_reg_5569 + 16'd1387);

assign add_ln703_105_fu_4985_p2 = ((sext_ln708_6_fu_4982_p1) + (16'd179));

assign add_ln703_106_fu_4994_p2 = ((sext_ln708_7_fu_4991_p1) + (16'd65351));

assign add_ln703_107_fu_5000_p2 = ((trunc_ln708_9_reg_5584) + (16'd64930));

assign add_ln703_108_fu_5008_p2 = ((sext_ln708_8_fu_5005_p1) + (16'd725));

assign add_ln703_109_fu_5014_p2 = ((trunc_ln708_11_reg_5594) + (16'd65311));

assign add_ln703_110_fu_5022_p2 = ((sext_ln708_9_fu_5019_p1) + (16'd419));

assign add_ln703_111_fu_5031_p2 = ((sext_ln708_10_fu_5028_p1) + (16'd64983));

assign add_ln703_112_fu_5040_p2 = ((sext_ln708_11_fu_5037_p1) + (16'd25));

assign add_ln703_113_fu_5049_p2 = ((sext_ln708_12_fu_5046_p1) + (16'd346));

assign add_ln703_114_fu_5055_p2 = (trunc_ln708_16_reg_5619 + 16'd474);

assign add_ln703_115_fu_5060_p2 = ((trunc_ln708_17_reg_5624) + (16'd64364));

assign add_ln703_116_fu_5068_p2 = ((sext_ln708_13_fu_5065_p1) + (16'd65227));

assign add_ln703_117_fu_5074_p2 = (trunc_ln708_19_reg_5634 + 16'd881);

assign add_ln703_118_fu_5082_p2 = ((sext_ln708_14_fu_5079_p1) + (16'd511));

assign add_ln703_119_fu_5091_p2 = ((sext_ln708_15_fu_5088_p1) + (16'd64887));

assign add_ln703_120_fu_5100_p2 = ((sext_ln708_16_fu_5097_p1) + (16'd65275));

assign add_ln703_121_fu_5109_p2 = ((sext_ln708_17_fu_5106_p1) + (16'd664));

assign add_ln703_122_fu_5118_p2 = ((sext_ln708_18_fu_5115_p1) + (16'd513));

assign add_ln703_123_fu_5127_p2 = ((sext_ln708_19_fu_5124_p1) + (16'd833));

assign add_ln703_124_fu_5136_p2 = ((sext_ln708_20_fu_5133_p1) + (16'd332));

assign add_ln703_125_fu_5145_p2 = ((sext_ln708_21_fu_5142_p1) + (16'd65271));

assign add_ln703_126_fu_5154_p2 = ((sext_ln703_fu_5151_p1) + (15'd32312));

assign add_ln703_127_fu_5167_p2 = ((sext_ln708_22_fu_5164_p1) + (16'd423));

assign add_ln703_128_fu_5176_p2 = ((sext_ln708_23_fu_5173_p1) + (16'd399));

assign add_ln703_129_fu_5182_p2 = ((trunc_ln708_31_reg_5679) + (16'd65410));

assign add_ln703_99_fu_4935_p2 = ((sext_ln708_1_fu_4932_p1) + (16'd64428));

assign add_ln703_fu_4926_p2 = ((sext_ln708_fu_4923_p1) + (16'd316));

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign grp_fu_428_p1 = 25'd183;

assign grp_fu_430_p1 = 25'd161;

assign grp_fu_431_p1 = 25'd206;

assign grp_fu_432_p1 = 25'd215;

assign grp_fu_433_p1 = 25'd189;

assign grp_fu_435_p1 = 25'd199;

assign grp_fu_436_p1 = 25'd185;

assign grp_fu_437_p1 = 26'd356;

assign grp_fu_438_p1 = 26'd338;

assign grp_fu_439_p1 = 26'd308;

assign grp_fu_440_p1 = 26'd394;

assign grp_fu_441_p1 = 25'd239;

assign grp_fu_442_p1 = 25'd222;

assign grp_fu_443_p1 = 25'd142;

assign grp_fu_444_p1 = 25'd239;

assign grp_fu_445_p1 = 26'd310;

assign grp_fu_446_p1 = 25'd231;

assign grp_fu_447_p1 = 25'd134;

assign grp_fu_448_p1 = 25'd225;

assign grp_fu_449_p1 = 25'd209;

assign grp_fu_451_p1 = 25'd140;

assign grp_fu_452_p1 = 25'd228;

assign grp_fu_453_p1 = 26'd380;

assign grp_fu_454_p1 = 25'd145;

assign grp_fu_455_p1 = 26'd393;

assign grp_fu_456_p1 = 25'd241;

assign grp_fu_457_p1 = 25'd169;

assign grp_fu_458_p1 = 25'd241;

assign grp_fu_459_p1 = 25'd233;

assign sext_ln1118_22_fu_4486_p0 = data_22_V_read_int_reg;

assign sext_ln1118_22_fu_4486_p1 = sext_ln1118_22_fu_4486_p0;

assign sext_ln1118_23_fu_4498_p1 = (shl_ln_fu_4490_p3);

assign sext_ln1118_28_fu_4546_p1 = (shl_ln1118_1_fu_4538_p3);

assign sext_ln1118_29_fu_4558_p1 = (shl_ln1118_2_fu_4550_p3);

assign sext_ln1118_30_fu_4586_p1 = (shl_ln1118_3_fu_4578_p3);

assign sext_ln1118_31_fu_4598_p1 = (shl_ln1118_4_fu_4590_p3);

assign sext_ln703_3_fu_5160_p1 = (add_ln703_126_fu_5154_p2);

assign sext_ln703_fu_5151_p1 = (tmp_386_reg_5519_pp0_iter1_reg);

assign sext_ln708_10_fu_5028_p1 = (trunc_ln708_13_reg_5604);

assign sext_ln708_11_fu_5037_p1 = (trunc_ln708_14_reg_5609);

assign sext_ln708_12_fu_5046_p1 = (trunc_ln708_15_reg_5614);

assign sext_ln708_13_fu_5065_p1 = (trunc_ln708_18_reg_5629);

assign sext_ln708_14_fu_5079_p1 = (trunc_ln708_20_reg_5639);

assign sext_ln708_15_fu_5088_p1 = (trunc_ln708_21_reg_5644);

assign sext_ln708_16_fu_5097_p1 = (trunc_ln708_22_reg_5489_pp0_iter1_reg);

assign sext_ln708_17_fu_5106_p1 = (trunc_ln708_23_reg_5649);

assign sext_ln708_18_fu_5115_p1 = (trunc_ln708_24_reg_5654);

assign sext_ln708_19_fu_5124_p1 = (trunc_ln708_25_reg_5659);

assign sext_ln708_1_fu_4932_p1 = (trunc_ln708_1_reg_5544);

assign sext_ln708_20_fu_5133_p1 = (trunc_ln708_26_reg_5664);

assign sext_ln708_21_fu_5142_p1 = (trunc_ln708_27_reg_5514_pp0_iter1_reg);

assign sext_ln708_22_fu_5164_p1 = (trunc_ln708_29_reg_5669);

assign sext_ln708_23_fu_5173_p1 = (trunc_ln708_30_reg_5674);

assign sext_ln708_2_fu_4941_p1 = (trunc_ln708_2_reg_5549);

assign sext_ln708_3_fu_4950_p1 = (trunc_ln708_3_reg_5554);

assign sext_ln708_4_fu_4959_p1 = (trunc_ln708_4_reg_5559);

assign sext_ln708_5_fu_4968_p1 = (trunc_ln708_5_reg_5564);

assign sext_ln708_6_fu_4982_p1 = (trunc_ln708_7_reg_5574);

assign sext_ln708_7_fu_4991_p1 = (trunc_ln708_8_reg_5579);

assign sext_ln708_8_fu_5005_p1 = (trunc_ln708_10_reg_5589);

assign sext_ln708_9_fu_5019_p1 = (trunc_ln708_12_reg_5599);

assign sext_ln708_fu_4923_p1 = (trunc_ln_reg_5539);

assign shl_ln1118_1_fu_4538_p3 = {{data_27_V_read_int_reg}, {8'd0}};

assign shl_ln1118_2_fu_4550_p3 = {{data_27_V_read_int_reg}, {6'd0}};

assign shl_ln1118_3_fu_4578_p3 = {{data_28_V_read_int_reg}, {7'd0}};

assign shl_ln1118_4_fu_4590_p3 = {{data_28_V_read_int_reg}, {5'd0}};

assign shl_ln_fu_4490_p1 = data_22_V_read_int_reg;

assign shl_ln_fu_4490_p3 = {{shl_ln_fu_4490_p1}, {8'd0}};

endmodule //normalize_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_s
module myproject_mul_16s_10ns_26_2_0(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



myproject_mul_16s_10ns_26_2_0_MulnS_4 myproject_mul_16s_10ns_26_2_0_MulnS_4_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
module myproject_mul_16s_10ns_26_2_0_MulnS_4(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [10 - 1 : 0] b;
output[26 - 1 : 0] p;
reg  [26 - 1 : 0] p;
wire  [26 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule

module myproject_mul_16s_9ns_25_2_0(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



myproject_mul_16s_9ns_25_2_0_MulnS_3 myproject_mul_16s_9ns_25_2_0_MulnS_3_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
module myproject_mul_16s_9ns_25_2_0_MulnS_3(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [9 - 1 : 0] b;
output[25 - 1 : 0] p;
reg  [25 - 1 : 0] p;
wire  [25 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule



