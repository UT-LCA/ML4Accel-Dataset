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

module td_fused_top_tdf4_111 (
        in_data_address0,
        in_data_ce0,
        in_data_d0,
        in_data_q0,
        in_data_we0,
        in_data_address1,
        in_data_ce1,
        in_data_d1,
        in_data_q1,
        in_data_we1,
        out_data_address0,
        out_data_ce0,
        out_data_d0,
        out_data_q0,
        out_data_we0,
        out_data_address1,
        out_data_ce1,
        out_data_d1,
        out_data_q1,
        out_data_we1,
        l1_filter_data_0_address0,
        l1_filter_data_0_ce0,
        l1_filter_data_0_d0,
        l1_filter_data_0_q0,
        l1_filter_data_0_we0,
        l1_filter_data_0_address1,
        l1_filter_data_0_ce1,
        l1_filter_data_0_d1,
        l1_filter_data_0_q1,
        l1_filter_data_0_we1,
        l1_filter_data_1_address0,
        l1_filter_data_1_ce0,
        l1_filter_data_1_d0,
        l1_filter_data_1_q0,
        l1_filter_data_1_we0,
        l1_filter_data_1_address1,
        l1_filter_data_1_ce1,
        l1_filter_data_1_d1,
        l1_filter_data_1_q1,
        l1_filter_data_1_we1,
        l1_filter_data_2_address0,
        l1_filter_data_2_ce0,
        l1_filter_data_2_d0,
        l1_filter_data_2_q0,
        l1_filter_data_2_we0,
        l1_filter_data_2_address1,
        l1_filter_data_2_ce1,
        l1_filter_data_2_d1,
        l1_filter_data_2_q1,
        l1_filter_data_2_we1,
        l1_filter_data_3_address0,
        l1_filter_data_3_ce0,
        l1_filter_data_3_d0,
        l1_filter_data_3_q0,
        l1_filter_data_3_we0,
        l1_filter_data_3_address1,
        l1_filter_data_3_ce1,
        l1_filter_data_3_d1,
        l1_filter_data_3_q1,
        l1_filter_data_3_we1,
        l2_filter_data_0_address0,
        l2_filter_data_0_ce0,
        l2_filter_data_0_d0,
        l2_filter_data_0_q0,
        l2_filter_data_0_we0,
        l2_filter_data_0_address1,
        l2_filter_data_0_ce1,
        l2_filter_data_0_d1,
        l2_filter_data_0_q1,
        l2_filter_data_0_we1,
        l2_filter_data_1_address0,
        l2_filter_data_1_ce0,
        l2_filter_data_1_d0,
        l2_filter_data_1_q0,
        l2_filter_data_1_we0,
        l2_filter_data_1_address1,
        l2_filter_data_1_ce1,
        l2_filter_data_1_d1,
        l2_filter_data_1_q1,
        l2_filter_data_1_we1,
        l1_adjustments_address0,
        l1_adjustments_ce0,
        l1_adjustments_d0,
        l1_adjustments_q0,
        l1_adjustments_we0,
        l1_adjustments_address1,
        l1_adjustments_ce1,
        l1_adjustments_d1,
        l1_adjustments_q1,
        l1_adjustments_we1,
        l2_adjustments_address0,
        l2_adjustments_ce0,
        l2_adjustments_d0,
        l2_adjustments_q0,
        l2_adjustments_we0,
        l2_adjustments_address1,
        l2_adjustments_ce1,
        l2_adjustments_d1,
        l2_adjustments_q1,
        l2_adjustments_we1,
        ap_clk,
        ap_rst,
        in_data_empty_n,
        in_data_read,
        out_data_full_n,
        out_data_write,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


output  [13:0] in_data_address0;
output   in_data_ce0;
output  [63:0] in_data_d0;
input  [63:0] in_data_q0;
output   in_data_we0;
output  [13:0] in_data_address1;
output   in_data_ce1;
output  [63:0] in_data_d1;
input  [63:0] in_data_q1;
output   in_data_we1;
output  [13:0] out_data_address0;
output   out_data_ce0;
output  [63:0] out_data_d0;
input  [63:0] out_data_q0;
output   out_data_we0;
output  [13:0] out_data_address1;
output   out_data_ce1;
output  [63:0] out_data_d1;
input  [63:0] out_data_q1;
output   out_data_we1;
output  [10:0] l1_filter_data_0_address0;
output   l1_filter_data_0_ce0;
output  [63:0] l1_filter_data_0_d0;
input  [63:0] l1_filter_data_0_q0;
output   l1_filter_data_0_we0;
output  [10:0] l1_filter_data_0_address1;
output   l1_filter_data_0_ce1;
output  [63:0] l1_filter_data_0_d1;
input  [63:0] l1_filter_data_0_q1;
output   l1_filter_data_0_we1;
output  [10:0] l1_filter_data_1_address0;
output   l1_filter_data_1_ce0;
output  [63:0] l1_filter_data_1_d0;
input  [63:0] l1_filter_data_1_q0;
output   l1_filter_data_1_we0;
output  [10:0] l1_filter_data_1_address1;
output   l1_filter_data_1_ce1;
output  [63:0] l1_filter_data_1_d1;
input  [63:0] l1_filter_data_1_q1;
output   l1_filter_data_1_we1;
output  [10:0] l1_filter_data_2_address0;
output   l1_filter_data_2_ce0;
output  [63:0] l1_filter_data_2_d0;
input  [63:0] l1_filter_data_2_q0;
output   l1_filter_data_2_we0;
output  [10:0] l1_filter_data_2_address1;
output   l1_filter_data_2_ce1;
output  [63:0] l1_filter_data_2_d1;
input  [63:0] l1_filter_data_2_q1;
output   l1_filter_data_2_we1;
output  [10:0] l1_filter_data_3_address0;
output   l1_filter_data_3_ce0;
output  [63:0] l1_filter_data_3_d0;
input  [63:0] l1_filter_data_3_q0;
output   l1_filter_data_3_we0;
output  [10:0] l1_filter_data_3_address1;
output   l1_filter_data_3_ce1;
output  [63:0] l1_filter_data_3_d1;
input  [63:0] l1_filter_data_3_q1;
output   l1_filter_data_3_we1;
output  [9:0] l2_filter_data_0_address0;
output   l2_filter_data_0_ce0;
output  [15:0] l2_filter_data_0_d0;
input  [15:0] l2_filter_data_0_q0;
output   l2_filter_data_0_we0;
output  [9:0] l2_filter_data_0_address1;
output   l2_filter_data_0_ce1;
output  [15:0] l2_filter_data_0_d1;
input  [15:0] l2_filter_data_0_q1;
output   l2_filter_data_0_we1;
output  [9:0] l2_filter_data_1_address0;
output   l2_filter_data_1_ce0;
output  [15:0] l2_filter_data_1_d0;
input  [15:0] l2_filter_data_1_q0;
output   l2_filter_data_1_we0;
output  [9:0] l2_filter_data_1_address1;
output   l2_filter_data_1_ce1;
output  [15:0] l2_filter_data_1_d1;
input  [15:0] l2_filter_data_1_q1;
output   l2_filter_data_1_we1;
output  [6:0] l1_adjustments_address0;
output   l1_adjustments_ce0;
output  [47:0] l1_adjustments_d0;
input  [47:0] l1_adjustments_q0;
output   l1_adjustments_we0;
output  [6:0] l1_adjustments_address1;
output   l1_adjustments_ce1;
output  [47:0] l1_adjustments_d1;
input  [47:0] l1_adjustments_q1;
output   l1_adjustments_we1;
output  [3:0] l2_adjustments_address0;
output   l2_adjustments_ce0;
output  [47:0] l2_adjustments_d0;
input  [47:0] l2_adjustments_q0;
output   l2_adjustments_we0;
output  [3:0] l2_adjustments_address1;
output   l2_adjustments_ce1;
output  [47:0] l2_adjustments_d1;
input  [47:0] l2_adjustments_q1;
output   l2_adjustments_we1;
input   ap_clk;
input   ap_rst;
input   in_data_empty_n;
output   in_data_read;
input   out_data_full_n;
output   out_data_write;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

reg ap_done;
reg ap_ready;
reg ap_idle;

wire   [13:0] dataflow_in_loop_TOP_LOOP48232_U0_in_data_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_in_data_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_we0;
wire   [13:0] dataflow_in_loop_TOP_LOOP48232_U0_in_data_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_in_data_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_we1;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_we0;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_we1;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_we0;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_we1;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_we0;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_we1;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_we0;
wire   [10:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_we1;
wire   [6:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_ce0;
wire   [47:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_we0;
wire   [6:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_ce1;
wire   [47:0] dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_we1;
wire   [9:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce0;
wire   [15:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_we0;
wire   [9:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce1;
wire   [15:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_we1;
wire   [9:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce0;
wire   [15:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_we0;
wire   [9:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce1;
wire   [15:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_we1;
wire   [13:0] dataflow_in_loop_TOP_LOOP48232_U0_out_data_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_out_data_ce0;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_out_data_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_out_data_we0;
wire   [13:0] dataflow_in_loop_TOP_LOOP48232_U0_out_data_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_out_data_ce1;
wire   [63:0] dataflow_in_loop_TOP_LOOP48232_U0_out_data_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_out_data_we1;
wire   [3:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_address0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_ce0;
wire   [47:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_d0;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_we0;
wire   [3:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_address1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_ce1;
wire   [47:0] dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_d1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_we1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_ap_start;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_read;
wire    dataflow_in_loop_TOP_LOOP48232_U0_out_data_write;
wire    dataflow_in_loop_TOP_LOOP48232_U0_ap_done;
wire    dataflow_in_loop_TOP_LOOP48232_U0_ap_ready;
wire    dataflow_in_loop_TOP_LOOP48232_U0_ap_idle;
reg    dataflow_in_loop_TOP_LOOP48232_U0_ap_continue;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_full_n;
wire    dataflow_in_loop_TOP_LOOP48232_U0_in_data_write;
wire    ap_sync_continue;
wire    ap_sync_done;
wire    ap_sync_ready;
reg   [16:0] loop_dataflow_input_count;
reg   [16:0] loop_dataflow_output_count;
wire   [16:0] bound_minus_1;
wire    dataflow_in_loop_TOP_LOOP48232_U0_start_full_n;
wire    dataflow_in_loop_TOP_LOOP48232_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 loop_dataflow_input_count = 17'd0;
#0 loop_dataflow_output_count = 17'd0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP48232 dataflow_in_loop_TOP_LOOP48232_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .in_data_address0(dataflow_in_loop_TOP_LOOP48232_U0_in_data_address0),
    .in_data_ce0(dataflow_in_loop_TOP_LOOP48232_U0_in_data_ce0),
    .in_data_d0(dataflow_in_loop_TOP_LOOP48232_U0_in_data_d0),
    .in_data_q0(in_data_q0),
    .in_data_we0(dataflow_in_loop_TOP_LOOP48232_U0_in_data_we0),
    .in_data_address1(dataflow_in_loop_TOP_LOOP48232_U0_in_data_address1),
    .in_data_ce1(dataflow_in_loop_TOP_LOOP48232_U0_in_data_ce1),
    .in_data_d1(dataflow_in_loop_TOP_LOOP48232_U0_in_data_d1),
    .in_data_q1(64'd0),
    .in_data_we1(dataflow_in_loop_TOP_LOOP48232_U0_in_data_we1),
    .l1_filter_data_0_address0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_address0),
    .l1_filter_data_0_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_ce0),
    .l1_filter_data_0_d0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_d0),
    .l1_filter_data_0_q0(l1_filter_data_0_q0),
    .l1_filter_data_0_we0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_we0),
    .l1_filter_data_0_address1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_address1),
    .l1_filter_data_0_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_ce1),
    .l1_filter_data_0_d1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_d1),
    .l1_filter_data_0_q1(64'd0),
    .l1_filter_data_0_we1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_we1),
    .l1_filter_data_1_address0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_address0),
    .l1_filter_data_1_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_ce0),
    .l1_filter_data_1_d0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_d0),
    .l1_filter_data_1_q0(l1_filter_data_1_q0),
    .l1_filter_data_1_we0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_we0),
    .l1_filter_data_1_address1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_address1),
    .l1_filter_data_1_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_ce1),
    .l1_filter_data_1_d1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_d1),
    .l1_filter_data_1_q1(64'd0),
    .l1_filter_data_1_we1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_we1),
    .l1_filter_data_2_address0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_address0),
    .l1_filter_data_2_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_ce0),
    .l1_filter_data_2_d0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_d0),
    .l1_filter_data_2_q0(l1_filter_data_2_q0),
    .l1_filter_data_2_we0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_we0),
    .l1_filter_data_2_address1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_address1),
    .l1_filter_data_2_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_ce1),
    .l1_filter_data_2_d1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_d1),
    .l1_filter_data_2_q1(64'd0),
    .l1_filter_data_2_we1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_we1),
    .l1_filter_data_3_address0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_address0),
    .l1_filter_data_3_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_ce0),
    .l1_filter_data_3_d0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_d0),
    .l1_filter_data_3_q0(l1_filter_data_3_q0),
    .l1_filter_data_3_we0(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_we0),
    .l1_filter_data_3_address1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_address1),
    .l1_filter_data_3_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_ce1),
    .l1_filter_data_3_d1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_d1),
    .l1_filter_data_3_q1(64'd0),
    .l1_filter_data_3_we1(dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_we1),
    .l1_adjustments_address0(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_address0),
    .l1_adjustments_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_ce0),
    .l1_adjustments_d0(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_d0),
    .l1_adjustments_q0(l1_adjustments_q0),
    .l1_adjustments_we0(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_we0),
    .l1_adjustments_address1(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_address1),
    .l1_adjustments_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_ce1),
    .l1_adjustments_d1(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_d1),
    .l1_adjustments_q1(48'd0),
    .l1_adjustments_we1(dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_we1),
    .l2_filter_data_0_address0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address0),
    .l2_filter_data_0_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce0),
    .l2_filter_data_0_d0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_d0),
    .l2_filter_data_0_q0(l2_filter_data_0_q0),
    .l2_filter_data_0_we0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_we0),
    .l2_filter_data_0_address1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address1),
    .l2_filter_data_0_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce1),
    .l2_filter_data_0_d1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_d1),
    .l2_filter_data_0_q1(l2_filter_data_0_q1),
    .l2_filter_data_0_we1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_we1),
    .l2_filter_data_1_address0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address0),
    .l2_filter_data_1_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce0),
    .l2_filter_data_1_d0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_d0),
    .l2_filter_data_1_q0(l2_filter_data_1_q0),
    .l2_filter_data_1_we0(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_we0),
    .l2_filter_data_1_address1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address1),
    .l2_filter_data_1_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce1),
    .l2_filter_data_1_d1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_d1),
    .l2_filter_data_1_q1(l2_filter_data_1_q1),
    .l2_filter_data_1_we1(dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_we1),
    .out_data_address0(dataflow_in_loop_TOP_LOOP48232_U0_out_data_address0),
    .out_data_ce0(dataflow_in_loop_TOP_LOOP48232_U0_out_data_ce0),
    .out_data_d0(dataflow_in_loop_TOP_LOOP48232_U0_out_data_d0),
    .out_data_q0(64'd0),
    .out_data_we0(dataflow_in_loop_TOP_LOOP48232_U0_out_data_we0),
    .out_data_address1(dataflow_in_loop_TOP_LOOP48232_U0_out_data_address1),
    .out_data_ce1(dataflow_in_loop_TOP_LOOP48232_U0_out_data_ce1),
    .out_data_d1(dataflow_in_loop_TOP_LOOP48232_U0_out_data_d1),
    .out_data_q1(64'd0),
    .out_data_we1(dataflow_in_loop_TOP_LOOP48232_U0_out_data_we1),
    .l2_adjustments_address0(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_address0),
    .l2_adjustments_ce0(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_ce0),
    .l2_adjustments_d0(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_d0),
    .l2_adjustments_q0(l2_adjustments_q0),
    .l2_adjustments_we0(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_we0),
    .l2_adjustments_address1(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_address1),
    .l2_adjustments_ce1(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_ce1),
    .l2_adjustments_d1(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_d1),
    .l2_adjustments_q1(48'd0),
    .l2_adjustments_we1(dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_we1),
    .ap_start(dataflow_in_loop_TOP_LOOP48232_U0_ap_start),
    .in_data_empty_n(1'b0),
    .in_data_read(dataflow_in_loop_TOP_LOOP48232_U0_in_data_read),
    .out_data_full_n(out_data_full_n),
    .out_data_write(dataflow_in_loop_TOP_LOOP48232_U0_out_data_write),
    .ap_done(dataflow_in_loop_TOP_LOOP48232_U0_ap_done),
    .ap_ready(dataflow_in_loop_TOP_LOOP48232_U0_ap_ready),
    .ap_idle(dataflow_in_loop_TOP_LOOP48232_U0_ap_idle),
    .ap_continue(dataflow_in_loop_TOP_LOOP48232_U0_ap_continue)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_input_count <= 17'd0;
    end else begin
        if ((~(loop_dataflow_input_count == bound_minus_1) & (ap_start == 1'b1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_ready == 1'b1))) begin
            loop_dataflow_input_count <= (loop_dataflow_input_count + 17'd1);
        end else if (((loop_dataflow_input_count == bound_minus_1) & (ap_start == 1'b1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_ready == 1'b1))) begin
            loop_dataflow_input_count <= 17'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        loop_dataflow_output_count <= 17'd0;
    end else begin
        if ((~(loop_dataflow_output_count == bound_minus_1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_continue == 1'b1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_done == 1'b1))) begin
            loop_dataflow_output_count <= (loop_dataflow_output_count + 17'd1);
        end else if (((loop_dataflow_output_count == bound_minus_1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_continue == 1'b1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_done == 1'b1))) begin
            loop_dataflow_output_count <= 17'd0;
        end
    end
end

always @ (*) begin
    if (((loop_dataflow_output_count == bound_minus_1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_done == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((loop_dataflow_output_count == 17'd0) & (ap_start == 1'b0) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_idle == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((loop_dataflow_input_count == bound_minus_1) & (ap_start == 1'b1) & (dataflow_in_loop_TOP_LOOP48232_U0_ap_ready == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~(loop_dataflow_output_count == bound_minus_1) | (ap_continue == 1'b1))) begin
        dataflow_in_loop_TOP_LOOP48232_U0_ap_continue = 1'b1;
    end else begin
        dataflow_in_loop_TOP_LOOP48232_U0_ap_continue = 1'b0;
    end
end

assign ap_sync_continue = ap_continue;

assign ap_sync_done = dataflow_in_loop_TOP_LOOP48232_U0_ap_done;

assign ap_sync_ready = dataflow_in_loop_TOP_LOOP48232_U0_ap_ready;

assign bound_minus_1 = (17'd100352 - 17'd1);

assign dataflow_in_loop_TOP_LOOP48232_U0_ap_start = ap_start;

assign dataflow_in_loop_TOP_LOOP48232_U0_in_data_full_n = in_data_empty_n;

assign dataflow_in_loop_TOP_LOOP48232_U0_in_data_write = 1'b0;

assign dataflow_in_loop_TOP_LOOP48232_U0_start_full_n = 1'b1;

assign dataflow_in_loop_TOP_LOOP48232_U0_start_write = 1'b0;

assign in_data_address0 = dataflow_in_loop_TOP_LOOP48232_U0_in_data_address0;

assign in_data_address1 = 14'd0;

assign in_data_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = dataflow_in_loop_TOP_LOOP48232_U0_in_data_write;

assign in_data_we0 = 1'b0;

assign in_data_we1 = 1'b0;

assign l1_adjustments_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_address0;

assign l1_adjustments_address1 = 7'd0;

assign l1_adjustments_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_adjustments_ce0;

assign l1_adjustments_ce1 = 1'b0;

assign l1_adjustments_d0 = 48'd0;

assign l1_adjustments_d1 = 48'd0;

assign l1_adjustments_we0 = 1'b0;

assign l1_adjustments_we1 = 1'b0;

assign l1_filter_data_0_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_address0;

assign l1_filter_data_0_address1 = 11'd0;

assign l1_filter_data_0_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_0_ce0;

assign l1_filter_data_0_ce1 = 1'b0;

assign l1_filter_data_0_d0 = 64'd0;

assign l1_filter_data_0_d1 = 64'd0;

assign l1_filter_data_0_we0 = 1'b0;

assign l1_filter_data_0_we1 = 1'b0;

assign l1_filter_data_1_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_address0;

assign l1_filter_data_1_address1 = 11'd0;

assign l1_filter_data_1_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_1_ce0;

assign l1_filter_data_1_ce1 = 1'b0;

assign l1_filter_data_1_d0 = 64'd0;

assign l1_filter_data_1_d1 = 64'd0;

assign l1_filter_data_1_we0 = 1'b0;

assign l1_filter_data_1_we1 = 1'b0;

assign l1_filter_data_2_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_address0;

assign l1_filter_data_2_address1 = 11'd0;

assign l1_filter_data_2_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_2_ce0;

assign l1_filter_data_2_ce1 = 1'b0;

assign l1_filter_data_2_d0 = 64'd0;

assign l1_filter_data_2_d1 = 64'd0;

assign l1_filter_data_2_we0 = 1'b0;

assign l1_filter_data_2_we1 = 1'b0;

assign l1_filter_data_3_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_address0;

assign l1_filter_data_3_address1 = 11'd0;

assign l1_filter_data_3_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l1_filter_data_3_ce0;

assign l1_filter_data_3_ce1 = 1'b0;

assign l1_filter_data_3_d0 = 64'd0;

assign l1_filter_data_3_d1 = 64'd0;

assign l1_filter_data_3_we0 = 1'b0;

assign l1_filter_data_3_we1 = 1'b0;

assign l2_adjustments_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_address0;

assign l2_adjustments_address1 = 4'd0;

assign l2_adjustments_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_adjustments_ce0;

assign l2_adjustments_ce1 = 1'b0;

assign l2_adjustments_d0 = 48'd0;

assign l2_adjustments_d1 = 48'd0;

assign l2_adjustments_we0 = 1'b0;

assign l2_adjustments_we1 = 1'b0;

assign l2_filter_data_0_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address0;

assign l2_filter_data_0_address1 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_address1;

assign l2_filter_data_0_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce0;

assign l2_filter_data_0_ce1 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_0_ce1;

assign l2_filter_data_0_d0 = 16'd0;

assign l2_filter_data_0_d1 = 16'd0;

assign l2_filter_data_0_we0 = 1'b0;

assign l2_filter_data_0_we1 = 1'b0;

assign l2_filter_data_1_address0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address0;

assign l2_filter_data_1_address1 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_address1;

assign l2_filter_data_1_ce0 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce0;

assign l2_filter_data_1_ce1 = dataflow_in_loop_TOP_LOOP48232_U0_l2_filter_data_1_ce1;

assign l2_filter_data_1_d0 = 16'd0;

assign l2_filter_data_1_d1 = 16'd0;

assign l2_filter_data_1_we0 = 1'b0;

assign l2_filter_data_1_we1 = 1'b0;

assign out_data_address0 = 14'd0;

assign out_data_address1 = dataflow_in_loop_TOP_LOOP48232_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = dataflow_in_loop_TOP_LOOP48232_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = dataflow_in_loop_TOP_LOOP48232_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = dataflow_in_loop_TOP_LOOP48232_U0_out_data_we1;

assign out_data_write = dataflow_in_loop_TOP_LOOP48232_U0_out_data_write;

endmodule //td_fused_top_tdf4_111
module td_fused_top_dataflow_in_loop_TOP_LOOP48232 (
        ap_clk,
        ap_rst,
        in_data_address0,
        in_data_ce0,
        in_data_d0,
        in_data_q0,
        in_data_we0,
        in_data_address1,
        in_data_ce1,
        in_data_d1,
        in_data_q1,
        in_data_we1,
        l1_filter_data_0_address0,
        l1_filter_data_0_ce0,
        l1_filter_data_0_d0,
        l1_filter_data_0_q0,
        l1_filter_data_0_we0,
        l1_filter_data_0_address1,
        l1_filter_data_0_ce1,
        l1_filter_data_0_d1,
        l1_filter_data_0_q1,
        l1_filter_data_0_we1,
        l1_filter_data_1_address0,
        l1_filter_data_1_ce0,
        l1_filter_data_1_d0,
        l1_filter_data_1_q0,
        l1_filter_data_1_we0,
        l1_filter_data_1_address1,
        l1_filter_data_1_ce1,
        l1_filter_data_1_d1,
        l1_filter_data_1_q1,
        l1_filter_data_1_we1,
        l1_filter_data_2_address0,
        l1_filter_data_2_ce0,
        l1_filter_data_2_d0,
        l1_filter_data_2_q0,
        l1_filter_data_2_we0,
        l1_filter_data_2_address1,
        l1_filter_data_2_ce1,
        l1_filter_data_2_d1,
        l1_filter_data_2_q1,
        l1_filter_data_2_we1,
        l1_filter_data_3_address0,
        l1_filter_data_3_ce0,
        l1_filter_data_3_d0,
        l1_filter_data_3_q0,
        l1_filter_data_3_we0,
        l1_filter_data_3_address1,
        l1_filter_data_3_ce1,
        l1_filter_data_3_d1,
        l1_filter_data_3_q1,
        l1_filter_data_3_we1,
        l1_adjustments_address0,
        l1_adjustments_ce0,
        l1_adjustments_d0,
        l1_adjustments_q0,
        l1_adjustments_we0,
        l1_adjustments_address1,
        l1_adjustments_ce1,
        l1_adjustments_d1,
        l1_adjustments_q1,
        l1_adjustments_we1,
        l2_filter_data_0_address0,
        l2_filter_data_0_ce0,
        l2_filter_data_0_d0,
        l2_filter_data_0_q0,
        l2_filter_data_0_we0,
        l2_filter_data_0_address1,
        l2_filter_data_0_ce1,
        l2_filter_data_0_d1,
        l2_filter_data_0_q1,
        l2_filter_data_0_we1,
        l2_filter_data_1_address0,
        l2_filter_data_1_ce0,
        l2_filter_data_1_d0,
        l2_filter_data_1_q0,
        l2_filter_data_1_we0,
        l2_filter_data_1_address1,
        l2_filter_data_1_ce1,
        l2_filter_data_1_d1,
        l2_filter_data_1_q1,
        l2_filter_data_1_we1,
        out_data_address0,
        out_data_ce0,
        out_data_d0,
        out_data_q0,
        out_data_we0,
        out_data_address1,
        out_data_ce1,
        out_data_d1,
        out_data_q1,
        out_data_we1,
        l2_adjustments_address0,
        l2_adjustments_ce0,
        l2_adjustments_d0,
        l2_adjustments_q0,
        l2_adjustments_we0,
        l2_adjustments_address1,
        l2_adjustments_ce1,
        l2_adjustments_d1,
        l2_adjustments_q1,
        l2_adjustments_we1,
        ap_start,
        in_data_empty_n,
        in_data_read,
        out_data_full_n,
        out_data_write,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input   ap_clk;
input   ap_rst;
output  [13:0] in_data_address0;
output   in_data_ce0;
output  [63:0] in_data_d0;
input  [63:0] in_data_q0;
output   in_data_we0;
output  [13:0] in_data_address1;
output   in_data_ce1;
output  [63:0] in_data_d1;
input  [63:0] in_data_q1;
output   in_data_we1;
output  [10:0] l1_filter_data_0_address0;
output   l1_filter_data_0_ce0;
output  [63:0] l1_filter_data_0_d0;
input  [63:0] l1_filter_data_0_q0;
output   l1_filter_data_0_we0;
output  [10:0] l1_filter_data_0_address1;
output   l1_filter_data_0_ce1;
output  [63:0] l1_filter_data_0_d1;
input  [63:0] l1_filter_data_0_q1;
output   l1_filter_data_0_we1;
output  [10:0] l1_filter_data_1_address0;
output   l1_filter_data_1_ce0;
output  [63:0] l1_filter_data_1_d0;
input  [63:0] l1_filter_data_1_q0;
output   l1_filter_data_1_we0;
output  [10:0] l1_filter_data_1_address1;
output   l1_filter_data_1_ce1;
output  [63:0] l1_filter_data_1_d1;
input  [63:0] l1_filter_data_1_q1;
output   l1_filter_data_1_we1;
output  [10:0] l1_filter_data_2_address0;
output   l1_filter_data_2_ce0;
output  [63:0] l1_filter_data_2_d0;
input  [63:0] l1_filter_data_2_q0;
output   l1_filter_data_2_we0;
output  [10:0] l1_filter_data_2_address1;
output   l1_filter_data_2_ce1;
output  [63:0] l1_filter_data_2_d1;
input  [63:0] l1_filter_data_2_q1;
output   l1_filter_data_2_we1;
output  [10:0] l1_filter_data_3_address0;
output   l1_filter_data_3_ce0;
output  [63:0] l1_filter_data_3_d0;
input  [63:0] l1_filter_data_3_q0;
output   l1_filter_data_3_we0;
output  [10:0] l1_filter_data_3_address1;
output   l1_filter_data_3_ce1;
output  [63:0] l1_filter_data_3_d1;
input  [63:0] l1_filter_data_3_q1;
output   l1_filter_data_3_we1;
output  [6:0] l1_adjustments_address0;
output   l1_adjustments_ce0;
output  [47:0] l1_adjustments_d0;
input  [47:0] l1_adjustments_q0;
output   l1_adjustments_we0;
output  [6:0] l1_adjustments_address1;
output   l1_adjustments_ce1;
output  [47:0] l1_adjustments_d1;
input  [47:0] l1_adjustments_q1;
output   l1_adjustments_we1;
output  [9:0] l2_filter_data_0_address0;
output   l2_filter_data_0_ce0;
output  [15:0] l2_filter_data_0_d0;
input  [15:0] l2_filter_data_0_q0;
output   l2_filter_data_0_we0;
output  [9:0] l2_filter_data_0_address1;
output   l2_filter_data_0_ce1;
output  [15:0] l2_filter_data_0_d1;
input  [15:0] l2_filter_data_0_q1;
output   l2_filter_data_0_we1;
output  [9:0] l2_filter_data_1_address0;
output   l2_filter_data_1_ce0;
output  [15:0] l2_filter_data_1_d0;
input  [15:0] l2_filter_data_1_q0;
output   l2_filter_data_1_we0;
output  [9:0] l2_filter_data_1_address1;
output   l2_filter_data_1_ce1;
output  [15:0] l2_filter_data_1_d1;
input  [15:0] l2_filter_data_1_q1;
output   l2_filter_data_1_we1;
output  [13:0] out_data_address0;
output   out_data_ce0;
output  [63:0] out_data_d0;
input  [63:0] out_data_q0;
output   out_data_we0;
output  [13:0] out_data_address1;
output   out_data_ce1;
output  [63:0] out_data_d1;
input  [63:0] out_data_q1;
output   out_data_we1;
output  [3:0] l2_adjustments_address0;
output   l2_adjustments_ce0;
output  [47:0] l2_adjustments_d0;
input  [47:0] l2_adjustments_q0;
output   l2_adjustments_we0;
output  [3:0] l2_adjustments_address1;
output   l2_adjustments_ce1;
output  [47:0] l2_adjustments_d1;
input  [47:0] l2_adjustments_q1;
output   l2_adjustments_we1;
input   ap_start;
input   in_data_empty_n;
output   in_data_read;
input   out_data_full_n;
output   out_data_write;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire   [15:0] ifmap_vec_0_i_q0;
wire   [15:0] ifmap_vec_0_t_q0;
wire   [15:0] ifmap_vec_1_i_q0;
wire   [15:0] ifmap_vec_1_t_q0;
wire   [15:0] ifmap_vec_2_i_q0;
wire   [15:0] ifmap_vec_2_t_q0;
wire   [15:0] ifmap_vec_3_i_q0;
wire   [15:0] ifmap_vec_3_t_q0;
wire   [15:0] weight_vecs_0_0_i_q0;
wire   [15:0] weight_vecs_0_0_t_q0;
wire   [15:0] weight_vecs_0_1_i_q0;
wire   [15:0] weight_vecs_0_1_t_q0;
wire   [15:0] weight_vecs_0_2_i_q0;
wire   [15:0] weight_vecs_0_2_t_q0;
wire   [15:0] weight_vecs_0_3_i_q0;
wire   [15:0] weight_vecs_0_3_t_q0;
wire   [15:0] weight_vecs_1_0_i_q0;
wire   [15:0] weight_vecs_1_0_t_q0;
wire   [15:0] weight_vecs_1_1_i_q0;
wire   [15:0] weight_vecs_1_1_t_q0;
wire   [15:0] weight_vecs_1_2_i_q0;
wire   [15:0] weight_vecs_1_2_t_q0;
wire   [15:0] weight_vecs_1_3_i_q0;
wire   [15:0] weight_vecs_1_3_t_q0;
wire   [15:0] weight_vecs_2_0_i_q0;
wire   [15:0] weight_vecs_2_0_t_q0;
wire   [15:0] weight_vecs_2_1_i_q0;
wire   [15:0] weight_vecs_2_1_t_q0;
wire   [15:0] weight_vecs_2_2_i_q0;
wire   [15:0] weight_vecs_2_2_t_q0;
wire   [15:0] weight_vecs_2_3_i_q0;
wire   [15:0] weight_vecs_2_3_t_q0;
wire   [15:0] weight_vecs_3_0_i_q0;
wire   [15:0] weight_vecs_3_0_t_q0;
wire   [15:0] weight_vecs_3_1_i_q0;
wire   [15:0] weight_vecs_3_1_t_q0;
wire   [15:0] weight_vecs_3_2_i_q0;
wire   [15:0] weight_vecs_3_2_t_q0;
wire   [15:0] weight_vecs_3_3_i_q0;
wire   [15:0] weight_vecs_3_3_t_q0;
wire   [15:0] products_0_0_i_q0;
wire   [15:0] products_0_0_i_q1;
wire   [15:0] products_0_0_t_q0;
wire   [15:0] products_0_0_t_q1;
wire   [15:0] products_0_1_i_q0;
wire   [15:0] products_0_1_i_q1;
wire   [15:0] products_0_1_t_q0;
wire   [15:0] products_0_1_t_q1;
wire   [15:0] products_0_2_i_q0;
wire   [15:0] products_0_2_i_q1;
wire   [15:0] products_0_2_t_q0;
wire   [15:0] products_0_2_t_q1;
wire   [15:0] products_0_3_i_q0;
wire   [15:0] products_0_3_i_q1;
wire   [15:0] products_0_3_t_q0;
wire   [15:0] products_0_3_t_q1;
wire   [15:0] products_1_0_i_q0;
wire   [15:0] products_1_0_i_q1;
wire   [15:0] products_1_0_t_q0;
wire   [15:0] products_1_0_t_q1;
wire   [15:0] products_1_1_i_q0;
wire   [15:0] products_1_1_i_q1;
wire   [15:0] products_1_1_t_q0;
wire   [15:0] products_1_1_t_q1;
wire   [15:0] products_1_2_i_q0;
wire   [15:0] products_1_2_i_q1;
wire   [15:0] products_1_2_t_q0;
wire   [15:0] products_1_2_t_q1;
wire   [15:0] products_1_3_i_q0;
wire   [15:0] products_1_3_i_q1;
wire   [15:0] products_1_3_t_q0;
wire   [15:0] products_1_3_t_q1;
wire   [15:0] products_2_0_i_q0;
wire   [15:0] products_2_0_i_q1;
wire   [15:0] products_2_0_t_q0;
wire   [15:0] products_2_0_t_q1;
wire   [15:0] products_2_1_i_q0;
wire   [15:0] products_2_1_i_q1;
wire   [15:0] products_2_1_t_q0;
wire   [15:0] products_2_1_t_q1;
wire   [15:0] products_2_2_i_q0;
wire   [15:0] products_2_2_i_q1;
wire   [15:0] products_2_2_t_q0;
wire   [15:0] products_2_2_t_q1;
wire   [15:0] products_2_3_i_q0;
wire   [15:0] products_2_3_i_q1;
wire   [15:0] products_2_3_t_q0;
wire   [15:0] products_2_3_t_q1;
wire   [15:0] products_3_0_i_q0;
wire   [15:0] products_3_0_i_q1;
wire   [15:0] products_3_0_t_q0;
wire   [15:0] products_3_0_t_q1;
wire   [15:0] products_3_1_i_q0;
wire   [15:0] products_3_1_i_q1;
wire   [15:0] products_3_1_t_q0;
wire   [15:0] products_3_1_t_q1;
wire   [15:0] products_3_2_i_q0;
wire   [15:0] products_3_2_i_q1;
wire   [15:0] products_3_2_t_q0;
wire   [15:0] products_3_2_t_q1;
wire   [15:0] products_3_3_i_q0;
wire   [15:0] products_3_3_i_q1;
wire   [15:0] products_3_3_t_q0;
wire   [15:0] products_3_3_t_q1;
wire   [15:0] accum1_out_0_i_q0;
wire   [15:0] accum1_out_0_i_q1;
wire   [15:0] accum1_out_0_t_q0;
wire   [15:0] accum1_out_0_t_q1;
wire   [15:0] accum1_out_1_i_q0;
wire   [15:0] accum1_out_1_i_q1;
wire   [15:0] accum1_out_1_t_q0;
wire   [15:0] accum1_out_1_t_q1;
wire   [15:0] accum1_out_2_i_q0;
wire   [15:0] accum1_out_2_i_q1;
wire   [15:0] accum1_out_2_t_q0;
wire   [15:0] accum1_out_2_t_q1;
wire   [15:0] accum1_out_3_i_q0;
wire   [15:0] accum1_out_3_i_q1;
wire   [15:0] accum1_out_3_t_q0;
wire   [15:0] accum1_out_3_t_q1;
wire   [15:0] accum2_out_0_i_q0;
wire   [15:0] accum2_out_0_i_q1;
wire   [15:0] accum2_out_0_t_q0;
wire   [15:0] accum2_out_0_t_q1;
wire   [15:0] accum2_out_1_i_q0;
wire   [15:0] accum2_out_1_i_q1;
wire   [15:0] accum2_out_1_t_q0;
wire   [15:0] accum2_out_1_t_q1;
wire   [15:0] accum2_out_2_i_q0;
wire   [15:0] accum2_out_2_i_q1;
wire   [15:0] accum2_out_2_t_q0;
wire   [15:0] accum2_out_2_t_q1;
wire   [15:0] accum2_out_3_i_q0;
wire   [15:0] accum2_out_3_i_q1;
wire   [15:0] accum2_out_3_t_q0;
wire   [15:0] accum2_out_3_t_q1;
wire   [15:0] l2_products_0_i_q0;
wire   [15:0] l2_products_0_i_q1;
wire   [15:0] l2_products_0_t_q0;
wire   [15:0] l2_products_0_t_q1;
wire   [15:0] l2_products_1_i_q0;
wire   [15:0] l2_products_1_i_q1;
wire   [15:0] l2_products_1_t_q0;
wire   [15:0] l2_products_1_t_q1;
wire   [15:0] l2_products_2_i_q0;
wire   [15:0] l2_products_2_i_q1;
wire   [15:0] l2_products_2_t_q0;
wire   [15:0] l2_products_2_t_q1;
wire   [15:0] l2_products_3_i_q0;
wire   [15:0] l2_products_3_i_q1;
wire   [15:0] l2_products_3_t_q0;
wire   [15:0] l2_products_3_t_q1;
wire   [15:0] l2_partial_sums_0_i_q0;
wire   [15:0] l2_partial_sums_0_t_q0;
wire   [15:0] l2_partial_sums_1_i_q0;
wire   [15:0] l2_partial_sums_1_t_q0;
wire   [15:0] l2_partial_sums_2_i_q0;
wire   [15:0] l2_partial_sums_2_t_q0;
wire   [15:0] l2_partial_sums_3_i_q0;
wire   [15:0] l2_partial_sums_3_t_q0;
wire    tdf4_get_next_ijk_U0_ap_start;
wire    tdf4_get_next_ijk_U0_ap_done;
wire    tdf4_get_next_ijk_U0_ap_continue;
wire    tdf4_get_next_ijk_U0_ap_idle;
wire    tdf4_get_next_ijk_U0_ap_ready;
wire    tdf4_get_next_ijk_U0_start_out;
wire    tdf4_get_next_ijk_U0_start_write;
wire   [15:0] tdf4_get_next_ijk_U0_indices_0_din;
wire    tdf4_get_next_ijk_U0_indices_0_write;
wire   [15:0] tdf4_get_next_ijk_U0_indices_1_din;
wire    tdf4_get_next_ijk_U0_indices_1_write;
wire   [4:0] tdf4_get_next_ijk_U0_indices_2_out_din;
wire    tdf4_get_next_ijk_U0_indices_2_out_write;
wire   [4:0] tdf4_get_next_ijk_U0_indices_2_out1_din;
wire    tdf4_get_next_ijk_U0_indices_2_out1_write;
wire    tdf4_get_next_ijk_U0_write_r_din;
wire    tdf4_get_next_ijk_U0_write_r_write;
wire    tdf4_readInputs37_U0_ap_start;
wire    tdf4_readInputs37_U0_ap_done;
wire    tdf4_readInputs37_U0_ap_continue;
wire    tdf4_readInputs37_U0_ap_idle;
wire    tdf4_readInputs37_U0_ap_ready;
wire   [13:0] tdf4_readInputs37_U0_in_data_address0;
wire    tdf4_readInputs37_U0_in_data_ce0;
wire    tdf4_readInputs37_U0_indices_01_read;
wire    tdf4_readInputs37_U0_indices_12_read;
wire   [5:0] tdf4_readInputs37_U0_ifmap_vec_0_address0;
wire    tdf4_readInputs37_U0_ifmap_vec_0_ce0;
wire    tdf4_readInputs37_U0_ifmap_vec_0_we0;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_0_d0;
wire   [5:0] tdf4_readInputs37_U0_ifmap_vec_1_address0;
wire    tdf4_readInputs37_U0_ifmap_vec_1_ce0;
wire    tdf4_readInputs37_U0_ifmap_vec_1_we0;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_1_d0;
wire   [5:0] tdf4_readInputs37_U0_ifmap_vec_2_address0;
wire    tdf4_readInputs37_U0_ifmap_vec_2_ce0;
wire    tdf4_readInputs37_U0_ifmap_vec_2_we0;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_2_d0;
wire   [5:0] tdf4_readInputs37_U0_ifmap_vec_3_address0;
wire    tdf4_readInputs37_U0_ifmap_vec_3_ce0;
wire    tdf4_readInputs37_U0_ifmap_vec_3_we0;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_3_d0;
wire   [5:0] tdf4_readInputs37_U0_indices_01_out_din;
wire    tdf4_readInputs37_U0_indices_01_out_write;
wire   [11:0] tdf4_readInputs37_U0_indices_12_out_din;
wire    tdf4_readInputs37_U0_indices_12_out_write;
wire    tdf4_readInputs37_U0_in_data_full_n;
wire    tdf4_readInputs37_U0_in_data_write;
wire    ap_channel_done_ifmap_vec_3;
wire    tdf4_readInputs37_U0_ifmap_vec_3_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_3;
wire    ap_sync_channel_write_ifmap_vec_3;
wire    ap_channel_done_ifmap_vec_2;
wire    tdf4_readInputs37_U0_ifmap_vec_2_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_2;
wire    ap_sync_channel_write_ifmap_vec_2;
wire    ap_channel_done_ifmap_vec_1;
wire    tdf4_readInputs37_U0_ifmap_vec_1_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_1;
wire    ap_sync_channel_write_ifmap_vec_1;
wire    ap_channel_done_ifmap_vec_0;
wire    tdf4_readInputs37_U0_ifmap_vec_0_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_0;
wire    ap_sync_channel_write_ifmap_vec_0;
wire    tdf4_readFilters36_U0_ap_start;
wire    tdf4_readFilters36_U0_ap_done;
wire    tdf4_readFilters36_U0_ap_continue;
wire    tdf4_readFilters36_U0_ap_idle;
wire    tdf4_readFilters36_U0_ap_ready;
wire   [10:0] tdf4_readFilters36_U0_filter_data_0_address0;
wire    tdf4_readFilters36_U0_filter_data_0_ce0;
wire   [10:0] tdf4_readFilters36_U0_filter_data_1_address0;
wire    tdf4_readFilters36_U0_filter_data_1_ce0;
wire   [10:0] tdf4_readFilters36_U0_filter_data_2_address0;
wire    tdf4_readFilters36_U0_filter_data_2_ce0;
wire   [10:0] tdf4_readFilters36_U0_filter_data_3_address0;
wire    tdf4_readFilters36_U0_filter_data_3_ce0;
wire    tdf4_readFilters36_U0_indices_23_read;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_0_0_address0;
wire    tdf4_readFilters36_U0_weight_vecs_0_0_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_0_0_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_0_0_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_0_1_address0;
wire    tdf4_readFilters36_U0_weight_vecs_0_1_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_0_1_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_0_1_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_0_2_address0;
wire    tdf4_readFilters36_U0_weight_vecs_0_2_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_0_2_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_0_2_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_0_3_address0;
wire    tdf4_readFilters36_U0_weight_vecs_0_3_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_0_3_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_0_3_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_1_0_address0;
wire    tdf4_readFilters36_U0_weight_vecs_1_0_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_1_0_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_1_0_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_1_1_address0;
wire    tdf4_readFilters36_U0_weight_vecs_1_1_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_1_1_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_1_1_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_1_2_address0;
wire    tdf4_readFilters36_U0_weight_vecs_1_2_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_1_2_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_1_2_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_1_3_address0;
wire    tdf4_readFilters36_U0_weight_vecs_1_3_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_1_3_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_1_3_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_2_0_address0;
wire    tdf4_readFilters36_U0_weight_vecs_2_0_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_2_0_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_2_0_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_2_1_address0;
wire    tdf4_readFilters36_U0_weight_vecs_2_1_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_2_1_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_2_1_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_2_2_address0;
wire    tdf4_readFilters36_U0_weight_vecs_2_2_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_2_2_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_2_2_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_2_3_address0;
wire    tdf4_readFilters36_U0_weight_vecs_2_3_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_2_3_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_2_3_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_3_0_address0;
wire    tdf4_readFilters36_U0_weight_vecs_3_0_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_3_0_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_3_0_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_3_1_address0;
wire    tdf4_readFilters36_U0_weight_vecs_3_1_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_3_1_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_3_1_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_3_2_address0;
wire    tdf4_readFilters36_U0_weight_vecs_3_2_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_3_2_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_3_2_d0;
wire   [5:0] tdf4_readFilters36_U0_weight_vecs_3_3_address0;
wire    tdf4_readFilters36_U0_weight_vecs_3_3_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_3_3_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_3_3_d0;
wire    ap_channel_done_weight_vecs_3_3;
wire    tdf4_readFilters36_U0_weight_vecs_3_3_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_3;
wire    ap_sync_channel_write_weight_vecs_3_3;
wire    ap_channel_done_weight_vecs_3_2;
wire    tdf4_readFilters36_U0_weight_vecs_3_2_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_2;
wire    ap_sync_channel_write_weight_vecs_3_2;
wire    ap_channel_done_weight_vecs_3_1;
wire    tdf4_readFilters36_U0_weight_vecs_3_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_1;
wire    ap_sync_channel_write_weight_vecs_3_1;
wire    ap_channel_done_weight_vecs_3_0;
wire    tdf4_readFilters36_U0_weight_vecs_3_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_0;
wire    ap_sync_channel_write_weight_vecs_3_0;
wire    ap_channel_done_weight_vecs_2_3;
wire    tdf4_readFilters36_U0_weight_vecs_2_3_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_3;
wire    ap_sync_channel_write_weight_vecs_2_3;
wire    ap_channel_done_weight_vecs_2_2;
wire    tdf4_readFilters36_U0_weight_vecs_2_2_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_2;
wire    ap_sync_channel_write_weight_vecs_2_2;
wire    ap_channel_done_weight_vecs_2_1;
wire    tdf4_readFilters36_U0_weight_vecs_2_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_1;
wire    ap_sync_channel_write_weight_vecs_2_1;
wire    ap_channel_done_weight_vecs_2_0;
wire    tdf4_readFilters36_U0_weight_vecs_2_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_0;
wire    ap_sync_channel_write_weight_vecs_2_0;
wire    ap_channel_done_weight_vecs_1_3;
wire    tdf4_readFilters36_U0_weight_vecs_1_3_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_3;
wire    ap_sync_channel_write_weight_vecs_1_3;
wire    ap_channel_done_weight_vecs_1_2;
wire    tdf4_readFilters36_U0_weight_vecs_1_2_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_2;
wire    ap_sync_channel_write_weight_vecs_1_2;
wire    ap_channel_done_weight_vecs_1_1;
wire    tdf4_readFilters36_U0_weight_vecs_1_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_1;
wire    ap_sync_channel_write_weight_vecs_1_1;
wire    ap_channel_done_weight_vecs_1_0;
wire    tdf4_readFilters36_U0_weight_vecs_1_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_0;
wire    ap_sync_channel_write_weight_vecs_1_0;
wire    ap_channel_done_weight_vecs_0_3;
wire    tdf4_readFilters36_U0_weight_vecs_0_3_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_3;
wire    ap_sync_channel_write_weight_vecs_0_3;
wire    ap_channel_done_weight_vecs_0_2;
wire    tdf4_readFilters36_U0_weight_vecs_0_2_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_2;
wire    ap_sync_channel_write_weight_vecs_0_2;
wire    ap_channel_done_weight_vecs_0_1;
wire    tdf4_readFilters36_U0_weight_vecs_0_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_1;
wire    ap_sync_channel_write_weight_vecs_0_1;
wire    ap_channel_done_weight_vecs_0_0;
wire    tdf4_readFilters36_U0_weight_vecs_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_0;
wire    ap_sync_channel_write_weight_vecs_0_0;
wire    tdf4_dot_product_U0_ap_start;
wire    tdf4_dot_product_U0_ap_done;
wire    tdf4_dot_product_U0_ap_continue;
wire    tdf4_dot_product_U0_ap_idle;
wire    tdf4_dot_product_U0_ap_ready;
wire   [5:0] tdf4_dot_product_U0_ifmap_vec_0_address0;
wire    tdf4_dot_product_U0_ifmap_vec_0_ce0;
wire   [5:0] tdf4_dot_product_U0_ifmap_vec_1_address0;
wire    tdf4_dot_product_U0_ifmap_vec_1_ce0;
wire   [5:0] tdf4_dot_product_U0_ifmap_vec_2_address0;
wire    tdf4_dot_product_U0_ifmap_vec_2_ce0;
wire   [5:0] tdf4_dot_product_U0_ifmap_vec_3_address0;
wire    tdf4_dot_product_U0_ifmap_vec_3_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_0_0_address0;
wire    tdf4_dot_product_U0_weight_vecs_0_0_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_0_1_address0;
wire    tdf4_dot_product_U0_weight_vecs_0_1_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_0_2_address0;
wire    tdf4_dot_product_U0_weight_vecs_0_2_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_0_3_address0;
wire    tdf4_dot_product_U0_weight_vecs_0_3_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_1_0_address0;
wire    tdf4_dot_product_U0_weight_vecs_1_0_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_1_1_address0;
wire    tdf4_dot_product_U0_weight_vecs_1_1_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_1_2_address0;
wire    tdf4_dot_product_U0_weight_vecs_1_2_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_1_3_address0;
wire    tdf4_dot_product_U0_weight_vecs_1_3_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_2_0_address0;
wire    tdf4_dot_product_U0_weight_vecs_2_0_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_2_1_address0;
wire    tdf4_dot_product_U0_weight_vecs_2_1_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_2_2_address0;
wire    tdf4_dot_product_U0_weight_vecs_2_2_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_2_3_address0;
wire    tdf4_dot_product_U0_weight_vecs_2_3_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_3_0_address0;
wire    tdf4_dot_product_U0_weight_vecs_3_0_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_3_1_address0;
wire    tdf4_dot_product_U0_weight_vecs_3_1_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_3_2_address0;
wire    tdf4_dot_product_U0_weight_vecs_3_2_ce0;
wire   [5:0] tdf4_dot_product_U0_weight_vecs_3_3_address0;
wire    tdf4_dot_product_U0_weight_vecs_3_3_ce0;
wire   [5:0] tdf4_dot_product_U0_products_0_0_address0;
wire    tdf4_dot_product_U0_products_0_0_ce0;
wire    tdf4_dot_product_U0_products_0_0_we0;
wire   [15:0] tdf4_dot_product_U0_products_0_0_d0;
wire   [5:0] tdf4_dot_product_U0_products_0_1_address0;
wire    tdf4_dot_product_U0_products_0_1_ce0;
wire    tdf4_dot_product_U0_products_0_1_we0;
wire   [15:0] tdf4_dot_product_U0_products_0_1_d0;
wire   [5:0] tdf4_dot_product_U0_products_0_2_address0;
wire    tdf4_dot_product_U0_products_0_2_ce0;
wire    tdf4_dot_product_U0_products_0_2_we0;
wire   [15:0] tdf4_dot_product_U0_products_0_2_d0;
wire   [5:0] tdf4_dot_product_U0_products_0_3_address0;
wire    tdf4_dot_product_U0_products_0_3_ce0;
wire    tdf4_dot_product_U0_products_0_3_we0;
wire   [15:0] tdf4_dot_product_U0_products_0_3_d0;
wire   [5:0] tdf4_dot_product_U0_products_1_0_address0;
wire    tdf4_dot_product_U0_products_1_0_ce0;
wire    tdf4_dot_product_U0_products_1_0_we0;
wire   [15:0] tdf4_dot_product_U0_products_1_0_d0;
wire   [5:0] tdf4_dot_product_U0_products_1_1_address0;
wire    tdf4_dot_product_U0_products_1_1_ce0;
wire    tdf4_dot_product_U0_products_1_1_we0;
wire   [15:0] tdf4_dot_product_U0_products_1_1_d0;
wire   [5:0] tdf4_dot_product_U0_products_1_2_address0;
wire    tdf4_dot_product_U0_products_1_2_ce0;
wire    tdf4_dot_product_U0_products_1_2_we0;
wire   [15:0] tdf4_dot_product_U0_products_1_2_d0;
wire   [5:0] tdf4_dot_product_U0_products_1_3_address0;
wire    tdf4_dot_product_U0_products_1_3_ce0;
wire    tdf4_dot_product_U0_products_1_3_we0;
wire   [15:0] tdf4_dot_product_U0_products_1_3_d0;
wire   [5:0] tdf4_dot_product_U0_products_2_0_address0;
wire    tdf4_dot_product_U0_products_2_0_ce0;
wire    tdf4_dot_product_U0_products_2_0_we0;
wire   [15:0] tdf4_dot_product_U0_products_2_0_d0;
wire   [5:0] tdf4_dot_product_U0_products_2_1_address0;
wire    tdf4_dot_product_U0_products_2_1_ce0;
wire    tdf4_dot_product_U0_products_2_1_we0;
wire   [15:0] tdf4_dot_product_U0_products_2_1_d0;
wire   [5:0] tdf4_dot_product_U0_products_2_2_address0;
wire    tdf4_dot_product_U0_products_2_2_ce0;
wire    tdf4_dot_product_U0_products_2_2_we0;
wire   [15:0] tdf4_dot_product_U0_products_2_2_d0;
wire   [5:0] tdf4_dot_product_U0_products_2_3_address0;
wire    tdf4_dot_product_U0_products_2_3_ce0;
wire    tdf4_dot_product_U0_products_2_3_we0;
wire   [15:0] tdf4_dot_product_U0_products_2_3_d0;
wire   [5:0] tdf4_dot_product_U0_products_3_0_address0;
wire    tdf4_dot_product_U0_products_3_0_ce0;
wire    tdf4_dot_product_U0_products_3_0_we0;
wire   [15:0] tdf4_dot_product_U0_products_3_0_d0;
wire   [5:0] tdf4_dot_product_U0_products_3_1_address0;
wire    tdf4_dot_product_U0_products_3_1_ce0;
wire    tdf4_dot_product_U0_products_3_1_we0;
wire   [15:0] tdf4_dot_product_U0_products_3_1_d0;
wire   [5:0] tdf4_dot_product_U0_products_3_2_address0;
wire    tdf4_dot_product_U0_products_3_2_ce0;
wire    tdf4_dot_product_U0_products_3_2_we0;
wire   [15:0] tdf4_dot_product_U0_products_3_2_d0;
wire   [5:0] tdf4_dot_product_U0_products_3_3_address0;
wire    tdf4_dot_product_U0_products_3_3_ce0;
wire    tdf4_dot_product_U0_products_3_3_we0;
wire   [15:0] tdf4_dot_product_U0_products_3_3_d0;
wire    ap_channel_done_products_3_3;
wire    tdf4_dot_product_U0_products_3_3_full_n;
reg    ap_sync_reg_channel_write_products_3_3;
wire    ap_sync_channel_write_products_3_3;
wire    ap_channel_done_products_3_2;
wire    tdf4_dot_product_U0_products_3_2_full_n;
reg    ap_sync_reg_channel_write_products_3_2;
wire    ap_sync_channel_write_products_3_2;
wire    ap_channel_done_products_3_1;
wire    tdf4_dot_product_U0_products_3_1_full_n;
reg    ap_sync_reg_channel_write_products_3_1;
wire    ap_sync_channel_write_products_3_1;
wire    ap_channel_done_products_3_0;
wire    tdf4_dot_product_U0_products_3_0_full_n;
reg    ap_sync_reg_channel_write_products_3_0;
wire    ap_sync_channel_write_products_3_0;
wire    ap_channel_done_products_2_3;
wire    tdf4_dot_product_U0_products_2_3_full_n;
reg    ap_sync_reg_channel_write_products_2_3;
wire    ap_sync_channel_write_products_2_3;
wire    ap_channel_done_products_2_2;
wire    tdf4_dot_product_U0_products_2_2_full_n;
reg    ap_sync_reg_channel_write_products_2_2;
wire    ap_sync_channel_write_products_2_2;
wire    ap_channel_done_products_2_1;
wire    tdf4_dot_product_U0_products_2_1_full_n;
reg    ap_sync_reg_channel_write_products_2_1;
wire    ap_sync_channel_write_products_2_1;
wire    ap_channel_done_products_2_0;
wire    tdf4_dot_product_U0_products_2_0_full_n;
reg    ap_sync_reg_channel_write_products_2_0;
wire    ap_sync_channel_write_products_2_0;
wire    ap_channel_done_products_1_3;
wire    tdf4_dot_product_U0_products_1_3_full_n;
reg    ap_sync_reg_channel_write_products_1_3;
wire    ap_sync_channel_write_products_1_3;
wire    ap_channel_done_products_1_2;
wire    tdf4_dot_product_U0_products_1_2_full_n;
reg    ap_sync_reg_channel_write_products_1_2;
wire    ap_sync_channel_write_products_1_2;
wire    ap_channel_done_products_1_1;
wire    tdf4_dot_product_U0_products_1_1_full_n;
reg    ap_sync_reg_channel_write_products_1_1;
wire    ap_sync_channel_write_products_1_1;
wire    ap_channel_done_products_1_0;
wire    tdf4_dot_product_U0_products_1_0_full_n;
reg    ap_sync_reg_channel_write_products_1_0;
wire    ap_sync_channel_write_products_1_0;
wire    ap_channel_done_products_0_3;
wire    tdf4_dot_product_U0_products_0_3_full_n;
reg    ap_sync_reg_channel_write_products_0_3;
wire    ap_sync_channel_write_products_0_3;
wire    ap_channel_done_products_0_2;
wire    tdf4_dot_product_U0_products_0_2_full_n;
reg    ap_sync_reg_channel_write_products_0_2;
wire    ap_sync_channel_write_products_0_2;
wire    ap_channel_done_products_0_1;
wire    tdf4_dot_product_U0_products_0_1_full_n;
reg    ap_sync_reg_channel_write_products_0_1;
wire    ap_sync_channel_write_products_0_1;
wire    ap_channel_done_products_0_0;
wire    tdf4_dot_product_U0_products_0_0_full_n;
reg    ap_sync_reg_channel_write_products_0_0;
wire    ap_sync_channel_write_products_0_0;
wire    tdf4_accum_1_U0_ap_start;
wire    tdf4_accum_1_U0_ap_done;
wire    tdf4_accum_1_U0_ap_continue;
wire    tdf4_accum_1_U0_ap_idle;
wire    tdf4_accum_1_U0_ap_ready;
wire   [5:0] tdf4_accum_1_U0_accum_in_address0;
wire    tdf4_accum_1_U0_accum_in_ce0;
wire   [5:0] tdf4_accum_1_U0_accum_in_address1;
wire    tdf4_accum_1_U0_accum_in_ce1;
wire   [5:0] tdf4_accum_1_U0_accum_in1_address0;
wire    tdf4_accum_1_U0_accum_in1_ce0;
wire   [5:0] tdf4_accum_1_U0_accum_in1_address1;
wire    tdf4_accum_1_U0_accum_in1_ce1;
wire   [5:0] tdf4_accum_1_U0_accum_in2_address0;
wire    tdf4_accum_1_U0_accum_in2_ce0;
wire   [5:0] tdf4_accum_1_U0_accum_in2_address1;
wire    tdf4_accum_1_U0_accum_in2_ce1;
wire   [5:0] tdf4_accum_1_U0_accum_in3_address0;
wire    tdf4_accum_1_U0_accum_in3_ce0;
wire   [5:0] tdf4_accum_1_U0_accum_in3_address1;
wire    tdf4_accum_1_U0_accum_in3_ce1;
wire   [4:0] tdf4_accum_1_U0_accum_out_address0;
wire    tdf4_accum_1_U0_accum_out_ce0;
wire    tdf4_accum_1_U0_accum_out_we0;
wire   [15:0] tdf4_accum_1_U0_accum_out_d0;
wire   [4:0] tdf4_accum_1_U0_accum_out_address1;
wire    tdf4_accum_1_U0_accum_out_ce1;
wire    tdf4_accum_1_U0_accum_out_we1;
wire   [15:0] tdf4_accum_1_U0_accum_out_d1;
wire    ap_channel_done_accum1_out_0;
wire    tdf4_accum_1_U0_accum_out_full_n;
wire    tdf4_accum_1_U1_1_ap_start;
wire    tdf4_accum_1_U1_1_ap_done;
wire    tdf4_accum_1_U1_1_ap_continue;
wire    tdf4_accum_1_U1_1_ap_idle;
wire    tdf4_accum_1_U1_1_ap_ready;
wire   [5:0] tdf4_accum_1_U1_1_accum_in_address0;
wire    tdf4_accum_1_U1_1_accum_in_ce0;
wire   [5:0] tdf4_accum_1_U1_1_accum_in_address1;
wire    tdf4_accum_1_U1_1_accum_in_ce1;
wire   [5:0] tdf4_accum_1_U1_1_accum_in1_address0;
wire    tdf4_accum_1_U1_1_accum_in1_ce0;
wire   [5:0] tdf4_accum_1_U1_1_accum_in1_address1;
wire    tdf4_accum_1_U1_1_accum_in1_ce1;
wire   [5:0] tdf4_accum_1_U1_1_accum_in2_address0;
wire    tdf4_accum_1_U1_1_accum_in2_ce0;
wire   [5:0] tdf4_accum_1_U1_1_accum_in2_address1;
wire    tdf4_accum_1_U1_1_accum_in2_ce1;
wire   [5:0] tdf4_accum_1_U1_1_accum_in3_address0;
wire    tdf4_accum_1_U1_1_accum_in3_ce0;
wire   [5:0] tdf4_accum_1_U1_1_accum_in3_address1;
wire    tdf4_accum_1_U1_1_accum_in3_ce1;
wire   [4:0] tdf4_accum_1_U1_1_accum_out_address0;
wire    tdf4_accum_1_U1_1_accum_out_ce0;
wire    tdf4_accum_1_U1_1_accum_out_we0;
wire   [15:0] tdf4_accum_1_U1_1_accum_out_d0;
wire   [4:0] tdf4_accum_1_U1_1_accum_out_address1;
wire    tdf4_accum_1_U1_1_accum_out_ce1;
wire    tdf4_accum_1_U1_1_accum_out_we1;
wire   [15:0] tdf4_accum_1_U1_1_accum_out_d1;
wire    ap_channel_done_accum1_out_1;
wire    tdf4_accum_1_U1_1_accum_out_full_n;
wire    tdf4_accum_1_U2_2_ap_start;
wire    tdf4_accum_1_U2_2_ap_done;
wire    tdf4_accum_1_U2_2_ap_continue;
wire    tdf4_accum_1_U2_2_ap_idle;
wire    tdf4_accum_1_U2_2_ap_ready;
wire   [5:0] tdf4_accum_1_U2_2_accum_in_address0;
wire    tdf4_accum_1_U2_2_accum_in_ce0;
wire   [5:0] tdf4_accum_1_U2_2_accum_in_address1;
wire    tdf4_accum_1_U2_2_accum_in_ce1;
wire   [5:0] tdf4_accum_1_U2_2_accum_in1_address0;
wire    tdf4_accum_1_U2_2_accum_in1_ce0;
wire   [5:0] tdf4_accum_1_U2_2_accum_in1_address1;
wire    tdf4_accum_1_U2_2_accum_in1_ce1;
wire   [5:0] tdf4_accum_1_U2_2_accum_in2_address0;
wire    tdf4_accum_1_U2_2_accum_in2_ce0;
wire   [5:0] tdf4_accum_1_U2_2_accum_in2_address1;
wire    tdf4_accum_1_U2_2_accum_in2_ce1;
wire   [5:0] tdf4_accum_1_U2_2_accum_in3_address0;
wire    tdf4_accum_1_U2_2_accum_in3_ce0;
wire   [5:0] tdf4_accum_1_U2_2_accum_in3_address1;
wire    tdf4_accum_1_U2_2_accum_in3_ce1;
wire   [4:0] tdf4_accum_1_U2_2_accum_out_address0;
wire    tdf4_accum_1_U2_2_accum_out_ce0;
wire    tdf4_accum_1_U2_2_accum_out_we0;
wire   [15:0] tdf4_accum_1_U2_2_accum_out_d0;
wire   [4:0] tdf4_accum_1_U2_2_accum_out_address1;
wire    tdf4_accum_1_U2_2_accum_out_ce1;
wire    tdf4_accum_1_U2_2_accum_out_we1;
wire   [15:0] tdf4_accum_1_U2_2_accum_out_d1;
wire    ap_channel_done_accum1_out_2;
wire    tdf4_accum_1_U2_2_accum_out_full_n;
wire    tdf4_accum_1_U3_3_ap_start;
wire    tdf4_accum_1_U3_3_ap_done;
wire    tdf4_accum_1_U3_3_ap_continue;
wire    tdf4_accum_1_U3_3_ap_idle;
wire    tdf4_accum_1_U3_3_ap_ready;
wire   [5:0] tdf4_accum_1_U3_3_accum_in_address0;
wire    tdf4_accum_1_U3_3_accum_in_ce0;
wire   [5:0] tdf4_accum_1_U3_3_accum_in_address1;
wire    tdf4_accum_1_U3_3_accum_in_ce1;
wire   [5:0] tdf4_accum_1_U3_3_accum_in1_address0;
wire    tdf4_accum_1_U3_3_accum_in1_ce0;
wire   [5:0] tdf4_accum_1_U3_3_accum_in1_address1;
wire    tdf4_accum_1_U3_3_accum_in1_ce1;
wire   [5:0] tdf4_accum_1_U3_3_accum_in2_address0;
wire    tdf4_accum_1_U3_3_accum_in2_ce0;
wire   [5:0] tdf4_accum_1_U3_3_accum_in2_address1;
wire    tdf4_accum_1_U3_3_accum_in2_ce1;
wire   [5:0] tdf4_accum_1_U3_3_accum_in3_address0;
wire    tdf4_accum_1_U3_3_accum_in3_ce0;
wire   [5:0] tdf4_accum_1_U3_3_accum_in3_address1;
wire    tdf4_accum_1_U3_3_accum_in3_ce1;
wire   [4:0] tdf4_accum_1_U3_3_accum_out_address0;
wire    tdf4_accum_1_U3_3_accum_out_ce0;
wire    tdf4_accum_1_U3_3_accum_out_we0;
wire   [15:0] tdf4_accum_1_U3_3_accum_out_d0;
wire   [4:0] tdf4_accum_1_U3_3_accum_out_address1;
wire    tdf4_accum_1_U3_3_accum_out_ce1;
wire    tdf4_accum_1_U3_3_accum_out_we1;
wire   [15:0] tdf4_accum_1_U3_3_accum_out_d1;
wire    ap_channel_done_accum1_out_3;
wire    tdf4_accum_1_U3_3_accum_out_full_n;
wire    tdf4_accum_2_U0_ap_start;
wire    tdf4_accum_2_U0_ap_done;
wire    tdf4_accum_2_U0_ap_continue;
wire    tdf4_accum_2_U0_ap_idle;
wire    tdf4_accum_2_U0_ap_ready;
wire   [4:0] tdf4_accum_2_U0_accum_in_address0;
wire    tdf4_accum_2_U0_accum_in_ce0;
wire   [4:0] tdf4_accum_2_U0_accum_in_address1;
wire    tdf4_accum_2_U0_accum_in_ce1;
wire   [2:0] tdf4_accum_2_U0_accum_out_address0;
wire    tdf4_accum_2_U0_accum_out_ce0;
wire    tdf4_accum_2_U0_accum_out_we0;
wire   [15:0] tdf4_accum_2_U0_accum_out_d0;
wire   [2:0] tdf4_accum_2_U0_accum_out_address1;
wire    tdf4_accum_2_U0_accum_out_ce1;
wire    tdf4_accum_2_U0_accum_out_we1;
wire   [15:0] tdf4_accum_2_U0_accum_out_d1;
wire    ap_channel_done_accum2_out_0;
wire    tdf4_accum_2_U0_accum_out_full_n;
wire    tdf4_accum_2_U1_1_ap_start;
wire    tdf4_accum_2_U1_1_ap_done;
wire    tdf4_accum_2_U1_1_ap_continue;
wire    tdf4_accum_2_U1_1_ap_idle;
wire    tdf4_accum_2_U1_1_ap_ready;
wire   [4:0] tdf4_accum_2_U1_1_accum_in_address0;
wire    tdf4_accum_2_U1_1_accum_in_ce0;
wire   [4:0] tdf4_accum_2_U1_1_accum_in_address1;
wire    tdf4_accum_2_U1_1_accum_in_ce1;
wire   [2:0] tdf4_accum_2_U1_1_accum_out_address0;
wire    tdf4_accum_2_U1_1_accum_out_ce0;
wire    tdf4_accum_2_U1_1_accum_out_we0;
wire   [15:0] tdf4_accum_2_U1_1_accum_out_d0;
wire   [2:0] tdf4_accum_2_U1_1_accum_out_address1;
wire    tdf4_accum_2_U1_1_accum_out_ce1;
wire    tdf4_accum_2_U1_1_accum_out_we1;
wire   [15:0] tdf4_accum_2_U1_1_accum_out_d1;
wire    ap_channel_done_accum2_out_1;
wire    tdf4_accum_2_U1_1_accum_out_full_n;
wire    tdf4_accum_2_U2_2_ap_start;
wire    tdf4_accum_2_U2_2_ap_done;
wire    tdf4_accum_2_U2_2_ap_continue;
wire    tdf4_accum_2_U2_2_ap_idle;
wire    tdf4_accum_2_U2_2_ap_ready;
wire   [4:0] tdf4_accum_2_U2_2_accum_in_address0;
wire    tdf4_accum_2_U2_2_accum_in_ce0;
wire   [4:0] tdf4_accum_2_U2_2_accum_in_address1;
wire    tdf4_accum_2_U2_2_accum_in_ce1;
wire   [2:0] tdf4_accum_2_U2_2_accum_out_address0;
wire    tdf4_accum_2_U2_2_accum_out_ce0;
wire    tdf4_accum_2_U2_2_accum_out_we0;
wire   [15:0] tdf4_accum_2_U2_2_accum_out_d0;
wire   [2:0] tdf4_accum_2_U2_2_accum_out_address1;
wire    tdf4_accum_2_U2_2_accum_out_ce1;
wire    tdf4_accum_2_U2_2_accum_out_we1;
wire   [15:0] tdf4_accum_2_U2_2_accum_out_d1;
wire    ap_channel_done_accum2_out_2;
wire    tdf4_accum_2_U2_2_accum_out_full_n;
wire    tdf4_accum_2_U3_3_ap_start;
wire    tdf4_accum_2_U3_3_ap_done;
wire    tdf4_accum_2_U3_3_ap_continue;
wire    tdf4_accum_2_U3_3_ap_idle;
wire    tdf4_accum_2_U3_3_ap_ready;
wire   [4:0] tdf4_accum_2_U3_3_accum_in_address0;
wire    tdf4_accum_2_U3_3_accum_in_ce0;
wire   [4:0] tdf4_accum_2_U3_3_accum_in_address1;
wire    tdf4_accum_2_U3_3_accum_in_ce1;
wire   [2:0] tdf4_accum_2_U3_3_accum_out_address0;
wire    tdf4_accum_2_U3_3_accum_out_ce0;
wire    tdf4_accum_2_U3_3_accum_out_we0;
wire   [15:0] tdf4_accum_2_U3_3_accum_out_d0;
wire   [2:0] tdf4_accum_2_U3_3_accum_out_address1;
wire    tdf4_accum_2_U3_3_accum_out_ce1;
wire    tdf4_accum_2_U3_3_accum_out_we1;
wire   [15:0] tdf4_accum_2_U3_3_accum_out_d1;
wire    ap_channel_done_accum2_out_3;
wire    tdf4_accum_2_U3_3_accum_out_full_n;
wire    tdf4_accum_3_U0_ap_start;
wire    tdf4_accum_3_U0_ap_done;
wire    tdf4_accum_3_U0_ap_continue;
wire    tdf4_accum_3_U0_ap_idle;
wire    tdf4_accum_3_U0_ap_ready;
wire   [2:0] tdf4_accum_3_U0_accum_in_address0;
wire    tdf4_accum_3_U0_accum_in_ce0;
wire   [2:0] tdf4_accum_3_U0_accum_in_address1;
wire    tdf4_accum_3_U0_accum_in_ce1;
wire   [15:0] tdf4_accum_3_U0_ap_return_0;
wire   [15:0] tdf4_accum_3_U0_ap_return_1;
wire   [15:0] tdf4_accum_3_U0_ap_return_2;
wire   [15:0] tdf4_accum_3_U0_ap_return_3;
wire    ap_channel_done_accum3_out_0_3;
wire    accum3_out_0_3_full_n;
reg    ap_sync_reg_channel_write_accum3_out_0_3;
wire    ap_sync_channel_write_accum3_out_0_3;
wire    ap_channel_done_accum3_out_0_2;
wire    accum3_out_0_2_full_n;
reg    ap_sync_reg_channel_write_accum3_out_0_2;
wire    ap_sync_channel_write_accum3_out_0_2;
wire    ap_channel_done_accum3_out_0_1;
wire    accum3_out_0_1_full_n;
reg    ap_sync_reg_channel_write_accum3_out_0_1;
wire    ap_sync_channel_write_accum3_out_0_1;
wire    ap_channel_done_accum3_out_0_0;
wire    accum3_out_0_0_full_n;
reg    ap_sync_reg_channel_write_accum3_out_0_0;
wire    ap_sync_channel_write_accum3_out_0_0;
wire    tdf4_accum_3_1_U0_ap_start;
wire    tdf4_accum_3_1_U0_ap_done;
wire    tdf4_accum_3_1_U0_ap_continue;
wire    tdf4_accum_3_1_U0_ap_idle;
wire    tdf4_accum_3_1_U0_ap_ready;
wire   [2:0] tdf4_accum_3_1_U0_accum_in_address0;
wire    tdf4_accum_3_1_U0_accum_in_ce0;
wire   [2:0] tdf4_accum_3_1_U0_accum_in_address1;
wire    tdf4_accum_3_1_U0_accum_in_ce1;
wire   [15:0] tdf4_accum_3_1_U0_ap_return_0;
wire   [15:0] tdf4_accum_3_1_U0_ap_return_1;
wire   [15:0] tdf4_accum_3_1_U0_ap_return_2;
wire   [15:0] tdf4_accum_3_1_U0_ap_return_3;
wire    ap_channel_done_accum3_out_1_3;
wire    accum3_out_1_3_full_n;
reg    ap_sync_reg_channel_write_accum3_out_1_3;
wire    ap_sync_channel_write_accum3_out_1_3;
wire    ap_channel_done_accum3_out_1_2;
wire    accum3_out_1_2_full_n;
reg    ap_sync_reg_channel_write_accum3_out_1_2;
wire    ap_sync_channel_write_accum3_out_1_2;
wire    ap_channel_done_accum3_out_1_1;
wire    accum3_out_1_1_full_n;
reg    ap_sync_reg_channel_write_accum3_out_1_1;
wire    ap_sync_channel_write_accum3_out_1_1;
wire    ap_channel_done_accum3_out_1_0;
wire    accum3_out_1_0_full_n;
reg    ap_sync_reg_channel_write_accum3_out_1_0;
wire    ap_sync_channel_write_accum3_out_1_0;
wire    tdf4_accum_3_2_U0_ap_start;
wire    tdf4_accum_3_2_U0_ap_done;
wire    tdf4_accum_3_2_U0_ap_continue;
wire    tdf4_accum_3_2_U0_ap_idle;
wire    tdf4_accum_3_2_U0_ap_ready;
wire   [2:0] tdf4_accum_3_2_U0_accum_in_address0;
wire    tdf4_accum_3_2_U0_accum_in_ce0;
wire   [2:0] tdf4_accum_3_2_U0_accum_in_address1;
wire    tdf4_accum_3_2_U0_accum_in_ce1;
wire   [15:0] tdf4_accum_3_2_U0_ap_return_0;
wire   [15:0] tdf4_accum_3_2_U0_ap_return_1;
wire   [15:0] tdf4_accum_3_2_U0_ap_return_2;
wire   [15:0] tdf4_accum_3_2_U0_ap_return_3;
wire    ap_channel_done_accum3_out_2_3;
wire    accum3_out_2_3_full_n;
reg    ap_sync_reg_channel_write_accum3_out_2_3;
wire    ap_sync_channel_write_accum3_out_2_3;
wire    ap_channel_done_accum3_out_2_2;
wire    accum3_out_2_2_full_n;
reg    ap_sync_reg_channel_write_accum3_out_2_2;
wire    ap_sync_channel_write_accum3_out_2_2;
wire    ap_channel_done_accum3_out_2_1;
wire    accum3_out_2_1_full_n;
reg    ap_sync_reg_channel_write_accum3_out_2_1;
wire    ap_sync_channel_write_accum3_out_2_1;
wire    ap_channel_done_accum3_out_2_0;
wire    accum3_out_2_0_full_n;
reg    ap_sync_reg_channel_write_accum3_out_2_0;
wire    ap_sync_channel_write_accum3_out_2_0;
wire    tdf4_accum_3_3_U0_ap_start;
wire    tdf4_accum_3_3_U0_ap_done;
wire    tdf4_accum_3_3_U0_ap_continue;
wire    tdf4_accum_3_3_U0_ap_idle;
wire    tdf4_accum_3_3_U0_ap_ready;
wire   [2:0] tdf4_accum_3_3_U0_accum_in_address0;
wire    tdf4_accum_3_3_U0_accum_in_ce0;
wire   [2:0] tdf4_accum_3_3_U0_accum_in_address1;
wire    tdf4_accum_3_3_U0_accum_in_ce1;
wire   [15:0] tdf4_accum_3_3_U0_ap_return_0;
wire   [15:0] tdf4_accum_3_3_U0_ap_return_1;
wire   [15:0] tdf4_accum_3_3_U0_ap_return_2;
wire   [15:0] tdf4_accum_3_3_U0_ap_return_3;
wire    ap_channel_done_accum3_out_3_3;
wire    accum3_out_3_3_full_n;
reg    ap_sync_reg_channel_write_accum3_out_3_3;
wire    ap_sync_channel_write_accum3_out_3_3;
wire    ap_channel_done_accum3_out_3_2;
wire    accum3_out_3_2_full_n;
reg    ap_sync_reg_channel_write_accum3_out_3_2;
wire    ap_sync_channel_write_accum3_out_3_2;
wire    ap_channel_done_accum3_out_3_1;
wire    accum3_out_3_1_full_n;
reg    ap_sync_reg_channel_write_accum3_out_3_1;
wire    ap_sync_channel_write_accum3_out_3_1;
wire    ap_channel_done_accum3_out_3_0;
wire    accum3_out_3_0_full_n;
reg    ap_sync_reg_channel_write_accum3_out_3_0;
wire    ap_sync_channel_write_accum3_out_3_0;
wire    tdf4_accum_4_U0_ap_start;
wire    tdf4_accum_4_U0_ap_done;
wire    tdf4_accum_4_U0_ap_continue;
wire    tdf4_accum_4_U0_ap_idle;
wire    tdf4_accum_4_U0_ap_ready;
wire   [15:0] tdf4_accum_4_U0_accum_in_0;
wire    tdf4_accum_4_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc512_U0_ap_start;
wire    Block_entry_proc_proc512_U0_ap_done;
wire    Block_entry_proc_proc512_U0_ap_continue;
wire    Block_entry_proc_proc512_U0_ap_idle;
wire    Block_entry_proc_proc512_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc512_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf4_accum_4_1_U0_ap_start;
wire    tdf4_accum_4_1_U0_ap_done;
wire    tdf4_accum_4_1_U0_ap_continue;
wire    tdf4_accum_4_1_U0_ap_idle;
wire    tdf4_accum_4_1_U0_ap_ready;
wire   [15:0] tdf4_accum_4_1_U0_accum_in_0;
wire    tdf4_accum_4_1_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_218_channel;
wire    tmp_218_channel_full_n;
wire    Block_entry_proc_proc513_U0_ap_start;
wire    Block_entry_proc_proc513_U0_ap_done;
wire    Block_entry_proc_proc513_U0_ap_continue;
wire    Block_entry_proc_proc513_U0_ap_idle;
wire    Block_entry_proc_proc513_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc513_U0_ap_return;
wire    ap_channel_done_sums_1;
wire    sums_1_full_n;
wire    tdf4_accum_4_2_U0_ap_start;
wire    tdf4_accum_4_2_U0_ap_done;
wire    tdf4_accum_4_2_U0_ap_continue;
wire    tdf4_accum_4_2_U0_ap_idle;
wire    tdf4_accum_4_2_U0_ap_ready;
wire   [15:0] tdf4_accum_4_2_U0_accum_in_0;
wire    tdf4_accum_4_2_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_219_channel;
wire    tmp_219_channel_full_n;
wire    Block_entry_proc_proc514_U0_ap_start;
wire    Block_entry_proc_proc514_U0_ap_done;
wire    Block_entry_proc_proc514_U0_ap_continue;
wire    Block_entry_proc_proc514_U0_ap_idle;
wire    Block_entry_proc_proc514_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc514_U0_ap_return;
wire    ap_channel_done_sums_2;
wire    sums_2_full_n;
wire    tdf4_accum_4_3_U0_ap_start;
wire    tdf4_accum_4_3_U0_ap_done;
wire    tdf4_accum_4_3_U0_ap_continue;
wire    tdf4_accum_4_3_U0_ap_idle;
wire    tdf4_accum_4_3_U0_ap_ready;
wire   [15:0] tdf4_accum_4_3_U0_accum_in_0;
wire    tdf4_accum_4_3_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_220_channel;
wire    tmp_220_channel_full_n;
wire    Block_entry_proc_proc515_U0_ap_start;
wire    Block_entry_proc_proc515_U0_ap_done;
wire    Block_entry_proc_proc515_U0_ap_continue;
wire    Block_entry_proc_proc515_U0_ap_idle;
wire    Block_entry_proc_proc515_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc515_U0_ap_return;
wire    ap_channel_done_sums_3;
wire    sums_3_full_n;
wire    tdf4_adjust_U0_ap_start;
wire    tdf4_adjust_U0_ap_done;
wire    tdf4_adjust_U0_ap_continue;
wire    tdf4_adjust_U0_ap_idle;
wire    tdf4_adjust_U0_ap_ready;
wire   [6:0] tdf4_adjust_U0_adjustments_address0;
wire    tdf4_adjust_U0_adjustments_ce0;
wire    tdf4_adjust_U0_indices_23_read;
wire   [4:0] tdf4_adjust_U0_indices_23_out_din;
wire    tdf4_adjust_U0_indices_23_out_write;
wire   [15:0] tdf4_adjust_U0_ap_return_0;
wire   [15:0] tdf4_adjust_U0_ap_return_1;
wire   [15:0] tdf4_adjust_U0_ap_return_2;
wire   [15:0] tdf4_adjust_U0_ap_return_3;
wire    ap_channel_done_intermediate_fmaps_3;
wire    intermediate_fmaps_3_full_n;
reg    ap_sync_reg_channel_write_intermediate_fmaps_3;
wire    ap_sync_channel_write_intermediate_fmaps_3;
wire    ap_channel_done_intermediate_fmaps_2;
wire    intermediate_fmaps_2_full_n;
reg    ap_sync_reg_channel_write_intermediate_fmaps_2;
wire    ap_sync_channel_write_intermediate_fmaps_2;
wire    ap_channel_done_intermediate_fmaps_1;
wire    intermediate_fmaps_1_full_n;
reg    ap_sync_reg_channel_write_intermediate_fmaps_1;
wire    ap_sync_channel_write_intermediate_fmaps_1;
wire    ap_channel_done_intermediate_fmaps_0;
wire    intermediate_fmaps_0_full_n;
reg    ap_sync_reg_channel_write_intermediate_fmaps_0;
wire    ap_sync_channel_write_intermediate_fmaps_0;
wire    tdf4_l2_multiply34_U0_ap_start;
wire    tdf4_l2_multiply34_U0_ap_done;
wire    tdf4_l2_multiply34_U0_ap_continue;
wire    tdf4_l2_multiply34_U0_ap_idle;
wire    tdf4_l2_multiply34_U0_ap_ready;
wire   [9:0] tdf4_l2_multiply34_U0_l2_filter_data_0_address0;
wire    tdf4_l2_multiply34_U0_l2_filter_data_0_ce0;
wire   [9:0] tdf4_l2_multiply34_U0_l2_filter_data_0_address1;
wire    tdf4_l2_multiply34_U0_l2_filter_data_0_ce1;
wire   [9:0] tdf4_l2_multiply34_U0_l2_filter_data_1_address0;
wire    tdf4_l2_multiply34_U0_l2_filter_data_1_ce0;
wire   [9:0] tdf4_l2_multiply34_U0_l2_filter_data_1_address1;
wire    tdf4_l2_multiply34_U0_l2_filter_data_1_ce1;
wire   [3:0] tdf4_l2_multiply34_U0_l2_products_0_address0;
wire    tdf4_l2_multiply34_U0_l2_products_0_ce0;
wire    tdf4_l2_multiply34_U0_l2_products_0_we0;
wire   [15:0] tdf4_l2_multiply34_U0_l2_products_0_d0;
wire   [3:0] tdf4_l2_multiply34_U0_l2_products_1_address0;
wire    tdf4_l2_multiply34_U0_l2_products_1_ce0;
wire    tdf4_l2_multiply34_U0_l2_products_1_we0;
wire   [15:0] tdf4_l2_multiply34_U0_l2_products_1_d0;
wire   [3:0] tdf4_l2_multiply34_U0_l2_products_2_address0;
wire    tdf4_l2_multiply34_U0_l2_products_2_ce0;
wire    tdf4_l2_multiply34_U0_l2_products_2_we0;
wire   [15:0] tdf4_l2_multiply34_U0_l2_products_2_d0;
wire   [3:0] tdf4_l2_multiply34_U0_l2_products_3_address0;
wire    tdf4_l2_multiply34_U0_l2_products_3_ce0;
wire    tdf4_l2_multiply34_U0_l2_products_3_we0;
wire   [15:0] tdf4_l2_multiply34_U0_l2_products_3_d0;
wire    tdf4_l2_multiply34_U0_indices_23_read;
wire    ap_channel_done_l2_products_3;
wire    tdf4_l2_multiply34_U0_l2_products_3_full_n;
reg    ap_sync_reg_channel_write_l2_products_3;
wire    ap_sync_channel_write_l2_products_3;
wire    ap_channel_done_l2_products_2;
wire    tdf4_l2_multiply34_U0_l2_products_2_full_n;
reg    ap_sync_reg_channel_write_l2_products_2;
wire    ap_sync_channel_write_l2_products_2;
wire    ap_channel_done_l2_products_1;
wire    tdf4_l2_multiply34_U0_l2_products_1_full_n;
reg    ap_sync_reg_channel_write_l2_products_1;
wire    ap_sync_channel_write_l2_products_1;
wire    ap_channel_done_l2_products_0;
wire    tdf4_l2_multiply34_U0_l2_products_0_full_n;
reg    ap_sync_reg_channel_write_l2_products_0;
wire    ap_sync_channel_write_l2_products_0;
wire    tdf4_l2_accum_U0_ap_start;
wire    tdf4_l2_accum_U0_ap_done;
wire    tdf4_l2_accum_U0_ap_continue;
wire    tdf4_l2_accum_U0_ap_idle;
wire    tdf4_l2_accum_U0_ap_ready;
wire   [3:0] tdf4_l2_accum_U0_l2_products_0_address0;
wire    tdf4_l2_accum_U0_l2_products_0_ce0;
wire   [3:0] tdf4_l2_accum_U0_l2_products_0_address1;
wire    tdf4_l2_accum_U0_l2_products_0_ce1;
wire   [3:0] tdf4_l2_accum_U0_l2_products_1_address0;
wire    tdf4_l2_accum_U0_l2_products_1_ce0;
wire   [3:0] tdf4_l2_accum_U0_l2_products_1_address1;
wire    tdf4_l2_accum_U0_l2_products_1_ce1;
wire   [3:0] tdf4_l2_accum_U0_l2_products_2_address0;
wire    tdf4_l2_accum_U0_l2_products_2_ce0;
wire   [3:0] tdf4_l2_accum_U0_l2_products_2_address1;
wire    tdf4_l2_accum_U0_l2_products_2_ce1;
wire   [3:0] tdf4_l2_accum_U0_l2_products_3_address0;
wire    tdf4_l2_accum_U0_l2_products_3_ce0;
wire   [3:0] tdf4_l2_accum_U0_l2_products_3_address1;
wire    tdf4_l2_accum_U0_l2_products_3_ce1;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_0_address0;
wire    tdf4_l2_accum_U0_l2_partial_sums_0_ce0;
wire    tdf4_l2_accum_U0_l2_partial_sums_0_we0;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_0_d0;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_0_address1;
wire    tdf4_l2_accum_U0_l2_partial_sums_0_ce1;
wire    tdf4_l2_accum_U0_l2_partial_sums_0_we1;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_0_d1;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_1_address0;
wire    tdf4_l2_accum_U0_l2_partial_sums_1_ce0;
wire    tdf4_l2_accum_U0_l2_partial_sums_1_we0;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_1_d0;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_1_address1;
wire    tdf4_l2_accum_U0_l2_partial_sums_1_ce1;
wire    tdf4_l2_accum_U0_l2_partial_sums_1_we1;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_1_d1;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_2_address0;
wire    tdf4_l2_accum_U0_l2_partial_sums_2_ce0;
wire    tdf4_l2_accum_U0_l2_partial_sums_2_we0;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_2_d0;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_2_address1;
wire    tdf4_l2_accum_U0_l2_partial_sums_2_ce1;
wire    tdf4_l2_accum_U0_l2_partial_sums_2_we1;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_2_d1;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_3_address0;
wire    tdf4_l2_accum_U0_l2_partial_sums_3_ce0;
wire    tdf4_l2_accum_U0_l2_partial_sums_3_we0;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_3_d0;
wire   [1:0] tdf4_l2_accum_U0_l2_partial_sums_3_address1;
wire    tdf4_l2_accum_U0_l2_partial_sums_3_ce1;
wire    tdf4_l2_accum_U0_l2_partial_sums_3_we1;
wire   [15:0] tdf4_l2_accum_U0_l2_partial_sums_3_d1;
wire    ap_channel_done_l2_partial_sums_3;
wire    tdf4_l2_accum_U0_l2_partial_sums_3_full_n;
reg    ap_sync_reg_channel_write_l2_partial_sums_3;
wire    ap_sync_channel_write_l2_partial_sums_3;
wire    ap_channel_done_l2_partial_sums_2;
wire    tdf4_l2_accum_U0_l2_partial_sums_2_full_n;
reg    ap_sync_reg_channel_write_l2_partial_sums_2;
wire    ap_sync_channel_write_l2_partial_sums_2;
wire    ap_channel_done_l2_partial_sums_1;
wire    tdf4_l2_accum_U0_l2_partial_sums_1_full_n;
reg    ap_sync_reg_channel_write_l2_partial_sums_1;
wire    ap_sync_channel_write_l2_partial_sums_1;
wire    ap_channel_done_l2_partial_sums_0;
wire    tdf4_l2_accum_U0_l2_partial_sums_0_full_n;
reg    ap_sync_reg_channel_write_l2_partial_sums_0;
wire    ap_sync_channel_write_l2_partial_sums_0;
wire    tdf4_l2_writeOutputs_1_U0_ap_start;
wire    tdf4_l2_writeOutputs_1_U0_ap_done;
wire    tdf4_l2_writeOutputs_1_U0_ap_continue;
wire    tdf4_l2_writeOutputs_1_U0_ap_idle;
wire    tdf4_l2_writeOutputs_1_U0_ap_ready;
wire    tdf4_l2_writeOutputs_1_U0_indices_01_read;
wire    tdf4_l2_writeOutputs_1_U0_indices_12_read;
wire    tdf4_l2_writeOutputs_1_U0_write4_read;
wire   [1:0] tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_address0;
wire    tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_ce0;
wire   [1:0] tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_address0;
wire    tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_ce0;
wire   [1:0] tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_address0;
wire    tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_ce0;
wire   [1:0] tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_address0;
wire    tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_ce0;
wire   [13:0] tdf4_l2_writeOutputs_1_U0_out_data_address1;
wire    tdf4_l2_writeOutputs_1_U0_out_data_ce1;
wire    tdf4_l2_writeOutputs_1_U0_out_data_we1;
wire   [63:0] tdf4_l2_writeOutputs_1_U0_out_data_d1;
wire   [3:0] tdf4_l2_writeOutputs_1_U0_l2_adjustments_address0;
wire    tdf4_l2_writeOutputs_1_U0_l2_adjustments_ce0;
wire    tdf4_l2_writeOutputs_1_U0_out_data_full_n;
wire    tdf4_l2_writeOutputs_1_U0_out_data_write;
wire    ap_sync_continue;
wire    ifmap_vec_0_i_full_n;
wire    ifmap_vec_0_t_empty_n;
wire    ifmap_vec_1_i_full_n;
wire    ifmap_vec_1_t_empty_n;
wire    ifmap_vec_2_i_full_n;
wire    ifmap_vec_2_t_empty_n;
wire    ifmap_vec_3_i_full_n;
wire    ifmap_vec_3_t_empty_n;
wire    weight_vecs_0_0_i_full_n;
wire    weight_vecs_0_0_t_empty_n;
wire    weight_vecs_0_1_i_full_n;
wire    weight_vecs_0_1_t_empty_n;
wire    weight_vecs_0_2_i_full_n;
wire    weight_vecs_0_2_t_empty_n;
wire    weight_vecs_0_3_i_full_n;
wire    weight_vecs_0_3_t_empty_n;
wire    weight_vecs_1_0_i_full_n;
wire    weight_vecs_1_0_t_empty_n;
wire    weight_vecs_1_1_i_full_n;
wire    weight_vecs_1_1_t_empty_n;
wire    weight_vecs_1_2_i_full_n;
wire    weight_vecs_1_2_t_empty_n;
wire    weight_vecs_1_3_i_full_n;
wire    weight_vecs_1_3_t_empty_n;
wire    weight_vecs_2_0_i_full_n;
wire    weight_vecs_2_0_t_empty_n;
wire    weight_vecs_2_1_i_full_n;
wire    weight_vecs_2_1_t_empty_n;
wire    weight_vecs_2_2_i_full_n;
wire    weight_vecs_2_2_t_empty_n;
wire    weight_vecs_2_3_i_full_n;
wire    weight_vecs_2_3_t_empty_n;
wire    weight_vecs_3_0_i_full_n;
wire    weight_vecs_3_0_t_empty_n;
wire    weight_vecs_3_1_i_full_n;
wire    weight_vecs_3_1_t_empty_n;
wire    weight_vecs_3_2_i_full_n;
wire    weight_vecs_3_2_t_empty_n;
wire    weight_vecs_3_3_i_full_n;
wire    weight_vecs_3_3_t_empty_n;
wire    products_0_0_i_full_n;
wire    products_0_0_t_empty_n;
wire   [15:0] products_0_0_t_d1;
wire    products_0_0_t_we1;
wire    products_0_1_i_full_n;
wire    products_0_1_t_empty_n;
wire   [15:0] products_0_1_t_d1;
wire    products_0_1_t_we1;
wire    products_0_2_i_full_n;
wire    products_0_2_t_empty_n;
wire   [15:0] products_0_2_t_d1;
wire    products_0_2_t_we1;
wire    products_0_3_i_full_n;
wire    products_0_3_t_empty_n;
wire   [15:0] products_0_3_t_d1;
wire    products_0_3_t_we1;
wire    products_1_0_i_full_n;
wire    products_1_0_t_empty_n;
wire   [15:0] products_1_0_t_d1;
wire    products_1_0_t_we1;
wire    products_1_1_i_full_n;
wire    products_1_1_t_empty_n;
wire   [15:0] products_1_1_t_d1;
wire    products_1_1_t_we1;
wire    products_1_2_i_full_n;
wire    products_1_2_t_empty_n;
wire   [15:0] products_1_2_t_d1;
wire    products_1_2_t_we1;
wire    products_1_3_i_full_n;
wire    products_1_3_t_empty_n;
wire   [15:0] products_1_3_t_d1;
wire    products_1_3_t_we1;
wire    products_2_0_i_full_n;
wire    products_2_0_t_empty_n;
wire   [15:0] products_2_0_t_d1;
wire    products_2_0_t_we1;
wire    products_2_1_i_full_n;
wire    products_2_1_t_empty_n;
wire   [15:0] products_2_1_t_d1;
wire    products_2_1_t_we1;
wire    products_2_2_i_full_n;
wire    products_2_2_t_empty_n;
wire   [15:0] products_2_2_t_d1;
wire    products_2_2_t_we1;
wire    products_2_3_i_full_n;
wire    products_2_3_t_empty_n;
wire   [15:0] products_2_3_t_d1;
wire    products_2_3_t_we1;
wire    products_3_0_i_full_n;
wire    products_3_0_t_empty_n;
wire   [15:0] products_3_0_t_d1;
wire    products_3_0_t_we1;
wire    products_3_1_i_full_n;
wire    products_3_1_t_empty_n;
wire   [15:0] products_3_1_t_d1;
wire    products_3_1_t_we1;
wire    products_3_2_i_full_n;
wire    products_3_2_t_empty_n;
wire   [15:0] products_3_2_t_d1;
wire    products_3_2_t_we1;
wire    products_3_3_i_full_n;
wire    products_3_3_t_empty_n;
wire   [15:0] products_3_3_t_d1;
wire    products_3_3_t_we1;
wire    accum1_out_0_i_full_n;
wire    accum1_out_0_t_empty_n;
wire    accum1_out_1_i_full_n;
wire    accum1_out_1_t_empty_n;
wire    accum1_out_2_i_full_n;
wire    accum1_out_2_t_empty_n;
wire    accum1_out_3_i_full_n;
wire    accum1_out_3_t_empty_n;
wire    accum2_out_0_i_full_n;
wire    accum2_out_0_t_empty_n;
wire    accum2_out_1_i_full_n;
wire    accum2_out_1_t_empty_n;
wire    accum2_out_2_i_full_n;
wire    accum2_out_2_t_empty_n;
wire    accum2_out_3_i_full_n;
wire    accum2_out_3_t_empty_n;
wire    l2_products_0_i_full_n;
wire    l2_products_0_t_empty_n;
wire   [15:0] l2_products_0_t_d1;
wire    l2_products_0_t_we1;
wire    l2_products_1_i_full_n;
wire    l2_products_1_t_empty_n;
wire   [15:0] l2_products_1_t_d1;
wire    l2_products_1_t_we1;
wire    l2_products_2_i_full_n;
wire    l2_products_2_t_empty_n;
wire   [15:0] l2_products_2_t_d1;
wire    l2_products_2_t_we1;
wire    l2_products_3_i_full_n;
wire    l2_products_3_t_empty_n;
wire   [15:0] l2_products_3_t_d1;
wire    l2_products_3_t_we1;
wire    l2_partial_sums_0_i_full_n;
wire    l2_partial_sums_0_t_empty_n;
wire    l2_partial_sums_1_i_full_n;
wire    l2_partial_sums_1_t_empty_n;
wire    l2_partial_sums_2_i_full_n;
wire    l2_partial_sums_2_t_empty_n;
wire    l2_partial_sums_3_i_full_n;
wire    l2_partial_sums_3_t_empty_n;
wire    indices_01_c_full_n;
wire   [15:0] indices_01_c_dout;
wire    indices_01_c_empty_n;
wire    indices_12_c_full_n;
wire   [15:0] indices_12_c_dout;
wire    indices_12_c_empty_n;
wire    indices_23_c_full_n;
wire   [4:0] indices_23_c_dout;
wire    indices_23_c_empty_n;
wire    indices_23_c1_full_n;
wire   [4:0] indices_23_c1_dout;
wire    indices_23_c1_empty_n;
wire   [0:0] write4_c_din;
wire    write4_c_full_n;
wire   [0:0] write4_c_dout;
wire    write4_c_empty_n;
wire    indices_01_c2_full_n;
wire   [5:0] indices_01_c2_dout;
wire    indices_01_c2_empty_n;
wire    indices_12_c3_full_n;
wire   [11:0] indices_12_c3_dout;
wire    indices_12_c3_empty_n;
wire   [15:0] accum3_out_0_0_dout;
wire    accum3_out_0_0_empty_n;
wire   [15:0] accum3_out_0_1_dout;
wire    accum3_out_0_1_empty_n;
wire   [15:0] accum3_out_0_2_dout;
wire    accum3_out_0_2_empty_n;
wire   [15:0] accum3_out_0_3_dout;
wire    accum3_out_0_3_empty_n;
wire   [15:0] accum3_out_1_0_dout;
wire    accum3_out_1_0_empty_n;
wire   [15:0] accum3_out_1_1_dout;
wire    accum3_out_1_1_empty_n;
wire   [15:0] accum3_out_1_2_dout;
wire    accum3_out_1_2_empty_n;
wire   [15:0] accum3_out_1_3_dout;
wire    accum3_out_1_3_empty_n;
wire   [15:0] accum3_out_2_0_dout;
wire    accum3_out_2_0_empty_n;
wire   [15:0] accum3_out_2_1_dout;
wire    accum3_out_2_1_empty_n;
wire   [15:0] accum3_out_2_2_dout;
wire    accum3_out_2_2_empty_n;
wire   [15:0] accum3_out_2_3_dout;
wire    accum3_out_2_3_empty_n;
wire   [15:0] accum3_out_3_0_dout;
wire    accum3_out_3_0_empty_n;
wire   [15:0] accum3_out_3_1_dout;
wire    accum3_out_3_1_empty_n;
wire   [15:0] accum3_out_3_2_dout;
wire    accum3_out_3_2_empty_n;
wire   [15:0] accum3_out_3_3_dout;
wire    accum3_out_3_3_empty_n;
wire   [15:0] tmp_channel_dout;
wire    tmp_channel_empty_n;
wire   [15:0] sums_0_dout;
wire    sums_0_empty_n;
wire   [15:0] tmp_218_channel_dout;
wire    tmp_218_channel_empty_n;
wire   [15:0] sums_1_dout;
wire    sums_1_empty_n;
wire   [15:0] tmp_219_channel_dout;
wire    tmp_219_channel_empty_n;
wire   [15:0] sums_2_dout;
wire    sums_2_empty_n;
wire   [15:0] tmp_220_channel_dout;
wire    tmp_220_channel_empty_n;
wire   [15:0] sums_3_dout;
wire    sums_3_empty_n;
wire    indices_23_c4_full_n;
wire   [4:0] indices_23_c4_dout;
wire    indices_23_c4_empty_n;
wire   [15:0] intermediate_fmaps_0_dout;
wire    intermediate_fmaps_0_empty_n;
wire   [15:0] intermediate_fmaps_1_dout;
wire    intermediate_fmaps_1_empty_n;
wire   [15:0] intermediate_fmaps_2_dout;
wire    intermediate_fmaps_2_empty_n;
wire   [15:0] intermediate_fmaps_3_dout;
wire    intermediate_fmaps_3_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready;
wire    ap_sync_tdf4_get_next_ijk_U0_ap_ready;
reg    ap_sync_reg_tdf4_readInputs37_U0_ap_ready;
wire    ap_sync_tdf4_readInputs37_U0_ap_ready;
wire   [0:0] start_for_tdf4_readFilters36_U0_din;
wire    start_for_tdf4_readFilters36_U0_full_n;
wire   [0:0] start_for_tdf4_readFilters36_U0_dout;
wire    start_for_tdf4_readFilters36_U0_empty_n;
wire    tdf4_readInputs37_U0_start_full_n;
wire    tdf4_readInputs37_U0_start_write;
wire    tdf4_readFilters36_U0_start_full_n;
wire    tdf4_readFilters36_U0_start_write;
wire    tdf4_dot_product_U0_start_full_n;
wire    tdf4_dot_product_U0_start_write;
wire    tdf4_accum_1_U0_start_full_n;
wire    tdf4_accum_1_U0_start_write;
wire    tdf4_accum_1_U1_1_start_full_n;
wire    tdf4_accum_1_U1_1_start_write;
wire    tdf4_accum_1_U2_2_start_full_n;
wire    tdf4_accum_1_U2_2_start_write;
wire    tdf4_accum_1_U3_3_start_full_n;
wire    tdf4_accum_1_U3_3_start_write;
wire    tdf4_accum_2_U0_start_full_n;
wire    tdf4_accum_2_U0_start_write;
wire    tdf4_accum_2_U1_1_start_full_n;
wire    tdf4_accum_2_U1_1_start_write;
wire    tdf4_accum_2_U2_2_start_full_n;
wire    tdf4_accum_2_U2_2_start_write;
wire    tdf4_accum_2_U3_3_start_full_n;
wire    tdf4_accum_2_U3_3_start_write;
wire    tdf4_accum_3_U0_start_full_n;
wire    tdf4_accum_3_U0_start_write;
wire    tdf4_accum_3_1_U0_start_full_n;
wire    tdf4_accum_3_1_U0_start_write;
wire    tdf4_accum_3_2_U0_start_full_n;
wire    tdf4_accum_3_2_U0_start_write;
wire    tdf4_accum_3_3_U0_start_full_n;
wire    tdf4_accum_3_3_U0_start_write;
wire    tdf4_accum_4_U0_start_full_n;
wire    tdf4_accum_4_U0_start_write;
wire    Block_entry_proc_proc512_U0_start_full_n;
wire    Block_entry_proc_proc512_U0_start_write;
wire    tdf4_accum_4_1_U0_start_full_n;
wire    tdf4_accum_4_1_U0_start_write;
wire    Block_entry_proc_proc513_U0_start_full_n;
wire    Block_entry_proc_proc513_U0_start_write;
wire    tdf4_accum_4_2_U0_start_full_n;
wire    tdf4_accum_4_2_U0_start_write;
wire    Block_entry_proc_proc514_U0_start_full_n;
wire    Block_entry_proc_proc514_U0_start_write;
wire    tdf4_accum_4_3_U0_start_full_n;
wire    tdf4_accum_4_3_U0_start_write;
wire    Block_entry_proc_proc515_U0_start_full_n;
wire    Block_entry_proc_proc515_U0_start_write;
wire    tdf4_adjust_U0_start_full_n;
wire    tdf4_adjust_U0_start_write;
wire    tdf4_l2_multiply34_U0_start_full_n;
wire    tdf4_l2_multiply34_U0_start_write;
wire    tdf4_l2_accum_U0_start_full_n;
wire    tdf4_l2_accum_U0_start_write;
wire    tdf4_l2_writeOutputs_1_U0_start_full_n;
wire    tdf4_l2_writeOutputs_1_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_ifmap_vec_3 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_2 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_1 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_3 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_2 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_3 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_2 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_3 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_2 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_3 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_2 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_3 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_2 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_3 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_2 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_3 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_2 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_3 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_2 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_0_3 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_0_2 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_1_3 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_1_2 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_2_3 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_2_2 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_2_1 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_2_0 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_3_3 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_3_2 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_3_1 = 1'b0;
#0 ap_sync_reg_channel_write_accum3_out_3_0 = 1'b0;
#0 ap_sync_reg_channel_write_intermediate_fmaps_3 = 1'b0;
#0 ap_sync_reg_channel_write_intermediate_fmaps_2 = 1'b0;
#0 ap_sync_reg_channel_write_intermediate_fmaps_1 = 1'b0;
#0 ap_sync_reg_channel_write_intermediate_fmaps_0 = 1'b0;
#0 ap_sync_reg_channel_write_l2_products_3 = 1'b0;
#0 ap_sync_reg_channel_write_l2_products_2 = 1'b0;
#0 ap_sync_reg_channel_write_l2_products_1 = 1'b0;
#0 ap_sync_reg_channel_write_l2_products_0 = 1'b0;
#0 ap_sync_reg_channel_write_l2_partial_sums_3 = 1'b0;
#0 ap_sync_reg_channel_write_l2_partial_sums_2 = 1'b0;
#0 ap_sync_reg_channel_write_l2_partial_sums_1 = 1'b0;
#0 ap_sync_reg_channel_write_l2_partial_sums_0 = 1'b0;
#0 ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf4_readInputs37_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
ifmap_vec_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_0),
    .i_full_n(ifmap_vec_0_i_full_n),
    .i_ce0(tdf4_readInputs37_U0_ifmap_vec_0_ce0),
    .i_we0(tdf4_readInputs37_U0_ifmap_vec_0_we0),
    .i_address0(tdf4_readInputs37_U0_ifmap_vec_0_address0),
    .i_d0(tdf4_readInputs37_U0_ifmap_vec_0_d0),
    .i_q0(ifmap_vec_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_ifmap_vec_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_ifmap_vec_0_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
ifmap_vec_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_1),
    .i_full_n(ifmap_vec_1_i_full_n),
    .i_ce0(tdf4_readInputs37_U0_ifmap_vec_1_ce0),
    .i_we0(tdf4_readInputs37_U0_ifmap_vec_1_we0),
    .i_address0(tdf4_readInputs37_U0_ifmap_vec_1_address0),
    .i_d0(tdf4_readInputs37_U0_ifmap_vec_1_d0),
    .i_q0(ifmap_vec_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_1_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_ifmap_vec_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_ifmap_vec_1_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
ifmap_vec_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_2),
    .i_full_n(ifmap_vec_2_i_full_n),
    .i_ce0(tdf4_readInputs37_U0_ifmap_vec_2_ce0),
    .i_we0(tdf4_readInputs37_U0_ifmap_vec_2_we0),
    .i_address0(tdf4_readInputs37_U0_ifmap_vec_2_address0),
    .i_d0(tdf4_readInputs37_U0_ifmap_vec_2_d0),
    .i_q0(ifmap_vec_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_2_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_ifmap_vec_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_ifmap_vec_2_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
ifmap_vec_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_3),
    .i_full_n(ifmap_vec_3_i_full_n),
    .i_ce0(tdf4_readInputs37_U0_ifmap_vec_3_ce0),
    .i_we0(tdf4_readInputs37_U0_ifmap_vec_3_we0),
    .i_address0(tdf4_readInputs37_U0_ifmap_vec_3_address0),
    .i_d0(tdf4_readInputs37_U0_ifmap_vec_3_d0),
    .i_q0(ifmap_vec_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_3_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_ifmap_vec_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_ifmap_vec_3_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_0),
    .i_full_n(weight_vecs_0_0_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_0_0_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_0_0_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_0_0_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_0_0_d0),
    .i_q0(weight_vecs_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_1),
    .i_full_n(weight_vecs_0_1_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_0_1_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_0_1_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_0_1_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_0_1_d0),
    .i_q0(weight_vecs_0_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_1_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_0_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_0_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_0_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_2),
    .i_full_n(weight_vecs_0_2_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_0_2_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_0_2_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_0_2_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_0_2_d0),
    .i_q0(weight_vecs_0_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_2_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_0_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_0_2_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_0_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_3),
    .i_full_n(weight_vecs_0_3_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_0_3_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_0_3_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_0_3_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_0_3_d0),
    .i_q0(weight_vecs_0_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_3_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_0_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_0_3_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_0),
    .i_full_n(weight_vecs_1_0_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_1_0_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_1_0_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_1_0_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_1_0_d0),
    .i_q0(weight_vecs_1_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_1_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_1_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_1),
    .i_full_n(weight_vecs_1_1_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_1_1_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_1_1_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_1_1_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_1_1_d0),
    .i_q0(weight_vecs_1_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_1_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_1_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_1_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_1_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_2),
    .i_full_n(weight_vecs_1_2_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_1_2_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_1_2_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_1_2_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_1_2_d0),
    .i_q0(weight_vecs_1_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_2_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_1_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_1_2_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_1_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_3),
    .i_full_n(weight_vecs_1_3_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_1_3_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_1_3_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_1_3_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_1_3_d0),
    .i_q0(weight_vecs_1_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_3_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_1_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_1_3_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_0),
    .i_full_n(weight_vecs_2_0_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_2_0_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_2_0_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_2_0_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_2_0_d0),
    .i_q0(weight_vecs_2_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_2_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_2_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_1),
    .i_full_n(weight_vecs_2_1_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_2_1_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_2_1_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_2_1_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_2_1_d0),
    .i_q0(weight_vecs_2_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_1_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_2_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_2_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_2_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_2),
    .i_full_n(weight_vecs_2_2_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_2_2_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_2_2_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_2_2_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_2_2_d0),
    .i_q0(weight_vecs_2_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_2_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_2_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_2_2_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_2_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_3),
    .i_full_n(weight_vecs_2_3_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_2_3_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_2_3_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_2_3_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_2_3_d0),
    .i_q0(weight_vecs_2_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_3_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_2_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_2_3_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_0),
    .i_full_n(weight_vecs_3_0_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_3_0_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_3_0_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_3_0_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_3_0_d0),
    .i_q0(weight_vecs_3_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_3_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_3_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_1),
    .i_full_n(weight_vecs_3_1_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_3_1_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_3_1_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_3_1_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_3_1_d0),
    .i_q0(weight_vecs_3_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_1_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_3_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_3_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_3_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_2),
    .i_full_n(weight_vecs_3_2_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_3_2_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_3_2_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_3_2_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_3_2_d0),
    .i_q0(weight_vecs_3_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_2_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_3_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_3_2_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
weight_vecs_3_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_3),
    .i_full_n(weight_vecs_3_3_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_3_3_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_3_3_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_3_3_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_3_3_d0),
    .i_q0(weight_vecs_3_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_3_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_3_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_3_3_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_0),
    .i_full_n(products_0_0_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_0_0_ce0),
    .i_we0(tdf4_dot_product_U0_products_0_0_we0),
    .i_address0(tdf4_dot_product_U0_products_0_0_address0),
    .i_d0(tdf4_dot_product_U0_products_0_0_d0),
    .i_q0(products_0_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U0_ap_ready),
    .t_empty_n(products_0_0_t_empty_n),
    .t_ce0(tdf4_accum_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_0_0_t_q0),
    .t_ce1(tdf4_accum_1_U0_accum_in_ce1),
    .t_address1(tdf4_accum_1_U0_accum_in_address1),
    .t_q1(products_0_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_1),
    .i_full_n(products_0_1_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_0_1_ce0),
    .i_we0(tdf4_dot_product_U0_products_0_1_we0),
    .i_address0(tdf4_dot_product_U0_products_0_1_address0),
    .i_d0(tdf4_dot_product_U0_products_0_1_d0),
    .i_q0(products_0_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U0_ap_ready),
    .t_empty_n(products_0_1_t_empty_n),
    .t_ce0(tdf4_accum_1_U0_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U0_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_0_1_t_q0),
    .t_ce1(tdf4_accum_1_U0_accum_in1_ce1),
    .t_address1(tdf4_accum_1_U0_accum_in1_address1),
    .t_q1(products_0_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_0_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_2),
    .i_full_n(products_0_2_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_0_2_ce0),
    .i_we0(tdf4_dot_product_U0_products_0_2_we0),
    .i_address0(tdf4_dot_product_U0_products_0_2_address0),
    .i_d0(tdf4_dot_product_U0_products_0_2_d0),
    .i_q0(products_0_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U0_ap_ready),
    .t_empty_n(products_0_2_t_empty_n),
    .t_ce0(tdf4_accum_1_U0_accum_in2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U0_accum_in2_address0),
    .t_d0(16'd0),
    .t_q0(products_0_2_t_q0),
    .t_ce1(tdf4_accum_1_U0_accum_in2_ce1),
    .t_address1(tdf4_accum_1_U0_accum_in2_address1),
    .t_q1(products_0_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_0_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_3),
    .i_full_n(products_0_3_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_0_3_ce0),
    .i_we0(tdf4_dot_product_U0_products_0_3_we0),
    .i_address0(tdf4_dot_product_U0_products_0_3_address0),
    .i_d0(tdf4_dot_product_U0_products_0_3_d0),
    .i_q0(products_0_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U0_ap_ready),
    .t_empty_n(products_0_3_t_empty_n),
    .t_ce0(tdf4_accum_1_U0_accum_in3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U0_accum_in3_address0),
    .t_d0(16'd0),
    .t_q0(products_0_3_t_q0),
    .t_ce1(tdf4_accum_1_U0_accum_in3_ce1),
    .t_address1(tdf4_accum_1_U0_accum_in3_address1),
    .t_q1(products_0_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_0),
    .i_full_n(products_1_0_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_1_0_ce0),
    .i_we0(tdf4_dot_product_U0_products_1_0_we0),
    .i_address0(tdf4_dot_product_U0_products_1_0_address0),
    .i_d0(tdf4_dot_product_U0_products_1_0_d0),
    .i_q0(products_1_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_0_t_empty_n),
    .t_ce0(tdf4_accum_1_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_1_0_t_q0),
    .t_ce1(tdf4_accum_1_U1_1_accum_in_ce1),
    .t_address1(tdf4_accum_1_U1_1_accum_in_address1),
    .t_q1(products_1_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_1),
    .i_full_n(products_1_1_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_1_1_ce0),
    .i_we0(tdf4_dot_product_U0_products_1_1_we0),
    .i_address0(tdf4_dot_product_U0_products_1_1_address0),
    .i_d0(tdf4_dot_product_U0_products_1_1_d0),
    .i_q0(products_1_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_1_t_empty_n),
    .t_ce0(tdf4_accum_1_U1_1_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U1_1_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_1_1_t_q0),
    .t_ce1(tdf4_accum_1_U1_1_accum_in1_ce1),
    .t_address1(tdf4_accum_1_U1_1_accum_in1_address1),
    .t_q1(products_1_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_1_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_2),
    .i_full_n(products_1_2_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_1_2_ce0),
    .i_we0(tdf4_dot_product_U0_products_1_2_we0),
    .i_address0(tdf4_dot_product_U0_products_1_2_address0),
    .i_d0(tdf4_dot_product_U0_products_1_2_d0),
    .i_q0(products_1_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_2_t_empty_n),
    .t_ce0(tdf4_accum_1_U1_1_accum_in2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U1_1_accum_in2_address0),
    .t_d0(16'd0),
    .t_q0(products_1_2_t_q0),
    .t_ce1(tdf4_accum_1_U1_1_accum_in2_ce1),
    .t_address1(tdf4_accum_1_U1_1_accum_in2_address1),
    .t_q1(products_1_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_1_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_3),
    .i_full_n(products_1_3_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_1_3_ce0),
    .i_we0(tdf4_dot_product_U0_products_1_3_we0),
    .i_address0(tdf4_dot_product_U0_products_1_3_address0),
    .i_d0(tdf4_dot_product_U0_products_1_3_d0),
    .i_q0(products_1_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_3_t_empty_n),
    .t_ce0(tdf4_accum_1_U1_1_accum_in3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U1_1_accum_in3_address0),
    .t_d0(16'd0),
    .t_q0(products_1_3_t_q0),
    .t_ce1(tdf4_accum_1_U1_1_accum_in3_ce1),
    .t_address1(tdf4_accum_1_U1_1_accum_in3_address1),
    .t_q1(products_1_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_0),
    .i_full_n(products_2_0_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_2_0_ce0),
    .i_we0(tdf4_dot_product_U0_products_2_0_we0),
    .i_address0(tdf4_dot_product_U0_products_2_0_address0),
    .i_d0(tdf4_dot_product_U0_products_2_0_d0),
    .i_q0(products_2_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_2_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_0_t_empty_n),
    .t_ce0(tdf4_accum_1_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_2_0_t_q0),
    .t_ce1(tdf4_accum_1_U2_2_accum_in_ce1),
    .t_address1(tdf4_accum_1_U2_2_accum_in_address1),
    .t_q1(products_2_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_1),
    .i_full_n(products_2_1_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_2_1_ce0),
    .i_we0(tdf4_dot_product_U0_products_2_1_we0),
    .i_address0(tdf4_dot_product_U0_products_2_1_address0),
    .i_d0(tdf4_dot_product_U0_products_2_1_d0),
    .i_q0(products_2_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_2_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_1_t_empty_n),
    .t_ce0(tdf4_accum_1_U2_2_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U2_2_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_2_1_t_q0),
    .t_ce1(tdf4_accum_1_U2_2_accum_in1_ce1),
    .t_address1(tdf4_accum_1_U2_2_accum_in1_address1),
    .t_q1(products_2_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_2_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_2),
    .i_full_n(products_2_2_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_2_2_ce0),
    .i_we0(tdf4_dot_product_U0_products_2_2_we0),
    .i_address0(tdf4_dot_product_U0_products_2_2_address0),
    .i_d0(tdf4_dot_product_U0_products_2_2_d0),
    .i_q0(products_2_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_2_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_2_t_empty_n),
    .t_ce0(tdf4_accum_1_U2_2_accum_in2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U2_2_accum_in2_address0),
    .t_d0(16'd0),
    .t_q0(products_2_2_t_q0),
    .t_ce1(tdf4_accum_1_U2_2_accum_in2_ce1),
    .t_address1(tdf4_accum_1_U2_2_accum_in2_address1),
    .t_q1(products_2_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_2_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_3),
    .i_full_n(products_2_3_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_2_3_ce0),
    .i_we0(tdf4_dot_product_U0_products_2_3_we0),
    .i_address0(tdf4_dot_product_U0_products_2_3_address0),
    .i_d0(tdf4_dot_product_U0_products_2_3_d0),
    .i_q0(products_2_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_2_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_3_t_empty_n),
    .t_ce0(tdf4_accum_1_U2_2_accum_in3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U2_2_accum_in3_address0),
    .t_d0(16'd0),
    .t_q0(products_2_3_t_q0),
    .t_ce1(tdf4_accum_1_U2_2_accum_in3_ce1),
    .t_address1(tdf4_accum_1_U2_2_accum_in3_address1),
    .t_q1(products_2_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_0),
    .i_full_n(products_3_0_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_3_0_ce0),
    .i_we0(tdf4_dot_product_U0_products_3_0_we0),
    .i_address0(tdf4_dot_product_U0_products_3_0_address0),
    .i_d0(tdf4_dot_product_U0_products_3_0_d0),
    .i_q0(products_3_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_3_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_0_t_empty_n),
    .t_ce0(tdf4_accum_1_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_3_0_t_q0),
    .t_ce1(tdf4_accum_1_U3_3_accum_in_ce1),
    .t_address1(tdf4_accum_1_U3_3_accum_in_address1),
    .t_q1(products_3_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_1),
    .i_full_n(products_3_1_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_3_1_ce0),
    .i_we0(tdf4_dot_product_U0_products_3_1_we0),
    .i_address0(tdf4_dot_product_U0_products_3_1_address0),
    .i_d0(tdf4_dot_product_U0_products_3_1_d0),
    .i_q0(products_3_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_3_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_1_t_empty_n),
    .t_ce0(tdf4_accum_1_U3_3_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U3_3_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_3_1_t_q0),
    .t_ce1(tdf4_accum_1_U3_3_accum_in1_ce1),
    .t_address1(tdf4_accum_1_U3_3_accum_in1_address1),
    .t_q1(products_3_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_3_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_2),
    .i_full_n(products_3_2_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_3_2_ce0),
    .i_we0(tdf4_dot_product_U0_products_3_2_we0),
    .i_address0(tdf4_dot_product_U0_products_3_2_address0),
    .i_d0(tdf4_dot_product_U0_products_3_2_d0),
    .i_q0(products_3_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_3_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_2_t_empty_n),
    .t_ce0(tdf4_accum_1_U3_3_accum_in2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U3_3_accum_in2_address0),
    .t_d0(16'd0),
    .t_q0(products_3_2_t_q0),
    .t_ce1(tdf4_accum_1_U3_3_accum_in2_ce1),
    .t_address1(tdf4_accum_1_U3_3_accum_in2_address1),
    .t_q1(products_3_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 36 ),
    .AddressWidth( 6 ))
products_3_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_3),
    .i_full_n(products_3_3_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_3_3_ce0),
    .i_we0(tdf4_dot_product_U0_products_3_3_we0),
    .i_address0(tdf4_dot_product_U0_products_3_3_address0),
    .i_d0(tdf4_dot_product_U0_products_3_3_d0),
    .i_q0(products_3_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_3_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_3_t_empty_n),
    .t_ce0(tdf4_accum_1_U3_3_accum_in3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U3_3_accum_in3_address0),
    .t_d0(16'd0),
    .t_q0(products_3_3_t_q0),
    .t_ce1(tdf4_accum_1_U3_3_accum_in3_ce1),
    .t_address1(tdf4_accum_1_U3_3_accum_in3_address1),
    .t_q1(products_3_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
accum1_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_1_U0_ap_done),
    .i_full_n(accum1_out_0_i_full_n),
    .i_ce0(tdf4_accum_1_U0_accum_out_ce0),
    .i_we0(tdf4_accum_1_U0_accum_out_we0),
    .i_address0(tdf4_accum_1_U0_accum_out_address0),
    .i_d0(tdf4_accum_1_U0_accum_out_d0),
    .i_q0(accum1_out_0_i_q0),
    .i_ce1(tdf4_accum_1_U0_accum_out_ce1),
    .i_we1(tdf4_accum_1_U0_accum_out_we1),
    .i_address1(tdf4_accum_1_U0_accum_out_address1),
    .i_d1(tdf4_accum_1_U0_accum_out_d1),
    .i_q1(accum1_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf4_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(tdf4_accum_2_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_2_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
accum1_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_1_U1_1_ap_done),
    .i_full_n(accum1_out_1_i_full_n),
    .i_ce0(tdf4_accum_1_U1_1_accum_out_ce0),
    .i_we0(tdf4_accum_1_U1_1_accum_out_we0),
    .i_address0(tdf4_accum_1_U1_1_accum_out_address0),
    .i_d0(tdf4_accum_1_U1_1_accum_out_d0),
    .i_q0(accum1_out_1_i_q0),
    .i_ce1(tdf4_accum_1_U1_1_accum_out_ce1),
    .i_we1(tdf4_accum_1_U1_1_accum_out_we1),
    .i_address1(tdf4_accum_1_U1_1_accum_out_address1),
    .i_d1(tdf4_accum_1_U1_1_accum_out_d1),
    .i_q1(accum1_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_2_U1_1_ap_ready),
    .t_empty_n(accum1_out_1_t_empty_n),
    .t_ce0(tdf4_accum_2_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_2_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_1_t_q0),
    .t_ce1(tdf4_accum_2_U1_1_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_2_U1_1_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
accum1_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_1_U2_2_ap_done),
    .i_full_n(accum1_out_2_i_full_n),
    .i_ce0(tdf4_accum_1_U2_2_accum_out_ce0),
    .i_we0(tdf4_accum_1_U2_2_accum_out_we0),
    .i_address0(tdf4_accum_1_U2_2_accum_out_address0),
    .i_d0(tdf4_accum_1_U2_2_accum_out_d0),
    .i_q0(accum1_out_2_i_q0),
    .i_ce1(tdf4_accum_1_U2_2_accum_out_ce1),
    .i_we1(tdf4_accum_1_U2_2_accum_out_we1),
    .i_address1(tdf4_accum_1_U2_2_accum_out_address1),
    .i_d1(tdf4_accum_1_U2_2_accum_out_d1),
    .i_q1(accum1_out_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_2_U2_2_ap_ready),
    .t_empty_n(accum1_out_2_t_empty_n),
    .t_ce0(tdf4_accum_2_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_2_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_2_t_q0),
    .t_ce1(tdf4_accum_2_U2_2_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_2_U2_2_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
accum1_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_1_U3_3_ap_done),
    .i_full_n(accum1_out_3_i_full_n),
    .i_ce0(tdf4_accum_1_U3_3_accum_out_ce0),
    .i_we0(tdf4_accum_1_U3_3_accum_out_we0),
    .i_address0(tdf4_accum_1_U3_3_accum_out_address0),
    .i_d0(tdf4_accum_1_U3_3_accum_out_d0),
    .i_q0(accum1_out_3_i_q0),
    .i_ce1(tdf4_accum_1_U3_3_accum_out_ce1),
    .i_we1(tdf4_accum_1_U3_3_accum_out_we1),
    .i_address1(tdf4_accum_1_U3_3_accum_out_address1),
    .i_d1(tdf4_accum_1_U3_3_accum_out_d1),
    .i_q1(accum1_out_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_2_U3_3_ap_ready),
    .t_empty_n(accum1_out_3_t_empty_n),
    .t_ce0(tdf4_accum_2_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_2_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_3_t_q0),
    .t_ce1(tdf4_accum_2_U3_3_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_2_U3_3_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_2_U0_ap_done),
    .i_full_n(accum2_out_0_i_full_n),
    .i_ce0(tdf4_accum_2_U0_accum_out_ce0),
    .i_we0(tdf4_accum_2_U0_accum_out_we0),
    .i_address0(tdf4_accum_2_U0_accum_out_address0),
    .i_d0(tdf4_accum_2_U0_accum_out_d0),
    .i_q0(accum2_out_0_i_q0),
    .i_ce1(tdf4_accum_2_U0_accum_out_ce1),
    .i_we1(tdf4_accum_2_U0_accum_out_we1),
    .i_address1(tdf4_accum_2_U0_accum_out_address1),
    .i_d1(tdf4_accum_2_U0_accum_out_d1),
    .i_q1(accum2_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_3_U0_ap_ready),
    .t_empty_n(accum2_out_0_t_empty_n),
    .t_ce0(tdf4_accum_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_0_t_q0),
    .t_ce1(tdf4_accum_3_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_3_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum2_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_2_U1_1_ap_done),
    .i_full_n(accum2_out_1_i_full_n),
    .i_ce0(tdf4_accum_2_U1_1_accum_out_ce0),
    .i_we0(tdf4_accum_2_U1_1_accum_out_we0),
    .i_address0(tdf4_accum_2_U1_1_accum_out_address0),
    .i_d0(tdf4_accum_2_U1_1_accum_out_d0),
    .i_q0(accum2_out_1_i_q0),
    .i_ce1(tdf4_accum_2_U1_1_accum_out_ce1),
    .i_we1(tdf4_accum_2_U1_1_accum_out_we1),
    .i_address1(tdf4_accum_2_U1_1_accum_out_address1),
    .i_d1(tdf4_accum_2_U1_1_accum_out_d1),
    .i_q1(accum2_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_3_1_U0_ap_ready),
    .t_empty_n(accum2_out_1_t_empty_n),
    .t_ce0(tdf4_accum_3_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_3_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_1_t_q0),
    .t_ce1(tdf4_accum_3_1_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_3_1_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum2_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_2_U2_2_ap_done),
    .i_full_n(accum2_out_2_i_full_n),
    .i_ce0(tdf4_accum_2_U2_2_accum_out_ce0),
    .i_we0(tdf4_accum_2_U2_2_accum_out_we0),
    .i_address0(tdf4_accum_2_U2_2_accum_out_address0),
    .i_d0(tdf4_accum_2_U2_2_accum_out_d0),
    .i_q0(accum2_out_2_i_q0),
    .i_ce1(tdf4_accum_2_U2_2_accum_out_ce1),
    .i_we1(tdf4_accum_2_U2_2_accum_out_we1),
    .i_address1(tdf4_accum_2_U2_2_accum_out_address1),
    .i_d1(tdf4_accum_2_U2_2_accum_out_d1),
    .i_q1(accum2_out_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_3_2_U0_ap_ready),
    .t_empty_n(accum2_out_2_t_empty_n),
    .t_ce0(tdf4_accum_3_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_3_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_2_t_q0),
    .t_ce1(tdf4_accum_3_2_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_3_2_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum2_out_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_accum_2_U3_3_ap_done),
    .i_full_n(accum2_out_3_i_full_n),
    .i_ce0(tdf4_accum_2_U3_3_accum_out_ce0),
    .i_we0(tdf4_accum_2_U3_3_accum_out_we0),
    .i_address0(tdf4_accum_2_U3_3_accum_out_address0),
    .i_d0(tdf4_accum_2_U3_3_accum_out_d0),
    .i_q0(accum2_out_3_i_q0),
    .i_ce1(tdf4_accum_2_U3_3_accum_out_ce1),
    .i_we1(tdf4_accum_2_U3_3_accum_out_we1),
    .i_address1(tdf4_accum_2_U3_3_accum_out_address1),
    .i_d1(tdf4_accum_2_U3_3_accum_out_d1),
    .i_q1(accum2_out_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_3_3_U0_ap_ready),
    .t_empty_n(accum2_out_3_t_empty_n),
    .t_ce0(tdf4_accum_3_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_3_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_3_t_q0),
    .t_ce1(tdf4_accum_3_3_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf4_accum_3_3_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum2_out_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
l2_products_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_products_0),
    .i_full_n(l2_products_0_i_full_n),
    .i_ce0(tdf4_l2_multiply34_U0_l2_products_0_ce0),
    .i_we0(tdf4_l2_multiply34_U0_l2_products_0_we0),
    .i_address0(tdf4_l2_multiply34_U0_l2_products_0_address0),
    .i_d0(tdf4_l2_multiply34_U0_l2_products_0_d0),
    .i_q0(l2_products_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(l2_products_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_accum_U0_ap_ready),
    .t_empty_n(l2_products_0_t_empty_n),
    .t_ce0(tdf4_l2_accum_U0_l2_products_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_accum_U0_l2_products_0_address0),
    .t_d0(16'd0),
    .t_q0(l2_products_0_t_q0),
    .t_ce1(tdf4_l2_accum_U0_l2_products_0_ce1),
    .t_address1(tdf4_l2_accum_U0_l2_products_0_address1),
    .t_q1(l2_products_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
l2_products_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_products_1),
    .i_full_n(l2_products_1_i_full_n),
    .i_ce0(tdf4_l2_multiply34_U0_l2_products_1_ce0),
    .i_we0(tdf4_l2_multiply34_U0_l2_products_1_we0),
    .i_address0(tdf4_l2_multiply34_U0_l2_products_1_address0),
    .i_d0(tdf4_l2_multiply34_U0_l2_products_1_d0),
    .i_q0(l2_products_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(l2_products_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_accum_U0_ap_ready),
    .t_empty_n(l2_products_1_t_empty_n),
    .t_ce0(tdf4_l2_accum_U0_l2_products_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_accum_U0_l2_products_1_address0),
    .t_d0(16'd0),
    .t_q0(l2_products_1_t_q0),
    .t_ce1(tdf4_l2_accum_U0_l2_products_1_ce1),
    .t_address1(tdf4_l2_accum_U0_l2_products_1_address1),
    .t_q1(l2_products_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
l2_products_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_products_2),
    .i_full_n(l2_products_2_i_full_n),
    .i_ce0(tdf4_l2_multiply34_U0_l2_products_2_ce0),
    .i_we0(tdf4_l2_multiply34_U0_l2_products_2_we0),
    .i_address0(tdf4_l2_multiply34_U0_l2_products_2_address0),
    .i_d0(tdf4_l2_multiply34_U0_l2_products_2_d0),
    .i_q0(l2_products_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(l2_products_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_accum_U0_ap_ready),
    .t_empty_n(l2_products_2_t_empty_n),
    .t_ce0(tdf4_l2_accum_U0_l2_products_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_accum_U0_l2_products_2_address0),
    .t_d0(16'd0),
    .t_q0(l2_products_2_t_q0),
    .t_ce1(tdf4_l2_accum_U0_l2_products_2_ce1),
    .t_address1(tdf4_l2_accum_U0_l2_products_2_address1),
    .t_q1(l2_products_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
l2_products_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_products_3),
    .i_full_n(l2_products_3_i_full_n),
    .i_ce0(tdf4_l2_multiply34_U0_l2_products_3_ce0),
    .i_we0(tdf4_l2_multiply34_U0_l2_products_3_we0),
    .i_address0(tdf4_l2_multiply34_U0_l2_products_3_address0),
    .i_d0(tdf4_l2_multiply34_U0_l2_products_3_d0),
    .i_q0(l2_products_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(l2_products_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_accum_U0_ap_ready),
    .t_empty_n(l2_products_3_t_empty_n),
    .t_ce0(tdf4_l2_accum_U0_l2_products_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_accum_U0_l2_products_3_address0),
    .t_d0(16'd0),
    .t_q0(l2_products_3_t_q0),
    .t_ce1(tdf4_l2_accum_U0_l2_products_3_ce1),
    .t_address1(tdf4_l2_accum_U0_l2_products_3_address1),
    .t_q1(l2_products_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0 #(
    .DataWidth( 16 ),
    .AddressRange( 4 ),
    .AddressWidth( 2 ))
l2_partial_sums_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_partial_sums_0),
    .i_full_n(l2_partial_sums_0_i_full_n),
    .i_ce0(tdf4_l2_accum_U0_l2_partial_sums_0_ce0),
    .i_we0(tdf4_l2_accum_U0_l2_partial_sums_0_we0),
    .i_address0(tdf4_l2_accum_U0_l2_partial_sums_0_address0),
    .i_d0(tdf4_l2_accum_U0_l2_partial_sums_0_d0),
    .i_q0(l2_partial_sums_0_i_q0),
    .i_ce1(tdf4_l2_accum_U0_l2_partial_sums_0_ce1),
    .i_we1(tdf4_l2_accum_U0_l2_partial_sums_0_we1),
    .i_address1(tdf4_l2_accum_U0_l2_partial_sums_0_address1),
    .i_d1(tdf4_l2_accum_U0_l2_partial_sums_0_d1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_writeOutputs_1_U0_ap_ready),
    .t_empty_n(l2_partial_sums_0_t_empty_n),
    .t_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_address0),
    .t_d0(16'd0),
    .t_q0(l2_partial_sums_0_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(2'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0 #(
    .DataWidth( 16 ),
    .AddressRange( 4 ),
    .AddressWidth( 2 ))
l2_partial_sums_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_partial_sums_1),
    .i_full_n(l2_partial_sums_1_i_full_n),
    .i_ce0(tdf4_l2_accum_U0_l2_partial_sums_1_ce0),
    .i_we0(tdf4_l2_accum_U0_l2_partial_sums_1_we0),
    .i_address0(tdf4_l2_accum_U0_l2_partial_sums_1_address0),
    .i_d0(tdf4_l2_accum_U0_l2_partial_sums_1_d0),
    .i_q0(l2_partial_sums_1_i_q0),
    .i_ce1(tdf4_l2_accum_U0_l2_partial_sums_1_ce1),
    .i_we1(tdf4_l2_accum_U0_l2_partial_sums_1_we1),
    .i_address1(tdf4_l2_accum_U0_l2_partial_sums_1_address1),
    .i_d1(tdf4_l2_accum_U0_l2_partial_sums_1_d1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_writeOutputs_1_U0_ap_ready),
    .t_empty_n(l2_partial_sums_1_t_empty_n),
    .t_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_address0),
    .t_d0(16'd0),
    .t_q0(l2_partial_sums_1_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(2'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0 #(
    .DataWidth( 16 ),
    .AddressRange( 4 ),
    .AddressWidth( 2 ))
l2_partial_sums_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_partial_sums_2),
    .i_full_n(l2_partial_sums_2_i_full_n),
    .i_ce0(tdf4_l2_accum_U0_l2_partial_sums_2_ce0),
    .i_we0(tdf4_l2_accum_U0_l2_partial_sums_2_we0),
    .i_address0(tdf4_l2_accum_U0_l2_partial_sums_2_address0),
    .i_d0(tdf4_l2_accum_U0_l2_partial_sums_2_d0),
    .i_q0(l2_partial_sums_2_i_q0),
    .i_ce1(tdf4_l2_accum_U0_l2_partial_sums_2_ce1),
    .i_we1(tdf4_l2_accum_U0_l2_partial_sums_2_we1),
    .i_address1(tdf4_l2_accum_U0_l2_partial_sums_2_address1),
    .i_d1(tdf4_l2_accum_U0_l2_partial_sums_2_d1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_writeOutputs_1_U0_ap_ready),
    .t_empty_n(l2_partial_sums_2_t_empty_n),
    .t_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_address0),
    .t_d0(16'd0),
    .t_q0(l2_partial_sums_2_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(2'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0 #(
    .DataWidth( 16 ),
    .AddressRange( 4 ),
    .AddressWidth( 2 ))
l2_partial_sums_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_l2_partial_sums_3),
    .i_full_n(l2_partial_sums_3_i_full_n),
    .i_ce0(tdf4_l2_accum_U0_l2_partial_sums_3_ce0),
    .i_we0(tdf4_l2_accum_U0_l2_partial_sums_3_we0),
    .i_address0(tdf4_l2_accum_U0_l2_partial_sums_3_address0),
    .i_d0(tdf4_l2_accum_U0_l2_partial_sums_3_d0),
    .i_q0(l2_partial_sums_3_i_q0),
    .i_ce1(tdf4_l2_accum_U0_l2_partial_sums_3_ce1),
    .i_we1(tdf4_l2_accum_U0_l2_partial_sums_3_we1),
    .i_address1(tdf4_l2_accum_U0_l2_partial_sums_3_address1),
    .i_d1(tdf4_l2_accum_U0_l2_partial_sums_3_d1),
    .t_ce(1'b1),
    .t_read(tdf4_l2_writeOutputs_1_U0_ap_ready),
    .t_empty_n(l2_partial_sums_3_t_empty_n),
    .t_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_address0),
    .t_d0(16'd0),
    .t_q0(l2_partial_sums_3_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(2'd0),
    .t_d1(16'd0)
);

td_fused_top_tdf4_get_next_ijk tdf4_get_next_ijk_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_get_next_ijk_U0_ap_start),
    .start_full_n(start_for_tdf4_readFilters36_U0_full_n),
    .ap_done(tdf4_get_next_ijk_U0_ap_done),
    .ap_continue(tdf4_get_next_ijk_U0_ap_continue),
    .ap_idle(tdf4_get_next_ijk_U0_ap_idle),
    .ap_ready(tdf4_get_next_ijk_U0_ap_ready),
    .start_out(tdf4_get_next_ijk_U0_start_out),
    .start_write(tdf4_get_next_ijk_U0_start_write),
    .indices_0_din(tdf4_get_next_ijk_U0_indices_0_din),
    .indices_0_full_n(indices_01_c_full_n),
    .indices_0_write(tdf4_get_next_ijk_U0_indices_0_write),
    .indices_1_din(tdf4_get_next_ijk_U0_indices_1_din),
    .indices_1_full_n(indices_12_c_full_n),
    .indices_1_write(tdf4_get_next_ijk_U0_indices_1_write),
    .indices_2_out_din(tdf4_get_next_ijk_U0_indices_2_out_din),
    .indices_2_out_full_n(indices_23_c_full_n),
    .indices_2_out_write(tdf4_get_next_ijk_U0_indices_2_out_write),
    .indices_2_out1_din(tdf4_get_next_ijk_U0_indices_2_out1_din),
    .indices_2_out1_full_n(indices_23_c1_full_n),
    .indices_2_out1_write(tdf4_get_next_ijk_U0_indices_2_out1_write),
    .write_r_din(tdf4_get_next_ijk_U0_write_r_din),
    .write_r_full_n(write4_c_full_n),
    .write_r_write(tdf4_get_next_ijk_U0_write_r_write)
);

td_fused_top_tdf4_readInputs37 tdf4_readInputs37_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_readInputs37_U0_ap_start),
    .ap_done(tdf4_readInputs37_U0_ap_done),
    .ap_continue(tdf4_readInputs37_U0_ap_continue),
    .ap_idle(tdf4_readInputs37_U0_ap_idle),
    .ap_ready(tdf4_readInputs37_U0_ap_ready),
    .in_data_address0(tdf4_readInputs37_U0_in_data_address0),
    .in_data_ce0(tdf4_readInputs37_U0_in_data_ce0),
    .in_data_q0(in_data_q0),
    .indices_01_dout(indices_01_c_dout),
    .indices_01_empty_n(indices_01_c_empty_n),
    .indices_01_read(tdf4_readInputs37_U0_indices_01_read),
    .indices_12_dout(indices_12_c_dout),
    .indices_12_empty_n(indices_12_c_empty_n),
    .indices_12_read(tdf4_readInputs37_U0_indices_12_read),
    .ifmap_vec_0_address0(tdf4_readInputs37_U0_ifmap_vec_0_address0),
    .ifmap_vec_0_ce0(tdf4_readInputs37_U0_ifmap_vec_0_ce0),
    .ifmap_vec_0_we0(tdf4_readInputs37_U0_ifmap_vec_0_we0),
    .ifmap_vec_0_d0(tdf4_readInputs37_U0_ifmap_vec_0_d0),
    .ifmap_vec_1_address0(tdf4_readInputs37_U0_ifmap_vec_1_address0),
    .ifmap_vec_1_ce0(tdf4_readInputs37_U0_ifmap_vec_1_ce0),
    .ifmap_vec_1_we0(tdf4_readInputs37_U0_ifmap_vec_1_we0),
    .ifmap_vec_1_d0(tdf4_readInputs37_U0_ifmap_vec_1_d0),
    .ifmap_vec_2_address0(tdf4_readInputs37_U0_ifmap_vec_2_address0),
    .ifmap_vec_2_ce0(tdf4_readInputs37_U0_ifmap_vec_2_ce0),
    .ifmap_vec_2_we0(tdf4_readInputs37_U0_ifmap_vec_2_we0),
    .ifmap_vec_2_d0(tdf4_readInputs37_U0_ifmap_vec_2_d0),
    .ifmap_vec_3_address0(tdf4_readInputs37_U0_ifmap_vec_3_address0),
    .ifmap_vec_3_ce0(tdf4_readInputs37_U0_ifmap_vec_3_ce0),
    .ifmap_vec_3_we0(tdf4_readInputs37_U0_ifmap_vec_3_we0),
    .ifmap_vec_3_d0(tdf4_readInputs37_U0_ifmap_vec_3_d0),
    .indices_01_out_din(tdf4_readInputs37_U0_indices_01_out_din),
    .indices_01_out_full_n(indices_01_c2_full_n),
    .indices_01_out_write(tdf4_readInputs37_U0_indices_01_out_write),
    .indices_12_out_din(tdf4_readInputs37_U0_indices_12_out_din),
    .indices_12_out_full_n(indices_12_c3_full_n),
    .indices_12_out_write(tdf4_readInputs37_U0_indices_12_out_write)
);

td_fused_top_tdf4_readFilters36 tdf4_readFilters36_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_readFilters36_U0_ap_start),
    .ap_done(tdf4_readFilters36_U0_ap_done),
    .ap_continue(tdf4_readFilters36_U0_ap_continue),
    .ap_idle(tdf4_readFilters36_U0_ap_idle),
    .ap_ready(tdf4_readFilters36_U0_ap_ready),
    .filter_data_0_address0(tdf4_readFilters36_U0_filter_data_0_address0),
    .filter_data_0_ce0(tdf4_readFilters36_U0_filter_data_0_ce0),
    .filter_data_0_q0(l1_filter_data_0_q0),
    .filter_data_1_address0(tdf4_readFilters36_U0_filter_data_1_address0),
    .filter_data_1_ce0(tdf4_readFilters36_U0_filter_data_1_ce0),
    .filter_data_1_q0(l1_filter_data_1_q0),
    .filter_data_2_address0(tdf4_readFilters36_U0_filter_data_2_address0),
    .filter_data_2_ce0(tdf4_readFilters36_U0_filter_data_2_ce0),
    .filter_data_2_q0(l1_filter_data_2_q0),
    .filter_data_3_address0(tdf4_readFilters36_U0_filter_data_3_address0),
    .filter_data_3_ce0(tdf4_readFilters36_U0_filter_data_3_ce0),
    .filter_data_3_q0(l1_filter_data_3_q0),
    .indices_23_dout(indices_23_c_dout),
    .indices_23_empty_n(indices_23_c_empty_n),
    .indices_23_read(tdf4_readFilters36_U0_indices_23_read),
    .weight_vecs_0_0_address0(tdf4_readFilters36_U0_weight_vecs_0_0_address0),
    .weight_vecs_0_0_ce0(tdf4_readFilters36_U0_weight_vecs_0_0_ce0),
    .weight_vecs_0_0_we0(tdf4_readFilters36_U0_weight_vecs_0_0_we0),
    .weight_vecs_0_0_d0(tdf4_readFilters36_U0_weight_vecs_0_0_d0),
    .weight_vecs_0_1_address0(tdf4_readFilters36_U0_weight_vecs_0_1_address0),
    .weight_vecs_0_1_ce0(tdf4_readFilters36_U0_weight_vecs_0_1_ce0),
    .weight_vecs_0_1_we0(tdf4_readFilters36_U0_weight_vecs_0_1_we0),
    .weight_vecs_0_1_d0(tdf4_readFilters36_U0_weight_vecs_0_1_d0),
    .weight_vecs_0_2_address0(tdf4_readFilters36_U0_weight_vecs_0_2_address0),
    .weight_vecs_0_2_ce0(tdf4_readFilters36_U0_weight_vecs_0_2_ce0),
    .weight_vecs_0_2_we0(tdf4_readFilters36_U0_weight_vecs_0_2_we0),
    .weight_vecs_0_2_d0(tdf4_readFilters36_U0_weight_vecs_0_2_d0),
    .weight_vecs_0_3_address0(tdf4_readFilters36_U0_weight_vecs_0_3_address0),
    .weight_vecs_0_3_ce0(tdf4_readFilters36_U0_weight_vecs_0_3_ce0),
    .weight_vecs_0_3_we0(tdf4_readFilters36_U0_weight_vecs_0_3_we0),
    .weight_vecs_0_3_d0(tdf4_readFilters36_U0_weight_vecs_0_3_d0),
    .weight_vecs_1_0_address0(tdf4_readFilters36_U0_weight_vecs_1_0_address0),
    .weight_vecs_1_0_ce0(tdf4_readFilters36_U0_weight_vecs_1_0_ce0),
    .weight_vecs_1_0_we0(tdf4_readFilters36_U0_weight_vecs_1_0_we0),
    .weight_vecs_1_0_d0(tdf4_readFilters36_U0_weight_vecs_1_0_d0),
    .weight_vecs_1_1_address0(tdf4_readFilters36_U0_weight_vecs_1_1_address0),
    .weight_vecs_1_1_ce0(tdf4_readFilters36_U0_weight_vecs_1_1_ce0),
    .weight_vecs_1_1_we0(tdf4_readFilters36_U0_weight_vecs_1_1_we0),
    .weight_vecs_1_1_d0(tdf4_readFilters36_U0_weight_vecs_1_1_d0),
    .weight_vecs_1_2_address0(tdf4_readFilters36_U0_weight_vecs_1_2_address0),
    .weight_vecs_1_2_ce0(tdf4_readFilters36_U0_weight_vecs_1_2_ce0),
    .weight_vecs_1_2_we0(tdf4_readFilters36_U0_weight_vecs_1_2_we0),
    .weight_vecs_1_2_d0(tdf4_readFilters36_U0_weight_vecs_1_2_d0),
    .weight_vecs_1_3_address0(tdf4_readFilters36_U0_weight_vecs_1_3_address0),
    .weight_vecs_1_3_ce0(tdf4_readFilters36_U0_weight_vecs_1_3_ce0),
    .weight_vecs_1_3_we0(tdf4_readFilters36_U0_weight_vecs_1_3_we0),
    .weight_vecs_1_3_d0(tdf4_readFilters36_U0_weight_vecs_1_3_d0),
    .weight_vecs_2_0_address0(tdf4_readFilters36_U0_weight_vecs_2_0_address0),
    .weight_vecs_2_0_ce0(tdf4_readFilters36_U0_weight_vecs_2_0_ce0),
    .weight_vecs_2_0_we0(tdf4_readFilters36_U0_weight_vecs_2_0_we0),
    .weight_vecs_2_0_d0(tdf4_readFilters36_U0_weight_vecs_2_0_d0),
    .weight_vecs_2_1_address0(tdf4_readFilters36_U0_weight_vecs_2_1_address0),
    .weight_vecs_2_1_ce0(tdf4_readFilters36_U0_weight_vecs_2_1_ce0),
    .weight_vecs_2_1_we0(tdf4_readFilters36_U0_weight_vecs_2_1_we0),
    .weight_vecs_2_1_d0(tdf4_readFilters36_U0_weight_vecs_2_1_d0),
    .weight_vecs_2_2_address0(tdf4_readFilters36_U0_weight_vecs_2_2_address0),
    .weight_vecs_2_2_ce0(tdf4_readFilters36_U0_weight_vecs_2_2_ce0),
    .weight_vecs_2_2_we0(tdf4_readFilters36_U0_weight_vecs_2_2_we0),
    .weight_vecs_2_2_d0(tdf4_readFilters36_U0_weight_vecs_2_2_d0),
    .weight_vecs_2_3_address0(tdf4_readFilters36_U0_weight_vecs_2_3_address0),
    .weight_vecs_2_3_ce0(tdf4_readFilters36_U0_weight_vecs_2_3_ce0),
    .weight_vecs_2_3_we0(tdf4_readFilters36_U0_weight_vecs_2_3_we0),
    .weight_vecs_2_3_d0(tdf4_readFilters36_U0_weight_vecs_2_3_d0),
    .weight_vecs_3_0_address0(tdf4_readFilters36_U0_weight_vecs_3_0_address0),
    .weight_vecs_3_0_ce0(tdf4_readFilters36_U0_weight_vecs_3_0_ce0),
    .weight_vecs_3_0_we0(tdf4_readFilters36_U0_weight_vecs_3_0_we0),
    .weight_vecs_3_0_d0(tdf4_readFilters36_U0_weight_vecs_3_0_d0),
    .weight_vecs_3_1_address0(tdf4_readFilters36_U0_weight_vecs_3_1_address0),
    .weight_vecs_3_1_ce0(tdf4_readFilters36_U0_weight_vecs_3_1_ce0),
    .weight_vecs_3_1_we0(tdf4_readFilters36_U0_weight_vecs_3_1_we0),
    .weight_vecs_3_1_d0(tdf4_readFilters36_U0_weight_vecs_3_1_d0),
    .weight_vecs_3_2_address0(tdf4_readFilters36_U0_weight_vecs_3_2_address0),
    .weight_vecs_3_2_ce0(tdf4_readFilters36_U0_weight_vecs_3_2_ce0),
    .weight_vecs_3_2_we0(tdf4_readFilters36_U0_weight_vecs_3_2_we0),
    .weight_vecs_3_2_d0(tdf4_readFilters36_U0_weight_vecs_3_2_d0),
    .weight_vecs_3_3_address0(tdf4_readFilters36_U0_weight_vecs_3_3_address0),
    .weight_vecs_3_3_ce0(tdf4_readFilters36_U0_weight_vecs_3_3_ce0),
    .weight_vecs_3_3_we0(tdf4_readFilters36_U0_weight_vecs_3_3_we0),
    .weight_vecs_3_3_d0(tdf4_readFilters36_U0_weight_vecs_3_3_d0)
);

td_fused_top_tdf4_dot_product tdf4_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_dot_product_U0_ap_start),
    .ap_done(tdf4_dot_product_U0_ap_done),
    .ap_continue(tdf4_dot_product_U0_ap_continue),
    .ap_idle(tdf4_dot_product_U0_ap_idle),
    .ap_ready(tdf4_dot_product_U0_ap_ready),
    .ifmap_vec_0_address0(tdf4_dot_product_U0_ifmap_vec_0_address0),
    .ifmap_vec_0_ce0(tdf4_dot_product_U0_ifmap_vec_0_ce0),
    .ifmap_vec_0_q0(ifmap_vec_0_t_q0),
    .ifmap_vec_1_address0(tdf4_dot_product_U0_ifmap_vec_1_address0),
    .ifmap_vec_1_ce0(tdf4_dot_product_U0_ifmap_vec_1_ce0),
    .ifmap_vec_1_q0(ifmap_vec_1_t_q0),
    .ifmap_vec_2_address0(tdf4_dot_product_U0_ifmap_vec_2_address0),
    .ifmap_vec_2_ce0(tdf4_dot_product_U0_ifmap_vec_2_ce0),
    .ifmap_vec_2_q0(ifmap_vec_2_t_q0),
    .ifmap_vec_3_address0(tdf4_dot_product_U0_ifmap_vec_3_address0),
    .ifmap_vec_3_ce0(tdf4_dot_product_U0_ifmap_vec_3_ce0),
    .ifmap_vec_3_q0(ifmap_vec_3_t_q0),
    .weight_vecs_0_0_address0(tdf4_dot_product_U0_weight_vecs_0_0_address0),
    .weight_vecs_0_0_ce0(tdf4_dot_product_U0_weight_vecs_0_0_ce0),
    .weight_vecs_0_0_q0(weight_vecs_0_0_t_q0),
    .weight_vecs_0_1_address0(tdf4_dot_product_U0_weight_vecs_0_1_address0),
    .weight_vecs_0_1_ce0(tdf4_dot_product_U0_weight_vecs_0_1_ce0),
    .weight_vecs_0_1_q0(weight_vecs_0_1_t_q0),
    .weight_vecs_0_2_address0(tdf4_dot_product_U0_weight_vecs_0_2_address0),
    .weight_vecs_0_2_ce0(tdf4_dot_product_U0_weight_vecs_0_2_ce0),
    .weight_vecs_0_2_q0(weight_vecs_0_2_t_q0),
    .weight_vecs_0_3_address0(tdf4_dot_product_U0_weight_vecs_0_3_address0),
    .weight_vecs_0_3_ce0(tdf4_dot_product_U0_weight_vecs_0_3_ce0),
    .weight_vecs_0_3_q0(weight_vecs_0_3_t_q0),
    .weight_vecs_1_0_address0(tdf4_dot_product_U0_weight_vecs_1_0_address0),
    .weight_vecs_1_0_ce0(tdf4_dot_product_U0_weight_vecs_1_0_ce0),
    .weight_vecs_1_0_q0(weight_vecs_1_0_t_q0),
    .weight_vecs_1_1_address0(tdf4_dot_product_U0_weight_vecs_1_1_address0),
    .weight_vecs_1_1_ce0(tdf4_dot_product_U0_weight_vecs_1_1_ce0),
    .weight_vecs_1_1_q0(weight_vecs_1_1_t_q0),
    .weight_vecs_1_2_address0(tdf4_dot_product_U0_weight_vecs_1_2_address0),
    .weight_vecs_1_2_ce0(tdf4_dot_product_U0_weight_vecs_1_2_ce0),
    .weight_vecs_1_2_q0(weight_vecs_1_2_t_q0),
    .weight_vecs_1_3_address0(tdf4_dot_product_U0_weight_vecs_1_3_address0),
    .weight_vecs_1_3_ce0(tdf4_dot_product_U0_weight_vecs_1_3_ce0),
    .weight_vecs_1_3_q0(weight_vecs_1_3_t_q0),
    .weight_vecs_2_0_address0(tdf4_dot_product_U0_weight_vecs_2_0_address0),
    .weight_vecs_2_0_ce0(tdf4_dot_product_U0_weight_vecs_2_0_ce0),
    .weight_vecs_2_0_q0(weight_vecs_2_0_t_q0),
    .weight_vecs_2_1_address0(tdf4_dot_product_U0_weight_vecs_2_1_address0),
    .weight_vecs_2_1_ce0(tdf4_dot_product_U0_weight_vecs_2_1_ce0),
    .weight_vecs_2_1_q0(weight_vecs_2_1_t_q0),
    .weight_vecs_2_2_address0(tdf4_dot_product_U0_weight_vecs_2_2_address0),
    .weight_vecs_2_2_ce0(tdf4_dot_product_U0_weight_vecs_2_2_ce0),
    .weight_vecs_2_2_q0(weight_vecs_2_2_t_q0),
    .weight_vecs_2_3_address0(tdf4_dot_product_U0_weight_vecs_2_3_address0),
    .weight_vecs_2_3_ce0(tdf4_dot_product_U0_weight_vecs_2_3_ce0),
    .weight_vecs_2_3_q0(weight_vecs_2_3_t_q0),
    .weight_vecs_3_0_address0(tdf4_dot_product_U0_weight_vecs_3_0_address0),
    .weight_vecs_3_0_ce0(tdf4_dot_product_U0_weight_vecs_3_0_ce0),
    .weight_vecs_3_0_q0(weight_vecs_3_0_t_q0),
    .weight_vecs_3_1_address0(tdf4_dot_product_U0_weight_vecs_3_1_address0),
    .weight_vecs_3_1_ce0(tdf4_dot_product_U0_weight_vecs_3_1_ce0),
    .weight_vecs_3_1_q0(weight_vecs_3_1_t_q0),
    .weight_vecs_3_2_address0(tdf4_dot_product_U0_weight_vecs_3_2_address0),
    .weight_vecs_3_2_ce0(tdf4_dot_product_U0_weight_vecs_3_2_ce0),
    .weight_vecs_3_2_q0(weight_vecs_3_2_t_q0),
    .weight_vecs_3_3_address0(tdf4_dot_product_U0_weight_vecs_3_3_address0),
    .weight_vecs_3_3_ce0(tdf4_dot_product_U0_weight_vecs_3_3_ce0),
    .weight_vecs_3_3_q0(weight_vecs_3_3_t_q0),
    .products_0_0_address0(tdf4_dot_product_U0_products_0_0_address0),
    .products_0_0_ce0(tdf4_dot_product_U0_products_0_0_ce0),
    .products_0_0_we0(tdf4_dot_product_U0_products_0_0_we0),
    .products_0_0_d0(tdf4_dot_product_U0_products_0_0_d0),
    .products_0_1_address0(tdf4_dot_product_U0_products_0_1_address0),
    .products_0_1_ce0(tdf4_dot_product_U0_products_0_1_ce0),
    .products_0_1_we0(tdf4_dot_product_U0_products_0_1_we0),
    .products_0_1_d0(tdf4_dot_product_U0_products_0_1_d0),
    .products_0_2_address0(tdf4_dot_product_U0_products_0_2_address0),
    .products_0_2_ce0(tdf4_dot_product_U0_products_0_2_ce0),
    .products_0_2_we0(tdf4_dot_product_U0_products_0_2_we0),
    .products_0_2_d0(tdf4_dot_product_U0_products_0_2_d0),
    .products_0_3_address0(tdf4_dot_product_U0_products_0_3_address0),
    .products_0_3_ce0(tdf4_dot_product_U0_products_0_3_ce0),
    .products_0_3_we0(tdf4_dot_product_U0_products_0_3_we0),
    .products_0_3_d0(tdf4_dot_product_U0_products_0_3_d0),
    .products_1_0_address0(tdf4_dot_product_U0_products_1_0_address0),
    .products_1_0_ce0(tdf4_dot_product_U0_products_1_0_ce0),
    .products_1_0_we0(tdf4_dot_product_U0_products_1_0_we0),
    .products_1_0_d0(tdf4_dot_product_U0_products_1_0_d0),
    .products_1_1_address0(tdf4_dot_product_U0_products_1_1_address0),
    .products_1_1_ce0(tdf4_dot_product_U0_products_1_1_ce0),
    .products_1_1_we0(tdf4_dot_product_U0_products_1_1_we0),
    .products_1_1_d0(tdf4_dot_product_U0_products_1_1_d0),
    .products_1_2_address0(tdf4_dot_product_U0_products_1_2_address0),
    .products_1_2_ce0(tdf4_dot_product_U0_products_1_2_ce0),
    .products_1_2_we0(tdf4_dot_product_U0_products_1_2_we0),
    .products_1_2_d0(tdf4_dot_product_U0_products_1_2_d0),
    .products_1_3_address0(tdf4_dot_product_U0_products_1_3_address0),
    .products_1_3_ce0(tdf4_dot_product_U0_products_1_3_ce0),
    .products_1_3_we0(tdf4_dot_product_U0_products_1_3_we0),
    .products_1_3_d0(tdf4_dot_product_U0_products_1_3_d0),
    .products_2_0_address0(tdf4_dot_product_U0_products_2_0_address0),
    .products_2_0_ce0(tdf4_dot_product_U0_products_2_0_ce0),
    .products_2_0_we0(tdf4_dot_product_U0_products_2_0_we0),
    .products_2_0_d0(tdf4_dot_product_U0_products_2_0_d0),
    .products_2_1_address0(tdf4_dot_product_U0_products_2_1_address0),
    .products_2_1_ce0(tdf4_dot_product_U0_products_2_1_ce0),
    .products_2_1_we0(tdf4_dot_product_U0_products_2_1_we0),
    .products_2_1_d0(tdf4_dot_product_U0_products_2_1_d0),
    .products_2_2_address0(tdf4_dot_product_U0_products_2_2_address0),
    .products_2_2_ce0(tdf4_dot_product_U0_products_2_2_ce0),
    .products_2_2_we0(tdf4_dot_product_U0_products_2_2_we0),
    .products_2_2_d0(tdf4_dot_product_U0_products_2_2_d0),
    .products_2_3_address0(tdf4_dot_product_U0_products_2_3_address0),
    .products_2_3_ce0(tdf4_dot_product_U0_products_2_3_ce0),
    .products_2_3_we0(tdf4_dot_product_U0_products_2_3_we0),
    .products_2_3_d0(tdf4_dot_product_U0_products_2_3_d0),
    .products_3_0_address0(tdf4_dot_product_U0_products_3_0_address0),
    .products_3_0_ce0(tdf4_dot_product_U0_products_3_0_ce0),
    .products_3_0_we0(tdf4_dot_product_U0_products_3_0_we0),
    .products_3_0_d0(tdf4_dot_product_U0_products_3_0_d0),
    .products_3_1_address0(tdf4_dot_product_U0_products_3_1_address0),
    .products_3_1_ce0(tdf4_dot_product_U0_products_3_1_ce0),
    .products_3_1_we0(tdf4_dot_product_U0_products_3_1_we0),
    .products_3_1_d0(tdf4_dot_product_U0_products_3_1_d0),
    .products_3_2_address0(tdf4_dot_product_U0_products_3_2_address0),
    .products_3_2_ce0(tdf4_dot_product_U0_products_3_2_ce0),
    .products_3_2_we0(tdf4_dot_product_U0_products_3_2_we0),
    .products_3_2_d0(tdf4_dot_product_U0_products_3_2_d0),
    .products_3_3_address0(tdf4_dot_product_U0_products_3_3_address0),
    .products_3_3_ce0(tdf4_dot_product_U0_products_3_3_ce0),
    .products_3_3_we0(tdf4_dot_product_U0_products_3_3_we0),
    .products_3_3_d0(tdf4_dot_product_U0_products_3_3_d0)
);

td_fused_top_tdf4_accum_1 tdf4_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_1_U0_ap_start),
    .ap_done(tdf4_accum_1_U0_ap_done),
    .ap_continue(tdf4_accum_1_U0_ap_continue),
    .ap_idle(tdf4_accum_1_U0_ap_idle),
    .ap_ready(tdf4_accum_1_U0_ap_ready),
    .accum_in_address0(tdf4_accum_1_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_1_U0_accum_in_ce0),
    .accum_in_q0(products_0_0_t_q0),
    .accum_in_address1(tdf4_accum_1_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_1_U0_accum_in_ce1),
    .accum_in_q1(products_0_0_t_q1),
    .accum_in1_address0(tdf4_accum_1_U0_accum_in1_address0),
    .accum_in1_ce0(tdf4_accum_1_U0_accum_in1_ce0),
    .accum_in1_q0(products_0_1_t_q0),
    .accum_in1_address1(tdf4_accum_1_U0_accum_in1_address1),
    .accum_in1_ce1(tdf4_accum_1_U0_accum_in1_ce1),
    .accum_in1_q1(products_0_1_t_q1),
    .accum_in2_address0(tdf4_accum_1_U0_accum_in2_address0),
    .accum_in2_ce0(tdf4_accum_1_U0_accum_in2_ce0),
    .accum_in2_q0(products_0_2_t_q0),
    .accum_in2_address1(tdf4_accum_1_U0_accum_in2_address1),
    .accum_in2_ce1(tdf4_accum_1_U0_accum_in2_ce1),
    .accum_in2_q1(products_0_2_t_q1),
    .accum_in3_address0(tdf4_accum_1_U0_accum_in3_address0),
    .accum_in3_ce0(tdf4_accum_1_U0_accum_in3_ce0),
    .accum_in3_q0(products_0_3_t_q0),
    .accum_in3_address1(tdf4_accum_1_U0_accum_in3_address1),
    .accum_in3_ce1(tdf4_accum_1_U0_accum_in3_ce1),
    .accum_in3_q1(products_0_3_t_q1),
    .accum_out_address0(tdf4_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf4_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf4_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf4_accum_1_U0_accum_out_d0),
    .accum_out_address1(tdf4_accum_1_U0_accum_out_address1),
    .accum_out_ce1(tdf4_accum_1_U0_accum_out_ce1),
    .accum_out_we1(tdf4_accum_1_U0_accum_out_we1),
    .accum_out_d1(tdf4_accum_1_U0_accum_out_d1)
);

td_fused_top_tdf4_accum_1 tdf4_accum_1_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_1_U1_1_ap_start),
    .ap_done(tdf4_accum_1_U1_1_ap_done),
    .ap_continue(tdf4_accum_1_U1_1_ap_continue),
    .ap_idle(tdf4_accum_1_U1_1_ap_idle),
    .ap_ready(tdf4_accum_1_U1_1_ap_ready),
    .accum_in_address0(tdf4_accum_1_U1_1_accum_in_address0),
    .accum_in_ce0(tdf4_accum_1_U1_1_accum_in_ce0),
    .accum_in_q0(products_1_0_t_q0),
    .accum_in_address1(tdf4_accum_1_U1_1_accum_in_address1),
    .accum_in_ce1(tdf4_accum_1_U1_1_accum_in_ce1),
    .accum_in_q1(products_1_0_t_q1),
    .accum_in1_address0(tdf4_accum_1_U1_1_accum_in1_address0),
    .accum_in1_ce0(tdf4_accum_1_U1_1_accum_in1_ce0),
    .accum_in1_q0(products_1_1_t_q0),
    .accum_in1_address1(tdf4_accum_1_U1_1_accum_in1_address1),
    .accum_in1_ce1(tdf4_accum_1_U1_1_accum_in1_ce1),
    .accum_in1_q1(products_1_1_t_q1),
    .accum_in2_address0(tdf4_accum_1_U1_1_accum_in2_address0),
    .accum_in2_ce0(tdf4_accum_1_U1_1_accum_in2_ce0),
    .accum_in2_q0(products_1_2_t_q0),
    .accum_in2_address1(tdf4_accum_1_U1_1_accum_in2_address1),
    .accum_in2_ce1(tdf4_accum_1_U1_1_accum_in2_ce1),
    .accum_in2_q1(products_1_2_t_q1),
    .accum_in3_address0(tdf4_accum_1_U1_1_accum_in3_address0),
    .accum_in3_ce0(tdf4_accum_1_U1_1_accum_in3_ce0),
    .accum_in3_q0(products_1_3_t_q0),
    .accum_in3_address1(tdf4_accum_1_U1_1_accum_in3_address1),
    .accum_in3_ce1(tdf4_accum_1_U1_1_accum_in3_ce1),
    .accum_in3_q1(products_1_3_t_q1),
    .accum_out_address0(tdf4_accum_1_U1_1_accum_out_address0),
    .accum_out_ce0(tdf4_accum_1_U1_1_accum_out_ce0),
    .accum_out_we0(tdf4_accum_1_U1_1_accum_out_we0),
    .accum_out_d0(tdf4_accum_1_U1_1_accum_out_d0),
    .accum_out_address1(tdf4_accum_1_U1_1_accum_out_address1),
    .accum_out_ce1(tdf4_accum_1_U1_1_accum_out_ce1),
    .accum_out_we1(tdf4_accum_1_U1_1_accum_out_we1),
    .accum_out_d1(tdf4_accum_1_U1_1_accum_out_d1)
);

td_fused_top_tdf4_accum_1 tdf4_accum_1_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_1_U2_2_ap_start),
    .ap_done(tdf4_accum_1_U2_2_ap_done),
    .ap_continue(tdf4_accum_1_U2_2_ap_continue),
    .ap_idle(tdf4_accum_1_U2_2_ap_idle),
    .ap_ready(tdf4_accum_1_U2_2_ap_ready),
    .accum_in_address0(tdf4_accum_1_U2_2_accum_in_address0),
    .accum_in_ce0(tdf4_accum_1_U2_2_accum_in_ce0),
    .accum_in_q0(products_2_0_t_q0),
    .accum_in_address1(tdf4_accum_1_U2_2_accum_in_address1),
    .accum_in_ce1(tdf4_accum_1_U2_2_accum_in_ce1),
    .accum_in_q1(products_2_0_t_q1),
    .accum_in1_address0(tdf4_accum_1_U2_2_accum_in1_address0),
    .accum_in1_ce0(tdf4_accum_1_U2_2_accum_in1_ce0),
    .accum_in1_q0(products_2_1_t_q0),
    .accum_in1_address1(tdf4_accum_1_U2_2_accum_in1_address1),
    .accum_in1_ce1(tdf4_accum_1_U2_2_accum_in1_ce1),
    .accum_in1_q1(products_2_1_t_q1),
    .accum_in2_address0(tdf4_accum_1_U2_2_accum_in2_address0),
    .accum_in2_ce0(tdf4_accum_1_U2_2_accum_in2_ce0),
    .accum_in2_q0(products_2_2_t_q0),
    .accum_in2_address1(tdf4_accum_1_U2_2_accum_in2_address1),
    .accum_in2_ce1(tdf4_accum_1_U2_2_accum_in2_ce1),
    .accum_in2_q1(products_2_2_t_q1),
    .accum_in3_address0(tdf4_accum_1_U2_2_accum_in3_address0),
    .accum_in3_ce0(tdf4_accum_1_U2_2_accum_in3_ce0),
    .accum_in3_q0(products_2_3_t_q0),
    .accum_in3_address1(tdf4_accum_1_U2_2_accum_in3_address1),
    .accum_in3_ce1(tdf4_accum_1_U2_2_accum_in3_ce1),
    .accum_in3_q1(products_2_3_t_q1),
    .accum_out_address0(tdf4_accum_1_U2_2_accum_out_address0),
    .accum_out_ce0(tdf4_accum_1_U2_2_accum_out_ce0),
    .accum_out_we0(tdf4_accum_1_U2_2_accum_out_we0),
    .accum_out_d0(tdf4_accum_1_U2_2_accum_out_d0),
    .accum_out_address1(tdf4_accum_1_U2_2_accum_out_address1),
    .accum_out_ce1(tdf4_accum_1_U2_2_accum_out_ce1),
    .accum_out_we1(tdf4_accum_1_U2_2_accum_out_we1),
    .accum_out_d1(tdf4_accum_1_U2_2_accum_out_d1)
);

td_fused_top_tdf4_accum_1 tdf4_accum_1_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_1_U3_3_ap_start),
    .ap_done(tdf4_accum_1_U3_3_ap_done),
    .ap_continue(tdf4_accum_1_U3_3_ap_continue),
    .ap_idle(tdf4_accum_1_U3_3_ap_idle),
    .ap_ready(tdf4_accum_1_U3_3_ap_ready),
    .accum_in_address0(tdf4_accum_1_U3_3_accum_in_address0),
    .accum_in_ce0(tdf4_accum_1_U3_3_accum_in_ce0),
    .accum_in_q0(products_3_0_t_q0),
    .accum_in_address1(tdf4_accum_1_U3_3_accum_in_address1),
    .accum_in_ce1(tdf4_accum_1_U3_3_accum_in_ce1),
    .accum_in_q1(products_3_0_t_q1),
    .accum_in1_address0(tdf4_accum_1_U3_3_accum_in1_address0),
    .accum_in1_ce0(tdf4_accum_1_U3_3_accum_in1_ce0),
    .accum_in1_q0(products_3_1_t_q0),
    .accum_in1_address1(tdf4_accum_1_U3_3_accum_in1_address1),
    .accum_in1_ce1(tdf4_accum_1_U3_3_accum_in1_ce1),
    .accum_in1_q1(products_3_1_t_q1),
    .accum_in2_address0(tdf4_accum_1_U3_3_accum_in2_address0),
    .accum_in2_ce0(tdf4_accum_1_U3_3_accum_in2_ce0),
    .accum_in2_q0(products_3_2_t_q0),
    .accum_in2_address1(tdf4_accum_1_U3_3_accum_in2_address1),
    .accum_in2_ce1(tdf4_accum_1_U3_3_accum_in2_ce1),
    .accum_in2_q1(products_3_2_t_q1),
    .accum_in3_address0(tdf4_accum_1_U3_3_accum_in3_address0),
    .accum_in3_ce0(tdf4_accum_1_U3_3_accum_in3_ce0),
    .accum_in3_q0(products_3_3_t_q0),
    .accum_in3_address1(tdf4_accum_1_U3_3_accum_in3_address1),
    .accum_in3_ce1(tdf4_accum_1_U3_3_accum_in3_ce1),
    .accum_in3_q1(products_3_3_t_q1),
    .accum_out_address0(tdf4_accum_1_U3_3_accum_out_address0),
    .accum_out_ce0(tdf4_accum_1_U3_3_accum_out_ce0),
    .accum_out_we0(tdf4_accum_1_U3_3_accum_out_we0),
    .accum_out_d0(tdf4_accum_1_U3_3_accum_out_d0),
    .accum_out_address1(tdf4_accum_1_U3_3_accum_out_address1),
    .accum_out_ce1(tdf4_accum_1_U3_3_accum_out_ce1),
    .accum_out_we1(tdf4_accum_1_U3_3_accum_out_we1),
    .accum_out_d1(tdf4_accum_1_U3_3_accum_out_d1)
);

td_fused_top_tdf4_accum_2 tdf4_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_2_U0_ap_start),
    .ap_done(tdf4_accum_2_U0_ap_done),
    .ap_continue(tdf4_accum_2_U0_ap_continue),
    .ap_idle(tdf4_accum_2_U0_ap_idle),
    .ap_ready(tdf4_accum_2_U0_ap_ready),
    .accum_in_address0(tdf4_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0),
    .accum_in_address1(tdf4_accum_2_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_2_U0_accum_in_ce1),
    .accum_in_q1(accum1_out_0_t_q1),
    .accum_out_address0(tdf4_accum_2_U0_accum_out_address0),
    .accum_out_ce0(tdf4_accum_2_U0_accum_out_ce0),
    .accum_out_we0(tdf4_accum_2_U0_accum_out_we0),
    .accum_out_d0(tdf4_accum_2_U0_accum_out_d0),
    .accum_out_address1(tdf4_accum_2_U0_accum_out_address1),
    .accum_out_ce1(tdf4_accum_2_U0_accum_out_ce1),
    .accum_out_we1(tdf4_accum_2_U0_accum_out_we1),
    .accum_out_d1(tdf4_accum_2_U0_accum_out_d1)
);

td_fused_top_tdf4_accum_2 tdf4_accum_2_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_2_U1_1_ap_start),
    .ap_done(tdf4_accum_2_U1_1_ap_done),
    .ap_continue(tdf4_accum_2_U1_1_ap_continue),
    .ap_idle(tdf4_accum_2_U1_1_ap_idle),
    .ap_ready(tdf4_accum_2_U1_1_ap_ready),
    .accum_in_address0(tdf4_accum_2_U1_1_accum_in_address0),
    .accum_in_ce0(tdf4_accum_2_U1_1_accum_in_ce0),
    .accum_in_q0(accum1_out_1_t_q0),
    .accum_in_address1(tdf4_accum_2_U1_1_accum_in_address1),
    .accum_in_ce1(tdf4_accum_2_U1_1_accum_in_ce1),
    .accum_in_q1(accum1_out_1_t_q1),
    .accum_out_address0(tdf4_accum_2_U1_1_accum_out_address0),
    .accum_out_ce0(tdf4_accum_2_U1_1_accum_out_ce0),
    .accum_out_we0(tdf4_accum_2_U1_1_accum_out_we0),
    .accum_out_d0(tdf4_accum_2_U1_1_accum_out_d0),
    .accum_out_address1(tdf4_accum_2_U1_1_accum_out_address1),
    .accum_out_ce1(tdf4_accum_2_U1_1_accum_out_ce1),
    .accum_out_we1(tdf4_accum_2_U1_1_accum_out_we1),
    .accum_out_d1(tdf4_accum_2_U1_1_accum_out_d1)
);

td_fused_top_tdf4_accum_2 tdf4_accum_2_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_2_U2_2_ap_start),
    .ap_done(tdf4_accum_2_U2_2_ap_done),
    .ap_continue(tdf4_accum_2_U2_2_ap_continue),
    .ap_idle(tdf4_accum_2_U2_2_ap_idle),
    .ap_ready(tdf4_accum_2_U2_2_ap_ready),
    .accum_in_address0(tdf4_accum_2_U2_2_accum_in_address0),
    .accum_in_ce0(tdf4_accum_2_U2_2_accum_in_ce0),
    .accum_in_q0(accum1_out_2_t_q0),
    .accum_in_address1(tdf4_accum_2_U2_2_accum_in_address1),
    .accum_in_ce1(tdf4_accum_2_U2_2_accum_in_ce1),
    .accum_in_q1(accum1_out_2_t_q1),
    .accum_out_address0(tdf4_accum_2_U2_2_accum_out_address0),
    .accum_out_ce0(tdf4_accum_2_U2_2_accum_out_ce0),
    .accum_out_we0(tdf4_accum_2_U2_2_accum_out_we0),
    .accum_out_d0(tdf4_accum_2_U2_2_accum_out_d0),
    .accum_out_address1(tdf4_accum_2_U2_2_accum_out_address1),
    .accum_out_ce1(tdf4_accum_2_U2_2_accum_out_ce1),
    .accum_out_we1(tdf4_accum_2_U2_2_accum_out_we1),
    .accum_out_d1(tdf4_accum_2_U2_2_accum_out_d1)
);

td_fused_top_tdf4_accum_2 tdf4_accum_2_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_2_U3_3_ap_start),
    .ap_done(tdf4_accum_2_U3_3_ap_done),
    .ap_continue(tdf4_accum_2_U3_3_ap_continue),
    .ap_idle(tdf4_accum_2_U3_3_ap_idle),
    .ap_ready(tdf4_accum_2_U3_3_ap_ready),
    .accum_in_address0(tdf4_accum_2_U3_3_accum_in_address0),
    .accum_in_ce0(tdf4_accum_2_U3_3_accum_in_ce0),
    .accum_in_q0(accum1_out_3_t_q0),
    .accum_in_address1(tdf4_accum_2_U3_3_accum_in_address1),
    .accum_in_ce1(tdf4_accum_2_U3_3_accum_in_ce1),
    .accum_in_q1(accum1_out_3_t_q1),
    .accum_out_address0(tdf4_accum_2_U3_3_accum_out_address0),
    .accum_out_ce0(tdf4_accum_2_U3_3_accum_out_ce0),
    .accum_out_we0(tdf4_accum_2_U3_3_accum_out_we0),
    .accum_out_d0(tdf4_accum_2_U3_3_accum_out_d0),
    .accum_out_address1(tdf4_accum_2_U3_3_accum_out_address1),
    .accum_out_ce1(tdf4_accum_2_U3_3_accum_out_ce1),
    .accum_out_we1(tdf4_accum_2_U3_3_accum_out_we1),
    .accum_out_d1(tdf4_accum_2_U3_3_accum_out_d1)
);

td_fused_top_tdf4_accum_3 tdf4_accum_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_3_U0_ap_start),
    .ap_done(tdf4_accum_3_U0_ap_done),
    .ap_continue(tdf4_accum_3_U0_ap_continue),
    .ap_idle(tdf4_accum_3_U0_ap_idle),
    .ap_ready(tdf4_accum_3_U0_ap_ready),
    .accum_in_address0(tdf4_accum_3_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_0_t_q0),
    .accum_in_address1(tdf4_accum_3_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_3_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_0_t_q1),
    .ap_return_0(tdf4_accum_3_U0_ap_return_0),
    .ap_return_1(tdf4_accum_3_U0_ap_return_1),
    .ap_return_2(tdf4_accum_3_U0_ap_return_2),
    .ap_return_3(tdf4_accum_3_U0_ap_return_3)
);

td_fused_top_tdf4_accum_3_1 tdf4_accum_3_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_3_1_U0_ap_start),
    .ap_done(tdf4_accum_3_1_U0_ap_done),
    .ap_continue(tdf4_accum_3_1_U0_ap_continue),
    .ap_idle(tdf4_accum_3_1_U0_ap_idle),
    .ap_ready(tdf4_accum_3_1_U0_ap_ready),
    .accum_in_address0(tdf4_accum_3_1_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_3_1_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_1_t_q0),
    .accum_in_address1(tdf4_accum_3_1_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_3_1_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_1_t_q1),
    .ap_return_0(tdf4_accum_3_1_U0_ap_return_0),
    .ap_return_1(tdf4_accum_3_1_U0_ap_return_1),
    .ap_return_2(tdf4_accum_3_1_U0_ap_return_2),
    .ap_return_3(tdf4_accum_3_1_U0_ap_return_3)
);

td_fused_top_tdf4_accum_3_2 tdf4_accum_3_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_3_2_U0_ap_start),
    .ap_done(tdf4_accum_3_2_U0_ap_done),
    .ap_continue(tdf4_accum_3_2_U0_ap_continue),
    .ap_idle(tdf4_accum_3_2_U0_ap_idle),
    .ap_ready(tdf4_accum_3_2_U0_ap_ready),
    .accum_in_address0(tdf4_accum_3_2_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_3_2_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_2_t_q0),
    .accum_in_address1(tdf4_accum_3_2_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_3_2_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_2_t_q1),
    .ap_return_0(tdf4_accum_3_2_U0_ap_return_0),
    .ap_return_1(tdf4_accum_3_2_U0_ap_return_1),
    .ap_return_2(tdf4_accum_3_2_U0_ap_return_2),
    .ap_return_3(tdf4_accum_3_2_U0_ap_return_3)
);

td_fused_top_tdf4_accum_3_3 tdf4_accum_3_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_3_3_U0_ap_start),
    .ap_done(tdf4_accum_3_3_U0_ap_done),
    .ap_continue(tdf4_accum_3_3_U0_ap_continue),
    .ap_idle(tdf4_accum_3_3_U0_ap_idle),
    .ap_ready(tdf4_accum_3_3_U0_ap_ready),
    .accum_in_address0(tdf4_accum_3_3_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_3_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_3_t_q0),
    .accum_in_address1(tdf4_accum_3_3_U0_accum_in_address1),
    .accum_in_ce1(tdf4_accum_3_3_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_3_t_q1),
    .ap_return_0(tdf4_accum_3_3_U0_ap_return_0),
    .ap_return_1(tdf4_accum_3_3_U0_ap_return_1),
    .ap_return_2(tdf4_accum_3_3_U0_ap_return_2),
    .ap_return_3(tdf4_accum_3_3_U0_ap_return_3)
);

td_fused_top_tdf4_accum_4 tdf4_accum_4_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_4_U0_ap_start),
    .ap_done(tdf4_accum_4_U0_ap_done),
    .ap_continue(tdf4_accum_4_U0_ap_continue),
    .ap_idle(tdf4_accum_4_U0_ap_idle),
    .ap_ready(tdf4_accum_4_U0_ap_ready),
    .accum_in_0(tdf4_accum_4_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf4_accum_4_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_0_0_dout),
    .accum_in_1_read(accum3_out_0_1_dout),
    .accum_in_2_read(accum3_out_0_2_dout),
    .accum_in_3_read(accum3_out_0_3_dout)
);

td_fused_top_Block_entry_proc_proc512 Block_entry_proc_proc512_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc512_U0_ap_start),
    .ap_done(Block_entry_proc_proc512_U0_ap_done),
    .ap_continue(Block_entry_proc_proc512_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc512_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc512_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc512_U0_ap_return)
);

td_fused_top_tdf4_accum_4_1 tdf4_accum_4_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_4_1_U0_ap_start),
    .ap_done(tdf4_accum_4_1_U0_ap_done),
    .ap_continue(tdf4_accum_4_1_U0_ap_continue),
    .ap_idle(tdf4_accum_4_1_U0_ap_idle),
    .ap_ready(tdf4_accum_4_1_U0_ap_ready),
    .accum_in_0(tdf4_accum_4_1_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf4_accum_4_1_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_1_0_dout),
    .accum_in_1_read(accum3_out_1_1_dout),
    .accum_in_2_read(accum3_out_1_2_dout),
    .accum_in_3_read(accum3_out_1_3_dout)
);

td_fused_top_Block_entry_proc_proc513 Block_entry_proc_proc513_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc513_U0_ap_start),
    .ap_done(Block_entry_proc_proc513_U0_ap_done),
    .ap_continue(Block_entry_proc_proc513_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc513_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc513_U0_ap_ready),
    .tmp_218(tmp_218_channel_dout),
    .ap_return(Block_entry_proc_proc513_U0_ap_return)
);

td_fused_top_tdf4_accum_4_2 tdf4_accum_4_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_4_2_U0_ap_start),
    .ap_done(tdf4_accum_4_2_U0_ap_done),
    .ap_continue(tdf4_accum_4_2_U0_ap_continue),
    .ap_idle(tdf4_accum_4_2_U0_ap_idle),
    .ap_ready(tdf4_accum_4_2_U0_ap_ready),
    .accum_in_0(tdf4_accum_4_2_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf4_accum_4_2_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_2_0_dout),
    .accum_in_1_read(accum3_out_2_1_dout),
    .accum_in_2_read(accum3_out_2_2_dout),
    .accum_in_3_read(accum3_out_2_3_dout)
);

td_fused_top_Block_entry_proc_proc514 Block_entry_proc_proc514_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc514_U0_ap_start),
    .ap_done(Block_entry_proc_proc514_U0_ap_done),
    .ap_continue(Block_entry_proc_proc514_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc514_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc514_U0_ap_ready),
    .tmp_219(tmp_219_channel_dout),
    .ap_return(Block_entry_proc_proc514_U0_ap_return)
);

td_fused_top_tdf4_accum_4_3 tdf4_accum_4_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_4_3_U0_ap_start),
    .ap_done(tdf4_accum_4_3_U0_ap_done),
    .ap_continue(tdf4_accum_4_3_U0_ap_continue),
    .ap_idle(tdf4_accum_4_3_U0_ap_idle),
    .ap_ready(tdf4_accum_4_3_U0_ap_ready),
    .accum_in_0(tdf4_accum_4_3_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf4_accum_4_3_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_3_0_dout),
    .accum_in_1_read(accum3_out_3_1_dout),
    .accum_in_2_read(accum3_out_3_2_dout),
    .accum_in_3_read(accum3_out_3_3_dout)
);

td_fused_top_Block_entry_proc_proc515 Block_entry_proc_proc515_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc515_U0_ap_start),
    .ap_done(Block_entry_proc_proc515_U0_ap_done),
    .ap_continue(Block_entry_proc_proc515_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc515_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc515_U0_ap_ready),
    .tmp_220(tmp_220_channel_dout),
    .ap_return(Block_entry_proc_proc515_U0_ap_return)
);

td_fused_top_tdf4_adjust tdf4_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_adjust_U0_ap_start),
    .ap_done(tdf4_adjust_U0_ap_done),
    .ap_continue(tdf4_adjust_U0_ap_continue),
    .ap_idle(tdf4_adjust_U0_ap_idle),
    .ap_ready(tdf4_adjust_U0_ap_ready),
    .sums_0_read(sums_0_dout),
    .sums_1_read(sums_1_dout),
    .sums_2_read(sums_2_dout),
    .sums_3_read(sums_3_dout),
    .adjustments_address0(tdf4_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf4_adjust_U0_adjustments_ce0),
    .adjustments_q0(l1_adjustments_q0),
    .indices_23_dout(indices_23_c1_dout),
    .indices_23_empty_n(indices_23_c1_empty_n),
    .indices_23_read(tdf4_adjust_U0_indices_23_read),
    .indices_23_out_din(tdf4_adjust_U0_indices_23_out_din),
    .indices_23_out_full_n(indices_23_c4_full_n),
    .indices_23_out_write(tdf4_adjust_U0_indices_23_out_write),
    .ap_return_0(tdf4_adjust_U0_ap_return_0),
    .ap_return_1(tdf4_adjust_U0_ap_return_1),
    .ap_return_2(tdf4_adjust_U0_ap_return_2),
    .ap_return_3(tdf4_adjust_U0_ap_return_3)
);

td_fused_top_tdf4_l2_multiply34 tdf4_l2_multiply34_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_l2_multiply34_U0_ap_start),
    .ap_done(tdf4_l2_multiply34_U0_ap_done),
    .ap_continue(tdf4_l2_multiply34_U0_ap_continue),
    .ap_idle(tdf4_l2_multiply34_U0_ap_idle),
    .ap_ready(tdf4_l2_multiply34_U0_ap_ready),
    .intermediate_fmaps_0_read(intermediate_fmaps_0_dout),
    .intermediate_fmaps_1_read(intermediate_fmaps_1_dout),
    .intermediate_fmaps_2_read(intermediate_fmaps_2_dout),
    .intermediate_fmaps_3_read(intermediate_fmaps_3_dout),
    .l2_filter_data_0_address0(tdf4_l2_multiply34_U0_l2_filter_data_0_address0),
    .l2_filter_data_0_ce0(tdf4_l2_multiply34_U0_l2_filter_data_0_ce0),
    .l2_filter_data_0_q0(l2_filter_data_0_q0),
    .l2_filter_data_0_address1(tdf4_l2_multiply34_U0_l2_filter_data_0_address1),
    .l2_filter_data_0_ce1(tdf4_l2_multiply34_U0_l2_filter_data_0_ce1),
    .l2_filter_data_0_q1(l2_filter_data_0_q1),
    .l2_filter_data_1_address0(tdf4_l2_multiply34_U0_l2_filter_data_1_address0),
    .l2_filter_data_1_ce0(tdf4_l2_multiply34_U0_l2_filter_data_1_ce0),
    .l2_filter_data_1_q0(l2_filter_data_1_q0),
    .l2_filter_data_1_address1(tdf4_l2_multiply34_U0_l2_filter_data_1_address1),
    .l2_filter_data_1_ce1(tdf4_l2_multiply34_U0_l2_filter_data_1_ce1),
    .l2_filter_data_1_q1(l2_filter_data_1_q1),
    .l2_products_0_address0(tdf4_l2_multiply34_U0_l2_products_0_address0),
    .l2_products_0_ce0(tdf4_l2_multiply34_U0_l2_products_0_ce0),
    .l2_products_0_we0(tdf4_l2_multiply34_U0_l2_products_0_we0),
    .l2_products_0_d0(tdf4_l2_multiply34_U0_l2_products_0_d0),
    .l2_products_1_address0(tdf4_l2_multiply34_U0_l2_products_1_address0),
    .l2_products_1_ce0(tdf4_l2_multiply34_U0_l2_products_1_ce0),
    .l2_products_1_we0(tdf4_l2_multiply34_U0_l2_products_1_we0),
    .l2_products_1_d0(tdf4_l2_multiply34_U0_l2_products_1_d0),
    .l2_products_2_address0(tdf4_l2_multiply34_U0_l2_products_2_address0),
    .l2_products_2_ce0(tdf4_l2_multiply34_U0_l2_products_2_ce0),
    .l2_products_2_we0(tdf4_l2_multiply34_U0_l2_products_2_we0),
    .l2_products_2_d0(tdf4_l2_multiply34_U0_l2_products_2_d0),
    .l2_products_3_address0(tdf4_l2_multiply34_U0_l2_products_3_address0),
    .l2_products_3_ce0(tdf4_l2_multiply34_U0_l2_products_3_ce0),
    .l2_products_3_we0(tdf4_l2_multiply34_U0_l2_products_3_we0),
    .l2_products_3_d0(tdf4_l2_multiply34_U0_l2_products_3_d0),
    .indices_23_dout(indices_23_c4_dout),
    .indices_23_empty_n(indices_23_c4_empty_n),
    .indices_23_read(tdf4_l2_multiply34_U0_indices_23_read)
);

td_fused_top_tdf4_l2_accum tdf4_l2_accum_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_l2_accum_U0_ap_start),
    .ap_done(tdf4_l2_accum_U0_ap_done),
    .ap_continue(tdf4_l2_accum_U0_ap_continue),
    .ap_idle(tdf4_l2_accum_U0_ap_idle),
    .ap_ready(tdf4_l2_accum_U0_ap_ready),
    .l2_products_0_address0(tdf4_l2_accum_U0_l2_products_0_address0),
    .l2_products_0_ce0(tdf4_l2_accum_U0_l2_products_0_ce0),
    .l2_products_0_q0(l2_products_0_t_q0),
    .l2_products_0_address1(tdf4_l2_accum_U0_l2_products_0_address1),
    .l2_products_0_ce1(tdf4_l2_accum_U0_l2_products_0_ce1),
    .l2_products_0_q1(l2_products_0_t_q1),
    .l2_products_1_address0(tdf4_l2_accum_U0_l2_products_1_address0),
    .l2_products_1_ce0(tdf4_l2_accum_U0_l2_products_1_ce0),
    .l2_products_1_q0(l2_products_1_t_q0),
    .l2_products_1_address1(tdf4_l2_accum_U0_l2_products_1_address1),
    .l2_products_1_ce1(tdf4_l2_accum_U0_l2_products_1_ce1),
    .l2_products_1_q1(l2_products_1_t_q1),
    .l2_products_2_address0(tdf4_l2_accum_U0_l2_products_2_address0),
    .l2_products_2_ce0(tdf4_l2_accum_U0_l2_products_2_ce0),
    .l2_products_2_q0(l2_products_2_t_q0),
    .l2_products_2_address1(tdf4_l2_accum_U0_l2_products_2_address1),
    .l2_products_2_ce1(tdf4_l2_accum_U0_l2_products_2_ce1),
    .l2_products_2_q1(l2_products_2_t_q1),
    .l2_products_3_address0(tdf4_l2_accum_U0_l2_products_3_address0),
    .l2_products_3_ce0(tdf4_l2_accum_U0_l2_products_3_ce0),
    .l2_products_3_q0(l2_products_3_t_q0),
    .l2_products_3_address1(tdf4_l2_accum_U0_l2_products_3_address1),
    .l2_products_3_ce1(tdf4_l2_accum_U0_l2_products_3_ce1),
    .l2_products_3_q1(l2_products_3_t_q1),
    .l2_partial_sums_0_address0(tdf4_l2_accum_U0_l2_partial_sums_0_address0),
    .l2_partial_sums_0_ce0(tdf4_l2_accum_U0_l2_partial_sums_0_ce0),
    .l2_partial_sums_0_we0(tdf4_l2_accum_U0_l2_partial_sums_0_we0),
    .l2_partial_sums_0_d0(tdf4_l2_accum_U0_l2_partial_sums_0_d0),
    .l2_partial_sums_0_address1(tdf4_l2_accum_U0_l2_partial_sums_0_address1),
    .l2_partial_sums_0_ce1(tdf4_l2_accum_U0_l2_partial_sums_0_ce1),
    .l2_partial_sums_0_we1(tdf4_l2_accum_U0_l2_partial_sums_0_we1),
    .l2_partial_sums_0_d1(tdf4_l2_accum_U0_l2_partial_sums_0_d1),
    .l2_partial_sums_1_address0(tdf4_l2_accum_U0_l2_partial_sums_1_address0),
    .l2_partial_sums_1_ce0(tdf4_l2_accum_U0_l2_partial_sums_1_ce0),
    .l2_partial_sums_1_we0(tdf4_l2_accum_U0_l2_partial_sums_1_we0),
    .l2_partial_sums_1_d0(tdf4_l2_accum_U0_l2_partial_sums_1_d0),
    .l2_partial_sums_1_address1(tdf4_l2_accum_U0_l2_partial_sums_1_address1),
    .l2_partial_sums_1_ce1(tdf4_l2_accum_U0_l2_partial_sums_1_ce1),
    .l2_partial_sums_1_we1(tdf4_l2_accum_U0_l2_partial_sums_1_we1),
    .l2_partial_sums_1_d1(tdf4_l2_accum_U0_l2_partial_sums_1_d1),
    .l2_partial_sums_2_address0(tdf4_l2_accum_U0_l2_partial_sums_2_address0),
    .l2_partial_sums_2_ce0(tdf4_l2_accum_U0_l2_partial_sums_2_ce0),
    .l2_partial_sums_2_we0(tdf4_l2_accum_U0_l2_partial_sums_2_we0),
    .l2_partial_sums_2_d0(tdf4_l2_accum_U0_l2_partial_sums_2_d0),
    .l2_partial_sums_2_address1(tdf4_l2_accum_U0_l2_partial_sums_2_address1),
    .l2_partial_sums_2_ce1(tdf4_l2_accum_U0_l2_partial_sums_2_ce1),
    .l2_partial_sums_2_we1(tdf4_l2_accum_U0_l2_partial_sums_2_we1),
    .l2_partial_sums_2_d1(tdf4_l2_accum_U0_l2_partial_sums_2_d1),
    .l2_partial_sums_3_address0(tdf4_l2_accum_U0_l2_partial_sums_3_address0),
    .l2_partial_sums_3_ce0(tdf4_l2_accum_U0_l2_partial_sums_3_ce0),
    .l2_partial_sums_3_we0(tdf4_l2_accum_U0_l2_partial_sums_3_we0),
    .l2_partial_sums_3_d0(tdf4_l2_accum_U0_l2_partial_sums_3_d0),
    .l2_partial_sums_3_address1(tdf4_l2_accum_U0_l2_partial_sums_3_address1),
    .l2_partial_sums_3_ce1(tdf4_l2_accum_U0_l2_partial_sums_3_ce1),
    .l2_partial_sums_3_we1(tdf4_l2_accum_U0_l2_partial_sums_3_we1),
    .l2_partial_sums_3_d1(tdf4_l2_accum_U0_l2_partial_sums_3_d1)
);

td_fused_top_tdf4_l2_writeOutputs_1 tdf4_l2_writeOutputs_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_l2_writeOutputs_1_U0_ap_start),
    .ap_done(tdf4_l2_writeOutputs_1_U0_ap_done),
    .ap_continue(tdf4_l2_writeOutputs_1_U0_ap_continue),
    .ap_idle(tdf4_l2_writeOutputs_1_U0_ap_idle),
    .ap_ready(tdf4_l2_writeOutputs_1_U0_ap_ready),
    .indices_01_dout(indices_01_c2_dout),
    .indices_01_empty_n(indices_01_c2_empty_n),
    .indices_01_read(tdf4_l2_writeOutputs_1_U0_indices_01_read),
    .indices_12_dout(indices_12_c3_dout),
    .indices_12_empty_n(indices_12_c3_empty_n),
    .indices_12_read(tdf4_l2_writeOutputs_1_U0_indices_12_read),
    .write4_dout(write4_c_dout),
    .write4_empty_n(write4_c_empty_n),
    .write4_read(tdf4_l2_writeOutputs_1_U0_write4_read),
    .l2_partial_sums_0_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_address0),
    .l2_partial_sums_0_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_0_ce0),
    .l2_partial_sums_0_q0(l2_partial_sums_0_t_q0),
    .l2_partial_sums_1_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_address0),
    .l2_partial_sums_1_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_1_ce0),
    .l2_partial_sums_1_q0(l2_partial_sums_1_t_q0),
    .l2_partial_sums_2_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_address0),
    .l2_partial_sums_2_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_2_ce0),
    .l2_partial_sums_2_q0(l2_partial_sums_2_t_q0),
    .l2_partial_sums_3_address0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_address0),
    .l2_partial_sums_3_ce0(tdf4_l2_writeOutputs_1_U0_l2_partial_sums_3_ce0),
    .l2_partial_sums_3_q0(l2_partial_sums_3_t_q0),
    .out_data_address1(tdf4_l2_writeOutputs_1_U0_out_data_address1),
    .out_data_ce1(tdf4_l2_writeOutputs_1_U0_out_data_ce1),
    .out_data_we1(tdf4_l2_writeOutputs_1_U0_out_data_we1),
    .out_data_d1(tdf4_l2_writeOutputs_1_U0_out_data_d1),
    .l2_adjustments_address0(tdf4_l2_writeOutputs_1_U0_l2_adjustments_address0),
    .l2_adjustments_ce0(tdf4_l2_writeOutputs_1_U0_l2_adjustments_ce0),
    .l2_adjustments_q0(l2_adjustments_q0)
);

td_fused_top_fifo_w16_d2_S_x1 indices_01_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_01_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_readInputs37_U0_indices_01_read),
    .if_dout(indices_01_c_dout),
    .if_full_n(indices_01_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_indices_0_write),
    .if_din(tdf4_get_next_ijk_U0_indices_0_din)
);

td_fused_top_fifo_w16_d2_S_x1 indices_12_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_12_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_readInputs37_U0_indices_12_read),
    .if_dout(indices_12_c_dout),
    .if_full_n(indices_12_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_indices_1_write),
    .if_din(tdf4_get_next_ijk_U0_indices_1_din)
);

td_fused_top_fifo_w5_d2_S_x indices_23_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_23_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_readFilters36_U0_indices_23_read),
    .if_dout(indices_23_c_dout),
    .if_full_n(indices_23_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_indices_2_out_write),
    .if_din(tdf4_get_next_ijk_U0_indices_2_out_din)
);

td_fused_top_fifo_w5_d9_S indices_23_c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_23_c1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_adjust_U0_indices_23_read),
    .if_dout(indices_23_c1_dout),
    .if_full_n(indices_23_c1_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_indices_2_out1_write),
    .if_din(tdf4_get_next_ijk_U0_indices_2_out1_din)
);

td_fused_top_fifo_w1_d12_S write4_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(write4_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_1_U0_write4_read),
    .if_dout(write4_c_dout),
    .if_full_n(write4_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_write_r_write),
    .if_din(write4_c_din)
);

td_fused_top_fifo_w6_d11_S indices_01_c2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_01_c2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_1_U0_indices_01_read),
    .if_dout(indices_01_c2_dout),
    .if_full_n(indices_01_c2_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_readInputs37_U0_indices_01_out_write),
    .if_din(tdf4_readInputs37_U0_indices_01_out_din)
);

td_fused_top_fifo_w12_d11_S indices_12_c3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_12_c3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_1_U0_indices_12_read),
    .if_dout(indices_12_c3_dout),
    .if_full_n(indices_12_c3_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_readInputs37_U0_indices_12_out_write),
    .if_din(tdf4_readInputs37_U0_indices_12_out_din)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_0_dout),
    .if_full_n(accum3_out_0_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_0),
    .if_din(tdf4_accum_3_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_1_dout),
    .if_full_n(accum3_out_0_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_1),
    .if_din(tdf4_accum_3_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_0_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_2_dout),
    .if_full_n(accum3_out_0_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_2),
    .if_din(tdf4_accum_3_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_0_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_3_dout),
    .if_full_n(accum3_out_0_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_3),
    .if_din(tdf4_accum_3_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_0_dout),
    .if_full_n(accum3_out_1_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_0),
    .if_din(tdf4_accum_3_1_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_1_dout),
    .if_full_n(accum3_out_1_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_1),
    .if_din(tdf4_accum_3_1_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_1_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_2_dout),
    .if_full_n(accum3_out_1_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_2),
    .if_din(tdf4_accum_3_1_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_1_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_3_dout),
    .if_full_n(accum3_out_1_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_3),
    .if_din(tdf4_accum_3_1_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_0_dout),
    .if_full_n(accum3_out_2_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_0),
    .if_din(tdf4_accum_3_2_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_1_dout),
    .if_full_n(accum3_out_2_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_1),
    .if_din(tdf4_accum_3_2_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_2_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_2_dout),
    .if_full_n(accum3_out_2_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_2),
    .if_din(tdf4_accum_3_2_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_2_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_3_dout),
    .if_full_n(accum3_out_2_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_3),
    .if_din(tdf4_accum_3_2_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_0_dout),
    .if_full_n(accum3_out_3_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_0),
    .if_din(tdf4_accum_3_3_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_1_dout),
    .if_full_n(accum3_out_3_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_1),
    .if_din(tdf4_accum_3_3_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_3_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_2_dout),
    .if_full_n(accum3_out_3_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_2),
    .if_din(tdf4_accum_3_3_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x1 accum3_out_3_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_3_dout),
    .if_full_n(accum3_out_3_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_3),
    .if_din(tdf4_accum_3_3_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S_x1 tmp_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc512_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_accum_4_U0_ap_done),
    .if_din(tdf4_accum_4_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S_x1 sums_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_adjust_U0_ap_ready),
    .if_dout(sums_0_dout),
    .if_full_n(sums_0_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc512_U0_ap_done),
    .if_din(Block_entry_proc_proc512_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x1 tmp_218_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_218_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc513_U0_ap_ready),
    .if_dout(tmp_218_channel_dout),
    .if_full_n(tmp_218_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_accum_4_1_U0_ap_done),
    .if_din(tdf4_accum_4_1_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S_x1 sums_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_adjust_U0_ap_ready),
    .if_dout(sums_1_dout),
    .if_full_n(sums_1_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc513_U0_ap_done),
    .if_din(Block_entry_proc_proc513_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x1 tmp_219_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_219_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc514_U0_ap_ready),
    .if_dout(tmp_219_channel_dout),
    .if_full_n(tmp_219_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_accum_4_2_U0_ap_done),
    .if_din(tdf4_accum_4_2_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S_x1 sums_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_adjust_U0_ap_ready),
    .if_dout(sums_2_dout),
    .if_full_n(sums_2_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc514_U0_ap_done),
    .if_din(Block_entry_proc_proc514_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x1 tmp_220_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_220_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc515_U0_ap_ready),
    .if_dout(tmp_220_channel_dout),
    .if_full_n(tmp_220_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_accum_4_3_U0_ap_done),
    .if_din(tdf4_accum_4_3_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S_x1 sums_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_adjust_U0_ap_ready),
    .if_dout(sums_3_dout),
    .if_full_n(sums_3_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc515_U0_ap_done),
    .if_din(Block_entry_proc_proc515_U0_ap_return)
);

td_fused_top_fifo_w5_d2_S_x indices_23_c4_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_23_c4_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_multiply34_U0_indices_23_read),
    .if_dout(indices_23_c4_dout),
    .if_full_n(indices_23_c4_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_adjust_U0_indices_23_out_write),
    .if_din(tdf4_adjust_U0_indices_23_out_din)
);

td_fused_top_fifo_w16_d2_S_x1 intermediate_fmaps_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(intermediate_fmaps_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_multiply34_U0_ap_ready),
    .if_dout(intermediate_fmaps_0_dout),
    .if_full_n(intermediate_fmaps_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_intermediate_fmaps_0),
    .if_din(tdf4_adjust_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x1 intermediate_fmaps_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(intermediate_fmaps_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_multiply34_U0_ap_ready),
    .if_dout(intermediate_fmaps_1_dout),
    .if_full_n(intermediate_fmaps_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_intermediate_fmaps_1),
    .if_din(tdf4_adjust_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x1 intermediate_fmaps_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(intermediate_fmaps_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_multiply34_U0_ap_ready),
    .if_dout(intermediate_fmaps_2_dout),
    .if_full_n(intermediate_fmaps_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_intermediate_fmaps_2),
    .if_din(tdf4_adjust_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x1 intermediate_fmaps_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(intermediate_fmaps_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_multiply34_U0_ap_ready),
    .if_dout(intermediate_fmaps_3_dout),
    .if_full_n(intermediate_fmaps_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_intermediate_fmaps_3),
    .if_din(tdf4_adjust_U0_ap_return_3)
);

td_fused_top_start_for_tdf4_readFilters36_U0 start_for_tdf4_readFilters36_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(start_for_tdf4_readFilters36_U0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_readFilters36_U0_ap_ready),
    .if_dout(start_for_tdf4_readFilters36_U0_dout),
    .if_full_n(start_for_tdf4_readFilters36_U0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_start_write),
    .if_din(start_for_tdf4_readFilters36_U0_din)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_0_0 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_U0_ap_done & tdf4_accum_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_0_0 <= ap_sync_channel_write_accum3_out_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_0_1 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_U0_ap_done & tdf4_accum_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_0_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_0_1 <= ap_sync_channel_write_accum3_out_0_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_0_2 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_U0_ap_done & tdf4_accum_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_0_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_0_2 <= ap_sync_channel_write_accum3_out_0_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_0_3 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_U0_ap_done & tdf4_accum_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_0_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_0_3 <= ap_sync_channel_write_accum3_out_0_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_1_0 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_1_U0_ap_done & tdf4_accum_3_1_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_1_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_1_0 <= ap_sync_channel_write_accum3_out_1_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_1_1 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_1_U0_ap_done & tdf4_accum_3_1_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_1_1 <= ap_sync_channel_write_accum3_out_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_1_2 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_1_U0_ap_done & tdf4_accum_3_1_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_1_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_1_2 <= ap_sync_channel_write_accum3_out_1_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_1_3 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_1_U0_ap_done & tdf4_accum_3_1_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_1_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_1_3 <= ap_sync_channel_write_accum3_out_1_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_2_0 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_2_U0_ap_done & tdf4_accum_3_2_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_2_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_2_0 <= ap_sync_channel_write_accum3_out_2_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_2_1 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_2_U0_ap_done & tdf4_accum_3_2_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_2_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_2_1 <= ap_sync_channel_write_accum3_out_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_2_2 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_2_U0_ap_done & tdf4_accum_3_2_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_2_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_2_2 <= ap_sync_channel_write_accum3_out_2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_2_3 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_2_U0_ap_done & tdf4_accum_3_2_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_2_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_2_3 <= ap_sync_channel_write_accum3_out_2_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_3_0 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_3_U0_ap_done & tdf4_accum_3_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_3_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_3_0 <= ap_sync_channel_write_accum3_out_3_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_3_1 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_3_U0_ap_done & tdf4_accum_3_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_3_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_3_1 <= ap_sync_channel_write_accum3_out_3_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_3_2 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_3_U0_ap_done & tdf4_accum_3_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_3_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_3_2 <= ap_sync_channel_write_accum3_out_3_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_3_3 <= 1'b0;
    end else begin
        if (((tdf4_accum_3_3_U0_ap_done & tdf4_accum_3_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_3_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_3_3 <= ap_sync_channel_write_accum3_out_3_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_0 <= 1'b0;
    end else begin
        if (((tdf4_readInputs37_U0_ap_done & tdf4_readInputs37_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_0 <= ap_sync_channel_write_ifmap_vec_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_1 <= 1'b0;
    end else begin
        if (((tdf4_readInputs37_U0_ap_done & tdf4_readInputs37_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_1 <= ap_sync_channel_write_ifmap_vec_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_2 <= 1'b0;
    end else begin
        if (((tdf4_readInputs37_U0_ap_done & tdf4_readInputs37_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_2 <= ap_sync_channel_write_ifmap_vec_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_3 <= 1'b0;
    end else begin
        if (((tdf4_readInputs37_U0_ap_done & tdf4_readInputs37_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_3 <= ap_sync_channel_write_ifmap_vec_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_intermediate_fmaps_0 <= 1'b0;
    end else begin
        if (((tdf4_adjust_U0_ap_done & tdf4_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_intermediate_fmaps_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_intermediate_fmaps_0 <= ap_sync_channel_write_intermediate_fmaps_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_intermediate_fmaps_1 <= 1'b0;
    end else begin
        if (((tdf4_adjust_U0_ap_done & tdf4_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_intermediate_fmaps_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_intermediate_fmaps_1 <= ap_sync_channel_write_intermediate_fmaps_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_intermediate_fmaps_2 <= 1'b0;
    end else begin
        if (((tdf4_adjust_U0_ap_done & tdf4_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_intermediate_fmaps_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_intermediate_fmaps_2 <= ap_sync_channel_write_intermediate_fmaps_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_intermediate_fmaps_3 <= 1'b0;
    end else begin
        if (((tdf4_adjust_U0_ap_done & tdf4_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_intermediate_fmaps_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_intermediate_fmaps_3 <= ap_sync_channel_write_intermediate_fmaps_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_partial_sums_0 <= 1'b0;
    end else begin
        if (((tdf4_l2_accum_U0_ap_done & tdf4_l2_accum_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_partial_sums_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_partial_sums_0 <= ap_sync_channel_write_l2_partial_sums_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_partial_sums_1 <= 1'b0;
    end else begin
        if (((tdf4_l2_accum_U0_ap_done & tdf4_l2_accum_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_partial_sums_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_partial_sums_1 <= ap_sync_channel_write_l2_partial_sums_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_partial_sums_2 <= 1'b0;
    end else begin
        if (((tdf4_l2_accum_U0_ap_done & tdf4_l2_accum_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_partial_sums_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_partial_sums_2 <= ap_sync_channel_write_l2_partial_sums_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_partial_sums_3 <= 1'b0;
    end else begin
        if (((tdf4_l2_accum_U0_ap_done & tdf4_l2_accum_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_partial_sums_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_partial_sums_3 <= ap_sync_channel_write_l2_partial_sums_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_products_0 <= 1'b0;
    end else begin
        if (((tdf4_l2_multiply34_U0_ap_done & tdf4_l2_multiply34_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_products_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_products_0 <= ap_sync_channel_write_l2_products_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_products_1 <= 1'b0;
    end else begin
        if (((tdf4_l2_multiply34_U0_ap_done & tdf4_l2_multiply34_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_products_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_products_1 <= ap_sync_channel_write_l2_products_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_products_2 <= 1'b0;
    end else begin
        if (((tdf4_l2_multiply34_U0_ap_done & tdf4_l2_multiply34_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_products_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_products_2 <= ap_sync_channel_write_l2_products_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_l2_products_3 <= 1'b0;
    end else begin
        if (((tdf4_l2_multiply34_U0_ap_done & tdf4_l2_multiply34_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_l2_products_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_l2_products_3 <= ap_sync_channel_write_l2_products_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_0 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0_0 <= ap_sync_channel_write_products_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_1 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0_1 <= ap_sync_channel_write_products_0_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_2 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0_2 <= ap_sync_channel_write_products_0_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_3 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0_3 <= ap_sync_channel_write_products_0_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1_0 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_0 <= ap_sync_channel_write_products_1_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1_1 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_1 <= ap_sync_channel_write_products_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1_2 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_2 <= ap_sync_channel_write_products_1_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1_3 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_3 <= ap_sync_channel_write_products_1_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2_0 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2_0 <= ap_sync_channel_write_products_2_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2_1 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2_1 <= ap_sync_channel_write_products_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2_2 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2_2 <= ap_sync_channel_write_products_2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2_3 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2_3 <= ap_sync_channel_write_products_2_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3_0 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3_0 <= ap_sync_channel_write_products_3_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3_1 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3_1 <= ap_sync_channel_write_products_3_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3_2 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3_2 <= ap_sync_channel_write_products_3_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3_3 <= 1'b0;
    end else begin
        if (((tdf4_dot_product_U0_ap_done & tdf4_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3_3 <= ap_sync_channel_write_products_3_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_0 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_0 <= ap_sync_channel_write_weight_vecs_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_1 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_1 <= ap_sync_channel_write_weight_vecs_0_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_2 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_2 <= ap_sync_channel_write_weight_vecs_0_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_3 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_3 <= ap_sync_channel_write_weight_vecs_0_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_0 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_0 <= ap_sync_channel_write_weight_vecs_1_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_1 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_1 <= ap_sync_channel_write_weight_vecs_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_2 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_2 <= ap_sync_channel_write_weight_vecs_1_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_3 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_3 <= ap_sync_channel_write_weight_vecs_1_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2_0 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2_0 <= ap_sync_channel_write_weight_vecs_2_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2_1 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2_1 <= ap_sync_channel_write_weight_vecs_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2_2 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2_2 <= ap_sync_channel_write_weight_vecs_2_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2_3 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2_3 <= ap_sync_channel_write_weight_vecs_2_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3_0 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3_0 <= ap_sync_channel_write_weight_vecs_3_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3_1 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3_1 <= ap_sync_channel_write_weight_vecs_3_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3_2 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3_2 <= ap_sync_channel_write_weight_vecs_3_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3_3 <= 1'b0;
    end else begin
        if (((tdf4_readFilters36_U0_ap_done & tdf4_readFilters36_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3_3 <= ap_sync_channel_write_weight_vecs_3_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready <= ap_sync_tdf4_get_next_ijk_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf4_readInputs37_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf4_readInputs37_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf4_readInputs37_U0_ap_ready <= ap_sync_tdf4_readInputs37_U0_ap_ready;
        end
    end
end

assign Block_entry_proc_proc512_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc512_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc512_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc512_U0_start_write = 1'b0;

assign Block_entry_proc_proc513_U0_ap_continue = sums_1_full_n;

assign Block_entry_proc_proc513_U0_ap_start = tmp_218_channel_empty_n;

assign Block_entry_proc_proc513_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc513_U0_start_write = 1'b0;

assign Block_entry_proc_proc514_U0_ap_continue = sums_2_full_n;

assign Block_entry_proc_proc514_U0_ap_start = tmp_219_channel_empty_n;

assign Block_entry_proc_proc514_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc514_U0_start_write = 1'b0;

assign Block_entry_proc_proc515_U0_ap_continue = sums_3_full_n;

assign Block_entry_proc_proc515_U0_ap_start = tmp_220_channel_empty_n;

assign Block_entry_proc_proc515_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc515_U0_start_write = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf4_accum_1_U0_ap_done;

assign ap_channel_done_accum1_out_1 = tdf4_accum_1_U1_1_ap_done;

assign ap_channel_done_accum1_out_2 = tdf4_accum_1_U2_2_ap_done;

assign ap_channel_done_accum1_out_3 = tdf4_accum_1_U3_3_ap_done;

assign ap_channel_done_accum2_out_0 = tdf4_accum_2_U0_ap_done;

assign ap_channel_done_accum2_out_1 = tdf4_accum_2_U1_1_ap_done;

assign ap_channel_done_accum2_out_2 = tdf4_accum_2_U2_2_ap_done;

assign ap_channel_done_accum2_out_3 = tdf4_accum_2_U3_3_ap_done;

assign ap_channel_done_accum3_out_0_0 = (tdf4_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_0 ^ 1'b1));

assign ap_channel_done_accum3_out_0_1 = (tdf4_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_1 ^ 1'b1));

assign ap_channel_done_accum3_out_0_2 = (tdf4_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_2 ^ 1'b1));

assign ap_channel_done_accum3_out_0_3 = (tdf4_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_3 ^ 1'b1));

assign ap_channel_done_accum3_out_1_0 = (tdf4_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_0 ^ 1'b1));

assign ap_channel_done_accum3_out_1_1 = (tdf4_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_1 ^ 1'b1));

assign ap_channel_done_accum3_out_1_2 = (tdf4_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_2 ^ 1'b1));

assign ap_channel_done_accum3_out_1_3 = (tdf4_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_3 ^ 1'b1));

assign ap_channel_done_accum3_out_2_0 = (tdf4_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_0 ^ 1'b1));

assign ap_channel_done_accum3_out_2_1 = (tdf4_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_1 ^ 1'b1));

assign ap_channel_done_accum3_out_2_2 = (tdf4_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_2 ^ 1'b1));

assign ap_channel_done_accum3_out_2_3 = (tdf4_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_3 ^ 1'b1));

assign ap_channel_done_accum3_out_3_0 = (tdf4_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_0 ^ 1'b1));

assign ap_channel_done_accum3_out_3_1 = (tdf4_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_1 ^ 1'b1));

assign ap_channel_done_accum3_out_3_2 = (tdf4_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_2 ^ 1'b1));

assign ap_channel_done_accum3_out_3_3 = (tdf4_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_3 ^ 1'b1));

assign ap_channel_done_ifmap_vec_0 = (tdf4_readInputs37_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_0 ^ 1'b1));

assign ap_channel_done_ifmap_vec_1 = (tdf4_readInputs37_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_1 ^ 1'b1));

assign ap_channel_done_ifmap_vec_2 = (tdf4_readInputs37_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_2 ^ 1'b1));

assign ap_channel_done_ifmap_vec_3 = (tdf4_readInputs37_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_3 ^ 1'b1));

assign ap_channel_done_intermediate_fmaps_0 = (tdf4_adjust_U0_ap_done & (ap_sync_reg_channel_write_intermediate_fmaps_0 ^ 1'b1));

assign ap_channel_done_intermediate_fmaps_1 = (tdf4_adjust_U0_ap_done & (ap_sync_reg_channel_write_intermediate_fmaps_1 ^ 1'b1));

assign ap_channel_done_intermediate_fmaps_2 = (tdf4_adjust_U0_ap_done & (ap_sync_reg_channel_write_intermediate_fmaps_2 ^ 1'b1));

assign ap_channel_done_intermediate_fmaps_3 = (tdf4_adjust_U0_ap_done & (ap_sync_reg_channel_write_intermediate_fmaps_3 ^ 1'b1));

assign ap_channel_done_l2_partial_sums_0 = (tdf4_l2_accum_U0_ap_done & (ap_sync_reg_channel_write_l2_partial_sums_0 ^ 1'b1));

assign ap_channel_done_l2_partial_sums_1 = (tdf4_l2_accum_U0_ap_done & (ap_sync_reg_channel_write_l2_partial_sums_1 ^ 1'b1));

assign ap_channel_done_l2_partial_sums_2 = (tdf4_l2_accum_U0_ap_done & (ap_sync_reg_channel_write_l2_partial_sums_2 ^ 1'b1));

assign ap_channel_done_l2_partial_sums_3 = (tdf4_l2_accum_U0_ap_done & (ap_sync_reg_channel_write_l2_partial_sums_3 ^ 1'b1));

assign ap_channel_done_l2_products_0 = (tdf4_l2_multiply34_U0_ap_done & (ap_sync_reg_channel_write_l2_products_0 ^ 1'b1));

assign ap_channel_done_l2_products_1 = (tdf4_l2_multiply34_U0_ap_done & (ap_sync_reg_channel_write_l2_products_1 ^ 1'b1));

assign ap_channel_done_l2_products_2 = (tdf4_l2_multiply34_U0_ap_done & (ap_sync_reg_channel_write_l2_products_2 ^ 1'b1));

assign ap_channel_done_l2_products_3 = (tdf4_l2_multiply34_U0_ap_done & (ap_sync_reg_channel_write_l2_products_3 ^ 1'b1));

assign ap_channel_done_products_0_0 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_0 ^ 1'b1));

assign ap_channel_done_products_0_1 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_1 ^ 1'b1));

assign ap_channel_done_products_0_2 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_2 ^ 1'b1));

assign ap_channel_done_products_0_3 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_3 ^ 1'b1));

assign ap_channel_done_products_1_0 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_0 ^ 1'b1));

assign ap_channel_done_products_1_1 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_1 ^ 1'b1));

assign ap_channel_done_products_1_2 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_2 ^ 1'b1));

assign ap_channel_done_products_1_3 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_3 ^ 1'b1));

assign ap_channel_done_products_2_0 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_0 ^ 1'b1));

assign ap_channel_done_products_2_1 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_1 ^ 1'b1));

assign ap_channel_done_products_2_2 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_2 ^ 1'b1));

assign ap_channel_done_products_2_3 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_3 ^ 1'b1));

assign ap_channel_done_products_3_0 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_0 ^ 1'b1));

assign ap_channel_done_products_3_1 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_1 ^ 1'b1));

assign ap_channel_done_products_3_2 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_2 ^ 1'b1));

assign ap_channel_done_products_3_3 = (tdf4_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_3 ^ 1'b1));

assign ap_channel_done_sums_0 = Block_entry_proc_proc512_U0_ap_done;

assign ap_channel_done_sums_1 = Block_entry_proc_proc513_U0_ap_done;

assign ap_channel_done_sums_2 = Block_entry_proc_proc514_U0_ap_done;

assign ap_channel_done_sums_3 = Block_entry_proc_proc515_U0_ap_done;

assign ap_channel_done_tmp_218_channel = tdf4_accum_4_1_U0_ap_done;

assign ap_channel_done_tmp_219_channel = tdf4_accum_4_2_U0_ap_done;

assign ap_channel_done_tmp_220_channel = tdf4_accum_4_3_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf4_accum_4_U0_ap_done;

assign ap_channel_done_weight_vecs_0_0 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_0_1 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_0_2 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_2 ^ 1'b1));

assign ap_channel_done_weight_vecs_0_3 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_3 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_0 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_1 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_2 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_2 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_3 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_3 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_0 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_1 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_2 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_2 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_3 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_3 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_0 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_1 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_2 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_2 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_3 = (tdf4_readFilters36_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_3 ^ 1'b1));

assign ap_done = tdf4_l2_writeOutputs_1_U0_ap_done;

assign ap_idle = (tdf4_readInputs37_U0_ap_idle & tdf4_readFilters36_U0_ap_idle & tdf4_l2_writeOutputs_1_U0_ap_idle & tdf4_l2_multiply34_U0_ap_idle & tdf4_l2_accum_U0_ap_idle & tdf4_get_next_ijk_U0_ap_idle & tdf4_dot_product_U0_ap_idle & tdf4_adjust_U0_ap_idle & tdf4_accum_4_U0_ap_idle & tdf4_accum_4_3_U0_ap_idle & tdf4_accum_4_2_U0_ap_idle & tdf4_accum_4_1_U0_ap_idle & tdf4_accum_3_U0_ap_idle & tdf4_accum_3_3_U0_ap_idle & tdf4_accum_3_2_U0_ap_idle & tdf4_accum_3_1_U0_ap_idle & tdf4_accum_2_U3_3_ap_idle & tdf4_accum_2_U2_2_ap_idle & tdf4_accum_2_U1_1_ap_idle & tdf4_accum_2_U0_ap_idle & tdf4_accum_1_U3_3_ap_idle & tdf4_accum_1_U2_2_ap_idle & tdf4_accum_1_U1_1_ap_idle & tdf4_accum_1_U0_ap_idle & (intermediate_fmaps_3_empty_n ^ 1'b1) & (intermediate_fmaps_2_empty_n ^ 1'b1) & (intermediate_fmaps_1_empty_n ^ 1'b1) & (intermediate_fmaps_0_empty_n ^ 1'b1) & (sums_3_empty_n ^ 1'b1) & (tmp_220_channel_empty_n ^ 1'b1) & (sums_2_empty_n ^ 1'b1) & (tmp_219_channel_empty_n ^ 1'b1) & (sums_1_empty_n ^ 1'b1) & (tmp_218_channel_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (l2_partial_sums_3_t_empty_n ^ 1'b1) & (l2_partial_sums_2_t_empty_n ^ 1'b1) & (l2_partial_sums_1_t_empty_n ^ 1'b1) & (l2_partial_sums_0_t_empty_n ^ 1'b1) & (l2_products_3_t_empty_n ^ 1'b1) & (l2_products_2_t_empty_n ^ 1'b1) & (l2_products_1_t_empty_n ^ 1'b1) & (l2_products_0_t_empty_n ^ 1'b1) & (products_3_3_t_empty_n ^ 1'b1) & (products_3_2_t_empty_n ^ 1'b1) & (products_3_1_t_empty_n ^ 1'b1) & (products_3_0_t_empty_n ^ 1'b1) & (products_2_3_t_empty_n ^ 1'b1) & (products_2_2_t_empty_n ^ 1'b1) & (products_2_1_t_empty_n ^ 1'b1) & (products_2_0_t_empty_n ^ 1'b1) & (products_1_3_t_empty_n ^ 1'b1) & (products_1_2_t_empty_n ^ 1'b1) & (products_1_1_t_empty_n ^ 1'b1) & (products_1_0_t_empty_n ^ 1'b1) & (products_0_3_t_empty_n ^ 1'b1) & (products_0_2_t_empty_n ^ 1'b1) & (products_0_1_t_empty_n ^ 1'b1) & (products_0_0_t_empty_n ^ 1'b1) & (weight_vecs_3_3_t_empty_n ^ 1'b1) & (weight_vecs_3_2_t_empty_n ^ 1'b1) & (weight_vecs_3_1_t_empty_n ^ 1'b1) & (weight_vecs_3_0_t_empty_n ^ 1'b1) & (weight_vecs_2_3_t_empty_n ^ 1'b1) & (weight_vecs_2_2_t_empty_n ^ 1'b1) & (weight_vecs_2_1_t_empty_n ^ 1'b1) & (weight_vecs_2_0_t_empty_n ^ 1'b1) & (weight_vecs_1_3_t_empty_n ^ 1'b1) & (weight_vecs_1_2_t_empty_n ^ 1'b1) & (weight_vecs_1_1_t_empty_n ^ 1'b1) & (weight_vecs_1_0_t_empty_n ^ 1'b1) & (weight_vecs_0_3_t_empty_n ^ 1'b1) & (weight_vecs_0_2_t_empty_n ^ 1'b1) & (weight_vecs_0_1_t_empty_n ^ 1'b1) & (weight_vecs_0_0_t_empty_n ^ 1'b1) & (ifmap_vec_3_t_empty_n ^ 1'b1) & (ifmap_vec_2_t_empty_n ^ 1'b1) & (ifmap_vec_1_t_empty_n ^ 1'b1) & (ifmap_vec_0_t_empty_n ^ 1'b1) & (1'b1 ^ accum3_out_3_3_empty_n) & (1'b1 ^ accum3_out_3_2_empty_n) & (1'b1 ^ accum3_out_3_1_empty_n) & (1'b1 ^ accum3_out_3_0_empty_n) & (1'b1 ^ accum3_out_2_3_empty_n) & (1'b1 ^ accum3_out_2_2_empty_n) & (1'b1 ^ accum3_out_2_1_empty_n) & (1'b1 ^ accum3_out_2_0_empty_n) & (1'b1 ^ accum3_out_1_3_empty_n) & (1'b1 ^ accum3_out_1_2_empty_n) & (1'b1 ^ accum3_out_1_1_empty_n) & (1'b1 ^ accum3_out_1_0_empty_n) & (1'b1 ^ accum3_out_0_3_empty_n) & (1'b1 ^ accum3_out_0_2_empty_n) & (1'b1 ^ accum3_out_0_1_empty_n) & (1'b1 ^ accum3_out_0_0_empty_n) & (1'b1 ^ accum2_out_3_t_empty_n) & (1'b1 ^ accum2_out_2_t_empty_n) & (1'b1 ^ accum2_out_1_t_empty_n) & (1'b1 ^ accum2_out_0_t_empty_n) & (1'b1 ^ accum1_out_3_t_empty_n) & (1'b1 ^ accum1_out_2_t_empty_n) & (1'b1 ^ accum1_out_1_t_empty_n) & (1'b1 ^ accum1_out_0_t_empty_n) & Block_entry_proc_proc515_U0_ap_idle & Block_entry_proc_proc514_U0_ap_idle & Block_entry_proc_proc513_U0_ap_idle & Block_entry_proc_proc512_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_channel_write_accum3_out_0_0 = ((ap_channel_done_accum3_out_0_0 & accum3_out_0_0_full_n) | ap_sync_reg_channel_write_accum3_out_0_0);

assign ap_sync_channel_write_accum3_out_0_1 = ((ap_channel_done_accum3_out_0_1 & accum3_out_0_1_full_n) | ap_sync_reg_channel_write_accum3_out_0_1);

assign ap_sync_channel_write_accum3_out_0_2 = ((ap_channel_done_accum3_out_0_2 & accum3_out_0_2_full_n) | ap_sync_reg_channel_write_accum3_out_0_2);

assign ap_sync_channel_write_accum3_out_0_3 = ((ap_channel_done_accum3_out_0_3 & accum3_out_0_3_full_n) | ap_sync_reg_channel_write_accum3_out_0_3);

assign ap_sync_channel_write_accum3_out_1_0 = ((ap_channel_done_accum3_out_1_0 & accum3_out_1_0_full_n) | ap_sync_reg_channel_write_accum3_out_1_0);

assign ap_sync_channel_write_accum3_out_1_1 = ((ap_channel_done_accum3_out_1_1 & accum3_out_1_1_full_n) | ap_sync_reg_channel_write_accum3_out_1_1);

assign ap_sync_channel_write_accum3_out_1_2 = ((ap_channel_done_accum3_out_1_2 & accum3_out_1_2_full_n) | ap_sync_reg_channel_write_accum3_out_1_2);

assign ap_sync_channel_write_accum3_out_1_3 = ((ap_channel_done_accum3_out_1_3 & accum3_out_1_3_full_n) | ap_sync_reg_channel_write_accum3_out_1_3);

assign ap_sync_channel_write_accum3_out_2_0 = ((ap_channel_done_accum3_out_2_0 & accum3_out_2_0_full_n) | ap_sync_reg_channel_write_accum3_out_2_0);

assign ap_sync_channel_write_accum3_out_2_1 = ((ap_channel_done_accum3_out_2_1 & accum3_out_2_1_full_n) | ap_sync_reg_channel_write_accum3_out_2_1);

assign ap_sync_channel_write_accum3_out_2_2 = ((ap_channel_done_accum3_out_2_2 & accum3_out_2_2_full_n) | ap_sync_reg_channel_write_accum3_out_2_2);

assign ap_sync_channel_write_accum3_out_2_3 = ((ap_channel_done_accum3_out_2_3 & accum3_out_2_3_full_n) | ap_sync_reg_channel_write_accum3_out_2_3);

assign ap_sync_channel_write_accum3_out_3_0 = ((ap_channel_done_accum3_out_3_0 & accum3_out_3_0_full_n) | ap_sync_reg_channel_write_accum3_out_3_0);

assign ap_sync_channel_write_accum3_out_3_1 = ((ap_channel_done_accum3_out_3_1 & accum3_out_3_1_full_n) | ap_sync_reg_channel_write_accum3_out_3_1);

assign ap_sync_channel_write_accum3_out_3_2 = ((ap_channel_done_accum3_out_3_2 & accum3_out_3_2_full_n) | ap_sync_reg_channel_write_accum3_out_3_2);

assign ap_sync_channel_write_accum3_out_3_3 = ((ap_channel_done_accum3_out_3_3 & accum3_out_3_3_full_n) | ap_sync_reg_channel_write_accum3_out_3_3);

assign ap_sync_channel_write_ifmap_vec_0 = ((tdf4_readInputs37_U0_ifmap_vec_0_full_n & ap_channel_done_ifmap_vec_0) | ap_sync_reg_channel_write_ifmap_vec_0);

assign ap_sync_channel_write_ifmap_vec_1 = ((tdf4_readInputs37_U0_ifmap_vec_1_full_n & ap_channel_done_ifmap_vec_1) | ap_sync_reg_channel_write_ifmap_vec_1);

assign ap_sync_channel_write_ifmap_vec_2 = ((tdf4_readInputs37_U0_ifmap_vec_2_full_n & ap_channel_done_ifmap_vec_2) | ap_sync_reg_channel_write_ifmap_vec_2);

assign ap_sync_channel_write_ifmap_vec_3 = ((tdf4_readInputs37_U0_ifmap_vec_3_full_n & ap_channel_done_ifmap_vec_3) | ap_sync_reg_channel_write_ifmap_vec_3);

assign ap_sync_channel_write_intermediate_fmaps_0 = ((intermediate_fmaps_0_full_n & ap_channel_done_intermediate_fmaps_0) | ap_sync_reg_channel_write_intermediate_fmaps_0);

assign ap_sync_channel_write_intermediate_fmaps_1 = ((intermediate_fmaps_1_full_n & ap_channel_done_intermediate_fmaps_1) | ap_sync_reg_channel_write_intermediate_fmaps_1);

assign ap_sync_channel_write_intermediate_fmaps_2 = ((intermediate_fmaps_2_full_n & ap_channel_done_intermediate_fmaps_2) | ap_sync_reg_channel_write_intermediate_fmaps_2);

assign ap_sync_channel_write_intermediate_fmaps_3 = ((intermediate_fmaps_3_full_n & ap_channel_done_intermediate_fmaps_3) | ap_sync_reg_channel_write_intermediate_fmaps_3);

assign ap_sync_channel_write_l2_partial_sums_0 = ((tdf4_l2_accum_U0_l2_partial_sums_0_full_n & ap_channel_done_l2_partial_sums_0) | ap_sync_reg_channel_write_l2_partial_sums_0);

assign ap_sync_channel_write_l2_partial_sums_1 = ((tdf4_l2_accum_U0_l2_partial_sums_1_full_n & ap_channel_done_l2_partial_sums_1) | ap_sync_reg_channel_write_l2_partial_sums_1);

assign ap_sync_channel_write_l2_partial_sums_2 = ((tdf4_l2_accum_U0_l2_partial_sums_2_full_n & ap_channel_done_l2_partial_sums_2) | ap_sync_reg_channel_write_l2_partial_sums_2);

assign ap_sync_channel_write_l2_partial_sums_3 = ((tdf4_l2_accum_U0_l2_partial_sums_3_full_n & ap_channel_done_l2_partial_sums_3) | ap_sync_reg_channel_write_l2_partial_sums_3);

assign ap_sync_channel_write_l2_products_0 = ((tdf4_l2_multiply34_U0_l2_products_0_full_n & ap_channel_done_l2_products_0) | ap_sync_reg_channel_write_l2_products_0);

assign ap_sync_channel_write_l2_products_1 = ((tdf4_l2_multiply34_U0_l2_products_1_full_n & ap_channel_done_l2_products_1) | ap_sync_reg_channel_write_l2_products_1);

assign ap_sync_channel_write_l2_products_2 = ((tdf4_l2_multiply34_U0_l2_products_2_full_n & ap_channel_done_l2_products_2) | ap_sync_reg_channel_write_l2_products_2);

assign ap_sync_channel_write_l2_products_3 = ((tdf4_l2_multiply34_U0_l2_products_3_full_n & ap_channel_done_l2_products_3) | ap_sync_reg_channel_write_l2_products_3);

assign ap_sync_channel_write_products_0_0 = ((tdf4_dot_product_U0_products_0_0_full_n & ap_channel_done_products_0_0) | ap_sync_reg_channel_write_products_0_0);

assign ap_sync_channel_write_products_0_1 = ((tdf4_dot_product_U0_products_0_1_full_n & ap_channel_done_products_0_1) | ap_sync_reg_channel_write_products_0_1);

assign ap_sync_channel_write_products_0_2 = ((tdf4_dot_product_U0_products_0_2_full_n & ap_channel_done_products_0_2) | ap_sync_reg_channel_write_products_0_2);

assign ap_sync_channel_write_products_0_3 = ((tdf4_dot_product_U0_products_0_3_full_n & ap_channel_done_products_0_3) | ap_sync_reg_channel_write_products_0_3);

assign ap_sync_channel_write_products_1_0 = ((tdf4_dot_product_U0_products_1_0_full_n & ap_channel_done_products_1_0) | ap_sync_reg_channel_write_products_1_0);

assign ap_sync_channel_write_products_1_1 = ((tdf4_dot_product_U0_products_1_1_full_n & ap_channel_done_products_1_1) | ap_sync_reg_channel_write_products_1_1);

assign ap_sync_channel_write_products_1_2 = ((tdf4_dot_product_U0_products_1_2_full_n & ap_channel_done_products_1_2) | ap_sync_reg_channel_write_products_1_2);

assign ap_sync_channel_write_products_1_3 = ((tdf4_dot_product_U0_products_1_3_full_n & ap_channel_done_products_1_3) | ap_sync_reg_channel_write_products_1_3);

assign ap_sync_channel_write_products_2_0 = ((tdf4_dot_product_U0_products_2_0_full_n & ap_channel_done_products_2_0) | ap_sync_reg_channel_write_products_2_0);

assign ap_sync_channel_write_products_2_1 = ((tdf4_dot_product_U0_products_2_1_full_n & ap_channel_done_products_2_1) | ap_sync_reg_channel_write_products_2_1);

assign ap_sync_channel_write_products_2_2 = ((tdf4_dot_product_U0_products_2_2_full_n & ap_channel_done_products_2_2) | ap_sync_reg_channel_write_products_2_2);

assign ap_sync_channel_write_products_2_3 = ((tdf4_dot_product_U0_products_2_3_full_n & ap_channel_done_products_2_3) | ap_sync_reg_channel_write_products_2_3);

assign ap_sync_channel_write_products_3_0 = ((tdf4_dot_product_U0_products_3_0_full_n & ap_channel_done_products_3_0) | ap_sync_reg_channel_write_products_3_0);

assign ap_sync_channel_write_products_3_1 = ((tdf4_dot_product_U0_products_3_1_full_n & ap_channel_done_products_3_1) | ap_sync_reg_channel_write_products_3_1);

assign ap_sync_channel_write_products_3_2 = ((tdf4_dot_product_U0_products_3_2_full_n & ap_channel_done_products_3_2) | ap_sync_reg_channel_write_products_3_2);

assign ap_sync_channel_write_products_3_3 = ((tdf4_dot_product_U0_products_3_3_full_n & ap_channel_done_products_3_3) | ap_sync_reg_channel_write_products_3_3);

assign ap_sync_channel_write_weight_vecs_0_0 = ((tdf4_readFilters36_U0_weight_vecs_0_0_full_n & ap_channel_done_weight_vecs_0_0) | ap_sync_reg_channel_write_weight_vecs_0_0);

assign ap_sync_channel_write_weight_vecs_0_1 = ((tdf4_readFilters36_U0_weight_vecs_0_1_full_n & ap_channel_done_weight_vecs_0_1) | ap_sync_reg_channel_write_weight_vecs_0_1);

assign ap_sync_channel_write_weight_vecs_0_2 = ((tdf4_readFilters36_U0_weight_vecs_0_2_full_n & ap_channel_done_weight_vecs_0_2) | ap_sync_reg_channel_write_weight_vecs_0_2);

assign ap_sync_channel_write_weight_vecs_0_3 = ((tdf4_readFilters36_U0_weight_vecs_0_3_full_n & ap_channel_done_weight_vecs_0_3) | ap_sync_reg_channel_write_weight_vecs_0_3);

assign ap_sync_channel_write_weight_vecs_1_0 = ((tdf4_readFilters36_U0_weight_vecs_1_0_full_n & ap_channel_done_weight_vecs_1_0) | ap_sync_reg_channel_write_weight_vecs_1_0);

assign ap_sync_channel_write_weight_vecs_1_1 = ((tdf4_readFilters36_U0_weight_vecs_1_1_full_n & ap_channel_done_weight_vecs_1_1) | ap_sync_reg_channel_write_weight_vecs_1_1);

assign ap_sync_channel_write_weight_vecs_1_2 = ((tdf4_readFilters36_U0_weight_vecs_1_2_full_n & ap_channel_done_weight_vecs_1_2) | ap_sync_reg_channel_write_weight_vecs_1_2);

assign ap_sync_channel_write_weight_vecs_1_3 = ((tdf4_readFilters36_U0_weight_vecs_1_3_full_n & ap_channel_done_weight_vecs_1_3) | ap_sync_reg_channel_write_weight_vecs_1_3);

assign ap_sync_channel_write_weight_vecs_2_0 = ((tdf4_readFilters36_U0_weight_vecs_2_0_full_n & ap_channel_done_weight_vecs_2_0) | ap_sync_reg_channel_write_weight_vecs_2_0);

assign ap_sync_channel_write_weight_vecs_2_1 = ((tdf4_readFilters36_U0_weight_vecs_2_1_full_n & ap_channel_done_weight_vecs_2_1) | ap_sync_reg_channel_write_weight_vecs_2_1);

assign ap_sync_channel_write_weight_vecs_2_2 = ((tdf4_readFilters36_U0_weight_vecs_2_2_full_n & ap_channel_done_weight_vecs_2_2) | ap_sync_reg_channel_write_weight_vecs_2_2);

assign ap_sync_channel_write_weight_vecs_2_3 = ((tdf4_readFilters36_U0_weight_vecs_2_3_full_n & ap_channel_done_weight_vecs_2_3) | ap_sync_reg_channel_write_weight_vecs_2_3);

assign ap_sync_channel_write_weight_vecs_3_0 = ((tdf4_readFilters36_U0_weight_vecs_3_0_full_n & ap_channel_done_weight_vecs_3_0) | ap_sync_reg_channel_write_weight_vecs_3_0);

assign ap_sync_channel_write_weight_vecs_3_1 = ((tdf4_readFilters36_U0_weight_vecs_3_1_full_n & ap_channel_done_weight_vecs_3_1) | ap_sync_reg_channel_write_weight_vecs_3_1);

assign ap_sync_channel_write_weight_vecs_3_2 = ((tdf4_readFilters36_U0_weight_vecs_3_2_full_n & ap_channel_done_weight_vecs_3_2) | ap_sync_reg_channel_write_weight_vecs_3_2);

assign ap_sync_channel_write_weight_vecs_3_3 = ((tdf4_readFilters36_U0_weight_vecs_3_3_full_n & ap_channel_done_weight_vecs_3_3) | ap_sync_reg_channel_write_weight_vecs_3_3);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf4_l2_writeOutputs_1_U0_ap_done;

assign ap_sync_ready = (ap_sync_tdf4_readInputs37_U0_ap_ready & ap_sync_tdf4_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf4_get_next_ijk_U0_ap_ready = (tdf4_get_next_ijk_U0_ap_ready | ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf4_readInputs37_U0_ap_ready = (tdf4_readInputs37_U0_ap_ready | ap_sync_reg_tdf4_readInputs37_U0_ap_ready);

assign in_data_address0 = tdf4_readInputs37_U0_in_data_address0;

assign in_data_address1 = 14'd0;

assign in_data_ce0 = tdf4_readInputs37_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = tdf4_readInputs37_U0_in_data_write;

assign in_data_we0 = 1'b0;

assign in_data_we1 = 1'b0;

assign l1_adjustments_address0 = tdf4_adjust_U0_adjustments_address0;

assign l1_adjustments_address1 = 7'd0;

assign l1_adjustments_ce0 = tdf4_adjust_U0_adjustments_ce0;

assign l1_adjustments_ce1 = 1'b0;

assign l1_adjustments_d0 = 48'd0;

assign l1_adjustments_d1 = 48'd0;

assign l1_adjustments_we0 = 1'b0;

assign l1_adjustments_we1 = 1'b0;

assign l1_filter_data_0_address0 = tdf4_readFilters36_U0_filter_data_0_address0;

assign l1_filter_data_0_address1 = 11'd0;

assign l1_filter_data_0_ce0 = tdf4_readFilters36_U0_filter_data_0_ce0;

assign l1_filter_data_0_ce1 = 1'b0;

assign l1_filter_data_0_d0 = 64'd0;

assign l1_filter_data_0_d1 = 64'd0;

assign l1_filter_data_0_we0 = 1'b0;

assign l1_filter_data_0_we1 = 1'b0;

assign l1_filter_data_1_address0 = tdf4_readFilters36_U0_filter_data_1_address0;

assign l1_filter_data_1_address1 = 11'd0;

assign l1_filter_data_1_ce0 = tdf4_readFilters36_U0_filter_data_1_ce0;

assign l1_filter_data_1_ce1 = 1'b0;

assign l1_filter_data_1_d0 = 64'd0;

assign l1_filter_data_1_d1 = 64'd0;

assign l1_filter_data_1_we0 = 1'b0;

assign l1_filter_data_1_we1 = 1'b0;

assign l1_filter_data_2_address0 = tdf4_readFilters36_U0_filter_data_2_address0;

assign l1_filter_data_2_address1 = 11'd0;

assign l1_filter_data_2_ce0 = tdf4_readFilters36_U0_filter_data_2_ce0;

assign l1_filter_data_2_ce1 = 1'b0;

assign l1_filter_data_2_d0 = 64'd0;

assign l1_filter_data_2_d1 = 64'd0;

assign l1_filter_data_2_we0 = 1'b0;

assign l1_filter_data_2_we1 = 1'b0;

assign l1_filter_data_3_address0 = tdf4_readFilters36_U0_filter_data_3_address0;

assign l1_filter_data_3_address1 = 11'd0;

assign l1_filter_data_3_ce0 = tdf4_readFilters36_U0_filter_data_3_ce0;

assign l1_filter_data_3_ce1 = 1'b0;

assign l1_filter_data_3_d0 = 64'd0;

assign l1_filter_data_3_d1 = 64'd0;

assign l1_filter_data_3_we0 = 1'b0;

assign l1_filter_data_3_we1 = 1'b0;

assign l2_adjustments_address0 = tdf4_l2_writeOutputs_1_U0_l2_adjustments_address0;

assign l2_adjustments_address1 = 4'd0;

assign l2_adjustments_ce0 = tdf4_l2_writeOutputs_1_U0_l2_adjustments_ce0;

assign l2_adjustments_ce1 = 1'b0;

assign l2_adjustments_d0 = 48'd0;

assign l2_adjustments_d1 = 48'd0;

assign l2_adjustments_we0 = 1'b0;

assign l2_adjustments_we1 = 1'b0;

assign l2_filter_data_0_address0 = tdf4_l2_multiply34_U0_l2_filter_data_0_address0;

assign l2_filter_data_0_address1 = tdf4_l2_multiply34_U0_l2_filter_data_0_address1;

assign l2_filter_data_0_ce0 = tdf4_l2_multiply34_U0_l2_filter_data_0_ce0;

assign l2_filter_data_0_ce1 = tdf4_l2_multiply34_U0_l2_filter_data_0_ce1;

assign l2_filter_data_0_d0 = 16'd0;

assign l2_filter_data_0_d1 = 16'd0;

assign l2_filter_data_0_we0 = 1'b0;

assign l2_filter_data_0_we1 = 1'b0;

assign l2_filter_data_1_address0 = tdf4_l2_multiply34_U0_l2_filter_data_1_address0;

assign l2_filter_data_1_address1 = tdf4_l2_multiply34_U0_l2_filter_data_1_address1;

assign l2_filter_data_1_ce0 = tdf4_l2_multiply34_U0_l2_filter_data_1_ce0;

assign l2_filter_data_1_ce1 = tdf4_l2_multiply34_U0_l2_filter_data_1_ce1;

assign l2_filter_data_1_d0 = 16'd0;

assign l2_filter_data_1_d1 = 16'd0;

assign l2_filter_data_1_we0 = 1'b0;

assign l2_filter_data_1_we1 = 1'b0;

assign l2_products_0_t_d1 = 16'd0;

assign l2_products_0_t_we1 = 1'b0;

assign l2_products_1_t_d1 = 16'd0;

assign l2_products_1_t_we1 = 1'b0;

assign l2_products_2_t_d1 = 16'd0;

assign l2_products_2_t_we1 = 1'b0;

assign l2_products_3_t_d1 = 16'd0;

assign l2_products_3_t_we1 = 1'b0;

assign out_data_address0 = 14'd0;

assign out_data_address1 = tdf4_l2_writeOutputs_1_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = tdf4_l2_writeOutputs_1_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = tdf4_l2_writeOutputs_1_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = tdf4_l2_writeOutputs_1_U0_out_data_we1;

assign out_data_write = tdf4_l2_writeOutputs_1_U0_out_data_write;

assign products_0_0_t_d1 = 16'd0;

assign products_0_0_t_we1 = 1'b0;

assign products_0_1_t_d1 = 16'd0;

assign products_0_1_t_we1 = 1'b0;

assign products_0_2_t_d1 = 16'd0;

assign products_0_2_t_we1 = 1'b0;

assign products_0_3_t_d1 = 16'd0;

assign products_0_3_t_we1 = 1'b0;

assign products_1_0_t_d1 = 16'd0;

assign products_1_0_t_we1 = 1'b0;

assign products_1_1_t_d1 = 16'd0;

assign products_1_1_t_we1 = 1'b0;

assign products_1_2_t_d1 = 16'd0;

assign products_1_2_t_we1 = 1'b0;

assign products_1_3_t_d1 = 16'd0;

assign products_1_3_t_we1 = 1'b0;

assign products_2_0_t_d1 = 16'd0;

assign products_2_0_t_we1 = 1'b0;

assign products_2_1_t_d1 = 16'd0;

assign products_2_1_t_we1 = 1'b0;

assign products_2_2_t_d1 = 16'd0;

assign products_2_2_t_we1 = 1'b0;

assign products_2_3_t_d1 = 16'd0;

assign products_2_3_t_we1 = 1'b0;

assign products_3_0_t_d1 = 16'd0;

assign products_3_0_t_we1 = 1'b0;

assign products_3_1_t_d1 = 16'd0;

assign products_3_1_t_we1 = 1'b0;

assign products_3_2_t_d1 = 16'd0;

assign products_3_2_t_we1 = 1'b0;

assign products_3_3_t_d1 = 16'd0;

assign products_3_3_t_we1 = 1'b0;

assign start_for_tdf4_readFilters36_U0_din = 1'b1;

assign tdf4_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf4_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf4_accum_1_U0_ap_start = (products_0_3_t_empty_n & products_0_2_t_empty_n & products_0_1_t_empty_n & products_0_0_t_empty_n);

assign tdf4_accum_1_U0_start_full_n = 1'b1;

assign tdf4_accum_1_U0_start_write = 1'b0;

assign tdf4_accum_1_U1_1_accum_out_full_n = accum1_out_1_i_full_n;

assign tdf4_accum_1_U1_1_ap_continue = accum1_out_1_i_full_n;

assign tdf4_accum_1_U1_1_ap_start = (products_1_3_t_empty_n & products_1_2_t_empty_n & products_1_1_t_empty_n & products_1_0_t_empty_n);

assign tdf4_accum_1_U1_1_start_full_n = 1'b1;

assign tdf4_accum_1_U1_1_start_write = 1'b0;

assign tdf4_accum_1_U2_2_accum_out_full_n = accum1_out_2_i_full_n;

assign tdf4_accum_1_U2_2_ap_continue = accum1_out_2_i_full_n;

assign tdf4_accum_1_U2_2_ap_start = (products_2_3_t_empty_n & products_2_2_t_empty_n & products_2_1_t_empty_n & products_2_0_t_empty_n);

assign tdf4_accum_1_U2_2_start_full_n = 1'b1;

assign tdf4_accum_1_U2_2_start_write = 1'b0;

assign tdf4_accum_1_U3_3_accum_out_full_n = accum1_out_3_i_full_n;

assign tdf4_accum_1_U3_3_ap_continue = accum1_out_3_i_full_n;

assign tdf4_accum_1_U3_3_ap_start = (products_3_3_t_empty_n & products_3_2_t_empty_n & products_3_1_t_empty_n & products_3_0_t_empty_n);

assign tdf4_accum_1_U3_3_start_full_n = 1'b1;

assign tdf4_accum_1_U3_3_start_write = 1'b0;

assign tdf4_accum_2_U0_accum_out_full_n = accum2_out_0_i_full_n;

assign tdf4_accum_2_U0_ap_continue = accum2_out_0_i_full_n;

assign tdf4_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf4_accum_2_U0_start_full_n = 1'b1;

assign tdf4_accum_2_U0_start_write = 1'b0;

assign tdf4_accum_2_U1_1_accum_out_full_n = accum2_out_1_i_full_n;

assign tdf4_accum_2_U1_1_ap_continue = accum2_out_1_i_full_n;

assign tdf4_accum_2_U1_1_ap_start = accum1_out_1_t_empty_n;

assign tdf4_accum_2_U1_1_start_full_n = 1'b1;

assign tdf4_accum_2_U1_1_start_write = 1'b0;

assign tdf4_accum_2_U2_2_accum_out_full_n = accum2_out_2_i_full_n;

assign tdf4_accum_2_U2_2_ap_continue = accum2_out_2_i_full_n;

assign tdf4_accum_2_U2_2_ap_start = accum1_out_2_t_empty_n;

assign tdf4_accum_2_U2_2_start_full_n = 1'b1;

assign tdf4_accum_2_U2_2_start_write = 1'b0;

assign tdf4_accum_2_U3_3_accum_out_full_n = accum2_out_3_i_full_n;

assign tdf4_accum_2_U3_3_ap_continue = accum2_out_3_i_full_n;

assign tdf4_accum_2_U3_3_ap_start = accum1_out_3_t_empty_n;

assign tdf4_accum_2_U3_3_start_full_n = 1'b1;

assign tdf4_accum_2_U3_3_start_write = 1'b0;

assign tdf4_accum_3_1_U0_ap_continue = (ap_sync_channel_write_accum3_out_1_3 & ap_sync_channel_write_accum3_out_1_2 & ap_sync_channel_write_accum3_out_1_1 & ap_sync_channel_write_accum3_out_1_0);

assign tdf4_accum_3_1_U0_ap_start = accum2_out_1_t_empty_n;

assign tdf4_accum_3_1_U0_start_full_n = 1'b1;

assign tdf4_accum_3_1_U0_start_write = 1'b0;

assign tdf4_accum_3_2_U0_ap_continue = (ap_sync_channel_write_accum3_out_2_3 & ap_sync_channel_write_accum3_out_2_2 & ap_sync_channel_write_accum3_out_2_1 & ap_sync_channel_write_accum3_out_2_0);

assign tdf4_accum_3_2_U0_ap_start = accum2_out_2_t_empty_n;

assign tdf4_accum_3_2_U0_start_full_n = 1'b1;

assign tdf4_accum_3_2_U0_start_write = 1'b0;

assign tdf4_accum_3_3_U0_ap_continue = (ap_sync_channel_write_accum3_out_3_3 & ap_sync_channel_write_accum3_out_3_2 & ap_sync_channel_write_accum3_out_3_1 & ap_sync_channel_write_accum3_out_3_0);

assign tdf4_accum_3_3_U0_ap_start = accum2_out_3_t_empty_n;

assign tdf4_accum_3_3_U0_start_full_n = 1'b1;

assign tdf4_accum_3_3_U0_start_write = 1'b0;

assign tdf4_accum_3_U0_ap_continue = (ap_sync_channel_write_accum3_out_0_3 & ap_sync_channel_write_accum3_out_0_2 & ap_sync_channel_write_accum3_out_0_1 & ap_sync_channel_write_accum3_out_0_0);

assign tdf4_accum_3_U0_ap_start = accum2_out_0_t_empty_n;

assign tdf4_accum_3_U0_start_full_n = 1'b1;

assign tdf4_accum_3_U0_start_write = 1'b0;

assign tdf4_accum_4_1_U0_ap_continue = tmp_218_channel_full_n;

assign tdf4_accum_4_1_U0_ap_start = (accum3_out_1_3_empty_n & accum3_out_1_2_empty_n & accum3_out_1_1_empty_n & accum3_out_1_0_empty_n);

assign tdf4_accum_4_1_U0_start_full_n = 1'b1;

assign tdf4_accum_4_1_U0_start_write = 1'b0;

assign tdf4_accum_4_2_U0_ap_continue = tmp_219_channel_full_n;

assign tdf4_accum_4_2_U0_ap_start = (accum3_out_2_3_empty_n & accum3_out_2_2_empty_n & accum3_out_2_1_empty_n & accum3_out_2_0_empty_n);

assign tdf4_accum_4_2_U0_start_full_n = 1'b1;

assign tdf4_accum_4_2_U0_start_write = 1'b0;

assign tdf4_accum_4_3_U0_ap_continue = tmp_220_channel_full_n;

assign tdf4_accum_4_3_U0_ap_start = (accum3_out_3_3_empty_n & accum3_out_3_2_empty_n & accum3_out_3_1_empty_n & accum3_out_3_0_empty_n);

assign tdf4_accum_4_3_U0_start_full_n = 1'b1;

assign tdf4_accum_4_3_U0_start_write = 1'b0;

assign tdf4_accum_4_U0_ap_continue = tmp_channel_full_n;

assign tdf4_accum_4_U0_ap_start = (accum3_out_0_3_empty_n & accum3_out_0_2_empty_n & accum3_out_0_1_empty_n & accum3_out_0_0_empty_n);

assign tdf4_accum_4_U0_start_full_n = 1'b1;

assign tdf4_accum_4_U0_start_write = 1'b0;

assign tdf4_adjust_U0_ap_continue = (ap_sync_channel_write_intermediate_fmaps_3 & ap_sync_channel_write_intermediate_fmaps_2 & ap_sync_channel_write_intermediate_fmaps_1 & ap_sync_channel_write_intermediate_fmaps_0);

assign tdf4_adjust_U0_ap_start = (sums_3_empty_n & sums_2_empty_n & sums_1_empty_n & sums_0_empty_n);

assign tdf4_adjust_U0_start_full_n = 1'b1;

assign tdf4_adjust_U0_start_write = 1'b0;

assign tdf4_dot_product_U0_ap_continue = (ap_sync_channel_write_products_3_3 & ap_sync_channel_write_products_3_2 & ap_sync_channel_write_products_3_1 & ap_sync_channel_write_products_3_0 & ap_sync_channel_write_products_2_3 & ap_sync_channel_write_products_2_2 & ap_sync_channel_write_products_2_1 & ap_sync_channel_write_products_2_0 & ap_sync_channel_write_products_1_3 & ap_sync_channel_write_products_1_2 & ap_sync_channel_write_products_1_1 & ap_sync_channel_write_products_1_0 & ap_sync_channel_write_products_0_3 & ap_sync_channel_write_products_0_2 & ap_sync_channel_write_products_0_1 & ap_sync_channel_write_products_0_0);

assign tdf4_dot_product_U0_ap_start = (weight_vecs_3_3_t_empty_n & weight_vecs_3_2_t_empty_n & weight_vecs_3_1_t_empty_n & weight_vecs_3_0_t_empty_n & weight_vecs_2_3_t_empty_n & weight_vecs_2_2_t_empty_n & weight_vecs_2_1_t_empty_n & weight_vecs_2_0_t_empty_n & weight_vecs_1_3_t_empty_n & weight_vecs_1_2_t_empty_n & weight_vecs_1_1_t_empty_n & weight_vecs_1_0_t_empty_n & weight_vecs_0_3_t_empty_n & weight_vecs_0_2_t_empty_n & weight_vecs_0_1_t_empty_n & weight_vecs_0_0_t_empty_n & ifmap_vec_3_t_empty_n & ifmap_vec_2_t_empty_n & ifmap_vec_1_t_empty_n & ifmap_vec_0_t_empty_n);

assign tdf4_dot_product_U0_products_0_0_full_n = products_0_0_i_full_n;

assign tdf4_dot_product_U0_products_0_1_full_n = products_0_1_i_full_n;

assign tdf4_dot_product_U0_products_0_2_full_n = products_0_2_i_full_n;

assign tdf4_dot_product_U0_products_0_3_full_n = products_0_3_i_full_n;

assign tdf4_dot_product_U0_products_1_0_full_n = products_1_0_i_full_n;

assign tdf4_dot_product_U0_products_1_1_full_n = products_1_1_i_full_n;

assign tdf4_dot_product_U0_products_1_2_full_n = products_1_2_i_full_n;

assign tdf4_dot_product_U0_products_1_3_full_n = products_1_3_i_full_n;

assign tdf4_dot_product_U0_products_2_0_full_n = products_2_0_i_full_n;

assign tdf4_dot_product_U0_products_2_1_full_n = products_2_1_i_full_n;

assign tdf4_dot_product_U0_products_2_2_full_n = products_2_2_i_full_n;

assign tdf4_dot_product_U0_products_2_3_full_n = products_2_3_i_full_n;

assign tdf4_dot_product_U0_products_3_0_full_n = products_3_0_i_full_n;

assign tdf4_dot_product_U0_products_3_1_full_n = products_3_1_i_full_n;

assign tdf4_dot_product_U0_products_3_2_full_n = products_3_2_i_full_n;

assign tdf4_dot_product_U0_products_3_3_full_n = products_3_3_i_full_n;

assign tdf4_dot_product_U0_start_full_n = 1'b1;

assign tdf4_dot_product_U0_start_write = 1'b0;

assign tdf4_get_next_ijk_U0_ap_continue = 1'b1;

assign tdf4_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf4_l2_accum_U0_ap_continue = (ap_sync_channel_write_l2_partial_sums_3 & ap_sync_channel_write_l2_partial_sums_2 & ap_sync_channel_write_l2_partial_sums_1 & ap_sync_channel_write_l2_partial_sums_0);

assign tdf4_l2_accum_U0_ap_start = (l2_products_3_t_empty_n & l2_products_2_t_empty_n & l2_products_1_t_empty_n & l2_products_0_t_empty_n);

assign tdf4_l2_accum_U0_l2_partial_sums_0_full_n = l2_partial_sums_0_i_full_n;

assign tdf4_l2_accum_U0_l2_partial_sums_1_full_n = l2_partial_sums_1_i_full_n;

assign tdf4_l2_accum_U0_l2_partial_sums_2_full_n = l2_partial_sums_2_i_full_n;

assign tdf4_l2_accum_U0_l2_partial_sums_3_full_n = l2_partial_sums_3_i_full_n;

assign tdf4_l2_accum_U0_start_full_n = 1'b1;

assign tdf4_l2_accum_U0_start_write = 1'b0;

assign tdf4_l2_multiply34_U0_ap_continue = (ap_sync_channel_write_l2_products_3 & ap_sync_channel_write_l2_products_2 & ap_sync_channel_write_l2_products_1 & ap_sync_channel_write_l2_products_0);

assign tdf4_l2_multiply34_U0_ap_start = (intermediate_fmaps_3_empty_n & intermediate_fmaps_2_empty_n & intermediate_fmaps_1_empty_n & intermediate_fmaps_0_empty_n);

assign tdf4_l2_multiply34_U0_l2_products_0_full_n = l2_products_0_i_full_n;

assign tdf4_l2_multiply34_U0_l2_products_1_full_n = l2_products_1_i_full_n;

assign tdf4_l2_multiply34_U0_l2_products_2_full_n = l2_products_2_i_full_n;

assign tdf4_l2_multiply34_U0_l2_products_3_full_n = l2_products_3_i_full_n;

assign tdf4_l2_multiply34_U0_start_full_n = 1'b1;

assign tdf4_l2_multiply34_U0_start_write = 1'b0;

assign tdf4_l2_writeOutputs_1_U0_ap_continue = ap_continue;

assign tdf4_l2_writeOutputs_1_U0_ap_start = (l2_partial_sums_3_t_empty_n & l2_partial_sums_2_t_empty_n & l2_partial_sums_1_t_empty_n & l2_partial_sums_0_t_empty_n);

assign tdf4_l2_writeOutputs_1_U0_out_data_full_n = out_data_full_n;

assign tdf4_l2_writeOutputs_1_U0_out_data_write = 1'b0;

assign tdf4_l2_writeOutputs_1_U0_start_full_n = 1'b1;

assign tdf4_l2_writeOutputs_1_U0_start_write = 1'b0;

assign tdf4_readFilters36_U0_ap_continue = (ap_sync_channel_write_weight_vecs_3_3 & ap_sync_channel_write_weight_vecs_3_2 & ap_sync_channel_write_weight_vecs_3_1 & ap_sync_channel_write_weight_vecs_3_0 & ap_sync_channel_write_weight_vecs_2_3 & ap_sync_channel_write_weight_vecs_2_2 & ap_sync_channel_write_weight_vecs_2_1 & ap_sync_channel_write_weight_vecs_2_0 & ap_sync_channel_write_weight_vecs_1_3 & ap_sync_channel_write_weight_vecs_1_2 & ap_sync_channel_write_weight_vecs_1_1 & ap_sync_channel_write_weight_vecs_1_0 & ap_sync_channel_write_weight_vecs_0_3 & ap_sync_channel_write_weight_vecs_0_2 & ap_sync_channel_write_weight_vecs_0_1 & ap_sync_channel_write_weight_vecs_0_0);

assign tdf4_readFilters36_U0_ap_start = start_for_tdf4_readFilters36_U0_empty_n;

assign tdf4_readFilters36_U0_start_full_n = 1'b1;

assign tdf4_readFilters36_U0_start_write = 1'b0;

assign tdf4_readFilters36_U0_weight_vecs_0_0_full_n = weight_vecs_0_0_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_0_1_full_n = weight_vecs_0_1_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_0_2_full_n = weight_vecs_0_2_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_0_3_full_n = weight_vecs_0_3_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_1_0_full_n = weight_vecs_1_0_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_1_1_full_n = weight_vecs_1_1_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_1_2_full_n = weight_vecs_1_2_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_1_3_full_n = weight_vecs_1_3_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_2_0_full_n = weight_vecs_2_0_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_2_1_full_n = weight_vecs_2_1_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_2_2_full_n = weight_vecs_2_2_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_2_3_full_n = weight_vecs_2_3_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_3_0_full_n = weight_vecs_3_0_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_3_1_full_n = weight_vecs_3_1_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_3_2_full_n = weight_vecs_3_2_i_full_n;

assign tdf4_readFilters36_U0_weight_vecs_3_3_full_n = weight_vecs_3_3_i_full_n;

assign tdf4_readInputs37_U0_ap_continue = (ap_sync_channel_write_ifmap_vec_3 & ap_sync_channel_write_ifmap_vec_2 & ap_sync_channel_write_ifmap_vec_1 & ap_sync_channel_write_ifmap_vec_0);

assign tdf4_readInputs37_U0_ap_start = ((ap_sync_reg_tdf4_readInputs37_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf4_readInputs37_U0_ifmap_vec_0_full_n = ifmap_vec_0_i_full_n;

assign tdf4_readInputs37_U0_ifmap_vec_1_full_n = ifmap_vec_1_i_full_n;

assign tdf4_readInputs37_U0_ifmap_vec_2_full_n = ifmap_vec_2_i_full_n;

assign tdf4_readInputs37_U0_ifmap_vec_3_full_n = ifmap_vec_3_i_full_n;

assign tdf4_readInputs37_U0_in_data_full_n = in_data_empty_n;

assign tdf4_readInputs37_U0_in_data_write = 1'b0;

assign tdf4_readInputs37_U0_start_full_n = 1'b1;

assign tdf4_readInputs37_U0_start_write = 1'b0;

assign write4_c_din = tdf4_get_next_ijk_U0_write_r_din;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP48232
module td_fused_top_start_for_tdf4_readFilters36_U0 (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd1;
parameter ADDR_WIDTH  = 32'd1;
parameter DEPTH       = 2'd2;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 2'd1;
            if (mOutPtr == 2'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 2'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 2'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_start_for_tdf4_readFilters36_U0_shiftReg 
U_td_fused_top_start_for_tdf4_readFilters36_U0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_start_for_tdf4_readFilters36_U0_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd1;
parameter ADDR_WIDTH = 32'd1;
parameter DEPTH = 2'd2;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;


        end
    end

always @( sr_0, sr_1, a) begin
   case (a)
      1'd0: q = sr_0;
      1'd1: q = sr_1;
      default: q = sr_1;
   endcase
end

endmodule
module td_fused_top_fifo_w16_d2_S_x1 (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd16;
parameter ADDR_WIDTH  = 32'd1;
parameter DEPTH       = 2'd2;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 2'd1;
            if (mOutPtr == 2'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 2'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 2'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w16_d2_S_x1_shiftReg 
U_td_fused_top_fifo_w16_d2_S_x1_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w16_d2_S_x1_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd16;
parameter ADDR_WIDTH = 32'd1;
parameter DEPTH = 2'd2;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;


        end
    end

always @( sr_0, sr_1, a) begin
   case (a)
      1'd0: q = sr_0;
      1'd1: q = sr_1;
      default: q = sr_1;
   endcase
end

endmodule
module td_fused_top_fifo_w5_d2_S_x (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd5;
parameter ADDR_WIDTH  = 32'd1;
parameter DEPTH       = 2'd2;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 2'd1;
            if (mOutPtr == 2'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 2'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 2'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w5_d2_S_x_shiftReg 
U_td_fused_top_fifo_w5_d2_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w5_d2_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd5;
parameter ADDR_WIDTH = 32'd1;
parameter DEPTH = 2'd2;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;


        end
    end

always @( sr_0, sr_1, a) begin
   case (a)
      1'd0: q = sr_0;
      1'd1: q = sr_1;
      default: q = sr_1;
   endcase
end

endmodule
module td_fused_top_fifo_w12_d11_S (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd12;
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd11;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 5'd1;
            if (mOutPtr == 5'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 5'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 5'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w12_d11_S_shiftReg 
U_td_fused_top_fifo_w12_d11_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w12_d11_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd12;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd11;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;
            sr_2 <= sr_1;
            sr_3 <= sr_2;
            sr_4 <= sr_3;
            sr_5 <= sr_4;
            sr_6 <= sr_5;
            sr_7 <= sr_6;
            sr_8 <= sr_7;
            sr_9 <= sr_8;
            sr_10 <= sr_9;


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10, a) begin
   case (a)
      4'd0: q = sr_0;
      4'd1: q = sr_1;
      4'd2: q = sr_2;
      4'd3: q = sr_3;
      4'd4: q = sr_4;
      4'd5: q = sr_5;
      4'd6: q = sr_6;
      4'd7: q = sr_7;
      4'd8: q = sr_8;
      4'd9: q = sr_9;
      4'd10: q = sr_10;
      default: q = sr_10;
   endcase
end

endmodule
module td_fused_top_fifo_w6_d11_S (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd6;
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd11;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 5'd1;
            if (mOutPtr == 5'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 5'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 5'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w6_d11_S_shiftReg 
U_td_fused_top_fifo_w6_d11_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w6_d11_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd6;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd11;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;
            sr_2 <= sr_1;
            sr_3 <= sr_2;
            sr_4 <= sr_3;
            sr_5 <= sr_4;
            sr_6 <= sr_5;
            sr_7 <= sr_6;
            sr_8 <= sr_7;
            sr_9 <= sr_8;
            sr_10 <= sr_9;


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10, a) begin
   case (a)
      4'd0: q = sr_0;
      4'd1: q = sr_1;
      4'd2: q = sr_2;
      4'd3: q = sr_3;
      4'd4: q = sr_4;
      4'd5: q = sr_5;
      4'd6: q = sr_6;
      4'd7: q = sr_7;
      4'd8: q = sr_8;
      4'd9: q = sr_9;
      4'd10: q = sr_10;
      default: q = sr_10;
   endcase
end

endmodule
module td_fused_top_fifo_w1_d12_S (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd1;
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd12;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 5'd1;
            if (mOutPtr == 5'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 5'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 5'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w1_d12_S_shiftReg 
U_td_fused_top_fifo_w1_d12_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w1_d12_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd1;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd12;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10, sr_11;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;
            sr_2 <= sr_1;
            sr_3 <= sr_2;
            sr_4 <= sr_3;
            sr_5 <= sr_4;
            sr_6 <= sr_5;
            sr_7 <= sr_6;
            sr_8 <= sr_7;
            sr_9 <= sr_8;
            sr_10 <= sr_9;
            sr_11 <= sr_10;


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, sr_10, sr_11, a) begin
   case (a)
      4'd0: q = sr_0;
      4'd1: q = sr_1;
      4'd2: q = sr_2;
      4'd3: q = sr_3;
      4'd4: q = sr_4;
      4'd5: q = sr_5;
      4'd6: q = sr_6;
      4'd7: q = sr_7;
      4'd8: q = sr_8;
      4'd9: q = sr_9;
      4'd10: q = sr_10;
      4'd11: q = sr_11;
      default: q = sr_11;
   endcase
end

endmodule
module td_fused_top_fifo_w5_d9_S (
    clk,
    reset,
    if_empty_n,
    if_read_ce,
    if_read,
    if_dout,
    if_full_n,
    if_write_ce,
    if_write,
    if_din);

parameter MEM_STYLE   = "shiftreg";
parameter DATA_WIDTH  = 32'd5;
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd9;

input clk;
input reset;
output if_empty_n;
input if_read_ce;
input if_read;
output[DATA_WIDTH - 1:0] if_dout;
output if_full_n;
input if_write_ce;
input if_write;
input[DATA_WIDTH - 1:0] if_din;

wire[ADDR_WIDTH - 1:0] shiftReg_addr ;
wire[DATA_WIDTH - 1:0] shiftReg_data, shiftReg_q;
wire                     shiftReg_ce;
reg[ADDR_WIDTH:0] mOutPtr = ~{(ADDR_WIDTH+1){1'b0}};
reg internal_empty_n = 0;
reg internal_full_n = 1;

assign if_full_n = internal_full_n;
assign if_empty_n = internal_empty_n;
assign shiftReg_data = if_din;
assign if_dout = shiftReg_q;

always @ (posedge clk) begin
    if (reset == 1'b1)
    begin
        mOutPtr <= ~{ADDR_WIDTH+1{1'b0}};
        internal_empty_n <= 1'b0;
        internal_full_n <= 1'b1;
    end
    else begin
        if (((if_read & if_read_ce) == 1 & internal_empty_n == 1) && 
            ((if_write & if_write_ce) == 0 | internal_full_n == 0))
        begin
            mOutPtr <= mOutPtr - 5'd1;
            if (mOutPtr == 5'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 5'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 5'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w5_d9_S_shiftReg 
U_td_fused_top_fifo_w5_d9_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w5_d9_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd5;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd9;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;
            sr_2 <= sr_1;
            sr_3 <= sr_2;
            sr_4 <= sr_3;
            sr_5 <= sr_4;
            sr_6 <= sr_5;
            sr_7 <= sr_6;
            sr_8 <= sr_7;


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, a) begin
   case (a)
      4'd0: q = sr_0;
      4'd1: q = sr_1;
      4'd2: q = sr_2;
      4'd3: q = sr_3;
      4'd4: q = sr_4;
      4'd5: q = sr_5;
      4'd6: q = sr_6;
      4'd7: q = sr_7;
      4'd8: q = sr_8;
      default: q = sr_8;
   endcase
end

endmodule
module td_fused_top_tdf4_l2_writeOutputs_1 (
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
input  [5:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [11:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [0:0] write4_dout;
input   write4_empty_n;
output   write4_read;
output  [1:0] l2_partial_sums_0_address0;
output   l2_partial_sums_0_ce0;
input  [15:0] l2_partial_sums_0_q0;
output  [1:0] l2_partial_sums_1_address0;
output   l2_partial_sums_1_ce0;
input  [15:0] l2_partial_sums_1_q0;
output  [1:0] l2_partial_sums_2_address0;
output   l2_partial_sums_2_ce0;
input  [15:0] l2_partial_sums_2_q0;
output  [1:0] l2_partial_sums_3_address0;
output   l2_partial_sums_3_ce0;
input  [15:0] l2_partial_sums_3_q0;
output  [13:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
output  [3:0] l2_adjustments_address0;
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
reg    running_sums_1_ce0;
reg    running_sums_1_we0;
wire   [15:0] running_sums_1_d0;
wire   [3:0] running_sums_1_address1;
reg    running_sums_1_ce1;
wire   [15:0] running_sums_1_q1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    write4_blk_n;
reg   [4:0] ochan_reg_253;
reg   [5:0] indices_01_read_reg_632;
reg   [11:0] indices_12_read_reg_638;
reg   [0:0] write4_read_reg_643;
wire   [13:0] add_ln109_fu_315_p2;
reg   [13:0] add_ln109_reg_649;
wire    ap_CS_fsm_state2;
wire   [4:0] add_ln86_fu_321_p2;
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
wire   [1:0] lshr_ln_fu_342_p4;
reg   [1:0] lshr_ln_reg_676;
reg   [1:0] lshr_ln_reg_676_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter2_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter3_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter4_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter5_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter6_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter7_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter8_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter9_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter10_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter11_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter12_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter13_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter14_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter15_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter16_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter17_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter18_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter19_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter20_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter21_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter22_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter23_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter24_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter25_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter26_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter27_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter28_reg;
reg   [1:0] lshr_ln_reg_676_pp0_iter29_reg;
reg   [3:0] running_sums_1_addr_reg_701;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter1_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter2_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter3_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter4_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter5_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter6_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter7_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter8_reg;
reg   [3:0] running_sums_1_addr_reg_701_pp0_iter9_reg;
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
reg   [15:0] running_sums_1_load_reg_716;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_264_p2;
reg   [15:0] sum_reg_726;
wire   [15:0] trunc_ln95_fu_388_p1;
reg   [15:0] trunc_ln95_reg_732;
reg   [15:0] tmp_178_i_i_reg_737;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter10_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter11_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter12_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter13_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter14_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter15_reg;
reg   [15:0] tmp_178_i_i_reg_737_pp0_iter16_reg;
reg   [15:0] tmp_179_i_i_reg_742;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter10_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter11_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter12_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter13_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter14_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter15_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter16_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter17_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter18_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter19_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter20_reg;
reg   [15:0] tmp_179_i_i_reg_742_pp0_iter21_reg;
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
wire   [63:0] zext_ln89_2_fu_352_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] sext_ln109_fu_449_p1;
reg   [15:0] quad_3_14_fu_120;
wire   [15:0] quad_3_26_fu_551_p3;
reg   [15:0] quad_3_15_fu_124;
wire   [15:0] quad_3_25_fu_543_p3;
reg   [15:0] quad_3_16_fu_128;
wire   [15:0] quad_3_23_fu_527_p3;
reg   [15:0] quad_3_17_fu_132;
wire   [15:0] quad_3_20_fu_503_p3;
reg    ap_block_state1;
wire   [15:0] grp_fu_268_p1;
wire   [15:0] grp_fu_272_p1;
wire   [15:0] grp_fu_276_p1;
wire   [11:0] tmp_fu_280_p3;
wire   [8:0] tmp_s_fu_291_p3;
wire   [12:0] zext_ln109_fu_287_p1;
wire   [12:0] zext_ln109_3_fu_298_p1;
wire   [12:0] sub_ln109_fu_302_p2;
wire   [13:0] sub_ln109_cast_fu_308_p1;
wire   [13:0] zext_ln109_4_fu_312_p1;
wire   [0:0] icmp_ln103_fu_360_p2;
wire   [63:0] val_fu_374_p5;
wire   [15:0] tmp_54_fu_443_p3;
wire   [15:0] data_V_fu_454_p1;
wire   [0:0] p_Result_s_fu_457_p3;
wire   [0:0] icmp_ln99_fu_472_p2;
wire   [15:0] quad_0_fu_465_p3;
wire   [0:0] icmp_ln99_3_fu_485_p2;
wire   [15:0] quad_3_fu_477_p3;
wire   [0:0] icmp_ln99_4_fu_498_p2;
wire   [15:0] quad_3_19_fu_490_p3;
wire   [15:0] quad_3_21_fu_511_p3;
wire   [15:0] quad_3_22_fu_519_p3;
wire   [15:0] quad_3_24_fu_535_p3;
wire   [15:0] bitcast_ln109_6_fu_591_p1;
wire   [15:0] bitcast_ln109_5_fu_587_p1;
wire   [15:0] bitcast_ln109_4_fu_583_p1;
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

td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
running_sums_1_U(
    .reset(ap_rst),
    .clk(ap_clk),
    .address0(running_sums_1_addr_reg_701_pp0_iter9_reg),
    .ce0(running_sums_1_ce0),
    .we0(running_sums_1_we0),
    .d0(running_sums_1_d0),
    .address1(running_sums_1_address1),
    .ce1(running_sums_1_ce1),
    .q1(running_sums_1_q1)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U645(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(running_sums_1_load_reg_716),
    .din1(val_reg_711),
    .dout(grp_fu_264_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U646(
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
hsub_16ns_16ns_16_7_full_dsp_1_U647(
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
hmul_16ns_16ns_16_5_max_dsp_1_U648(
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
mux_464_16_1_1_U649(
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
        ochan_reg_253 <= 5'd0;
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
        lshr_ln_reg_676 <= {{ochan_reg_253[3:2]}};
        running_sums_1_addr_reg_701 <= zext_ln86_fu_333_p1;
        trunc_ln89_reg_668 <= trunc_ln89_fu_338_p1;
        zext_ln86_reg_663[4 : 0] <= zext_ln86_fu_333_p1[4 : 0];
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
        running_sums_1_addr_reg_701_pp0_iter2_reg <= running_sums_1_addr_reg_701_pp0_iter1_reg;
        running_sums_1_addr_reg_701_pp0_iter3_reg <= running_sums_1_addr_reg_701_pp0_iter2_reg;
        running_sums_1_addr_reg_701_pp0_iter4_reg <= running_sums_1_addr_reg_701_pp0_iter3_reg;
        running_sums_1_addr_reg_701_pp0_iter5_reg <= running_sums_1_addr_reg_701_pp0_iter4_reg;
        running_sums_1_addr_reg_701_pp0_iter6_reg <= running_sums_1_addr_reg_701_pp0_iter5_reg;
        running_sums_1_addr_reg_701_pp0_iter7_reg <= running_sums_1_addr_reg_701_pp0_iter6_reg;
        running_sums_1_addr_reg_701_pp0_iter8_reg <= running_sums_1_addr_reg_701_pp0_iter7_reg;
        running_sums_1_addr_reg_701_pp0_iter9_reg <= running_sums_1_addr_reg_701_pp0_iter8_reg;
        sub_i_i_i_reg_752 <= grp_fu_272_p2;
        sum_reg_726 <= grp_fu_264_p2;
        tmp_178_i_i_reg_737 <= {{l2_adjustments_q0[31:16]}};
        tmp_178_i_i_reg_737_pp0_iter10_reg <= tmp_178_i_i_reg_737;
        tmp_178_i_i_reg_737_pp0_iter11_reg <= tmp_178_i_i_reg_737_pp0_iter10_reg;
        tmp_178_i_i_reg_737_pp0_iter12_reg <= tmp_178_i_i_reg_737_pp0_iter11_reg;
        tmp_178_i_i_reg_737_pp0_iter13_reg <= tmp_178_i_i_reg_737_pp0_iter12_reg;
        tmp_178_i_i_reg_737_pp0_iter14_reg <= tmp_178_i_i_reg_737_pp0_iter13_reg;
        tmp_178_i_i_reg_737_pp0_iter15_reg <= tmp_178_i_i_reg_737_pp0_iter14_reg;
        tmp_178_i_i_reg_737_pp0_iter16_reg <= tmp_178_i_i_reg_737_pp0_iter15_reg;
        tmp_179_i_i_reg_742 <= {{l2_adjustments_q0[47:32]}};
        tmp_179_i_i_reg_742_pp0_iter10_reg <= tmp_179_i_i_reg_742;
        tmp_179_i_i_reg_742_pp0_iter11_reg <= tmp_179_i_i_reg_742_pp0_iter10_reg;
        tmp_179_i_i_reg_742_pp0_iter12_reg <= tmp_179_i_i_reg_742_pp0_iter11_reg;
        tmp_179_i_i_reg_742_pp0_iter13_reg <= tmp_179_i_i_reg_742_pp0_iter12_reg;
        tmp_179_i_i_reg_742_pp0_iter14_reg <= tmp_179_i_i_reg_742_pp0_iter13_reg;
        tmp_179_i_i_reg_742_pp0_iter15_reg <= tmp_179_i_i_reg_742_pp0_iter14_reg;
        tmp_179_i_i_reg_742_pp0_iter16_reg <= tmp_179_i_i_reg_742_pp0_iter15_reg;
        tmp_179_i_i_reg_742_pp0_iter17_reg <= tmp_179_i_i_reg_742_pp0_iter16_reg;
        tmp_179_i_i_reg_742_pp0_iter18_reg <= tmp_179_i_i_reg_742_pp0_iter17_reg;
        tmp_179_i_i_reg_742_pp0_iter19_reg <= tmp_179_i_i_reg_742_pp0_iter18_reg;
        tmp_179_i_i_reg_742_pp0_iter20_reg <= tmp_179_i_i_reg_742_pp0_iter19_reg;
        tmp_179_i_i_reg_742_pp0_iter21_reg <= tmp_179_i_i_reg_742_pp0_iter20_reg;
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
        zext_ln86_reg_663_pp0_iter2_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter1_reg[4 : 0];
        zext_ln86_reg_663_pp0_iter3_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter2_reg[4 : 0];
        zext_ln86_reg_663_pp0_iter4_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter3_reg[4 : 0];
        zext_ln86_reg_663_pp0_iter5_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter4_reg[4 : 0];
        zext_ln86_reg_663_pp0_iter6_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter5_reg[4 : 0];
        zext_ln86_reg_663_pp0_iter7_reg[4 : 0] <= zext_ln86_reg_663_pp0_iter6_reg[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln103_reg_707_pp0_iter1_reg <= and_ln103_reg_707;
        lshr_ln_reg_676_pp0_iter1_reg <= lshr_ln_reg_676;
        running_sums_1_addr_reg_701_pp0_iter1_reg <= running_sums_1_addr_reg_701;
        trunc_ln89_reg_668_pp0_iter1_reg <= trunc_ln89_reg_668;
        val_reg_711 <= val_fu_374_p6;
        zext_ln86_reg_663_pp0_iter1_reg[4 : 0] <= zext_ln86_reg_663[4 : 0];
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
        quad_3_14_fu_120 <= quad_3_26_fu_551_p3;
        quad_3_15_fu_124 <= quad_3_25_fu_543_p3;
        quad_3_16_fu_128 <= quad_3_23_fu_527_p3;
        quad_3_17_fu_132 <= quad_3_20_fu_503_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_1_load_reg_716 <= running_sums_1_q1;
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
        running_sums_1_ce0 = 1'b1;
    end else begin
        running_sums_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        running_sums_1_ce1 = 1'b1;
    end else begin
        running_sums_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter10 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_1_we0 = 1'b1;
    end else begin
        running_sums_1_we0 = 1'b0;
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

assign add_ln109_fu_315_p2 = ((sub_ln109_cast_fu_308_p1) + (zext_ln109_4_fu_312_p1));

assign add_ln86_fu_321_p2 = (ochan_reg_253 + 5'd1);

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

assign bitcast_ln109_4_fu_583_p1 = quad_3_25_fu_543_p3;

assign bitcast_ln109_5_fu_587_p1 = quad_3_23_fu_527_p3;

assign bitcast_ln109_6_fu_591_p1 = quad_3_20_fu_503_p3;

assign bitcast_ln109_fu_579_p1 = quad_3_26_fu_551_p3;

assign data_V_fu_454_p1 = biased_reg_772;

assign grp_fu_268_p1 = tmp_179_i_i_reg_742_pp0_iter21_reg;

assign grp_fu_272_p1 = trunc_ln95_reg_732;

assign grp_fu_276_p1 = tmp_178_i_i_reg_737_pp0_iter16_reg;

assign icmp_ln103_fu_360_p2 = ((trunc_ln89_fu_338_p1 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_327_p2 = ((ochan_reg_253 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln99_3_fu_485_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln99_4_fu_498_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln99_fu_472_p2 = ((trunc_ln89_reg_668_pp0_iter29_reg == 2'd2) ? 1'b1 : 1'b0);

assign l2_adjustments_address0 = zext_ln86_reg_663_pp0_iter7_reg;

assign l2_partial_sums_0_address0 = zext_ln89_2_fu_352_p1;

assign l2_partial_sums_1_address0 = zext_ln89_2_fu_352_p1;

assign l2_partial_sums_2_address0 = zext_ln89_2_fu_352_p1;

assign l2_partial_sums_3_address0 = zext_ln89_2_fu_352_p1;

assign lshr_ln_fu_342_p4 = {{ochan_reg_253[3:2]}};

assign out_data_address1 = sext_ln109_fu_449_p1;

assign out_data_d1 = {{{{bitcast_ln109_6_fu_591_p1}, {bitcast_ln109_5_fu_587_p1}}, {bitcast_ln109_4_fu_583_p1}}, {bitcast_ln109_fu_579_p1}};

assign p_Result_s_fu_457_p3 = data_V_fu_454_p1[32'd15];

assign quad_0_fu_465_p3 = ((p_Result_s_fu_457_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_772);

assign quad_3_19_fu_490_p3 = ((icmp_ln99_3_fu_485_p2[0:0] == 1'b1) ? quad_3_17_fu_132 : quad_3_fu_477_p3);

assign quad_3_20_fu_503_p3 = ((icmp_ln99_4_fu_498_p2[0:0] == 1'b1) ? quad_3_17_fu_132 : quad_3_19_fu_490_p3);

assign quad_3_21_fu_511_p3 = ((icmp_ln99_fu_472_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_16_fu_128);

assign quad_3_22_fu_519_p3 = ((icmp_ln99_3_fu_485_p2[0:0] == 1'b1) ? quad_3_16_fu_128 : quad_3_21_fu_511_p3);

assign quad_3_23_fu_527_p3 = ((icmp_ln99_4_fu_498_p2[0:0] == 1'b1) ? quad_3_16_fu_128 : quad_3_22_fu_519_p3);

assign quad_3_24_fu_535_p3 = ((icmp_ln99_3_fu_485_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_15_fu_124);

assign quad_3_25_fu_543_p3 = ((icmp_ln99_4_fu_498_p2[0:0] == 1'b1) ? quad_3_15_fu_124 : quad_3_24_fu_535_p3);

assign quad_3_26_fu_551_p3 = ((icmp_ln99_4_fu_498_p2[0:0] == 1'b1) ? quad_0_fu_465_p3 : quad_3_14_fu_120);

assign quad_3_fu_477_p3 = ((icmp_ln99_fu_472_p2[0:0] == 1'b1) ? quad_3_17_fu_132 : quad_0_fu_465_p3);

assign running_sums_1_address1 = zext_ln86_fu_333_p1;

assign running_sums_1_d0 = ((write4_read_reg_643[0:0] == 1'b1) ? 16'd0 : sum_reg_726);

assign sext_ln109_fu_449_p1 = (tmp_54_fu_443_p3);

assign sub_ln109_cast_fu_308_p1 = (sub_ln109_fu_302_p2);

assign sub_ln109_fu_302_p2 = (zext_ln109_fu_287_p1 - zext_ln109_3_fu_298_p1);

assign tmp_54_fu_443_p3 = {{add_ln109_reg_649}, {lshr_ln_reg_676_pp0_iter29_reg}};

assign tmp_fu_280_p3 = {{indices_01_read_reg_632}, {6'd0}};

assign tmp_s_fu_291_p3 = {{indices_01_read_reg_632}, {3'd0}};

assign trunc_ln89_fu_338_p1 = ochan_reg_253[1:0];

assign trunc_ln95_fu_388_p1 = l2_adjustments_q0[15:0];

assign val_fu_374_p5 = trunc_ln89_reg_668;

assign zext_ln109_3_fu_298_p1 = tmp_s_fu_291_p3;

assign zext_ln109_4_fu_312_p1 = indices_12_read_reg_638;

assign zext_ln109_fu_287_p1 = tmp_fu_280_p3;

assign zext_ln86_fu_333_p1 = ochan_reg_253;

assign zext_ln89_2_fu_352_p1 = lshr_ln_fu_342_p4;

always @ (posedge ap_clk) begin
    zext_ln86_reg_663[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter1_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter2_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter3_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter4_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter5_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter6_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_663_pp0_iter7_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
end

endmodule //td_fused_top_tdf4_l2_writeOutputs_1
module td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1(
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
parameter AddressRange = 32'd16;
parameter AddressWidth = 32'd4;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1_ram td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1_ram_U(
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
module td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1_ram (addr0, ce0, d0, we0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 4;
parameter MEM_SIZE = 16;

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
//    $readmemh("./td_fused_top_tdf4_l2_writeOutputs_1_running_sums_1_ram.dat", ram);
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
module td_fused_top_tdf4_l2_accum (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        l2_products_0_address0,
        l2_products_0_ce0,
        l2_products_0_q0,
        l2_products_0_address1,
        l2_products_0_ce1,
        l2_products_0_q1,
        l2_products_1_address0,
        l2_products_1_ce0,
        l2_products_1_q0,
        l2_products_1_address1,
        l2_products_1_ce1,
        l2_products_1_q1,
        l2_products_2_address0,
        l2_products_2_ce0,
        l2_products_2_q0,
        l2_products_2_address1,
        l2_products_2_ce1,
        l2_products_2_q1,
        l2_products_3_address0,
        l2_products_3_ce0,
        l2_products_3_q0,
        l2_products_3_address1,
        l2_products_3_ce1,
        l2_products_3_q1,
        l2_partial_sums_0_address0,
        l2_partial_sums_0_ce0,
        l2_partial_sums_0_we0,
        l2_partial_sums_0_d0,
        l2_partial_sums_0_address1,
        l2_partial_sums_0_ce1,
        l2_partial_sums_0_we1,
        l2_partial_sums_0_d1,
        l2_partial_sums_1_address0,
        l2_partial_sums_1_ce0,
        l2_partial_sums_1_we0,
        l2_partial_sums_1_d0,
        l2_partial_sums_1_address1,
        l2_partial_sums_1_ce1,
        l2_partial_sums_1_we1,
        l2_partial_sums_1_d1,
        l2_partial_sums_2_address0,
        l2_partial_sums_2_ce0,
        l2_partial_sums_2_we0,
        l2_partial_sums_2_d0,
        l2_partial_sums_2_address1,
        l2_partial_sums_2_ce1,
        l2_partial_sums_2_we1,
        l2_partial_sums_2_d1,
        l2_partial_sums_3_address0,
        l2_partial_sums_3_ce0,
        l2_partial_sums_3_we0,
        l2_partial_sums_3_d0,
        l2_partial_sums_3_address1,
        l2_partial_sums_3_ce1,
        l2_partial_sums_3_we1,
        l2_partial_sums_3_d1
);

parameter    ap_ST_fsm_state1 = 12'd1;
parameter    ap_ST_fsm_state2 = 12'd2;
parameter    ap_ST_fsm_state3 = 12'd4;
parameter    ap_ST_fsm_state4 = 12'd8;
parameter    ap_ST_fsm_state5 = 12'd16;
parameter    ap_ST_fsm_state6 = 12'd32;
parameter    ap_ST_fsm_state7 = 12'd64;
parameter    ap_ST_fsm_state8 = 12'd128;
parameter    ap_ST_fsm_state9 = 12'd256;
parameter    ap_ST_fsm_state10 = 12'd512;
parameter    ap_ST_fsm_state11 = 12'd1024;
parameter    ap_ST_fsm_state12 = 12'd2048;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [3:0] l2_products_0_address0;
output   l2_products_0_ce0;
input  [15:0] l2_products_0_q0;
output  [3:0] l2_products_0_address1;
output   l2_products_0_ce1;
input  [15:0] l2_products_0_q1;
output  [3:0] l2_products_1_address0;
output   l2_products_1_ce0;
input  [15:0] l2_products_1_q0;
output  [3:0] l2_products_1_address1;
output   l2_products_1_ce1;
input  [15:0] l2_products_1_q1;
output  [3:0] l2_products_2_address0;
output   l2_products_2_ce0;
input  [15:0] l2_products_2_q0;
output  [3:0] l2_products_2_address1;
output   l2_products_2_ce1;
input  [15:0] l2_products_2_q1;
output  [3:0] l2_products_3_address0;
output   l2_products_3_ce0;
input  [15:0] l2_products_3_q0;
output  [3:0] l2_products_3_address1;
output   l2_products_3_ce1;
input  [15:0] l2_products_3_q1;
output  [1:0] l2_partial_sums_0_address0;
output   l2_partial_sums_0_ce0;
output   l2_partial_sums_0_we0;
output  [15:0] l2_partial_sums_0_d0;
output  [1:0] l2_partial_sums_0_address1;
output   l2_partial_sums_0_ce1;
output   l2_partial_sums_0_we1;
output  [15:0] l2_partial_sums_0_d1;
output  [1:0] l2_partial_sums_1_address0;
output   l2_partial_sums_1_ce0;
output   l2_partial_sums_1_we0;
output  [15:0] l2_partial_sums_1_d0;
output  [1:0] l2_partial_sums_1_address1;
output   l2_partial_sums_1_ce1;
output   l2_partial_sums_1_we1;
output  [15:0] l2_partial_sums_1_d1;
output  [1:0] l2_partial_sums_2_address0;
output   l2_partial_sums_2_ce0;
output   l2_partial_sums_2_we0;
output  [15:0] l2_partial_sums_2_d0;
output  [1:0] l2_partial_sums_2_address1;
output   l2_partial_sums_2_ce1;
output   l2_partial_sums_2_we1;
output  [15:0] l2_partial_sums_2_d1;
output  [1:0] l2_partial_sums_3_address0;
output   l2_partial_sums_3_ce0;
output   l2_partial_sums_3_we0;
output  [15:0] l2_partial_sums_3_d0;
output  [1:0] l2_partial_sums_3_address1;
output   l2_partial_sums_3_ce1;
output   l2_partial_sums_3_we1;
output  [15:0] l2_partial_sums_3_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg l2_products_0_ce0;
reg l2_products_0_ce1;
reg l2_products_1_ce0;
reg l2_products_1_ce1;
reg l2_products_2_ce0;
reg l2_products_2_ce1;
reg l2_products_3_ce0;
reg l2_products_3_ce1;
reg l2_partial_sums_0_ce0;
reg l2_partial_sums_0_we0;
reg l2_partial_sums_0_ce1;
reg l2_partial_sums_0_we1;
reg l2_partial_sums_1_ce0;
reg l2_partial_sums_1_we0;
reg l2_partial_sums_1_ce1;
reg l2_partial_sums_1_we1;
reg l2_partial_sums_2_ce0;
reg l2_partial_sums_2_we0;
reg l2_partial_sums_2_ce1;
reg l2_partial_sums_2_we1;
reg l2_partial_sums_3_ce0;
reg l2_partial_sums_3_we0;
reg l2_partial_sums_3_ce1;
reg l2_partial_sums_3_we1;

reg    ap_done_reg;
  reg   [11:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [1:0] add_ln40_fu_384_p2;
reg   [1:0] add_ln40_reg_552;
wire    ap_CS_fsm_state2;
wire   [0:0] trunc_ln52_fu_396_p1;
reg   [0:0] trunc_ln52_reg_560;
wire   [0:0] icmp_ln40_fu_390_p2;
wire   [1:0] out_idx_2_fu_406_p2;
reg   [1:0] out_idx_2_reg_565;
wire   [63:0] zext_ln54_fu_412_p1;
reg   [63:0] zext_ln54_reg_570;
wire   [63:0] zext_ln54_4_fu_416_p1;
reg   [63:0] zext_ln54_4_reg_578;
wire   [2:0] add_ln45_fu_420_p2;
reg   [2:0] add_ln45_reg_586;
wire    ap_CS_fsm_state3;
reg   [15:0] l2_products_0_load_reg_634;
wire    ap_CS_fsm_state4;
reg   [15:0] l2_products_1_load_reg_639;
reg   [15:0] l2_products_2_load_reg_644;
reg   [15:0] l2_products_3_load_reg_649;
reg   [15:0] l2_products_0_load_2_reg_654;
reg   [15:0] l2_products_1_load_2_reg_659;
reg   [15:0] l2_products_2_load_2_reg_664;
reg   [15:0] l2_products_3_load_2_reg_669;
wire    ap_CS_fsm_state5;
reg   [1:0] group_reg_290;
wire   [0:0] icmp_ln45_fu_458_p2;
reg    ap_block_state1;
reg   [2:0] i_1_1_reg_301;
wire    ap_CS_fsm_state12;
wire   [63:0] zext_ln54_5_fu_435_p1;
wire   [63:0] zext_ln54_6_fu_450_p1;
reg   [15:0] add14_lcssa15_fu_58;
wire   [15:0] grp_fu_312_p2;
reg   [15:0] add14_1_lcssa17_fu_62;
wire   [15:0] grp_fu_316_p2;
reg   [15:0] add14_2_lcssa19_fu_66;
wire   [15:0] grp_fu_320_p2;
reg   [15:0] add14_3_lcssa21_fu_70;
wire   [15:0] grp_fu_324_p2;
reg   [15:0] add14_4_lcssa23_fu_74;
wire   [15:0] grp_fu_328_p2;
reg   [15:0] add14_5_lcssa25_fu_78;
wire   [15:0] grp_fu_332_p2;
reg   [15:0] add14_6_lcssa27_fu_82;
wire   [15:0] grp_fu_336_p2;
reg   [15:0] add14_7_lcssa29_fu_86;
wire   [15:0] grp_fu_340_p2;
wire   [1:0] out_idx_fu_400_p2;
wire   [4:0] tmp_s_fu_426_p4;
wire   [4:0] tmp_35_fu_443_p3;
reg   [11:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 12'd1;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U629(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_lcssa15_fu_58),
    .din1(l2_products_0_load_reg_634),
    .dout(grp_fu_312_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U630(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_1_lcssa17_fu_62),
    .din1(l2_products_1_load_reg_639),
    .dout(grp_fu_316_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U631(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_2_lcssa19_fu_66),
    .din1(l2_products_2_load_reg_644),
    .dout(grp_fu_320_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U632(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_3_lcssa21_fu_70),
    .din1(l2_products_3_load_reg_649),
    .dout(grp_fu_324_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U633(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_4_lcssa23_fu_74),
    .din1(l2_products_0_load_2_reg_654),
    .dout(grp_fu_328_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U634(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_5_lcssa25_fu_78),
    .din1(l2_products_1_load_2_reg_659),
    .dout(grp_fu_332_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U635(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_6_lcssa27_fu_82),
    .din1(l2_products_2_load_2_reg_664),
    .dout(grp_fu_336_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U636(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(add14_7_lcssa29_fu_86),
    .din1(l2_products_3_load_2_reg_669),
    .dout(grp_fu_340_p2)
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
        end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        group_reg_290 <= 2'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        group_reg_290 <= add_ln40_reg_552;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        i_1_1_reg_301 <= add_ln45_reg_586;
    end else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd0))) begin
        i_1_1_reg_301 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        add14_1_lcssa17_fu_62 <= grp_fu_316_p2;
        add14_2_lcssa19_fu_66 <= grp_fu_320_p2;
        add14_3_lcssa21_fu_70 <= grp_fu_324_p2;
        add14_4_lcssa23_fu_74 <= grp_fu_328_p2;
        add14_5_lcssa25_fu_78 <= grp_fu_332_p2;
        add14_6_lcssa27_fu_82 <= grp_fu_336_p2;
        add14_7_lcssa29_fu_86 <= grp_fu_340_p2;
        add14_lcssa15_fu_58 <= grp_fu_312_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln40_reg_552 <= add_ln40_fu_384_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln45_reg_586 <= add_ln45_fu_420_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        l2_products_0_load_2_reg_654 <= l2_products_0_q0;
        l2_products_0_load_reg_634 <= l2_products_0_q1;
        l2_products_1_load_2_reg_659 <= l2_products_1_q0;
        l2_products_1_load_reg_639 <= l2_products_1_q1;
        l2_products_2_load_2_reg_664 <= l2_products_2_q0;
        l2_products_2_load_reg_644 <= l2_products_2_q1;
        l2_products_3_load_2_reg_669 <= l2_products_3_q0;
        l2_products_3_load_reg_649 <= l2_products_3_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd0))) begin
        out_idx_2_reg_565[1] <= out_idx_2_fu_406_p2[1];
        trunc_ln52_reg_560 <= trunc_ln52_fu_396_p1;
        zext_ln54_4_reg_578[1] <= zext_ln54_4_fu_416_p1[1];
        zext_ln54_reg_570[1] <= zext_ln54_fu_412_p1[1];
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd1))) begin
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
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_0_ce0 = 1'b1;
    end else begin
        l2_partial_sums_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_0_ce1 = 1'b1;
    end else begin
        l2_partial_sums_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_0_we0 = 1'b1;
    end else begin
        l2_partial_sums_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_0_we1 = 1'b1;
    end else begin
        l2_partial_sums_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_1_ce0 = 1'b1;
    end else begin
        l2_partial_sums_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_1_ce1 = 1'b1;
    end else begin
        l2_partial_sums_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_1_we0 = 1'b1;
    end else begin
        l2_partial_sums_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_1_we1 = 1'b1;
    end else begin
        l2_partial_sums_1_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_2_ce0 = 1'b1;
    end else begin
        l2_partial_sums_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_2_ce1 = 1'b1;
    end else begin
        l2_partial_sums_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_2_we0 = 1'b1;
    end else begin
        l2_partial_sums_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_2_we1 = 1'b1;
    end else begin
        l2_partial_sums_2_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_3_ce0 = 1'b1;
    end else begin
        l2_partial_sums_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_partial_sums_3_ce1 = 1'b1;
    end else begin
        l2_partial_sums_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_3_we0 = 1'b1;
    end else begin
        l2_partial_sums_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
        l2_partial_sums_3_we1 = 1'b1;
    end else begin
        l2_partial_sums_3_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_0_ce0 = 1'b1;
    end else begin
        l2_products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_0_ce1 = 1'b1;
    end else begin
        l2_products_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_1_ce0 = 1'b1;
    end else begin
        l2_products_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_1_ce1 = 1'b1;
    end else begin
        l2_products_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_2_ce0 = 1'b1;
    end else begin
        l2_products_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_2_ce1 = 1'b1;
    end else begin
        l2_products_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_3_ce0 = 1'b1;
    end else begin
        l2_products_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        l2_products_3_ce1 = 1'b1;
    end else begin
        l2_products_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln40_fu_390_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln45_fu_458_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln40_fu_384_p2 = (group_reg_290 + 2'd1);

assign add_ln45_fu_420_p2 = (i_1_1_reg_301 + 3'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln40_fu_390_p2 = ((group_reg_290 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln45_fu_458_p2 = ((i_1_1_reg_301 == 3'd4) ? 1'b1 : 1'b0);

assign l2_partial_sums_0_address0 = zext_ln54_4_reg_578;

assign l2_partial_sums_0_address1 = zext_ln54_reg_570;

assign l2_partial_sums_0_d0 = add14_4_lcssa23_fu_74;

assign l2_partial_sums_0_d1 = add14_lcssa15_fu_58;

assign l2_partial_sums_1_address0 = zext_ln54_4_reg_578;

assign l2_partial_sums_1_address1 = zext_ln54_reg_570;

assign l2_partial_sums_1_d0 = add14_5_lcssa25_fu_78;

assign l2_partial_sums_1_d1 = add14_1_lcssa17_fu_62;

assign l2_partial_sums_2_address0 = zext_ln54_4_reg_578;

assign l2_partial_sums_2_address1 = zext_ln54_reg_570;

assign l2_partial_sums_2_d0 = add14_6_lcssa27_fu_82;

assign l2_partial_sums_2_d1 = add14_2_lcssa19_fu_66;

assign l2_partial_sums_3_address0 = zext_ln54_4_reg_578;

assign l2_partial_sums_3_address1 = zext_ln54_reg_570;

assign l2_partial_sums_3_d0 = add14_7_lcssa29_fu_86;

assign l2_partial_sums_3_d1 = add14_3_lcssa21_fu_70;

assign l2_products_0_address0 = zext_ln54_6_fu_450_p1;

assign l2_products_0_address1 = zext_ln54_5_fu_435_p1;

assign l2_products_1_address0 = zext_ln54_6_fu_450_p1;

assign l2_products_1_address1 = zext_ln54_5_fu_435_p1;

assign l2_products_2_address0 = zext_ln54_6_fu_450_p1;

assign l2_products_2_address1 = zext_ln54_5_fu_435_p1;

assign l2_products_3_address0 = zext_ln54_6_fu_450_p1;

assign l2_products_3_address1 = zext_ln54_5_fu_435_p1;

assign out_idx_2_fu_406_p2 = (out_idx_fu_400_p2 | 2'd1);

assign out_idx_fu_400_p2 = group_reg_290 << 2'd1;

assign tmp_35_fu_443_p3 = {{i_1_1_reg_301}, {out_idx_2_reg_565}};

assign tmp_s_fu_426_p4 = {{{i_1_1_reg_301}, {trunc_ln52_reg_560}}, {1'd0}};

assign trunc_ln52_fu_396_p1 = group_reg_290[0:0];

assign zext_ln54_4_fu_416_p1 = out_idx_2_fu_406_p2;

assign zext_ln54_5_fu_435_p1 = tmp_s_fu_426_p4;

assign zext_ln54_6_fu_450_p1 = tmp_35_fu_443_p3;

assign zext_ln54_fu_412_p1 = out_idx_fu_400_p2;

always @ (posedge ap_clk) begin
    out_idx_2_reg_565[0] <= 1'b1;
    zext_ln54_reg_570[0] <= 1'b0;
    zext_ln54_reg_570[63:2] <= 62'b00000000000000000000000000000000000000000000000000000000000000;
    zext_ln54_4_reg_578[0] <= 1'b1;
    zext_ln54_4_reg_578[63:2] <= 62'b00000000000000000000000000000000000000000000000000000000000000;
end

endmodule //td_fused_top_tdf4_l2_accum
module td_fused_top_tdf4_l2_multiply34 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        intermediate_fmaps_0_read,
        intermediate_fmaps_1_read,
        intermediate_fmaps_2_read,
        intermediate_fmaps_3_read,
        l2_filter_data_0_address0,
        l2_filter_data_0_ce0,
        l2_filter_data_0_q0,
        l2_filter_data_0_address1,
        l2_filter_data_0_ce1,
        l2_filter_data_0_q1,
        l2_filter_data_1_address0,
        l2_filter_data_1_ce0,
        l2_filter_data_1_q0,
        l2_filter_data_1_address1,
        l2_filter_data_1_ce1,
        l2_filter_data_1_q1,
        l2_products_0_address0,
        l2_products_0_ce0,
        l2_products_0_we0,
        l2_products_0_d0,
        l2_products_1_address0,
        l2_products_1_ce0,
        l2_products_1_we0,
        l2_products_1_d0,
        l2_products_2_address0,
        l2_products_2_ce0,
        l2_products_2_we0,
        l2_products_2_d0,
        l2_products_3_address0,
        l2_products_3_ce0,
        l2_products_3_we0,
        l2_products_3_d0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state10 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] intermediate_fmaps_0_read;
input  [15:0] intermediate_fmaps_1_read;
input  [15:0] intermediate_fmaps_2_read;
input  [15:0] intermediate_fmaps_3_read;
output  [9:0] l2_filter_data_0_address0;
output   l2_filter_data_0_ce0;
input  [15:0] l2_filter_data_0_q0;
output  [9:0] l2_filter_data_0_address1;
output   l2_filter_data_0_ce1;
input  [15:0] l2_filter_data_0_q1;
output  [9:0] l2_filter_data_1_address0;
output   l2_filter_data_1_ce0;
input  [15:0] l2_filter_data_1_q0;
output  [9:0] l2_filter_data_1_address1;
output   l2_filter_data_1_ce1;
input  [15:0] l2_filter_data_1_q1;
output  [3:0] l2_products_0_address0;
output   l2_products_0_ce0;
output   l2_products_0_we0;
output  [15:0] l2_products_0_d0;
output  [3:0] l2_products_1_address0;
output   l2_products_1_ce0;
output   l2_products_1_we0;
output  [15:0] l2_products_1_d0;
output  [3:0] l2_products_2_address0;
output   l2_products_2_ce0;
output   l2_products_2_we0;
output  [15:0] l2_products_2_d0;
output  [3:0] l2_products_3_address0;
output   l2_products_3_ce0;
output   l2_products_3_we0;
output  [15:0] l2_products_3_d0;
input  [4:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg l2_filter_data_0_ce0;
reg l2_filter_data_0_ce1;
reg l2_filter_data_1_ce0;
reg l2_filter_data_1_ce1;
reg l2_products_0_ce0;
reg l2_products_0_we0;
reg l2_products_1_ce0;
reg l2_products_1_we0;
reg l2_products_2_ce0;
reg l2_products_2_we0;
reg l2_products_3_ce0;
reg l2_products_3_we0;
reg indices_23_read;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [6:0] i_1_1_reg_234;
reg   [4:0] indices_23_read_reg_381;
wire   [0:0] tmp_56_fu_261_p3;
reg   [0:0] tmp_56_reg_387;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_56_reg_387_pp0_iter1_reg;
reg   [0:0] tmp_56_reg_387_pp0_iter2_reg;
reg   [0:0] tmp_56_reg_387_pp0_iter3_reg;
reg   [0:0] tmp_56_reg_387_pp0_iter4_reg;
reg   [0:0] tmp_56_reg_387_pp0_iter5_reg;
reg   [0:0] tmp_56_reg_387_pp0_iter6_reg;
wire   [6:0] add_ln20_fu_269_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [1:0] l2_i_fu_275_p4;
reg   [1:0] l2_i_reg_396;
reg   [3:0] tmp_32_reg_411;
reg   [3:0] tmp_32_reg_411_pp0_iter1_reg;
reg   [3:0] tmp_32_reg_411_pp0_iter2_reg;
reg   [3:0] tmp_32_reg_411_pp0_iter3_reg;
reg   [3:0] tmp_32_reg_411_pp0_iter4_reg;
reg   [3:0] tmp_32_reg_411_pp0_iter5_reg;
reg   [3:0] tmp_32_reg_411_pp0_iter6_reg;
wire   [15:0] tmp_fu_341_p6;
reg   [15:0] tmp_reg_426;
reg   [15:0] l2_filter_data_0_load_reg_434;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] l2_filter_data_1_load_reg_439;
reg   [15:0] l2_filter_data_0_load_2_reg_444;
reg   [15:0] l2_filter_data_1_load_2_reg_449;
wire   [15:0] grp_fu_245_p2;
reg   [15:0] mul_i_i_reg_454;
wire   [15:0] grp_fu_249_p2;
reg   [15:0] mul18_1_i_i_reg_459;
wire   [15:0] grp_fu_253_p2;
reg   [15:0] mul18_2_i_i_reg_464;
wire   [15:0] grp_fu_257_p2;
reg   [15:0] mul18_3_i_i_reg_469;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
wire   [63:0] zext_ln29_fu_304_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln29_15_fu_335_p1;
wire   [63:0] tmp_33_fu_350_p3;
wire   [2:0] lshr_ln_fu_285_p4;
wire   [9:0] tmp_s_fu_295_p4;
wire   [2:0] or_ln29_fu_320_p2;
wire   [9:0] tmp_34_fu_326_p4;
wire    ap_CS_fsm_state10;
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
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
end

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U613(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_426),
    .din1(l2_filter_data_0_load_reg_434),
    .dout(grp_fu_245_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U614(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_426),
    .din1(l2_filter_data_1_load_reg_439),
    .dout(grp_fu_249_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U615(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_426),
    .din1(l2_filter_data_0_load_2_reg_444),
    .dout(grp_fu_253_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U616(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_426),
    .din1(l2_filter_data_1_load_2_reg_449),
    .dout(grp_fu_257_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U617(
    .din0(intermediate_fmaps_0_read),
    .din1(intermediate_fmaps_1_read),
    .din2(intermediate_fmaps_2_read),
    .din3(intermediate_fmaps_3_read),
    .din4(l2_i_reg_396),
    .dout(tmp_fu_341_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_234 <= 7'd0;
    end else if (((tmp_56_fu_261_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_1_1_reg_234 <= add_ln20_fu_269_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_23_read_reg_381 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_56_reg_387 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_0_load_2_reg_444 <= l2_filter_data_0_q0;
        l2_filter_data_0_load_reg_434 <= l2_filter_data_0_q1;
        l2_filter_data_1_load_2_reg_449 <= l2_filter_data_1_q0;
        l2_filter_data_1_load_reg_439 <= l2_filter_data_1_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_56_fu_261_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_i_reg_396 <= {{i_1_1_reg_234[5:4]}};
        tmp_32_reg_411 <= {{i_1_1_reg_234[5:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_56_reg_387_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul18_1_i_i_reg_459 <= grp_fu_249_p2;
        mul18_2_i_i_reg_464 <= grp_fu_253_p2;
        mul18_3_i_i_reg_469 <= grp_fu_257_p2;
        mul_i_i_reg_454 <= grp_fu_245_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_32_reg_411_pp0_iter1_reg <= tmp_32_reg_411;
        tmp_56_reg_387 <= i_1_1_reg_234[32'd6];
        tmp_56_reg_387_pp0_iter1_reg <= tmp_56_reg_387;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_32_reg_411_pp0_iter2_reg <= tmp_32_reg_411_pp0_iter1_reg;
        tmp_32_reg_411_pp0_iter3_reg <= tmp_32_reg_411_pp0_iter2_reg;
        tmp_32_reg_411_pp0_iter4_reg <= tmp_32_reg_411_pp0_iter3_reg;
        tmp_32_reg_411_pp0_iter5_reg <= tmp_32_reg_411_pp0_iter4_reg;
        tmp_32_reg_411_pp0_iter6_reg <= tmp_32_reg_411_pp0_iter5_reg;
        tmp_56_reg_387_pp0_iter2_reg <= tmp_56_reg_387_pp0_iter1_reg;
        tmp_56_reg_387_pp0_iter3_reg <= tmp_56_reg_387_pp0_iter2_reg;
        tmp_56_reg_387_pp0_iter4_reg <= tmp_56_reg_387_pp0_iter3_reg;
        tmp_56_reg_387_pp0_iter5_reg <= tmp_56_reg_387_pp0_iter4_reg;
        tmp_56_reg_387_pp0_iter6_reg <= tmp_56_reg_387_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_56_reg_387 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_426 <= tmp_fu_341_p6;
    end
end

always @ (*) begin
    if ((tmp_56_fu_261_p3 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
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
    if (((ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_blk_n = indices_23_empty_n;
    end else begin
        indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_0_ce0 = 1'b1;
    end else begin
        l2_filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_0_ce1 = 1'b1;
    end else begin
        l2_filter_data_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_1_ce0 = 1'b1;
    end else begin
        l2_filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_1_ce1 = 1'b1;
    end else begin
        l2_filter_data_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_0_ce0 = 1'b1;
    end else begin
        l2_products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (tmp_56_reg_387_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_0_we0 = 1'b1;
    end else begin
        l2_products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_1_ce0 = 1'b1;
    end else begin
        l2_products_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (tmp_56_reg_387_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_1_we0 = 1'b1;
    end else begin
        l2_products_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_2_ce0 = 1'b1;
    end else begin
        l2_products_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (tmp_56_reg_387_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_2_we0 = 1'b1;
    end else begin
        l2_products_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_3_ce0 = 1'b1;
    end else begin
        l2_products_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (tmp_56_reg_387_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_3_we0 = 1'b1;
    end else begin
        l2_products_3_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((tmp_56_fu_261_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((tmp_56_fu_261_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln20_fu_269_p2 = (i_1_1_reg_234 + 7'd4);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign l2_filter_data_0_address0 = zext_ln29_15_fu_335_p1;

assign l2_filter_data_0_address1 = zext_ln29_fu_304_p1;

assign l2_filter_data_1_address0 = zext_ln29_15_fu_335_p1;

assign l2_filter_data_1_address1 = zext_ln29_fu_304_p1;

assign l2_i_fu_275_p4 = {{i_1_1_reg_234[5:4]}};

assign l2_products_0_address0 = tmp_33_fu_350_p3;

assign l2_products_0_d0 = mul_i_i_reg_454;

assign l2_products_1_address0 = tmp_33_fu_350_p3;

assign l2_products_1_d0 = mul18_1_i_i_reg_459;

assign l2_products_2_address0 = tmp_33_fu_350_p3;

assign l2_products_2_d0 = mul18_2_i_i_reg_464;

assign l2_products_3_address0 = tmp_33_fu_350_p3;

assign l2_products_3_d0 = mul18_3_i_i_reg_469;

assign lshr_ln_fu_285_p4 = {{i_1_1_reg_234[3:1]}};

assign or_ln29_fu_320_p2 = (lshr_ln_fu_285_p4 | 3'd1);

assign tmp_33_fu_350_p3 = {{60'd0}, {tmp_32_reg_411_pp0_iter6_reg}};

assign tmp_34_fu_326_p4 = {{{or_ln29_fu_320_p2}, {indices_23_read_reg_381}}, {l2_i_fu_275_p4}};

assign tmp_56_fu_261_p3 = i_1_1_reg_234[32'd6];

assign tmp_s_fu_295_p4 = {{{lshr_ln_fu_285_p4}, {indices_23_read_reg_381}}, {l2_i_fu_275_p4}};

assign zext_ln29_15_fu_335_p1 = tmp_34_fu_326_p4;

assign zext_ln29_fu_304_p1 = tmp_s_fu_295_p4;

endmodule //td_fused_top_tdf4_l2_multiply34
module td_fused_top_tdf4_adjust (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        sums_0_read,
        sums_1_read,
        sums_2_read,
        sums_3_read,
        adjustments_address0,
        adjustments_ce0,
        adjustments_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        indices_23_out_din,
        indices_23_out_full_n,
        indices_23_out_write,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state25 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] sums_0_read;
input  [15:0] sums_1_read;
input  [15:0] sums_2_read;
input  [15:0] sums_3_read;
output  [6:0] adjustments_address0;
output   adjustments_ce0;
input  [47:0] adjustments_q0;
input  [4:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [4:0] indices_23_out_din;
input   indices_23_out_full_n;
output   indices_23_out_write;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg adjustments_ce0;
reg indices_23_read;
reg indices_23_out_write;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg    indices_23_out_blk_n;
reg   [0:0] write_flag6_0_reg_153;
reg   [0:0] write_flag9_0_reg_164;
reg   [0:0] write_flag12_0_reg_175;
reg   [0:0] write_flag_0_reg_186;
reg   [2:0] o_reg_197;
reg   [15:0] outputs_1_011_reg_208;
reg   [15:0] outputs_0_010_reg_220;
reg   [15:0] outputs_2_09_reg_232;
reg   [15:0] outputs_3_08_reg_244;
reg   [4:0] indices_23_read_reg_546;
wire   [2:0] add_ln213_fu_268_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_state11_pp0_stage0_iter9;
wire    ap_block_state12_pp0_stage0_iter10;
wire    ap_block_state13_pp0_stage0_iter11;
wire    ap_block_state14_pp0_stage0_iter12;
wire    ap_block_state15_pp0_stage0_iter13;
wire    ap_block_state16_pp0_stage0_iter14;
wire    ap_block_state17_pp0_stage0_iter15;
wire    ap_block_state18_pp0_stage0_iter16;
wire    ap_block_state19_pp0_stage0_iter17;
wire    ap_block_state20_pp0_stage0_iter18;
wire    ap_block_state21_pp0_stage0_iter19;
wire    ap_block_state22_pp0_stage0_iter20;
wire    ap_block_state23_pp0_stage0_iter21;
wire    ap_block_state24_pp0_stage0_iter22;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln213_fu_274_p2;
reg   [0:0] icmp_ln213_reg_556;
reg   [0:0] icmp_ln213_reg_556_pp0_iter1_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter2_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter3_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter4_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter5_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter6_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter7_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter8_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter9_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter10_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter11_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter12_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter13_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter14_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter15_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter16_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter17_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter18_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter19_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter20_reg;
reg   [0:0] icmp_ln213_reg_556_pp0_iter21_reg;
wire   [1:0] trunc_ln219_fu_280_p1;
reg   [1:0] trunc_ln219_reg_560;
reg   [1:0] trunc_ln219_reg_560_pp0_iter1_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter2_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter3_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter4_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter5_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter6_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter7_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter8_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter9_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter10_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter11_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter12_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter13_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter14_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter15_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter16_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter17_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter18_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter19_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter20_reg;
reg   [1:0] trunc_ln219_reg_560_pp0_iter21_reg;
wire   [0:0] write_flag_1_fu_296_p6;
wire   [0:0] write_flag12_1_fu_310_p6;
wire   [0:0] write_flag9_1_fu_324_p6;
wire   [0:0] write_flag6_1_fu_338_p6;
wire   [15:0] trunc_ln220_fu_352_p1;
reg   [15:0] trunc_ln220_reg_593;
reg   [15:0] tmp_184_i_i_reg_598;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter2_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter3_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter4_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter5_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter6_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter7_reg;
reg   [15:0] tmp_184_i_i_reg_598_pp0_iter8_reg;
reg   [15:0] tmp_185_i_i_reg_603;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter2_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter3_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter4_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter5_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter6_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter7_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter8_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter9_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter10_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter11_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter12_reg;
reg   [15:0] tmp_185_i_i_reg_603_pp0_iter13_reg;
wire   [15:0] val_in_assign_fu_376_p6;
reg   [15:0] val_in_assign_reg_608;
wire   [15:0] grp_fu_260_p2;
reg   [15:0] sub_i_i_i_reg_618;
wire   [15:0] grp_fu_264_p2;
reg   [15:0] normalized_reg_628;
wire   [15:0] grp_fu_256_p2;
reg   [15:0] biased_reg_638;
wire   [15:0] outputs_3_1_fu_446_p3;
reg    ap_enable_reg_pp0_iter22;
wire   [15:0] outputs_2_1_fu_454_p3;
wire   [15:0] outputs_0_1_fu_478_p3;
wire   [15:0] outputs_1_1_fu_494_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
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
reg    ap_condition_pp0_exit_iter21_state23;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln220_fu_291_p1;
wire   [15:0] grp_fu_256_p1;
wire   [15:0] grp_fu_260_p1;
wire   [15:0] grp_fu_264_p1;
wire   [6:0] ochan_fu_284_p3;
wire   [15:0] data_V_fu_397_p1;
wire   [0:0] p_Result_s_fu_400_p3;
wire   [0:0] icmp_ln223_fu_415_p2;
wire   [15:0] activated_fu_408_p3;
wire   [0:0] icmp_ln223_7_fu_428_p2;
wire   [15:0] select_ln223_fu_420_p3;
wire   [0:0] icmp_ln223_8_fu_441_p2;
wire   [15:0] select_ln223_13_fu_433_p3;
wire   [15:0] select_ln223_14_fu_462_p3;
wire   [15:0] select_ln223_15_fu_470_p3;
wire   [15:0] select_ln223_16_fu_486_p3;
wire    ap_CS_fsm_state25;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter22 = 1'b0;
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
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U598(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(normalized_reg_628),
    .din1(grp_fu_256_p1),
    .dout(grp_fu_256_p2)
);

td_fused_top_hsub_16ns_16ns_16_7_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 7 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_7_full_dsp_1_U599(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(val_in_assign_reg_608),
    .din1(grp_fu_260_p1),
    .dout(grp_fu_260_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U600(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_618),
    .din1(grp_fu_264_p1),
    .dout(grp_fu_264_p2)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U601(
    .din0(1'd1),
    .din1(write_flag_0_reg_186),
    .din2(write_flag_0_reg_186),
    .din3(write_flag_0_reg_186),
    .din4(trunc_ln219_fu_280_p1),
    .dout(write_flag_1_fu_296_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U602(
    .din0(write_flag12_0_reg_175),
    .din1(write_flag12_0_reg_175),
    .din2(write_flag12_0_reg_175),
    .din3(1'd1),
    .din4(trunc_ln219_fu_280_p1),
    .dout(write_flag12_1_fu_310_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U603(
    .din0(write_flag9_0_reg_164),
    .din1(write_flag9_0_reg_164),
    .din2(1'd1),
    .din3(write_flag9_0_reg_164),
    .din4(trunc_ln219_fu_280_p1),
    .dout(write_flag9_1_fu_324_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U604(
    .din0(write_flag6_0_reg_153),
    .din1(1'd1),
    .din2(write_flag6_0_reg_153),
    .din3(write_flag6_0_reg_153),
    .din4(trunc_ln219_fu_280_p1),
    .dout(write_flag6_1_fu_338_p6)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U605(
    .din0(sums_0_read),
    .din1(sums_1_read),
    .din2(sums_2_read),
    .din3(sums_3_read),
    .din4(trunc_ln219_reg_560),
    .dout(val_in_assign_fu_376_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state25)) begin
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
        end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((((ap_enable_reg_pp0_iter20 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter21_state23) & (1'b0 == ap_block_pp0_stage0_subdone)) | (~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter21 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter22 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter21_state23) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter20;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter21;
        end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter22 <= 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        o_reg_197 <= add_ln213_fu_268_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        o_reg_197 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag12_0_reg_175 <= write_flag12_1_fu_310_p6;
    end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag12_0_reg_175 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag6_0_reg_153 <= write_flag6_1_fu_338_p6;
    end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_153 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag9_0_reg_164 <= write_flag9_1_fu_324_p6;
    end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_164 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag_0_reg_186 <= write_flag_1_fu_296_p6;
    end else if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_186 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_556_pp0_iter20_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        biased_reg_638 <= grp_fu_256_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln213_reg_556 <= icmp_ln213_fu_274_p2;
        icmp_ln213_reg_556_pp0_iter1_reg <= icmp_ln213_reg_556;
        trunc_ln219_reg_560_pp0_iter1_reg <= trunc_ln219_reg_560;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln213_reg_556_pp0_iter10_reg <= icmp_ln213_reg_556_pp0_iter9_reg;
        icmp_ln213_reg_556_pp0_iter11_reg <= icmp_ln213_reg_556_pp0_iter10_reg;
        icmp_ln213_reg_556_pp0_iter12_reg <= icmp_ln213_reg_556_pp0_iter11_reg;
        icmp_ln213_reg_556_pp0_iter13_reg <= icmp_ln213_reg_556_pp0_iter12_reg;
        icmp_ln213_reg_556_pp0_iter14_reg <= icmp_ln213_reg_556_pp0_iter13_reg;
        icmp_ln213_reg_556_pp0_iter15_reg <= icmp_ln213_reg_556_pp0_iter14_reg;
        icmp_ln213_reg_556_pp0_iter16_reg <= icmp_ln213_reg_556_pp0_iter15_reg;
        icmp_ln213_reg_556_pp0_iter17_reg <= icmp_ln213_reg_556_pp0_iter16_reg;
        icmp_ln213_reg_556_pp0_iter18_reg <= icmp_ln213_reg_556_pp0_iter17_reg;
        icmp_ln213_reg_556_pp0_iter19_reg <= icmp_ln213_reg_556_pp0_iter18_reg;
        icmp_ln213_reg_556_pp0_iter20_reg <= icmp_ln213_reg_556_pp0_iter19_reg;
        icmp_ln213_reg_556_pp0_iter21_reg <= icmp_ln213_reg_556_pp0_iter20_reg;
        icmp_ln213_reg_556_pp0_iter2_reg <= icmp_ln213_reg_556_pp0_iter1_reg;
        icmp_ln213_reg_556_pp0_iter3_reg <= icmp_ln213_reg_556_pp0_iter2_reg;
        icmp_ln213_reg_556_pp0_iter4_reg <= icmp_ln213_reg_556_pp0_iter3_reg;
        icmp_ln213_reg_556_pp0_iter5_reg <= icmp_ln213_reg_556_pp0_iter4_reg;
        icmp_ln213_reg_556_pp0_iter6_reg <= icmp_ln213_reg_556_pp0_iter5_reg;
        icmp_ln213_reg_556_pp0_iter7_reg <= icmp_ln213_reg_556_pp0_iter6_reg;
        icmp_ln213_reg_556_pp0_iter8_reg <= icmp_ln213_reg_556_pp0_iter7_reg;
        icmp_ln213_reg_556_pp0_iter9_reg <= icmp_ln213_reg_556_pp0_iter8_reg;
        tmp_184_i_i_reg_598_pp0_iter2_reg <= tmp_184_i_i_reg_598;
        tmp_184_i_i_reg_598_pp0_iter3_reg <= tmp_184_i_i_reg_598_pp0_iter2_reg;
        tmp_184_i_i_reg_598_pp0_iter4_reg <= tmp_184_i_i_reg_598_pp0_iter3_reg;
        tmp_184_i_i_reg_598_pp0_iter5_reg <= tmp_184_i_i_reg_598_pp0_iter4_reg;
        tmp_184_i_i_reg_598_pp0_iter6_reg <= tmp_184_i_i_reg_598_pp0_iter5_reg;
        tmp_184_i_i_reg_598_pp0_iter7_reg <= tmp_184_i_i_reg_598_pp0_iter6_reg;
        tmp_184_i_i_reg_598_pp0_iter8_reg <= tmp_184_i_i_reg_598_pp0_iter7_reg;
        tmp_185_i_i_reg_603_pp0_iter10_reg <= tmp_185_i_i_reg_603_pp0_iter9_reg;
        tmp_185_i_i_reg_603_pp0_iter11_reg <= tmp_185_i_i_reg_603_pp0_iter10_reg;
        tmp_185_i_i_reg_603_pp0_iter12_reg <= tmp_185_i_i_reg_603_pp0_iter11_reg;
        tmp_185_i_i_reg_603_pp0_iter13_reg <= tmp_185_i_i_reg_603_pp0_iter12_reg;
        tmp_185_i_i_reg_603_pp0_iter2_reg <= tmp_185_i_i_reg_603;
        tmp_185_i_i_reg_603_pp0_iter3_reg <= tmp_185_i_i_reg_603_pp0_iter2_reg;
        tmp_185_i_i_reg_603_pp0_iter4_reg <= tmp_185_i_i_reg_603_pp0_iter3_reg;
        tmp_185_i_i_reg_603_pp0_iter5_reg <= tmp_185_i_i_reg_603_pp0_iter4_reg;
        tmp_185_i_i_reg_603_pp0_iter6_reg <= tmp_185_i_i_reg_603_pp0_iter5_reg;
        tmp_185_i_i_reg_603_pp0_iter7_reg <= tmp_185_i_i_reg_603_pp0_iter6_reg;
        tmp_185_i_i_reg_603_pp0_iter8_reg <= tmp_185_i_i_reg_603_pp0_iter7_reg;
        tmp_185_i_i_reg_603_pp0_iter9_reg <= tmp_185_i_i_reg_603_pp0_iter8_reg;
        trunc_ln219_reg_560_pp0_iter10_reg <= trunc_ln219_reg_560_pp0_iter9_reg;
        trunc_ln219_reg_560_pp0_iter11_reg <= trunc_ln219_reg_560_pp0_iter10_reg;
        trunc_ln219_reg_560_pp0_iter12_reg <= trunc_ln219_reg_560_pp0_iter11_reg;
        trunc_ln219_reg_560_pp0_iter13_reg <= trunc_ln219_reg_560_pp0_iter12_reg;
        trunc_ln219_reg_560_pp0_iter14_reg <= trunc_ln219_reg_560_pp0_iter13_reg;
        trunc_ln219_reg_560_pp0_iter15_reg <= trunc_ln219_reg_560_pp0_iter14_reg;
        trunc_ln219_reg_560_pp0_iter16_reg <= trunc_ln219_reg_560_pp0_iter15_reg;
        trunc_ln219_reg_560_pp0_iter17_reg <= trunc_ln219_reg_560_pp0_iter16_reg;
        trunc_ln219_reg_560_pp0_iter18_reg <= trunc_ln219_reg_560_pp0_iter17_reg;
        trunc_ln219_reg_560_pp0_iter19_reg <= trunc_ln219_reg_560_pp0_iter18_reg;
        trunc_ln219_reg_560_pp0_iter20_reg <= trunc_ln219_reg_560_pp0_iter19_reg;
        trunc_ln219_reg_560_pp0_iter21_reg <= trunc_ln219_reg_560_pp0_iter20_reg;
        trunc_ln219_reg_560_pp0_iter2_reg <= trunc_ln219_reg_560_pp0_iter1_reg;
        trunc_ln219_reg_560_pp0_iter3_reg <= trunc_ln219_reg_560_pp0_iter2_reg;
        trunc_ln219_reg_560_pp0_iter4_reg <= trunc_ln219_reg_560_pp0_iter3_reg;
        trunc_ln219_reg_560_pp0_iter5_reg <= trunc_ln219_reg_560_pp0_iter4_reg;
        trunc_ln219_reg_560_pp0_iter6_reg <= trunc_ln219_reg_560_pp0_iter5_reg;
        trunc_ln219_reg_560_pp0_iter7_reg <= trunc_ln219_reg_560_pp0_iter6_reg;
        trunc_ln219_reg_560_pp0_iter8_reg <= trunc_ln219_reg_560_pp0_iter7_reg;
        trunc_ln219_reg_560_pp0_iter9_reg <= trunc_ln219_reg_560_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_23_read_reg_546 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_556_pp0_iter12_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        normalized_reg_628 <= grp_fu_264_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter22 == 1'b1) & (icmp_ln213_reg_556_pp0_iter21_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        outputs_0_010_reg_220 <= outputs_0_1_fu_478_p3;
        outputs_1_011_reg_208 <= outputs_1_1_fu_494_p3;
        outputs_2_09_reg_232 <= outputs_2_1_fu_454_p3;
        outputs_3_08_reg_244 <= outputs_3_1_fu_446_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_556_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sub_i_i_i_reg_618 <= grp_fu_260_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_reg_556 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_184_i_i_reg_598 <= {{adjustments_q0[31:16]}};
        tmp_185_i_i_reg_603 <= {{adjustments_q0[47:32]}};
        trunc_ln220_reg_593 <= trunc_ln220_fu_352_p1;
        val_in_assign_reg_608 <= val_in_assign_fu_376_p6;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln219_reg_560 <= trunc_ln219_fu_280_p1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        adjustments_ce0 = 1'b1;
    end else begin
        adjustments_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter21 == 1'b1) & (ap_enable_reg_pp0_iter20 == 1'b0))) begin
        ap_condition_pp0_exit_iter21_state23 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter21_state23 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_274_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state25)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter21 == 1'b0) & (ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter22 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state25)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_blk_n = indices_23_empty_n;
    end else begin
        indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_out_blk_n = indices_23_out_full_n;
    end else begin
        indices_23_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_out_write = 1'b1;
    end else begin
        indices_23_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter21 == 1'b1) & (ap_enable_reg_pp0_iter20 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter21 == 1'b1) & (ap_enable_reg_pp0_iter20 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state25;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign activated_fu_408_p3 = ((p_Result_s_fu_400_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_638);

assign add_ln213_fu_268_p2 = (o_reg_197 + 3'd1);

assign adjustments_address0 = zext_ln220_fu_291_p1;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state25 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage0_iter19 = ~(1'b1 == 1'b1);

assign ap_block_state22_pp0_stage0_iter20 = ~(1'b1 == 1'b1);

assign ap_block_state23_pp0_stage0_iter21 = ~(1'b1 == 1'b1);

assign ap_block_state24_pp0_stage0_iter22 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return_0 = outputs_0_010_reg_220;

assign ap_return_1 = outputs_1_011_reg_208;

assign ap_return_2 = outputs_2_09_reg_232;

assign ap_return_3 = outputs_3_08_reg_244;

assign data_V_fu_397_p1 = biased_reg_638;

assign grp_fu_256_p1 = tmp_185_i_i_reg_603_pp0_iter13_reg;

assign grp_fu_260_p1 = trunc_ln220_reg_593;

assign grp_fu_264_p1 = tmp_184_i_i_reg_598_pp0_iter8_reg;

assign icmp_ln213_fu_274_p2 = ((o_reg_197 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln223_7_fu_428_p2 = ((trunc_ln219_reg_560_pp0_iter21_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln223_8_fu_441_p2 = ((trunc_ln219_reg_560_pp0_iter21_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln223_fu_415_p2 = ((trunc_ln219_reg_560_pp0_iter21_reg == 2'd0) ? 1'b1 : 1'b0);

assign indices_23_out_din = indices_23_dout;

assign ochan_fu_284_p3 = {{indices_23_read_reg_546}, {trunc_ln219_fu_280_p1}};

assign outputs_0_1_fu_478_p3 = ((icmp_ln223_8_fu_441_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_15_fu_470_p3);

assign outputs_1_1_fu_494_p3 = ((icmp_ln223_8_fu_441_p2[0:0] == 1'b1) ? outputs_1_011_reg_208 : select_ln223_16_fu_486_p3);

assign outputs_2_1_fu_454_p3 = ((icmp_ln223_8_fu_441_p2[0:0] == 1'b1) ? activated_fu_408_p3 : outputs_2_09_reg_232);

assign outputs_3_1_fu_446_p3 = ((icmp_ln223_8_fu_441_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_13_fu_433_p3);

assign p_Result_s_fu_400_p3 = data_V_fu_397_p1[32'd15];

assign select_ln223_13_fu_433_p3 = ((icmp_ln223_7_fu_428_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_fu_420_p3);

assign select_ln223_14_fu_462_p3 = ((icmp_ln223_fu_415_p2[0:0] == 1'b1) ? activated_fu_408_p3 : outputs_0_010_reg_220);

assign select_ln223_15_fu_470_p3 = ((icmp_ln223_7_fu_428_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_14_fu_462_p3);

assign select_ln223_16_fu_486_p3 = ((icmp_ln223_7_fu_428_p2[0:0] == 1'b1) ? activated_fu_408_p3 : outputs_1_011_reg_208);

assign select_ln223_fu_420_p3 = ((icmp_ln223_fu_415_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : activated_fu_408_p3);

assign trunc_ln219_fu_280_p1 = o_reg_197[1:0];

assign trunc_ln220_fu_352_p1 = adjustments_q0[15:0];

assign zext_ln220_fu_291_p1 = ochan_fu_284_p3;

endmodule //td_fused_top_tdf4_adjust
module td_fused_top_Block_entry_proc_proc515 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_220,
        ap_return
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] tmp_220;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] ap_return;

reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
reg   [15:0] ap_return_preg;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 16'd0;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 16'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_return_preg <= tmp_220;
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_return = tmp_220;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

endmodule //td_fused_top_Block_entry_proc_proc515
module td_fused_top_tdf4_accum_4_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_0,
        accum_in_0_ap_vld,
        p_read,
        accum_in_1_read,
        accum_in_2_read,
        accum_in_3_read
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_0;
output   accum_in_0_ap_vld;
input  [15:0] p_read;
input  [15:0] accum_in_1_read;
input  [15:0] accum_in_2_read;
input  [15:0] accum_in_3_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_0;
reg accum_in_0_ap_vld;

reg    ap_done_reg;
  reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] add_ln233_fu_92_p2;
reg   [2:0] add_ln233_reg_138;
wire    ap_CS_fsm_state2;
wire   [15:0] tmp_fu_108_p6;
reg   [15:0] tmp_reg_146;
wire   [0:0] icmp_ln233_fu_98_p2;
wire   [15:0] grp_fu_87_p2;
wire    ap_CS_fsm_state10;
reg   [2:0] i_1_1_reg_63;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_74;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state3;
wire   [1:0] tmp_fu_108_p5;
reg   [9:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U590(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_74),
    .din1(tmp_reg_146),
    .dout(grp_fu_87_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U591(
    .din0(p_read),
    .din1(accum_in_1_read),
    .din2(accum_in_2_read),
    .din3(accum_in_3_read),
    .din4(tmp_fu_108_p5),
    .dout(tmp_fu_108_p6)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_0_preg <= sum_01_reg_74;
        end
    end
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
        end else if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_63 <= 3'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        i_1_1_reg_63 <= add_ln233_reg_138;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_74 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        sum_01_reg_74 <= grp_fu_87_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln233_reg_138 <= add_ln233_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln233_fu_98_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_146 <= tmp_fu_108_p6;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0 = sum_01_reg_74;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln233_fu_92_p2 = (i_1_1_reg_63 + 3'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln233_fu_98_p2 = ((i_1_1_reg_63 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_fu_108_p5 = i_1_1_reg_63[1:0];

endmodule //td_fused_top_tdf4_accum_4_3
module td_fused_top_Block_entry_proc_proc514 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_219,
        ap_return
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] tmp_219;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] ap_return;

reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
reg   [15:0] ap_return_preg;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 16'd0;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 16'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_return_preg <= tmp_219;
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_return = tmp_219;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

endmodule //td_fused_top_Block_entry_proc_proc514
module td_fused_top_tdf4_accum_4_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_0,
        accum_in_0_ap_vld,
        p_read,
        accum_in_1_read,
        accum_in_2_read,
        accum_in_3_read
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_0;
output   accum_in_0_ap_vld;
input  [15:0] p_read;
input  [15:0] accum_in_1_read;
input  [15:0] accum_in_2_read;
input  [15:0] accum_in_3_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_0;
reg accum_in_0_ap_vld;

reg    ap_done_reg;
  reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] add_ln233_fu_92_p2;
reg   [2:0] add_ln233_reg_138;
wire    ap_CS_fsm_state2;
wire   [15:0] tmp_fu_108_p6;
reg   [15:0] tmp_reg_146;
wire   [0:0] icmp_ln233_fu_98_p2;
wire   [15:0] grp_fu_87_p2;
wire    ap_CS_fsm_state10;
reg   [2:0] i_1_1_reg_63;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_74;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state3;
wire   [1:0] tmp_fu_108_p5;
reg   [9:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U582(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_74),
    .din1(tmp_reg_146),
    .dout(grp_fu_87_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U583(
    .din0(p_read),
    .din1(accum_in_1_read),
    .din2(accum_in_2_read),
    .din3(accum_in_3_read),
    .din4(tmp_fu_108_p5),
    .dout(tmp_fu_108_p6)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_0_preg <= sum_01_reg_74;
        end
    end
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
        end else if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_63 <= 3'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        i_1_1_reg_63 <= add_ln233_reg_138;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_74 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        sum_01_reg_74 <= grp_fu_87_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln233_reg_138 <= add_ln233_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln233_fu_98_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_146 <= tmp_fu_108_p6;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0 = sum_01_reg_74;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln233_fu_92_p2 = (i_1_1_reg_63 + 3'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln233_fu_98_p2 = ((i_1_1_reg_63 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_fu_108_p5 = i_1_1_reg_63[1:0];

endmodule //td_fused_top_tdf4_accum_4_2
module td_fused_top_Block_entry_proc_proc513 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_218,
        ap_return
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] tmp_218;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] ap_return;

reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
reg   [15:0] ap_return_preg;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 16'd0;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 16'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_return_preg <= tmp_218;
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_return = tmp_218;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

endmodule //td_fused_top_Block_entry_proc_proc513
module td_fused_top_tdf4_accum_4_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_0,
        accum_in_0_ap_vld,
        p_read,
        accum_in_1_read,
        accum_in_2_read,
        accum_in_3_read
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_0;
output   accum_in_0_ap_vld;
input  [15:0] p_read;
input  [15:0] accum_in_1_read;
input  [15:0] accum_in_2_read;
input  [15:0] accum_in_3_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_0;
reg accum_in_0_ap_vld;

reg    ap_done_reg;
  reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] add_ln233_fu_92_p2;
reg   [2:0] add_ln233_reg_138;
wire    ap_CS_fsm_state2;
wire   [15:0] tmp_fu_108_p6;
reg   [15:0] tmp_reg_146;
wire   [0:0] icmp_ln233_fu_98_p2;
wire   [15:0] grp_fu_87_p2;
wire    ap_CS_fsm_state10;
reg   [2:0] i_1_1_reg_63;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_74;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state3;
wire   [1:0] tmp_fu_108_p5;
reg   [9:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U574(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_74),
    .din1(tmp_reg_146),
    .dout(grp_fu_87_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U575(
    .din0(p_read),
    .din1(accum_in_1_read),
    .din2(accum_in_2_read),
    .din3(accum_in_3_read),
    .din4(tmp_fu_108_p5),
    .dout(tmp_fu_108_p6)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_0_preg <= sum_01_reg_74;
        end
    end
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
        end else if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_63 <= 3'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        i_1_1_reg_63 <= add_ln233_reg_138;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_74 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        sum_01_reg_74 <= grp_fu_87_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln233_reg_138 <= add_ln233_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln233_fu_98_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_146 <= tmp_fu_108_p6;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0 = sum_01_reg_74;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln233_fu_92_p2 = (i_1_1_reg_63 + 3'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln233_fu_98_p2 = ((i_1_1_reg_63 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_fu_108_p5 = i_1_1_reg_63[1:0];

endmodule //td_fused_top_tdf4_accum_4_1
module td_fused_top_Block_entry_proc_proc512 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp,
        ap_return
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] tmp;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] ap_return;

reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1;
reg   [15:0] ap_return_preg;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_return_preg = 16'd0;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 16'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_return_preg <= tmp;
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_return = tmp;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

endmodule //td_fused_top_Block_entry_proc_proc512
module td_fused_top_tdf4_accum_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_0,
        accum_in_0_ap_vld,
        p_read,
        accum_in_1_read,
        accum_in_2_read,
        accum_in_3_read
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_0;
output   accum_in_0_ap_vld;
input  [15:0] p_read;
input  [15:0] accum_in_1_read;
input  [15:0] accum_in_2_read;
input  [15:0] accum_in_3_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_0;
reg accum_in_0_ap_vld;

reg    ap_done_reg;
  reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] add_ln233_fu_92_p2;
reg   [2:0] add_ln233_reg_138;
wire    ap_CS_fsm_state2;
wire   [15:0] tmp_fu_108_p6;
reg   [15:0] tmp_reg_146;
wire   [0:0] icmp_ln233_fu_98_p2;
wire   [15:0] grp_fu_87_p2;
wire    ap_CS_fsm_state10;
reg   [2:0] i_1_1_reg_63;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_74;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state3;
wire   [1:0] tmp_fu_108_p5;
reg   [9:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U566(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_74),
    .din1(tmp_reg_146),
    .dout(grp_fu_87_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U567(
    .din0(p_read),
    .din1(accum_in_1_read),
    .din2(accum_in_2_read),
    .din3(accum_in_3_read),
    .din4(tmp_fu_108_p5),
    .dout(tmp_fu_108_p6)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_0_preg <= sum_01_reg_74;
        end
    end
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
        end else if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_63 <= 3'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        i_1_1_reg_63 <= add_ln233_reg_138;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_74 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        sum_01_reg_74 <= grp_fu_87_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln233_reg_138 <= add_ln233_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln233_fu_98_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_reg_146 <= tmp_fu_108_p6;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0 = sum_01_reg_74;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln233_fu_98_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln233_fu_92_p2 = (i_1_1_reg_63 + 3'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln233_fu_98_p2 = ((i_1_1_reg_63 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_fu_108_p5 = i_1_1_reg_63[1:0];

endmodule //td_fused_top_tdf4_accum_4
module td_fused_top_tdf4_accum_3_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state13 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [2:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] write_flag3_0_reg_67;
reg   [0:0] write_flag6_0_reg_78;
reg   [0:0] write_flag9_0_reg_89;
reg   [0:0] write_flag_0_reg_100;
reg   [2:0] out_idx_reg_111;
reg   [15:0] accum_out_1_07_reg_122;
reg   [15:0] accum_out_0_06_reg_134;
reg   [15:0] accum_out_2_05_reg_146;
reg   [15:0] accum_out_3_04_reg_158;
wire   [2:0] add_ln220_fu_174_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_state11_pp0_stage0_iter9;
wire    ap_block_state12_pp0_stage0_iter10;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln206_fu_180_p2;
reg   [0:0] icmp_ln206_reg_380;
reg   [0:0] icmp_ln206_reg_380_pp0_iter1_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter2_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter3_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter4_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter5_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter6_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter7_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter8_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter9_reg;
wire   [1:0] trunc_ln207_fu_186_p1;
reg   [1:0] trunc_ln207_reg_384;
reg   [1:0] trunc_ln207_reg_384_pp0_iter1_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter2_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter3_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter4_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter5_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter6_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter7_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter8_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter9_reg;
wire   [0:0] write_flag_1_fu_212_p6;
wire   [0:0] write_flag9_1_fu_226_p6;
wire   [0:0] write_flag6_1_fu_240_p6;
wire   [0:0] write_flag3_1_fu_254_p6;
reg   [15:0] accum_in_load_reg_421;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_426;
wire   [15:0] grp_fu_170_p2;
reg   [15:0] sum0_reg_431;
wire   [15:0] accum_out_3_1_fu_298_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_306_p3;
wire   [15:0] accum_out_0_1_fu_328_p3;
wire   [15:0] accum_out_1_1_fu_343_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_condition_pp0_exit_iter9_state11;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln216_fu_196_p1;
wire   [63:0] zext_ln216_1_fu_207_p1;
wire   [2:0] i_12_fu_190_p2;
wire   [2:0] or_ln216_fu_201_p2;
wire   [0:0] icmp_ln219_fu_268_p2;
wire   [0:0] icmp_ln219_1_fu_280_p2;
wire   [15:0] select_ln219_fu_273_p3;
wire   [0:0] icmp_ln219_2_fu_293_p2;
wire   [15:0] select_ln219_1_fu_285_p3;
wire   [15:0] select_ln219_2_fu_313_p3;
wire   [15:0] select_ln219_3_fu_320_p3;
wire   [15:0] select_ln219_4_fu_336_p3;
wire    ap_CS_fsm_state13;
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
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U560(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_426),
    .din1(accum_in_load_reg_421),
    .dout(grp_fu_170_p2)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U561(
    .din0(1'd1),
    .din1(write_flag_0_reg_100),
    .din2(write_flag_0_reg_100),
    .din3(write_flag_0_reg_100),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag_1_fu_212_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U562(
    .din0(write_flag9_0_reg_89),
    .din1(write_flag9_0_reg_89),
    .din2(write_flag9_0_reg_89),
    .din3(1'd1),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag9_1_fu_226_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U563(
    .din0(write_flag6_0_reg_78),
    .din1(write_flag6_0_reg_78),
    .din2(1'd1),
    .din3(write_flag6_0_reg_78),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag6_1_fu_240_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U564(
    .din0(write_flag3_0_reg_67),
    .din1(1'd1),
    .din2(write_flag3_0_reg_67),
    .din3(write_flag3_0_reg_67),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag3_1_fu_254_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state13)) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11))) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter8;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter10 <= 1'b0;
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11) & (ap_enable_reg_pp0_iter8 == 1'b0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_111 <= add_ln220_fu_174_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_111 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_67 <= write_flag3_1_fu_254_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_67 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_78 <= write_flag6_1_fu_240_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_78 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_89 <= write_flag9_1_fu_226_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_89 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_100 <= write_flag_1_fu_212_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_100 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_1_reg_426 <= accum_in_q0;
        accum_in_load_reg_421 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_134 <= accum_out_0_1_fu_328_p3;
        accum_out_1_07_reg_122 <= accum_out_1_1_fu_343_p3;
        accum_out_2_05_reg_146 <= accum_out_2_1_fu_306_p3;
        accum_out_3_04_reg_158 <= accum_out_3_1_fu_298_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln206_reg_380 <= icmp_ln206_fu_180_p2;
        icmp_ln206_reg_380_pp0_iter1_reg <= icmp_ln206_reg_380;
        trunc_ln207_reg_384_pp0_iter1_reg <= trunc_ln207_reg_384;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln206_reg_380_pp0_iter2_reg <= icmp_ln206_reg_380_pp0_iter1_reg;
        icmp_ln206_reg_380_pp0_iter3_reg <= icmp_ln206_reg_380_pp0_iter2_reg;
        icmp_ln206_reg_380_pp0_iter4_reg <= icmp_ln206_reg_380_pp0_iter3_reg;
        icmp_ln206_reg_380_pp0_iter5_reg <= icmp_ln206_reg_380_pp0_iter4_reg;
        icmp_ln206_reg_380_pp0_iter6_reg <= icmp_ln206_reg_380_pp0_iter5_reg;
        icmp_ln206_reg_380_pp0_iter7_reg <= icmp_ln206_reg_380_pp0_iter6_reg;
        icmp_ln206_reg_380_pp0_iter8_reg <= icmp_ln206_reg_380_pp0_iter7_reg;
        icmp_ln206_reg_380_pp0_iter9_reg <= icmp_ln206_reg_380_pp0_iter8_reg;
        trunc_ln207_reg_384_pp0_iter2_reg <= trunc_ln207_reg_384_pp0_iter1_reg;
        trunc_ln207_reg_384_pp0_iter3_reg <= trunc_ln207_reg_384_pp0_iter2_reg;
        trunc_ln207_reg_384_pp0_iter4_reg <= trunc_ln207_reg_384_pp0_iter3_reg;
        trunc_ln207_reg_384_pp0_iter5_reg <= trunc_ln207_reg_384_pp0_iter4_reg;
        trunc_ln207_reg_384_pp0_iter6_reg <= trunc_ln207_reg_384_pp0_iter5_reg;
        trunc_ln207_reg_384_pp0_iter7_reg <= trunc_ln207_reg_384_pp0_iter6_reg;
        trunc_ln207_reg_384_pp0_iter8_reg <= trunc_ln207_reg_384_pp0_iter7_reg;
        trunc_ln207_reg_384_pp0_iter9_reg <= trunc_ln207_reg_384_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_431 <= grp_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln207_reg_384 <= trunc_ln207_fu_186_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
        ap_condition_pp0_exit_iter9_state11 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter9_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln206_fu_180_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln216_1_fu_207_p1;

assign accum_in_address1 = zext_ln216_fu_196_p1;

assign accum_out_0_1_fu_328_p3 = ((icmp_ln219_2_fu_293_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_3_fu_320_p3);

assign accum_out_1_1_fu_343_p3 = ((icmp_ln219_2_fu_293_p2[0:0] == 1'b1) ? accum_out_1_07_reg_122 : select_ln219_4_fu_336_p3);

assign accum_out_2_1_fu_306_p3 = ((icmp_ln219_2_fu_293_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_2_05_reg_146);

assign accum_out_3_1_fu_298_p3 = ((icmp_ln219_2_fu_293_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_1_fu_285_p3);

assign add_ln220_fu_174_p2 = (out_idx_reg_111 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return_0 = accum_out_0_06_reg_134;

assign ap_return_1 = accum_out_1_07_reg_122;

assign ap_return_2 = accum_out_2_05_reg_146;

assign ap_return_3 = accum_out_3_04_reg_158;

assign i_12_fu_190_p2 = out_idx_reg_111 << 3'd1;

assign icmp_ln206_fu_180_p2 = ((out_idx_reg_111 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln219_1_fu_280_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln219_2_fu_293_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln219_fu_268_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln216_fu_201_p2 = (i_12_fu_190_p2 | 3'd1);

assign select_ln219_1_fu_285_p3 = ((icmp_ln219_1_fu_280_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_fu_273_p3);

assign select_ln219_2_fu_313_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_0_06_reg_134);

assign select_ln219_3_fu_320_p3 = ((icmp_ln219_1_fu_280_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_2_fu_313_p3);

assign select_ln219_4_fu_336_p3 = ((icmp_ln219_1_fu_280_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_1_07_reg_122);

assign select_ln219_fu_273_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : sum0_reg_431);

assign trunc_ln207_fu_186_p1 = out_idx_reg_111[1:0];

assign zext_ln216_1_fu_207_p1 = or_ln216_fu_201_p2;

assign zext_ln216_fu_196_p1 = i_12_fu_190_p2;

endmodule //td_fused_top_tdf4_accum_3_3
module td_fused_top_tdf4_accum_3_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state13 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [2:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] write_flag3_0_reg_67;
reg   [0:0] write_flag6_0_reg_78;
reg   [0:0] write_flag9_0_reg_89;
reg   [0:0] write_flag_0_reg_100;
reg   [2:0] out_idx_reg_111;
reg   [15:0] accum_out_1_07_reg_122;
reg   [15:0] accum_out_0_06_reg_134;
reg   [15:0] accum_out_2_05_reg_146;
reg   [15:0] accum_out_3_04_reg_158;
wire   [2:0] add_ln220_fu_174_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_state11_pp0_stage0_iter9;
wire    ap_block_state12_pp0_stage0_iter10;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln206_fu_180_p2;
reg   [0:0] icmp_ln206_reg_380;
reg   [0:0] icmp_ln206_reg_380_pp0_iter1_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter2_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter3_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter4_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter5_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter6_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter7_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter8_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter9_reg;
wire   [1:0] trunc_ln207_fu_186_p1;
reg   [1:0] trunc_ln207_reg_384;
reg   [1:0] trunc_ln207_reg_384_pp0_iter1_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter2_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter3_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter4_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter5_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter6_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter7_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter8_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter9_reg;
wire   [0:0] write_flag_1_fu_212_p6;
wire   [0:0] write_flag9_1_fu_226_p6;
wire   [0:0] write_flag6_1_fu_240_p6;
wire   [0:0] write_flag3_1_fu_254_p6;
reg   [15:0] accum_in_load_reg_421;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_426;
wire   [15:0] grp_fu_170_p2;
reg   [15:0] sum0_reg_431;
wire   [15:0] accum_out_3_1_fu_298_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_306_p3;
wire   [15:0] accum_out_0_1_fu_328_p3;
wire   [15:0] accum_out_1_1_fu_343_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_condition_pp0_exit_iter9_state11;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln216_fu_196_p1;
wire   [63:0] zext_ln216_1_fu_207_p1;
wire   [2:0] i_12_fu_190_p2;
wire   [2:0] or_ln216_fu_201_p2;
wire   [0:0] icmp_ln219_fu_268_p2;
wire   [0:0] icmp_ln219_3_fu_280_p2;
wire   [15:0] select_ln219_fu_273_p3;
wire   [0:0] icmp_ln219_4_fu_293_p2;
wire   [15:0] select_ln219_5_fu_285_p3;
wire   [15:0] select_ln219_6_fu_313_p3;
wire   [15:0] select_ln219_7_fu_320_p3;
wire   [15:0] select_ln219_8_fu_336_p3;
wire    ap_CS_fsm_state13;
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
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U554(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_426),
    .din1(accum_in_load_reg_421),
    .dout(grp_fu_170_p2)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U555(
    .din0(1'd1),
    .din1(write_flag_0_reg_100),
    .din2(write_flag_0_reg_100),
    .din3(write_flag_0_reg_100),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag_1_fu_212_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U556(
    .din0(write_flag9_0_reg_89),
    .din1(write_flag9_0_reg_89),
    .din2(write_flag9_0_reg_89),
    .din3(1'd1),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag9_1_fu_226_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U557(
    .din0(write_flag6_0_reg_78),
    .din1(write_flag6_0_reg_78),
    .din2(1'd1),
    .din3(write_flag6_0_reg_78),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag6_1_fu_240_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U558(
    .din0(write_flag3_0_reg_67),
    .din1(1'd1),
    .din2(write_flag3_0_reg_67),
    .din3(write_flag3_0_reg_67),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag3_1_fu_254_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state13)) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11))) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter8;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter10 <= 1'b0;
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11) & (ap_enable_reg_pp0_iter8 == 1'b0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_111 <= add_ln220_fu_174_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_111 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_67 <= write_flag3_1_fu_254_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_67 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_78 <= write_flag6_1_fu_240_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_78 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_89 <= write_flag9_1_fu_226_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_89 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_100 <= write_flag_1_fu_212_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_100 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_1_reg_426 <= accum_in_q0;
        accum_in_load_reg_421 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_134 <= accum_out_0_1_fu_328_p3;
        accum_out_1_07_reg_122 <= accum_out_1_1_fu_343_p3;
        accum_out_2_05_reg_146 <= accum_out_2_1_fu_306_p3;
        accum_out_3_04_reg_158 <= accum_out_3_1_fu_298_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln206_reg_380 <= icmp_ln206_fu_180_p2;
        icmp_ln206_reg_380_pp0_iter1_reg <= icmp_ln206_reg_380;
        trunc_ln207_reg_384_pp0_iter1_reg <= trunc_ln207_reg_384;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln206_reg_380_pp0_iter2_reg <= icmp_ln206_reg_380_pp0_iter1_reg;
        icmp_ln206_reg_380_pp0_iter3_reg <= icmp_ln206_reg_380_pp0_iter2_reg;
        icmp_ln206_reg_380_pp0_iter4_reg <= icmp_ln206_reg_380_pp0_iter3_reg;
        icmp_ln206_reg_380_pp0_iter5_reg <= icmp_ln206_reg_380_pp0_iter4_reg;
        icmp_ln206_reg_380_pp0_iter6_reg <= icmp_ln206_reg_380_pp0_iter5_reg;
        icmp_ln206_reg_380_pp0_iter7_reg <= icmp_ln206_reg_380_pp0_iter6_reg;
        icmp_ln206_reg_380_pp0_iter8_reg <= icmp_ln206_reg_380_pp0_iter7_reg;
        icmp_ln206_reg_380_pp0_iter9_reg <= icmp_ln206_reg_380_pp0_iter8_reg;
        trunc_ln207_reg_384_pp0_iter2_reg <= trunc_ln207_reg_384_pp0_iter1_reg;
        trunc_ln207_reg_384_pp0_iter3_reg <= trunc_ln207_reg_384_pp0_iter2_reg;
        trunc_ln207_reg_384_pp0_iter4_reg <= trunc_ln207_reg_384_pp0_iter3_reg;
        trunc_ln207_reg_384_pp0_iter5_reg <= trunc_ln207_reg_384_pp0_iter4_reg;
        trunc_ln207_reg_384_pp0_iter6_reg <= trunc_ln207_reg_384_pp0_iter5_reg;
        trunc_ln207_reg_384_pp0_iter7_reg <= trunc_ln207_reg_384_pp0_iter6_reg;
        trunc_ln207_reg_384_pp0_iter8_reg <= trunc_ln207_reg_384_pp0_iter7_reg;
        trunc_ln207_reg_384_pp0_iter9_reg <= trunc_ln207_reg_384_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_431 <= grp_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln207_reg_384 <= trunc_ln207_fu_186_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
        ap_condition_pp0_exit_iter9_state11 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter9_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln206_fu_180_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln216_1_fu_207_p1;

assign accum_in_address1 = zext_ln216_fu_196_p1;

assign accum_out_0_1_fu_328_p3 = ((icmp_ln219_4_fu_293_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_7_fu_320_p3);

assign accum_out_1_1_fu_343_p3 = ((icmp_ln219_4_fu_293_p2[0:0] == 1'b1) ? accum_out_1_07_reg_122 : select_ln219_8_fu_336_p3);

assign accum_out_2_1_fu_306_p3 = ((icmp_ln219_4_fu_293_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_2_05_reg_146);

assign accum_out_3_1_fu_298_p3 = ((icmp_ln219_4_fu_293_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_5_fu_285_p3);

assign add_ln220_fu_174_p2 = (out_idx_reg_111 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return_0 = accum_out_0_06_reg_134;

assign ap_return_1 = accum_out_1_07_reg_122;

assign ap_return_2 = accum_out_2_05_reg_146;

assign ap_return_3 = accum_out_3_04_reg_158;

assign i_12_fu_190_p2 = out_idx_reg_111 << 3'd1;

assign icmp_ln206_fu_180_p2 = ((out_idx_reg_111 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln219_3_fu_280_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln219_4_fu_293_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln219_fu_268_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln216_fu_201_p2 = (i_12_fu_190_p2 | 3'd1);

assign select_ln219_5_fu_285_p3 = ((icmp_ln219_3_fu_280_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_fu_273_p3);

assign select_ln219_6_fu_313_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_0_06_reg_134);

assign select_ln219_7_fu_320_p3 = ((icmp_ln219_3_fu_280_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_6_fu_313_p3);

assign select_ln219_8_fu_336_p3 = ((icmp_ln219_3_fu_280_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_1_07_reg_122);

assign select_ln219_fu_273_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : sum0_reg_431);

assign trunc_ln207_fu_186_p1 = out_idx_reg_111[1:0];

assign zext_ln216_1_fu_207_p1 = or_ln216_fu_201_p2;

assign zext_ln216_fu_196_p1 = i_12_fu_190_p2;

endmodule //td_fused_top_tdf4_accum_3_2
module td_fused_top_tdf4_accum_3_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state13 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [2:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] write_flag3_0_reg_67;
reg   [0:0] write_flag6_0_reg_78;
reg   [0:0] write_flag9_0_reg_89;
reg   [0:0] write_flag_0_reg_100;
reg   [2:0] out_idx_reg_111;
reg   [15:0] accum_out_1_07_reg_122;
reg   [15:0] accum_out_0_06_reg_134;
reg   [15:0] accum_out_2_05_reg_146;
reg   [15:0] accum_out_3_04_reg_158;
wire   [2:0] add_ln220_fu_174_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_state11_pp0_stage0_iter9;
wire    ap_block_state12_pp0_stage0_iter10;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln206_fu_180_p2;
reg   [0:0] icmp_ln206_reg_380;
reg   [0:0] icmp_ln206_reg_380_pp0_iter1_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter2_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter3_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter4_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter5_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter6_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter7_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter8_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter9_reg;
wire   [1:0] trunc_ln207_fu_186_p1;
reg   [1:0] trunc_ln207_reg_384;
reg   [1:0] trunc_ln207_reg_384_pp0_iter1_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter2_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter3_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter4_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter5_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter6_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter7_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter8_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter9_reg;
wire   [0:0] write_flag_1_fu_212_p6;
wire   [0:0] write_flag9_1_fu_226_p6;
wire   [0:0] write_flag6_1_fu_240_p6;
wire   [0:0] write_flag3_1_fu_254_p6;
reg   [15:0] accum_in_load_reg_421;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_426;
wire   [15:0] grp_fu_170_p2;
reg   [15:0] sum0_reg_431;
wire   [15:0] accum_out_3_1_fu_298_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_306_p3;
wire   [15:0] accum_out_0_1_fu_328_p3;
wire   [15:0] accum_out_1_1_fu_343_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_condition_pp0_exit_iter9_state11;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln216_fu_196_p1;
wire   [63:0] zext_ln216_1_fu_207_p1;
wire   [2:0] i_12_fu_190_p2;
wire   [2:0] or_ln216_fu_201_p2;
wire   [0:0] icmp_ln219_fu_268_p2;
wire   [0:0] icmp_ln219_5_fu_280_p2;
wire   [15:0] select_ln219_fu_273_p3;
wire   [0:0] icmp_ln219_6_fu_293_p2;
wire   [15:0] select_ln219_9_fu_285_p3;
wire   [15:0] select_ln219_10_fu_313_p3;
wire   [15:0] select_ln219_11_fu_320_p3;
wire   [15:0] select_ln219_12_fu_336_p3;
wire    ap_CS_fsm_state13;
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
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U548(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_426),
    .din1(accum_in_load_reg_421),
    .dout(grp_fu_170_p2)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U549(
    .din0(1'd1),
    .din1(write_flag_0_reg_100),
    .din2(write_flag_0_reg_100),
    .din3(write_flag_0_reg_100),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag_1_fu_212_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U550(
    .din0(write_flag9_0_reg_89),
    .din1(write_flag9_0_reg_89),
    .din2(write_flag9_0_reg_89),
    .din3(1'd1),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag9_1_fu_226_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U551(
    .din0(write_flag6_0_reg_78),
    .din1(write_flag6_0_reg_78),
    .din2(1'd1),
    .din3(write_flag6_0_reg_78),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag6_1_fu_240_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U552(
    .din0(write_flag3_0_reg_67),
    .din1(1'd1),
    .din2(write_flag3_0_reg_67),
    .din3(write_flag3_0_reg_67),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag3_1_fu_254_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state13)) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11))) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter8;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter10 <= 1'b0;
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11) & (ap_enable_reg_pp0_iter8 == 1'b0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_111 <= add_ln220_fu_174_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_111 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_67 <= write_flag3_1_fu_254_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_67 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_78 <= write_flag6_1_fu_240_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_78 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_89 <= write_flag9_1_fu_226_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_89 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_100 <= write_flag_1_fu_212_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_100 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_1_reg_426 <= accum_in_q0;
        accum_in_load_reg_421 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_134 <= accum_out_0_1_fu_328_p3;
        accum_out_1_07_reg_122 <= accum_out_1_1_fu_343_p3;
        accum_out_2_05_reg_146 <= accum_out_2_1_fu_306_p3;
        accum_out_3_04_reg_158 <= accum_out_3_1_fu_298_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln206_reg_380 <= icmp_ln206_fu_180_p2;
        icmp_ln206_reg_380_pp0_iter1_reg <= icmp_ln206_reg_380;
        trunc_ln207_reg_384_pp0_iter1_reg <= trunc_ln207_reg_384;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln206_reg_380_pp0_iter2_reg <= icmp_ln206_reg_380_pp0_iter1_reg;
        icmp_ln206_reg_380_pp0_iter3_reg <= icmp_ln206_reg_380_pp0_iter2_reg;
        icmp_ln206_reg_380_pp0_iter4_reg <= icmp_ln206_reg_380_pp0_iter3_reg;
        icmp_ln206_reg_380_pp0_iter5_reg <= icmp_ln206_reg_380_pp0_iter4_reg;
        icmp_ln206_reg_380_pp0_iter6_reg <= icmp_ln206_reg_380_pp0_iter5_reg;
        icmp_ln206_reg_380_pp0_iter7_reg <= icmp_ln206_reg_380_pp0_iter6_reg;
        icmp_ln206_reg_380_pp0_iter8_reg <= icmp_ln206_reg_380_pp0_iter7_reg;
        icmp_ln206_reg_380_pp0_iter9_reg <= icmp_ln206_reg_380_pp0_iter8_reg;
        trunc_ln207_reg_384_pp0_iter2_reg <= trunc_ln207_reg_384_pp0_iter1_reg;
        trunc_ln207_reg_384_pp0_iter3_reg <= trunc_ln207_reg_384_pp0_iter2_reg;
        trunc_ln207_reg_384_pp0_iter4_reg <= trunc_ln207_reg_384_pp0_iter3_reg;
        trunc_ln207_reg_384_pp0_iter5_reg <= trunc_ln207_reg_384_pp0_iter4_reg;
        trunc_ln207_reg_384_pp0_iter6_reg <= trunc_ln207_reg_384_pp0_iter5_reg;
        trunc_ln207_reg_384_pp0_iter7_reg <= trunc_ln207_reg_384_pp0_iter6_reg;
        trunc_ln207_reg_384_pp0_iter8_reg <= trunc_ln207_reg_384_pp0_iter7_reg;
        trunc_ln207_reg_384_pp0_iter9_reg <= trunc_ln207_reg_384_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_431 <= grp_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln207_reg_384 <= trunc_ln207_fu_186_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
        ap_condition_pp0_exit_iter9_state11 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter9_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln206_fu_180_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln216_1_fu_207_p1;

assign accum_in_address1 = zext_ln216_fu_196_p1;

assign accum_out_0_1_fu_328_p3 = ((icmp_ln219_6_fu_293_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_11_fu_320_p3);

assign accum_out_1_1_fu_343_p3 = ((icmp_ln219_6_fu_293_p2[0:0] == 1'b1) ? accum_out_1_07_reg_122 : select_ln219_12_fu_336_p3);

assign accum_out_2_1_fu_306_p3 = ((icmp_ln219_6_fu_293_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_2_05_reg_146);

assign accum_out_3_1_fu_298_p3 = ((icmp_ln219_6_fu_293_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_9_fu_285_p3);

assign add_ln220_fu_174_p2 = (out_idx_reg_111 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return_0 = accum_out_0_06_reg_134;

assign ap_return_1 = accum_out_1_07_reg_122;

assign ap_return_2 = accum_out_2_05_reg_146;

assign ap_return_3 = accum_out_3_04_reg_158;

assign i_12_fu_190_p2 = out_idx_reg_111 << 3'd1;

assign icmp_ln206_fu_180_p2 = ((out_idx_reg_111 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln219_5_fu_280_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln219_6_fu_293_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln219_fu_268_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln216_fu_201_p2 = (i_12_fu_190_p2 | 3'd1);

assign select_ln219_10_fu_313_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_0_06_reg_134);

assign select_ln219_11_fu_320_p3 = ((icmp_ln219_5_fu_280_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_10_fu_313_p3);

assign select_ln219_12_fu_336_p3 = ((icmp_ln219_5_fu_280_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_1_07_reg_122);

assign select_ln219_9_fu_285_p3 = ((icmp_ln219_5_fu_280_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_fu_273_p3);

assign select_ln219_fu_273_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : sum0_reg_431);

assign trunc_ln207_fu_186_p1 = out_idx_reg_111[1:0];

assign zext_ln216_1_fu_207_p1 = or_ln216_fu_201_p2;

assign zext_ln216_fu_196_p1 = i_12_fu_190_p2;

endmodule //td_fused_top_tdf4_accum_3_1
module td_fused_top_tdf4_accum_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state13 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [2:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] write_flag3_0_reg_67;
reg   [0:0] write_flag6_0_reg_78;
reg   [0:0] write_flag9_0_reg_89;
reg   [0:0] write_flag_0_reg_100;
reg   [2:0] out_idx_reg_111;
reg   [15:0] accum_out_1_07_reg_122;
reg   [15:0] accum_out_0_06_reg_134;
reg   [15:0] accum_out_2_05_reg_146;
reg   [15:0] accum_out_3_04_reg_158;
wire   [2:0] add_ln220_fu_174_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_state11_pp0_stage0_iter9;
wire    ap_block_state12_pp0_stage0_iter10;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln206_fu_180_p2;
reg   [0:0] icmp_ln206_reg_380;
reg   [0:0] icmp_ln206_reg_380_pp0_iter1_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter2_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter3_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter4_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter5_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter6_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter7_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter8_reg;
reg   [0:0] icmp_ln206_reg_380_pp0_iter9_reg;
wire   [1:0] trunc_ln207_fu_186_p1;
reg   [1:0] trunc_ln207_reg_384;
reg   [1:0] trunc_ln207_reg_384_pp0_iter1_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter2_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter3_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter4_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter5_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter6_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter7_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter8_reg;
reg   [1:0] trunc_ln207_reg_384_pp0_iter9_reg;
wire   [0:0] write_flag_1_fu_212_p6;
wire   [0:0] write_flag9_1_fu_226_p6;
wire   [0:0] write_flag6_1_fu_240_p6;
wire   [0:0] write_flag3_1_fu_254_p6;
reg   [15:0] accum_in_load_reg_421;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_426;
wire   [15:0] grp_fu_170_p2;
reg   [15:0] sum0_reg_431;
wire   [15:0] accum_out_3_1_fu_298_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_306_p3;
wire   [15:0] accum_out_0_1_fu_328_p3;
wire   [15:0] accum_out_1_1_fu_343_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_condition_pp0_exit_iter9_state11;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln216_fu_196_p1;
wire   [63:0] zext_ln216_1_fu_207_p1;
wire   [2:0] i_12_fu_190_p2;
wire   [2:0] or_ln216_fu_201_p2;
wire   [0:0] icmp_ln219_fu_268_p2;
wire   [0:0] icmp_ln219_7_fu_280_p2;
wire   [15:0] select_ln219_fu_273_p3;
wire   [0:0] icmp_ln219_8_fu_293_p2;
wire   [15:0] select_ln219_13_fu_285_p3;
wire   [15:0] select_ln219_14_fu_313_p3;
wire   [15:0] select_ln219_15_fu_320_p3;
wire   [15:0] select_ln219_16_fu_336_p3;
wire    ap_CS_fsm_state13;
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
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U542(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_426),
    .din1(accum_in_load_reg_421),
    .dout(grp_fu_170_p2)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U543(
    .din0(1'd1),
    .din1(write_flag_0_reg_100),
    .din2(write_flag_0_reg_100),
    .din3(write_flag_0_reg_100),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag_1_fu_212_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U544(
    .din0(write_flag9_0_reg_89),
    .din1(write_flag9_0_reg_89),
    .din2(write_flag9_0_reg_89),
    .din3(1'd1),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag9_1_fu_226_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U545(
    .din0(write_flag6_0_reg_78),
    .din1(write_flag6_0_reg_78),
    .din2(1'd1),
    .din3(write_flag6_0_reg_78),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag6_1_fu_240_p6)
);

td_fused_top_mux_42_1_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 1 ),
    .din1_WIDTH( 1 ),
    .din2_WIDTH( 1 ),
    .din3_WIDTH( 1 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 1 ))
mux_42_1_1_1_U546(
    .din0(write_flag3_0_reg_67),
    .din1(1'd1),
    .din2(write_flag3_0_reg_67),
    .din3(write_flag3_0_reg_67),
    .din4(trunc_ln207_fu_186_p1),
    .dout(write_flag3_1_fu_254_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state13)) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11))) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter8;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter10 <= 1'b0;
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter9_state11) & (ap_enable_reg_pp0_iter8 == 1'b0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_111 <= add_ln220_fu_174_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_111 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_67 <= write_flag3_1_fu_254_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_67 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_78 <= write_flag6_1_fu_240_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_78 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_89 <= write_flag9_1_fu_226_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_89 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_100 <= write_flag_1_fu_212_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_100 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_1_reg_426 <= accum_in_q0;
        accum_in_load_reg_421 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_134 <= accum_out_0_1_fu_328_p3;
        accum_out_1_07_reg_122 <= accum_out_1_1_fu_343_p3;
        accum_out_2_05_reg_146 <= accum_out_2_1_fu_306_p3;
        accum_out_3_04_reg_158 <= accum_out_3_1_fu_298_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln206_reg_380 <= icmp_ln206_fu_180_p2;
        icmp_ln206_reg_380_pp0_iter1_reg <= icmp_ln206_reg_380;
        trunc_ln207_reg_384_pp0_iter1_reg <= trunc_ln207_reg_384;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln206_reg_380_pp0_iter2_reg <= icmp_ln206_reg_380_pp0_iter1_reg;
        icmp_ln206_reg_380_pp0_iter3_reg <= icmp_ln206_reg_380_pp0_iter2_reg;
        icmp_ln206_reg_380_pp0_iter4_reg <= icmp_ln206_reg_380_pp0_iter3_reg;
        icmp_ln206_reg_380_pp0_iter5_reg <= icmp_ln206_reg_380_pp0_iter4_reg;
        icmp_ln206_reg_380_pp0_iter6_reg <= icmp_ln206_reg_380_pp0_iter5_reg;
        icmp_ln206_reg_380_pp0_iter7_reg <= icmp_ln206_reg_380_pp0_iter6_reg;
        icmp_ln206_reg_380_pp0_iter8_reg <= icmp_ln206_reg_380_pp0_iter7_reg;
        icmp_ln206_reg_380_pp0_iter9_reg <= icmp_ln206_reg_380_pp0_iter8_reg;
        trunc_ln207_reg_384_pp0_iter2_reg <= trunc_ln207_reg_384_pp0_iter1_reg;
        trunc_ln207_reg_384_pp0_iter3_reg <= trunc_ln207_reg_384_pp0_iter2_reg;
        trunc_ln207_reg_384_pp0_iter4_reg <= trunc_ln207_reg_384_pp0_iter3_reg;
        trunc_ln207_reg_384_pp0_iter5_reg <= trunc_ln207_reg_384_pp0_iter4_reg;
        trunc_ln207_reg_384_pp0_iter6_reg <= trunc_ln207_reg_384_pp0_iter5_reg;
        trunc_ln207_reg_384_pp0_iter7_reg <= trunc_ln207_reg_384_pp0_iter6_reg;
        trunc_ln207_reg_384_pp0_iter8_reg <= trunc_ln207_reg_384_pp0_iter7_reg;
        trunc_ln207_reg_384_pp0_iter9_reg <= trunc_ln207_reg_384_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_reg_380_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_431 <= grp_fu_170_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln206_fu_180_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln207_reg_384 <= trunc_ln207_fu_186_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
        ap_condition_pp0_exit_iter9_state11 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter9_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln206_fu_180_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter9 == 1'b1) & (ap_enable_reg_pp0_iter8 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln216_1_fu_207_p1;

assign accum_in_address1 = zext_ln216_fu_196_p1;

assign accum_out_0_1_fu_328_p3 = ((icmp_ln219_8_fu_293_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_15_fu_320_p3);

assign accum_out_1_1_fu_343_p3 = ((icmp_ln219_8_fu_293_p2[0:0] == 1'b1) ? accum_out_1_07_reg_122 : select_ln219_16_fu_336_p3);

assign accum_out_2_1_fu_306_p3 = ((icmp_ln219_8_fu_293_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_2_05_reg_146);

assign accum_out_3_1_fu_298_p3 = ((icmp_ln219_8_fu_293_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_13_fu_285_p3);

assign add_ln220_fu_174_p2 = (out_idx_reg_111 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_return_0 = accum_out_0_06_reg_134;

assign ap_return_1 = accum_out_1_07_reg_122;

assign ap_return_2 = accum_out_2_05_reg_146;

assign ap_return_3 = accum_out_3_04_reg_158;

assign i_12_fu_190_p2 = out_idx_reg_111 << 3'd1;

assign icmp_ln206_fu_180_p2 = ((out_idx_reg_111 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln219_7_fu_280_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln219_8_fu_293_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln219_fu_268_p2 = ((trunc_ln207_reg_384_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln216_fu_201_p2 = (i_12_fu_190_p2 | 3'd1);

assign select_ln219_13_fu_285_p3 = ((icmp_ln219_7_fu_280_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : select_ln219_fu_273_p3);

assign select_ln219_14_fu_313_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_0_06_reg_134);

assign select_ln219_15_fu_320_p3 = ((icmp_ln219_7_fu_280_p2[0:0] == 1'b1) ? accum_out_0_06_reg_134 : select_ln219_14_fu_313_p3);

assign select_ln219_16_fu_336_p3 = ((icmp_ln219_7_fu_280_p2[0:0] == 1'b1) ? sum0_reg_431 : accum_out_1_07_reg_122);

assign select_ln219_fu_273_p3 = ((icmp_ln219_fu_268_p2[0:0] == 1'b1) ? accum_out_3_04_reg_158 : sum0_reg_431);

assign trunc_ln207_fu_186_p1 = out_idx_reg_111[1:0];

assign zext_ln216_1_fu_207_p1 = or_ln216_fu_201_p2;

assign zext_ln216_fu_196_p1 = i_12_fu_190_p2;

endmodule //td_fused_top_tdf4_accum_3
module td_fused_top_tdf4_accum_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        accum_out_address0,
        accum_out_ce0,
        accum_out_we0,
        accum_out_d0,
        accum_out_address1,
        accum_out_ce1,
        accum_out_we1,
        accum_out_d1
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_pp0_stage0 = 11'd2;
parameter    ap_ST_fsm_pp0_stage1 = 11'd4;
parameter    ap_ST_fsm_pp0_stage2 = 11'd8;
parameter    ap_ST_fsm_pp0_stage3 = 11'd16;
parameter    ap_ST_fsm_pp0_stage4 = 11'd32;
parameter    ap_ST_fsm_pp0_stage5 = 11'd64;
parameter    ap_ST_fsm_pp0_stage6 = 11'd128;
parameter    ap_ST_fsm_state15 = 11'd256;
parameter    ap_ST_fsm_state16 = 11'd512;
parameter    ap_ST_fsm_state17 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [4:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [4:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [2:0] accum_out_address0;
output   accum_out_ce0;
output   accum_out_we0;
output  [15:0] accum_out_d0;
output  [2:0] accum_out_address1;
output   accum_out_ce1;
output   accum_out_we1;
output  [15:0] accum_out_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[4:0] accum_in_address0;
reg accum_in_ce0;
reg[4:0] accum_in_address1;
reg accum_in_ce1;
reg accum_out_ce0;
reg accum_out_we0;
reg accum_out_ce1;
reg accum_out_we1;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [5:0] x_reg_168;
reg   [15:0] psum_7_0134_reg_180;
reg   [15:0] psum_6_0133_reg_192;
reg   [15:0] psum_5_0132_reg_204;
reg   [15:0] psum_4_0131_reg_216;
reg   [15:0] psum_3_0130_reg_228;
reg   [15:0] psum_2_0129_reg_240;
reg   [15:0] psum_1_0128_reg_252;
reg   [15:0] psum_0_0127_reg_264;
wire   [0:0] tmp_fu_321_p3;
reg   [0:0] tmp_reg_492;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state9_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_reg_492_pp0_iter1_reg;
wire   [4:0] trunc_ln171_fu_334_p1;
reg   [4:0] trunc_ln171_reg_496;
reg   [15:0] accum_in_load_reg_516;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state10_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in_load_22_reg_521;
reg   [15:0] accum_in_load_23_reg_536;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state11_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in_load_24_reg_541;
reg   [15:0] accum_in_load_25_reg_556;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state12_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
reg   [15:0] accum_in_load_26_reg_561;
reg   [15:0] accum_in_load_27_reg_576;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state6_pp0_stage4_iter0;
wire    ap_block_state13_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_11001;
reg   [15:0] accum_in_load_28_reg_581;
wire   [5:0] add_ln171_fu_409_p2;
reg   [5:0] add_ln171_reg_586;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state8_pp0_stage6_iter0;
wire    ap_block_pp0_stage6_11001;
wire   [15:0] grp_fu_305_p2;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_310_p2;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state7_pp0_stage5_iter0;
wire    ap_block_state14_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_11001;
wire   [3:0] add_ln179_fu_432_p2;
wire    ap_CS_fsm_state16;
wire   [0:0] tmp_59_fu_415_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage2_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_pp0_stage5_subdone;
reg   [5:0] ap_phi_mux_x_phi_fu_172_p4;
wire    ap_block_pp0_stage0;
wire   [15:0] ap_phi_mux_psum_7_0134_phi_fu_184_p4;
wire    ap_block_pp0_stage5;
wire   [15:0] ap_phi_mux_psum_6_0133_phi_fu_196_p4;
wire   [15:0] ap_phi_mux_psum_5_0132_phi_fu_208_p4;
wire    ap_block_pp0_stage4;
wire   [15:0] ap_phi_mux_psum_4_0131_phi_fu_220_p4;
wire   [15:0] ap_phi_mux_psum_3_0130_phi_fu_232_p4;
wire    ap_block_pp0_stage3;
wire   [15:0] ap_phi_mux_psum_2_0129_phi_fu_244_p4;
wire    ap_block_pp0_stage2;
reg   [3:0] q_reg_276;
wire    ap_CS_fsm_state15;
reg   [15:0] ap_phi_mux_phi_ln191_phi_fu_290_p8;
wire   [2:0] trunc_ln179_fu_428_p1;
wire   [63:0] zext_ln171_fu_329_p1;
wire   [63:0] zext_ln175_fu_344_p1;
wire   [63:0] zext_ln175_7_fu_354_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln175_8_fu_364_p1;
wire   [63:0] zext_ln175_9_fu_374_p1;
wire   [63:0] zext_ln175_10_fu_384_p1;
wire   [63:0] zext_ln175_11_fu_394_p1;
wire   [63:0] zext_ln175_12_fu_404_p1;
wire   [63:0] zext_ln179_fu_423_p1;
wire   [63:0] zext_ln179_2_fu_444_p1;
reg   [15:0] grp_fu_305_p0;
reg   [15:0] grp_fu_305_p1;
reg   [15:0] grp_fu_310_p0;
reg   [15:0] grp_fu_310_p1;
wire   [4:0] or_ln175_fu_338_p2;
wire   [4:0] or_ln175_7_fu_349_p2;
wire   [4:0] or_ln175_8_fu_359_p2;
wire   [4:0] or_ln175_9_fu_369_p2;
wire   [4:0] or_ln175_10_fu_379_p2;
wire   [4:0] or_ln175_11_fu_389_p2;
wire   [4:0] or_ln175_12_fu_399_p2;
wire    ap_block_pp0_stage6;
wire   [2:0] or_ln179_fu_438_p2;
wire   [0:0] icmp_ln191_fu_449_p2;
wire   [0:0] icmp_ln191_3_fu_463_p2;
wire   [15:0] select_ln191_fu_455_p3;
wire   [0:0] icmp_ln191_4_fu_477_p2;
wire   [15:0] select_ln191_3_fu_469_p3;
wire    ap_CS_fsm_state17;
reg   [10:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_pp0_stage4_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_570;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U538(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_305_p0),
    .din1(grp_fu_305_p1),
    .dout(grp_fu_305_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U539(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_310_p0),
    .din1(grp_fu_310_p1),
    .dout(grp_fu_310_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state17)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage2_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp0_stage5_subdone) & (1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b0)) | ((1'b0 == ap_block_pp0_stage6_subdone) & (1'b1 == ap_CS_fsm_pp0_stage6)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        q_reg_276 <= 4'd0;
    end else if (((tmp_59_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        q_reg_276 <= add_ln179_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        x_reg_168 <= add_ln171_reg_586;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_168 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (tmp_reg_492 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        accum_in_load_22_reg_521 <= accum_in_q0;
        accum_in_load_reg_516 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage2_11001) & (tmp_reg_492 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        accum_in_load_23_reg_536 <= accum_in_q1;
        accum_in_load_24_reg_541 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage3_11001) & (tmp_reg_492 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        accum_in_load_25_reg_556 <= accum_in_q1;
        accum_in_load_26_reg_561 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage4_11001) & (tmp_reg_492 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        accum_in_load_27_reg_576 <= accum_in_q1;
        accum_in_load_28_reg_581 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage6_11001) & (tmp_reg_492 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln171_reg_586 <= add_ln171_fu_409_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_492_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        psum_0_0127_reg_264 <= grp_fu_305_p2;
        psum_1_0128_reg_252 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_492_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        psum_2_0129_reg_240 <= grp_fu_305_p2;
        psum_3_0130_reg_228 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_492_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage4_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
        psum_4_0131_reg_216 <= grp_fu_305_p2;
        psum_5_0132_reg_204 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_492_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage5_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
        psum_6_0133_reg_192 <= grp_fu_305_p2;
        psum_7_0134_reg_180 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_492 <= ap_phi_mux_x_phi_fu_172_p4[32'd5];
        tmp_reg_492_pp0_iter1_reg <= tmp_reg_492;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_fu_321_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln171_reg_496 <= trunc_ln171_fu_334_p1;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            accum_in_address0 = zext_ln175_12_fu_404_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_address0 = zext_ln175_10_fu_384_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_address0 = zext_ln175_8_fu_364_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_address0 = zext_ln175_fu_344_p1;
        end else begin
            accum_in_address0 = 'bx;
        end
    end else begin
        accum_in_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            accum_in_address1 = zext_ln175_11_fu_394_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_address1 = zext_ln175_9_fu_374_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_address1 = zext_ln175_7_fu_354_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_address1 = zext_ln171_fu_329_p1;
        end else begin
            accum_in_address1 = 'bx;
        end
    end else begin
        accum_in_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_out_ce1 = 1'b1;
    end else begin
        accum_out_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_59_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_59_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        accum_out_we1 = 1'b1;
    end else begin
        accum_out_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_reg_492 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_59_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
        if ((trunc_ln179_fu_428_p1 == 3'd0)) begin
            ap_phi_mux_phi_ln191_phi_fu_290_p8 = psum_0_0127_reg_264;
        end else if ((1'b1 == ap_condition_570)) begin
            ap_phi_mux_phi_ln191_phi_fu_290_p8 = psum_6_0133_reg_192;
        end else if ((trunc_ln179_fu_428_p1 == 3'd4)) begin
            ap_phi_mux_phi_ln191_phi_fu_290_p8 = psum_4_0131_reg_216;
        end else if ((trunc_ln179_fu_428_p1 == 3'd2)) begin
            ap_phi_mux_phi_ln191_phi_fu_290_p8 = psum_2_0129_reg_240;
        end else begin
            ap_phi_mux_phi_ln191_phi_fu_290_p8 = 'bx;
        end
    end else begin
        ap_phi_mux_phi_ln191_phi_fu_290_p8 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (tmp_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_x_phi_fu_172_p4 = add_ln171_reg_586;
    end else begin
        ap_phi_mux_x_phi_fu_172_p4 = x_reg_168;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage5) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            grp_fu_305_p0 = ap_phi_mux_psum_6_0133_phi_fu_196_p4;
        end else if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_305_p0 = ap_phi_mux_psum_4_0131_phi_fu_220_p4;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_305_p0 = ap_phi_mux_psum_2_0129_phi_fu_244_p4;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_305_p0 = grp_fu_305_p2;
        end else begin
            grp_fu_305_p0 = 'bx;
        end
    end else begin
        grp_fu_305_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage5) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            grp_fu_305_p1 = accum_in_load_27_reg_576;
        end else if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_305_p1 = accum_in_load_25_reg_556;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_305_p1 = accum_in_load_23_reg_536;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_305_p1 = accum_in_load_reg_516;
        end else begin
            grp_fu_305_p1 = 'bx;
        end
    end else begin
        grp_fu_305_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage5) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            grp_fu_310_p0 = ap_phi_mux_psum_7_0134_phi_fu_184_p4;
        end else if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_310_p0 = ap_phi_mux_psum_5_0132_phi_fu_208_p4;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_310_p0 = ap_phi_mux_psum_3_0130_phi_fu_232_p4;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_310_p0 = grp_fu_310_p2;
        end else begin
            grp_fu_310_p0 = 'bx;
        end
    end else begin
        grp_fu_310_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage5) & (1'b1 == ap_CS_fsm_pp0_stage5))) begin
            grp_fu_310_p1 = accum_in_load_28_reg_581;
        end else if (((1'b0 == ap_block_pp0_stage4) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
            grp_fu_310_p1 = accum_in_load_26_reg_561;
        end else if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            grp_fu_310_p1 = accum_in_load_24_reg_541;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            grp_fu_310_p1 = accum_in_load_22_reg_521;
        end else begin
            grp_fu_310_p1 = 'bx;
        end
    end else begin
        grp_fu_310_p1 = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((~((1'b0 == ap_block_pp0_stage2_subdone) & (tmp_reg_492 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else if (((1'b0 == ap_block_pp0_stage2_subdone) & (tmp_reg_492 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((~((1'b0 == ap_block_pp0_stage5_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b0)) & (1'b0 == ap_block_pp0_stage5_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else if (((1'b0 == ap_block_pp0_stage5_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            if (((tmp_59_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state16))) begin
                ap_NS_fsm = ap_ST_fsm_state16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state17;
            end
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_out_address0 = zext_ln179_2_fu_444_p1;

assign accum_out_address1 = zext_ln179_fu_423_p1;

assign accum_out_d0 = ((icmp_ln191_4_fu_477_p2[0:0] == 1'b1) ? psum_5_0132_reg_204 : select_ln191_3_fu_469_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln191_phi_fu_290_p8;

assign add_ln171_fu_409_p2 = (x_reg_168 + 6'd8);

assign add_ln179_fu_432_p2 = (q_reg_276 + 4'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd10];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state10_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage5_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_570 = (~(trunc_ln179_fu_428_p1 == 3'd0) & ~(trunc_ln179_fu_428_p1 == 3'd4) & ~(trunc_ln179_fu_428_p1 == 3'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_psum_2_0129_phi_fu_244_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_3_0130_phi_fu_232_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_4_0131_phi_fu_220_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_5_0132_phi_fu_208_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_6_0133_phi_fu_196_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_7_0134_phi_fu_184_p4 = grp_fu_310_p2;

assign icmp_ln191_3_fu_463_p2 = ((or_ln179_fu_438_p2 == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln191_4_fu_477_p2 = ((or_ln179_fu_438_p2 == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln191_fu_449_p2 = ((or_ln179_fu_438_p2 == 3'd1) ? 1'b1 : 1'b0);

assign or_ln175_10_fu_379_p2 = (trunc_ln171_reg_496 | 5'd5);

assign or_ln175_11_fu_389_p2 = (trunc_ln171_reg_496 | 5'd6);

assign or_ln175_12_fu_399_p2 = (trunc_ln171_reg_496 | 5'd7);

assign or_ln175_7_fu_349_p2 = (trunc_ln171_reg_496 | 5'd2);

assign or_ln175_8_fu_359_p2 = (trunc_ln171_reg_496 | 5'd3);

assign or_ln175_9_fu_369_p2 = (trunc_ln171_reg_496 | 5'd4);

assign or_ln175_fu_338_p2 = (trunc_ln171_fu_334_p1 | 5'd1);

assign or_ln179_fu_438_p2 = (trunc_ln179_fu_428_p1 | 3'd1);

assign select_ln191_3_fu_469_p3 = ((icmp_ln191_3_fu_463_p2[0:0] == 1'b1) ? psum_3_0130_reg_228 : select_ln191_fu_455_p3);

assign select_ln191_fu_455_p3 = ((icmp_ln191_fu_449_p2[0:0] == 1'b1) ? psum_1_0128_reg_252 : psum_7_0134_reg_180);

assign tmp_59_fu_415_p3 = q_reg_276[32'd3];

assign tmp_fu_321_p3 = ap_phi_mux_x_phi_fu_172_p4[32'd5];

assign trunc_ln171_fu_334_p1 = ap_phi_mux_x_phi_fu_172_p4[4:0];

assign trunc_ln179_fu_428_p1 = q_reg_276[2:0];

assign zext_ln171_fu_329_p1 = ap_phi_mux_x_phi_fu_172_p4;

assign zext_ln175_10_fu_384_p1 = or_ln175_10_fu_379_p2;

assign zext_ln175_11_fu_394_p1 = or_ln175_11_fu_389_p2;

assign zext_ln175_12_fu_404_p1 = or_ln175_12_fu_399_p2;

assign zext_ln175_7_fu_354_p1 = or_ln175_7_fu_349_p2;

assign zext_ln175_8_fu_364_p1 = or_ln175_8_fu_359_p2;

assign zext_ln175_9_fu_374_p1 = or_ln175_9_fu_369_p2;

assign zext_ln175_fu_344_p1 = or_ln175_fu_338_p2;

assign zext_ln179_2_fu_444_p1 = or_ln179_fu_438_p2;

assign zext_ln179_fu_423_p1 = q_reg_276;

endmodule //td_fused_top_tdf4_accum_2
module td_fused_top_tdf4_accum_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0,
        accum_in_address1,
        accum_in_ce1,
        accum_in_q1,
        accum_in1_address0,
        accum_in1_ce0,
        accum_in1_q0,
        accum_in1_address1,
        accum_in1_ce1,
        accum_in1_q1,
        accum_in2_address0,
        accum_in2_ce0,
        accum_in2_q0,
        accum_in2_address1,
        accum_in2_ce1,
        accum_in2_q1,
        accum_in3_address0,
        accum_in3_ce0,
        accum_in3_q0,
        accum_in3_address1,
        accum_in3_ce1,
        accum_in3_q1,
        accum_out_address0,
        accum_out_ce0,
        accum_out_we0,
        accum_out_d0,
        accum_out_address1,
        accum_out_ce1,
        accum_out_we1,
        accum_out_d1
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_pp0_stage0 = 11'd2;
parameter    ap_ST_fsm_pp0_stage1 = 11'd4;
parameter    ap_ST_fsm_pp0_stage2 = 11'd8;
parameter    ap_ST_fsm_pp0_stage3 = 11'd16;
parameter    ap_ST_fsm_pp0_stage4 = 11'd32;
parameter    ap_ST_fsm_pp0_stage5 = 11'd64;
parameter    ap_ST_fsm_pp0_stage6 = 11'd128;
parameter    ap_ST_fsm_state18 = 11'd256;
parameter    ap_ST_fsm_pp1_stage0 = 11'd512;
parameter    ap_ST_fsm_state21 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [5:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [5:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [5:0] accum_in1_address0;
output   accum_in1_ce0;
input  [15:0] accum_in1_q0;
output  [5:0] accum_in1_address1;
output   accum_in1_ce1;
input  [15:0] accum_in1_q1;
output  [5:0] accum_in2_address0;
output   accum_in2_ce0;
input  [15:0] accum_in2_q0;
output  [5:0] accum_in2_address1;
output   accum_in2_ce1;
input  [15:0] accum_in2_q1;
output  [5:0] accum_in3_address0;
output   accum_in3_ce0;
input  [15:0] accum_in3_q0;
output  [5:0] accum_in3_address1;
output   accum_in3_ce1;
input  [15:0] accum_in3_q1;
output  [4:0] accum_out_address0;
output   accum_out_ce0;
output   accum_out_we0;
output  [15:0] accum_out_d0;
output  [4:0] accum_out_address1;
output   accum_out_ce1;
output   accum_out_we1;
output  [15:0] accum_out_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[5:0] accum_in_address0;
reg accum_in_ce0;
reg[5:0] accum_in_address1;
reg accum_in_ce1;
reg[5:0] accum_in1_address0;
reg accum_in1_ce0;
reg[5:0] accum_in1_address1;
reg accum_in1_ce1;
reg[5:0] accum_in2_address0;
reg accum_in2_ce0;
reg[5:0] accum_in2_address1;
reg accum_in2_ce1;
reg[5:0] accum_in3_address0;
reg accum_in3_ce0;
reg[5:0] accum_in3_address1;
reg accum_in3_ce1;
reg accum_out_ce0;
reg accum_out_we0;
reg accum_out_ce1;
reg accum_out_we1;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] x_reg_471;
reg   [15:0] psum_4_05_reg_483;
reg   [15:0] psum_3_04_reg_495;
reg   [15:0] psum_2_03_reg_507;
reg   [15:0] psum_1_02_reg_519;
reg   [15:0] psum_0_01_reg_531;
reg   [15:0] psum_9_010_reg_543;
reg   [15:0] psum_8_09_reg_555;
reg   [15:0] psum_7_08_reg_567;
reg   [15:0] psum_6_07_reg_579;
reg   [15:0] psum_5_06_reg_591;
reg   [15:0] psum_31_032_reg_603;
reg   [15:0] psum_30_031_reg_615;
reg   [15:0] psum_29_030_reg_627;
reg   [15:0] psum_28_029_reg_639;
reg   [15:0] psum_27_028_reg_651;
reg   [15:0] psum_26_027_reg_663;
reg   [15:0] psum_25_026_reg_675;
reg   [15:0] psum_24_025_reg_687;
reg   [15:0] psum_23_024_reg_699;
reg   [15:0] psum_22_023_reg_711;
reg   [15:0] psum_21_022_reg_723;
reg   [15:0] psum_20_021_reg_735;
reg   [15:0] psum_19_020_reg_747;
reg   [15:0] psum_18_019_reg_759;
reg   [15:0] psum_17_018_reg_771;
reg   [15:0] psum_16_017_reg_783;
reg   [15:0] psum_15_016_reg_795;
reg   [15:0] psum_14_015_reg_807;
reg   [15:0] psum_13_014_reg_819;
reg   [15:0] psum_12_013_reg_831;
reg   [15:0] psum_11_012_reg_843;
reg   [15:0] psum_10_011_reg_855;
reg   [5:0] q_reg_867;
wire   [0:0] icmp_ln132_fu_984_p2;
reg   [0:0] icmp_ln132_reg_1838;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state9_pp0_stage0_iter1;
wire    ap_block_state16_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln132_reg_1838_pp0_iter1_reg;
reg   [0:0] icmp_ln132_reg_1838_pp0_iter2_reg;
wire   [5:0] lshr_ln_fu_990_p4;
reg   [5:0] lshr_ln_reg_1842;
reg   [15:0] accum_in_load_reg_1888;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state10_pp0_stage1_iter1;
wire    ap_block_state17_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in1_load_reg_1893;
reg   [15:0] accum_in2_load_reg_1898;
reg   [15:0] accum_in3_load_reg_1903;
reg   [15:0] accum_in_load_29_reg_1908;
reg   [15:0] accum_in1_load_15_reg_1913;
reg   [15:0] accum_in2_load_8_reg_1918;
reg   [15:0] accum_in3_load_8_reg_1923;
reg   [15:0] accum_in_load_30_reg_1968;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state11_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in1_load_16_reg_1973;
reg   [15:0] accum_in2_load_9_reg_1978;
reg   [15:0] accum_in3_load_9_reg_1983;
reg   [15:0] accum_in_load_31_reg_1988;
reg   [15:0] accum_in1_load_17_reg_1993;
reg   [15:0] accum_in2_load_10_reg_1998;
reg   [15:0] accum_in3_load_10_reg_2003;
wire   [0:0] icmp_ln136_fu_1054_p2;
reg   [0:0] icmp_ln136_reg_2008;
wire   [0:0] icmp_ln136_1_fu_1081_p2;
reg   [0:0] icmp_ln136_1_reg_2018;
wire   [0:0] icmp_ln136_2_fu_1108_p2;
reg   [0:0] icmp_ln136_2_reg_2028;
wire   [0:0] icmp_ln136_3_fu_1135_p2;
reg   [0:0] icmp_ln136_3_reg_2038;
wire   [0:0] icmp_ln136_4_fu_1162_p2;
reg   [0:0] icmp_ln136_4_reg_2048;
wire   [0:0] icmp_ln136_5_fu_1189_p2;
reg   [0:0] icmp_ln136_5_reg_2058;
wire   [0:0] icmp_ln136_6_fu_1216_p2;
reg   [0:0] icmp_ln136_6_reg_2068;
wire   [0:0] icmp_ln136_7_fu_1243_p2;
reg   [0:0] icmp_ln136_7_reg_2078;
wire   [15:0] select_ln136_fu_1264_p3;
reg   [15:0] select_ln136_reg_2088;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state12_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
wire   [15:0] select_ln136_1_fu_1271_p3;
reg   [15:0] select_ln136_1_reg_2093;
wire   [15:0] select_ln136_2_fu_1278_p3;
reg   [15:0] select_ln136_2_reg_2098;
wire   [15:0] select_ln136_3_fu_1285_p3;
reg   [15:0] select_ln136_3_reg_2103;
wire   [15:0] select_ln136_4_fu_1292_p3;
reg   [15:0] select_ln136_4_reg_2108;
wire   [15:0] select_ln136_5_fu_1299_p3;
reg   [15:0] select_ln136_5_reg_2113;
wire   [15:0] select_ln136_6_fu_1306_p3;
reg   [15:0] select_ln136_6_reg_2118;
wire   [15:0] select_ln136_7_fu_1313_p3;
reg   [15:0] select_ln136_7_reg_2123;
wire   [0:0] icmp_ln136_8_fu_1326_p2;
reg   [0:0] icmp_ln136_8_reg_2128;
wire   [0:0] icmp_ln136_9_fu_1353_p2;
reg   [0:0] icmp_ln136_9_reg_2138;
wire   [0:0] icmp_ln136_10_fu_1380_p2;
reg   [0:0] icmp_ln136_10_reg_2148;
wire   [0:0] icmp_ln136_11_fu_1407_p2;
reg   [0:0] icmp_ln136_11_reg_2158;
wire   [0:0] icmp_ln136_12_fu_1434_p2;
reg   [0:0] icmp_ln136_12_reg_2168;
wire   [0:0] icmp_ln136_13_fu_1461_p2;
reg   [0:0] icmp_ln136_13_reg_2178;
wire   [0:0] icmp_ln136_14_fu_1488_p2;
reg   [0:0] icmp_ln136_14_reg_2188;
wire   [0:0] icmp_ln136_15_fu_1515_p2;
reg   [0:0] icmp_ln136_15_reg_2198;
wire   [15:0] select_ln136_8_fu_1536_p3;
reg   [15:0] select_ln136_8_reg_2208;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state6_pp0_stage4_iter0;
wire    ap_block_state13_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_11001;
wire   [15:0] select_ln136_9_fu_1543_p3;
reg   [15:0] select_ln136_9_reg_2213;
wire   [15:0] select_ln136_10_fu_1550_p3;
reg   [15:0] select_ln136_10_reg_2218;
wire   [15:0] select_ln136_11_fu_1557_p3;
reg   [15:0] select_ln136_11_reg_2223;
wire   [15:0] select_ln136_12_fu_1564_p3;
reg   [15:0] select_ln136_12_reg_2228;
wire   [15:0] select_ln136_13_fu_1571_p3;
reg   [15:0] select_ln136_13_reg_2233;
wire   [15:0] select_ln136_14_fu_1578_p3;
reg   [15:0] select_ln136_14_reg_2238;
wire   [15:0] select_ln136_15_fu_1585_p3;
reg   [15:0] select_ln136_15_reg_2243;
wire   [7:0] add_ln132_fu_1592_p2;
reg   [7:0] add_ln132_reg_2248;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state8_pp0_stage6_iter0;
wire    ap_block_state15_pp0_stage6_iter1;
wire    ap_block_pp0_stage6_11001;
wire   [15:0] grp_fu_932_p2;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_937_p2;
wire   [15:0] grp_fu_942_p2;
wire   [15:0] grp_fu_947_p2;
wire   [15:0] grp_fu_952_p2;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state7_pp0_stage5_iter0;
wire    ap_block_state14_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_11001;
reg    ap_enable_reg_pp0_iter2;
wire   [0:0] tmp_fu_1598_p3;
reg   [0:0] tmp_reg_2413;
wire    ap_CS_fsm_pp1_stage0;
wire    ap_block_state19_pp1_stage0_iter0;
wire    ap_block_state20_pp1_stage0_iter1;
wire    ap_block_pp1_stage0_11001;
wire   [4:0] trunc_ln140_fu_1611_p1;
wire   [5:0] add_ln140_fu_1615_p2;
reg    ap_enable_reg_pp1_iter0;
wire   [4:0] or_ln140_fu_1621_p2;
reg   [4:0] or_ln140_reg_2426;
wire   [15:0] select_ln152_25_fu_1787_p3;
reg   [15:0] select_ln152_25_reg_2434;
reg    ap_block_state1;
wire    ap_block_pp0_stage4_subdone;
reg    ap_condition_pp0_exit_iter0_state6;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_pp0_stage1_subdone;
wire    ap_CS_fsm_state18;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state19;
reg    ap_enable_reg_pp1_iter1;
reg   [7:0] ap_phi_mux_x_phi_fu_475_p4;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage2;
wire   [15:0] ap_phi_mux_psum_9_010_phi_fu_547_p4;
wire    ap_block_pp0_stage3;
wire   [15:0] ap_phi_mux_psum_8_09_phi_fu_559_p4;
wire   [15:0] ap_phi_mux_psum_7_08_phi_fu_571_p4;
wire   [15:0] ap_phi_mux_psum_6_07_phi_fu_583_p4;
wire   [15:0] ap_phi_mux_psum_5_06_phi_fu_595_p4;
wire   [15:0] ap_phi_mux_psum_31_032_phi_fu_607_p4;
wire    ap_block_pp0_stage1;
wire   [15:0] ap_phi_mux_psum_30_031_phi_fu_619_p4;
wire   [15:0] ap_phi_mux_psum_29_030_phi_fu_631_p4;
wire   [15:0] ap_phi_mux_psum_28_029_phi_fu_643_p4;
wire   [15:0] ap_phi_mux_psum_27_028_phi_fu_655_p4;
wire   [15:0] ap_phi_mux_psum_26_027_phi_fu_667_p4;
wire   [15:0] ap_phi_mux_psum_25_026_phi_fu_679_p4;
wire   [15:0] ap_phi_mux_psum_24_025_phi_fu_691_p4;
wire    ap_block_pp0_stage6;
wire   [15:0] ap_phi_mux_psum_23_024_phi_fu_703_p4;
wire   [15:0] ap_phi_mux_psum_22_023_phi_fu_715_p4;
wire   [15:0] ap_phi_mux_psum_21_022_phi_fu_727_p4;
wire   [15:0] ap_phi_mux_psum_20_021_phi_fu_739_p4;
wire   [15:0] ap_phi_mux_psum_19_020_phi_fu_751_p4;
wire    ap_block_pp0_stage5;
wire   [15:0] ap_phi_mux_psum_18_019_phi_fu_763_p4;
wire   [15:0] ap_phi_mux_psum_17_018_phi_fu_775_p4;
wire   [15:0] ap_phi_mux_psum_16_017_phi_fu_787_p4;
wire   [15:0] ap_phi_mux_psum_15_016_phi_fu_799_p4;
wire   [15:0] ap_phi_mux_psum_14_015_phi_fu_811_p4;
wire    ap_block_pp0_stage4;
wire   [15:0] ap_phi_mux_psum_13_014_phi_fu_823_p4;
wire   [15:0] ap_phi_mux_psum_12_013_phi_fu_835_p4;
wire   [15:0] ap_phi_mux_psum_11_012_phi_fu_847_p4;
wire   [15:0] ap_phi_mux_psum_10_011_phi_fu_859_p4;
reg   [15:0] ap_phi_mux_phi_ln152_phi_fu_881_p32;
wire   [15:0] ap_phi_reg_pp1_iter0_phi_ln152_reg_878;
wire   [63:0] zext_ln136_fu_1000_p1;
wire   [63:0] zext_ln136_8_fu_1014_p1;
wire   [63:0] zext_ln136_9_fu_1027_p1;
wire   [63:0] zext_ln136_10_fu_1040_p1;
wire   [63:0] zext_ln136_11_fu_1070_p1;
wire   [63:0] zext_ln136_12_fu_1097_p1;
wire   [63:0] zext_ln136_13_fu_1124_p1;
wire   [63:0] zext_ln136_14_fu_1151_p1;
wire   [63:0] zext_ln136_15_fu_1178_p1;
wire   [63:0] zext_ln136_16_fu_1205_p1;
wire   [63:0] zext_ln136_17_fu_1232_p1;
wire   [63:0] zext_ln136_18_fu_1259_p1;
wire   [63:0] zext_ln136_19_fu_1342_p1;
wire   [63:0] zext_ln136_20_fu_1369_p1;
wire   [63:0] zext_ln136_21_fu_1396_p1;
wire   [63:0] zext_ln136_22_fu_1423_p1;
wire   [63:0] zext_ln136_23_fu_1450_p1;
wire   [63:0] zext_ln136_24_fu_1477_p1;
wire   [63:0] zext_ln136_25_fu_1504_p1;
wire   [63:0] zext_ln136_26_fu_1531_p1;
wire   [63:0] zext_ln140_fu_1606_p1;
wire    ap_block_pp1_stage0;
wire   [63:0] zext_ln140_2_fu_1795_p1;
reg   [15:0] grp_fu_932_p0;
reg   [15:0] grp_fu_932_p1;
reg   [15:0] grp_fu_937_p0;
reg   [15:0] grp_fu_937_p1;
reg   [15:0] grp_fu_942_p0;
reg   [15:0] grp_fu_942_p1;
reg   [15:0] grp_fu_947_p0;
reg   [15:0] grp_fu_947_p1;
reg   [15:0] grp_fu_952_p0;
reg   [15:0] grp_fu_952_p1;
wire   [5:0] or_ln136_fu_1008_p2;
wire   [5:0] or_ln136_7_fu_1022_p2;
wire   [5:0] or_ln136_8_fu_1035_p2;
wire   [7:0] or_ln136_9_fu_1048_p2;
wire   [5:0] lshr_ln136_1_fu_1060_p4;
wire   [7:0] or_ln136_10_fu_1075_p2;
wire   [5:0] lshr_ln136_2_fu_1087_p4;
wire   [7:0] or_ln136_11_fu_1102_p2;
wire   [5:0] lshr_ln136_3_fu_1114_p4;
wire   [7:0] or_ln136_12_fu_1129_p2;
wire   [5:0] lshr_ln136_4_fu_1141_p4;
wire   [7:0] or_ln136_13_fu_1156_p2;
wire   [5:0] lshr_ln136_5_fu_1168_p4;
wire   [7:0] or_ln136_14_fu_1183_p2;
wire   [5:0] lshr_ln136_6_fu_1195_p4;
wire   [7:0] or_ln136_15_fu_1210_p2;
wire   [5:0] lshr_ln136_7_fu_1222_p4;
wire   [7:0] or_ln136_16_fu_1237_p2;
wire   [5:0] lshr_ln136_8_fu_1249_p4;
wire   [7:0] or_ln136_17_fu_1320_p2;
wire   [5:0] lshr_ln136_9_fu_1332_p4;
wire   [7:0] or_ln136_18_fu_1347_p2;
wire   [5:0] lshr_ln136_s_fu_1359_p4;
wire   [7:0] or_ln136_19_fu_1374_p2;
wire   [5:0] lshr_ln136_10_fu_1386_p4;
wire   [7:0] or_ln136_20_fu_1401_p2;
wire   [5:0] lshr_ln136_11_fu_1413_p4;
wire   [7:0] or_ln136_21_fu_1428_p2;
wire   [5:0] lshr_ln136_12_fu_1440_p4;
wire   [7:0] or_ln136_22_fu_1455_p2;
wire   [5:0] lshr_ln136_13_fu_1467_p4;
wire   [7:0] or_ln136_23_fu_1482_p2;
wire   [5:0] lshr_ln136_14_fu_1494_p4;
wire   [7:0] or_ln136_24_fu_1509_p2;
wire   [5:0] lshr_ln136_15_fu_1521_p4;
wire   [0:0] icmp_ln152_fu_1627_p2;
wire   [0:0] icmp_ln152_15_fu_1641_p2;
wire   [15:0] select_ln152_fu_1633_p3;
wire   [0:0] icmp_ln152_16_fu_1655_p2;
wire   [15:0] select_ln152_15_fu_1647_p3;
wire   [0:0] icmp_ln152_17_fu_1669_p2;
wire   [15:0] select_ln152_16_fu_1661_p3;
wire   [0:0] icmp_ln152_18_fu_1683_p2;
wire   [15:0] select_ln152_17_fu_1675_p3;
wire   [0:0] icmp_ln152_19_fu_1697_p2;
wire   [15:0] select_ln152_18_fu_1689_p3;
wire   [0:0] icmp_ln152_20_fu_1711_p2;
wire   [15:0] select_ln152_19_fu_1703_p3;
wire   [0:0] icmp_ln152_21_fu_1725_p2;
wire   [15:0] select_ln152_20_fu_1717_p3;
wire   [0:0] icmp_ln152_22_fu_1739_p2;
wire   [15:0] select_ln152_21_fu_1731_p3;
wire   [0:0] icmp_ln152_23_fu_1753_p2;
wire   [15:0] select_ln152_22_fu_1745_p3;
wire   [0:0] icmp_ln152_24_fu_1767_p2;
wire   [15:0] select_ln152_23_fu_1759_p3;
wire   [0:0] icmp_ln152_25_fu_1781_p2;
wire   [15:0] select_ln152_24_fu_1773_p3;
wire   [0:0] icmp_ln152_26_fu_1799_p2;
wire   [0:0] icmp_ln152_27_fu_1811_p2;
wire   [15:0] select_ln152_26_fu_1804_p3;
wire   [0:0] icmp_ln152_28_fu_1824_p2;
wire   [15:0] select_ln152_27_fu_1816_p3;
wire    ap_CS_fsm_state21;
reg   [10:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_pp0_stage5_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
reg    ap_condition_1463;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U528(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_932_p0),
    .din1(grp_fu_932_p1),
    .dout(grp_fu_932_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U529(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_937_p0),
    .din1(grp_fu_937_p1),
    .dout(grp_fu_937_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U530(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_942_p0),
    .din1(grp_fu_942_p1),
    .dout(grp_fu_942_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U531(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_947_p0),
    .din1(grp_fu_947_p1),
    .dout(grp_fu_947_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U532(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_952_p0),
    .din1(grp_fu_952_p1),
    .dout(grp_fu_952_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state21)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state6) & (1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone)) | ((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6_subdone)))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state19) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state18)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state19) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state19);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if ((1'b1 == ap_CS_fsm_state18)) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        q_reg_867 <= 6'd0;
    end else if (((ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_fu_1598_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        q_reg_867 <= add_ln140_fu_1615_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        x_reg_471 <= add_ln132_reg_2248;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_471 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        accum_in1_load_15_reg_1913 <= accum_in1_q0;
        accum_in1_load_reg_1893 <= accum_in1_q1;
        accum_in2_load_8_reg_1918 <= accum_in2_q0;
        accum_in2_load_reg_1898 <= accum_in2_q1;
        accum_in3_load_8_reg_1923 <= accum_in3_q0;
        accum_in3_load_reg_1903 <= accum_in3_q1;
        accum_in_load_29_reg_1908 <= accum_in_q0;
        accum_in_load_reg_1888 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        accum_in1_load_16_reg_1973 <= accum_in1_q1;
        accum_in1_load_17_reg_1993 <= accum_in1_q0;
        accum_in2_load_10_reg_1998 <= accum_in2_q0;
        accum_in2_load_9_reg_1978 <= accum_in2_q1;
        accum_in3_load_10_reg_2003 <= accum_in3_q0;
        accum_in3_load_9_reg_1983 <= accum_in3_q1;
        accum_in_load_30_reg_1968 <= accum_in_q1;
        accum_in_load_31_reg_1988 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        add_ln132_reg_2248 <= add_ln132_fu_1592_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln132_reg_1838 <= icmp_ln132_fu_984_p2;
        icmp_ln132_reg_1838_pp0_iter1_reg <= icmp_ln132_reg_1838;
        icmp_ln132_reg_1838_pp0_iter2_reg <= icmp_ln132_reg_1838_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        icmp_ln136_10_reg_2148 <= icmp_ln136_10_fu_1380_p2;
        icmp_ln136_11_reg_2158 <= icmp_ln136_11_fu_1407_p2;
        icmp_ln136_12_reg_2168 <= icmp_ln136_12_fu_1434_p2;
        icmp_ln136_13_reg_2178 <= icmp_ln136_13_fu_1461_p2;
        icmp_ln136_14_reg_2188 <= icmp_ln136_14_fu_1488_p2;
        icmp_ln136_15_reg_2198 <= icmp_ln136_15_fu_1515_p2;
        icmp_ln136_8_reg_2128 <= icmp_ln136_8_fu_1326_p2;
        icmp_ln136_9_reg_2138 <= icmp_ln136_9_fu_1353_p2;
        select_ln136_1_reg_2093 <= select_ln136_1_fu_1271_p3;
        select_ln136_2_reg_2098 <= select_ln136_2_fu_1278_p3;
        select_ln136_3_reg_2103 <= select_ln136_3_fu_1285_p3;
        select_ln136_4_reg_2108 <= select_ln136_4_fu_1292_p3;
        select_ln136_5_reg_2113 <= select_ln136_5_fu_1299_p3;
        select_ln136_6_reg_2118 <= select_ln136_6_fu_1306_p3;
        select_ln136_7_reg_2123 <= select_ln136_7_fu_1313_p3;
        select_ln136_reg_2088 <= select_ln136_fu_1264_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        icmp_ln136_1_reg_2018 <= icmp_ln136_1_fu_1081_p2;
        icmp_ln136_2_reg_2028 <= icmp_ln136_2_fu_1108_p2;
        icmp_ln136_3_reg_2038 <= icmp_ln136_3_fu_1135_p2;
        icmp_ln136_4_reg_2048 <= icmp_ln136_4_fu_1162_p2;
        icmp_ln136_5_reg_2058 <= icmp_ln136_5_fu_1189_p2;
        icmp_ln136_6_reg_2068 <= icmp_ln136_6_fu_1216_p2;
        icmp_ln136_7_reg_2078 <= icmp_ln136_7_fu_1243_p2;
        icmp_ln136_reg_2008 <= icmp_ln136_fu_1054_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln132_fu_984_p2 == 1'd1))) begin
        lshr_ln_reg_1842 <= {{ap_phi_mux_x_phi_fu_475_p4[7:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_1598_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        or_ln140_reg_2426[4 : 1] <= or_ln140_fu_1621_p2[4 : 1];
        select_ln152_25_reg_2434 <= select_ln152_25_fu_1787_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        psum_0_01_reg_531 <= grp_fu_932_p2;
        psum_1_02_reg_519 <= grp_fu_937_p2;
        psum_2_03_reg_507 <= grp_fu_942_p2;
        psum_3_04_reg_495 <= grp_fu_947_p2;
        psum_4_05_reg_483 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        psum_10_011_reg_855 <= grp_fu_932_p2;
        psum_11_012_reg_843 <= grp_fu_937_p2;
        psum_12_013_reg_831 <= grp_fu_942_p2;
        psum_13_014_reg_819 <= grp_fu_947_p2;
        psum_14_015_reg_807 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage5_11001))) begin
        psum_15_016_reg_795 <= grp_fu_932_p2;
        psum_16_017_reg_783 <= grp_fu_937_p2;
        psum_17_018_reg_771 <= grp_fu_942_p2;
        psum_18_019_reg_759 <= grp_fu_947_p2;
        psum_19_020_reg_747 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage6_11001))) begin
        psum_20_021_reg_735 <= grp_fu_932_p2;
        psum_21_022_reg_723 <= grp_fu_937_p2;
        psum_22_023_reg_711 <= grp_fu_942_p2;
        psum_23_024_reg_699 <= grp_fu_947_p2;
        psum_24_025_reg_687 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        psum_25_026_reg_675 <= grp_fu_932_p2;
        psum_26_027_reg_663 <= grp_fu_937_p2;
        psum_27_028_reg_651 <= grp_fu_942_p2;
        psum_28_029_reg_639 <= grp_fu_947_p2;
        psum_29_030_reg_627 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln132_reg_1838_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        psum_30_031_reg_615 <= grp_fu_932_p2;
        psum_31_032_reg_603 <= grp_fu_937_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (icmp_ln132_reg_1838_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        psum_5_06_reg_591 <= grp_fu_932_p2;
        psum_6_07_reg_579 <= grp_fu_937_p2;
        psum_7_08_reg_567 <= grp_fu_942_p2;
        psum_8_09_reg_555 <= grp_fu_947_p2;
        psum_9_010_reg_543 <= grp_fu_952_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4_11001) & (icmp_ln132_reg_1838 == 1'd1))) begin
        select_ln136_10_reg_2218 <= select_ln136_10_fu_1550_p3;
        select_ln136_11_reg_2223 <= select_ln136_11_fu_1557_p3;
        select_ln136_12_reg_2228 <= select_ln136_12_fu_1564_p3;
        select_ln136_13_reg_2233 <= select_ln136_13_fu_1571_p3;
        select_ln136_14_reg_2238 <= select_ln136_14_fu_1578_p3;
        select_ln136_15_reg_2243 <= select_ln136_15_fu_1585_p3;
        select_ln136_8_reg_2208 <= select_ln136_8_fu_1536_p3;
        select_ln136_9_reg_2213 <= select_ln136_9_fu_1543_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        tmp_reg_2413 <= q_reg_867[32'd5];
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in1_address0 = zext_ln136_24_fu_1477_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address0 = zext_ln136_16_fu_1205_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address0 = zext_ln136_10_fu_1040_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address0 = zext_ln136_8_fu_1014_p1;
        end else begin
            accum_in1_address0 = 'bx;
        end
    end else begin
        accum_in1_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in1_address1 = zext_ln136_20_fu_1369_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address1 = zext_ln136_12_fu_1097_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address1 = zext_ln136_9_fu_1027_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address1 = zext_ln136_fu_1000_p1;
        end else begin
            accum_in1_address1 = 'bx;
        end
    end else begin
        accum_in1_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in1_ce0 = 1'b1;
    end else begin
        accum_in1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in1_ce1 = 1'b1;
    end else begin
        accum_in1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in2_address0 = zext_ln136_25_fu_1504_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in2_address0 = zext_ln136_17_fu_1232_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in2_address0 = zext_ln136_10_fu_1040_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in2_address0 = zext_ln136_8_fu_1014_p1;
        end else begin
            accum_in2_address0 = 'bx;
        end
    end else begin
        accum_in2_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in2_address1 = zext_ln136_21_fu_1396_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in2_address1 = zext_ln136_13_fu_1124_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in2_address1 = zext_ln136_9_fu_1027_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in2_address1 = zext_ln136_fu_1000_p1;
        end else begin
            accum_in2_address1 = 'bx;
        end
    end else begin
        accum_in2_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in2_ce0 = 1'b1;
    end else begin
        accum_in2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in2_ce1 = 1'b1;
    end else begin
        accum_in2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in3_address0 = zext_ln136_26_fu_1531_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in3_address0 = zext_ln136_18_fu_1259_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in3_address0 = zext_ln136_10_fu_1040_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in3_address0 = zext_ln136_8_fu_1014_p1;
        end else begin
            accum_in3_address0 = 'bx;
        end
    end else begin
        accum_in3_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in3_address1 = zext_ln136_22_fu_1423_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in3_address1 = zext_ln136_14_fu_1151_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in3_address1 = zext_ln136_9_fu_1027_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in3_address1 = zext_ln136_fu_1000_p1;
        end else begin
            accum_in3_address1 = 'bx;
        end
    end else begin
        accum_in3_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in3_ce0 = 1'b1;
    end else begin
        accum_in3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in3_ce1 = 1'b1;
    end else begin
        accum_in3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in_address0 = zext_ln136_23_fu_1450_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address0 = zext_ln136_15_fu_1178_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address0 = zext_ln136_10_fu_1040_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address0 = zext_ln136_8_fu_1014_p1;
        end else begin
            accum_in_address0 = 'bx;
        end
    end else begin
        accum_in_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in_address1 = zext_ln136_19_fu_1342_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address1 = zext_ln136_11_fu_1070_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address1 = zext_ln136_9_fu_1027_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address1 = zext_ln136_fu_1000_p1;
        end else begin
            accum_in_address1 = 'bx;
        end
    end else begin
        accum_in_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        accum_out_ce1 = 1'b1;
    end else begin
        accum_out_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b1) & (tmp_reg_2413 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_fu_1598_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        accum_out_we1 = 1'b1;
    end else begin
        accum_out_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln132_reg_1838 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state6 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state6 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_fu_1598_p3 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state19 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state19 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
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
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_fu_1598_p3 == 1'd0)) begin
        if ((trunc_ln140_fu_1611_p1 == 5'd0)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_0_01_reg_531;
        end else if ((1'b1 == ap_condition_1463)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_30_031_reg_615;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd28)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_28_029_reg_639;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd26)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_26_027_reg_663;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd24)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_24_025_reg_687;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd22)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_22_023_reg_711;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd20)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_20_021_reg_735;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd18)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_18_019_reg_759;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd16)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_16_017_reg_783;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd14)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_14_015_reg_807;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd12)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_12_013_reg_831;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd10)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_10_011_reg_855;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd8)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_8_09_reg_555;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd6)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_6_07_reg_579;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd4)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_4_05_reg_483;
        end else if ((trunc_ln140_fu_1611_p1 == 5'd2)) begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = psum_2_03_reg_507;
        end else begin
            ap_phi_mux_phi_ln152_phi_fu_881_p32 = ap_phi_reg_pp1_iter0_phi_ln152_reg_878;
        end
    end else begin
        ap_phi_mux_phi_ln152_phi_fu_881_p32 = ap_phi_reg_pp1_iter0_phi_ln152_reg_878;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (icmp_ln132_reg_1838 == 1'd1))) begin
        ap_phi_mux_x_phi_fu_475_p4 = add_ln132_reg_2248;
    end else begin
        ap_phi_mux_x_phi_fu_475_p4 = x_reg_471;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state21)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_30_031_phi_fu_619_p4;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_25_026_phi_fu_679_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_20_021_phi_fu_739_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_15_016_phi_fu_799_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_10_011_phi_fu_859_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_932_p0 = ap_phi_mux_psum_5_06_phi_fu_595_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_932_p0 = grp_fu_932_p2;
    end else begin
        grp_fu_932_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_932_p1 = select_ln136_14_reg_2238;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_932_p1 = select_ln136_9_reg_2213;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_932_p1 = select_ln136_4_reg_2108;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_932_p1 = accum_in3_load_10_reg_2003;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_932_p1 = accum_in2_load_9_reg_1978;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_932_p1 = accum_in1_load_15_reg_1913;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_932_p1 = accum_in_load_reg_1888;
    end else begin
        grp_fu_932_p1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_31_032_phi_fu_607_p4;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_26_027_phi_fu_667_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_21_022_phi_fu_727_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_16_017_phi_fu_787_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_11_012_phi_fu_847_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_937_p0 = ap_phi_mux_psum_6_07_phi_fu_583_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_937_p0 = grp_fu_937_p2;
    end else begin
        grp_fu_937_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
        grp_fu_937_p1 = select_ln136_15_reg_2243;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_937_p1 = select_ln136_10_reg_2218;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_937_p1 = select_ln136_5_reg_2113;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_937_p1 = select_ln136_reg_2088;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_937_p1 = accum_in3_load_9_reg_1983;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_937_p1 = accum_in2_load_8_reg_1918;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_937_p1 = accum_in1_load_reg_1893;
    end else begin
        grp_fu_937_p1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_942_p0 = ap_phi_mux_psum_27_028_phi_fu_655_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_942_p0 = ap_phi_mux_psum_22_023_phi_fu_715_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_942_p0 = ap_phi_mux_psum_17_018_phi_fu_775_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_942_p0 = ap_phi_mux_psum_12_013_phi_fu_835_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_942_p0 = ap_phi_mux_psum_7_08_phi_fu_571_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_942_p0 = grp_fu_942_p2;
    end else begin
        grp_fu_942_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_942_p1 = select_ln136_11_reg_2223;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_942_p1 = select_ln136_6_reg_2118;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_942_p1 = select_ln136_1_reg_2093;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_942_p1 = accum_in_load_31_reg_1988;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_942_p1 = accum_in3_load_8_reg_1923;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_942_p1 = accum_in2_load_reg_1898;
    end else begin
        grp_fu_942_p1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_947_p0 = ap_phi_mux_psum_28_029_phi_fu_643_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_947_p0 = ap_phi_mux_psum_23_024_phi_fu_703_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_947_p0 = ap_phi_mux_psum_18_019_phi_fu_763_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_947_p0 = ap_phi_mux_psum_13_014_phi_fu_823_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_947_p0 = ap_phi_mux_psum_8_09_phi_fu_559_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_947_p0 = grp_fu_947_p2;
    end else begin
        grp_fu_947_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_947_p1 = select_ln136_12_reg_2228;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_947_p1 = select_ln136_7_reg_2123;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_947_p1 = select_ln136_2_reg_2098;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_947_p1 = accum_in1_load_17_reg_1993;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_947_p1 = accum_in_load_30_reg_1968;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_947_p1 = accum_in3_load_reg_1903;
    end else begin
        grp_fu_947_p1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_952_p0 = ap_phi_mux_psum_29_030_phi_fu_631_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_952_p0 = ap_phi_mux_psum_24_025_phi_fu_691_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_952_p0 = ap_phi_mux_psum_19_020_phi_fu_751_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_952_p0 = ap_phi_mux_psum_14_015_phi_fu_811_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_952_p0 = ap_phi_mux_psum_9_010_phi_fu_547_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_952_p0 = grp_fu_952_p2;
    end else begin
        grp_fu_952_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_952_p1 = select_ln136_13_reg_2233;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_952_p1 = select_ln136_8_reg_2208;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_952_p1 = select_ln136_3_reg_2103;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_952_p1 = accum_in2_load_10_reg_1998;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_952_p1 = accum_in1_load_16_reg_1973;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_952_p1 = accum_in_load_29_reg_1908;
    end else begin
        grp_fu_952_p1 = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if ((~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4_subdone) & (icmp_ln132_reg_1838 == 1'd0)) & (1'b0 == ap_block_pp0_stage4_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4_subdone) & (icmp_ln132_reg_1838 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_fu_1598_p3 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_fu_1598_p3 == 1'd1) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state21;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_out_address0 = zext_ln140_2_fu_1795_p1;

assign accum_out_address1 = zext_ln140_fu_1606_p1;

assign accum_out_d0 = ((icmp_ln152_28_fu_1824_p2[0:0] == 1'b1) ? psum_29_030_reg_627 : select_ln152_27_fu_1816_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln152_phi_fu_881_p32;

assign add_ln132_fu_1592_p2 = (x_reg_471 + 8'd32);

assign add_ln140_fu_1615_p2 = (q_reg_867 + 6'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd10];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state10_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage4_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage5_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage6_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_1463 = (~(trunc_ln140_fu_1611_p1 == 5'd0) & ~(trunc_ln140_fu_1611_p1 == 5'd28) & ~(trunc_ln140_fu_1611_p1 == 5'd26) & ~(trunc_ln140_fu_1611_p1 == 5'd24) & ~(trunc_ln140_fu_1611_p1 == 5'd22) & ~(trunc_ln140_fu_1611_p1 == 5'd20) & ~(trunc_ln140_fu_1611_p1 == 5'd18) & ~(trunc_ln140_fu_1611_p1 == 5'd16) & ~(trunc_ln140_fu_1611_p1 == 5'd14) & ~(trunc_ln140_fu_1611_p1 == 5'd12) & ~(trunc_ln140_fu_1611_p1 == 5'd10) & ~(trunc_ln140_fu_1611_p1 == 5'd8) & ~(trunc_ln140_fu_1611_p1 == 5'd6) & ~(trunc_ln140_fu_1611_p1 == 5'd4) & ~(trunc_ln140_fu_1611_p1 == 5'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_phi_mux_psum_10_011_phi_fu_859_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_11_012_phi_fu_847_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_12_013_phi_fu_835_p4 = grp_fu_942_p2;

assign ap_phi_mux_psum_13_014_phi_fu_823_p4 = grp_fu_947_p2;

assign ap_phi_mux_psum_14_015_phi_fu_811_p4 = grp_fu_952_p2;

assign ap_phi_mux_psum_15_016_phi_fu_799_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_16_017_phi_fu_787_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_17_018_phi_fu_775_p4 = grp_fu_942_p2;

assign ap_phi_mux_psum_18_019_phi_fu_763_p4 = grp_fu_947_p2;

assign ap_phi_mux_psum_19_020_phi_fu_751_p4 = grp_fu_952_p2;

assign ap_phi_mux_psum_20_021_phi_fu_739_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_21_022_phi_fu_727_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_22_023_phi_fu_715_p4 = grp_fu_942_p2;

assign ap_phi_mux_psum_23_024_phi_fu_703_p4 = grp_fu_947_p2;

assign ap_phi_mux_psum_24_025_phi_fu_691_p4 = grp_fu_952_p2;

assign ap_phi_mux_psum_25_026_phi_fu_679_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_26_027_phi_fu_667_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_27_028_phi_fu_655_p4 = grp_fu_942_p2;

assign ap_phi_mux_psum_28_029_phi_fu_643_p4 = grp_fu_947_p2;

assign ap_phi_mux_psum_29_030_phi_fu_631_p4 = grp_fu_952_p2;

assign ap_phi_mux_psum_30_031_phi_fu_619_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_31_032_phi_fu_607_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_5_06_phi_fu_595_p4 = grp_fu_932_p2;

assign ap_phi_mux_psum_6_07_phi_fu_583_p4 = grp_fu_937_p2;

assign ap_phi_mux_psum_7_08_phi_fu_571_p4 = grp_fu_942_p2;

assign ap_phi_mux_psum_8_09_phi_fu_559_p4 = grp_fu_947_p2;

assign ap_phi_mux_psum_9_010_phi_fu_547_p4 = grp_fu_952_p2;

assign ap_phi_reg_pp1_iter0_phi_ln152_reg_878 = 'bx;

assign icmp_ln132_fu_984_p2 = ((ap_phi_mux_x_phi_fu_475_p4 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_10_fu_1380_p2 = ((or_ln136_19_fu_1374_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_11_fu_1407_p2 = ((or_ln136_20_fu_1401_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_12_fu_1434_p2 = ((or_ln136_21_fu_1428_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_13_fu_1461_p2 = ((or_ln136_22_fu_1455_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_14_fu_1488_p2 = ((or_ln136_23_fu_1482_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_15_fu_1515_p2 = ((or_ln136_24_fu_1509_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_1_fu_1081_p2 = ((or_ln136_10_fu_1075_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_2_fu_1108_p2 = ((or_ln136_11_fu_1102_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_3_fu_1135_p2 = ((or_ln136_12_fu_1129_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_4_fu_1162_p2 = ((or_ln136_13_fu_1156_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_5_fu_1189_p2 = ((or_ln136_14_fu_1183_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_6_fu_1216_p2 = ((or_ln136_15_fu_1210_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_7_fu_1243_p2 = ((or_ln136_16_fu_1237_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_8_fu_1326_p2 = ((or_ln136_17_fu_1320_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_9_fu_1353_p2 = ((or_ln136_18_fu_1347_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln136_fu_1054_p2 = ((or_ln136_9_fu_1048_p2 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln152_15_fu_1641_p2 = ((or_ln140_fu_1621_p2 == 5'd3) ? 1'b1 : 1'b0);

assign icmp_ln152_16_fu_1655_p2 = ((or_ln140_fu_1621_p2 == 5'd5) ? 1'b1 : 1'b0);

assign icmp_ln152_17_fu_1669_p2 = ((or_ln140_fu_1621_p2 == 5'd7) ? 1'b1 : 1'b0);

assign icmp_ln152_18_fu_1683_p2 = ((or_ln140_fu_1621_p2 == 5'd9) ? 1'b1 : 1'b0);

assign icmp_ln152_19_fu_1697_p2 = ((or_ln140_fu_1621_p2 == 5'd11) ? 1'b1 : 1'b0);

assign icmp_ln152_20_fu_1711_p2 = ((or_ln140_fu_1621_p2 == 5'd13) ? 1'b1 : 1'b0);

assign icmp_ln152_21_fu_1725_p2 = ((or_ln140_fu_1621_p2 == 5'd15) ? 1'b1 : 1'b0);

assign icmp_ln152_22_fu_1739_p2 = ((or_ln140_fu_1621_p2 == 5'd17) ? 1'b1 : 1'b0);

assign icmp_ln152_23_fu_1753_p2 = ((or_ln140_fu_1621_p2 == 5'd19) ? 1'b1 : 1'b0);

assign icmp_ln152_24_fu_1767_p2 = ((or_ln140_fu_1621_p2 == 5'd21) ? 1'b1 : 1'b0);

assign icmp_ln152_25_fu_1781_p2 = ((or_ln140_fu_1621_p2 == 5'd23) ? 1'b1 : 1'b0);

assign icmp_ln152_26_fu_1799_p2 = ((or_ln140_reg_2426 == 5'd25) ? 1'b1 : 1'b0);

assign icmp_ln152_27_fu_1811_p2 = ((or_ln140_reg_2426 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln152_28_fu_1824_p2 = ((or_ln140_reg_2426 == 5'd29) ? 1'b1 : 1'b0);

assign icmp_ln152_fu_1627_p2 = ((or_ln140_fu_1621_p2 == 5'd1) ? 1'b1 : 1'b0);

assign lshr_ln136_10_fu_1386_p4 = {{or_ln136_19_fu_1374_p2[7:2]}};

assign lshr_ln136_11_fu_1413_p4 = {{or_ln136_20_fu_1401_p2[7:2]}};

assign lshr_ln136_12_fu_1440_p4 = {{or_ln136_21_fu_1428_p2[7:2]}};

assign lshr_ln136_13_fu_1467_p4 = {{or_ln136_22_fu_1455_p2[7:2]}};

assign lshr_ln136_14_fu_1494_p4 = {{or_ln136_23_fu_1482_p2[7:2]}};

assign lshr_ln136_15_fu_1521_p4 = {{or_ln136_24_fu_1509_p2[7:2]}};

assign lshr_ln136_1_fu_1060_p4 = {{or_ln136_9_fu_1048_p2[7:2]}};

assign lshr_ln136_2_fu_1087_p4 = {{or_ln136_10_fu_1075_p2[7:2]}};

assign lshr_ln136_3_fu_1114_p4 = {{or_ln136_11_fu_1102_p2[7:2]}};

assign lshr_ln136_4_fu_1141_p4 = {{or_ln136_12_fu_1129_p2[7:2]}};

assign lshr_ln136_5_fu_1168_p4 = {{or_ln136_13_fu_1156_p2[7:2]}};

assign lshr_ln136_6_fu_1195_p4 = {{or_ln136_14_fu_1183_p2[7:2]}};

assign lshr_ln136_7_fu_1222_p4 = {{or_ln136_15_fu_1210_p2[7:2]}};

assign lshr_ln136_8_fu_1249_p4 = {{or_ln136_16_fu_1237_p2[7:2]}};

assign lshr_ln136_9_fu_1332_p4 = {{or_ln136_17_fu_1320_p2[7:2]}};

assign lshr_ln136_s_fu_1359_p4 = {{or_ln136_18_fu_1347_p2[7:2]}};

assign lshr_ln_fu_990_p4 = {{ap_phi_mux_x_phi_fu_475_p4[7:2]}};

assign or_ln136_10_fu_1075_p2 = (x_reg_471 | 8'd17);

assign or_ln136_11_fu_1102_p2 = (x_reg_471 | 8'd18);

assign or_ln136_12_fu_1129_p2 = (x_reg_471 | 8'd19);

assign or_ln136_13_fu_1156_p2 = (x_reg_471 | 8'd20);

assign or_ln136_14_fu_1183_p2 = (x_reg_471 | 8'd21);

assign or_ln136_15_fu_1210_p2 = (x_reg_471 | 8'd22);

assign or_ln136_16_fu_1237_p2 = (x_reg_471 | 8'd23);

assign or_ln136_17_fu_1320_p2 = (x_reg_471 | 8'd24);

assign or_ln136_18_fu_1347_p2 = (x_reg_471 | 8'd25);

assign or_ln136_19_fu_1374_p2 = (x_reg_471 | 8'd26);

assign or_ln136_20_fu_1401_p2 = (x_reg_471 | 8'd27);

assign or_ln136_21_fu_1428_p2 = (x_reg_471 | 8'd28);

assign or_ln136_22_fu_1455_p2 = (x_reg_471 | 8'd29);

assign or_ln136_23_fu_1482_p2 = (x_reg_471 | 8'd30);

assign or_ln136_24_fu_1509_p2 = (x_reg_471 | 8'd31);

assign or_ln136_7_fu_1022_p2 = (lshr_ln_reg_1842 | 6'd2);

assign or_ln136_8_fu_1035_p2 = (lshr_ln_reg_1842 | 6'd3);

assign or_ln136_9_fu_1048_p2 = (x_reg_471 | 8'd16);

assign or_ln136_fu_1008_p2 = (lshr_ln_fu_990_p4 | 6'd1);

assign or_ln140_fu_1621_p2 = (trunc_ln140_fu_1611_p1 | 5'd1);

assign select_ln136_10_fu_1550_p3 = ((icmp_ln136_10_reg_2148[0:0] == 1'b1) ? accum_in2_q1 : 16'd0);

assign select_ln136_11_fu_1557_p3 = ((icmp_ln136_11_reg_2158[0:0] == 1'b1) ? accum_in3_q1 : 16'd0);

assign select_ln136_12_fu_1564_p3 = ((icmp_ln136_12_reg_2168[0:0] == 1'b1) ? accum_in_q0 : 16'd0);

assign select_ln136_13_fu_1571_p3 = ((icmp_ln136_13_reg_2178[0:0] == 1'b1) ? accum_in1_q0 : 16'd0);

assign select_ln136_14_fu_1578_p3 = ((icmp_ln136_14_reg_2188[0:0] == 1'b1) ? accum_in2_q0 : 16'd0);

assign select_ln136_15_fu_1585_p3 = ((icmp_ln136_15_reg_2198[0:0] == 1'b1) ? accum_in3_q0 : 16'd0);

assign select_ln136_1_fu_1271_p3 = ((icmp_ln136_1_reg_2018[0:0] == 1'b1) ? accum_in1_q1 : 16'd0);

assign select_ln136_2_fu_1278_p3 = ((icmp_ln136_2_reg_2028[0:0] == 1'b1) ? accum_in2_q1 : 16'd0);

assign select_ln136_3_fu_1285_p3 = ((icmp_ln136_3_reg_2038[0:0] == 1'b1) ? accum_in3_q1 : 16'd0);

assign select_ln136_4_fu_1292_p3 = ((icmp_ln136_4_reg_2048[0:0] == 1'b1) ? accum_in_q0 : 16'd0);

assign select_ln136_5_fu_1299_p3 = ((icmp_ln136_5_reg_2058[0:0] == 1'b1) ? accum_in1_q0 : 16'd0);

assign select_ln136_6_fu_1306_p3 = ((icmp_ln136_6_reg_2068[0:0] == 1'b1) ? accum_in2_q0 : 16'd0);

assign select_ln136_7_fu_1313_p3 = ((icmp_ln136_7_reg_2078[0:0] == 1'b1) ? accum_in3_q0 : 16'd0);

assign select_ln136_8_fu_1536_p3 = ((icmp_ln136_8_reg_2128[0:0] == 1'b1) ? accum_in_q1 : 16'd0);

assign select_ln136_9_fu_1543_p3 = ((icmp_ln136_9_reg_2138[0:0] == 1'b1) ? accum_in1_q1 : 16'd0);

assign select_ln136_fu_1264_p3 = ((icmp_ln136_reg_2008[0:0] == 1'b1) ? accum_in_q1 : 16'd0);

assign select_ln152_15_fu_1647_p3 = ((icmp_ln152_15_fu_1641_p2[0:0] == 1'b1) ? psum_3_04_reg_495 : select_ln152_fu_1633_p3);

assign select_ln152_16_fu_1661_p3 = ((icmp_ln152_16_fu_1655_p2[0:0] == 1'b1) ? psum_5_06_reg_591 : select_ln152_15_fu_1647_p3);

assign select_ln152_17_fu_1675_p3 = ((icmp_ln152_17_fu_1669_p2[0:0] == 1'b1) ? psum_7_08_reg_567 : select_ln152_16_fu_1661_p3);

assign select_ln152_18_fu_1689_p3 = ((icmp_ln152_18_fu_1683_p2[0:0] == 1'b1) ? psum_9_010_reg_543 : select_ln152_17_fu_1675_p3);

assign select_ln152_19_fu_1703_p3 = ((icmp_ln152_19_fu_1697_p2[0:0] == 1'b1) ? psum_11_012_reg_843 : select_ln152_18_fu_1689_p3);

assign select_ln152_20_fu_1717_p3 = ((icmp_ln152_20_fu_1711_p2[0:0] == 1'b1) ? psum_13_014_reg_819 : select_ln152_19_fu_1703_p3);

assign select_ln152_21_fu_1731_p3 = ((icmp_ln152_21_fu_1725_p2[0:0] == 1'b1) ? psum_15_016_reg_795 : select_ln152_20_fu_1717_p3);

assign select_ln152_22_fu_1745_p3 = ((icmp_ln152_22_fu_1739_p2[0:0] == 1'b1) ? psum_17_018_reg_771 : select_ln152_21_fu_1731_p3);

assign select_ln152_23_fu_1759_p3 = ((icmp_ln152_23_fu_1753_p2[0:0] == 1'b1) ? psum_19_020_reg_747 : select_ln152_22_fu_1745_p3);

assign select_ln152_24_fu_1773_p3 = ((icmp_ln152_24_fu_1767_p2[0:0] == 1'b1) ? psum_21_022_reg_723 : select_ln152_23_fu_1759_p3);

assign select_ln152_25_fu_1787_p3 = ((icmp_ln152_25_fu_1781_p2[0:0] == 1'b1) ? psum_23_024_reg_699 : select_ln152_24_fu_1773_p3);

assign select_ln152_26_fu_1804_p3 = ((icmp_ln152_26_fu_1799_p2[0:0] == 1'b1) ? psum_25_026_reg_675 : select_ln152_25_reg_2434);

assign select_ln152_27_fu_1816_p3 = ((icmp_ln152_27_fu_1811_p2[0:0] == 1'b1) ? psum_27_028_reg_651 : select_ln152_26_fu_1804_p3);

assign select_ln152_fu_1633_p3 = ((icmp_ln152_fu_1627_p2[0:0] == 1'b1) ? psum_1_02_reg_519 : psum_31_032_reg_603);

assign tmp_fu_1598_p3 = q_reg_867[32'd5];

assign trunc_ln140_fu_1611_p1 = q_reg_867[4:0];

assign zext_ln136_10_fu_1040_p1 = or_ln136_8_fu_1035_p2;

assign zext_ln136_11_fu_1070_p1 = lshr_ln136_1_fu_1060_p4;

assign zext_ln136_12_fu_1097_p1 = lshr_ln136_2_fu_1087_p4;

assign zext_ln136_13_fu_1124_p1 = lshr_ln136_3_fu_1114_p4;

assign zext_ln136_14_fu_1151_p1 = lshr_ln136_4_fu_1141_p4;

assign zext_ln136_15_fu_1178_p1 = lshr_ln136_5_fu_1168_p4;

assign zext_ln136_16_fu_1205_p1 = lshr_ln136_6_fu_1195_p4;

assign zext_ln136_17_fu_1232_p1 = lshr_ln136_7_fu_1222_p4;

assign zext_ln136_18_fu_1259_p1 = lshr_ln136_8_fu_1249_p4;

assign zext_ln136_19_fu_1342_p1 = lshr_ln136_9_fu_1332_p4;

assign zext_ln136_20_fu_1369_p1 = lshr_ln136_s_fu_1359_p4;

assign zext_ln136_21_fu_1396_p1 = lshr_ln136_10_fu_1386_p4;

assign zext_ln136_22_fu_1423_p1 = lshr_ln136_11_fu_1413_p4;

assign zext_ln136_23_fu_1450_p1 = lshr_ln136_12_fu_1440_p4;

assign zext_ln136_24_fu_1477_p1 = lshr_ln136_13_fu_1467_p4;

assign zext_ln136_25_fu_1504_p1 = lshr_ln136_14_fu_1494_p4;

assign zext_ln136_26_fu_1531_p1 = lshr_ln136_15_fu_1521_p4;

assign zext_ln136_8_fu_1014_p1 = or_ln136_fu_1008_p2;

assign zext_ln136_9_fu_1027_p1 = or_ln136_7_fu_1022_p2;

assign zext_ln136_fu_1000_p1 = lshr_ln_fu_990_p4;

assign zext_ln140_2_fu_1795_p1 = or_ln140_reg_2426;

assign zext_ln140_fu_1606_p1 = q_reg_867;

always @ (posedge ap_clk) begin
    or_ln140_reg_2426[0] <= 1'b1;
end

endmodule //td_fused_top_tdf4_accum_1
module td_fused_top_tdf4_dot_product (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ifmap_vec_0_address0,
        ifmap_vec_0_ce0,
        ifmap_vec_0_q0,
        ifmap_vec_1_address0,
        ifmap_vec_1_ce0,
        ifmap_vec_1_q0,
        ifmap_vec_2_address0,
        ifmap_vec_2_ce0,
        ifmap_vec_2_q0,
        ifmap_vec_3_address0,
        ifmap_vec_3_ce0,
        ifmap_vec_3_q0,
        weight_vecs_0_0_address0,
        weight_vecs_0_0_ce0,
        weight_vecs_0_0_q0,
        weight_vecs_0_1_address0,
        weight_vecs_0_1_ce0,
        weight_vecs_0_1_q0,
        weight_vecs_0_2_address0,
        weight_vecs_0_2_ce0,
        weight_vecs_0_2_q0,
        weight_vecs_0_3_address0,
        weight_vecs_0_3_ce0,
        weight_vecs_0_3_q0,
        weight_vecs_1_0_address0,
        weight_vecs_1_0_ce0,
        weight_vecs_1_0_q0,
        weight_vecs_1_1_address0,
        weight_vecs_1_1_ce0,
        weight_vecs_1_1_q0,
        weight_vecs_1_2_address0,
        weight_vecs_1_2_ce0,
        weight_vecs_1_2_q0,
        weight_vecs_1_3_address0,
        weight_vecs_1_3_ce0,
        weight_vecs_1_3_q0,
        weight_vecs_2_0_address0,
        weight_vecs_2_0_ce0,
        weight_vecs_2_0_q0,
        weight_vecs_2_1_address0,
        weight_vecs_2_1_ce0,
        weight_vecs_2_1_q0,
        weight_vecs_2_2_address0,
        weight_vecs_2_2_ce0,
        weight_vecs_2_2_q0,
        weight_vecs_2_3_address0,
        weight_vecs_2_3_ce0,
        weight_vecs_2_3_q0,
        weight_vecs_3_0_address0,
        weight_vecs_3_0_ce0,
        weight_vecs_3_0_q0,
        weight_vecs_3_1_address0,
        weight_vecs_3_1_ce0,
        weight_vecs_3_1_q0,
        weight_vecs_3_2_address0,
        weight_vecs_3_2_ce0,
        weight_vecs_3_2_q0,
        weight_vecs_3_3_address0,
        weight_vecs_3_3_ce0,
        weight_vecs_3_3_q0,
        products_0_0_address0,
        products_0_0_ce0,
        products_0_0_we0,
        products_0_0_d0,
        products_0_1_address0,
        products_0_1_ce0,
        products_0_1_we0,
        products_0_1_d0,
        products_0_2_address0,
        products_0_2_ce0,
        products_0_2_we0,
        products_0_2_d0,
        products_0_3_address0,
        products_0_3_ce0,
        products_0_3_we0,
        products_0_3_d0,
        products_1_0_address0,
        products_1_0_ce0,
        products_1_0_we0,
        products_1_0_d0,
        products_1_1_address0,
        products_1_1_ce0,
        products_1_1_we0,
        products_1_1_d0,
        products_1_2_address0,
        products_1_2_ce0,
        products_1_2_we0,
        products_1_2_d0,
        products_1_3_address0,
        products_1_3_ce0,
        products_1_3_we0,
        products_1_3_d0,
        products_2_0_address0,
        products_2_0_ce0,
        products_2_0_we0,
        products_2_0_d0,
        products_2_1_address0,
        products_2_1_ce0,
        products_2_1_we0,
        products_2_1_d0,
        products_2_2_address0,
        products_2_2_ce0,
        products_2_2_we0,
        products_2_2_d0,
        products_2_3_address0,
        products_2_3_ce0,
        products_2_3_we0,
        products_2_3_d0,
        products_3_0_address0,
        products_3_0_ce0,
        products_3_0_we0,
        products_3_0_d0,
        products_3_1_address0,
        products_3_1_ce0,
        products_3_1_we0,
        products_3_1_d0,
        products_3_2_address0,
        products_3_2_ce0,
        products_3_2_we0,
        products_3_2_d0,
        products_3_3_address0,
        products_3_3_ce0,
        products_3_3_we0,
        products_3_3_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state11 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [5:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
input  [15:0] ifmap_vec_0_q0;
output  [5:0] ifmap_vec_1_address0;
output   ifmap_vec_1_ce0;
input  [15:0] ifmap_vec_1_q0;
output  [5:0] ifmap_vec_2_address0;
output   ifmap_vec_2_ce0;
input  [15:0] ifmap_vec_2_q0;
output  [5:0] ifmap_vec_3_address0;
output   ifmap_vec_3_ce0;
input  [15:0] ifmap_vec_3_q0;
output  [5:0] weight_vecs_0_0_address0;
output   weight_vecs_0_0_ce0;
input  [15:0] weight_vecs_0_0_q0;
output  [5:0] weight_vecs_0_1_address0;
output   weight_vecs_0_1_ce0;
input  [15:0] weight_vecs_0_1_q0;
output  [5:0] weight_vecs_0_2_address0;
output   weight_vecs_0_2_ce0;
input  [15:0] weight_vecs_0_2_q0;
output  [5:0] weight_vecs_0_3_address0;
output   weight_vecs_0_3_ce0;
input  [15:0] weight_vecs_0_3_q0;
output  [5:0] weight_vecs_1_0_address0;
output   weight_vecs_1_0_ce0;
input  [15:0] weight_vecs_1_0_q0;
output  [5:0] weight_vecs_1_1_address0;
output   weight_vecs_1_1_ce0;
input  [15:0] weight_vecs_1_1_q0;
output  [5:0] weight_vecs_1_2_address0;
output   weight_vecs_1_2_ce0;
input  [15:0] weight_vecs_1_2_q0;
output  [5:0] weight_vecs_1_3_address0;
output   weight_vecs_1_3_ce0;
input  [15:0] weight_vecs_1_3_q0;
output  [5:0] weight_vecs_2_0_address0;
output   weight_vecs_2_0_ce0;
input  [15:0] weight_vecs_2_0_q0;
output  [5:0] weight_vecs_2_1_address0;
output   weight_vecs_2_1_ce0;
input  [15:0] weight_vecs_2_1_q0;
output  [5:0] weight_vecs_2_2_address0;
output   weight_vecs_2_2_ce0;
input  [15:0] weight_vecs_2_2_q0;
output  [5:0] weight_vecs_2_3_address0;
output   weight_vecs_2_3_ce0;
input  [15:0] weight_vecs_2_3_q0;
output  [5:0] weight_vecs_3_0_address0;
output   weight_vecs_3_0_ce0;
input  [15:0] weight_vecs_3_0_q0;
output  [5:0] weight_vecs_3_1_address0;
output   weight_vecs_3_1_ce0;
input  [15:0] weight_vecs_3_1_q0;
output  [5:0] weight_vecs_3_2_address0;
output   weight_vecs_3_2_ce0;
input  [15:0] weight_vecs_3_2_q0;
output  [5:0] weight_vecs_3_3_address0;
output   weight_vecs_3_3_ce0;
input  [15:0] weight_vecs_3_3_q0;
output  [5:0] products_0_0_address0;
output   products_0_0_ce0;
output   products_0_0_we0;
output  [15:0] products_0_0_d0;
output  [5:0] products_0_1_address0;
output   products_0_1_ce0;
output   products_0_1_we0;
output  [15:0] products_0_1_d0;
output  [5:0] products_0_2_address0;
output   products_0_2_ce0;
output   products_0_2_we0;
output  [15:0] products_0_2_d0;
output  [5:0] products_0_3_address0;
output   products_0_3_ce0;
output   products_0_3_we0;
output  [15:0] products_0_3_d0;
output  [5:0] products_1_0_address0;
output   products_1_0_ce0;
output   products_1_0_we0;
output  [15:0] products_1_0_d0;
output  [5:0] products_1_1_address0;
output   products_1_1_ce0;
output   products_1_1_we0;
output  [15:0] products_1_1_d0;
output  [5:0] products_1_2_address0;
output   products_1_2_ce0;
output   products_1_2_we0;
output  [15:0] products_1_2_d0;
output  [5:0] products_1_3_address0;
output   products_1_3_ce0;
output   products_1_3_we0;
output  [15:0] products_1_3_d0;
output  [5:0] products_2_0_address0;
output   products_2_0_ce0;
output   products_2_0_we0;
output  [15:0] products_2_0_d0;
output  [5:0] products_2_1_address0;
output   products_2_1_ce0;
output   products_2_1_we0;
output  [15:0] products_2_1_d0;
output  [5:0] products_2_2_address0;
output   products_2_2_ce0;
output   products_2_2_we0;
output  [15:0] products_2_2_d0;
output  [5:0] products_2_3_address0;
output   products_2_3_ce0;
output   products_2_3_we0;
output  [15:0] products_2_3_d0;
output  [5:0] products_3_0_address0;
output   products_3_0_ce0;
output   products_3_0_we0;
output  [15:0] products_3_0_d0;
output  [5:0] products_3_1_address0;
output   products_3_1_ce0;
output   products_3_1_we0;
output  [15:0] products_3_1_d0;
output  [5:0] products_3_2_address0;
output   products_3_2_ce0;
output   products_3_2_we0;
output  [15:0] products_3_2_d0;
output  [5:0] products_3_3_address0;
output   products_3_3_ce0;
output   products_3_3_we0;
output  [15:0] products_3_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_0_ce0;
reg ifmap_vec_1_ce0;
reg ifmap_vec_2_ce0;
reg ifmap_vec_3_ce0;
reg weight_vecs_0_0_ce0;
reg weight_vecs_0_1_ce0;
reg weight_vecs_0_2_ce0;
reg weight_vecs_0_3_ce0;
reg weight_vecs_1_0_ce0;
reg weight_vecs_1_1_ce0;
reg weight_vecs_1_2_ce0;
reg weight_vecs_1_3_ce0;
reg weight_vecs_2_0_ce0;
reg weight_vecs_2_1_ce0;
reg weight_vecs_2_2_ce0;
reg weight_vecs_2_3_ce0;
reg weight_vecs_3_0_ce0;
reg weight_vecs_3_1_ce0;
reg weight_vecs_3_2_ce0;
reg weight_vecs_3_3_ce0;
reg products_0_0_ce0;
reg products_0_0_we0;
reg products_0_1_ce0;
reg products_0_1_we0;
reg products_0_2_ce0;
reg products_0_2_we0;
reg products_0_3_ce0;
reg products_0_3_we0;
reg products_1_0_ce0;
reg products_1_0_we0;
reg products_1_1_ce0;
reg products_1_1_we0;
reg products_1_2_ce0;
reg products_1_2_we0;
reg products_1_3_ce0;
reg products_1_3_we0;
reg products_2_0_ce0;
reg products_2_0_we0;
reg products_2_1_ce0;
reg products_2_1_we0;
reg products_2_2_ce0;
reg products_2_2_we0;
reg products_2_3_ce0;
reg products_2_3_we0;
reg products_3_0_ce0;
reg products_3_0_we0;
reg products_3_1_ce0;
reg products_3_1_we0;
reg products_3_2_ce0;
reg products_3_2_we0;
reg products_3_3_ce0;
reg products_3_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [5:0] indvar_flatten17_reg_606;
reg   [1:0] ii_reg_617;
reg   [4:0] indvar_flatten_reg_629;
reg   [1:0] jj_reg_640;
reg   [4:0] ic_reg_651;
wire   [5:0] add_ln147_4_fu_726_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_state10_pp0_stage0_iter8;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln147_fu_732_p2;
reg   [0:0] icmp_ln147_reg_1098;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter4_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter5_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter6_reg;
reg   [0:0] icmp_ln147_reg_1098_pp0_iter7_reg;
wire   [1:0] add_ln147_fu_738_p2;
reg   [1:0] add_ln147_reg_1102;
wire   [0:0] icmp_ln148_fu_744_p2;
reg   [0:0] icmp_ln148_reg_1108;
wire   [1:0] select_ln147_15_fu_750_p3;
reg   [1:0] select_ln147_15_reg_1117;
wire   [4:0] select_ln148_12_fu_764_p3;
wire   [1:0] select_ln148_10_fu_901_p3;
reg   [1:0] select_ln148_10_reg_1129;
reg    ap_enable_reg_pp0_iter1;
wire   [3:0] select_ln148_11_fu_929_p3;
reg   [3:0] select_ln148_11_reg_1134;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter2_reg;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter3_reg;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter4_reg;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter5_reg;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter6_reg;
reg   [3:0] select_ln148_11_reg_1134_pp0_iter7_reg;
wire   [3:0] trunc_ln149_fu_937_p1;
reg   [3:0] trunc_ln149_reg_1142;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter2_reg;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter3_reg;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter4_reg;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter5_reg;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter6_reg;
reg   [3:0] trunc_ln149_reg_1142_pp0_iter7_reg;
wire   [1:0] newIndex_fu_941_p4;
reg   [1:0] newIndex_reg_1149;
reg   [1:0] newIndex_reg_1149_pp0_iter2_reg;
reg   [1:0] newIndex_reg_1149_pp0_iter3_reg;
reg   [1:0] newIndex_reg_1149_pp0_iter4_reg;
reg   [1:0] newIndex_reg_1149_pp0_iter5_reg;
reg   [1:0] newIndex_reg_1149_pp0_iter6_reg;
reg   [1:0] newIndex_reg_1149_pp0_iter7_reg;
wire   [4:0] add_ln149_fu_983_p2;
reg   [15:0] ifmap_vec_0_load_reg_1259;
reg   [15:0] weight_vecs_0_0_load_reg_1267;
reg   [15:0] weight_vecs_1_0_load_reg_1272;
reg   [15:0] weight_vecs_2_0_load_reg_1277;
reg   [15:0] weight_vecs_3_0_load_reg_1282;
reg   [15:0] ifmap_vec_1_load_reg_1287;
reg   [15:0] weight_vecs_0_1_load_reg_1295;
reg   [15:0] weight_vecs_1_1_load_reg_1300;
reg   [15:0] weight_vecs_2_1_load_reg_1305;
reg   [15:0] weight_vecs_3_1_load_reg_1310;
reg   [15:0] ifmap_vec_2_load_reg_1315;
reg   [15:0] weight_vecs_0_2_load_reg_1323;
reg   [15:0] weight_vecs_1_2_load_reg_1328;
reg   [15:0] weight_vecs_2_2_load_reg_1333;
reg   [15:0] weight_vecs_3_2_load_reg_1338;
reg   [15:0] ifmap_vec_3_load_reg_1343;
reg   [15:0] weight_vecs_0_3_load_reg_1351;
reg   [15:0] weight_vecs_1_3_load_reg_1356;
reg   [15:0] weight_vecs_2_3_load_reg_1361;
reg   [15:0] weight_vecs_3_3_load_reg_1366;
wire   [15:0] grp_fu_662_p2;
reg   [15:0] mul_reg_1371;
wire   [15:0] grp_fu_666_p2;
reg   [15:0] mul_1_reg_1376;
wire   [15:0] grp_fu_670_p2;
reg   [15:0] mul_2_reg_1381;
wire   [15:0] grp_fu_674_p2;
reg   [15:0] mul_3_reg_1386;
wire   [15:0] grp_fu_678_p2;
reg   [15:0] mul27_1_reg_1391;
wire   [15:0] grp_fu_682_p2;
reg   [15:0] mul27_1_1_reg_1396;
wire   [15:0] grp_fu_686_p2;
reg   [15:0] mul27_1_2_reg_1401;
wire   [15:0] grp_fu_690_p2;
reg   [15:0] mul27_1_3_reg_1406;
wire   [15:0] grp_fu_694_p2;
reg   [15:0] mul27_2_reg_1411;
wire   [15:0] grp_fu_698_p2;
reg   [15:0] mul27_2_1_reg_1416;
wire   [15:0] grp_fu_702_p2;
reg   [15:0] mul27_2_2_reg_1421;
wire   [15:0] grp_fu_706_p2;
reg   [15:0] mul27_2_3_reg_1426;
wire   [15:0] grp_fu_710_p2;
reg   [15:0] mul27_3_reg_1431;
wire   [15:0] grp_fu_714_p2;
reg   [15:0] mul27_3_1_reg_1436;
wire   [15:0] grp_fu_718_p2;
reg   [15:0] mul27_3_2_reg_1441;
wire   [15:0] grp_fu_722_p2;
reg   [15:0] mul27_3_3_reg_1446;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg   [1:0] ap_phi_mux_ii_phi_fu_621_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_644_p4;
wire   [63:0] tmp_115_fu_959_p1;
wire   [63:0] zext_ln153_fu_995_p1;
wire   [63:0] zext_ln153_6_fu_1025_p1;
wire   [63:0] zext_ln153_7_fu_1055_p1;
wire   [63:0] zext_ln153_8_fu_1085_p1;
wire   [4:0] add_ln148_4_fu_758_p2;
wire   [3:0] shl_ln_fu_776_p3;
wire   [3:0] zext_ln150_fu_772_p1;
wire   [3:0] sub_ln150_fu_784_p2;
wire   [3:0] zext_ln150_4_fu_790_p1;
wire   [3:0] tmp_fu_817_p3;
wire   [4:0] tmp_cast_fu_824_p1;
wire   [4:0] select_ln147_18_cast_fu_814_p1;
wire   [4:0] empty_111_fu_828_p2;
wire   [3:0] shl_ln150_mid1_fu_841_p3;
wire   [3:0] zext_ln150_8_fu_838_p1;
wire   [3:0] sub_ln150_4_fu_848_p2;
wire   [3:0] add_ln150_fu_794_p2;
wire   [0:0] tmp_57_fu_868_p3;
wire   [0:0] xor_ln149_fu_876_p2;
wire   [1:0] select_ln147_fu_800_p3;
wire   [0:0] or_ln147_fu_882_p2;
wire   [4:0] select_ln147_14_fu_807_p3;
wire   [1:0] add_ln148_fu_887_p2;
wire   [5:0] sext_ln150_fu_834_p1;
wire   [5:0] select_ln148_13_cast_fu_909_p1;
wire   [3:0] select_ln147_16_fu_854_p3;
wire   [3:0] zext_ln150_9_fu_919_p1;
wire   [3:0] select_ln147_17_fu_861_p3;
wire   [3:0] add_ln150_4_fu_923_p2;
wire   [4:0] select_ln148_fu_893_p3;
wire   [5:0] empty_112_fu_913_p2;
wire   [7:0] tmp_58_fu_951_p3;
wire   [5:0] lshr_ln_fu_989_p3;
wire   [3:0] or_ln150_fu_1003_p2;
wire   [1:0] tmp_s_fu_1008_p4;
wire   [5:0] lshr_ln153_6_fu_1018_p3;
wire   [3:0] or_ln150_3_fu_1033_p2;
wire   [1:0] tmp_36_fu_1038_p4;
wire   [5:0] lshr_ln153_7_fu_1048_p3;
wire   [3:0] or_ln150_4_fu_1063_p2;
wire   [1:0] tmp_37_fu_1068_p4;
wire   [5:0] lshr_ln153_8_fu_1078_p3;
wire    ap_CS_fsm_state11;
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
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
end

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U476(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_1259),
    .din1(weight_vecs_0_0_load_reg_1267),
    .dout(grp_fu_662_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U477(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_1259),
    .din1(weight_vecs_1_0_load_reg_1272),
    .dout(grp_fu_666_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U478(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_1259),
    .din1(weight_vecs_2_0_load_reg_1277),
    .dout(grp_fu_670_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U479(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_1259),
    .din1(weight_vecs_3_0_load_reg_1282),
    .dout(grp_fu_674_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U480(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_1287),
    .din1(weight_vecs_0_1_load_reg_1295),
    .dout(grp_fu_678_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U481(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_1287),
    .din1(weight_vecs_1_1_load_reg_1300),
    .dout(grp_fu_682_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U482(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_1287),
    .din1(weight_vecs_2_1_load_reg_1305),
    .dout(grp_fu_686_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U483(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_1287),
    .din1(weight_vecs_3_1_load_reg_1310),
    .dout(grp_fu_690_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U484(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_2_load_reg_1315),
    .din1(weight_vecs_0_2_load_reg_1323),
    .dout(grp_fu_694_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U485(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_2_load_reg_1315),
    .din1(weight_vecs_1_2_load_reg_1328),
    .dout(grp_fu_698_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U486(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_2_load_reg_1315),
    .din1(weight_vecs_2_2_load_reg_1333),
    .dout(grp_fu_702_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U487(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_2_load_reg_1315),
    .din1(weight_vecs_3_2_load_reg_1338),
    .dout(grp_fu_706_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U488(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_3_load_reg_1343),
    .din1(weight_vecs_0_3_load_reg_1351),
    .dout(grp_fu_710_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U489(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_3_load_reg_1343),
    .din1(weight_vecs_1_3_load_reg_1356),
    .dout(grp_fu_714_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U490(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_3_load_reg_1343),
    .din1(weight_vecs_2_3_load_reg_1361),
    .dout(grp_fu_718_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U491(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_3_load_reg_1343),
    .din1(weight_vecs_3_3_load_reg_1366),
    .dout(grp_fu_722_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state11)) begin
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter8 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_1098 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ic_reg_651 <= add_ln149_fu_983_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_651 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_1098 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_617 <= select_ln147_15_reg_1117;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_617 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_732_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten17_reg_606 <= add_ln147_4_fu_726_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten17_reg_606 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_732_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_629 <= select_ln148_12_fu_764_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_629 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_640 <= select_ln148_10_reg_1129;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_640 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_732_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln147_reg_1102 <= add_ln147_fu_738_p2;
        icmp_ln148_reg_1108 <= icmp_ln148_fu_744_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln147_reg_1098 <= icmp_ln147_fu_732_p2;
        icmp_ln147_reg_1098_pp0_iter1_reg <= icmp_ln147_reg_1098;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_1098_pp0_iter2_reg <= icmp_ln147_reg_1098_pp0_iter1_reg;
        icmp_ln147_reg_1098_pp0_iter3_reg <= icmp_ln147_reg_1098_pp0_iter2_reg;
        icmp_ln147_reg_1098_pp0_iter4_reg <= icmp_ln147_reg_1098_pp0_iter3_reg;
        icmp_ln147_reg_1098_pp0_iter5_reg <= icmp_ln147_reg_1098_pp0_iter4_reg;
        icmp_ln147_reg_1098_pp0_iter6_reg <= icmp_ln147_reg_1098_pp0_iter5_reg;
        icmp_ln147_reg_1098_pp0_iter7_reg <= icmp_ln147_reg_1098_pp0_iter6_reg;
        newIndex_reg_1149_pp0_iter2_reg <= newIndex_reg_1149;
        newIndex_reg_1149_pp0_iter3_reg <= newIndex_reg_1149_pp0_iter2_reg;
        newIndex_reg_1149_pp0_iter4_reg <= newIndex_reg_1149_pp0_iter3_reg;
        newIndex_reg_1149_pp0_iter5_reg <= newIndex_reg_1149_pp0_iter4_reg;
        newIndex_reg_1149_pp0_iter6_reg <= newIndex_reg_1149_pp0_iter5_reg;
        newIndex_reg_1149_pp0_iter7_reg <= newIndex_reg_1149_pp0_iter6_reg;
        select_ln148_11_reg_1134_pp0_iter2_reg <= select_ln148_11_reg_1134;
        select_ln148_11_reg_1134_pp0_iter3_reg <= select_ln148_11_reg_1134_pp0_iter2_reg;
        select_ln148_11_reg_1134_pp0_iter4_reg <= select_ln148_11_reg_1134_pp0_iter3_reg;
        select_ln148_11_reg_1134_pp0_iter5_reg <= select_ln148_11_reg_1134_pp0_iter4_reg;
        select_ln148_11_reg_1134_pp0_iter6_reg <= select_ln148_11_reg_1134_pp0_iter5_reg;
        select_ln148_11_reg_1134_pp0_iter7_reg <= select_ln148_11_reg_1134_pp0_iter6_reg;
        trunc_ln149_reg_1142_pp0_iter2_reg <= trunc_ln149_reg_1142;
        trunc_ln149_reg_1142_pp0_iter3_reg <= trunc_ln149_reg_1142_pp0_iter2_reg;
        trunc_ln149_reg_1142_pp0_iter4_reg <= trunc_ln149_reg_1142_pp0_iter3_reg;
        trunc_ln149_reg_1142_pp0_iter5_reg <= trunc_ln149_reg_1142_pp0_iter4_reg;
        trunc_ln149_reg_1142_pp0_iter6_reg <= trunc_ln149_reg_1142_pp0_iter5_reg;
        trunc_ln149_reg_1142_pp0_iter7_reg <= trunc_ln149_reg_1142_pp0_iter6_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_1098_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_load_reg_1259 <= ifmap_vec_0_q0;
        ifmap_vec_1_load_reg_1287 <= ifmap_vec_1_q0;
        ifmap_vec_2_load_reg_1315 <= ifmap_vec_2_q0;
        ifmap_vec_3_load_reg_1343 <= ifmap_vec_3_q0;
        weight_vecs_0_0_load_reg_1267 <= weight_vecs_0_0_q0;
        weight_vecs_0_1_load_reg_1295 <= weight_vecs_0_1_q0;
        weight_vecs_0_2_load_reg_1323 <= weight_vecs_0_2_q0;
        weight_vecs_0_3_load_reg_1351 <= weight_vecs_0_3_q0;
        weight_vecs_1_0_load_reg_1272 <= weight_vecs_1_0_q0;
        weight_vecs_1_1_load_reg_1300 <= weight_vecs_1_1_q0;
        weight_vecs_1_2_load_reg_1328 <= weight_vecs_1_2_q0;
        weight_vecs_1_3_load_reg_1356 <= weight_vecs_1_3_q0;
        weight_vecs_2_0_load_reg_1277 <= weight_vecs_2_0_q0;
        weight_vecs_2_1_load_reg_1305 <= weight_vecs_2_1_q0;
        weight_vecs_2_2_load_reg_1333 <= weight_vecs_2_2_q0;
        weight_vecs_2_3_load_reg_1361 <= weight_vecs_2_3_q0;
        weight_vecs_3_0_load_reg_1282 <= weight_vecs_3_0_q0;
        weight_vecs_3_1_load_reg_1310 <= weight_vecs_3_1_q0;
        weight_vecs_3_2_load_reg_1338 <= weight_vecs_3_2_q0;
        weight_vecs_3_3_load_reg_1366 <= weight_vecs_3_3_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_1098_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul27_1_1_reg_1396 <= grp_fu_682_p2;
        mul27_1_2_reg_1401 <= grp_fu_686_p2;
        mul27_1_3_reg_1406 <= grp_fu_690_p2;
        mul27_1_reg_1391 <= grp_fu_678_p2;
        mul27_2_1_reg_1416 <= grp_fu_698_p2;
        mul27_2_2_reg_1421 <= grp_fu_702_p2;
        mul27_2_3_reg_1426 <= grp_fu_706_p2;
        mul27_2_reg_1411 <= grp_fu_694_p2;
        mul27_3_1_reg_1436 <= grp_fu_714_p2;
        mul27_3_2_reg_1441 <= grp_fu_718_p2;
        mul27_3_3_reg_1446 <= grp_fu_722_p2;
        mul27_3_reg_1431 <= grp_fu_710_p2;
        mul_1_reg_1376 <= grp_fu_666_p2;
        mul_2_reg_1381 <= grp_fu_670_p2;
        mul_3_reg_1386 <= grp_fu_674_p2;
        mul_reg_1371 <= grp_fu_662_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_1098 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        newIndex_reg_1149 <= {{select_ln148_fu_893_p3[3:2]}};
        select_ln148_11_reg_1134 <= select_ln148_11_fu_929_p3;
        trunc_ln149_reg_1142 <= trunc_ln149_fu_937_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_732_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln147_15_reg_1117 <= select_ln147_15_fu_750_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_1098 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_10_reg_1129 <= select_ln148_10_fu_901_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_fu_732_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_1098 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_621_p4 = select_ln147_15_reg_1117;
    end else begin
        ap_phi_mux_ii_phi_fu_621_p4 = ii_reg_617;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_644_p4 = select_ln148_10_reg_1129;
    end else begin
        ap_phi_mux_jj_phi_fu_644_p4 = jj_reg_640;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_vec_2_ce0 = 1'b1;
    end else begin
        ifmap_vec_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_vec_3_ce0 = 1'b1;
    end else begin
        ifmap_vec_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_0_ce0 = 1'b1;
    end else begin
        products_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_0_we0 = 1'b1;
    end else begin
        products_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_1_ce0 = 1'b1;
    end else begin
        products_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_1_we0 = 1'b1;
    end else begin
        products_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_2_ce0 = 1'b1;
    end else begin
        products_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_2_we0 = 1'b1;
    end else begin
        products_0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_3_ce0 = 1'b1;
    end else begin
        products_0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_3_we0 = 1'b1;
    end else begin
        products_0_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_0_ce0 = 1'b1;
    end else begin
        products_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_0_we0 = 1'b1;
    end else begin
        products_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_1_ce0 = 1'b1;
    end else begin
        products_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_1_we0 = 1'b1;
    end else begin
        products_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_2_ce0 = 1'b1;
    end else begin
        products_1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_2_we0 = 1'b1;
    end else begin
        products_1_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_3_ce0 = 1'b1;
    end else begin
        products_1_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_3_we0 = 1'b1;
    end else begin
        products_1_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_0_ce0 = 1'b1;
    end else begin
        products_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_0_we0 = 1'b1;
    end else begin
        products_2_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_1_ce0 = 1'b1;
    end else begin
        products_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_1_we0 = 1'b1;
    end else begin
        products_2_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_2_ce0 = 1'b1;
    end else begin
        products_2_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_2_we0 = 1'b1;
    end else begin
        products_2_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_3_ce0 = 1'b1;
    end else begin
        products_2_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_3_we0 = 1'b1;
    end else begin
        products_2_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_0_ce0 = 1'b1;
    end else begin
        products_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_0_we0 = 1'b1;
    end else begin
        products_3_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_1_ce0 = 1'b1;
    end else begin
        products_3_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_1_we0 = 1'b1;
    end else begin
        products_3_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_2_ce0 = 1'b1;
    end else begin
        products_3_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_2_we0 = 1'b1;
    end else begin
        products_3_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_3_ce0 = 1'b1;
    end else begin
        products_3_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_1098_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_3_we0 = 1'b1;
    end else begin
        products_3_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_0_1_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_0_2_ce0 = 1'b1;
    end else begin
        weight_vecs_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_0_3_ce0 = 1'b1;
    end else begin
        weight_vecs_0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_1_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_1_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_1_2_ce0 = 1'b1;
    end else begin
        weight_vecs_1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_1_3_ce0 = 1'b1;
    end else begin
        weight_vecs_1_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_2_0_ce0 = 1'b1;
    end else begin
        weight_vecs_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_2_1_ce0 = 1'b1;
    end else begin
        weight_vecs_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_2_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_2_3_ce0 = 1'b1;
    end else begin
        weight_vecs_2_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_3_0_ce0 = 1'b1;
    end else begin
        weight_vecs_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_3_1_ce0 = 1'b1;
    end else begin
        weight_vecs_3_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_3_2_ce0 = 1'b1;
    end else begin
        weight_vecs_3_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        weight_vecs_3_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_3_ce0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & ~((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln147_4_fu_726_p2 = (indvar_flatten17_reg_606 + 6'd1);

assign add_ln147_fu_738_p2 = (ap_phi_mux_ii_phi_fu_621_p4 + 2'd1);

assign add_ln148_4_fu_758_p2 = (indvar_flatten_reg_629 + 5'd1);

assign add_ln148_fu_887_p2 = (select_ln147_fu_800_p3 + 2'd1);

assign add_ln149_fu_983_p2 = (select_ln148_fu_893_p3 + 5'd4);

assign add_ln150_4_fu_923_p2 = (select_ln147_16_fu_854_p3 + zext_ln150_9_fu_919_p1);

assign add_ln150_fu_794_p2 = (sub_ln150_fu_784_p2 + zext_ln150_4_fu_790_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state10_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_111_fu_828_p2 = (tmp_cast_fu_824_p1 - select_ln147_18_cast_fu_814_p1);

assign empty_112_fu_913_p2 = ((sext_ln150_fu_834_p1) + (select_ln148_13_cast_fu_909_p1));

assign icmp_ln147_fu_732_p2 = ((indvar_flatten17_reg_606 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_744_p2 = ((indvar_flatten_reg_629 == 5'd12) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = tmp_115_fu_959_p1;

assign ifmap_vec_1_address0 = tmp_115_fu_959_p1;

assign ifmap_vec_2_address0 = tmp_115_fu_959_p1;

assign ifmap_vec_3_address0 = tmp_115_fu_959_p1;

assign lshr_ln153_6_fu_1018_p3 = {{select_ln148_11_reg_1134_pp0_iter7_reg}, {tmp_s_fu_1008_p4}};

assign lshr_ln153_7_fu_1048_p3 = {{select_ln148_11_reg_1134_pp0_iter7_reg}, {tmp_36_fu_1038_p4}};

assign lshr_ln153_8_fu_1078_p3 = {{select_ln148_11_reg_1134_pp0_iter7_reg}, {tmp_37_fu_1068_p4}};

assign lshr_ln_fu_989_p3 = {{select_ln148_11_reg_1134_pp0_iter7_reg}, {newIndex_reg_1149_pp0_iter7_reg}};

assign newIndex_fu_941_p4 = {{select_ln148_fu_893_p3[3:2]}};

assign or_ln147_fu_882_p2 = (xor_ln149_fu_876_p2 | icmp_ln148_reg_1108);

assign or_ln150_3_fu_1033_p2 = (trunc_ln149_reg_1142_pp0_iter7_reg | 4'd2);

assign or_ln150_4_fu_1063_p2 = (trunc_ln149_reg_1142_pp0_iter7_reg | 4'd3);

assign or_ln150_fu_1003_p2 = (trunc_ln149_reg_1142_pp0_iter7_reg | 4'd1);

assign products_0_0_address0 = zext_ln153_fu_995_p1;

assign products_0_0_d0 = mul_reg_1371;

assign products_0_1_address0 = zext_ln153_6_fu_1025_p1;

assign products_0_1_d0 = mul27_1_reg_1391;

assign products_0_2_address0 = zext_ln153_7_fu_1055_p1;

assign products_0_2_d0 = mul27_2_reg_1411;

assign products_0_3_address0 = zext_ln153_8_fu_1085_p1;

assign products_0_3_d0 = mul27_3_reg_1431;

assign products_1_0_address0 = zext_ln153_fu_995_p1;

assign products_1_0_d0 = mul_1_reg_1376;

assign products_1_1_address0 = zext_ln153_6_fu_1025_p1;

assign products_1_1_d0 = mul27_1_1_reg_1396;

assign products_1_2_address0 = zext_ln153_7_fu_1055_p1;

assign products_1_2_d0 = mul27_2_1_reg_1416;

assign products_1_3_address0 = zext_ln153_8_fu_1085_p1;

assign products_1_3_d0 = mul27_3_1_reg_1436;

assign products_2_0_address0 = zext_ln153_fu_995_p1;

assign products_2_0_d0 = mul_2_reg_1381;

assign products_2_1_address0 = zext_ln153_6_fu_1025_p1;

assign products_2_1_d0 = mul27_1_2_reg_1401;

assign products_2_2_address0 = zext_ln153_7_fu_1055_p1;

assign products_2_2_d0 = mul27_2_2_reg_1421;

assign products_2_3_address0 = zext_ln153_8_fu_1085_p1;

assign products_2_3_d0 = mul27_3_2_reg_1441;

assign products_3_0_address0 = zext_ln153_fu_995_p1;

assign products_3_0_d0 = mul_3_reg_1386;

assign products_3_1_address0 = zext_ln153_6_fu_1025_p1;

assign products_3_1_d0 = mul27_1_3_reg_1406;

assign products_3_2_address0 = zext_ln153_7_fu_1055_p1;

assign products_3_2_d0 = mul27_2_3_reg_1426;

assign products_3_3_address0 = zext_ln153_8_fu_1085_p1;

assign products_3_3_d0 = mul27_3_3_reg_1446;

assign select_ln147_14_fu_807_p3 = ((icmp_ln148_reg_1108[0:0] == 1'b1) ? 5'd0 : ic_reg_651);

assign select_ln147_15_fu_750_p3 = ((icmp_ln148_fu_744_p2[0:0] == 1'b1) ? add_ln147_fu_738_p2 : ap_phi_mux_ii_phi_fu_621_p4);

assign select_ln147_16_fu_854_p3 = ((icmp_ln148_reg_1108[0:0] == 1'b1) ? sub_ln150_4_fu_848_p2 : sub_ln150_fu_784_p2);

assign select_ln147_17_fu_861_p3 = ((icmp_ln148_reg_1108[0:0] == 1'b1) ? sub_ln150_4_fu_848_p2 : add_ln150_fu_794_p2);

assign select_ln147_18_cast_fu_814_p1 = select_ln147_15_reg_1117;

assign select_ln147_fu_800_p3 = ((icmp_ln148_reg_1108[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_644_p4);

assign select_ln148_10_fu_901_p3 = ((or_ln147_fu_882_p2[0:0] == 1'b1) ? select_ln147_fu_800_p3 : add_ln148_fu_887_p2);

assign select_ln148_11_fu_929_p3 = ((or_ln147_fu_882_p2[0:0] == 1'b1) ? select_ln147_17_fu_861_p3 : add_ln150_4_fu_923_p2);

assign select_ln148_12_fu_764_p3 = ((icmp_ln148_fu_744_p2[0:0] == 1'b1) ? 5'd1 : add_ln148_4_fu_758_p2);

assign select_ln148_13_cast_fu_909_p1 = select_ln148_10_fu_901_p3;

assign select_ln148_fu_893_p3 = ((or_ln147_fu_882_p2[0:0] == 1'b1) ? select_ln147_14_fu_807_p3 : 5'd0);

assign sext_ln150_fu_834_p1 = (empty_111_fu_828_p2);

assign shl_ln150_mid1_fu_841_p3 = {{add_ln147_reg_1102}, {2'd0}};

assign shl_ln_fu_776_p3 = {{ii_reg_617}, {2'd0}};

assign sub_ln150_4_fu_848_p2 = (shl_ln150_mid1_fu_841_p3 - zext_ln150_8_fu_838_p1);

assign sub_ln150_fu_784_p2 = (shl_ln_fu_776_p3 - zext_ln150_fu_772_p1);

assign tmp_115_fu_959_p1 = (tmp_58_fu_951_p3);

assign tmp_36_fu_1038_p4 = {{or_ln150_3_fu_1033_p2[3:2]}};

assign tmp_37_fu_1068_p4 = {{or_ln150_4_fu_1063_p2[3:2]}};

assign tmp_57_fu_868_p3 = ic_reg_651[32'd4];

assign tmp_58_fu_951_p3 = {{empty_112_fu_913_p2}, {newIndex_fu_941_p4}};

assign tmp_cast_fu_824_p1 = tmp_fu_817_p3;

assign tmp_fu_817_p3 = {{select_ln147_15_reg_1117}, {2'd0}};

assign tmp_s_fu_1008_p4 = {{or_ln150_fu_1003_p2[3:2]}};

assign trunc_ln149_fu_937_p1 = select_ln148_fu_893_p3[3:0];

assign weight_vecs_0_0_address0 = tmp_115_fu_959_p1;

assign weight_vecs_0_1_address0 = tmp_115_fu_959_p1;

assign weight_vecs_0_2_address0 = tmp_115_fu_959_p1;

assign weight_vecs_0_3_address0 = tmp_115_fu_959_p1;

assign weight_vecs_1_0_address0 = tmp_115_fu_959_p1;

assign weight_vecs_1_1_address0 = tmp_115_fu_959_p1;

assign weight_vecs_1_2_address0 = tmp_115_fu_959_p1;

assign weight_vecs_1_3_address0 = tmp_115_fu_959_p1;

assign weight_vecs_2_0_address0 = tmp_115_fu_959_p1;

assign weight_vecs_2_1_address0 = tmp_115_fu_959_p1;

assign weight_vecs_2_2_address0 = tmp_115_fu_959_p1;

assign weight_vecs_2_3_address0 = tmp_115_fu_959_p1;

assign weight_vecs_3_0_address0 = tmp_115_fu_959_p1;

assign weight_vecs_3_1_address0 = tmp_115_fu_959_p1;

assign weight_vecs_3_2_address0 = tmp_115_fu_959_p1;

assign weight_vecs_3_3_address0 = tmp_115_fu_959_p1;

assign xor_ln149_fu_876_p2 = (tmp_57_fu_868_p3 ^ 1'd1);

assign zext_ln150_4_fu_790_p1 = ap_phi_mux_jj_phi_fu_644_p4;

assign zext_ln150_8_fu_838_p1 = add_ln147_reg_1102;

assign zext_ln150_9_fu_919_p1 = add_ln148_fu_887_p2;

assign zext_ln150_fu_772_p1 = ii_reg_617;

assign zext_ln153_6_fu_1025_p1 = lshr_ln153_6_fu_1018_p3;

assign zext_ln153_7_fu_1055_p1 = lshr_ln153_7_fu_1048_p3;

assign zext_ln153_8_fu_1085_p1 = lshr_ln153_8_fu_1078_p3;

assign zext_ln153_fu_995_p1 = lshr_ln_fu_989_p3;

endmodule //td_fused_top_tdf4_dot_product
module td_fused_top_tdf4_readFilters36 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        filter_data_0_address0,
        filter_data_0_ce0,
        filter_data_0_q0,
        filter_data_1_address0,
        filter_data_1_ce0,
        filter_data_1_q0,
        filter_data_2_address0,
        filter_data_2_ce0,
        filter_data_2_q0,
        filter_data_3_address0,
        filter_data_3_ce0,
        filter_data_3_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_0_address0,
        weight_vecs_0_0_ce0,
        weight_vecs_0_0_we0,
        weight_vecs_0_0_d0,
        weight_vecs_0_1_address0,
        weight_vecs_0_1_ce0,
        weight_vecs_0_1_we0,
        weight_vecs_0_1_d0,
        weight_vecs_0_2_address0,
        weight_vecs_0_2_ce0,
        weight_vecs_0_2_we0,
        weight_vecs_0_2_d0,
        weight_vecs_0_3_address0,
        weight_vecs_0_3_ce0,
        weight_vecs_0_3_we0,
        weight_vecs_0_3_d0,
        weight_vecs_1_0_address0,
        weight_vecs_1_0_ce0,
        weight_vecs_1_0_we0,
        weight_vecs_1_0_d0,
        weight_vecs_1_1_address0,
        weight_vecs_1_1_ce0,
        weight_vecs_1_1_we0,
        weight_vecs_1_1_d0,
        weight_vecs_1_2_address0,
        weight_vecs_1_2_ce0,
        weight_vecs_1_2_we0,
        weight_vecs_1_2_d0,
        weight_vecs_1_3_address0,
        weight_vecs_1_3_ce0,
        weight_vecs_1_3_we0,
        weight_vecs_1_3_d0,
        weight_vecs_2_0_address0,
        weight_vecs_2_0_ce0,
        weight_vecs_2_0_we0,
        weight_vecs_2_0_d0,
        weight_vecs_2_1_address0,
        weight_vecs_2_1_ce0,
        weight_vecs_2_1_we0,
        weight_vecs_2_1_d0,
        weight_vecs_2_2_address0,
        weight_vecs_2_2_ce0,
        weight_vecs_2_2_we0,
        weight_vecs_2_2_d0,
        weight_vecs_2_3_address0,
        weight_vecs_2_3_ce0,
        weight_vecs_2_3_we0,
        weight_vecs_2_3_d0,
        weight_vecs_3_0_address0,
        weight_vecs_3_0_ce0,
        weight_vecs_3_0_we0,
        weight_vecs_3_0_d0,
        weight_vecs_3_1_address0,
        weight_vecs_3_1_ce0,
        weight_vecs_3_1_we0,
        weight_vecs_3_1_d0,
        weight_vecs_3_2_address0,
        weight_vecs_3_2_ce0,
        weight_vecs_3_2_we0,
        weight_vecs_3_2_d0,
        weight_vecs_3_3_address0,
        weight_vecs_3_3_ce0,
        weight_vecs_3_3_we0,
        weight_vecs_3_3_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state5 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [10:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [63:0] filter_data_0_q0;
output  [10:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [63:0] filter_data_1_q0;
output  [10:0] filter_data_2_address0;
output   filter_data_2_ce0;
input  [63:0] filter_data_2_q0;
output  [10:0] filter_data_3_address0;
output   filter_data_3_ce0;
input  [63:0] filter_data_3_q0;
input  [4:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [5:0] weight_vecs_0_0_address0;
output   weight_vecs_0_0_ce0;
output   weight_vecs_0_0_we0;
output  [15:0] weight_vecs_0_0_d0;
output  [5:0] weight_vecs_0_1_address0;
output   weight_vecs_0_1_ce0;
output   weight_vecs_0_1_we0;
output  [15:0] weight_vecs_0_1_d0;
output  [5:0] weight_vecs_0_2_address0;
output   weight_vecs_0_2_ce0;
output   weight_vecs_0_2_we0;
output  [15:0] weight_vecs_0_2_d0;
output  [5:0] weight_vecs_0_3_address0;
output   weight_vecs_0_3_ce0;
output   weight_vecs_0_3_we0;
output  [15:0] weight_vecs_0_3_d0;
output  [5:0] weight_vecs_1_0_address0;
output   weight_vecs_1_0_ce0;
output   weight_vecs_1_0_we0;
output  [15:0] weight_vecs_1_0_d0;
output  [5:0] weight_vecs_1_1_address0;
output   weight_vecs_1_1_ce0;
output   weight_vecs_1_1_we0;
output  [15:0] weight_vecs_1_1_d0;
output  [5:0] weight_vecs_1_2_address0;
output   weight_vecs_1_2_ce0;
output   weight_vecs_1_2_we0;
output  [15:0] weight_vecs_1_2_d0;
output  [5:0] weight_vecs_1_3_address0;
output   weight_vecs_1_3_ce0;
output   weight_vecs_1_3_we0;
output  [15:0] weight_vecs_1_3_d0;
output  [5:0] weight_vecs_2_0_address0;
output   weight_vecs_2_0_ce0;
output   weight_vecs_2_0_we0;
output  [15:0] weight_vecs_2_0_d0;
output  [5:0] weight_vecs_2_1_address0;
output   weight_vecs_2_1_ce0;
output   weight_vecs_2_1_we0;
output  [15:0] weight_vecs_2_1_d0;
output  [5:0] weight_vecs_2_2_address0;
output   weight_vecs_2_2_ce0;
output   weight_vecs_2_2_we0;
output  [15:0] weight_vecs_2_2_d0;
output  [5:0] weight_vecs_2_3_address0;
output   weight_vecs_2_3_ce0;
output   weight_vecs_2_3_we0;
output  [15:0] weight_vecs_2_3_d0;
output  [5:0] weight_vecs_3_0_address0;
output   weight_vecs_3_0_ce0;
output   weight_vecs_3_0_we0;
output  [15:0] weight_vecs_3_0_d0;
output  [5:0] weight_vecs_3_1_address0;
output   weight_vecs_3_1_ce0;
output   weight_vecs_3_1_we0;
output  [15:0] weight_vecs_3_1_d0;
output  [5:0] weight_vecs_3_2_address0;
output   weight_vecs_3_2_ce0;
output   weight_vecs_3_2_we0;
output  [15:0] weight_vecs_3_2_d0;
output  [5:0] weight_vecs_3_3_address0;
output   weight_vecs_3_3_ce0;
output   weight_vecs_3_3_we0;
output  [15:0] weight_vecs_3_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg filter_data_2_ce0;
reg filter_data_3_ce0;
reg indices_23_read;
reg weight_vecs_0_0_ce0;
reg weight_vecs_0_0_we0;
reg weight_vecs_0_1_ce0;
reg weight_vecs_0_1_we0;
reg weight_vecs_0_2_ce0;
reg weight_vecs_0_2_we0;
reg weight_vecs_0_3_ce0;
reg weight_vecs_0_3_we0;
reg weight_vecs_1_0_ce0;
reg weight_vecs_1_0_we0;
reg weight_vecs_1_1_ce0;
reg weight_vecs_1_1_we0;
reg weight_vecs_1_2_ce0;
reg weight_vecs_1_2_we0;
reg weight_vecs_1_3_ce0;
reg weight_vecs_1_3_we0;
reg weight_vecs_2_0_ce0;
reg weight_vecs_2_0_we0;
reg weight_vecs_2_1_ce0;
reg weight_vecs_2_1_we0;
reg weight_vecs_2_2_ce0;
reg weight_vecs_2_2_we0;
reg weight_vecs_2_3_ce0;
reg weight_vecs_2_3_we0;
reg weight_vecs_3_0_ce0;
reg weight_vecs_3_0_we0;
reg weight_vecs_3_1_ce0;
reg weight_vecs_3_1_we0;
reg weight_vecs_3_2_ce0;
reg weight_vecs_3_2_we0;
reg weight_vecs_3_3_ce0;
reg weight_vecs_3_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [5:0] indvar_flatten13_reg_412;
reg   [1:0] ii_reg_423;
reg   [4:0] indvar_flatten_reg_434;
reg   [1:0] jj_reg_445;
reg   [4:0] kk_reg_456;
wire   [8:0] sext_ln47_fu_489_p1;
reg   [8:0] sext_ln47_reg_993;
wire   [5:0] add_ln47_4_fu_493_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_499_p2;
reg   [0:0] icmp_ln47_reg_1003;
reg   [0:0] icmp_ln47_reg_1003_pp0_iter1_reg;
wire   [1:0] select_ln47_8_fu_533_p3;
reg   [1:0] select_ln47_8_reg_1007;
wire   [8:0] add_ln55_fu_545_p2;
reg   [8:0] add_ln55_reg_1014;
wire   [1:0] select_ln48_7_fu_584_p3;
reg   [1:0] select_ln48_7_reg_1020;
reg   [1:0] lshr_ln_reg_1027;
reg   [1:0] lshr_ln_reg_1027_pp0_iter1_reg;
wire   [4:0] add_ln49_fu_602_p2;
wire   [4:0] select_ln48_8_fu_614_p3;
wire   [5:0] add_ln55_8_fu_678_p2;
reg   [5:0] add_ln55_8_reg_1043;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg   [1:0] ap_phi_mux_ii_phi_fu_427_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_449_p4;
wire   [63:0] tmp_31_fu_684_p3;
wire   [63:0] sext_ln55_8_fu_701_p1;
wire   [6:0] tmp_29_fu_471_p3;
wire   [7:0] zext_ln55_21_fu_479_p1;
wire   [7:0] zext_ln55_fu_467_p1;
wire   [7:0] sub_ln55_fu_483_p2;
wire   [0:0] icmp_ln48_fu_511_p2;
wire   [1:0] add_ln47_fu_505_p2;
wire   [8:0] zext_ln55_23_fu_541_p1;
wire   [0:0] tmp_52_fu_550_p3;
wire   [0:0] xor_ln49_fu_558_p2;
wire   [1:0] select_ln47_fu_517_p3;
wire   [0:0] or_ln47_fu_564_p2;
wire   [4:0] select_ln47_7_fu_525_p3;
wire   [1:0] add_ln48_fu_570_p2;
wire   [4:0] select_ln48_fu_576_p3;
wire   [4:0] add_ln48_4_fu_608_p2;
wire   [10:0] tmp_51_fu_628_p3;
wire   [61:0] sext_ln55_7_fu_635_p1;
wire   [61:0] sext_ln55_fu_625_p1;
wire   [3:0] tmp_30_fu_645_p3;
wire   [4:0] zext_ln55_24_fu_652_p1;
wire   [4:0] zext_ln55_22_fu_622_p1;
wire   [4:0] sub_ln55_8_fu_656_p2;
wire   [61:0] sub_ln55_7_fu_639_p2;
wire   [61:0] zext_ln55_26_fu_669_p1;
wire   [5:0] sext_ln48_fu_662_p1;
wire   [5:0] zext_ln55_25_fu_666_p1;
wire   [61:0] add_ln55_7_fu_672_p2;
wire   [7:0] tmp_53_fu_695_p3;
wire   [63:0] tmp_fu_721_p6;
wire   [15:0] trunc_ln55_fu_735_p1;
wire   [63:0] tmp_s_fu_744_p6;
wire   [15:0] trunc_ln55_10_fu_758_p1;
wire   [63:0] tmp_1_fu_767_p6;
wire   [15:0] trunc_ln55_11_fu_781_p1;
wire   [63:0] tmp_2_fu_790_p6;
wire   [15:0] trunc_ln55_12_fu_804_p1;
wire   [15:0] tmp_155_i_i_fu_813_p4;
wire   [15:0] tmp_157_i_i_fu_828_p4;
wire   [15:0] tmp_159_i_i_fu_843_p4;
wire   [15:0] tmp_161_i_i_fu_858_p4;
wire   [15:0] tmp_163_i_i_fu_873_p4;
wire   [15:0] tmp_165_i_i_fu_888_p4;
wire   [15:0] tmp_167_i_i_fu_903_p4;
wire   [15:0] tmp_169_i_i_fu_918_p4;
wire   [15:0] tmp_171_i_i_fu_933_p4;
wire   [15:0] tmp_173_i_i_fu_948_p4;
wire   [15:0] tmp_175_i_i_fu_963_p4;
wire   [15:0] tmp_177_i_i_fu_978_p4;
wire    ap_CS_fsm_state5;
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
end

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U450(
    .din0(filter_data_0_q0),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_fu_721_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U451(
    .din0(filter_data_1_q0),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_s_fu_744_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U452(
    .din0(filter_data_2_q0),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_1_fu_767_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U453(
    .din0(filter_data_3_q0),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_2_fu_790_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state5)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_1003 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_423 <= select_ln47_8_reg_1007;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_423 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten13_reg_412 <= add_ln47_4_fu_493_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_412 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_434 <= select_ln48_8_fu_614_p3;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_434 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_1003 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_445 <= select_ln48_7_reg_1020;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_445 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_reg_456 <= add_ln49_fu_602_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_456 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_1003 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_8_reg_1043 <= add_ln55_8_fu_678_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_reg_1014 <= add_ln55_fu_545_p2;
        lshr_ln_reg_1027 <= {{select_ln48_fu_576_p3[3:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln47_reg_1003 <= icmp_ln47_fu_499_p2;
        icmp_ln47_reg_1003_pp0_iter1_reg <= icmp_ln47_reg_1003;
        lshr_ln_reg_1027_pp0_iter1_reg <= lshr_ln_reg_1027;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln47_8_reg_1007 <= select_ln47_8_fu_533_p3;
        select_ln48_7_reg_1020 <= select_ln48_7_fu_584_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_993 <= sext_ln47_fu_489_p1;
    end
end

always @ (*) begin
    if ((icmp_ln47_fu_499_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_1003 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_427_p4 = select_ln47_8_reg_1007;
    end else begin
        ap_phi_mux_ii_phi_fu_427_p4 = ii_reg_423;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_1003 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_449_p4 = select_ln48_7_reg_1020;
    end else begin
        ap_phi_mux_jj_phi_fu_449_p4 = jj_reg_445;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_2_ce0 = 1'b1;
    end else begin
        filter_data_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_3_ce0 = 1'b1;
    end else begin
        filter_data_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_blk_n = indices_23_empty_n;
    end else begin
        indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_we0 = 1'b1;
    end else begin
        weight_vecs_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_2_ce0 = 1'b1;
    end else begin
        weight_vecs_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_2_we0 = 1'b1;
    end else begin
        weight_vecs_0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_3_ce0 = 1'b1;
    end else begin
        weight_vecs_0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_3_we0 = 1'b1;
    end else begin
        weight_vecs_0_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_we0 = 1'b1;
    end else begin
        weight_vecs_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_2_ce0 = 1'b1;
    end else begin
        weight_vecs_1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_2_we0 = 1'b1;
    end else begin
        weight_vecs_1_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_3_ce0 = 1'b1;
    end else begin
        weight_vecs_1_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_3_we0 = 1'b1;
    end else begin
        weight_vecs_1_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_ce0 = 1'b1;
    end else begin
        weight_vecs_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_we0 = 1'b1;
    end else begin
        weight_vecs_2_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_ce0 = 1'b1;
    end else begin
        weight_vecs_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_we0 = 1'b1;
    end else begin
        weight_vecs_2_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_2_we0 = 1'b1;
    end else begin
        weight_vecs_2_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_3_ce0 = 1'b1;
    end else begin
        weight_vecs_2_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_3_we0 = 1'b1;
    end else begin
        weight_vecs_2_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_ce0 = 1'b1;
    end else begin
        weight_vecs_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_we0 = 1'b1;
    end else begin
        weight_vecs_3_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_ce0 = 1'b1;
    end else begin
        weight_vecs_3_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_we0 = 1'b1;
    end else begin
        weight_vecs_3_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_2_ce0 = 1'b1;
    end else begin
        weight_vecs_3_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_2_we0 = 1'b1;
    end else begin
        weight_vecs_3_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_1003_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_3_we0 = 1'b1;
    end else begin
        weight_vecs_3_3_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_499_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_499_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln47_4_fu_493_p2 = (indvar_flatten13_reg_412 + 6'd1);

assign add_ln47_fu_505_p2 = (ap_phi_mux_ii_phi_fu_427_p4 + 2'd1);

assign add_ln48_4_fu_608_p2 = (indvar_flatten_reg_434 + 5'd1);

assign add_ln48_fu_570_p2 = (select_ln47_fu_517_p3 + 2'd1);

assign add_ln49_fu_602_p2 = (select_ln48_fu_576_p3 + 5'd4);

assign add_ln55_7_fu_672_p2 = (sub_ln55_7_fu_639_p2 + zext_ln55_26_fu_669_p1);

assign add_ln55_8_fu_678_p2 = ((sext_ln48_fu_662_p1) + (zext_ln55_25_fu_666_p1));

assign add_ln55_fu_545_p2 = ((sext_ln47_reg_993) + (zext_ln55_23_fu_541_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = tmp_31_fu_684_p3;

assign filter_data_1_address0 = tmp_31_fu_684_p3;

assign filter_data_2_address0 = tmp_31_fu_684_p3;

assign filter_data_3_address0 = tmp_31_fu_684_p3;

assign icmp_ln47_fu_499_p2 = ((indvar_flatten13_reg_412 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_511_p2 = ((indvar_flatten_reg_434 == 5'd12) ? 1'b1 : 1'b0);

assign or_ln47_fu_564_p2 = (xor_ln49_fu_558_p2 | icmp_ln48_fu_511_p2);

assign select_ln47_7_fu_525_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_456);

assign select_ln47_8_fu_533_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? add_ln47_fu_505_p2 : ap_phi_mux_ii_phi_fu_427_p4);

assign select_ln47_fu_517_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_449_p4);

assign select_ln48_7_fu_584_p3 = ((or_ln47_fu_564_p2[0:0] == 1'b1) ? select_ln47_fu_517_p3 : add_ln48_fu_570_p2);

assign select_ln48_8_fu_614_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 5'd1 : add_ln48_4_fu_608_p2);

assign select_ln48_fu_576_p3 = ((or_ln47_fu_564_p2[0:0] == 1'b1) ? select_ln47_7_fu_525_p3 : 5'd0);

assign sext_ln47_fu_489_p1 = (sub_ln55_fu_483_p2);

assign sext_ln48_fu_662_p1 = (sub_ln55_8_fu_656_p2);

assign sext_ln55_7_fu_635_p1 = (tmp_51_fu_628_p3);

assign sext_ln55_8_fu_701_p1 = (tmp_53_fu_695_p3);

assign sext_ln55_fu_625_p1 = add_ln55_reg_1014;

assign sub_ln55_7_fu_639_p2 = ((sext_ln55_7_fu_635_p1) - (sext_ln55_fu_625_p1));

assign sub_ln55_8_fu_656_p2 = (zext_ln55_24_fu_652_p1 - zext_ln55_22_fu_622_p1);

assign sub_ln55_fu_483_p2 = (zext_ln55_21_fu_479_p1 - zext_ln55_fu_467_p1);

assign tmp_155_i_i_fu_813_p4 = {{tmp_fu_721_p6[31:16]}};

assign tmp_157_i_i_fu_828_p4 = {{tmp_s_fu_744_p6[31:16]}};

assign tmp_159_i_i_fu_843_p4 = {{tmp_1_fu_767_p6[31:16]}};

assign tmp_161_i_i_fu_858_p4 = {{tmp_2_fu_790_p6[31:16]}};

assign tmp_163_i_i_fu_873_p4 = {{tmp_fu_721_p6[47:32]}};

assign tmp_165_i_i_fu_888_p4 = {{tmp_s_fu_744_p6[47:32]}};

assign tmp_167_i_i_fu_903_p4 = {{tmp_1_fu_767_p6[47:32]}};

assign tmp_169_i_i_fu_918_p4 = {{tmp_2_fu_790_p6[47:32]}};

assign tmp_171_i_i_fu_933_p4 = {{tmp_fu_721_p6[63:48]}};

assign tmp_173_i_i_fu_948_p4 = {{tmp_s_fu_744_p6[63:48]}};

assign tmp_175_i_i_fu_963_p4 = {{tmp_1_fu_767_p6[63:48]}};

assign tmp_177_i_i_fu_978_p4 = {{tmp_2_fu_790_p6[63:48]}};

assign tmp_29_fu_471_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_30_fu_645_p3 = {{select_ln47_8_reg_1007}, {2'd0}};

assign tmp_31_fu_684_p3 = {{add_ln55_7_fu_672_p2}, {lshr_ln_reg_1027}};

assign tmp_51_fu_628_p3 = {{add_ln55_reg_1014}, {2'd0}};

assign tmp_52_fu_550_p3 = kk_reg_456[32'd4];

assign tmp_53_fu_695_p3 = {{add_ln55_8_reg_1043}, {lshr_ln_reg_1027_pp0_iter1_reg}};

assign trunc_ln55_10_fu_758_p1 = tmp_s_fu_744_p6[15:0];

assign trunc_ln55_11_fu_781_p1 = tmp_1_fu_767_p6[15:0];

assign trunc_ln55_12_fu_804_p1 = tmp_2_fu_790_p6[15:0];

assign trunc_ln55_fu_735_p1 = tmp_fu_721_p6[15:0];

assign weight_vecs_0_0_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_0_0_d0 = trunc_ln55_fu_735_p1;

assign weight_vecs_0_1_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_0_1_d0 = tmp_155_i_i_fu_813_p4;

assign weight_vecs_0_2_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_0_2_d0 = tmp_163_i_i_fu_873_p4;

assign weight_vecs_0_3_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_0_3_d0 = tmp_171_i_i_fu_933_p4;

assign weight_vecs_1_0_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_1_0_d0 = trunc_ln55_10_fu_758_p1;

assign weight_vecs_1_1_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_1_1_d0 = tmp_157_i_i_fu_828_p4;

assign weight_vecs_1_2_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_1_2_d0 = tmp_165_i_i_fu_888_p4;

assign weight_vecs_1_3_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_1_3_d0 = tmp_173_i_i_fu_948_p4;

assign weight_vecs_2_0_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_2_0_d0 = trunc_ln55_11_fu_781_p1;

assign weight_vecs_2_1_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_2_1_d0 = tmp_159_i_i_fu_843_p4;

assign weight_vecs_2_2_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_2_2_d0 = tmp_167_i_i_fu_903_p4;

assign weight_vecs_2_3_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_2_3_d0 = tmp_175_i_i_fu_963_p4;

assign weight_vecs_3_0_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_3_0_d0 = trunc_ln55_12_fu_804_p1;

assign weight_vecs_3_1_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_3_1_d0 = tmp_161_i_i_fu_858_p4;

assign weight_vecs_3_2_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_3_2_d0 = tmp_169_i_i_fu_918_p4;

assign weight_vecs_3_3_address0 = sext_ln55_8_fu_701_p1;

assign weight_vecs_3_3_d0 = tmp_177_i_i_fu_978_p4;

assign xor_ln49_fu_558_p2 = (tmp_52_fu_550_p3 ^ 1'd1);

assign zext_ln55_21_fu_479_p1 = tmp_29_fu_471_p3;

assign zext_ln55_22_fu_622_p1 = select_ln47_8_reg_1007;

assign zext_ln55_23_fu_541_p1 = select_ln47_8_fu_533_p3;

assign zext_ln55_24_fu_652_p1 = tmp_30_fu_645_p3;

assign zext_ln55_25_fu_666_p1 = select_ln48_7_reg_1020;

assign zext_ln55_26_fu_669_p1 = select_ln48_7_reg_1020;

assign zext_ln55_fu_467_p1 = indices_23_dout;

endmodule //td_fused_top_tdf4_readFilters36
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
        ifmap_vec_0_address0,
        ifmap_vec_0_ce0,
        ifmap_vec_0_we0,
        ifmap_vec_0_d0,
        ifmap_vec_1_address0,
        ifmap_vec_1_ce0,
        ifmap_vec_1_we0,
        ifmap_vec_1_d0,
        ifmap_vec_2_address0,
        ifmap_vec_2_ce0,
        ifmap_vec_2_we0,
        ifmap_vec_2_d0,
        ifmap_vec_3_address0,
        ifmap_vec_3_ce0,
        ifmap_vec_3_we0,
        ifmap_vec_3_d0,
        indices_01_out_din,
        indices_01_out_full_n,
        indices_01_out_write,
        indices_12_out_din,
        indices_12_out_full_n,
        indices_12_out_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state7 = 4'd8;

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
output  [5:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
output   ifmap_vec_0_we0;
output  [15:0] ifmap_vec_0_d0;
output  [5:0] ifmap_vec_1_address0;
output   ifmap_vec_1_ce0;
output   ifmap_vec_1_we0;
output  [15:0] ifmap_vec_1_d0;
output  [5:0] ifmap_vec_2_address0;
output   ifmap_vec_2_ce0;
output   ifmap_vec_2_we0;
output  [15:0] ifmap_vec_2_d0;
output  [5:0] ifmap_vec_3_address0;
output   ifmap_vec_3_ce0;
output   ifmap_vec_3_we0;
output  [15:0] ifmap_vec_3_d0;
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
reg ifmap_vec_0_ce0;
reg ifmap_vec_0_we0;
reg ifmap_vec_1_ce0;
reg ifmap_vec_1_we0;
reg ifmap_vec_2_ce0;
reg ifmap_vec_2_we0;
reg ifmap_vec_3_ce0;
reg ifmap_vec_3_we0;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [5:0] indvar_flatten47_reg_231;
reg   [1:0] ii_reg_242;
reg   [4:0] indvar_flatten_reg_254;
reg   [1:0] jj_reg_265;
reg   [4:0] kk_reg_277;
reg   [15:0] indices_01_read_reg_909;
wire   [5:0] trunc_ln319_fu_288_p1;
reg   [5:0] trunc_ln319_reg_914;
reg   [15:0] indices_12_read_reg_919;
wire   [11:0] empty_fu_293_p1;
reg   [11:0] empty_reg_924;
wire   [17:0] p_cast_i_i_fu_310_p1;
reg   [17:0] p_cast_i_i_reg_931;
wire    ap_CS_fsm_state2;
wire   [17:0] sext_ln22_fu_320_p1;
reg   [17:0] sext_ln22_reg_937;
wire   [5:0] p_cast_fu_324_p2;
reg   [5:0] p_cast_reg_943;
wire   [0:0] or_ln23_16_fu_343_p2;
reg   [0:0] or_ln23_16_reg_949;
wire   [11:0] p_mid137_fu_349_p2;
reg   [11:0] p_mid137_reg_954;
wire   [5:0] add_ln19_4_fu_354_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_state6_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] empty_107_fu_369_p2;
reg   [0:0] empty_107_reg_964;
wire   [0:0] is_padding_fu_404_p2;
reg   [0:0] is_padding_reg_969;
wire   [0:0] icmp_ln19_fu_410_p2;
reg   [0:0] icmp_ln19_reg_976;
reg   [0:0] icmp_ln19_reg_976_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_976_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_416_p2;
reg   [1:0] add_ln19_reg_980;
wire   [0:0] icmp_ln20_fu_422_p2;
reg   [0:0] icmp_ln20_reg_985;
wire   [1:0] select_ln19_23_fu_444_p3;
reg   [1:0] select_ln19_23_reg_994;
wire   [0:0] p_mid113_fu_461_p2;
reg   [0:0] p_mid113_reg_1001;
wire   [0:0] or_ln19_fu_481_p2;
reg   [0:0] or_ln19_reg_1007;
reg   [0:0] or_ln19_reg_1007_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_487_p2;
reg   [1:0] add_ln20_reg_1014;
wire   [1:0] select_ln20_16_fu_501_p3;
reg   [1:0] select_ln20_16_reg_1019;
wire   [17:0] add_ln22_5_fu_513_p2;
reg   [17:0] add_ln22_5_reg_1025;
reg   [1:0] lshr_ln_reg_1031;
reg   [1:0] lshr_ln_reg_1031_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_1031_pp0_iter2_reg;
wire   [4:0] add_ln25_fu_528_p2;
wire   [4:0] select_ln20_20_fu_540_p3;
wire   [11:0] select_ln19_28_fu_666_p3;
reg   [11:0] select_ln19_28_reg_1047;
wire   [5:0] add_ln33_fu_676_p2;
reg   [5:0] add_ln33_reg_1052;
reg   [5:0] add_ln33_reg_1052_pp0_iter2_reg;
wire   [0:0] or_ln23_20_fu_703_p2;
reg   [0:0] or_ln23_20_reg_1057;
wire   [0:0] select_ln20_17_fu_709_p3;
reg   [0:0] select_ln20_17_reg_1062;
reg   [0:0] select_ln20_17_reg_1062_pp0_iter2_reg;
wire   [11:0] p_mid1_fu_734_p2;
reg   [11:0] p_mid1_reg_1070;
wire   [12:0] sub_ln32_fu_770_p2;
reg   [12:0] sub_ln32_reg_1075;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state4;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_246_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_269_p4;
wire   [63:0] sext_ln32_fu_808_p1;
wire   [63:0] sext_ln33_fu_819_p1;
reg    ap_block_state1;
wire   [16:0] zext_ln19_fu_301_p1;
wire   [16:0] empty_105_fu_304_p2;
wire   [16:0] j_cast_i_i_fu_298_p1;
wire   [16:0] add_ln22_fu_314_p2;
wire   [0:0] tmp_45_fu_329_p3;
wire   [0:0] icmp_ln24_fu_337_p2;
wire   [17:0] ii_cast_i_i_fu_360_p1;
wire   [17:0] empty_106_fu_364_p2;
wire   [17:0] zext_ln20_fu_375_p1;
wire   [17:0] add_ln22_4_fu_379_p2;
wire   [0:0] tmp_46_fu_384_p3;
wire   [0:0] icmp_ln24_4_fu_392_p2;
wire   [0:0] or_ln23_fu_398_p2;
wire   [17:0] ii_cast_i_i_mid1_fu_452_p1;
wire   [17:0] p_mid111_fu_456_p2;
wire   [0:0] tmp_47_fu_467_p3;
wire   [0:0] xor_ln25_fu_475_p2;
wire   [1:0] select_ln19_fu_428_p3;
wire   [4:0] select_ln19_22_fu_436_p3;
wire   [17:0] zext_ln20_4_fu_509_p1;
wire   [4:0] select_ln20_fu_493_p3;
wire   [4:0] add_ln20_4_fu_534_p2;
wire   [5:0] ii_cast_fu_548_p1;
wire   [5:0] p_cast28_i_i_fu_552_p2;
wire   [2:0] zext_ln22_fu_557_p1;
wire   [2:0] tmp1_fu_568_p2;
wire   [11:0] tmp1_cast_fu_574_p1;
wire   [11:0] empty_108_fu_578_p2;
wire   [3:0] tmp_fu_593_p3;
wire   [4:0] zext_ln33_8_fu_600_p1;
wire   [4:0] zext_ln33_fu_590_p1;
wire   [4:0] sub_ln33_fu_604_p2;
wire   [5:0] ii_cast_mid1_fu_614_p1;
wire   [5:0] p_cast28_i_i_mid1_fu_617_p2;
wire   [0:0] or_ln23_18_fu_634_p2;
wire   [5:0] row_coord_int_mid131_fu_644_p3;
wire   [5:0] row_coord_int_fu_561_p3;
wire   [11:0] col_coord_int_mid139_fu_652_p3;
wire   [11:0] col_coord_int_fu_583_p3;
wire   [5:0] sub_ln33_cast_fu_610_p1;
wire   [5:0] zext_ln33_9_fu_673_p1;
wire   [0:0] tmp_48_fu_685_p3;
wire   [0:0] icmp_ln24_5_fu_692_p2;
wire   [0:0] or_ln23_19_fu_697_p2;
wire   [0:0] select_ln19_25_fu_629_p3;
wire   [0:0] select_ln19_26_fu_638_p3;
wire   [5:0] select_ln19_24_fu_622_p3;
wire   [2:0] zext_ln22_4_fu_682_p1;
wire   [2:0] tmp1_mid1_fu_724_p2;
wire   [11:0] tmp1_cast_mid1_fu_730_p1;
wire   [5:0] select_ln19_27_fu_659_p3;
wire   [5:0] row_coord_int_mid1_fu_716_p3;
wire   [5:0] select_ln20_18_fu_739_p3;
wire   [11:0] tmp_s_fu_746_p3;
wire   [8:0] tmp_28_fu_758_p3;
wire   [12:0] zext_ln32_fu_754_p1;
wire   [12:0] zext_ln32_32_fu_766_p1;
wire   [11:0] col_coord_int_mid1_fu_776_p3;
wire   [11:0] select_ln20_19_fu_785_p3;
wire   [13:0] sext_ln20_fu_782_p1;
wire   [13:0] zext_ln32_33_fu_791_p1;
wire   [13:0] add_ln32_fu_795_p2;
wire   [15:0] tmp_49_fu_801_p3;
wire   [7:0] tmp_50_fu_813_p3;
wire   [15:0] trunc_ln32_fu_827_p1;
wire   [15:0] in_data_elem_fu_831_p1;
wire   [15:0] tmp_144_i_i_fu_843_p4;
wire   [15:0] in_data_elem_6_fu_853_p1;
wire   [15:0] tmp_145_i_i_fu_865_p4;
wire   [15:0] in_data_elem_7_fu_875_p1;
wire   [15:0] tmp_146_i_i_fu_887_p4;
wire   [15:0] in_data_elem_8_fu_897_p1;
wire    ap_CS_fsm_state7;
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
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter1_state4)) begin
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
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_242 <= select_ln19_23_reg_994;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ii_reg_242 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten47_reg_231 <= add_ln19_4_fu_354_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten47_reg_231 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_254 <= select_ln20_20_fu_540_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_254 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_265 <= select_ln20_16_reg_1019;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        jj_reg_265 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_reg_277 <= add_ln25_fu_528_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_reg_277 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln19_reg_980 <= add_ln19_fu_416_p2;
        add_ln20_reg_1014 <= add_ln20_fu_487_p2;
        add_ln22_5_reg_1025 <= add_ln22_5_fu_513_p2;
        icmp_ln20_reg_985 <= icmp_ln20_fu_422_p2;
        lshr_ln_reg_1031 <= {{select_ln20_fu_493_p3[3:2]}};
        or_ln19_reg_1007 <= or_ln19_fu_481_p2;
        p_mid113_reg_1001 <= p_mid113_fu_461_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln33_reg_1052 <= add_ln33_fu_676_p2;
        or_ln23_20_reg_1057 <= or_ln23_20_fu_703_p2;
        select_ln20_17_reg_1062 <= select_ln20_17_fu_709_p3;
        sub_ln32_reg_1075[12 : 3] <= sub_ln32_fu_770_p2[12 : 3];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln33_reg_1052_pp0_iter2_reg <= add_ln33_reg_1052;
        icmp_ln19_reg_976_pp0_iter2_reg <= icmp_ln19_reg_976_pp0_iter1_reg;
        lshr_ln_reg_1031_pp0_iter2_reg <= lshr_ln_reg_1031_pp0_iter1_reg;
        select_ln20_17_reg_1062_pp0_iter2_reg <= select_ln20_17_reg_1062;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_107_reg_964 <= empty_107_fu_369_p2;
        icmp_ln19_reg_976 <= icmp_ln19_fu_410_p2;
        icmp_ln19_reg_976_pp0_iter1_reg <= icmp_ln19_reg_976;
        is_padding_reg_969 <= is_padding_fu_404_p2;
        lshr_ln_reg_1031_pp0_iter1_reg <= lshr_ln_reg_1031;
        or_ln19_reg_1007_pp0_iter1_reg <= or_ln19_reg_1007;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_924 <= empty_fu_293_p1;
        indices_01_read_reg_909 <= indices_01_dout;
        indices_12_read_reg_919 <= indices_12_dout;
        trunc_ln319_reg_914 <= trunc_ln319_fu_288_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln23_16_reg_949 <= or_ln23_16_fu_343_p2;
        p_cast_i_i_reg_931 <= p_cast_i_i_fu_310_p1;
        p_cast_reg_943 <= p_cast_fu_324_p2;
        p_mid137_reg_954 <= p_mid137_fu_349_p2;
        sext_ln22_reg_937 <= sext_ln22_fu_320_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1007 == 1'd0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_mid1_reg_1070 <= p_mid1_fu_734_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln19_23_reg_994 <= select_ln19_23_fu_444_p3;
        select_ln20_16_reg_1019 <= select_ln20_16_fu_501_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1007 == 1'd1) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln19_28_reg_1047 <= select_ln19_28_fu_666_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_246_p4 = select_ln19_23_reg_994;
    end else begin
        ap_phi_mux_ii_phi_fu_246_p4 = ii_reg_242;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_269_p4 = select_ln20_16_reg_1019;
    end else begin
        ap_phi_mux_jj_phi_fu_269_p4 = jj_reg_265;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_we0 = 1'b1;
    end else begin
        ifmap_vec_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_2_ce0 = 1'b1;
    end else begin
        ifmap_vec_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_2_we0 = 1'b1;
    end else begin
        ifmap_vec_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_3_ce0 = 1'b1;
    end else begin
        ifmap_vec_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_3_we0 = 1'b1;
    end else begin
        ifmap_vec_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_blk_n = indices_01_out_full_n;
    end else begin
        indices_01_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_write = 1'b1;
    end else begin
        indices_01_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_blk_n = indices_12_out_full_n;
    end else begin
        indices_12_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_write = 1'b1;
    end else begin
        indices_12_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)))) begin
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

assign add_ln19_4_fu_354_p2 = (indvar_flatten47_reg_231 + 6'd1);

assign add_ln19_fu_416_p2 = (ap_phi_mux_ii_phi_fu_246_p4 + 2'd1);

assign add_ln20_4_fu_534_p2 = (indvar_flatten_reg_254 + 5'd1);

assign add_ln20_fu_487_p2 = (select_ln19_fu_428_p3 + 2'd1);

assign add_ln22_4_fu_379_p2 = ((sext_ln22_reg_937) + (zext_ln20_fu_375_p1));

assign add_ln22_5_fu_513_p2 = ((sext_ln22_reg_937) + (zext_ln20_4_fu_509_p1));

assign add_ln22_fu_314_p2 = ((j_cast_i_i_fu_298_p1) + (17'd131071));

assign add_ln25_fu_528_p2 = (select_ln20_fu_493_p3 + 5'd4);

assign add_ln32_fu_795_p2 = ((sext_ln20_fu_782_p1) + (zext_ln32_33_fu_791_p1));

assign add_ln33_fu_676_p2 = ((sub_ln33_cast_fu_610_p1) + (zext_ln33_9_fu_673_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_coord_int_fu_583_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 12'd0 : empty_108_fu_578_p2);

assign col_coord_int_mid139_fu_652_p3 = ((or_ln23_18_fu_634_p2[0:0] == 1'b1) ? 12'd0 : p_mid137_reg_954);

assign col_coord_int_mid1_fu_776_p3 = ((or_ln23_20_reg_1057[0:0] == 1'b1) ? 12'd0 : p_mid1_reg_1070);

assign empty_105_fu_304_p2 = ((zext_ln19_fu_301_p1) + (17'd131071));

assign empty_106_fu_364_p2 = ((p_cast_i_i_reg_931) + (ii_cast_i_i_fu_360_p1));

assign empty_107_fu_369_p2 = ((empty_106_fu_364_p2 > 18'd55) ? 1'b1 : 1'b0);

assign empty_108_fu_578_p2 = ((tmp1_cast_fu_574_p1) + (empty_reg_924));

assign empty_fu_293_p1 = indices_12_dout[11:0];

assign icmp_ln19_fu_410_p2 = ((indvar_flatten47_reg_231 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_422_p2 = ((indvar_flatten_reg_254 == 5'd12) ? 1'b1 : 1'b0);

assign icmp_ln24_4_fu_392_p2 = (((add_ln22_4_fu_379_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_5_fu_692_p2 = (((add_ln22_5_reg_1025) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_337_p2 = (((add_ln22_fu_314_p2) > (17'd55)) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_0_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_831_p1);

assign ifmap_vec_1_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_1_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_6_fu_853_p1);

assign ifmap_vec_2_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_2_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_7_fu_875_p1);

assign ifmap_vec_3_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_3_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_8_fu_897_p1);

assign ii_cast_fu_548_p1 = ii_reg_242;

assign ii_cast_i_i_fu_360_p1 = ap_phi_mux_ii_phi_fu_246_p4;

assign ii_cast_i_i_mid1_fu_452_p1 = add_ln19_fu_416_p2;

assign ii_cast_mid1_fu_614_p1 = add_ln19_reg_980;

assign in_data_address0 = sext_ln32_fu_808_p1;

assign in_data_elem_6_fu_853_p1 = tmp_144_i_i_fu_843_p4;

assign in_data_elem_7_fu_875_p1 = tmp_145_i_i_fu_865_p4;

assign in_data_elem_8_fu_897_p1 = tmp_146_i_i_fu_887_p4;

assign in_data_elem_fu_831_p1 = trunc_ln32_fu_827_p1;

assign indices_01_out_din = indices_01_dout[5:0];

assign indices_12_out_din = indices_12_dout[11:0];

assign is_padding_fu_404_p2 = (or_ln23_fu_398_p2 | empty_107_fu_369_p2);

assign j_cast_i_i_fu_298_p1 = indices_12_read_reg_919;

assign or_ln19_fu_481_p2 = (xor_ln25_fu_475_p2 | icmp_ln20_fu_422_p2);

assign or_ln23_16_fu_343_p2 = (tmp_45_fu_329_p3 | icmp_ln24_fu_337_p2);

assign or_ln23_18_fu_634_p2 = (p_mid113_reg_1001 | or_ln23_16_reg_949);

assign or_ln23_19_fu_697_p2 = (tmp_48_fu_685_p3 | icmp_ln24_5_fu_692_p2);

assign or_ln23_20_fu_703_p2 = (select_ln19_25_fu_629_p3 | or_ln23_19_fu_697_p2);

assign or_ln23_fu_398_p2 = (tmp_46_fu_384_p3 | icmp_ln24_4_fu_392_p2);

assign p_cast28_i_i_fu_552_p2 = (p_cast_reg_943 + ii_cast_fu_548_p1);

assign p_cast28_i_i_mid1_fu_617_p2 = (p_cast_reg_943 + ii_cast_mid1_fu_614_p1);

assign p_cast_fu_324_p2 = ((trunc_ln319_reg_914) + (6'd63));

assign p_cast_i_i_fu_310_p1 = (empty_105_fu_304_p2);

assign p_mid111_fu_456_p2 = ((p_cast_i_i_reg_931) + (ii_cast_i_i_mid1_fu_452_p1));

assign p_mid113_fu_461_p2 = ((p_mid111_fu_456_p2 > 18'd55) ? 1'b1 : 1'b0);

assign p_mid137_fu_349_p2 = ((empty_reg_924) + (12'd4095));

assign p_mid1_fu_734_p2 = ((tmp1_cast_mid1_fu_730_p1) + (empty_reg_924));

assign row_coord_int_fu_561_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 6'd0 : p_cast28_i_i_fu_552_p2);

assign row_coord_int_mid131_fu_644_p3 = ((or_ln23_18_fu_634_p2[0:0] == 1'b1) ? 6'd0 : p_cast28_i_i_mid1_fu_617_p2);

assign row_coord_int_mid1_fu_716_p3 = ((or_ln23_20_fu_703_p2[0:0] == 1'b1) ? 6'd0 : select_ln19_24_fu_622_p3);

assign select_ln19_22_fu_436_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_277);

assign select_ln19_23_fu_444_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? add_ln19_fu_416_p2 : ap_phi_mux_ii_phi_fu_246_p4);

assign select_ln19_24_fu_622_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? p_cast28_i_i_mid1_fu_617_p2 : p_cast28_i_i_fu_552_p2);

assign select_ln19_25_fu_629_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? p_mid113_reg_1001 : empty_107_reg_964);

assign select_ln19_26_fu_638_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? or_ln23_18_fu_634_p2 : is_padding_reg_969);

assign select_ln19_27_fu_659_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? row_coord_int_mid131_fu_644_p3 : row_coord_int_fu_561_p3);

assign select_ln19_28_fu_666_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? col_coord_int_mid139_fu_652_p3 : col_coord_int_fu_583_p3);

assign select_ln19_fu_428_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_269_p4);

assign select_ln20_16_fu_501_p3 = ((or_ln19_fu_481_p2[0:0] == 1'b1) ? select_ln19_fu_428_p3 : add_ln20_fu_487_p2);

assign select_ln20_17_fu_709_p3 = ((or_ln19_reg_1007[0:0] == 1'b1) ? select_ln19_26_fu_638_p3 : or_ln23_20_fu_703_p2);

assign select_ln20_18_fu_739_p3 = ((or_ln19_reg_1007[0:0] == 1'b1) ? select_ln19_27_fu_659_p3 : row_coord_int_mid1_fu_716_p3);

assign select_ln20_19_fu_785_p3 = ((or_ln19_reg_1007_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_28_reg_1047 : col_coord_int_mid1_fu_776_p3);

assign select_ln20_20_fu_540_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 5'd1 : add_ln20_4_fu_534_p2);

assign select_ln20_fu_493_p3 = ((or_ln19_fu_481_p2[0:0] == 1'b1) ? select_ln19_22_fu_436_p3 : 5'd0);

assign sext_ln20_fu_782_p1 = (sub_ln32_reg_1075);

assign sext_ln22_fu_320_p1 = add_ln22_fu_314_p2;

assign sext_ln32_fu_808_p1 = (tmp_49_fu_801_p3);

assign sext_ln33_fu_819_p1 = (tmp_50_fu_813_p3);

assign sub_ln32_fu_770_p2 = (zext_ln32_fu_754_p1 - zext_ln32_32_fu_766_p1);

assign sub_ln33_cast_fu_610_p1 = (sub_ln33_fu_604_p2);

assign sub_ln33_fu_604_p2 = (zext_ln33_8_fu_600_p1 - zext_ln33_fu_590_p1);

assign tmp1_cast_fu_574_p1 = (tmp1_fu_568_p2);

assign tmp1_cast_mid1_fu_730_p1 = (tmp1_mid1_fu_724_p2);

assign tmp1_fu_568_p2 = ((zext_ln22_fu_557_p1) + (3'd7));

assign tmp1_mid1_fu_724_p2 = ((zext_ln22_4_fu_682_p1) + (3'd7));

assign tmp_144_i_i_fu_843_p4 = {{in_data_q0[31:16]}};

assign tmp_145_i_i_fu_865_p4 = {{in_data_q0[47:32]}};

assign tmp_146_i_i_fu_887_p4 = {{in_data_q0[63:48]}};

assign tmp_28_fu_758_p3 = {{select_ln20_18_fu_739_p3}, {3'd0}};

assign tmp_45_fu_329_p3 = add_ln22_fu_314_p2[32'd16];

assign tmp_46_fu_384_p3 = add_ln22_4_fu_379_p2[32'd17];

assign tmp_47_fu_467_p3 = kk_reg_277[32'd4];

assign tmp_48_fu_685_p3 = add_ln22_5_reg_1025[32'd17];

assign tmp_49_fu_801_p3 = {{add_ln32_fu_795_p2}, {lshr_ln_reg_1031_pp0_iter1_reg}};

assign tmp_50_fu_813_p3 = {{add_ln33_reg_1052_pp0_iter2_reg}, {lshr_ln_reg_1031_pp0_iter2_reg}};

assign tmp_fu_593_p3 = {{select_ln19_23_reg_994}, {2'd0}};

assign tmp_s_fu_746_p3 = {{select_ln20_18_fu_739_p3}, {6'd0}};

assign trunc_ln319_fu_288_p1 = indices_01_dout[5:0];

assign trunc_ln32_fu_827_p1 = in_data_q0[15:0];

assign xor_ln25_fu_475_p2 = (tmp_47_fu_467_p3 ^ 1'd1);

assign zext_ln19_fu_301_p1 = indices_01_read_reg_909;

assign zext_ln20_4_fu_509_p1 = add_ln20_fu_487_p2;

assign zext_ln20_fu_375_p1 = ap_phi_mux_jj_phi_fu_269_p4;

assign zext_ln22_4_fu_682_p1 = add_ln20_reg_1014;

assign zext_ln22_fu_557_p1 = jj_reg_265;

assign zext_ln32_32_fu_766_p1 = tmp_28_fu_758_p3;

assign zext_ln32_33_fu_791_p1 = select_ln20_19_fu_785_p3;

assign zext_ln32_fu_754_p1 = tmp_s_fu_746_p3;

assign zext_ln33_8_fu_600_p1 = tmp_fu_593_p3;

assign zext_ln33_9_fu_673_p1 = select_ln20_16_reg_1019;

assign zext_ln33_fu_590_p1 = select_ln19_23_reg_994;

always @ (posedge ap_clk) begin
    sub_ln32_reg_1075[2:0] <= 3'b000;
end

endmodule //td_fused_top_tdf4_readInputs37
module td_fused_top_tdf4_get_next_ijk (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        indices_0_din,
        indices_0_full_n,
        indices_0_write,
        indices_1_din,
        indices_1_full_n,
        indices_1_write,
        indices_2_out_din,
        indices_2_out_full_n,
        indices_2_out_write,
        indices_2_out1_din,
        indices_2_out1_full_n,
        indices_2_out1_write,
        write_r_din,
        write_r_full_n,
        write_r_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [15:0] indices_0_din;
input   indices_0_full_n;
output   indices_0_write;
output  [15:0] indices_1_din;
input   indices_1_full_n;
output   indices_1_write;
output  [4:0] indices_2_out_din;
input   indices_2_out_full_n;
output   indices_2_out_write;
output  [4:0] indices_2_out1_din;
input   indices_2_out1_full_n;
output   indices_2_out1_write;
output   write_r_din;
input   write_r_full_n;
output   write_r_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg indices_0_write;
reg indices_1_write;
reg indices_2_out_write;
reg indices_2_out1_write;
reg write_r_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg   [15:0] i_4;
reg   [15:0] j_4;
reg   [15:0] k_4;
reg    indices_0_blk_n;
reg    indices_1_blk_n;
reg    indices_2_out_blk_n;
reg    indices_2_out1_blk_n;
reg    write_r_blk_n;
reg   [0:0] ap_phi_mux_j_15_flag_0_i_phi_fu_90_p6;
reg    ap_block_state1;
wire   [0:0] icmp_ln257_fu_161_p2;
wire   [0:0] icmp_ln260_fu_174_p2;
reg   [15:0] ap_phi_mux_j_15_new_0_i_phi_fu_104_p6;
wire   [15:0] add_ln259_fu_167_p2;
reg   [15:0] ap_phi_mux_k_15_new_0_i_phi_fu_117_p6;
wire   [15:0] add_ln256_fu_154_p2;
wire   [15:0] select_ln263_fu_192_p3;
wire   [4:0] trunc_ln254_fu_141_p1;
wire   [15:0] add_ln262_fu_180_p2;
wire   [0:0] icmp_ln263_fu_186_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_4 = 16'd0;
#0 j_4 = 16'd0;
#0 k_4 = 16'd0;
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
        end else if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (icmp_ln260_fu_174_p2 == 1'd1) & (icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_4 <= select_ln263_fu_192_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (ap_phi_mux_j_15_flag_0_i_phi_fu_90_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_4 <= ap_phi_mux_j_15_new_0_i_phi_fu_104_p6;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        k_4 <= ap_phi_mux_k_15_new_0_i_phi_fu_117_p6;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln257_fu_161_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_90_p6 = 1'd0;
    end else if ((((icmp_ln260_fu_174_p2 == 1'd0) & (icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln260_fu_174_p2 == 1'd1) & (icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_90_p6 = 1'd1;
    end else begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_90_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln260_fu_174_p2 == 1'd0)) begin
            ap_phi_mux_j_15_new_0_i_phi_fu_104_p6 = add_ln259_fu_167_p2;
        end else if ((icmp_ln260_fu_174_p2 == 1'd1)) begin
            ap_phi_mux_j_15_new_0_i_phi_fu_104_p6 = 16'd0;
        end else begin
            ap_phi_mux_j_15_new_0_i_phi_fu_104_p6 = 'bx;
        end
    end else begin
        ap_phi_mux_j_15_new_0_i_phi_fu_104_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln257_fu_161_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_k_15_new_0_i_phi_fu_117_p6 = add_ln256_fu_154_p2;
    end else if ((((icmp_ln260_fu_174_p2 == 1'd0) & (icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln260_fu_174_p2 == 1'd1) & (icmp_ln257_fu_161_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_k_15_new_0_i_phi_fu_117_p6 = 16'd0;
    end else begin
        ap_phi_mux_k_15_new_0_i_phi_fu_117_p6 = 'bx;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_0_blk_n = indices_0_full_n;
    end else begin
        indices_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_0_write = 1'b1;
    end else begin
        indices_0_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_1_blk_n = indices_1_full_n;
    end else begin
        indices_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_1_write = 1'b1;
    end else begin
        indices_1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out1_blk_n = indices_2_out1_full_n;
    end else begin
        indices_2_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out1_write = 1'b1;
    end else begin
        indices_2_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out_blk_n = indices_2_out_full_n;
    end else begin
        indices_2_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out_write = 1'b1;
    end else begin
        indices_2_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_r_blk_n = write_r_full_n;
    end else begin
        write_r_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_r_write = 1'b1;
    end else begin
        write_r_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln256_fu_154_p2 = (k_4 + 16'd1);

assign add_ln259_fu_167_p2 = (j_4 + 16'd1);

assign add_ln262_fu_180_p2 = (i_4 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign icmp_ln257_fu_161_p2 = ((add_ln256_fu_154_p2 == 16'd32) ? 1'b1 : 1'b0);

assign icmp_ln260_fu_174_p2 = ((add_ln259_fu_167_p2 == 16'd56) ? 1'b1 : 1'b0);

assign icmp_ln263_fu_186_p2 = ((add_ln262_fu_180_p2 == 16'd56) ? 1'b1 : 1'b0);

assign indices_0_din = i_4;

assign indices_1_din = j_4;

assign indices_2_out1_din = trunc_ln254_fu_141_p1;

assign indices_2_out_din = trunc_ln254_fu_141_p1;

assign select_ln263_fu_192_p3 = ((icmp_ln263_fu_186_p2[0:0] == 1'b1) ? 16'd0 : add_ln262_fu_180_p2);

assign start_out = real_start;

assign trunc_ln254_fu_141_p1 = k_4[4:0];

assign write_r_din = ((k_4 == 16'd31) ? 1'b1 : 1'b0);

endmodule //td_fused_top_tdf4_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 2,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire                    i_we1,
    input  wire [AddressWidth-1:0] i_address1,
    input  wire [DataWidth-1:0]    i_d1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire                    t_we1,
    input  wire [AddressWidth-1:0] t_address1,
    input  wire [DataWidth-1:0]    t_d1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [BufferCount-1:0] buf_we1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_d1_0, buf_d1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore_U_0 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_0 ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .address1 ( buf_a1_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .we1      ( buf_we1[ 0 ] ),
            .d1       ( buf_d1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore_U_1 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_1 ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .address1 ( buf_a1_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .we1      ( buf_we1[ 1 ] ),
            .d1       ( buf_d1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 0 ] = (tptr ==  0  && empty_n)  ? t_we1
                             : (iptr ==  0 ) ? i_we1 : 1'b0;
        assign buf_d1_0  = (tptr ==  0  && empty_n) ? t_d1       : i_d1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 1 ] = (tptr ==  1  && empty_n)  ? t_we1
                             : (iptr ==  1 ) ? i_we1 : 1'b0;
        assign buf_d1_1  = (tptr ==  1  && empty_n) ? t_d1       : i_d1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    we1,
    d1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd4;
parameter AddressWidth = 32'd2;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_partial_sums_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 2;
parameter MEM_SIZE = 4;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
input clk;

 reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1; 
    end
end


endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 4,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire [AddressWidth-1:0] i_address1,
    output wire [DataWidth-1:0]    i_q1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire [AddressWidth-1:0] t_address1,
    output wire [DataWidth-1:0]    t_q1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_q1_0, buf_q1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore_U_0 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_0 ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .address1 ( buf_a1_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .q1       ( buf_q1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore_U_1 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_1 ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .address1 ( buf_a1_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .q1       ( buf_q1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign i_q1      = (prev_iptr == 1'b1 ? buf_q1_1 : buf_q1_0);
assign t_q1      = reg_valid1 ? reg_q1 : (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// reg_q1 and reg_valid1
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q1     <= 1'b0;
        reg_valid1 <= 1'b0;
    end else if (!t_ce1 && !reg_valid1) begin
        reg_q1     <= (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);
        reg_valid1 <= 1'b1;
    end else if (t_ce1) begin
        reg_valid1 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd16;
parameter AddressWidth = 32'd4;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_l2_products_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 4;
parameter MEM_SIZE = 16;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input clk;

 reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram[addr1];
    end
end


endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 3,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire                    i_we1,
    input  wire [AddressWidth-1:0] i_address1,
    input  wire [DataWidth-1:0]    i_d1,
    output wire [DataWidth-1:0]    i_q1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire                    t_we1,
    input  wire [AddressWidth-1:0] t_address1,
    input  wire [DataWidth-1:0]    t_d1,
    output wire [DataWidth-1:0]    t_q1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [BufferCount-1:0] buf_we1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_d1_0, buf_d1_1;
wire [DataWidth-1:0] buf_q1_0, buf_q1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore_U_0 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_0 ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .address1 ( buf_a1_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .we1      ( buf_we1[ 0 ] ),
            .d1       ( buf_d1_0 ),
            .q1       ( buf_q1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore_U_1 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_1 ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .address1 ( buf_a1_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .we1      ( buf_we1[ 1 ] ),
            .d1       ( buf_d1_1 ),
            .q1       ( buf_q1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 0 ] = (tptr ==  0  && empty_n)  ? t_we1
                             : (iptr ==  0 ) ? i_we1 : 1'b0;
        assign buf_d1_0  = (tptr ==  0  && empty_n) ? t_d1       : i_d1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 1 ] = (tptr ==  1  && empty_n)  ? t_we1
                             : (iptr ==  1 ) ? i_we1 : 1'b0;
        assign buf_d1_1  = (tptr ==  1  && empty_n) ? t_d1       : i_d1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign i_q1      = (prev_iptr == 1'b1 ? buf_q1_1 : buf_q1_0);
assign t_q1      = reg_valid1 ? reg_q1 : (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// reg_q1 and reg_valid1
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q1     <= 1'b0;
        reg_valid1 <= 1'b0;
    end else if (!t_ce1 && !reg_valid1) begin
        reg_q1     <= (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);
        reg_valid1 <= 1'b1;
    end else if (t_ce1) begin
        reg_valid1 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    we1,
    d1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd8;
parameter AddressWidth = 32'd3;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum2_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 3;
parameter MEM_SIZE = 8;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
output reg[DWIDTH-1:0] q1;
input clk;

reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1; 
        q1 <= ram[addr1];
    end
end


endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 5,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire                    i_we1,
    input  wire [AddressWidth-1:0] i_address1,
    input  wire [DataWidth-1:0]    i_d1,
    output wire [DataWidth-1:0]    i_q1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire                    t_we1,
    input  wire [AddressWidth-1:0] t_address1,
    input  wire [DataWidth-1:0]    t_d1,
    output wire [DataWidth-1:0]    t_q1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [BufferCount-1:0] buf_we1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_d1_0, buf_d1_1;
wire [DataWidth-1:0] buf_q1_0, buf_q1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore_U_0 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_0 ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .address1 ( buf_a1_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .we1      ( buf_we1[ 0 ] ),
            .d1       ( buf_d1_0 ),
            .q1       ( buf_q1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore_U_1 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_1 ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .address1 ( buf_a1_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .we1      ( buf_we1[ 1 ] ),
            .d1       ( buf_d1_1 ),
            .q1       ( buf_q1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 0 ] = (tptr ==  0  && empty_n)  ? t_we1
                             : (iptr ==  0 ) ? i_we1 : 1'b0;
        assign buf_d1_0  = (tptr ==  0  && empty_n) ? t_d1       : i_d1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 1 ] = (tptr ==  1  && empty_n)  ? t_we1
                             : (iptr ==  1 ) ? i_we1 : 1'b0;
        assign buf_d1_1  = (tptr ==  1  && empty_n) ? t_d1       : i_d1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign i_q1      = (prev_iptr == 1'b1 ? buf_q1_1 : buf_q1_0);
assign t_q1      = reg_valid1 ? reg_q1 : (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// reg_q1 and reg_valid1
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q1     <= 1'b0;
        reg_valid1 <= 1'b0;
    end else if (!t_ce1 && !reg_valid1) begin
        reg_q1     <= (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);
        reg_valid1 <= 1'b1;
    end else if (t_ce1) begin
        reg_valid1 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    we1,
    d1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd32;
parameter AddressWidth = 32'd5;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 5;
parameter MEM_SIZE = 32;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
output reg[DWIDTH-1:0] q1;
input clk;

reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1; 
        q1 <= ram[addr1];
    end
end


endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 6,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire [AddressWidth-1:0] i_address1,
    output wire [DataWidth-1:0]    i_q1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire [AddressWidth-1:0] t_address1,
    output wire [DataWidth-1:0]    t_q1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_q1_0, buf_q1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore_U_0 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_0 ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .address1 ( buf_a1_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .q1       ( buf_q1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore_U_1 (
            .reset    ( reset ),
            .clk      ( clk ),
            .address0 ( buf_a0_1 ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .address1 ( buf_a1_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .q1       ( buf_q1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign i_q1      = (prev_iptr == 1'b1 ? buf_q1_1 : buf_q1_0);
assign t_q1      = reg_valid1 ? reg_q1 : (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// reg_q1 and reg_valid1
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q1     <= 1'b0;
        reg_valid1 <= 1'b0;
    end else if (!t_ce1 && !reg_valid1) begin
        reg_q1     <= (prev_tptr == 1'b1 ? buf_q1_1 : buf_q1_0);
        reg_valid1 <= 1'b1;
    end else if (t_ce1) begin
        reg_valid1 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd36;
parameter AddressWidth = 32'd6;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_products_0_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 6;
parameter MEM_SIZE = 36;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input clk;

reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram[addr1];
    end
end


endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 6,
    BufferCount  = 2,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
wire [AddressWidth+IndexWidth-1:0]   memcore_iaddr;
wire [AddressWidth+IndexWidth-1:0]   memcore_taddr;

//------------------------Instantiation------------------
assign memcore_iaddr = {i_address0, iptr};
assign memcore_taddr = {t_address0, tptr};
td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore_U (
    .reset    ( reset ),
    .clk      ( clk ),
    .address0 ( memcore_iaddr ),
    .ce0      ( i_ce0 ),
    .we0      ( i_we0),
    .d0       ( i_d0 ),
    .q0       ( i_q0 ),
    .address1 ( memcore_taddr ),
    .ce1      ( t_ce0 ),
    .we1      ( t_we0),
    .d1       ( t_d0 ),
    .q1       ( t_q0 )

);

//------------------------Body---------------------------

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    we1,
    d1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd72;
parameter AddressWidth = 32'd7;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 ),
    .q1( q1 )
);

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP48232_ifmap_vec_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 7;
parameter MEM_SIZE = 72;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
input[DWIDTH-1:0] d1;
input we1;
output reg[DWIDTH-1:0] q1;
input clk;

reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];




always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram[addr0] <= d0; 
        q0 <= ram[addr0];
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        if (we1) 
            ram[addr1] <= d1; 
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

module td_fused_top_mux_416_64_1_1 #(
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
    input  [63 : 0]     din0,
    input  [63 : 0]     din1,
    input  [63 : 0]     din2,
    input  [63 : 0]     din3,
    input  [15 : 0]    din4,
    output [63 : 0]   dout);

// puts internal signals
wire [15 : 0]     sel;
// level 1 signals
wire [63 : 0]         mux_1_0;
wire [63 : 0]         mux_1_1;
// level 2 signals
wire [63 : 0]         mux_2_0;
// level 3 signals
wire [63 : 0]         mux_3_0;
// level 4 signals
wire [63 : 0]         mux_4_0;
// level 5 signals
wire [63 : 0]         mux_5_0;
// level 6 signals
wire [63 : 0]         mux_6_0;
// level 7 signals
wire [63 : 0]         mux_7_0;
// level 8 signals
wire [63 : 0]         mux_8_0;
// level 9 signals
wire [63 : 0]         mux_9_0;
// level 10 signals
wire [63 : 0]         mux_10_0;
// level 11 signals
wire [63 : 0]         mux_11_0;
// level 12 signals
wire [63 : 0]         mux_12_0;
// level 13 signals
wire [63 : 0]         mux_13_0;
// level 14 signals
wire [63 : 0]         mux_14_0;
// level 15 signals
wire [63 : 0]         mux_15_0;
// level 16 signals
wire [63 : 0]         mux_16_0;

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

// output logic
assign dout = mux_16_0;

endmodule

module td_fused_top_mux_42_16_1_1 #(
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
    input  [1 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [1 : 0]     sel;
// level 1 signals
wire [15 : 0]         mux_1_0;
wire [15 : 0]         mux_1_1;
// level 2 signals
wire [15 : 0]         mux_2_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// output logic
assign dout = mux_2_0;

endmodule

module td_fused_top_mux_42_1_1_1 #(
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
    input  [0 : 0]     din0,
    input  [0 : 0]     din1,
    input  [0 : 0]     din2,
    input  [0 : 0]     din3,
    input  [1 : 0]    din4,
    output [0 : 0]   dout);

// puts internal signals
wire [1 : 0]     sel;
// level 1 signals
wire [0 : 0]         mux_1_0;
wire [0 : 0]         mux_1_1;
// level 2 signals
wire [0 : 0]         mux_2_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// output logic
assign dout = mux_2_0;

endmodule

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






























