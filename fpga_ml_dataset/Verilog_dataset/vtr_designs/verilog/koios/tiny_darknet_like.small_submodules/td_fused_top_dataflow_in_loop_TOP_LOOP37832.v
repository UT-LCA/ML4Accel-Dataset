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

module td_fused_top_dataflow_in_loop_TOP_LOOP37832 (
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
        l1_filter_data_address0,
        l1_filter_data_ce0,
        l1_filter_data_d0,
        l1_filter_data_q0,
        l1_filter_data_we0,
        l1_filter_data_address1,
        l1_filter_data_ce1,
        l1_filter_data_d1,
        l1_filter_data_q1,
        l1_filter_data_we1,
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
        l2_filter_data_address0,
        l2_filter_data_ce0,
        l2_filter_data_d0,
        l2_filter_data_q0,
        l2_filter_data_we0,
        l2_filter_data_address1,
        l2_filter_data_ce1,
        l2_filter_data_d1,
        l2_filter_data_q1,
        l2_filter_data_we1,
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
output  [14:0] l1_filter_data_address0;
output   l1_filter_data_ce0;
output  [15:0] l1_filter_data_d0;
input  [15:0] l1_filter_data_q0;
output   l1_filter_data_we0;
output  [14:0] l1_filter_data_address1;
output   l1_filter_data_ce1;
output  [15:0] l1_filter_data_d1;
input  [15:0] l1_filter_data_q1;
output   l1_filter_data_we1;
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
output  [10:0] l2_filter_data_address0;
output   l2_filter_data_ce0;
output  [15:0] l2_filter_data_d0;
input  [15:0] l2_filter_data_q0;
output   l2_filter_data_we0;
output  [10:0] l2_filter_data_address1;
output   l2_filter_data_ce1;
output  [15:0] l2_filter_data_d1;
input  [15:0] l2_filter_data_q1;
output   l2_filter_data_we1;
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

wire   [15:0] ifmap_vec_i_q0;
wire   [15:0] ifmap_vec_t_q0;
wire   [15:0] weight_vecs_0_i_q0;
wire   [15:0] weight_vecs_0_t_q0;
wire   [15:0] products_0_i_q0;
wire   [15:0] products_0_i_q1;
wire   [15:0] products_0_t_q0;
wire   [15:0] products_0_t_q1;
wire   [15:0] accum1_out_0_i_q0;
wire   [15:0] accum1_out_0_t_q0;
wire   [15:0] l2_products_i_q0;
wire   [15:0] l2_products_t_q0;
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
wire   [6:0] tdf4_get_next_ijk_U0_indices_2_out_din;
wire    tdf4_get_next_ijk_U0_indices_2_out_write;
wire   [10:0] tdf4_get_next_ijk_U0_indices_2_out1_din;
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
wire   [7:0] tdf4_readInputs37_U0_ifmap_vec_address0;
wire    tdf4_readInputs37_U0_ifmap_vec_ce0;
wire    tdf4_readInputs37_U0_ifmap_vec_we0;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_d0;
wire   [7:0] tdf4_readInputs37_U0_ifmap_vec_address1;
wire    tdf4_readInputs37_U0_ifmap_vec_ce1;
wire    tdf4_readInputs37_U0_ifmap_vec_we1;
wire   [15:0] tdf4_readInputs37_U0_ifmap_vec_d1;
wire   [5:0] tdf4_readInputs37_U0_indices_01_out_din;
wire    tdf4_readInputs37_U0_indices_01_out_write;
wire   [11:0] tdf4_readInputs37_U0_indices_12_out_din;
wire    tdf4_readInputs37_U0_indices_12_out_write;
wire    tdf4_readInputs37_U0_in_data_full_n;
wire    tdf4_readInputs37_U0_in_data_write;
wire    ap_channel_done_ifmap_vec;
wire    tdf4_readInputs37_U0_ifmap_vec_full_n;
wire    tdf4_readFilters36_U0_ap_start;
wire    tdf4_readFilters36_U0_ap_done;
wire    tdf4_readFilters36_U0_ap_continue;
wire    tdf4_readFilters36_U0_ap_idle;
wire    tdf4_readFilters36_U0_ap_ready;
wire   [14:0] tdf4_readFilters36_U0_filter_data_address0;
wire    tdf4_readFilters36_U0_filter_data_ce0;
wire    tdf4_readFilters36_U0_indices_23_read;
wire   [7:0] tdf4_readFilters36_U0_weight_vecs_0_address0;
wire    tdf4_readFilters36_U0_weight_vecs_0_ce0;
wire    tdf4_readFilters36_U0_weight_vecs_0_we0;
wire   [15:0] tdf4_readFilters36_U0_weight_vecs_0_d0;
wire    ap_channel_done_weight_vecs_0;
wire    tdf4_readFilters36_U0_weight_vecs_0_full_n;
wire    tdf4_dot_product_U0_ap_start;
wire    tdf4_dot_product_U0_ap_done;
wire    tdf4_dot_product_U0_ap_continue;
wire    tdf4_dot_product_U0_ap_idle;
wire    tdf4_dot_product_U0_ap_ready;
wire   [7:0] tdf4_dot_product_U0_ifmap_vec_address0;
wire    tdf4_dot_product_U0_ifmap_vec_ce0;
wire   [7:0] tdf4_dot_product_U0_weight_vecs_0_address0;
wire    tdf4_dot_product_U0_weight_vecs_0_ce0;
wire   [7:0] tdf4_dot_product_U0_products_0_address0;
wire    tdf4_dot_product_U0_products_0_ce0;
wire    tdf4_dot_product_U0_products_0_we0;
wire   [15:0] tdf4_dot_product_U0_products_0_d0;
wire    ap_channel_done_products_0;
wire    tdf4_dot_product_U0_products_0_full_n;
wire    tdf4_accum_1_U0_ap_start;
wire    tdf4_accum_1_U0_ap_done;
wire    tdf4_accum_1_U0_ap_continue;
wire    tdf4_accum_1_U0_ap_idle;
wire    tdf4_accum_1_U0_ap_ready;
wire   [7:0] tdf4_accum_1_U0_accum_in_0_address0;
wire    tdf4_accum_1_U0_accum_in_0_ce0;
wire   [7:0] tdf4_accum_1_U0_accum_in_0_address1;
wire    tdf4_accum_1_U0_accum_in_0_ce1;
wire   [2:0] tdf4_accum_1_U0_accum_out_address0;
wire    tdf4_accum_1_U0_accum_out_ce0;
wire    tdf4_accum_1_U0_accum_out_we0;
wire   [15:0] tdf4_accum_1_U0_accum_out_d0;
wire   [2:0] tdf4_accum_1_U0_accum_out_address1;
wire    tdf4_accum_1_U0_accum_out_ce1;
wire    tdf4_accum_1_U0_accum_out_we1;
wire   [15:0] tdf4_accum_1_U0_accum_out_d1;
wire    ap_channel_done_accum1_out_0;
wire    tdf4_accum_1_U0_accum_out_full_n;
wire    tdf4_accum_2_U0_ap_start;
wire    tdf4_accum_2_U0_ap_done;
wire    tdf4_accum_2_U0_ap_continue;
wire    tdf4_accum_2_U0_ap_idle;
wire    tdf4_accum_2_U0_ap_ready;
wire   [15:0] tdf4_accum_2_U0_accum_in_12;
wire    tdf4_accum_2_U0_accum_in_12_ap_vld;
wire   [2:0] tdf4_accum_2_U0_accum_in_address0;
wire    tdf4_accum_2_U0_accum_in_ce0;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc403_U0_ap_start;
wire    Block_entry_proc_proc403_U0_ap_done;
wire    Block_entry_proc_proc403_U0_ap_continue;
wire    Block_entry_proc_proc403_U0_ap_idle;
wire    Block_entry_proc_proc403_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc403_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf4_adjust_U0_ap_start;
wire    tdf4_adjust_U0_ap_done;
wire    tdf4_adjust_U0_ap_continue;
wire    tdf4_adjust_U0_ap_idle;
wire    tdf4_adjust_U0_ap_ready;
wire   [6:0] tdf4_adjust_U0_adjustments_address0;
wire    tdf4_adjust_U0_adjustments_ce0;
wire    tdf4_adjust_U0_indices_23_read;
wire   [10:0] tdf4_adjust_U0_indices_23_out_din;
wire    tdf4_adjust_U0_indices_23_out_write;
wire   [15:0] tdf4_adjust_U0_ap_return;
wire    ap_channel_done_intermediate_fmaps_0;
wire    intermediate_fmaps_0_full_n;
wire    tdf4_l2_multiply34_U0_ap_start;
wire    tdf4_l2_multiply34_U0_ap_done;
wire    tdf4_l2_multiply34_U0_ap_continue;
wire    tdf4_l2_multiply34_U0_ap_idle;
wire    tdf4_l2_multiply34_U0_ap_ready;
wire   [10:0] tdf4_l2_multiply34_U0_l2_filter_data_address0;
wire    tdf4_l2_multiply34_U0_l2_filter_data_ce0;
wire   [3:0] tdf4_l2_multiply34_U0_l2_products_address0;
wire    tdf4_l2_multiply34_U0_l2_products_ce0;
wire    tdf4_l2_multiply34_U0_l2_products_we0;
wire   [15:0] tdf4_l2_multiply34_U0_l2_products_d0;
wire    tdf4_l2_multiply34_U0_indices_23_read;
wire    ap_channel_done_l2_products;
wire    tdf4_l2_multiply34_U0_l2_products_full_n;
wire    tdf4_l2_writeOutputs_133_U0_ap_start;
wire    tdf4_l2_writeOutputs_133_U0_ap_done;
wire    tdf4_l2_writeOutputs_133_U0_ap_continue;
wire    tdf4_l2_writeOutputs_133_U0_ap_idle;
wire    tdf4_l2_writeOutputs_133_U0_ap_ready;
wire    tdf4_l2_writeOutputs_133_U0_indices_01_read;
wire    tdf4_l2_writeOutputs_133_U0_indices_12_read;
wire    tdf4_l2_writeOutputs_133_U0_write4_read;
wire   [3:0] tdf4_l2_writeOutputs_133_U0_l2_partial_sums_address0;
wire    tdf4_l2_writeOutputs_133_U0_l2_partial_sums_ce0;
wire   [13:0] tdf4_l2_writeOutputs_133_U0_out_data_address1;
wire    tdf4_l2_writeOutputs_133_U0_out_data_ce1;
wire    tdf4_l2_writeOutputs_133_U0_out_data_we1;
wire   [63:0] tdf4_l2_writeOutputs_133_U0_out_data_d1;
wire   [3:0] tdf4_l2_writeOutputs_133_U0_l2_adjustments_address0;
wire    tdf4_l2_writeOutputs_133_U0_l2_adjustments_ce0;
wire    tdf4_l2_writeOutputs_133_U0_out_data_full_n;
wire    tdf4_l2_writeOutputs_133_U0_out_data_write;
wire    ap_sync_continue;
wire    ifmap_vec_i_full_n;
wire    ifmap_vec_t_empty_n;
wire    weight_vecs_0_i_full_n;
wire    weight_vecs_0_t_empty_n;
wire    products_0_i_full_n;
wire    products_0_t_empty_n;
wire   [15:0] products_0_t_d1;
wire    products_0_t_we1;
wire    accum1_out_0_i_full_n;
wire    accum1_out_0_t_empty_n;
wire    l2_products_i_full_n;
wire    l2_products_t_empty_n;
wire    indices_01_c_full_n;
wire   [15:0] indices_01_c_dout;
wire    indices_01_c_empty_n;
wire    indices_12_c_full_n;
wire   [15:0] indices_12_c_dout;
wire    indices_12_c_empty_n;
wire    indices_23_c_full_n;
wire   [6:0] indices_23_c_dout;
wire    indices_23_c_empty_n;
wire    indices_23_c1_full_n;
wire   [10:0] indices_23_c1_dout;
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
wire   [15:0] tmp_channel_dout;
wire    tmp_channel_empty_n;
wire   [15:0] sums_0_dout;
wire    sums_0_empty_n;
wire    indices_23_c4_full_n;
wire   [10:0] indices_23_c4_dout;
wire    indices_23_c4_empty_n;
wire   [15:0] intermediate_fmaps_0_dout;
wire    intermediate_fmaps_0_empty_n;
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
wire    tdf4_accum_2_U0_start_full_n;
wire    tdf4_accum_2_U0_start_write;
wire    Block_entry_proc_proc403_U0_start_full_n;
wire    Block_entry_proc_proc403_U0_start_write;
wire    tdf4_adjust_U0_start_full_n;
wire    tdf4_adjust_U0_start_write;
wire    tdf4_l2_multiply34_U0_start_full_n;
wire    tdf4_l2_multiply34_U0_start_write;
wire    tdf4_l2_writeOutputs_133_U0_start_full_n;
wire    tdf4_l2_writeOutputs_133_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf4_readInputs37_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
ifmap_vec_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_readInputs37_U0_ap_done),
    .i_full_n(ifmap_vec_i_full_n),
    .i_ce0(tdf4_readInputs37_U0_ifmap_vec_ce0),
    .i_we0(tdf4_readInputs37_U0_ifmap_vec_we0),
    .i_address0(tdf4_readInputs37_U0_ifmap_vec_address0),
    .i_d0(tdf4_readInputs37_U0_ifmap_vec_d0),
    .i_q0(ifmap_vec_i_q0),
    .i_ce1(tdf4_readInputs37_U0_ifmap_vec_ce1),
    .i_we1(tdf4_readInputs37_U0_ifmap_vec_we1),
    .i_address1(tdf4_readInputs37_U0_ifmap_vec_address1),
    .i_d1(tdf4_readInputs37_U0_ifmap_vec_d1),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_ifmap_vec_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_ifmap_vec_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(8'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0 #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
weight_vecs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_readFilters36_U0_ap_done),
    .i_full_n(weight_vecs_0_i_full_n),
    .i_ce0(tdf4_readFilters36_U0_weight_vecs_0_ce0),
    .i_we0(tdf4_readFilters36_U0_weight_vecs_0_we0),
    .i_address0(tdf4_readFilters36_U0_weight_vecs_0_address0),
    .i_d0(tdf4_readFilters36_U0_weight_vecs_0_d0),
    .i_q0(weight_vecs_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_t_empty_n),
    .t_ce0(tdf4_dot_product_U0_weight_vecs_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_dot_product_U0_weight_vecs_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
products_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_dot_product_U0_ap_done),
    .i_full_n(products_0_i_full_n),
    .i_ce0(tdf4_dot_product_U0_products_0_ce0),
    .i_we0(tdf4_dot_product_U0_products_0_we0),
    .i_address0(tdf4_dot_product_U0_products_0_address0),
    .i_d0(tdf4_dot_product_U0_products_0_d0),
    .i_q0(products_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(8'd0),
    .i_q1(products_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf4_accum_1_U0_ap_ready),
    .t_empty_n(products_0_t_empty_n),
    .t_ce0(tdf4_accum_1_U0_accum_in_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_1_U0_accum_in_0_address0),
    .t_d0(16'd0),
    .t_q0(products_0_t_q0),
    .t_ce1(tdf4_accum_1_U0_accum_in_0_ce1),
    .t_address1(tdf4_accum_1_U0_accum_in_0_address1),
    .t_q1(products_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
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
    .t_ce(1'b1),
    .t_read(tdf4_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf4_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(3'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
l2_products_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf4_l2_multiply34_U0_ap_done),
    .i_full_n(l2_products_i_full_n),
    .i_ce0(tdf4_l2_multiply34_U0_l2_products_ce0),
    .i_we0(tdf4_l2_multiply34_U0_l2_products_we0),
    .i_address0(tdf4_l2_multiply34_U0_l2_products_address0),
    .i_d0(tdf4_l2_multiply34_U0_l2_products_d0),
    .i_q0(l2_products_i_q0),
    .t_ce(1'b1),
    .t_read(tdf4_l2_writeOutputs_133_U0_ap_ready),
    .t_empty_n(l2_products_t_empty_n),
    .t_ce0(tdf4_l2_writeOutputs_133_U0_l2_partial_sums_ce0),
    .t_we0(1'b0),
    .t_address0(tdf4_l2_writeOutputs_133_U0_l2_partial_sums_address0),
    .t_d0(16'd0),
    .t_q0(l2_products_t_q0)
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
    .ifmap_vec_address0(tdf4_readInputs37_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf4_readInputs37_U0_ifmap_vec_ce0),
    .ifmap_vec_we0(tdf4_readInputs37_U0_ifmap_vec_we0),
    .ifmap_vec_d0(tdf4_readInputs37_U0_ifmap_vec_d0),
    .ifmap_vec_address1(tdf4_readInputs37_U0_ifmap_vec_address1),
    .ifmap_vec_ce1(tdf4_readInputs37_U0_ifmap_vec_ce1),
    .ifmap_vec_we1(tdf4_readInputs37_U0_ifmap_vec_we1),
    .ifmap_vec_d1(tdf4_readInputs37_U0_ifmap_vec_d1),
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
    .filter_data_address0(tdf4_readFilters36_U0_filter_data_address0),
    .filter_data_ce0(tdf4_readFilters36_U0_filter_data_ce0),
    .filter_data_q0(l1_filter_data_q0),
    .indices_23_dout(indices_23_c_dout),
    .indices_23_empty_n(indices_23_c_empty_n),
    .indices_23_read(tdf4_readFilters36_U0_indices_23_read),
    .weight_vecs_0_address0(tdf4_readFilters36_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf4_readFilters36_U0_weight_vecs_0_ce0),
    .weight_vecs_0_we0(tdf4_readFilters36_U0_weight_vecs_0_we0),
    .weight_vecs_0_d0(tdf4_readFilters36_U0_weight_vecs_0_d0)
);

td_fused_top_tdf4_dot_product tdf4_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_dot_product_U0_ap_start),
    .ap_done(tdf4_dot_product_U0_ap_done),
    .ap_continue(tdf4_dot_product_U0_ap_continue),
    .ap_idle(tdf4_dot_product_U0_ap_idle),
    .ap_ready(tdf4_dot_product_U0_ap_ready),
    .ifmap_vec_address0(tdf4_dot_product_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf4_dot_product_U0_ifmap_vec_ce0),
    .ifmap_vec_q0(ifmap_vec_t_q0),
    .weight_vecs_0_address0(tdf4_dot_product_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf4_dot_product_U0_weight_vecs_0_ce0),
    .weight_vecs_0_q0(weight_vecs_0_t_q0),
    .products_0_address0(tdf4_dot_product_U0_products_0_address0),
    .products_0_ce0(tdf4_dot_product_U0_products_0_ce0),
    .products_0_we0(tdf4_dot_product_U0_products_0_we0),
    .products_0_d0(tdf4_dot_product_U0_products_0_d0)
);

td_fused_top_tdf4_accum_1 tdf4_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_1_U0_ap_start),
    .ap_done(tdf4_accum_1_U0_ap_done),
    .ap_continue(tdf4_accum_1_U0_ap_continue),
    .ap_idle(tdf4_accum_1_U0_ap_idle),
    .ap_ready(tdf4_accum_1_U0_ap_ready),
    .accum_in_0_address0(tdf4_accum_1_U0_accum_in_0_address0),
    .accum_in_0_ce0(tdf4_accum_1_U0_accum_in_0_ce0),
    .accum_in_0_q0(products_0_t_q0),
    .accum_in_0_address1(tdf4_accum_1_U0_accum_in_0_address1),
    .accum_in_0_ce1(tdf4_accum_1_U0_accum_in_0_ce1),
    .accum_in_0_q1(products_0_t_q1),
    .accum_out_address0(tdf4_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf4_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf4_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf4_accum_1_U0_accum_out_d0),
    .accum_out_address1(tdf4_accum_1_U0_accum_out_address1),
    .accum_out_ce1(tdf4_accum_1_U0_accum_out_ce1),
    .accum_out_we1(tdf4_accum_1_U0_accum_out_we1),
    .accum_out_d1(tdf4_accum_1_U0_accum_out_d1)
);

td_fused_top_tdf4_accum_2 tdf4_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_accum_2_U0_ap_start),
    .ap_done(tdf4_accum_2_U0_ap_done),
    .ap_continue(tdf4_accum_2_U0_ap_continue),
    .ap_idle(tdf4_accum_2_U0_ap_idle),
    .ap_ready(tdf4_accum_2_U0_ap_ready),
    .accum_in_12(tdf4_accum_2_U0_accum_in_12),
    .accum_in_12_ap_vld(tdf4_accum_2_U0_accum_in_12_ap_vld),
    .accum_in_address0(tdf4_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf4_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0)
);

td_fused_top_Block_entry_proc_proc403 Block_entry_proc_proc403_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc403_U0_ap_start),
    .ap_done(Block_entry_proc_proc403_U0_ap_done),
    .ap_continue(Block_entry_proc_proc403_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc403_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc403_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc403_U0_ap_return)
);

