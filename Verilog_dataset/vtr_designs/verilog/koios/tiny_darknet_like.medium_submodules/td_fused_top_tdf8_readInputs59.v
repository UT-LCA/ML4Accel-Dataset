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

module td_fused_top_tdf8_readInputs59 (
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
        i_13,
        j_13,
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
parameter    ap_ST_fsm_state7 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [12:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_13;
input  [15:0] j_13;
output  [7:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
output   ifmap_vec_0_we0;
output  [15:0] ifmap_vec_0_d0;
output  [7:0] ifmap_vec_1_address0;
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
reg   [7:0] indvar_flatten47_reg_179;
reg   [1:0] ii_reg_190;
reg   [6:0] indvar_flatten_reg_202;
reg   [1:0] jj_reg_213;
reg   [5:0] kk_reg_225;
wire   [17:0] p_cast_i_fu_254_p1;
reg   [17:0] p_cast_i_reg_1043;
wire   [9:0] trunc_ln22_fu_258_p1;
reg   [9:0] trunc_ln22_reg_1049;
wire   [17:0] sext_ln22_fu_268_p1;
reg   [17:0] sext_ln22_reg_1055;
wire   [4:0] p_cast_fu_272_p2;
reg   [4:0] p_cast_reg_1061;
wire   [0:0] or_ln23_1_fu_292_p2;
reg   [0:0] or_ln23_1_reg_1067;
wire   [9:0] p_mid137_fu_298_p2;
reg   [9:0] p_mid137_reg_1072;
wire   [7:0] add_ln19_1_fu_304_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] empty_72_fu_319_p2;
reg   [0:0] empty_72_reg_1082;
wire   [0:0] is_padding_fu_354_p2;
reg   [0:0] is_padding_reg_1087;
wire   [0:0] icmp_ln19_fu_360_p2;
reg   [0:0] icmp_ln19_reg_1094;
reg   [0:0] icmp_ln19_reg_1094_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1094_pp0_iter2_reg;
reg   [0:0] icmp_ln19_reg_1094_pp0_iter3_reg;
wire   [1:0] add_ln19_fu_366_p2;
reg   [1:0] add_ln19_reg_1098;
wire   [0:0] icmp_ln20_fu_372_p2;
reg   [0:0] icmp_ln20_reg_1103;
wire   [1:0] select_ln19_2_fu_394_p3;
reg   [1:0] select_ln19_2_reg_1112;
reg   [1:0] select_ln19_2_reg_1112_pp0_iter1_reg;
reg   [1:0] select_ln19_2_reg_1112_pp0_iter2_reg;
wire   [0:0] p_mid113_fu_411_p2;
reg   [0:0] p_mid113_reg_1119;
wire   [0:0] or_ln19_fu_431_p2;
reg   [0:0] or_ln19_reg_1125;
reg   [0:0] or_ln19_reg_1125_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_437_p2;
reg   [1:0] add_ln20_reg_1132;
wire   [5:0] select_ln20_fu_443_p3;
reg   [5:0] select_ln20_reg_1137;
reg   [5:0] select_ln20_reg_1137_pp0_iter1_reg;
reg   [5:0] select_ln20_reg_1137_pp0_iter2_reg;
wire   [1:0] select_ln20_1_fu_451_p3;
reg   [1:0] select_ln20_1_reg_1142;
reg   [1:0] select_ln20_1_reg_1142_pp0_iter1_reg;
reg   [1:0] select_ln20_1_reg_1142_pp0_iter2_reg;
wire   [17:0] add_ln22_2_fu_463_p2;
reg   [17:0] add_ln22_2_reg_1148;
reg   [2:0] lshr_ln_reg_1154;
reg   [2:0] lshr_ln_reg_1154_pp0_iter1_reg;
wire   [1:0] trunc_ln32_fu_478_p1;
reg   [1:0] trunc_ln32_reg_1159;
reg   [1:0] trunc_ln32_reg_1159_pp0_iter1_reg;
reg   [1:0] trunc_ln32_reg_1159_pp0_iter2_reg;
reg   [3:0] lshr_ln1_reg_1164;
reg   [3:0] lshr_ln1_reg_1164_pp0_iter1_reg;
reg   [3:0] lshr_ln1_reg_1164_pp0_iter2_reg;
reg   [3:0] lshr_ln1_reg_1164_pp0_iter3_reg;
wire   [5:0] add_ln25_fu_492_p2;
wire   [6:0] select_ln20_5_fu_504_p3;
wire   [9:0] select_ln19_7_fu_606_p3;
reg   [9:0] select_ln19_7_reg_1179;
wire   [0:0] or_ln23_5_fu_634_p2;
reg   [0:0] or_ln23_5_reg_1184;
wire   [0:0] select_ln20_2_fu_640_p3;
reg   [0:0] select_ln20_2_reg_1189;
reg   [0:0] select_ln20_2_reg_1189_pp0_iter2_reg;
reg   [0:0] select_ln20_2_reg_1189_pp0_iter3_reg;
wire   [9:0] p_mid1_fu_665_p2;
reg   [9:0] p_mid1_reg_1195;
wire   [10:0] sub_ln32_fu_701_p2;
reg   [10:0] sub_ln32_reg_1200;
wire   [5:0] add_ln33_fu_771_p2;
reg   [5:0] add_ln33_reg_1210;
wire   [6:0] sub_ln32_3_fu_854_p2;
reg   [6:0] sub_ln32_3_reg_1215;
wire   [63:0] lshr_ln32_fu_864_p2;
reg   [63:0] lshr_ln32_reg_1220;
wire   [6:0] sub_ln32_6_fu_955_p2;
reg   [6:0] sub_ln32_6_reg_1225;
wire   [63:0] lshr_ln32_2_fu_965_p2;
reg   [63:0] lshr_ln32_2_reg_1230;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_194_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_217_p4;
wire   [63:0] sext_ln32_fu_739_p1;
wire   [63:0] sext_ln33_fu_1007_p1;
wire   [16:0] zext_ln19_fu_240_p1;
wire   [16:0] empty_70_fu_248_p2;
wire   [16:0] j_cast_i_fu_236_p1;
wire   [16:0] add_ln22_fu_262_p2;
wire   [4:0] empty_fu_244_p1;
wire   [0:0] tmp_fu_278_p3;
wire   [0:0] icmp_ln24_fu_286_p2;
wire   [17:0] ii_cast_i_fu_310_p1;
wire   [17:0] empty_71_fu_314_p2;
wire   [17:0] zext_ln20_fu_325_p1;
wire   [17:0] add_ln22_1_fu_329_p2;
wire   [0:0] tmp_3_fu_334_p3;
wire   [0:0] icmp_ln24_1_fu_342_p2;
wire   [0:0] or_ln23_fu_348_p2;
wire   [17:0] ii_cast_i_mid1_fu_402_p1;
wire   [17:0] p_mid111_fu_406_p2;
wire   [0:0] tmp_4_fu_417_p3;
wire   [0:0] xor_ln25_fu_425_p2;
wire   [1:0] select_ln19_fu_378_p3;
wire   [5:0] select_ln19_1_fu_386_p3;
wire   [17:0] zext_ln20_1_fu_459_p1;
wire   [6:0] add_ln20_1_fu_498_p2;
wire   [4:0] ii_cast_fu_512_p1;
wire   [4:0] p_cast14_i_fu_516_p2;
wire   [2:0] zext_ln22_fu_521_p1;
wire   [2:0] tmp2_fu_532_p2;
wire   [9:0] tmp2_cast_fu_538_p1;
wire   [9:0] empty_73_fu_542_p2;
wire   [4:0] ii_cast_mid1_fu_554_p1;
wire   [4:0] p_cast14_i_mid1_fu_557_p2;
wire   [0:0] or_ln23_3_fu_574_p2;
wire   [4:0] row_coord_int_mid131_fu_584_p3;
wire   [4:0] row_coord_int_fu_525_p3;
wire   [9:0] col_coord_int_mid139_fu_592_p3;
wire   [9:0] col_coord_int_fu_547_p3;
wire   [0:0] tmp_5_fu_616_p3;
wire   [0:0] icmp_ln24_2_fu_623_p2;
wire   [0:0] or_ln23_4_fu_628_p2;
wire   [0:0] select_ln19_4_fu_569_p3;
wire   [0:0] select_ln19_5_fu_578_p3;
wire   [4:0] select_ln19_3_fu_562_p3;
wire   [2:0] zext_ln22_1_fu_613_p1;
wire   [2:0] tmp2_mid1_fu_655_p2;
wire   [9:0] tmp2_cast_mid1_fu_661_p1;
wire   [4:0] select_ln19_6_fu_599_p3;
wire   [4:0] row_coord_int_mid1_fu_647_p3;
wire   [4:0] select_ln20_3_fu_670_p3;
wire   [9:0] tmp_1_fu_677_p3;
wire   [6:0] tmp_2_fu_689_p3;
wire   [10:0] zext_ln32_fu_685_p1;
wire   [10:0] zext_ln32_7_fu_697_p1;
wire   [9:0] col_coord_int_mid1_fu_707_p3;
wire   [9:0] select_ln20_4_fu_716_p3;
wire   [11:0] sext_ln20_fu_713_p1;
wire   [11:0] zext_ln32_8_fu_722_p1;
wire   [11:0] add_ln32_fu_726_p2;
wire   [14:0] tmp_6_fu_732_p3;
wire   [3:0] tmp_s_fu_747_p3;
wire   [4:0] zext_ln33_2_fu_754_p1;
wire   [4:0] zext_ln33_fu_744_p1;
wire   [4:0] sub_ln33_fu_758_p2;
wire   [5:0] sub_ln33_cast_fu_764_p1;
wire   [5:0] zext_ln33_3_fu_768_p1;
wire   [5:0] empty_75_fu_777_p2;
wire   [5:0] empty_76_fu_782_p2;
wire   [6:0] zext_ln32_9_fu_794_p1;
wire   [6:0] zext_ln32_10_fu_798_p1;
wire   [0:0] icmp_ln32_fu_788_p2;
wire   [6:0] sub_ln32_1_fu_812_p2;
wire   [6:0] sub_ln32_2_fu_824_p2;
reg   [63:0] tmp_7_fu_802_p4;
wire   [6:0] xor_ln32_fu_818_p2;
wire   [6:0] select_ln32_fu_830_p3;
wire   [6:0] select_ln32_2_fu_846_p3;
wire   [63:0] select_ln32_1_fu_838_p3;
wire   [63:0] zext_ln32_11_fu_860_p1;
wire   [1:0] or_ln329_i_fu_870_p2;
wire   [5:0] tmp_9_fu_875_p3;
wire   [5:0] empty_77_fu_883_p2;
wire   [6:0] zext_ln32_13_fu_895_p1;
wire   [6:0] zext_ln32_14_fu_899_p1;
wire   [0:0] icmp_ln32_1_fu_889_p2;
wire   [6:0] sub_ln32_4_fu_913_p2;
wire   [6:0] sub_ln32_5_fu_925_p2;
reg   [63:0] tmp_10_fu_903_p4;
wire   [6:0] xor_ln32_1_fu_919_p2;
wire   [6:0] select_ln32_3_fu_931_p3;
wire   [6:0] select_ln32_5_fu_947_p3;
wire   [63:0] select_ln32_4_fu_939_p3;
wire   [63:0] zext_ln32_15_fu_961_p1;
wire   [63:0] zext_ln32_12_fu_971_p1;
wire   [63:0] lshr_ln32_1_fu_974_p2;
wire   [63:0] and_ln32_fu_980_p2;
wire   [15:0] trunc_ln32_1_fu_985_p1;
wire   [15:0] in_data_elem_fu_989_p1;
wire   [9:0] tmp_8_fu_1001_p3;
wire   [63:0] zext_ln32_16_fu_1013_p1;
wire   [63:0] lshr_ln32_3_fu_1016_p2;
wire   [63:0] and_ln32_1_fu_1022_p2;
wire   [15:0] trunc_ln32_2_fu_1027_p1;
wire   [15:0] in_data_elem_1_fu_1031_p1;
wire    ap_CS_fsm_state7;
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
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
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
            if ((1'b1 == ap_condition_pp0_exit_iter1_state3)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter0;
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_190 <= select_ln19_2_reg_1112;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_190 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_360_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten47_reg_179 <= add_ln19_1_fu_304_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_179 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_360_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_202 <= select_ln20_5_fu_504_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_202 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        jj_reg_213 <= select_ln20_1_reg_1142;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_213 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_360_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_225 <= add_ln25_fu_492_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_225 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_360_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_1098 <= add_ln19_fu_366_p2;
        add_ln20_reg_1132 <= add_ln20_fu_437_p2;
        add_ln22_2_reg_1148 <= add_ln22_2_fu_463_p2;
        icmp_ln20_reg_1103 <= icmp_ln20_fu_372_p2;
        lshr_ln1_reg_1164 <= {{select_ln20_fu_443_p3[4:1]}};
        lshr_ln_reg_1154 <= {{select_ln20_fu_443_p3[4:2]}};
        or_ln19_reg_1125 <= or_ln19_fu_431_p2;
        p_mid113_reg_1119 <= p_mid113_fu_411_p2;
        select_ln20_reg_1137 <= select_ln20_fu_443_p3;
        trunc_ln32_reg_1159 <= trunc_ln32_fu_478_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln33_reg_1210 <= add_ln33_fu_771_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_72_reg_1082 <= empty_72_fu_319_p2;
        icmp_ln19_reg_1094 <= icmp_ln19_fu_360_p2;
        icmp_ln19_reg_1094_pp0_iter1_reg <= icmp_ln19_reg_1094;
        is_padding_reg_1087 <= is_padding_fu_354_p2;
        lshr_ln1_reg_1164_pp0_iter1_reg <= lshr_ln1_reg_1164;
        lshr_ln_reg_1154_pp0_iter1_reg <= lshr_ln_reg_1154;
        or_ln19_reg_1125_pp0_iter1_reg <= or_ln19_reg_1125;
        select_ln19_2_reg_1112_pp0_iter1_reg <= select_ln19_2_reg_1112;
        select_ln20_1_reg_1142_pp0_iter1_reg <= select_ln20_1_reg_1142;
        select_ln20_reg_1137_pp0_iter1_reg <= select_ln20_reg_1137;
        trunc_ln32_reg_1159_pp0_iter1_reg <= trunc_ln32_reg_1159;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln19_reg_1094_pp0_iter2_reg <= icmp_ln19_reg_1094_pp0_iter1_reg;
        icmp_ln19_reg_1094_pp0_iter3_reg <= icmp_ln19_reg_1094_pp0_iter2_reg;
        lshr_ln1_reg_1164_pp0_iter2_reg <= lshr_ln1_reg_1164_pp0_iter1_reg;
        lshr_ln1_reg_1164_pp0_iter3_reg <= lshr_ln1_reg_1164_pp0_iter2_reg;
        select_ln19_2_reg_1112_pp0_iter2_reg <= select_ln19_2_reg_1112_pp0_iter1_reg;
        select_ln20_1_reg_1142_pp0_iter2_reg <= select_ln20_1_reg_1142_pp0_iter1_reg;
        select_ln20_2_reg_1189_pp0_iter2_reg <= select_ln20_2_reg_1189;
        select_ln20_2_reg_1189_pp0_iter3_reg <= select_ln20_2_reg_1189_pp0_iter2_reg;
        select_ln20_reg_1137_pp0_iter2_reg <= select_ln20_reg_1137_pp0_iter1_reg;
        trunc_ln32_reg_1159_pp0_iter2_reg <= trunc_ln32_reg_1159_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (select_ln20_2_reg_1189_pp0_iter2_reg == 1'd0))) begin
        lshr_ln32_2_reg_1230 <= lshr_ln32_2_fu_965_p2;
        lshr_ln32_reg_1220 <= lshr_ln32_fu_864_p2;
        sub_ln32_3_reg_1215[6 : 1] <= sub_ln32_3_fu_854_p2[6 : 1];
        sub_ln32_6_reg_1225[6 : 1] <= sub_ln32_6_fu_955_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_1_reg_1067 <= or_ln23_1_fu_292_p2;
        p_cast_i_reg_1043 <= p_cast_i_fu_254_p1;
        p_cast_reg_1061 <= p_cast_fu_272_p2;
        p_mid137_reg_1072 <= p_mid137_fu_298_p2;
        sext_ln22_reg_1055 <= sext_ln22_fu_268_p1;
        trunc_ln22_reg_1049 <= trunc_ln22_fu_258_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        or_ln23_5_reg_1184 <= or_ln23_5_fu_634_p2;
        select_ln20_2_reg_1189 <= select_ln20_2_fu_640_p3;
        sub_ln32_reg_1200[10 : 2] <= sub_ln32_fu_701_p2[10 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1125 == 1'd0))) begin
        p_mid1_reg_1195 <= p_mid1_fu_665_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_360_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln19_2_reg_1112 <= select_ln19_2_fu_394_p3;
        select_ln20_1_reg_1142 <= select_ln20_1_fu_451_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1125 == 1'd1))) begin
        select_ln19_7_reg_1179 <= select_ln19_7_fu_606_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_condition_pp0_exit_iter1_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_fu_360_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_194_p4 = select_ln19_2_reg_1112;
    end else begin
        ap_phi_mux_ii_phi_fu_194_p4 = ii_reg_190;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1094 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_217_p4 = select_ln20_1_reg_1142;
    end else begin
        ap_phi_mux_jj_phi_fu_217_p4 = jj_reg_213;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1094_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1094_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_1_we0 = 1'b1;
    end else begin
        ifmap_vec_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln19_1_fu_304_p2 = (indvar_flatten47_reg_179 + 8'd1);

assign add_ln19_fu_366_p2 = (ap_phi_mux_ii_phi_fu_194_p4 + 2'd1);

assign add_ln20_1_fu_498_p2 = (indvar_flatten_reg_202 + 7'd1);

assign add_ln20_fu_437_p2 = (select_ln19_fu_378_p3 + 2'd1);

assign add_ln22_1_fu_329_p2 = ((sext_ln22_reg_1055) + (zext_ln20_fu_325_p1));

assign add_ln22_2_fu_463_p2 = ((sext_ln22_reg_1055) + (zext_ln20_1_fu_459_p1));

assign add_ln22_fu_262_p2 = ((j_cast_i_fu_236_p1) + (17'd131071));

assign add_ln25_fu_492_p2 = (select_ln20_fu_443_p3 + 6'd2);

assign add_ln32_fu_726_p2 = ((sext_ln20_fu_713_p1) + (zext_ln32_8_fu_722_p1));

assign add_ln33_fu_771_p2 = ((sub_ln33_cast_fu_764_p1) + (zext_ln33_3_fu_768_p1));

assign and_ln32_1_fu_1022_p2 = (lshr_ln32_3_fu_1016_p2 & lshr_ln32_2_reg_1230);

assign and_ln32_fu_980_p2 = (lshr_ln32_reg_1220 & lshr_ln32_1_fu_974_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_coord_int_fu_547_p3 = ((is_padding_reg_1087[0:0] == 1'b1) ? 10'd0 : empty_73_fu_542_p2);

assign col_coord_int_mid139_fu_592_p3 = ((or_ln23_3_fu_574_p2[0:0] == 1'b1) ? 10'd0 : p_mid137_reg_1072);

assign col_coord_int_mid1_fu_707_p3 = ((or_ln23_5_reg_1184[0:0] == 1'b1) ? 10'd0 : p_mid1_reg_1195);

assign empty_70_fu_248_p2 = ((zext_ln19_fu_240_p1) + (17'd131071));

assign empty_71_fu_314_p2 = ((p_cast_i_reg_1043) + (ii_cast_i_fu_310_p1));

assign empty_72_fu_319_p2 = ((empty_71_fu_314_p2 > 18'd27) ? 1'b1 : 1'b0);

assign empty_73_fu_542_p2 = ((tmp2_cast_fu_538_p1) + (trunc_ln22_reg_1049));

assign empty_75_fu_777_p2 = select_ln20_reg_1137_pp0_iter2_reg << 6'd4;

assign empty_76_fu_782_p2 = (empty_75_fu_777_p2 | 6'd15);

assign empty_77_fu_883_p2 = (tmp_9_fu_875_p3 | 6'd15);

assign empty_fu_244_p1 = i_13[4:0];

assign icmp_ln19_fu_360_p2 = ((indvar_flatten47_reg_179 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_372_p2 = ((indvar_flatten_reg_202 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln24_1_fu_342_p2 = (((add_ln22_1_fu_329_p2) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_2_fu_623_p2 = (((add_ln22_2_reg_1148) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_286_p2 = (((add_ln22_fu_262_p2) > (17'd27)) ? 1'b1 : 1'b0);

assign icmp_ln32_1_fu_889_p2 = ((tmp_9_fu_875_p3 > empty_77_fu_883_p2) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_788_p2 = ((empty_75_fu_777_p2 > empty_76_fu_782_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = sext_ln33_fu_1007_p1;

assign ifmap_vec_0_d0 = ((select_ln20_2_reg_1189_pp0_iter3_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_989_p1);

assign ifmap_vec_1_address0 = sext_ln33_fu_1007_p1;

assign ifmap_vec_1_d0 = ((select_ln20_2_reg_1189_pp0_iter3_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_1_fu_1031_p1);

assign ii_cast_fu_512_p1 = ii_reg_190;

assign ii_cast_i_fu_310_p1 = ap_phi_mux_ii_phi_fu_194_p4;

assign ii_cast_i_mid1_fu_402_p1 = add_ln19_fu_366_p2;

assign ii_cast_mid1_fu_554_p1 = add_ln19_reg_1098;

assign in_data_address0 = sext_ln32_fu_739_p1;

assign in_data_elem_1_fu_1031_p1 = trunc_ln32_2_fu_1027_p1;

assign in_data_elem_fu_989_p1 = trunc_ln32_1_fu_985_p1;

assign is_padding_fu_354_p2 = (or_ln23_fu_348_p2 | empty_72_fu_319_p2);

assign j_cast_i_fu_236_p1 = j_13;

assign lshr_ln32_1_fu_974_p2 = 64'd18446744073709551615 >> zext_ln32_12_fu_971_p1;

assign lshr_ln32_2_fu_965_p2 = select_ln32_4_fu_939_p3 >> zext_ln32_15_fu_961_p1;

assign lshr_ln32_3_fu_1016_p2 = 64'd18446744073709551615 >> zext_ln32_16_fu_1013_p1;

assign lshr_ln32_fu_864_p2 = select_ln32_1_fu_838_p3 >> zext_ln32_11_fu_860_p1;

assign or_ln19_fu_431_p2 = (xor_ln25_fu_425_p2 | icmp_ln20_fu_372_p2);

assign or_ln23_1_fu_292_p2 = (tmp_fu_278_p3 | icmp_ln24_fu_286_p2);

assign or_ln23_3_fu_574_p2 = (p_mid113_reg_1119 | or_ln23_1_reg_1067);

assign or_ln23_4_fu_628_p2 = (tmp_5_fu_616_p3 | icmp_ln24_2_fu_623_p2);

assign or_ln23_5_fu_634_p2 = (select_ln19_4_fu_569_p3 | or_ln23_4_fu_628_p2);

assign or_ln23_fu_348_p2 = (tmp_3_fu_334_p3 | icmp_ln24_1_fu_342_p2);

assign or_ln329_i_fu_870_p2 = (trunc_ln32_reg_1159_pp0_iter2_reg | 2'd1);

assign p_cast14_i_fu_516_p2 = (p_cast_reg_1061 + ii_cast_fu_512_p1);

assign p_cast14_i_mid1_fu_557_p2 = (p_cast_reg_1061 + ii_cast_mid1_fu_554_p1);

assign p_cast_fu_272_p2 = ((empty_fu_244_p1) + (5'd31));

assign p_cast_i_fu_254_p1 = (empty_70_fu_248_p2);

assign p_mid111_fu_406_p2 = ((p_cast_i_reg_1043) + (ii_cast_i_mid1_fu_402_p1));

assign p_mid113_fu_411_p2 = ((p_mid111_fu_406_p2 > 18'd27) ? 1'b1 : 1'b0);

assign p_mid137_fu_298_p2 = ((trunc_ln22_fu_258_p1) + (10'd1023));

assign p_mid1_fu_665_p2 = ((tmp2_cast_mid1_fu_661_p1) + (trunc_ln22_reg_1049));

assign row_coord_int_fu_525_p3 = ((is_padding_reg_1087[0:0] == 1'b1) ? 5'd0 : p_cast14_i_fu_516_p2);

assign row_coord_int_mid131_fu_584_p3 = ((or_ln23_3_fu_574_p2[0:0] == 1'b1) ? 5'd0 : p_cast14_i_mid1_fu_557_p2);

assign row_coord_int_mid1_fu_647_p3 = ((or_ln23_5_fu_634_p2[0:0] == 1'b1) ? 5'd0 : select_ln19_3_fu_562_p3);

assign select_ln19_1_fu_386_p3 = ((icmp_ln20_fu_372_p2[0:0] == 1'b1) ? 6'd0 : kk_reg_225);

assign select_ln19_2_fu_394_p3 = ((icmp_ln20_fu_372_p2[0:0] == 1'b1) ? add_ln19_fu_366_p2 : ap_phi_mux_ii_phi_fu_194_p4);

assign select_ln19_3_fu_562_p3 = ((icmp_ln20_reg_1103[0:0] == 1'b1) ? p_cast14_i_mid1_fu_557_p2 : p_cast14_i_fu_516_p2);

assign select_ln19_4_fu_569_p3 = ((icmp_ln20_reg_1103[0:0] == 1'b1) ? p_mid113_reg_1119 : empty_72_reg_1082);

assign select_ln19_5_fu_578_p3 = ((icmp_ln20_reg_1103[0:0] == 1'b1) ? or_ln23_3_fu_574_p2 : is_padding_reg_1087);

assign select_ln19_6_fu_599_p3 = ((icmp_ln20_reg_1103[0:0] == 1'b1) ? row_coord_int_mid131_fu_584_p3 : row_coord_int_fu_525_p3);

assign select_ln19_7_fu_606_p3 = ((icmp_ln20_reg_1103[0:0] == 1'b1) ? col_coord_int_mid139_fu_592_p3 : col_coord_int_fu_547_p3);

assign select_ln19_fu_378_p3 = ((icmp_ln20_fu_372_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_217_p4);

assign select_ln20_1_fu_451_p3 = ((or_ln19_fu_431_p2[0:0] == 1'b1) ? select_ln19_fu_378_p3 : add_ln20_fu_437_p2);

assign select_ln20_2_fu_640_p3 = ((or_ln19_reg_1125[0:0] == 1'b1) ? select_ln19_5_fu_578_p3 : or_ln23_5_fu_634_p2);

assign select_ln20_3_fu_670_p3 = ((or_ln19_reg_1125[0:0] == 1'b1) ? select_ln19_6_fu_599_p3 : row_coord_int_mid1_fu_647_p3);

assign select_ln20_4_fu_716_p3 = ((or_ln19_reg_1125_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_7_reg_1179 : col_coord_int_mid1_fu_707_p3);

assign select_ln20_5_fu_504_p3 = ((icmp_ln20_fu_372_p2[0:0] == 1'b1) ? 7'd1 : add_ln20_1_fu_498_p2);

assign select_ln20_fu_443_p3 = ((or_ln19_fu_431_p2[0:0] == 1'b1) ? select_ln19_1_fu_386_p3 : 6'd0);

assign select_ln32_1_fu_838_p3 = ((icmp_ln32_fu_788_p2[0:0] == 1'b1) ? tmp_7_fu_802_p4 : in_data_q0);

assign select_ln32_2_fu_846_p3 = ((icmp_ln32_fu_788_p2[0:0] == 1'b1) ? xor_ln32_fu_818_p2 : zext_ln32_9_fu_794_p1);

assign select_ln32_3_fu_931_p3 = ((icmp_ln32_1_fu_889_p2[0:0] == 1'b1) ? sub_ln32_4_fu_913_p2 : sub_ln32_5_fu_925_p2);

assign select_ln32_4_fu_939_p3 = ((icmp_ln32_1_fu_889_p2[0:0] == 1'b1) ? tmp_10_fu_903_p4 : in_data_q0);

assign select_ln32_5_fu_947_p3 = ((icmp_ln32_1_fu_889_p2[0:0] == 1'b1) ? xor_ln32_1_fu_919_p2 : zext_ln32_13_fu_895_p1);

assign select_ln32_fu_830_p3 = ((icmp_ln32_fu_788_p2[0:0] == 1'b1) ? sub_ln32_1_fu_812_p2 : sub_ln32_2_fu_824_p2);

assign sext_ln20_fu_713_p1 = (sub_ln32_reg_1200);

assign sext_ln22_fu_268_p1 = add_ln22_fu_262_p2;

assign sext_ln32_fu_739_p1 = (tmp_6_fu_732_p3);

assign sext_ln33_fu_1007_p1 = (tmp_8_fu_1001_p3);

assign sub_ln32_1_fu_812_p2 = (zext_ln32_9_fu_794_p1 - zext_ln32_10_fu_798_p1);

assign sub_ln32_2_fu_824_p2 = (zext_ln32_10_fu_798_p1 - zext_ln32_9_fu_794_p1);

assign sub_ln32_3_fu_854_p2 = (7'd63 - select_ln32_fu_830_p3);

assign sub_ln32_4_fu_913_p2 = (zext_ln32_13_fu_895_p1 - zext_ln32_14_fu_899_p1);

assign sub_ln32_5_fu_925_p2 = (zext_ln32_14_fu_899_p1 - zext_ln32_13_fu_895_p1);

assign sub_ln32_6_fu_955_p2 = (7'd63 - select_ln32_3_fu_931_p3);

assign sub_ln32_fu_701_p2 = (zext_ln32_fu_685_p1 - zext_ln32_7_fu_697_p1);

assign sub_ln33_cast_fu_764_p1 = (sub_ln33_fu_758_p2);

assign sub_ln33_fu_758_p2 = (zext_ln33_2_fu_754_p1 - zext_ln33_fu_744_p1);

assign tmp2_cast_fu_538_p1 = (tmp2_fu_532_p2);

assign tmp2_cast_mid1_fu_661_p1 = (tmp2_mid1_fu_655_p2);

assign tmp2_fu_532_p2 = ((zext_ln22_fu_521_p1) + (3'd7));

assign tmp2_mid1_fu_655_p2 = ((zext_ln22_1_fu_613_p1) + (3'd7));

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_10_fu_903_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_10_fu_903_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_1_fu_677_p3 = {{select_ln20_3_fu_670_p3}, {5'd0}};

assign tmp_2_fu_689_p3 = {{select_ln20_3_fu_670_p3}, {2'd0}};

assign tmp_3_fu_334_p3 = add_ln22_1_fu_329_p2[32'd17];

assign tmp_4_fu_417_p3 = kk_reg_225[32'd5];

assign tmp_5_fu_616_p3 = add_ln22_2_reg_1148[32'd17];

assign tmp_6_fu_732_p3 = {{add_ln32_fu_726_p2}, {lshr_ln_reg_1154_pp0_iter1_reg}};

integer ap_tvar_int_1;

always @ (in_data_q0) begin
    //for (ap_tvar_int_1 = 64 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 64; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 63 - 0) begin
            tmp_7_fu_802_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_7_fu_802_p4[ap_tvar_int_1] = in_data_q0[63 - ap_tvar_int_1];
        end
    end
end

assign tmp_8_fu_1001_p3 = {{add_ln33_reg_1210}, {lshr_ln1_reg_1164_pp0_iter3_reg}};

assign tmp_9_fu_875_p3 = {{or_ln329_i_fu_870_p2}, {4'd0}};

assign tmp_fu_278_p3 = add_ln22_fu_262_p2[32'd16];

assign tmp_s_fu_747_p3 = {{select_ln19_2_reg_1112_pp0_iter2_reg}, {2'd0}};

assign trunc_ln22_fu_258_p1 = j_13[9:0];

assign trunc_ln32_1_fu_985_p1 = and_ln32_fu_980_p2[15:0];

assign trunc_ln32_2_fu_1027_p1 = and_ln32_1_fu_1022_p2[15:0];

assign trunc_ln32_fu_478_p1 = select_ln20_fu_443_p3[1:0];

assign xor_ln25_fu_425_p2 = (tmp_4_fu_417_p3 ^ 1'd1);

assign xor_ln32_1_fu_919_p2 = (zext_ln32_13_fu_895_p1 ^ 7'd63);

assign xor_ln32_fu_818_p2 = (zext_ln32_9_fu_794_p1 ^ 7'd63);

assign zext_ln19_fu_240_p1 = i_13;

assign zext_ln20_1_fu_459_p1 = add_ln20_fu_437_p2;

assign zext_ln20_fu_325_p1 = ap_phi_mux_jj_phi_fu_217_p4;

assign zext_ln22_1_fu_613_p1 = add_ln20_reg_1132;

assign zext_ln22_fu_521_p1 = jj_reg_213;

assign zext_ln32_10_fu_798_p1 = empty_76_fu_782_p2;

assign zext_ln32_11_fu_860_p1 = select_ln32_2_fu_846_p3;

assign zext_ln32_12_fu_971_p1 = sub_ln32_3_reg_1215;

assign zext_ln32_13_fu_895_p1 = tmp_9_fu_875_p3;

assign zext_ln32_14_fu_899_p1 = empty_77_fu_883_p2;

assign zext_ln32_15_fu_961_p1 = select_ln32_5_fu_947_p3;

assign zext_ln32_16_fu_1013_p1 = sub_ln32_6_reg_1225;

assign zext_ln32_7_fu_697_p1 = tmp_2_fu_689_p3;

assign zext_ln32_8_fu_722_p1 = select_ln20_4_fu_716_p3;

assign zext_ln32_9_fu_794_p1 = empty_75_fu_777_p2;

assign zext_ln32_fu_685_p1 = tmp_1_fu_677_p3;

assign zext_ln33_2_fu_754_p1 = tmp_s_fu_747_p3;

assign zext_ln33_3_fu_768_p1 = select_ln20_1_reg_1142_pp0_iter2_reg;

assign zext_ln33_fu_744_p1 = select_ln19_2_reg_1112_pp0_iter2_reg;

always @ (posedge ap_clk) begin
    sub_ln32_reg_1200[1:0] <= 2'b00;
    sub_ln32_3_reg_1215[0] <= 1'b0;
    sub_ln32_6_reg_1225[0] <= 1'b0;
end

endmodule //td_fused_top_tdf8_readInputs59
