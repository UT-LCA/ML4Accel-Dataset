
module normalize_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_2 (
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
reg   [14:0] trunc_ln708_13_reg_5613;
reg   [14:0] trunc_ln708_13_reg_5613_pp0_iter1_reg;
reg   [13:0] tmp_385_reg_5703;
reg   [14:0] trunc_ln708_s_reg_5708;
reg   [15:0] trunc_ln708_4_reg_5713;
reg   [14:0] trunc_ln708_5_reg_5718;
reg   [15:0] trunc_ln708_6_reg_5723;
reg   [15:0] trunc_ln708_7_reg_5728;
reg   [14:0] trunc_ln708_8_reg_5733;
reg   [14:0] trunc_ln708_9_reg_5738;
reg   [15:0] trunc_ln708_1_reg_5743;
reg   [15:0] trunc_ln708_2_reg_5748;
reg   [15:0] trunc_ln708_3_reg_5753;
reg   [15:0] trunc_ln708_10_reg_5758;
reg   [15:0] trunc_ln708_11_reg_5763;
reg   [15:0] trunc_ln708_12_reg_5768;
reg   [15:0] trunc_ln708_14_reg_5773;
reg   [14:0] trunc_ln708_15_reg_5778;
reg   [14:0] trunc_ln708_16_reg_5783;
reg   [15:0] trunc_ln708_17_reg_5788;
reg   [14:0] trunc_ln708_18_reg_5793;
reg   [15:0] trunc_ln708_19_reg_5798;
reg   [15:0] trunc_ln708_20_reg_5803;
reg   [15:0] trunc_ln708_21_reg_5808;
reg   [15:0] trunc_ln708_22_reg_5813;
reg   [15:0] trunc_ln708_23_reg_5818;
reg   [15:0] trunc_ln708_24_reg_5823;
reg   [15:0] trunc_ln708_25_reg_5828;
reg   [15:0] trunc_ln708_26_reg_5833;
reg   [15:0] trunc_ln708_27_reg_5838;
reg   [15:0] trunc_ln708_28_reg_5843;
reg   [15:0] trunc_ln708_29_reg_5848;
reg   [14:0] trunc_ln708_30_reg_5853;
wire   [9:0] grp_fu_424_p1;
wire    ap_block_pp0_stage0;
wire   [9:0] grp_fu_425_p1;
wire   [8:0] grp_fu_426_p1;
wire   [8:0] grp_fu_427_p1;
wire   [9:0] grp_fu_428_p1;
wire   [9:0] grp_fu_429_p1;
wire   [8:0] grp_fu_430_p1;
wire   [9:0] grp_fu_431_p1;
wire   [8:0] grp_fu_432_p1;
wire   [8:0] grp_fu_433_p1;
wire   [9:0] grp_fu_435_p1;
wire   [7:0] grp_fu_436_p1;
wire   [9:0] grp_fu_437_p1;
wire   [8:0] grp_fu_438_p1;
wire   [8:0] grp_fu_439_p1;
wire   [9:0] grp_fu_440_p1;
wire   [9:0] grp_fu_441_p1;
wire   [9:0] grp_fu_442_p1;
wire   [9:0] grp_fu_443_p1;
wire   [10:0] grp_fu_444_p1;
wire   [8:0] grp_fu_445_p1;
wire   [10:0] grp_fu_446_p1;
wire   [9:0] grp_fu_447_p1;
wire   [9:0] grp_fu_448_p1;
wire   [10:0] grp_fu_449_p1;
wire   [9:0] grp_fu_450_p1;
wire   [9:0] grp_fu_451_p1;
wire   [9:0] grp_fu_452_p1;
wire   [9:0] grp_fu_453_p1;
wire   [9:0] grp_fu_454_p1;
wire   [9:0] grp_fu_455_p1;
wire   [23:0] shl_ln_fu_4712_p3;
wire   [16:0] shl_ln1118_9_fu_4724_p3;
wire   [24:0] sext_ln1118_17_fu_4720_p1;
wire   [24:0] sext_ln1118_18_fu_4732_p1;
wire   [24:0] sub_ln1118_fu_4736_p2;
wire   [23:0] grp_fu_436_p2;
wire   [24:0] grp_fu_426_p2;
wire   [25:0] grp_fu_435_p2;
wire   [24:0] grp_fu_439_p2;
wire   [25:0] grp_fu_440_p2;
wire   [25:0] grp_fu_449_p2;
wire   [24:0] grp_fu_432_p2;
wire   [24:0] grp_fu_430_p2;
wire   [25:0] grp_fu_441_p2;
wire   [25:0] grp_fu_451_p2;
wire   [25:0] grp_fu_425_p2;
wire   [25:0] grp_fu_450_p2;
wire   [25:0] grp_fu_428_p2;
wire   [25:0] grp_fu_442_p2;
wire   [25:0] grp_fu_446_p2;
wire   [24:0] grp_fu_427_p2;
wire   [24:0] grp_fu_445_p2;
wire   [25:0] grp_fu_424_p2;
wire   [24:0] grp_fu_438_p2;
wire   [25:0] grp_fu_453_p2;
wire   [25:0] grp_fu_431_p2;
wire   [25:0] grp_fu_429_p2;
wire   [25:0] grp_fu_455_p2;
wire   [25:0] grp_fu_444_p2;
wire   [25:0] grp_fu_448_p2;
wire   [25:0] grp_fu_443_p2;
wire   [25:0] grp_fu_452_p2;
wire   [25:0] grp_fu_437_p2;
wire   [25:0] grp_fu_447_p2;
wire   [25:0] grp_fu_454_p2;
wire   [24:0] grp_fu_433_p2;
wire   [14:0] sext_ln703_fu_5147_p1;
wire   [14:0] add_ln703_fu_5150_p2;
wire   [15:0] sext_ln708_fu_5160_p1;
wire   [15:0] sext_ln708_4_fu_5174_p1;
wire   [15:0] sext_ln708_5_fu_5193_p1;
wire   [15:0] sext_ln708_6_fu_5202_p1;
wire   [15:0] sext_ln708_7_fu_5241_p1;
wire   [15:0] sext_ln708_8_fu_5255_p1;
wire   [15:0] sext_ln708_9_fu_5264_p1;
wire   [15:0] sext_ln708_10_fu_5278_p1;
wire   [15:0] sext_ln708_11_fu_5342_p1;
wire   [15:0] sext_ln703_2_fu_5156_p1;
wire   [15:0] add_ln703_5_fu_5163_p2;
wire   [15:0] add_ln703_6_fu_5169_p2;
wire   [15:0] add_ln703_7_fu_5177_p2;
wire   [15:0] add_ln703_8_fu_5183_p2;
wire   [15:0] add_ln703_9_fu_5188_p2;
wire   [15:0] add_ln703_10_fu_5196_p2;
wire   [15:0] add_ln703_11_fu_5205_p2;
wire   [15:0] add_ln703_12_fu_5211_p2;
wire   [15:0] add_ln703_13_fu_5216_p2;
wire   [15:0] add_ln703_14_fu_5221_p2;
wire   [15:0] add_ln703_15_fu_5226_p2;
wire   [15:0] add_ln703_16_fu_5231_p2;
wire   [15:0] add_ln703_17_fu_5236_p2;
wire   [15:0] add_ln703_18_fu_5244_p2;
wire   [15:0] add_ln703_19_fu_5250_p2;
wire   [15:0] add_ln703_20_fu_5258_p2;
wire   [15:0] add_ln703_21_fu_5267_p2;
wire   [15:0] add_ln703_22_fu_5273_p2;
wire   [15:0] add_ln703_23_fu_5281_p2;
wire   [15:0] add_ln703_24_fu_5287_p2;
wire   [15:0] add_ln703_25_fu_5292_p2;
wire   [15:0] add_ln703_26_fu_5297_p2;
wire   [15:0] add_ln703_27_fu_5302_p2;
wire   [15:0] add_ln703_28_fu_5307_p2;
wire   [15:0] add_ln703_29_fu_5312_p2;
wire   [15:0] add_ln703_30_fu_5317_p2;
wire   [15:0] add_ln703_31_fu_5322_p2;
wire   [15:0] add_ln703_32_fu_5327_p2;
wire   [15:0] add_ln703_33_fu_5332_p2;
wire   [15:0] add_ln703_34_fu_5337_p2;
wire   [15:0] add_ln703_35_fu_5345_p2;
reg    grp_fu_424_ce;
reg    grp_fu_425_ce;
reg    grp_fu_426_ce;
reg    grp_fu_427_ce;
reg    grp_fu_428_ce;
reg    grp_fu_429_ce;
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
reg    grp_fu_450_ce;
reg    grp_fu_451_ce;
reg    grp_fu_452_ce;
reg    grp_fu_453_ce;
reg    grp_fu_454_ce;
reg    grp_fu_455_ce;
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

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U385(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_18_V_read_int_reg),
    .din1(grp_fu_424_p1),
    .ce(grp_fu_424_ce),
    .dout(grp_fu_424_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U386(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_10_V_read_int_reg),
    .din1(grp_fu_425_p1),
    .ce(grp_fu_425_ce),
    .dout(grp_fu_425_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U387(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_1_V_read_int_reg),
    .din1(grp_fu_426_p1),
    .ce(grp_fu_426_ce),
    .dout(grp_fu_426_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U388(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_16_V_read_int_reg),
    .din1(grp_fu_427_p1),
    .ce(grp_fu_427_ce),
    .dout(grp_fu_427_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U389(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_12_V_read_int_reg),
    .din1(grp_fu_428_p1),
    .ce(grp_fu_428_ce),
    .dout(grp_fu_428_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U390(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_22_V_read_int_reg),
    .din1(grp_fu_429_p1),
    .ce(grp_fu_429_ce),
    .dout(grp_fu_429_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U391(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_7_V_read_int_reg),
    .din1(grp_fu_430_p1),
    .ce(grp_fu_430_ce),
    .dout(grp_fu_430_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U392(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_21_V_read_int_reg),
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
myproject_mul_16s_9ns_25_2_0_U393(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_6_V_read_int_reg),
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
myproject_mul_16s_9ns_25_2_0_U394(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_31_V_read_int_reg),
    .din1(grp_fu_433_p1),
    .ce(grp_fu_433_ce),
    .dout(grp_fu_433_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U395(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_2_V_read_int_reg),
    .din1(grp_fu_435_p1),
    .ce(grp_fu_435_ce),
    .dout(grp_fu_435_p2)
);

myproject_mul_16s_8ns_24_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 24 ))
myproject_mul_16s_8ns_24_2_0_U396(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_0_V_read_int_reg),
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
myproject_mul_16s_10ns_26_2_0_U397(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_28_V_read_int_reg),
    .din1(grp_fu_437_p1),
    .ce(grp_fu_437_ce),
    .dout(grp_fu_437_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U398(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_19_V_read_int_reg),
    .din1(grp_fu_438_p1),
    .ce(grp_fu_438_ce),
    .dout(grp_fu_438_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U399(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_3_V_read_int_reg),
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
myproject_mul_16s_10ns_26_2_0_U400(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_4_V_read_int_reg),
    .din1(grp_fu_440_p1),
    .ce(grp_fu_440_ce),
    .dout(grp_fu_440_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U401(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_8_V_read_int_reg),
    .din1(grp_fu_441_p1),
    .ce(grp_fu_441_ce),
    .dout(grp_fu_441_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U402(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_13_V_read_int_reg),
    .din1(grp_fu_442_p1),
    .ce(grp_fu_442_ce),
    .dout(grp_fu_442_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U403(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_26_V_read_int_reg),
    .din1(grp_fu_443_p1),
    .ce(grp_fu_443_ce),
    .dout(grp_fu_443_p2)
);

myproject_mul_16s_11ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 11 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_11ns_26_2_0_U404(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_24_V_read_int_reg),
    .din1(grp_fu_444_p1),
    .ce(grp_fu_444_ce),
    .dout(grp_fu_444_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U405(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_17_V_read_int_reg),
    .din1(grp_fu_445_p1),
    .ce(grp_fu_445_ce),
    .dout(grp_fu_445_p2)
);

myproject_mul_16s_11ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 11 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_11ns_26_2_0_U406(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_15_V_read_int_reg),
    .din1(grp_fu_446_p1),
    .ce(grp_fu_446_ce),
    .dout(grp_fu_446_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U407(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_29_V_read_int_reg),
    .din1(grp_fu_447_p1),
    .ce(grp_fu_447_ce),
    .dout(grp_fu_447_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U408(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_25_V_read_int_reg),
    .din1(grp_fu_448_p1),
    .ce(grp_fu_448_ce),
    .dout(grp_fu_448_p2)
);

myproject_mul_16s_11ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 11 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_11ns_26_2_0_U409(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_5_V_read_int_reg),
    .din1(grp_fu_449_p1),
    .ce(grp_fu_449_ce),
    .dout(grp_fu_449_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U410(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_11_V_read_int_reg),
    .din1(grp_fu_450_p1),
    .ce(grp_fu_450_ce),
    .dout(grp_fu_450_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U411(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_9_V_read_int_reg),
    .din1(grp_fu_451_p1),
    .ce(grp_fu_451_ce),
    .dout(grp_fu_451_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U412(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_27_V_read_int_reg),
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
myproject_mul_16s_10ns_26_2_0_U413(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_20_V_read_int_reg),
    .din1(grp_fu_453_p1),
    .ce(grp_fu_453_ce),
    .dout(grp_fu_453_p2)
);

myproject_mul_16s_10ns_26_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 10 ),
    .dout_WIDTH( 26 ))
myproject_mul_16s_10ns_26_2_0_U414(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_30_V_read_int_reg),
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
myproject_mul_16s_10ns_26_2_0_U415(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_23_V_read_int_reg),
    .din1(grp_fu_455_p1),
    .ce(grp_fu_455_ce),
    .dout(grp_fu_455_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_0_int_reg <= sext_ln703_2_fu_5156_p1;
        ap_return_10_int_reg <= add_ln703_14_fu_5221_p2;
        ap_return_11_int_reg <= add_ln703_15_fu_5226_p2;
        ap_return_12_int_reg <= add_ln703_16_fu_5231_p2;
        ap_return_13_int_reg <= add_ln703_17_fu_5236_p2;
        ap_return_14_int_reg <= add_ln703_18_fu_5244_p2;
        ap_return_15_int_reg <= add_ln703_19_fu_5250_p2;
        ap_return_16_int_reg <= add_ln703_20_fu_5258_p2;
        ap_return_17_int_reg <= add_ln703_21_fu_5267_p2;
        ap_return_18_int_reg <= add_ln703_22_fu_5273_p2;
        ap_return_19_int_reg <= add_ln703_23_fu_5281_p2;
        ap_return_1_int_reg <= add_ln703_5_fu_5163_p2;
        ap_return_20_int_reg <= add_ln703_24_fu_5287_p2;
        ap_return_21_int_reg <= add_ln703_25_fu_5292_p2;
        ap_return_22_int_reg <= add_ln703_26_fu_5297_p2;
        ap_return_23_int_reg <= add_ln703_27_fu_5302_p2;
        ap_return_24_int_reg <= add_ln703_28_fu_5307_p2;
        ap_return_25_int_reg <= add_ln703_29_fu_5312_p2;
        ap_return_26_int_reg <= add_ln703_30_fu_5317_p2;
        ap_return_27_int_reg <= add_ln703_31_fu_5322_p2;
        ap_return_28_int_reg <= add_ln703_32_fu_5327_p2;
        ap_return_29_int_reg <= add_ln703_33_fu_5332_p2;
        ap_return_2_int_reg <= add_ln703_6_fu_5169_p2;
        ap_return_30_int_reg <= add_ln703_34_fu_5337_p2;
        ap_return_31_int_reg <= add_ln703_35_fu_5345_p2;
        ap_return_3_int_reg <= add_ln703_7_fu_5177_p2;
        ap_return_4_int_reg <= add_ln703_8_fu_5183_p2;
        ap_return_5_int_reg <= add_ln703_9_fu_5188_p2;
        ap_return_6_int_reg <= add_ln703_10_fu_5196_p2;
        ap_return_7_int_reg <= add_ln703_11_fu_5205_p2;
        ap_return_8_int_reg <= add_ln703_12_fu_5211_p2;
        ap_return_9_int_reg <= add_ln703_13_fu_5216_p2;
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
        tmp_385_reg_5703 <= {{grp_fu_436_p2[23:10]}};
        trunc_ln708_10_reg_5758 <= {{grp_fu_450_p2[25:10]}};
        trunc_ln708_11_reg_5763 <= {{grp_fu_428_p2[25:10]}};
        trunc_ln708_12_reg_5768 <= {{grp_fu_442_p2[25:10]}};
        trunc_ln708_13_reg_5613 <= {{sub_ln1118_fu_4736_p2[24:10]}};
        trunc_ln708_13_reg_5613_pp0_iter1_reg <= trunc_ln708_13_reg_5613;
        trunc_ln708_14_reg_5773 <= {{grp_fu_446_p2[25:10]}};
        trunc_ln708_15_reg_5778 <= {{grp_fu_427_p2[24:10]}};
        trunc_ln708_16_reg_5783 <= {{grp_fu_445_p2[24:10]}};
        trunc_ln708_17_reg_5788 <= {{grp_fu_424_p2[25:10]}};
        trunc_ln708_18_reg_5793 <= {{grp_fu_438_p2[24:10]}};
        trunc_ln708_19_reg_5798 <= {{grp_fu_453_p2[25:10]}};
        trunc_ln708_1_reg_5743 <= {{grp_fu_441_p2[25:10]}};
        trunc_ln708_20_reg_5803 <= {{grp_fu_431_p2[25:10]}};
        trunc_ln708_21_reg_5808 <= {{grp_fu_429_p2[25:10]}};
        trunc_ln708_22_reg_5813 <= {{grp_fu_455_p2[25:10]}};
        trunc_ln708_23_reg_5818 <= {{grp_fu_444_p2[25:10]}};
        trunc_ln708_24_reg_5823 <= {{grp_fu_448_p2[25:10]}};
        trunc_ln708_25_reg_5828 <= {{grp_fu_443_p2[25:10]}};
        trunc_ln708_26_reg_5833 <= {{grp_fu_452_p2[25:10]}};
        trunc_ln708_27_reg_5838 <= {{grp_fu_437_p2[25:10]}};
        trunc_ln708_28_reg_5843 <= {{grp_fu_447_p2[25:10]}};
        trunc_ln708_29_reg_5848 <= {{grp_fu_454_p2[25:10]}};
        trunc_ln708_2_reg_5748 <= {{grp_fu_451_p2[25:10]}};
        trunc_ln708_30_reg_5853 <= {{grp_fu_433_p2[24:10]}};
        trunc_ln708_3_reg_5753 <= {{grp_fu_425_p2[25:10]}};
        trunc_ln708_4_reg_5713 <= {{grp_fu_435_p2[25:10]}};
        trunc_ln708_5_reg_5718 <= {{grp_fu_439_p2[24:10]}};
        trunc_ln708_6_reg_5723 <= {{grp_fu_440_p2[25:10]}};
        trunc_ln708_7_reg_5728 <= {{grp_fu_449_p2[25:10]}};
        trunc_ln708_8_reg_5733 <= {{grp_fu_432_p2[24:10]}};
        trunc_ln708_9_reg_5738 <= {{grp_fu_430_p2[24:10]}};
        trunc_ln708_s_reg_5708 <= {{grp_fu_426_p2[24:10]}};
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_0 = ap_return_0_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_0 = sext_ln703_2_fu_5156_p1;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_1 = ap_return_1_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_1 = add_ln703_5_fu_5163_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_10 = ap_return_10_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_10 = add_ln703_14_fu_5221_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_11 = ap_return_11_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_11 = add_ln703_15_fu_5226_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_12 = ap_return_12_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_12 = add_ln703_16_fu_5231_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_13 = ap_return_13_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_13 = add_ln703_17_fu_5236_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_14 = ap_return_14_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_14 = add_ln703_18_fu_5244_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_15 = ap_return_15_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_15 = add_ln703_19_fu_5250_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_16 = ap_return_16_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_16 = add_ln703_20_fu_5258_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_17 = ap_return_17_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_17 = add_ln703_21_fu_5267_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_18 = ap_return_18_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_18 = add_ln703_22_fu_5273_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_19 = ap_return_19_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_19 = add_ln703_23_fu_5281_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_2 = ap_return_2_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_2 = add_ln703_6_fu_5169_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_20 = ap_return_20_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_20 = add_ln703_24_fu_5287_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_21 = ap_return_21_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_21 = add_ln703_25_fu_5292_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_22 = ap_return_22_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_22 = add_ln703_26_fu_5297_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_23 = ap_return_23_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_23 = add_ln703_27_fu_5302_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_24 = ap_return_24_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_24 = add_ln703_28_fu_5307_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_25 = ap_return_25_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_25 = add_ln703_29_fu_5312_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_26 = ap_return_26_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_26 = add_ln703_30_fu_5317_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_27 = ap_return_27_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_27 = add_ln703_31_fu_5322_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_28 = ap_return_28_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_28 = add_ln703_32_fu_5327_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_29 = ap_return_29_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_29 = add_ln703_33_fu_5332_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_3 = ap_return_3_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_3 = add_ln703_7_fu_5177_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_30 = ap_return_30_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_30 = add_ln703_34_fu_5337_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_31 = ap_return_31_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_31 = add_ln703_35_fu_5345_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_4 = ap_return_4_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_4 = add_ln703_8_fu_5183_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_5 = ap_return_5_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_5 = add_ln703_9_fu_5188_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_6 = ap_return_6_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_6 = add_ln703_10_fu_5196_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_7 = ap_return_7_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_7 = add_ln703_11_fu_5205_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_8 = ap_return_8_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_8 = add_ln703_12_fu_5211_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_9 = ap_return_9_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_9 = add_ln703_13_fu_5216_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_424_ce = 1'b1;
    end else begin
        grp_fu_424_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_425_ce = 1'b1;
    end else begin
        grp_fu_425_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_426_ce = 1'b1;
    end else begin
        grp_fu_426_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_427_ce = 1'b1;
    end else begin
        grp_fu_427_ce = 1'b0;
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
        grp_fu_429_ce = 1'b1;
    end else begin
        grp_fu_429_ce = 1'b0;
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
        grp_fu_450_ce = 1'b1;
    end else begin
        grp_fu_450_ce = 1'b0;
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

assign add_ln703_10_fu_5196_p2 = ((sext_ln708_5_fu_5193_p1) + (16'd446));

assign add_ln703_11_fu_5205_p2 = ((sext_ln708_6_fu_5202_p1) + (16'd597));

assign add_ln703_12_fu_5211_p2 = (trunc_ln708_1_reg_5743 + 16'd408);

assign add_ln703_13_fu_5216_p2 = (trunc_ln708_2_reg_5748 + 16'd634);

assign add_ln703_14_fu_5221_p2 = ((trunc_ln708_3_reg_5753) + (16'd65224));

assign add_ln703_15_fu_5226_p2 = (trunc_ln708_10_reg_5758 + 16'd1821);

assign add_ln703_16_fu_5231_p2 = ((trunc_ln708_11_reg_5763) + (16'd64651));

assign add_ln703_17_fu_5236_p2 = (trunc_ln708_12_reg_5768 + 16'd672);

assign add_ln703_18_fu_5244_p2 = ((sext_ln708_7_fu_5241_p1) + (16'd445));

assign add_ln703_19_fu_5250_p2 = (trunc_ln708_14_reg_5773 + 16'd15);

assign add_ln703_20_fu_5258_p2 = ((sext_ln708_8_fu_5255_p1) + (16'd64909));

assign add_ln703_21_fu_5267_p2 = ((sext_ln708_9_fu_5264_p1) + (16'd65100));

assign add_ln703_22_fu_5273_p2 = ((trunc_ln708_17_reg_5788) + (16'd64899));

assign add_ln703_23_fu_5281_p2 = ((sext_ln708_10_fu_5278_p1) + (16'd439));

assign add_ln703_24_fu_5287_p2 = ((trunc_ln708_19_reg_5798) + (16'd64895));

assign add_ln703_25_fu_5292_p2 = (trunc_ln708_20_reg_5803 + 16'd379);

assign add_ln703_26_fu_5297_p2 = ((trunc_ln708_21_reg_5808) + (16'd65532));

assign add_ln703_27_fu_5302_p2 = ((trunc_ln708_22_reg_5813) + (16'd65400));

assign add_ln703_28_fu_5307_p2 = (trunc_ln708_23_reg_5818 + 16'd622);

assign add_ln703_29_fu_5312_p2 = (trunc_ln708_24_reg_5823 + 16'd15);

assign add_ln703_30_fu_5317_p2 = ((trunc_ln708_25_reg_5828) + (16'd65459));

assign add_ln703_31_fu_5322_p2 = (trunc_ln708_26_reg_5833 + 16'd416);

assign add_ln703_32_fu_5327_p2 = (trunc_ln708_27_reg_5838 + 16'd31);

assign add_ln703_33_fu_5332_p2 = ((trunc_ln708_28_reg_5843) + (16'd65502));

assign add_ln703_34_fu_5337_p2 = ((trunc_ln708_29_reg_5848) + (16'd64870));

assign add_ln703_35_fu_5345_p2 = ((sext_ln708_11_fu_5342_p1) + (16'd288));

assign add_ln703_5_fu_5163_p2 = ((sext_ln708_fu_5160_p1) + (16'd65252));

assign add_ln703_6_fu_5169_p2 = (trunc_ln708_4_reg_5713 + 16'd617);

assign add_ln703_7_fu_5177_p2 = ((sext_ln708_4_fu_5174_p1) + (16'd129));

assign add_ln703_8_fu_5183_p2 = ((trunc_ln708_6_reg_5723) + (16'd64666));

assign add_ln703_9_fu_5188_p2 = ((trunc_ln708_7_reg_5728) + (16'd65475));

assign add_ln703_fu_5150_p2 = ((sext_ln703_fu_5147_p1) + (15'd32383));

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign grp_fu_424_p1 = 26'd421;

assign grp_fu_425_p1 = 26'd353;

assign grp_fu_426_p1 = 25'd197;

assign grp_fu_427_p1 = 25'd198;

assign grp_fu_428_p1 = 26'd365;

assign grp_fu_429_p1 = 26'd359;

assign grp_fu_430_p1 = 25'd194;

assign grp_fu_431_p1 = 26'd358;

assign grp_fu_432_p1 = 25'd198;

assign grp_fu_433_p1 = 25'd253;

assign grp_fu_435_p1 = 26'd316;

assign grp_fu_436_p1 = 24'd125;

assign grp_fu_437_p1 = 26'd453;

assign grp_fu_438_p1 = 25'd233;

assign grp_fu_439_p1 = 25'd220;

assign grp_fu_440_p1 = 26'd341;

assign grp_fu_441_p1 = 26'd294;

assign grp_fu_442_p1 = 26'd310;

assign grp_fu_443_p1 = 26'd280;

assign grp_fu_444_p1 = 26'd617;

assign grp_fu_445_p1 = 25'd241;

assign grp_fu_446_p1 = 26'd618;

assign grp_fu_447_p1 = 26'd319;

assign grp_fu_448_p1 = 26'd385;

assign grp_fu_449_p1 = 26'd616;

assign grp_fu_450_p1 = 26'd486;

assign grp_fu_451_p1 = 26'd447;

assign grp_fu_452_p1 = 26'd324;

assign grp_fu_453_p1 = 26'd484;

assign grp_fu_454_p1 = 26'd487;

assign grp_fu_455_p1 = 26'd485;

assign sext_ln1118_17_fu_4720_p1 = (shl_ln_fu_4712_p3);

assign sext_ln1118_18_fu_4732_p1 = (shl_ln1118_9_fu_4724_p3);

assign sext_ln703_2_fu_5156_p1 = (add_ln703_fu_5150_p2);

assign sext_ln703_fu_5147_p1 = (tmp_385_reg_5703);

assign sext_ln708_10_fu_5278_p1 = (trunc_ln708_18_reg_5793);

assign sext_ln708_11_fu_5342_p1 = (trunc_ln708_30_reg_5853);

assign sext_ln708_4_fu_5174_p1 = (trunc_ln708_5_reg_5718);

assign sext_ln708_5_fu_5193_p1 = (trunc_ln708_8_reg_5733);

assign sext_ln708_6_fu_5202_p1 = (trunc_ln708_9_reg_5738);

assign sext_ln708_7_fu_5241_p1 = (trunc_ln708_13_reg_5613_pp0_iter1_reg);

assign sext_ln708_8_fu_5255_p1 = (trunc_ln708_15_reg_5778);

assign sext_ln708_9_fu_5264_p1 = (trunc_ln708_16_reg_5783);

assign sext_ln708_fu_5160_p1 = (trunc_ln708_s_reg_5708);

assign shl_ln1118_9_fu_4724_p3 = {{data_14_V_read_int_reg}, {1'd0}};

assign shl_ln_fu_4712_p3 = {{data_14_V_read_int_reg}, {8'd0}};

assign sub_ln1118_fu_4736_p2 = ((sext_ln1118_17_fu_4720_p1) - (sext_ln1118_18_fu_4732_p1));

endmodule //normalize_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_2
module myproject_mul_16s_11ns_26_2_0(
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



myproject_mul_16s_11ns_26_2_0_MulnS_1 myproject_mul_16s_11ns_26_2_0_MulnS_1_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
module myproject_mul_16s_11ns_26_2_0_MulnS_1(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [11 - 1 : 0] b;
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
module myproject_mul_16s_8ns_24_2_0(
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



myproject_mul_16s_8ns_24_2_0_MulnS_5 myproject_mul_16s_8ns_24_2_0_MulnS_5_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
module myproject_mul_16s_8ns_24_2_0_MulnS_5(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [8 - 1 : 0] b;
output[24 - 1 : 0] p;
reg  [24 - 1 : 0] p;
wire  [24 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule

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






