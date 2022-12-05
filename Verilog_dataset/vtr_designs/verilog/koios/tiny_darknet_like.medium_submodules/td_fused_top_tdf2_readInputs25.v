`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module td_fused_top_tdf2_readInputs25 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_data_address0,
        in_data_ce0,
        in_data_q0,
        i_17,
        j_17,
        ifmap_vec_0_address0,
        ifmap_vec_0_ce0,
        ifmap_vec_0_we0,
        ifmap_vec_0_d0,
        ifmap_vec_1_address0,
        ifmap_vec_1_ce0,
        ifmap_vec_1_we0,
        ifmap_vec_1_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state8 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_17;
input  [15:0] j_17;
output  [6:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
output   ifmap_vec_0_we0;
output  [15:0] ifmap_vec_0_d0;
output  [6:0] ifmap_vec_1_address0;
output   ifmap_vec_1_ce0;
output   ifmap_vec_1_we0;
output  [15:0] ifmap_vec_1_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg ifmap_vec_0_ce0;
reg ifmap_vec_0_we0;
reg ifmap_vec_1_ce0;
reg ifmap_vec_1_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [6:0] indvar_flatten47_reg_175;
reg   [5:0] indvar_flatten_reg_186;
reg   [1:0] jj_reg_197;
reg   [4:0] kk_reg_209;
reg   [1:0] ii_reg_220;
wire   [17:0] p_cast_i_fu_249_p1;
reg   [17:0] p_cast_i_reg_1036;
wire   [13:0] trunc_ln22_fu_253_p1;
reg   [13:0] trunc_ln22_reg_1042;
wire   [17:0] sext_ln22_fu_263_p1;
reg   [17:0] sext_ln22_reg_1048;
wire   [6:0] p_cast_fu_267_p2;
reg   [6:0] p_cast_reg_1054;
wire   [0:0] or_ln23_21_fu_287_p2;
reg   [0:0] or_ln23_21_reg_1060;
wire   [13:0] p_mid137_fu_293_p2;
reg   [13:0] p_mid137_reg_1065;
wire   [6:0] add_ln19_5_fu_299_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln19_fu_305_p2;
reg   [0:0] icmp_ln19_reg_1075;
reg   [0:0] icmp_ln19_reg_1075_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1075_pp0_iter2_reg;
reg   [0:0] icmp_ln19_reg_1075_pp0_iter3_reg;
reg   [0:0] icmp_ln19_reg_1075_pp0_iter4_reg;
wire   [0:0] icmp_ln20_fu_311_p2;
reg   [0:0] icmp_ln20_reg_1079;
reg   [0:0] icmp_ln20_reg_1079_pp0_iter1_reg;
wire   [0:0] or_ln19_fu_347_p2;
reg   [0:0] or_ln19_reg_1089;
reg   [0:0] or_ln19_reg_1089_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_353_p2;
reg   [1:0] add_ln20_reg_1096;
reg   [1:0] add_ln20_reg_1096_pp0_iter1_reg;
wire   [1:0] select_ln20_21_fu_367_p3;
reg   [1:0] select_ln20_21_reg_1102;
reg   [1:0] select_ln20_21_reg_1102_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_1108;
reg   [1:0] lshr_ln_reg_1108_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_1108_pp0_iter2_reg;
wire   [1:0] trunc_ln32_fu_385_p1;
reg   [1:0] trunc_ln32_reg_1113;
reg   [1:0] trunc_ln32_reg_1113_pp0_iter1_reg;
reg   [1:0] trunc_ln32_reg_1113_pp0_iter2_reg;
reg   [1:0] trunc_ln32_reg_1113_pp0_iter3_reg;
reg   [2:0] lshr_ln4_reg_1119;
reg   [2:0] lshr_ln4_reg_1119_pp0_iter1_reg;
reg   [2:0] lshr_ln4_reg_1119_pp0_iter2_reg;
reg   [2:0] lshr_ln4_reg_1119_pp0_iter3_reg;
reg   [2:0] lshr_ln4_reg_1119_pp0_iter4_reg;
wire   [4:0] add_ln25_fu_399_p2;
wire   [5:0] select_ln20_25_fu_411_p3;
wire   [6:0] p_cast14_i_fu_432_p2;
reg   [6:0] p_cast14_i_reg_1134;
wire   [0:0] is_padding_fu_476_p2;
reg   [0:0] is_padding_reg_1140;
wire   [2:0] tmp2_fu_482_p2;
reg   [2:0] tmp2_reg_1147;
wire   [1:0] select_ln19_30_fu_494_p3;
reg   [1:0] select_ln19_30_reg_1152;
reg    ap_enable_reg_pp0_iter1;
wire   [6:0] p_cast14_i_mid1_fu_514_p2;
reg   [6:0] p_cast14_i_mid1_reg_1159;
wire   [0:0] or_ln23_23_fu_532_p2;
reg   [0:0] or_ln23_23_reg_1165;
wire   [0:0] or_ln23_25_fu_565_p2;
reg   [0:0] or_ln23_25_reg_1172;
wire   [5:0] add_ln33_fu_655_p2;
reg   [5:0] add_ln33_reg_1179;
reg   [5:0] add_ln33_reg_1179_pp0_iter3_reg;
reg   [5:0] add_ln33_reg_1179_pp0_iter4_reg;
wire   [0:0] select_ln20_22_fu_664_p3;
reg   [0:0] select_ln20_22_reg_1184;
reg   [0:0] select_ln20_22_reg_1184_pp0_iter3_reg;
reg   [0:0] select_ln20_22_reg_1184_pp0_iter4_reg;
wire   [15:0] add_ln32_fu_751_p2;
reg   [15:0] add_ln32_reg_1190;
wire   [6:0] sub_ln32_15_fu_847_p2;
reg   [6:0] sub_ln32_15_reg_1200;
wire   [63:0] lshr_ln32_fu_857_p2;
reg   [63:0] lshr_ln32_reg_1205;
wire   [6:0] sub_ln32_18_fu_948_p2;
reg   [6:0] sub_ln32_18_reg_1210;
wire   [63:0] lshr_ln32_8_fu_958_p2;
reg   [63:0] lshr_ln32_8_reg_1215;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_condition_pp0_exit_iter2_state4;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg   [1:0] ap_phi_mux_jj_phi_fu_201_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_224_p4;
wire   [63:0] sext_ln32_fu_763_p1;
wire   [63:0] sext_ln33_fu_1000_p1;
wire   [16:0] zext_ln19_fu_235_p1;
wire   [16:0] empty_119_fu_243_p2;
wire   [16:0] j_cast_i_fu_231_p1;
wire   [16:0] add_ln22_fu_257_p2;
wire   [6:0] empty_fu_239_p1;
wire   [0:0] tmp_fu_273_p3;
wire   [0:0] icmp_ln24_fu_281_p2;
wire   [0:0] tmp_63_fu_333_p3;
wire   [0:0] xor_ln25_fu_341_p2;
wire   [1:0] select_ln19_fu_317_p3;
wire   [4:0] select_ln19_29_fu_325_p3;
wire   [4:0] select_ln20_fu_359_p3;
wire   [5:0] add_ln20_5_fu_405_p2;
wire   [17:0] ii_cast_i_fu_419_p1;
wire   [6:0] ii_cast_fu_423_p1;
wire   [17:0] empty_120_fu_427_p2;
wire   [17:0] zext_ln20_fu_443_p1;
wire   [17:0] add_ln22_5_fu_451_p2;
wire   [0:0] tmp_62_fu_456_p3;
wire   [0:0] icmp_ln24_5_fu_464_p2;
wire   [0:0] or_ln23_fu_470_p2;
wire   [0:0] empty_121_fu_437_p2;
wire   [2:0] zext_ln22_fu_447_p1;
wire   [1:0] add_ln19_fu_488_p2;
wire   [17:0] ii_cast_i_mid1_fu_501_p1;
wire   [6:0] ii_cast_mid1_fu_505_p1;
wire   [17:0] p_mid111_fu_509_p2;
wire   [0:0] p_mid113_fu_519_p2;
wire   [17:0] zext_ln20_5_fu_537_p1;
wire   [17:0] add_ln22_6_fu_540_p2;
wire   [0:0] tmp_64_fu_545_p3;
wire   [0:0] icmp_ln24_6_fu_553_p2;
wire   [0:0] or_ln23_24_fu_559_p2;
wire   [0:0] select_ln19_32_fu_525_p3;
wire   [13:0] tmp2_cast_fu_577_p1;
wire   [13:0] empty_122_fu_580_p2;
wire   [3:0] tmp_s_fu_595_p3;
wire   [4:0] zext_ln33_10_fu_602_p1;
wire   [4:0] zext_ln33_fu_592_p1;
wire   [4:0] sub_ln33_fu_606_p2;
wire   [6:0] row_coord_int_mid131_fu_626_p3;
wire   [6:0] row_coord_int_fu_571_p3;
wire   [13:0] col_coord_int_mid139_fu_632_p3;
wire   [13:0] col_coord_int_fu_585_p3;
wire   [5:0] sub_ln33_cast_fu_612_p1;
wire   [5:0] zext_ln33_11_fu_652_p1;
wire   [0:0] select_ln19_33_fu_621_p3;
wire   [6:0] select_ln19_31_fu_616_p3;
wire   [2:0] zext_ln22_5_fu_661_p1;
wire   [2:0] tmp2_mid1_fu_677_p2;
wire   [13:0] tmp2_cast_mid1_fu_683_p1;
wire   [13:0] p_mid1_fu_687_p2;
wire   [6:0] select_ln19_34_fu_638_p3;
wire   [6:0] row_coord_int_mid1_fu_670_p3;
wire   [6:0] select_ln20_23_fu_699_p3;
wire   [13:0] tmp_38_fu_706_p3;
wire   [10:0] tmp_39_fu_718_p3;
wire   [14:0] zext_ln32_fu_714_p1;
wire   [14:0] zext_ln32_36_fu_726_p1;
wire   [14:0] sub_ln32_fu_730_p2;
wire   [13:0] select_ln19_35_fu_645_p3;
wire   [13:0] col_coord_int_mid1_fu_692_p3;
wire   [13:0] select_ln20_24_fu_740_p3;
wire   [15:0] sext_ln20_fu_736_p1;
wire   [15:0] zext_ln32_37_fu_747_p1;
wire   [17:0] tmp_65_fu_757_p3;
wire   [5:0] tmp_40_fu_768_p3;
wire   [5:0] empty_124_fu_775_p2;
wire   [6:0] zext_ln32_38_fu_787_p1;
wire   [6:0] zext_ln32_39_fu_791_p1;
wire   [0:0] icmp_ln32_fu_781_p2;
wire   [6:0] sub_ln32_13_fu_805_p2;
wire   [6:0] sub_ln32_14_fu_817_p2;
reg   [63:0] tmp_66_fu_795_p4;
wire   [6:0] xor_ln32_fu_811_p2;
wire   [6:0] select_ln32_fu_823_p3;
wire   [6:0] select_ln32_12_fu_839_p3;
wire   [63:0] select_ln32_11_fu_831_p3;
wire   [63:0] zext_ln32_40_fu_853_p1;
wire   [1:0] or_ln329_i_fu_863_p2;
wire   [5:0] tmp_41_fu_868_p3;
wire   [5:0] empty_125_fu_876_p2;
wire   [6:0] zext_ln32_42_fu_888_p1;
wire   [6:0] zext_ln32_43_fu_892_p1;
wire   [0:0] icmp_ln32_3_fu_882_p2;
wire   [6:0] sub_ln32_16_fu_906_p2;
wire   [6:0] sub_ln32_17_fu_918_p2;
reg   [63:0] tmp_68_fu_896_p4;
wire   [6:0] xor_ln32_3_fu_912_p2;
wire   [6:0] select_ln32_13_fu_924_p3;
wire   [6:0] select_ln32_15_fu_940_p3;
wire   [63:0] select_ln32_14_fu_932_p3;
wire   [63:0] zext_ln32_44_fu_954_p1;
wire   [63:0] zext_ln32_41_fu_964_p1;
wire   [63:0] lshr_ln32_7_fu_967_p2;
wire   [63:0] and_ln32_fu_973_p2;
wire   [15:0] trunc_ln32_5_fu_978_p1;
wire   [15:0] in_data_elem_fu_982_p1;
wire   [8:0] tmp_67_fu_994_p3;
wire   [63:0] zext_ln32_45_fu_1006_p1;
wire   [63:0] lshr_ln32_9_fu_1009_p2;
wire   [63:0] and_ln32_3_fu_1015_p2;
wire   [15:0] trunc_ln32_6_fu_1020_p1;
wire   [15:0] in_data_elem_9_fu_1024_p1;
wire    ap_CS_fsm_state8;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter2_state4)) begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter1;
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter5 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ii_reg_220 <= select_ln19_30_reg_1152;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_220 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_305_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten47_reg_175 <= add_ln19_5_fu_299_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_175 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_305_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_186 <= select_ln20_25_fu_411_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_186 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_197 <= select_ln20_21_reg_1102;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_197 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_305_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_209 <= add_ln25_fu_399_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_209 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_305_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln20_reg_1096 <= add_ln20_fu_353_p2;
        icmp_ln20_reg_1079 <= icmp_ln20_fu_311_p2;
        lshr_ln4_reg_1119 <= {{select_ln20_fu_359_p3[3:1]}};
        lshr_ln_reg_1108 <= {{select_ln20_fu_359_p3[3:2]}};
        or_ln19_reg_1089 <= or_ln19_fu_347_p2;
        trunc_ln32_reg_1113 <= trunc_ln32_fu_385_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln20_reg_1096_pp0_iter1_reg <= add_ln20_reg_1096;
        icmp_ln19_reg_1075 <= icmp_ln19_fu_305_p2;
        icmp_ln19_reg_1075_pp0_iter1_reg <= icmp_ln19_reg_1075;
        icmp_ln20_reg_1079_pp0_iter1_reg <= icmp_ln20_reg_1079;
        is_padding_reg_1140 <= is_padding_fu_476_p2;
        lshr_ln4_reg_1119_pp0_iter1_reg <= lshr_ln4_reg_1119;
        lshr_ln_reg_1108_pp0_iter1_reg <= lshr_ln_reg_1108;
        or_ln19_reg_1089_pp0_iter1_reg <= or_ln19_reg_1089;
        p_cast14_i_reg_1134 <= p_cast14_i_fu_432_p2;
        select_ln20_21_reg_1102_pp0_iter1_reg <= select_ln20_21_reg_1102;
        trunc_ln32_reg_1113_pp0_iter1_reg <= trunc_ln32_reg_1113;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln32_reg_1190 <= add_ln32_fu_751_p2;
        add_ln33_reg_1179 <= add_ln33_fu_655_p2;
        select_ln20_22_reg_1184 <= select_ln20_22_fu_664_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln33_reg_1179_pp0_iter3_reg <= add_ln33_reg_1179;
        add_ln33_reg_1179_pp0_iter4_reg <= add_ln33_reg_1179_pp0_iter3_reg;
        icmp_ln19_reg_1075_pp0_iter2_reg <= icmp_ln19_reg_1075_pp0_iter1_reg;
        icmp_ln19_reg_1075_pp0_iter3_reg <= icmp_ln19_reg_1075_pp0_iter2_reg;
        icmp_ln19_reg_1075_pp0_iter4_reg <= icmp_ln19_reg_1075_pp0_iter3_reg;
        lshr_ln4_reg_1119_pp0_iter2_reg <= lshr_ln4_reg_1119_pp0_iter1_reg;
        lshr_ln4_reg_1119_pp0_iter3_reg <= lshr_ln4_reg_1119_pp0_iter2_reg;
        lshr_ln4_reg_1119_pp0_iter4_reg <= lshr_ln4_reg_1119_pp0_iter3_reg;
        lshr_ln_reg_1108_pp0_iter2_reg <= lshr_ln_reg_1108_pp0_iter1_reg;
        select_ln20_22_reg_1184_pp0_iter3_reg <= select_ln20_22_reg_1184;
        select_ln20_22_reg_1184_pp0_iter4_reg <= select_ln20_22_reg_1184_pp0_iter3_reg;
        trunc_ln32_reg_1113_pp0_iter2_reg <= trunc_ln32_reg_1113_pp0_iter1_reg;
        trunc_ln32_reg_1113_pp0_iter3_reg <= trunc_ln32_reg_1113_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (select_ln20_22_reg_1184_pp0_iter3_reg == 1'd0))) begin
        lshr_ln32_8_reg_1215 <= lshr_ln32_8_fu_958_p2;
        lshr_ln32_reg_1205 <= lshr_ln32_fu_857_p2;
        sub_ln32_15_reg_1200[6 : 1] <= sub_ln32_15_fu_847_p2[6 : 1];
        sub_ln32_18_reg_1210[6 : 1] <= sub_ln32_18_fu_948_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_21_reg_1060 <= or_ln23_21_fu_287_p2;
        p_cast_i_reg_1036 <= p_cast_i_fu_249_p1;
        p_cast_reg_1054 <= p_cast_fu_267_p2;
        p_mid137_reg_1065 <= p_mid137_fu_293_p2;
        sext_ln22_reg_1048 <= sext_ln22_fu_263_p1;
        trunc_ln22_reg_1042 <= trunc_ln22_fu_253_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        or_ln23_23_reg_1165 <= or_ln23_23_fu_532_p2;
        or_ln23_25_reg_1172 <= or_ln23_25_fu_565_p2;
        p_cast14_i_mid1_reg_1159 <= p_cast14_i_mid1_fu_514_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1075 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        select_ln19_30_reg_1152 <= select_ln19_30_fu_494_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_305_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln20_21_reg_1102 <= select_ln20_21_fu_367_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln20_reg_1079 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1089 == 1'd1))) begin
        tmp2_reg_1147 <= tmp2_fu_482_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_condition_pp0_exit_iter2_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter2_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_fu_305_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1075_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_224_p4 = select_ln19_30_reg_1152;
    end else begin
        ap_phi_mux_ii_phi_fu_224_p4 = ii_reg_220;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1075 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_201_p4 = select_ln20_21_reg_1102;
    end else begin
        ap_phi_mux_jj_phi_fu_201_p4 = jj_reg_197;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1075_pp0_iter4_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ifmap_vec_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1075_pp0_iter4_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ifmap_vec_1_we0 = 1'b1;
    end else begin
        ifmap_vec_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln19_5_fu_299_p2 = (indvar_flatten47_reg_175 + 7'd1);

assign add_ln19_fu_488_p2 = (ap_phi_mux_ii_phi_fu_224_p4 + 2'd1);

assign add_ln20_5_fu_405_p2 = (indvar_flatten_reg_186 + 6'd1);

assign add_ln20_fu_353_p2 = (select_ln19_fu_317_p3 + 2'd1);

assign add_ln22_5_fu_451_p2 = ((sext_ln22_reg_1048) + (zext_ln20_fu_443_p1));

assign add_ln22_6_fu_540_p2 = ((sext_ln22_reg_1048) + (zext_ln20_5_fu_537_p1));

assign add_ln22_fu_257_p2 = ((j_cast_i_fu_231_p1) + (17'd131071));

assign add_ln25_fu_399_p2 = (select_ln20_fu_359_p3 + 5'd2);

assign add_ln32_fu_751_p2 = ((sext_ln20_fu_736_p1) + (zext_ln32_37_fu_747_p1));

assign add_ln33_fu_655_p2 = ((sub_ln33_cast_fu_612_p1) + (zext_ln33_11_fu_652_p1));

assign and_ln32_3_fu_1015_p2 = (lshr_ln32_9_fu_1009_p2 & lshr_ln32_8_reg_1215);

assign and_ln32_fu_973_p2 = (lshr_ln32_reg_1205 & lshr_ln32_7_fu_967_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_coord_int_fu_585_p3 = ((is_padding_reg_1140[0:0] == 1'b1) ? 14'd0 : empty_122_fu_580_p2);

assign col_coord_int_mid139_fu_632_p3 = ((or_ln23_23_reg_1165[0:0] == 1'b1) ? 14'd0 : p_mid137_reg_1065);

assign col_coord_int_mid1_fu_692_p3 = ((or_ln23_25_reg_1172[0:0] == 1'b1) ? 14'd0 : p_mid1_fu_687_p2);

assign empty_119_fu_243_p2 = ((zext_ln19_fu_235_p1) + (17'd131071));

assign empty_120_fu_427_p2 = ((p_cast_i_reg_1036) + (ii_cast_i_fu_419_p1));

assign empty_121_fu_437_p2 = ((empty_120_fu_427_p2 > 18'd111) ? 1'b1 : 1'b0);

assign empty_122_fu_580_p2 = ((tmp2_cast_fu_577_p1) + (trunc_ln22_reg_1042));

assign empty_124_fu_775_p2 = (tmp_40_fu_768_p3 | 6'd15);

assign empty_125_fu_876_p2 = (tmp_41_fu_868_p3 | 6'd15);

assign empty_fu_239_p1 = i_17[6:0];

assign icmp_ln19_fu_305_p2 = ((indvar_flatten47_reg_175 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_311_p2 = ((indvar_flatten_reg_186 == 6'd24) ? 1'b1 : 1'b0);

assign icmp_ln24_5_fu_464_p2 = (((add_ln22_5_fu_451_p2) > (18'd111)) ? 1'b1 : 1'b0);

assign icmp_ln24_6_fu_553_p2 = (((add_ln22_6_fu_540_p2) > (18'd111)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_281_p2 = (((add_ln22_fu_257_p2) > (17'd111)) ? 1'b1 : 1'b0);

assign icmp_ln32_3_fu_882_p2 = ((tmp_41_fu_868_p3 > empty_125_fu_876_p2) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_781_p2 = ((tmp_40_fu_768_p3 > empty_124_fu_775_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = sext_ln33_fu_1000_p1;

assign ifmap_vec_0_d0 = ((select_ln20_22_reg_1184_pp0_iter4_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_982_p1);

assign ifmap_vec_1_address0 = sext_ln33_fu_1000_p1;

assign ifmap_vec_1_d0 = ((select_ln20_22_reg_1184_pp0_iter4_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_9_fu_1024_p1);

assign ii_cast_fu_423_p1 = ap_phi_mux_ii_phi_fu_224_p4;

assign ii_cast_i_fu_419_p1 = ap_phi_mux_ii_phi_fu_224_p4;

assign ii_cast_i_mid1_fu_501_p1 = add_ln19_fu_488_p2;

assign ii_cast_mid1_fu_505_p1 = add_ln19_fu_488_p2;

assign in_data_address0 = sext_ln32_fu_763_p1;

assign in_data_elem_9_fu_1024_p1 = trunc_ln32_6_fu_1020_p1;

assign in_data_elem_fu_982_p1 = trunc_ln32_5_fu_978_p1;

assign is_padding_fu_476_p2 = (or_ln23_fu_470_p2 | empty_121_fu_437_p2);

assign j_cast_i_fu_231_p1 = j_17;

assign lshr_ln32_7_fu_967_p2 = 64'd18446744073709551615 >> zext_ln32_41_fu_964_p1;

assign lshr_ln32_8_fu_958_p2 = select_ln32_14_fu_932_p3 >> zext_ln32_44_fu_954_p1;

assign lshr_ln32_9_fu_1009_p2 = 64'd18446744073709551615 >> zext_ln32_45_fu_1006_p1;

assign lshr_ln32_fu_857_p2 = select_ln32_11_fu_831_p3 >> zext_ln32_40_fu_853_p1;

assign or_ln19_fu_347_p2 = (xor_ln25_fu_341_p2 | icmp_ln20_fu_311_p2);

assign or_ln23_21_fu_287_p2 = (tmp_fu_273_p3 | icmp_ln24_fu_281_p2);

assign or_ln23_23_fu_532_p2 = (p_mid113_fu_519_p2 | or_ln23_21_reg_1060);

assign or_ln23_24_fu_559_p2 = (tmp_64_fu_545_p3 | icmp_ln24_6_fu_553_p2);

assign or_ln23_25_fu_565_p2 = (select_ln19_32_fu_525_p3 | or_ln23_24_fu_559_p2);

assign or_ln23_fu_470_p2 = (tmp_62_fu_456_p3 | icmp_ln24_5_fu_464_p2);

assign or_ln329_i_fu_863_p2 = (trunc_ln32_reg_1113_pp0_iter3_reg | 2'd1);

assign p_cast14_i_fu_432_p2 = (p_cast_reg_1054 + ii_cast_fu_423_p1);

assign p_cast14_i_mid1_fu_514_p2 = (p_cast_reg_1054 + ii_cast_mid1_fu_505_p1);

assign p_cast_fu_267_p2 = ((empty_fu_239_p1) + (7'd127));

assign p_cast_i_fu_249_p1 = (empty_119_fu_243_p2);

assign p_mid111_fu_509_p2 = ((p_cast_i_reg_1036) + (ii_cast_i_mid1_fu_501_p1));

assign p_mid113_fu_519_p2 = ((p_mid111_fu_509_p2 > 18'd111) ? 1'b1 : 1'b0);

assign p_mid137_fu_293_p2 = ((trunc_ln22_fu_253_p1) + (14'd16383));

assign p_mid1_fu_687_p2 = ((tmp2_cast_mid1_fu_683_p1) + (trunc_ln22_reg_1042));

assign row_coord_int_fu_571_p3 = ((is_padding_reg_1140[0:0] == 1'b1) ? 7'd0 : p_cast14_i_reg_1134);

assign row_coord_int_mid131_fu_626_p3 = ((or_ln23_23_reg_1165[0:0] == 1'b1) ? 7'd0 : p_cast14_i_mid1_reg_1159);

assign row_coord_int_mid1_fu_670_p3 = ((or_ln23_25_reg_1172[0:0] == 1'b1) ? 7'd0 : select_ln19_31_fu_616_p3);

assign select_ln19_29_fu_325_p3 = ((icmp_ln20_fu_311_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_209);

assign select_ln19_30_fu_494_p3 = ((icmp_ln20_reg_1079[0:0] == 1'b1) ? add_ln19_fu_488_p2 : ap_phi_mux_ii_phi_fu_224_p4);

assign select_ln19_31_fu_616_p3 = ((icmp_ln20_reg_1079_pp0_iter1_reg[0:0] == 1'b1) ? p_cast14_i_mid1_reg_1159 : p_cast14_i_reg_1134);

assign select_ln19_32_fu_525_p3 = ((icmp_ln20_reg_1079[0:0] == 1'b1) ? p_mid113_fu_519_p2 : empty_121_fu_437_p2);

assign select_ln19_33_fu_621_p3 = ((icmp_ln20_reg_1079_pp0_iter1_reg[0:0] == 1'b1) ? or_ln23_23_reg_1165 : is_padding_reg_1140);

assign select_ln19_34_fu_638_p3 = ((icmp_ln20_reg_1079_pp0_iter1_reg[0:0] == 1'b1) ? row_coord_int_mid131_fu_626_p3 : row_coord_int_fu_571_p3);

assign select_ln19_35_fu_645_p3 = ((icmp_ln20_reg_1079_pp0_iter1_reg[0:0] == 1'b1) ? col_coord_int_mid139_fu_632_p3 : col_coord_int_fu_585_p3);

assign select_ln19_fu_317_p3 = ((icmp_ln20_fu_311_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_201_p4);

assign select_ln20_21_fu_367_p3 = ((or_ln19_fu_347_p2[0:0] == 1'b1) ? select_ln19_fu_317_p3 : add_ln20_fu_353_p2);

assign select_ln20_22_fu_664_p3 = ((or_ln19_reg_1089_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_33_fu_621_p3 : or_ln23_25_reg_1172);

assign select_ln20_23_fu_699_p3 = ((or_ln19_reg_1089_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_34_fu_638_p3 : row_coord_int_mid1_fu_670_p3);

assign select_ln20_24_fu_740_p3 = ((or_ln19_reg_1089_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_35_fu_645_p3 : col_coord_int_mid1_fu_692_p3);

assign select_ln20_25_fu_411_p3 = ((icmp_ln20_fu_311_p2[0:0] == 1'b1) ? 6'd1 : add_ln20_5_fu_405_p2);

assign select_ln20_fu_359_p3 = ((or_ln19_fu_347_p2[0:0] == 1'b1) ? select_ln19_29_fu_325_p3 : 5'd0);

assign select_ln32_11_fu_831_p3 = ((icmp_ln32_fu_781_p2[0:0] == 1'b1) ? tmp_66_fu_795_p4 : in_data_q0);

assign select_ln32_12_fu_839_p3 = ((icmp_ln32_fu_781_p2[0:0] == 1'b1) ? xor_ln32_fu_811_p2 : zext_ln32_38_fu_787_p1);

assign select_ln32_13_fu_924_p3 = ((icmp_ln32_3_fu_882_p2[0:0] == 1'b1) ? sub_ln32_16_fu_906_p2 : sub_ln32_17_fu_918_p2);

assign select_ln32_14_fu_932_p3 = ((icmp_ln32_3_fu_882_p2[0:0] == 1'b1) ? tmp_68_fu_896_p4 : in_data_q0);

assign select_ln32_15_fu_940_p3 = ((icmp_ln32_3_fu_882_p2[0:0] == 1'b1) ? xor_ln32_3_fu_912_p2 : zext_ln32_42_fu_888_p1);

assign select_ln32_fu_823_p3 = ((icmp_ln32_fu_781_p2[0:0] == 1'b1) ? sub_ln32_13_fu_805_p2 : sub_ln32_14_fu_817_p2);

assign sext_ln20_fu_736_p1 = (sub_ln32_fu_730_p2);

assign sext_ln22_fu_263_p1 = add_ln22_fu_257_p2;

assign sext_ln32_fu_763_p1 = (tmp_65_fu_757_p3);

assign sext_ln33_fu_1000_p1 = (tmp_67_fu_994_p3);

assign sub_ln32_13_fu_805_p2 = (zext_ln32_38_fu_787_p1 - zext_ln32_39_fu_791_p1);

assign sub_ln32_14_fu_817_p2 = (zext_ln32_39_fu_791_p1 - zext_ln32_38_fu_787_p1);

assign sub_ln32_15_fu_847_p2 = (7'd63 - select_ln32_fu_823_p3);

assign sub_ln32_16_fu_906_p2 = (zext_ln32_42_fu_888_p1 - zext_ln32_43_fu_892_p1);

assign sub_ln32_17_fu_918_p2 = (zext_ln32_43_fu_892_p1 - zext_ln32_42_fu_888_p1);

assign sub_ln32_18_fu_948_p2 = (7'd63 - select_ln32_13_fu_924_p3);

assign sub_ln32_fu_730_p2 = (zext_ln32_fu_714_p1 - zext_ln32_36_fu_726_p1);

assign sub_ln33_cast_fu_612_p1 = (sub_ln33_fu_606_p2);

assign sub_ln33_fu_606_p2 = (zext_ln33_10_fu_602_p1 - zext_ln33_fu_592_p1);

assign tmp2_cast_fu_577_p1 = (tmp2_reg_1147);

assign tmp2_cast_mid1_fu_683_p1 = (tmp2_mid1_fu_677_p2);

assign tmp2_fu_482_p2 = ((zext_ln22_fu_447_p1) + (3'd7));

assign tmp2_mid1_fu_677_p2 = ((zext_ln22_5_fu_661_p1) + (3'd7));

assign tmp_38_fu_706_p3 = {{select_ln20_23_fu_699_p3}, {7'd0}};

assign tmp_39_fu_718_p3 = {{select_ln20_23_fu_699_p3}, {4'd0}};

assign tmp_40_fu_768_p3 = {{trunc_ln32_reg_1113_pp0_iter3_reg}, {4'd0}};

assign tmp_41_fu_868_p3 = {{or_ln329_i_fu_863_p2}, {4'd0}};

assign tmp_62_fu_456_p3 = add_ln22_5_fu_451_p2[32'd17];

assign tmp_63_fu_333_p3 = kk_reg_209[32'd4];

assign tmp_64_fu_545_p3 = add_ln22_6_fu_540_p2[32'd17];

assign tmp_65_fu_757_p3 = {{add_ln32_reg_1190}, {lshr_ln_reg_1108_pp0_iter2_reg}};

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_66_fu_795_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_66_fu_795_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_67_fu_994_p3 = {{add_ln33_reg_1179_pp0_iter4_reg}, {lshr_ln4_reg_1119_pp0_iter4_reg}};

integer ap_tvar_int_1;

always @ (in_data_q0) begin
    //for (ap_tvar_int_1 = 64 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 64; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 63 - 0) begin
            tmp_68_fu_896_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_68_fu_896_p4[ap_tvar_int_1] = in_data_q0[63 - ap_tvar_int_1];
        end
    end
end

assign tmp_fu_273_p3 = add_ln22_fu_257_p2[32'd16];

assign tmp_s_fu_595_p3 = {{select_ln19_30_reg_1152}, {2'd0}};

assign trunc_ln22_fu_253_p1 = j_17[13:0];

assign trunc_ln32_5_fu_978_p1 = and_ln32_fu_973_p2[15:0];

assign trunc_ln32_6_fu_1020_p1 = and_ln32_3_fu_1015_p2[15:0];

assign trunc_ln32_fu_385_p1 = select_ln20_fu_359_p3[1:0];

assign xor_ln25_fu_341_p2 = (tmp_63_fu_333_p3 ^ 1'd1);

assign xor_ln32_3_fu_912_p2 = (zext_ln32_42_fu_888_p1 ^ 7'd63);

assign xor_ln32_fu_811_p2 = (zext_ln32_38_fu_787_p1 ^ 7'd63);

assign zext_ln19_fu_235_p1 = i_17;

assign zext_ln20_5_fu_537_p1 = add_ln20_reg_1096;

assign zext_ln20_fu_443_p1 = jj_reg_197;

assign zext_ln22_5_fu_661_p1 = add_ln20_reg_1096_pp0_iter1_reg;

assign zext_ln22_fu_447_p1 = jj_reg_197;

assign zext_ln32_36_fu_726_p1 = tmp_39_fu_718_p3;

assign zext_ln32_37_fu_747_p1 = select_ln20_24_fu_740_p3;

assign zext_ln32_38_fu_787_p1 = tmp_40_fu_768_p3;

assign zext_ln32_39_fu_791_p1 = empty_124_fu_775_p2;

assign zext_ln32_40_fu_853_p1 = select_ln32_12_fu_839_p3;

assign zext_ln32_41_fu_964_p1 = sub_ln32_15_reg_1200;

assign zext_ln32_42_fu_888_p1 = tmp_41_fu_868_p3;

assign zext_ln32_43_fu_892_p1 = empty_125_fu_876_p2;

assign zext_ln32_44_fu_954_p1 = select_ln32_15_fu_940_p3;

assign zext_ln32_45_fu_1006_p1 = sub_ln32_18_reg_1210;

assign zext_ln32_fu_714_p1 = tmp_38_fu_706_p3;

assign zext_ln33_10_fu_602_p1 = tmp_s_fu_595_p3;

assign zext_ln33_11_fu_652_p1 = select_ln20_21_reg_1102_pp0_iter1_reg;

assign zext_ln33_fu_592_p1 = select_ln19_30_reg_1152;

always @ (posedge ap_clk) begin
    sub_ln32_15_reg_1200[0] <= 1'b0;
    sub_ln32_18_reg_1210[0] <= 1'b0;
end

endmodule //td_fused_top_tdf2_readInputs25
