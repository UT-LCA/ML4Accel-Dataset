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

module td_fused_top_tdf8_readInputs57 (
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
output  [12:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_13;
input  [15:0] j_13;
output  [8:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;
output  [8:0] ifmap_vec_address1;
output   ifmap_vec_ce1;
output   ifmap_vec_we1;
output  [15:0] ifmap_vec_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg[8:0] ifmap_vec_address0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;
reg[15:0] ifmap_vec_d0;
reg[8:0] ifmap_vec_address1;
reg ifmap_vec_ce1;
reg ifmap_vec_we1;
reg[15:0] ifmap_vec_d1;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [6:0] indvar_flatten47_reg_192;
reg   [1:0] ii_reg_204;
reg   [5:0] indvar_flatten_reg_216;
reg   [1:0] jj_reg_227;
reg   [5:0] kk_0_i_reg_239;
wire   [17:0] p_cast_i_fu_268_p1;
reg   [17:0] p_cast_i_reg_929;
wire   [9:0] trunc_ln22_fu_272_p1;
reg   [9:0] trunc_ln22_reg_935;
wire   [17:0] sext_ln22_fu_282_p1;
reg   [17:0] sext_ln22_reg_941;
wire   [4:0] p_cast_fu_286_p2;
reg   [4:0] p_cast_reg_947;
wire   [0:0] or_ln23_1_fu_306_p2;
reg   [0:0] or_ln23_1_reg_953;
wire   [9:0] p_mid137_fu_312_p2;
reg   [9:0] p_mid137_reg_958;
wire   [4:0] p_cast5_i_fu_331_p2;
reg   [4:0] p_cast5_i_reg_963;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_371_p2;
reg   [0:0] is_padding_reg_969;
wire   [0:0] icmp_ln19_fu_377_p2;
reg   [0:0] icmp_ln19_reg_976;
reg   [0:0] icmp_ln19_reg_976_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_976_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_383_p2;
reg   [1:0] add_ln19_reg_980;
wire   [0:0] icmp_ln20_fu_389_p2;
reg   [0:0] icmp_ln20_reg_985;
wire   [1:0] select_ln19_fu_395_p3;
reg   [1:0] select_ln19_reg_997;
wire   [4:0] p_cast5_i_mid1_fu_416_p2;
reg   [4:0] p_cast5_i_mid1_reg_1002;
wire   [0:0] or_ln23_3_fu_435_p2;
reg   [0:0] or_ln23_3_reg_1008;
wire   [1:0] add_ln20_fu_440_p2;
reg   [1:0] add_ln20_reg_1015;
wire   [0:0] or_ln23_5_fu_475_p2;
reg   [0:0] or_ln23_5_reg_1021;
wire   [5:0] add_ln20_1_fu_481_p2;
reg   [5:0] add_ln20_1_reg_1028;
wire   [6:0] add_ln19_1_fu_487_p2;
reg   [6:0] add_ln19_1_reg_1033;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_state7_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_1_fu_525_p3;
reg   [1:0] select_ln19_1_reg_1038;
wire   [5:0] select_ln20_fu_589_p3;
reg   [5:0] select_ln20_reg_1045;
wire   [1:0] select_ln20_1_fu_597_p3;
reg   [1:0] select_ln20_1_reg_1051;
wire   [0:0] select_ln20_2_fu_606_p3;
reg   [0:0] select_ln20_2_reg_1057;
reg   [0:0] select_ln20_2_reg_1057_pp0_iter1_reg;
wire   [4:0] empty_63_fu_702_p1;
reg   [4:0] empty_63_reg_1065;
reg   [4:0] empty_63_reg_1065_pp0_iter1_reg;
wire   [5:0] select_ln20_5_fu_729_p3;
reg   [5:0] select_ln20_5_reg_1077;
wire   [5:0] add_ln25_fu_735_p2;
reg   [5:0] add_ln25_reg_1082;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_767_p2;
reg   [5:0] add_ln33_reg_1087;
wire   [8:0] add_ln33_1_fu_788_p2;
reg   [8:0] add_ln33_1_reg_1094;
wire   [15:0] select_ln33_5_fu_867_p3;
reg   [15:0] select_ln33_5_reg_1099;
wire   [15:0] select_ln33_6_fu_888_p3;
reg   [15:0] select_ln33_6_reg_1104;
reg    ap_block_state1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter2;
reg   [6:0] ap_phi_mux_indvar_flatten47_phi_fu_196_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_208_p4;
reg   [5:0] ap_phi_mux_indvar_flatten_phi_fu_220_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_231_p4;
reg   [5:0] ap_phi_mux_kk_0_i_phi_fu_243_p4;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln32_fu_724_p1;
wire   [63:0] zext_ln33_5_fu_794_p1;
wire   [63:0] sext_ln33_fu_826_p1;
wire   [63:0] sext_ln33_1_fu_907_p1;
wire   [63:0] sext_ln33_2_fu_924_p1;
wire   [15:0] select_ln33_fu_806_p3;
wire   [15:0] select_ln33_4_fu_845_p3;
wire   [16:0] zext_ln19_fu_254_p1;
wire   [16:0] empty_58_fu_262_p2;
wire   [16:0] j_cast_i_fu_250_p1;
wire   [16:0] add_ln22_fu_276_p2;
wire   [4:0] empty_fu_258_p1;
wire   [0:0] tmp_fu_292_p3;
wire   [0:0] icmp_ln24_fu_300_p2;
wire   [17:0] ii_cast_i_fu_318_p1;
wire   [4:0] ii_cast_fu_322_p1;
wire   [17:0] empty_59_fu_326_p2;
wire   [17:0] zext_ln20_fu_342_p1;
wire   [17:0] add_ln22_1_fu_346_p2;
wire   [0:0] tmp_3_fu_351_p3;
wire   [0:0] icmp_ln24_1_fu_359_p2;
wire   [0:0] or_ln23_fu_365_p2;
wire   [0:0] empty_60_fu_336_p2;
wire   [17:0] ii_cast_i_mid1_fu_403_p1;
wire   [4:0] ii_cast_mid1_fu_407_p1;
wire   [17:0] p_mid111_fu_411_p2;
wire   [0:0] p_mid113_fu_421_p2;
wire   [17:0] zext_ln20_1_fu_446_p1;
wire   [17:0] add_ln22_2_fu_450_p2;
wire   [0:0] tmp_4_fu_455_p3;
wire   [0:0] icmp_ln24_2_fu_463_p2;
wire   [0:0] or_ln23_4_fu_469_p2;
wire   [0:0] select_ln19_3_fu_427_p3;
wire   [2:0] zext_ln22_fu_493_p1;
wire   [2:0] tmp2_fu_503_p2;
wire   [9:0] tmp2_cast_fu_509_p1;
wire   [9:0] empty_61_fu_513_p2;
wire   [4:0] row_coord_int_mid131_fu_541_p3;
wire   [4:0] row_coord_int_fu_497_p3;
wire   [9:0] col_coord_int_mid139_fu_547_p3;
wire   [9:0] col_coord_int_fu_518_p3;
wire   [0:0] icmp_ln25_fu_572_p2;
wire   [0:0] xor_ln19_fu_567_p2;
wire   [0:0] and_ln19_fu_578_p2;
wire   [0:0] or_ln20_fu_584_p2;
wire   [0:0] select_ln19_4_fu_536_p3;
wire   [4:0] select_ln19_2_fu_531_p3;
wire   [2:0] zext_ln22_1_fu_603_p1;
wire   [2:0] tmp2_mid1_fu_620_p2;
wire   [9:0] tmp2_cast_mid1_fu_626_p1;
wire   [9:0] p_mid1_fu_630_p2;
wire   [4:0] row_coord_int_mid1_fu_613_p3;
wire   [4:0] select_ln19_5_fu_553_p3;
wire   [4:0] select_ln20_3_fu_642_p3;
wire   [9:0] tmp_1_fu_650_p3;
wire   [6:0] tmp_2_fu_662_p3;
wire   [10:0] zext_ln32_fu_658_p1;
wire   [10:0] zext_ln32_7_fu_670_p1;
wire   [10:0] sub_ln32_fu_674_p2;
wire   [9:0] col_coord_int_mid1_fu_635_p3;
wire   [9:0] select_ln19_6_fu_560_p3;
wire   [9:0] select_ln20_4_fu_684_p3;
wire   [11:0] sext_ln20_fu_680_p1;
wire   [11:0] zext_ln32_8_fu_692_p1;
wire   [11:0] add_ln32_fu_696_p2;
wire   [2:0] lshr_ln_fu_706_p4;
wire   [14:0] tmp_5_fu_716_p3;
wire   [3:0] tmp_s_fu_743_p3;
wire   [4:0] zext_ln33_2_fu_750_p1;
wire   [4:0] zext_ln33_fu_740_p1;
wire   [4:0] sub_ln33_fu_754_p2;
wire   [5:0] sub_ln33_cast_fu_760_p1;
wire   [5:0] zext_ln33_3_fu_764_p1;
wire   [3:0] trunc_ln33_fu_773_p1;
wire   [8:0] tmp_13_cast_fu_777_p3;
wire   [8:0] zext_ln33_4_fu_785_p1;
wire   [15:0] trunc_ln32_fu_798_p1;
wire   [15:0] bitcast_ln32_fu_802_p1;
wire   [4:0] or_ln25_fu_814_p2;
wire   [10:0] tmp_6_fu_819_p3;
wire   [15:0] tmp_12_i_fu_831_p4;
wire   [15:0] bitcast_ln32_4_fu_841_p1;
wire   [15:0] tmp_13_i_fu_853_p4;
wire   [15:0] bitcast_ln32_5_fu_863_p1;
wire   [15:0] tmp_14_i_fu_874_p4;
wire   [15:0] bitcast_ln32_6_fu_884_p1;
wire   [4:0] or_ln25_3_fu_895_p2;
wire   [10:0] tmp_7_fu_900_p3;
wire   [4:0] or_ln25_4_fu_912_p2;
wire   [10:0] tmp_8_fu_917_p3;
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
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ii_reg_204 <= select_ln19_1_reg_1038;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_204 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten47_reg_192 <= add_ln19_1_reg_1033;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_192 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten_reg_216 <= select_ln20_5_reg_1077;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_216 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_227 <= select_ln20_1_reg_1051;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_227 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        kk_0_i_reg_239 <= add_ln25_reg_1082;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_i_reg_239 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln19_1_reg_1033 <= add_ln19_1_fu_487_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_377_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_980 <= add_ln19_fu_383_p2;
        add_ln20_1_reg_1028 <= add_ln20_1_fu_481_p2;
        add_ln20_reg_1015 <= add_ln20_fu_440_p2;
        icmp_ln20_reg_985 <= icmp_ln20_fu_389_p2;
        or_ln23_3_reg_1008 <= or_ln23_3_fu_435_p2;
        or_ln23_5_reg_1021 <= or_ln23_5_fu_475_p2;
        p_cast5_i_mid1_reg_1002 <= p_cast5_i_mid1_fu_416_p2;
        select_ln19_reg_997 <= select_ln19_fu_395_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        add_ln25_reg_1082 <= add_ln25_fu_735_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln33_1_reg_1094 <= add_ln33_1_fu_788_p2;
        add_ln33_reg_1087 <= add_ln33_fu_767_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_63_reg_1065 <= empty_63_fu_702_p1;
        select_ln20_2_reg_1057 <= select_ln20_2_fu_606_p3;
        select_ln20_reg_1045 <= select_ln20_fu_589_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_63_reg_1065_pp0_iter1_reg <= empty_63_reg_1065;
        select_ln20_2_reg_1057_pp0_iter1_reg <= select_ln20_2_reg_1057;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln19_reg_976 <= icmp_ln19_fu_377_p2;
        icmp_ln19_reg_976_pp0_iter1_reg <= icmp_ln19_reg_976;
        icmp_ln19_reg_976_pp0_iter2_reg <= icmp_ln19_reg_976_pp0_iter1_reg;
        is_padding_reg_969 <= is_padding_fu_371_p2;
        p_cast5_i_reg_963 <= p_cast5_i_fu_331_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_1_reg_953 <= or_ln23_1_fu_306_p2;
        p_cast_i_reg_929 <= p_cast_i_fu_268_p1;
        p_cast_reg_947 <= p_cast_fu_286_p2;
        p_mid137_reg_958 <= p_mid137_fu_312_p2;
        sext_ln22_reg_941 <= sext_ln22_fu_282_p1;
        trunc_ln22_reg_935 <= trunc_ln22_fu_272_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln19_1_reg_1038 <= select_ln19_1_fu_525_p3;
        select_ln20_1_reg_1051 <= select_ln20_1_fu_597_p3;
        select_ln20_5_reg_1077 <= select_ln20_5_fu_729_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln33_5_reg_1099 <= select_ln33_5_fu_867_p3;
        select_ln33_6_reg_1104 <= select_ln33_6_fu_888_p3;
    end
end

always @ (*) begin
    if ((icmp_ln19_reg_976 == 1'd1)) begin
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
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_208_p4 = select_ln19_1_reg_1038;
    end else begin
        ap_phi_mux_ii_phi_fu_208_p4 = ii_reg_204;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_196_p4 = add_ln19_1_reg_1033;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_196_p4 = indvar_flatten47_reg_192;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten_phi_fu_220_p4 = select_ln20_5_reg_1077;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_220_p4 = indvar_flatten_reg_216;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_231_p4 = select_ln20_1_reg_1051;
    end else begin
        ap_phi_mux_jj_phi_fu_231_p4 = jj_reg_227;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_kk_0_i_phi_fu_243_p4 = add_ln25_reg_1082;
    end else begin
        ap_phi_mux_kk_0_i_phi_fu_243_p4 = kk_0_i_reg_239;
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
            ifmap_vec_address0 = sext_ln33_2_fu_924_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_address0 = sext_ln33_fu_826_p1;
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
            ifmap_vec_address1 = sext_ln33_1_fu_907_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_5_fu_794_p1;
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
            ifmap_vec_d0 = select_ln33_6_reg_1104;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_4_fu_845_p3;
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
            ifmap_vec_d1 = select_ln33_5_reg_1099;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_d1 = select_ln33_fu_806_p3;
        end else begin
            ifmap_vec_d1 = 'bx;
        end
    end else begin
        ifmap_vec_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln19_reg_976_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
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
            if ((~((icmp_ln19_reg_976 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((icmp_ln19_reg_976 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
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

assign add_ln19_1_fu_487_p2 = (indvar_flatten47_reg_192 + 7'd1);

assign add_ln19_fu_383_p2 = (ap_phi_mux_ii_phi_fu_208_p4 + 2'd1);

assign add_ln20_1_fu_481_p2 = (ap_phi_mux_indvar_flatten_phi_fu_220_p4 + 6'd1);

assign add_ln20_fu_440_p2 = (select_ln19_fu_395_p3 + 2'd1);

assign add_ln22_1_fu_346_p2 = ((sext_ln22_reg_941) + (zext_ln20_fu_342_p1));

assign add_ln22_2_fu_450_p2 = ((sext_ln22_reg_941) + (zext_ln20_1_fu_446_p1));

assign add_ln22_fu_276_p2 = ((j_cast_i_fu_250_p1) + (17'd131071));

assign add_ln25_fu_735_p2 = (select_ln20_reg_1045 + 6'd4);

assign add_ln32_fu_696_p2 = ((sext_ln20_fu_680_p1) + (zext_ln32_8_fu_692_p1));

assign add_ln33_1_fu_788_p2 = (tmp_13_cast_fu_777_p3 + zext_ln33_4_fu_785_p1);

assign add_ln33_fu_767_p2 = ((sub_ln33_cast_fu_760_p1) + (zext_ln33_3_fu_764_p1));

assign and_ln19_fu_578_p2 = (xor_ln19_fu_567_p2 & icmp_ln25_fu_572_p2);

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

assign bitcast_ln32_4_fu_841_p1 = tmp_12_i_fu_831_p4;

assign bitcast_ln32_5_fu_863_p1 = tmp_13_i_fu_853_p4;

assign bitcast_ln32_6_fu_884_p1 = tmp_14_i_fu_874_p4;

assign bitcast_ln32_fu_802_p1 = trunc_ln32_fu_798_p1;

assign col_coord_int_fu_518_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 10'd0 : empty_61_fu_513_p2);

assign col_coord_int_mid139_fu_547_p3 = ((or_ln23_3_reg_1008[0:0] == 1'b1) ? 10'd0 : p_mid137_reg_958);

assign col_coord_int_mid1_fu_635_p3 = ((or_ln23_5_reg_1021[0:0] == 1'b1) ? 10'd0 : p_mid1_fu_630_p2);

assign empty_58_fu_262_p2 = ((zext_ln19_fu_254_p1) + (17'd131071));

assign empty_59_fu_326_p2 = ((p_cast_i_reg_929) + (ii_cast_i_fu_318_p1));

assign empty_60_fu_336_p2 = ((empty_59_fu_326_p2 > 18'd27) ? 1'b1 : 1'b0);

assign empty_61_fu_513_p2 = ((tmp2_cast_fu_509_p1) + (trunc_ln22_reg_935));

assign empty_63_fu_702_p1 = select_ln20_fu_589_p3[4:0];

assign empty_fu_258_p1 = i_13[4:0];

assign icmp_ln19_fu_377_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_196_p4 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_389_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_220_p4 == 6'd24) ? 1'b1 : 1'b0);

assign icmp_ln24_1_fu_359_p2 = (((add_ln22_1_fu_346_p2) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_2_fu_463_p2 = (((add_ln22_2_fu_450_p2) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_300_p2 = (((add_ln22_fu_276_p2) > (17'd27)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_572_p2 = ((ap_phi_mux_kk_0_i_phi_fu_243_p4 == 6'd32) ? 1'b1 : 1'b0);

assign ii_cast_fu_322_p1 = ap_phi_mux_ii_phi_fu_208_p4;

assign ii_cast_i_fu_318_p1 = ap_phi_mux_ii_phi_fu_208_p4;

assign ii_cast_i_mid1_fu_403_p1 = add_ln19_fu_383_p2;

assign ii_cast_mid1_fu_407_p1 = add_ln19_fu_383_p2;

assign in_data_address0 = sext_ln32_fu_724_p1;

assign is_padding_fu_371_p2 = (or_ln23_fu_365_p2 | empty_60_fu_336_p2);

assign j_cast_i_fu_250_p1 = j_13;

assign lshr_ln_fu_706_p4 = {{select_ln20_fu_589_p3[4:2]}};

assign or_ln20_fu_584_p2 = (icmp_ln20_reg_985 | and_ln19_fu_578_p2);

assign or_ln23_1_fu_306_p2 = (tmp_fu_292_p3 | icmp_ln24_fu_300_p2);

assign or_ln23_3_fu_435_p2 = (p_mid113_fu_421_p2 | or_ln23_1_reg_953);

assign or_ln23_4_fu_469_p2 = (tmp_4_fu_455_p3 | icmp_ln24_2_fu_463_p2);

assign or_ln23_5_fu_475_p2 = (select_ln19_3_fu_427_p3 | or_ln23_4_fu_469_p2);

assign or_ln23_fu_365_p2 = (tmp_3_fu_351_p3 | icmp_ln24_1_fu_359_p2);

assign or_ln25_3_fu_895_p2 = (empty_63_reg_1065_pp0_iter1_reg | 5'd2);

assign or_ln25_4_fu_912_p2 = (empty_63_reg_1065_pp0_iter1_reg | 5'd3);

assign or_ln25_fu_814_p2 = (empty_63_reg_1065_pp0_iter1_reg | 5'd1);

assign p_cast5_i_fu_331_p2 = (p_cast_reg_947 + ii_cast_fu_322_p1);

assign p_cast5_i_mid1_fu_416_p2 = (p_cast_reg_947 + ii_cast_mid1_fu_407_p1);

assign p_cast_fu_286_p2 = ((empty_fu_258_p1) + (5'd31));

assign p_cast_i_fu_268_p1 = (empty_58_fu_262_p2);

assign p_mid111_fu_411_p2 = ((p_cast_i_reg_929) + (ii_cast_i_mid1_fu_403_p1));

assign p_mid113_fu_421_p2 = ((p_mid111_fu_411_p2 > 18'd27) ? 1'b1 : 1'b0);

assign p_mid137_fu_312_p2 = ((trunc_ln22_fu_272_p1) + (10'd1023));

assign p_mid1_fu_630_p2 = ((tmp2_cast_mid1_fu_626_p1) + (trunc_ln22_reg_935));

assign row_coord_int_fu_497_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 5'd0 : p_cast5_i_reg_963);

assign row_coord_int_mid131_fu_541_p3 = ((or_ln23_3_reg_1008[0:0] == 1'b1) ? 5'd0 : p_cast5_i_mid1_reg_1002);

assign row_coord_int_mid1_fu_613_p3 = ((or_ln23_5_reg_1021[0:0] == 1'b1) ? 5'd0 : select_ln19_2_fu_531_p3);

assign select_ln19_1_fu_525_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? add_ln19_reg_980 : ii_reg_204);

assign select_ln19_2_fu_531_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? p_cast5_i_mid1_reg_1002 : p_cast5_i_reg_963);

assign select_ln19_3_fu_427_p3 = ((icmp_ln20_fu_389_p2[0:0] == 1'b1) ? p_mid113_fu_421_p2 : empty_60_fu_336_p2);

assign select_ln19_4_fu_536_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? or_ln23_3_reg_1008 : is_padding_reg_969);

assign select_ln19_5_fu_553_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? row_coord_int_mid131_fu_541_p3 : row_coord_int_fu_497_p3);

assign select_ln19_6_fu_560_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? col_coord_int_mid139_fu_547_p3 : col_coord_int_fu_518_p3);

assign select_ln19_fu_395_p3 = ((icmp_ln20_fu_389_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_231_p4);

assign select_ln20_1_fu_597_p3 = ((and_ln19_fu_578_p2[0:0] == 1'b1) ? add_ln20_reg_1015 : select_ln19_reg_997);

assign select_ln20_2_fu_606_p3 = ((and_ln19_fu_578_p2[0:0] == 1'b1) ? or_ln23_5_reg_1021 : select_ln19_4_fu_536_p3);

assign select_ln20_3_fu_642_p3 = ((and_ln19_fu_578_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_613_p3 : select_ln19_5_fu_553_p3);

assign select_ln20_4_fu_684_p3 = ((and_ln19_fu_578_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_635_p3 : select_ln19_6_fu_560_p3);

assign select_ln20_5_fu_729_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? 6'd1 : add_ln20_1_reg_1028);

assign select_ln20_fu_589_p3 = ((or_ln20_fu_584_p2[0:0] == 1'b1) ? 6'd0 : ap_phi_mux_kk_0_i_phi_fu_243_p4);

assign select_ln33_4_fu_845_p3 = ((select_ln20_2_reg_1057_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_4_fu_841_p1);

assign select_ln33_5_fu_867_p3 = ((select_ln20_2_reg_1057_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_5_fu_863_p1);

assign select_ln33_6_fu_888_p3 = ((select_ln20_2_reg_1057_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_6_fu_884_p1);

assign select_ln33_fu_806_p3 = ((select_ln20_2_reg_1057_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_802_p1);

assign sext_ln20_fu_680_p1 = (sub_ln32_fu_674_p2);

assign sext_ln22_fu_282_p1 = add_ln22_fu_276_p2;

assign sext_ln32_fu_724_p1 = (tmp_5_fu_716_p3);

assign sext_ln33_1_fu_907_p1 = (tmp_7_fu_900_p3);

assign sext_ln33_2_fu_924_p1 = (tmp_8_fu_917_p3);

assign sext_ln33_fu_826_p1 = (tmp_6_fu_819_p3);

assign sub_ln32_fu_674_p2 = (zext_ln32_fu_658_p1 - zext_ln32_7_fu_670_p1);

assign sub_ln33_cast_fu_760_p1 = (sub_ln33_fu_754_p2);

assign sub_ln33_fu_754_p2 = (zext_ln33_2_fu_750_p1 - zext_ln33_fu_740_p1);

assign tmp2_cast_fu_509_p1 = (tmp2_fu_503_p2);

assign tmp2_cast_mid1_fu_626_p1 = (tmp2_mid1_fu_620_p2);

assign tmp2_fu_503_p2 = ((zext_ln22_fu_493_p1) + (3'd7));

assign tmp2_mid1_fu_620_p2 = ((zext_ln22_1_fu_603_p1) + (3'd7));

assign tmp_12_i_fu_831_p4 = {{in_data_q0[31:16]}};

assign tmp_13_cast_fu_777_p3 = {{trunc_ln33_fu_773_p1}, {5'd0}};

assign tmp_13_i_fu_853_p4 = {{in_data_q0[47:32]}};

assign tmp_14_i_fu_874_p4 = {{in_data_q0[63:48]}};

assign tmp_1_fu_650_p3 = {{select_ln20_3_fu_642_p3}, {5'd0}};

assign tmp_2_fu_662_p3 = {{select_ln20_3_fu_642_p3}, {2'd0}};

assign tmp_3_fu_351_p3 = add_ln22_1_fu_346_p2[32'd17];

assign tmp_4_fu_455_p3 = add_ln22_2_fu_450_p2[32'd17];

assign tmp_5_fu_716_p3 = {{add_ln32_fu_696_p2}, {lshr_ln_fu_706_p4}};

assign tmp_6_fu_819_p3 = {{add_ln33_reg_1087}, {or_ln25_fu_814_p2}};

assign tmp_7_fu_900_p3 = {{add_ln33_reg_1087}, {or_ln25_3_fu_895_p2}};

assign tmp_8_fu_917_p3 = {{add_ln33_reg_1087}, {or_ln25_4_fu_912_p2}};

assign tmp_fu_292_p3 = add_ln22_fu_276_p2[32'd16];

assign tmp_s_fu_743_p3 = {{select_ln19_1_reg_1038}, {2'd0}};

assign trunc_ln22_fu_272_p1 = j_13[9:0];

assign trunc_ln32_fu_798_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_773_p1 = add_ln33_fu_767_p2[3:0];

assign xor_ln19_fu_567_p2 = (icmp_ln20_reg_985 ^ 1'd1);

assign zext_ln19_fu_254_p1 = i_13;

assign zext_ln20_1_fu_446_p1 = add_ln20_fu_440_p2;

assign zext_ln20_fu_342_p1 = ap_phi_mux_jj_phi_fu_231_p4;

assign zext_ln22_1_fu_603_p1 = add_ln20_reg_1015;

assign zext_ln22_fu_493_p1 = jj_reg_227;

assign zext_ln32_7_fu_670_p1 = tmp_2_fu_662_p3;

assign zext_ln32_8_fu_692_p1 = select_ln20_4_fu_684_p3;

assign zext_ln32_fu_658_p1 = tmp_1_fu_650_p3;

assign zext_ln33_2_fu_750_p1 = tmp_s_fu_743_p3;

assign zext_ln33_3_fu_764_p1 = select_ln20_1_reg_1051;

assign zext_ln33_4_fu_785_p1 = select_ln20_reg_1045;

assign zext_ln33_5_fu_794_p1 = add_ln33_1_reg_1094;

assign zext_ln33_fu_740_p1 = select_ln19_1_reg_1038;

endmodule //td_fused_top_tdf8_readInputs57
