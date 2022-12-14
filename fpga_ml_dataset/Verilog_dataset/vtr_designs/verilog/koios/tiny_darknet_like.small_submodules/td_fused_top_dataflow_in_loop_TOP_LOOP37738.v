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

module td_fused_top_dataflow_in_loop_TOP_LOOP37738 (
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
        filter_data_address0,
        filter_data_ce0,
        filter_data_d0,
        filter_data_q0,
        filter_data_we0,
        filter_data_address1,
        filter_data_ce1,
        filter_data_d1,
        filter_data_q1,
        filter_data_we1,
        adjustments_address0,
        adjustments_ce0,
        adjustments_d0,
        adjustments_q0,
        adjustments_we0,
        adjustments_address1,
        adjustments_ce1,
        adjustments_d1,
        adjustments_q1,
        adjustments_we1,
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
output  [14:0] filter_data_address0;
output   filter_data_ce0;
output  [15:0] filter_data_d0;
input  [15:0] filter_data_q0;
output   filter_data_we0;
output  [14:0] filter_data_address1;
output   filter_data_ce1;
output  [15:0] filter_data_d1;
input  [15:0] filter_data_q1;
output   filter_data_we1;
output  [6:0] adjustments_address0;
output   adjustments_ce0;
output  [47:0] adjustments_d0;
input  [47:0] adjustments_q0;
output   adjustments_we0;
output  [6:0] adjustments_address1;
output   adjustments_ce1;
output  [47:0] adjustments_d1;
input  [47:0] adjustments_q1;
output   adjustments_we1;
output  [14:0] out_data_address0;
output   out_data_ce0;
output  [63:0] out_data_d0;
input  [63:0] out_data_q0;
output   out_data_we0;
output  [14:0] out_data_address1;
output   out_data_ce1;
output  [63:0] out_data_d1;
input  [63:0] out_data_q1;
output   out_data_we1;
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
wire    tdf5_get_next_ijk_U0_ap_start;
wire    tdf5_get_next_ijk_U0_ap_done;
wire    tdf5_get_next_ijk_U0_ap_continue;
wire    tdf5_get_next_ijk_U0_ap_idle;
wire    tdf5_get_next_ijk_U0_ap_ready;
wire    tdf5_get_next_ijk_U0_start_out;
wire    tdf5_get_next_ijk_U0_start_write;
wire   [6:0] tdf5_get_next_ijk_U0_input_indices_2_out_din;
wire    tdf5_get_next_ijk_U0_input_indices_2_out_write;
wire   [6:0] tdf5_get_next_ijk_U0_input_indices_2_out1_din;
wire    tdf5_get_next_ijk_U0_input_indices_2_out1_write;
wire   [4:0] tdf5_get_next_ijk_U0_output_indices_0_din;
wire    tdf5_get_next_ijk_U0_output_indices_0_write;
wire   [9:0] tdf5_get_next_ijk_U0_output_indices_1_din;
wire    tdf5_get_next_ijk_U0_output_indices_1_write;
wire    tdf5_get_next_ijk_U0_resetMaximum_din;
wire    tdf5_get_next_ijk_U0_resetMaximum_write;
wire    tdf5_get_next_ijk_U0_storeOutput_din;
wire    tdf5_get_next_ijk_U0_storeOutput_write;
wire   [15:0] tdf5_get_next_ijk_U0_ap_return_0;
wire   [15:0] tdf5_get_next_ijk_U0_ap_return_1;
wire    ap_channel_done_input_indices_1;
wire    input_indices_1_full_n;
reg    ap_sync_reg_channel_write_input_indices_1;
wire    ap_sync_channel_write_input_indices_1;
wire    ap_channel_done_input_indices_0;
wire    input_indices_0_full_n;
reg    ap_sync_reg_channel_write_input_indices_0;
wire    ap_sync_channel_write_input_indices_0;
wire    tdf5_readInputs41_U0_ap_start;
wire    tdf5_readInputs41_U0_ap_done;
wire    tdf5_readInputs41_U0_ap_continue;
wire    tdf5_readInputs41_U0_ap_idle;
wire    tdf5_readInputs41_U0_ap_ready;
wire   [13:0] tdf5_readInputs41_U0_in_data_address0;
wire    tdf5_readInputs41_U0_in_data_ce0;
wire   [7:0] tdf5_readInputs41_U0_ifmap_vec_address0;
wire    tdf5_readInputs41_U0_ifmap_vec_ce0;
wire    tdf5_readInputs41_U0_ifmap_vec_we0;
wire   [15:0] tdf5_readInputs41_U0_ifmap_vec_d0;
wire   [7:0] tdf5_readInputs41_U0_ifmap_vec_address1;
wire    tdf5_readInputs41_U0_ifmap_vec_ce1;
wire    tdf5_readInputs41_U0_ifmap_vec_we1;
wire   [15:0] tdf5_readInputs41_U0_ifmap_vec_d1;
wire    tdf5_readInputs41_U0_in_data_full_n;
wire    tdf5_readInputs41_U0_in_data_write;
wire    ap_channel_done_ifmap_vec;
wire    tdf5_readInputs41_U0_ifmap_vec_full_n;
wire    tdf5_readFilters40_U0_ap_start;
wire    tdf5_readFilters40_U0_ap_done;
wire    tdf5_readFilters40_U0_ap_continue;
wire    tdf5_readFilters40_U0_ap_idle;
wire    tdf5_readFilters40_U0_ap_ready;
wire   [14:0] tdf5_readFilters40_U0_filter_data_address0;
wire    tdf5_readFilters40_U0_filter_data_ce0;
wire    tdf5_readFilters40_U0_input_indices_23_read;
wire   [7:0] tdf5_readFilters40_U0_weight_vecs_0_address0;
wire    tdf5_readFilters40_U0_weight_vecs_0_ce0;
wire    tdf5_readFilters40_U0_weight_vecs_0_we0;
wire   [15:0] tdf5_readFilters40_U0_weight_vecs_0_d0;
wire    ap_channel_done_weight_vecs_0;
wire    tdf5_readFilters40_U0_weight_vecs_0_full_n;
wire    tdf5_dot_product_U0_ap_start;
wire    tdf5_dot_product_U0_ap_done;
wire    tdf5_dot_product_U0_ap_continue;
wire    tdf5_dot_product_U0_ap_idle;
wire    tdf5_dot_product_U0_ap_ready;
wire   [7:0] tdf5_dot_product_U0_ifmap_vec_address0;
wire    tdf5_dot_product_U0_ifmap_vec_ce0;
wire   [7:0] tdf5_dot_product_U0_weight_vecs_0_address0;
wire    tdf5_dot_product_U0_weight_vecs_0_ce0;
wire   [7:0] tdf5_dot_product_U0_products_0_address0;
wire    tdf5_dot_product_U0_products_0_ce0;
wire    tdf5_dot_product_U0_products_0_we0;
wire   [15:0] tdf5_dot_product_U0_products_0_d0;
wire    ap_channel_done_products_0;
wire    tdf5_dot_product_U0_products_0_full_n;
wire    tdf5_accum_1_U0_ap_start;
wire    tdf5_accum_1_U0_ap_done;
wire    tdf5_accum_1_U0_ap_continue;
wire    tdf5_accum_1_U0_ap_idle;
wire    tdf5_accum_1_U0_ap_ready;
wire   [7:0] tdf5_accum_1_U0_accum_in_0_address0;
wire    tdf5_accum_1_U0_accum_in_0_ce0;
wire   [7:0] tdf5_accum_1_U0_accum_in_0_address1;
wire    tdf5_accum_1_U0_accum_in_0_ce1;
wire   [2:0] tdf5_accum_1_U0_accum_out_address0;
wire    tdf5_accum_1_U0_accum_out_ce0;
wire    tdf5_accum_1_U0_accum_out_we0;
wire   [15:0] tdf5_accum_1_U0_accum_out_d0;
wire   [2:0] tdf5_accum_1_U0_accum_out_address1;
wire    tdf5_accum_1_U0_accum_out_ce1;
wire    tdf5_accum_1_U0_accum_out_we1;
wire   [15:0] tdf5_accum_1_U0_accum_out_d1;
wire    ap_channel_done_accum1_out_0;
wire    tdf5_accum_1_U0_accum_out_full_n;
wire    tdf5_accum_2_U0_ap_start;
wire    tdf5_accum_2_U0_ap_done;
wire    tdf5_accum_2_U0_ap_continue;
wire    tdf5_accum_2_U0_ap_idle;
wire    tdf5_accum_2_U0_ap_ready;
wire   [15:0] tdf5_accum_2_U0_accum_in_10;
wire    tdf5_accum_2_U0_accum_in_10_ap_vld;
wire   [2:0] tdf5_accum_2_U0_accum_in_address0;
wire    tdf5_accum_2_U0_accum_in_ce0;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc408_U0_ap_start;
wire    Block_entry_proc_proc408_U0_ap_done;
wire    Block_entry_proc_proc408_U0_ap_continue;
wire    Block_entry_proc_proc408_U0_ap_idle;
wire    Block_entry_proc_proc408_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc408_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf5_adjust_U0_ap_start;
wire    tdf5_adjust_U0_ap_done;
wire    tdf5_adjust_U0_ap_continue;
wire    tdf5_adjust_U0_ap_idle;
wire    tdf5_adjust_U0_ap_ready;
wire   [6:0] tdf5_adjust_U0_adjustments_address0;
wire    tdf5_adjust_U0_adjustments_ce0;
wire    tdf5_adjust_U0_input_indices_23_read;
wire   [15:0] tdf5_adjust_U0_ap_return;
wire    ap_channel_done_outputs_0;
wire    outputs_0_full_n;
wire    tdf5_poolOutputs_U0_ap_start;
wire    tdf5_poolOutputs_U0_ap_done;
wire    tdf5_poolOutputs_U0_ap_continue;
wire    tdf5_poolOutputs_U0_ap_idle;
wire    tdf5_poolOutputs_U0_ap_ready;
wire    tdf5_poolOutputs_U0_output_indices_04_read;
wire    tdf5_poolOutputs_U0_output_indices_15_read;
wire    tdf5_poolOutputs_U0_resetMaximum6_read;
wire    tdf5_poolOutputs_U0_storeOutput7_read;
wire   [14:0] tdf5_poolOutputs_U0_out_data_address1;
wire    tdf5_poolOutputs_U0_out_data_ce1;
wire    tdf5_poolOutputs_U0_out_data_we1;
wire   [63:0] tdf5_poolOutputs_U0_out_data_d1;
wire    tdf5_poolOutputs_U0_out_data_full_n;
wire    tdf5_poolOutputs_U0_out_data_write;
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
wire    input_indices_23_c_full_n;
wire   [6:0] input_indices_23_c_dout;
wire    input_indices_23_c_empty_n;
wire    input_indices_23_c1_full_n;
wire   [6:0] input_indices_23_c1_dout;
wire    input_indices_23_c1_empty_n;
wire    output_indices_04_c_full_n;
wire   [4:0] output_indices_04_c_dout;
wire    output_indices_04_c_empty_n;
wire    output_indices_15_c_full_n;
wire   [9:0] output_indices_15_c_dout;
wire    output_indices_15_c_empty_n;
wire   [0:0] resetMaximum6_c_din;
wire    resetMaximum6_c_full_n;
wire   [0:0] resetMaximum6_c_dout;
wire    resetMaximum6_c_empty_n;
wire   [0:0] storeOutput7_c_din;
wire    storeOutput7_c_full_n;
wire   [0:0] storeOutput7_c_dout;
wire    storeOutput7_c_empty_n;
wire   [15:0] input_indices_0_dout;
wire    input_indices_0_empty_n;
wire   [15:0] input_indices_1_dout;
wire    input_indices_1_empty_n;
wire   [15:0] tmp_channel_dout;
wire    tmp_channel_empty_n;
wire   [15:0] sums_0_dout;
wire    sums_0_empty_n;
wire   [15:0] outputs_0_dout;
wire    outputs_0_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready;
wire    ap_sync_tdf5_get_next_ijk_U0_ap_ready;
reg    ap_sync_reg_tdf5_readInputs41_U0_ap_ready;
wire    ap_sync_tdf5_readInputs41_U0_ap_ready;
wire   [0:0] start_for_tdf5_readFilters40_U0_din;
wire    start_for_tdf5_readFilters40_U0_full_n;
wire   [0:0] start_for_tdf5_readFilters40_U0_dout;
wire    start_for_tdf5_readFilters40_U0_empty_n;
wire    tdf5_readInputs41_U0_start_full_n;
wire    tdf5_readInputs41_U0_start_write;
wire    tdf5_readFilters40_U0_start_full_n;
wire    tdf5_readFilters40_U0_start_write;
wire    tdf5_dot_product_U0_start_full_n;
wire    tdf5_dot_product_U0_start_write;
wire    tdf5_accum_1_U0_start_full_n;
wire    tdf5_accum_1_U0_start_write;
wire    tdf5_accum_2_U0_start_full_n;
wire    tdf5_accum_2_U0_start_write;
wire    Block_entry_proc_proc408_U0_start_full_n;
wire    Block_entry_proc_proc408_U0_start_write;
wire    tdf5_adjust_U0_start_full_n;
wire    tdf5_adjust_U0_start_write;
wire    tdf5_poolOutputs_U0_start_full_n;
wire    tdf5_poolOutputs_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_input_indices_1 = 1'b0;
#0 ap_sync_reg_channel_write_input_indices_0 = 1'b0;
#0 ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf5_readInputs41_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
ifmap_vec_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_readInputs41_U0_ap_done),
    .i_full_n(ifmap_vec_i_full_n),
    .i_ce0(tdf5_readInputs41_U0_ifmap_vec_ce0),
    .i_we0(tdf5_readInputs41_U0_ifmap_vec_we0),
    .i_address0(tdf5_readInputs41_U0_ifmap_vec_address0),
    .i_d0(tdf5_readInputs41_U0_ifmap_vec_d0),
    .i_q0(ifmap_vec_i_q0),
    .i_ce1(tdf5_readInputs41_U0_ifmap_vec_ce1),
    .i_we1(tdf5_readInputs41_U0_ifmap_vec_we1),
    .i_address1(tdf5_readInputs41_U0_ifmap_vec_address1),
    .i_d1(tdf5_readInputs41_U0_ifmap_vec_d1),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_ifmap_vec_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_ifmap_vec_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(8'd0),
    .t_d1(16'd0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0 #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
weight_vecs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_readFilters40_U0_ap_done),
    .i_full_n(weight_vecs_0_i_full_n),
    .i_ce0(tdf5_readFilters40_U0_weight_vecs_0_ce0),
    .i_we0(tdf5_readFilters40_U0_weight_vecs_0_we0),
    .i_address0(tdf5_readFilters40_U0_weight_vecs_0_address0),
    .i_d0(tdf5_readFilters40_U0_weight_vecs_0_d0),
    .i_q0(weight_vecs_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 144 ),
    .AddressWidth( 8 ))
