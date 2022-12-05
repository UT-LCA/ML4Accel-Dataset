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
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_we0,
        ifmap_vec_d0,
        ifmap_vec_address1,
        ifmap_vec_ce1,
        ifmap_vec_we1,
        ifmap_vec_d1
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_pp0_stage0 = 4'd2;
parameter    ap_ST_fsm_pp0_stage1 = 4'd4;
parameter    ap_ST_fsm_state8 = 4'd8;

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
output  [7:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;
output  [7:0] ifmap_vec_address1;
output   ifmap_vec_ce1;
output   ifmap_vec_we1;
output  [15:0] ifmap_vec_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg[7:0] ifmap_vec_address0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;
reg[15:0] ifmap_vec_d0;
reg[7:0] ifmap_vec_address1;
reg ifmap_vec_ce1;
reg ifmap_vec_we1;
reg[15:0] ifmap_vec_d1;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [5:0] indvar_flatten47_reg_194;
reg   [1:0] ii_reg_206;
reg   [4:0] indvar_flatten_reg_218;
reg   [1:0] jj_reg_229;
reg   [4:0] kk_0_i_reg_241;
wire   [17:0] p_cast_i_fu_270_p1;
reg   [17:0] p_cast_i_reg_931;
wire   [13:0] trunc_ln22_fu_274_p1;
reg   [13:0] trunc_ln22_reg_937;
wire   [17:0] sext_ln22_fu_284_p1;
reg   [17:0] sext_ln22_reg_943;
wire   [6:0] p_cast_fu_288_p2;
reg   [6:0] p_cast_reg_949;
wire   [0:0] or_ln23_21_fu_308_p2;
reg   [0:0] or_ln23_21_reg_955;
wire   [13:0] p_mid137_fu_314_p2;
reg   [13:0] p_mid137_reg_960;
wire   [6:0] p_cast5_i_fu_333_p2;
reg   [6:0] p_cast5_i_reg_965;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_373_p2;
reg   [0:0] is_padding_reg_971;
wire   [0:0] icmp_ln19_fu_379_p2;
reg   [0:0] icmp_ln19_reg_978;
reg   [0:0] icmp_ln19_reg_978_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_978_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_385_p2;
reg   [1:0] add_ln19_reg_982;
wire   [0:0] icmp_ln20_fu_391_p2;
reg   [0:0] icmp_ln20_reg_987;
wire   [1:0] select_ln19_fu_397_p3;
reg   [1:0] select_ln19_reg_999;
wire   [6:0] p_cast5_i_mid1_fu_418_p2;
reg   [6:0] p_cast5_i_mid1_reg_1004;
wire   [0:0] or_ln23_23_fu_437_p2;
reg   [0:0] or_ln23_23_reg_1010;
wire   [1:0] add_ln20_fu_442_p2;
reg   [1:0] add_ln20_reg_1017;
wire   [0:0] or_ln23_25_fu_477_p2;
reg   [0:0] or_ln23_25_reg_1023;
wire   [4:0] add_ln20_5_fu_483_p2;
reg   [4:0] add_ln20_5_reg_1030;
wire   [5:0] add_ln19_5_fu_489_p2;
reg   [5:0] add_ln19_5_reg_1035;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_state7_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_25_fu_527_p3;
reg   [1:0] select_ln19_25_reg_1040;
wire   [4:0] select_ln20_fu_591_p3;
reg   [4:0] select_ln20_reg_1047;
wire   [1:0] select_ln20_21_fu_599_p3;
reg   [1:0] select_ln20_21_reg_1053;
wire   [0:0] select_ln20_22_fu_608_p3;
reg   [0:0] select_ln20_22_reg_1059;
reg   [0:0] select_ln20_22_reg_1059_pp0_iter1_reg;
wire   [3:0] empty_111_fu_704_p1;
reg   [3:0] empty_111_reg_1067;
reg   [3:0] empty_111_reg_1067_pp0_iter1_reg;
wire   [4:0] select_ln20_25_fu_731_p3;
reg   [4:0] select_ln20_25_reg_1079;
wire   [4:0] add_ln25_fu_737_p2;
reg   [4:0] add_ln25_reg_1084;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_769_p2;
reg   [5:0] add_ln33_reg_1089;
wire   [7:0] add_ln33_5_fu_790_p2;
reg   [7:0] add_ln33_5_reg_1096;
wire   [15:0] select_ln33_23_fu_869_p3;
reg   [15:0] select_ln33_23_reg_1101;
wire   [15:0] select_ln33_24_fu_890_p3;
reg   [15:0] select_ln33_24_reg_1106;
reg    ap_block_state1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter2;
reg   [5:0] ap_phi_mux_indvar_flatten47_phi_fu_198_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_210_p4;
reg   [4:0] ap_phi_mux_indvar_flatten_phi_fu_222_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_233_p4;
reg   [4:0] ap_phi_mux_kk_0_i_phi_fu_245_p4;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln32_fu_726_p1;
wire   [63:0] zext_ln33_21_fu_796_p1;
wire   [63:0] sext_ln33_fu_828_p1;
wire   [63:0] sext_ln33_9_fu_909_p1;
wire   [63:0] sext_ln33_10_fu_926_p1;
wire   [15:0] select_ln33_fu_808_p3;
wire   [15:0] select_ln33_22_fu_847_p3;
wire   [16:0] zext_ln19_fu_256_p1;
wire   [16:0] empty_106_fu_264_p2;
wire   [16:0] j_cast_i_fu_252_p1;
wire   [16:0] add_ln22_fu_278_p2;
wire   [6:0] empty_fu_260_p1;
wire   [0:0] tmp_fu_294_p3;
wire   [0:0] icmp_ln24_fu_302_p2;
wire   [17:0] ii_cast_i_fu_320_p1;
wire   [6:0] ii_cast_fu_324_p1;
wire   [17:0] empty_107_fu_328_p2;
wire   [17:0] zext_ln20_fu_344_p1;
wire   [17:0] add_ln22_5_fu_348_p2;
wire   [0:0] tmp_37_fu_353_p3;
wire   [0:0] icmp_ln24_5_fu_361_p2;
wire   [0:0] or_ln23_fu_367_p2;
wire   [0:0] empty_108_fu_338_p2;
wire   [17:0] ii_cast_i_mid1_fu_405_p1;
wire   [6:0] ii_cast_mid1_fu_409_p1;
wire   [17:0] p_mid111_fu_413_p2;
wire   [0:0] p_mid113_fu_423_p2;
wire   [17:0] zext_ln20_5_fu_448_p1;
wire   [17:0] add_ln22_6_fu_452_p2;
wire   [0:0] tmp_38_fu_457_p3;
wire   [0:0] icmp_ln24_6_fu_465_p2;
wire   [0:0] or_ln23_24_fu_471_p2;
wire   [0:0] select_ln19_27_fu_429_p3;
wire   [2:0] zext_ln22_fu_495_p1;
wire   [2:0] tmp2_fu_505_p2;
wire   [13:0] tmp2_cast_fu_511_p1;
wire   [13:0] empty_109_fu_515_p2;
wire   [6:0] row_coord_int_mid131_fu_543_p3;
wire   [6:0] row_coord_int_fu_499_p3;
wire   [13:0] col_coord_int_mid139_fu_549_p3;
wire   [13:0] col_coord_int_fu_520_p3;
wire   [0:0] icmp_ln25_fu_574_p2;
wire   [0:0] xor_ln19_fu_569_p2;
wire   [0:0] and_ln19_fu_580_p2;
wire   [0:0] or_ln20_fu_586_p2;
wire   [0:0] select_ln19_28_fu_538_p3;
wire   [6:0] select_ln19_26_fu_533_p3;
wire   [2:0] zext_ln22_5_fu_605_p1;
wire   [2:0] tmp2_mid1_fu_622_p2;
wire   [13:0] tmp2_cast_mid1_fu_628_p1;
wire   [13:0] p_mid1_fu_632_p2;
wire   [6:0] row_coord_int_mid1_fu_615_p3;
wire   [6:0] select_ln19_29_fu_555_p3;
wire   [6:0] select_ln20_23_fu_644_p3;
wire   [13:0] tmp_7_fu_652_p3;
wire   [10:0] tmp_8_fu_664_p3;
wire   [14:0] zext_ln32_fu_660_p1;
wire   [14:0] zext_ln32_22_fu_672_p1;
wire   [14:0] sub_ln32_fu_676_p2;
wire   [13:0] col_coord_int_mid1_fu_637_p3;
wire   [13:0] select_ln19_30_fu_562_p3;
wire   [13:0] select_ln20_24_fu_686_p3;
wire   [15:0] sext_ln20_fu_682_p1;
wire   [15:0] zext_ln32_23_fu_694_p1;
wire   [15:0] add_ln32_fu_698_p2;
wire   [1:0] lshr_ln_fu_708_p4;
wire   [17:0] tmp_39_fu_718_p3;
wire   [3:0] tmp_s_fu_745_p3;
wire   [4:0] zext_ln33_18_fu_752_p1;
wire   [4:0] zext_ln33_fu_742_p1;
wire   [4:0] sub_ln33_fu_756_p2;
wire   [5:0] sub_ln33_cast_fu_762_p1;
wire   [5:0] zext_ln33_19_fu_766_p1;
wire   [3:0] trunc_ln33_fu_775_p1;
wire   [7:0] tmp_113_cast_fu_779_p3;
wire   [7:0] zext_ln33_20_fu_787_p1;
wire   [15:0] trunc_ln32_fu_800_p1;
wire   [15:0] bitcast_ln32_fu_804_p1;
wire   [3:0] or_ln25_fu_816_p2;
wire   [9:0] tmp_40_fu_821_p3;
wire   [15:0] tmp_66_i_fu_833_p4;
wire   [15:0] bitcast_ln32_22_fu_843_p1;
wire   [15:0] tmp_67_i_fu_855_p4;
wire   [15:0] bitcast_ln32_23_fu_865_p1;
wire   [15:0] tmp_68_i_fu_876_p4;
wire   [15:0] bitcast_ln32_24_fu_886_p1;
wire   [3:0] or_ln25_15_fu_897_p2;
wire   [9:0] tmp_41_fu_902_p3;
wire   [3:0] or_ln25_16_fu_914_p2;
wire   [9:0] tmp_42_fu_919_p3;
wire    ap_CS_fsm_state8;
reg   [3:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ii_reg_206 <= select_ln19_25_reg_1040;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_206 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten47_reg_194 <= add_ln19_5_reg_1035;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_194 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten_reg_218 <= select_ln20_25_reg_1079;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_218 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_229 <= select_ln20_21_reg_1053;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_229 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        kk_0_i_reg_241 <= add_ln25_reg_1084;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_i_reg_241 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln19_5_reg_1035 <= add_ln19_5_fu_489_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_379_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_982 <= add_ln19_fu_385_p2;
        add_ln20_5_reg_1030 <= add_ln20_5_fu_483_p2;
        add_ln20_reg_1017 <= add_ln20_fu_442_p2;
        icmp_ln20_reg_987 <= icmp_ln20_fu_391_p2;
        or_ln23_23_reg_1010 <= or_ln23_23_fu_437_p2;
        or_ln23_25_reg_1023 <= or_ln23_25_fu_477_p2;
        p_cast5_i_mid1_reg_1004 <= p_cast5_i_mid1_fu_418_p2;
        select_ln19_reg_999 <= select_ln19_fu_397_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        add_ln25_reg_1084 <= add_ln25_fu_737_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln33_5_reg_1096 <= add_ln33_5_fu_790_p2;
        add_ln33_reg_1089 <= add_ln33_fu_769_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_111_reg_1067 <= empty_111_fu_704_p1;
        select_ln20_22_reg_1059 <= select_ln20_22_fu_608_p3;
        select_ln20_reg_1047 <= select_ln20_fu_591_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_111_reg_1067_pp0_iter1_reg <= empty_111_reg_1067;
        select_ln20_22_reg_1059_pp0_iter1_reg <= select_ln20_22_reg_1059;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln19_reg_978 <= icmp_ln19_fu_379_p2;
        icmp_ln19_reg_978_pp0_iter1_reg <= icmp_ln19_reg_978;
        icmp_ln19_reg_978_pp0_iter2_reg <= icmp_ln19_reg_978_pp0_iter1_reg;
        is_padding_reg_971 <= is_padding_fu_373_p2;
        p_cast5_i_reg_965 <= p_cast5_i_fu_333_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_21_reg_955 <= or_ln23_21_fu_308_p2;
        p_cast_i_reg_931 <= p_cast_i_fu_270_p1;
        p_cast_reg_949 <= p_cast_fu_288_p2;
        p_mid137_reg_960 <= p_mid137_fu_314_p2;
        sext_ln22_reg_943 <= sext_ln22_fu_284_p1;
        trunc_ln22_reg_937 <= trunc_ln22_fu_274_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln19_25_reg_1040 <= select_ln19_25_fu_527_p3;
        select_ln20_21_reg_1053 <= select_ln20_21_fu_599_p3;
        select_ln20_25_reg_1079 <= select_ln20_25_fu_731_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln33_23_reg_1101 <= select_ln33_23_fu_869_p3;
        select_ln33_24_reg_1106 <= select_ln33_24_fu_890_p3;
    end
end

always @ (*) begin
    if ((icmp_ln19_reg_978 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_210_p4 = select_ln19_25_reg_1040;
    end else begin
        ap_phi_mux_ii_phi_fu_210_p4 = ii_reg_206;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_198_p4 = add_ln19_5_reg_1035;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_198_p4 = indvar_flatten47_reg_194;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten_phi_fu_222_p4 = select_ln20_25_reg_1079;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_222_p4 = indvar_flatten_reg_218;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_233_p4 = select_ln20_21_reg_1053;
    end else begin
        ap_phi_mux_jj_phi_fu_233_p4 = jj_reg_229;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_kk_0_i_phi_fu_245_p4 = add_ln25_reg_1084;
    end else begin
        ap_phi_mux_kk_0_i_phi_fu_245_p4 = kk_0_i_reg_241;
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
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ifmap_vec_address0 = sext_ln33_10_fu_926_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_address0 = sext_ln33_fu_828_p1;
        end else begin
            ifmap_vec_address0 = 'bx;
        end
    end else begin
        ifmap_vec_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ifmap_vec_address1 = sext_ln33_9_fu_909_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_21_fu_796_p1;
        end else begin
            ifmap_vec_address1 = 'bx;
        end
    end else begin
        ifmap_vec_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ifmap_vec_ce1 = 1'b1;
    end else begin
        ifmap_vec_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ifmap_vec_d0 = select_ln33_24_reg_1106;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_22_fu_847_p3;
        end else begin
            ifmap_vec_d0 = 'bx;
        end
    end else begin
        ifmap_vec_d0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ifmap_vec_d1 = select_ln33_23_reg_1101;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_d1 = select_ln33_fu_808_p3;
        end else begin
            ifmap_vec_d1 = 'bx;
        end
    end else begin
        ifmap_vec_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln19_reg_978_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln19_reg_978_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ifmap_vec_we1 = 1'b1;
    end else begin
        ifmap_vec_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((icmp_ln19_reg_978 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((icmp_ln19_reg_978 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
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

assign add_ln19_5_fu_489_p2 = (indvar_flatten47_reg_194 + 6'd1);

assign add_ln19_fu_385_p2 = (ap_phi_mux_ii_phi_fu_210_p4 + 2'd1);

assign add_ln20_5_fu_483_p2 = (ap_phi_mux_indvar_flatten_phi_fu_222_p4 + 5'd1);

assign add_ln20_fu_442_p2 = (select_ln19_fu_397_p3 + 2'd1);

assign add_ln22_5_fu_348_p2 = ((sext_ln22_reg_943) + (zext_ln20_fu_344_p1));

assign add_ln22_6_fu_452_p2 = ((sext_ln22_reg_943) + (zext_ln20_5_fu_448_p1));

assign add_ln22_fu_278_p2 = ((j_cast_i_fu_252_p1) + (17'd131071));

assign add_ln25_fu_737_p2 = (select_ln20_reg_1047 + 5'd4);

assign add_ln32_fu_698_p2 = ((sext_ln20_fu_682_p1) + (zext_ln32_23_fu_694_p1));

assign add_ln33_5_fu_790_p2 = (tmp_113_cast_fu_779_p3 + zext_ln33_20_fu_787_p1);

assign add_ln33_fu_769_p2 = ((sub_ln33_cast_fu_762_p1) + (zext_ln33_19_fu_766_p1));

assign and_ln19_fu_580_p2 = (xor_ln19_fu_569_p2 & icmp_ln25_fu_574_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_22_fu_843_p1 = tmp_66_i_fu_833_p4;

assign bitcast_ln32_23_fu_865_p1 = tmp_67_i_fu_855_p4;

assign bitcast_ln32_24_fu_886_p1 = tmp_68_i_fu_876_p4;

assign bitcast_ln32_fu_804_p1 = trunc_ln32_fu_800_p1;

assign col_coord_int_fu_520_p3 = ((is_padding_reg_971[0:0] == 1'b1) ? 14'd0 : empty_109_fu_515_p2);

assign col_coord_int_mid139_fu_549_p3 = ((or_ln23_23_reg_1010[0:0] == 1'b1) ? 14'd0 : p_mid137_reg_960);

assign col_coord_int_mid1_fu_637_p3 = ((or_ln23_25_reg_1023[0:0] == 1'b1) ? 14'd0 : p_mid1_fu_632_p2);

assign empty_106_fu_264_p2 = ((zext_ln19_fu_256_p1) + (17'd131071));

assign empty_107_fu_328_p2 = ((p_cast_i_reg_931) + (ii_cast_i_fu_320_p1));

assign empty_108_fu_338_p2 = ((empty_107_fu_328_p2 > 18'd111) ? 1'b1 : 1'b0);

assign empty_109_fu_515_p2 = ((tmp2_cast_fu_511_p1) + (trunc_ln22_reg_937));

assign empty_111_fu_704_p1 = select_ln20_fu_591_p3[3:0];

assign empty_fu_260_p1 = i_17[6:0];

assign icmp_ln19_fu_379_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_198_p4 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_391_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_222_p4 == 5'd12) ? 1'b1 : 1'b0);

assign icmp_ln24_5_fu_361_p2 = (((add_ln22_5_fu_348_p2) > (18'd111)) ? 1'b1 : 1'b0);

assign icmp_ln24_6_fu_465_p2 = (((add_ln22_6_fu_452_p2) > (18'd111)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_302_p2 = (((add_ln22_fu_278_p2) > (17'd111)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_574_p2 = ((ap_phi_mux_kk_0_i_phi_fu_245_p4 == 5'd16) ? 1'b1 : 1'b0);

assign ii_cast_fu_324_p1 = ap_phi_mux_ii_phi_fu_210_p4;

assign ii_cast_i_fu_320_p1 = ap_phi_mux_ii_phi_fu_210_p4;

assign ii_cast_i_mid1_fu_405_p1 = add_ln19_fu_385_p2;

assign ii_cast_mid1_fu_409_p1 = add_ln19_fu_385_p2;

assign in_data_address0 = sext_ln32_fu_726_p1;

assign is_padding_fu_373_p2 = (or_ln23_fu_367_p2 | empty_108_fu_338_p2);

assign j_cast_i_fu_252_p1 = j_17;

assign lshr_ln_fu_708_p4 = {{select_ln20_fu_591_p3[3:2]}};

assign or_ln20_fu_586_p2 = (icmp_ln20_reg_987 | and_ln19_fu_580_p2);

assign or_ln23_21_fu_308_p2 = (tmp_fu_294_p3 | icmp_ln24_fu_302_p2);

assign or_ln23_23_fu_437_p2 = (p_mid113_fu_423_p2 | or_ln23_21_reg_955);

assign or_ln23_24_fu_471_p2 = (tmp_38_fu_457_p3 | icmp_ln24_6_fu_465_p2);

assign or_ln23_25_fu_477_p2 = (select_ln19_27_fu_429_p3 | or_ln23_24_fu_471_p2);

assign or_ln23_fu_367_p2 = (tmp_37_fu_353_p3 | icmp_ln24_5_fu_361_p2);

assign or_ln25_15_fu_897_p2 = (empty_111_reg_1067_pp0_iter1_reg | 4'd2);

assign or_ln25_16_fu_914_p2 = (empty_111_reg_1067_pp0_iter1_reg | 4'd3);

assign or_ln25_fu_816_p2 = (empty_111_reg_1067_pp0_iter1_reg | 4'd1);

assign p_cast5_i_fu_333_p2 = (p_cast_reg_949 + ii_cast_fu_324_p1);

assign p_cast5_i_mid1_fu_418_p2 = (p_cast_reg_949 + ii_cast_mid1_fu_409_p1);

assign p_cast_fu_288_p2 = ((empty_fu_260_p1) + (7'd127));

assign p_cast_i_fu_270_p1 = (empty_106_fu_264_p2);

assign p_mid111_fu_413_p2 = ((p_cast_i_reg_931) + (ii_cast_i_mid1_fu_405_p1));

assign p_mid113_fu_423_p2 = ((p_mid111_fu_413_p2 > 18'd111) ? 1'b1 : 1'b0);

assign p_mid137_fu_314_p2 = ((trunc_ln22_fu_274_p1) + (14'd16383));

assign p_mid1_fu_632_p2 = ((tmp2_cast_mid1_fu_628_p1) + (trunc_ln22_reg_937));

assign row_coord_int_fu_499_p3 = ((is_padding_reg_971[0:0] == 1'b1) ? 7'd0 : p_cast5_i_reg_965);

assign row_coord_int_mid131_fu_543_p3 = ((or_ln23_23_reg_1010[0:0] == 1'b1) ? 7'd0 : p_cast5_i_mid1_reg_1004);

assign row_coord_int_mid1_fu_615_p3 = ((or_ln23_25_reg_1023[0:0] == 1'b1) ? 7'd0 : select_ln19_26_fu_533_p3);

assign select_ln19_25_fu_527_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? add_ln19_reg_982 : ii_reg_206);

assign select_ln19_26_fu_533_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? p_cast5_i_mid1_reg_1004 : p_cast5_i_reg_965);

assign select_ln19_27_fu_429_p3 = ((icmp_ln20_fu_391_p2[0:0] == 1'b1) ? p_mid113_fu_423_p2 : empty_108_fu_338_p2);

assign select_ln19_28_fu_538_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? or_ln23_23_reg_1010 : is_padding_reg_971);

assign select_ln19_29_fu_555_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? row_coord_int_mid131_fu_543_p3 : row_coord_int_fu_499_p3);

assign select_ln19_30_fu_562_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? col_coord_int_mid139_fu_549_p3 : col_coord_int_fu_520_p3);

assign select_ln19_fu_397_p3 = ((icmp_ln20_fu_391_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_233_p4);

assign select_ln20_21_fu_599_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? add_ln20_reg_1017 : select_ln19_reg_999);

assign select_ln20_22_fu_608_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? or_ln23_25_reg_1023 : select_ln19_28_fu_538_p3);

assign select_ln20_23_fu_644_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_615_p3 : select_ln19_29_fu_555_p3);

assign select_ln20_24_fu_686_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_637_p3 : select_ln19_30_fu_562_p3);

assign select_ln20_25_fu_731_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? 5'd1 : add_ln20_5_reg_1030);

assign select_ln20_fu_591_p3 = ((or_ln20_fu_586_p2[0:0] == 1'b1) ? 5'd0 : ap_phi_mux_kk_0_i_phi_fu_245_p4);

assign select_ln33_22_fu_847_p3 = ((select_ln20_22_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_22_fu_843_p1);

assign select_ln33_23_fu_869_p3 = ((select_ln20_22_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_23_fu_865_p1);

assign select_ln33_24_fu_890_p3 = ((select_ln20_22_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_24_fu_886_p1);

assign select_ln33_fu_808_p3 = ((select_ln20_22_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_804_p1);

assign sext_ln20_fu_682_p1 = (sub_ln32_fu_676_p2);

assign sext_ln22_fu_284_p1 = add_ln22_fu_278_p2;

assign sext_ln32_fu_726_p1 = (tmp_39_fu_718_p3);

assign sext_ln33_10_fu_926_p1 = (tmp_42_fu_919_p3);

assign sext_ln33_9_fu_909_p1 = (tmp_41_fu_902_p3);

assign sext_ln33_fu_828_p1 = (tmp_40_fu_821_p3);

assign sub_ln32_fu_676_p2 = (zext_ln32_fu_660_p1 - zext_ln32_22_fu_672_p1);

assign sub_ln33_cast_fu_762_p1 = (sub_ln33_fu_756_p2);

assign sub_ln33_fu_756_p2 = (zext_ln33_18_fu_752_p1 - zext_ln33_fu_742_p1);

assign tmp2_cast_fu_511_p1 = (tmp2_fu_505_p2);

assign tmp2_cast_mid1_fu_628_p1 = (tmp2_mid1_fu_622_p2);

assign tmp2_fu_505_p2 = ((zext_ln22_fu_495_p1) + (3'd7));

assign tmp2_mid1_fu_622_p2 = ((zext_ln22_5_fu_605_p1) + (3'd7));

assign tmp_113_cast_fu_779_p3 = {{trunc_ln33_fu_775_p1}, {4'd0}};

assign tmp_37_fu_353_p3 = add_ln22_5_fu_348_p2[32'd17];

assign tmp_38_fu_457_p3 = add_ln22_6_fu_452_p2[32'd17];

assign tmp_39_fu_718_p3 = {{add_ln32_fu_698_p2}, {lshr_ln_fu_708_p4}};

assign tmp_40_fu_821_p3 = {{add_ln33_reg_1089}, {or_ln25_fu_816_p2}};

assign tmp_41_fu_902_p3 = {{add_ln33_reg_1089}, {or_ln25_15_fu_897_p2}};

assign tmp_42_fu_919_p3 = {{add_ln33_reg_1089}, {or_ln25_16_fu_914_p2}};

assign tmp_66_i_fu_833_p4 = {{in_data_q0[31:16]}};

assign tmp_67_i_fu_855_p4 = {{in_data_q0[47:32]}};

assign tmp_68_i_fu_876_p4 = {{in_data_q0[63:48]}};

assign tmp_7_fu_652_p3 = {{select_ln20_23_fu_644_p3}, {7'd0}};

assign tmp_8_fu_664_p3 = {{select_ln20_23_fu_644_p3}, {4'd0}};

assign tmp_fu_294_p3 = add_ln22_fu_278_p2[32'd16];

assign tmp_s_fu_745_p3 = {{select_ln19_25_reg_1040}, {2'd0}};

assign trunc_ln22_fu_274_p1 = j_17[13:0];

assign trunc_ln32_fu_800_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_775_p1 = add_ln33_fu_769_p2[3:0];

assign xor_ln19_fu_569_p2 = (icmp_ln20_reg_987 ^ 1'd1);

assign zext_ln19_fu_256_p1 = i_17;

assign zext_ln20_5_fu_448_p1 = add_ln20_fu_442_p2;

assign zext_ln20_fu_344_p1 = ap_phi_mux_jj_phi_fu_233_p4;

assign zext_ln22_5_fu_605_p1 = add_ln20_reg_1017;

assign zext_ln22_fu_495_p1 = jj_reg_229;

assign zext_ln32_22_fu_672_p1 = tmp_8_fu_664_p3;

assign zext_ln32_23_fu_694_p1 = select_ln20_24_fu_686_p3;

assign zext_ln32_fu_660_p1 = tmp_7_fu_652_p3;

assign zext_ln33_18_fu_752_p1 = tmp_s_fu_745_p3;

assign zext_ln33_19_fu_766_p1 = select_ln20_21_reg_1053;

assign zext_ln33_20_fu_787_p1 = select_ln20_reg_1047;

assign zext_ln33_21_fu_796_p1 = add_ln33_5_reg_1096;

assign zext_ln33_fu_742_p1 = select_ln19_25_reg_1040;

endmodule //td_fused_top_tdf2_readInputs25
