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

module td_fused_top_tdf5_readInputs42 (
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
        i_15,
        j_15,
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
output  [13:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_15;
input  [15:0] j_15;
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
reg   [1:0] ii_reg_186;
reg   [5:0] indvar_flatten_reg_198;
reg   [1:0] jj_reg_209;
reg   [4:0] kk_reg_221;
wire   [17:0] p_cast_i_fu_250_p1;
reg   [17:0] p_cast_i_reg_1041;
wire   [11:0] trunc_ln22_fu_254_p1;
reg   [11:0] trunc_ln22_reg_1047;
wire   [17:0] sext_ln22_fu_264_p1;
reg   [17:0] sext_ln22_reg_1053;
wire   [5:0] p_cast_fu_268_p2;
reg   [5:0] p_cast_reg_1059;
wire   [0:0] or_ln23_11_fu_288_p2;
reg   [0:0] or_ln23_11_reg_1065;
wire   [11:0] p_mid137_fu_294_p2;
reg   [11:0] p_mid137_reg_1070;
wire   [6:0] add_ln19_3_fu_300_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] empty_97_fu_315_p2;
reg   [0:0] empty_97_reg_1080;
wire   [0:0] is_padding_fu_350_p2;
reg   [0:0] is_padding_reg_1085;
wire   [0:0] icmp_ln19_fu_356_p2;
reg   [0:0] icmp_ln19_reg_1092;
reg   [0:0] icmp_ln19_reg_1092_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1092_pp0_iter2_reg;
reg   [0:0] icmp_ln19_reg_1092_pp0_iter3_reg;
wire   [1:0] add_ln19_fu_362_p2;
reg   [1:0] add_ln19_reg_1096;
wire   [0:0] icmp_ln20_fu_368_p2;
reg   [0:0] icmp_ln20_reg_1101;
wire   [1:0] select_ln19_16_fu_390_p3;
reg   [1:0] select_ln19_16_reg_1110;
wire   [0:0] p_mid113_fu_407_p2;
reg   [0:0] p_mid113_reg_1117;
wire   [0:0] or_ln19_fu_427_p2;
reg   [0:0] or_ln19_reg_1123;
reg   [0:0] or_ln19_reg_1123_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_433_p2;
reg   [1:0] add_ln20_reg_1130;
wire   [1:0] select_ln20_11_fu_447_p3;
reg   [1:0] select_ln20_11_reg_1135;
wire   [17:0] add_ln22_4_fu_459_p2;
reg   [17:0] add_ln22_4_reg_1141;
reg   [1:0] lshr_ln_reg_1147;
reg   [1:0] lshr_ln_reg_1147_pp0_iter1_reg;
wire   [1:0] trunc_ln32_fu_474_p1;
reg   [1:0] trunc_ln32_reg_1152;
reg   [1:0] trunc_ln32_reg_1152_pp0_iter1_reg;
reg   [1:0] trunc_ln32_reg_1152_pp0_iter2_reg;
reg   [2:0] lshr_ln3_reg_1158;
reg   [2:0] lshr_ln3_reg_1158_pp0_iter1_reg;
reg   [2:0] lshr_ln3_reg_1158_pp0_iter2_reg;
reg   [2:0] lshr_ln3_reg_1158_pp0_iter3_reg;
wire   [4:0] add_ln25_fu_488_p2;
wire   [5:0] select_ln20_15_fu_500_p3;
wire   [11:0] select_ln19_21_fu_626_p3;
reg   [11:0] select_ln19_21_reg_1173;
wire   [5:0] add_ln33_fu_636_p2;
reg   [5:0] add_ln33_reg_1178;
reg   [5:0] add_ln33_reg_1178_pp0_iter2_reg;
reg   [5:0] add_ln33_reg_1178_pp0_iter3_reg;
wire   [0:0] or_ln23_15_fu_663_p2;
reg   [0:0] or_ln23_15_reg_1183;
wire   [0:0] select_ln20_12_fu_669_p3;
reg   [0:0] select_ln20_12_reg_1188;
reg   [0:0] select_ln20_12_reg_1188_pp0_iter2_reg;
reg   [0:0] select_ln20_12_reg_1188_pp0_iter3_reg;
wire   [11:0] p_mid1_fu_694_p2;
reg   [11:0] p_mid1_reg_1194;
wire   [12:0] sub_ln32_fu_730_p2;
reg   [12:0] sub_ln32_reg_1199;
wire   [6:0] sub_ln32_9_fu_852_p2;
reg   [6:0] sub_ln32_9_reg_1209;
wire   [63:0] lshr_ln32_fu_862_p2;
reg   [63:0] lshr_ln32_reg_1214;
wire   [6:0] sub_ln32_12_fu_953_p2;
reg   [6:0] sub_ln32_12_reg_1219;
wire   [63:0] lshr_ln32_5_fu_963_p2;
reg   [63:0] lshr_ln32_5_reg_1224;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_190_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_213_p4;
wire   [63:0] sext_ln32_fu_768_p1;
wire   [63:0] sext_ln33_fu_1005_p1;
wire   [16:0] zext_ln19_fu_236_p1;
wire   [16:0] empty_95_fu_244_p2;
wire   [16:0] j_cast_i_fu_232_p1;
wire   [16:0] add_ln22_fu_258_p2;
wire   [5:0] empty_fu_240_p1;
wire   [0:0] tmp_fu_274_p3;
wire   [0:0] icmp_ln24_fu_282_p2;
wire   [17:0] ii_cast_i_fu_306_p1;
wire   [17:0] empty_96_fu_310_p2;
wire   [17:0] zext_ln20_fu_321_p1;
wire   [17:0] add_ln22_3_fu_325_p2;
wire   [0:0] tmp_33_fu_330_p3;
wire   [0:0] icmp_ln24_3_fu_338_p2;
wire   [0:0] or_ln23_fu_344_p2;
wire   [17:0] ii_cast_i_mid1_fu_398_p1;
wire   [17:0] p_mid111_fu_402_p2;
wire   [0:0] tmp_34_fu_413_p3;
wire   [0:0] xor_ln25_fu_421_p2;
wire   [1:0] select_ln19_fu_374_p3;
wire   [4:0] select_ln19_15_fu_382_p3;
wire   [17:0] zext_ln20_3_fu_455_p1;
wire   [4:0] select_ln20_fu_439_p3;
wire   [5:0] add_ln20_3_fu_494_p2;
wire   [5:0] ii_cast_fu_508_p1;
wire   [5:0] p_cast14_i_fu_512_p2;
wire   [2:0] zext_ln22_fu_517_p1;
wire   [2:0] tmp2_fu_528_p2;
wire   [11:0] tmp2_cast_fu_534_p1;
wire   [11:0] empty_98_fu_538_p2;
wire   [3:0] tmp_s_fu_553_p3;
wire   [4:0] zext_ln33_6_fu_560_p1;
wire   [4:0] zext_ln33_fu_550_p1;
wire   [4:0] sub_ln33_fu_564_p2;
wire   [5:0] ii_cast_mid1_fu_574_p1;
wire   [5:0] p_cast14_i_mid1_fu_577_p2;
wire   [0:0] or_ln23_13_fu_594_p2;
wire   [5:0] row_coord_int_mid131_fu_604_p3;
wire   [5:0] row_coord_int_fu_521_p3;
wire   [11:0] col_coord_int_mid139_fu_612_p3;
wire   [11:0] col_coord_int_fu_543_p3;
wire   [5:0] sub_ln33_cast_fu_570_p1;
wire   [5:0] zext_ln33_7_fu_633_p1;
wire   [0:0] tmp_35_fu_645_p3;
wire   [0:0] icmp_ln24_4_fu_652_p2;
wire   [0:0] or_ln23_14_fu_657_p2;
wire   [0:0] select_ln19_18_fu_589_p3;
wire   [0:0] select_ln19_19_fu_598_p3;
wire   [5:0] select_ln19_17_fu_582_p3;
wire   [2:0] zext_ln22_3_fu_642_p1;
wire   [2:0] tmp2_mid1_fu_684_p2;
wire   [11:0] tmp2_cast_mid1_fu_690_p1;
wire   [5:0] select_ln19_20_fu_619_p3;
wire   [5:0] row_coord_int_mid1_fu_676_p3;
wire   [5:0] select_ln20_13_fu_699_p3;
wire   [11:0] tmp_22_fu_706_p3;
wire   [8:0] tmp_23_fu_718_p3;
wire   [12:0] zext_ln32_fu_714_p1;
wire   [12:0] zext_ln32_22_fu_726_p1;
wire   [11:0] col_coord_int_mid1_fu_736_p3;
wire   [11:0] select_ln20_14_fu_745_p3;
wire   [13:0] sext_ln20_fu_742_p1;
wire   [13:0] zext_ln32_23_fu_751_p1;
wire   [13:0] add_ln32_fu_755_p2;
wire   [15:0] tmp_36_fu_761_p3;
wire   [5:0] tmp_24_fu_773_p3;
wire   [5:0] empty_100_fu_780_p2;
wire   [6:0] zext_ln32_24_fu_792_p1;
wire   [6:0] zext_ln32_25_fu_796_p1;
wire   [0:0] icmp_ln32_fu_786_p2;
wire   [6:0] sub_ln32_7_fu_810_p2;
wire   [6:0] sub_ln32_8_fu_822_p2;
reg   [63:0] tmp_37_fu_800_p4;
wire   [6:0] xor_ln32_fu_816_p2;
wire   [6:0] select_ln32_fu_828_p3;
wire   [6:0] select_ln32_7_fu_844_p3;
wire   [63:0] select_ln32_6_fu_836_p3;
wire   [63:0] zext_ln32_26_fu_858_p1;
wire   [1:0] or_ln329_i_fu_868_p2;
wire   [5:0] tmp_25_fu_873_p3;
wire   [5:0] empty_101_fu_881_p2;
wire   [6:0] zext_ln32_28_fu_893_p1;
wire   [6:0] zext_ln32_29_fu_897_p1;
wire   [0:0] icmp_ln32_2_fu_887_p2;
wire   [6:0] sub_ln32_10_fu_911_p2;
wire   [6:0] sub_ln32_11_fu_923_p2;
reg   [63:0] tmp_39_fu_901_p4;
wire   [6:0] xor_ln32_2_fu_917_p2;
wire   [6:0] select_ln32_8_fu_929_p3;
wire   [6:0] select_ln32_10_fu_945_p3;
wire   [63:0] select_ln32_9_fu_937_p3;
wire   [63:0] zext_ln32_30_fu_959_p1;
wire   [63:0] zext_ln32_27_fu_969_p1;
wire   [63:0] lshr_ln32_4_fu_972_p2;
wire   [63:0] and_ln32_fu_978_p2;
wire   [15:0] trunc_ln32_3_fu_983_p1;
wire   [15:0] in_data_elem_fu_987_p1;
wire   [8:0] tmp_38_fu_999_p3;
wire   [63:0] zext_ln32_31_fu_1011_p1;
wire   [63:0] lshr_ln32_6_fu_1014_p2;
wire   [63:0] and_ln32_2_fu_1020_p2;
wire   [15:0] trunc_ln32_4_fu_1025_p1;
wire   [15:0] in_data_elem_5_fu_1029_p1;
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
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ii_reg_186 <= select_ln19_16_reg_1110;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_186 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_356_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten47_reg_175 <= add_ln19_3_fu_300_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_175 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_356_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_198 <= select_ln20_15_fu_500_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_198 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_209 <= select_ln20_11_reg_1135;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_209 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_356_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_221 <= add_ln25_fu_488_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_221 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_356_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_1096 <= add_ln19_fu_362_p2;
        add_ln20_reg_1130 <= add_ln20_fu_433_p2;
        add_ln22_4_reg_1141 <= add_ln22_4_fu_459_p2;
        icmp_ln20_reg_1101 <= icmp_ln20_fu_368_p2;
        lshr_ln3_reg_1158 <= {{select_ln20_fu_439_p3[3:1]}};
        lshr_ln_reg_1147 <= {{select_ln20_fu_439_p3[3:2]}};
        or_ln19_reg_1123 <= or_ln19_fu_427_p2;
        p_mid113_reg_1117 <= p_mid113_fu_407_p2;
        trunc_ln32_reg_1152 <= trunc_ln32_fu_474_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln33_reg_1178 <= add_ln33_fu_636_p2;
        or_ln23_15_reg_1183 <= or_ln23_15_fu_663_p2;
        select_ln20_12_reg_1188 <= select_ln20_12_fu_669_p3;
        sub_ln32_reg_1199[12 : 3] <= sub_ln32_fu_730_p2[12 : 3];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln33_reg_1178_pp0_iter2_reg <= add_ln33_reg_1178;
        add_ln33_reg_1178_pp0_iter3_reg <= add_ln33_reg_1178_pp0_iter2_reg;
        icmp_ln19_reg_1092_pp0_iter2_reg <= icmp_ln19_reg_1092_pp0_iter1_reg;
        icmp_ln19_reg_1092_pp0_iter3_reg <= icmp_ln19_reg_1092_pp0_iter2_reg;
        lshr_ln3_reg_1158_pp0_iter2_reg <= lshr_ln3_reg_1158_pp0_iter1_reg;
        lshr_ln3_reg_1158_pp0_iter3_reg <= lshr_ln3_reg_1158_pp0_iter2_reg;
        select_ln20_12_reg_1188_pp0_iter2_reg <= select_ln20_12_reg_1188;
        select_ln20_12_reg_1188_pp0_iter3_reg <= select_ln20_12_reg_1188_pp0_iter2_reg;
        trunc_ln32_reg_1152_pp0_iter2_reg <= trunc_ln32_reg_1152_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_97_reg_1080 <= empty_97_fu_315_p2;
        icmp_ln19_reg_1092 <= icmp_ln19_fu_356_p2;
        icmp_ln19_reg_1092_pp0_iter1_reg <= icmp_ln19_reg_1092;
        is_padding_reg_1085 <= is_padding_fu_350_p2;
        lshr_ln3_reg_1158_pp0_iter1_reg <= lshr_ln3_reg_1158;
        lshr_ln_reg_1147_pp0_iter1_reg <= lshr_ln_reg_1147;
        or_ln19_reg_1123_pp0_iter1_reg <= or_ln19_reg_1123;
        trunc_ln32_reg_1152_pp0_iter1_reg <= trunc_ln32_reg_1152;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1092_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (select_ln20_12_reg_1188_pp0_iter2_reg == 1'd0))) begin
        lshr_ln32_5_reg_1224 <= lshr_ln32_5_fu_963_p2;
        lshr_ln32_reg_1214 <= lshr_ln32_fu_862_p2;
        sub_ln32_12_reg_1219[6 : 1] <= sub_ln32_12_fu_953_p2[6 : 1];
        sub_ln32_9_reg_1209[6 : 1] <= sub_ln32_9_fu_852_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_11_reg_1065 <= or_ln23_11_fu_288_p2;
        p_cast_i_reg_1041 <= p_cast_i_fu_250_p1;
        p_cast_reg_1059 <= p_cast_fu_268_p2;
        p_mid137_reg_1070 <= p_mid137_fu_294_p2;
        sext_ln22_reg_1053 <= sext_ln22_fu_264_p1;
        trunc_ln22_reg_1047 <= trunc_ln22_fu_254_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1123 == 1'd0))) begin
        p_mid1_reg_1194 <= p_mid1_fu_694_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_356_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln19_16_reg_1110 <= select_ln19_16_fu_390_p3;
        select_ln20_11_reg_1135 <= select_ln20_11_fu_447_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1123 == 1'd1))) begin
        select_ln19_21_reg_1173 <= select_ln19_21_fu_626_p3;
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
    if (((icmp_ln19_fu_356_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_190_p4 = select_ln19_16_reg_1110;
    end else begin
        ap_phi_mux_ii_phi_fu_190_p4 = ii_reg_186;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_1092 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_213_p4 = select_ln20_11_reg_1135;
    end else begin
        ap_phi_mux_jj_phi_fu_213_p4 = jj_reg_209;
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
    if (((icmp_ln19_reg_1092_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
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
    if (((icmp_ln19_reg_1092_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
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

assign add_ln19_3_fu_300_p2 = (indvar_flatten47_reg_175 + 7'd1);

assign add_ln19_fu_362_p2 = (ap_phi_mux_ii_phi_fu_190_p4 + 2'd1);

assign add_ln20_3_fu_494_p2 = (indvar_flatten_reg_198 + 6'd1);

assign add_ln20_fu_433_p2 = (select_ln19_fu_374_p3 + 2'd1);

assign add_ln22_3_fu_325_p2 = ((sext_ln22_reg_1053) + (zext_ln20_fu_321_p1));

assign add_ln22_4_fu_459_p2 = ((sext_ln22_reg_1053) + (zext_ln20_3_fu_455_p1));

assign add_ln22_fu_258_p2 = ((j_cast_i_fu_232_p1) + (17'd131071));

assign add_ln25_fu_488_p2 = (select_ln20_fu_439_p3 + 5'd2);

assign add_ln32_fu_755_p2 = ((sext_ln20_fu_742_p1) + (zext_ln32_23_fu_751_p1));

assign add_ln33_fu_636_p2 = ((sub_ln33_cast_fu_570_p1) + (zext_ln33_7_fu_633_p1));

assign and_ln32_2_fu_1020_p2 = (lshr_ln32_6_fu_1014_p2 & lshr_ln32_5_reg_1224);

assign and_ln32_fu_978_p2 = (lshr_ln32_reg_1214 & lshr_ln32_4_fu_972_p2);

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

assign col_coord_int_fu_543_p3 = ((is_padding_reg_1085[0:0] == 1'b1) ? 12'd0 : empty_98_fu_538_p2);

assign col_coord_int_mid139_fu_612_p3 = ((or_ln23_13_fu_594_p2[0:0] == 1'b1) ? 12'd0 : p_mid137_reg_1070);

assign col_coord_int_mid1_fu_736_p3 = ((or_ln23_15_reg_1183[0:0] == 1'b1) ? 12'd0 : p_mid1_reg_1194);

assign empty_100_fu_780_p2 = (tmp_24_fu_773_p3 | 6'd15);

assign empty_101_fu_881_p2 = (tmp_25_fu_873_p3 | 6'd15);

assign empty_95_fu_244_p2 = ((zext_ln19_fu_236_p1) + (17'd131071));

assign empty_96_fu_310_p2 = ((p_cast_i_reg_1041) + (ii_cast_i_fu_306_p1));

assign empty_97_fu_315_p2 = ((empty_96_fu_310_p2 > 18'd55) ? 1'b1 : 1'b0);

assign empty_98_fu_538_p2 = ((tmp2_cast_fu_534_p1) + (trunc_ln22_reg_1047));

assign empty_fu_240_p1 = i_15[5:0];

assign icmp_ln19_fu_356_p2 = ((indvar_flatten47_reg_175 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_368_p2 = ((indvar_flatten_reg_198 == 6'd24) ? 1'b1 : 1'b0);

assign icmp_ln24_3_fu_338_p2 = (((add_ln22_3_fu_325_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_4_fu_652_p2 = (((add_ln22_4_reg_1141) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_282_p2 = (((add_ln22_fu_258_p2) > (17'd55)) ? 1'b1 : 1'b0);

assign icmp_ln32_2_fu_887_p2 = ((tmp_25_fu_873_p3 > empty_101_fu_881_p2) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_786_p2 = ((tmp_24_fu_773_p3 > empty_100_fu_780_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = sext_ln33_fu_1005_p1;

assign ifmap_vec_0_d0 = ((select_ln20_12_reg_1188_pp0_iter3_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_987_p1);

assign ifmap_vec_1_address0 = sext_ln33_fu_1005_p1;

assign ifmap_vec_1_d0 = ((select_ln20_12_reg_1188_pp0_iter3_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_5_fu_1029_p1);

assign ii_cast_fu_508_p1 = ii_reg_186;

assign ii_cast_i_fu_306_p1 = ap_phi_mux_ii_phi_fu_190_p4;

assign ii_cast_i_mid1_fu_398_p1 = add_ln19_fu_362_p2;

assign ii_cast_mid1_fu_574_p1 = add_ln19_reg_1096;

assign in_data_address0 = sext_ln32_fu_768_p1;

assign in_data_elem_5_fu_1029_p1 = trunc_ln32_4_fu_1025_p1;

assign in_data_elem_fu_987_p1 = trunc_ln32_3_fu_983_p1;

assign is_padding_fu_350_p2 = (or_ln23_fu_344_p2 | empty_97_fu_315_p2);

assign j_cast_i_fu_232_p1 = j_15;

assign lshr_ln32_4_fu_972_p2 = 64'd18446744073709551615 >> zext_ln32_27_fu_969_p1;

assign lshr_ln32_5_fu_963_p2 = select_ln32_9_fu_937_p3 >> zext_ln32_30_fu_959_p1;

assign lshr_ln32_6_fu_1014_p2 = 64'd18446744073709551615 >> zext_ln32_31_fu_1011_p1;

assign lshr_ln32_fu_862_p2 = select_ln32_6_fu_836_p3 >> zext_ln32_26_fu_858_p1;

assign or_ln19_fu_427_p2 = (xor_ln25_fu_421_p2 | icmp_ln20_fu_368_p2);

assign or_ln23_11_fu_288_p2 = (tmp_fu_274_p3 | icmp_ln24_fu_282_p2);

assign or_ln23_13_fu_594_p2 = (p_mid113_reg_1117 | or_ln23_11_reg_1065);

assign or_ln23_14_fu_657_p2 = (tmp_35_fu_645_p3 | icmp_ln24_4_fu_652_p2);

assign or_ln23_15_fu_663_p2 = (select_ln19_18_fu_589_p3 | or_ln23_14_fu_657_p2);

assign or_ln23_fu_344_p2 = (tmp_33_fu_330_p3 | icmp_ln24_3_fu_338_p2);

assign or_ln329_i_fu_868_p2 = (trunc_ln32_reg_1152_pp0_iter2_reg | 2'd1);

assign p_cast14_i_fu_512_p2 = (p_cast_reg_1059 + ii_cast_fu_508_p1);

assign p_cast14_i_mid1_fu_577_p2 = (p_cast_reg_1059 + ii_cast_mid1_fu_574_p1);

assign p_cast_fu_268_p2 = ((empty_fu_240_p1) + (6'd63));

assign p_cast_i_fu_250_p1 = (empty_95_fu_244_p2);

assign p_mid111_fu_402_p2 = ((p_cast_i_reg_1041) + (ii_cast_i_mid1_fu_398_p1));

assign p_mid113_fu_407_p2 = ((p_mid111_fu_402_p2 > 18'd55) ? 1'b1 : 1'b0);

assign p_mid137_fu_294_p2 = ((trunc_ln22_fu_254_p1) + (12'd4095));

assign p_mid1_fu_694_p2 = ((tmp2_cast_mid1_fu_690_p1) + (trunc_ln22_reg_1047));

assign row_coord_int_fu_521_p3 = ((is_padding_reg_1085[0:0] == 1'b1) ? 6'd0 : p_cast14_i_fu_512_p2);

assign row_coord_int_mid131_fu_604_p3 = ((or_ln23_13_fu_594_p2[0:0] == 1'b1) ? 6'd0 : p_cast14_i_mid1_fu_577_p2);

assign row_coord_int_mid1_fu_676_p3 = ((or_ln23_15_fu_663_p2[0:0] == 1'b1) ? 6'd0 : select_ln19_17_fu_582_p3);

assign select_ln19_15_fu_382_p3 = ((icmp_ln20_fu_368_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_221);

assign select_ln19_16_fu_390_p3 = ((icmp_ln20_fu_368_p2[0:0] == 1'b1) ? add_ln19_fu_362_p2 : ap_phi_mux_ii_phi_fu_190_p4);

assign select_ln19_17_fu_582_p3 = ((icmp_ln20_reg_1101[0:0] == 1'b1) ? p_cast14_i_mid1_fu_577_p2 : p_cast14_i_fu_512_p2);

assign select_ln19_18_fu_589_p3 = ((icmp_ln20_reg_1101[0:0] == 1'b1) ? p_mid113_reg_1117 : empty_97_reg_1080);

assign select_ln19_19_fu_598_p3 = ((icmp_ln20_reg_1101[0:0] == 1'b1) ? or_ln23_13_fu_594_p2 : is_padding_reg_1085);

assign select_ln19_20_fu_619_p3 = ((icmp_ln20_reg_1101[0:0] == 1'b1) ? row_coord_int_mid131_fu_604_p3 : row_coord_int_fu_521_p3);

assign select_ln19_21_fu_626_p3 = ((icmp_ln20_reg_1101[0:0] == 1'b1) ? col_coord_int_mid139_fu_612_p3 : col_coord_int_fu_543_p3);

assign select_ln19_fu_374_p3 = ((icmp_ln20_fu_368_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_213_p4);

assign select_ln20_11_fu_447_p3 = ((or_ln19_fu_427_p2[0:0] == 1'b1) ? select_ln19_fu_374_p3 : add_ln20_fu_433_p2);

assign select_ln20_12_fu_669_p3 = ((or_ln19_reg_1123[0:0] == 1'b1) ? select_ln19_19_fu_598_p3 : or_ln23_15_fu_663_p2);

assign select_ln20_13_fu_699_p3 = ((or_ln19_reg_1123[0:0] == 1'b1) ? select_ln19_20_fu_619_p3 : row_coord_int_mid1_fu_676_p3);

assign select_ln20_14_fu_745_p3 = ((or_ln19_reg_1123_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_21_reg_1173 : col_coord_int_mid1_fu_736_p3);

assign select_ln20_15_fu_500_p3 = ((icmp_ln20_fu_368_p2[0:0] == 1'b1) ? 6'd1 : add_ln20_3_fu_494_p2);

assign select_ln20_fu_439_p3 = ((or_ln19_fu_427_p2[0:0] == 1'b1) ? select_ln19_15_fu_382_p3 : 5'd0);

assign select_ln32_10_fu_945_p3 = ((icmp_ln32_2_fu_887_p2[0:0] == 1'b1) ? xor_ln32_2_fu_917_p2 : zext_ln32_28_fu_893_p1);

assign select_ln32_6_fu_836_p3 = ((icmp_ln32_fu_786_p2[0:0] == 1'b1) ? tmp_37_fu_800_p4 : in_data_q0);

assign select_ln32_7_fu_844_p3 = ((icmp_ln32_fu_786_p2[0:0] == 1'b1) ? xor_ln32_fu_816_p2 : zext_ln32_24_fu_792_p1);

assign select_ln32_8_fu_929_p3 = ((icmp_ln32_2_fu_887_p2[0:0] == 1'b1) ? sub_ln32_10_fu_911_p2 : sub_ln32_11_fu_923_p2);

assign select_ln32_9_fu_937_p3 = ((icmp_ln32_2_fu_887_p2[0:0] == 1'b1) ? tmp_39_fu_901_p4 : in_data_q0);

assign select_ln32_fu_828_p3 = ((icmp_ln32_fu_786_p2[0:0] == 1'b1) ? sub_ln32_7_fu_810_p2 : sub_ln32_8_fu_822_p2);

assign sext_ln20_fu_742_p1 = (sub_ln32_reg_1199);

assign sext_ln22_fu_264_p1 = add_ln22_fu_258_p2;

assign sext_ln32_fu_768_p1 = (tmp_36_fu_761_p3);

assign sext_ln33_fu_1005_p1 = (tmp_38_fu_999_p3);

assign sub_ln32_10_fu_911_p2 = (zext_ln32_28_fu_893_p1 - zext_ln32_29_fu_897_p1);

assign sub_ln32_11_fu_923_p2 = (zext_ln32_29_fu_897_p1 - zext_ln32_28_fu_893_p1);

assign sub_ln32_12_fu_953_p2 = (7'd63 - select_ln32_8_fu_929_p3);

assign sub_ln32_7_fu_810_p2 = (zext_ln32_24_fu_792_p1 - zext_ln32_25_fu_796_p1);

assign sub_ln32_8_fu_822_p2 = (zext_ln32_25_fu_796_p1 - zext_ln32_24_fu_792_p1);

assign sub_ln32_9_fu_852_p2 = (7'd63 - select_ln32_fu_828_p3);

assign sub_ln32_fu_730_p2 = (zext_ln32_fu_714_p1 - zext_ln32_22_fu_726_p1);

assign sub_ln33_cast_fu_570_p1 = (sub_ln33_fu_564_p2);

assign sub_ln33_fu_564_p2 = (zext_ln33_6_fu_560_p1 - zext_ln33_fu_550_p1);

assign tmp2_cast_fu_534_p1 = (tmp2_fu_528_p2);

assign tmp2_cast_mid1_fu_690_p1 = (tmp2_mid1_fu_684_p2);

assign tmp2_fu_528_p2 = ((zext_ln22_fu_517_p1) + (3'd7));

assign tmp2_mid1_fu_684_p2 = ((zext_ln22_3_fu_642_p1) + (3'd7));

assign tmp_22_fu_706_p3 = {{select_ln20_13_fu_699_p3}, {6'd0}};

assign tmp_23_fu_718_p3 = {{select_ln20_13_fu_699_p3}, {3'd0}};

assign tmp_24_fu_773_p3 = {{trunc_ln32_reg_1152_pp0_iter2_reg}, {4'd0}};

assign tmp_25_fu_873_p3 = {{or_ln329_i_fu_868_p2}, {4'd0}};

assign tmp_33_fu_330_p3 = add_ln22_3_fu_325_p2[32'd17];

assign tmp_34_fu_413_p3 = kk_reg_221[32'd4];

assign tmp_35_fu_645_p3 = add_ln22_4_reg_1141[32'd17];

assign tmp_36_fu_761_p3 = {{add_ln32_fu_755_p2}, {lshr_ln_reg_1147_pp0_iter1_reg}};

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_37_fu_800_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_37_fu_800_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_38_fu_999_p3 = {{add_ln33_reg_1178_pp0_iter3_reg}, {lshr_ln3_reg_1158_pp0_iter3_reg}};

integer ap_tvar_int_1;

always @ (in_data_q0) begin
    //for (ap_tvar_int_1 = 64 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 64; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 63 - 0) begin
            tmp_39_fu_901_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_39_fu_901_p4[ap_tvar_int_1] = in_data_q0[63 - ap_tvar_int_1];
        end
    end
end

assign tmp_fu_274_p3 = add_ln22_fu_258_p2[32'd16];

assign tmp_s_fu_553_p3 = {{select_ln19_16_reg_1110}, {2'd0}};

assign trunc_ln22_fu_254_p1 = j_15[11:0];

assign trunc_ln32_3_fu_983_p1 = and_ln32_fu_978_p2[15:0];

assign trunc_ln32_4_fu_1025_p1 = and_ln32_2_fu_1020_p2[15:0];

assign trunc_ln32_fu_474_p1 = select_ln20_fu_439_p3[1:0];

assign xor_ln25_fu_421_p2 = (tmp_34_fu_413_p3 ^ 1'd1);

assign xor_ln32_2_fu_917_p2 = (zext_ln32_28_fu_893_p1 ^ 7'd63);

assign xor_ln32_fu_816_p2 = (zext_ln32_24_fu_792_p1 ^ 7'd63);

assign zext_ln19_fu_236_p1 = i_15;

assign zext_ln20_3_fu_455_p1 = add_ln20_fu_433_p2;

assign zext_ln20_fu_321_p1 = ap_phi_mux_jj_phi_fu_213_p4;

assign zext_ln22_3_fu_642_p1 = add_ln20_reg_1130;

assign zext_ln22_fu_517_p1 = jj_reg_209;

assign zext_ln32_22_fu_726_p1 = tmp_23_fu_718_p3;

assign zext_ln32_23_fu_751_p1 = select_ln20_14_fu_745_p3;

assign zext_ln32_24_fu_792_p1 = tmp_24_fu_773_p3;

assign zext_ln32_25_fu_796_p1 = empty_100_fu_780_p2;

assign zext_ln32_26_fu_858_p1 = select_ln32_7_fu_844_p3;

assign zext_ln32_27_fu_969_p1 = sub_ln32_9_reg_1209;

assign zext_ln32_28_fu_893_p1 = tmp_25_fu_873_p3;

assign zext_ln32_29_fu_897_p1 = empty_101_fu_881_p2;

assign zext_ln32_30_fu_959_p1 = select_ln32_10_fu_945_p3;

assign zext_ln32_31_fu_1011_p1 = sub_ln32_12_reg_1219;

assign zext_ln32_fu_714_p1 = tmp_22_fu_706_p3;

assign zext_ln33_6_fu_560_p1 = tmp_s_fu_553_p3;

assign zext_ln33_7_fu_633_p1 = select_ln20_11_reg_1135;

assign zext_ln33_fu_550_p1 = select_ln19_16_reg_1110;

always @ (posedge ap_clk) begin
    sub_ln32_reg_1199[2:0] <= 3'b000;
    sub_ln32_9_reg_1209[0] <= 1'b0;
    sub_ln32_12_reg_1219[0] <= 1'b0;
end

endmodule //td_fused_top_tdf5_readInputs42