products_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_dot_product_U0_ap_done),
    .i_full_n(products_0_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_0_ce0),
    .i_we0(tdf5_dot_product_U0_products_0_we0),
    .i_address0(tdf5_dot_product_U0_products_0_address0),
    .i_d0(tdf5_dot_product_U0_products_0_d0),
    .i_q0(products_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(8'd0),
    .i_q1(products_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U0_ap_ready),
    .t_empty_n(products_0_t_empty_n),
    .t_ce0(tdf5_accum_1_U0_accum_in_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U0_accum_in_0_address0),
    .t_d0(16'd0),
    .t_q0(products_0_t_q0),
    .t_ce1(tdf5_accum_1_U0_accum_in_0_ce1),
    .t_address1(tdf5_accum_1_U0_accum_in_0_address1),
    .t_q1(products_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum1_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_1_U0_ap_done),
    .i_full_n(accum1_out_0_i_full_n),
    .i_ce0(tdf5_accum_1_U0_accum_out_ce0),
    .i_we0(tdf5_accum_1_U0_accum_out_we0),
    .i_address0(tdf5_accum_1_U0_accum_out_address0),
    .i_d0(tdf5_accum_1_U0_accum_out_d0),
    .i_q0(accum1_out_0_i_q0),
    .i_ce1(tdf5_accum_1_U0_accum_out_ce1),
    .i_we1(tdf5_accum_1_U0_accum_out_we1),
    .i_address1(tdf5_accum_1_U0_accum_out_address1),
    .i_d1(tdf5_accum_1_U0_accum_out_d1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf5_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(1'b0),
    .t_we1(1'b0),
    .t_address1(3'd0),
    .t_d1(16'd0)
);

td_fused_top_tdf5_get_next_ijk tdf5_get_next_ijk_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_get_next_ijk_U0_ap_start),
    .start_full_n(start_for_tdf5_readFilters40_U0_full_n),
    .ap_done(tdf5_get_next_ijk_U0_ap_done),
    .ap_continue(tdf5_get_next_ijk_U0_ap_continue),
    .ap_idle(tdf5_get_next_ijk_U0_ap_idle),
    .ap_ready(tdf5_get_next_ijk_U0_ap_ready),
    .start_out(tdf5_get_next_ijk_U0_start_out),
    .start_write(tdf5_get_next_ijk_U0_start_write),
    .input_indices_2_out_din(tdf5_get_next_ijk_U0_input_indices_2_out_din),
    .input_indices_2_out_full_n(input_indices_23_c_full_n),
    .input_indices_2_out_write(tdf5_get_next_ijk_U0_input_indices_2_out_write),
    .input_indices_2_out1_din(tdf5_get_next_ijk_U0_input_indices_2_out1_din),
    .input_indices_2_out1_full_n(input_indices_23_c1_full_n),
    .input_indices_2_out1_write(tdf5_get_next_ijk_U0_input_indices_2_out1_write),
    .output_indices_0_din(tdf5_get_next_ijk_U0_output_indices_0_din),
    .output_indices_0_full_n(output_indices_04_c_full_n),
    .output_indices_0_write(tdf5_get_next_ijk_U0_output_indices_0_write),
    .output_indices_1_din(tdf5_get_next_ijk_U0_output_indices_1_din),
    .output_indices_1_full_n(output_indices_15_c_full_n),
    .output_indices_1_write(tdf5_get_next_ijk_U0_output_indices_1_write),
    .resetMaximum_din(tdf5_get_next_ijk_U0_resetMaximum_din),
    .resetMaximum_full_n(resetMaximum6_c_full_n),
    .resetMaximum_write(tdf5_get_next_ijk_U0_resetMaximum_write),
    .storeOutput_din(tdf5_get_next_ijk_U0_storeOutput_din),
    .storeOutput_full_n(storeOutput7_c_full_n),
    .storeOutput_write(tdf5_get_next_ijk_U0_storeOutput_write),
    .ap_return_0(tdf5_get_next_ijk_U0_ap_return_0),
    .ap_return_1(tdf5_get_next_ijk_U0_ap_return_1)
);

td_fused_top_tdf5_readInputs41 tdf5_readInputs41_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_readInputs41_U0_ap_start),
    .ap_done(tdf5_readInputs41_U0_ap_done),
    .ap_continue(tdf5_readInputs41_U0_ap_continue),
    .ap_idle(tdf5_readInputs41_U0_ap_idle),
    .ap_ready(tdf5_readInputs41_U0_ap_ready),
    .in_data_address0(tdf5_readInputs41_U0_in_data_address0),
    .in_data_ce0(tdf5_readInputs41_U0_in_data_ce0),
    .in_data_q0(in_data_q0),
    .i_15(input_indices_0_dout),
    .j_15(input_indices_1_dout),
    .ifmap_vec_address0(tdf5_readInputs41_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf5_readInputs41_U0_ifmap_vec_ce0),
    .ifmap_vec_we0(tdf5_readInputs41_U0_ifmap_vec_we0),
    .ifmap_vec_d0(tdf5_readInputs41_U0_ifmap_vec_d0),
    .ifmap_vec_address1(tdf5_readInputs41_U0_ifmap_vec_address1),
    .ifmap_vec_ce1(tdf5_readInputs41_U0_ifmap_vec_ce1),
    .ifmap_vec_we1(tdf5_readInputs41_U0_ifmap_vec_we1),
    .ifmap_vec_d1(tdf5_readInputs41_U0_ifmap_vec_d1)
);

td_fused_top_tdf5_readFilters40 tdf5_readFilters40_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_readFilters40_U0_ap_start),
    .ap_done(tdf5_readFilters40_U0_ap_done),
    .ap_continue(tdf5_readFilters40_U0_ap_continue),
    .ap_idle(tdf5_readFilters40_U0_ap_idle),
    .ap_ready(tdf5_readFilters40_U0_ap_ready),
    .filter_data_address0(tdf5_readFilters40_U0_filter_data_address0),
    .filter_data_ce0(tdf5_readFilters40_U0_filter_data_ce0),
    .filter_data_q0(filter_data_q0),
    .input_indices_23_dout(input_indices_23_c_dout),
    .input_indices_23_empty_n(input_indices_23_c_empty_n),
    .input_indices_23_read(tdf5_readFilters40_U0_input_indices_23_read),
    .weight_vecs_0_address0(tdf5_readFilters40_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf5_readFilters40_U0_weight_vecs_0_ce0),
    .weight_vecs_0_we0(tdf5_readFilters40_U0_weight_vecs_0_we0),
    .weight_vecs_0_d0(tdf5_readFilters40_U0_weight_vecs_0_d0)
);

td_fused_top_tdf5_dot_product tdf5_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_dot_product_U0_ap_start),
    .ap_done(tdf5_dot_product_U0_ap_done),
    .ap_continue(tdf5_dot_product_U0_ap_continue),
    .ap_idle(tdf5_dot_product_U0_ap_idle),
    .ap_ready(tdf5_dot_product_U0_ap_ready),
    .ifmap_vec_address0(tdf5_dot_product_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf5_dot_product_U0_ifmap_vec_ce0),
    .ifmap_vec_q0(ifmap_vec_t_q0),
    .weight_vecs_0_address0(tdf5_dot_product_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf5_dot_product_U0_weight_vecs_0_ce0),
    .weight_vecs_0_q0(weight_vecs_0_t_q0),
    .products_0_address0(tdf5_dot_product_U0_products_0_address0),
    .products_0_ce0(tdf5_dot_product_U0_products_0_ce0),
    .products_0_we0(tdf5_dot_product_U0_products_0_we0),
    .products_0_d0(tdf5_dot_product_U0_products_0_d0)
);

td_fused_top_tdf5_accum_1 tdf5_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_1_U0_ap_start),
    .ap_done(tdf5_accum_1_U0_ap_done),
    .ap_continue(tdf5_accum_1_U0_ap_continue),
    .ap_idle(tdf5_accum_1_U0_ap_idle),
    .ap_ready(tdf5_accum_1_U0_ap_ready),
    .accum_in_0_address0(tdf5_accum_1_U0_accum_in_0_address0),
    .accum_in_0_ce0(tdf5_accum_1_U0_accum_in_0_ce0),
    .accum_in_0_q0(products_0_t_q0),
    .accum_in_0_address1(tdf5_accum_1_U0_accum_in_0_address1),
    .accum_in_0_ce1(tdf5_accum_1_U0_accum_in_0_ce1),
    .accum_in_0_q1(products_0_t_q1),
    .accum_out_address0(tdf5_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf5_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf5_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf5_accum_1_U0_accum_out_d0),
    .accum_out_address1(tdf5_accum_1_U0_accum_out_address1),
    .accum_out_ce1(tdf5_accum_1_U0_accum_out_ce1),
    .accum_out_we1(tdf5_accum_1_U0_accum_out_we1),
    .accum_out_d1(tdf5_accum_1_U0_accum_out_d1)
);

td_fused_top_tdf5_accum_2 tdf5_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_2_U0_ap_start),
    .ap_done(tdf5_accum_2_U0_ap_done),
    .ap_continue(tdf5_accum_2_U0_ap_continue),
    .ap_idle(tdf5_accum_2_U0_ap_idle),
    .ap_ready(tdf5_accum_2_U0_ap_ready),
    .accum_in_10(tdf5_accum_2_U0_accum_in_10),
    .accum_in_10_ap_vld(tdf5_accum_2_U0_accum_in_10_ap_vld),
    .accum_in_address0(tdf5_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0)
);

td_fused_top_Block_entry_proc_proc408 Block_entry_proc_proc408_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc408_U0_ap_start),
    .ap_done(Block_entry_proc_proc408_U0_ap_done),
    .ap_continue(Block_entry_proc_proc408_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc408_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc408_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc408_U0_ap_return)
);

td_fused_top_tdf5_adjust tdf5_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_adjust_U0_ap_start),
    .ap_done(tdf5_adjust_U0_ap_done),
    .ap_continue(tdf5_adjust_U0_ap_continue),
    .ap_idle(tdf5_adjust_U0_ap_idle),
    .ap_ready(tdf5_adjust_U0_ap_ready),
    .sums_read(sums_0_dout),
    .adjustments_address0(tdf5_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf5_adjust_U0_adjustments_ce0),
    .adjustments_q0(adjustments_q0),
    .input_indices_23_dout(input_indices_23_c1_dout),
    .input_indices_23_empty_n(input_indices_23_c1_empty_n),
    .input_indices_23_read(tdf5_adjust_U0_input_indices_23_read),
    .ap_return(tdf5_adjust_U0_ap_return)
);

td_fused_top_tdf5_poolOutputs tdf5_poolOutputs_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_poolOutputs_U0_ap_start),
    .ap_done(tdf5_poolOutputs_U0_ap_done),
    .ap_continue(tdf5_poolOutputs_U0_ap_continue),
    .ap_idle(tdf5_poolOutputs_U0_ap_idle),
    .ap_ready(tdf5_poolOutputs_U0_ap_ready),
    .output_indices_04_dout(output_indices_04_c_dout),
    .output_indices_04_empty_n(output_indices_04_c_empty_n),
    .output_indices_04_read(tdf5_poolOutputs_U0_output_indices_04_read),
    .output_indices_15_dout(output_indices_15_c_dout),
    .output_indices_15_empty_n(output_indices_15_c_empty_n),
    .output_indices_15_read(tdf5_poolOutputs_U0_output_indices_15_read),
    .resetMaximum6_dout(resetMaximum6_c_dout),
    .resetMaximum6_empty_n(resetMaximum6_c_empty_n),
    .resetMaximum6_read(tdf5_poolOutputs_U0_resetMaximum6_read),
    .storeOutput7_dout(storeOutput7_c_dout),
    .storeOutput7_empty_n(storeOutput7_c_empty_n),
    .storeOutput7_read(tdf5_poolOutputs_U0_storeOutput7_read),
    .p_read(outputs_0_dout),
    .out_data_address1(tdf5_poolOutputs_U0_out_data_address1),
    .out_data_ce1(tdf5_poolOutputs_U0_out_data_ce1),
    .out_data_we1(tdf5_poolOutputs_U0_out_data_we1),
    .out_data_d1(tdf5_poolOutputs_U0_out_data_d1)
);

td_fused_top_fifo_w7_d2_S_x input_indices_23_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readFilters40_U0_input_indices_23_read),
    .if_dout(input_indices_23_c_dout),
    .if_full_n(input_indices_23_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_input_indices_2_out_write),
    .if_din(tdf5_get_next_ijk_U0_input_indices_2_out_din)
);

td_fused_top_fifo_w7_d7_S input_indices_23_c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_adjust_U0_input_indices_23_read),
    .if_dout(input_indices_23_c1_dout),
    .if_full_n(input_indices_23_c1_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_input_indices_2_out1_write),
    .if_din(tdf5_get_next_ijk_U0_input_indices_2_out1_din)
);

td_fused_top_fifo_w5_d8_S output_indices_04_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(output_indices_04_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_output_indices_04_read),
    .if_dout(output_indices_04_c_dout),
    .if_full_n(output_indices_04_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_output_indices_0_write),
    .if_din(tdf5_get_next_ijk_U0_output_indices_0_din)
);

td_fused_top_fifo_w10_d8_S output_indices_15_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(output_indices_15_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_output_indices_15_read),
    .if_dout(output_indices_15_c_dout),
    .if_full_n(output_indices_15_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_output_indices_1_write),
    .if_din(tdf5_get_next_ijk_U0_output_indices_1_din)
);

td_fused_top_fifo_w1_d8_S_x resetMaximum6_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(resetMaximum6_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_resetMaximum6_read),
    .if_dout(resetMaximum6_c_dout),
    .if_full_n(resetMaximum6_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_resetMaximum_write),
    .if_din(resetMaximum6_c_din)
);

td_fused_top_fifo_w1_d8_S_x storeOutput7_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(storeOutput7_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_storeOutput7_read),
    .if_dout(storeOutput7_c_dout),
    .if_full_n(storeOutput7_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_storeOutput_write),
    .if_din(storeOutput7_c_din)
);

td_fused_top_fifo_w16_d2_S_x2 input_indices_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readInputs41_U0_ap_ready),
    .if_dout(input_indices_0_dout),
    .if_full_n(input_indices_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_input_indices_0),
    .if_din(tdf5_get_next_ijk_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x2 input_indices_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readInputs41_U0_ap_ready),
    .if_dout(input_indices_1_dout),
    .if_full_n(input_indices_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_input_indices_1),
    .if_din(tdf5_get_next_ijk_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x2 tmp_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc408_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_accum_2_U0_ap_done),
    .if_din(tdf5_accum_2_U0_accum_in_10)
);

td_fused_top_fifo_w16_d2_S_x2 sums_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_adjust_U0_ap_ready),
    .if_dout(sums_0_dout),
    .if_full_n(sums_0_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc408_U0_ap_done),
    .if_din(Block_entry_proc_proc408_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x2 outputs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_ap_ready),
    .if_dout(outputs_0_dout),
    .if_full_n(outputs_0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_adjust_U0_ap_done),
    .if_din(tdf5_adjust_U0_ap_return)
);

