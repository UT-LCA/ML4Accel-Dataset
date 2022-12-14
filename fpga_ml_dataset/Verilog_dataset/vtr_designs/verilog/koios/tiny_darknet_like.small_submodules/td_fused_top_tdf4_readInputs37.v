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

module td_fused_top_tdf4_readInputs37 (
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
output  [13:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [7:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;
output  [7:0] ifmap_vec_address1;
output   ifmap_vec_ce1;
output   ifmap_vec_we1;
output  [15:0] ifmap_vec_d1;
output  [5:0] indices_01_out_din;
input   indices_01_out_full_n;
output   indices_01_out_write;
output  [11:0] indices_12_out_din;
input   indices_12_out_full_n;
output   indices_12_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg indices_01_read;
reg indices_12_read;
reg[7:0] ifmap_vec_address0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;
reg[15:0] ifmap_vec_d0;
reg[7:0] ifmap_vec_address1;
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
reg   [5:0] indvar_flatten47_reg_224;
reg   [1:0] ii_reg_236;
reg   [4:0] indvar_flatten_reg_248;
reg   [1:0] jj_reg_259;
reg   [4:0] kk_0_i_i_reg_271;
reg   [15:0] indices_01_read_reg_959;
wire   [5:0] trunc_ln250_fu_282_p1;
reg   [5:0] trunc_ln250_reg_964;
reg   [15:0] indices_12_read_reg_969;
wire   [11:0] empty_fu_287_p1;
reg   [11:0] empty_reg_974;
wire   [17:0] p_cast_i_i_fu_304_p1;
reg   [17:0] p_cast_i_i_reg_981;
wire    ap_CS_fsm_state2;
wire   [17:0] sext_ln22_fu_314_p1;
reg   [17:0] sext_ln22_reg_987;
wire   [5:0] p_cast_fu_318_p2;
reg   [5:0] p_cast_reg_993;
wire   [0:0] or_ln23_16_fu_337_p2;
reg   [0:0] or_ln23_16_reg_999;
wire   [11:0] p_mid137_fu_343_p2;
reg   [11:0] p_mid137_reg_1004;
wire   [5:0] p_cast5_i_i_fu_361_p2;
reg   [5:0] p_cast5_i_i_reg_1009;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_401_p2;
reg   [0:0] is_padding_reg_1015;
wire   [0:0] icmp_ln19_fu_407_p2;
reg   [0:0] icmp_ln19_reg_1022;
reg   [0:0] icmp_ln19_reg_1022_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1022_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_413_p2;
reg   [1:0] add_ln19_reg_1026;
wire   [0:0] icmp_ln20_fu_419_p2;
reg   [0:0] icmp_ln20_reg_1031;
wire   [1:0] select_ln19_fu_425_p3;
reg   [1:0] select_ln19_reg_1043;
wire   [5:0] p_cast5_i_i_mid1_fu_446_p2;
reg   [5:0] p_cast5_i_i_mid1_reg_1048;
wire   [0:0] or_ln23_18_fu_465_p2;
reg   [0:0] or_ln23_18_reg_1054;
wire   [1:0] add_ln20_fu_470_p2;
reg   [1:0] add_ln20_reg_1061;
wire   [0:0] or_ln23_20_fu_505_p2;
reg   [0:0] or_ln23_20_reg_1067;
wire   [4:0] add_ln20_4_fu_511_p2;
reg   [4:0] add_ln20_4_reg_1074;
wire   [5:0] add_ln19_4_fu_517_p2;
reg   [5:0] add_ln19_4_reg_1079;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state4_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_state8_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_19_fu_555_p3;
reg   [1:0] select_ln19_19_reg_1084;
wire   [4:0] select_ln20_fu_619_p3;
reg   [4:0] select_ln20_reg_1091;
wire   [1:0] select_ln20_16_fu_627_p3;
reg   [1:0] select_ln20_16_reg_1097;
wire   [0:0] select_ln20_17_fu_636_p3;
reg   [0:0] select_ln20_17_reg_1103;
reg   [0:0] select_ln20_17_reg_1103_pp0_iter1_reg;
wire   [3:0] empty_97_fu_732_p1;
reg   [3:0] empty_97_reg_1111;
reg   [3:0] empty_97_reg_1111_pp0_iter1_reg;
wire   [4:0] select_ln20_20_fu_759_p3;
reg   [4:0] select_ln20_20_reg_1123;
wire   [4:0] add_ln25_fu_765_p2;
reg   [4:0] add_ln25_reg_1128;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_797_p2;
reg   [5:0] add_ln33_reg_1133;
wire   [7:0] add_ln33_4_fu_818_p2;
reg   [7:0] add_ln33_4_reg_1140;
wire   [15:0] select_ln33_17_fu_897_p3;
reg   [15:0] select_ln33_17_reg_1145;
wire   [15:0] select_ln33_18_fu_918_p3;
reg   [15:0] select_ln33_18_reg_1150;
wire    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
reg   [5:0] ap_phi_mux_indvar_flatten47_phi_fu_228_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_240_p4;
reg   [4:0] ap_phi_mux_indvar_flatten_phi_fu_252_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_263_p4;
reg   [4:0] ap_phi_mux_kk_0_i_i_phi_fu_275_p4;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln32_fu_754_p1;
wire   [63:0] zext_ln33_17_fu_824_p1;
wire   [63:0] sext_ln33_fu_856_p1;
wire   [63:0] sext_ln33_7_fu_937_p1;
wire   [63:0] sext_ln33_8_fu_954_p1;
reg    ap_block_state1;
wire   [15:0] select_ln33_fu_836_p3;
wire   [15:0] select_ln33_16_fu_875_p3;
wire   [16:0] zext_ln19_fu_295_p1;
wire   [16:0] empty_92_fu_298_p2;
wire   [16:0] j_cast_i_i_fu_292_p1;
wire   [16:0] add_ln22_fu_308_p2;
wire   [0:0] tmp_26_fu_323_p3;
wire   [0:0] icmp_ln24_fu_331_p2;
wire   [17:0] ii_cast_i_i_fu_348_p1;
wire   [5:0] ii_cast_fu_352_p1;
wire   [17:0] empty_93_fu_356_p2;
wire   [17:0] zext_ln20_fu_372_p1;
wire   [17:0] add_ln22_4_fu_376_p2;
wire   [0:0] tmp_27_fu_381_p3;
wire   [0:0] icmp_ln24_4_fu_389_p2;
wire   [0:0] or_ln23_fu_395_p2;
wire   [0:0] empty_94_fu_366_p2;
wire   [17:0] ii_cast_i_i_mid1_fu_433_p1;
wire   [5:0] ii_cast_mid1_fu_437_p1;
wire   [17:0] p_mid111_fu_441_p2;
wire   [0:0] p_mid113_fu_451_p2;
wire   [17:0] zext_ln20_4_fu_476_p1;
wire   [17:0] add_ln22_5_fu_480_p2;
wire   [0:0] tmp_28_fu_485_p3;
wire   [0:0] icmp_ln24_5_fu_493_p2;
wire   [0:0] or_ln23_19_fu_499_p2;
wire   [0:0] select_ln19_21_fu_457_p3;
wire   [2:0] zext_ln22_fu_523_p1;
wire   [2:0] tmp1_fu_533_p2;
wire   [11:0] tmp1_cast_fu_539_p1;
wire   [11:0] empty_95_fu_543_p2;
wire   [5:0] row_coord_int_mid131_fu_571_p3;
wire   [5:0] row_coord_int_fu_527_p3;
wire   [11:0] col_coord_int_mid139_fu_577_p3;
wire   [11:0] col_coord_int_fu_548_p3;
wire   [0:0] icmp_ln25_fu_602_p2;
wire   [0:0] xor_ln19_fu_597_p2;
wire   [0:0] and_ln19_fu_608_p2;
wire   [0:0] or_ln20_fu_614_p2;
wire   [0:0] select_ln19_22_fu_566_p3;
wire   [5:0] select_ln19_20_fu_561_p3;
wire   [2:0] zext_ln22_4_fu_633_p1;
wire   [2:0] tmp1_mid1_fu_650_p2;
wire   [11:0] tmp1_cast_mid1_fu_656_p1;
wire   [11:0] p_mid1_fu_660_p2;
wire   [5:0] row_coord_int_mid1_fu_643_p3;
wire   [5:0] select_ln19_23_fu_583_p3;
wire   [5:0] select_ln20_18_fu_672_p3;
wire   [11:0] tmp_s_fu_680_p3;
wire   [8:0] tmp_6_fu_692_p3;
wire   [12:0] zext_ln32_fu_688_p1;
wire   [12:0] zext_ln32_18_fu_700_p1;
wire   [12:0] sub_ln32_fu_704_p2;
wire   [11:0] col_coord_int_mid1_fu_665_p3;
wire   [11:0] select_ln19_24_fu_590_p3;
wire   [11:0] select_ln20_19_fu_714_p3;
wire   [13:0] sext_ln20_fu_710_p1;
wire   [13:0] zext_ln32_19_fu_722_p1;
wire   [13:0] add_ln32_fu_726_p2;
wire   [1:0] lshr_ln_fu_736_p4;
wire   [15:0] tmp_29_fu_746_p3;
wire   [3:0] tmp_fu_773_p3;
wire   [4:0] zext_ln33_14_fu_780_p1;
wire   [4:0] zext_ln33_fu_770_p1;
wire   [4:0] sub_ln33_fu_784_p2;
wire   [5:0] sub_ln33_cast_fu_790_p1;
wire   [5:0] zext_ln33_15_fu_794_p1;
wire   [3:0] trunc_ln33_fu_803_p1;
wire   [7:0] tmp_80_cast_fu_807_p3;
wire   [7:0] zext_ln33_16_fu_815_p1;
wire   [15:0] trunc_ln32_fu_828_p1;
wire   [15:0] bitcast_ln32_fu_832_p1;
wire   [3:0] or_ln25_fu_844_p2;
wire   [9:0] tmp_30_fu_849_p3;
wire   [15:0] tmp_44_i_i_fu_861_p4;
wire   [15:0] bitcast_ln32_16_fu_871_p1;
wire   [15:0] tmp_45_i_i_fu_883_p4;
wire   [15:0] bitcast_ln32_17_fu_893_p1;
wire   [15:0] tmp_46_i_i_fu_904_p4;
wire   [15:0] bitcast_ln32_18_fu_914_p1;
wire   [3:0] or_ln25_11_fu_925_p2;
wire   [9:0] tmp_31_fu_930_p3;
wire   [3:0] or_ln25_12_fu_942_p2;
wire   [9:0] tmp_32_fu_947_p3;
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_236 <= select_ln19_19_reg_1084;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ii_reg_236 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten47_reg_224 <= add_ln19_4_reg_1079;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten47_reg_224 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_248 <= select_ln20_20_reg_1123;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_248 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_259 <= select_ln20_16_reg_1097;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        jj_reg_259 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        kk_0_i_i_reg_271 <= add_ln25_reg_1128;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_271 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln19_4_reg_1079 <= add_ln19_4_fu_517_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_407_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln19_reg_1026 <= add_ln19_fu_413_p2;
        add_ln20_4_reg_1074 <= add_ln20_4_fu_511_p2;
        add_ln20_reg_1061 <= add_ln20_fu_470_p2;
        icmp_ln20_reg_1031 <= icmp_ln20_fu_419_p2;
        or_ln23_18_reg_1054 <= or_ln23_18_fu_465_p2;
        or_ln23_20_reg_1067 <= or_ln23_20_fu_505_p2;
        p_cast5_i_i_mid1_reg_1048 <= p_cast5_i_i_mid1_fu_446_p2;
        select_ln19_reg_1043 <= select_ln19_fu_425_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln25_reg_1128 <= add_ln25_fu_765_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln33_4_reg_1140 <= add_ln33_4_fu_818_p2;
        add_ln33_reg_1133 <= add_ln33_fu_797_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_97_reg_1111 <= empty_97_fu_732_p1;
        select_ln20_17_reg_1103 <= select_ln20_17_fu_636_p3;
        select_ln20_reg_1091 <= select_ln20_fu_619_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_97_reg_1111_pp0_iter1_reg <= empty_97_reg_1111;
        select_ln20_17_reg_1103_pp0_iter1_reg <= select_ln20_17_reg_1103;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_974 <= empty_fu_287_p1;
        indices_01_read_reg_959 <= indices_01_dout;
        indices_12_read_reg_969 <= indices_12_dout;
        trunc_ln250_reg_964 <= trunc_ln250_fu_282_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln19_reg_1022 <= icmp_ln19_fu_407_p2;
        icmp_ln19_reg_1022_pp0_iter1_reg <= icmp_ln19_reg_1022;
        icmp_ln19_reg_1022_pp0_iter2_reg <= icmp_ln19_reg_1022_pp0_iter1_reg;
        is_padding_reg_1015 <= is_padding_fu_401_p2;
        p_cast5_i_i_reg_1009 <= p_cast5_i_i_fu_361_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln23_16_reg_999 <= or_ln23_16_fu_337_p2;
        p_cast_i_i_reg_981 <= p_cast_i_i_fu_304_p1;
        p_cast_reg_993 <= p_cast_fu_318_p2;
        p_mid137_reg_1004 <= p_mid137_fu_343_p2;
        sext_ln22_reg_987 <= sext_ln22_fu_314_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        select_ln19_19_reg_1084 <= select_ln19_19_fu_555_p3;
        select_ln20_16_reg_1097 <= select_ln20_16_fu_627_p3;
        select_ln20_20_reg_1123 <= select_ln20_20_fu_759_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln33_17_reg_1145 <= select_ln33_17_fu_897_p3;
        select_ln33_18_reg_1150 <= select_ln33_18_fu_918_p3;
    end
end

always @ (*) begin
    if ((icmp_ln19_reg_1022 == 1'd1)) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_240_p4 = select_ln19_19_reg_1084;
    end else begin
        ap_phi_mux_ii_phi_fu_240_p4 = ii_reg_236;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_228_p4 = add_ln19_4_reg_1079;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_228_p4 = indvar_flatten47_reg_224;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_252_p4 = select_ln20_20_reg_1123;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_252_p4 = indvar_flatten_reg_248;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_263_p4 = select_ln20_16_reg_1097;
    end else begin
        ap_phi_mux_jj_phi_fu_263_p4 = jj_reg_259;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_275_p4 = add_ln25_reg_1128;
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
            ifmap_vec_address0 = sext_ln33_8_fu_954_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address0 = sext_ln33_fu_856_p1;
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
            ifmap_vec_address1 = sext_ln33_7_fu_937_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_17_fu_824_p1;
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
            ifmap_vec_d0 = select_ln33_18_reg_1150;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_16_fu_875_p3;
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
            ifmap_vec_d1 = select_ln33_17_reg_1145;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d1 = select_ln33_fu_836_p3;
        end else begin
            ifmap_vec_d1 = 'bx;
        end
    end else begin
        ifmap_vec_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1022_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1022_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1022_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1022 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1022 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)))) begin
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

assign add_ln19_4_fu_517_p2 = (indvar_flatten47_reg_224 + 6'd1);

assign add_ln19_fu_413_p2 = (ap_phi_mux_ii_phi_fu_240_p4 + 2'd1);

assign add_ln20_4_fu_511_p2 = (ap_phi_mux_indvar_flatten_phi_fu_252_p4 + 5'd1);

assign add_ln20_fu_470_p2 = (select_ln19_fu_425_p3 + 2'd1);

assign add_ln22_4_fu_376_p2 = ((sext_ln22_reg_987) + (zext_ln20_fu_372_p1));

assign add_ln22_5_fu_480_p2 = ((sext_ln22_reg_987) + (zext_ln20_4_fu_476_p1));

assign add_ln22_fu_308_p2 = ((j_cast_i_i_fu_292_p1) + (17'd131071));

assign add_ln25_fu_765_p2 = (select_ln20_reg_1091 + 5'd4);

assign add_ln32_fu_726_p2 = ((sext_ln20_fu_710_p1) + (zext_ln32_19_fu_722_p1));

assign add_ln33_4_fu_818_p2 = (tmp_80_cast_fu_807_p3 + zext_ln33_16_fu_815_p1);

assign add_ln33_fu_797_p2 = ((sub_ln33_cast_fu_790_p1) + (zext_ln33_15_fu_794_p1));

assign and_ln19_fu_608_p2 = (xor_ln19_fu_597_p2 & icmp_ln25_fu_602_p2);

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

assign bitcast_ln32_16_fu_871_p1 = tmp_44_i_i_fu_861_p4;

assign bitcast_ln32_17_fu_893_p1 = tmp_45_i_i_fu_883_p4;

assign bitcast_ln32_18_fu_914_p1 = tmp_46_i_i_fu_904_p4;

assign bitcast_ln32_fu_832_p1 = trunc_ln32_fu_828_p1;

assign col_coord_int_fu_548_p3 = ((is_padding_reg_1015[0:0] == 1'b1) ? 12'd0 : empty_95_fu_543_p2);

assign col_coord_int_mid139_fu_577_p3 = ((or_ln23_18_reg_1054[0:0] == 1'b1) ? 12'd0 : p_mid137_reg_1004);

assign col_coord_int_mid1_fu_665_p3 = ((or_ln23_20_reg_1067[0:0] == 1'b1) ? 12'd0 : p_mid1_fu_660_p2);

assign empty_92_fu_298_p2 = ((zext_ln19_fu_295_p1) + (17'd131071));

assign empty_93_fu_356_p2 = ((p_cast_i_i_reg_981) + (ii_cast_i_i_fu_348_p1));

assign empty_94_fu_366_p2 = ((empty_93_fu_356_p2 > 18'd55) ? 1'b1 : 1'b0);

assign empty_95_fu_543_p2 = ((tmp1_cast_fu_539_p1) + (empty_reg_974));

assign empty_97_fu_732_p1 = select_ln20_fu_619_p3[3:0];

assign empty_fu_287_p1 = indices_12_dout[11:0];

assign icmp_ln19_fu_407_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_228_p4 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_419_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_252_p4 == 5'd12) ? 1'b1 : 1'b0);

assign icmp_ln24_4_fu_389_p2 = (((add_ln22_4_fu_376_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_5_fu_493_p2 = (((add_ln22_5_fu_480_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_331_p2 = (((add_ln22_fu_308_p2) > (17'd55)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_602_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_275_p4 == 5'd16) ? 1'b1 : 1'b0);

assign ii_cast_fu_352_p1 = ap_phi_mux_ii_phi_fu_240_p4;

assign ii_cast_i_i_fu_348_p1 = ap_phi_mux_ii_phi_fu_240_p4;

assign ii_cast_i_i_mid1_fu_433_p1 = add_ln19_fu_413_p2;

assign ii_cast_mid1_fu_437_p1 = add_ln19_fu_413_p2;

assign in_data_address0 = sext_ln32_fu_754_p1;

assign indices_01_out_din = indices_01_dout[5:0];

assign indices_12_out_din = indices_12_dout[11:0];

assign is_padding_fu_401_p2 = (or_ln23_fu_395_p2 | empty_94_fu_366_p2);

assign j_cast_i_i_fu_292_p1 = indices_12_read_reg_969;

assign lshr_ln_fu_736_p4 = {{select_ln20_fu_619_p3[3:2]}};

assign or_ln20_fu_614_p2 = (icmp_ln20_reg_1031 | and_ln19_fu_608_p2);

assign or_ln23_16_fu_337_p2 = (tmp_26_fu_323_p3 | icmp_ln24_fu_331_p2);

assign or_ln23_18_fu_465_p2 = (p_mid113_fu_451_p2 | or_ln23_16_reg_999);

assign or_ln23_19_fu_499_p2 = (tmp_28_fu_485_p3 | icmp_ln24_5_fu_493_p2);

assign or_ln23_20_fu_505_p2 = (select_ln19_21_fu_457_p3 | or_ln23_19_fu_499_p2);

assign or_ln23_fu_395_p2 = (tmp_27_fu_381_p3 | icmp_ln24_4_fu_389_p2);

assign or_ln25_11_fu_925_p2 = (empty_97_reg_1111_pp0_iter1_reg | 4'd2);

assign or_ln25_12_fu_942_p2 = (empty_97_reg_1111_pp0_iter1_reg | 4'd3);

assign or_ln25_fu_844_p2 = (empty_97_reg_1111_pp0_iter1_reg | 4'd1);

assign p_cast5_i_i_fu_361_p2 = (p_cast_reg_993 + ii_cast_fu_352_p1);

assign p_cast5_i_i_mid1_fu_446_p2 = (p_cast_reg_993 + ii_cast_mid1_fu_437_p1);

assign p_cast_fu_318_p2 = ((trunc_ln250_reg_964) + (6'd63));

assign p_cast_i_i_fu_304_p1 = (empty_92_fu_298_p2);

assign p_mid111_fu_441_p2 = ((p_cast_i_i_reg_981) + (ii_cast_i_i_mid1_fu_433_p1));

assign p_mid113_fu_451_p2 = ((p_mid111_fu_441_p2 > 18'd55) ? 1'b1 : 1'b0);

assign p_mid137_fu_343_p2 = ((empty_reg_974) + (12'd4095));

assign p_mid1_fu_660_p2 = ((tmp1_cast_mid1_fu_656_p1) + (empty_reg_974));

assign row_coord_int_fu_527_p3 = ((is_padding_reg_1015[0:0] == 1'b1) ? 6'd0 : p_cast5_i_i_reg_1009);

assign row_coord_int_mid131_fu_571_p3 = ((or_ln23_18_reg_1054[0:0] == 1'b1) ? 6'd0 : p_cast5_i_i_mid1_reg_1048);

assign row_coord_int_mid1_fu_643_p3 = ((or_ln23_20_reg_1067[0:0] == 1'b1) ? 6'd0 : select_ln19_20_fu_561_p3);

assign select_ln19_19_fu_555_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? add_ln19_reg_1026 : ii_reg_236);

assign select_ln19_20_fu_561_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? p_cast5_i_i_mid1_reg_1048 : p_cast5_i_i_reg_1009);

assign select_ln19_21_fu_457_p3 = ((icmp_ln20_fu_419_p2[0:0] == 1'b1) ? p_mid113_fu_451_p2 : empty_94_fu_366_p2);

assign select_ln19_22_fu_566_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? or_ln23_18_reg_1054 : is_padding_reg_1015);

assign select_ln19_23_fu_583_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? row_coord_int_mid131_fu_571_p3 : row_coord_int_fu_527_p3);

assign select_ln19_24_fu_590_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? col_coord_int_mid139_fu_577_p3 : col_coord_int_fu_548_p3);

assign select_ln19_fu_425_p3 = ((icmp_ln20_fu_419_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_263_p4);

assign select_ln20_16_fu_627_p3 = ((and_ln19_fu_608_p2[0:0] == 1'b1) ? add_ln20_reg_1061 : select_ln19_reg_1043);

assign select_ln20_17_fu_636_p3 = ((and_ln19_fu_608_p2[0:0] == 1'b1) ? or_ln23_20_reg_1067 : select_ln19_22_fu_566_p3);

assign select_ln20_18_fu_672_p3 = ((and_ln19_fu_608_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_643_p3 : select_ln19_23_fu_583_p3);

assign select_ln20_19_fu_714_p3 = ((and_ln19_fu_608_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_665_p3 : select_ln19_24_fu_590_p3);

assign select_ln20_20_fu_759_p3 = ((icmp_ln20_reg_1031[0:0] == 1'b1) ? 5'd1 : add_ln20_4_reg_1074);

assign select_ln20_fu_619_p3 = ((or_ln20_fu_614_p2[0:0] == 1'b1) ? 5'd0 : ap_phi_mux_kk_0_i_i_phi_fu_275_p4);

assign select_ln33_16_fu_875_p3 = ((select_ln20_17_reg_1103_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_16_fu_871_p1);

assign select_ln33_17_fu_897_p3 = ((select_ln20_17_reg_1103_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_17_fu_893_p1);

assign select_ln33_18_fu_918_p3 = ((select_ln20_17_reg_1103_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_18_fu_914_p1);

assign select_ln33_fu_836_p3 = ((select_ln20_17_reg_1103_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_832_p1);

assign sext_ln20_fu_710_p1 = (sub_ln32_fu_704_p2);

assign sext_ln22_fu_314_p1 = add_ln22_fu_308_p2;

assign sext_ln32_fu_754_p1 = (tmp_29_fu_746_p3);

assign sext_ln33_7_fu_937_p1 = (tmp_31_fu_930_p3);

assign sext_ln33_8_fu_954_p1 = (tmp_32_fu_947_p3);

assign sext_ln33_fu_856_p1 = (tmp_30_fu_849_p3);

assign sub_ln32_fu_704_p2 = (zext_ln32_fu_688_p1 - zext_ln32_18_fu_700_p1);

assign sub_ln33_cast_fu_790_p1 = (sub_ln33_fu_784_p2);

assign sub_ln33_fu_784_p2 = (zext_ln33_14_fu_780_p1 - zext_ln33_fu_770_p1);

assign tmp1_cast_fu_539_p1 = (tmp1_fu_533_p2);

assign tmp1_cast_mid1_fu_656_p1 = (tmp1_mid1_fu_650_p2);

assign tmp1_fu_533_p2 = ((zext_ln22_fu_523_p1) + (3'd7));

assign tmp1_mid1_fu_650_p2 = ((zext_ln22_4_fu_633_p1) + (3'd7));

assign tmp_26_fu_323_p3 = add_ln22_fu_308_p2[32'd16];

assign tmp_27_fu_381_p3 = add_ln22_4_fu_376_p2[32'd17];

assign tmp_28_fu_485_p3 = add_ln22_5_fu_480_p2[32'd17];

assign tmp_29_fu_746_p3 = {{add_ln32_fu_726_p2}, {lshr_ln_fu_736_p4}};

assign tmp_30_fu_849_p3 = {{add_ln33_reg_1133}, {or_ln25_fu_844_p2}};

assign tmp_31_fu_930_p3 = {{add_ln33_reg_1133}, {or_ln25_11_fu_925_p2}};

assign tmp_32_fu_947_p3 = {{add_ln33_reg_1133}, {or_ln25_12_fu_942_p2}};

assign tmp_44_i_i_fu_861_p4 = {{in_data_q0[31:16]}};

assign tmp_45_i_i_fu_883_p4 = {{in_data_q0[47:32]}};

assign tmp_46_i_i_fu_904_p4 = {{in_data_q0[63:48]}};

assign tmp_6_fu_692_p3 = {{select_ln20_18_fu_672_p3}, {3'd0}};

assign tmp_80_cast_fu_807_p3 = {{trunc_ln33_fu_803_p1}, {4'd0}};

assign tmp_fu_773_p3 = {{select_ln19_19_reg_1084}, {2'd0}};

assign tmp_s_fu_680_p3 = {{select_ln20_18_fu_672_p3}, {6'd0}};

assign trunc_ln250_fu_282_p1 = indices_01_dout[5:0];

assign trunc_ln32_fu_828_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_803_p1 = add_ln33_fu_797_p2[3:0];

assign xor_ln19_fu_597_p2 = (icmp_ln20_reg_1031 ^ 1'd1);

assign zext_ln19_fu_295_p1 = indices_01_read_reg_959;

assign zext_ln20_4_fu_476_p1 = add_ln20_fu_470_p2;

assign zext_ln20_fu_372_p1 = ap_phi_mux_jj_phi_fu_263_p4;

assign zext_ln22_4_fu_633_p1 = add_ln20_reg_1061;

assign zext_ln22_fu_523_p1 = jj_reg_259;

assign zext_ln32_18_fu_700_p1 = tmp_6_fu_692_p3;

assign zext_ln32_19_fu_722_p1 = select_ln20_19_fu_714_p3;

assign zext_ln32_fu_688_p1 = tmp_s_fu_680_p3;

assign zext_ln33_14_fu_780_p1 = tmp_fu_773_p3;

assign zext_ln33_15_fu_794_p1 = select_ln20_16_reg_1097;

assign zext_ln33_16_fu_815_p1 = select_ln20_reg_1091;

assign zext_ln33_17_fu_824_p1 = add_ln33_4_reg_1140;

assign zext_ln33_fu_770_p1 = select_ln19_19_reg_1084;

endmodule //td_fused_top_tdf4_readInputs37
