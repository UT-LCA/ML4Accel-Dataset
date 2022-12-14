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

module td_fused_top_tdf11_readInputs75 (
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
        indices_01_dout,
        indices_01_empty_n,
        indices_01_read,
        indices_12_dout,
        indices_12_empty_n,
        indices_12_read,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_we0,
        ifmap_vec_d0,
        ifmap_vec_address1,
        ifmap_vec_ce1,
        ifmap_vec_we1,
        ifmap_vec_d1,
        indices_01_out_din,
        indices_01_out_full_n,
        indices_01_out_write,
        indices_12_out_din,
        indices_12_out_full_n,
        indices_12_out_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_pp0_stage0 = 5'd4;
parameter    ap_ST_fsm_pp0_stage1 = 5'd8;
parameter    ap_ST_fsm_state9 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [11:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [9:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;
output  [9:0] ifmap_vec_address1;
output   ifmap_vec_ce1;
output   ifmap_vec_we1;
output  [15:0] ifmap_vec_d1;
output  [3:0] indices_01_out_din;
input   indices_01_out_full_n;
output   indices_01_out_write;
output  [7:0] indices_12_out_din;
input   indices_12_out_full_n;
output   indices_12_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg indices_01_read;
reg indices_12_read;
reg[9:0] ifmap_vec_address0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;
reg[15:0] ifmap_vec_d0;
reg[9:0] ifmap_vec_address1;
reg ifmap_vec_ce1;
reg ifmap_vec_we1;
reg[15:0] ifmap_vec_d1;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [7:0] indvar_flatten47_reg_224;
reg   [1:0] ii_reg_236;
reg   [6:0] indvar_flatten_reg_248;
reg   [1:0] jj_reg_259;
reg   [6:0] kk_0_i_i_reg_271;
reg   [15:0] indices_01_read_reg_960;
wire   [3:0] trunc_ln250_fu_282_p1;
reg   [3:0] trunc_ln250_reg_965;
reg   [15:0] indices_12_read_reg_970;
wire   [7:0] empty_fu_287_p1;
reg   [7:0] empty_reg_975;
wire   [17:0] p_cast_i_i_fu_304_p1;
reg   [17:0] p_cast_i_i_reg_982;
wire    ap_CS_fsm_state2;
wire   [17:0] sext_ln22_fu_314_p1;
reg   [17:0] sext_ln22_reg_988;
wire   [3:0] p_cast_fu_318_p2;
reg   [3:0] p_cast_reg_994;
wire   [0:0] or_ln23_31_fu_337_p2;
reg   [0:0] or_ln23_31_reg_1000;
wire   [7:0] p_mid137_fu_343_p2;
reg   [7:0] p_mid137_reg_1005;
wire   [3:0] p_cast5_i_i_fu_361_p2;
reg   [3:0] p_cast5_i_i_reg_1010;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_401_p2;
reg   [0:0] is_padding_reg_1016;
wire   [0:0] icmp_ln19_fu_407_p2;
reg   [0:0] icmp_ln19_reg_1023;
reg   [0:0] icmp_ln19_reg_1023_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1023_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_413_p2;
reg   [1:0] add_ln19_reg_1027;
wire   [0:0] icmp_ln20_fu_419_p2;
reg   [0:0] icmp_ln20_reg_1033;
wire   [1:0] select_ln19_fu_425_p3;
reg   [1:0] select_ln19_reg_1045;
wire   [0:0] or_ln23_33_fu_456_p2;
reg   [0:0] or_ln23_33_reg_1050;
wire   [1:0] add_ln20_fu_461_p2;
reg   [1:0] add_ln20_reg_1057;
wire   [0:0] or_ln23_35_fu_496_p2;
reg   [0:0] or_ln23_35_reg_1063;
wire   [6:0] add_ln20_7_fu_502_p2;
reg   [6:0] add_ln20_7_reg_1070;
wire   [7:0] add_ln19_7_fu_508_p2;
reg   [7:0] add_ln19_7_reg_1075;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state4_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_state8_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_36_fu_546_p3;
reg   [1:0] select_ln19_36_reg_1080;
wire   [6:0] select_ln20_fu_620_p3;
reg   [6:0] select_ln20_reg_1087;
wire   [1:0] select_ln20_30_fu_628_p3;
reg   [1:0] select_ln20_30_reg_1093;
wire   [0:0] select_ln20_31_fu_637_p3;
reg   [0:0] select_ln20_31_reg_1099;
reg   [0:0] select_ln20_31_reg_1099_pp0_iter1_reg;
wire   [5:0] empty_137_fu_733_p1;
reg   [5:0] empty_137_reg_1107;
reg   [5:0] empty_137_reg_1107_pp0_iter1_reg;
wire   [6:0] select_ln20_34_fu_760_p3;
reg   [6:0] select_ln20_34_reg_1119;
wire   [6:0] add_ln25_fu_766_p2;
reg   [6:0] add_ln25_reg_1124;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_798_p2;
reg   [5:0] add_ln33_reg_1129;
wire   [9:0] add_ln33_7_fu_819_p2;
reg   [9:0] add_ln33_7_reg_1136;
wire   [15:0] select_ln33_29_fu_898_p3;
reg   [15:0] select_ln33_29_reg_1141;
wire   [15:0] select_ln33_30_fu_919_p3;
reg   [15:0] select_ln33_30_reg_1146;
wire    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
reg   [7:0] ap_phi_mux_indvar_flatten47_phi_fu_228_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_240_p4;
reg   [6:0] ap_phi_mux_indvar_flatten_phi_fu_252_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_263_p4;
reg   [6:0] ap_phi_mux_kk_0_i_i_phi_fu_275_p4;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln32_fu_755_p1;
wire   [63:0] zext_ln33_29_fu_825_p1;
wire   [63:0] sext_ln33_fu_857_p1;
wire   [63:0] sext_ln33_11_fu_938_p1;
wire   [63:0] sext_ln33_12_fu_955_p1;
reg    ap_block_state1;
wire   [15:0] select_ln33_fu_837_p3;
wire   [15:0] select_ln33_28_fu_876_p3;
wire   [16:0] zext_ln19_fu_295_p1;
wire   [16:0] empty_132_fu_298_p2;
wire   [16:0] j_cast_i_i_fu_292_p1;
wire   [16:0] add_ln22_fu_308_p2;
wire   [0:0] tmp_49_fu_323_p3;
wire   [0:0] icmp_ln24_fu_331_p2;
wire   [17:0] ii_cast_i_i_fu_348_p1;
wire   [3:0] ii_cast_fu_352_p1;
wire   [17:0] empty_133_fu_356_p2;
wire   [17:0] zext_ln20_fu_372_p1;
wire   [17:0] add_ln22_7_fu_376_p2;
wire   [0:0] tmp_50_fu_381_p3;
wire   [0:0] icmp_ln24_7_fu_389_p2;
wire   [0:0] or_ln23_fu_395_p2;
wire   [0:0] empty_134_fu_366_p2;
wire   [17:0] ii_cast_i_i_mid1_fu_433_p1;
wire   [17:0] p_mid111_fu_437_p2;
wire   [0:0] p_mid113_fu_442_p2;
wire   [17:0] zext_ln20_7_fu_467_p1;
wire   [17:0] add_ln22_8_fu_471_p2;
wire   [0:0] tmp_51_fu_476_p3;
wire   [0:0] icmp_ln24_8_fu_484_p2;
wire   [0:0] or_ln23_34_fu_490_p2;
wire   [0:0] select_ln19_38_fu_448_p3;
wire   [2:0] zext_ln22_fu_514_p1;
wire   [2:0] tmp1_fu_524_p2;
wire   [7:0] tmp1_cast_fu_530_p1;
wire   [7:0] empty_135_fu_534_p2;
wire   [3:0] ii_cast_mid1_fu_552_p1;
wire   [3:0] p_cast5_i_i_mid1_fu_555_p2;
wire   [3:0] row_coord_int_mid131_fu_571_p3;
wire   [3:0] row_coord_int_fu_518_p3;
wire   [7:0] col_coord_int_mid139_fu_578_p3;
wire   [7:0] col_coord_int_fu_539_p3;
wire   [0:0] icmp_ln25_fu_603_p2;
wire   [0:0] xor_ln19_fu_598_p2;
wire   [0:0] and_ln19_fu_609_p2;
wire   [0:0] or_ln20_fu_615_p2;
wire   [0:0] select_ln19_39_fu_566_p3;
wire   [3:0] select_ln19_37_fu_560_p3;
wire   [2:0] zext_ln22_7_fu_634_p1;
wire   [2:0] tmp1_mid1_fu_651_p2;
wire   [7:0] tmp1_cast_mid1_fu_657_p1;
wire   [7:0] p_mid1_fu_661_p2;
wire   [3:0] row_coord_int_mid1_fu_644_p3;
wire   [3:0] select_ln19_40_fu_584_p3;
wire   [3:0] select_ln20_32_fu_673_p3;
wire   [7:0] tmp_s_fu_681_p3;
wire   [4:0] tmp_16_fu_693_p3;
wire   [8:0] zext_ln32_fu_689_p1;
wire   [8:0] zext_ln32_34_fu_701_p1;
wire   [8:0] sub_ln32_fu_705_p2;
wire   [7:0] col_coord_int_mid1_fu_666_p3;
wire   [7:0] select_ln19_41_fu_591_p3;
wire   [7:0] select_ln20_33_fu_715_p3;
wire   [9:0] sext_ln20_fu_711_p1;
wire   [9:0] zext_ln32_35_fu_723_p1;
wire   [9:0] add_ln32_fu_727_p2;
wire   [3:0] lshr_ln_fu_737_p4;
wire   [13:0] tmp_52_fu_747_p3;
wire   [3:0] tmp_fu_774_p3;
wire   [4:0] zext_ln33_26_fu_781_p1;
wire   [4:0] zext_ln33_fu_771_p1;
wire   [4:0] sub_ln33_fu_785_p2;
wire   [5:0] sub_ln33_cast_fu_791_p1;
wire   [5:0] zext_ln33_27_fu_795_p1;
wire   [3:0] trunc_ln33_fu_804_p1;
wire   [9:0] tmp_155_cast_fu_808_p3;
wire   [9:0] zext_ln33_28_fu_816_p1;
wire   [15:0] trunc_ln32_fu_829_p1;
wire   [15:0] bitcast_ln32_fu_833_p1;
wire   [5:0] or_ln25_fu_845_p2;
wire   [11:0] tmp_53_fu_850_p3;
wire   [15:0] tmp_84_i_i_fu_862_p4;
wire   [15:0] bitcast_ln32_28_fu_872_p1;
wire   [15:0] tmp_85_i_i_fu_884_p4;
wire   [15:0] bitcast_ln32_29_fu_894_p1;
wire   [15:0] tmp_86_i_i_fu_905_p4;
wire   [15:0] bitcast_ln32_30_fu_915_p1;
wire   [5:0] or_ln25_19_fu_926_p2;
wire   [11:0] tmp_54_fu_931_p3;
wire   [5:0] or_ln25_20_fu_943_p2;
wire   [11:0] tmp_55_fu_948_p3;
wire    ap_CS_fsm_state9;
reg   [4:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
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
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
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
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_236 <= select_ln19_36_reg_1080;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ii_reg_236 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten47_reg_224 <= add_ln19_7_reg_1075;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten47_reg_224 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_248 <= select_ln20_34_reg_1119;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_248 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_259 <= select_ln20_30_reg_1093;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        jj_reg_259 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        kk_0_i_i_reg_271 <= add_ln25_reg_1124;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_271 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln19_7_reg_1075 <= add_ln19_7_fu_508_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_407_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln19_reg_1027 <= add_ln19_fu_413_p2;
        add_ln20_7_reg_1070 <= add_ln20_7_fu_502_p2;
        add_ln20_reg_1057 <= add_ln20_fu_461_p2;
        icmp_ln20_reg_1033 <= icmp_ln20_fu_419_p2;
        or_ln23_33_reg_1050 <= or_ln23_33_fu_456_p2;
        or_ln23_35_reg_1063 <= or_ln23_35_fu_496_p2;
        select_ln19_reg_1045 <= select_ln19_fu_425_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln25_reg_1124 <= add_ln25_fu_766_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln33_7_reg_1136 <= add_ln33_7_fu_819_p2;
        add_ln33_reg_1129 <= add_ln33_fu_798_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_137_reg_1107 <= empty_137_fu_733_p1;
        select_ln20_31_reg_1099 <= select_ln20_31_fu_637_p3;
        select_ln20_reg_1087 <= select_ln20_fu_620_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_137_reg_1107_pp0_iter1_reg <= empty_137_reg_1107;
        select_ln20_31_reg_1099_pp0_iter1_reg <= select_ln20_31_reg_1099;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_975 <= empty_fu_287_p1;
        indices_01_read_reg_960 <= indices_01_dout;
        indices_12_read_reg_970 <= indices_12_dout;
        trunc_ln250_reg_965 <= trunc_ln250_fu_282_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln19_reg_1023 <= icmp_ln19_fu_407_p2;
        icmp_ln19_reg_1023_pp0_iter1_reg <= icmp_ln19_reg_1023;
        icmp_ln19_reg_1023_pp0_iter2_reg <= icmp_ln19_reg_1023_pp0_iter1_reg;
        is_padding_reg_1016 <= is_padding_fu_401_p2;
        p_cast5_i_i_reg_1010 <= p_cast5_i_i_fu_361_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln23_31_reg_1000 <= or_ln23_31_fu_337_p2;
        p_cast_i_i_reg_982 <= p_cast_i_i_fu_304_p1;
        p_cast_reg_994 <= p_cast_fu_318_p2;
        p_mid137_reg_1005 <= p_mid137_fu_343_p2;
        sext_ln22_reg_988 <= sext_ln22_fu_314_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        select_ln19_36_reg_1080 <= select_ln19_36_fu_546_p3;
        select_ln20_30_reg_1093 <= select_ln20_30_fu_628_p3;
        select_ln20_34_reg_1119 <= select_ln20_34_fu_760_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln33_29_reg_1141 <= select_ln33_29_fu_898_p3;
        select_ln33_30_reg_1146 <= select_ln33_30_fu_919_p3;
    end
end

always @ (*) begin
    if ((icmp_ln19_reg_1023 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_240_p4 = select_ln19_36_reg_1080;
    end else begin
        ap_phi_mux_ii_phi_fu_240_p4 = ii_reg_236;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_228_p4 = add_ln19_7_reg_1075;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_228_p4 = indvar_flatten47_reg_224;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_252_p4 = select_ln20_34_reg_1119;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_252_p4 = indvar_flatten_reg_248;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_263_p4 = select_ln20_30_reg_1093;
    end else begin
        ap_phi_mux_jj_phi_fu_263_p4 = jj_reg_259;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_275_p4 = add_ln25_reg_1124;
    end else begin
        ap_phi_mux_kk_0_i_i_phi_fu_275_p4 = kk_0_i_i_reg_271;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_address0 = sext_ln33_12_fu_955_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address0 = sext_ln33_fu_857_p1;
        end else begin
            ifmap_vec_address0 = 'bx;
        end
    end else begin
        ifmap_vec_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_address1 = sext_ln33_11_fu_938_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_29_fu_825_p1;
        end else begin
            ifmap_vec_address1 = 'bx;
        end
    end else begin
        ifmap_vec_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_ce1 = 1'b1;
    end else begin
        ifmap_vec_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_d0 = select_ln33_30_reg_1146;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_28_fu_876_p3;
        end else begin
            ifmap_vec_d0 = 'bx;
        end
    end else begin
        ifmap_vec_d0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_d1 = select_ln33_29_reg_1141;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d1 = select_ln33_fu_837_p3;
        end else begin
            ifmap_vec_d1 = 'bx;
        end
    end else begin
        ifmap_vec_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1023_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1023_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1023_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_we1 = 1'b1;
    end else begin
        ifmap_vec_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_blk_n = indices_01_empty_n;
    end else begin
        indices_01_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_blk_n = indices_01_out_full_n;
    end else begin
        indices_01_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_write = 1'b1;
    end else begin
        indices_01_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_read = 1'b1;
    end else begin
        indices_01_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_blk_n = indices_12_empty_n;
    end else begin
        indices_12_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_blk_n = indices_12_out_full_n;
    end else begin
        indices_12_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_write = 1'b1;
    end else begin
        indices_12_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1023 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1023 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln19_7_fu_508_p2 = (indvar_flatten47_reg_224 + 8'd1);

assign add_ln19_fu_413_p2 = (ap_phi_mux_ii_phi_fu_240_p4 + 2'd1);

assign add_ln20_7_fu_502_p2 = (ap_phi_mux_indvar_flatten_phi_fu_252_p4 + 7'd1);

assign add_ln20_fu_461_p2 = (select_ln19_fu_425_p3 + 2'd1);

assign add_ln22_7_fu_376_p2 = ((sext_ln22_reg_988) + (zext_ln20_fu_372_p1));

assign add_ln22_8_fu_471_p2 = ((sext_ln22_reg_988) + (zext_ln20_7_fu_467_p1));

assign add_ln22_fu_308_p2 = ((j_cast_i_i_fu_292_p1) + (17'd131071));

assign add_ln25_fu_766_p2 = (select_ln20_reg_1087 + 7'd4);

assign add_ln32_fu_727_p2 = ((sext_ln20_fu_711_p1) + (zext_ln32_35_fu_723_p1));

assign add_ln33_7_fu_819_p2 = (tmp_155_cast_fu_808_p3 + zext_ln33_28_fu_816_p1);

assign add_ln33_fu_798_p2 = ((sub_ln33_cast_fu_791_p1) + (zext_ln33_27_fu_795_p1));

assign and_ln19_fu_609_p2 = (xor_ln19_fu_598_p2 & icmp_ln25_fu_603_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_28_fu_872_p1 = tmp_84_i_i_fu_862_p4;

assign bitcast_ln32_29_fu_894_p1 = tmp_85_i_i_fu_884_p4;

assign bitcast_ln32_30_fu_915_p1 = tmp_86_i_i_fu_905_p4;

assign bitcast_ln32_fu_833_p1 = trunc_ln32_fu_829_p1;

assign col_coord_int_fu_539_p3 = ((is_padding_reg_1016[0:0] == 1'b1) ? 8'd0 : empty_135_fu_534_p2);

assign col_coord_int_mid139_fu_578_p3 = ((or_ln23_33_reg_1050[0:0] == 1'b1) ? 8'd0 : p_mid137_reg_1005);

assign col_coord_int_mid1_fu_666_p3 = ((or_ln23_35_reg_1063[0:0] == 1'b1) ? 8'd0 : p_mid1_fu_661_p2);

assign empty_132_fu_298_p2 = ((zext_ln19_fu_295_p1) + (17'd131071));

assign empty_133_fu_356_p2 = ((p_cast_i_i_reg_982) + (ii_cast_i_i_fu_348_p1));

assign empty_134_fu_366_p2 = ((empty_133_fu_356_p2 > 18'd13) ? 1'b1 : 1'b0);

assign empty_135_fu_534_p2 = ((tmp1_cast_fu_530_p1) + (empty_reg_975));

assign empty_137_fu_733_p1 = select_ln20_fu_620_p3[5:0];

assign empty_fu_287_p1 = indices_12_dout[7:0];

assign icmp_ln19_fu_407_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_228_p4 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_419_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_252_p4 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln24_7_fu_389_p2 = (((add_ln22_7_fu_376_p2) > (18'd13)) ? 1'b1 : 1'b0);

assign icmp_ln24_8_fu_484_p2 = (((add_ln22_8_fu_471_p2) > (18'd13)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_331_p2 = (((add_ln22_fu_308_p2) > (17'd13)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_603_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_275_p4 == 7'd64) ? 1'b1 : 1'b0);

assign ii_cast_fu_352_p1 = ap_phi_mux_ii_phi_fu_240_p4;

assign ii_cast_i_i_fu_348_p1 = ap_phi_mux_ii_phi_fu_240_p4;

assign ii_cast_i_i_mid1_fu_433_p1 = add_ln19_fu_413_p2;

assign ii_cast_mid1_fu_552_p1 = add_ln19_reg_1027;

assign in_data_address0 = sext_ln32_fu_755_p1;

assign indices_01_out_din = indices_01_dout[3:0];

assign indices_12_out_din = indices_12_dout[7:0];

assign is_padding_fu_401_p2 = (or_ln23_fu_395_p2 | empty_134_fu_366_p2);

assign j_cast_i_i_fu_292_p1 = indices_12_read_reg_970;

assign lshr_ln_fu_737_p4 = {{select_ln20_fu_620_p3[5:2]}};

assign or_ln20_fu_615_p2 = (icmp_ln20_reg_1033 | and_ln19_fu_609_p2);

assign or_ln23_31_fu_337_p2 = (tmp_49_fu_323_p3 | icmp_ln24_fu_331_p2);

assign or_ln23_33_fu_456_p2 = (p_mid113_fu_442_p2 | or_ln23_31_reg_1000);

assign or_ln23_34_fu_490_p2 = (tmp_51_fu_476_p3 | icmp_ln24_8_fu_484_p2);

assign or_ln23_35_fu_496_p2 = (select_ln19_38_fu_448_p3 | or_ln23_34_fu_490_p2);

assign or_ln23_fu_395_p2 = (tmp_50_fu_381_p3 | icmp_ln24_7_fu_389_p2);

assign or_ln25_19_fu_926_p2 = (empty_137_reg_1107_pp0_iter1_reg | 6'd2);

assign or_ln25_20_fu_943_p2 = (empty_137_reg_1107_pp0_iter1_reg | 6'd3);

assign or_ln25_fu_845_p2 = (empty_137_reg_1107_pp0_iter1_reg | 6'd1);

assign p_cast5_i_i_fu_361_p2 = (p_cast_reg_994 + ii_cast_fu_352_p1);

assign p_cast5_i_i_mid1_fu_555_p2 = (p_cast_reg_994 + ii_cast_mid1_fu_552_p1);

assign p_cast_fu_318_p2 = ((trunc_ln250_reg_965) + (4'd15));

assign p_cast_i_i_fu_304_p1 = (empty_132_fu_298_p2);

assign p_mid111_fu_437_p2 = ((p_cast_i_i_reg_982) + (ii_cast_i_i_mid1_fu_433_p1));

assign p_mid113_fu_442_p2 = ((p_mid111_fu_437_p2 > 18'd13) ? 1'b1 : 1'b0);

assign p_mid137_fu_343_p2 = ((empty_reg_975) + (8'd255));

assign p_mid1_fu_661_p2 = ((tmp1_cast_mid1_fu_657_p1) + (empty_reg_975));

assign row_coord_int_fu_518_p3 = ((is_padding_reg_1016[0:0] == 1'b1) ? 4'd0 : p_cast5_i_i_reg_1010);

assign row_coord_int_mid131_fu_571_p3 = ((or_ln23_33_reg_1050[0:0] == 1'b1) ? 4'd0 : p_cast5_i_i_mid1_fu_555_p2);

assign row_coord_int_mid1_fu_644_p3 = ((or_ln23_35_reg_1063[0:0] == 1'b1) ? 4'd0 : select_ln19_37_fu_560_p3);

assign select_ln19_36_fu_546_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? add_ln19_reg_1027 : ii_reg_236);

assign select_ln19_37_fu_560_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? p_cast5_i_i_mid1_fu_555_p2 : p_cast5_i_i_reg_1010);

assign select_ln19_38_fu_448_p3 = ((icmp_ln20_fu_419_p2[0:0] == 1'b1) ? p_mid113_fu_442_p2 : empty_134_fu_366_p2);

assign select_ln19_39_fu_566_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? or_ln23_33_reg_1050 : is_padding_reg_1016);

assign select_ln19_40_fu_584_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? row_coord_int_mid131_fu_571_p3 : row_coord_int_fu_518_p3);

assign select_ln19_41_fu_591_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? col_coord_int_mid139_fu_578_p3 : col_coord_int_fu_539_p3);

assign select_ln19_fu_425_p3 = ((icmp_ln20_fu_419_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_263_p4);

assign select_ln20_30_fu_628_p3 = ((and_ln19_fu_609_p2[0:0] == 1'b1) ? add_ln20_reg_1057 : select_ln19_reg_1045);

assign select_ln20_31_fu_637_p3 = ((and_ln19_fu_609_p2[0:0] == 1'b1) ? or_ln23_35_reg_1063 : select_ln19_39_fu_566_p3);

assign select_ln20_32_fu_673_p3 = ((and_ln19_fu_609_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_644_p3 : select_ln19_40_fu_584_p3);

assign select_ln20_33_fu_715_p3 = ((and_ln19_fu_609_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_666_p3 : select_ln19_41_fu_591_p3);

assign select_ln20_34_fu_760_p3 = ((icmp_ln20_reg_1033[0:0] == 1'b1) ? 7'd1 : add_ln20_7_reg_1070);

assign select_ln20_fu_620_p3 = ((or_ln20_fu_615_p2[0:0] == 1'b1) ? 7'd0 : ap_phi_mux_kk_0_i_i_phi_fu_275_p4);

assign select_ln33_28_fu_876_p3 = ((select_ln20_31_reg_1099_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_28_fu_872_p1);

assign select_ln33_29_fu_898_p3 = ((select_ln20_31_reg_1099_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_29_fu_894_p1);

assign select_ln33_30_fu_919_p3 = ((select_ln20_31_reg_1099_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_30_fu_915_p1);

assign select_ln33_fu_837_p3 = ((select_ln20_31_reg_1099_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_833_p1);

assign sext_ln20_fu_711_p1 = (sub_ln32_fu_705_p2);

assign sext_ln22_fu_314_p1 = add_ln22_fu_308_p2;

assign sext_ln32_fu_755_p1 = (tmp_52_fu_747_p3);

assign sext_ln33_11_fu_938_p1 = (tmp_54_fu_931_p3);

assign sext_ln33_12_fu_955_p1 = (tmp_55_fu_948_p3);

assign sext_ln33_fu_857_p1 = (tmp_53_fu_850_p3);

assign sub_ln32_fu_705_p2 = (zext_ln32_fu_689_p1 - zext_ln32_34_fu_701_p1);

assign sub_ln33_cast_fu_791_p1 = (sub_ln33_fu_785_p2);

assign sub_ln33_fu_785_p2 = (zext_ln33_26_fu_781_p1 - zext_ln33_fu_771_p1);

assign tmp1_cast_fu_530_p1 = (tmp1_fu_524_p2);

assign tmp1_cast_mid1_fu_657_p1 = (tmp1_mid1_fu_651_p2);

assign tmp1_fu_524_p2 = ((zext_ln22_fu_514_p1) + (3'd7));

assign tmp1_mid1_fu_651_p2 = ((zext_ln22_7_fu_634_p1) + (3'd7));

assign tmp_155_cast_fu_808_p3 = {{trunc_ln33_fu_804_p1}, {6'd0}};

assign tmp_16_fu_693_p3 = {{select_ln20_32_fu_673_p3}, {1'd0}};

assign tmp_49_fu_323_p3 = add_ln22_fu_308_p2[32'd16];

assign tmp_50_fu_381_p3 = add_ln22_7_fu_376_p2[32'd17];

assign tmp_51_fu_476_p3 = add_ln22_8_fu_471_p2[32'd17];

assign tmp_52_fu_747_p3 = {{add_ln32_fu_727_p2}, {lshr_ln_fu_737_p4}};

assign tmp_53_fu_850_p3 = {{add_ln33_reg_1129}, {or_ln25_fu_845_p2}};

assign tmp_54_fu_931_p3 = {{add_ln33_reg_1129}, {or_ln25_19_fu_926_p2}};

assign tmp_55_fu_948_p3 = {{add_ln33_reg_1129}, {or_ln25_20_fu_943_p2}};

assign tmp_84_i_i_fu_862_p4 = {{in_data_q0[31:16]}};

assign tmp_85_i_i_fu_884_p4 = {{in_data_q0[47:32]}};

assign tmp_86_i_i_fu_905_p4 = {{in_data_q0[63:48]}};

assign tmp_fu_774_p3 = {{select_ln19_36_reg_1080}, {2'd0}};

assign tmp_s_fu_681_p3 = {{select_ln20_32_fu_673_p3}, {4'd0}};

assign trunc_ln250_fu_282_p1 = indices_01_dout[3:0];

assign trunc_ln32_fu_829_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_804_p1 = add_ln33_fu_798_p2[3:0];

assign xor_ln19_fu_598_p2 = (icmp_ln20_reg_1033 ^ 1'd1);

assign zext_ln19_fu_295_p1 = indices_01_read_reg_960;

assign zext_ln20_7_fu_467_p1 = add_ln20_fu_461_p2;

assign zext_ln20_fu_372_p1 = ap_phi_mux_jj_phi_fu_263_p4;

assign zext_ln22_7_fu_634_p1 = add_ln20_reg_1057;

assign zext_ln22_fu_514_p1 = jj_reg_259;

assign zext_ln32_34_fu_701_p1 = tmp_16_fu_693_p3;

assign zext_ln32_35_fu_723_p1 = select_ln20_33_fu_715_p3;

assign zext_ln32_fu_689_p1 = tmp_s_fu_681_p3;

assign zext_ln33_26_fu_781_p1 = tmp_fu_774_p3;

assign zext_ln33_27_fu_795_p1 = select_ln20_30_reg_1093;

assign zext_ln33_28_fu_816_p1 = select_ln20_reg_1087;

assign zext_ln33_29_fu_825_p1 = add_ln33_7_reg_1136;

assign zext_ln33_fu_771_p1 = select_ln19_36_reg_1080;

endmodule //td_fused_top_tdf11_readInputs75