td_fused_top_tdf4_adjust tdf4_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_adjust_U0_ap_start),
    .ap_done(tdf4_adjust_U0_ap_done),
    .ap_continue(tdf4_adjust_U0_ap_continue),
    .ap_idle(tdf4_adjust_U0_ap_idle),
    .ap_ready(tdf4_adjust_U0_ap_ready),
    .sums_read(sums_0_dout),
    .adjustments_address0(tdf4_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf4_adjust_U0_adjustments_ce0),
    .adjustments_q0(l1_adjustments_q0),
    .indices_23_dout(indices_23_c1_dout),
    .indices_23_empty_n(indices_23_c1_empty_n),
    .indices_23_read(tdf4_adjust_U0_indices_23_read),
    .indices_23_out_din(tdf4_adjust_U0_indices_23_out_din),
    .indices_23_out_full_n(indices_23_c4_full_n),
    .indices_23_out_write(tdf4_adjust_U0_indices_23_out_write),
    .ap_return(tdf4_adjust_U0_ap_return)
);

td_fused_top_tdf4_l2_multiply34 tdf4_l2_multiply34_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_l2_multiply34_U0_ap_start),
    .ap_done(tdf4_l2_multiply34_U0_ap_done),
    .ap_continue(tdf4_l2_multiply34_U0_ap_continue),
    .ap_idle(tdf4_l2_multiply34_U0_ap_idle),
    .ap_ready(tdf4_l2_multiply34_U0_ap_ready),
    .intermediate_fmaps_read(intermediate_fmaps_0_dout),
    .l2_filter_data_address0(tdf4_l2_multiply34_U0_l2_filter_data_address0),
    .l2_filter_data_ce0(tdf4_l2_multiply34_U0_l2_filter_data_ce0),
    .l2_filter_data_q0(l2_filter_data_q0),
    .l2_products_address0(tdf4_l2_multiply34_U0_l2_products_address0),
    .l2_products_ce0(tdf4_l2_multiply34_U0_l2_products_ce0),
    .l2_products_we0(tdf4_l2_multiply34_U0_l2_products_we0),
    .l2_products_d0(tdf4_l2_multiply34_U0_l2_products_d0),
    .indices_23_dout(indices_23_c4_dout),
    .indices_23_empty_n(indices_23_c4_empty_n),
    .indices_23_read(tdf4_l2_multiply34_U0_indices_23_read)
);

td_fused_top_tdf4_l2_writeOutputs_133 tdf4_l2_writeOutputs_133_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf4_l2_writeOutputs_133_U0_ap_start),
    .ap_done(tdf4_l2_writeOutputs_133_U0_ap_done),
    .ap_continue(tdf4_l2_writeOutputs_133_U0_ap_continue),
    .ap_idle(tdf4_l2_writeOutputs_133_U0_ap_idle),
    .ap_ready(tdf4_l2_writeOutputs_133_U0_ap_ready),
    .indices_01_dout(indices_01_c2_dout),
    .indices_01_empty_n(indices_01_c2_empty_n),
    .indices_01_read(tdf4_l2_writeOutputs_133_U0_indices_01_read),
    .indices_12_dout(indices_12_c3_dout),
    .indices_12_empty_n(indices_12_c3_empty_n),
    .indices_12_read(tdf4_l2_writeOutputs_133_U0_indices_12_read),
    .write4_dout(write4_c_dout),
    .write4_empty_n(write4_c_empty_n),
    .write4_read(tdf4_l2_writeOutputs_133_U0_write4_read),
    .l2_partial_sums_address0(tdf4_l2_writeOutputs_133_U0_l2_partial_sums_address0),
    .l2_partial_sums_ce0(tdf4_l2_writeOutputs_133_U0_l2_partial_sums_ce0),
    .l2_partial_sums_q0(l2_products_t_q0),
    .out_data_address1(tdf4_l2_writeOutputs_133_U0_out_data_address1),
    .out_data_ce1(tdf4_l2_writeOutputs_133_U0_out_data_ce1),
    .out_data_we1(tdf4_l2_writeOutputs_133_U0_out_data_we1),
    .out_data_d1(tdf4_l2_writeOutputs_133_U0_out_data_d1),
    .l2_adjustments_address0(tdf4_l2_writeOutputs_133_U0_l2_adjustments_address0),
    .l2_adjustments_ce0(tdf4_l2_writeOutputs_133_U0_l2_adjustments_ce0),
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

td_fused_top_fifo_w7_d2_S indices_23_c_U(
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

td_fused_top_fifo_w11_d7_S indices_23_c1_U(
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

td_fused_top_fifo_w1_d9_S_x write4_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(write4_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_133_U0_write4_read),
    .if_dout(write4_c_dout),
    .if_full_n(write4_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_get_next_ijk_U0_write_r_write),
    .if_din(write4_c_din)
);

td_fused_top_fifo_w6_d8_S_x indices_01_c2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_01_c2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_133_U0_indices_01_read),
    .if_dout(indices_01_c2_dout),
    .if_full_n(indices_01_c2_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_readInputs37_U0_indices_01_out_write),
    .if_din(tdf4_readInputs37_U0_indices_01_out_din)
);

td_fused_top_fifo_w12_d8_S_x indices_12_c3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_12_c3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf4_l2_writeOutputs_133_U0_indices_12_read),
    .if_dout(indices_12_c3_dout),
    .if_full_n(indices_12_c3_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_readInputs37_U0_indices_12_out_write),
    .if_din(tdf4_readInputs37_U0_indices_12_out_din)
);

td_fused_top_fifo_w16_d2_S_x1 tmp_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc403_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf4_accum_2_U0_ap_done),
    .if_din(tdf4_accum_2_U0_accum_in_12)
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
    .if_write(Block_entry_proc_proc403_U0_ap_done),
    .if_din(Block_entry_proc_proc403_U0_ap_return)
);

