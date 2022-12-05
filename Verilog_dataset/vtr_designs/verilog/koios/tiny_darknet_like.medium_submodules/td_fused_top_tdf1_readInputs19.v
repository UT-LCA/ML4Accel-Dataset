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

module td_fused_top_tdf1_readInputs19 (
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
        i_19,
        j_19,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_we0,
        ifmap_vec_d0
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
output  [15:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_19;
input  [15:0] j_19;
output  [4:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] indvar_flatten52_reg_142;
reg   [3:0] indvar_flatten_reg_153;
reg   [1:0] jj_reg_164;
reg   [1:0] kk_reg_176;
reg   [1:0] ii_reg_187;
wire   [17:0] p_cast_i_fu_216_p1;
reg   [17:0] p_cast_i_reg_901;
wire   [17:0] sext_ln22_fu_226_p1;
reg   [17:0] sext_ln22_reg_907;
wire   [7:0] p_cast_fu_230_p2;
reg   [7:0] p_cast_reg_913;
wire   [0:0] or_ln23_26_fu_250_p2;
reg   [0:0] or_ln23_26_reg_919;
wire   [15:0] p_mid140_fu_256_p2;
reg   [15:0] p_mid140_reg_924;
wire   [4:0] add_ln19_6_fu_262_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln19_fu_268_p2;
reg   [0:0] icmp_ln19_reg_934;
reg   [0:0] icmp_ln19_reg_934_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_934_pp0_iter2_reg;
reg   [0:0] icmp_ln19_reg_934_pp0_iter3_reg;
wire   [0:0] icmp_ln20_fu_274_p2;
reg   [0:0] icmp_ln20_reg_938;
reg   [0:0] icmp_ln20_reg_938_pp0_iter1_reg;
reg   [0:0] icmp_ln20_reg_938_pp0_iter2_reg;
reg   [0:0] icmp_ln20_reg_938_pp0_iter3_reg;
wire   [0:0] and_ln19_fu_300_p2;
reg   [0:0] and_ln19_reg_947;
reg   [0:0] and_ln19_reg_947_pp0_iter1_reg;
reg   [0:0] and_ln19_reg_947_pp0_iter2_reg;
reg   [0:0] and_ln19_reg_947_pp0_iter3_reg;
wire   [1:0] add_ln20_fu_306_p2;
reg   [1:0] add_ln20_reg_953;
wire   [1:0] select_ln20_fu_318_p3;
reg   [1:0] select_ln20_reg_959;
reg   [1:0] select_ln20_reg_959_pp0_iter1_reg;
reg   [1:0] select_ln20_reg_959_pp0_iter2_reg;
wire   [1:0] select_ln20_26_fu_326_p3;
reg   [1:0] select_ln20_26_reg_965;
reg   [1:0] select_ln20_26_reg_965_pp0_iter1_reg;
reg   [1:0] select_ln20_26_reg_965_pp0_iter2_reg;
wire   [1:0] add_ln25_fu_334_p2;
wire   [3:0] select_ln20_29_fu_346_p3;
wire   [7:0] p_cast1_i_fu_367_p2;
reg   [7:0] p_cast1_i_reg_981;
wire   [0:0] is_padding_fu_411_p2;
reg   [0:0] is_padding_reg_987;
reg   [0:0] is_padding_reg_987_pp0_iter2_reg;
reg   [0:0] is_padding_reg_987_pp0_iter3_reg;
wire   [15:0] empty_132_fu_427_p2;
reg   [15:0] empty_132_reg_994;
wire   [1:0] select_ln19_36_fu_438_p3;
reg   [1:0] select_ln19_36_reg_999;
reg    ap_enable_reg_pp0_iter1;
reg   [1:0] select_ln19_36_reg_999_pp0_iter2_reg;
wire   [7:0] p_cast1_i_mid1_fu_458_p2;
reg   [7:0] p_cast1_i_mid1_reg_1006;
wire   [0:0] or_ln23_28_fu_476_p2;
reg   [0:0] or_ln23_28_reg_1012;
reg   [0:0] or_ln23_28_reg_1012_pp0_iter2_reg;
reg   [0:0] or_ln23_28_reg_1012_pp0_iter3_reg;
wire   [0:0] or_ln23_30_fu_512_p2;
reg   [0:0] or_ln23_30_reg_1019;
reg   [0:0] or_ln23_30_reg_1019_pp0_iter2_reg;
reg   [0:0] or_ln23_30_reg_1019_pp0_iter3_reg;
wire   [15:0] p_mid1_fu_528_p2;
reg   [15:0] p_mid1_reg_1026;
wire   [4:0] add_ln33_1_fu_748_p2;
reg   [4:0] add_ln33_1_reg_1036;
wire   [6:0] sub_ln32_21_fu_833_p2;
reg   [6:0] sub_ln32_21_reg_1041;
wire   [63:0] lshr_ln32_fu_843_p2;
reg   [63:0] lshr_ln32_reg_1046;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_condition_pp0_exit_iter2_state4;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_jj_phi_fu_168_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_191_p4;
wire   [63:0] zext_ln32_48_fu_685_p1;
wire   [63:0] zext_ln33_15_fu_860_p1;
wire   [16:0] zext_ln19_fu_202_p1;
wire   [16:0] empty_129_fu_210_p2;
wire   [16:0] j_cast_i_fu_198_p1;
wire   [16:0] add_ln22_fu_220_p2;
wire   [7:0] empty_fu_206_p1;
wire   [0:0] tmp_fu_236_p3;
wire   [0:0] icmp_ln24_fu_244_p2;
wire   [0:0] icmp_ln25_fu_294_p2;
wire   [0:0] xor_ln19_fu_288_p2;
wire   [1:0] select_ln19_fu_280_p3;
wire   [0:0] or_ln20_fu_312_p2;
wire   [3:0] add_ln20_6_fu_340_p2;
wire   [17:0] ii_cast_i_fu_354_p1;
wire   [7:0] ii_cast_fu_358_p1;
wire   [17:0] empty_130_fu_362_p2;
wire   [17:0] zext_ln20_fu_378_p1;
wire   [17:0] add_ln22_6_fu_386_p2;
wire   [0:0] tmp_74_fu_391_p3;
wire   [0:0] icmp_ln24_6_fu_399_p2;
wire   [0:0] or_ln23_fu_405_p2;
wire   [0:0] empty_131_fu_372_p2;
wire   [2:0] zext_ln22_fu_382_p1;
wire   [2:0] tmp2_fu_417_p2;
wire   [15:0] tmp2_cast_fu_423_p1;
wire   [1:0] add_ln19_fu_432_p2;
wire   [17:0] ii_cast_i_mid1_fu_445_p1;
wire   [7:0] ii_cast_mid1_fu_449_p1;
wire   [17:0] p_mid114_fu_453_p2;
wire   [0:0] p_mid116_fu_463_p2;
wire   [17:0] zext_ln20_6_fu_481_p1;
wire   [17:0] add_ln22_7_fu_487_p2;
wire   [0:0] tmp_75_fu_492_p3;
wire   [0:0] icmp_ln24_7_fu_500_p2;
wire   [0:0] or_ln23_29_fu_506_p2;
wire   [0:0] select_ln19_38_fu_469_p3;
wire   [2:0] zext_ln22_6_fu_484_p1;
wire   [2:0] tmp2_mid1_fu_518_p2;
wire   [15:0] tmp2_cast_mid1_fu_524_p1;
wire   [7:0] row_coord_int_fu_533_p3;
wire   [12:0] tmp_45_fu_553_p3;
wire   [15:0] tmp_s_fu_545_p3;
wire   [15:0] zext_ln32_fu_561_p1;
wire   [15:0] sub_ln32_fu_565_p2;
wire   [15:0] col_coord_int_fu_539_p3;
wire   [7:0] row_coord_int_mid134_fu_582_p3;
wire   [12:0] tmp_48_fu_602_p3;
wire   [15:0] tmp_47_fu_594_p3;
wire   [15:0] zext_ln32_46_fu_610_p1;
wire   [15:0] sub_ln32_1_fu_614_p2;
wire   [15:0] col_coord_int_mid142_fu_588_p3;
wire   [15:0] add_ln32_1_fu_620_p2;
wire   [15:0] add_ln32_fu_571_p2;
wire   [7:0] select_ln19_37_fu_577_p3;
wire   [7:0] row_coord_int_mid1_fu_633_p3;
wire   [12:0] tmp_50_fu_654_p3;
wire   [15:0] tmp_49_fu_646_p3;
wire   [15:0] zext_ln32_47_fu_662_p1;
wire   [15:0] sub_ln32_2_fu_666_p2;
wire   [15:0] col_coord_int_mid1_fu_640_p3;
wire   [15:0] add_ln32_2_fu_672_p2;
wire   [15:0] select_ln19_40_fu_626_p3;
wire   [15:0] select_ln20_28_fu_678_p3;
wire   [3:0] tmp_46_fu_693_p3;
wire   [4:0] zext_ln33_12_fu_700_p1;
wire   [4:0] zext_ln33_fu_690_p1;
wire   [4:0] sub_ln33_fu_704_p2;
wire   [5:0] sub_ln33_cast_fu_710_p1;
wire   [5:0] zext_ln33_13_fu_714_p1;
wire   [5:0] add_ln33_fu_717_p2;
wire   [2:0] trunc_ln33_1_fu_727_p1;
wire   [4:0] p_shl4_cast_fu_731_p3;
wire   [4:0] trunc_ln33_fu_723_p1;
wire   [4:0] sub_ln33_1_fu_739_p2;
wire   [4:0] zext_ln33_14_fu_745_p1;
wire   [5:0] tmp_51_fu_754_p3;
wire   [5:0] empty_134_fu_761_p2;
wire   [6:0] zext_ln32_49_fu_773_p1;
wire   [6:0] zext_ln32_50_fu_777_p1;
wire   [0:0] icmp_ln32_fu_767_p2;
wire   [6:0] sub_ln32_19_fu_791_p2;
wire   [6:0] sub_ln32_20_fu_803_p2;
reg   [63:0] tmp_76_fu_781_p4;
wire   [6:0] xor_ln32_fu_797_p2;
wire   [6:0] select_ln32_fu_809_p3;
wire   [6:0] select_ln32_17_fu_825_p3;
wire   [63:0] select_ln32_16_fu_817_p3;
wire   [63:0] zext_ln32_51_fu_839_p1;
wire   [0:0] select_ln19_39_fu_849_p3;
wire   [63:0] zext_ln32_52_fu_864_p1;
wire   [63:0] lshr_ln32_10_fu_867_p2;
wire   [63:0] and_ln32_fu_873_p2;
wire   [15:0] trunc_ln32_fu_878_p1;
wire   [0:0] select_ln20_27_fu_854_p3;
wire   [15:0] in_data_elem_fu_882_p1;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ii_reg_187 <= select_ln19_36_reg_999;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_187 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_268_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten52_reg_142 <= add_ln19_6_fu_262_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten52_reg_142 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_268_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_153 <= select_ln20_29_fu_346_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_153 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_164 <= select_ln20_26_reg_965;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_164 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_268_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_176 <= add_ln25_fu_334_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_176 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_268_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln20_reg_953 <= add_ln20_fu_306_p2;
        and_ln19_reg_947 <= and_ln19_fu_300_p2;
        icmp_ln20_reg_938 <= icmp_ln20_fu_274_p2;
        select_ln20_reg_959 <= select_ln20_fu_318_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln33_1_reg_1036 <= add_ln33_1_fu_748_p2;
        lshr_ln32_reg_1046 <= lshr_ln32_fu_843_p2;
        sub_ln32_21_reg_1041[6 : 1] <= sub_ln32_21_fu_833_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        and_ln19_reg_947_pp0_iter1_reg <= and_ln19_reg_947;
        icmp_ln19_reg_934 <= icmp_ln19_fu_268_p2;
        icmp_ln19_reg_934_pp0_iter1_reg <= icmp_ln19_reg_934;
        icmp_ln20_reg_938_pp0_iter1_reg <= icmp_ln20_reg_938;
        is_padding_reg_987 <= is_padding_fu_411_p2;
        p_cast1_i_reg_981 <= p_cast1_i_fu_367_p2;
        select_ln20_26_reg_965_pp0_iter1_reg <= select_ln20_26_reg_965;
        select_ln20_reg_959_pp0_iter1_reg <= select_ln20_reg_959;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        and_ln19_reg_947_pp0_iter2_reg <= and_ln19_reg_947_pp0_iter1_reg;
        and_ln19_reg_947_pp0_iter3_reg <= and_ln19_reg_947_pp0_iter2_reg;
        icmp_ln19_reg_934_pp0_iter2_reg <= icmp_ln19_reg_934_pp0_iter1_reg;
        icmp_ln19_reg_934_pp0_iter3_reg <= icmp_ln19_reg_934_pp0_iter2_reg;
        icmp_ln20_reg_938_pp0_iter2_reg <= icmp_ln20_reg_938_pp0_iter1_reg;
        icmp_ln20_reg_938_pp0_iter3_reg <= icmp_ln20_reg_938_pp0_iter2_reg;
        is_padding_reg_987_pp0_iter2_reg <= is_padding_reg_987;
        is_padding_reg_987_pp0_iter3_reg <= is_padding_reg_987_pp0_iter2_reg;
        or_ln23_28_reg_1012_pp0_iter2_reg <= or_ln23_28_reg_1012;
        or_ln23_28_reg_1012_pp0_iter3_reg <= or_ln23_28_reg_1012_pp0_iter2_reg;
        or_ln23_30_reg_1019_pp0_iter2_reg <= or_ln23_30_reg_1019;
        or_ln23_30_reg_1019_pp0_iter3_reg <= or_ln23_30_reg_1019_pp0_iter2_reg;
        select_ln19_36_reg_999_pp0_iter2_reg <= select_ln19_36_reg_999;
        select_ln20_26_reg_965_pp0_iter2_reg <= select_ln20_26_reg_965_pp0_iter1_reg;
        select_ln20_reg_959_pp0_iter2_reg <= select_ln20_reg_959_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'd0 == and_ln19_reg_947) & (icmp_ln20_reg_938 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_132_reg_994 <= empty_132_fu_427_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_26_reg_919 <= or_ln23_26_fu_250_p2;
        p_cast_i_reg_901 <= p_cast_i_fu_216_p1;
        p_cast_reg_913 <= p_cast_fu_230_p2;
        p_mid140_reg_924 <= p_mid140_fu_256_p2;
        sext_ln22_reg_907 <= sext_ln22_fu_226_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        or_ln23_28_reg_1012 <= or_ln23_28_fu_476_p2;
        or_ln23_30_reg_1019 <= or_ln23_30_fu_512_p2;
        p_cast1_i_mid1_reg_1006 <= p_cast1_i_mid1_fu_458_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'd1 == and_ln19_reg_947))) begin
        p_mid1_reg_1026 <= p_mid1_fu_528_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_934 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        select_ln19_36_reg_999 <= select_ln19_36_fu_438_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_268_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln20_26_reg_965 <= select_ln20_26_fu_326_p3;
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
    if (((icmp_ln19_fu_268_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((icmp_ln19_reg_934_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_191_p4 = select_ln19_36_reg_999;
    end else begin
        ap_phi_mux_ii_phi_fu_191_p4 = ii_reg_187;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_934 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_168_p4 = select_ln20_26_reg_965;
    end else begin
        ap_phi_mux_jj_phi_fu_168_p4 = jj_reg_164;
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
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_934_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
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

assign add_ln19_6_fu_262_p2 = (indvar_flatten52_reg_142 + 5'd1);

assign add_ln19_fu_432_p2 = (ap_phi_mux_ii_phi_fu_191_p4 + 2'd1);

assign add_ln20_6_fu_340_p2 = (indvar_flatten_reg_153 + 4'd1);

assign add_ln20_fu_306_p2 = (select_ln19_fu_280_p3 + 2'd1);

assign add_ln22_6_fu_386_p2 = ((sext_ln22_reg_907) + (zext_ln20_fu_378_p1));

assign add_ln22_7_fu_487_p2 = ((sext_ln22_reg_907) + (zext_ln20_6_fu_481_p1));

assign add_ln22_fu_220_p2 = ((j_cast_i_fu_198_p1) + (17'd131071));

assign add_ln25_fu_334_p2 = (select_ln20_fu_318_p3 + 2'd1);

assign add_ln32_1_fu_620_p2 = (sub_ln32_1_fu_614_p2 + col_coord_int_mid142_fu_588_p3);

assign add_ln32_2_fu_672_p2 = (sub_ln32_2_fu_666_p2 + col_coord_int_mid1_fu_640_p3);

assign add_ln32_fu_571_p2 = (sub_ln32_fu_565_p2 + col_coord_int_fu_539_p3);

assign add_ln33_1_fu_748_p2 = (sub_ln33_1_fu_739_p2 + zext_ln33_14_fu_745_p1);

assign add_ln33_fu_717_p2 = ((sub_ln33_cast_fu_710_p1) + (zext_ln33_13_fu_714_p1));

assign and_ln19_fu_300_p2 = (xor_ln19_fu_288_p2 & icmp_ln25_fu_294_p2);

assign and_ln32_fu_873_p2 = (lshr_ln32_reg_1046 & lshr_ln32_10_fu_867_p2);

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

assign col_coord_int_fu_539_p3 = ((is_padding_reg_987[0:0] == 1'b1) ? 16'd0 : empty_132_reg_994);

assign col_coord_int_mid142_fu_588_p3 = ((or_ln23_28_reg_1012[0:0] == 1'b1) ? 16'd0 : p_mid140_reg_924);

assign col_coord_int_mid1_fu_640_p3 = ((or_ln23_30_reg_1019[0:0] == 1'b1) ? 16'd0 : p_mid1_reg_1026);

assign empty_129_fu_210_p2 = ((zext_ln19_fu_202_p1) + (17'd131071));

assign empty_130_fu_362_p2 = ((p_cast_i_reg_901) + (ii_cast_i_fu_354_p1));

assign empty_131_fu_372_p2 = ((empty_130_fu_362_p2 > 18'd223) ? 1'b1 : 1'b0);

assign empty_132_fu_427_p2 = ((tmp2_cast_fu_423_p1) + (j_19));

assign empty_134_fu_761_p2 = (tmp_51_fu_754_p3 | 6'd15);

assign empty_fu_206_p1 = i_19[7:0];

assign icmp_ln19_fu_268_p2 = ((indvar_flatten52_reg_142 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_274_p2 = ((indvar_flatten_reg_153 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln24_6_fu_399_p2 = (((add_ln22_6_fu_386_p2) > (18'd223)) ? 1'b1 : 1'b0);

assign icmp_ln24_7_fu_500_p2 = (((add_ln22_7_fu_487_p2) > (18'd223)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_244_p2 = (((add_ln22_fu_220_p2) > (17'd223)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_294_p2 = ((kk_reg_176 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_767_p2 = ((tmp_51_fu_754_p3 > empty_134_fu_761_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_address0 = zext_ln33_15_fu_860_p1;

assign ifmap_vec_d0 = ((select_ln20_27_fu_854_p3[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_882_p1);

assign ii_cast_fu_358_p1 = ap_phi_mux_ii_phi_fu_191_p4;

assign ii_cast_i_fu_354_p1 = ap_phi_mux_ii_phi_fu_191_p4;

assign ii_cast_i_mid1_fu_445_p1 = add_ln19_fu_432_p2;

assign ii_cast_mid1_fu_449_p1 = add_ln19_fu_432_p2;

assign in_data_address0 = zext_ln32_48_fu_685_p1;

assign in_data_elem_fu_882_p1 = trunc_ln32_fu_878_p1;

assign is_padding_fu_411_p2 = (or_ln23_fu_405_p2 | empty_131_fu_372_p2);

assign j_cast_i_fu_198_p1 = j_19;

assign lshr_ln32_10_fu_867_p2 = 64'd18446744073709551615 >> zext_ln32_52_fu_864_p1;

assign lshr_ln32_fu_843_p2 = select_ln32_16_fu_817_p3 >> zext_ln32_51_fu_839_p1;

assign or_ln20_fu_312_p2 = (icmp_ln20_fu_274_p2 | and_ln19_fu_300_p2);

assign or_ln23_26_fu_250_p2 = (tmp_fu_236_p3 | icmp_ln24_fu_244_p2);

assign or_ln23_28_fu_476_p2 = (p_mid116_fu_463_p2 | or_ln23_26_reg_919);

assign or_ln23_29_fu_506_p2 = (tmp_75_fu_492_p3 | icmp_ln24_7_fu_500_p2);

assign or_ln23_30_fu_512_p2 = (select_ln19_38_fu_469_p3 | or_ln23_29_fu_506_p2);

assign or_ln23_fu_405_p2 = (tmp_74_fu_391_p3 | icmp_ln24_6_fu_399_p2);

assign p_cast1_i_fu_367_p2 = (p_cast_reg_913 + ii_cast_fu_358_p1);

assign p_cast1_i_mid1_fu_458_p2 = (p_cast_reg_913 + ii_cast_mid1_fu_449_p1);

assign p_cast_fu_230_p2 = ((empty_fu_206_p1) + (8'd255));

assign p_cast_i_fu_216_p1 = (empty_129_fu_210_p2);

assign p_mid114_fu_453_p2 = ((p_cast_i_reg_901) + (ii_cast_i_mid1_fu_445_p1));

assign p_mid116_fu_463_p2 = ((p_mid114_fu_453_p2 > 18'd223) ? 1'b1 : 1'b0);

assign p_mid140_fu_256_p2 = ((j_19) + (16'd65535));

assign p_mid1_fu_528_p2 = ((tmp2_cast_mid1_fu_524_p1) + (j_19));

assign p_shl4_cast_fu_731_p3 = {{trunc_ln33_1_fu_727_p1}, {2'd0}};

assign row_coord_int_fu_533_p3 = ((is_padding_reg_987[0:0] == 1'b1) ? 8'd0 : p_cast1_i_reg_981);

assign row_coord_int_mid134_fu_582_p3 = ((or_ln23_28_reg_1012[0:0] == 1'b1) ? 8'd0 : p_cast1_i_mid1_reg_1006);

assign row_coord_int_mid1_fu_633_p3 = ((or_ln23_30_reg_1019[0:0] == 1'b1) ? 8'd0 : select_ln19_37_fu_577_p3);

assign select_ln19_36_fu_438_p3 = ((icmp_ln20_reg_938[0:0] == 1'b1) ? add_ln19_fu_432_p2 : ap_phi_mux_ii_phi_fu_191_p4);

assign select_ln19_37_fu_577_p3 = ((icmp_ln20_reg_938_pp0_iter1_reg[0:0] == 1'b1) ? p_cast1_i_mid1_reg_1006 : p_cast1_i_reg_981);

assign select_ln19_38_fu_469_p3 = ((icmp_ln20_reg_938[0:0] == 1'b1) ? p_mid116_fu_463_p2 : empty_131_fu_372_p2);

assign select_ln19_39_fu_849_p3 = ((icmp_ln20_reg_938_pp0_iter3_reg[0:0] == 1'b1) ? or_ln23_28_reg_1012_pp0_iter3_reg : is_padding_reg_987_pp0_iter3_reg);

assign select_ln19_40_fu_626_p3 = ((icmp_ln20_reg_938_pp0_iter1_reg[0:0] == 1'b1) ? add_ln32_1_fu_620_p2 : add_ln32_fu_571_p2);

assign select_ln19_fu_280_p3 = ((icmp_ln20_fu_274_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_168_p4);

assign select_ln20_26_fu_326_p3 = ((and_ln19_fu_300_p2[0:0] == 1'b1) ? add_ln20_fu_306_p2 : select_ln19_fu_280_p3);

assign select_ln20_27_fu_854_p3 = ((and_ln19_reg_947_pp0_iter3_reg[0:0] == 1'b1) ? or_ln23_30_reg_1019_pp0_iter3_reg : select_ln19_39_fu_849_p3);

assign select_ln20_28_fu_678_p3 = ((and_ln19_reg_947_pp0_iter1_reg[0:0] == 1'b1) ? add_ln32_2_fu_672_p2 : select_ln19_40_fu_626_p3);

assign select_ln20_29_fu_346_p3 = ((icmp_ln20_fu_274_p2[0:0] == 1'b1) ? 4'd1 : add_ln20_6_fu_340_p2);

assign select_ln20_fu_318_p3 = ((or_ln20_fu_312_p2[0:0] == 1'b1) ? 2'd0 : kk_reg_176);

assign select_ln32_16_fu_817_p3 = ((icmp_ln32_fu_767_p2[0:0] == 1'b1) ? tmp_76_fu_781_p4 : in_data_q0);

assign select_ln32_17_fu_825_p3 = ((icmp_ln32_fu_767_p2[0:0] == 1'b1) ? xor_ln32_fu_797_p2 : zext_ln32_49_fu_773_p1);

assign select_ln32_fu_809_p3 = ((icmp_ln32_fu_767_p2[0:0] == 1'b1) ? sub_ln32_19_fu_791_p2 : sub_ln32_20_fu_803_p2);

assign sext_ln22_fu_226_p1 = add_ln22_fu_220_p2;

assign sub_ln32_19_fu_791_p2 = (zext_ln32_49_fu_773_p1 - zext_ln32_50_fu_777_p1);

assign sub_ln32_1_fu_614_p2 = (tmp_47_fu_594_p3 - zext_ln32_46_fu_610_p1);

assign sub_ln32_20_fu_803_p2 = (zext_ln32_50_fu_777_p1 - zext_ln32_49_fu_773_p1);

assign sub_ln32_21_fu_833_p2 = (7'd63 - select_ln32_fu_809_p3);

assign sub_ln32_2_fu_666_p2 = (tmp_49_fu_646_p3 - zext_ln32_47_fu_662_p1);

assign sub_ln32_fu_565_p2 = (tmp_s_fu_545_p3 - zext_ln32_fu_561_p1);

assign sub_ln33_1_fu_739_p2 = (p_shl4_cast_fu_731_p3 - trunc_ln33_fu_723_p1);

assign sub_ln33_cast_fu_710_p1 = (sub_ln33_fu_704_p2);

assign sub_ln33_fu_704_p2 = (zext_ln33_12_fu_700_p1 - zext_ln33_fu_690_p1);

assign tmp2_cast_fu_423_p1 = (tmp2_fu_417_p2);

assign tmp2_cast_mid1_fu_524_p1 = (tmp2_mid1_fu_518_p2);

assign tmp2_fu_417_p2 = ((zext_ln22_fu_382_p1) + (3'd7));

assign tmp2_mid1_fu_518_p2 = ((zext_ln22_6_fu_484_p1) + (3'd7));

assign tmp_45_fu_553_p3 = {{row_coord_int_fu_533_p3}, {5'd0}};

assign tmp_46_fu_693_p3 = {{select_ln19_36_reg_999_pp0_iter2_reg}, {2'd0}};

assign tmp_47_fu_594_p3 = {{row_coord_int_mid134_fu_582_p3}, {8'd0}};

assign tmp_48_fu_602_p3 = {{row_coord_int_mid134_fu_582_p3}, {5'd0}};

assign tmp_49_fu_646_p3 = {{row_coord_int_mid1_fu_633_p3}, {8'd0}};

assign tmp_50_fu_654_p3 = {{row_coord_int_mid1_fu_633_p3}, {5'd0}};

assign tmp_51_fu_754_p3 = {{select_ln20_reg_959_pp0_iter2_reg}, {4'd0}};

assign tmp_74_fu_391_p3 = add_ln22_6_fu_386_p2[32'd17];

assign tmp_75_fu_492_p3 = add_ln22_7_fu_487_p2[32'd17];

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_76_fu_781_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_76_fu_781_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_fu_236_p3 = add_ln22_fu_220_p2[32'd16];

assign tmp_s_fu_545_p3 = {{row_coord_int_fu_533_p3}, {8'd0}};

assign trunc_ln32_fu_878_p1 = and_ln32_fu_873_p2[15:0];

assign trunc_ln33_1_fu_727_p1 = add_ln33_fu_717_p2[2:0];

assign trunc_ln33_fu_723_p1 = add_ln33_fu_717_p2[4:0];

assign xor_ln19_fu_288_p2 = (icmp_ln20_fu_274_p2 ^ 1'd1);

assign xor_ln32_fu_797_p2 = (zext_ln32_49_fu_773_p1 ^ 7'd63);

assign zext_ln19_fu_202_p1 = i_19;

assign zext_ln20_6_fu_481_p1 = add_ln20_reg_953;

assign zext_ln20_fu_378_p1 = jj_reg_164;

assign zext_ln22_6_fu_484_p1 = add_ln20_reg_953;

assign zext_ln22_fu_382_p1 = jj_reg_164;

assign zext_ln32_46_fu_610_p1 = tmp_48_fu_602_p3;

assign zext_ln32_47_fu_662_p1 = tmp_50_fu_654_p3;

assign zext_ln32_48_fu_685_p1 = select_ln20_28_fu_678_p3;

assign zext_ln32_49_fu_773_p1 = tmp_51_fu_754_p3;

assign zext_ln32_50_fu_777_p1 = empty_134_fu_761_p2;

assign zext_ln32_51_fu_839_p1 = select_ln32_17_fu_825_p3;

assign zext_ln32_52_fu_864_p1 = sub_ln32_21_reg_1041;

assign zext_ln32_fu_561_p1 = tmp_45_fu_553_p3;

assign zext_ln33_12_fu_700_p1 = tmp_46_fu_693_p3;

assign zext_ln33_13_fu_714_p1 = select_ln20_26_reg_965_pp0_iter2_reg;

assign zext_ln33_14_fu_745_p1 = select_ln20_reg_959_pp0_iter2_reg;

assign zext_ln33_15_fu_860_p1 = add_ln33_1_reg_1036;

assign zext_ln33_fu_690_p1 = select_ln19_36_reg_999_pp0_iter2_reg;

always @ (posedge ap_clk) begin
    sub_ln32_21_reg_1041[0] <= 1'b0;
end

endmodule //td_fused_top_tdf1_readInputs19