td_fused_top_start_for_tdf5_readFilters40_U0 start_for_tdf5_readFilters40_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(start_for_tdf5_readFilters40_U0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readFilters40_U0_ap_ready),
    .if_dout(start_for_tdf5_readFilters40_U0_dout),
    .if_full_n(start_for_tdf5_readFilters40_U0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_start_write),
    .if_din(start_for_tdf5_readFilters40_U0_din)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_input_indices_0 <= 1'b0;
    end else begin
        if (((tdf5_get_next_ijk_U0_ap_done & tdf5_get_next_ijk_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_input_indices_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_input_indices_0 <= ap_sync_channel_write_input_indices_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_input_indices_1 <= 1'b0;
    end else begin
        if (((tdf5_get_next_ijk_U0_ap_done & tdf5_get_next_ijk_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_input_indices_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_input_indices_1 <= ap_sync_channel_write_input_indices_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready <= ap_sync_tdf5_get_next_ijk_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf5_readInputs41_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf5_readInputs41_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf5_readInputs41_U0_ap_ready <= ap_sync_tdf5_readInputs41_U0_ap_ready;
        end
    end
end

assign Block_entry_proc_proc408_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc408_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc408_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc408_U0_start_write = 1'b0;

assign adjustments_address0 = tdf5_adjust_U0_adjustments_address0;

assign adjustments_address1 = 7'd0;

assign adjustments_ce0 = tdf5_adjust_U0_adjustments_ce0;

assign adjustments_ce1 = 1'b0;

assign adjustments_d0 = 48'd0;

assign adjustments_d1 = 48'd0;

assign adjustments_we0 = 1'b0;

assign adjustments_we1 = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf5_accum_1_U0_ap_done;

assign ap_channel_done_ifmap_vec = tdf5_readInputs41_U0_ap_done;

assign ap_channel_done_input_indices_0 = (tdf5_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_0 ^ 1'b1));

assign ap_channel_done_input_indices_1 = (tdf5_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_1 ^ 1'b1));

assign ap_channel_done_outputs_0 = tdf5_adjust_U0_ap_done;

assign ap_channel_done_products_0 = tdf5_dot_product_U0_ap_done;

assign ap_channel_done_sums_0 = Block_entry_proc_proc408_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf5_accum_2_U0_ap_done;

assign ap_channel_done_weight_vecs_0 = tdf5_readFilters40_U0_ap_done;

assign ap_done = tdf5_poolOutputs_U0_ap_done;

assign ap_idle = (tdf5_readInputs41_U0_ap_idle & tdf5_readFilters40_U0_ap_idle & tdf5_poolOutputs_U0_ap_idle & tdf5_get_next_ijk_U0_ap_idle & tdf5_dot_product_U0_ap_idle & tdf5_adjust_U0_ap_idle & tdf5_accum_2_U0_ap_idle & tdf5_accum_1_U0_ap_idle & (outputs_0_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (input_indices_1_empty_n ^ 1'b1) & (input_indices_0_empty_n ^ 1'b1) & (products_0_t_empty_n ^ 1'b1) & (weight_vecs_0_t_empty_n ^ 1'b1) & (ifmap_vec_t_empty_n ^ 1'b1) & (1'b1 ^ accum1_out_0_t_empty_n) & Block_entry_proc_proc408_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_channel_write_input_indices_0 = ((input_indices_0_full_n & ap_channel_done_input_indices_0) | ap_sync_reg_channel_write_input_indices_0);

assign ap_sync_channel_write_input_indices_1 = ((input_indices_1_full_n & ap_channel_done_input_indices_1) | ap_sync_reg_channel_write_input_indices_1);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf5_poolOutputs_U0_ap_done;

assign ap_sync_ready = (ap_sync_tdf5_readInputs41_U0_ap_ready & ap_sync_tdf5_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf5_get_next_ijk_U0_ap_ready = (tdf5_get_next_ijk_U0_ap_ready | ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf5_readInputs41_U0_ap_ready = (tdf5_readInputs41_U0_ap_ready | ap_sync_reg_tdf5_readInputs41_U0_ap_ready);

assign filter_data_address0 = tdf5_readFilters40_U0_filter_data_address0;

assign filter_data_address1 = 15'd0;

assign filter_data_ce0 = tdf5_readFilters40_U0_filter_data_ce0;

assign filter_data_ce1 = 1'b0;

assign filter_data_d0 = 16'd0;

assign filter_data_d1 = 16'd0;

assign filter_data_we0 = 1'b0;

assign filter_data_we1 = 1'b0;

assign in_data_address0 = tdf5_readInputs41_U0_in_data_address0;

assign in_data_address1 = 14'd0;

assign in_data_ce0 = tdf5_readInputs41_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = tdf5_readInputs41_U0_in_data_write;

assign in_data_we0 = 1'b0;

assign in_data_we1 = 1'b0;

assign out_data_address0 = 15'd0;

assign out_data_address1 = tdf5_poolOutputs_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = tdf5_poolOutputs_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = tdf5_poolOutputs_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = tdf5_poolOutputs_U0_out_data_we1;

assign out_data_write = tdf5_poolOutputs_U0_out_data_write;

assign products_0_t_d1 = 16'd0;

assign products_0_t_we1 = 1'b0;

assign resetMaximum6_c_din = tdf5_get_next_ijk_U0_resetMaximum_din;

assign start_for_tdf5_readFilters40_U0_din = 1'b1;

assign storeOutput7_c_din = tdf5_get_next_ijk_U0_storeOutput_din;

assign tdf5_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf5_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf5_accum_1_U0_ap_start = products_0_t_empty_n;

assign tdf5_accum_1_U0_start_full_n = 1'b1;

assign tdf5_accum_1_U0_start_write = 1'b0;

assign tdf5_accum_2_U0_ap_continue = tmp_channel_full_n;

assign tdf5_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf5_accum_2_U0_start_full_n = 1'b1;

assign tdf5_accum_2_U0_start_write = 1'b0;

assign tdf5_adjust_U0_ap_continue = outputs_0_full_n;

assign tdf5_adjust_U0_ap_start = sums_0_empty_n;

assign tdf5_adjust_U0_start_full_n = 1'b1;

assign tdf5_adjust_U0_start_write = 1'b0;

assign tdf5_dot_product_U0_ap_continue = products_0_i_full_n;

assign tdf5_dot_product_U0_ap_start = (weight_vecs_0_t_empty_n & ifmap_vec_t_empty_n);

assign tdf5_dot_product_U0_products_0_full_n = products_0_i_full_n;

assign tdf5_dot_product_U0_start_full_n = 1'b1;

assign tdf5_dot_product_U0_start_write = 1'b0;

assign tdf5_get_next_ijk_U0_ap_continue = (ap_sync_channel_write_input_indices_1 & ap_sync_channel_write_input_indices_0);

assign tdf5_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf5_poolOutputs_U0_ap_continue = ap_continue;

assign tdf5_poolOutputs_U0_ap_start = outputs_0_empty_n;

assign tdf5_poolOutputs_U0_out_data_full_n = out_data_full_n;

assign tdf5_poolOutputs_U0_out_data_write = 1'b0;

assign tdf5_poolOutputs_U0_start_full_n = 1'b1;

assign tdf5_poolOutputs_U0_start_write = 1'b0;

assign tdf5_readFilters40_U0_ap_continue = weight_vecs_0_i_full_n;

assign tdf5_readFilters40_U0_ap_start = start_for_tdf5_readFilters40_U0_empty_n;

assign tdf5_readFilters40_U0_start_full_n = 1'b1;

assign tdf5_readFilters40_U0_start_write = 1'b0;

assign tdf5_readFilters40_U0_weight_vecs_0_full_n = weight_vecs_0_i_full_n;

assign tdf5_readInputs41_U0_ap_continue = ifmap_vec_i_full_n;

assign tdf5_readInputs41_U0_ap_start = (input_indices_1_empty_n & input_indices_0_empty_n & (ap_sync_reg_tdf5_readInputs41_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf5_readInputs41_U0_ifmap_vec_full_n = ifmap_vec_i_full_n;

assign tdf5_readInputs41_U0_in_data_full_n = in_data_empty_n;

assign tdf5_readInputs41_U0_in_data_write = 1'b0;

assign tdf5_readInputs41_U0_start_full_n = 1'b1;

assign tdf5_readInputs41_U0_start_write = 1'b0;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP37738
module td_fused_top_start_for_tdf5_readFilters40_U0 (
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

td_fused_top_start_for_tdf5_readFilters40_U0_shiftReg 
U_td_fused_top_start_for_tdf5_readFilters40_U0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_start_for_tdf5_readFilters40_U0_shiftReg (
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
module td_fused_top_fifo_w16_d2_S_x2 (
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

td_fused_top_fifo_w16_d2_S_x2_shiftReg 
U_td_fused_top_fifo_w16_d2_S_x2_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w16_d2_S_x2_shiftReg (
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
module td_fused_top_fifo_w1_d8_S_x (
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

td_fused_top_fifo_w1_d8_S_x_shiftReg 
U_td_fused_top_fifo_w1_d8_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w1_d8_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd1;
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
module td_fused_top_fifo_w10_d8_S (
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
parameter DATA_WIDTH  = 32'd10;
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

td_fused_top_fifo_w10_d8_S_shiftReg 
U_td_fused_top_fifo_w10_d8_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w10_d8_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd10;
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
module td_fused_top_fifo_w5_d8_S (
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

td_fused_top_fifo_w5_d8_S_shiftReg 
U_td_fused_top_fifo_w5_d8_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w5_d8_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd5;
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
module td_fused_top_fifo_w7_d7_S (
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

td_fused_top_fifo_w7_d7_S_shiftReg 
U_td_fused_top_fifo_w7_d7_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w7_d7_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd7;
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
module td_fused_top_fifo_w7_d2_S_x (
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

td_fused_top_fifo_w7_d2_S_x_shiftReg 
U_td_fused_top_fifo_w7_d2_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w7_d2_S_x_shiftReg (
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
module td_fused_top_tdf5_poolOutputs (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        output_indices_04_dout,
        output_indices_04_empty_n,
        output_indices_04_read,
        output_indices_15_dout,
        output_indices_15_empty_n,
        output_indices_15_read,
        resetMaximum6_dout,
        resetMaximum6_empty_n,
        resetMaximum6_read,
        storeOutput7_dout,
        storeOutput7_empty_n,
        storeOutput7_read,
        p_read,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [4:0] output_indices_04_dout;
input   output_indices_04_empty_n;
output   output_indices_04_read;
input  [9:0] output_indices_15_dout;
input   output_indices_15_empty_n;
output   output_indices_15_read;
input  [0:0] resetMaximum6_dout;
input   resetMaximum6_empty_n;
output   resetMaximum6_read;
input  [0:0] storeOutput7_dout;
input   storeOutput7_empty_n;
output   storeOutput7_read;
input  [15:0] p_read;
output  [14:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg output_indices_04_read;
reg output_indices_15_read;
reg resetMaximum6_read;
reg storeOutput7_read;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] max_vals_5_0;
reg    output_indices_04_blk_n;
wire    ap_CS_fsm_state2;
reg    output_indices_15_blk_n;
reg    resetMaximum6_blk_n;
reg    storeOutput7_blk_n;
reg   [4:0] output_indices_04_read_reg_147;
reg   [9:0] output_indices_15_read_reg_152;
wire   [0:0] storeOutput7_read_read_fu_82_p2;
reg   [0:0] storeOutput7_read_reg_157;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_ap_start;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_ap_done;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_ap_idle;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_ap_ready;
wire   [14:0] grp_tdf5_writeOutputs_unaligned_fu_88_out_data_address1;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_out_data_ce1;
wire    grp_tdf5_writeOutputs_unaligned_fu_88_out_data_we1;
wire   [63:0] grp_tdf5_writeOutputs_unaligned_fu_88_out_data_d1;
reg    grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state4_on_subcall_done;
wire   [15:0] select_ln24_fu_126_p3;
reg    ap_block_state2;
reg    ap_block_state1;
wire   [0:0] grp_fu_110_p2;
wire   [0:0] or_ln24_fu_120_p2;
reg    grp_fu_110_ce;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 max_vals_5_0 = 16'd0;
#0 grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg = 1'b0;
end

td_fused_top_tdf5_writeOutputs_unaligned grp_tdf5_writeOutputs_unaligned_fu_88(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_tdf5_writeOutputs_unaligned_fu_88_ap_start),
    .ap_done(grp_tdf5_writeOutputs_unaligned_fu_88_ap_done),
    .ap_idle(grp_tdf5_writeOutputs_unaligned_fu_88_ap_idle),
    .ap_ready(grp_tdf5_writeOutputs_unaligned_fu_88_ap_ready),
    .i(output_indices_04_read_reg_147),
    .j(output_indices_15_read_reg_152),
    .out_data_address1(grp_tdf5_writeOutputs_unaligned_fu_88_out_data_address1),
    .out_data_ce1(grp_tdf5_writeOutputs_unaligned_fu_88_out_data_ce1),
    .out_data_we1(grp_tdf5_writeOutputs_unaligned_fu_88_out_data_we1),
    .out_data_d1(grp_tdf5_writeOutputs_unaligned_fu_88_out_data_d1),
    .max_vals_5_0(max_vals_5_0)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U315(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_110_ce),
    .din0(max_vals_5_0),
    .din1(p_read),
    .opcode(5'd4),
    .dout(grp_fu_110_p2)
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
        end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b1;
        end else if ((grp_tdf5_writeOutputs_unaligned_fu_88_ap_ready == 1'b1)) begin
            grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        max_vals_5_0 <= select_ln24_fu_126_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_04_read_reg_147 <= output_indices_04_dout;
        output_indices_15_read_reg_152 <= output_indices_15_dout;
        storeOutput7_read_reg_157 <= storeOutput7_dout;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
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
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_110_ce = 1'b1;
    end else begin
        grp_fu_110_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_04_blk_n = output_indices_04_empty_n;
    end else begin
        output_indices_04_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        output_indices_04_read = 1'b1;
    end else begin
        output_indices_04_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_15_blk_n = output_indices_15_empty_n;
    end else begin
        output_indices_15_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        output_indices_15_read = 1'b1;
    end else begin
        output_indices_15_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        resetMaximum6_blk_n = resetMaximum6_empty_n;
    end else begin
        resetMaximum6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        resetMaximum6_read = 1'b1;
    end else begin
        resetMaximum6_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        storeOutput7_blk_n = storeOutput7_empty_n;
    end else begin
        storeOutput7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        storeOutput7_read = 1'b1;
    end else begin
        storeOutput7_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_82_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_82_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = ((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state4_on_subcall_done = ((grp_tdf5_writeOutputs_unaligned_fu_88_ap_done == 1'b0) & (storeOutput7_read_reg_157 == 1'd1));
end

assign grp_tdf5_writeOutputs_unaligned_fu_88_ap_start = grp_tdf5_writeOutputs_unaligned_fu_88_ap_start_reg;

assign or_ln24_fu_120_p2 = (resetMaximum6_dout | grp_fu_110_p2);

assign out_data_address1 = grp_tdf5_writeOutputs_unaligned_fu_88_out_data_address1;

assign out_data_ce1 = grp_tdf5_writeOutputs_unaligned_fu_88_out_data_ce1;

assign out_data_d1 = grp_tdf5_writeOutputs_unaligned_fu_88_out_data_d1;

assign out_data_we1 = grp_tdf5_writeOutputs_unaligned_fu_88_out_data_we1;

assign select_ln24_fu_126_p3 = ((or_ln24_fu_120_p2[0:0] == 1'b1) ? p_read : max_vals_5_0);

assign storeOutput7_read_read_fu_82_p2 = storeOutput7_dout;

endmodule //td_fused_top_tdf5_poolOutputs
module td_fused_top_tdf5_writeOutputs_unaligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        i,
        j,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        max_vals_5_0
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [4:0] i;
input  [9:0] j;
output  [14:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_5_0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_5;
reg   [15:0] outputChanIdx_5;
reg   [15:0] outputRow_11_0;
reg   [15:0] outputRow_11_1;
reg   [15:0] outputRow_11_2;
reg   [15:0] outputRow_11_3;
wire   [15:0] add_ln87_fu_173_p2;
wire   [0:0] icmp_ln88_fu_179_p2;
reg   [0:0] icmp_ln88_reg_293;
reg   [15:0] ap_phi_mux_empty_phi_fu_90_p4;
reg   [15:0] empty_reg_87;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln94_8_fu_207_p1;
wire   [15:0] select_ln97_fu_265_p3;
wire   [1:0] trunc_ln86_fu_145_p1;
reg   [15:0] ap_sig_allocacmp_outputRow_11_0_load;
reg   [15:0] ap_sig_allocacmp_outputRow_11_1_load;
reg   [15:0] ap_sig_allocacmp_outputRow_11_2_load;
reg   [15:0] ap_sig_allocacmp_outputRow_11_3_load;
wire   [6:0] tmp_s_fu_105_p3;
wire   [9:0] tmp_fu_97_p3;
wire   [9:0] zext_ln94_fu_113_p1;
wire   [9:0] sub_ln94_fu_117_p2;
wire   [9:0] add_ln94_fu_123_p2;
wire   [6:0] trunc_ln94_fu_193_p1;
wire   [14:0] tmp_60_cast_fu_129_p3;
wire   [14:0] zext_ln94_7_fu_197_p1;
wire   [14:0] add_ln94_4_fu_201_p2;
wire   [15:0] bitcast_ln94_12_fu_236_p1;
wire   [15:0] bitcast_ln94_11_fu_228_p1;
wire   [15:0] bitcast_ln94_10_fu_220_p1;
wire   [15:0] bitcast_ln94_fu_212_p1;
wire   [15:0] add_ln96_fu_253_p2;
wire   [0:0] icmp_ln97_fu_259_p2;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 outputCount_5 = 16'd0;
#0 outputChanIdx_5 = 16'd0;
#0 outputRow_11_0 = 16'd0;
#0 outputRow_11_1 = 16'd0;
#0 outputRow_11_2 = 16'd0;
#0 outputRow_11_3 = 16'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_293 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_87 <= 16'd0;
    end else if (((ap_start == 1'b1) & (icmp_ln88_fu_179_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_reg_87 <= add_ln87_fu_173_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln88_reg_293 <= icmp_ln88_fu_179_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (icmp_ln88_fu_179_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputChanIdx_5 <= select_ln97_fu_265_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        outputCount_5 <= ap_phi_mux_empty_phi_fu_90_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_145_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_11_0 <= max_vals_5_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_145_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_11_1 <= max_vals_5_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_145_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_11_2 <= max_vals_5_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_145_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_11_3 <= max_vals_5_0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
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
    if (((icmp_ln88_reg_293 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_empty_phi_fu_90_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_90_p4 = empty_reg_87;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_145_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_11_0_load = max_vals_5_0;
    end else begin
        ap_sig_allocacmp_outputRow_11_0_load = outputRow_11_0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_145_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_11_1_load = max_vals_5_0;
    end else begin
        ap_sig_allocacmp_outputRow_11_1_load = outputRow_11_1;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_145_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_11_2_load = max_vals_5_0;
    end else begin
        ap_sig_allocacmp_outputRow_11_2_load = outputRow_11_2;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_145_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_11_3_load = max_vals_5_0;
    end else begin
        ap_sig_allocacmp_outputRow_11_3_load = outputRow_11_3;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (icmp_ln88_fu_179_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln87_fu_173_p2 = (outputCount_5 + 16'd1);

assign add_ln94_4_fu_201_p2 = (tmp_60_cast_fu_129_p3 + zext_ln94_7_fu_197_p1);

assign add_ln94_fu_123_p2 = (sub_ln94_fu_117_p2 + j);

assign add_ln96_fu_253_p2 = (outputChanIdx_5 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln94_10_fu_220_p1 = ap_sig_allocacmp_outputRow_11_1_load;

assign bitcast_ln94_11_fu_228_p1 = ap_sig_allocacmp_outputRow_11_2_load;

assign bitcast_ln94_12_fu_236_p1 = ap_sig_allocacmp_outputRow_11_3_load;

assign bitcast_ln94_fu_212_p1 = ap_sig_allocacmp_outputRow_11_0_load;

assign icmp_ln88_fu_179_p2 = ((add_ln87_fu_173_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_259_p2 = ((add_ln96_fu_253_p2 == 16'd32) ? 1'b1 : 1'b0);

assign out_data_address1 = zext_ln94_8_fu_207_p1;

assign out_data_d1 = {{{{bitcast_ln94_12_fu_236_p1}, {bitcast_ln94_11_fu_228_p1}}, {bitcast_ln94_10_fu_220_p1}}, {bitcast_ln94_fu_212_p1}};

assign select_ln97_fu_265_p3 = ((icmp_ln97_fu_259_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_253_p2);

assign sub_ln94_fu_117_p2 = (tmp_fu_97_p3 - zext_ln94_fu_113_p1);

assign tmp_60_cast_fu_129_p3 = {{add_ln94_fu_123_p2}, {5'd0}};

assign tmp_fu_97_p3 = {{i}, {5'd0}};

assign tmp_s_fu_105_p3 = {{i}, {2'd0}};

assign trunc_ln86_fu_145_p1 = outputCount_5[1:0];

assign trunc_ln94_fu_193_p1 = outputChanIdx_5[6:0];

assign zext_ln94_7_fu_197_p1 = trunc_ln94_fu_193_p1;

assign zext_ln94_8_fu_207_p1 = add_ln94_4_fu_201_p2;

assign zext_ln94_fu_113_p1 = tmp_s_fu_105_p3;

endmodule //td_fused_top_tdf5_writeOutputs_unaligned
module td_fused_top_tdf5_adjust (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
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
input  [6:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg adjustments_ce0;
reg input_indices_23_read;

reg    ap_done_reg;
  reg   [16:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
wire    ap_CS_fsm_state4;
reg   [15:0] tmp_42_i_i_reg_167;
reg   [15:0] tmp_43_i_i_reg_172;
wire   [15:0] grp_fu_81_p2;
reg   [15:0] sub_i_i_i_reg_177;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire   [15:0] grp_fu_86_p2;
reg   [15:0] mul_i_i_i_reg_187;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state13;
wire   [63:0] zext_ln220_fu_90_p1;
reg    ap_block_state1;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_77_p1;
wire   [15:0] grp_fu_81_p1;
wire   [15:0] grp_fu_86_p1;
wire   [15:0] trunc_ln220_fu_95_p1;
wire   [15:0] grp_fu_77_p2;
wire    ap_CS_fsm_state17;
wire   [15:0] bitcast_ln648_fu_132_p1;
wire   [0:0] tmp_fu_136_p3;
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
hadd_16ns_16ns_16_5_full_dsp_1_U305(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(mul_i_i_i_reg_187),
    .din1(grp_fu_77_p1),
    .dout(grp_fu_77_p2)
);

td_fused_top_hsub_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_5_full_dsp_1_U306(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sums_read),
    .din1(grp_fu_81_p1),
    .dout(grp_fu_81_p2)
);

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U307(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_177),
    .din1(grp_fu_86_p1),
    .dout(grp_fu_86_p2)
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
        mul_i_i_i_reg_187 <= grp_fu_86_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sub_i_i_i_reg_177 <= grp_fu_81_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        tmp_42_i_i_reg_167 <= {{adjustments_q0[31:16]}};
        tmp_43_i_i_reg_172 <= {{adjustments_q0[47:32]}};
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (~((input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
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
        input_indices_23_blk_n = input_indices_23_empty_n;
    end else begin
        input_indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_read = 1'b1;
    end else begin
        input_indices_23_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign adjustments_address0 = zext_ln220_fu_90_p1;

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
    ap_block_state1 = ((input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_return = ((tmp_fu_136_p3[0:0] == 1'b1) ? 16'd0 : grp_fu_77_p2);

assign bitcast_ln648_fu_132_p1 = grp_fu_77_p2;

assign grp_fu_77_p1 = tmp_43_i_i_reg_172;

assign grp_fu_81_p1 = trunc_ln220_fu_95_p1;

assign grp_fu_86_p1 = tmp_42_i_i_reg_167;

assign tmp_fu_136_p3 = bitcast_ln648_fu_132_p1[32'd15];

assign trunc_ln220_fu_95_p1 = adjustments_q0[15:0];

assign zext_ln220_fu_90_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf5_adjust
module td_fused_top_Block_entry_proc_proc408 (
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

endmodule //td_fused_top_Block_entry_proc_proc408
module td_fused_top_tdf5_accum_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_10,
        accum_in_10_ap_vld,
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
output  [15:0] accum_in_10;
output   accum_in_10_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_10;
reg accum_in_10_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln81_fu_74_p2;
reg   [3:0] add_ln81_reg_91;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln81_fu_85_p2;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state7;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln81_fu_80_p1;
reg   [15:0] accum_in_10_preg;
reg   [6:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
#0 accum_in_10_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_5_full_dsp_1_U301(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_q0),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_10_preg <= 16'd0;
    end else begin
        if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_10_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        i_1_1_reg_44 <= add_ln81_reg_91;
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
        add_ln81_reg_91 <= add_ln81_fu_74_p2;
    end
end

always @ (*) begin
    if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_10 = sum_01_reg_55;
    end else begin
        accum_in_10 = accum_in_10_preg;
    end
end

always @ (*) begin
    if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_10_ap_vld = 1'b1;
    end else begin
        accum_in_10_ap_vld = 1'b0;
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
    if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln81_fu_85_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign accum_in_address0 = zext_ln81_fu_80_p1;

assign add_ln81_fu_74_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln81_fu_85_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln81_fu_80_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf5_accum_2
module td_fused_top_tdf5_accum_1 (
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
wire   [0:0] icmp_ln49_fu_321_p2;
reg   [0:0] icmp_ln49_reg_492;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
wire    ap_block_state10_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln49_reg_492_pp0_iter1_reg;
reg   [0:0] icmp_ln49_reg_492_pp0_iter2_reg;
reg   [15:0] accum_in_0_load_reg_506;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state7_pp0_stage1_iter1;
wire    ap_block_state11_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in_0_load_29_reg_511;
reg   [15:0] accum_in_0_load_30_reg_526;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state8_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in_0_load_31_reg_531;
wire   [7:0] add_ln49_fu_387_p2;
reg   [7:0] add_ln49_reg_546;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state9_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
reg   [15:0] accum_in_0_load_32_reg_551;
reg   [15:0] accum_in_0_load_33_reg_556;
reg   [15:0] accum_in_0_load_34_reg_571;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_0_load_35_reg_576;
wire   [15:0] grp_fu_305_p2;
wire   [15:0] grp_fu_310_p2;
reg    ap_enable_reg_pp0_iter2;
wire   [3:0] add_ln57_fu_432_p2;
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
reg   [15:0] ap_phi_mux_phi_ln69_phi_fu_290_p8;
wire   [2:0] trunc_ln57_fu_428_p1;
wire   [63:0] zext_ln49_fu_327_p1;
wire   [63:0] zext_ln53_fu_338_p1;
wire   [63:0] zext_ln53_7_fu_349_p1;
wire   [63:0] zext_ln53_8_fu_360_p1;
wire   [63:0] zext_ln53_9_fu_371_p1;
wire   [63:0] zext_ln53_10_fu_382_p1;
wire   [63:0] zext_ln53_11_fu_399_p1;
wire   [63:0] zext_ln53_12_fu_410_p1;
wire   [63:0] zext_ln57_fu_423_p1;
wire   [63:0] zext_ln57_2_fu_444_p1;
reg   [15:0] grp_fu_305_p0;
reg   [15:0] grp_fu_305_p1;
reg   [15:0] grp_fu_310_p0;
reg   [15:0] grp_fu_310_p1;
wire   [7:0] or_ln53_fu_332_p2;
wire   [7:0] or_ln53_7_fu_343_p2;
wire   [7:0] or_ln53_8_fu_354_p2;
wire   [7:0] or_ln53_9_fu_365_p2;
wire   [7:0] or_ln53_10_fu_376_p2;
wire   [7:0] or_ln53_11_fu_393_p2;
wire   [7:0] or_ln53_12_fu_404_p2;
wire   [2:0] or_ln57_fu_438_p2;
wire   [0:0] icmp_ln69_fu_449_p2;
wire   [0:0] icmp_ln69_3_fu_463_p2;
wire   [15:0] select_ln69_fu_455_p3;
wire   [0:0] icmp_ln69_4_fu_477_p2;
wire   [15:0] select_ln69_3_fu_469_p3;
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
hadd_16ns_16ns_16_5_full_dsp_1_U297(
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
hadd_16ns_16ns_16_5_full_dsp_1_U298(
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
        q_reg_276 <= add_ln57_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        x_reg_168 <= add_ln49_reg_546;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_168 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        accum_in_0_load_29_reg_511 <= accum_in_0_q0;
        accum_in_0_load_reg_506 <= accum_in_0_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        accum_in_0_load_30_reg_526 <= accum_in_0_q1;
        accum_in_0_load_31_reg_531 <= accum_in_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        accum_in_0_load_32_reg_551 <= accum_in_0_q1;
        accum_in_0_load_33_reg_556 <= accum_in_0_q0;
        add_ln49_reg_546 <= add_ln49_fu_387_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_0_load_34_reg_571 <= accum_in_0_q1;
        accum_in_0_load_35_reg_576 <= accum_in_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln49_reg_492 <= icmp_ln49_fu_321_p2;
        icmp_ln49_reg_492_pp0_iter1_reg <= icmp_ln49_reg_492;
        icmp_ln49_reg_492_pp0_iter2_reg <= icmp_ln49_reg_492_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        psum_0_01_reg_264 <= grp_fu_305_p2;
        psum_1_02_reg_252 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        psum_2_03_reg_240 <= grp_fu_305_p2;
        psum_3_04_reg_228 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_492_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        psum_4_05_reg_216 <= grp_fu_305_p2;
        psum_5_06_reg_204 <= grp_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_492_pp0_iter2_reg == 1'd1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        psum_6_07_reg_192 <= grp_fu_305_p2;
        psum_7_08_reg_180 <= grp_fu_310_p2;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            accum_in_0_address0 = zext_ln53_12_fu_410_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_0_address0 = zext_ln53_10_fu_382_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_0_address0 = zext_ln53_8_fu_360_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_0_address0 = zext_ln53_fu_338_p1;
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
            accum_in_0_address1 = zext_ln53_11_fu_399_p1;
        end else if (((1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            accum_in_0_address1 = zext_ln53_9_fu_371_p1;
        end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            accum_in_0_address1 = zext_ln53_7_fu_349_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            accum_in_0_address1 = zext_ln49_fu_327_p1;
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
    if ((icmp_ln49_reg_492 == 1'd0)) begin
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
        if ((trunc_ln57_fu_428_p1 == 3'd0)) begin
            ap_phi_mux_phi_ln69_phi_fu_290_p8 = psum_0_01_reg_264;
        end else if ((1'b1 == ap_condition_514)) begin
            ap_phi_mux_phi_ln69_phi_fu_290_p8 = psum_6_07_reg_192;
        end else if ((trunc_ln57_fu_428_p1 == 3'd4)) begin
            ap_phi_mux_phi_ln69_phi_fu_290_p8 = psum_4_05_reg_216;
        end else if ((trunc_ln57_fu_428_p1 == 3'd2)) begin
            ap_phi_mux_phi_ln69_phi_fu_290_p8 = psum_2_03_reg_240;
        end else begin
            ap_phi_mux_phi_ln69_phi_fu_290_p8 = 'bx;
        end
    end else begin
        ap_phi_mux_phi_ln69_phi_fu_290_p8 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln49_reg_492 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_x_phi_fu_172_p4 = add_ln49_reg_546;
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
        grp_fu_305_p1 = accum_in_0_load_34_reg_571;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_305_p1 = accum_in_0_load_32_reg_551;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_305_p1 = accum_in_0_load_30_reg_526;
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
        grp_fu_310_p1 = accum_in_0_load_35_reg_576;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        grp_fu_310_p1 = accum_in_0_load_33_reg_556;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        grp_fu_310_p1 = accum_in_0_load_31_reg_531;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        grp_fu_310_p1 = accum_in_0_load_29_reg_511;
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
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln49_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (icmp_ln49_reg_492 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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

assign accum_out_address0 = zext_ln57_2_fu_444_p1;

assign accum_out_address1 = zext_ln57_fu_423_p1;

assign accum_out_d0 = ((icmp_ln69_4_fu_477_p2[0:0] == 1'b1) ? psum_5_06_reg_204 : select_ln69_3_fu_469_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln69_phi_fu_290_p8;

assign add_ln49_fu_387_p2 = (x_reg_168 + 8'd8);

assign add_ln57_fu_432_p2 = (q_reg_276 + 4'd2);

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
    ap_condition_514 = (~(trunc_ln57_fu_428_p1 == 3'd0) & ~(trunc_ln57_fu_428_p1 == 3'd4) & ~(trunc_ln57_fu_428_p1 == 3'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_psum_2_03_phi_fu_244_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_3_04_phi_fu_232_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_4_05_phi_fu_220_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_5_06_phi_fu_208_p4 = grp_fu_310_p2;

assign ap_phi_mux_psum_6_07_phi_fu_196_p4 = grp_fu_305_p2;

assign ap_phi_mux_psum_7_08_phi_fu_184_p4 = grp_fu_310_p2;

assign icmp_ln49_fu_321_p2 = ((ap_phi_mux_x_phi_fu_172_p4 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln69_3_fu_463_p2 = ((or_ln57_fu_438_p2 == 3'd3) ? 1'b1 : 1'b0);

assign icmp_ln69_4_fu_477_p2 = ((or_ln57_fu_438_p2 == 3'd5) ? 1'b1 : 1'b0);

assign icmp_ln69_fu_449_p2 = ((or_ln57_fu_438_p2 == 3'd1) ? 1'b1 : 1'b0);

assign or_ln53_10_fu_376_p2 = (x_reg_168 | 8'd5);

assign or_ln53_11_fu_393_p2 = (x_reg_168 | 8'd6);

assign or_ln53_12_fu_404_p2 = (x_reg_168 | 8'd7);

assign or_ln53_7_fu_343_p2 = (x_reg_168 | 8'd2);

assign or_ln53_8_fu_354_p2 = (x_reg_168 | 8'd3);

assign or_ln53_9_fu_365_p2 = (x_reg_168 | 8'd4);

assign or_ln53_fu_332_p2 = (ap_phi_mux_x_phi_fu_172_p4 | 8'd1);

assign or_ln57_fu_438_p2 = (trunc_ln57_fu_428_p1 | 3'd1);

assign select_ln69_3_fu_469_p3 = ((icmp_ln69_3_fu_463_p2[0:0] == 1'b1) ? psum_3_04_reg_228 : select_ln69_fu_455_p3);

assign select_ln69_fu_455_p3 = ((icmp_ln69_fu_449_p2[0:0] == 1'b1) ? psum_1_02_reg_252 : psum_7_08_reg_180);

assign tmp_fu_415_p3 = q_reg_276[32'd3];

assign trunc_ln57_fu_428_p1 = q_reg_276[2:0];

assign zext_ln49_fu_327_p1 = ap_phi_mux_x_phi_fu_172_p4;

assign zext_ln53_10_fu_382_p1 = or_ln53_10_fu_376_p2;

assign zext_ln53_11_fu_399_p1 = or_ln53_11_fu_393_p2;

assign zext_ln53_12_fu_410_p1 = or_ln53_12_fu_404_p2;

assign zext_ln53_7_fu_349_p1 = or_ln53_7_fu_343_p2;

assign zext_ln53_8_fu_360_p1 = or_ln53_8_fu_354_p2;

assign zext_ln53_9_fu_371_p1 = or_ln53_9_fu_365_p2;

assign zext_ln53_fu_338_p1 = or_ln53_fu_332_p2;

assign zext_ln57_2_fu_444_p1 = or_ln57_fu_438_p2;

assign zext_ln57_fu_423_p1 = q_reg_276;

endmodule //td_fused_top_tdf5_accum_1
module td_fused_top_tdf5_dot_product (
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
wire   [7:0] add_ln147_3_fu_157_p2;
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
wire   [1:0] select_ln148_7_fu_221_p3;
reg   [1:0] select_ln148_7_reg_434;
wire   [3:0] trunc_ln150_fu_229_p1;
reg   [3:0] trunc_ln150_reg_440;
reg   [3:0] trunc_ln150_reg_440_pp0_iter1_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter2_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter3_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter4_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter5_reg;
reg   [3:0] trunc_ln150_reg_440_pp0_iter6_reg;
wire   [4:0] add_ln149_fu_233_p2;
wire   [6:0] select_ln148_9_fu_245_p3;
wire   [1:0] select_ln147_8_fu_287_p3;
reg   [1:0] select_ln147_8_reg_455;
reg    ap_enable_reg_pp0_iter1;
wire   [3:0] select_ln148_8_fu_370_p3;
reg   [3:0] select_ln148_8_reg_460;
reg   [3:0] select_ln148_8_reg_460_pp0_iter2_reg;
reg   [3:0] select_ln148_8_reg_460_pp0_iter3_reg;
reg   [3:0] select_ln148_8_reg_460_pp0_iter4_reg;
reg   [3:0] select_ln148_8_reg_460_pp0_iter5_reg;
reg   [3:0] select_ln148_8_reg_460_pp0_iter6_reg;
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
wire   [6:0] add_ln148_3_fu_239_p2;
wire   [3:0] shl_ln_fu_257_p3;
wire   [3:0] zext_ln150_fu_253_p1;
wire   [3:0] sub_ln150_fu_265_p2;
wire   [3:0] zext_ln150_3_fu_271_p1;
wire   [1:0] add_ln147_fu_281_p2;
wire   [3:0] tmp_fu_298_p3;
wire   [3:0] select_ln147_10_cast_fu_294_p1;
wire   [3:0] shl_ln150_mid1_fu_316_p3;
wire   [3:0] zext_ln150_6_fu_312_p1;
wire   [3:0] sub_ln150_3_fu_324_p2;
wire   [3:0] add_ln150_fu_275_p2;
wire   [3:0] empty_88_fu_306_p2;
wire   [3:0] select_ln148_9_cast_fu_344_p1;
wire   [3:0] empty_89_fu_347_p2;
wire   [3:0] select_ln147_9_fu_330_p3;
wire   [3:0] zext_ln150_7_fu_361_p1;
wire   [3:0] add_ln150_3_fu_364_p2;
wire   [3:0] select_ln147_10_fu_337_p3;
wire   [7:0] tmp_78_cast_fu_353_p3;
wire   [7:0] select_ln148_cast_fu_377_p1;
wire   [7:0] empty_90_fu_380_p2;
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
hmul_16ns_16ns_16_4_max_dsp_1_U293(
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
        ii_reg_142 <= select_ln147_8_reg_455;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_142 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten17_reg_97 <= add_ln147_3_fu_157_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten17_reg_97 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_108 <= select_ln148_9_fu_245_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_108 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_119 <= select_ln148_7_reg_434;
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
        select_ln148_8_reg_460_pp0_iter2_reg <= select_ln148_8_reg_460;
        select_ln148_8_reg_460_pp0_iter3_reg <= select_ln148_8_reg_460_pp0_iter2_reg;
        select_ln148_8_reg_460_pp0_iter4_reg <= select_ln148_8_reg_460_pp0_iter3_reg;
        select_ln148_8_reg_460_pp0_iter5_reg <= select_ln148_8_reg_460_pp0_iter4_reg;
        select_ln148_8_reg_460_pp0_iter6_reg <= select_ln148_8_reg_460_pp0_iter5_reg;
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
        select_ln147_8_reg_455 <= select_ln147_8_fu_287_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_7_reg_434 <= select_ln148_7_fu_221_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_8_reg_460 <= select_ln148_8_fu_370_p3;
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
        ap_phi_mux_ii_phi_fu_146_p4 = select_ln147_8_reg_455;
    end else begin
        ap_phi_mux_ii_phi_fu_146_p4 = ii_reg_142;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_123_p4 = select_ln148_7_reg_434;
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

assign add_ln147_3_fu_157_p2 = (indvar_flatten17_reg_97 + 8'd1);

assign add_ln147_fu_281_p2 = (ap_phi_mux_ii_phi_fu_146_p4 + 2'd1);

assign add_ln148_3_fu_239_p2 = (indvar_flatten_reg_108 + 7'd1);

assign add_ln148_fu_201_p2 = (select_ln147_fu_175_p3 + 2'd1);

assign add_ln149_fu_233_p2 = (select_ln148_fu_213_p3 + 5'd1);

assign add_ln150_3_fu_364_p2 = (select_ln147_9_fu_330_p3 + zext_ln150_7_fu_361_p1);

assign add_ln150_fu_275_p2 = (sub_ln150_fu_265_p2 + zext_ln150_3_fu_271_p1);

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

assign empty_88_fu_306_p2 = (tmp_fu_298_p3 - select_ln147_10_cast_fu_294_p1);

assign empty_89_fu_347_p2 = (empty_88_fu_306_p2 + select_ln148_9_cast_fu_344_p1);

assign empty_90_fu_380_p2 = (tmp_78_cast_fu_353_p3 + select_ln148_cast_fu_377_p1);

assign icmp_ln147_fu_163_p2 = ((indvar_flatten17_reg_97 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_169_p2 = ((indvar_flatten_reg_108 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_189_p2 = ((ic_reg_131 == 5'd16) ? 1'b1 : 1'b0);

assign idxprom30_fu_398_p1 = p_fu_392_p3;

assign ifmap_vec_address0 = p_cast25_fu_386_p1;

assign or_ln148_fu_207_p2 = (icmp_ln148_fu_169_p2 | and_ln147_fu_195_p2);

assign p_cast25_fu_386_p1 = empty_90_fu_380_p2;

assign p_fu_392_p3 = {{select_ln148_8_reg_460_pp0_iter6_reg}, {trunc_ln150_reg_440_pp0_iter6_reg}};

assign products_0_address0 = idxprom30_fu_398_p1;

assign products_0_d0 = mul_reg_485;

assign select_ln147_10_cast_fu_294_p1 = select_ln147_8_fu_287_p3;

assign select_ln147_10_fu_337_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_3_fu_324_p2 : add_ln150_fu_275_p2);

assign select_ln147_8_fu_287_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? add_ln147_fu_281_p2 : ap_phi_mux_ii_phi_fu_146_p4);

assign select_ln147_9_fu_330_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_3_fu_324_p2 : sub_ln150_fu_265_p2);

assign select_ln147_fu_175_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_123_p4);

assign select_ln148_7_fu_221_p3 = ((and_ln147_fu_195_p2[0:0] == 1'b1) ? add_ln148_fu_201_p2 : select_ln147_fu_175_p3);

assign select_ln148_8_fu_370_p3 = ((and_ln147_reg_419[0:0] == 1'b1) ? add_ln150_3_fu_364_p2 : select_ln147_10_fu_337_p3);

assign select_ln148_9_cast_fu_344_p1 = select_ln148_7_reg_434;

assign select_ln148_9_fu_245_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 7'd1 : add_ln148_3_fu_239_p2);

assign select_ln148_cast_fu_377_p1 = select_ln148_reg_429;

assign select_ln148_fu_213_p3 = ((or_ln148_fu_207_p2[0:0] == 1'b1) ? 5'd0 : ic_reg_131);

assign shl_ln150_mid1_fu_316_p3 = {{add_ln147_fu_281_p2}, {2'd0}};

assign shl_ln_fu_257_p3 = {{ap_phi_mux_ii_phi_fu_146_p4}, {2'd0}};

assign sub_ln150_3_fu_324_p2 = (shl_ln150_mid1_fu_316_p3 - zext_ln150_6_fu_312_p1);

assign sub_ln150_fu_265_p2 = (shl_ln_fu_257_p3 - zext_ln150_fu_253_p1);

assign tmp_78_cast_fu_353_p3 = {{empty_89_fu_347_p2}, {4'd0}};

assign tmp_fu_298_p3 = {{select_ln147_8_fu_287_p3}, {2'd0}};

assign trunc_ln150_fu_229_p1 = select_ln148_fu_213_p3[3:0];

assign weight_vecs_0_address0 = p_cast25_fu_386_p1;

assign xor_ln147_fu_183_p2 = (icmp_ln148_fu_169_p2 ^ 1'd1);

assign zext_ln150_3_fu_271_p1 = jj_reg_119;

assign zext_ln150_6_fu_312_p1 = add_ln147_fu_281_p2;

assign zext_ln150_7_fu_361_p1 = add_ln148_reg_424;

assign zext_ln150_fu_253_p1 = ap_phi_mux_ii_phi_fu_146_p4;

endmodule //td_fused_top_tdf5_dot_product
module td_fused_top_tdf5_readFilters40 (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
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
input  [6:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [7:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_ce0;
reg input_indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg   [7:0] indvar_flatten13_reg_123;
reg   [1:0] ii_reg_134;
reg   [6:0] indvar_flatten_reg_145;
reg   [1:0] jj_reg_156;
reg   [4:0] kk_reg_167;
wire   [10:0] sext_ln47_fu_200_p1;
reg   [10:0] sext_ln47_reg_408;
wire   [7:0] add_ln47_3_fu_204_p2;
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
wire   [1:0] select_ln47_3_fu_228_p3;
reg   [1:0] select_ln47_3_reg_429;
wire   [6:0] select_ln48_6_fu_242_p3;
wire   [1:0] select_ln48_5_fu_329_p3;
reg   [1:0] select_ln48_5_reg_442;
reg    ap_enable_reg_pp0_iter1;
wire   [7:0] add_ln55_12_fu_392_p2;
reg   [7:0] add_ln55_12_reg_452;
reg   [7:0] add_ln55_12_reg_452_pp0_iter2_reg;
reg   [7:0] add_ln55_12_reg_452_pp0_iter3_reg;
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
wire   [63:0] zext_ln55_28_fu_387_p1;
wire   [63:0] zext_ln55_29_fu_404_p1;
wire   [8:0] tmp_fu_182_p3;
wire   [9:0] zext_ln55_21_fu_190_p1;
wire   [9:0] zext_ln55_fu_178_p1;
wire   [9:0] sub_ln55_fu_194_p2;
wire   [1:0] add_ln47_fu_216_p2;
wire   [6:0] add_ln48_3_fu_236_p2;
wire   [10:0] zext_ln55_23_fu_260_p1;
wire   [10:0] add_ln55_fu_263_p2;
wire   [10:0] shl_ln55_fu_268_p2;
wire   [3:0] tmp_s_fu_280_p3;
wire   [3:0] zext_ln55_22_fu_257_p1;
wire   [0:0] icmp_ln49_fu_298_p2;
wire   [0:0] xor_ln47_fu_293_p2;
wire   [1:0] select_ln47_fu_250_p3;
wire   [0:0] and_ln47_fu_304_p2;
wire   [0:0] or_ln48_fu_316_p2;
wire   [1:0] add_ln48_fu_310_p2;
wire   [10:0] sub_ln55_5_fu_274_p2;
wire   [10:0] zext_ln55_25_fu_341_p1;
wire   [10:0] add_ln55_9_fu_345_p2;
wire   [3:0] sub_ln55_6_fu_287_p2;
wire   [3:0] zext_ln55_24_fu_337_p1;
wire   [3:0] add_ln55_10_fu_359_p2;
wire   [4:0] select_ln48_fu_321_p3;
wire   [14:0] tmp_74_cast_fu_351_p3;
wire   [14:0] zext_ln55_27_fu_377_p1;
wire   [14:0] add_ln55_11_fu_381_p2;
wire   [7:0] tmp_76_cast_fu_365_p3;
wire   [7:0] zext_ln55_26_fu_373_p1;
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_134 <= select_ln47_3_reg_429;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_134 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten13_reg_123 <= add_ln47_3_fu_204_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_123 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_145 <= select_ln48_6_fu_242_p3;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_145 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        jj_reg_156 <= select_ln48_5_reg_442;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_156 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_167 <= add_ln49_fu_398_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_167 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln55_12_reg_452 <= add_ln55_12_fu_392_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_12_reg_452_pp0_iter2_reg <= add_ln55_12_reg_452;
        add_ln55_12_reg_452_pp0_iter3_reg <= add_ln55_12_reg_452_pp0_iter2_reg;
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
        select_ln47_3_reg_429 <= select_ln47_3_fu_228_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln48_5_reg_442 <= select_ln48_5_fu_329_p3;
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
        ap_phi_mux_ii_phi_fu_138_p4 = select_ln47_3_reg_429;
    end else begin
        ap_phi_mux_ii_phi_fu_138_p4 = ii_reg_134;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_160_p4 = select_ln48_5_reg_442;
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
        input_indices_23_blk_n = input_indices_23_empty_n;
    end else begin
        input_indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_read = 1'b1;
    end else begin
        input_indices_23_read = 1'b0;
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
            if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign add_ln47_3_fu_204_p2 = (indvar_flatten13_reg_123 + 8'd1);

assign add_ln47_fu_216_p2 = (ap_phi_mux_ii_phi_fu_138_p4 + 2'd1);

assign add_ln48_3_fu_236_p2 = (indvar_flatten_reg_145 + 7'd1);

assign add_ln48_fu_310_p2 = (select_ln47_fu_250_p3 + 2'd1);

assign add_ln49_fu_398_p2 = (select_ln48_fu_321_p3 + 5'd1);

assign add_ln55_10_fu_359_p2 = (sub_ln55_6_fu_287_p2 + zext_ln55_24_fu_337_p1);

assign add_ln55_11_fu_381_p2 = (tmp_74_cast_fu_351_p3 + zext_ln55_27_fu_377_p1);

assign add_ln55_12_fu_392_p2 = (tmp_76_cast_fu_365_p3 + zext_ln55_26_fu_373_p1);

assign add_ln55_9_fu_345_p2 = (sub_ln55_5_fu_274_p2 + zext_ln55_25_fu_341_p1);

assign add_ln55_fu_263_p2 = ((sext_ln47_reg_408) + (zext_ln55_23_fu_260_p1));

assign and_ln47_fu_304_p2 = (xor_ln47_fu_293_p2 & icmp_ln49_fu_298_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_address0 = zext_ln55_28_fu_387_p1;

assign icmp_ln47_fu_210_p2 = ((indvar_flatten13_reg_123 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_222_p2 = ((indvar_flatten_reg_145 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_298_p2 = ((kk_reg_167 == 5'd16) ? 1'b1 : 1'b0);

assign or_ln48_fu_316_p2 = (icmp_ln48_reg_422 | and_ln47_fu_304_p2);

assign select_ln47_3_fu_228_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? add_ln47_fu_216_p2 : ap_phi_mux_ii_phi_fu_138_p4);

assign select_ln47_fu_250_p3 = ((icmp_ln48_reg_422[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_160_p4);

assign select_ln48_5_fu_329_p3 = ((and_ln47_fu_304_p2[0:0] == 1'b1) ? add_ln48_fu_310_p2 : select_ln47_fu_250_p3);

assign select_ln48_6_fu_242_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? 7'd1 : add_ln48_3_fu_236_p2);

assign select_ln48_fu_321_p3 = ((or_ln48_fu_316_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_167);

assign sext_ln47_fu_200_p1 = (sub_ln55_fu_194_p2);

assign shl_ln55_fu_268_p2 = add_ln55_fu_263_p2 << 11'd2;

assign sub_ln55_5_fu_274_p2 = (shl_ln55_fu_268_p2 - add_ln55_fu_263_p2);

assign sub_ln55_6_fu_287_p2 = (tmp_s_fu_280_p3 - zext_ln55_22_fu_257_p1);

assign sub_ln55_fu_194_p2 = (zext_ln55_21_fu_190_p1 - zext_ln55_fu_178_p1);

assign tmp_74_cast_fu_351_p3 = {{add_ln55_9_fu_345_p2}, {4'd0}};

assign tmp_76_cast_fu_365_p3 = {{add_ln55_10_fu_359_p2}, {4'd0}};

assign tmp_fu_182_p3 = {{input_indices_23_dout}, {2'd0}};

assign tmp_s_fu_280_p3 = {{select_ln47_3_reg_429}, {2'd0}};

assign weight_vecs_0_address0 = zext_ln55_29_fu_404_p1;

assign weight_vecs_0_d0 = filter_data_q0;

assign xor_ln47_fu_293_p2 = (icmp_ln48_reg_422 ^ 1'd1);

assign zext_ln55_21_fu_190_p1 = tmp_fu_182_p3;

assign zext_ln55_22_fu_257_p1 = select_ln47_3_reg_429;

assign zext_ln55_23_fu_260_p1 = select_ln47_3_reg_429;

assign zext_ln55_24_fu_337_p1 = select_ln48_5_fu_329_p3;

assign zext_ln55_25_fu_341_p1 = select_ln48_5_fu_329_p3;

assign zext_ln55_26_fu_373_p1 = select_ln48_fu_321_p3;

assign zext_ln55_27_fu_377_p1 = select_ln48_fu_321_p3;

assign zext_ln55_28_fu_387_p1 = add_ln55_11_fu_381_p2;

assign zext_ln55_29_fu_404_p1 = add_ln55_12_reg_452_pp0_iter3_reg;

assign zext_ln55_fu_178_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf5_readFilters40
module td_fused_top_tdf5_readInputs41 (
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
output  [13:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_15;
input  [15:0] j_15;
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
wire   [11:0] trunc_ln22_fu_274_p1;
reg   [11:0] trunc_ln22_reg_937;
wire   [17:0] sext_ln22_fu_284_p1;
reg   [17:0] sext_ln22_reg_943;
wire   [5:0] p_cast_fu_288_p2;
reg   [5:0] p_cast_reg_949;
wire   [0:0] or_ln23_11_fu_308_p2;
reg   [0:0] or_ln23_11_reg_955;
wire   [11:0] p_mid137_fu_314_p2;
reg   [11:0] p_mid137_reg_960;
wire   [5:0] p_cast5_i_fu_333_p2;
reg   [5:0] p_cast5_i_reg_965;
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
wire   [5:0] p_cast5_i_mid1_fu_418_p2;
reg   [5:0] p_cast5_i_mid1_reg_1004;
wire   [0:0] or_ln23_13_fu_437_p2;
reg   [0:0] or_ln23_13_reg_1010;
wire   [1:0] add_ln20_fu_442_p2;
reg   [1:0] add_ln20_reg_1017;
wire   [0:0] or_ln23_15_fu_477_p2;
reg   [0:0] or_ln23_15_reg_1023;
wire   [4:0] add_ln20_3_fu_483_p2;
reg   [4:0] add_ln20_3_reg_1030;
wire   [5:0] add_ln19_3_fu_489_p2;
reg   [5:0] add_ln19_3_reg_1035;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_state7_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_13_fu_527_p3;
reg   [1:0] select_ln19_13_reg_1040;
wire   [4:0] select_ln20_fu_591_p3;
reg   [4:0] select_ln20_reg_1047;
wire   [1:0] select_ln20_11_fu_599_p3;
reg   [1:0] select_ln20_11_reg_1053;
wire   [0:0] select_ln20_12_fu_608_p3;
reg   [0:0] select_ln20_12_reg_1059;
reg   [0:0] select_ln20_12_reg_1059_pp0_iter1_reg;
wire   [3:0] empty_87_fu_704_p1;
reg   [3:0] empty_87_reg_1067;
reg   [3:0] empty_87_reg_1067_pp0_iter1_reg;
wire   [4:0] select_ln20_15_fu_731_p3;
reg   [4:0] select_ln20_15_reg_1079;
wire   [4:0] add_ln25_fu_737_p2;
reg   [4:0] add_ln25_reg_1084;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_769_p2;
reg   [5:0] add_ln33_reg_1089;
wire   [7:0] add_ln33_3_fu_790_p2;
reg   [7:0] add_ln33_3_reg_1096;
wire   [15:0] select_ln33_14_fu_869_p3;
reg   [15:0] select_ln33_14_reg_1101;
wire   [15:0] select_ln33_15_fu_890_p3;
reg   [15:0] select_ln33_15_reg_1106;
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
wire   [63:0] zext_ln33_13_fu_796_p1;
wire   [63:0] sext_ln33_fu_828_p1;
wire   [63:0] sext_ln33_5_fu_909_p1;
wire   [63:0] sext_ln33_6_fu_926_p1;
wire   [15:0] select_ln33_fu_808_p3;
wire   [15:0] select_ln33_13_fu_847_p3;
wire   [16:0] zext_ln19_fu_256_p1;
wire   [16:0] empty_82_fu_264_p2;
wire   [16:0] j_cast_i_fu_252_p1;
wire   [16:0] add_ln22_fu_278_p2;
wire   [5:0] empty_fu_260_p1;
wire   [0:0] tmp_fu_294_p3;
wire   [0:0] icmp_ln24_fu_302_p2;
wire   [17:0] ii_cast_i_fu_320_p1;
wire   [5:0] ii_cast_fu_324_p1;
wire   [17:0] empty_83_fu_328_p2;
wire   [17:0] zext_ln20_fu_344_p1;
wire   [17:0] add_ln22_3_fu_348_p2;
wire   [0:0] tmp_20_fu_353_p3;
wire   [0:0] icmp_ln24_3_fu_361_p2;
wire   [0:0] or_ln23_fu_367_p2;
wire   [0:0] empty_84_fu_338_p2;
wire   [17:0] ii_cast_i_mid1_fu_405_p1;
wire   [5:0] ii_cast_mid1_fu_409_p1;
wire   [17:0] p_mid111_fu_413_p2;
wire   [0:0] p_mid113_fu_423_p2;
wire   [17:0] zext_ln20_3_fu_448_p1;
wire   [17:0] add_ln22_4_fu_452_p2;
wire   [0:0] tmp_21_fu_457_p3;
wire   [0:0] icmp_ln24_4_fu_465_p2;
wire   [0:0] or_ln23_14_fu_471_p2;
wire   [0:0] select_ln19_15_fu_429_p3;
wire   [2:0] zext_ln22_fu_495_p1;
wire   [2:0] tmp2_fu_505_p2;
wire   [11:0] tmp2_cast_fu_511_p1;
wire   [11:0] empty_85_fu_515_p2;
wire   [5:0] row_coord_int_mid131_fu_543_p3;
wire   [5:0] row_coord_int_fu_499_p3;
wire   [11:0] col_coord_int_mid139_fu_549_p3;
wire   [11:0] col_coord_int_fu_520_p3;
wire   [0:0] icmp_ln25_fu_574_p2;
wire   [0:0] xor_ln19_fu_569_p2;
wire   [0:0] and_ln19_fu_580_p2;
wire   [0:0] or_ln20_fu_586_p2;
wire   [0:0] select_ln19_16_fu_538_p3;
wire   [5:0] select_ln19_14_fu_533_p3;
wire   [2:0] zext_ln22_3_fu_605_p1;
wire   [2:0] tmp2_mid1_fu_622_p2;
wire   [11:0] tmp2_cast_mid1_fu_628_p1;
wire   [11:0] p_mid1_fu_632_p2;
wire   [5:0] row_coord_int_mid1_fu_615_p3;
wire   [5:0] select_ln19_17_fu_555_p3;
wire   [5:0] select_ln20_13_fu_644_p3;
wire   [11:0] tmp_4_fu_652_p3;
wire   [8:0] tmp_5_fu_664_p3;
wire   [12:0] zext_ln32_fu_660_p1;
wire   [12:0] zext_ln32_16_fu_672_p1;
wire   [12:0] sub_ln32_fu_676_p2;
wire   [11:0] col_coord_int_mid1_fu_637_p3;
wire   [11:0] select_ln19_18_fu_562_p3;
wire   [11:0] select_ln20_14_fu_686_p3;
wire   [13:0] sext_ln20_fu_682_p1;
wire   [13:0] zext_ln32_17_fu_694_p1;
wire   [13:0] add_ln32_fu_698_p2;
wire   [1:0] lshr_ln_fu_708_p4;
wire   [15:0] tmp_22_fu_718_p3;
wire   [3:0] tmp_s_fu_745_p3;
wire   [4:0] zext_ln33_10_fu_752_p1;
wire   [4:0] zext_ln33_fu_742_p1;
wire   [4:0] sub_ln33_fu_756_p2;
wire   [5:0] sub_ln33_cast_fu_762_p1;
wire   [5:0] zext_ln33_11_fu_766_p1;
wire   [3:0] trunc_ln33_fu_775_p1;
wire   [7:0] tmp_63_cast_fu_779_p3;
wire   [7:0] zext_ln33_12_fu_787_p1;
wire   [15:0] trunc_ln32_fu_800_p1;
wire   [15:0] bitcast_ln32_fu_804_p1;
wire   [3:0] or_ln25_fu_816_p2;
wire   [9:0] tmp_23_fu_821_p3;
wire   [15:0] tmp_39_i_fu_833_p4;
wire   [15:0] bitcast_ln32_13_fu_843_p1;
wire   [15:0] tmp_40_i_fu_855_p4;
wire   [15:0] bitcast_ln32_14_fu_865_p1;
wire   [15:0] tmp_41_i_fu_876_p4;
wire   [15:0] bitcast_ln32_15_fu_886_p1;
wire   [3:0] or_ln25_9_fu_897_p2;
wire   [9:0] tmp_24_fu_902_p3;
wire   [3:0] or_ln25_10_fu_914_p2;
wire   [9:0] tmp_25_fu_919_p3;
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
        ii_reg_206 <= select_ln19_13_reg_1040;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_206 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten47_reg_194 <= add_ln19_3_reg_1035;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten47_reg_194 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten_reg_218 <= select_ln20_15_reg_1079;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_218 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_229 <= select_ln20_11_reg_1053;
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
        add_ln19_3_reg_1035 <= add_ln19_3_fu_489_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_379_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_982 <= add_ln19_fu_385_p2;
        add_ln20_3_reg_1030 <= add_ln20_3_fu_483_p2;
        add_ln20_reg_1017 <= add_ln20_fu_442_p2;
        icmp_ln20_reg_987 <= icmp_ln20_fu_391_p2;
        or_ln23_13_reg_1010 <= or_ln23_13_fu_437_p2;
        or_ln23_15_reg_1023 <= or_ln23_15_fu_477_p2;
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
        add_ln33_3_reg_1096 <= add_ln33_3_fu_790_p2;
        add_ln33_reg_1089 <= add_ln33_fu_769_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_87_reg_1067 <= empty_87_fu_704_p1;
        select_ln20_12_reg_1059 <= select_ln20_12_fu_608_p3;
        select_ln20_reg_1047 <= select_ln20_fu_591_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_87_reg_1067_pp0_iter1_reg <= empty_87_reg_1067;
        select_ln20_12_reg_1059_pp0_iter1_reg <= select_ln20_12_reg_1059;
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
        or_ln23_11_reg_955 <= or_ln23_11_fu_308_p2;
        p_cast_i_reg_931 <= p_cast_i_fu_270_p1;
        p_cast_reg_949 <= p_cast_fu_288_p2;
        p_mid137_reg_960 <= p_mid137_fu_314_p2;
        sext_ln22_reg_943 <= sext_ln22_fu_284_p1;
        trunc_ln22_reg_937 <= trunc_ln22_fu_274_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln19_13_reg_1040 <= select_ln19_13_fu_527_p3;
        select_ln20_11_reg_1053 <= select_ln20_11_fu_599_p3;
        select_ln20_15_reg_1079 <= select_ln20_15_fu_731_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_978_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln33_14_reg_1101 <= select_ln33_14_fu_869_p3;
        select_ln33_15_reg_1106 <= select_ln33_15_fu_890_p3;
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
        ap_phi_mux_ii_phi_fu_210_p4 = select_ln19_13_reg_1040;
    end else begin
        ap_phi_mux_ii_phi_fu_210_p4 = ii_reg_206;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_198_p4 = add_ln19_3_reg_1035;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_198_p4 = indvar_flatten47_reg_194;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten_phi_fu_222_p4 = select_ln20_15_reg_1079;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_222_p4 = indvar_flatten_reg_218;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_978 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_233_p4 = select_ln20_11_reg_1053;
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
            ifmap_vec_address0 = sext_ln33_6_fu_926_p1;
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
            ifmap_vec_address1 = sext_ln33_5_fu_909_p1;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_13_fu_796_p1;
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
            ifmap_vec_d0 = select_ln33_15_reg_1106;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_13_fu_847_p3;
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
            ifmap_vec_d1 = select_ln33_14_reg_1101;
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

assign add_ln19_3_fu_489_p2 = (indvar_flatten47_reg_194 + 6'd1);

assign add_ln19_fu_385_p2 = (ap_phi_mux_ii_phi_fu_210_p4 + 2'd1);

assign add_ln20_3_fu_483_p2 = (ap_phi_mux_indvar_flatten_phi_fu_222_p4 + 5'd1);

assign add_ln20_fu_442_p2 = (select_ln19_fu_397_p3 + 2'd1);

assign add_ln22_3_fu_348_p2 = ((sext_ln22_reg_943) + (zext_ln20_fu_344_p1));

assign add_ln22_4_fu_452_p2 = ((sext_ln22_reg_943) + (zext_ln20_3_fu_448_p1));

assign add_ln22_fu_278_p2 = ((j_cast_i_fu_252_p1) + (17'd131071));

assign add_ln25_fu_737_p2 = (select_ln20_reg_1047 + 5'd4);

assign add_ln32_fu_698_p2 = ((sext_ln20_fu_682_p1) + (zext_ln32_17_fu_694_p1));

assign add_ln33_3_fu_790_p2 = (tmp_63_cast_fu_779_p3 + zext_ln33_12_fu_787_p1);

assign add_ln33_fu_769_p2 = ((sub_ln33_cast_fu_762_p1) + (zext_ln33_11_fu_766_p1));

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

assign bitcast_ln32_13_fu_843_p1 = tmp_39_i_fu_833_p4;

assign bitcast_ln32_14_fu_865_p1 = tmp_40_i_fu_855_p4;

assign bitcast_ln32_15_fu_886_p1 = tmp_41_i_fu_876_p4;

assign bitcast_ln32_fu_804_p1 = trunc_ln32_fu_800_p1;

assign col_coord_int_fu_520_p3 = ((is_padding_reg_971[0:0] == 1'b1) ? 12'd0 : empty_85_fu_515_p2);

assign col_coord_int_mid139_fu_549_p3 = ((or_ln23_13_reg_1010[0:0] == 1'b1) ? 12'd0 : p_mid137_reg_960);

assign col_coord_int_mid1_fu_637_p3 = ((or_ln23_15_reg_1023[0:0] == 1'b1) ? 12'd0 : p_mid1_fu_632_p2);

assign empty_82_fu_264_p2 = ((zext_ln19_fu_256_p1) + (17'd131071));

assign empty_83_fu_328_p2 = ((p_cast_i_reg_931) + (ii_cast_i_fu_320_p1));

assign empty_84_fu_338_p2 = ((empty_83_fu_328_p2 > 18'd55) ? 1'b1 : 1'b0);

assign empty_85_fu_515_p2 = ((tmp2_cast_fu_511_p1) + (trunc_ln22_reg_937));

assign empty_87_fu_704_p1 = select_ln20_fu_591_p3[3:0];

assign empty_fu_260_p1 = i_15[5:0];

assign icmp_ln19_fu_379_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_198_p4 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_391_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_222_p4 == 5'd12) ? 1'b1 : 1'b0);

assign icmp_ln24_3_fu_361_p2 = (((add_ln22_3_fu_348_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_4_fu_465_p2 = (((add_ln22_4_fu_452_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_302_p2 = (((add_ln22_fu_278_p2) > (17'd55)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_574_p2 = ((ap_phi_mux_kk_0_i_phi_fu_245_p4 == 5'd16) ? 1'b1 : 1'b0);

assign ii_cast_fu_324_p1 = ap_phi_mux_ii_phi_fu_210_p4;

assign ii_cast_i_fu_320_p1 = ap_phi_mux_ii_phi_fu_210_p4;

assign ii_cast_i_mid1_fu_405_p1 = add_ln19_fu_385_p2;

assign ii_cast_mid1_fu_409_p1 = add_ln19_fu_385_p2;

assign in_data_address0 = sext_ln32_fu_726_p1;

assign is_padding_fu_373_p2 = (or_ln23_fu_367_p2 | empty_84_fu_338_p2);

assign j_cast_i_fu_252_p1 = j_15;

assign lshr_ln_fu_708_p4 = {{select_ln20_fu_591_p3[3:2]}};

assign or_ln20_fu_586_p2 = (icmp_ln20_reg_987 | and_ln19_fu_580_p2);

assign or_ln23_11_fu_308_p2 = (tmp_fu_294_p3 | icmp_ln24_fu_302_p2);

assign or_ln23_13_fu_437_p2 = (p_mid113_fu_423_p2 | or_ln23_11_reg_955);

assign or_ln23_14_fu_471_p2 = (tmp_21_fu_457_p3 | icmp_ln24_4_fu_465_p2);

assign or_ln23_15_fu_477_p2 = (select_ln19_15_fu_429_p3 | or_ln23_14_fu_471_p2);

assign or_ln23_fu_367_p2 = (tmp_20_fu_353_p3 | icmp_ln24_3_fu_361_p2);

assign or_ln25_10_fu_914_p2 = (empty_87_reg_1067_pp0_iter1_reg | 4'd3);

assign or_ln25_9_fu_897_p2 = (empty_87_reg_1067_pp0_iter1_reg | 4'd2);

assign or_ln25_fu_816_p2 = (empty_87_reg_1067_pp0_iter1_reg | 4'd1);

assign p_cast5_i_fu_333_p2 = (p_cast_reg_949 + ii_cast_fu_324_p1);

assign p_cast5_i_mid1_fu_418_p2 = (p_cast_reg_949 + ii_cast_mid1_fu_409_p1);

assign p_cast_fu_288_p2 = ((empty_fu_260_p1) + (6'd63));

assign p_cast_i_fu_270_p1 = (empty_82_fu_264_p2);

assign p_mid111_fu_413_p2 = ((p_cast_i_reg_931) + (ii_cast_i_mid1_fu_405_p1));

assign p_mid113_fu_423_p2 = ((p_mid111_fu_413_p2 > 18'd55) ? 1'b1 : 1'b0);

assign p_mid137_fu_314_p2 = ((trunc_ln22_fu_274_p1) + (12'd4095));

assign p_mid1_fu_632_p2 = ((tmp2_cast_mid1_fu_628_p1) + (trunc_ln22_reg_937));

assign row_coord_int_fu_499_p3 = ((is_padding_reg_971[0:0] == 1'b1) ? 6'd0 : p_cast5_i_reg_965);

assign row_coord_int_mid131_fu_543_p3 = ((or_ln23_13_reg_1010[0:0] == 1'b1) ? 6'd0 : p_cast5_i_mid1_reg_1004);

assign row_coord_int_mid1_fu_615_p3 = ((or_ln23_15_reg_1023[0:0] == 1'b1) ? 6'd0 : select_ln19_14_fu_533_p3);

assign select_ln19_13_fu_527_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? add_ln19_reg_982 : ii_reg_206);

assign select_ln19_14_fu_533_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? p_cast5_i_mid1_reg_1004 : p_cast5_i_reg_965);

assign select_ln19_15_fu_429_p3 = ((icmp_ln20_fu_391_p2[0:0] == 1'b1) ? p_mid113_fu_423_p2 : empty_84_fu_338_p2);

assign select_ln19_16_fu_538_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? or_ln23_13_reg_1010 : is_padding_reg_971);

assign select_ln19_17_fu_555_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? row_coord_int_mid131_fu_543_p3 : row_coord_int_fu_499_p3);

assign select_ln19_18_fu_562_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? col_coord_int_mid139_fu_549_p3 : col_coord_int_fu_520_p3);

assign select_ln19_fu_397_p3 = ((icmp_ln20_fu_391_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_233_p4);

assign select_ln20_11_fu_599_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? add_ln20_reg_1017 : select_ln19_reg_999);

assign select_ln20_12_fu_608_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? or_ln23_15_reg_1023 : select_ln19_16_fu_538_p3);

assign select_ln20_13_fu_644_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_615_p3 : select_ln19_17_fu_555_p3);

assign select_ln20_14_fu_686_p3 = ((and_ln19_fu_580_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_637_p3 : select_ln19_18_fu_562_p3);

assign select_ln20_15_fu_731_p3 = ((icmp_ln20_reg_987[0:0] == 1'b1) ? 5'd1 : add_ln20_3_reg_1030);

assign select_ln20_fu_591_p3 = ((or_ln20_fu_586_p2[0:0] == 1'b1) ? 5'd0 : ap_phi_mux_kk_0_i_phi_fu_245_p4);

assign select_ln33_13_fu_847_p3 = ((select_ln20_12_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_13_fu_843_p1);

assign select_ln33_14_fu_869_p3 = ((select_ln20_12_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_14_fu_865_p1);

assign select_ln33_15_fu_890_p3 = ((select_ln20_12_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_15_fu_886_p1);

assign select_ln33_fu_808_p3 = ((select_ln20_12_reg_1059_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_804_p1);

assign sext_ln20_fu_682_p1 = (sub_ln32_fu_676_p2);

assign sext_ln22_fu_284_p1 = add_ln22_fu_278_p2;

assign sext_ln32_fu_726_p1 = (tmp_22_fu_718_p3);

assign sext_ln33_5_fu_909_p1 = (tmp_24_fu_902_p3);

assign sext_ln33_6_fu_926_p1 = (tmp_25_fu_919_p3);

assign sext_ln33_fu_828_p1 = (tmp_23_fu_821_p3);

assign sub_ln32_fu_676_p2 = (zext_ln32_fu_660_p1 - zext_ln32_16_fu_672_p1);

assign sub_ln33_cast_fu_762_p1 = (sub_ln33_fu_756_p2);

assign sub_ln33_fu_756_p2 = (zext_ln33_10_fu_752_p1 - zext_ln33_fu_742_p1);

assign tmp2_cast_fu_511_p1 = (tmp2_fu_505_p2);

assign tmp2_cast_mid1_fu_628_p1 = (tmp2_mid1_fu_622_p2);

assign tmp2_fu_505_p2 = ((zext_ln22_fu_495_p1) + (3'd7));

assign tmp2_mid1_fu_622_p2 = ((zext_ln22_3_fu_605_p1) + (3'd7));

assign tmp_20_fu_353_p3 = add_ln22_3_fu_348_p2[32'd17];

assign tmp_21_fu_457_p3 = add_ln22_4_fu_452_p2[32'd17];

assign tmp_22_fu_718_p3 = {{add_ln32_fu_698_p2}, {lshr_ln_fu_708_p4}};

assign tmp_23_fu_821_p3 = {{add_ln33_reg_1089}, {or_ln25_fu_816_p2}};

assign tmp_24_fu_902_p3 = {{add_ln33_reg_1089}, {or_ln25_9_fu_897_p2}};

assign tmp_25_fu_919_p3 = {{add_ln33_reg_1089}, {or_ln25_10_fu_914_p2}};

assign tmp_39_i_fu_833_p4 = {{in_data_q0[31:16]}};

assign tmp_40_i_fu_855_p4 = {{in_data_q0[47:32]}};

assign tmp_41_i_fu_876_p4 = {{in_data_q0[63:48]}};

assign tmp_4_fu_652_p3 = {{select_ln20_13_fu_644_p3}, {6'd0}};

assign tmp_5_fu_664_p3 = {{select_ln20_13_fu_644_p3}, {3'd0}};

assign tmp_63_cast_fu_779_p3 = {{trunc_ln33_fu_775_p1}, {4'd0}};

assign tmp_fu_294_p3 = add_ln22_fu_278_p2[32'd16];

assign tmp_s_fu_745_p3 = {{select_ln19_13_reg_1040}, {2'd0}};

assign trunc_ln22_fu_274_p1 = j_15[11:0];

assign trunc_ln32_fu_800_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_775_p1 = add_ln33_fu_769_p2[3:0];

assign xor_ln19_fu_569_p2 = (icmp_ln20_reg_987 ^ 1'd1);

assign zext_ln19_fu_256_p1 = i_15;

assign zext_ln20_3_fu_448_p1 = add_ln20_fu_442_p2;

assign zext_ln20_fu_344_p1 = ap_phi_mux_jj_phi_fu_233_p4;

assign zext_ln22_3_fu_605_p1 = add_ln20_reg_1017;

assign zext_ln22_fu_495_p1 = jj_reg_229;

assign zext_ln32_16_fu_672_p1 = tmp_5_fu_664_p3;

assign zext_ln32_17_fu_694_p1 = select_ln20_14_fu_686_p3;

assign zext_ln32_fu_660_p1 = tmp_4_fu_652_p3;

assign zext_ln33_10_fu_752_p1 = tmp_s_fu_745_p3;

assign zext_ln33_11_fu_766_p1 = select_ln20_11_reg_1053;

assign zext_ln33_12_fu_787_p1 = select_ln20_reg_1047;

assign zext_ln33_13_fu_796_p1 = add_ln33_3_reg_1096;

assign zext_ln33_fu_742_p1 = select_ln19_13_reg_1040;

endmodule //td_fused_top_tdf5_readInputs41
module td_fused_top_tdf5_get_next_ijk (
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
        input_indices_2_out_din,
        input_indices_2_out_full_n,
        input_indices_2_out_write,
        input_indices_2_out1_din,
        input_indices_2_out1_full_n,
        input_indices_2_out1_write,
        output_indices_0_din,
        output_indices_0_full_n,
        output_indices_0_write,
        output_indices_1_din,
        output_indices_1_full_n,
        output_indices_1_write,
        resetMaximum_din,
        resetMaximum_full_n,
        resetMaximum_write,
        storeOutput_din,
        storeOutput_full_n,
        storeOutput_write,
        ap_return_0,
        ap_return_1
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
output  [6:0] input_indices_2_out_din;
input   input_indices_2_out_full_n;
output   input_indices_2_out_write;
output  [6:0] input_indices_2_out1_din;
input   input_indices_2_out1_full_n;
output   input_indices_2_out1_write;
output  [4:0] output_indices_0_din;
input   output_indices_0_full_n;
output   output_indices_0_write;
output  [9:0] output_indices_1_din;
input   output_indices_1_full_n;
output   output_indices_1_write;
output   resetMaximum_din;
input   resetMaximum_full_n;
output   resetMaximum_write;
output   storeOutput_din;
input   storeOutput_full_n;
output   storeOutput_write;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg start_write;
reg input_indices_2_out_write;
reg input_indices_2_out1_write;
reg output_indices_0_write;
reg output_indices_1_write;
reg resetMaximum_write;
reg storeOutput_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg   [1:0] i_p_1;
reg   [1:0] j_p_1;
reg   [15:0] i_3;
reg   [15:0] j_3;
reg   [15:0] k_3;
reg   [15:0] i_out_1;
reg   [15:0] j_out_1;
reg    input_indices_2_out_blk_n;
reg    input_indices_2_out1_blk_n;
reg    output_indices_0_blk_n;
reg    output_indices_1_blk_n;
reg    resetMaximum_blk_n;
reg    storeOutput_blk_n;
wire   [1:0] select_ln142_fu_338_p3;
reg    ap_block_state1;
wire   [0:0] or_ln142_fu_312_p2;
wire   [1:0] select_ln142_5_fu_346_p3;
wire   [15:0] select_ln147_fu_278_p3;
wire   [0:0] and_ln142_2_fu_306_p2;
wire   [15:0] select_ln142_6_fu_360_p3;
wire   [0:0] and_ln132_fu_354_p2;
wire   [15:0] select_ln142_7_fu_388_p3;
wire   [0:0] and_ln135_fu_294_p2;
wire   [15:0] select_ln147_2_fu_286_p3;
wire   [15:0] select_ln142_8_fu_396_p3;
wire   [6:0] trunc_ln128_fu_182_p1;
wire   [1:0] or_ln124_fu_126_p2;
wire   [0:0] icmp_ln125_fu_139_p2;
wire   [0:0] icmp_ln125_2_fu_145_p2;
wire   [15:0] zext_ln126_fu_114_p1;
wire   [15:0] zext_ln127_fu_122_p1;
wire   [1:0] add_ln131_fu_206_p2;
wire   [1:0] add_ln134_fu_218_p2;
wire   [15:0] add_ln137_fu_230_p2;
wire   [15:0] add_ln141_fu_248_p2;
wire   [15:0] add_ln146_fu_266_p2;
wire   [0:0] icmp_ln147_fu_272_p2;
wire   [15:0] add_ln145_fu_260_p2;
wire   [0:0] icmp_ln132_fu_212_p2;
wire   [0:0] icmp_ln135_fu_224_p2;
wire   [0:0] icmp_ln138_fu_236_p2;
wire   [0:0] icmp_ln142_fu_254_p2;
wire   [0:0] and_ln142_fu_300_p2;
wire   [0:0] xor_ln135_fu_318_p2;
wire   [0:0] and_ln135_2_fu_324_p2;
wire   [1:0] select_ln135_fu_330_p3;
wire   [15:0] add_ln140_fu_242_p2;
wire   [0:0] xor_ln138_fu_368_p2;
wire   [0:0] and_ln138_fu_374_p2;
wire   [15:0] select_ln138_fu_380_p3;
wire   [15:0] add_ln126_fu_162_p2;
wire   [15:0] add_ln127_fu_172_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_p_1 = 2'd0;
#0 j_p_1 = 2'd0;
#0 i_3 = 16'd0;
#0 j_3 = 16'd0;
#0 k_3 = 16'd0;
#0 i_out_1 = 16'd0;
#0 j_out_1 = 16'd0;
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
        end else if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln142_2_fu_306_p2))) begin
        i_3 <= select_ln147_fu_278_p3;
        i_out_1 <= select_ln147_2_fu_286_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln142_fu_312_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_p_1 <= select_ln142_fu_338_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln132_fu_354_p2))) begin
        j_3 <= select_ln142_6_fu_360_p3;
        j_out_1 <= select_ln142_8_fu_396_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        j_p_1 <= select_ln142_5_fu_346_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln135_fu_294_p2))) begin
        k_3 <= select_ln142_7_fu_388_p3;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out1_blk_n = input_indices_2_out1_full_n;
    end else begin
        input_indices_2_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out1_write = 1'b1;
    end else begin
        input_indices_2_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out_blk_n = input_indices_2_out_full_n;
    end else begin
        input_indices_2_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out_write = 1'b1;
    end else begin
        input_indices_2_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_0_blk_n = output_indices_0_full_n;
    end else begin
        output_indices_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_0_write = 1'b1;
    end else begin
        output_indices_0_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_1_blk_n = output_indices_1_full_n;
    end else begin
        output_indices_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_1_write = 1'b1;
    end else begin
        output_indices_1_write = 1'b0;
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
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        resetMaximum_blk_n = resetMaximum_full_n;
    end else begin
        resetMaximum_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        resetMaximum_write = 1'b1;
    end else begin
        resetMaximum_write = 1'b0;
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
        storeOutput_blk_n = storeOutput_full_n;
    end else begin
        storeOutput_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        storeOutput_write = 1'b1;
    end else begin
        storeOutput_write = 1'b0;
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

assign add_ln126_fu_162_p2 = (i_3 + zext_ln126_fu_114_p1);

assign add_ln127_fu_172_p2 = (j_3 + zext_ln127_fu_122_p1);

assign add_ln131_fu_206_p2 = (j_p_1 + 2'd1);

assign add_ln134_fu_218_p2 = (i_p_1 + 2'd1);

assign add_ln137_fu_230_p2 = (k_3 + 16'd1);

assign add_ln140_fu_242_p2 = (j_3 + 16'd2);

assign add_ln141_fu_248_p2 = (j_out_1 + 16'd1);

assign add_ln145_fu_260_p2 = (i_3 + 16'd2);

assign add_ln146_fu_266_p2 = (i_out_1 + 16'd1);

assign and_ln132_fu_354_p2 = (icmp_ln138_fu_236_p2 & and_ln135_fu_294_p2);

assign and_ln135_2_fu_324_p2 = (xor_ln135_fu_318_p2 & icmp_ln132_fu_212_p2);

assign and_ln135_fu_294_p2 = (icmp_ln135_fu_224_p2 & icmp_ln132_fu_212_p2);

assign and_ln138_fu_374_p2 = (xor_ln138_fu_368_p2 & and_ln135_fu_294_p2);

assign and_ln142_2_fu_306_p2 = (and_ln142_fu_300_p2 & and_ln135_fu_294_p2);

assign and_ln142_fu_300_p2 = (icmp_ln142_fu_254_p2 & icmp_ln138_fu_236_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign ap_return_0 = add_ln126_fu_162_p2;

assign ap_return_1 = add_ln127_fu_172_p2;

assign icmp_ln125_2_fu_145_p2 = ((j_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln125_fu_139_p2 = ((i_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln132_fu_212_p2 = ((add_ln131_fu_206_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln135_fu_224_p2 = ((add_ln134_fu_218_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln138_fu_236_p2 = ((add_ln137_fu_230_p2 == 16'd128) ? 1'b1 : 1'b0);

assign icmp_ln142_fu_254_p2 = ((add_ln141_fu_248_p2 == 16'd28) ? 1'b1 : 1'b0);

assign icmp_ln147_fu_272_p2 = ((add_ln146_fu_266_p2 == 16'd28) ? 1'b1 : 1'b0);

assign input_indices_2_out1_din = trunc_ln128_fu_182_p1;

assign input_indices_2_out_din = trunc_ln128_fu_182_p1;

assign or_ln124_fu_126_p2 = (j_p_1 | i_p_1);

assign or_ln142_fu_312_p2 = (icmp_ln132_fu_212_p2 | and_ln142_2_fu_306_p2);

assign output_indices_0_din = i_out_1[4:0];

assign output_indices_1_din = j_out_1[9:0];

assign resetMaximum_din = ((or_ln124_fu_126_p2 == 2'd0) ? 1'b1 : 1'b0);

assign select_ln135_fu_330_p3 = ((and_ln135_2_fu_324_p2[0:0] == 1'b1) ? add_ln134_fu_218_p2 : 2'd0);

assign select_ln138_fu_380_p3 = ((and_ln138_fu_374_p2[0:0] == 1'b1) ? add_ln137_fu_230_p2 : 16'd0);

assign select_ln142_5_fu_346_p3 = ((or_ln142_fu_312_p2[0:0] == 1'b1) ? 2'd0 : add_ln131_fu_206_p2);

assign select_ln142_6_fu_360_p3 = ((and_ln142_2_fu_306_p2[0:0] == 1'b1) ? 16'd0 : add_ln140_fu_242_p2);

assign select_ln142_7_fu_388_p3 = ((and_ln142_2_fu_306_p2[0:0] == 1'b1) ? 16'd0 : select_ln138_fu_380_p3);

assign select_ln142_8_fu_396_p3 = ((and_ln142_2_fu_306_p2[0:0] == 1'b1) ? 16'd0 : add_ln141_fu_248_p2);

assign select_ln142_fu_338_p3 = ((and_ln142_2_fu_306_p2[0:0] == 1'b1) ? 2'd0 : select_ln135_fu_330_p3);

assign select_ln147_2_fu_286_p3 = ((icmp_ln147_fu_272_p2[0:0] == 1'b1) ? 16'd0 : add_ln146_fu_266_p2);

assign select_ln147_fu_278_p3 = ((icmp_ln147_fu_272_p2[0:0] == 1'b1) ? 16'd0 : add_ln145_fu_260_p2);

assign start_out = real_start;

assign storeOutput_din = (icmp_ln125_fu_139_p2 & icmp_ln125_2_fu_145_p2);

assign trunc_ln128_fu_182_p1 = k_3[6:0];

assign xor_ln135_fu_318_p2 = (icmp_ln135_fu_224_p2 ^ 1'd1);

assign xor_ln138_fu_368_p2 = (icmp_ln138_fu_236_p2 ^ 1'd1);

assign zext_ln126_fu_114_p1 = i_p_1;

assign zext_ln127_fu_122_p1 = j_p_1;

endmodule //td_fused_top_tdf5_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_products_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0
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
td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_weight_vecs_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP37738_ifmap_vec_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1,  clk);

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

module td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1
#(parameter
    ID         = 47,
    NUM_STAGE  = 2,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 1
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    input  wire [4:0]            opcode,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Parameter----------------------
// AutoESL opcode
localparam [4:0]
    AP_OEQ = 5'b00001,
    AP_OGT = 5'b00010,
    AP_OGE = 5'b00011,
    AP_OLT = 5'b00100,
    AP_OLE = 5'b00101,
    AP_ONE = 5'b00110,
    AP_UNO = 5'b01000;
// FPV6 opcode
localparam [7:0]
    OP_EQ = 8'b00010100,
    OP_GT = 8'b00100100,
    OP_GE = 8'b00110100,
    OP_LT = 8'b00001100,
    OP_LE = 8'b00011100,
    OP_NE = 8'b00101100,
    OP_UO = 8'b00000100;
//------------------------Local signal-------------------
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  op_tvalid;
reg  [7:0]            op_tdata;
wire                  r_tvalid;
wire [7:0]            r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg  [4:0]            opcode_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
td_fused_top_ap_hcmp_0_no_dsp_16 td_fused_top_ap_hcmp_0_no_dsp_16_u (
    .s_axis_a_tvalid         ( a_tvalid ),
    .s_axis_a_tdata          ( a_tdata ),
    .s_axis_b_tvalid         ( b_tvalid ),
    .s_axis_b_tdata          ( b_tdata ),
    .s_axis_operation_tvalid ( op_tvalid ),
    .s_axis_operation_tdata  ( op_tdata ),
    .m_axis_result_tvalid    ( r_tvalid ),
    .m_axis_result_tdata     ( r_tdata )
);
//------------------------Body---------------------------
assign a_tvalid  = 1'b1;
assign a_tdata   = din0_buf1;
assign b_tvalid  = 1'b1;
assign b_tdata   = din1_buf1;
assign op_tvalid = 1'b1;
assign dout_i    = r_tdata[0];

always @(*) begin
    case (opcode_buf1)
        AP_OEQ  : op_tdata = OP_EQ;
        AP_OGT  : op_tdata = OP_GT;
        AP_OGE  : op_tdata = OP_GE;
        AP_OLT  : op_tdata = OP_LT;
        AP_OLE  : op_tdata = OP_LE;
        AP_ONE  : op_tdata = OP_NE;
        AP_UNO  : op_tdata = OP_UO;
        default : op_tdata = OP_EQ;
    endcase
end

always @(posedge clk) begin
    if (ce) begin
        din0_buf1   <= din0;
        din1_buf1   <= din1;
        opcode_buf1 <= opcode;
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
module td_fused_top_ap_hcmp_0_no_dsp_16 (
   input  wire        s_axis_a_tvalid,
   input  wire [15:0] s_axis_a_tdata,
   input  wire        s_axis_b_tvalid,
   input  wire [15:0] s_axis_b_tdata,
   input  wire        s_axis_operation_tvalid,
   input  wire [7:0]  s_axis_operation_tdata,
   output wire        m_axis_result_tvalid,
   output wire [7:0]  m_axis_result_tdata
);
   // TEMP - compare module not yet ready
   // In the meantime, negate operand B, add them
   // together, and return the sign bit of the result.
   wire [15:0] b_negative;
   wire [15:0] result;
   assign b_negative = {~s_axis_b_tdata[15], s_axis_b_tdata[14:0]};
   
`ifdef complex_dsp
adder_fp u_add_fp (
      .a(s_axis_a_tdata), 
      .b(b_negative), 
      .out(result)
   );
`else
FPAddSub u_FPAddSub_2 (.clk(), .rst(1'b0), .a(s_axis_a_tdata), .b(b_negative), .operation(1'b0), .result(result), .flags());
`endif
   
   assign m_axis_result_tdata = {7'b0, result[15]};
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



