td_fused_top_fifo_w11_d2_S indices_23_c4_U(
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
    .if_write(tdf4_adjust_U0_ap_done),
    .if_din(tdf4_adjust_U0_ap_return)
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

assign Block_entry_proc_proc403_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc403_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc403_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc403_U0_start_write = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf4_accum_1_U0_ap_done;

assign ap_channel_done_ifmap_vec = tdf4_readInputs37_U0_ap_done;

assign ap_channel_done_intermediate_fmaps_0 = tdf4_adjust_U0_ap_done;

assign ap_channel_done_l2_products = tdf4_l2_multiply34_U0_ap_done;

assign ap_channel_done_products_0 = tdf4_dot_product_U0_ap_done;

assign ap_channel_done_sums_0 = Block_entry_proc_proc403_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf4_accum_2_U0_ap_done;

assign ap_channel_done_weight_vecs_0 = tdf4_readFilters36_U0_ap_done;

assign ap_done = tdf4_l2_writeOutputs_133_U0_ap_done;

assign ap_idle = (tdf4_readInputs37_U0_ap_idle & tdf4_readFilters36_U0_ap_idle & tdf4_l2_writeOutputs_133_U0_ap_idle & tdf4_l2_multiply34_U0_ap_idle & tdf4_get_next_ijk_U0_ap_idle & tdf4_dot_product_U0_ap_idle & tdf4_adjust_U0_ap_idle & tdf4_accum_2_U0_ap_idle & tdf4_accum_1_U0_ap_idle & (intermediate_fmaps_0_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (l2_products_t_empty_n ^ 1'b1) & (products_0_t_empty_n ^ 1'b1) & (weight_vecs_0_t_empty_n ^ 1'b1) & (ifmap_vec_t_empty_n ^ 1'b1) & (1'b1 ^ accum1_out_0_t_empty_n) & Block_entry_proc_proc403_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf4_l2_writeOutputs_133_U0_ap_done;

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

assign l1_filter_data_address0 = tdf4_readFilters36_U0_filter_data_address0;

assign l1_filter_data_address1 = 15'd0;

assign l1_filter_data_ce0 = tdf4_readFilters36_U0_filter_data_ce0;

assign l1_filter_data_ce1 = 1'b0;

assign l1_filter_data_d0 = 16'd0;

assign l1_filter_data_d1 = 16'd0;

assign l1_filter_data_we0 = 1'b0;

assign l1_filter_data_we1 = 1'b0;

assign l2_adjustments_address0 = tdf4_l2_writeOutputs_133_U0_l2_adjustments_address0;

assign l2_adjustments_address1 = 4'd0;

assign l2_adjustments_ce0 = tdf4_l2_writeOutputs_133_U0_l2_adjustments_ce0;

assign l2_adjustments_ce1 = 1'b0;

assign l2_adjustments_d0 = 48'd0;

assign l2_adjustments_d1 = 48'd0;

assign l2_adjustments_we0 = 1'b0;

assign l2_adjustments_we1 = 1'b0;

assign l2_filter_data_address0 = tdf4_l2_multiply34_U0_l2_filter_data_address0;

assign l2_filter_data_address1 = 11'd0;

assign l2_filter_data_ce0 = tdf4_l2_multiply34_U0_l2_filter_data_ce0;

assign l2_filter_data_ce1 = 1'b0;

assign l2_filter_data_d0 = 16'd0;

assign l2_filter_data_d1 = 16'd0;

assign l2_filter_data_we0 = 1'b0;

assign l2_filter_data_we1 = 1'b0;

assign out_data_address0 = 14'd0;

assign out_data_address1 = tdf4_l2_writeOutputs_133_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = tdf4_l2_writeOutputs_133_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = tdf4_l2_writeOutputs_133_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = tdf4_l2_writeOutputs_133_U0_out_data_we1;

assign out_data_write = tdf4_l2_writeOutputs_133_U0_out_data_write;

assign products_0_t_d1 = 16'd0;

assign products_0_t_we1 = 1'b0;

assign start_for_tdf4_readFilters36_U0_din = 1'b1;

assign tdf4_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf4_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf4_accum_1_U0_ap_start = products_0_t_empty_n;

assign tdf4_accum_1_U0_start_full_n = 1'b1;

assign tdf4_accum_1_U0_start_write = 1'b0;

assign tdf4_accum_2_U0_ap_continue = tmp_channel_full_n;

assign tdf4_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf4_accum_2_U0_start_full_n = 1'b1;

assign tdf4_accum_2_U0_start_write = 1'b0;

assign tdf4_adjust_U0_ap_continue = intermediate_fmaps_0_full_n;

assign tdf4_adjust_U0_ap_start = sums_0_empty_n;

assign tdf4_adjust_U0_start_full_n = 1'b1;

assign tdf4_adjust_U0_start_write = 1'b0;

assign tdf4_dot_product_U0_ap_continue = products_0_i_full_n;

assign tdf4_dot_product_U0_ap_start = (weight_vecs_0_t_empty_n & ifmap_vec_t_empty_n);

assign tdf4_dot_product_U0_products_0_full_n = products_0_i_full_n;

assign tdf4_dot_product_U0_start_full_n = 1'b1;

assign tdf4_dot_product_U0_start_write = 1'b0;

assign tdf4_get_next_ijk_U0_ap_continue = 1'b1;

assign tdf4_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf4_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf4_l2_multiply34_U0_ap_continue = l2_products_i_full_n;

assign tdf4_l2_multiply34_U0_ap_start = intermediate_fmaps_0_empty_n;

assign tdf4_l2_multiply34_U0_l2_products_full_n = l2_products_i_full_n;

assign tdf4_l2_multiply34_U0_start_full_n = 1'b1;

assign tdf4_l2_multiply34_U0_start_write = 1'b0;

assign tdf4_l2_writeOutputs_133_U0_ap_continue = ap_continue;

assign tdf4_l2_writeOutputs_133_U0_ap_start = l2_products_t_empty_n;

assign tdf4_l2_writeOutputs_133_U0_out_data_full_n = out_data_full_n;

assign tdf4_l2_writeOutputs_133_U0_out_data_write = 1'b0;

assign tdf4_l2_writeOutputs_133_U0_start_full_n = 1'b1;

assign tdf4_l2_writeOutputs_133_U0_start_write = 1'b0;

assign tdf4_readFilters36_U0_ap_continue = weight_vecs_0_i_full_n;

assign tdf4_readFilters36_U0_ap_start = start_for_tdf4_readFilters36_U0_empty_n;

assign tdf4_readFilters36_U0_start_full_n = 1'b1;

assign tdf4_readFilters36_U0_start_write = 1'b0;

assign tdf4_readFilters36_U0_weight_vecs_0_full_n = weight_vecs_0_i_full_n;

assign tdf4_readInputs37_U0_ap_continue = ifmap_vec_i_full_n;

assign tdf4_readInputs37_U0_ap_start = ((ap_sync_reg_tdf4_readInputs37_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf4_readInputs37_U0_ifmap_vec_full_n = ifmap_vec_i_full_n;

assign tdf4_readInputs37_U0_in_data_full_n = in_data_empty_n;

assign tdf4_readInputs37_U0_in_data_write = 1'b0;

assign tdf4_readInputs37_U0_start_full_n = 1'b1;

assign tdf4_readInputs37_U0_start_write = 1'b0;

assign write4_c_din = tdf4_get_next_ijk_U0_write_r_din;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP37832
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
module td_fused_top_fifo_w11_d2_S (
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
parameter DATA_WIDTH  = 32'd11;
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

td_fused_top_fifo_w11_d2_S_shiftReg 
U_td_fused_top_fifo_w11_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w11_d2_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd11;
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
module td_fused_top_fifo_w12_d8_S_x (
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
parameter ADDR_WIDTH  = 32'd3;
parameter DEPTH       = 4'd8;

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
            mOutPtr <= mOutPtr - 4'd1;
            if (mOutPtr == 4'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 4'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 4'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w12_d8_S_x_shiftReg 
U_td_fused_top_fifo_w12_d8_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w12_d8_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd12;
parameter ADDR_WIDTH = 32'd3;
parameter DEPTH = 4'd8;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, a) begin
   case (a)
      3'd0: q = sr_0;
      3'd1: q = sr_1;
      3'd2: q = sr_2;
      3'd3: q = sr_3;
      3'd4: q = sr_4;
      3'd5: q = sr_5;
      3'd6: q = sr_6;
      3'd7: q = sr_7;
      default: q = sr_7;
   endcase
end

endmodule
module td_fused_top_fifo_w6_d8_S_x (
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
parameter ADDR_WIDTH  = 32'd3;
parameter DEPTH       = 4'd8;

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
            mOutPtr <= mOutPtr - 4'd1;
            if (mOutPtr == 4'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 4'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 4'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w6_d8_S_x_shiftReg 
U_td_fused_top_fifo_w6_d8_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w6_d8_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd6;
parameter ADDR_WIDTH = 32'd3;
parameter DEPTH = 4'd8;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, a) begin
   case (a)
      3'd0: q = sr_0;
      3'd1: q = sr_1;
      3'd2: q = sr_2;
      3'd3: q = sr_3;
      3'd4: q = sr_4;
      3'd5: q = sr_5;
      3'd6: q = sr_6;
      3'd7: q = sr_7;
      default: q = sr_7;
   endcase
end

endmodule
module td_fused_top_fifo_w1_d9_S_x (
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

td_fused_top_fifo_w1_d9_S_x_shiftReg 
U_td_fused_top_fifo_w1_d9_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w1_d9_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd1;
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
module td_fused_top_fifo_w11_d7_S (
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
parameter DATA_WIDTH  = 32'd11;
parameter ADDR_WIDTH  = 32'd3;
parameter DEPTH       = 4'd7;

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
            mOutPtr <= mOutPtr - 4'd1;
            if (mOutPtr == 4'd0)
                internal_empty_n <= 1'b0;
            internal_full_n <= 1'b1;
        end 
        else if (((if_read & if_read_ce) == 0 | internal_empty_n == 0) && 
            ((if_write & if_write_ce) == 1 & internal_full_n == 1))
        begin
            mOutPtr <= mOutPtr + 4'd1;
            internal_empty_n <= 1'b1;
            if (mOutPtr == DEPTH - 4'd2)
                internal_full_n <= 1'b0;
        end 
    end
end

assign shiftReg_addr = mOutPtr[ADDR_WIDTH] == 1'b0 ? mOutPtr[ADDR_WIDTH-1:0]:{ADDR_WIDTH{1'b0}};
assign shiftReg_ce = (if_write & if_write_ce) & internal_full_n;

td_fused_top_fifo_w11_d7_S_shiftReg 
U_td_fused_top_fifo_w11_d7_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w11_d7_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd11;
parameter ADDR_WIDTH = 32'd3;
parameter DEPTH = 4'd7;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, a) begin
   case (a)
      3'd0: q = sr_0;
      3'd1: q = sr_1;
      3'd2: q = sr_2;
      3'd3: q = sr_3;
      3'd4: q = sr_4;
      3'd5: q = sr_5;
      3'd6: q = sr_6;
      default: q = sr_6;
   endcase
end

endmodule
module td_fused_top_fifo_w7_d2_S (
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
parameter DATA_WIDTH  = 32'd7;
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

td_fused_top_fifo_w7_d2_S_shiftReg 
U_td_fused_top_fifo_w7_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w7_d2_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd7;
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
module td_fused_top_tdf4_l2_writeOutputs_133 (
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
        l2_partial_sums_address0,
        l2_partial_sums_ce0,
        l2_partial_sums_q0,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        l2_adjustments_address0,
        l2_adjustments_ce0,
        l2_adjustments_q0
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
input  [5:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [11:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [0:0] write4_dout;
input   write4_empty_n;
output   write4_read;
output  [3:0] l2_partial_sums_address0;
output   l2_partial_sums_ce0;
input  [15:0] l2_partial_sums_q0;
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
reg l2_partial_sums_ce0;
reg out_data_ce1;
reg out_data_we1;
reg l2_adjustments_ce0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
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
reg   [4:0] ochan_reg_208;
reg   [0:0] write4_read_reg_567;
wire   [13:0] add_ln109_fu_273_p2;
reg   [13:0] add_ln109_reg_573;
wire   [4:0] add_ln86_fu_279_p2;
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
wire   [0:0] icmp_ln86_fu_285_p2;
wire   [63:0] zext_ln86_fu_291_p1;
reg   [63:0] zext_ln86_reg_587;
reg   [63:0] zext_ln86_reg_587_pp0_iter1_reg;
reg   [63:0] zext_ln86_reg_587_pp0_iter2_reg;
reg   [63:0] zext_ln86_reg_587_pp0_iter3_reg;
reg   [3:0] running_sums_1_addr_reg_597;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter1_reg;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter2_reg;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter3_reg;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter4_reg;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter5_reg;
reg   [3:0] running_sums_1_addr_reg_597_pp0_iter6_reg;
wire   [1:0] trunc_ln99_fu_297_p1;
reg   [1:0] trunc_ln99_reg_603;
reg   [1:0] trunc_ln99_reg_603_pp0_iter1_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter2_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter3_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter4_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter5_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter6_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter7_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter8_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter9_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter10_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter11_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter12_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter13_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter14_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter15_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter16_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter17_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter18_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter19_reg;
reg   [1:0] trunc_ln99_reg_603_pp0_iter20_reg;
wire   [0:0] and_ln103_fu_307_p2;
reg   [0:0] and_ln103_reg_610;
reg   [0:0] and_ln103_reg_610_pp0_iter1_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter2_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter3_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter4_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter5_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter6_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter7_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter8_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter9_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter10_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter11_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter12_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter13_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter14_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter15_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter16_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter17_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter18_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter19_reg;
reg   [0:0] and_ln103_reg_610_pp0_iter20_reg;
reg   [1:0] lshr_ln_reg_614;
reg   [1:0] lshr_ln_reg_614_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter2_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter3_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter4_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter5_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter6_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter7_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter8_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter9_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter10_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter11_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter12_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter13_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter14_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter15_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter16_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter17_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter18_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter19_reg;
reg   [1:0] lshr_ln_reg_614_pp0_iter20_reg;
reg   [15:0] val_reg_619;
reg   [15:0] running_sums_1_load_reg_624;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_219_p2;
reg   [15:0] sum_reg_634;
reg   [15:0] tmp_47_i_i_reg_645;
reg   [15:0] tmp_47_i_i_reg_645_pp0_iter8_reg;
reg   [15:0] tmp_47_i_i_reg_645_pp0_iter9_reg;
reg   [15:0] tmp_47_i_i_reg_645_pp0_iter10_reg;
reg   [15:0] tmp_47_i_i_reg_645_pp0_iter11_reg;
reg   [15:0] tmp_48_i_i_reg_650;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter8_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter9_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter10_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter11_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter12_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter13_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter14_reg;
reg   [15:0] tmp_48_i_i_reg_650_pp0_iter15_reg;
wire   [15:0] grp_fu_227_p2;
reg   [15:0] sub_i_i_i_reg_655;
wire   [15:0] grp_fu_231_p2;
reg   [15:0] normalized_reg_665;
wire   [15:0] grp_fu_223_p2;
reg   [15:0] biased_reg_675;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
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
wire    ap_block_pp0_stage0;
wire   [63:0] sext_ln109_fu_509_p1;
reg   [15:0] quad_3_14_fu_114;
wire   [15:0] quad_3_26_fu_475_p3;
reg   [15:0] quad_3_15_fu_118;
wire   [15:0] quad_3_25_fu_467_p3;
reg   [15:0] quad_3_16_fu_122;
wire   [15:0] quad_3_23_fu_451_p3;
reg   [15:0] quad_3_17_fu_126;
wire   [15:0] quad_3_20_fu_427_p3;
wire   [15:0] grp_fu_223_p1;
wire   [15:0] grp_fu_227_p1;
wire   [15:0] grp_fu_231_p1;
wire   [11:0] tmp_fu_235_p3;
wire   [8:0] tmp_s_fu_247_p3;
wire   [12:0] zext_ln109_fu_243_p1;
wire   [12:0] zext_ln109_3_fu_255_p1;
wire   [12:0] sub_ln109_fu_259_p2;
wire   [13:0] sub_ln109_cast_fu_265_p1;
wire   [13:0] zext_ln109_4_fu_269_p1;
wire   [0:0] icmp_ln103_fu_301_p2;
wire   [15:0] trunc_ln95_fu_329_p1;
wire   [15:0] data_V_fu_378_p1;
wire   [0:0] p_Result_s_fu_381_p3;
wire   [0:0] icmp_ln99_fu_396_p2;
wire   [15:0] quad_0_fu_389_p3;
wire   [0:0] icmp_ln99_3_fu_409_p2;
wire   [15:0] quad_3_fu_401_p3;
wire   [0:0] icmp_ln99_4_fu_422_p2;
wire   [15:0] quad_3_19_fu_414_p3;
wire   [15:0] quad_3_21_fu_435_p3;
wire   [15:0] quad_3_22_fu_443_p3;
wire   [15:0] quad_3_24_fu_459_p3;
wire   [15:0] tmp_34_fu_503_p3;
wire   [15:0] bitcast_ln109_6_fu_526_p1;
wire   [15:0] bitcast_ln109_5_fu_522_p1;
wire   [15:0] bitcast_ln109_4_fu_518_p1;
wire   [15:0] bitcast_ln109_fu_514_p1;
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
end

td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
running_sums_1_U(
    .reset(ap_rst),
    .clk(ap_clk),
    .address0(running_sums_1_addr_reg_597_pp0_iter6_reg),
    .ce0(running_sums_1_ce0),
    .we0(running_sums_1_we0),
    .d0(running_sums_1_d0),
    .address1(running_sums_1_address1),
    .ce1(running_sums_1_ce1),
    .q1(running_sums_1_q1)
);

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U240(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(running_sums_1_load_reg_624),
    .din1(val_reg_619),
    .dout(grp_fu_219_p2)
);

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U241(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(normalized_reg_665),
    .din1(grp_fu_223_p1),
    .dout(grp_fu_223_p2)
);

td_fused_top_hsub_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_5_full_dsp_1_U242(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_reg_634),
    .din1(grp_fu_227_p1),
    .dout(grp_fu_227_p2)
);

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U243(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_655),
    .din1(grp_fu_231_p1),
    .dout(grp_fu_231_p2)
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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln86_fu_285_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ochan_reg_208 <= add_ln86_fu_279_p2;
    end else if ((~((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ochan_reg_208 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln109_reg_573 <= add_ln109_fu_273_p2;
        write4_read_reg_567 <= write4_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln86_fu_285_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln103_reg_610 <= and_ln103_fu_307_p2;
        running_sums_1_addr_reg_597 <= zext_ln86_fu_291_p1;
        trunc_ln99_reg_603 <= trunc_ln99_fu_297_p1;
        zext_ln86_reg_587[4 : 0] <= zext_ln86_fu_291_p1[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        and_ln103_reg_610_pp0_iter10_reg <= and_ln103_reg_610_pp0_iter9_reg;
        and_ln103_reg_610_pp0_iter11_reg <= and_ln103_reg_610_pp0_iter10_reg;
        and_ln103_reg_610_pp0_iter12_reg <= and_ln103_reg_610_pp0_iter11_reg;
        and_ln103_reg_610_pp0_iter13_reg <= and_ln103_reg_610_pp0_iter12_reg;
        and_ln103_reg_610_pp0_iter14_reg <= and_ln103_reg_610_pp0_iter13_reg;
        and_ln103_reg_610_pp0_iter15_reg <= and_ln103_reg_610_pp0_iter14_reg;
        and_ln103_reg_610_pp0_iter16_reg <= and_ln103_reg_610_pp0_iter15_reg;
        and_ln103_reg_610_pp0_iter17_reg <= and_ln103_reg_610_pp0_iter16_reg;
        and_ln103_reg_610_pp0_iter18_reg <= and_ln103_reg_610_pp0_iter17_reg;
        and_ln103_reg_610_pp0_iter19_reg <= and_ln103_reg_610_pp0_iter18_reg;
        and_ln103_reg_610_pp0_iter20_reg <= and_ln103_reg_610_pp0_iter19_reg;
        and_ln103_reg_610_pp0_iter2_reg <= and_ln103_reg_610_pp0_iter1_reg;
        and_ln103_reg_610_pp0_iter3_reg <= and_ln103_reg_610_pp0_iter2_reg;
        and_ln103_reg_610_pp0_iter4_reg <= and_ln103_reg_610_pp0_iter3_reg;
        and_ln103_reg_610_pp0_iter5_reg <= and_ln103_reg_610_pp0_iter4_reg;
        and_ln103_reg_610_pp0_iter6_reg <= and_ln103_reg_610_pp0_iter5_reg;
        and_ln103_reg_610_pp0_iter7_reg <= and_ln103_reg_610_pp0_iter6_reg;
        and_ln103_reg_610_pp0_iter8_reg <= and_ln103_reg_610_pp0_iter7_reg;
        and_ln103_reg_610_pp0_iter9_reg <= and_ln103_reg_610_pp0_iter8_reg;
        biased_reg_675 <= grp_fu_223_p2;
        lshr_ln_reg_614_pp0_iter10_reg <= lshr_ln_reg_614_pp0_iter9_reg;
        lshr_ln_reg_614_pp0_iter11_reg <= lshr_ln_reg_614_pp0_iter10_reg;
        lshr_ln_reg_614_pp0_iter12_reg <= lshr_ln_reg_614_pp0_iter11_reg;
        lshr_ln_reg_614_pp0_iter13_reg <= lshr_ln_reg_614_pp0_iter12_reg;
        lshr_ln_reg_614_pp0_iter14_reg <= lshr_ln_reg_614_pp0_iter13_reg;
        lshr_ln_reg_614_pp0_iter15_reg <= lshr_ln_reg_614_pp0_iter14_reg;
        lshr_ln_reg_614_pp0_iter16_reg <= lshr_ln_reg_614_pp0_iter15_reg;
        lshr_ln_reg_614_pp0_iter17_reg <= lshr_ln_reg_614_pp0_iter16_reg;
        lshr_ln_reg_614_pp0_iter18_reg <= lshr_ln_reg_614_pp0_iter17_reg;
        lshr_ln_reg_614_pp0_iter19_reg <= lshr_ln_reg_614_pp0_iter18_reg;
        lshr_ln_reg_614_pp0_iter20_reg <= lshr_ln_reg_614_pp0_iter19_reg;
        lshr_ln_reg_614_pp0_iter2_reg <= lshr_ln_reg_614_pp0_iter1_reg;
        lshr_ln_reg_614_pp0_iter3_reg <= lshr_ln_reg_614_pp0_iter2_reg;
        lshr_ln_reg_614_pp0_iter4_reg <= lshr_ln_reg_614_pp0_iter3_reg;
        lshr_ln_reg_614_pp0_iter5_reg <= lshr_ln_reg_614_pp0_iter4_reg;
        lshr_ln_reg_614_pp0_iter6_reg <= lshr_ln_reg_614_pp0_iter5_reg;
        lshr_ln_reg_614_pp0_iter7_reg <= lshr_ln_reg_614_pp0_iter6_reg;
        lshr_ln_reg_614_pp0_iter8_reg <= lshr_ln_reg_614_pp0_iter7_reg;
        lshr_ln_reg_614_pp0_iter9_reg <= lshr_ln_reg_614_pp0_iter8_reg;
        normalized_reg_665 <= grp_fu_231_p2;
        running_sums_1_addr_reg_597_pp0_iter2_reg <= running_sums_1_addr_reg_597_pp0_iter1_reg;
        running_sums_1_addr_reg_597_pp0_iter3_reg <= running_sums_1_addr_reg_597_pp0_iter2_reg;
        running_sums_1_addr_reg_597_pp0_iter4_reg <= running_sums_1_addr_reg_597_pp0_iter3_reg;
        running_sums_1_addr_reg_597_pp0_iter5_reg <= running_sums_1_addr_reg_597_pp0_iter4_reg;
        running_sums_1_addr_reg_597_pp0_iter6_reg <= running_sums_1_addr_reg_597_pp0_iter5_reg;
        sub_i_i_i_reg_655 <= grp_fu_227_p2;
        sum_reg_634 <= grp_fu_219_p2;
        tmp_47_i_i_reg_645 <= {{l2_adjustments_q0[31:16]}};
        tmp_47_i_i_reg_645_pp0_iter10_reg <= tmp_47_i_i_reg_645_pp0_iter9_reg;
        tmp_47_i_i_reg_645_pp0_iter11_reg <= tmp_47_i_i_reg_645_pp0_iter10_reg;
        tmp_47_i_i_reg_645_pp0_iter8_reg <= tmp_47_i_i_reg_645;
        tmp_47_i_i_reg_645_pp0_iter9_reg <= tmp_47_i_i_reg_645_pp0_iter8_reg;
        tmp_48_i_i_reg_650 <= {{l2_adjustments_q0[47:32]}};
        tmp_48_i_i_reg_650_pp0_iter10_reg <= tmp_48_i_i_reg_650_pp0_iter9_reg;
        tmp_48_i_i_reg_650_pp0_iter11_reg <= tmp_48_i_i_reg_650_pp0_iter10_reg;
        tmp_48_i_i_reg_650_pp0_iter12_reg <= tmp_48_i_i_reg_650_pp0_iter11_reg;
        tmp_48_i_i_reg_650_pp0_iter13_reg <= tmp_48_i_i_reg_650_pp0_iter12_reg;
        tmp_48_i_i_reg_650_pp0_iter14_reg <= tmp_48_i_i_reg_650_pp0_iter13_reg;
        tmp_48_i_i_reg_650_pp0_iter15_reg <= tmp_48_i_i_reg_650_pp0_iter14_reg;
        tmp_48_i_i_reg_650_pp0_iter8_reg <= tmp_48_i_i_reg_650;
        tmp_48_i_i_reg_650_pp0_iter9_reg <= tmp_48_i_i_reg_650_pp0_iter8_reg;
        trunc_ln99_reg_603_pp0_iter10_reg <= trunc_ln99_reg_603_pp0_iter9_reg;
        trunc_ln99_reg_603_pp0_iter11_reg <= trunc_ln99_reg_603_pp0_iter10_reg;
        trunc_ln99_reg_603_pp0_iter12_reg <= trunc_ln99_reg_603_pp0_iter11_reg;
        trunc_ln99_reg_603_pp0_iter13_reg <= trunc_ln99_reg_603_pp0_iter12_reg;
        trunc_ln99_reg_603_pp0_iter14_reg <= trunc_ln99_reg_603_pp0_iter13_reg;
        trunc_ln99_reg_603_pp0_iter15_reg <= trunc_ln99_reg_603_pp0_iter14_reg;
        trunc_ln99_reg_603_pp0_iter16_reg <= trunc_ln99_reg_603_pp0_iter15_reg;
        trunc_ln99_reg_603_pp0_iter17_reg <= trunc_ln99_reg_603_pp0_iter16_reg;
        trunc_ln99_reg_603_pp0_iter18_reg <= trunc_ln99_reg_603_pp0_iter17_reg;
        trunc_ln99_reg_603_pp0_iter19_reg <= trunc_ln99_reg_603_pp0_iter18_reg;
        trunc_ln99_reg_603_pp0_iter20_reg <= trunc_ln99_reg_603_pp0_iter19_reg;
        trunc_ln99_reg_603_pp0_iter2_reg <= trunc_ln99_reg_603_pp0_iter1_reg;
        trunc_ln99_reg_603_pp0_iter3_reg <= trunc_ln99_reg_603_pp0_iter2_reg;
        trunc_ln99_reg_603_pp0_iter4_reg <= trunc_ln99_reg_603_pp0_iter3_reg;
        trunc_ln99_reg_603_pp0_iter5_reg <= trunc_ln99_reg_603_pp0_iter4_reg;
        trunc_ln99_reg_603_pp0_iter6_reg <= trunc_ln99_reg_603_pp0_iter5_reg;
        trunc_ln99_reg_603_pp0_iter7_reg <= trunc_ln99_reg_603_pp0_iter6_reg;
        trunc_ln99_reg_603_pp0_iter8_reg <= trunc_ln99_reg_603_pp0_iter7_reg;
        trunc_ln99_reg_603_pp0_iter9_reg <= trunc_ln99_reg_603_pp0_iter8_reg;
        zext_ln86_reg_587_pp0_iter2_reg[4 : 0] <= zext_ln86_reg_587_pp0_iter1_reg[4 : 0];
        zext_ln86_reg_587_pp0_iter3_reg[4 : 0] <= zext_ln86_reg_587_pp0_iter2_reg[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln103_reg_610_pp0_iter1_reg <= and_ln103_reg_610;
        lshr_ln_reg_614_pp0_iter1_reg <= lshr_ln_reg_614;
        running_sums_1_addr_reg_597_pp0_iter1_reg <= running_sums_1_addr_reg_597;
        trunc_ln99_reg_603_pp0_iter1_reg <= trunc_ln99_reg_603;
        val_reg_619 <= l2_partial_sums_q0;
        zext_ln86_reg_587_pp0_iter1_reg[4 : 0] <= zext_ln86_reg_587[4 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'd1 == and_ln103_fu_307_p2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln86_fu_285_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        lshr_ln_reg_614 <= {{ochan_reg_208[3:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter21 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        quad_3_14_fu_114 <= quad_3_26_fu_475_p3;
        quad_3_15_fu_118 <= quad_3_25_fu_467_p3;
        quad_3_16_fu_122 <= quad_3_23_fu_451_p3;
        quad_3_17_fu_126 <= quad_3_20_fu_427_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_1_load_reg_624 <= running_sums_1_q1;
    end
end

always @ (*) begin
    if ((icmp_ln86_fu_285_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter22 == 1'b0) & (ap_enable_reg_pp0_iter21 == 1'b0) & (ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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
    if ((((ap_enable_reg_pp0_iter6 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter5 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        l2_adjustments_ce0 = 1'b1;
    end else begin
        l2_adjustments_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_partial_sums_ce0 = 1'b1;
    end else begin
        l2_partial_sums_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter22 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter21 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter21 == 1'b1) & (1'd1 == and_ln103_reg_610_pp0_iter20_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_1_ce0 = 1'b1;
    end else begin
        running_sums_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        running_sums_1_ce1 = 1'b1;
    end else begin
        running_sums_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln86_fu_285_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter22 == 1'b1) & (ap_enable_reg_pp0_iter21 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln86_fu_285_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter22 == 1'b1) & (ap_enable_reg_pp0_iter21 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
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

assign add_ln109_fu_273_p2 = ((sub_ln109_cast_fu_265_p1) + (zext_ln109_4_fu_269_p1));

assign add_ln86_fu_279_p2 = (ochan_reg_208 + 5'd1);

assign and_ln103_fu_307_p2 = (write4_read_reg_567 & icmp_ln103_fu_301_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state25 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (write4_empty_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
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

assign bitcast_ln109_4_fu_518_p1 = quad_3_25_fu_467_p3;

assign bitcast_ln109_5_fu_522_p1 = quad_3_23_fu_451_p3;

assign bitcast_ln109_6_fu_526_p1 = quad_3_20_fu_427_p3;

assign bitcast_ln109_fu_514_p1 = quad_3_26_fu_475_p3;

assign data_V_fu_378_p1 = biased_reg_675;

assign grp_fu_223_p1 = tmp_48_i_i_reg_650_pp0_iter15_reg;

assign grp_fu_227_p1 = trunc_ln95_fu_329_p1;

assign grp_fu_231_p1 = tmp_47_i_i_reg_645_pp0_iter11_reg;

assign icmp_ln103_fu_301_p2 = ((trunc_ln99_fu_297_p1 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln86_fu_285_p2 = ((ochan_reg_208 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln99_3_fu_409_p2 = ((trunc_ln99_reg_603_pp0_iter20_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln99_4_fu_422_p2 = ((trunc_ln99_reg_603_pp0_iter20_reg == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln99_fu_396_p2 = ((trunc_ln99_reg_603_pp0_iter20_reg == 2'd2) ? 1'b1 : 1'b0);

assign l2_adjustments_address0 = zext_ln86_reg_587_pp0_iter3_reg;

assign l2_partial_sums_address0 = zext_ln86_fu_291_p1;

assign out_data_address1 = sext_ln109_fu_509_p1;

assign out_data_d1 = {{{{bitcast_ln109_6_fu_526_p1}, {bitcast_ln109_5_fu_522_p1}}, {bitcast_ln109_4_fu_518_p1}}, {bitcast_ln109_fu_514_p1}};

assign p_Result_s_fu_381_p3 = data_V_fu_378_p1[32'd15];

assign quad_0_fu_389_p3 = ((p_Result_s_fu_381_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_675);

assign quad_3_19_fu_414_p3 = ((icmp_ln99_3_fu_409_p2[0:0] == 1'b1) ? quad_3_17_fu_126 : quad_3_fu_401_p3);

assign quad_3_20_fu_427_p3 = ((icmp_ln99_4_fu_422_p2[0:0] == 1'b1) ? quad_3_17_fu_126 : quad_3_19_fu_414_p3);

assign quad_3_21_fu_435_p3 = ((icmp_ln99_fu_396_p2[0:0] == 1'b1) ? quad_0_fu_389_p3 : quad_3_16_fu_122);

assign quad_3_22_fu_443_p3 = ((icmp_ln99_3_fu_409_p2[0:0] == 1'b1) ? quad_3_16_fu_122 : quad_3_21_fu_435_p3);

assign quad_3_23_fu_451_p3 = ((icmp_ln99_4_fu_422_p2[0:0] == 1'b1) ? quad_3_16_fu_122 : quad_3_22_fu_443_p3);

assign quad_3_24_fu_459_p3 = ((icmp_ln99_3_fu_409_p2[0:0] == 1'b1) ? quad_0_fu_389_p3 : quad_3_15_fu_118);

assign quad_3_25_fu_467_p3 = ((icmp_ln99_4_fu_422_p2[0:0] == 1'b1) ? quad_3_15_fu_118 : quad_3_24_fu_459_p3);

assign quad_3_26_fu_475_p3 = ((icmp_ln99_4_fu_422_p2[0:0] == 1'b1) ? quad_0_fu_389_p3 : quad_3_14_fu_114);

assign quad_3_fu_401_p3 = ((icmp_ln99_fu_396_p2[0:0] == 1'b1) ? quad_3_17_fu_126 : quad_0_fu_389_p3);

assign running_sums_1_address1 = zext_ln86_fu_291_p1;

assign running_sums_1_d0 = ((write4_read_reg_567[0:0] == 1'b1) ? 16'd0 : sum_reg_634);

assign sext_ln109_fu_509_p1 = (tmp_34_fu_503_p3);

assign sub_ln109_cast_fu_265_p1 = (sub_ln109_fu_259_p2);

assign sub_ln109_fu_259_p2 = (zext_ln109_fu_243_p1 - zext_ln109_3_fu_255_p1);

assign tmp_34_fu_503_p3 = {{add_ln109_reg_573}, {lshr_ln_reg_614_pp0_iter20_reg}};

assign tmp_fu_235_p3 = {{indices_01_dout}, {6'd0}};

assign tmp_s_fu_247_p3 = {{indices_01_dout}, {3'd0}};

assign trunc_ln95_fu_329_p1 = l2_adjustments_q0[15:0];

assign trunc_ln99_fu_297_p1 = ochan_reg_208[1:0];

assign zext_ln109_3_fu_255_p1 = tmp_s_fu_247_p3;

assign zext_ln109_4_fu_269_p1 = indices_12_dout;

assign zext_ln109_fu_243_p1 = tmp_fu_235_p3;

assign zext_ln86_fu_291_p1 = ochan_reg_208;

always @ (posedge ap_clk) begin
    zext_ln86_reg_587[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_587_pp0_iter1_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_587_pp0_iter2_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
    zext_ln86_reg_587_pp0_iter3_reg[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
end

endmodule //td_fused_top_tdf4_l2_writeOutputs_133
module td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1(
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



td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1_ram td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1_ram_U(
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
module td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1_ram (addr0, ce0, d0, we0, addr1, ce1, q1,  clk);

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
//    $readmemh("./td_fused_top_tdf4_l2_writeOutputs_133_running_sums_1_ram.dat", ram);
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
module td_fused_top_tdf4_l2_multiply34 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        intermediate_fmaps_read,
        l2_filter_data_address0,
        l2_filter_data_ce0,
        l2_filter_data_q0,
        l2_products_address0,
        l2_products_ce0,
        l2_products_we0,
        l2_products_d0,
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
input  [15:0] intermediate_fmaps_read;
output  [10:0] l2_filter_data_address0;
output   l2_filter_data_ce0;
input  [15:0] l2_filter_data_q0;
output  [3:0] l2_products_address0;
output   l2_products_ce0;
output   l2_products_we0;
output  [15:0] l2_products_d0;
input  [10:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg l2_filter_data_ce0;
reg l2_products_ce0;
reg l2_products_we0;
reg indices_23_read;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [4:0] i_1_1_reg_106;
reg   [10:0] l2_ichan_reg_165;
wire   [4:0] add_ln20_fu_122_p2;
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
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln20_fu_128_p2;
reg   [0:0] icmp_ln20_reg_175;
reg   [0:0] icmp_ln20_reg_175_pp0_iter1_reg;
reg   [0:0] icmp_ln20_reg_175_pp0_iter2_reg;
reg   [0:0] icmp_ln20_reg_175_pp0_iter3_reg;
reg   [0:0] icmp_ln20_reg_175_pp0_iter4_reg;
reg   [0:0] icmp_ln20_reg_175_pp0_iter5_reg;
reg   [0:0] icmp_ln20_reg_175_pp0_iter6_reg;
wire   [3:0] l2_o_fu_134_p1;
reg   [3:0] l2_o_reg_179;
reg   [3:0] l2_o_reg_179_pp0_iter1_reg;
reg   [3:0] l2_o_reg_179_pp0_iter2_reg;
reg   [3:0] l2_o_reg_179_pp0_iter3_reg;
reg   [3:0] l2_o_reg_179_pp0_iter4_reg;
reg   [3:0] l2_o_reg_179_pp0_iter5_reg;
reg   [3:0] l2_o_reg_179_pp0_iter6_reg;
wire   [15:0] grp_fu_117_p2;
reg   [15:0] mul_i_i_reg_194;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
wire   [63:0] zext_ln29_13_fu_151_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln29_fu_156_p1;
wire   [10:0] tmp_s_fu_138_p3;
wire   [10:0] add_ln29_fu_146_p2;
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

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U235(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(l2_filter_data_q0),
    .din1(intermediate_fmaps_read),
    .dout(grp_fu_117_p2)
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
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
        i_1_1_reg_106 <= 5'd0;
    end else if (((icmp_ln20_fu_128_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_1_1_reg_106 <= add_ln20_fu_122_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln20_reg_175 <= icmp_ln20_fu_128_p2;
        icmp_ln20_reg_175_pp0_iter1_reg <= icmp_ln20_reg_175;
        l2_o_reg_179_pp0_iter1_reg <= l2_o_reg_179;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln20_reg_175_pp0_iter2_reg <= icmp_ln20_reg_175_pp0_iter1_reg;
        icmp_ln20_reg_175_pp0_iter3_reg <= icmp_ln20_reg_175_pp0_iter2_reg;
        icmp_ln20_reg_175_pp0_iter4_reg <= icmp_ln20_reg_175_pp0_iter3_reg;
        icmp_ln20_reg_175_pp0_iter5_reg <= icmp_ln20_reg_175_pp0_iter4_reg;
        icmp_ln20_reg_175_pp0_iter6_reg <= icmp_ln20_reg_175_pp0_iter5_reg;
        l2_o_reg_179_pp0_iter2_reg <= l2_o_reg_179_pp0_iter1_reg;
        l2_o_reg_179_pp0_iter3_reg <= l2_o_reg_179_pp0_iter2_reg;
        l2_o_reg_179_pp0_iter4_reg <= l2_o_reg_179_pp0_iter3_reg;
        l2_o_reg_179_pp0_iter5_reg <= l2_o_reg_179_pp0_iter4_reg;
        l2_o_reg_179_pp0_iter6_reg <= l2_o_reg_179_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        l2_ichan_reg_165 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln20_fu_128_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        l2_o_reg_179 <= l2_o_fu_134_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln20_reg_175_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_i_i_reg_194 <= grp_fu_117_p2;
    end
end

always @ (*) begin
    if ((icmp_ln20_fu_128_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        l2_filter_data_ce0 = 1'b1;
    end else begin
        l2_filter_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        l2_products_ce0 = 1'b1;
    end else begin
        l2_products_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln20_reg_175_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        l2_products_we0 = 1'b1;
    end else begin
        l2_products_we0 = 1'b0;
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
            if ((~((icmp_ln20_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((icmp_ln20_fu_128_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
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

assign add_ln20_fu_122_p2 = (i_1_1_reg_106 + 5'd1);

assign add_ln29_fu_146_p2 = (tmp_s_fu_138_p3 + l2_ichan_reg_165);

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

assign icmp_ln20_fu_128_p2 = ((i_1_1_reg_106 == 5'd16) ? 1'b1 : 1'b0);

assign l2_filter_data_address0 = zext_ln29_13_fu_151_p1;

assign l2_o_fu_134_p1 = i_1_1_reg_106[3:0];

assign l2_products_address0 = zext_ln29_fu_156_p1;

assign l2_products_d0 = mul_i_i_reg_194;

assign tmp_s_fu_138_p3 = {{l2_o_fu_134_p1}, {7'd0}};

assign zext_ln29_13_fu_151_p1 = add_ln29_fu_146_p2;

assign zext_ln29_fu_156_p1 = l2_o_reg_179_pp0_iter6_reg;

endmodule //td_fused_top_tdf4_l2_multiply34
module td_fused_top_tdf4_adjust (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        sums_read,
        adjustments_address0,
        adjustments_ce0,
        adjustments_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        indices_23_out_din,
        indices_23_out_full_n,
        indices_23_out_write,
        ap_return
);

parameter    ap_ST_fsm_state1 = 17'd1;
parameter    ap_ST_fsm_state2 = 17'd2;
parameter    ap_ST_fsm_state3 = 17'd4;
parameter    ap_ST_fsm_state4 = 17'd8;
parameter    ap_ST_fsm_state5 = 17'd16;
parameter    ap_ST_fsm_state6 = 17'd32;
parameter    ap_ST_fsm_state7 = 17'd64;
parameter    ap_ST_fsm_state8 = 17'd128;
parameter    ap_ST_fsm_state9 = 17'd256;
parameter    ap_ST_fsm_state10 = 17'd512;
parameter    ap_ST_fsm_state11 = 17'd1024;
parameter    ap_ST_fsm_state12 = 17'd2048;
parameter    ap_ST_fsm_state13 = 17'd4096;
parameter    ap_ST_fsm_state14 = 17'd8192;
parameter    ap_ST_fsm_state15 = 17'd16384;
parameter    ap_ST_fsm_state16 = 17'd32768;
parameter    ap_ST_fsm_state17 = 17'd65536;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] sums_read;
output  [6:0] adjustments_address0;
output   adjustments_ce0;
input  [47:0] adjustments_q0;
input  [10:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [10:0] indices_23_out_din;
input   indices_23_out_full_n;
output   indices_23_out_write;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg adjustments_ce0;
reg indices_23_read;
reg indices_23_out_write;

reg    ap_done_reg;
  reg   [16:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg    indices_23_out_blk_n;
wire    ap_CS_fsm_state4;
reg   [15:0] tmp_53_i_i_reg_183;
reg   [15:0] tmp_54_i_i_reg_188;
wire   [15:0] grp_fu_93_p2;
reg   [15:0] sub_i_i_i_reg_193;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire   [15:0] grp_fu_98_p2;
reg   [15:0] mul_i_i_i_reg_203;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state13;
wire   [63:0] zext_ln220_fu_106_p1;
reg    ap_block_state1;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_89_p1;
wire   [15:0] grp_fu_93_p1;
wire   [15:0] grp_fu_98_p1;
wire   [6:0] trunc_ln251_fu_102_p1;
wire   [15:0] trunc_ln220_fu_111_p1;
wire   [15:0] grp_fu_89_p2;
wire    ap_CS_fsm_state17;
wire   [15:0] bitcast_ln648_fu_148_p1;
wire   [0:0] tmp_fu_152_p3;
reg   [16:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 17'd1;
end

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U228(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(mul_i_i_i_reg_203),
    .din1(grp_fu_89_p1),
    .dout(grp_fu_89_p2)
);

td_fused_top_hsub_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_5_full_dsp_1_U229(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sums_read),
    .din1(grp_fu_93_p1),
    .dout(grp_fu_93_p2)
);

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U230(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_193),
    .din1(grp_fu_98_p1),
    .dout(grp_fu_98_p2)
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
    if ((1'b1 == ap_CS_fsm_state12)) begin
        mul_i_i_i_reg_203 <= grp_fu_98_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sub_i_i_i_reg_193 <= grp_fu_93_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        tmp_53_i_i_reg_183 <= {{adjustments_q0[31:16]}};
        tmp_54_i_i_reg_188 <= {{adjustments_q0[47:32]}};
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (~((indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        adjustments_ce0 = 1'b1;
    end else begin
        adjustments_ce0 = 1'b0;
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
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
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
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_blk_n = indices_23_empty_n;
    end else begin
        indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_out_blk_n = indices_23_out_full_n;
    end else begin
        indices_23_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_out_write = 1'b1;
    end else begin
        indices_23_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
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
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign adjustments_address0 = zext_ln220_fu_106_p1;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((indices_23_out_full_n == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_return = ((tmp_fu_152_p3[0:0] == 1'b1) ? 16'd0 : grp_fu_89_p2);

assign bitcast_ln648_fu_148_p1 = grp_fu_89_p2;

assign grp_fu_89_p1 = tmp_54_i_i_reg_188;

assign grp_fu_93_p1 = trunc_ln220_fu_111_p1;

assign grp_fu_98_p1 = tmp_53_i_i_reg_183;

assign indices_23_out_din = indices_23_dout;

assign tmp_fu_152_p3 = bitcast_ln648_fu_148_p1[32'd15];

assign trunc_ln220_fu_111_p1 = adjustments_q0[15:0];

assign trunc_ln251_fu_102_p1 = indices_23_dout[6:0];

assign zext_ln220_fu_106_p1 = trunc_ln251_fu_102_p1;

endmodule //td_fused_top_tdf4_adjust
module td_fused_top_Block_entry_proc_proc403 (
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

endmodule //td_fused_top_Block_entry_proc_proc403
module td_fused_top_tdf4_accum_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_12,
        accum_in_12_ap_vld,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_12;
output   accum_in_12_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_12;
reg accum_in_12_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln164_fu_74_p2;
reg   [3:0] add_ln164_reg_91;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln164_fu_85_p2;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state7;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln164_fu_80_p1;
reg   [15:0] accum_in_12_preg;
reg   [6:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
#0 accum_in_12_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U224(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_q0),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_12_preg <= 16'd0;
    end else begin
        if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_12_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        i_1_1_reg_44 <= add_ln164_reg_91;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_55 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        sum_01_reg_55 <= grp_fu_68_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln164_reg_91 <= add_ln164_fu_74_p2;
    end
end

always @ (*) begin
    if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_12 = sum_01_reg_55;
    end else begin
        accum_in_12 = accum_in_12_preg;
    end
end

always @ (*) begin
    if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_12_ap_vld = 1'b1;
    end else begin
        accum_in_12_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln164_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln164_fu_80_p1;

assign add_ln164_fu_74_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln164_fu_85_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln164_fu_80_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf4_accum_2
module td_fused_top_tdf4_accum_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_0_address0,
        accum_in_0_ce0,
        accum_in_0_q0,
        accum_in_0_address1,
        accum_in_0_ce1,
        accum_in_0_q1,
        accum_out_address0,
        accum_out_ce0,
        accum_out_we0,
        accum_out_d0,
        accum_out_address1,
        accum_out_ce1,
        accum_out_we1,
        accum_out_d1
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_pp0_stage0 = 8'd2;
parameter    ap_ST_fsm_pp0_stage1 = 8'd4;
parameter    ap_ST_fsm_pp0_stage2 = 8'd8;
parameter    ap_ST_fsm_pp0_stage3 = 8'd16;
parameter    ap_ST_fsm_state12 = 8'd32;
parameter    ap_ST_fsm_state13 = 8'd64;
parameter    ap_ST_fsm_state14 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [7:0] accum_in_0_address0;
output   accum_in_0_ce0;
input  [15:0] accum_in_0_q0;
output  [7:0] accum_in_0_address1;
output   accum_in_0_ce1;
input  [15:0] accum_in_0_q1;
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
reg[7:0] accum_in_0_address0;
reg accum_in_0_ce0;
reg[7:0] accum_in_0_address1;
reg accum_in_0_ce1;
reg accum_out_ce0;
reg accum_out_we0;
reg accum_out_ce1;
reg accum_out_we1;

reg    ap_done_reg;
  reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] x_reg_168;
reg   [15:0] psum_7_08_reg_180;
reg   [15:0] psum_6_07_reg_192;
reg   [15:0] psum_5_06_reg_204;
reg   [15:0] psum_4_05_reg_216;
reg   [15:0] psum_3_04_reg_228;
reg   [15:0] psum_2_03_reg_240;
reg   [15:0] psum_1_02_reg_252;
reg   [15:0] psum_0_01_reg_264;
wire   [0:0] icmp_ln132_fu_321_p2;
reg   [0:0] icmp_ln132_reg_492;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
wire    ap_block_state10_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln132_reg_492_pp0_iter1_reg;
reg   [0:0] icmp_ln132_reg_492_pp0_iter2_reg;
reg   [15:0] accum_in_0_load_reg_506;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state7_pp0_stage1_iter1;
wire    ap_block_state11_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in_0_load_36_reg_511;
reg   [15:0] accum_in_0_load_37_reg_526;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state8_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in_0_load_38_reg_531;
wire   [7:0] add_ln132_fu_387_p2;
reg   [7:0] add_ln132_reg_546;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state9_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
reg   [15:0] accum_in_0_load_39_reg_551;
reg   [15:0] accum_in_0_load_40_reg_556;
reg   [15:0] accum_in_0_load_41_reg_571;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_0_load_42_reg_576;
wire   [15:0] grp_fu_305_p2;
wire   [15:0] grp_fu_310_p2;
reg    ap_enable_reg_pp0_iter2;
wire   [3:0] add_ln140_fu_432_p2;
wire    ap_CS_fsm_state13;
wire   [0:0] tmp_fu_415_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage2_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_pp0_stage1_subdone;
reg   [7:0] ap_phi_mux_x_phi_fu_172_p4;
wire    ap_block_pp0_stage0;
wire   [15:0] ap_phi_mux_psum_7_08_phi_fu_184_p4;
wire    ap_block_pp0_stage1;
wire   [15:0] ap_phi_mux_psum_6_07_phi_fu_196_p4;
wire   [15:0] ap_phi_mux_psum_5_06_phi_fu_208_p4;
wire   [15:0] ap_phi_mux_psum_4_05_phi_fu_220_p4;
wire   [15:0] ap_phi_mux_psum_3_04_phi_fu_232_p4;
wire    ap_block_pp0_stage3;
wire   [15:0] ap_phi_mux_psum_2_03_phi_fu_244_p4;
wire    ap_block_pp0_stage2;
reg   [3:0] q_reg_276;
wire    ap_CS_fsm_state12;
reg   [15:0] ap_phi_mux_phi_ln152_phi_fu_290_p8;
wire   [2:0] trunc_ln140_fu_428_p1;
wire   [63:0] zext_ln132_fu_327_p1;
wire   [63:0] zext_ln136_fu_338_p1;
wire   [63:0] zext_ln136_7_fu_349_p1;
wire   [63:0] zext_ln136_8_fu_360_p1;
wire   [63:0] zext_ln136_9_fu_371_p1;
wire   [63:0] zext_ln136_10_fu_382_p1;
wire   [63:0] zext_ln136_11_fu_399_p1;
wire   [63:0] zext_ln136_12_fu_410_p1;
wire   [63:0] zext_ln140_fu_423_p1;
wire   [63:0] zext_ln140_2_fu_444_p1;
reg   [15:0] grp_fu_305_p0;
reg   [15:0] grp_fu_305_p1;
reg   [15:0] grp_fu_310_p0;
reg   [15:0] grp_fu_310_p1;
wire   [7:0] or_ln136_fu_332_p2;
wire   [7:0] or_ln136_7_fu_343_p2;
wire   [7:0] or_ln136_8_fu_354_p2;
wire   [7:0] or_ln136_9_fu_365_p2;
wire   [7:0] or_ln136_10_fu_376_p2;
wire   [7:0] or_ln136_11_fu_393_p2;
wire   [7:0] or_ln136_12_fu_404_p2;
wire   [2:0] or_ln140_fu_438_p2;
wire   [0:0] icmp_ln152_fu_449_p2;
wire   [0:0] icmp_ln152_3_fu_463_p2;
wire   [15:0] select_ln152_fu_455_p3;
wire   [0:0] icmp_ln152_4_fu_477_p2;
wire   [15:0] select_ln152_3_fu_469_p3;
wire    ap_CS_fsm_state14;
reg   [7:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_514;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U220(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_305_p0),
    .din1(grp_fu_305_p1),
    .dout(grp_fu_305_p2)
);

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U221(
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
        end else if ((1'b1 == ap_CS_fsm_state14)) begin
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
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        q_reg_276 <= 4'd0;
    end else if (((tmp_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state13))) begin
        q_reg_276 <= add_ln140_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        x_reg_168 <= add_ln132_reg_546;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_168 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        accum_in_0_load_36_reg_511 <= accum_in_0_q0;
        accum_in_0_load_reg_506 <= accum_in_0_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        accum_in_0_load_37_reg_526 <= accum_in_0_q1;
        accum_in_0_load_38_reg_531 <= accum_in_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        accum_in_0_load_39_reg_551 <= accum_in_0_q1;
        accum_in_0_load_40_reg_556 <= accum_in_0_q0;
        add_ln132_reg_546 <= add_ln132_fu_387_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_0_load_41_reg_571 <= accum_in_0_q1;
        accum_in_0_load_42_reg_576 <= accum_in_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln132_reg_492 <= icmp_ln132_fu_321_p2;
        icmp_ln132_reg_492_pp0_iter1_reg <= icmp_ln132_reg_492;
        icmp_ln132_reg_492_pp0_iter2_reg <= icmp_ln132_reg_492_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        psum_0_01_reg_264 <= grp_fu_305_p2;
        psum_1_02_reg_252 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        psum_2_03_reg_240 <= grp_fu_305_p2;
        psum_3_04_reg_228 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        psum_4_05_reg_216 <= grp_fu_305_p2;
        psum_5_06_reg_204 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln132_reg_492_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        psum_6_07_reg_192 <= grp_fu_305_p2;
        psum_7_08_reg_180 <= grp_fu_310_p2;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            accum_in_0_address0 = zext_ln136_12_fu_410_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_0_address0 = zext_ln136_10_fu_382_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_0_address0 = zext_ln136_8_fu_360_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_0_address0 = zext_ln136_fu_338_p1;
        end else begin
            accum_in_0_address0 = 'bx;
        end
    end else begin
        accum_in_0_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            accum_in_0_address1 = zext_ln136_11_fu_399_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_0_address1 = zext_ln136_9_fu_371_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_0_address1 = zext_ln136_7_fu_349_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_0_address1 = zext_ln132_fu_327_p1;
        end else begin
            accum_in_0_address1 = 'bx;
        end
    end else begin
        accum_in_0_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        accum_in_0_ce0 = 1'b1;
    end else begin
        accum_in_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        accum_in_0_ce1 = 1'b1;
    end else begin
        accum_in_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        accum_out_ce1 = 1'b1;
    end else begin
        accum_out_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state13))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state13))) begin
        accum_out_we1 = 1'b1;
    end else begin
        accum_out_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln132_reg_492 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state13))) begin
        if ((trunc_ln140_fu_428_p1 == 3'd0)) begin
            ap_phi_mux_phi_ln152_phi_fu_290_p8 = psum_0_01_reg_264;
        end else if ((1'b1 == ap_condition_514)) begin
            ap_phi_mux_phi_ln152_phi_fu_290_p8 = psum_6_07_reg_192;
        end else if ((trunc_ln140_fu_428_p1 == 3'd4)) begin
            ap_phi_mux_phi_ln152_phi_fu_290_p8 = psum_4_05_reg_216;
        end else if ((trunc_ln140_fu_428_p1 == 3'd2)) begin
            ap_phi_mux_phi_ln152_phi_fu_290_p8 = psum_2_03_reg_240;
        end else begin
            ap_phi_mux_phi_ln152_phi_fu_290_p8 = 'bx;
        end
    end else begin
        ap_phi_mux_phi_ln152_phi_fu_290_p8 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln132_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_x_phi_fu_172_p4 = add_ln132_reg_546;
    end else begin
        ap_phi_mux_x_phi_fu_172_p4 = x_reg_168;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_305_p0 = ap_phi_mux_psum_6_07_phi_fu_196_p4;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_305_p0 = ap_phi_mux_psum_4_05_phi_fu_220_p4;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_305_p0 = ap_phi_mux_psum_2_03_phi_fu_244_p4;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_305_p0 = grp_fu_305_p2;
    end else begin
        grp_fu_305_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_305_p1 = accum_in_0_load_41_reg_571;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_305_p1 = accum_in_0_load_39_reg_551;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_305_p1 = accum_in_0_load_37_reg_526;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_305_p1 = accum_in_0_load_reg_506;
    end else begin
        grp_fu_305_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_310_p0 = ap_phi_mux_psum_7_08_phi_fu_184_p4;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_310_p0 = ap_phi_mux_psum_5_06_phi_fu_208_p4;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_310_p0 = ap_phi_mux_psum_3_04_phi_fu_232_p4;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_310_p0 = grp_fu_310_p2;
    end else begin
        grp_fu_310_p0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_310_p1 = accum_in_0_load_42_reg_576;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_310_p1 = accum_in_0_load_40_reg_556;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_310_p1 = accum_in_0_load_38_reg_531;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_310_p1 = accum_in_0_load_36_reg_511;
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
            if ((~((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln132_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln132_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            if (((tmp_fu_415_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_out_address0 = zext_ln140_2_fu_444_p1;

assign accum_out_address1 = zext_ln140_fu_423_p1;

assign accum_out_d0 = ((icmp_ln152_4_fu_477_p2[0:0] == 1'b1) ? psum_5_06_reg_204 : select_ln152_3_fu_469_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln152_phi_fu_290_p8;

assign add_ln132_fu_387_p2 = (x_reg_168 + 8'd8);

assign add_ln140_fu_432_p2 = (q_reg_276 + 4'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd7];

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

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state10_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage3_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_514 = (~(trunc_ln140_fu_428_p1 == 3'd0) & ~(trunc_ln140_fu_428_p1 == 3'd4) & ~(trunc_ln140_fu_428_p1 == 3'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_psum_2_03_phi_fu_244_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_3_04_phi_fu_232_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_4_05_phi_fu_220_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_5_06_phi_fu_208_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_6_07_phi_fu_196_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_7_08_phi_fu_184_p4 = grp_fu_310_p2;

assign icmp_ln132_fu_321_p2 = ((ap_phi_mux_x_phi_fu_172_p4 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln152_3_fu_463_p2 = ((or_ln140_fu_438_p2 == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln152_4_fu_477_p2 = ((or_ln140_fu_438_p2 == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln152_fu_449_p2 = ((or_ln140_fu_438_p2 == 3'd1) ? 1'b1 : 1'b0);

assign or_ln136_10_fu_376_p2 = (x_reg_168 | 8'd5);

assign or_ln136_11_fu_393_p2 = (x_reg_168 | 8'd6);

assign or_ln136_12_fu_404_p2 = (x_reg_168 | 8'd7);

assign or_ln136_7_fu_343_p2 = (x_reg_168 | 8'd2);

assign or_ln136_8_fu_354_p2 = (x_reg_168 | 8'd3);

assign or_ln136_9_fu_365_p2 = (x_reg_168 | 8'd4);

assign or_ln136_fu_332_p2 = (ap_phi_mux_x_phi_fu_172_p4 | 8'd1);

assign or_ln140_fu_438_p2 = (trunc_ln140_fu_428_p1 | 3'd1);

assign select_ln152_3_fu_469_p3 = ((icmp_ln152_3_fu_463_p2[0:0] == 1'b1) ? psum_3_04_reg_228 : select_ln152_fu_455_p3);

assign select_ln152_fu_455_p3 = ((icmp_ln152_fu_449_p2[0:0] == 1'b1) ? psum_1_02_reg_252 : psum_7_08_reg_180);

assign tmp_fu_415_p3 = q_reg_276[32'd3];

assign trunc_ln140_fu_428_p1 = q_reg_276[2:0];

assign zext_ln132_fu_327_p1 = ap_phi_mux_x_phi_fu_172_p4;

assign zext_ln136_10_fu_382_p1 = or_ln136_10_fu_376_p2;

assign zext_ln136_11_fu_399_p1 = or_ln136_11_fu_393_p2;

assign zext_ln136_12_fu_410_p1 = or_ln136_12_fu_404_p2;

assign zext_ln136_7_fu_349_p1 = or_ln136_7_fu_343_p2;

assign zext_ln136_8_fu_360_p1 = or_ln136_8_fu_354_p2;

assign zext_ln136_9_fu_371_p1 = or_ln136_9_fu_365_p2;

assign zext_ln136_fu_338_p1 = or_ln136_fu_332_p2;

assign zext_ln140_2_fu_444_p1 = or_ln140_fu_438_p2;

assign zext_ln140_fu_423_p1 = q_reg_276;

endmodule //td_fused_top_tdf4_accum_1
module td_fused_top_tdf4_dot_product (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_q0,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_q0,
        products_0_address0,
        products_0_ce0,
        products_0_we0,
        products_0_d0
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
output  [7:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
input  [15:0] ifmap_vec_q0;
output  [7:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
input  [15:0] weight_vecs_0_q0;
output  [7:0] products_0_address0;
output   products_0_ce0;
output   products_0_we0;
output  [15:0] products_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_ce0;
reg weight_vecs_0_ce0;
reg products_0_ce0;
reg products_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] indvar_flatten17_reg_97;
reg   [6:0] indvar_flatten_reg_108;
reg   [1:0] jj_reg_119;
reg   [4:0] ic_reg_131;
reg   [1:0] ii_reg_142;
wire   [7:0] add_ln147_4_fu_157_p2;
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
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln147_fu_163_p2;
reg   [0:0] icmp_ln147_reg_408;
reg   [0:0] icmp_ln147_reg_408_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter4_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter5_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter6_reg;
wire   [0:0] icmp_ln148_fu_169_p2;
reg   [0:0] icmp_ln148_reg_412;
wire   [0:0] and_ln147_fu_195_p2;
reg   [0:0] and_ln147_reg_419;
wire   [1:0] add_ln148_fu_201_p2;
reg   [1:0] add_ln148_reg_424;
wire   [4:0] select_ln148_fu_213_p3;
reg   [4:0] select_ln148_reg_429;
wire   [1:0] select_ln148_10_fu_221_p3;
reg   [1:0] select_ln148_10_reg_434;
wire   [3:0] trunc_ln150_fu_229_p1;
reg   [3:0] trunc_ln150_reg_440;
reg   [3:0] trunc_ln150_reg_440_pp0_iter1_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter2_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter3_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter4_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter5_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter6_reg;
wire   [4:0] add_ln149_fu_233_p2;
wire   [6:0] select_ln148_12_fu_245_p3;
wire   [1:0] select_ln147_11_fu_287_p3;
reg   [1:0] select_ln147_11_reg_455;
reg    ap_enable_reg_pp0_iter1;
wire   [3:0] select_ln148_11_fu_370_p3;
reg   [3:0] select_ln148_11_reg_460;
reg   [3:0] select_ln148_11_reg_460_pp0_iter2_reg;
reg   [3:0] select_ln148_11_reg_460_pp0_iter3_reg;
reg   [3:0] select_ln148_11_reg_460_pp0_iter4_reg;
reg   [3:0] select_ln148_11_reg_460_pp0_iter5_reg;
reg   [3:0] select_ln148_11_reg_460_pp0_iter6_reg;
reg   [15:0] ifmap_vec_load_reg_475;
reg   [15:0] weight_vecs_0_load_reg_480;
wire   [15:0] grp_fu_153_p2;
reg   [15:0] mul_reg_485;
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
reg   [1:0] ap_phi_mux_jj_phi_fu_123_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_146_p4;
wire   [63:0] p_cast25_fu_386_p1;
wire   [63:0] idxprom30_fu_398_p1;
wire   [0:0] icmp_ln149_fu_189_p2;
wire   [0:0] xor_ln147_fu_183_p2;
wire   [1:0] select_ln147_fu_175_p3;
wire   [0:0] or_ln148_fu_207_p2;
wire   [6:0] add_ln148_4_fu_239_p2;
wire   [3:0] shl_ln_fu_257_p3;
wire   [3:0] zext_ln150_fu_253_p1;
wire   [3:0] sub_ln150_fu_265_p2;
wire   [3:0] zext_ln150_4_fu_271_p1;
wire   [1:0] add_ln147_fu_281_p2;
wire   [3:0] tmp_fu_298_p3;
wire   [3:0] select_ln147_14_cast_fu_294_p1;
wire   [3:0] shl_ln150_mid1_fu_316_p3;
wire   [3:0] zext_ln150_8_fu_312_p1;
wire   [3:0] sub_ln150_4_fu_324_p2;
wire   [3:0] add_ln150_fu_275_p2;
wire   [3:0] empty_98_fu_306_p2;
wire   [3:0] select_ln148_13_cast_fu_344_p1;
wire   [3:0] empty_99_fu_347_p2;
wire   [3:0] select_ln147_12_fu_330_p3;
wire   [3:0] zext_ln150_9_fu_361_p1;
wire   [3:0] add_ln150_4_fu_364_p2;
wire   [3:0] select_ln147_13_fu_337_p3;
wire   [7:0] tmp_100_cast_fu_353_p3;
wire   [7:0] select_ln148_cast_fu_377_p1;
wire   [7:0] empty_100_fu_380_p2;
wire   [7:0] p_fu_392_p3;
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

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U216(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_475),
    .din1(weight_vecs_0_load_reg_480),
    .dout(grp_fu_153_p2)
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ic_reg_131 <= add_ln149_fu_233_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_131 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ii_reg_142 <= select_ln147_11_reg_455;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_142 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten17_reg_97 <= add_ln147_4_fu_157_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten17_reg_97 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_108 <= select_ln148_12_fu_245_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_108 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_119 <= select_ln148_10_reg_434;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_119 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln148_reg_424 <= add_ln148_fu_201_p2;
        and_ln147_reg_419 <= and_ln147_fu_195_p2;
        icmp_ln148_reg_412 <= icmp_ln148_fu_169_p2;
        select_ln148_reg_429 <= select_ln148_fu_213_p3;
        trunc_ln150_reg_440 <= trunc_ln150_fu_229_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln147_reg_408 <= icmp_ln147_fu_163_p2;
        icmp_ln147_reg_408_pp0_iter1_reg <= icmp_ln147_reg_408;
        trunc_ln150_reg_440_pp0_iter1_reg <= trunc_ln150_reg_440;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_408_pp0_iter2_reg <= icmp_ln147_reg_408_pp0_iter1_reg;
        icmp_ln147_reg_408_pp0_iter3_reg <= icmp_ln147_reg_408_pp0_iter2_reg;
        icmp_ln147_reg_408_pp0_iter4_reg <= icmp_ln147_reg_408_pp0_iter3_reg;
        icmp_ln147_reg_408_pp0_iter5_reg <= icmp_ln147_reg_408_pp0_iter4_reg;
        icmp_ln147_reg_408_pp0_iter6_reg <= icmp_ln147_reg_408_pp0_iter5_reg;
        select_ln148_11_reg_460_pp0_iter2_reg <= select_ln148_11_reg_460;
        select_ln148_11_reg_460_pp0_iter3_reg <= select_ln148_11_reg_460_pp0_iter2_reg;
        select_ln148_11_reg_460_pp0_iter4_reg <= select_ln148_11_reg_460_pp0_iter3_reg;
        select_ln148_11_reg_460_pp0_iter5_reg <= select_ln148_11_reg_460_pp0_iter4_reg;
        select_ln148_11_reg_460_pp0_iter6_reg <= select_ln148_11_reg_460_pp0_iter5_reg;
        trunc_ln150_reg_440_pp0_iter2_reg <= trunc_ln150_reg_440_pp0_iter1_reg;
        trunc_ln150_reg_440_pp0_iter3_reg <= trunc_ln150_reg_440_pp0_iter2_reg;
        trunc_ln150_reg_440_pp0_iter4_reg <= trunc_ln150_reg_440_pp0_iter3_reg;
        trunc_ln150_reg_440_pp0_iter5_reg <= trunc_ln150_reg_440_pp0_iter4_reg;
        trunc_ln150_reg_440_pp0_iter6_reg <= trunc_ln150_reg_440_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_load_reg_475 <= ifmap_vec_q0;
        weight_vecs_0_load_reg_480 <= weight_vecs_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_reg_485 <= grp_fu_153_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        select_ln147_11_reg_455 <= select_ln147_11_fu_287_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_10_reg_434 <= select_ln148_10_fu_221_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_11_reg_460 <= select_ln148_11_fu_370_p3;
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
    if (((icmp_ln147_fu_163_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_146_p4 = select_ln147_11_reg_455;
    end else begin
        ap_phi_mux_ii_phi_fu_146_p4 = ii_reg_142;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_123_p4 = select_ln148_10_reg_434;
    end else begin
        ap_phi_mux_jj_phi_fu_123_p4 = jj_reg_119;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        products_0_ce0 = 1'b1;
    end else begin
        products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        products_0_we0 = 1'b1;
    end else begin
        products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
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

assign add_ln147_4_fu_157_p2 = (indvar_flatten17_reg_97 + 8'd1);

assign add_ln147_fu_281_p2 = (ap_phi_mux_ii_phi_fu_146_p4 + 2'd1);

assign add_ln148_4_fu_239_p2 = (indvar_flatten_reg_108 + 7'd1);

assign add_ln148_fu_201_p2 = (select_ln147_fu_175_p3 + 2'd1);

assign add_ln149_fu_233_p2 = (select_ln148_fu_213_p3 + 5'd1);

assign add_ln150_4_fu_364_p2 = (select_ln147_12_fu_330_p3 + zext_ln150_9_fu_361_p1);

assign add_ln150_fu_275_p2 = (sub_ln150_fu_265_p2 + zext_ln150_4_fu_271_p1);

assign and_ln147_fu_195_p2 = (xor_ln147_fu_183_p2 & icmp_ln149_fu_189_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

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

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_100_fu_380_p2 = (tmp_100_cast_fu_353_p3 + select_ln148_cast_fu_377_p1);

assign empty_98_fu_306_p2 = (tmp_fu_298_p3 - select_ln147_14_cast_fu_294_p1);

assign empty_99_fu_347_p2 = (empty_98_fu_306_p2 + select_ln148_13_cast_fu_344_p1);

assign icmp_ln147_fu_163_p2 = ((indvar_flatten17_reg_97 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_169_p2 = ((indvar_flatten_reg_108 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_189_p2 = ((ic_reg_131 == 5'd16) ? 1'b1 : 1'b0);

assign idxprom30_fu_398_p1 = p_fu_392_p3;

assign ifmap_vec_address0 = p_cast25_fu_386_p1;

assign or_ln148_fu_207_p2 = (icmp_ln148_fu_169_p2 | and_ln147_fu_195_p2);

assign p_cast25_fu_386_p1 = empty_100_fu_380_p2;

assign p_fu_392_p3 = {{select_ln148_11_reg_460_pp0_iter6_reg}, {trunc_ln150_reg_440_pp0_iter6_reg}};

assign products_0_address0 = idxprom30_fu_398_p1;

assign products_0_d0 = mul_reg_485;

assign select_ln147_11_fu_287_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? add_ln147_fu_281_p2 : ap_phi_mux_ii_phi_fu_146_p4);

assign select_ln147_12_fu_330_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_4_fu_324_p2 : sub_ln150_fu_265_p2);

assign select_ln147_13_fu_337_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_4_fu_324_p2 : add_ln150_fu_275_p2);

assign select_ln147_14_cast_fu_294_p1 = select_ln147_11_fu_287_p3;

assign select_ln147_fu_175_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_123_p4);

assign select_ln148_10_fu_221_p3 = ((and_ln147_fu_195_p2[0:0] == 1'b1) ? add_ln148_fu_201_p2 : select_ln147_fu_175_p3);

assign select_ln148_11_fu_370_p3 = ((and_ln147_reg_419[0:0] == 1'b1) ? add_ln150_4_fu_364_p2 : select_ln147_13_fu_337_p3);

assign select_ln148_12_fu_245_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 7'd1 : add_ln148_4_fu_239_p2);

assign select_ln148_13_cast_fu_344_p1 = select_ln148_10_reg_434;

assign select_ln148_cast_fu_377_p1 = select_ln148_reg_429;

assign select_ln148_fu_213_p3 = ((or_ln148_fu_207_p2[0:0] == 1'b1) ? 5'd0 : ic_reg_131);

assign shl_ln150_mid1_fu_316_p3 = {{add_ln147_fu_281_p2}, {2'd0}};

assign shl_ln_fu_257_p3 = {{ap_phi_mux_ii_phi_fu_146_p4}, {2'd0}};

assign sub_ln150_4_fu_324_p2 = (shl_ln150_mid1_fu_316_p3 - zext_ln150_8_fu_312_p1);

assign sub_ln150_fu_265_p2 = (shl_ln_fu_257_p3 - zext_ln150_fu_253_p1);

assign tmp_100_cast_fu_353_p3 = {{empty_99_fu_347_p2}, {4'd0}};

assign tmp_fu_298_p3 = {{select_ln147_11_fu_287_p3}, {2'd0}};

assign trunc_ln150_fu_229_p1 = select_ln148_fu_213_p3[3:0];

assign weight_vecs_0_address0 = p_cast25_fu_386_p1;

assign xor_ln147_fu_183_p2 = (icmp_ln148_fu_169_p2 ^ 1'd1);

assign zext_ln150_4_fu_271_p1 = jj_reg_119;

assign zext_ln150_8_fu_312_p1 = add_ln147_fu_281_p2;

assign zext_ln150_9_fu_361_p1 = add_ln148_reg_424;

assign zext_ln150_fu_253_p1 = ap_phi_mux_ii_phi_fu_146_p4;

endmodule //td_fused_top_tdf4_dot_product
module td_fused_top_tdf4_readFilters36 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        filter_data_address0,
        filter_data_ce0,
        filter_data_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_we0,
        weight_vecs_0_d0
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
output  [14:0] filter_data_address0;
output   filter_data_ce0;
input  [15:0] filter_data_q0;
input  [6:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [7:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_ce0;
reg indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [7:0] indvar_flatten13_reg_123;
reg   [1:0] ii_reg_134;
reg   [6:0] indvar_flatten_reg_145;
reg   [1:0] jj_reg_156;
reg   [4:0] kk_reg_167;
wire   [10:0] sext_ln47_fu_200_p1;
reg   [10:0] sext_ln47_reg_408;
wire   [7:0] add_ln47_4_fu_204_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_210_p2;
reg   [0:0] icmp_ln47_reg_418;
reg   [0:0] icmp_ln47_reg_418_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_418_pp0_iter2_reg;
reg   [0:0] icmp_ln47_reg_418_pp0_iter3_reg;
wire   [0:0] icmp_ln48_fu_222_p2;
reg   [0:0] icmp_ln48_reg_422;
wire   [1:0] select_ln47_4_fu_228_p3;
reg   [1:0] select_ln47_4_reg_429;
wire   [6:0] select_ln48_8_fu_242_p3;
wire   [1:0] select_ln48_7_fu_329_p3;
reg   [1:0] select_ln48_7_reg_442;
reg    ap_enable_reg_pp0_iter1;
wire   [7:0] add_ln55_16_fu_392_p2;
reg   [7:0] add_ln55_16_reg_452;
reg   [7:0] add_ln55_16_reg_452_pp0_iter2_reg;
reg   [7:0] add_ln55_16_reg_452_pp0_iter3_reg;
wire   [4:0] add_ln49_fu_398_p2;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_138_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_160_p4;
wire   [63:0] zext_ln55_37_fu_387_p1;
wire   [63:0] zext_ln55_38_fu_404_p1;
wire   [8:0] tmp_fu_182_p3;
wire   [9:0] zext_ln55_30_fu_190_p1;
wire   [9:0] zext_ln55_fu_178_p1;
wire   [9:0] sub_ln55_fu_194_p2;
wire   [1:0] add_ln47_fu_216_p2;
wire   [6:0] add_ln48_4_fu_236_p2;
wire   [10:0] zext_ln55_32_fu_260_p1;
wire   [10:0] add_ln55_fu_263_p2;
wire   [10:0] shl_ln55_fu_268_p2;
wire   [3:0] tmp_s_fu_280_p3;
wire   [3:0] zext_ln55_31_fu_257_p1;
wire   [0:0] icmp_ln49_fu_298_p2;
wire   [0:0] xor_ln47_fu_293_p2;
wire   [1:0] select_ln47_fu_250_p3;
wire   [0:0] and_ln47_fu_304_p2;
wire   [0:0] or_ln48_fu_316_p2;
wire   [1:0] add_ln48_fu_310_p2;
wire   [10:0] sub_ln55_7_fu_274_p2;
wire   [10:0] zext_ln55_34_fu_341_p1;
wire   [10:0] add_ln55_13_fu_345_p2;
wire   [3:0] sub_ln55_8_fu_287_p2;
wire   [3:0] zext_ln55_33_fu_337_p1;
wire   [3:0] add_ln55_14_fu_359_p2;
wire   [4:0] select_ln48_fu_321_p3;
wire   [14:0] tmp_91_cast_fu_351_p3;
wire   [14:0] zext_ln55_36_fu_377_p1;
wire   [14:0] add_ln55_15_fu_381_p2;
wire   [7:0] tmp_93_cast_fu_365_p3;
wire   [7:0] zext_ln55_35_fu_373_p1;
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_134 <= select_ln47_4_reg_429;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_134 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten13_reg_123 <= add_ln47_4_fu_204_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_123 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_145 <= select_ln48_8_fu_242_p3;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_145 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        jj_reg_156 <= select_ln48_7_reg_442;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_156 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_167 <= add_ln49_fu_398_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_167 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln55_16_reg_452 <= add_ln55_16_fu_392_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_16_reg_452_pp0_iter2_reg <= add_ln55_16_reg_452;
        add_ln55_16_reg_452_pp0_iter3_reg <= add_ln55_16_reg_452_pp0_iter2_reg;
        icmp_ln47_reg_418_pp0_iter2_reg <= icmp_ln47_reg_418_pp0_iter1_reg;
        icmp_ln47_reg_418_pp0_iter3_reg <= icmp_ln47_reg_418_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln47_reg_418 <= icmp_ln47_fu_210_p2;
        icmp_ln47_reg_418_pp0_iter1_reg <= icmp_ln47_reg_418;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln48_reg_422 <= icmp_ln48_fu_222_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln47_4_reg_429 <= select_ln47_4_fu_228_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln48_7_reg_442 <= select_ln48_7_fu_329_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_408 <= sext_ln47_fu_200_p1;
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
    if (((icmp_ln47_fu_210_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_138_p4 = select_ln47_4_reg_429;
    end else begin
        ap_phi_mux_ii_phi_fu_138_p4 = ii_reg_134;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_160_p4 = select_ln48_7_reg_442;
    end else begin
        ap_phi_mux_jj_phi_fu_160_p4 = jj_reg_156;
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
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        filter_data_ce0 = 1'b1;
    end else begin
        filter_data_ce0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_418_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
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

assign add_ln47_4_fu_204_p2 = (indvar_flatten13_reg_123 + 8'd1);

assign add_ln47_fu_216_p2 = (ap_phi_mux_ii_phi_fu_138_p4 + 2'd1);

assign add_ln48_4_fu_236_p2 = (indvar_flatten_reg_145 + 7'd1);

assign add_ln48_fu_310_p2 = (select_ln47_fu_250_p3 + 2'd1);

assign add_ln49_fu_398_p2 = (select_ln48_fu_321_p3 + 5'd1);

assign add_ln55_13_fu_345_p2 = (sub_ln55_7_fu_274_p2 + zext_ln55_34_fu_341_p1);

assign add_ln55_14_fu_359_p2 = (sub_ln55_8_fu_287_p2 + zext_ln55_33_fu_337_p1);

assign add_ln55_15_fu_381_p2 = (tmp_91_cast_fu_351_p3 + zext_ln55_36_fu_377_p1);

assign add_ln55_16_fu_392_p2 = (tmp_93_cast_fu_365_p3 + zext_ln55_35_fu_373_p1);

assign add_ln55_fu_263_p2 = ((sext_ln47_reg_408) + (zext_ln55_32_fu_260_p1));

assign and_ln47_fu_304_p2 = (xor_ln47_fu_293_p2 & icmp_ln49_fu_298_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_address0 = zext_ln55_37_fu_387_p1;

assign icmp_ln47_fu_210_p2 = ((indvar_flatten13_reg_123 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_222_p2 = ((indvar_flatten_reg_145 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_298_p2 = ((kk_reg_167 == 5'd16) ? 1'b1 : 1'b0);

assign or_ln48_fu_316_p2 = (icmp_ln48_reg_422 | and_ln47_fu_304_p2);

assign select_ln47_4_fu_228_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? add_ln47_fu_216_p2 : ap_phi_mux_ii_phi_fu_138_p4);

assign select_ln47_fu_250_p3 = ((icmp_ln48_reg_422[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_160_p4);

assign select_ln48_7_fu_329_p3 = ((and_ln47_fu_304_p2[0:0] == 1'b1) ? add_ln48_fu_310_p2 : select_ln47_fu_250_p3);

assign select_ln48_8_fu_242_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? 7'd1 : add_ln48_4_fu_236_p2);

assign select_ln48_fu_321_p3 = ((or_ln48_fu_316_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_167);

assign sext_ln47_fu_200_p1 = (sub_ln55_fu_194_p2);

assign shl_ln55_fu_268_p2 = add_ln55_fu_263_p2 << 11'd2;

assign sub_ln55_7_fu_274_p2 = (shl_ln55_fu_268_p2 - add_ln55_fu_263_p2);

assign sub_ln55_8_fu_287_p2 = (tmp_s_fu_280_p3 - zext_ln55_31_fu_257_p1);

assign sub_ln55_fu_194_p2 = (zext_ln55_30_fu_190_p1 - zext_ln55_fu_178_p1);

assign tmp_91_cast_fu_351_p3 = {{add_ln55_13_fu_345_p2}, {4'd0}};

assign tmp_93_cast_fu_365_p3 = {{add_ln55_14_fu_359_p2}, {4'd0}};

assign tmp_fu_182_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_s_fu_280_p3 = {{select_ln47_4_reg_429}, {2'd0}};

assign weight_vecs_0_address0 = zext_ln55_38_fu_404_p1;

assign weight_vecs_0_d0 = filter_data_q0;

assign xor_ln47_fu_293_p2 = (icmp_ln48_reg_422 ^ 1'd1);

assign zext_ln55_30_fu_190_p1 = tmp_fu_182_p3;

assign zext_ln55_31_fu_257_p1 = select_ln47_4_reg_429;

assign zext_ln55_32_fu_260_p1 = select_ln47_4_reg_429;

assign zext_ln55_33_fu_337_p1 = select_ln48_7_fu_329_p3;

assign zext_ln55_34_fu_341_p1 = select_ln48_7_fu_329_p3;

assign zext_ln55_35_fu_373_p1 = select_ln48_fu_321_p3;

assign zext_ln55_36_fu_377_p1 = select_ln48_fu_321_p3;

assign zext_ln55_37_fu_387_p1 = add_ln55_15_fu_381_p2;

assign zext_ln55_38_fu_404_p1 = add_ln55_16_reg_452_pp0_iter3_reg;

assign zext_ln55_fu_178_p1 = indices_23_dout;

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
output  [6:0] indices_2_out_din;
input   indices_2_out_full_n;
output   indices_2_out_write;
output  [10:0] indices_2_out1_din;
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
reg   [0:0] ap_phi_mux_j_15_flag_0_i_phi_fu_92_p6;
reg    ap_block_state1;
wire   [0:0] icmp_ln188_fu_167_p2;
wire   [0:0] icmp_ln191_fu_180_p2;
reg   [15:0] ap_phi_mux_j_15_new_0_i_phi_fu_106_p6;
wire   [15:0] add_ln190_fu_173_p2;
reg   [15:0] ap_phi_mux_k_15_new_0_i_phi_fu_119_p6;
wire   [15:0] add_ln187_fu_160_p2;
wire   [15:0] select_ln194_fu_198_p3;
wire   [15:0] add_ln193_fu_186_p2;
wire   [0:0] icmp_ln194_fu_192_p2;
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
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (icmp_ln191_fu_180_p2 == 1'd1) & (icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_4 <= select_ln194_fu_198_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (ap_phi_mux_j_15_flag_0_i_phi_fu_92_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_4 <= ap_phi_mux_j_15_new_0_i_phi_fu_106_p6;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        k_4 <= ap_phi_mux_k_15_new_0_i_phi_fu_119_p6;
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
    if (((icmp_ln188_fu_167_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_92_p6 = 1'd0;
    end else if ((((icmp_ln191_fu_180_p2 == 1'd0) & (icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln191_fu_180_p2 == 1'd1) & (icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_92_p6 = 1'd1;
    end else begin
        ap_phi_mux_j_15_flag_0_i_phi_fu_92_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln191_fu_180_p2 == 1'd0)) begin
            ap_phi_mux_j_15_new_0_i_phi_fu_106_p6 = add_ln190_fu_173_p2;
        end else if ((icmp_ln191_fu_180_p2 == 1'd1)) begin
            ap_phi_mux_j_15_new_0_i_phi_fu_106_p6 = 16'd0;
        end else begin
            ap_phi_mux_j_15_new_0_i_phi_fu_106_p6 = 'bx;
        end
    end else begin
        ap_phi_mux_j_15_new_0_i_phi_fu_106_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln188_fu_167_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_k_15_new_0_i_phi_fu_119_p6 = add_ln187_fu_160_p2;
    end else if ((((icmp_ln191_fu_180_p2 == 1'd0) & (icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln191_fu_180_p2 == 1'd1) & (icmp_ln188_fu_167_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_k_15_new_0_i_phi_fu_119_p6 = 16'd0;
    end else begin
        ap_phi_mux_k_15_new_0_i_phi_fu_119_p6 = 'bx;
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

assign add_ln187_fu_160_p2 = (k_4 + 16'd1);

assign add_ln190_fu_173_p2 = (j_4 + 16'd1);

assign add_ln193_fu_186_p2 = (i_4 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (write_r_full_n == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign icmp_ln188_fu_167_p2 = ((add_ln187_fu_160_p2 == 16'd128) ? 1'b1 : 1'b0);

assign icmp_ln191_fu_180_p2 = ((add_ln190_fu_173_p2 == 16'd56) ? 1'b1 : 1'b0);

assign icmp_ln194_fu_192_p2 = ((add_ln193_fu_186_p2 == 16'd56) ? 1'b1 : 1'b0);

assign indices_0_din = i_4;

assign indices_1_din = j_4;

assign indices_2_out1_din = k_4[10:0];

assign indices_2_out_din = k_4[6:0];

assign select_ln194_fu_198_p3 = ((icmp_ln194_fu_192_p2[0:0] == 1'b1) ? 16'd0 : add_ln193_fu_186_p2);

assign start_out = real_start;

assign write_r_din = ((k_4 == 16'd127) ? 1'b1 : 1'b0);

endmodule //td_fused_top_tdf4_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 4,
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
td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_l2_products_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 8,
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore(
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
parameter AddressRange = 32'd144;
parameter AddressWidth = 32'd8;
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



td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_products_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 8;
parameter MEM_SIZE = 144;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 8,
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
td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore(
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
parameter AddressRange = 32'd288;
parameter AddressWidth = 32'd9;
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



td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_weight_vecs_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 9;
parameter MEM_SIZE = 288;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 8,
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore(
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
parameter AddressRange = 32'd144;
parameter AddressWidth = 32'd8;
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



td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37832_ifmap_vec_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 8;
parameter MEM_SIZE = 144;

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

module td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1
#(parameter
    ID         = 25,
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
td_fused_top_ap_hadd_3_full_dsp_16 td_fused_top_ap_hadd_3_full_dsp_16_u (
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

module td_fused_top_ap_hadd_3_full_dsp_16 (
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

module td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1
#(parameter
    ID         = 20,
    NUM_STAGE  = 4,
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
td_fused_top_ap_hmul_2_max_dsp_16 td_fused_top_ap_hmul_2_max_dsp_16_u (
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
module td_fused_top_ap_hmul_2_max_dsp_16 (
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

module td_fused_top_hsub_16ns_16ns_16_5_full_dsp_1
#(parameter
    ID         = 37,
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
// Just replace with the hadd, logic is similar enough.
//td_fused_top_ap_hsub_3_full_dsp_16 td_fused_top_ap_hsub_3_full_dsp_16_u (
td_fused_top_ap_hadd_3_full_dsp_16 td_fused_top_ap_hsub_3_full_dsp_16_u (
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


















