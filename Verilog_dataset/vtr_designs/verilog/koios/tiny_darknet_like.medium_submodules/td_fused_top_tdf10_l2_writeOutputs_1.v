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

module td_fused_top_tdf10_l2_writeOutputs_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        indices_01_dout,
        indices_01_empty_n,
        indices_01_read,
        indices_12_dout,
        indices_12_empty_n,
        indices_12_read,
        write4_dout,
        write4_empty_n,
        write4_read,
        l2_partial_sums_0_address0,
        l2_partial_sums_0_ce0,
        l2_partial_sums_0_q0,
        l2_partial_sums_1_address0,
        l2_partial_sums_1_ce0,
        l2_partial_sums_1_q0,
        l2_partial_sums_2_address0,
        l2_partial_sums_2_ce0,
        l2_partial_sums_2_q0,
        l2_partial_sums_3_address0,
        l2_partial_sums_3_ce0,
        l2_partial_sums_3_q0,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        l2_adjustments_address0,
        l2_adjustments_ce0,
        l2_adjustments_q0
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state34 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [3:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [7:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [0:0] write4_dout;
input   write4_empty_n;
output   write4_read;
output  [3:0] l2_partial_sums_0_address0;
output   l2_partial_sums_0_ce0;
input  [15:0] l2_partial_sums_0_q0;
output  [3:0] l2_partial_sums_1_address0;
output   l2_partial_sums_1_ce0;
input  [15:0] l2_partial_sums_1_q0;
output  [3:0] l2_partial_sums_2_address0;
output   l2_partial_sums_2_ce0;
input  [15:0] l2_partial_sums_2_q0;
output  [3:0] l2_partial_sums_3_address0;
output   l2_partial_sums_3_ce0;
input  [15:0] l2_partial_sums_3_q0;
output  [11:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
output  [5:0] l2_adjustments_address0;
output   l2_adjustments_ce0;
input  [47:0] l2_adjustments_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg indices_01_read;
reg indices_12_read;
reg write4_read;
reg l2_partial_sums_0_ce0;
reg l2_partial_sums_1_ce0;
reg l2_partial_sums_2_ce0;
reg l2_partial_sums_3_ce0;
reg out_data_ce1;
reg out_data_we1;
reg l2_adjustments_ce0;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    running_sums_3_ce0;
reg    running_sums_3_we0;
wire   [15:0] running_sums_3_d0;
wire   [5:0] running_sums_3_address1;
reg    running_sums_3_ce1;
wire   [15:0] running_sums_3_q1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    write4_blk_n;
reg   [6:0] ochan_reg_253;
reg   [3:0] indices_01_read_reg_632;
reg   [7:0] indices_12_read_reg_638;
reg   [0:0] write4_read_reg_643;
wire   [9:0] add_ln109_fu_315_p2;
reg   [9:0] add_ln109_reg_649;
wire    ap_CS_fsm_state2;
wire   [6:0] add_ln86_fu_321_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_state6_pp0_stage0_iter3;
wire    ap_block_state7_pp0_stage0_iter4;
wire    ap_block_state8_pp0_stage0_iter5;
wire    ap_block_state9_pp0_stage0_iter6;
wire    ap_block_state10_pp0_stage0_iter7;
wire    ap_block_state11_pp0_stage0_iter8;
wire    ap_block_state12_pp0_stage0_iter9;
wire    ap_block_state13_pp0_stage0_iter10;
wire    ap_block_state14_pp0_stage0_iter11;
wire    ap_block_state15_pp0_stage0_iter12;
wire    ap_block_state16_pp0_stage0_iter13;
wire    ap_block_state17_pp0_stage0_iter14;
wire    ap_block_state18_pp0_stage0_iter15;
wire    ap_block_state19_pp0_stage0_iter16;
wire    ap_block_state20_pp0_stage0_iter17;
wire    ap_block_state21_pp0_stage0_iter18;
wire    ap_block_state22_pp0_stage0_iter19;
wire    ap_block_state23_pp0_stage0_iter20;
wire    ap_block_state24_pp0_stage0_iter21;
wire    ap_block_state25_pp0_stage0_iter22;
wire    ap_block_state26_pp0_stage0_iter23;
wire    ap_block_state27_pp0_stage0_iter24;
wire    ap_block_state28_pp0_stage0_iter25;
wire    ap_block_state29_pp0_stage0_iter26;
wire    ap_block_state30_pp0_stage0_iter27;
wire    ap_block_state31_pp0_stage0_iter28;
wire    ap_block_state32_pp0_stage0_iter29;
wire    ap_block_state33_pp0_stage0_iter30;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln86_fu_327_p2;
wire   [63:0] zext_ln86_fu_333_p1;
reg   [63:0] zext_ln86_reg_663;
reg   [63:0] zext_ln86_reg_663_pp0_iter1_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter2_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter3_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter4_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter5_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter6_reg;
reg   [63:0] zext_ln86_reg_663_pp0_iter7_reg;
wire   [1:0] trunc_ln89_fu_338_p1;
reg   [1:0] trunc_ln89_reg_668;
reg   [1:0] trunc_ln89_reg_668_pp0_iter1_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter2_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter3_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter4_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter5_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter6_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter7_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter8_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter9_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter10_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter11_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter12_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter13_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter14_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter15_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter16_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter17_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter18_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter19_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter20_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter21_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter22_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter23_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter24_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter25_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter26_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter27_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter28_reg;
reg   [1:0] trunc_ln89_reg_668_pp0_iter29_reg;
wire   [3:0] lshr_ln_fu_342_p4;
reg   [3:0] lshr_ln_reg_676;
reg   [3:0] lshr_ln_reg_676_pp0_iter1_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter2_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter3_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter4_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter5_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter6_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter7_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter8_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter9_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter10_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter11_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter12_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter13_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter14_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter15_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter16_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter17_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter18_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter19_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter20_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter21_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter22_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter23_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter24_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter25_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter26_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter27_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter28_reg;
reg   [3:0] lshr_ln_reg_676_pp0_iter29_reg;
reg   [5:0] running_sums_3_addr_reg_701;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter1_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter2_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter3_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter4_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter5_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter6_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter7_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter8_reg;
reg   [5:0] running_sums_3_addr_reg_701_pp0_iter9_reg;
wire   [0:0] and_ln103_fu_366_p2;
reg   [0:0] and_ln103_reg_707;
reg   [0:0] and_ln103_reg_707_pp0_iter1_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter2_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter3_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter4_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter5_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter6_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter7_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter8_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter9_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter10_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter11_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter12_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter13_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter14_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter15_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter16_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter17_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter18_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter19_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter20_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter21_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter22_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter23_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter24_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter25_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter26_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter27_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter28_reg;
reg   [0:0] and_ln103_reg_707_pp0_iter29_reg;
wire   [15:0] val_fu_374_p6;
reg   [15:0] val_reg_711;
reg   [15:0] running_sums_3_load_reg_716;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_264_p2;
reg   [15:0] sum_reg_726;
wire   [15:0] trunc_ln95_fu_388_p1;
reg   [15:0] trunc_ln95_reg_732;
reg   [15:0] tmp_391_i_i_reg_737;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter10_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter11_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter12_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter13_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter14_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter15_reg;
reg   [15:0] tmp_391_i_i_reg_737_pp0_iter16_reg;
reg   [15:0] tmp_392_i_i_reg_742;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter10_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter11_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter12_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter13_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter14_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter15_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter16_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter17_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter18_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter19_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter20_reg;
reg   [15:0] tmp_392_i_i_reg_742_pp0_iter21_reg;
wire   [15:0] grp_fu_272_p2;
reg   [15:0] sub_i_i_i_reg_752;
wire   [15:0] grp_fu_276_p2;
reg   [15:0] normalized_reg_762;
wire   [15:0] grp_fu_268_p2;
reg   [15:0] biased_reg_772;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_enable_reg_pp0_iter19;
reg    ap_enable_reg_pp0_iter20;
reg    ap_enable_reg_pp0_iter21;
reg    ap_enable_reg_pp0_iter22;
reg    ap_enable_reg_pp0_iter23;
reg    ap_enable_reg_pp0_iter24;
reg    ap_enable_reg_pp0_iter25;
reg    ap_enable_reg_pp0_iter26;
reg    ap_enable_reg_pp0_iter27;
reg    ap_enable_reg_pp0_iter28;
reg    ap_enable_reg_pp0_iter29;
reg    ap_enable_reg_pp0_iter30;
wire   [63:0] zext_ln89_5_fu_352_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] sext_ln109_fu_449_p1;
reg   [15:0] quad_3_39_fu_120;
wire   [15:0] quad_3_58_fu_551_p3;
reg   [15:0] quad_3_36_fu_124;
wire   [15:0] quad_3_57_fu_543_p3;
reg   [15:0] quad_3_40_fu_128;
wire   [15:0] quad_3_55_fu_527_p3;
reg   [15:0] quad_3_41_fu_132;
wire   [15:0] quad_3_52_fu_503_p3;
reg    ap_block_state1;
wire   [15:0] grp_fu_268_p1;
wire   [15:0] grp_fu_272_p1;
wire   [15:0] grp_fu_276_p1;
wire   [7:0] tmp_fu_280_p3;
wire   [4:0] tmp_s_fu_291_p3;
wire   [8:0] zext_ln109_fu_287_p1;
wire   [8:0] zext_ln109_7_fu_298_p1;
wire   [8:0] sub_ln109_fu_302_p2;
wire   [9:0] sub_ln109_cast_fu_308_p1;
wire   [9:0] zext_ln109_8_fu_312_p1;
wire   [0:0] icmp_ln103_fu_360_p2;
wire   [63:0] val_fu_374_p5;
wire   [13:0] tmp_105_fu_443_p3;
wire   [15:0] data_V_fu_454_p1;
wire   [0:0] p_Result_s_fu_457_p3;
wire   [0:0] icmp_ln99_fu_472_p2;
wire   [15:0] quad_0_fu_465_p3;
wire   [0:0] icmp_ln99_7_fu_485_p2;
wire   [15:0] quad_3_fu_477_p3;
wire   [0:0] icmp_ln99_8_fu_498_p2;
wire   [15:0] quad_3_51_fu_490_p3;
wire   [15:0] quad_3_53_fu_511_p3;
wire   [15:0] quad_3_54_fu_519_p3;
wire   [15:0] quad_3_56_fu_535_p3;
wire   [15:0] bitcast_ln109_12_fu_591_p1;
wire   [15:0] bitcast_ln109_11_fu_587_p1;
wire   [15:0] bitcast_ln109_10_fu_583_p1;
wire   [15:0] bitcast_ln109_fu_579_p1;
wire    ap_CS_fsm_state34;
reg   [3:0] ap_NS_fsm;
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
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_enable_reg_pp0_iter19 = 1'b0;
#0 ap_enable_reg_pp0_iter20 = 1'b0;
#0 ap_enable_reg_pp0_iter21 = 1'b0;
#0 ap_enable_reg_pp0_iter22 = 1'b0;
#0 ap_enable_reg_pp0_iter23 = 1'b0;
#0 ap_enable_reg_pp0_iter24 = 1'b0;
#0 ap_enable_reg_pp0_iter25 = 1'b0;
#0 ap_enable_reg_pp0_iter26 = 1'b0;
#0 ap_enable_reg_pp0_iter27 = 1'b0;
#0 ap_enable_reg_pp0_iter28 = 1'b0;
#0 ap_enable_reg_pp0_iter29 = 1'b0;
#0 ap_enable_reg_pp0_iter30 = 1'b0;
end

td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
running_sums_3_U(
    .reset(ap_rst),
    .clk(ap_clk),
    .address0(running_sums_3_addr_reg_701_pp0_iter9_reg),
    .ce0(running_sums_3_ce0),
    .we0(running_sums_3_we0),
    .d0(running_sums_3_d0),
    .address1(running_sums_3_address1),
    .ce1(running_sums_3_ce1),
    .q1(running_sums_3_q1)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1544(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(running_sums_3_load_reg_716),
    .din1(val_reg_711),
    .dout(grp_fu_264_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1545(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(normalized_reg_762),
    .din1(grp_fu_268_p1),
    .dout(grp_fu_268_p2)
);

td_fused_top_hsub_16ns_16ns_16_7_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 7 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_7_full_dsp_1_U1546(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_reg_726),
    .din1(grp_fu_272_p1),
    .dout(grp_fu_272_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1547(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_752),
    .din1(grp_fu_276_p1),
    .dout(grp_fu_276_p2)
);

td_fused_top_mux_464_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 64 ),
    .dout_WIDTH( 16 ))
mux_464_16_1_1_U1548(
    .din0(l2_partial_sums_0_q0),
    .din1(l2_partial_sums_1_q0),
    .din2(l2_partial_sums_2_q0),
    .din3(l2_partial_sums_3_q0),
    .din4(val_fu_374_p5),
    .dout(val_fu_374_p6)
);

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
        end else if ((1'b1 == ap_CS_fsm_state34)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter19 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
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
        ap_enable_reg_pp0_iter20 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter20 <= ap_enable_reg_pp0_iter19;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter21 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter21 <= ap_enable_reg_pp0_iter20;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter22 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter21;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter23 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter23 <= ap_enable_reg_pp0_iter22;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter24 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter24 <= ap_enable_reg_pp0_iter23;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter25 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter25 <= ap_enable_reg_pp0_iter24;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter26 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter26 <= ap_enable_reg_pp0_iter25;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter27 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter27 <= ap_enable_reg_pp0_iter26;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter28 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter28 <= ap_enable_reg_pp0_iter27;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter29 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter29 <= ap_enable_reg_pp0_iter28;
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
        ap_enable_reg_pp0_iter30 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter30 <= ap_enable_reg_pp0_iter29;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter30 <= 1'b0;
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
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln86_fu_327_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ochan_reg_253 <= add_ln86_fu_321_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ochan_reg_253 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln109_reg_649 <= add_ln109_fu_315_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln86_fu_327_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln103_reg_707 <= and_ln103_fu_366_p2;
        lshr_ln_reg_676 <= {{ochan_reg_253[5:2]}};
        running_sums_3_addr_reg_701 <= zext_ln86_fu_333_p1;
        trunc_ln89_reg_668 <= trunc_ln89_fu_338_p1;
        zext_ln86_reg_663[6 : 0] <= zext_ln86_fu_333_p1[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        and_ln103_reg_707_pp0_iter10_reg <= and_ln103_reg_707_pp0_iter9_reg;
        and_ln103_reg_707_pp0_iter11_reg <= and_ln103_reg_707_pp0_iter10_reg;
        and_ln103_reg_707_pp0_iter12_reg <= and_ln103_reg_707_pp0_iter11_reg;
        and_ln103_reg_707_pp0_iter13_reg <= and_ln103_reg_707_pp0_iter12_reg;
        and_ln103_reg_707_pp0_iter14_reg <= and_ln103_reg_707_pp0_iter13_reg;
        and_ln103_reg_707_pp0_iter15_reg <= and_ln103_reg_707_pp0_iter14_reg;
        and_ln103_reg_707_pp0_iter16_reg <= and_ln103_reg_707_pp0_iter15_reg;
        and_ln103_reg_707_pp0_iter17_reg <= and_ln103_reg_707_pp0_iter16_reg;
        and_ln103_reg_707_pp0_iter18_reg <= and_ln103_reg_707_pp0_iter17_reg;
        and_ln103_reg_707_pp0_iter19_reg <= and_ln103_reg_707_pp0_iter18_reg;
        and_ln103_reg_707_pp0_iter20_reg <= and_ln103_reg_707_pp0_iter19_reg;
        and_ln103_reg_707_pp0_iter21_reg <= and_ln103_reg_707_pp0_iter20_reg;
        and_ln103_reg_707_pp0_iter22_reg <= and_ln103_reg_707_pp0_iter21_reg;
        and_ln103_reg_707_pp0_iter23_reg <= and_ln103_reg_707_pp0_iter22_reg;
        and_ln103_reg_707_pp0_iter24_reg <= and_ln103_reg_707_pp0_iter23_reg;
        and_ln103_reg_707_pp0_iter25_reg <= and_ln103_reg_707_pp0_iter24_reg;
        and_ln103_reg_707_pp0_iter26_reg <= and_ln103_reg_707_pp0_iter25_reg;
        and_ln103_reg_707_pp0_iter27_reg <= and_ln103_reg_707_pp0_iter26_reg;
        and_ln103_reg_707_pp0_iter28_reg <= and_ln103_reg_707_pp0_iter27_reg;
        and_ln103_reg_707_pp0_iter29_reg <= and_ln103_reg_707_pp0_iter28_reg;
        and_ln103_reg_707_pp0_iter2_reg <= and_ln103_reg_707_pp0_iter1_reg;
        and_ln103_reg_707_pp0_iter3_reg <= and_ln103_reg_707_pp0_iter2_reg;
        and_ln103_reg_707_pp0_iter4_reg <= and_ln103_reg_707_pp0_iter3_reg;
        and_ln103_reg_707_pp0_iter5_reg <= and_ln103_reg_707_pp0_iter4_reg;
        and_ln103_reg_707_pp0_iter6_reg <= and_ln103_reg_707_pp0_iter5_reg;
        and_ln103_reg_707_pp0_iter7_reg <= and_ln103_reg_707_pp0_iter6_reg;
        and_ln103_reg_707_pp0_iter8_reg <= and_ln103_reg_707_pp0_iter7_reg;
        and_ln103_reg_707_pp0_iter9_reg <= and_ln103_reg_707_pp0_iter8_reg;
        biased_reg_772 <= grp_fu_268_p2;
        lshr_ln_reg_676_pp0_iter10_reg <= lshr_ln_reg_676_pp0_iter9_reg;
        lshr_ln_reg_676_pp0_iter11_reg <= lshr_ln_reg_676_pp0_iter10_reg;
        lshr_ln_reg_676_pp0_iter12_reg <= lshr_ln_reg_676_pp0_iter11_reg;
        lshr_ln_reg_676_pp0_iter13_reg <= lshr_ln_reg_676_pp0_iter12_reg;
        lshr_ln_reg_676_pp0_iter14_reg <= lshr_ln_reg_676_pp0_iter13_reg;
        lshr_ln_reg_676_pp0_iter15_reg <= lshr_ln_reg_676_pp0_iter14_reg;
        lshr_ln_reg_676_pp0_iter16_reg <= lshr_ln_reg_676_pp0_iter15_reg;
        lshr_ln_reg_676_pp0_iter17_reg <= lshr_ln_reg_676_pp0_iter16_reg;
        lshr_ln_reg_676_pp0_iter18_reg <= lshr_ln_reg_676_pp0_iter17_reg;
        lshr_ln_reg_676_pp0_iter19_reg <= lshr_ln_reg_676_pp0_iter18_reg;
        lshr_ln_reg_676_pp0_iter20_reg <= lshr_ln_reg_676_pp0_iter19_reg;
        lshr_ln_reg_676_pp0_iter21_reg <= lshr_ln_reg_676_pp0_iter20_reg;
        lshr_ln_reg_676_pp0_iter22_reg <= lshr_ln_reg_676_pp0_iter21_reg;
        lshr_ln_reg_676_pp0_iter23_reg <= lshr_ln_reg_676_pp0_iter22_reg;
        lshr_ln_reg_676_pp0_iter24_reg <= lshr_ln_reg_676_pp0_iter23_reg;
        lshr_ln_reg_676_pp0_iter25_reg <= lshr_ln_reg_676_pp0_iter24_reg;
        lshr_ln_reg_676_pp0_iter26_reg <= lshr_ln_reg_676_pp0_iter25_reg;
        lshr_ln_reg_676_pp0_iter27_reg <= lshr_ln_reg_676_pp0_iter26_reg;
        lshr_ln_reg_676_pp0_iter28_reg <= lshr_ln_reg_676_pp0_iter27_reg;
        lshr_ln_reg_676_pp0_iter29_reg <= lshr_ln_reg_676_pp0_iter28_reg;
        lshr_ln_reg_676_pp0_iter2_reg <= lshr_ln_reg_676_pp0_iter1_reg;
        lshr_ln_reg_676_pp0_iter3_reg <= lshr_ln_reg_676_pp0_iter2_reg;
        lshr_ln_reg_676_pp0_iter4_reg <= lshr_ln_reg_676_pp0_iter3_reg;
        lshr_ln_reg_676_pp0_iter5_reg <= lshr_ln_reg_676_pp0_iter4_reg;
        lshr_ln_reg_676_pp0_iter6_reg <= lshr_ln_reg_676_pp0_iter5_reg;
        lshr_ln_reg_676_pp0_iter7_reg <= lshr_ln_reg_676_pp0_iter6_reg;
        lshr_ln_reg_676_pp0_iter8_reg <= lshr_ln_reg_676_pp0_iter7_reg;
        lshr_ln_reg_676_pp0_iter9_reg <= lshr_ln_reg_676_pp0_iter8_reg;
        normalized_reg_762 <= grp_fu_276_p2;
        running_sums_3_addr_reg_701_pp0_iter2_reg <= running_sums_3_addr_reg_701_pp0_iter1_reg;
        running_sums_3_addr_reg_701_pp0_iter3_reg <= running_sums_3_addr_reg_701_pp0_iter2_reg;
        running_sums_3_addr_reg_701_pp0_iter4_reg <= running_sums_3_addr_reg_701_pp0_iter3_reg;
        running_sums_3_addr_reg_701_pp0_iter5_reg <= running_sums_3_addr_reg_701_pp0_iter4_reg;
        running_sums_3_addr_reg_701_pp0_iter6_reg <= running_sums_3_addr_reg_701_pp0_iter5_reg;
        running_sums_3_addr_reg_701_pp0_iter7_reg <= running_sums_3_addr_reg_701_pp0_iter6_reg;
        running_sums_3_addr_reg_701_pp0_iter8_reg <= running_sums_3_addr_reg_701_pp0_iter7_reg;
        running_sums_3_addr_reg_701_pp0_iter9_reg <= running_sums_3_addr_reg_701_pp0_iter8_reg;
        sub_i_i_i_reg_752 <= grp_fu_272_p2;
        sum_reg_726 <= grp_fu_264_p2;
        tmp_391_i_i_reg_737 <= {{l2_adjustments_q0[31:16]}};
        tmp_391_i_i_reg_737_pp0_iter10_reg <= tmp_391_i_i_reg_737;
        tmp_391_i_i_reg_737_pp0_iter11_reg <= tmp_391_i_i_reg_737_pp0_iter10_reg;
        tmp_391_i_i_reg_737_pp0_iter12_reg <= tmp_391_i_i_reg_737_pp0_iter11_reg;
        tmp_391_i_i_reg_737_pp0_iter13_reg <= tmp_391_i_i_reg_737_pp0_iter12_reg;
        tmp_391_i_i_reg_737_pp0_iter14_reg <= tmp_391_i_i_reg_737_pp0_iter13_reg;
        tmp_391_i_i_reg_737_pp0_iter15_reg <= tmp_391_i_i_reg_737_pp0_iter14_reg;
        tmp_391_i_i_reg_737_pp0_iter16_reg <= tmp_391_i_i_reg_737_pp0_iter15_reg;
        tmp_392_i_i_reg_742 <= {{l2_adjustments_q0[47:32]}};
        tmp_392_i_i_reg_742_pp0_iter10_reg <= tmp_392_i_i_reg_742;
        tmp_392_i_i_reg_742_pp0_iter11_reg <= tmp_392_i_i_reg_742_pp0_iter10_reg;
        tmp_392_i_i_reg_742_pp0_iter12_reg <= tmp_392_i_i_reg_742_pp0_iter11_reg;
        tmp_392_i_i_reg_742_pp0_iter13_reg <= tmp_392_i_i_reg_742_pp0_iter12_reg;
        tmp_392_i_i_reg_742_pp0_iter14_reg <= tmp_392_i_i_reg_742_pp0_iter13_reg;
        tmp_392_i_i_reg_742_pp0_iter15_reg <= tmp_392_i_i_reg_742_pp0_iter14_reg;
        tmp_392_i_i_reg_742_pp0_iter16_reg <= tmp_392_i_i_reg_742_pp0_iter15_reg;
        tmp_392_i_i_reg_742_pp0_iter17_reg <= tmp_392_i_i_reg_742_pp0_iter16_reg;
        tmp_392_i_i_reg_742_pp0_iter18_reg <= tmp_392_i_i_reg_742_pp0_iter17_reg;
        tmp_392_i_i_reg_742_pp0_iter19_reg <= tmp_392_i_i_reg_742_pp0_iter18_reg;
        tmp_392_i_i_reg_742_pp0_iter20_reg <= tmp_392_i_i_reg_742_pp0_iter19_reg;
        tmp_392_i_i_reg_742_pp0_iter21_reg <= tmp_392_i_i_reg_742_pp0_iter20_reg;
        trunc_ln89_reg_668_pp0_iter10_reg <= trunc_ln89_reg_668_pp0_iter9_reg;
        trunc_ln89_reg_668_pp0_iter11_reg <= trunc_ln89_reg_668_pp0_iter10_reg;
        trunc_ln89_reg_668_pp0_iter12_reg <= trunc_ln89_reg_668_pp0_iter11_reg;
        trunc_ln89_reg_668_pp0_iter13_reg <= trunc_ln89_reg_668_pp0_iter12_reg;
        trunc_ln89_reg_668_pp0_iter14_reg <= trunc_ln89_reg_668_pp0_iter13_reg;
        trunc_ln89_reg_668_pp0_iter15_reg <= trunc_ln89_reg_668_pp0_iter14_reg;
        trunc_ln89_reg_668_pp0_iter16_reg <= trunc_ln89_reg_668_pp0_iter15_reg;
        trunc_ln89_reg_668_pp0_iter17_reg <= trunc_ln89_reg_668_pp0_iter16_reg;
        trunc_ln89_reg_668_pp0_iter18_reg <= trunc_ln89_reg_668_pp0_iter17_reg;
        trunc_ln89_reg_668_pp0_iter19_reg <= trunc_ln89_reg_668_pp0_iter18_reg;
        trunc_ln89_reg_668_pp0_iter20_reg <= trunc_ln89_reg_668_pp0_iter19_reg;
        trunc_ln89_reg_668_pp0_iter21_reg <= trunc_ln89_reg_668_pp0_iter20_reg;
        trunc_ln89_reg_668_pp0_iter22_reg <= trunc_ln89_reg_668_pp0_iter21_reg;
        trunc_ln89_reg_668_pp0_iter23_reg <= trunc_ln89_reg_668_pp0_iter22_reg;
        trunc_ln89_reg_668_pp0_iter24_reg <= trunc_ln89_reg_668_pp0_iter23_reg;
        trunc_ln89_reg_668_pp0_iter25_reg <= trunc_ln89_reg_668_pp0_iter24_reg;
        trunc_ln89_reg_668_pp0_iter26_reg <= trunc_ln89_reg_668_pp0_iter25_reg;
        trunc_ln89_reg_668_pp0_iter27_reg <= trunc_ln89_reg_668_pp0_iter26_reg;
        trunc_ln89_reg_668_pp0_iter28_reg <= trunc_ln89_reg_668_pp0_iter27_reg;
        trunc_ln89_reg_668_pp0_iter29_reg <= trunc_ln89_reg_668_pp0_iter28_reg;
        trunc_ln89_reg_668_pp0_iter2_reg <= trunc_ln89_reg_668_pp0_iter1_reg;
        trunc_ln89_reg_668_pp0_iter3_reg <= trunc_ln89_reg_668_pp0_iter2_reg;
        trunc_ln89_reg_668_pp0_iter4_reg <= trunc_ln89_reg_668_pp0_iter3_reg;
        trunc_ln89_reg_668_pp0_iter5_reg <= trunc_ln89_reg_668_pp0_iter4_reg;
        trunc_ln89_reg_668_pp0_iter6_reg <= trunc_ln89_reg_668_pp0_iter5_reg;
        trunc_ln89_reg_668_pp0_iter7_reg <= trunc_ln89_reg_668_pp0_iter6_reg;
        trunc_ln89_reg_668_pp0_iter8_reg <= trunc_ln89_reg_668_pp0_iter7_reg;
        trunc_ln89_reg_668_pp0_iter9_reg <= trunc_ln89_reg_668_pp0_iter8_reg;
        trunc_ln95_reg_732 <= trunc_ln95_fu_388_p1;
        zext_ln86_reg_663_pp0_iter2_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter1_reg[6 : 0];
        zext_ln86_reg_663_pp0_iter3_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter2_reg[6 : 0];
        zext_ln86_reg_663_pp0_iter4_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter3_reg[6 : 0];
        zext_ln86_reg_663_pp0_iter5_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter4_reg[6 : 0];
        zext_ln86_reg_663_pp0_iter6_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter5_reg[6 : 0];
        zext_ln86_reg_663_pp0_iter7_reg[6 : 0] <= zext_ln86_reg_663_pp0_iter6_reg[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln103_reg_707_pp0_iter1_reg <= and_ln103_reg_707;
        lshr_ln_reg_676_pp0_iter1_reg <= lshr_ln_reg_676;
        running_sums_3_addr_reg_701_pp0_iter1_reg <= running_sums_3_addr_reg_701;
        trunc_ln89_reg_668_pp0_iter1_reg <= trunc_ln89_reg_668;
        val_reg_711 <= val_fu_374_p6;
        zext_ln86_reg_663_pp0_iter1_reg[6 : 0] <= zext_ln86_reg_663[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_01_read_reg_632 <= indices_01_dout;
        indices_12_read_reg_638 <= indices_12_dout;
        write4_read_reg_643 <= write4_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter30 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        quad_3_36_fu_124 <= quad_3_57_fu_543_p3;
        quad_3_39_fu_120 <= quad_3_58_fu_551_p3;
        quad_3_40_fu_128 <= quad_3_55_fu_527_p3;
        quad_3_41_fu_132 <= quad_3_52_fu_503_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_3_load_reg_716 <= running_sums_3_q1;
    end
end

always @ (*) begin
    if ((icmp_ln86_fu_327_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state34)) begin
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
    if (((ap_enable_reg_pp0_iter30 == 1'b0) & (ap_enable_reg_pp0_iter29 == 1'b0) & (ap_enable_reg_pp0_iter28 == 1'b0) & (ap_enable_reg_pp0_iter27 == 1'b0) & (ap_enable_reg_pp0_iter26 == 1'b0) & (ap_enable_reg_pp0_iter25 == 1'b0) & (ap_enable_reg_pp0_iter24 == 1'b0) & (ap_enable_reg_pp0_iter23 == 1'b0) & (ap_enable_reg_pp0_iter22 == 1'b0) & (ap_enable_reg_pp0_iter21 == 1'b0) & (ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state34)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_blk_n = indices_01_empty_n;
    end else begin
        indices_01_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_read = 1'b1;
    end else begin
        indices_01_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_blk_n = indices_12_empty_n;
    end else begin
        indices_12_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_adjustments_ce0 = 1'b1;
    end else begin
        l2_adjustments_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        l2_partial_sums_0_ce0 = 1'b1;
    end else begin
        l2_partial_sums_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        l2_partial_sums_1_ce0 = 1'b1;
    end else begin
        l2_partial_sums_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        l2_partial_sums_2_ce0 = 1'b1;
    end else begin
        l2_partial_sums_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        l2_partial_sums_3_ce0 = 1'b1;
    end else begin
        l2_partial_sums_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter30 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter30 == 1'b1) & (1'd1 == and_ln103_reg_707_pp0_iter29_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter10 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_3_ce0 = 1'b1;
    end else begin
        running_sums_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        running_sums_3_ce1 = 1'b1;
    end else begin
        running_sums_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter10 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_3_we0 = 1'b1;
    end else begin
        running_sums_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write4_blk_n = write4_empty_n;
    end else begin
        write4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write4_read = 1'b1;
    end else begin
        write4_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln86_fu_327_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter30 == 1'b1) & (ap_enable_reg_pp0_iter29 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter30 == 1'b1) & (ap_enable_reg_pp0_iter29 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln86_fu_327_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state34;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln109_fu_315_p2 = ((sub_ln109_cast_fu_308_p1) + (zext_ln109_8_fu_312_p1));

assign add_ln86_fu_321_p2 = (ochan_reg_253 + 7'd1);

assign and_ln103_fu_366_p2 = (write4_read_reg_643 & icmp_ln103_fu_360_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state34 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state22_pp0_stage0_iter19 = ~(1'b1 == 1'b1);

assign ap_block_state23_pp0_stage0_iter20 = ~(1'b1 == 1'b1);

assign ap_block_state24_pp0_stage0_iter21 = ~(1'b1 == 1'b1);

assign ap_block_state25_pp0_stage0_iter22 = ~(1'b1 == 1'b1);

assign ap_block_state26_pp0_stage0_iter23 = ~(1'b1 == 1'b1);

assign ap_block_state27_pp0_stage0_iter24 = ~(1'b1 == 1'b1);

assign ap_block_state28_pp0_stage0_iter25 = ~(1'b1 == 1'b1);

assign ap_block_state29_pp0_stage0_iter26 = ~(1'b1 == 1'b1);

assign ap_block_state30_pp0_stage0_iter27 = ~(1'b1 == 1'b1);

assign ap_block_state31_pp0_stage0_iter28 = ~(1'b1 == 1'b1);

assign ap_block_state32_pp0_stage0_iter29 = ~(1'b1 == 1'b1);

assign ap_block_state33_pp0_stage0_iter30 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln109_10_fu_583_p1 = quad_3_57_fu_543_p3;

assign bitcast_ln109_11_fu_587_p1 = quad_3_55_fu_527_p3;

assign bitcast_ln109_12_fu_591_p1 = quad_3_52_fu_503_p3;

assign bitcast_ln109_fu_579_p1 = quad_3_58_fu_551_p3;

assign data_V_fu_454_p1 = biased_reg_772;

assign grp_fu_268_p1 = tmp_392_i_i_reg_742_pp0_iter21_reg;

assign grp_fu_272_p1 = trunc_ln95_reg_732;

assign grp_fu_276_p1 = tmp_391_i_i_reg_737_pp0_iter16_reg;

assign icmp_ln103_fu_360_p2 = ((trunc_ln89_fu_338_p1 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_327_p2 = ((ochan_reg_253 == 7'd64) ? 1'b1 : 1'b0);

assign icmp_ln99_7_fu_485_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln99_8_fu_498_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln99_fu_472_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd2) ? 1'b1 : 1'b0);

assign l2_adjustments_address0 = zext_ln86_reg_663_pp0_iter7_reg;

assign l2_partial_sums_0_address0 = zext_ln89_5_fu_352_p1;

assign l2_partial_sums_1_address0 = zext_ln89_5_fu_352_p1;

assign l2_partial_sums_2_address0 = zext_ln89_5_fu_352_p1;

assign l2_partial_sums_3_address0 = zext_ln89_5_fu_352_p1;

assign lshr_ln_fu_342_p4 = {{ochan_reg_253[5:2]}};

assign out_data_address1 = sext_ln109_fu_449_p1;

assign out_data_d1 = {{{{bitcast_ln109_12_fu_591_p1}, {bitcast_ln109_11_fu_587_p1}}, {bitcast_ln109_10_fu_583_p1}}, {bitcast_ln109_fu_579_p1}};

assign p_Result_s_fu_457_p3 = data_V_fu_454_p1[32'd15];

assign quad_0_fu_465_p3 = ((p_Result_s_fu_457_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_772);

assign quad_3_51_fu_490_p3 = ((icmp_ln99_7_fu_485_p2[0:0] == 1'b1) ? quad_3_41_fu_132 : quad_3_fu_477_p3);

assign quad_3_52_fu_503_p3 = ((icmp_ln99_8_fu_498_p2[0:0] == 1'b1) ? quad_3_41_fu_132 : quad_3_51_fu_490_p3);

assign quad_3_53_fu_511_p3 = ((icmp_ln99_fu_472_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_40_fu_128);

assign quad_3_54_fu_519_p3 = ((icmp_ln99_7_fu_485_p2[0:0] == 1'b1) ? quad_3_40_fu_128 : quad_3_53_fu_511_p3);

assign quad_3_55_fu_527_p3 = ((icmp_ln99_8_fu_498_p2[0:0] == 1'b1) ? quad_3_40_fu_128 : quad_3_54_fu_519_p3);

assign quad_3_56_fu_535_p3 = ((icmp_ln99_7_fu_485_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_36_fu_124);

assign quad_3_57_fu_543_p3 = ((icmp_ln99_8_fu_498_p2[0:0] == 1'b1) ? quad_3_36_fu_124 : quad_3_56_fu_535_p3);

assign quad_3_58_fu_551_p3 = ((icmp_ln99_8_fu_498_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_39_fu_120);

assign quad_3_fu_477_p3 = ((icmp_ln99_fu_472_p2[0:0] == 1'b1) ? quad_3_41_fu_132 : quad_0_fu_465_p3);

assign running_sums_3_address1 = zext_ln86_fu_333_p1;

assign running_sums_3_d0 = ((write4_read_reg_643[0:0] == 1'b1) ? 16'd0 : sum_reg_726);

assign sext_ln109_fu_449_p1 = (tmp_105_fu_443_p3);

assign sub_ln109_cast_fu_308_p1 = (sub_ln109_fu_302_p2);

assign sub_ln109_fu_302_p2 = (zext_ln109_fu_287_p1 - zext_ln109_7_fu_298_p1);

assign tmp_105_fu_443_p3 = {{add_ln109_reg_649}, {lshr_ln_reg_676_pp0_iter29_reg}};

assign tmp_fu_280_p3 = {{indices_01_read_reg_632}, {4'd0}};

assign tmp_s_fu_291_p3 = {{indices_01_read_reg_632}, {1'd0}};

assign trunc_ln89_fu_338_p1 = ochan_reg_253[1:0];

assign trunc_ln95_fu_388_p1 = l2_adjustments_q0[15:0];

assign val_fu_374_p5 = trunc_ln89_reg_668;

assign zext_ln109_7_fu_298_p1 = tmp_s_fu_291_p3;

assign zext_ln109_8_fu_312_p1 = indices_12_read_reg_638;

assign zext_ln109_fu_287_p1 = tmp_fu_280_p3;

assign zext_ln86_fu_333_p1 = ochan_reg_253;

assign zext_ln89_5_fu_352_p1 = lshr_ln_fu_342_p4;

always @ (posedge ap_clk) begin
    zext_ln86_reg_663[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter1_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter2_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter3_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter4_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter5_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter6_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter7_reg[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
end

endmodule //td_fused_top_tdf10_l2_writeOutputs_1
module td_fused_top_mux_464_16_1_1 #(
parameter
    ID                = 0,
    NUM_STAGE         = 1,
    din0_WIDTH       = 32,
    din1_WIDTH       = 32,
    din2_WIDTH       = 32,
    din3_WIDTH       = 32,
    din4_WIDTH         = 32,
    dout_WIDTH            = 32
)(
    input  [15 : 0]     din0,
    input  [15 : 0]     din1,
    input  [15 : 0]     din2,
    input  [15 : 0]     din3,
    input  [63 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [63 : 0]     sel;
// level 1 signals
wire [15 : 0]         mux_1_0;
wire [15 : 0]         mux_1_1;
// level 2 signals
wire [15 : 0]         mux_2_0;
// level 3 signals
wire [15 : 0]         mux_3_0;
// level 4 signals
wire [15 : 0]         mux_4_0;
// level 5 signals
wire [15 : 0]         mux_5_0;
// level 6 signals
wire [15 : 0]         mux_6_0;
// level 7 signals
wire [15 : 0]         mux_7_0;
// level 8 signals
wire [15 : 0]         mux_8_0;
// level 9 signals
wire [15 : 0]         mux_9_0;
// level 10 signals
wire [15 : 0]         mux_10_0;
// level 11 signals
wire [15 : 0]         mux_11_0;
// level 12 signals
wire [15 : 0]         mux_12_0;
// level 13 signals
wire [15 : 0]         mux_13_0;
// level 14 signals
wire [15 : 0]         mux_14_0;
// level 15 signals
wire [15 : 0]         mux_15_0;
// level 16 signals
wire [15 : 0]         mux_16_0;
// level 17 signals
wire [15 : 0]         mux_17_0;
// level 18 signals
wire [15 : 0]         mux_18_0;
// level 19 signals
wire [15 : 0]         mux_19_0;
// level 20 signals
wire [15 : 0]         mux_20_0;
// level 21 signals
wire [15 : 0]         mux_21_0;
// level 22 signals
wire [15 : 0]         mux_22_0;
// level 23 signals
wire [15 : 0]         mux_23_0;
// level 24 signals
wire [15 : 0]         mux_24_0;
// level 25 signals
wire [15 : 0]         mux_25_0;
// level 26 signals
wire [15 : 0]         mux_26_0;
// level 27 signals
wire [15 : 0]         mux_27_0;
// level 28 signals
wire [15 : 0]         mux_28_0;
// level 29 signals
wire [15 : 0]         mux_29_0;
// level 30 signals
wire [15 : 0]         mux_30_0;
// level 31 signals
wire [15 : 0]         mux_31_0;
// level 32 signals
wire [15 : 0]         mux_32_0;
// level 33 signals
wire [15 : 0]         mux_33_0;
// level 34 signals
wire [15 : 0]         mux_34_0;
// level 35 signals
wire [15 : 0]         mux_35_0;
// level 36 signals
wire [15 : 0]         mux_36_0;
// level 37 signals
wire [15 : 0]         mux_37_0;
// level 38 signals
wire [15 : 0]         mux_38_0;
// level 39 signals
wire [15 : 0]         mux_39_0;
// level 40 signals
wire [15 : 0]         mux_40_0;
// level 41 signals
wire [15 : 0]         mux_41_0;
// level 42 signals
wire [15 : 0]         mux_42_0;
// level 43 signals
wire [15 : 0]         mux_43_0;
// level 44 signals
wire [15 : 0]         mux_44_0;
// level 45 signals
wire [15 : 0]         mux_45_0;
// level 46 signals
wire [15 : 0]         mux_46_0;
// level 47 signals
wire [15 : 0]         mux_47_0;
// level 48 signals
wire [15 : 0]         mux_48_0;
// level 49 signals
wire [15 : 0]         mux_49_0;
// level 50 signals
wire [15 : 0]         mux_50_0;
// level 51 signals
wire [15 : 0]         mux_51_0;
// level 52 signals
wire [15 : 0]         mux_52_0;
// level 53 signals
wire [15 : 0]         mux_53_0;
// level 54 signals
wire [15 : 0]         mux_54_0;
// level 55 signals
wire [15 : 0]         mux_55_0;
// level 56 signals
wire [15 : 0]         mux_56_0;
// level 57 signals
wire [15 : 0]         mux_57_0;
// level 58 signals
wire [15 : 0]         mux_58_0;
// level 59 signals
wire [15 : 0]         mux_59_0;
// level 60 signals
wire [15 : 0]         mux_60_0;
// level 61 signals
wire [15 : 0]         mux_61_0;
// level 62 signals
wire [15 : 0]         mux_62_0;
// level 63 signals
wire [15 : 0]         mux_63_0;
// level 64 signals
wire [15 : 0]         mux_64_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// Generate level 3 logic
assign mux_3_0 = mux_2_0;

// Generate level 4 logic
assign mux_4_0 = mux_3_0;

// Generate level 5 logic
assign mux_5_0 = mux_4_0;

// Generate level 6 logic
assign mux_6_0 = mux_5_0;

// Generate level 7 logic
assign mux_7_0 = mux_6_0;

// Generate level 8 logic
assign mux_8_0 = mux_7_0;

// Generate level 9 logic
assign mux_9_0 = mux_8_0;

// Generate level 10 logic
assign mux_10_0 = mux_9_0;

// Generate level 11 logic
assign mux_11_0 = mux_10_0;

// Generate level 12 logic
assign mux_12_0 = mux_11_0;

// Generate level 13 logic
assign mux_13_0 = mux_12_0;

// Generate level 14 logic
assign mux_14_0 = mux_13_0;

// Generate level 15 logic
assign mux_15_0 = mux_14_0;

// Generate level 16 logic
assign mux_16_0 = mux_15_0;

// Generate level 17 logic
assign mux_17_0 = mux_16_0;

// Generate level 18 logic
assign mux_18_0 = mux_17_0;

// Generate level 19 logic
assign mux_19_0 = mux_18_0;

// Generate level 20 logic
assign mux_20_0 = mux_19_0;

// Generate level 21 logic
assign mux_21_0 = mux_20_0;

// Generate level 22 logic
assign mux_22_0 = mux_21_0;

// Generate level 23 logic
assign mux_23_0 = mux_22_0;

// Generate level 24 logic
assign mux_24_0 = mux_23_0;

// Generate level 25 logic
assign mux_25_0 = mux_24_0;

// Generate level 26 logic
assign mux_26_0 = mux_25_0;

// Generate level 27 logic
assign mux_27_0 = mux_26_0;

// Generate level 28 logic
assign mux_28_0 = mux_27_0;

// Generate level 29 logic
assign mux_29_0 = mux_28_0;

// Generate level 30 logic
assign mux_30_0 = mux_29_0;

// Generate level 31 logic
assign mux_31_0 = mux_30_0;

// Generate level 32 logic
assign mux_32_0 = mux_31_0;

// Generate level 33 logic
assign mux_33_0 = mux_32_0;

// Generate level 34 logic
assign mux_34_0 = mux_33_0;

// Generate level 35 logic
assign mux_35_0 = mux_34_0;

// Generate level 36 logic
assign mux_36_0 = mux_35_0;

// Generate level 37 logic
assign mux_37_0 = mux_36_0;

// Generate level 38 logic
assign mux_38_0 = mux_37_0;

// Generate level 39 logic
assign mux_39_0 = mux_38_0;

// Generate level 40 logic
assign mux_40_0 = mux_39_0;

// Generate level 41 logic
assign mux_41_0 = mux_40_0;

// Generate level 42 logic
assign mux_42_0 = mux_41_0;

// Generate level 43 logic
assign mux_43_0 = mux_42_0;

// Generate level 44 logic
assign mux_44_0 = mux_43_0;

// Generate level 45 logic
assign mux_45_0 = mux_44_0;

// Generate level 46 logic
assign mux_46_0 = mux_45_0;

// Generate level 47 logic
assign mux_47_0 = mux_46_0;

// Generate level 48 logic
assign mux_48_0 = mux_47_0;

// Generate level 49 logic
assign mux_49_0 = mux_48_0;

// Generate level 50 logic
assign mux_50_0 = mux_49_0;

// Generate level 51 logic
assign mux_51_0 = mux_50_0;

// Generate level 52 logic
assign mux_52_0 = mux_51_0;

// Generate level 53 logic
assign mux_53_0 = mux_52_0;

// Generate level 54 logic
assign mux_54_0 = mux_53_0;

// Generate level 55 logic
assign mux_55_0 = mux_54_0;

// Generate level 56 logic
assign mux_56_0 = mux_55_0;

// Generate level 57 logic
assign mux_57_0 = mux_56_0;

// Generate level 58 logic
assign mux_58_0 = mux_57_0;

// Generate level 59 logic
assign mux_59_0 = mux_58_0;

// Generate level 60 logic
assign mux_60_0 = mux_59_0;

// Generate level 61 logic
assign mux_61_0 = mux_60_0;

// Generate level 62 logic
assign mux_62_0 = mux_61_0;

// Generate level 63 logic
assign mux_63_0 = mux_62_0;

// Generate level 64 logic
assign mux_64_0 = mux_63_0;

// output logic
assign dout = mux_64_0;

endmodule
module td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    address1,
    ce1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd64;
parameter AddressWidth = 32'd6;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3_ram td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3_ram (addr0, ce0, d0, we0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 6;
parameter MEM_SIZE = 64;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input clk;

 reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];

//initial begin
//    $readmemh("./td_fused_top_tdf10_l2_writeOutputs_1_running_sums_3_ram.dat", ram);
//end



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram[addr1];
    end
end


endmodule

module td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1
#(parameter
    ID         = 45,
    NUM_STAGE  = 8,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 16
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  r_tvalid;
wire [15:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
td_fused_top_ap_hadd_6_full_dsp_16 td_fused_top_ap_hadd_6_full_dsp_16_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce_r;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1;
assign dout_i   = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
        din1_buf1 <= din1;
    end
end

always @ (posedge clk) begin
    ce_r <= ce;
end

always @ (posedge clk) begin
    if (ce_r) begin
        dout_r <= dout_i;
    end
end

assign dout = ce_r?dout_i:dout_r;
endmodule

module td_fused_top_ap_hadd_6_full_dsp_16 (
   input  wire        aclk,
   input wire         aclken,
   input  wire        s_axis_a_tvalid,
   input  wire [15:0] s_axis_a_tdata,
   input  wire        s_axis_b_tvalid,
   input  wire [15:0] s_axis_b_tdata,
   output wire        m_axis_result_tvalid,
   output wire [15:0] m_axis_result_tdata
);

   reg [15:0] a_reg, b_reg, res, res_reg;

   always @(posedge aclk) begin
      if (aclken) begin
         a_reg <= s_axis_a_tdata;     
         b_reg <= s_axis_b_tdata;     
         res_reg <= res;
      end
   end

`ifdef complex_dsp
   adder_fp u_add_fp (
      .a(a_reg), 
      .b(b_reg), 
      .out(res)
   );
`else
FPAddSub u_FPAddSub (.clk(), .rst(1'b0), .a(a_reg), .b(b_reg), .operation(1'b0), .result(res), .flags());
`endif

   assign m_axis_result_tdata = res_reg;

endmodule
module FPAddSub(
		clk,
		rst,
		a,
		b,
		operation,			// 0 add, 1 sub
		result,
		flags
	);
	
	// Clock and reset
	input clk ;										// Clock signal
	input rst ;										// Reset (active high, resets pipeline registers)
	
	// Input ports
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	input operation ;								// Operation select signal
	
	// Output ports
	output [`DWIDTH-1:0] result ;						// Result of the operation
	output [4:0] flags ;							// Flags indicating exceptions according to IEEE754
	
	// Pipeline Registers
	//reg [79:0] pipe_1;							// Pipeline register PreAlign->Align1
	reg [`DWIDTH*2+15:0] pipe_1;							// Pipeline register PreAlign->Align1

	//reg [67:0] pipe_2;							// Pipeline register Align1->Align3
	reg [`MANTISSA*2+`EXPONENT+13:0] pipe_2;							// Pipeline register Align1->Align3

	//reg [76:0] pipe_3;	68						// Pipeline register Align1->Align3
	reg [`MANTISSA*2+`EXPONENT+14:0] pipe_3;							// Pipeline register Align1->Align3

	//reg [69:0] pipe_4;							// Pipeline register Align3->Execute
	reg [`MANTISSA*2+`EXPONENT+15:0] pipe_4;							// Pipeline register Align3->Execute

	//reg [51:0] pipe_5;							// Pipeline register Execute->Normalize
	reg [`DWIDTH+`EXPONENT+11:0] pipe_5;							// Pipeline register Execute->Normalize

	//reg [56:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1
	reg [`DWIDTH+`EXPONENT+16:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1

	//reg [56:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3
	reg [`DWIDTH+`EXPONENT+16:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3

	//reg [54:0] pipe_8;							// Pipeline register NormalizeShift3->Round
	reg [`EXPONENT*2+`MANTISSA+15:0] pipe_8;							// Pipeline register NormalizeShift3->Round

	//reg [40:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	reg [`DWIDTH+8:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	
	// Internal wires between modules
	wire [`DWIDTH-2:0] Aout_0 ;							// A - sign
	wire [`DWIDTH-2:0] Bout_0 ;							// B - sign
	wire Opout_0 ;									// A's sign
	wire Sa_0 ;										// A's sign
	wire Sb_0 ;										// B's sign
	wire MaxAB_1 ;									// Indicates the larger of A and B(0/A, 1/B)
	wire [`EXPONENT-1:0] CExp_1 ;							// Common Exponent
	wire [4:0] Shift_1 ;							// Number of steps to smaller mantissa shift right (align)
	wire [`MANTISSA-1:0] Mmax_1 ;							// Larger mantissa
	wire [4:0] InputExc_0 ;						// Input numbers are exceptions
	wire [9:0] ShiftDet_0 ;
	wire [`MANTISSA-1:0] MminS_1 ;						// Smaller mantissa after 0/16 shift
	wire [`MANTISSA:0] MminS_2 ;						// Smaller mantissa after 0/4/8/12 shift
	wire [`MANTISSA:0] Mmin_3 ;							// Smaller mantissa after 0/1/2/3 shift
	wire [`DWIDTH:0] Sum_4 ;
	wire PSgn_4 ;
	wire Opr_4 ;
	wire [4:0] Shift_5 ;							// Number of steps to shift sum left (normalize)
	wire [`DWIDTH:0] SumS_5 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_6 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_7 ;							// Sum after 0/16 shift
	wire [`MANTISSA-1:0] NormM_8 ;						// Normalized mantissa
	wire [`EXPONENT:0] NormE_8;							// Adjusted exponent
	wire ZeroSum_8 ;								// Zero flag
	wire NegE_8 ;									// Flag indicating negative exponent
	wire R_8 ;										// Round bit
	wire S_8 ;										// Final sticky bit
	wire FG_8 ;										// Final sticky bit
	wire [`DWIDTH-1:0] P_int ;
	wire EOF ;
	
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_PrealignModule PrealignModule
	(	// Inputs
		a, b, operation,
		// Outputs
		Sa_0, Sb_0, ShiftDet_0[9:0], InputExc_0[4:0], Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Opout_0) ;
		
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_AlignModule AlignModule
	(	// Inputs
		pipe_1[14+2*`DWIDTH:16+`DWIDTH], pipe_1[15+`DWIDTH:17], pipe_1[14:5],
		// Outputs
		CExp_1[`EXPONENT-1:0], MaxAB_1, Shift_1[4:0], MminS_1[`MANTISSA-1:0], Mmax_1[`MANTISSA-1:0]) ;	

	// Alignment Shift Stage 1
	FPAddSub_AlignShift1 AlignShift1
	(  // Inputs
		pipe_2[`MANTISSA-1:0], pipe_2[2*`MANTISSA+9:2*`MANTISSA+7],
		// Outputs
		MminS_2[`MANTISSA:0]) ;

	// Alignment Shift Stage 3 and compution of guard and sticky bits
	FPAddSub_AlignShift2 AlignShift2  
	(  // Inputs
		pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+7:2*`MANTISSA+6],
		// Outputs
		Mmin_3[`MANTISSA:0]) ;
						
	// Perform mantissa addition
	FPAddSub_ExecutionModule ExecutionModule
	(  // Inputs
		pipe_4[`MANTISSA*2+5:`MANTISSA+6], pipe_4[`MANTISSA:0], pipe_4[`MANTISSA*2+`EXPONENT+13], pipe_4[`MANTISSA*2+`EXPONENT+12], pipe_4[`MANTISSA*2+`EXPONENT+11], pipe_4[`MANTISSA*2+`EXPONENT+14],
		// Outputs
		Sum_4[`DWIDTH:0], PSgn_4, Opr_4) ;
	
	// Prepare normalization of result
	FPAddSub_NormalizeModule NormalizeModule
	(  // Inputs
		pipe_5[`DWIDTH:0], 
		// Outputs
		SumS_5[`DWIDTH:0], Shift_5[4:0]) ;
					
	// Normalization Shift Stage 1
	FPAddSub_NormalizeShift1 NormalizeShift1
	(  // Inputs
		pipe_6[`DWIDTH:0], pipe_6[`DWIDTH+`EXPONENT+14:`DWIDTH+`EXPONENT+11],
		// Outputs
		SumS_7[`DWIDTH:0]) ;
		
	// Normalization Shift Stage 3 and final guard, sticky and round bits
	FPAddSub_NormalizeShift2 NormalizeShift2
	(  // Inputs
		pipe_7[`DWIDTH:0], pipe_7[`DWIDTH+`EXPONENT+5:`DWIDTH+6], pipe_7[`DWIDTH+`EXPONENT+15:`DWIDTH+`EXPONENT+11],
		// Outputs
		NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8, FG_8) ;

	// Round and put result together
	FPAddSub_RoundModule RoundModule
	(  // Inputs
		 pipe_8[3], pipe_8[4+`EXPONENT:4], pipe_8[`EXPONENT+`MANTISSA+4:5+`EXPONENT], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT*2+`MANTISSA+15], pipe_8[`EXPONENT*2+`MANTISSA+12], pipe_8[`EXPONENT*2+`MANTISSA+11], pipe_8[`EXPONENT*2+`MANTISSA+14], pipe_8[`EXPONENT*2+`MANTISSA+10], 
		// Outputs
		P_int[`DWIDTH-1:0], EOF) ;
	
	// Check for exceptions
	FPAddSub_ExceptionModule Exceptionmodule
	(  // Inputs
		pipe_9[8+`DWIDTH:9], pipe_9[8], pipe_9[7], pipe_9[6], pipe_9[5:1], pipe_9[0], 
		// Outputs
		result[`DWIDTH-1:0], flags[4:0]) ;			
	
	always @ (*) begin	
		if(rst) begin
			pipe_1 = 0;
			pipe_2 = 0;
			pipe_3 = 0;
			pipe_4 = 0;
			pipe_5 = 0;
			pipe_6 = 0;
			pipe_7 = 0;
			pipe_8 = 0;
			pipe_9 = 0;
		end 
		else begin
		
			pipe_1 = {Opout_0, Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Sa_0, Sb_0, ShiftDet_0[9:0], InputExc_0[4:0]} ;	
			// PIPE_2 :
			//[67] operation
			//[66] Sa_0
			//[65] Sb_0
			//[64] MaxAB_0
			//[63:56] CExp_0
			//[55:51] Shift_0
			//[50:28] Mmax_0
			//[27:23] InputExc_0
			//[22:0] MminS_1
			//
			pipe_2 = {pipe_1[`DWIDTH*2+15], pipe_1[16:15], MaxAB_1, CExp_1[`EXPONENT-1:0], Shift_1[4:0], Mmax_1[`MANTISSA-1:0], pipe_1[4:0], MminS_1[`MANTISSA-1:0]} ;	
			// PIPE_3 :
			//[68] operation
			//[67] Sa_0
			//[66] Sb_0
			//[65] MaxAB_0
			//[64:57] CExp_0
			//[56:52] Shift_0
			//[51:29] Mmax_0
			//[28:24] InputExc_0
			//[23:0] MminS_1
			//
			pipe_3 = {pipe_2[`MANTISSA*2+`EXPONENT+13:`MANTISSA], MminS_2[`MANTISSA:0]} ;	
			// PIPE_4 :
			//[68] operation
			//[67] Sa_0
			//[66] Sb_0
			//[65] MaxAB_0
			//[64:57] CExp_0
			//[56:52] Shift_0
			//[51:29] Mmax_0
			//[28:24] InputExc_0
			//[23:0] Mmin_3
			//					
			pipe_4 = {pipe_3[`MANTISSA*2+`EXPONENT+14:`MANTISSA+1], Mmin_3[`MANTISSA:0]} ;	
			// PIPE_5 :
			//[51] operation
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//					
			pipe_5 = {pipe_4[2*`MANTISSA+`EXPONENT+14], PSgn_4, Opr_4, pipe_4[2*`MANTISSA+`EXPONENT+13:2*`MANTISSA+11], pipe_4[`MANTISSA+5:`MANTISSA+1], Sum_4[`DWIDTH:0]} ;
			// PIPE_6 :
			//[56] operation
			//[55:51] Shift_5
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//					
			pipe_6 = {pipe_5[`EXPONENT+`EXPONENT+11], Shift_5[4:0], pipe_5[`DWIDTH+`EXPONENT+10:`DWIDTH+1], SumS_5[`DWIDTH:0]} ;	
			// pipe_7 :
			//[56] operation
			//[55:51] Shift_5
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//						
			pipe_7 = {pipe_6[`DWIDTH+`EXPONENT+16:`DWIDTH+1], SumS_7[`DWIDTH:0]} ;	
			// pipe_8:
			//[54] FG_8 
			//[53] operation
			//[52] PSgn_4
			//[51] Sa_0
			//[50] Sb_0
			//[49] MaxAB_0
			//[48:41] CExp_0
			//[40:36] InputExc_8
			//[35:13] NormM_8 
			//[12:4] NormE_8
			//[3] ZeroSum_8
			//[2] NegE_8
			//[1] R_8
			//[0] S_8
			//				
			pipe_8 = {FG_8, pipe_7[`DWIDTH+`EXPONENT+16], pipe_7[`DWIDTH+`EXPONENT+10], pipe_7[`DWIDTH+`EXPONENT+8:`DWIDTH+1], NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8} ;	
			// pipe_9:
			//[40:9] P_int
			//[8] NegE_8
			//[7] R_8
			//[6] S_8
			//[5:1] InputExc_8
			//[0] EOF
			//				
			pipe_9 = {P_int[`DWIDTH-1:0], pipe_8[2], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT+`MANTISSA+9:`EXPONENT+`MANTISSA+5], EOF} ;	
		end
	end		
	
endmodule
module FPAddSub_ExceptionModule(
		Z,
		NegE,
		R,
		S,
		InputExc,
		EOF,
		P,
		Flags
    );
	 
	// Input ports
	input [`DWIDTH-1:0] Z	;					// Final product
	input NegE ;						// Negative exponent?
	input R ;							// Round bit
	input S ;							// Sticky bit
	input [4:0] InputExc ;			// Exceptions in inputs A and B
	input EOF ;
	
	// Output ports
	output [`DWIDTH-1:0] P ;					// Final result
	output [4:0] Flags ;				// Exception flags
	
	// Internal signals
	wire Overflow ;					// Overflow flag
	wire Underflow ;					// Underflow flag
	wire DivideByZero ;				// Divide-by-Zero flag (always 0 in Add/Sub)
	wire Invalid ;						// Invalid inputs or result
	wire Inexact ;						// Result is inexact because of rounding
	
	// Exception flags
	
	// Result is too big to be represented
	assign Overflow = EOF | InputExc[1] | InputExc[0] ;
	
	// Result is too small to be represented
	assign Underflow = NegE & (R | S);
	
	// Infinite result computed exactly from finite operands
	assign DivideByZero = &(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~|(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~InputExc[1] & ~InputExc[0];
	
	// Invalid inputs or operation
	assign Invalid = |(InputExc[4:2]) ;
	
	// Inexact answer due to rounding, overflow or underflow
	assign Inexact = (R | S) | Overflow | Underflow;
	
	// Put pieces together to form final result
	assign P = Z ;
	
	// Collect exception flags	
	assign Flags = {Overflow, Underflow, DivideByZero, Invalid, Inexact} ; 	
	
endmodule
module FPAddSub_RoundModule(
		ZeroSum,
		NormE,
		NormM,
		R,
		S,
		G,
		Sa,
		Sb,
		Ctrl,
		MaxAB,
		Z,
		EOF
    );

	// Input ports
	input ZeroSum ;					// Sum is zero
	input [`EXPONENT:0] NormE ;				// Normalized exponent
	input [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	input R ;							// Round bit
	input S ;							// Sticky bit
	input G ;
	input Sa ;							// A's sign bit
	input Sb ;							// B's sign bit
	input Ctrl ;						// Control bit (operation)
	input MaxAB ;
	
	// Output ports
	output [`DWIDTH-1:0] Z ;					// Final result
	output EOF ;
	
	// Internal signals
	wire [`MANTISSA:0] RoundUpM ;			// Rounded up sum with room for overflow
	wire [`MANTISSA-1:0] RoundM ;				// The final rounded sum
	wire [`EXPONENT:0] RoundE ;				// Rounded exponent (note extra bit due to poential overflow	)
	wire RoundUp ;						// Flag indicating that the sum should be rounded up
        wire FSgn;
	wire ExpAdd ;						// May have to add 1 to compensate for overflow 
	wire RoundOF ;						// Rounding overflow
	
	// The cases where we need to round upwards (= adding one) in Round to nearest, tie to even
	assign RoundUp = (G & ((R | S) | NormM[0])) ;
	
	// Note that in the other cases (rounding down), the sum is already 'rounded'
	assign RoundUpM = (NormM + 1) ;								// The sum, rounded up by 1
	assign RoundM = (RoundUp ? RoundUpM[`MANTISSA-1:0] : NormM) ; 	// Compute final mantissa	
	assign RoundOF = RoundUp & RoundUpM[`MANTISSA] ; 				// Check for overflow when rounding up

	// Calculate post-rounding exponent
	assign ExpAdd = (RoundOF ? 1'b1 : 1'b0) ; 				// Add 1 to exponent to compensate for overflow
	assign RoundE = ZeroSum ? 5'b00000 : (NormE + ExpAdd) ; 							// Final exponent

	// If zero, need to determine sign according to rounding
	assign FSgn = (ZeroSum & (Sa ^ Sb)) | (ZeroSum ? (Sa & Sb & ~Ctrl) : ((~MaxAB & Sa) | ((Ctrl ^ Sb) & (MaxAB | Sa)))) ;

	// Assign final result
	assign Z = {FSgn, RoundE[`EXPONENT-1:0], RoundM[`MANTISSA-1:0]} ;
	
	// Indicate exponent overflow
	assign EOF = RoundE[`EXPONENT];
	
endmodule
module FPAddSub_NormalizeShift2(
		PSSum,
		CExp,
		Shift,
		NormM,
		NormE,
		ZeroSum,
		NegE,
		R,
		S,
		FG
	);
	
	// Input ports
	input [`DWIDTH:0] PSSum ;					// The Pre-Shift-Sum
	input [`EXPONENT-1:0] CExp ;
	input [4:0] Shift ;					// Amount to be shifted

	// Output ports
	output [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	output [`EXPONENT:0] NormE ;					// Adjusted exponent
	output ZeroSum ;						// Zero flag
	output NegE ;							// Flag indicating negative exponent
	output R ;								// Round bit
	output S ;								// Final sticky bit
	output FG ;

	// Internal signals
	wire MSBShift ;						// Flag indicating that a second shift is needed
	wire [`EXPONENT:0] ExpOF ;					// MSB set in sum indicates overflow
	wire [`EXPONENT:0] ExpOK ;					// MSB not set, no adjustment
	
	// Calculate normalized exponent and mantissa, check for all-zero sum
	assign MSBShift = PSSum[`DWIDTH] ;		// Check MSB in unnormalized sum
	assign ZeroSum = ~|PSSum ;			// Check for all zero sum
	assign ExpOK = CExp - Shift ;		// Adjust exponent for new normalized mantissa
	assign NegE = ExpOK[`EXPONENT] ;			// Check for exponent overflow
	assign ExpOF = CExp - Shift + 1'b1 ;		// If MSB set, add one to exponent(x2)
	assign NormE = MSBShift ? ExpOF : ExpOK ;			// Check for exponent overflow
	assign NormM = PSSum[`DWIDTH-1:`EXPONENT+1] ;		// The new, normalized mantissa
	
	// Also need to compute sticky and round bits for the rounding stage
	assign FG = PSSum[`EXPONENT] ; 
	assign R = PSSum[`EXPONENT-1] ;
	assign S = |PSSum[`EXPONENT-2:0] ;
	
endmodule
module FPAddSub_NormalizeShift1(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`DWIDTH:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [3:0] Shift ;						// Shift amount
	
	// Output ports
	output [`DWIDTH:0] Mmin ;						// The smaller mantissa
	
	reg	  [`DWIDTH:0]		Lvl2;
	wire    [2*`DWIDTH+1:0]    Stage1;	
	reg	  [`DWIDTH:0]		Lvl3;
	wire    [2*`DWIDTH+1:0]    Stage2;	
	integer           i;               	// Loop variable
	
	assign Stage1 = {MminP, MminP};

	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[3:2])
			// Rotate by 0
			2'b00: //Lvl2 <= Stage1[`DWIDTH:0];       		
      begin Lvl2 = Stage1[`DWIDTH:0];  end
			// Rotate by 4
			2'b01: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-4]; end Lvl2[3:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-4)] = Stage1[3:0]; Lvl2[`DWIDTH-4-1:0] = Stage1[`DWIDTH-4]; end
			// Rotate by 8
			2'b10: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-8]; end Lvl2[7:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-8)] = Stage1[3:0]; Lvl2[`DWIDTH-8-1:0] = Stage1[`DWIDTH-8]; end
			// Rotate by 12
			2'b11: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-12]; end Lvl2[11:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-12)] = Stage1[3:0]; Lvl2[`DWIDTH-12-1:0] = Stage1[`DWIDTH-12]; end
	  endcase
	end
	
	assign Stage2 = {Lvl2, Lvl2};

	always @(*) begin   				 		// Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  //Lvl3 <= Stage2[`DWIDTH:0];
      begin Lvl3 = Stage2[`DWIDTH:0]; end
			// Rotate by 1
			2'b01: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-1]; end Lvl3[0] <= 0; end 
      begin Lvl3[`DWIDTH: (`DWIDTH-1)] = Stage2[3:0]; Lvl3[`DWIDTH-1-1:0] = Stage2[`DWIDTH-1]; end
			// Rotate by 2
			2'b10: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-2]; end Lvl3[1:0] <= 0; end
      begin Lvl3[`DWIDTH: (`DWIDTH-2)] = Stage2[3:0]; Lvl3[`DWIDTH-2-1:0] = Stage2[`DWIDTH-2]; end
			// Rotate by 3
			2'b11: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-3]; end Lvl3[2:0] <= 0; end
      begin Lvl3[`DWIDTH: (`DWIDTH-3)] = Stage2[3:0]; Lvl3[`DWIDTH-3-1:0] = Stage2[`DWIDTH-3]; end
	  endcase
	end
	
	// Assign outputs
	assign Mmin = Lvl3;						// Take out smaller mantissa			
	
endmodule
module FPAddSub_NormalizeModule(
		Sum,
		Mmin,
		Shift
    );

	// Input ports
	input [`DWIDTH:0] Sum ;					// Mantissa sum including hidden 1 and GRS
	
	// Output ports
	output [`DWIDTH:0] Mmin ;					// Mantissa after 16|0 shift
	output [4:0] Shift ;					// Shift amount
	
	// Determine normalization shift amount by finding leading nought
	assign Shift =  ( 
		Sum[16] ? 5'b00000 :	 
		Sum[15] ? 5'b00001 : 
		Sum[14] ? 5'b00010 : 
		Sum[13] ? 5'b00011 : 
		Sum[12] ? 5'b00100 : 
		Sum[11] ? 5'b00101 : 
		Sum[10] ? 5'b00110 : 
		Sum[9] ? 5'b00111 :
		Sum[8] ? 5'b01000 :
		Sum[7] ? 5'b01001 :
		Sum[6] ? 5'b01010 :
		Sum[5] ? 5'b01011 :
		Sum[4] ? 5'b01100 : 5'b01101
	//	Sum[19] ? 5'b01101 :
	//	Sum[18] ? 5'b01110 :
	//	Sum[17] ? 5'b01111 :
	//	Sum[16] ? 5'b10000 :
	//	Sum[15] ? 5'b10001 :
	//	Sum[14] ? 5'b10010 :
	//	Sum[13] ? 5'b10011 :
	//	Sum[12] ? 5'b10100 :
	//	Sum[11] ? 5'b10101 :
	//	Sum[10] ? 5'b10110 :
	//	Sum[9] ? 5'b10111 :
	//	Sum[8] ? 5'b11000 :
	//	Sum[7] ? 5'b11001 : 5'b11010
	);
	
	reg	  [`DWIDTH:0]		Lvl1;
	
	always @(*) begin
		// Rotate by 16?
		Lvl1 <= Shift[4] ? {Sum[8:0], 8'b00000000} : Sum; 
	end
	
	// Assign outputs
	assign Mmin = Lvl1;						// Take out smaller mantissa

endmodule
module FPAddSub_ExecutionModule(
		Mmax,
		Mmin,
		Sa,
		Sb,
		MaxAB,
		OpMode,
		Sum,
		PSgn,
		Opr
    );

	// Input ports
	input [`MANTISSA-1:0] Mmax ;					// The larger mantissa
	input [`MANTISSA:0] Mmin ;					// The smaller mantissa
	input Sa ;								// Sign bit of larger number
	input Sb ;								// Sign bit of smaller number
	input MaxAB ;							// Indicates the larger number (0/A, 1/B)
	input OpMode ;							// Operation to be performed (0/Add, 1/Sub)
	
	// Output ports
	output [`DWIDTH:0] Sum ;					// The result of the operation
	output PSgn ;							// The sign for the result
	output Opr ;							// The effective (performed) operation

	assign Opr = (OpMode^Sa^Sb); 		// Resolve sign to determine operation

	// Perform effective operation
	assign Sum = (OpMode^Sa^Sb) ? ({1'b1, Mmax, 5'b00000} - {Mmin, 5'b00000}) : ({1'b1, Mmax, 5'b00000} + {Mmin, 5'b00000}) ;
	
	// Assign result sign
	assign PSgn = (MaxAB ? Sb : Sa) ;

endmodule
module FPAddSub_AlignShift2(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`MANTISSA:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [1:0] Shift ;						// Shift amount
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	
	// Internal Signal
	reg	  [`MANTISSA:0]		Lvl3;
	wire    [2*`MANTISSA+1:0]    Stage2;	
	integer           j;               // Loop variable
	
	assign Stage2 = {11'b0, MminP};

	always @(*) begin    // Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  Lvl3 <= Stage2[`MANTISSA:0];   
			// Rotate by 1
			2'b01:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+1]; end /*Lvl3[`MANTISSA] <= 0; */end 
			// Rotate by 2
			2'b10:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+2]; end /*Lvl3[`MANTISSA:`MANTISSA-1] <= 0;*/ end 
			// Rotate by 3
			2'b11:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+3]; end /*Lvl3[`MANTISSA:`MANTISSA-2] <= 0;*/ end 	  
	  endcase
	end
	
	// Assign output
	assign Mmin = Lvl3;						// Take out smaller mantissa				

endmodule
module FPAddSub_AlignShift1(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`MANTISSA-1:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [2:0] Shift ;						// Shift amount
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	
	// Internal signals
	reg	  [`MANTISSA:0]		Lvl1;
	reg	  [`MANTISSA:0]		Lvl2;
	wire    [2*`MANTISSA+1:0]    Stage1;	
	integer           i;                // Loop variable
	
	always @(*) begin						
		// Rotate by 16?
		//Lvl1 <= Shift[2] ? {17'b00000000000000001, MminP[22:16]} : {1'b1, MminP}; 
		Lvl1 <= Shift[2] ? {11'b0000000000} : {1'b1, MminP}; 
		
	end
	
	assign Stage1 = { 11'b0, Lvl1};
	
	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[1:0])
			// Rotate by 0	
			2'b00:  Lvl2 <= Stage1[`MANTISSA:0];       			
			// Rotate by 4	
			2'b01:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+4]; end /*Lvl2[`MANTISSA:`MANTISSA-3] <= 0;*/ end
			// Rotate by 8
			2'b10:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+8]; end /*Lvl2[`MANTISSA:`MANTISSA-7] <= 0;*/ end
			// Rotate by 12	
			2'b11: Lvl2[`MANTISSA: 0] <= 0; 
			//2'b11:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+12]; end Lvl2[`MANTISSA:`MANTISSA-12] <= 0; end
	  endcase
	end
	
	// Assign output to next shift stage
	assign Mmin = Lvl2;
	
endmodule
module FPAddSub_AlignModule (
		A,
		B,
		ShiftDet,
		CExp,
		MaxAB,
		Shift,
		Mmin,
		Mmax
	);
	
	// Input ports
	input [`DWIDTH-2:0] A ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-2:0] B ;								// Input B, a 32-bit floating point number
	input [9:0] ShiftDet ;
	
	// Output ports
	output [`EXPONENT-1:0] CExp ;							// Common Exponent
	output MaxAB ;									// Incidates larger of A and B (0/A, 1/B)
	output [4:0] Shift ;							// Number of steps to smaller mantissa shift right
	output [`MANTISSA-1:0] Mmin ;							// Smaller mantissa 
	output [`MANTISSA-1:0] Mmax ;							// Larger mantissa
	
	// Internal signals
	//wire BOF ;										// Check for shifting overflow if B is larger
	//wire AOF ;										// Check for shifting overflow if A is larger
	
	assign MaxAB = (A[`DWIDTH-2:0] < B[`DWIDTH-2:0]) ;	
	//assign BOF = ShiftDet[9:5] < 25 ;		// Cannot shift more than 25 bits
	//assign AOF = ShiftDet[4:0] < 25 ;		// Cannot shift more than 25 bits
	
	// Determine final shift value
	//assign Shift = MaxAB ? (BOF ? ShiftDet[9:5] : 5'b11001) : (AOF ? ShiftDet[4:0] : 5'b11001) ;
	
	assign Shift = MaxAB ? ShiftDet[9:5] : ShiftDet[4:0] ;
	
	// Take out smaller mantissa and append shift space
	assign Mmin = MaxAB ? A[`MANTISSA-1:0] : B[`MANTISSA-1:0] ; 
	
	// Take out larger mantissa	
	assign Mmax = MaxAB ? B[`MANTISSA-1:0]: A[`MANTISSA-1:0] ;	
	
	// Common exponent
	assign CExp = (MaxAB ? B[`MANTISSA+`EXPONENT-1:`MANTISSA] : A[`MANTISSA+`EXPONENT-1:`MANTISSA]) ;		
	
endmodule
module FPAddSub_PrealignModule(
		A,
		B,
		operation,
		Sa,
		Sb,
		ShiftDet,
		InputExc,
		Aout,
		Bout,
		Opout
	);
	
	// Input ports
	input [`DWIDTH-1:0] A ;										// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] B ;										// Input B, a 32-bit floating point number
	input operation ;
	
	// Output ports
	output Sa ;												// A's sign
	output Sb ;												// B's sign
	output [9:0] ShiftDet ;
	output [4:0] InputExc ;								// Input numbers are exceptions
	output [`DWIDTH-2:0] Aout ;
	output [`DWIDTH-2:0] Bout ;
	output Opout ;
	
	// Internal signals									// If signal is high...
	wire ANaN ;												// A is a NaN (Not-a-Number)
	wire BNaN ;												// B is a NaN
	wire AInf ;												// A is infinity
	wire BInf ;												// B is infinity
	wire [`EXPONENT-1:0] DAB ;										// ExpA - ExpB					
	wire [`EXPONENT-1:0] DBA ;										// ExpB - ExpA	
	
	assign ANaN = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(A[`MANTISSA-1:0]) ;		// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(B[`MANTISSA-1:0]);		// All one exponent and not all zero mantissa - NaN
	assign AInf = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(A[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	assign BInf = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(B[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	
	// Put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	
	//assign DAB = (A[30:23] - B[30:23]) ;
	//assign DBA = (B[30:23] - A[30:23]) ;
	assign DAB = (A[`DWIDTH-2:`MANTISSA] + ~(B[`DWIDTH-2:`MANTISSA]) + 1) ;
	assign DBA = (B[`DWIDTH-2:`MANTISSA] + ~(A[`DWIDTH-2:`MANTISSA]) + 1) ;
	
	assign Sa = A[`DWIDTH-1] ;									// A's sign bit
	assign Sb = B[`DWIDTH-1] ;									// B's sign	bit
	assign ShiftDet = {DBA[4:0], DAB[4:0]} ;		// Shift data
	assign Opout = operation ;
	assign Aout = A[`DWIDTH-2:0] ;
	assign Bout = B[`DWIDTH-2:0] ;
	
endmodule

module td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1
#(parameter
    ID         = 31,
    NUM_STAGE  = 5,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 16
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  r_tvalid;
wire [15:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
td_fused_top_ap_hmul_3_max_dsp_16 td_fused_top_ap_hmul_3_max_dsp_16_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce_r;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1;
assign dout_i   = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
        din1_buf1 <= din1;
    end
end

always @ (posedge clk) begin
    ce_r <= ce;
end

always @ (posedge clk) begin
    if (ce_r) begin
        dout_r <= dout_i;
    end
end

assign dout = ce_r?dout_i:dout_r;
endmodule
module td_fused_top_ap_hmul_3_max_dsp_16 (
   input  wire        aclk,
   input  wire        aclken,
   input  wire        s_axis_a_tvalid,
   input  wire [15:0] s_axis_a_tdata,
   input  wire        s_axis_b_tvalid,
   input  wire [15:0] s_axis_b_tdata,
   output wire        m_axis_result_tvalid,
   output wire [15:0] m_axis_result_tdata
);

   reg [15:0] a_reg, b_reg, res, res_reg;

   always @(posedge aclk) begin
      if (aclken) begin
         a_reg <= s_axis_a_tdata;     
         b_reg <= s_axis_b_tdata;     
         res_reg <= res;
      end
   end

`ifdef complex_dsp
   multiply_fp u_mult_fp (
      .a(a_reg), 
      .b(b_reg), 
      .out(res)
   );
`else
FPMult_16 u_FPMult (.clk(), .rst(1'b0), .a(a_reg), .b(b_reg), .result(res), .flags());
`endif

   assign m_axis_result_tdata = res_reg;

endmodule
module FPMult_16(
		clk,
		rst,
		a,
		b,
		result,
		flags
    );
	
	// Input Ports
	input clk ;							// Clock
	input rst ;							// Reset signal
	input [`DWIDTH-1:0] a;					// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b;					// Input B, a 32-bit floating point number
	
	// Output ports
	output [`DWIDTH-1:0] result ;					// Product, result of the operation, 32-bit FP number
	output [4:0] flags ;				// Flags indicating exceptions according to IEEE754
	
	// Internal signals
	wire [31:0] Z_int ;				// Product, result of the operation, 32-bit FP number
	wire [4:0] Flags_int ;			// Flags indicating exceptions according to IEEE754
	
	wire Sa ;							// A's sign
	wire Sb ;							// B's sign
	wire Sp ;							// Product sign
	wire [`EXPONENT-1:0] Ea ;					// A's exponent
	wire [`EXPONENT-1:0] Eb ;					// B's exponent
	wire [2*`MANTISSA+1:0] Mp ;					// Product mantissa
	wire [4:0] InputExc ;			// Exceptions in inputs
	wire [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	wire [`EXPONENT:0] NormE ;				// Normalized exponent
	wire [`MANTISSA:0] RoundM ;				// Normalized mantissa
	wire [`EXPONENT:0] RoundE ;				// Normalized exponent
	wire [`MANTISSA:0] RoundMP ;				// Normalized mantissa
	wire [`EXPONENT:0] RoundEP ;				// Normalized exponent
	wire GRS ;

	//reg [63:0] pipe_0;			// Pipeline register Input->Prep
	reg [2*`DWIDTH-1:0] pipe_0;			// Pipeline register Input->Prep

	//reg [92:0] pipe_1;			// Pipeline register Prep->Execute
	reg [3*`MANTISSA+2*`EXPONENT+7:0] pipe_1;			// Pipeline register Prep->Execute

	//reg [38:0] pipe_2;			// Pipeline register Execute->Normalize
	reg [`MANTISSA+`EXPONENT+7:0] pipe_2;			// Pipeline register Execute->Normalize
	
	//reg [72:0] pipe_3;			// Pipeline register Normalize->Round
	reg [2*`MANTISSA+2*`EXPONENT+10:0] pipe_3;			// Pipeline register Normalize->Round

	//reg [36:0] pipe_4;			// Pipeline register Round->Output
	reg [`DWIDTH+4:0] pipe_4;			// Pipeline register Round->Output
	
	assign result = pipe_4[`DWIDTH+4:5] ;
	assign flags = pipe_4[4:0] ;
	
	// Prepare the operands for alignment and check for exceptions
	FPMult_PrepModule PrepModule(clk, rst, pipe_0[2*`DWIDTH-1:`DWIDTH], pipe_0[`DWIDTH-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]) ;

	// Perform (unsigned) mantissa multiplication
	FPMult_ExecuteModule ExecuteModule(pipe_1[3*`MANTISSA+`EXPONENT*2+7:2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7:2*`MANTISSA+7], pipe_1[2*`MANTISSA+6:5], pipe_1[2*`MANTISSA+2*`EXPONENT+6:2*`MANTISSA+`EXPONENT+7], pipe_1[2*`MANTISSA+`EXPONENT+6:2*`MANTISSA+7], pipe_1[2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7], Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0], GRS) ;

	// Round result and if necessary, perform a second (post-rounding) normalization step
	FPMult_NormalizeModule NormalizeModule(pipe_2[`MANTISSA-1:0], pipe_2[`MANTISSA+`EXPONENT:`MANTISSA], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]) ;		

	// Round result and if necessary, perform a second (post-rounding) normalization step
	//FPMult_RoundModule RoundModule(pipe_3[47:24], pipe_3[23:0], pipe_3[65:57], pipe_3[56:48], pipe_3[66], pipe_3[67], pipe_3[72:68], Z_int[31:0], Flags_int[4:0]) ;		
	FPMult_RoundModule RoundModule(pipe_3[2*`MANTISSA+1:`MANTISSA+1], pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+2*`EXPONENT+3:2*`MANTISSA+`EXPONENT+3], pipe_3[2*`MANTISSA+`EXPONENT+2:2*`MANTISSA+2], pipe_3[2*`MANTISSA+2*`EXPONENT+4], pipe_3[2*`MANTISSA+2*`EXPONENT+5], pipe_3[2*`MANTISSA+2*`EXPONENT+10:2*`MANTISSA+2*`EXPONENT+6], Z_int[`DWIDTH-1:0], Flags_int[4:0]) ;		

	always @ (*) begin	
		if(rst) begin
			pipe_0 = 0;
			pipe_1 = 0;
			pipe_2 = 0; 
			pipe_3 = 0;
			pipe_4 = 0;
		end 
		else begin		
			/* PIPE 0
				[63:32] A
				[31:0] B
			*/
      pipe_0 = {a, b} ;

			/* PIPE 1
				[70] Sa
				[69] Sb
				[68:61] Ea
				[60:53] Eb
				[52:5] Mp
				[4:0] InputExc
			*/
			//pipe_1 <= {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[`MANTISSA_MUL_SPLIT_LSB-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA-1:0], InputExc[4:0]} ;
			pipe_1 = {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[8:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]} ;
			/* PIPE 2
				[38:34] InputExc
				[33] GRS
				[32] Sp
				[31:23] NormE
				[22:0] NormM
			*/
			pipe_2 = {pipe_1[4:0], GRS, Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0]} ;
			/* PIPE 3
				[72:68] InputExc
				[67] GRS
				[66] Sp	
				[65:57] RoundE
				[56:48] RoundEP
				[47:24] RoundM
				[23:0] RoundMP
			*/
			pipe_3 = {pipe_2[`EXPONENT+`MANTISSA+7:`EXPONENT+`MANTISSA+1], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]} ;
			/* PIPE 4
				[36:5] Z
				[4:0] Flags
			*/				
			pipe_4 = {Z_int[`DWIDTH-1:0], Flags_int[4:0]} ;
		end
	end
		
endmodule
module FPMult_RoundModule(
		RoundM,
		RoundMP,
		RoundE,
		RoundEP,
		Sp,
		GRS,
		InputExc,
		Z,
		Flags
    );

	// Input Ports
	input [`MANTISSA:0] RoundM ;									// Normalized mantissa
	input [`MANTISSA:0] RoundMP ;									// Normalized exponent
	input [`EXPONENT:0] RoundE ;									// Normalized mantissa + 1
	input [`EXPONENT:0] RoundEP ;									// Normalized exponent + 1
	input Sp ;												// Product sign
	input GRS ;
	input [4:0] InputExc ;
	
	// Output Ports
	output [`DWIDTH-1:0] Z ;										// Final product
	output [4:0] Flags ;
	
	// Internal Signals
	wire [`EXPONENT:0] FinalE ;									// Rounded exponent
	wire [`MANTISSA:0] FinalM;
	wire [`MANTISSA:0] PreShiftM;
	
	assign PreShiftM = GRS ? RoundMP : RoundM ;	// Round up if R and (G or S)
	
	// Post rounding normalization (potential one bit shift> use shifted mantissa if there is overflow)
	assign FinalM = (PreShiftM[`MANTISSA] ? {1'b0, PreShiftM[`MANTISSA:1]} : PreShiftM[`MANTISSA:0]) ;
	
	assign FinalE = (PreShiftM[`MANTISSA] ? RoundEP : RoundE) ; // Increment exponent if a shift was done
	
	assign Z = {Sp, FinalE[`EXPONENT-1:0], FinalM[`MANTISSA-1:0]} ;   // Putting the pieces together
	assign Flags = InputExc[4:0];

endmodule
module FPMult_NormalizeModule(
		NormM,
		NormE,
		RoundE,
		RoundEP,
		RoundM,
		RoundMP
    );

	// Input Ports
	input [`MANTISSA-1:0] NormM ;									// Normalized mantissa
	input [`EXPONENT:0] NormE ;									// Normalized exponent

	// Output Ports
	output [`EXPONENT:0] RoundE ;
	output [`EXPONENT:0] RoundEP ;
	output [`MANTISSA:0] RoundM ;
	output [`MANTISSA:0] RoundMP ; 
	
	assign RoundE = NormE - 15 ;
	assign RoundEP = NormE - 14 ;
	assign RoundM = NormM ;
	assign RoundMP = NormM ;

endmodule
module FPMult_ExecuteModule(
		a,
		b,
		MpC,
		Ea,
		Eb,
		Sa,
		Sb,
		Sp,
		NormE,
		NormM,
		GRS
    );

	// Input ports
	input [`MANTISSA-1:0] a ;
	input [2*`EXPONENT:0] b ;
	input [2*`MANTISSA+1:0] MpC ;
	input [`EXPONENT-1:0] Ea ;						// A's exponent
	input [`EXPONENT-1:0] Eb ;						// B's exponent
	input Sa ;								// A's sign
	input Sb ;								// B's sign
	
	// Output ports
	output Sp ;								// Product sign
	output [`EXPONENT:0] NormE ;													// Normalized exponent
	output [`MANTISSA-1:0] NormM ;												// Normalized mantissa
	output GRS ;
	
	wire [2*`MANTISSA+1:0] Mp ;
	
	assign Sp = (Sa ^ Sb) ;												// Equal signs give a positive product
	
   // wire [`ACTUAL_MANTISSA-1:0] inp_a;
   // wire [`ACTUAL_MANTISSA-1:0] inp_b;
   // assign inp_a = {1'b1, a};
   // assign inp_b = {{(`MANTISSA-`MANTISSA_MUL_SPLIT_LSB){1'b0}}, 1'b0, b};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_a), .B(inp_b), .TC(1'b0), .PRODUCT(Mp_temp));
   // DW01_add #(2*`ACTUAL_MANTISSA) u_add(.A(Mp_temp), .B(MpC<<`MANTISSA_MUL_SPLIT_LSB), .CI(1'b0), .SUM(Mp), .CO());

	//assign Mp = (MpC<<(2*`EXPONENT+1)) + ({4'b0001, a[`MANTISSA-1:0]}*{1'b0, b[2*`EXPONENT:0]}) ;
	assign Mp = MpC;


	assign NormM = (Mp[2*`MANTISSA+1] ? Mp[2*`MANTISSA:`MANTISSA+1] : Mp[2*`MANTISSA-1:`MANTISSA]); 	// Check for overflow
	assign NormE = (Ea + Eb + Mp[2*`MANTISSA+1]);								// If so, increment exponent
	
	assign GRS = ((Mp[`MANTISSA]&(Mp[`MANTISSA+1]))|(|Mp[`MANTISSA-1:0])) ;
	
endmodule
module FPMult_PrepModule (
		clk,
		rst,
		a,
		b,
		Sa,
		Sb,
		Ea,
		Eb,
		Mp,
		InputExc
	);
	
	// Input ports
	input clk ;
	input rst ;
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	
	// Output ports
	output Sa ;										// A's sign
	output Sb ;										// B's sign
	output [`EXPONENT-1:0] Ea ;								// A's exponent
	output [`EXPONENT-1:0] Eb ;								// B's exponent
	output [2*`MANTISSA+1:0] Mp ;							// Mantissa product
	output [4:0] InputExc ;						// Input numbers are exceptions
	
	// Internal signals							// If signal is high...
	wire ANaN ;										// A is a signalling NaN
	wire BNaN ;										// B is a signalling NaN
	wire AInf ;										// A is infinity
	wire BInf ;										// B is infinity
    wire [`MANTISSA-1:0] Ma;
    wire [`MANTISSA-1:0] Mb;
	
	assign ANaN = &(a[`DWIDTH-2:`MANTISSA]) &  |(a[`DWIDTH-2:`MANTISSA]) ;			// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(b[`DWIDTH-2:`MANTISSA]) &  |(b[`MANTISSA-1:0]);			// All one exponent and not all zero mantissa - NaN
	assign AInf = &(a[`DWIDTH-2:`MANTISSA]) & ~|(a[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	assign BInf = &(b[`DWIDTH-2:`MANTISSA]) & ~|(b[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	
	// Check for any exceptions and put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	//assign InputExc = {(ANaN | ANaN | BNaN |BNaN), ANaN, ANaN, BNaN,BNaN} ;
	
	// Take input numbers apart
	assign Sa = a[`DWIDTH-1] ;							// A's sign
	assign Sb = b[`DWIDTH-1] ;							// B's sign
	assign Ea = a[`DWIDTH-2:`MANTISSA];						// Store A's exponent in Ea, unless A is an exception
	assign Eb = b[`DWIDTH-2:`MANTISSA];						// Store B's exponent in Eb, unless B is an exception	
//    assign Ma = a[`MANTISSA_MSB:`MANTISSA_LSB];
  //  assign Mb = b[`MANTISSA_MSB:`MANTISSA_LSB];
	


	//assign Mp = ({4'b0001, a[`MANTISSA-1:0]}*{4'b0001, b[`MANTISSA-1:9]}) ;
	assign Mp = ({1'b1,a[`MANTISSA-1:0]}*{1'b1, b[`MANTISSA-1:0]}) ;

	
    //We multiply part of the mantissa here
    //Full mantissa of A
    //Bits MANTISSA_MUL_SPLIT_MSB:MANTISSA_MUL_SPLIT_LSB of B
   // wire [`ACTUAL_MANTISSA-1:0] inp_A;
   // wire [`ACTUAL_MANTISSA-1:0] inp_B;
   // assign inp_A = {1'b1, Ma};
   // assign inp_B = {{(`MANTISSA-(`MANTISSA_MUL_SPLIT_MSB-`MANTISSA_MUL_SPLIT_LSB+1)){1'b0}}, 1'b1, Mb[`MANTISSA_MUL_SPLIT_MSB:`MANTISSA_MUL_SPLIT_LSB]};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_A), .B(inp_B), .TC(1'b0), .PRODUCT(Mp));
endmodule

module td_fused_top_hsub_16ns_16ns_16_7_full_dsp_1
#(parameter
    ID         = 113,
    NUM_STAGE  = 7,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 16
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  r_tvalid;
wire [15:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
// Just use hadd instead
//td_fused_top_ap_hsub_5_full_dsp_16 td_fused_top_ap_hsub_5_full_dsp_16_u (
td_fused_top_ap_hadd_6_full_dsp_16 td_fused_top_ap_hadd_6_full_dsp_16_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce_r;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1;
assign dout_i   = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
        din1_buf1 <= din1;
    end
end

always @ (posedge clk) begin
    ce_r <= ce;
end

always @ (posedge clk) begin
    if (ce_r) begin
        dout_r <= dout_i;
    end
end

assign dout = ce_r?dout_i:dout_r;
endmodule


















