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

module td_fused_top_dataflow_in_loop_TOP_LOOP16 (
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
        filter_data_0_address0,
        filter_data_0_ce0,
        filter_data_0_d0,
        filter_data_0_q0,
        filter_data_0_we0,
        filter_data_0_address1,
        filter_data_0_ce1,
        filter_data_0_d1,
        filter_data_0_q1,
        filter_data_0_we1,
        filter_data_1_address0,
        filter_data_1_ce0,
        filter_data_1_d0,
        filter_data_1_q0,
        filter_data_1_we0,
        filter_data_1_address1,
        filter_data_1_ce1,
        filter_data_1_d1,
        filter_data_1_q1,
        filter_data_1_we1,
        filter_data_2_address0,
        filter_data_2_ce0,
        filter_data_2_d0,
        filter_data_2_q0,
        filter_data_2_we0,
        filter_data_2_address1,
        filter_data_2_ce1,
        filter_data_2_d1,
        filter_data_2_q1,
        filter_data_2_we1,
        filter_data_3_address0,
        filter_data_3_ce0,
        filter_data_3_d0,
        filter_data_3_q0,
        filter_data_3_we0,
        filter_data_3_address1,
        filter_data_3_ce1,
        filter_data_3_d1,
        filter_data_3_q1,
        filter_data_3_we1,
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
output  [15:0] in_data_address0;
output   in_data_ce0;
output  [63:0] in_data_d0;
input  [63:0] in_data_q0;
output   in_data_we0;
output  [15:0] in_data_address1;
output   in_data_ce1;
output  [63:0] in_data_d1;
input  [63:0] in_data_q1;
output   in_data_we1;
output  [6:0] filter_data_0_address0;
output   filter_data_0_ce0;
output  [15:0] filter_data_0_d0;
input  [15:0] filter_data_0_q0;
output   filter_data_0_we0;
output  [6:0] filter_data_0_address1;
output   filter_data_0_ce1;
output  [15:0] filter_data_0_d1;
input  [15:0] filter_data_0_q1;
output   filter_data_0_we1;
output  [6:0] filter_data_1_address0;
output   filter_data_1_ce0;
output  [15:0] filter_data_1_d0;
input  [15:0] filter_data_1_q0;
output   filter_data_1_we0;
output  [6:0] filter_data_1_address1;
output   filter_data_1_ce1;
output  [15:0] filter_data_1_d1;
input  [15:0] filter_data_1_q1;
output   filter_data_1_we1;
output  [6:0] filter_data_2_address0;
output   filter_data_2_ce0;
output  [15:0] filter_data_2_d0;
input  [15:0] filter_data_2_q0;
output   filter_data_2_we0;
output  [6:0] filter_data_2_address1;
output   filter_data_2_ce1;
output  [15:0] filter_data_2_d1;
input  [15:0] filter_data_2_q1;
output   filter_data_2_we1;
output  [6:0] filter_data_3_address0;
output   filter_data_3_ce0;
output  [15:0] filter_data_3_d0;
input  [15:0] filter_data_3_q0;
output   filter_data_3_we0;
output  [6:0] filter_data_3_address1;
output   filter_data_3_ce1;
output  [15:0] filter_data_3_d1;
input  [15:0] filter_data_3_q1;
output   filter_data_3_we1;
output  [3:0] adjustments_address0;
output   adjustments_ce0;
output  [47:0] adjustments_d0;
input  [47:0] adjustments_q0;
output   adjustments_we0;
output  [3:0] adjustments_address1;
output   adjustments_ce1;
output  [47:0] adjustments_d1;
input  [47:0] adjustments_q1;
output   adjustments_we1;
output  [15:0] out_data_address0;
output   out_data_ce0;
output  [63:0] out_data_d0;
input  [63:0] out_data_q0;
output   out_data_we0;
output  [15:0] out_data_address1;
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
wire   [15:0] weight_vecs_1_i_q0;
wire   [15:0] weight_vecs_1_t_q0;
wire   [15:0] weight_vecs_2_i_q0;
wire   [15:0] weight_vecs_2_t_q0;
wire   [15:0] weight_vecs_3_i_q0;
wire   [15:0] weight_vecs_3_t_q0;
wire   [15:0] products_0_i_q0;
wire   [15:0] products_0_i_q1;
wire   [15:0] products_0_t_q0;
wire   [15:0] products_0_t_q1;
wire   [15:0] products_1_i_q0;
wire   [15:0] products_1_i_q1;
wire   [15:0] products_1_t_q0;
wire   [15:0] products_1_t_q1;
wire   [15:0] products_2_i_q0;
wire   [15:0] products_2_i_q1;
wire   [15:0] products_2_t_q0;
wire   [15:0] products_2_t_q1;
wire   [15:0] products_3_i_q0;
wire   [15:0] products_3_i_q1;
wire   [15:0] products_3_t_q0;
wire   [15:0] products_3_t_q1;
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
wire    tdf1_get_next_ijk_U0_ap_start;
wire    tdf1_get_next_ijk_U0_ap_done;
wire    tdf1_get_next_ijk_U0_ap_continue;
wire    tdf1_get_next_ijk_U0_ap_idle;
wire    tdf1_get_next_ijk_U0_ap_ready;
wire    tdf1_get_next_ijk_U0_start_out;
wire    tdf1_get_next_ijk_U0_start_write;
wire   [1:0] tdf1_get_next_ijk_U0_input_indices_2_out_din;
wire    tdf1_get_next_ijk_U0_input_indices_2_out_write;
wire   [3:0] tdf1_get_next_ijk_U0_input_indices_2_out1_din;
wire    tdf1_get_next_ijk_U0_input_indices_2_out1_write;
wire   [6:0] tdf1_get_next_ijk_U0_output_indices_0_din;
wire    tdf1_get_next_ijk_U0_output_indices_0_write;
wire   [13:0] tdf1_get_next_ijk_U0_output_indices_1_din;
wire    tdf1_get_next_ijk_U0_output_indices_1_write;
wire    tdf1_get_next_ijk_U0_resetMaximum_din;
wire    tdf1_get_next_ijk_U0_resetMaximum_write;
wire    tdf1_get_next_ijk_U0_storeOutput_din;
wire    tdf1_get_next_ijk_U0_storeOutput_write;
wire   [15:0] tdf1_get_next_ijk_U0_ap_return_0;
wire   [15:0] tdf1_get_next_ijk_U0_ap_return_1;
wire    ap_channel_done_input_indices_1;
wire    input_indices_1_full_n;
reg    ap_sync_reg_channel_write_input_indices_1;
wire    ap_sync_channel_write_input_indices_1;
wire    ap_channel_done_input_indices_0;
wire    input_indices_0_full_n;
reg    ap_sync_reg_channel_write_input_indices_0;
wire    ap_sync_channel_write_input_indices_0;
wire    tdf1_readInputs19_U0_ap_start;
wire    tdf1_readInputs19_U0_ap_done;
wire    tdf1_readInputs19_U0_ap_continue;
wire    tdf1_readInputs19_U0_ap_idle;
wire    tdf1_readInputs19_U0_ap_ready;
wire   [15:0] tdf1_readInputs19_U0_in_data_address0;
wire    tdf1_readInputs19_U0_in_data_ce0;
wire   [4:0] tdf1_readInputs19_U0_ifmap_vec_address0;
wire    tdf1_readInputs19_U0_ifmap_vec_ce0;
wire    tdf1_readInputs19_U0_ifmap_vec_we0;
wire   [15:0] tdf1_readInputs19_U0_ifmap_vec_d0;
wire    tdf1_readInputs19_U0_in_data_full_n;
wire    tdf1_readInputs19_U0_in_data_write;
wire    ap_channel_done_ifmap_vec;
wire    tdf1_readInputs19_U0_ifmap_vec_full_n;
wire    tdf1_readFilters18_U0_ap_start;
wire    tdf1_readFilters18_U0_ap_done;
wire    tdf1_readFilters18_U0_ap_continue;
wire    tdf1_readFilters18_U0_ap_idle;
wire    tdf1_readFilters18_U0_ap_ready;
wire   [6:0] tdf1_readFilters18_U0_filter_data_0_address0;
wire    tdf1_readFilters18_U0_filter_data_0_ce0;
wire   [6:0] tdf1_readFilters18_U0_filter_data_1_address0;
wire    tdf1_readFilters18_U0_filter_data_1_ce0;
wire   [6:0] tdf1_readFilters18_U0_filter_data_2_address0;
wire    tdf1_readFilters18_U0_filter_data_2_ce0;
wire   [6:0] tdf1_readFilters18_U0_filter_data_3_address0;
wire    tdf1_readFilters18_U0_filter_data_3_ce0;
wire    tdf1_readFilters18_U0_input_indices_23_read;
wire   [4:0] tdf1_readFilters18_U0_weight_vecs_0_address0;
wire    tdf1_readFilters18_U0_weight_vecs_0_ce0;
wire    tdf1_readFilters18_U0_weight_vecs_0_we0;
wire   [15:0] tdf1_readFilters18_U0_weight_vecs_0_d0;
wire   [4:0] tdf1_readFilters18_U0_weight_vecs_1_address0;
wire    tdf1_readFilters18_U0_weight_vecs_1_ce0;
wire    tdf1_readFilters18_U0_weight_vecs_1_we0;
wire   [15:0] tdf1_readFilters18_U0_weight_vecs_1_d0;
wire   [4:0] tdf1_readFilters18_U0_weight_vecs_2_address0;
wire    tdf1_readFilters18_U0_weight_vecs_2_ce0;
wire    tdf1_readFilters18_U0_weight_vecs_2_we0;
wire   [15:0] tdf1_readFilters18_U0_weight_vecs_2_d0;
wire   [4:0] tdf1_readFilters18_U0_weight_vecs_3_address0;
wire    tdf1_readFilters18_U0_weight_vecs_3_ce0;
wire    tdf1_readFilters18_U0_weight_vecs_3_we0;
wire   [15:0] tdf1_readFilters18_U0_weight_vecs_3_d0;
wire    ap_channel_done_weight_vecs_3;
wire    tdf1_readFilters18_U0_weight_vecs_3_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3;
wire    ap_sync_channel_write_weight_vecs_3;
wire    ap_channel_done_weight_vecs_2;
wire    tdf1_readFilters18_U0_weight_vecs_2_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2;
wire    ap_sync_channel_write_weight_vecs_2;
wire    ap_channel_done_weight_vecs_1;
wire    tdf1_readFilters18_U0_weight_vecs_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1;
wire    ap_sync_channel_write_weight_vecs_1;
wire    ap_channel_done_weight_vecs_0;
wire    tdf1_readFilters18_U0_weight_vecs_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0;
wire    ap_sync_channel_write_weight_vecs_0;
wire    tdf1_dot_product_U0_ap_start;
wire    tdf1_dot_product_U0_ap_done;
wire    tdf1_dot_product_U0_ap_continue;
wire    tdf1_dot_product_U0_ap_idle;
wire    tdf1_dot_product_U0_ap_ready;
wire   [4:0] tdf1_dot_product_U0_ifmap_vec_address0;
wire    tdf1_dot_product_U0_ifmap_vec_ce0;
wire   [4:0] tdf1_dot_product_U0_weight_vecs_0_address0;
wire    tdf1_dot_product_U0_weight_vecs_0_ce0;
wire   [4:0] tdf1_dot_product_U0_weight_vecs_1_address0;
wire    tdf1_dot_product_U0_weight_vecs_1_ce0;
wire   [4:0] tdf1_dot_product_U0_weight_vecs_2_address0;
wire    tdf1_dot_product_U0_weight_vecs_2_ce0;
wire   [4:0] tdf1_dot_product_U0_weight_vecs_3_address0;
wire    tdf1_dot_product_U0_weight_vecs_3_ce0;
wire   [4:0] tdf1_dot_product_U0_products_0_address0;
wire    tdf1_dot_product_U0_products_0_ce0;
wire    tdf1_dot_product_U0_products_0_we0;
wire   [15:0] tdf1_dot_product_U0_products_0_d0;
wire   [4:0] tdf1_dot_product_U0_products_1_address0;
wire    tdf1_dot_product_U0_products_1_ce0;
wire    tdf1_dot_product_U0_products_1_we0;
wire   [15:0] tdf1_dot_product_U0_products_1_d0;
wire   [4:0] tdf1_dot_product_U0_products_2_address0;
wire    tdf1_dot_product_U0_products_2_ce0;
wire    tdf1_dot_product_U0_products_2_we0;
wire   [15:0] tdf1_dot_product_U0_products_2_d0;
wire   [4:0] tdf1_dot_product_U0_products_3_address0;
wire    tdf1_dot_product_U0_products_3_ce0;
wire    tdf1_dot_product_U0_products_3_we0;
wire   [15:0] tdf1_dot_product_U0_products_3_d0;
wire    ap_channel_done_products_3;
wire    tdf1_dot_product_U0_products_3_full_n;
reg    ap_sync_reg_channel_write_products_3;
wire    ap_sync_channel_write_products_3;
wire    ap_channel_done_products_2;
wire    tdf1_dot_product_U0_products_2_full_n;
reg    ap_sync_reg_channel_write_products_2;
wire    ap_sync_channel_write_products_2;
wire    ap_channel_done_products_1;
wire    tdf1_dot_product_U0_products_1_full_n;
reg    ap_sync_reg_channel_write_products_1;
wire    ap_sync_channel_write_products_1;
wire    ap_channel_done_products_0;
wire    tdf1_dot_product_U0_products_0_full_n;
reg    ap_sync_reg_channel_write_products_0;
wire    ap_sync_channel_write_products_0;
wire    tdf1_accum_1_U0_ap_start;
wire    tdf1_accum_1_U0_ap_done;
wire    tdf1_accum_1_U0_ap_continue;
wire    tdf1_accum_1_U0_ap_idle;
wire    tdf1_accum_1_U0_ap_ready;
wire   [4:0] tdf1_accum_1_U0_accum_in_address0;
wire    tdf1_accum_1_U0_accum_in_ce0;
wire   [4:0] tdf1_accum_1_U0_accum_in_address1;
wire    tdf1_accum_1_U0_accum_in_ce1;
wire   [3:0] tdf1_accum_1_U0_accum_out_address0;
wire    tdf1_accum_1_U0_accum_out_ce0;
wire    tdf1_accum_1_U0_accum_out_we0;
wire   [15:0] tdf1_accum_1_U0_accum_out_d0;
wire    ap_channel_done_accum1_out_0;
wire    tdf1_accum_1_U0_accum_out_full_n;
wire    tdf1_accum_1_U1_1_ap_start;
wire    tdf1_accum_1_U1_1_ap_done;
wire    tdf1_accum_1_U1_1_ap_continue;
wire    tdf1_accum_1_U1_1_ap_idle;
wire    tdf1_accum_1_U1_1_ap_ready;
wire   [4:0] tdf1_accum_1_U1_1_accum_in_address0;
wire    tdf1_accum_1_U1_1_accum_in_ce0;
wire   [4:0] tdf1_accum_1_U1_1_accum_in_address1;
wire    tdf1_accum_1_U1_1_accum_in_ce1;
wire   [3:0] tdf1_accum_1_U1_1_accum_out_address0;
wire    tdf1_accum_1_U1_1_accum_out_ce0;
wire    tdf1_accum_1_U1_1_accum_out_we0;
wire   [15:0] tdf1_accum_1_U1_1_accum_out_d0;
wire    ap_channel_done_accum1_out_1;
wire    tdf1_accum_1_U1_1_accum_out_full_n;
wire    tdf1_accum_1_U2_2_ap_start;
wire    tdf1_accum_1_U2_2_ap_done;
wire    tdf1_accum_1_U2_2_ap_continue;
wire    tdf1_accum_1_U2_2_ap_idle;
wire    tdf1_accum_1_U2_2_ap_ready;
wire   [4:0] tdf1_accum_1_U2_2_accum_in_address0;
wire    tdf1_accum_1_U2_2_accum_in_ce0;
wire   [4:0] tdf1_accum_1_U2_2_accum_in_address1;
wire    tdf1_accum_1_U2_2_accum_in_ce1;
wire   [3:0] tdf1_accum_1_U2_2_accum_out_address0;
wire    tdf1_accum_1_U2_2_accum_out_ce0;
wire    tdf1_accum_1_U2_2_accum_out_we0;
wire   [15:0] tdf1_accum_1_U2_2_accum_out_d0;
wire    ap_channel_done_accum1_out_2;
wire    tdf1_accum_1_U2_2_accum_out_full_n;
wire    tdf1_accum_1_U3_3_ap_start;
wire    tdf1_accum_1_U3_3_ap_done;
wire    tdf1_accum_1_U3_3_ap_continue;
wire    tdf1_accum_1_U3_3_ap_idle;
wire    tdf1_accum_1_U3_3_ap_ready;
wire   [4:0] tdf1_accum_1_U3_3_accum_in_address0;
wire    tdf1_accum_1_U3_3_accum_in_ce0;
wire   [4:0] tdf1_accum_1_U3_3_accum_in_address1;
wire    tdf1_accum_1_U3_3_accum_in_ce1;
wire   [3:0] tdf1_accum_1_U3_3_accum_out_address0;
wire    tdf1_accum_1_U3_3_accum_out_ce0;
wire    tdf1_accum_1_U3_3_accum_out_we0;
wire   [15:0] tdf1_accum_1_U3_3_accum_out_d0;
wire    ap_channel_done_accum1_out_3;
wire    tdf1_accum_1_U3_3_accum_out_full_n;
wire    tdf1_accum_2_U0_ap_start;
wire    tdf1_accum_2_U0_ap_done;
wire    tdf1_accum_2_U0_ap_continue;
wire    tdf1_accum_2_U0_ap_idle;
wire    tdf1_accum_2_U0_ap_ready;
wire   [3:0] tdf1_accum_2_U0_accum_in_address0;
wire    tdf1_accum_2_U0_accum_in_ce0;
wire   [3:0] tdf1_accum_2_U0_accum_in_address1;
wire    tdf1_accum_2_U0_accum_in_ce1;
wire   [2:0] tdf1_accum_2_U0_accum_out_address0;
wire    tdf1_accum_2_U0_accum_out_ce0;
wire    tdf1_accum_2_U0_accum_out_we0;
wire   [15:0] tdf1_accum_2_U0_accum_out_d0;
wire    ap_channel_done_accum2_out_0;
wire    tdf1_accum_2_U0_accum_out_full_n;
wire    tdf1_accum_2_U1_1_ap_start;
wire    tdf1_accum_2_U1_1_ap_done;
wire    tdf1_accum_2_U1_1_ap_continue;
wire    tdf1_accum_2_U1_1_ap_idle;
wire    tdf1_accum_2_U1_1_ap_ready;
wire   [3:0] tdf1_accum_2_U1_1_accum_in_address0;
wire    tdf1_accum_2_U1_1_accum_in_ce0;
wire   [3:0] tdf1_accum_2_U1_1_accum_in_address1;
wire    tdf1_accum_2_U1_1_accum_in_ce1;
wire   [2:0] tdf1_accum_2_U1_1_accum_out_address0;
wire    tdf1_accum_2_U1_1_accum_out_ce0;
wire    tdf1_accum_2_U1_1_accum_out_we0;
wire   [15:0] tdf1_accum_2_U1_1_accum_out_d0;
wire    ap_channel_done_accum2_out_1;
wire    tdf1_accum_2_U1_1_accum_out_full_n;
wire    tdf1_accum_2_U2_2_ap_start;
wire    tdf1_accum_2_U2_2_ap_done;
wire    tdf1_accum_2_U2_2_ap_continue;
wire    tdf1_accum_2_U2_2_ap_idle;
wire    tdf1_accum_2_U2_2_ap_ready;
wire   [3:0] tdf1_accum_2_U2_2_accum_in_address0;
wire    tdf1_accum_2_U2_2_accum_in_ce0;
wire   [3:0] tdf1_accum_2_U2_2_accum_in_address1;
wire    tdf1_accum_2_U2_2_accum_in_ce1;
wire   [2:0] tdf1_accum_2_U2_2_accum_out_address0;
wire    tdf1_accum_2_U2_2_accum_out_ce0;
wire    tdf1_accum_2_U2_2_accum_out_we0;
wire   [15:0] tdf1_accum_2_U2_2_accum_out_d0;
wire    ap_channel_done_accum2_out_2;
wire    tdf1_accum_2_U2_2_accum_out_full_n;
wire    tdf1_accum_2_U3_3_ap_start;
wire    tdf1_accum_2_U3_3_ap_done;
wire    tdf1_accum_2_U3_3_ap_continue;
wire    tdf1_accum_2_U3_3_ap_idle;
wire    tdf1_accum_2_U3_3_ap_ready;
wire   [3:0] tdf1_accum_2_U3_3_accum_in_address0;
wire    tdf1_accum_2_U3_3_accum_in_ce0;
wire   [3:0] tdf1_accum_2_U3_3_accum_in_address1;
wire    tdf1_accum_2_U3_3_accum_in_ce1;
wire   [2:0] tdf1_accum_2_U3_3_accum_out_address0;
wire    tdf1_accum_2_U3_3_accum_out_ce0;
wire    tdf1_accum_2_U3_3_accum_out_we0;
wire   [15:0] tdf1_accum_2_U3_3_accum_out_d0;
wire    ap_channel_done_accum2_out_3;
wire    tdf1_accum_2_U3_3_accum_out_full_n;
wire    tdf1_accum_3_U0_ap_start;
wire    tdf1_accum_3_U0_ap_done;
wire    tdf1_accum_3_U0_ap_continue;
wire    tdf1_accum_3_U0_ap_idle;
wire    tdf1_accum_3_U0_ap_ready;
wire   [2:0] tdf1_accum_3_U0_accum_in_address0;
wire    tdf1_accum_3_U0_accum_in_ce0;
wire   [2:0] tdf1_accum_3_U0_accum_in_address1;
wire    tdf1_accum_3_U0_accum_in_ce1;
wire   [15:0] tdf1_accum_3_U0_ap_return_0;
wire   [15:0] tdf1_accum_3_U0_ap_return_1;
wire   [15:0] tdf1_accum_3_U0_ap_return_2;
wire   [15:0] tdf1_accum_3_U0_ap_return_3;
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
wire    tdf1_accum_3_1_U0_ap_start;
wire    tdf1_accum_3_1_U0_ap_done;
wire    tdf1_accum_3_1_U0_ap_continue;
wire    tdf1_accum_3_1_U0_ap_idle;
wire    tdf1_accum_3_1_U0_ap_ready;
wire   [2:0] tdf1_accum_3_1_U0_accum_in_address0;
wire    tdf1_accum_3_1_U0_accum_in_ce0;
wire   [2:0] tdf1_accum_3_1_U0_accum_in_address1;
wire    tdf1_accum_3_1_U0_accum_in_ce1;
wire   [15:0] tdf1_accum_3_1_U0_ap_return_0;
wire   [15:0] tdf1_accum_3_1_U0_ap_return_1;
wire   [15:0] tdf1_accum_3_1_U0_ap_return_2;
wire   [15:0] tdf1_accum_3_1_U0_ap_return_3;
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
wire    tdf1_accum_3_2_U0_ap_start;
wire    tdf1_accum_3_2_U0_ap_done;
wire    tdf1_accum_3_2_U0_ap_continue;
wire    tdf1_accum_3_2_U0_ap_idle;
wire    tdf1_accum_3_2_U0_ap_ready;
wire   [2:0] tdf1_accum_3_2_U0_accum_in_address0;
wire    tdf1_accum_3_2_U0_accum_in_ce0;
wire   [2:0] tdf1_accum_3_2_U0_accum_in_address1;
wire    tdf1_accum_3_2_U0_accum_in_ce1;
wire   [15:0] tdf1_accum_3_2_U0_ap_return_0;
wire   [15:0] tdf1_accum_3_2_U0_ap_return_1;
wire   [15:0] tdf1_accum_3_2_U0_ap_return_2;
wire   [15:0] tdf1_accum_3_2_U0_ap_return_3;
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
wire    tdf1_accum_3_3_U0_ap_start;
wire    tdf1_accum_3_3_U0_ap_done;
wire    tdf1_accum_3_3_U0_ap_continue;
wire    tdf1_accum_3_3_U0_ap_idle;
wire    tdf1_accum_3_3_U0_ap_ready;
wire   [2:0] tdf1_accum_3_3_U0_accum_in_address0;
wire    tdf1_accum_3_3_U0_accum_in_ce0;
wire   [2:0] tdf1_accum_3_3_U0_accum_in_address1;
wire    tdf1_accum_3_3_U0_accum_in_ce1;
wire   [15:0] tdf1_accum_3_3_U0_ap_return_0;
wire   [15:0] tdf1_accum_3_3_U0_ap_return_1;
wire   [15:0] tdf1_accum_3_3_U0_ap_return_2;
wire   [15:0] tdf1_accum_3_3_U0_ap_return_3;
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
wire    tdf1_accum_4_U0_ap_start;
wire    tdf1_accum_4_U0_ap_done;
wire    tdf1_accum_4_U0_ap_continue;
wire    tdf1_accum_4_U0_ap_idle;
wire    tdf1_accum_4_U0_ap_ready;
wire   [15:0] tdf1_accum_4_U0_accum_in_0;
wire    tdf1_accum_4_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc_U0_ap_start;
wire    Block_entry_proc_proc_U0_ap_done;
wire    Block_entry_proc_proc_U0_ap_continue;
wire    Block_entry_proc_proc_U0_ap_idle;
wire    Block_entry_proc_proc_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf1_accum_4_1_U0_ap_start;
wire    tdf1_accum_4_1_U0_ap_done;
wire    tdf1_accum_4_1_U0_ap_continue;
wire    tdf1_accum_4_1_U0_ap_idle;
wire    tdf1_accum_4_1_U0_ap_ready;
wire   [15:0] tdf1_accum_4_1_U0_accum_in_0;
wire    tdf1_accum_4_1_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_434_channel;
wire    tmp_434_channel_full_n;
wire    Block_entry_proc_proc491_U0_ap_start;
wire    Block_entry_proc_proc491_U0_ap_done;
wire    Block_entry_proc_proc491_U0_ap_continue;
wire    Block_entry_proc_proc491_U0_ap_idle;
wire    Block_entry_proc_proc491_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc491_U0_ap_return;
wire    ap_channel_done_sums_1;
wire    sums_1_full_n;
wire    tdf1_accum_4_2_U0_ap_start;
wire    tdf1_accum_4_2_U0_ap_done;
wire    tdf1_accum_4_2_U0_ap_continue;
wire    tdf1_accum_4_2_U0_ap_idle;
wire    tdf1_accum_4_2_U0_ap_ready;
wire   [15:0] tdf1_accum_4_2_U0_accum_in_0;
wire    tdf1_accum_4_2_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_435_channel;
wire    tmp_435_channel_full_n;
wire    Block_entry_proc_proc492_U0_ap_start;
wire    Block_entry_proc_proc492_U0_ap_done;
wire    Block_entry_proc_proc492_U0_ap_continue;
wire    Block_entry_proc_proc492_U0_ap_idle;
wire    Block_entry_proc_proc492_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc492_U0_ap_return;
wire    ap_channel_done_sums_2;
wire    sums_2_full_n;
wire    tdf1_accum_4_3_U0_ap_start;
wire    tdf1_accum_4_3_U0_ap_done;
wire    tdf1_accum_4_3_U0_ap_continue;
wire    tdf1_accum_4_3_U0_ap_idle;
wire    tdf1_accum_4_3_U0_ap_ready;
wire   [15:0] tdf1_accum_4_3_U0_accum_in_0;
wire    tdf1_accum_4_3_U0_accum_in_0_ap_vld;
wire    ap_channel_done_tmp_436_channel;
wire    tmp_436_channel_full_n;
wire    Block_entry_proc_proc493_U0_ap_start;
wire    Block_entry_proc_proc493_U0_ap_done;
wire    Block_entry_proc_proc493_U0_ap_continue;
wire    Block_entry_proc_proc493_U0_ap_idle;
wire    Block_entry_proc_proc493_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc493_U0_ap_return;
wire    ap_channel_done_sums_3;
wire    sums_3_full_n;
wire    tdf1_adjust_U0_ap_start;
wire    tdf1_adjust_U0_ap_done;
wire    tdf1_adjust_U0_ap_continue;
wire    tdf1_adjust_U0_ap_idle;
wire    tdf1_adjust_U0_ap_ready;
wire   [3:0] tdf1_adjust_U0_adjustments_address0;
wire    tdf1_adjust_U0_adjustments_ce0;
wire    tdf1_adjust_U0_input_indices_23_read;
wire   [3:0] tdf1_adjust_U0_input_indices_23_out_din;
wire    tdf1_adjust_U0_input_indices_23_out_write;
wire   [15:0] tdf1_adjust_U0_ap_return_0;
wire   [15:0] tdf1_adjust_U0_ap_return_1;
wire   [15:0] tdf1_adjust_U0_ap_return_2;
wire   [15:0] tdf1_adjust_U0_ap_return_3;
wire    ap_channel_done_outputs_3;
wire    outputs_3_full_n;
reg    ap_sync_reg_channel_write_outputs_3;
wire    ap_sync_channel_write_outputs_3;
wire    ap_channel_done_outputs_2;
wire    outputs_2_full_n;
reg    ap_sync_reg_channel_write_outputs_2;
wire    ap_sync_channel_write_outputs_2;
wire    ap_channel_done_outputs_1;
wire    outputs_1_full_n;
reg    ap_sync_reg_channel_write_outputs_1;
wire    ap_sync_channel_write_outputs_1;
wire    ap_channel_done_outputs_0;
wire    outputs_0_full_n;
reg    ap_sync_reg_channel_write_outputs_0;
wire    ap_sync_channel_write_outputs_0;
wire    tdf1_poolOutputs_U0_ap_start;
wire    tdf1_poolOutputs_U0_ap_done;
wire    tdf1_poolOutputs_U0_ap_continue;
wire    tdf1_poolOutputs_U0_ap_idle;
wire    tdf1_poolOutputs_U0_ap_ready;
wire    tdf1_poolOutputs_U0_output_indices_04_read;
wire    tdf1_poolOutputs_U0_output_indices_15_read;
wire    tdf1_poolOutputs_U0_input_indices_23_read;
wire    tdf1_poolOutputs_U0_resetMaximum6_read;
wire    tdf1_poolOutputs_U0_storeOutput7_read;
wire   [15:0] tdf1_poolOutputs_U0_out_data_address1;
wire    tdf1_poolOutputs_U0_out_data_ce1;
wire    tdf1_poolOutputs_U0_out_data_we1;
wire   [63:0] tdf1_poolOutputs_U0_out_data_d1;
wire    tdf1_poolOutputs_U0_out_data_full_n;
wire    tdf1_poolOutputs_U0_out_data_write;
wire    ap_sync_continue;
wire    ifmap_vec_i_full_n;
wire    ifmap_vec_t_empty_n;
wire    weight_vecs_0_i_full_n;
wire    weight_vecs_0_t_empty_n;
wire    weight_vecs_1_i_full_n;
wire    weight_vecs_1_t_empty_n;
wire    weight_vecs_2_i_full_n;
wire    weight_vecs_2_t_empty_n;
wire    weight_vecs_3_i_full_n;
wire    weight_vecs_3_t_empty_n;
wire    products_0_i_full_n;
wire    products_0_t_empty_n;
wire   [15:0] products_0_t_d1;
wire    products_0_t_we1;
wire    products_1_i_full_n;
wire    products_1_t_empty_n;
wire   [15:0] products_1_t_d1;
wire    products_1_t_we1;
wire    products_2_i_full_n;
wire    products_2_t_empty_n;
wire   [15:0] products_2_t_d1;
wire    products_2_t_we1;
wire    products_3_i_full_n;
wire    products_3_t_empty_n;
wire   [15:0] products_3_t_d1;
wire    products_3_t_we1;
wire    accum1_out_0_i_full_n;
wire    accum1_out_0_t_empty_n;
wire   [15:0] accum1_out_0_t_d1;
wire    accum1_out_0_t_we1;
wire    accum1_out_1_i_full_n;
wire    accum1_out_1_t_empty_n;
wire   [15:0] accum1_out_1_t_d1;
wire    accum1_out_1_t_we1;
wire    accum1_out_2_i_full_n;
wire    accum1_out_2_t_empty_n;
wire   [15:0] accum1_out_2_t_d1;
wire    accum1_out_2_t_we1;
wire    accum1_out_3_i_full_n;
wire    accum1_out_3_t_empty_n;
wire   [15:0] accum1_out_3_t_d1;
wire    accum1_out_3_t_we1;
wire    accum2_out_0_i_full_n;
wire    accum2_out_0_t_empty_n;
wire   [15:0] accum2_out_0_t_d1;
wire    accum2_out_0_t_we1;
wire    accum2_out_1_i_full_n;
wire    accum2_out_1_t_empty_n;
wire   [15:0] accum2_out_1_t_d1;
wire    accum2_out_1_t_we1;
wire    accum2_out_2_i_full_n;
wire    accum2_out_2_t_empty_n;
wire   [15:0] accum2_out_2_t_d1;
wire    accum2_out_2_t_we1;
wire    accum2_out_3_i_full_n;
wire    accum2_out_3_t_empty_n;
wire   [15:0] accum2_out_3_t_d1;
wire    accum2_out_3_t_we1;
wire    input_indices_23_c_full_n;
wire   [1:0] input_indices_23_c_dout;
wire    input_indices_23_c_empty_n;
wire    input_indices_23_c1_full_n;
wire   [3:0] input_indices_23_c1_dout;
wire    input_indices_23_c1_empty_n;
wire    output_indices_04_c_full_n;
wire   [6:0] output_indices_04_c_dout;
wire    output_indices_04_c_empty_n;
wire    output_indices_15_c_full_n;
wire   [13:0] output_indices_15_c_dout;
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
wire   [15:0] tmp_434_channel_dout;
wire    tmp_434_channel_empty_n;
wire   [15:0] sums_1_dout;
wire    sums_1_empty_n;
wire   [15:0] tmp_435_channel_dout;
wire    tmp_435_channel_empty_n;
wire   [15:0] sums_2_dout;
wire    sums_2_empty_n;
wire   [15:0] tmp_436_channel_dout;
wire    tmp_436_channel_empty_n;
wire   [15:0] sums_3_dout;
wire    sums_3_empty_n;
wire    input_indices_23_c2_full_n;
wire   [3:0] input_indices_23_c2_dout;
wire    input_indices_23_c2_empty_n;
wire   [15:0] outputs_0_dout;
wire    outputs_0_empty_n;
wire   [15:0] outputs_1_dout;
wire    outputs_1_empty_n;
wire   [15:0] outputs_2_dout;
wire    outputs_2_empty_n;
wire   [15:0] outputs_3_dout;
wire    outputs_3_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready;
wire    ap_sync_tdf1_get_next_ijk_U0_ap_ready;
reg    ap_sync_reg_tdf1_readInputs19_U0_ap_ready;
wire    ap_sync_tdf1_readInputs19_U0_ap_ready;
wire   [0:0] start_for_tdf1_readFilters18_U0_din;
wire    start_for_tdf1_readFilters18_U0_full_n;
wire   [0:0] start_for_tdf1_readFilters18_U0_dout;
wire    start_for_tdf1_readFilters18_U0_empty_n;
wire    tdf1_readInputs19_U0_start_full_n;
wire    tdf1_readInputs19_U0_start_write;
wire    tdf1_readFilters18_U0_start_full_n;
wire    tdf1_readFilters18_U0_start_write;
wire    tdf1_dot_product_U0_start_full_n;
wire    tdf1_dot_product_U0_start_write;
wire    tdf1_accum_1_U0_start_full_n;
wire    tdf1_accum_1_U0_start_write;
wire    tdf1_accum_1_U1_1_start_full_n;
wire    tdf1_accum_1_U1_1_start_write;
wire    tdf1_accum_1_U2_2_start_full_n;
wire    tdf1_accum_1_U2_2_start_write;
wire    tdf1_accum_1_U3_3_start_full_n;
wire    tdf1_accum_1_U3_3_start_write;
wire    tdf1_accum_2_U0_start_full_n;
wire    tdf1_accum_2_U0_start_write;
wire    tdf1_accum_2_U1_1_start_full_n;
wire    tdf1_accum_2_U1_1_start_write;
wire    tdf1_accum_2_U2_2_start_full_n;
wire    tdf1_accum_2_U2_2_start_write;
wire    tdf1_accum_2_U3_3_start_full_n;
wire    tdf1_accum_2_U3_3_start_write;
wire    tdf1_accum_3_U0_start_full_n;
wire    tdf1_accum_3_U0_start_write;
wire    tdf1_accum_3_1_U0_start_full_n;
wire    tdf1_accum_3_1_U0_start_write;
wire    tdf1_accum_3_2_U0_start_full_n;
wire    tdf1_accum_3_2_U0_start_write;
wire    tdf1_accum_3_3_U0_start_full_n;
wire    tdf1_accum_3_3_U0_start_write;
wire    tdf1_accum_4_U0_start_full_n;
wire    tdf1_accum_4_U0_start_write;
wire    Block_entry_proc_proc_U0_start_full_n;
wire    Block_entry_proc_proc_U0_start_write;
wire    tdf1_accum_4_1_U0_start_full_n;
wire    tdf1_accum_4_1_U0_start_write;
wire    Block_entry_proc_proc491_U0_start_full_n;
wire    Block_entry_proc_proc491_U0_start_write;
wire    tdf1_accum_4_2_U0_start_full_n;
wire    tdf1_accum_4_2_U0_start_write;
wire    Block_entry_proc_proc492_U0_start_full_n;
wire    Block_entry_proc_proc492_U0_start_write;
wire    tdf1_accum_4_3_U0_start_full_n;
wire    tdf1_accum_4_3_U0_start_write;
wire    Block_entry_proc_proc493_U0_start_full_n;
wire    Block_entry_proc_proc493_U0_start_write;
wire    tdf1_adjust_U0_start_full_n;
wire    tdf1_adjust_U0_start_write;
wire    tdf1_poolOutputs_U0_start_full_n;
wire    tdf1_poolOutputs_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_input_indices_1 = 1'b0;
#0 ap_sync_reg_channel_write_input_indices_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_3 = 1'b0;
#0 ap_sync_reg_channel_write_products_2 = 1'b0;
#0 ap_sync_reg_channel_write_products_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_0 = 1'b0;
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
#0 ap_sync_reg_channel_write_outputs_3 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_2 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_1 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_0 = 1'b0;
#0 ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf1_readInputs19_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
ifmap_vec_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_readInputs19_U0_ap_done),
    .i_full_n(ifmap_vec_i_full_n),
    .i_ce0(tdf1_readInputs19_U0_ifmap_vec_ce0),
    .i_we0(tdf1_readInputs19_U0_ifmap_vec_we0),
    .i_address0(tdf1_readInputs19_U0_ifmap_vec_address0),
    .i_d0(tdf1_readInputs19_U0_ifmap_vec_d0),
    .i_q0(ifmap_vec_i_q0),
    .t_ce(1'b1),
    .t_read(tdf1_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_t_empty_n),
    .t_ce0(tdf1_dot_product_U0_ifmap_vec_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_dot_product_U0_ifmap_vec_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
weight_vecs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0),
    .i_full_n(weight_vecs_0_i_full_n),
    .i_ce0(tdf1_readFilters18_U0_weight_vecs_0_ce0),
    .i_we0(tdf1_readFilters18_U0_weight_vecs_0_we0),
    .i_address0(tdf1_readFilters18_U0_weight_vecs_0_address0),
    .i_d0(tdf1_readFilters18_U0_weight_vecs_0_d0),
    .i_q0(weight_vecs_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf1_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_t_empty_n),
    .t_ce0(tdf1_dot_product_U0_weight_vecs_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_dot_product_U0_weight_vecs_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
weight_vecs_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1),
    .i_full_n(weight_vecs_1_i_full_n),
    .i_ce0(tdf1_readFilters18_U0_weight_vecs_1_ce0),
    .i_we0(tdf1_readFilters18_U0_weight_vecs_1_we0),
    .i_address0(tdf1_readFilters18_U0_weight_vecs_1_address0),
    .i_d0(tdf1_readFilters18_U0_weight_vecs_1_d0),
    .i_q0(weight_vecs_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf1_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_t_empty_n),
    .t_ce0(tdf1_dot_product_U0_weight_vecs_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_dot_product_U0_weight_vecs_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
weight_vecs_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2),
    .i_full_n(weight_vecs_2_i_full_n),
    .i_ce0(tdf1_readFilters18_U0_weight_vecs_2_ce0),
    .i_we0(tdf1_readFilters18_U0_weight_vecs_2_we0),
    .i_address0(tdf1_readFilters18_U0_weight_vecs_2_address0),
    .i_d0(tdf1_readFilters18_U0_weight_vecs_2_d0),
    .i_q0(weight_vecs_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf1_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_t_empty_n),
    .t_ce0(tdf1_dot_product_U0_weight_vecs_2_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_dot_product_U0_weight_vecs_2_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
weight_vecs_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3),
    .i_full_n(weight_vecs_3_i_full_n),
    .i_ce0(tdf1_readFilters18_U0_weight_vecs_3_ce0),
    .i_we0(tdf1_readFilters18_U0_weight_vecs_3_we0),
    .i_address0(tdf1_readFilters18_U0_weight_vecs_3_address0),
    .i_d0(tdf1_readFilters18_U0_weight_vecs_3_d0),
    .i_q0(weight_vecs_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf1_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_t_empty_n),
    .t_ce0(tdf1_dot_product_U0_weight_vecs_3_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_dot_product_U0_weight_vecs_3_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
products_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0),
    .i_full_n(products_0_i_full_n),
    .i_ce0(tdf1_dot_product_U0_products_0_ce0),
    .i_we0(tdf1_dot_product_U0_products_0_we0),
    .i_address0(tdf1_dot_product_U0_products_0_address0),
    .i_d0(tdf1_dot_product_U0_products_0_d0),
    .i_q0(products_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(5'd0),
    .i_q1(products_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_1_U0_ap_ready),
    .t_empty_n(products_0_t_empty_n),
    .t_ce0(tdf1_accum_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_0_t_q0),
    .t_ce1(tdf1_accum_1_U0_accum_in_ce1),
    .t_address1(tdf1_accum_1_U0_accum_in_address1),
    .t_q1(products_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
products_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1),
    .i_full_n(products_1_i_full_n),
    .i_ce0(tdf1_dot_product_U0_products_1_ce0),
    .i_we0(tdf1_dot_product_U0_products_1_we0),
    .i_address0(tdf1_dot_product_U0_products_1_address0),
    .i_d0(tdf1_dot_product_U0_products_1_d0),
    .i_q0(products_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(5'd0),
    .i_q1(products_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_t_empty_n),
    .t_ce0(tdf1_accum_1_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_1_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_1_t_q0),
    .t_ce1(tdf1_accum_1_U1_1_accum_in_ce1),
    .t_address1(tdf1_accum_1_U1_1_accum_in_address1),
    .t_q1(products_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
products_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2),
    .i_full_n(products_2_i_full_n),
    .i_ce0(tdf1_dot_product_U0_products_2_ce0),
    .i_we0(tdf1_dot_product_U0_products_2_we0),
    .i_address0(tdf1_dot_product_U0_products_2_address0),
    .i_d0(tdf1_dot_product_U0_products_2_d0),
    .i_q0(products_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(5'd0),
    .i_q1(products_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_t_empty_n),
    .t_ce0(tdf1_accum_1_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_1_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_2_t_q0),
    .t_ce1(tdf1_accum_1_U2_2_accum_in_ce1),
    .t_address1(tdf1_accum_1_U2_2_accum_in_address1),
    .t_q1(products_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0 #(
    .DataWidth( 16 ),
    .AddressRange( 27 ),
    .AddressWidth( 5 ))
products_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3),
    .i_full_n(products_3_i_full_n),
    .i_ce0(tdf1_dot_product_U0_products_3_ce0),
    .i_we0(tdf1_dot_product_U0_products_3_we0),
    .i_address0(tdf1_dot_product_U0_products_3_address0),
    .i_d0(tdf1_dot_product_U0_products_3_d0),
    .i_q0(products_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(5'd0),
    .i_q1(products_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_t_empty_n),
    .t_ce0(tdf1_accum_1_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_1_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_3_t_q0),
    .t_ce1(tdf1_accum_1_U3_3_accum_in_ce1),
    .t_address1(tdf1_accum_1_U3_3_accum_in_address1),
    .t_q1(products_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 14 ),
    .AddressWidth( 4 ))
accum1_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_1_U0_ap_done),
    .i_full_n(accum1_out_0_i_full_n),
    .i_ce0(tdf1_accum_1_U0_accum_out_ce0),
    .i_we0(tdf1_accum_1_U0_accum_out_we0),
    .i_address0(tdf1_accum_1_U0_accum_out_address0),
    .i_d0(tdf1_accum_1_U0_accum_out_d0),
    .i_q0(accum1_out_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(accum1_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf1_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(tdf1_accum_2_U0_accum_in_ce1),
    .t_address1(tdf1_accum_2_U0_accum_in_address1),
    .t_q1(accum1_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 14 ),
    .AddressWidth( 4 ))
accum1_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_1_U1_1_ap_done),
    .i_full_n(accum1_out_1_i_full_n),
    .i_ce0(tdf1_accum_1_U1_1_accum_out_ce0),
    .i_we0(tdf1_accum_1_U1_1_accum_out_we0),
    .i_address0(tdf1_accum_1_U1_1_accum_out_address0),
    .i_d0(tdf1_accum_1_U1_1_accum_out_d0),
    .i_q0(accum1_out_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(accum1_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_2_U1_1_ap_ready),
    .t_empty_n(accum1_out_1_t_empty_n),
    .t_ce0(tdf1_accum_2_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_2_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_1_t_q0),
    .t_ce1(tdf1_accum_2_U1_1_accum_in_ce1),
    .t_address1(tdf1_accum_2_U1_1_accum_in_address1),
    .t_q1(accum1_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 14 ),
    .AddressWidth( 4 ))
accum1_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_1_U2_2_ap_done),
    .i_full_n(accum1_out_2_i_full_n),
    .i_ce0(tdf1_accum_1_U2_2_accum_out_ce0),
    .i_we0(tdf1_accum_1_U2_2_accum_out_we0),
    .i_address0(tdf1_accum_1_U2_2_accum_out_address0),
    .i_d0(tdf1_accum_1_U2_2_accum_out_d0),
    .i_q0(accum1_out_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(accum1_out_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_2_U2_2_ap_ready),
    .t_empty_n(accum1_out_2_t_empty_n),
    .t_ce0(tdf1_accum_2_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_2_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_2_t_q0),
    .t_ce1(tdf1_accum_2_U2_2_accum_in_ce1),
    .t_address1(tdf1_accum_2_U2_2_accum_in_address1),
    .t_q1(accum1_out_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 14 ),
    .AddressWidth( 4 ))
accum1_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_1_U3_3_ap_done),
    .i_full_n(accum1_out_3_i_full_n),
    .i_ce0(tdf1_accum_1_U3_3_accum_out_ce0),
    .i_we0(tdf1_accum_1_U3_3_accum_out_we0),
    .i_address0(tdf1_accum_1_U3_3_accum_out_address0),
    .i_d0(tdf1_accum_1_U3_3_accum_out_d0),
    .i_q0(accum1_out_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(4'd0),
    .i_q1(accum1_out_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_2_U3_3_ap_ready),
    .t_empty_n(accum1_out_3_t_empty_n),
    .t_ce0(tdf1_accum_2_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_2_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_3_t_q0),
    .t_ce1(tdf1_accum_2_U3_3_accum_in_ce1),
    .t_address1(tdf1_accum_2_U3_3_accum_in_address1),
    .t_q1(accum1_out_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 7 ),
    .AddressWidth( 3 ))
accum2_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_2_U0_ap_done),
    .i_full_n(accum2_out_0_i_full_n),
    .i_ce0(tdf1_accum_2_U0_accum_out_ce0),
    .i_we0(tdf1_accum_2_U0_accum_out_we0),
    .i_address0(tdf1_accum_2_U0_accum_out_address0),
    .i_d0(tdf1_accum_2_U0_accum_out_d0),
    .i_q0(accum2_out_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(3'd0),
    .i_q1(accum2_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_3_U0_ap_ready),
    .t_empty_n(accum2_out_0_t_empty_n),
    .t_ce0(tdf1_accum_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_0_t_q0),
    .t_ce1(tdf1_accum_3_U0_accum_in_ce1),
    .t_address1(tdf1_accum_3_U0_accum_in_address1),
    .t_q1(accum2_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 7 ),
    .AddressWidth( 3 ))
accum2_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_2_U1_1_ap_done),
    .i_full_n(accum2_out_1_i_full_n),
    .i_ce0(tdf1_accum_2_U1_1_accum_out_ce0),
    .i_we0(tdf1_accum_2_U1_1_accum_out_we0),
    .i_address0(tdf1_accum_2_U1_1_accum_out_address0),
    .i_d0(tdf1_accum_2_U1_1_accum_out_d0),
    .i_q0(accum2_out_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(3'd0),
    .i_q1(accum2_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_3_1_U0_ap_ready),
    .t_empty_n(accum2_out_1_t_empty_n),
    .t_ce0(tdf1_accum_3_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_3_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_1_t_q0),
    .t_ce1(tdf1_accum_3_1_U0_accum_in_ce1),
    .t_address1(tdf1_accum_3_1_U0_accum_in_address1),
    .t_q1(accum2_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 7 ),
    .AddressWidth( 3 ))
accum2_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_2_U2_2_ap_done),
    .i_full_n(accum2_out_2_i_full_n),
    .i_ce0(tdf1_accum_2_U2_2_accum_out_ce0),
    .i_we0(tdf1_accum_2_U2_2_accum_out_we0),
    .i_address0(tdf1_accum_2_U2_2_accum_out_address0),
    .i_d0(tdf1_accum_2_U2_2_accum_out_d0),
    .i_q0(accum2_out_2_i_q0),
    .i_ce1(1'b0),
    .i_address1(3'd0),
    .i_q1(accum2_out_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_3_2_U0_ap_ready),
    .t_empty_n(accum2_out_2_t_empty_n),
    .t_ce0(tdf1_accum_3_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_3_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_2_t_q0),
    .t_ce1(tdf1_accum_3_2_U0_accum_in_ce1),
    .t_address1(tdf1_accum_3_2_U0_accum_in_address1),
    .t_q1(accum2_out_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 7 ),
    .AddressWidth( 3 ))
accum2_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf1_accum_2_U3_3_ap_done),
    .i_full_n(accum2_out_3_i_full_n),
    .i_ce0(tdf1_accum_2_U3_3_accum_out_ce0),
    .i_we0(tdf1_accum_2_U3_3_accum_out_we0),
    .i_address0(tdf1_accum_2_U3_3_accum_out_address0),
    .i_d0(tdf1_accum_2_U3_3_accum_out_d0),
    .i_q0(accum2_out_3_i_q0),
    .i_ce1(1'b0),
    .i_address1(3'd0),
    .i_q1(accum2_out_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf1_accum_3_3_U0_ap_ready),
    .t_empty_n(accum2_out_3_t_empty_n),
    .t_ce0(tdf1_accum_3_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf1_accum_3_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_3_t_q0),
    .t_ce1(tdf1_accum_3_3_U0_accum_in_ce1),
    .t_address1(tdf1_accum_3_3_U0_accum_in_address1),
    .t_q1(accum2_out_3_t_q1)
);

td_fused_top_tdf1_get_next_ijk tdf1_get_next_ijk_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_get_next_ijk_U0_ap_start),
    .start_full_n(start_for_tdf1_readFilters18_U0_full_n),
    .ap_done(tdf1_get_next_ijk_U0_ap_done),
    .ap_continue(tdf1_get_next_ijk_U0_ap_continue),
    .ap_idle(tdf1_get_next_ijk_U0_ap_idle),
    .ap_ready(tdf1_get_next_ijk_U0_ap_ready),
    .start_out(tdf1_get_next_ijk_U0_start_out),
    .start_write(tdf1_get_next_ijk_U0_start_write),
    .input_indices_2_out_din(tdf1_get_next_ijk_U0_input_indices_2_out_din),
    .input_indices_2_out_full_n(input_indices_23_c_full_n),
    .input_indices_2_out_write(tdf1_get_next_ijk_U0_input_indices_2_out_write),
    .input_indices_2_out1_din(tdf1_get_next_ijk_U0_input_indices_2_out1_din),
    .input_indices_2_out1_full_n(input_indices_23_c1_full_n),
    .input_indices_2_out1_write(tdf1_get_next_ijk_U0_input_indices_2_out1_write),
    .output_indices_0_din(tdf1_get_next_ijk_U0_output_indices_0_din),
    .output_indices_0_full_n(output_indices_04_c_full_n),
    .output_indices_0_write(tdf1_get_next_ijk_U0_output_indices_0_write),
    .output_indices_1_din(tdf1_get_next_ijk_U0_output_indices_1_din),
    .output_indices_1_full_n(output_indices_15_c_full_n),
    .output_indices_1_write(tdf1_get_next_ijk_U0_output_indices_1_write),
    .resetMaximum_din(tdf1_get_next_ijk_U0_resetMaximum_din),
    .resetMaximum_full_n(resetMaximum6_c_full_n),
    .resetMaximum_write(tdf1_get_next_ijk_U0_resetMaximum_write),
    .storeOutput_din(tdf1_get_next_ijk_U0_storeOutput_din),
    .storeOutput_full_n(storeOutput7_c_full_n),
    .storeOutput_write(tdf1_get_next_ijk_U0_storeOutput_write),
    .ap_return_0(tdf1_get_next_ijk_U0_ap_return_0),
    .ap_return_1(tdf1_get_next_ijk_U0_ap_return_1)
);

td_fused_top_tdf1_readInputs19 tdf1_readInputs19_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_readInputs19_U0_ap_start),
    .ap_done(tdf1_readInputs19_U0_ap_done),
    .ap_continue(tdf1_readInputs19_U0_ap_continue),
    .ap_idle(tdf1_readInputs19_U0_ap_idle),
    .ap_ready(tdf1_readInputs19_U0_ap_ready),
    .in_data_address0(tdf1_readInputs19_U0_in_data_address0),
    .in_data_ce0(tdf1_readInputs19_U0_in_data_ce0),
    .in_data_q0(in_data_q0),
    .i_19(input_indices_0_dout),
    .j_19(input_indices_1_dout),
    .ifmap_vec_address0(tdf1_readInputs19_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf1_readInputs19_U0_ifmap_vec_ce0),
    .ifmap_vec_we0(tdf1_readInputs19_U0_ifmap_vec_we0),
    .ifmap_vec_d0(tdf1_readInputs19_U0_ifmap_vec_d0)
);

td_fused_top_tdf1_readFilters18 tdf1_readFilters18_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_readFilters18_U0_ap_start),
    .ap_done(tdf1_readFilters18_U0_ap_done),
    .ap_continue(tdf1_readFilters18_U0_ap_continue),
    .ap_idle(tdf1_readFilters18_U0_ap_idle),
    .ap_ready(tdf1_readFilters18_U0_ap_ready),
    .filter_data_0_address0(tdf1_readFilters18_U0_filter_data_0_address0),
    .filter_data_0_ce0(tdf1_readFilters18_U0_filter_data_0_ce0),
    .filter_data_0_q0(filter_data_0_q0),
    .filter_data_1_address0(tdf1_readFilters18_U0_filter_data_1_address0),
    .filter_data_1_ce0(tdf1_readFilters18_U0_filter_data_1_ce0),
    .filter_data_1_q0(filter_data_1_q0),
    .filter_data_2_address0(tdf1_readFilters18_U0_filter_data_2_address0),
    .filter_data_2_ce0(tdf1_readFilters18_U0_filter_data_2_ce0),
    .filter_data_2_q0(filter_data_2_q0),
    .filter_data_3_address0(tdf1_readFilters18_U0_filter_data_3_address0),
    .filter_data_3_ce0(tdf1_readFilters18_U0_filter_data_3_ce0),
    .filter_data_3_q0(filter_data_3_q0),
    .input_indices_23_dout(input_indices_23_c_dout),
    .input_indices_23_empty_n(input_indices_23_c_empty_n),
    .input_indices_23_read(tdf1_readFilters18_U0_input_indices_23_read),
    .weight_vecs_0_address0(tdf1_readFilters18_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf1_readFilters18_U0_weight_vecs_0_ce0),
    .weight_vecs_0_we0(tdf1_readFilters18_U0_weight_vecs_0_we0),
    .weight_vecs_0_d0(tdf1_readFilters18_U0_weight_vecs_0_d0),
    .weight_vecs_1_address0(tdf1_readFilters18_U0_weight_vecs_1_address0),
    .weight_vecs_1_ce0(tdf1_readFilters18_U0_weight_vecs_1_ce0),
    .weight_vecs_1_we0(tdf1_readFilters18_U0_weight_vecs_1_we0),
    .weight_vecs_1_d0(tdf1_readFilters18_U0_weight_vecs_1_d0),
    .weight_vecs_2_address0(tdf1_readFilters18_U0_weight_vecs_2_address0),
    .weight_vecs_2_ce0(tdf1_readFilters18_U0_weight_vecs_2_ce0),
    .weight_vecs_2_we0(tdf1_readFilters18_U0_weight_vecs_2_we0),
    .weight_vecs_2_d0(tdf1_readFilters18_U0_weight_vecs_2_d0),
    .weight_vecs_3_address0(tdf1_readFilters18_U0_weight_vecs_3_address0),
    .weight_vecs_3_ce0(tdf1_readFilters18_U0_weight_vecs_3_ce0),
    .weight_vecs_3_we0(tdf1_readFilters18_U0_weight_vecs_3_we0),
    .weight_vecs_3_d0(tdf1_readFilters18_U0_weight_vecs_3_d0)
);

td_fused_top_tdf1_dot_product tdf1_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_dot_product_U0_ap_start),
    .ap_done(tdf1_dot_product_U0_ap_done),
    .ap_continue(tdf1_dot_product_U0_ap_continue),
    .ap_idle(tdf1_dot_product_U0_ap_idle),
    .ap_ready(tdf1_dot_product_U0_ap_ready),
    .ifmap_vec_address0(tdf1_dot_product_U0_ifmap_vec_address0),
    .ifmap_vec_ce0(tdf1_dot_product_U0_ifmap_vec_ce0),
    .ifmap_vec_q0(ifmap_vec_t_q0),
    .weight_vecs_0_address0(tdf1_dot_product_U0_weight_vecs_0_address0),
    .weight_vecs_0_ce0(tdf1_dot_product_U0_weight_vecs_0_ce0),
    .weight_vecs_0_q0(weight_vecs_0_t_q0),
    .weight_vecs_1_address0(tdf1_dot_product_U0_weight_vecs_1_address0),
    .weight_vecs_1_ce0(tdf1_dot_product_U0_weight_vecs_1_ce0),
    .weight_vecs_1_q0(weight_vecs_1_t_q0),
    .weight_vecs_2_address0(tdf1_dot_product_U0_weight_vecs_2_address0),
    .weight_vecs_2_ce0(tdf1_dot_product_U0_weight_vecs_2_ce0),
    .weight_vecs_2_q0(weight_vecs_2_t_q0),
    .weight_vecs_3_address0(tdf1_dot_product_U0_weight_vecs_3_address0),
    .weight_vecs_3_ce0(tdf1_dot_product_U0_weight_vecs_3_ce0),
    .weight_vecs_3_q0(weight_vecs_3_t_q0),
    .products_0_address0(tdf1_dot_product_U0_products_0_address0),
    .products_0_ce0(tdf1_dot_product_U0_products_0_ce0),
    .products_0_we0(tdf1_dot_product_U0_products_0_we0),
    .products_0_d0(tdf1_dot_product_U0_products_0_d0),
    .products_1_address0(tdf1_dot_product_U0_products_1_address0),
    .products_1_ce0(tdf1_dot_product_U0_products_1_ce0),
    .products_1_we0(tdf1_dot_product_U0_products_1_we0),
    .products_1_d0(tdf1_dot_product_U0_products_1_d0),
    .products_2_address0(tdf1_dot_product_U0_products_2_address0),
    .products_2_ce0(tdf1_dot_product_U0_products_2_ce0),
    .products_2_we0(tdf1_dot_product_U0_products_2_we0),
    .products_2_d0(tdf1_dot_product_U0_products_2_d0),
    .products_3_address0(tdf1_dot_product_U0_products_3_address0),
    .products_3_ce0(tdf1_dot_product_U0_products_3_ce0),
    .products_3_we0(tdf1_dot_product_U0_products_3_we0),
    .products_3_d0(tdf1_dot_product_U0_products_3_d0)
);

td_fused_top_tdf1_accum_1 tdf1_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_1_U0_ap_start),
    .ap_done(tdf1_accum_1_U0_ap_done),
    .ap_continue(tdf1_accum_1_U0_ap_continue),
    .ap_idle(tdf1_accum_1_U0_ap_idle),
    .ap_ready(tdf1_accum_1_U0_ap_ready),
    .accum_in_address0(tdf1_accum_1_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_1_U0_accum_in_ce0),
    .accum_in_q0(products_0_t_q0),
    .accum_in_address1(tdf1_accum_1_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_1_U0_accum_in_ce1),
    .accum_in_q1(products_0_t_q1),
    .accum_out_address0(tdf1_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf1_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf1_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf1_accum_1_U0_accum_out_d0)
);

td_fused_top_tdf1_accum_1 tdf1_accum_1_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_1_U1_1_ap_start),
    .ap_done(tdf1_accum_1_U1_1_ap_done),
    .ap_continue(tdf1_accum_1_U1_1_ap_continue),
    .ap_idle(tdf1_accum_1_U1_1_ap_idle),
    .ap_ready(tdf1_accum_1_U1_1_ap_ready),
    .accum_in_address0(tdf1_accum_1_U1_1_accum_in_address0),
    .accum_in_ce0(tdf1_accum_1_U1_1_accum_in_ce0),
    .accum_in_q0(products_1_t_q0),
    .accum_in_address1(tdf1_accum_1_U1_1_accum_in_address1),
    .accum_in_ce1(tdf1_accum_1_U1_1_accum_in_ce1),
    .accum_in_q1(products_1_t_q1),
    .accum_out_address0(tdf1_accum_1_U1_1_accum_out_address0),
    .accum_out_ce0(tdf1_accum_1_U1_1_accum_out_ce0),
    .accum_out_we0(tdf1_accum_1_U1_1_accum_out_we0),
    .accum_out_d0(tdf1_accum_1_U1_1_accum_out_d0)
);

td_fused_top_tdf1_accum_1 tdf1_accum_1_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_1_U2_2_ap_start),
    .ap_done(tdf1_accum_1_U2_2_ap_done),
    .ap_continue(tdf1_accum_1_U2_2_ap_continue),
    .ap_idle(tdf1_accum_1_U2_2_ap_idle),
    .ap_ready(tdf1_accum_1_U2_2_ap_ready),
    .accum_in_address0(tdf1_accum_1_U2_2_accum_in_address0),
    .accum_in_ce0(tdf1_accum_1_U2_2_accum_in_ce0),
    .accum_in_q0(products_2_t_q0),
    .accum_in_address1(tdf1_accum_1_U2_2_accum_in_address1),
    .accum_in_ce1(tdf1_accum_1_U2_2_accum_in_ce1),
    .accum_in_q1(products_2_t_q1),
    .accum_out_address0(tdf1_accum_1_U2_2_accum_out_address0),
    .accum_out_ce0(tdf1_accum_1_U2_2_accum_out_ce0),
    .accum_out_we0(tdf1_accum_1_U2_2_accum_out_we0),
    .accum_out_d0(tdf1_accum_1_U2_2_accum_out_d0)
);

td_fused_top_tdf1_accum_1 tdf1_accum_1_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_1_U3_3_ap_start),
    .ap_done(tdf1_accum_1_U3_3_ap_done),
    .ap_continue(tdf1_accum_1_U3_3_ap_continue),
    .ap_idle(tdf1_accum_1_U3_3_ap_idle),
    .ap_ready(tdf1_accum_1_U3_3_ap_ready),
    .accum_in_address0(tdf1_accum_1_U3_3_accum_in_address0),
    .accum_in_ce0(tdf1_accum_1_U3_3_accum_in_ce0),
    .accum_in_q0(products_3_t_q0),
    .accum_in_address1(tdf1_accum_1_U3_3_accum_in_address1),
    .accum_in_ce1(tdf1_accum_1_U3_3_accum_in_ce1),
    .accum_in_q1(products_3_t_q1),
    .accum_out_address0(tdf1_accum_1_U3_3_accum_out_address0),
    .accum_out_ce0(tdf1_accum_1_U3_3_accum_out_ce0),
    .accum_out_we0(tdf1_accum_1_U3_3_accum_out_we0),
    .accum_out_d0(tdf1_accum_1_U3_3_accum_out_d0)
);

td_fused_top_tdf1_accum_2 tdf1_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_2_U0_ap_start),
    .ap_done(tdf1_accum_2_U0_ap_done),
    .ap_continue(tdf1_accum_2_U0_ap_continue),
    .ap_idle(tdf1_accum_2_U0_ap_idle),
    .ap_ready(tdf1_accum_2_U0_ap_ready),
    .accum_in_address0(tdf1_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0),
    .accum_in_address1(tdf1_accum_2_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_2_U0_accum_in_ce1),
    .accum_in_q1(accum1_out_0_t_q1),
    .accum_out_address0(tdf1_accum_2_U0_accum_out_address0),
    .accum_out_ce0(tdf1_accum_2_U0_accum_out_ce0),
    .accum_out_we0(tdf1_accum_2_U0_accum_out_we0),
    .accum_out_d0(tdf1_accum_2_U0_accum_out_d0)
);

td_fused_top_tdf1_accum_2 tdf1_accum_2_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_2_U1_1_ap_start),
    .ap_done(tdf1_accum_2_U1_1_ap_done),
    .ap_continue(tdf1_accum_2_U1_1_ap_continue),
    .ap_idle(tdf1_accum_2_U1_1_ap_idle),
    .ap_ready(tdf1_accum_2_U1_1_ap_ready),
    .accum_in_address0(tdf1_accum_2_U1_1_accum_in_address0),
    .accum_in_ce0(tdf1_accum_2_U1_1_accum_in_ce0),
    .accum_in_q0(accum1_out_1_t_q0),
    .accum_in_address1(tdf1_accum_2_U1_1_accum_in_address1),
    .accum_in_ce1(tdf1_accum_2_U1_1_accum_in_ce1),
    .accum_in_q1(accum1_out_1_t_q1),
    .accum_out_address0(tdf1_accum_2_U1_1_accum_out_address0),
    .accum_out_ce0(tdf1_accum_2_U1_1_accum_out_ce0),
    .accum_out_we0(tdf1_accum_2_U1_1_accum_out_we0),
    .accum_out_d0(tdf1_accum_2_U1_1_accum_out_d0)
);

td_fused_top_tdf1_accum_2 tdf1_accum_2_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_2_U2_2_ap_start),
    .ap_done(tdf1_accum_2_U2_2_ap_done),
    .ap_continue(tdf1_accum_2_U2_2_ap_continue),
    .ap_idle(tdf1_accum_2_U2_2_ap_idle),
    .ap_ready(tdf1_accum_2_U2_2_ap_ready),
    .accum_in_address0(tdf1_accum_2_U2_2_accum_in_address0),
    .accum_in_ce0(tdf1_accum_2_U2_2_accum_in_ce0),
    .accum_in_q0(accum1_out_2_t_q0),
    .accum_in_address1(tdf1_accum_2_U2_2_accum_in_address1),
    .accum_in_ce1(tdf1_accum_2_U2_2_accum_in_ce1),
    .accum_in_q1(accum1_out_2_t_q1),
    .accum_out_address0(tdf1_accum_2_U2_2_accum_out_address0),
    .accum_out_ce0(tdf1_accum_2_U2_2_accum_out_ce0),
    .accum_out_we0(tdf1_accum_2_U2_2_accum_out_we0),
    .accum_out_d0(tdf1_accum_2_U2_2_accum_out_d0)
);

td_fused_top_tdf1_accum_2 tdf1_accum_2_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_2_U3_3_ap_start),
    .ap_done(tdf1_accum_2_U3_3_ap_done),
    .ap_continue(tdf1_accum_2_U3_3_ap_continue),
    .ap_idle(tdf1_accum_2_U3_3_ap_idle),
    .ap_ready(tdf1_accum_2_U3_3_ap_ready),
    .accum_in_address0(tdf1_accum_2_U3_3_accum_in_address0),
    .accum_in_ce0(tdf1_accum_2_U3_3_accum_in_ce0),
    .accum_in_q0(accum1_out_3_t_q0),
    .accum_in_address1(tdf1_accum_2_U3_3_accum_in_address1),
    .accum_in_ce1(tdf1_accum_2_U3_3_accum_in_ce1),
    .accum_in_q1(accum1_out_3_t_q1),
    .accum_out_address0(tdf1_accum_2_U3_3_accum_out_address0),
    .accum_out_ce0(tdf1_accum_2_U3_3_accum_out_ce0),
    .accum_out_we0(tdf1_accum_2_U3_3_accum_out_we0),
    .accum_out_d0(tdf1_accum_2_U3_3_accum_out_d0)
);

td_fused_top_tdf1_accum_3 tdf1_accum_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_3_U0_ap_start),
    .ap_done(tdf1_accum_3_U0_ap_done),
    .ap_continue(tdf1_accum_3_U0_ap_continue),
    .ap_idle(tdf1_accum_3_U0_ap_idle),
    .ap_ready(tdf1_accum_3_U0_ap_ready),
    .accum_in_address0(tdf1_accum_3_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_0_t_q0),
    .accum_in_address1(tdf1_accum_3_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_3_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_0_t_q1),
    .ap_return_0(tdf1_accum_3_U0_ap_return_0),
    .ap_return_1(tdf1_accum_3_U0_ap_return_1),
    .ap_return_2(tdf1_accum_3_U0_ap_return_2),
    .ap_return_3(tdf1_accum_3_U0_ap_return_3)
);

td_fused_top_tdf1_accum_3_1 tdf1_accum_3_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_3_1_U0_ap_start),
    .ap_done(tdf1_accum_3_1_U0_ap_done),
    .ap_continue(tdf1_accum_3_1_U0_ap_continue),
    .ap_idle(tdf1_accum_3_1_U0_ap_idle),
    .ap_ready(tdf1_accum_3_1_U0_ap_ready),
    .accum_in_address0(tdf1_accum_3_1_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_3_1_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_1_t_q0),
    .accum_in_address1(tdf1_accum_3_1_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_3_1_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_1_t_q1),
    .ap_return_0(tdf1_accum_3_1_U0_ap_return_0),
    .ap_return_1(tdf1_accum_3_1_U0_ap_return_1),
    .ap_return_2(tdf1_accum_3_1_U0_ap_return_2),
    .ap_return_3(tdf1_accum_3_1_U0_ap_return_3)
);

td_fused_top_tdf1_accum_3_2 tdf1_accum_3_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_3_2_U0_ap_start),
    .ap_done(tdf1_accum_3_2_U0_ap_done),
    .ap_continue(tdf1_accum_3_2_U0_ap_continue),
    .ap_idle(tdf1_accum_3_2_U0_ap_idle),
    .ap_ready(tdf1_accum_3_2_U0_ap_ready),
    .accum_in_address0(tdf1_accum_3_2_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_3_2_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_2_t_q0),
    .accum_in_address1(tdf1_accum_3_2_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_3_2_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_2_t_q1),
    .ap_return_0(tdf1_accum_3_2_U0_ap_return_0),
    .ap_return_1(tdf1_accum_3_2_U0_ap_return_1),
    .ap_return_2(tdf1_accum_3_2_U0_ap_return_2),
    .ap_return_3(tdf1_accum_3_2_U0_ap_return_3)
);

td_fused_top_tdf1_accum_3_3 tdf1_accum_3_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_3_3_U0_ap_start),
    .ap_done(tdf1_accum_3_3_U0_ap_done),
    .ap_continue(tdf1_accum_3_3_U0_ap_continue),
    .ap_idle(tdf1_accum_3_3_U0_ap_idle),
    .ap_ready(tdf1_accum_3_3_U0_ap_ready),
    .accum_in_address0(tdf1_accum_3_3_U0_accum_in_address0),
    .accum_in_ce0(tdf1_accum_3_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_3_t_q0),
    .accum_in_address1(tdf1_accum_3_3_U0_accum_in_address1),
    .accum_in_ce1(tdf1_accum_3_3_U0_accum_in_ce1),
    .accum_in_q1(accum2_out_3_t_q1),
    .ap_return_0(tdf1_accum_3_3_U0_ap_return_0),
    .ap_return_1(tdf1_accum_3_3_U0_ap_return_1),
    .ap_return_2(tdf1_accum_3_3_U0_ap_return_2),
    .ap_return_3(tdf1_accum_3_3_U0_ap_return_3)
);

td_fused_top_tdf1_accum_4 tdf1_accum_4_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_4_U0_ap_start),
    .ap_done(tdf1_accum_4_U0_ap_done),
    .ap_continue(tdf1_accum_4_U0_ap_continue),
    .ap_idle(tdf1_accum_4_U0_ap_idle),
    .ap_ready(tdf1_accum_4_U0_ap_ready),
    .accum_in_0(tdf1_accum_4_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf1_accum_4_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_0_0_dout),
    .accum_in_1_read(accum3_out_0_1_dout),
    .accum_in_2_read(accum3_out_0_2_dout),
    .accum_in_3_read(accum3_out_0_3_dout)
);

td_fused_top_Block_entry_proc_proc Block_entry_proc_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc_U0_ap_start),
    .ap_done(Block_entry_proc_proc_U0_ap_done),
    .ap_continue(Block_entry_proc_proc_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc_U0_ap_return)
);

td_fused_top_tdf1_accum_4_1 tdf1_accum_4_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_4_1_U0_ap_start),
    .ap_done(tdf1_accum_4_1_U0_ap_done),
    .ap_continue(tdf1_accum_4_1_U0_ap_continue),
    .ap_idle(tdf1_accum_4_1_U0_ap_idle),
    .ap_ready(tdf1_accum_4_1_U0_ap_ready),
    .accum_in_0(tdf1_accum_4_1_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf1_accum_4_1_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_1_0_dout),
    .accum_in_1_read(accum3_out_1_1_dout),
    .accum_in_2_read(accum3_out_1_2_dout),
    .accum_in_3_read(accum3_out_1_3_dout)
);

td_fused_top_Block_entry_proc_proc491 Block_entry_proc_proc491_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc491_U0_ap_start),
    .ap_done(Block_entry_proc_proc491_U0_ap_done),
    .ap_continue(Block_entry_proc_proc491_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc491_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc491_U0_ap_ready),
    .tmp_434(tmp_434_channel_dout),
    .ap_return(Block_entry_proc_proc491_U0_ap_return)
);

td_fused_top_tdf1_accum_4_2 tdf1_accum_4_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_4_2_U0_ap_start),
    .ap_done(tdf1_accum_4_2_U0_ap_done),
    .ap_continue(tdf1_accum_4_2_U0_ap_continue),
    .ap_idle(tdf1_accum_4_2_U0_ap_idle),
    .ap_ready(tdf1_accum_4_2_U0_ap_ready),
    .accum_in_0(tdf1_accum_4_2_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf1_accum_4_2_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_2_0_dout),
    .accum_in_1_read(accum3_out_2_1_dout),
    .accum_in_2_read(accum3_out_2_2_dout),
    .accum_in_3_read(accum3_out_2_3_dout)
);

td_fused_top_Block_entry_proc_proc492 Block_entry_proc_proc492_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc492_U0_ap_start),
    .ap_done(Block_entry_proc_proc492_U0_ap_done),
    .ap_continue(Block_entry_proc_proc492_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc492_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc492_U0_ap_ready),
    .tmp_435(tmp_435_channel_dout),
    .ap_return(Block_entry_proc_proc492_U0_ap_return)
);

td_fused_top_tdf1_accum_4_3 tdf1_accum_4_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_accum_4_3_U0_ap_start),
    .ap_done(tdf1_accum_4_3_U0_ap_done),
    .ap_continue(tdf1_accum_4_3_U0_ap_continue),
    .ap_idle(tdf1_accum_4_3_U0_ap_idle),
    .ap_ready(tdf1_accum_4_3_U0_ap_ready),
    .accum_in_0(tdf1_accum_4_3_U0_accum_in_0),
    .accum_in_0_ap_vld(tdf1_accum_4_3_U0_accum_in_0_ap_vld),
    .p_read(accum3_out_3_0_dout),
    .accum_in_1_read(accum3_out_3_1_dout),
    .accum_in_2_read(accum3_out_3_2_dout),
    .accum_in_3_read(accum3_out_3_3_dout)
);

td_fused_top_Block_entry_proc_proc493 Block_entry_proc_proc493_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc493_U0_ap_start),
    .ap_done(Block_entry_proc_proc493_U0_ap_done),
    .ap_continue(Block_entry_proc_proc493_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc493_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc493_U0_ap_ready),
    .tmp_436(tmp_436_channel_dout),
    .ap_return(Block_entry_proc_proc493_U0_ap_return)
);

td_fused_top_tdf1_adjust tdf1_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_adjust_U0_ap_start),
    .ap_done(tdf1_adjust_U0_ap_done),
    .ap_continue(tdf1_adjust_U0_ap_continue),
    .ap_idle(tdf1_adjust_U0_ap_idle),
    .ap_ready(tdf1_adjust_U0_ap_ready),
    .sums_0_read(sums_0_dout),
    .sums_1_read(sums_1_dout),
    .sums_2_read(sums_2_dout),
    .sums_3_read(sums_3_dout),
    .adjustments_address0(tdf1_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf1_adjust_U0_adjustments_ce0),
    .adjustments_q0(adjustments_q0),
    .input_indices_23_dout(input_indices_23_c1_dout),
    .input_indices_23_empty_n(input_indices_23_c1_empty_n),
    .input_indices_23_read(tdf1_adjust_U0_input_indices_23_read),
    .input_indices_23_out_din(tdf1_adjust_U0_input_indices_23_out_din),
    .input_indices_23_out_full_n(input_indices_23_c2_full_n),
    .input_indices_23_out_write(tdf1_adjust_U0_input_indices_23_out_write),
    .ap_return_0(tdf1_adjust_U0_ap_return_0),
    .ap_return_1(tdf1_adjust_U0_ap_return_1),
    .ap_return_2(tdf1_adjust_U0_ap_return_2),
    .ap_return_3(tdf1_adjust_U0_ap_return_3)
);

td_fused_top_tdf1_poolOutputs tdf1_poolOutputs_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf1_poolOutputs_U0_ap_start),
    .ap_done(tdf1_poolOutputs_U0_ap_done),
    .ap_continue(tdf1_poolOutputs_U0_ap_continue),
    .ap_idle(tdf1_poolOutputs_U0_ap_idle),
    .ap_ready(tdf1_poolOutputs_U0_ap_ready),
    .output_indices_04_dout(output_indices_04_c_dout),
    .output_indices_04_empty_n(output_indices_04_c_empty_n),
    .output_indices_04_read(tdf1_poolOutputs_U0_output_indices_04_read),
    .output_indices_15_dout(output_indices_15_c_dout),
    .output_indices_15_empty_n(output_indices_15_c_empty_n),
    .output_indices_15_read(tdf1_poolOutputs_U0_output_indices_15_read),
    .input_indices_23_dout(input_indices_23_c2_dout),
    .input_indices_23_empty_n(input_indices_23_c2_empty_n),
    .input_indices_23_read(tdf1_poolOutputs_U0_input_indices_23_read),
    .resetMaximum6_dout(resetMaximum6_c_dout),
    .resetMaximum6_empty_n(resetMaximum6_c_empty_n),
    .resetMaximum6_read(tdf1_poolOutputs_U0_resetMaximum6_read),
    .storeOutput7_dout(storeOutput7_c_dout),
    .storeOutput7_empty_n(storeOutput7_c_empty_n),
    .storeOutput7_read(tdf1_poolOutputs_U0_storeOutput7_read),
    .outputs_0_read(outputs_0_dout),
    .outputs_1_read(outputs_1_dout),
    .outputs_2_read(outputs_2_dout),
    .outputs_3_read(outputs_3_dout),
    .out_data_address1(tdf1_poolOutputs_U0_out_data_address1),
    .out_data_ce1(tdf1_poolOutputs_U0_out_data_ce1),
    .out_data_we1(tdf1_poolOutputs_U0_out_data_we1),
    .out_data_d1(tdf1_poolOutputs_U0_out_data_d1)
);

td_fused_top_fifo_w2_d2_S input_indices_23_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_readFilters18_U0_input_indices_23_read),
    .if_dout(input_indices_23_c_dout),
    .if_full_n(input_indices_23_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_input_indices_2_out_write),
    .if_din(tdf1_get_next_ijk_U0_input_indices_2_out_din)
);

td_fused_top_fifo_w4_d9_S input_indices_23_c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_adjust_U0_input_indices_23_read),
    .if_dout(input_indices_23_c1_dout),
    .if_full_n(input_indices_23_c1_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_input_indices_2_out1_write),
    .if_din(tdf1_get_next_ijk_U0_input_indices_2_out1_din)
);

td_fused_top_fifo_w7_d10_S output_indices_04_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(output_indices_04_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_output_indices_04_read),
    .if_dout(output_indices_04_c_dout),
    .if_full_n(output_indices_04_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_output_indices_0_write),
    .if_din(tdf1_get_next_ijk_U0_output_indices_0_din)
);

td_fused_top_fifo_w14_d10_S output_indices_15_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(output_indices_15_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_output_indices_15_read),
    .if_dout(output_indices_15_c_dout),
    .if_full_n(output_indices_15_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_output_indices_1_write),
    .if_din(tdf1_get_next_ijk_U0_output_indices_1_din)
);

td_fused_top_fifo_w1_d10_S resetMaximum6_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(resetMaximum6_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_resetMaximum6_read),
    .if_dout(resetMaximum6_c_dout),
    .if_full_n(resetMaximum6_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_resetMaximum_write),
    .if_din(resetMaximum6_c_din)
);

td_fused_top_fifo_w1_d10_S storeOutput7_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(storeOutput7_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_storeOutput7_read),
    .if_dout(storeOutput7_c_dout),
    .if_full_n(storeOutput7_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_storeOutput_write),
    .if_din(storeOutput7_c_din)
);

td_fused_top_fifo_w16_d2_S input_indices_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_readInputs19_U0_ap_ready),
    .if_dout(input_indices_0_dout),
    .if_full_n(input_indices_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_input_indices_0),
    .if_din(tdf1_get_next_ijk_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S input_indices_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_readInputs19_U0_ap_ready),
    .if_dout(input_indices_1_dout),
    .if_full_n(input_indices_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_input_indices_1),
    .if_din(tdf1_get_next_ijk_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S accum3_out_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_0_dout),
    .if_full_n(accum3_out_0_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_0),
    .if_din(tdf1_accum_3_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S accum3_out_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_1_dout),
    .if_full_n(accum3_out_0_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_1),
    .if_din(tdf1_accum_3_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S accum3_out_0_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_2_dout),
    .if_full_n(accum3_out_0_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_2),
    .if_din(tdf1_accum_3_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S accum3_out_0_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_0_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_U0_ap_ready),
    .if_dout(accum3_out_0_3_dout),
    .if_full_n(accum3_out_0_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_0_3),
    .if_din(tdf1_accum_3_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S accum3_out_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_0_dout),
    .if_full_n(accum3_out_1_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_0),
    .if_din(tdf1_accum_3_1_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S accum3_out_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_1_dout),
    .if_full_n(accum3_out_1_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_1),
    .if_din(tdf1_accum_3_1_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S accum3_out_1_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_2_dout),
    .if_full_n(accum3_out_1_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_2),
    .if_din(tdf1_accum_3_1_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S accum3_out_1_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_1_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_1_U0_ap_ready),
    .if_dout(accum3_out_1_3_dout),
    .if_full_n(accum3_out_1_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_1_3),
    .if_din(tdf1_accum_3_1_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S accum3_out_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_0_dout),
    .if_full_n(accum3_out_2_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_0),
    .if_din(tdf1_accum_3_2_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S accum3_out_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_1_dout),
    .if_full_n(accum3_out_2_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_1),
    .if_din(tdf1_accum_3_2_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S accum3_out_2_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_2_dout),
    .if_full_n(accum3_out_2_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_2),
    .if_din(tdf1_accum_3_2_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S accum3_out_2_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_2_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_2_U0_ap_ready),
    .if_dout(accum3_out_2_3_dout),
    .if_full_n(accum3_out_2_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_2_3),
    .if_din(tdf1_accum_3_2_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S accum3_out_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_0_dout),
    .if_full_n(accum3_out_3_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_0),
    .if_din(tdf1_accum_3_3_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S accum3_out_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_1_dout),
    .if_full_n(accum3_out_3_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_1),
    .if_din(tdf1_accum_3_3_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S accum3_out_3_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_2_dout),
    .if_full_n(accum3_out_3_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_2),
    .if_din(tdf1_accum_3_3_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S accum3_out_3_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(accum3_out_3_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_accum_4_3_U0_ap_ready),
    .if_dout(accum3_out_3_3_dout),
    .if_full_n(accum3_out_3_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_accum3_out_3_3),
    .if_din(tdf1_accum_3_3_U0_ap_return_3)
);

td_fused_top_fifo_w16_d2_S tmp_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_accum_4_U0_ap_done),
    .if_din(tdf1_accum_4_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S sums_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_adjust_U0_ap_ready),
    .if_dout(sums_0_dout),
    .if_full_n(sums_0_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc_U0_ap_done),
    .if_din(Block_entry_proc_proc_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S tmp_434_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_434_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc491_U0_ap_ready),
    .if_dout(tmp_434_channel_dout),
    .if_full_n(tmp_434_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_accum_4_1_U0_ap_done),
    .if_din(tdf1_accum_4_1_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S sums_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_adjust_U0_ap_ready),
    .if_dout(sums_1_dout),
    .if_full_n(sums_1_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc491_U0_ap_done),
    .if_din(Block_entry_proc_proc491_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S tmp_435_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_435_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc492_U0_ap_ready),
    .if_dout(tmp_435_channel_dout),
    .if_full_n(tmp_435_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_accum_4_2_U0_ap_done),
    .if_din(tdf1_accum_4_2_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S sums_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_adjust_U0_ap_ready),
    .if_dout(sums_2_dout),
    .if_full_n(sums_2_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc492_U0_ap_done),
    .if_din(Block_entry_proc_proc492_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S tmp_436_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_436_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc493_U0_ap_ready),
    .if_dout(tmp_436_channel_dout),
    .if_full_n(tmp_436_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_accum_4_3_U0_ap_done),
    .if_din(tdf1_accum_4_3_U0_accum_in_0)
);

td_fused_top_fifo_w16_d2_S sums_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_adjust_U0_ap_ready),
    .if_dout(sums_3_dout),
    .if_full_n(sums_3_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc493_U0_ap_done),
    .if_din(Block_entry_proc_proc493_U0_ap_return)
);

td_fused_top_fifo_w4_d2_S input_indices_23_c2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_input_indices_23_read),
    .if_dout(input_indices_23_c2_dout),
    .if_full_n(input_indices_23_c2_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_adjust_U0_input_indices_23_out_write),
    .if_din(tdf1_adjust_U0_input_indices_23_out_din)
);

td_fused_top_fifo_w16_d2_S outputs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_ap_ready),
    .if_dout(outputs_0_dout),
    .if_full_n(outputs_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_0),
    .if_din(tdf1_adjust_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S outputs_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_ap_ready),
    .if_dout(outputs_1_dout),
    .if_full_n(outputs_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_1),
    .if_din(tdf1_adjust_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S outputs_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_ap_ready),
    .if_dout(outputs_2_dout),
    .if_full_n(outputs_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_2),
    .if_din(tdf1_adjust_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S outputs_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_poolOutputs_U0_ap_ready),
    .if_dout(outputs_3_dout),
    .if_full_n(outputs_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_3),
    .if_din(tdf1_adjust_U0_ap_return_3)
);

td_fused_top_start_for_tdf1_readFilters18_U0 start_for_tdf1_readFilters18_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(start_for_tdf1_readFilters18_U0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf1_readFilters18_U0_ap_ready),
    .if_dout(start_for_tdf1_readFilters18_U0_dout),
    .if_full_n(start_for_tdf1_readFilters18_U0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf1_get_next_ijk_U0_start_write),
    .if_din(start_for_tdf1_readFilters18_U0_din)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_accum3_out_0_0 <= 1'b0;
    end else begin
        if (((tdf1_accum_3_U0_ap_done & tdf1_accum_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_U0_ap_done & tdf1_accum_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_U0_ap_done & tdf1_accum_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_U0_ap_done & tdf1_accum_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_1_U0_ap_done & tdf1_accum_3_1_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_1_U0_ap_done & tdf1_accum_3_1_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_1_U0_ap_done & tdf1_accum_3_1_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_1_U0_ap_done & tdf1_accum_3_1_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_2_U0_ap_done & tdf1_accum_3_2_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_2_U0_ap_done & tdf1_accum_3_2_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_2_U0_ap_done & tdf1_accum_3_2_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_2_U0_ap_done & tdf1_accum_3_2_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_3_U0_ap_done & tdf1_accum_3_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_3_U0_ap_done & tdf1_accum_3_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_3_U0_ap_done & tdf1_accum_3_3_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_accum_3_3_U0_ap_done & tdf1_accum_3_3_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_accum3_out_3_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_accum3_out_3_3 <= ap_sync_channel_write_accum3_out_3_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_input_indices_0 <= 1'b0;
    end else begin
        if (((tdf1_get_next_ijk_U0_ap_done & tdf1_get_next_ijk_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf1_get_next_ijk_U0_ap_done & tdf1_get_next_ijk_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_input_indices_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_input_indices_1 <= ap_sync_channel_write_input_indices_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_outputs_0 <= 1'b0;
    end else begin
        if (((tdf1_adjust_U0_ap_done & tdf1_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_0 <= ap_sync_channel_write_outputs_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_outputs_1 <= 1'b0;
    end else begin
        if (((tdf1_adjust_U0_ap_done & tdf1_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_1 <= ap_sync_channel_write_outputs_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_outputs_2 <= 1'b0;
    end else begin
        if (((tdf1_adjust_U0_ap_done & tdf1_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_2 <= ap_sync_channel_write_outputs_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_outputs_3 <= 1'b0;
    end else begin
        if (((tdf1_adjust_U0_ap_done & tdf1_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_3 <= ap_sync_channel_write_outputs_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0 <= 1'b0;
    end else begin
        if (((tdf1_dot_product_U0_ap_done & tdf1_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0 <= ap_sync_channel_write_products_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1 <= 1'b0;
    end else begin
        if (((tdf1_dot_product_U0_ap_done & tdf1_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1 <= ap_sync_channel_write_products_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2 <= 1'b0;
    end else begin
        if (((tdf1_dot_product_U0_ap_done & tdf1_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2 <= ap_sync_channel_write_products_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3 <= 1'b0;
    end else begin
        if (((tdf1_dot_product_U0_ap_done & tdf1_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3 <= ap_sync_channel_write_products_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0 <= 1'b0;
    end else begin
        if (((tdf1_readFilters18_U0_ap_done & tdf1_readFilters18_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0 <= ap_sync_channel_write_weight_vecs_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1 <= 1'b0;
    end else begin
        if (((tdf1_readFilters18_U0_ap_done & tdf1_readFilters18_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1 <= ap_sync_channel_write_weight_vecs_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2 <= 1'b0;
    end else begin
        if (((tdf1_readFilters18_U0_ap_done & tdf1_readFilters18_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2 <= ap_sync_channel_write_weight_vecs_2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3 <= 1'b0;
    end else begin
        if (((tdf1_readFilters18_U0_ap_done & tdf1_readFilters18_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3 <= ap_sync_channel_write_weight_vecs_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready <= ap_sync_tdf1_get_next_ijk_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf1_readInputs19_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf1_readInputs19_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf1_readInputs19_U0_ap_ready <= ap_sync_tdf1_readInputs19_U0_ap_ready;
        end
    end
end

assign Block_entry_proc_proc491_U0_ap_continue = sums_1_full_n;

assign Block_entry_proc_proc491_U0_ap_start = tmp_434_channel_empty_n;

assign Block_entry_proc_proc491_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc491_U0_start_write = 1'b0;

assign Block_entry_proc_proc492_U0_ap_continue = sums_2_full_n;

assign Block_entry_proc_proc492_U0_ap_start = tmp_435_channel_empty_n;

assign Block_entry_proc_proc492_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc492_U0_start_write = 1'b0;

assign Block_entry_proc_proc493_U0_ap_continue = sums_3_full_n;

assign Block_entry_proc_proc493_U0_ap_start = tmp_436_channel_empty_n;

assign Block_entry_proc_proc493_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc493_U0_start_write = 1'b0;

assign Block_entry_proc_proc_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc_U0_start_write = 1'b0;

assign accum1_out_0_t_d1 = 16'd0;

assign accum1_out_0_t_we1 = 1'b0;

assign accum1_out_1_t_d1 = 16'd0;

assign accum1_out_1_t_we1 = 1'b0;

assign accum1_out_2_t_d1 = 16'd0;

assign accum1_out_2_t_we1 = 1'b0;

assign accum1_out_3_t_d1 = 16'd0;

assign accum1_out_3_t_we1 = 1'b0;

assign accum2_out_0_t_d1 = 16'd0;

assign accum2_out_0_t_we1 = 1'b0;

assign accum2_out_1_t_d1 = 16'd0;

assign accum2_out_1_t_we1 = 1'b0;

assign accum2_out_2_t_d1 = 16'd0;

assign accum2_out_2_t_we1 = 1'b0;

assign accum2_out_3_t_d1 = 16'd0;

assign accum2_out_3_t_we1 = 1'b0;

assign adjustments_address0 = tdf1_adjust_U0_adjustments_address0;

assign adjustments_address1 = 4'd0;

assign adjustments_ce0 = tdf1_adjust_U0_adjustments_ce0;

assign adjustments_ce1 = 1'b0;

assign adjustments_d0 = 48'd0;

assign adjustments_d1 = 48'd0;

assign adjustments_we0 = 1'b0;

assign adjustments_we1 = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf1_accum_1_U0_ap_done;

assign ap_channel_done_accum1_out_1 = tdf1_accum_1_U1_1_ap_done;

assign ap_channel_done_accum1_out_2 = tdf1_accum_1_U2_2_ap_done;

assign ap_channel_done_accum1_out_3 = tdf1_accum_1_U3_3_ap_done;

assign ap_channel_done_accum2_out_0 = tdf1_accum_2_U0_ap_done;

assign ap_channel_done_accum2_out_1 = tdf1_accum_2_U1_1_ap_done;

assign ap_channel_done_accum2_out_2 = tdf1_accum_2_U2_2_ap_done;

assign ap_channel_done_accum2_out_3 = tdf1_accum_2_U3_3_ap_done;

assign ap_channel_done_accum3_out_0_0 = (tdf1_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_0 ^ 1'b1));

assign ap_channel_done_accum3_out_0_1 = (tdf1_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_1 ^ 1'b1));

assign ap_channel_done_accum3_out_0_2 = (tdf1_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_2 ^ 1'b1));

assign ap_channel_done_accum3_out_0_3 = (tdf1_accum_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_0_3 ^ 1'b1));

assign ap_channel_done_accum3_out_1_0 = (tdf1_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_0 ^ 1'b1));

assign ap_channel_done_accum3_out_1_1 = (tdf1_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_1 ^ 1'b1));

assign ap_channel_done_accum3_out_1_2 = (tdf1_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_2 ^ 1'b1));

assign ap_channel_done_accum3_out_1_3 = (tdf1_accum_3_1_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_1_3 ^ 1'b1));

assign ap_channel_done_accum3_out_2_0 = (tdf1_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_0 ^ 1'b1));

assign ap_channel_done_accum3_out_2_1 = (tdf1_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_1 ^ 1'b1));

assign ap_channel_done_accum3_out_2_2 = (tdf1_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_2 ^ 1'b1));

assign ap_channel_done_accum3_out_2_3 = (tdf1_accum_3_2_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_2_3 ^ 1'b1));

assign ap_channel_done_accum3_out_3_0 = (tdf1_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_0 ^ 1'b1));

assign ap_channel_done_accum3_out_3_1 = (tdf1_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_1 ^ 1'b1));

assign ap_channel_done_accum3_out_3_2 = (tdf1_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_2 ^ 1'b1));

assign ap_channel_done_accum3_out_3_3 = (tdf1_accum_3_3_U0_ap_done & (ap_sync_reg_channel_write_accum3_out_3_3 ^ 1'b1));

assign ap_channel_done_ifmap_vec = tdf1_readInputs19_U0_ap_done;

assign ap_channel_done_input_indices_0 = (tdf1_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_0 ^ 1'b1));

assign ap_channel_done_input_indices_1 = (tdf1_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_1 ^ 1'b1));

assign ap_channel_done_outputs_0 = (tdf1_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_0 ^ 1'b1));

assign ap_channel_done_outputs_1 = (tdf1_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_1 ^ 1'b1));

assign ap_channel_done_outputs_2 = (tdf1_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_2 ^ 1'b1));

assign ap_channel_done_outputs_3 = (tdf1_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_3 ^ 1'b1));

assign ap_channel_done_products_0 = (tdf1_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0 ^ 1'b1));

assign ap_channel_done_products_1 = (tdf1_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1 ^ 1'b1));

assign ap_channel_done_products_2 = (tdf1_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2 ^ 1'b1));

assign ap_channel_done_products_3 = (tdf1_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3 ^ 1'b1));

assign ap_channel_done_sums_0 = Block_entry_proc_proc_U0_ap_done;

assign ap_channel_done_sums_1 = Block_entry_proc_proc491_U0_ap_done;

assign ap_channel_done_sums_2 = Block_entry_proc_proc492_U0_ap_done;

assign ap_channel_done_sums_3 = Block_entry_proc_proc493_U0_ap_done;

assign ap_channel_done_tmp_434_channel = tdf1_accum_4_1_U0_ap_done;

assign ap_channel_done_tmp_435_channel = tdf1_accum_4_2_U0_ap_done;

assign ap_channel_done_tmp_436_channel = tdf1_accum_4_3_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf1_accum_4_U0_ap_done;

assign ap_channel_done_weight_vecs_0 = (tdf1_readFilters18_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_1 = (tdf1_readFilters18_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_2 = (tdf1_readFilters18_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2 ^ 1'b1));

assign ap_channel_done_weight_vecs_3 = (tdf1_readFilters18_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3 ^ 1'b1));

assign ap_done = tdf1_poolOutputs_U0_ap_done;

assign ap_idle = (tdf1_readInputs19_U0_ap_idle & tdf1_readFilters18_U0_ap_idle & tdf1_poolOutputs_U0_ap_idle & tdf1_get_next_ijk_U0_ap_idle & tdf1_dot_product_U0_ap_idle & tdf1_adjust_U0_ap_idle & tdf1_accum_4_U0_ap_idle & tdf1_accum_4_3_U0_ap_idle & tdf1_accum_4_2_U0_ap_idle & tdf1_accum_4_1_U0_ap_idle & tdf1_accum_3_U0_ap_idle & tdf1_accum_3_3_U0_ap_idle & tdf1_accum_3_2_U0_ap_idle & tdf1_accum_3_1_U0_ap_idle & tdf1_accum_2_U3_3_ap_idle & tdf1_accum_2_U2_2_ap_idle & tdf1_accum_2_U1_1_ap_idle & tdf1_accum_2_U0_ap_idle & tdf1_accum_1_U3_3_ap_idle & tdf1_accum_1_U2_2_ap_idle & tdf1_accum_1_U1_1_ap_idle & tdf1_accum_1_U0_ap_idle & (1'b1 ^ accum3_out_3_3_empty_n) & (1'b1 ^ accum3_out_3_2_empty_n) & (1'b1 ^ accum3_out_3_1_empty_n) & (1'b1 ^ accum3_out_3_0_empty_n) & (1'b1 ^ accum3_out_2_3_empty_n) & (1'b1 ^ accum3_out_2_2_empty_n) & (1'b1 ^ accum3_out_2_1_empty_n) & (1'b1 ^ accum3_out_2_0_empty_n) & (1'b1 ^ accum3_out_1_3_empty_n) & (1'b1 ^ accum3_out_1_2_empty_n) & (1'b1 ^ accum3_out_1_1_empty_n) & (1'b1 ^ accum3_out_1_0_empty_n) & (1'b1 ^ accum3_out_0_3_empty_n) & (1'b1 ^ accum3_out_0_2_empty_n) & (1'b1 ^ accum3_out_0_1_empty_n) & (1'b1 ^ accum3_out_0_0_empty_n) & (1'b1 ^ accum2_out_3_t_empty_n) & (1'b1 ^ accum2_out_2_t_empty_n) & (1'b1 ^ accum2_out_1_t_empty_n) & (1'b1 ^ accum2_out_0_t_empty_n) & (1'b1 ^ accum1_out_3_t_empty_n) & (1'b1 ^ accum1_out_2_t_empty_n) & (1'b1 ^ accum1_out_1_t_empty_n) & (1'b1 ^ accum1_out_0_t_empty_n) & (outputs_3_empty_n ^ 1'b1) & (outputs_2_empty_n ^ 1'b1) & (outputs_1_empty_n ^ 1'b1) & (outputs_0_empty_n ^ 1'b1) & (sums_3_empty_n ^ 1'b1) & (tmp_436_channel_empty_n ^ 1'b1) & (sums_2_empty_n ^ 1'b1) & (tmp_435_channel_empty_n ^ 1'b1) & (sums_1_empty_n ^ 1'b1) & (tmp_434_channel_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (input_indices_1_empty_n ^ 1'b1) & (input_indices_0_empty_n ^ 1'b1) & (products_3_t_empty_n ^ 1'b1) & (products_2_t_empty_n ^ 1'b1) & (products_1_t_empty_n ^ 1'b1) & (products_0_t_empty_n ^ 1'b1) & (weight_vecs_3_t_empty_n ^ 1'b1) & (weight_vecs_2_t_empty_n ^ 1'b1) & (weight_vecs_1_t_empty_n ^ 1'b1) & (weight_vecs_0_t_empty_n ^ 1'b1) & (ifmap_vec_t_empty_n ^ 1'b1) & Block_entry_proc_proc_U0_ap_idle & Block_entry_proc_proc493_U0_ap_idle & Block_entry_proc_proc492_U0_ap_idle & Block_entry_proc_proc491_U0_ap_idle);

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

assign ap_sync_channel_write_input_indices_0 = ((input_indices_0_full_n & ap_channel_done_input_indices_0) | ap_sync_reg_channel_write_input_indices_0);

assign ap_sync_channel_write_input_indices_1 = ((input_indices_1_full_n & ap_channel_done_input_indices_1) | ap_sync_reg_channel_write_input_indices_1);

assign ap_sync_channel_write_outputs_0 = ((outputs_0_full_n & ap_channel_done_outputs_0) | ap_sync_reg_channel_write_outputs_0);

assign ap_sync_channel_write_outputs_1 = ((outputs_1_full_n & ap_channel_done_outputs_1) | ap_sync_reg_channel_write_outputs_1);

assign ap_sync_channel_write_outputs_2 = ((outputs_2_full_n & ap_channel_done_outputs_2) | ap_sync_reg_channel_write_outputs_2);

assign ap_sync_channel_write_outputs_3 = ((outputs_3_full_n & ap_channel_done_outputs_3) | ap_sync_reg_channel_write_outputs_3);

assign ap_sync_channel_write_products_0 = ((tdf1_dot_product_U0_products_0_full_n & ap_channel_done_products_0) | ap_sync_reg_channel_write_products_0);

assign ap_sync_channel_write_products_1 = ((tdf1_dot_product_U0_products_1_full_n & ap_channel_done_products_1) | ap_sync_reg_channel_write_products_1);

assign ap_sync_channel_write_products_2 = ((tdf1_dot_product_U0_products_2_full_n & ap_channel_done_products_2) | ap_sync_reg_channel_write_products_2);

assign ap_sync_channel_write_products_3 = ((tdf1_dot_product_U0_products_3_full_n & ap_channel_done_products_3) | ap_sync_reg_channel_write_products_3);

assign ap_sync_channel_write_weight_vecs_0 = ((tdf1_readFilters18_U0_weight_vecs_0_full_n & ap_channel_done_weight_vecs_0) | ap_sync_reg_channel_write_weight_vecs_0);

assign ap_sync_channel_write_weight_vecs_1 = ((tdf1_readFilters18_U0_weight_vecs_1_full_n & ap_channel_done_weight_vecs_1) | ap_sync_reg_channel_write_weight_vecs_1);

assign ap_sync_channel_write_weight_vecs_2 = ((tdf1_readFilters18_U0_weight_vecs_2_full_n & ap_channel_done_weight_vecs_2) | ap_sync_reg_channel_write_weight_vecs_2);

assign ap_sync_channel_write_weight_vecs_3 = ((tdf1_readFilters18_U0_weight_vecs_3_full_n & ap_channel_done_weight_vecs_3) | ap_sync_reg_channel_write_weight_vecs_3);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf1_poolOutputs_U0_ap_done;

assign ap_sync_ready = (ap_sync_tdf1_readInputs19_U0_ap_ready & ap_sync_tdf1_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf1_get_next_ijk_U0_ap_ready = (tdf1_get_next_ijk_U0_ap_ready | ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf1_readInputs19_U0_ap_ready = (tdf1_readInputs19_U0_ap_ready | ap_sync_reg_tdf1_readInputs19_U0_ap_ready);

assign filter_data_0_address0 = tdf1_readFilters18_U0_filter_data_0_address0;

assign filter_data_0_address1 = 7'd0;

assign filter_data_0_ce0 = tdf1_readFilters18_U0_filter_data_0_ce0;

assign filter_data_0_ce1 = 1'b0;

assign filter_data_0_d0 = 16'd0;

assign filter_data_0_d1 = 16'd0;

assign filter_data_0_we0 = 1'b0;

assign filter_data_0_we1 = 1'b0;

assign filter_data_1_address0 = tdf1_readFilters18_U0_filter_data_1_address0;

assign filter_data_1_address1 = 7'd0;

assign filter_data_1_ce0 = tdf1_readFilters18_U0_filter_data_1_ce0;

assign filter_data_1_ce1 = 1'b0;

assign filter_data_1_d0 = 16'd0;

assign filter_data_1_d1 = 16'd0;

assign filter_data_1_we0 = 1'b0;

assign filter_data_1_we1 = 1'b0;

assign filter_data_2_address0 = tdf1_readFilters18_U0_filter_data_2_address0;

assign filter_data_2_address1 = 7'd0;

assign filter_data_2_ce0 = tdf1_readFilters18_U0_filter_data_2_ce0;

assign filter_data_2_ce1 = 1'b0;

assign filter_data_2_d0 = 16'd0;

assign filter_data_2_d1 = 16'd0;

assign filter_data_2_we0 = 1'b0;

assign filter_data_2_we1 = 1'b0;

assign filter_data_3_address0 = tdf1_readFilters18_U0_filter_data_3_address0;

assign filter_data_3_address1 = 7'd0;

assign filter_data_3_ce0 = tdf1_readFilters18_U0_filter_data_3_ce0;

assign filter_data_3_ce1 = 1'b0;

assign filter_data_3_d0 = 16'd0;

assign filter_data_3_d1 = 16'd0;

assign filter_data_3_we0 = 1'b0;

assign filter_data_3_we1 = 1'b0;

assign in_data_address0 = tdf1_readInputs19_U0_in_data_address0;

assign in_data_address1 = 16'd0;

assign in_data_ce0 = tdf1_readInputs19_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = tdf1_readInputs19_U0_in_data_write;

assign in_data_we0 = 1'b0;

assign in_data_we1 = 1'b0;

assign out_data_address0 = 16'd0;

assign out_data_address1 = tdf1_poolOutputs_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = tdf1_poolOutputs_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = tdf1_poolOutputs_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = tdf1_poolOutputs_U0_out_data_we1;

assign out_data_write = tdf1_poolOutputs_U0_out_data_write;

assign products_0_t_d1 = 16'd0;

assign products_0_t_we1 = 1'b0;

assign products_1_t_d1 = 16'd0;

assign products_1_t_we1 = 1'b0;

assign products_2_t_d1 = 16'd0;

assign products_2_t_we1 = 1'b0;

assign products_3_t_d1 = 16'd0;

assign products_3_t_we1 = 1'b0;

assign resetMaximum6_c_din = tdf1_get_next_ijk_U0_resetMaximum_din;

assign start_for_tdf1_readFilters18_U0_din = 1'b1;

assign storeOutput7_c_din = tdf1_get_next_ijk_U0_storeOutput_din;

assign tdf1_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf1_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf1_accum_1_U0_ap_start = products_0_t_empty_n;

assign tdf1_accum_1_U0_start_full_n = 1'b1;

assign tdf1_accum_1_U0_start_write = 1'b0;

assign tdf1_accum_1_U1_1_accum_out_full_n = accum1_out_1_i_full_n;

assign tdf1_accum_1_U1_1_ap_continue = accum1_out_1_i_full_n;

assign tdf1_accum_1_U1_1_ap_start = products_1_t_empty_n;

assign tdf1_accum_1_U1_1_start_full_n = 1'b1;

assign tdf1_accum_1_U1_1_start_write = 1'b0;

assign tdf1_accum_1_U2_2_accum_out_full_n = accum1_out_2_i_full_n;

assign tdf1_accum_1_U2_2_ap_continue = accum1_out_2_i_full_n;

assign tdf1_accum_1_U2_2_ap_start = products_2_t_empty_n;

assign tdf1_accum_1_U2_2_start_full_n = 1'b1;

assign tdf1_accum_1_U2_2_start_write = 1'b0;

assign tdf1_accum_1_U3_3_accum_out_full_n = accum1_out_3_i_full_n;

assign tdf1_accum_1_U3_3_ap_continue = accum1_out_3_i_full_n;

assign tdf1_accum_1_U3_3_ap_start = products_3_t_empty_n;

assign tdf1_accum_1_U3_3_start_full_n = 1'b1;

assign tdf1_accum_1_U3_3_start_write = 1'b0;

assign tdf1_accum_2_U0_accum_out_full_n = accum2_out_0_i_full_n;

assign tdf1_accum_2_U0_ap_continue = accum2_out_0_i_full_n;

assign tdf1_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf1_accum_2_U0_start_full_n = 1'b1;

assign tdf1_accum_2_U0_start_write = 1'b0;

assign tdf1_accum_2_U1_1_accum_out_full_n = accum2_out_1_i_full_n;

assign tdf1_accum_2_U1_1_ap_continue = accum2_out_1_i_full_n;

assign tdf1_accum_2_U1_1_ap_start = accum1_out_1_t_empty_n;

assign tdf1_accum_2_U1_1_start_full_n = 1'b1;

assign tdf1_accum_2_U1_1_start_write = 1'b0;

assign tdf1_accum_2_U2_2_accum_out_full_n = accum2_out_2_i_full_n;

assign tdf1_accum_2_U2_2_ap_continue = accum2_out_2_i_full_n;

assign tdf1_accum_2_U2_2_ap_start = accum1_out_2_t_empty_n;

assign tdf1_accum_2_U2_2_start_full_n = 1'b1;

assign tdf1_accum_2_U2_2_start_write = 1'b0;

assign tdf1_accum_2_U3_3_accum_out_full_n = accum2_out_3_i_full_n;

assign tdf1_accum_2_U3_3_ap_continue = accum2_out_3_i_full_n;

assign tdf1_accum_2_U3_3_ap_start = accum1_out_3_t_empty_n;

assign tdf1_accum_2_U3_3_start_full_n = 1'b1;

assign tdf1_accum_2_U3_3_start_write = 1'b0;

assign tdf1_accum_3_1_U0_ap_continue = (ap_sync_channel_write_accum3_out_1_3 & ap_sync_channel_write_accum3_out_1_2 & ap_sync_channel_write_accum3_out_1_1 & ap_sync_channel_write_accum3_out_1_0);

assign tdf1_accum_3_1_U0_ap_start = accum2_out_1_t_empty_n;

assign tdf1_accum_3_1_U0_start_full_n = 1'b1;

assign tdf1_accum_3_1_U0_start_write = 1'b0;

assign tdf1_accum_3_2_U0_ap_continue = (ap_sync_channel_write_accum3_out_2_3 & ap_sync_channel_write_accum3_out_2_2 & ap_sync_channel_write_accum3_out_2_1 & ap_sync_channel_write_accum3_out_2_0);

assign tdf1_accum_3_2_U0_ap_start = accum2_out_2_t_empty_n;

assign tdf1_accum_3_2_U0_start_full_n = 1'b1;

assign tdf1_accum_3_2_U0_start_write = 1'b0;

assign tdf1_accum_3_3_U0_ap_continue = (ap_sync_channel_write_accum3_out_3_3 & ap_sync_channel_write_accum3_out_3_2 & ap_sync_channel_write_accum3_out_3_1 & ap_sync_channel_write_accum3_out_3_0);

assign tdf1_accum_3_3_U0_ap_start = accum2_out_3_t_empty_n;

assign tdf1_accum_3_3_U0_start_full_n = 1'b1;

assign tdf1_accum_3_3_U0_start_write = 1'b0;

assign tdf1_accum_3_U0_ap_continue = (ap_sync_channel_write_accum3_out_0_3 & ap_sync_channel_write_accum3_out_0_2 & ap_sync_channel_write_accum3_out_0_1 & ap_sync_channel_write_accum3_out_0_0);

assign tdf1_accum_3_U0_ap_start = accum2_out_0_t_empty_n;

assign tdf1_accum_3_U0_start_full_n = 1'b1;

assign tdf1_accum_3_U0_start_write = 1'b0;

assign tdf1_accum_4_1_U0_ap_continue = tmp_434_channel_full_n;

assign tdf1_accum_4_1_U0_ap_start = (accum3_out_1_3_empty_n & accum3_out_1_2_empty_n & accum3_out_1_1_empty_n & accum3_out_1_0_empty_n);

assign tdf1_accum_4_1_U0_start_full_n = 1'b1;

assign tdf1_accum_4_1_U0_start_write = 1'b0;

assign tdf1_accum_4_2_U0_ap_continue = tmp_435_channel_full_n;

assign tdf1_accum_4_2_U0_ap_start = (accum3_out_2_3_empty_n & accum3_out_2_2_empty_n & accum3_out_2_1_empty_n & accum3_out_2_0_empty_n);

assign tdf1_accum_4_2_U0_start_full_n = 1'b1;

assign tdf1_accum_4_2_U0_start_write = 1'b0;

assign tdf1_accum_4_3_U0_ap_continue = tmp_436_channel_full_n;

assign tdf1_accum_4_3_U0_ap_start = (accum3_out_3_3_empty_n & accum3_out_3_2_empty_n & accum3_out_3_1_empty_n & accum3_out_3_0_empty_n);

assign tdf1_accum_4_3_U0_start_full_n = 1'b1;

assign tdf1_accum_4_3_U0_start_write = 1'b0;

assign tdf1_accum_4_U0_ap_continue = tmp_channel_full_n;

assign tdf1_accum_4_U0_ap_start = (accum3_out_0_3_empty_n & accum3_out_0_2_empty_n & accum3_out_0_1_empty_n & accum3_out_0_0_empty_n);

assign tdf1_accum_4_U0_start_full_n = 1'b1;

assign tdf1_accum_4_U0_start_write = 1'b0;

assign tdf1_adjust_U0_ap_continue = (ap_sync_channel_write_outputs_3 & ap_sync_channel_write_outputs_2 & ap_sync_channel_write_outputs_1 & ap_sync_channel_write_outputs_0);

assign tdf1_adjust_U0_ap_start = (sums_3_empty_n & sums_2_empty_n & sums_1_empty_n & sums_0_empty_n);

assign tdf1_adjust_U0_start_full_n = 1'b1;

assign tdf1_adjust_U0_start_write = 1'b0;

assign tdf1_dot_product_U0_ap_continue = (ap_sync_channel_write_products_3 & ap_sync_channel_write_products_2 & ap_sync_channel_write_products_1 & ap_sync_channel_write_products_0);

assign tdf1_dot_product_U0_ap_start = (weight_vecs_3_t_empty_n & weight_vecs_2_t_empty_n & weight_vecs_1_t_empty_n & weight_vecs_0_t_empty_n & ifmap_vec_t_empty_n);

assign tdf1_dot_product_U0_products_0_full_n = products_0_i_full_n;

assign tdf1_dot_product_U0_products_1_full_n = products_1_i_full_n;

assign tdf1_dot_product_U0_products_2_full_n = products_2_i_full_n;

assign tdf1_dot_product_U0_products_3_full_n = products_3_i_full_n;

assign tdf1_dot_product_U0_start_full_n = 1'b1;

assign tdf1_dot_product_U0_start_write = 1'b0;

assign tdf1_get_next_ijk_U0_ap_continue = (ap_sync_channel_write_input_indices_1 & ap_sync_channel_write_input_indices_0);

assign tdf1_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf1_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf1_poolOutputs_U0_ap_continue = ap_continue;

assign tdf1_poolOutputs_U0_ap_start = (outputs_3_empty_n & outputs_2_empty_n & outputs_1_empty_n & outputs_0_empty_n);

assign tdf1_poolOutputs_U0_out_data_full_n = out_data_full_n;

assign tdf1_poolOutputs_U0_out_data_write = 1'b0;

assign tdf1_poolOutputs_U0_start_full_n = 1'b1;

assign tdf1_poolOutputs_U0_start_write = 1'b0;

assign tdf1_readFilters18_U0_ap_continue = (ap_sync_channel_write_weight_vecs_3 & ap_sync_channel_write_weight_vecs_2 & ap_sync_channel_write_weight_vecs_1 & ap_sync_channel_write_weight_vecs_0);

assign tdf1_readFilters18_U0_ap_start = start_for_tdf1_readFilters18_U0_empty_n;

assign tdf1_readFilters18_U0_start_full_n = 1'b1;

assign tdf1_readFilters18_U0_start_write = 1'b0;

assign tdf1_readFilters18_U0_weight_vecs_0_full_n = weight_vecs_0_i_full_n;

assign tdf1_readFilters18_U0_weight_vecs_1_full_n = weight_vecs_1_i_full_n;

assign tdf1_readFilters18_U0_weight_vecs_2_full_n = weight_vecs_2_i_full_n;

assign tdf1_readFilters18_U0_weight_vecs_3_full_n = weight_vecs_3_i_full_n;

assign tdf1_readInputs19_U0_ap_continue = ifmap_vec_i_full_n;

assign tdf1_readInputs19_U0_ap_start = (input_indices_1_empty_n & input_indices_0_empty_n & (ap_sync_reg_tdf1_readInputs19_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf1_readInputs19_U0_ifmap_vec_full_n = ifmap_vec_i_full_n;

assign tdf1_readInputs19_U0_in_data_full_n = in_data_empty_n;

assign tdf1_readInputs19_U0_in_data_write = 1'b0;

assign tdf1_readInputs19_U0_start_full_n = 1'b1;

assign tdf1_readInputs19_U0_start_write = 1'b0;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP16
module td_fused_top_start_for_tdf1_readFilters18_U0 (
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

td_fused_top_start_for_tdf1_readFilters18_U0_shiftReg 
U_td_fused_top_start_for_tdf1_readFilters18_U0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_start_for_tdf1_readFilters18_U0_shiftReg (
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
module td_fused_top_fifo_w16_d2_S (
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

td_fused_top_fifo_w16_d2_S_shiftReg 
U_td_fused_top_fifo_w16_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w16_d2_S_shiftReg (
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
module td_fused_top_fifo_w4_d2_S (
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
parameter DATA_WIDTH  = 32'd4;
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

td_fused_top_fifo_w4_d2_S_shiftReg 
U_td_fused_top_fifo_w4_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w4_d2_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd4;
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
module td_fused_top_fifo_w1_d10_S (
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
parameter DEPTH       = 5'd10;

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

td_fused_top_fifo_w1_d10_S_shiftReg 
U_td_fused_top_fifo_w1_d10_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w1_d10_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd1;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd10;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, a) begin
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
      default: q = sr_9;
   endcase
end

endmodule
module td_fused_top_fifo_w14_d10_S (
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
parameter DATA_WIDTH  = 32'd14;
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd10;

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

td_fused_top_fifo_w14_d10_S_shiftReg 
U_td_fused_top_fifo_w14_d10_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w14_d10_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd14;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd10;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, a) begin
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
      default: q = sr_9;
   endcase
end

endmodule
module td_fused_top_fifo_w7_d10_S (
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
parameter ADDR_WIDTH  = 32'd4;
parameter DEPTH       = 5'd10;

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

td_fused_top_fifo_w7_d10_S_shiftReg 
U_td_fused_top_fifo_w7_d10_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w7_d10_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd7;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd10;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9;
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


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, a) begin
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
      default: q = sr_9;
   endcase
end

endmodule
module td_fused_top_fifo_w4_d9_S (
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
parameter DATA_WIDTH  = 32'd4;
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

td_fused_top_fifo_w4_d9_S_shiftReg 
U_td_fused_top_fifo_w4_d9_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w4_d9_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd4;
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
module td_fused_top_fifo_w2_d2_S (
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
parameter DATA_WIDTH  = 32'd2;
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

td_fused_top_fifo_w2_d2_S_shiftReg 
U_td_fused_top_fifo_w2_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w2_d2_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd2;
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
module td_fused_top_tdf1_poolOutputs (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
        resetMaximum6_dout,
        resetMaximum6_empty_n,
        resetMaximum6_read,
        storeOutput7_dout,
        storeOutput7_empty_n,
        storeOutput7_read,
        outputs_0_read,
        outputs_1_read,
        outputs_2_read,
        outputs_3_read,
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
input  [6:0] output_indices_04_dout;
input   output_indices_04_empty_n;
output   output_indices_04_read;
input  [13:0] output_indices_15_dout;
input   output_indices_15_empty_n;
output   output_indices_15_read;
input  [3:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
input  [0:0] resetMaximum6_dout;
input   resetMaximum6_empty_n;
output   resetMaximum6_read;
input  [0:0] storeOutput7_dout;
input   storeOutput7_empty_n;
output   storeOutput7_read;
input  [15:0] outputs_0_read;
input  [15:0] outputs_1_read;
input  [15:0] outputs_2_read;
input  [15:0] outputs_3_read;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg output_indices_04_read;
reg output_indices_15_read;
reg input_indices_23_read;
reg resetMaximum6_read;
reg storeOutput7_read;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] max_vals_3_0;
reg   [15:0] max_vals_3_1;
reg   [15:0] max_vals_3_2;
reg   [15:0] max_vals_3_3;
reg    output_indices_04_blk_n;
wire    ap_CS_fsm_state2;
reg    output_indices_15_blk_n;
reg    input_indices_23_blk_n;
reg    resetMaximum6_blk_n;
reg    storeOutput7_blk_n;
reg   [6:0] output_indices_04_read_reg_281;
reg   [13:0] output_indices_15_read_reg_286;
reg   [3:0] input_indices_23_read_reg_291;
wire   [0:0] storeOutput7_read_read_fu_110_p2;
reg   [0:0] storeOutput7_read_reg_296;
wire    grp_tdf1_writeOutputs_aligned_fu_116_ap_start;
wire    grp_tdf1_writeOutputs_aligned_fu_116_ap_done;
wire    grp_tdf1_writeOutputs_aligned_fu_116_ap_idle;
wire    grp_tdf1_writeOutputs_aligned_fu_116_ap_ready;
wire   [15:0] grp_tdf1_writeOutputs_aligned_fu_116_out_data_address1;
wire    grp_tdf1_writeOutputs_aligned_fu_116_out_data_ce1;
wire    grp_tdf1_writeOutputs_aligned_fu_116_out_data_we1;
wire   [63:0] grp_tdf1_writeOutputs_aligned_fu_116_out_data_d1;
reg    grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [15:0] select_ln24_fu_179_p3;
reg    ap_block_state2;
wire   [15:0] select_ln24_10_fu_197_p3;
wire   [15:0] select_ln24_11_fu_215_p3;
wire   [15:0] select_ln24_12_fu_233_p3;
reg    ap_block_state1;
wire   [0:0] grp_fu_133_p2;
wire   [0:0] or_ln24_fu_173_p2;
wire   [0:0] grp_fu_138_p2;
wire   [0:0] or_ln24_10_fu_191_p2;
wire   [0:0] grp_fu_143_p2;
wire   [0:0] or_ln24_11_fu_209_p2;
wire   [0:0] grp_fu_148_p2;
wire   [0:0] or_ln24_12_fu_227_p2;
reg    grp_fu_133_ce;
reg    grp_fu_138_ce;
reg    grp_fu_143_ce;
reg    grp_fu_148_ce;
reg    ap_block_state4_on_subcall_done;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 max_vals_3_0 = 16'd0;
#0 max_vals_3_1 = 16'd0;
#0 max_vals_3_2 = 16'd0;
#0 max_vals_3_3 = 16'd0;
#0 grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg = 1'b0;
end

td_fused_top_tdf1_writeOutputs_aligned grp_tdf1_writeOutputs_aligned_fu_116(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_tdf1_writeOutputs_aligned_fu_116_ap_start),
    .ap_done(grp_tdf1_writeOutputs_aligned_fu_116_ap_done),
    .ap_idle(grp_tdf1_writeOutputs_aligned_fu_116_ap_idle),
    .ap_ready(grp_tdf1_writeOutputs_aligned_fu_116_ap_ready),
    .i(output_indices_04_read_reg_281),
    .j(output_indices_15_read_reg_286),
    .k(input_indices_23_read_reg_291),
    .out_data_address1(grp_tdf1_writeOutputs_aligned_fu_116_out_data_address1),
    .out_data_ce1(grp_tdf1_writeOutputs_aligned_fu_116_out_data_ce1),
    .out_data_we1(grp_tdf1_writeOutputs_aligned_fu_116_out_data_we1),
    .out_data_d1(grp_tdf1_writeOutputs_aligned_fu_116_out_data_d1),
    .max_vals_3_0(max_vals_3_0),
    .max_vals_3_1(max_vals_3_1),
    .max_vals_3_2(max_vals_3_2),
    .max_vals_3_3(max_vals_3_3)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U137(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_133_ce),
    .din0(max_vals_3_0),
    .din1(outputs_0_read),
    .opcode(5'd4),
    .dout(grp_fu_133_p2)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U138(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_138_ce),
    .din0(max_vals_3_1),
    .din1(outputs_1_read),
    .opcode(5'd4),
    .dout(grp_fu_138_p2)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U139(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_143_ce),
    .din0(max_vals_3_2),
    .din1(outputs_2_read),
    .opcode(5'd4),
    .dout(grp_fu_143_p2)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U140(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_148_ce),
    .din0(max_vals_3_3),
    .din1(outputs_3_read),
    .opcode(5'd4),
    .dout(grp_fu_148_p2)
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
        end else if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b1;
        end else if ((grp_tdf1_writeOutputs_aligned_fu_116_ap_ready == 1'b1)) begin
            grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        input_indices_23_read_reg_291 <= input_indices_23_dout;
        output_indices_04_read_reg_281 <= output_indices_04_dout;
        output_indices_15_read_reg_286 <= output_indices_15_dout;
        storeOutput7_read_reg_296 <= storeOutput7_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        max_vals_3_0 <= select_ln24_fu_179_p3;
        max_vals_3_1 <= select_ln24_10_fu_197_p3;
        max_vals_3_2 <= select_ln24_11_fu_215_p3;
        max_vals_3_3 <= select_ln24_12_fu_233_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
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
    if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_133_ce = 1'b1;
    end else begin
        grp_fu_133_ce = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_138_ce = 1'b1;
    end else begin
        grp_fu_138_ce = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_143_ce = 1'b1;
    end else begin
        grp_fu_143_ce = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_148_ce = 1'b1;
    end else begin
        grp_fu_148_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        input_indices_23_blk_n = input_indices_23_empty_n;
    end else begin
        input_indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        input_indices_23_read = 1'b1;
    end else begin
        input_indices_23_read = 1'b0;
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
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_110_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_110_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b0 == ap_block_state4_on_subcall_done) & (1'b1 == ap_CS_fsm_state4))) begin
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
    ap_block_state2 = ((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state4_on_subcall_done = ((grp_tdf1_writeOutputs_aligned_fu_116_ap_done == 1'b0) & (storeOutput7_read_reg_296 == 1'd1));
end

assign grp_tdf1_writeOutputs_aligned_fu_116_ap_start = grp_tdf1_writeOutputs_aligned_fu_116_ap_start_reg;

assign or_ln24_10_fu_191_p2 = (resetMaximum6_dout | grp_fu_138_p2);

assign or_ln24_11_fu_209_p2 = (resetMaximum6_dout | grp_fu_143_p2);

assign or_ln24_12_fu_227_p2 = (resetMaximum6_dout | grp_fu_148_p2);

assign or_ln24_fu_173_p2 = (resetMaximum6_dout | grp_fu_133_p2);

assign out_data_address1 = grp_tdf1_writeOutputs_aligned_fu_116_out_data_address1;

assign out_data_ce1 = grp_tdf1_writeOutputs_aligned_fu_116_out_data_ce1;

assign out_data_d1 = grp_tdf1_writeOutputs_aligned_fu_116_out_data_d1;

assign out_data_we1 = grp_tdf1_writeOutputs_aligned_fu_116_out_data_we1;

assign select_ln24_10_fu_197_p3 = ((or_ln24_10_fu_191_p2[0:0] == 1'b1) ? outputs_1_read : max_vals_3_1);

assign select_ln24_11_fu_215_p3 = ((or_ln24_11_fu_209_p2[0:0] == 1'b1) ? outputs_2_read : max_vals_3_2);

assign select_ln24_12_fu_233_p3 = ((or_ln24_12_fu_227_p2[0:0] == 1'b1) ? outputs_3_read : max_vals_3_3);

assign select_ln24_fu_179_p3 = ((or_ln24_fu_173_p2[0:0] == 1'b1) ? outputs_0_read : max_vals_3_0);

assign storeOutput7_read_read_fu_110_p2 = storeOutput7_dout;

endmodule //td_fused_top_tdf1_poolOutputs
module td_fused_top_tdf1_writeOutputs_aligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        i,
        j,
        k,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        max_vals_3_0,
        max_vals_3_1,
        max_vals_3_2,
        max_vals_3_3
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [6:0] i;
input  [13:0] j;
input  [3:0] k;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_3_0;
input  [15:0] max_vals_3_1;
input  [15:0] max_vals_3_2;
input  [15:0] max_vals_3_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] add_ln123_fu_117_p2;
reg   [15:0] add_ln123_reg_188;
wire   [63:0] zext_ln123_10_fu_142_p1;
wire    ap_CS_fsm_state2;
wire   [13:0] tmp_fu_79_p3;
wire   [10:0] tmp_s_fu_91_p3;
wire   [14:0] zext_ln123_fu_87_p1;
wire   [14:0] zext_ln123_7_fu_99_p1;
wire   [14:0] sub_ln123_fu_103_p2;
wire   [15:0] sub_ln123_cast15_fu_109_p1;
wire   [15:0] zext_ln123_8_fu_113_p1;
wire   [15:0] shl_ln123_fu_123_p2;
wire   [15:0] zext_ln123_9_fu_132_p1;
wire   [15:0] add_ln123_4_fu_136_p2;
wire   [15:0] bitcast_ln123_12_fu_171_p1;
wire   [15:0] bitcast_ln123_11_fu_163_p1;
wire   [15:0] bitcast_ln123_10_fu_155_p1;
wire   [15:0] bitcast_ln123_fu_147_p1;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln123_reg_188 <= add_ln123_fu_117_p2;
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
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

assign add_ln123_4_fu_136_p2 = (shl_ln123_fu_123_p2 + zext_ln123_9_fu_132_p1);

assign add_ln123_fu_117_p2 = (sub_ln123_cast15_fu_109_p1 + zext_ln123_8_fu_113_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln123_10_fu_155_p1 = max_vals_3_1;

assign bitcast_ln123_11_fu_163_p1 = max_vals_3_2;

assign bitcast_ln123_12_fu_171_p1 = max_vals_3_3;

assign bitcast_ln123_fu_147_p1 = max_vals_3_0;

assign out_data_address1 = zext_ln123_10_fu_142_p1;

assign out_data_d1 = {{{{bitcast_ln123_12_fu_171_p1}, {bitcast_ln123_11_fu_163_p1}}, {bitcast_ln123_10_fu_155_p1}}, {bitcast_ln123_fu_147_p1}};

assign shl_ln123_fu_123_p2 = add_ln123_reg_188 << 16'd2;

assign sub_ln123_cast15_fu_109_p1 = sub_ln123_fu_103_p2;

assign sub_ln123_fu_103_p2 = (zext_ln123_fu_87_p1 - zext_ln123_7_fu_99_p1);

assign tmp_fu_79_p3 = {{i}, {7'd0}};

assign tmp_s_fu_91_p3 = {{i}, {4'd0}};

assign zext_ln123_10_fu_142_p1 = add_ln123_4_fu_136_p2;

assign zext_ln123_7_fu_99_p1 = tmp_s_fu_91_p3;

assign zext_ln123_8_fu_113_p1 = j;

assign zext_ln123_9_fu_132_p1 = k;

assign zext_ln123_fu_87_p1 = tmp_fu_79_p3;

endmodule //td_fused_top_tdf1_writeOutputs_aligned
module td_fused_top_tdf1_adjust (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
        input_indices_23_out_din,
        input_indices_23_out_full_n,
        input_indices_23_out_write,
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
output  [3:0] adjustments_address0;
output   adjustments_ce0;
input  [47:0] adjustments_q0;
input  [3:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [3:0] input_indices_23_out_din;
input   input_indices_23_out_full_n;
output   input_indices_23_out_write;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg adjustments_ce0;
reg input_indices_23_read;
reg input_indices_23_out_write;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg    input_indices_23_out_blk_n;
reg   [0:0] write_flag6_0_reg_153;
reg   [0:0] write_flag9_0_reg_164;
reg   [0:0] write_flag12_0_reg_175;
reg   [0:0] write_flag_0_reg_186;
reg   [2:0] o_reg_197;
reg   [15:0] outputs_1_011_reg_208;
reg   [15:0] outputs_0_010_reg_220;
reg   [15:0] outputs_2_09_reg_232;
reg   [15:0] outputs_3_08_reg_244;
wire   [1:0] trunc_ln258_fu_268_p1;
reg   [1:0] trunc_ln258_reg_550;
wire   [2:0] add_ln213_fu_272_p2;
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
wire   [0:0] icmp_ln213_fu_278_p2;
reg   [0:0] icmp_ln213_reg_560;
reg   [0:0] icmp_ln213_reg_560_pp0_iter1_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter2_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter3_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter4_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter5_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter6_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter7_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter8_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter9_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter10_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter11_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter12_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter13_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter14_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter15_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter16_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter17_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter18_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter19_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter20_reg;
reg   [0:0] icmp_ln213_reg_560_pp0_iter21_reg;
wire   [1:0] trunc_ln219_fu_284_p1;
reg   [1:0] trunc_ln219_reg_564;
reg   [1:0] trunc_ln219_reg_564_pp0_iter1_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter2_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter3_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter4_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter5_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter6_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter7_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter8_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter9_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter10_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter11_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter12_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter13_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter14_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter15_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter16_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter17_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter18_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter19_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter20_reg;
reg   [1:0] trunc_ln219_reg_564_pp0_iter21_reg;
wire   [0:0] write_flag_1_fu_300_p6;
wire   [0:0] write_flag12_1_fu_314_p6;
wire   [0:0] write_flag9_1_fu_328_p6;
wire   [0:0] write_flag6_1_fu_342_p6;
wire   [15:0] trunc_ln220_fu_356_p1;
reg   [15:0] trunc_ln220_reg_597;
reg   [15:0] tmp_260_i_i_reg_602;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter2_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter3_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter4_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter5_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter6_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter7_reg;
reg   [15:0] tmp_260_i_i_reg_602_pp0_iter8_reg;
reg   [15:0] tmp_261_i_i_reg_607;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter2_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter3_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter4_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter5_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter6_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter7_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter8_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter9_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter10_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter11_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter12_reg;
reg   [15:0] tmp_261_i_i_reg_607_pp0_iter13_reg;
wire   [15:0] val_in_assign_fu_380_p6;
reg   [15:0] val_in_assign_reg_612;
wire   [15:0] grp_fu_260_p2;
reg   [15:0] sub_i_i_i_reg_622;
wire   [15:0] grp_fu_264_p2;
reg   [15:0] normalized_reg_632;
wire   [15:0] grp_fu_256_p2;
reg   [15:0] biased_reg_642;
wire   [15:0] outputs_3_1_fu_450_p3;
reg    ap_enable_reg_pp0_iter22;
wire   [15:0] outputs_2_1_fu_458_p3;
wire   [15:0] outputs_0_1_fu_482_p3;
wire   [15:0] outputs_1_1_fu_498_p3;
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
wire   [63:0] zext_ln220_fu_295_p1;
wire   [15:0] grp_fu_256_p1;
wire   [15:0] grp_fu_260_p1;
wire   [15:0] grp_fu_264_p1;
wire   [3:0] ochan_fu_288_p3;
wire   [15:0] data_V_fu_401_p1;
wire   [0:0] p_Result_s_fu_404_p3;
wire   [0:0] icmp_ln223_fu_419_p2;
wire   [15:0] activated_fu_412_p3;
wire   [0:0] icmp_ln223_11_fu_432_p2;
wire   [15:0] select_ln223_fu_424_p3;
wire   [0:0] icmp_ln223_12_fu_445_p2;
wire   [15:0] select_ln223_21_fu_437_p3;
wire   [15:0] select_ln223_22_fu_466_p3;
wire   [15:0] select_ln223_23_fu_474_p3;
wire   [15:0] select_ln223_24_fu_490_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U112(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(normalized_reg_632),
    .din1(grp_fu_256_p1),
    .dout(grp_fu_256_p2)
);

td_fused_top_hsub_16ns_16ns_16_7_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 7 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_7_full_dsp_1_U113(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(val_in_assign_reg_612),
    .din1(grp_fu_260_p1),
    .dout(grp_fu_260_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U114(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_622),
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
mux_42_1_1_1_U115(
    .din0(1'd1),
    .din1(write_flag_0_reg_186),
    .din2(write_flag_0_reg_186),
    .din3(write_flag_0_reg_186),
    .din4(trunc_ln219_fu_284_p1),
    .dout(write_flag_1_fu_300_p6)
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
mux_42_1_1_1_U116(
    .din0(write_flag12_0_reg_175),
    .din1(write_flag12_0_reg_175),
    .din2(write_flag12_0_reg_175),
    .din3(1'd1),
    .din4(trunc_ln219_fu_284_p1),
    .dout(write_flag12_1_fu_314_p6)
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
mux_42_1_1_1_U117(
    .din0(write_flag9_0_reg_164),
    .din1(write_flag9_0_reg_164),
    .din2(1'd1),
    .din3(write_flag9_0_reg_164),
    .din4(trunc_ln219_fu_284_p1),
    .dout(write_flag9_1_fu_328_p6)
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
mux_42_1_1_1_U118(
    .din0(write_flag6_0_reg_153),
    .din1(1'd1),
    .din2(write_flag6_0_reg_153),
    .din3(write_flag6_0_reg_153),
    .din4(trunc_ln219_fu_284_p1),
    .dout(write_flag6_1_fu_342_p6)
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
mux_42_16_1_1_U119(
    .din0(sums_0_read),
    .din1(sums_1_read),
    .din2(sums_2_read),
    .din3(sums_3_read),
    .din4(trunc_ln219_reg_564),
    .dout(val_in_assign_fu_380_p6)
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((((ap_enable_reg_pp0_iter20 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter21_state23) & (1'b0 == ap_block_pp0_stage0_subdone)) | (~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        o_reg_197 <= add_ln213_fu_272_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        o_reg_197 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag12_0_reg_175 <= write_flag12_1_fu_314_p6;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag12_0_reg_175 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag6_0_reg_153 <= write_flag6_1_fu_342_p6;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_153 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag9_0_reg_164 <= write_flag9_1_fu_328_p6;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_164 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        write_flag_0_reg_186 <= write_flag_1_fu_300_p6;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_186 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_560_pp0_iter20_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        biased_reg_642 <= grp_fu_256_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln213_reg_560 <= icmp_ln213_fu_278_p2;
        icmp_ln213_reg_560_pp0_iter1_reg <= icmp_ln213_reg_560;
        trunc_ln219_reg_564_pp0_iter1_reg <= trunc_ln219_reg_564;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln213_reg_560_pp0_iter10_reg <= icmp_ln213_reg_560_pp0_iter9_reg;
        icmp_ln213_reg_560_pp0_iter11_reg <= icmp_ln213_reg_560_pp0_iter10_reg;
        icmp_ln213_reg_560_pp0_iter12_reg <= icmp_ln213_reg_560_pp0_iter11_reg;
        icmp_ln213_reg_560_pp0_iter13_reg <= icmp_ln213_reg_560_pp0_iter12_reg;
        icmp_ln213_reg_560_pp0_iter14_reg <= icmp_ln213_reg_560_pp0_iter13_reg;
        icmp_ln213_reg_560_pp0_iter15_reg <= icmp_ln213_reg_560_pp0_iter14_reg;
        icmp_ln213_reg_560_pp0_iter16_reg <= icmp_ln213_reg_560_pp0_iter15_reg;
        icmp_ln213_reg_560_pp0_iter17_reg <= icmp_ln213_reg_560_pp0_iter16_reg;
        icmp_ln213_reg_560_pp0_iter18_reg <= icmp_ln213_reg_560_pp0_iter17_reg;
        icmp_ln213_reg_560_pp0_iter19_reg <= icmp_ln213_reg_560_pp0_iter18_reg;
        icmp_ln213_reg_560_pp0_iter20_reg <= icmp_ln213_reg_560_pp0_iter19_reg;
        icmp_ln213_reg_560_pp0_iter21_reg <= icmp_ln213_reg_560_pp0_iter20_reg;
        icmp_ln213_reg_560_pp0_iter2_reg <= icmp_ln213_reg_560_pp0_iter1_reg;
        icmp_ln213_reg_560_pp0_iter3_reg <= icmp_ln213_reg_560_pp0_iter2_reg;
        icmp_ln213_reg_560_pp0_iter4_reg <= icmp_ln213_reg_560_pp0_iter3_reg;
        icmp_ln213_reg_560_pp0_iter5_reg <= icmp_ln213_reg_560_pp0_iter4_reg;
        icmp_ln213_reg_560_pp0_iter6_reg <= icmp_ln213_reg_560_pp0_iter5_reg;
        icmp_ln213_reg_560_pp0_iter7_reg <= icmp_ln213_reg_560_pp0_iter6_reg;
        icmp_ln213_reg_560_pp0_iter8_reg <= icmp_ln213_reg_560_pp0_iter7_reg;
        icmp_ln213_reg_560_pp0_iter9_reg <= icmp_ln213_reg_560_pp0_iter8_reg;
        tmp_260_i_i_reg_602_pp0_iter2_reg <= tmp_260_i_i_reg_602;
        tmp_260_i_i_reg_602_pp0_iter3_reg <= tmp_260_i_i_reg_602_pp0_iter2_reg;
        tmp_260_i_i_reg_602_pp0_iter4_reg <= tmp_260_i_i_reg_602_pp0_iter3_reg;
        tmp_260_i_i_reg_602_pp0_iter5_reg <= tmp_260_i_i_reg_602_pp0_iter4_reg;
        tmp_260_i_i_reg_602_pp0_iter6_reg <= tmp_260_i_i_reg_602_pp0_iter5_reg;
        tmp_260_i_i_reg_602_pp0_iter7_reg <= tmp_260_i_i_reg_602_pp0_iter6_reg;
        tmp_260_i_i_reg_602_pp0_iter8_reg <= tmp_260_i_i_reg_602_pp0_iter7_reg;
        tmp_261_i_i_reg_607_pp0_iter10_reg <= tmp_261_i_i_reg_607_pp0_iter9_reg;
        tmp_261_i_i_reg_607_pp0_iter11_reg <= tmp_261_i_i_reg_607_pp0_iter10_reg;
        tmp_261_i_i_reg_607_pp0_iter12_reg <= tmp_261_i_i_reg_607_pp0_iter11_reg;
        tmp_261_i_i_reg_607_pp0_iter13_reg <= tmp_261_i_i_reg_607_pp0_iter12_reg;
        tmp_261_i_i_reg_607_pp0_iter2_reg <= tmp_261_i_i_reg_607;
        tmp_261_i_i_reg_607_pp0_iter3_reg <= tmp_261_i_i_reg_607_pp0_iter2_reg;
        tmp_261_i_i_reg_607_pp0_iter4_reg <= tmp_261_i_i_reg_607_pp0_iter3_reg;
        tmp_261_i_i_reg_607_pp0_iter5_reg <= tmp_261_i_i_reg_607_pp0_iter4_reg;
        tmp_261_i_i_reg_607_pp0_iter6_reg <= tmp_261_i_i_reg_607_pp0_iter5_reg;
        tmp_261_i_i_reg_607_pp0_iter7_reg <= tmp_261_i_i_reg_607_pp0_iter6_reg;
        tmp_261_i_i_reg_607_pp0_iter8_reg <= tmp_261_i_i_reg_607_pp0_iter7_reg;
        tmp_261_i_i_reg_607_pp0_iter9_reg <= tmp_261_i_i_reg_607_pp0_iter8_reg;
        trunc_ln219_reg_564_pp0_iter10_reg <= trunc_ln219_reg_564_pp0_iter9_reg;
        trunc_ln219_reg_564_pp0_iter11_reg <= trunc_ln219_reg_564_pp0_iter10_reg;
        trunc_ln219_reg_564_pp0_iter12_reg <= trunc_ln219_reg_564_pp0_iter11_reg;
        trunc_ln219_reg_564_pp0_iter13_reg <= trunc_ln219_reg_564_pp0_iter12_reg;
        trunc_ln219_reg_564_pp0_iter14_reg <= trunc_ln219_reg_564_pp0_iter13_reg;
        trunc_ln219_reg_564_pp0_iter15_reg <= trunc_ln219_reg_564_pp0_iter14_reg;
        trunc_ln219_reg_564_pp0_iter16_reg <= trunc_ln219_reg_564_pp0_iter15_reg;
        trunc_ln219_reg_564_pp0_iter17_reg <= trunc_ln219_reg_564_pp0_iter16_reg;
        trunc_ln219_reg_564_pp0_iter18_reg <= trunc_ln219_reg_564_pp0_iter17_reg;
        trunc_ln219_reg_564_pp0_iter19_reg <= trunc_ln219_reg_564_pp0_iter18_reg;
        trunc_ln219_reg_564_pp0_iter20_reg <= trunc_ln219_reg_564_pp0_iter19_reg;
        trunc_ln219_reg_564_pp0_iter21_reg <= trunc_ln219_reg_564_pp0_iter20_reg;
        trunc_ln219_reg_564_pp0_iter2_reg <= trunc_ln219_reg_564_pp0_iter1_reg;
        trunc_ln219_reg_564_pp0_iter3_reg <= trunc_ln219_reg_564_pp0_iter2_reg;
        trunc_ln219_reg_564_pp0_iter4_reg <= trunc_ln219_reg_564_pp0_iter3_reg;
        trunc_ln219_reg_564_pp0_iter5_reg <= trunc_ln219_reg_564_pp0_iter4_reg;
        trunc_ln219_reg_564_pp0_iter6_reg <= trunc_ln219_reg_564_pp0_iter5_reg;
        trunc_ln219_reg_564_pp0_iter7_reg <= trunc_ln219_reg_564_pp0_iter6_reg;
        trunc_ln219_reg_564_pp0_iter8_reg <= trunc_ln219_reg_564_pp0_iter7_reg;
        trunc_ln219_reg_564_pp0_iter9_reg <= trunc_ln219_reg_564_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_560_pp0_iter12_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        normalized_reg_632 <= grp_fu_264_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter22 == 1'b1) & (icmp_ln213_reg_560_pp0_iter21_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        outputs_0_010_reg_220 <= outputs_0_1_fu_482_p3;
        outputs_1_011_reg_208 <= outputs_1_1_fu_498_p3;
        outputs_2_09_reg_232 <= outputs_2_1_fu_458_p3;
        outputs_3_08_reg_244 <= outputs_3_1_fu_450_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_560_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sub_i_i_i_reg_622 <= grp_fu_260_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_reg_560 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_260_i_i_reg_602 <= {{adjustments_q0[31:16]}};
        tmp_261_i_i_reg_607 <= {{adjustments_q0[47:32]}};
        trunc_ln220_reg_597 <= trunc_ln220_fu_356_p1;
        val_in_assign_reg_612 <= val_in_assign_fu_380_p6;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln219_reg_564 <= trunc_ln219_fu_284_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln258_reg_550 <= trunc_ln258_fu_268_p1;
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln213_fu_278_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        input_indices_23_blk_n = input_indices_23_empty_n;
    end else begin
        input_indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_out_blk_n = input_indices_23_out_full_n;
    end else begin
        input_indices_23_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_out_write = 1'b1;
    end else begin
        input_indices_23_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_read = 1'b1;
    end else begin
        input_indices_23_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign activated_fu_412_p3 = ((p_Result_s_fu_404_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_642);

assign add_ln213_fu_272_p2 = (o_reg_197 + 3'd1);

assign adjustments_address0 = zext_ln220_fu_295_p1;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state25 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (input_indices_23_out_full_n == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
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

assign data_V_fu_401_p1 = biased_reg_642;

assign grp_fu_256_p1 = tmp_261_i_i_reg_607_pp0_iter13_reg;

assign grp_fu_260_p1 = trunc_ln220_reg_597;

assign grp_fu_264_p1 = tmp_260_i_i_reg_602_pp0_iter8_reg;

assign icmp_ln213_fu_278_p2 = ((o_reg_197 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln223_11_fu_432_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln223_12_fu_445_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln223_fu_419_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd0) ? 1'b1 : 1'b0);

assign input_indices_23_out_din = input_indices_23_dout;

assign ochan_fu_288_p3 = {{trunc_ln258_reg_550}, {trunc_ln219_fu_284_p1}};

assign outputs_0_1_fu_482_p3 = ((icmp_ln223_12_fu_445_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_23_fu_474_p3);

assign outputs_1_1_fu_498_p3 = ((icmp_ln223_12_fu_445_p2[0:0] == 1'b1) ? outputs_1_011_reg_208 : select_ln223_24_fu_490_p3);

assign outputs_2_1_fu_458_p3 = ((icmp_ln223_12_fu_445_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_2_09_reg_232);

assign outputs_3_1_fu_450_p3 = ((icmp_ln223_12_fu_445_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_21_fu_437_p3);

assign p_Result_s_fu_404_p3 = data_V_fu_401_p1[32'd15];

assign select_ln223_21_fu_437_p3 = ((icmp_ln223_11_fu_432_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_fu_424_p3);

assign select_ln223_22_fu_466_p3 = ((icmp_ln223_fu_419_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_0_010_reg_220);

assign select_ln223_23_fu_474_p3 = ((icmp_ln223_11_fu_432_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_22_fu_466_p3);

assign select_ln223_24_fu_490_p3 = ((icmp_ln223_11_fu_432_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_1_011_reg_208);

assign select_ln223_fu_424_p3 = ((icmp_ln223_fu_419_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : activated_fu_412_p3);

assign trunc_ln219_fu_284_p1 = o_reg_197[1:0];

assign trunc_ln220_fu_356_p1 = adjustments_q0[15:0];

assign trunc_ln258_fu_268_p1 = input_indices_23_dout[1:0];

assign zext_ln220_fu_295_p1 = ochan_fu_288_p3;

endmodule //td_fused_top_tdf1_adjust
module td_fused_top_Block_entry_proc_proc493 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_436,
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
input  [15:0] tmp_436;
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
            ap_return_preg <= tmp_436;
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
        ap_return = tmp_436;
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

endmodule //td_fused_top_Block_entry_proc_proc493
module td_fused_top_tdf1_accum_4_3 (
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

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

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
  reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] grp_fu_45_p2;
reg   [15:0] sum0_reg_78;
wire    ap_CS_fsm_state8;
wire   [15:0] grp_fu_51_p2;
reg   [15:0] sum1_reg_83;
reg    ap_block_state1;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state16;
reg   [15:0] grp_fu_45_p0;
reg   [15:0] grp_fu_45_p1;
wire    ap_CS_fsm_state9;
reg    grp_fu_45_ce;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg    grp_fu_51_ce;
reg   [15:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 16'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U104(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_45_ce),
    .din0(grp_fu_45_p0),
    .din1(grp_fu_45_p1),
    .dout(grp_fu_45_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U105(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_51_ce),
    .din0(accum_in_1_read),
    .din1(p_read),
    .dout(grp_fu_51_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            accum_in_0_preg <= grp_fu_45_p2;
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
        end else if ((1'b1 == ap_CS_fsm_state16)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sum0_reg_78 <= grp_fu_45_p2;
        sum1_reg_83 <= grp_fu_51_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0 = grp_fu_45_p2;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
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
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ((ap_done_reg == 1'b1) | (ap_start == 1'b0)))) begin
        grp_fu_45_ce = 1'b0;
    end else begin
        grp_fu_45_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p0 = sum0_reg_78;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p0 = accum_in_3_read;
    end else begin
        grp_fu_45_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p1 = sum1_reg_83;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p1 = accum_in_2_read;
    end else begin
        grp_fu_45_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_51_ce = 1'b1;
    end else begin
        grp_fu_51_ce = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

endmodule //td_fused_top_tdf1_accum_4_3
module td_fused_top_Block_entry_proc_proc492 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_435,
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
input  [15:0] tmp_435;
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
            ap_return_preg <= tmp_435;
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
        ap_return = tmp_435;
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

endmodule //td_fused_top_Block_entry_proc_proc492
module td_fused_top_tdf1_accum_4_2 (
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

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

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
  reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] grp_fu_45_p2;
reg   [15:0] sum0_reg_78;
wire    ap_CS_fsm_state8;
wire   [15:0] grp_fu_51_p2;
reg   [15:0] sum1_reg_83;
reg    ap_block_state1;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state16;
reg   [15:0] grp_fu_45_p0;
reg   [15:0] grp_fu_45_p1;
wire    ap_CS_fsm_state9;
reg    grp_fu_45_ce;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg    grp_fu_51_ce;
reg   [15:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 16'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U96(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_45_ce),
    .din0(grp_fu_45_p0),
    .din1(grp_fu_45_p1),
    .dout(grp_fu_45_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U97(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_51_ce),
    .din0(accum_in_1_read),
    .din1(p_read),
    .dout(grp_fu_51_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            accum_in_0_preg <= grp_fu_45_p2;
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
        end else if ((1'b1 == ap_CS_fsm_state16)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sum0_reg_78 <= grp_fu_45_p2;
        sum1_reg_83 <= grp_fu_51_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0 = grp_fu_45_p2;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
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
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ((ap_done_reg == 1'b1) | (ap_start == 1'b0)))) begin
        grp_fu_45_ce = 1'b0;
    end else begin
        grp_fu_45_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p0 = sum0_reg_78;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p0 = accum_in_3_read;
    end else begin
        grp_fu_45_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p1 = sum1_reg_83;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p1 = accum_in_2_read;
    end else begin
        grp_fu_45_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_51_ce = 1'b1;
    end else begin
        grp_fu_51_ce = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

endmodule //td_fused_top_tdf1_accum_4_2
module td_fused_top_Block_entry_proc_proc491 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_434,
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
input  [15:0] tmp_434;
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
            ap_return_preg <= tmp_434;
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
        ap_return = tmp_434;
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

endmodule //td_fused_top_Block_entry_proc_proc491
module td_fused_top_tdf1_accum_4_1 (
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

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

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
  reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] grp_fu_45_p2;
reg   [15:0] sum0_reg_78;
wire    ap_CS_fsm_state8;
wire   [15:0] grp_fu_51_p2;
reg   [15:0] sum1_reg_83;
reg    ap_block_state1;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state16;
reg   [15:0] grp_fu_45_p0;
reg   [15:0] grp_fu_45_p1;
wire    ap_CS_fsm_state9;
reg    grp_fu_45_ce;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg    grp_fu_51_ce;
reg   [15:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 16'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U88(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_45_ce),
    .din0(grp_fu_45_p0),
    .din1(grp_fu_45_p1),
    .dout(grp_fu_45_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U89(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_51_ce),
    .din0(accum_in_1_read),
    .din1(p_read),
    .dout(grp_fu_51_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            accum_in_0_preg <= grp_fu_45_p2;
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
        end else if ((1'b1 == ap_CS_fsm_state16)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sum0_reg_78 <= grp_fu_45_p2;
        sum1_reg_83 <= grp_fu_51_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0 = grp_fu_45_p2;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
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
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ((ap_done_reg == 1'b1) | (ap_start == 1'b0)))) begin
        grp_fu_45_ce = 1'b0;
    end else begin
        grp_fu_45_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p0 = sum0_reg_78;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p0 = accum_in_3_read;
    end else begin
        grp_fu_45_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p1 = sum1_reg_83;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p1 = accum_in_2_read;
    end else begin
        grp_fu_45_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_51_ce = 1'b1;
    end else begin
        grp_fu_51_ce = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

endmodule //td_fused_top_tdf1_accum_4_1
module td_fused_top_Block_entry_proc_proc (
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

endmodule //td_fused_top_Block_entry_proc_proc
module td_fused_top_tdf1_accum_4 (
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

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

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
  reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] grp_fu_45_p2;
reg   [15:0] sum0_reg_78;
wire    ap_CS_fsm_state8;
wire   [15:0] grp_fu_51_p2;
reg   [15:0] sum1_reg_83;
reg    ap_block_state1;
reg   [15:0] accum_in_0_preg;
wire    ap_CS_fsm_state16;
reg   [15:0] grp_fu_45_p0;
reg   [15:0] grp_fu_45_p1;
wire    ap_CS_fsm_state9;
reg    grp_fu_45_ce;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg    grp_fu_51_ce;
reg   [15:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 16'd1;
#0 accum_in_0_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U80(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_45_ce),
    .din0(grp_fu_45_p0),
    .din1(grp_fu_45_p1),
    .dout(grp_fu_45_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U81(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_51_ce),
    .din0(accum_in_1_read),
    .din1(p_read),
    .dout(grp_fu_51_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_0_preg <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            accum_in_0_preg <= grp_fu_45_p2;
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
        end else if ((1'b1 == ap_CS_fsm_state16)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sum0_reg_78 <= grp_fu_45_p2;
        sum1_reg_83 <= grp_fu_51_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0 = grp_fu_45_p2;
    end else begin
        accum_in_0 = accum_in_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        accum_in_0_ap_vld = 1'b1;
    end else begin
        accum_in_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
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
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & ((ap_done_reg == 1'b1) | (ap_start == 1'b0)))) begin
        grp_fu_45_ce = 1'b0;
    end else begin
        grp_fu_45_ce = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p0 = sum0_reg_78;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p0 = accum_in_3_read;
    end else begin
        grp_fu_45_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_45_p1 = sum1_reg_83;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_45_p1 = accum_in_2_read;
    end else begin
        grp_fu_45_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        grp_fu_51_ce = 1'b1;
    end else begin
        grp_fu_51_ce = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

endmodule //td_fused_top_tdf1_accum_4
module td_fused_top_tdf1_accum_3_3 (
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
reg   [0:0] write_flag3_0_reg_71;
reg   [0:0] write_flag6_0_reg_82;
reg   [0:0] write_flag9_0_reg_93;
reg   [0:0] write_flag_0_reg_104;
reg   [2:0] out_idx_reg_115;
reg   [15:0] accum_out_1_07_reg_126;
reg   [15:0] accum_out_0_06_reg_138;
reg   [15:0] accum_out_2_05_reg_150;
reg   [15:0] accum_out_3_04_reg_162;
wire   [2:0] add_ln119_fu_178_p2;
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
wire   [0:0] icmp_ln105_fu_184_p2;
reg   [0:0] icmp_ln105_reg_397;
reg   [0:0] icmp_ln105_reg_397_pp0_iter1_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter2_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter3_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter4_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter5_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter6_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter7_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter8_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter9_reg;
wire   [1:0] trunc_ln106_fu_190_p1;
reg   [1:0] trunc_ln106_reg_401;
reg   [1:0] trunc_ln106_reg_401_pp0_iter1_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter2_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter3_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter4_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter5_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter6_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter7_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter8_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter9_reg;
wire   [0:0] icmp_ln115_fu_211_p2;
reg   [0:0] icmp_ln115_reg_413;
wire   [0:0] write_flag_1_fu_222_p6;
wire   [0:0] write_flag9_1_fu_236_p6;
wire   [0:0] write_flag6_1_fu_250_p6;
wire   [0:0] write_flag3_1_fu_264_p6;
reg   [15:0] accum_in_load_reg_443;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] select_ln115_fu_278_p3;
reg   [15:0] select_ln115_reg_448;
wire   [15:0] grp_fu_174_p2;
reg   [15:0] sum0_reg_453;
wire   [15:0] accum_out_3_1_fu_315_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_323_p3;
wire   [15:0] accum_out_0_1_fu_345_p3;
wire   [15:0] accum_out_1_1_fu_360_p3;
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
wire   [63:0] zext_ln115_fu_200_p1;
wire   [63:0] zext_ln115_1_fu_217_p1;
wire   [2:0] i_12_fu_194_p2;
wire   [2:0] or_ln115_fu_205_p2;
wire   [0:0] icmp_ln118_fu_285_p2;
wire   [0:0] icmp_ln118_1_fu_297_p2;
wire   [15:0] select_ln118_fu_290_p3;
wire   [0:0] icmp_ln118_2_fu_310_p2;
wire   [15:0] select_ln118_1_fu_302_p3;
wire   [15:0] select_ln118_2_fu_330_p3;
wire   [15:0] select_ln118_3_fu_337_p3;
wire   [15:0] select_ln118_4_fu_353_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U74(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln115_reg_448),
    .din1(accum_in_load_reg_443),
    .dout(grp_fu_174_p2)
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
mux_42_1_1_1_U75(
    .din0(1'd1),
    .din1(write_flag_0_reg_104),
    .din2(write_flag_0_reg_104),
    .din3(write_flag_0_reg_104),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag_1_fu_222_p6)
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
mux_42_1_1_1_U76(
    .din0(write_flag9_0_reg_93),
    .din1(write_flag9_0_reg_93),
    .din2(write_flag9_0_reg_93),
    .din3(1'd1),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag9_1_fu_236_p6)
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
mux_42_1_1_1_U77(
    .din0(write_flag6_0_reg_82),
    .din1(write_flag6_0_reg_82),
    .din2(1'd1),
    .din3(write_flag6_0_reg_82),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag6_1_fu_250_p6)
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
mux_42_1_1_1_U78(
    .din0(write_flag3_0_reg_71),
    .din1(1'd1),
    .din2(write_flag3_0_reg_71),
    .din3(write_flag3_0_reg_71),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag3_1_fu_264_p6)
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter8 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter9_state11)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_115 <= add_ln119_fu_178_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_115 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_71 <= write_flag3_1_fu_264_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_71 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_82 <= write_flag6_1_fu_250_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_82 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_93 <= write_flag9_1_fu_236_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_93 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_104 <= write_flag_1_fu_222_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_104 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_reg_443 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_138 <= accum_out_0_1_fu_345_p3;
        accum_out_1_07_reg_126 <= accum_out_1_1_fu_360_p3;
        accum_out_2_05_reg_150 <= accum_out_2_1_fu_323_p3;
        accum_out_3_04_reg_162 <= accum_out_3_1_fu_315_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln105_reg_397 <= icmp_ln105_fu_184_p2;
        icmp_ln105_reg_397_pp0_iter1_reg <= icmp_ln105_reg_397;
        trunc_ln106_reg_401_pp0_iter1_reg <= trunc_ln106_reg_401;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln105_reg_397_pp0_iter2_reg <= icmp_ln105_reg_397_pp0_iter1_reg;
        icmp_ln105_reg_397_pp0_iter3_reg <= icmp_ln105_reg_397_pp0_iter2_reg;
        icmp_ln105_reg_397_pp0_iter4_reg <= icmp_ln105_reg_397_pp0_iter3_reg;
        icmp_ln105_reg_397_pp0_iter5_reg <= icmp_ln105_reg_397_pp0_iter4_reg;
        icmp_ln105_reg_397_pp0_iter6_reg <= icmp_ln105_reg_397_pp0_iter5_reg;
        icmp_ln105_reg_397_pp0_iter7_reg <= icmp_ln105_reg_397_pp0_iter6_reg;
        icmp_ln105_reg_397_pp0_iter8_reg <= icmp_ln105_reg_397_pp0_iter7_reg;
        icmp_ln105_reg_397_pp0_iter9_reg <= icmp_ln105_reg_397_pp0_iter8_reg;
        trunc_ln106_reg_401_pp0_iter2_reg <= trunc_ln106_reg_401_pp0_iter1_reg;
        trunc_ln106_reg_401_pp0_iter3_reg <= trunc_ln106_reg_401_pp0_iter2_reg;
        trunc_ln106_reg_401_pp0_iter4_reg <= trunc_ln106_reg_401_pp0_iter3_reg;
        trunc_ln106_reg_401_pp0_iter5_reg <= trunc_ln106_reg_401_pp0_iter4_reg;
        trunc_ln106_reg_401_pp0_iter6_reg <= trunc_ln106_reg_401_pp0_iter5_reg;
        trunc_ln106_reg_401_pp0_iter7_reg <= trunc_ln106_reg_401_pp0_iter6_reg;
        trunc_ln106_reg_401_pp0_iter8_reg <= trunc_ln106_reg_401_pp0_iter7_reg;
        trunc_ln106_reg_401_pp0_iter9_reg <= trunc_ln106_reg_401_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln115_reg_413 <= icmp_ln115_fu_211_p2;
        trunc_ln106_reg_401 <= trunc_ln106_fu_190_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln115_reg_448 <= select_ln115_fu_278_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_453 <= grp_fu_174_p2;
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
    if (((icmp_ln105_fu_184_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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

assign accum_in_address0 = zext_ln115_1_fu_217_p1;

assign accum_in_address1 = zext_ln115_fu_200_p1;

assign accum_out_0_1_fu_345_p3 = ((icmp_ln118_2_fu_310_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_3_fu_337_p3);

assign accum_out_1_1_fu_360_p3 = ((icmp_ln118_2_fu_310_p2[0:0] == 1'b1) ? accum_out_1_07_reg_126 : select_ln118_4_fu_353_p3);

assign accum_out_2_1_fu_323_p3 = ((icmp_ln118_2_fu_310_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_2_05_reg_150);

assign accum_out_3_1_fu_315_p3 = ((icmp_ln118_2_fu_310_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_1_fu_302_p3);

assign add_ln119_fu_178_p2 = (out_idx_reg_115 + 3'd1);

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

assign ap_return_0 = accum_out_0_06_reg_138;

assign ap_return_1 = accum_out_1_07_reg_126;

assign ap_return_2 = accum_out_2_05_reg_150;

assign ap_return_3 = accum_out_3_04_reg_162;

assign i_12_fu_194_p2 = out_idx_reg_115 << 3'd1;

assign icmp_ln105_fu_184_p2 = ((out_idx_reg_115 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln115_fu_211_p2 = ((or_ln115_fu_205_p2 == 3'd7) ? 1'b1 : 1'b0);

assign icmp_ln118_1_fu_297_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln118_2_fu_310_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln118_fu_285_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln115_fu_205_p2 = (i_12_fu_194_p2 | 3'd1);

assign select_ln115_fu_278_p3 = ((icmp_ln115_reg_413[0:0] == 1'b1) ? 16'd0 : accum_in_q0);

assign select_ln118_1_fu_302_p3 = ((icmp_ln118_1_fu_297_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_fu_290_p3);

assign select_ln118_2_fu_330_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_0_06_reg_138);

assign select_ln118_3_fu_337_p3 = ((icmp_ln118_1_fu_297_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_2_fu_330_p3);

assign select_ln118_4_fu_353_p3 = ((icmp_ln118_1_fu_297_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_1_07_reg_126);

assign select_ln118_fu_290_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : sum0_reg_453);

assign trunc_ln106_fu_190_p1 = out_idx_reg_115[1:0];

assign zext_ln115_1_fu_217_p1 = or_ln115_fu_205_p2;

assign zext_ln115_fu_200_p1 = i_12_fu_194_p2;

endmodule //td_fused_top_tdf1_accum_3_3
module td_fused_top_tdf1_accum_3_2 (
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
reg   [0:0] write_flag3_0_reg_71;
reg   [0:0] write_flag6_0_reg_82;
reg   [0:0] write_flag9_0_reg_93;
reg   [0:0] write_flag_0_reg_104;
reg   [2:0] out_idx_reg_115;
reg   [15:0] accum_out_1_07_reg_126;
reg   [15:0] accum_out_0_06_reg_138;
reg   [15:0] accum_out_2_05_reg_150;
reg   [15:0] accum_out_3_04_reg_162;
wire   [2:0] add_ln119_fu_178_p2;
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
wire   [0:0] icmp_ln105_fu_184_p2;
reg   [0:0] icmp_ln105_reg_397;
reg   [0:0] icmp_ln105_reg_397_pp0_iter1_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter2_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter3_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter4_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter5_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter6_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter7_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter8_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter9_reg;
wire   [1:0] trunc_ln106_fu_190_p1;
reg   [1:0] trunc_ln106_reg_401;
reg   [1:0] trunc_ln106_reg_401_pp0_iter1_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter2_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter3_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter4_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter5_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter6_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter7_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter8_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter9_reg;
wire   [0:0] icmp_ln115_fu_211_p2;
reg   [0:0] icmp_ln115_reg_413;
wire   [0:0] write_flag_1_fu_222_p6;
wire   [0:0] write_flag9_1_fu_236_p6;
wire   [0:0] write_flag6_1_fu_250_p6;
wire   [0:0] write_flag3_1_fu_264_p6;
reg   [15:0] accum_in_load_reg_443;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] select_ln115_fu_278_p3;
reg   [15:0] select_ln115_reg_448;
wire   [15:0] grp_fu_174_p2;
reg   [15:0] sum0_reg_453;
wire   [15:0] accum_out_3_1_fu_315_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_323_p3;
wire   [15:0] accum_out_0_1_fu_345_p3;
wire   [15:0] accum_out_1_1_fu_360_p3;
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
wire   [63:0] zext_ln115_fu_200_p1;
wire   [63:0] zext_ln115_1_fu_217_p1;
wire   [2:0] i_12_fu_194_p2;
wire   [2:0] or_ln115_fu_205_p2;
wire   [0:0] icmp_ln118_fu_285_p2;
wire   [0:0] icmp_ln118_3_fu_297_p2;
wire   [15:0] select_ln118_fu_290_p3;
wire   [0:0] icmp_ln118_4_fu_310_p2;
wire   [15:0] select_ln118_5_fu_302_p3;
wire   [15:0] select_ln118_6_fu_330_p3;
wire   [15:0] select_ln118_7_fu_337_p3;
wire   [15:0] select_ln118_8_fu_353_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U68(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln115_reg_448),
    .din1(accum_in_load_reg_443),
    .dout(grp_fu_174_p2)
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
mux_42_1_1_1_U69(
    .din0(1'd1),
    .din1(write_flag_0_reg_104),
    .din2(write_flag_0_reg_104),
    .din3(write_flag_0_reg_104),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag_1_fu_222_p6)
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
mux_42_1_1_1_U70(
    .din0(write_flag9_0_reg_93),
    .din1(write_flag9_0_reg_93),
    .din2(write_flag9_0_reg_93),
    .din3(1'd1),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag9_1_fu_236_p6)
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
mux_42_1_1_1_U71(
    .din0(write_flag6_0_reg_82),
    .din1(write_flag6_0_reg_82),
    .din2(1'd1),
    .din3(write_flag6_0_reg_82),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag6_1_fu_250_p6)
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
mux_42_1_1_1_U72(
    .din0(write_flag3_0_reg_71),
    .din1(1'd1),
    .din2(write_flag3_0_reg_71),
    .din3(write_flag3_0_reg_71),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag3_1_fu_264_p6)
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter8 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter9_state11)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_115 <= add_ln119_fu_178_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_115 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_71 <= write_flag3_1_fu_264_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_71 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_82 <= write_flag6_1_fu_250_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_82 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_93 <= write_flag9_1_fu_236_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_93 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_104 <= write_flag_1_fu_222_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_104 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_reg_443 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_138 <= accum_out_0_1_fu_345_p3;
        accum_out_1_07_reg_126 <= accum_out_1_1_fu_360_p3;
        accum_out_2_05_reg_150 <= accum_out_2_1_fu_323_p3;
        accum_out_3_04_reg_162 <= accum_out_3_1_fu_315_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln105_reg_397 <= icmp_ln105_fu_184_p2;
        icmp_ln105_reg_397_pp0_iter1_reg <= icmp_ln105_reg_397;
        trunc_ln106_reg_401_pp0_iter1_reg <= trunc_ln106_reg_401;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln105_reg_397_pp0_iter2_reg <= icmp_ln105_reg_397_pp0_iter1_reg;
        icmp_ln105_reg_397_pp0_iter3_reg <= icmp_ln105_reg_397_pp0_iter2_reg;
        icmp_ln105_reg_397_pp0_iter4_reg <= icmp_ln105_reg_397_pp0_iter3_reg;
        icmp_ln105_reg_397_pp0_iter5_reg <= icmp_ln105_reg_397_pp0_iter4_reg;
        icmp_ln105_reg_397_pp0_iter6_reg <= icmp_ln105_reg_397_pp0_iter5_reg;
        icmp_ln105_reg_397_pp0_iter7_reg <= icmp_ln105_reg_397_pp0_iter6_reg;
        icmp_ln105_reg_397_pp0_iter8_reg <= icmp_ln105_reg_397_pp0_iter7_reg;
        icmp_ln105_reg_397_pp0_iter9_reg <= icmp_ln105_reg_397_pp0_iter8_reg;
        trunc_ln106_reg_401_pp0_iter2_reg <= trunc_ln106_reg_401_pp0_iter1_reg;
        trunc_ln106_reg_401_pp0_iter3_reg <= trunc_ln106_reg_401_pp0_iter2_reg;
        trunc_ln106_reg_401_pp0_iter4_reg <= trunc_ln106_reg_401_pp0_iter3_reg;
        trunc_ln106_reg_401_pp0_iter5_reg <= trunc_ln106_reg_401_pp0_iter4_reg;
        trunc_ln106_reg_401_pp0_iter6_reg <= trunc_ln106_reg_401_pp0_iter5_reg;
        trunc_ln106_reg_401_pp0_iter7_reg <= trunc_ln106_reg_401_pp0_iter6_reg;
        trunc_ln106_reg_401_pp0_iter8_reg <= trunc_ln106_reg_401_pp0_iter7_reg;
        trunc_ln106_reg_401_pp0_iter9_reg <= trunc_ln106_reg_401_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln115_reg_413 <= icmp_ln115_fu_211_p2;
        trunc_ln106_reg_401 <= trunc_ln106_fu_190_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln115_reg_448 <= select_ln115_fu_278_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_453 <= grp_fu_174_p2;
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
    if (((icmp_ln105_fu_184_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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

assign accum_in_address0 = zext_ln115_1_fu_217_p1;

assign accum_in_address1 = zext_ln115_fu_200_p1;

assign accum_out_0_1_fu_345_p3 = ((icmp_ln118_4_fu_310_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_7_fu_337_p3);

assign accum_out_1_1_fu_360_p3 = ((icmp_ln118_4_fu_310_p2[0:0] == 1'b1) ? accum_out_1_07_reg_126 : select_ln118_8_fu_353_p3);

assign accum_out_2_1_fu_323_p3 = ((icmp_ln118_4_fu_310_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_2_05_reg_150);

assign accum_out_3_1_fu_315_p3 = ((icmp_ln118_4_fu_310_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_5_fu_302_p3);

assign add_ln119_fu_178_p2 = (out_idx_reg_115 + 3'd1);

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

assign ap_return_0 = accum_out_0_06_reg_138;

assign ap_return_1 = accum_out_1_07_reg_126;

assign ap_return_2 = accum_out_2_05_reg_150;

assign ap_return_3 = accum_out_3_04_reg_162;

assign i_12_fu_194_p2 = out_idx_reg_115 << 3'd1;

assign icmp_ln105_fu_184_p2 = ((out_idx_reg_115 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln115_fu_211_p2 = ((or_ln115_fu_205_p2 == 3'd7) ? 1'b1 : 1'b0);

assign icmp_ln118_3_fu_297_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln118_4_fu_310_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln118_fu_285_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln115_fu_205_p2 = (i_12_fu_194_p2 | 3'd1);

assign select_ln115_fu_278_p3 = ((icmp_ln115_reg_413[0:0] == 1'b1) ? 16'd0 : accum_in_q0);

assign select_ln118_5_fu_302_p3 = ((icmp_ln118_3_fu_297_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_fu_290_p3);

assign select_ln118_6_fu_330_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_0_06_reg_138);

assign select_ln118_7_fu_337_p3 = ((icmp_ln118_3_fu_297_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_6_fu_330_p3);

assign select_ln118_8_fu_353_p3 = ((icmp_ln118_3_fu_297_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_1_07_reg_126);

assign select_ln118_fu_290_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : sum0_reg_453);

assign trunc_ln106_fu_190_p1 = out_idx_reg_115[1:0];

assign zext_ln115_1_fu_217_p1 = or_ln115_fu_205_p2;

assign zext_ln115_fu_200_p1 = i_12_fu_194_p2;

endmodule //td_fused_top_tdf1_accum_3_2
module td_fused_top_tdf1_accum_3_1 (
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
reg   [0:0] write_flag3_0_reg_71;
reg   [0:0] write_flag6_0_reg_82;
reg   [0:0] write_flag9_0_reg_93;
reg   [0:0] write_flag_0_reg_104;
reg   [2:0] out_idx_reg_115;
reg   [15:0] accum_out_1_07_reg_126;
reg   [15:0] accum_out_0_06_reg_138;
reg   [15:0] accum_out_2_05_reg_150;
reg   [15:0] accum_out_3_04_reg_162;
wire   [2:0] add_ln119_fu_178_p2;
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
wire   [0:0] icmp_ln105_fu_184_p2;
reg   [0:0] icmp_ln105_reg_397;
reg   [0:0] icmp_ln105_reg_397_pp0_iter1_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter2_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter3_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter4_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter5_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter6_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter7_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter8_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter9_reg;
wire   [1:0] trunc_ln106_fu_190_p1;
reg   [1:0] trunc_ln106_reg_401;
reg   [1:0] trunc_ln106_reg_401_pp0_iter1_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter2_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter3_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter4_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter5_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter6_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter7_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter8_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter9_reg;
wire   [0:0] icmp_ln115_fu_211_p2;
reg   [0:0] icmp_ln115_reg_413;
wire   [0:0] write_flag_1_fu_222_p6;
wire   [0:0] write_flag9_1_fu_236_p6;
wire   [0:0] write_flag6_1_fu_250_p6;
wire   [0:0] write_flag3_1_fu_264_p6;
reg   [15:0] accum_in_load_reg_443;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] select_ln115_fu_278_p3;
reg   [15:0] select_ln115_reg_448;
wire   [15:0] grp_fu_174_p2;
reg   [15:0] sum0_reg_453;
wire   [15:0] accum_out_3_1_fu_315_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_323_p3;
wire   [15:0] accum_out_0_1_fu_345_p3;
wire   [15:0] accum_out_1_1_fu_360_p3;
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
wire   [63:0] zext_ln115_fu_200_p1;
wire   [63:0] zext_ln115_1_fu_217_p1;
wire   [2:0] i_12_fu_194_p2;
wire   [2:0] or_ln115_fu_205_p2;
wire   [0:0] icmp_ln118_fu_285_p2;
wire   [0:0] icmp_ln118_5_fu_297_p2;
wire   [15:0] select_ln118_fu_290_p3;
wire   [0:0] icmp_ln118_6_fu_310_p2;
wire   [15:0] select_ln118_9_fu_302_p3;
wire   [15:0] select_ln118_10_fu_330_p3;
wire   [15:0] select_ln118_11_fu_337_p3;
wire   [15:0] select_ln118_12_fu_353_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U62(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln115_reg_448),
    .din1(accum_in_load_reg_443),
    .dout(grp_fu_174_p2)
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
mux_42_1_1_1_U63(
    .din0(1'd1),
    .din1(write_flag_0_reg_104),
    .din2(write_flag_0_reg_104),
    .din3(write_flag_0_reg_104),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag_1_fu_222_p6)
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
mux_42_1_1_1_U64(
    .din0(write_flag9_0_reg_93),
    .din1(write_flag9_0_reg_93),
    .din2(write_flag9_0_reg_93),
    .din3(1'd1),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag9_1_fu_236_p6)
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
mux_42_1_1_1_U65(
    .din0(write_flag6_0_reg_82),
    .din1(write_flag6_0_reg_82),
    .din2(1'd1),
    .din3(write_flag6_0_reg_82),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag6_1_fu_250_p6)
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
mux_42_1_1_1_U66(
    .din0(write_flag3_0_reg_71),
    .din1(1'd1),
    .din2(write_flag3_0_reg_71),
    .din3(write_flag3_0_reg_71),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag3_1_fu_264_p6)
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter8 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter9_state11)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_115 <= add_ln119_fu_178_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_115 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_71 <= write_flag3_1_fu_264_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_71 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_82 <= write_flag6_1_fu_250_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_82 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_93 <= write_flag9_1_fu_236_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_93 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_104 <= write_flag_1_fu_222_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_104 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_reg_443 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_138 <= accum_out_0_1_fu_345_p3;
        accum_out_1_07_reg_126 <= accum_out_1_1_fu_360_p3;
        accum_out_2_05_reg_150 <= accum_out_2_1_fu_323_p3;
        accum_out_3_04_reg_162 <= accum_out_3_1_fu_315_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln105_reg_397 <= icmp_ln105_fu_184_p2;
        icmp_ln105_reg_397_pp0_iter1_reg <= icmp_ln105_reg_397;
        trunc_ln106_reg_401_pp0_iter1_reg <= trunc_ln106_reg_401;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln105_reg_397_pp0_iter2_reg <= icmp_ln105_reg_397_pp0_iter1_reg;
        icmp_ln105_reg_397_pp0_iter3_reg <= icmp_ln105_reg_397_pp0_iter2_reg;
        icmp_ln105_reg_397_pp0_iter4_reg <= icmp_ln105_reg_397_pp0_iter3_reg;
        icmp_ln105_reg_397_pp0_iter5_reg <= icmp_ln105_reg_397_pp0_iter4_reg;
        icmp_ln105_reg_397_pp0_iter6_reg <= icmp_ln105_reg_397_pp0_iter5_reg;
        icmp_ln105_reg_397_pp0_iter7_reg <= icmp_ln105_reg_397_pp0_iter6_reg;
        icmp_ln105_reg_397_pp0_iter8_reg <= icmp_ln105_reg_397_pp0_iter7_reg;
        icmp_ln105_reg_397_pp0_iter9_reg <= icmp_ln105_reg_397_pp0_iter8_reg;
        trunc_ln106_reg_401_pp0_iter2_reg <= trunc_ln106_reg_401_pp0_iter1_reg;
        trunc_ln106_reg_401_pp0_iter3_reg <= trunc_ln106_reg_401_pp0_iter2_reg;
        trunc_ln106_reg_401_pp0_iter4_reg <= trunc_ln106_reg_401_pp0_iter3_reg;
        trunc_ln106_reg_401_pp0_iter5_reg <= trunc_ln106_reg_401_pp0_iter4_reg;
        trunc_ln106_reg_401_pp0_iter6_reg <= trunc_ln106_reg_401_pp0_iter5_reg;
        trunc_ln106_reg_401_pp0_iter7_reg <= trunc_ln106_reg_401_pp0_iter6_reg;
        trunc_ln106_reg_401_pp0_iter8_reg <= trunc_ln106_reg_401_pp0_iter7_reg;
        trunc_ln106_reg_401_pp0_iter9_reg <= trunc_ln106_reg_401_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln115_reg_413 <= icmp_ln115_fu_211_p2;
        trunc_ln106_reg_401 <= trunc_ln106_fu_190_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln115_reg_448 <= select_ln115_fu_278_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_453 <= grp_fu_174_p2;
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
    if (((icmp_ln105_fu_184_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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

assign accum_in_address0 = zext_ln115_1_fu_217_p1;

assign accum_in_address1 = zext_ln115_fu_200_p1;

assign accum_out_0_1_fu_345_p3 = ((icmp_ln118_6_fu_310_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_11_fu_337_p3);

assign accum_out_1_1_fu_360_p3 = ((icmp_ln118_6_fu_310_p2[0:0] == 1'b1) ? accum_out_1_07_reg_126 : select_ln118_12_fu_353_p3);

assign accum_out_2_1_fu_323_p3 = ((icmp_ln118_6_fu_310_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_2_05_reg_150);

assign accum_out_3_1_fu_315_p3 = ((icmp_ln118_6_fu_310_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_9_fu_302_p3);

assign add_ln119_fu_178_p2 = (out_idx_reg_115 + 3'd1);

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

assign ap_return_0 = accum_out_0_06_reg_138;

assign ap_return_1 = accum_out_1_07_reg_126;

assign ap_return_2 = accum_out_2_05_reg_150;

assign ap_return_3 = accum_out_3_04_reg_162;

assign i_12_fu_194_p2 = out_idx_reg_115 << 3'd1;

assign icmp_ln105_fu_184_p2 = ((out_idx_reg_115 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln115_fu_211_p2 = ((or_ln115_fu_205_p2 == 3'd7) ? 1'b1 : 1'b0);

assign icmp_ln118_5_fu_297_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln118_6_fu_310_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln118_fu_285_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln115_fu_205_p2 = (i_12_fu_194_p2 | 3'd1);

assign select_ln115_fu_278_p3 = ((icmp_ln115_reg_413[0:0] == 1'b1) ? 16'd0 : accum_in_q0);

assign select_ln118_10_fu_330_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_0_06_reg_138);

assign select_ln118_11_fu_337_p3 = ((icmp_ln118_5_fu_297_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_10_fu_330_p3);

assign select_ln118_12_fu_353_p3 = ((icmp_ln118_5_fu_297_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_1_07_reg_126);

assign select_ln118_9_fu_302_p3 = ((icmp_ln118_5_fu_297_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_fu_290_p3);

assign select_ln118_fu_290_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : sum0_reg_453);

assign trunc_ln106_fu_190_p1 = out_idx_reg_115[1:0];

assign zext_ln115_1_fu_217_p1 = or_ln115_fu_205_p2;

assign zext_ln115_fu_200_p1 = i_12_fu_194_p2;

endmodule //td_fused_top_tdf1_accum_3_1
module td_fused_top_tdf1_accum_3 (
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
reg   [0:0] write_flag3_0_reg_71;
reg   [0:0] write_flag6_0_reg_82;
reg   [0:0] write_flag9_0_reg_93;
reg   [0:0] write_flag_0_reg_104;
reg   [2:0] out_idx_reg_115;
reg   [15:0] accum_out_1_07_reg_126;
reg   [15:0] accum_out_0_06_reg_138;
reg   [15:0] accum_out_2_05_reg_150;
reg   [15:0] accum_out_3_04_reg_162;
wire   [2:0] add_ln119_fu_178_p2;
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
wire   [0:0] icmp_ln105_fu_184_p2;
reg   [0:0] icmp_ln105_reg_397;
reg   [0:0] icmp_ln105_reg_397_pp0_iter1_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter2_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter3_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter4_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter5_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter6_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter7_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter8_reg;
reg   [0:0] icmp_ln105_reg_397_pp0_iter9_reg;
wire   [1:0] trunc_ln106_fu_190_p1;
reg   [1:0] trunc_ln106_reg_401;
reg   [1:0] trunc_ln106_reg_401_pp0_iter1_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter2_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter3_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter4_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter5_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter6_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter7_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter8_reg;
reg   [1:0] trunc_ln106_reg_401_pp0_iter9_reg;
wire   [0:0] icmp_ln115_fu_211_p2;
reg   [0:0] icmp_ln115_reg_413;
wire   [0:0] write_flag_1_fu_222_p6;
wire   [0:0] write_flag9_1_fu_236_p6;
wire   [0:0] write_flag6_1_fu_250_p6;
wire   [0:0] write_flag3_1_fu_264_p6;
reg   [15:0] accum_in_load_reg_443;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] select_ln115_fu_278_p3;
reg   [15:0] select_ln115_reg_448;
wire   [15:0] grp_fu_174_p2;
reg   [15:0] sum0_reg_453;
wire   [15:0] accum_out_3_1_fu_315_p3;
reg    ap_enable_reg_pp0_iter10;
wire   [15:0] accum_out_2_1_fu_323_p3;
wire   [15:0] accum_out_0_1_fu_345_p3;
wire   [15:0] accum_out_1_1_fu_360_p3;
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
wire   [63:0] zext_ln115_fu_200_p1;
wire   [63:0] zext_ln115_1_fu_217_p1;
wire   [2:0] i_12_fu_194_p2;
wire   [2:0] or_ln115_fu_205_p2;
wire   [0:0] icmp_ln118_fu_285_p2;
wire   [0:0] icmp_ln118_7_fu_297_p2;
wire   [15:0] select_ln118_fu_290_p3;
wire   [0:0] icmp_ln118_8_fu_310_p2;
wire   [15:0] select_ln118_13_fu_302_p3;
wire   [15:0] select_ln118_14_fu_330_p3;
wire   [15:0] select_ln118_15_fu_337_p3;
wire   [15:0] select_ln118_16_fu_353_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U52(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln115_reg_448),
    .din1(accum_in_load_reg_443),
    .dout(grp_fu_174_p2)
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
mux_42_1_1_1_U53(
    .din0(1'd1),
    .din1(write_flag_0_reg_104),
    .din2(write_flag_0_reg_104),
    .din3(write_flag_0_reg_104),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag_1_fu_222_p6)
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
mux_42_1_1_1_U54(
    .din0(write_flag9_0_reg_93),
    .din1(write_flag9_0_reg_93),
    .din2(write_flag9_0_reg_93),
    .din3(1'd1),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag9_1_fu_236_p6)
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
mux_42_1_1_1_U55(
    .din0(write_flag6_0_reg_82),
    .din1(write_flag6_0_reg_82),
    .din2(1'd1),
    .din3(write_flag6_0_reg_82),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag6_1_fu_250_p6)
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
mux_42_1_1_1_U56(
    .din0(write_flag3_0_reg_71),
    .din1(1'd1),
    .din2(write_flag3_0_reg_71),
    .din3(write_flag3_0_reg_71),
    .din4(trunc_ln106_fu_190_p1),
    .dout(write_flag3_1_fu_264_p6)
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter8 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter9_state11)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter9 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_115 <= add_ln119_fu_178_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_115 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag3_0_reg_71 <= write_flag3_1_fu_264_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag3_0_reg_71 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag6_0_reg_82 <= write_flag6_1_fu_250_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag6_0_reg_82 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag9_0_reg_93 <= write_flag9_1_fu_236_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag9_0_reg_93 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        write_flag_0_reg_104 <= write_flag_1_fu_222_p6;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        write_flag_0_reg_104 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_reg_443 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_0_06_reg_138 <= accum_out_0_1_fu_345_p3;
        accum_out_1_07_reg_126 <= accum_out_1_1_fu_360_p3;
        accum_out_2_05_reg_150 <= accum_out_2_1_fu_323_p3;
        accum_out_3_04_reg_162 <= accum_out_3_1_fu_315_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln105_reg_397 <= icmp_ln105_fu_184_p2;
        icmp_ln105_reg_397_pp0_iter1_reg <= icmp_ln105_reg_397;
        trunc_ln106_reg_401_pp0_iter1_reg <= trunc_ln106_reg_401;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln105_reg_397_pp0_iter2_reg <= icmp_ln105_reg_397_pp0_iter1_reg;
        icmp_ln105_reg_397_pp0_iter3_reg <= icmp_ln105_reg_397_pp0_iter2_reg;
        icmp_ln105_reg_397_pp0_iter4_reg <= icmp_ln105_reg_397_pp0_iter3_reg;
        icmp_ln105_reg_397_pp0_iter5_reg <= icmp_ln105_reg_397_pp0_iter4_reg;
        icmp_ln105_reg_397_pp0_iter6_reg <= icmp_ln105_reg_397_pp0_iter5_reg;
        icmp_ln105_reg_397_pp0_iter7_reg <= icmp_ln105_reg_397_pp0_iter6_reg;
        icmp_ln105_reg_397_pp0_iter8_reg <= icmp_ln105_reg_397_pp0_iter7_reg;
        icmp_ln105_reg_397_pp0_iter9_reg <= icmp_ln105_reg_397_pp0_iter8_reg;
        trunc_ln106_reg_401_pp0_iter2_reg <= trunc_ln106_reg_401_pp0_iter1_reg;
        trunc_ln106_reg_401_pp0_iter3_reg <= trunc_ln106_reg_401_pp0_iter2_reg;
        trunc_ln106_reg_401_pp0_iter4_reg <= trunc_ln106_reg_401_pp0_iter3_reg;
        trunc_ln106_reg_401_pp0_iter5_reg <= trunc_ln106_reg_401_pp0_iter4_reg;
        trunc_ln106_reg_401_pp0_iter6_reg <= trunc_ln106_reg_401_pp0_iter5_reg;
        trunc_ln106_reg_401_pp0_iter7_reg <= trunc_ln106_reg_401_pp0_iter6_reg;
        trunc_ln106_reg_401_pp0_iter8_reg <= trunc_ln106_reg_401_pp0_iter7_reg;
        trunc_ln106_reg_401_pp0_iter9_reg <= trunc_ln106_reg_401_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_fu_184_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln115_reg_413 <= icmp_ln115_fu_211_p2;
        trunc_ln106_reg_401 <= trunc_ln106_fu_190_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln115_reg_448 <= select_ln115_fu_278_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln105_reg_397_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_453 <= grp_fu_174_p2;
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
    if (((icmp_ln105_fu_184_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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

assign accum_in_address0 = zext_ln115_1_fu_217_p1;

assign accum_in_address1 = zext_ln115_fu_200_p1;

assign accum_out_0_1_fu_345_p3 = ((icmp_ln118_8_fu_310_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_15_fu_337_p3);

assign accum_out_1_1_fu_360_p3 = ((icmp_ln118_8_fu_310_p2[0:0] == 1'b1) ? accum_out_1_07_reg_126 : select_ln118_16_fu_353_p3);

assign accum_out_2_1_fu_323_p3 = ((icmp_ln118_8_fu_310_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_2_05_reg_150);

assign accum_out_3_1_fu_315_p3 = ((icmp_ln118_8_fu_310_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_13_fu_302_p3);

assign add_ln119_fu_178_p2 = (out_idx_reg_115 + 3'd1);

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

assign ap_return_0 = accum_out_0_06_reg_138;

assign ap_return_1 = accum_out_1_07_reg_126;

assign ap_return_2 = accum_out_2_05_reg_150;

assign ap_return_3 = accum_out_3_04_reg_162;

assign i_12_fu_194_p2 = out_idx_reg_115 << 3'd1;

assign icmp_ln105_fu_184_p2 = ((out_idx_reg_115 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln115_fu_211_p2 = ((or_ln115_fu_205_p2 == 3'd7) ? 1'b1 : 1'b0);

assign icmp_ln118_7_fu_297_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln118_8_fu_310_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln118_fu_285_p2 = ((trunc_ln106_reg_401_pp0_iter9_reg == 2'd0) ? 1'b1 : 1'b0);

assign or_ln115_fu_205_p2 = (i_12_fu_194_p2 | 3'd1);

assign select_ln115_fu_278_p3 = ((icmp_ln115_reg_413[0:0] == 1'b1) ? 16'd0 : accum_in_q0);

assign select_ln118_13_fu_302_p3 = ((icmp_ln118_7_fu_297_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : select_ln118_fu_290_p3);

assign select_ln118_14_fu_330_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_0_06_reg_138);

assign select_ln118_15_fu_337_p3 = ((icmp_ln118_7_fu_297_p2[0:0] == 1'b1) ? accum_out_0_06_reg_138 : select_ln118_14_fu_330_p3);

assign select_ln118_16_fu_353_p3 = ((icmp_ln118_7_fu_297_p2[0:0] == 1'b1) ? sum0_reg_453 : accum_out_1_07_reg_126);

assign select_ln118_fu_290_p3 = ((icmp_ln118_fu_285_p2[0:0] == 1'b1) ? accum_out_3_04_reg_162 : sum0_reg_453);

assign trunc_ln106_fu_190_p1 = out_idx_reg_115[1:0];

assign zext_ln115_1_fu_217_p1 = or_ln115_fu_205_p2;

assign zext_ln115_fu_200_p1 = i_12_fu_194_p2;

endmodule //td_fused_top_tdf1_accum_3
module td_fused_top_tdf1_accum_2 (
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
        accum_out_d0
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
output  [3:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [3:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [2:0] accum_out_address0;
output   accum_out_ce0;
output   accum_out_we0;
output  [15:0] accum_out_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;
reg accum_out_ce0;
reg accum_out_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [2:0] out_idx_reg_72;
reg   [2:0] out_idx_reg_72_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage0;
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
reg   [2:0] out_idx_reg_72_pp0_iter2_reg;
reg   [2:0] out_idx_reg_72_pp0_iter3_reg;
reg   [2:0] out_idx_reg_72_pp0_iter4_reg;
reg   [2:0] out_idx_reg_72_pp0_iter5_reg;
reg   [2:0] out_idx_reg_72_pp0_iter6_reg;
reg   [2:0] out_idx_reg_72_pp0_iter7_reg;
reg   [2:0] out_idx_reg_72_pp0_iter8_reg;
reg   [2:0] out_idx_reg_72_pp0_iter9_reg;
wire   [2:0] add_ln89_fu_88_p2;
reg   [2:0] add_ln89_reg_129;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln75_fu_94_p2;
reg   [0:0] icmp_ln75_reg_134;
reg   [0:0] icmp_ln75_reg_134_pp0_iter1_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter2_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter3_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter4_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter5_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter6_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter7_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter8_reg;
reg   [0:0] icmp_ln75_reg_134_pp0_iter9_reg;
reg   [15:0] accum_in_load_reg_148;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_153;
wire   [15:0] grp_fu_84_p2;
reg   [15:0] sum0_reg_158;
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
reg   [2:0] ap_phi_mux_out_idx_phi_fu_76_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln85_fu_108_p1;
wire   [63:0] zext_ln85_1_fu_119_p1;
wire   [63:0] zext_ln75_fu_124_p1;
wire   [3:0] i_1_1_fu_100_p3;
wire   [3:0] or_ln85_fu_113_p2;
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
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U49(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_153),
    .din1(accum_in_load_reg_148),
    .dout(grp_fu_84_p2)
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
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
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_72 <= 3'd0;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln75_reg_134 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_72 <= add_ln89_reg_129;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln75_reg_134 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_load_1_reg_153 <= accum_in_q0;
        accum_in_load_reg_148 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln89_reg_129 <= add_ln89_fu_88_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln75_reg_134 <= icmp_ln75_fu_94_p2;
        icmp_ln75_reg_134_pp0_iter1_reg <= icmp_ln75_reg_134;
        out_idx_reg_72_pp0_iter1_reg <= out_idx_reg_72;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln75_reg_134_pp0_iter2_reg <= icmp_ln75_reg_134_pp0_iter1_reg;
        icmp_ln75_reg_134_pp0_iter3_reg <= icmp_ln75_reg_134_pp0_iter2_reg;
        icmp_ln75_reg_134_pp0_iter4_reg <= icmp_ln75_reg_134_pp0_iter3_reg;
        icmp_ln75_reg_134_pp0_iter5_reg <= icmp_ln75_reg_134_pp0_iter4_reg;
        icmp_ln75_reg_134_pp0_iter6_reg <= icmp_ln75_reg_134_pp0_iter5_reg;
        icmp_ln75_reg_134_pp0_iter7_reg <= icmp_ln75_reg_134_pp0_iter6_reg;
        icmp_ln75_reg_134_pp0_iter8_reg <= icmp_ln75_reg_134_pp0_iter7_reg;
        icmp_ln75_reg_134_pp0_iter9_reg <= icmp_ln75_reg_134_pp0_iter8_reg;
        out_idx_reg_72_pp0_iter2_reg <= out_idx_reg_72_pp0_iter1_reg;
        out_idx_reg_72_pp0_iter3_reg <= out_idx_reg_72_pp0_iter2_reg;
        out_idx_reg_72_pp0_iter4_reg <= out_idx_reg_72_pp0_iter3_reg;
        out_idx_reg_72_pp0_iter5_reg <= out_idx_reg_72_pp0_iter4_reg;
        out_idx_reg_72_pp0_iter6_reg <= out_idx_reg_72_pp0_iter5_reg;
        out_idx_reg_72_pp0_iter7_reg <= out_idx_reg_72_pp0_iter6_reg;
        out_idx_reg_72_pp0_iter8_reg <= out_idx_reg_72_pp0_iter7_reg;
        out_idx_reg_72_pp0_iter9_reg <= out_idx_reg_72_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln75_reg_134_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_158 <= grp_fu_84_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln75_reg_134_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln75_fu_94_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln75_reg_134 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_out_idx_phi_fu_76_p4 = add_ln89_reg_129;
    end else begin
        ap_phi_mux_out_idx_phi_fu_76_p4 = out_idx_reg_72;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln75_fu_94_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln75_fu_94_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
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

assign accum_in_address0 = zext_ln85_1_fu_119_p1;

assign accum_in_address1 = zext_ln85_fu_108_p1;

assign accum_out_address0 = zext_ln75_fu_124_p1;

assign accum_out_d0 = sum0_reg_158;

assign add_ln89_fu_88_p2 = (ap_phi_mux_out_idx_phi_fu_76_p4 + 3'd1);

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

assign i_1_1_fu_100_p3 = {{ap_phi_mux_out_idx_phi_fu_76_p4}, {1'd0}};

assign icmp_ln75_fu_94_p2 = ((ap_phi_mux_out_idx_phi_fu_76_p4 == 3'd7) ? 1'b1 : 1'b0);

assign or_ln85_fu_113_p2 = (i_1_1_fu_100_p3 | 4'd1);

assign zext_ln75_fu_124_p1 = out_idx_reg_72_pp0_iter9_reg;

assign zext_ln85_1_fu_119_p1 = or_ln85_fu_113_p2;

assign zext_ln85_fu_108_p1 = i_1_1_fu_100_p3;

endmodule //td_fused_top_tdf1_accum_2
module td_fused_top_tdf1_accum_1 (
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
        accum_out_d0
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
output  [4:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [4:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [3:0] accum_out_address0;
output   accum_out_ce0;
output   accum_out_we0;
output  [15:0] accum_out_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg accum_in_ce0;
reg accum_in_ce1;
reg accum_out_ce0;
reg accum_out_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] out_idx_reg_76;
reg   [3:0] out_idx_reg_76_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage0;
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
reg   [3:0] out_idx_reg_76_pp0_iter2_reg;
reg   [3:0] out_idx_reg_76_pp0_iter3_reg;
reg   [3:0] out_idx_reg_76_pp0_iter4_reg;
reg   [3:0] out_idx_reg_76_pp0_iter5_reg;
reg   [3:0] out_idx_reg_76_pp0_iter6_reg;
reg   [3:0] out_idx_reg_76_pp0_iter7_reg;
reg   [3:0] out_idx_reg_76_pp0_iter8_reg;
reg   [3:0] out_idx_reg_76_pp0_iter9_reg;
wire   [3:0] add_ln59_fu_92_p2;
reg   [3:0] add_ln59_reg_146;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln45_fu_98_p2;
reg   [0:0] icmp_ln45_reg_151;
reg   [0:0] icmp_ln45_reg_151_pp0_iter1_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter2_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter3_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter4_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter5_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter6_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter7_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter8_reg;
reg   [0:0] icmp_ln45_reg_151_pp0_iter9_reg;
wire   [0:0] icmp_ln55_fu_123_p2;
reg   [0:0] icmp_ln55_reg_160;
reg   [15:0] accum_in_load_011_reg_170;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] select_ln55_fu_134_p3;
reg   [15:0] select_ln55_reg_175;
wire   [15:0] grp_fu_88_p2;
reg   [15:0] sum0_reg_180;
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
reg   [3:0] ap_phi_mux_out_idx_phi_fu_80_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln55_fu_112_p1;
wire   [63:0] zext_ln55_6_fu_129_p1;
wire   [63:0] zext_ln45_fu_141_p1;
wire   [4:0] i_1_1_fu_104_p3;
wire   [4:0] or_ln55_fu_117_p2;
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
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U45(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln55_reg_175),
    .din1(accum_in_load_011_reg_170),
    .dout(grp_fu_88_p2)
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
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
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_idx_reg_76 <= 4'd0;
    end else if (((icmp_ln45_reg_151 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        out_idx_reg_76 <= add_ln59_reg_146;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln45_reg_151 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        accum_in_load_011_reg_170 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln59_reg_146 <= add_ln59_fu_92_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln45_reg_151 <= icmp_ln45_fu_98_p2;
        icmp_ln45_reg_151_pp0_iter1_reg <= icmp_ln45_reg_151;
        out_idx_reg_76_pp0_iter1_reg <= out_idx_reg_76;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln45_reg_151_pp0_iter2_reg <= icmp_ln45_reg_151_pp0_iter1_reg;
        icmp_ln45_reg_151_pp0_iter3_reg <= icmp_ln45_reg_151_pp0_iter2_reg;
        icmp_ln45_reg_151_pp0_iter4_reg <= icmp_ln45_reg_151_pp0_iter3_reg;
        icmp_ln45_reg_151_pp0_iter5_reg <= icmp_ln45_reg_151_pp0_iter4_reg;
        icmp_ln45_reg_151_pp0_iter6_reg <= icmp_ln45_reg_151_pp0_iter5_reg;
        icmp_ln45_reg_151_pp0_iter7_reg <= icmp_ln45_reg_151_pp0_iter6_reg;
        icmp_ln45_reg_151_pp0_iter8_reg <= icmp_ln45_reg_151_pp0_iter7_reg;
        icmp_ln45_reg_151_pp0_iter9_reg <= icmp_ln45_reg_151_pp0_iter8_reg;
        out_idx_reg_76_pp0_iter2_reg <= out_idx_reg_76_pp0_iter1_reg;
        out_idx_reg_76_pp0_iter3_reg <= out_idx_reg_76_pp0_iter2_reg;
        out_idx_reg_76_pp0_iter4_reg <= out_idx_reg_76_pp0_iter3_reg;
        out_idx_reg_76_pp0_iter5_reg <= out_idx_reg_76_pp0_iter4_reg;
        out_idx_reg_76_pp0_iter6_reg <= out_idx_reg_76_pp0_iter5_reg;
        out_idx_reg_76_pp0_iter7_reg <= out_idx_reg_76_pp0_iter6_reg;
        out_idx_reg_76_pp0_iter8_reg <= out_idx_reg_76_pp0_iter7_reg;
        out_idx_reg_76_pp0_iter9_reg <= out_idx_reg_76_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln45_fu_98_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln55_reg_160 <= icmp_ln55_fu_123_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln45_reg_151 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln55_reg_175 <= select_ln55_fu_134_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln45_reg_151_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_180 <= grp_fu_88_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce0 = 1'b1;
    end else begin
        accum_in_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_ce1 = 1'b1;
    end else begin
        accum_in_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln45_reg_151_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln45_fu_98_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln45_reg_151 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_out_idx_phi_fu_80_p4 = add_ln59_reg_146;
    end else begin
        ap_phi_mux_out_idx_phi_fu_80_p4 = out_idx_reg_76;
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
            if ((~((icmp_ln45_fu_98_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((icmp_ln45_fu_98_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
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

assign accum_in_address0 = zext_ln55_6_fu_129_p1;

assign accum_in_address1 = zext_ln55_fu_112_p1;

assign accum_out_address0 = zext_ln45_fu_141_p1;

assign accum_out_d0 = sum0_reg_180;

assign add_ln59_fu_92_p2 = (ap_phi_mux_out_idx_phi_fu_80_p4 + 4'd1);

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

assign i_1_1_fu_104_p3 = {{ap_phi_mux_out_idx_phi_fu_80_p4}, {1'd0}};

assign icmp_ln45_fu_98_p2 = ((ap_phi_mux_out_idx_phi_fu_80_p4 == 4'd14) ? 1'b1 : 1'b0);

assign icmp_ln55_fu_123_p2 = ((or_ln55_fu_117_p2 < 5'd27) ? 1'b1 : 1'b0);

assign or_ln55_fu_117_p2 = (i_1_1_fu_104_p3 | 5'd1);

assign select_ln55_fu_134_p3 = ((icmp_ln55_reg_160[0:0] == 1'b1) ? accum_in_q0 : 16'd0);

assign zext_ln45_fu_141_p1 = out_idx_reg_76_pp0_iter9_reg;

assign zext_ln55_6_fu_129_p1 = or_ln55_fu_117_p2;

assign zext_ln55_fu_112_p1 = i_1_1_fu_104_p3;

endmodule //td_fused_top_tdf1_accum_1
module td_fused_top_tdf1_dot_product (
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
        weight_vecs_1_address0,
        weight_vecs_1_ce0,
        weight_vecs_1_q0,
        weight_vecs_2_address0,
        weight_vecs_2_ce0,
        weight_vecs_2_q0,
        weight_vecs_3_address0,
        weight_vecs_3_ce0,
        weight_vecs_3_q0,
        products_0_address0,
        products_0_ce0,
        products_0_we0,
        products_0_d0,
        products_1_address0,
        products_1_ce0,
        products_1_we0,
        products_1_d0,
        products_2_address0,
        products_2_ce0,
        products_2_we0,
        products_2_d0,
        products_3_address0,
        products_3_ce0,
        products_3_we0,
        products_3_d0
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
output  [4:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
input  [15:0] ifmap_vec_q0;
output  [4:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
input  [15:0] weight_vecs_0_q0;
output  [4:0] weight_vecs_1_address0;
output   weight_vecs_1_ce0;
input  [15:0] weight_vecs_1_q0;
output  [4:0] weight_vecs_2_address0;
output   weight_vecs_2_ce0;
input  [15:0] weight_vecs_2_q0;
output  [4:0] weight_vecs_3_address0;
output   weight_vecs_3_ce0;
input  [15:0] weight_vecs_3_q0;
output  [4:0] products_0_address0;
output   products_0_ce0;
output   products_0_we0;
output  [15:0] products_0_d0;
output  [4:0] products_1_address0;
output   products_1_ce0;
output   products_1_we0;
output  [15:0] products_1_d0;
output  [4:0] products_2_address0;
output   products_2_ce0;
output   products_2_we0;
output  [15:0] products_2_d0;
output  [4:0] products_3_address0;
output   products_3_ce0;
output   products_3_we0;
output  [15:0] products_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_ce0;
reg weight_vecs_0_ce0;
reg weight_vecs_1_ce0;
reg weight_vecs_2_ce0;
reg weight_vecs_3_ce0;
reg products_0_ce0;
reg products_0_we0;
reg products_1_ce0;
reg products_1_we0;
reg products_2_ce0;
reg products_2_we0;
reg products_3_ce0;
reg products_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] indvar_flatten21_reg_183;
reg   [1:0] ii_reg_194;
reg   [3:0] indvar_flatten_reg_205;
reg   [1:0] jj_reg_216;
reg   [1:0] ic_reg_227;
wire   [4:0] add_ln147_6_fu_254_p2;
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
wire   [4:0] sub_ln150_1_fu_298_p2;
reg   [4:0] sub_ln150_1_reg_569;
wire   [0:0] icmp_ln147_fu_304_p2;
reg   [0:0] icmp_ln147_reg_574;
reg   [0:0] icmp_ln147_reg_574_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter4_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter5_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter6_reg;
reg   [0:0] icmp_ln147_reg_574_pp0_iter7_reg;
wire   [0:0] icmp_ln148_fu_316_p2;
reg   [0:0] icmp_ln148_reg_578;
wire   [1:0] select_ln147_22_fu_330_p3;
reg   [1:0] select_ln147_22_reg_583;
wire   [4:0] sub_ln150_6_fu_380_p2;
reg   [4:0] sub_ln150_6_reg_588;
wire   [0:0] and_ln147_fu_406_p2;
reg   [0:0] and_ln147_reg_594;
wire   [1:0] select_ln148_fu_424_p3;
reg   [1:0] select_ln148_reg_599;
wire   [1:0] select_ln148_16_fu_432_p3;
reg   [1:0] select_ln148_16_reg_604;
wire   [4:0] empty_137_fu_450_p1;
reg   [4:0] empty_137_reg_609;
wire   [2:0] empty_138_fu_454_p1;
reg   [2:0] empty_138_reg_614;
wire   [4:0] add_ln150_6_fu_462_p2;
reg   [4:0] add_ln150_6_reg_619;
wire   [1:0] add_ln149_fu_468_p2;
wire   [3:0] select_ln148_18_fu_480_p3;
wire   [4:0] p_fu_551_p2;
reg   [4:0] p_reg_660;
reg   [4:0] p_reg_660_pp0_iter2_reg;
reg   [4:0] p_reg_660_pp0_iter3_reg;
reg   [4:0] p_reg_660_pp0_iter4_reg;
reg   [4:0] p_reg_660_pp0_iter5_reg;
reg   [4:0] p_reg_660_pp0_iter6_reg;
reg   [4:0] p_reg_660_pp0_iter7_reg;
reg   [15:0] ifmap_vec_load_reg_665;
reg   [15:0] weight_vecs_0_load_reg_673;
reg   [15:0] weight_vecs_1_load_reg_678;
reg   [15:0] weight_vecs_2_load_reg_683;
reg   [15:0] weight_vecs_3_load_reg_688;
wire   [15:0] grp_fu_238_p2;
reg   [15:0] mul_reg_693;
wire   [15:0] grp_fu_242_p2;
reg   [15:0] mul_1_reg_698;
wire   [15:0] grp_fu_246_p2;
reg   [15:0] mul_2_reg_703;
wire   [15:0] grp_fu_250_p2;
reg   [15:0] mul_3_reg_708;
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
reg    ap_enable_reg_pp0_iter8;
reg   [1:0] ap_phi_mux_ii_phi_fu_198_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_220_p4;
wire   [63:0] p_cast63_fu_542_p1;
wire   [63:0] idxprom30_fu_557_p1;
wire   [3:0] shl_ln_fu_264_p3;
wire   [4:0] zext_ln150_7_fu_272_p1;
wire   [4:0] zext_ln150_fu_260_p1;
wire   [4:0] sub_ln150_fu_276_p2;
wire   [4:0] zext_ln150_8_fu_282_p1;
wire   [4:0] add_ln150_fu_286_p2;
wire   [4:0] shl_ln150_fu_292_p2;
wire   [1:0] add_ln147_fu_310_p2;
wire   [3:0] tmp_s_fu_342_p3;
wire   [4:0] tmp_168_cast_fu_350_p1;
wire   [4:0] select_ln147_27_cast_fu_338_p1;
wire   [4:0] empty_135_fu_354_p2;
wire   [3:0] shl_ln150_mid1_fu_368_p3;
wire   [4:0] zext_ln150_13_fu_376_p1;
wire   [4:0] zext_ln150_12_fu_364_p1;
wire   [0:0] icmp_ln149_fu_400_p2;
wire   [0:0] xor_ln147_fu_394_p2;
wire   [1:0] select_ln147_fu_322_p3;
wire   [0:0] or_ln148_fu_418_p2;
wire   [1:0] add_ln148_fu_412_p2;
wire   [5:0] sext_ln150_fu_360_p1;
wire   [5:0] select_ln148_21_cast_fu_440_p1;
wire   [5:0] empty_136_fu_444_p2;
wire   [4:0] select_ln147_23_fu_386_p3;
wire   [4:0] zext_ln150_14_fu_458_p1;
wire   [3:0] add_ln148_6_fu_474_p2;
wire   [4:0] shl_ln150_1_fu_488_p2;
wire   [4:0] sub_ln150_7_fu_493_p2;
wire   [4:0] p_shl_cast_fu_504_p3;
wire   [4:0] shl_ln150_2_fu_516_p2;
wire   [4:0] sub_ln150_8_fu_521_p2;
wire   [4:0] select_ln147_24_fu_498_p3;
wire   [4:0] empty_139_fu_511_p2;
wire   [4:0] select_ln148_cast_fu_533_p1;
wire   [4:0] empty_140_fu_536_p2;
wire   [4:0] select_ln148_17_fu_526_p3;
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
hmul_16ns_16ns_16_5_max_dsp_1_U31(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_665),
    .din1(weight_vecs_0_load_reg_673),
    .dout(grp_fu_238_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U32(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_665),
    .din1(weight_vecs_1_load_reg_678),
    .dout(grp_fu_242_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U33(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_665),
    .din1(weight_vecs_2_load_reg_683),
    .dout(grp_fu_246_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U34(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_665),
    .din1(weight_vecs_3_load_reg_688),
    .dout(grp_fu_250_p2)
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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_304_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ic_reg_227 <= add_ln149_fu_468_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_227 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_574 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_194 <= select_ln147_22_reg_583;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_194 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_304_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten21_reg_183 <= add_ln147_6_fu_254_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten21_reg_183 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_304_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_205 <= select_ln148_18_fu_480_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_205 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_574 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_216 <= select_ln148_16_reg_604;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_216 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_304_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln150_6_reg_619 <= add_ln150_6_fu_462_p2;
        and_ln147_reg_594 <= and_ln147_fu_406_p2;
        empty_137_reg_609 <= empty_137_fu_450_p1;
        empty_138_reg_614 <= empty_138_fu_454_p1;
        icmp_ln148_reg_578 <= icmp_ln148_fu_316_p2;
        select_ln148_reg_599 <= select_ln148_fu_424_p3;
        sub_ln150_6_reg_588 <= sub_ln150_6_fu_380_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln147_reg_574 <= icmp_ln147_fu_304_p2;
        icmp_ln147_reg_574_pp0_iter1_reg <= icmp_ln147_reg_574;
        sub_ln150_1_reg_569 <= sub_ln150_1_fu_298_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_574_pp0_iter2_reg <= icmp_ln147_reg_574_pp0_iter1_reg;
        icmp_ln147_reg_574_pp0_iter3_reg <= icmp_ln147_reg_574_pp0_iter2_reg;
        icmp_ln147_reg_574_pp0_iter4_reg <= icmp_ln147_reg_574_pp0_iter3_reg;
        icmp_ln147_reg_574_pp0_iter5_reg <= icmp_ln147_reg_574_pp0_iter4_reg;
        icmp_ln147_reg_574_pp0_iter6_reg <= icmp_ln147_reg_574_pp0_iter5_reg;
        icmp_ln147_reg_574_pp0_iter7_reg <= icmp_ln147_reg_574_pp0_iter6_reg;
        p_reg_660_pp0_iter2_reg <= p_reg_660;
        p_reg_660_pp0_iter3_reg <= p_reg_660_pp0_iter2_reg;
        p_reg_660_pp0_iter4_reg <= p_reg_660_pp0_iter3_reg;
        p_reg_660_pp0_iter5_reg <= p_reg_660_pp0_iter4_reg;
        p_reg_660_pp0_iter6_reg <= p_reg_660_pp0_iter5_reg;
        p_reg_660_pp0_iter7_reg <= p_reg_660_pp0_iter6_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_574_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_load_reg_665 <= ifmap_vec_q0;
        weight_vecs_0_load_reg_673 <= weight_vecs_0_q0;
        weight_vecs_1_load_reg_678 <= weight_vecs_1_q0;
        weight_vecs_2_load_reg_683 <= weight_vecs_2_q0;
        weight_vecs_3_load_reg_688 <= weight_vecs_3_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_574_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_1_reg_698 <= grp_fu_242_p2;
        mul_2_reg_703 <= grp_fu_246_p2;
        mul_3_reg_708 <= grp_fu_250_p2;
        mul_reg_693 <= grp_fu_238_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_574 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_reg_660 <= p_fu_551_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_304_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln147_22_reg_583 <= select_ln147_22_fu_330_p3;
        select_ln148_16_reg_604 <= select_ln148_16_fu_432_p3;
    end
end

always @ (*) begin
    if ((icmp_ln147_fu_304_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_574 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_198_p4 = select_ln147_22_reg_583;
    end else begin
        ap_phi_mux_ii_phi_fu_198_p4 = ii_reg_194;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_574 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_220_p4 = select_ln148_16_reg_604;
    end else begin
        ap_phi_mux_jj_phi_fu_220_p4 = jj_reg_216;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_ce0 = 1'b1;
    end else begin
        products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_574_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_we0 = 1'b1;
    end else begin
        products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_ce0 = 1'b1;
    end else begin
        products_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_574_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_we0 = 1'b1;
    end else begin
        products_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_ce0 = 1'b1;
    end else begin
        products_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_574_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_we0 = 1'b1;
    end else begin
        products_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_ce0 = 1'b1;
    end else begin
        products_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_574_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_we0 = 1'b1;
    end else begin
        products_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_ce0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln147_fu_304_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln147_fu_304_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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

assign add_ln147_6_fu_254_p2 = (indvar_flatten21_reg_183 + 5'd1);

assign add_ln147_fu_310_p2 = (ap_phi_mux_ii_phi_fu_198_p4 + 2'd1);

assign add_ln148_6_fu_474_p2 = (indvar_flatten_reg_205 + 4'd1);

assign add_ln148_fu_412_p2 = (select_ln147_fu_322_p3 + 2'd1);

assign add_ln149_fu_468_p2 = (select_ln148_fu_424_p3 + 2'd1);

assign add_ln150_6_fu_462_p2 = (select_ln147_23_fu_386_p3 + zext_ln150_14_fu_458_p1);

assign add_ln150_fu_286_p2 = (sub_ln150_fu_276_p2 + zext_ln150_8_fu_282_p1);

assign and_ln147_fu_406_p2 = (xor_ln147_fu_394_p2 & icmp_ln149_fu_400_p2);

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

assign empty_135_fu_354_p2 = (tmp_168_cast_fu_350_p1 - select_ln147_27_cast_fu_338_p1);

assign empty_136_fu_444_p2 = ((sext_ln150_fu_360_p1) + (select_ln148_21_cast_fu_440_p1));

assign empty_137_fu_450_p1 = empty_136_fu_444_p2[4:0];

assign empty_138_fu_454_p1 = empty_136_fu_444_p2[2:0];

assign empty_139_fu_511_p2 = (p_shl_cast_fu_504_p3 - empty_137_reg_609);

assign empty_140_fu_536_p2 = (empty_139_fu_511_p2 + select_ln148_cast_fu_533_p1);

assign icmp_ln147_fu_304_p2 = ((indvar_flatten21_reg_183 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_316_p2 = ((indvar_flatten_reg_205 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_400_p2 = ((ic_reg_227 == 2'd3) ? 1'b1 : 1'b0);

assign idxprom30_fu_557_p1 = p_reg_660_pp0_iter7_reg;

assign ifmap_vec_address0 = p_cast63_fu_542_p1;

assign or_ln148_fu_418_p2 = (icmp_ln148_fu_316_p2 | and_ln147_fu_406_p2);

assign p_cast63_fu_542_p1 = empty_140_fu_536_p2;

assign p_fu_551_p2 = (select_ln148_17_fu_526_p3 + select_ln148_cast_fu_533_p1);

assign p_shl_cast_fu_504_p3 = {{empty_138_reg_614}, {2'd0}};

assign products_0_address0 = idxprom30_fu_557_p1;

assign products_0_d0 = mul_reg_693;

assign products_1_address0 = idxprom30_fu_557_p1;

assign products_1_d0 = mul_1_reg_698;

assign products_2_address0 = idxprom30_fu_557_p1;

assign products_2_d0 = mul_2_reg_703;

assign products_3_address0 = idxprom30_fu_557_p1;

assign products_3_d0 = mul_3_reg_708;

assign select_ln147_22_fu_330_p3 = ((icmp_ln148_fu_316_p2[0:0] == 1'b1) ? add_ln147_fu_310_p2 : ap_phi_mux_ii_phi_fu_198_p4);

assign select_ln147_23_fu_386_p3 = ((icmp_ln148_fu_316_p2[0:0] == 1'b1) ? sub_ln150_6_fu_380_p2 : sub_ln150_fu_276_p2);

assign select_ln147_24_fu_498_p3 = ((icmp_ln148_reg_578[0:0] == 1'b1) ? sub_ln150_7_fu_493_p2 : sub_ln150_1_reg_569);

assign select_ln147_27_cast_fu_338_p1 = select_ln147_22_fu_330_p3;

assign select_ln147_fu_322_p3 = ((icmp_ln148_fu_316_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_220_p4);

assign select_ln148_16_fu_432_p3 = ((and_ln147_fu_406_p2[0:0] == 1'b1) ? add_ln148_fu_412_p2 : select_ln147_fu_322_p3);

assign select_ln148_17_fu_526_p3 = ((and_ln147_reg_594[0:0] == 1'b1) ? sub_ln150_8_fu_521_p2 : select_ln147_24_fu_498_p3);

assign select_ln148_18_fu_480_p3 = ((icmp_ln148_fu_316_p2[0:0] == 1'b1) ? 4'd1 : add_ln148_6_fu_474_p2);

assign select_ln148_21_cast_fu_440_p1 = select_ln148_16_fu_432_p3;

assign select_ln148_cast_fu_533_p1 = select_ln148_reg_599;

assign select_ln148_fu_424_p3 = ((or_ln148_fu_418_p2[0:0] == 1'b1) ? 2'd0 : ic_reg_227);

assign sext_ln150_fu_360_p1 = (empty_135_fu_354_p2);

assign shl_ln150_1_fu_488_p2 = sub_ln150_6_reg_588 << 5'd2;

assign shl_ln150_2_fu_516_p2 = add_ln150_6_reg_619 << 5'd2;

assign shl_ln150_fu_292_p2 = add_ln150_fu_286_p2 << 5'd2;

assign shl_ln150_mid1_fu_368_p3 = {{add_ln147_fu_310_p2}, {2'd0}};

assign shl_ln_fu_264_p3 = {{ap_phi_mux_ii_phi_fu_198_p4}, {2'd0}};

assign sub_ln150_1_fu_298_p2 = (shl_ln150_fu_292_p2 - add_ln150_fu_286_p2);

assign sub_ln150_6_fu_380_p2 = (zext_ln150_13_fu_376_p1 - zext_ln150_12_fu_364_p1);

assign sub_ln150_7_fu_493_p2 = (shl_ln150_1_fu_488_p2 - sub_ln150_6_reg_588);

assign sub_ln150_8_fu_521_p2 = (shl_ln150_2_fu_516_p2 - add_ln150_6_reg_619);

assign sub_ln150_fu_276_p2 = (zext_ln150_7_fu_272_p1 - zext_ln150_fu_260_p1);

assign tmp_168_cast_fu_350_p1 = tmp_s_fu_342_p3;

assign tmp_s_fu_342_p3 = {{select_ln147_22_fu_330_p3}, {2'd0}};

assign weight_vecs_0_address0 = p_cast63_fu_542_p1;

assign weight_vecs_1_address0 = p_cast63_fu_542_p1;

assign weight_vecs_2_address0 = p_cast63_fu_542_p1;

assign weight_vecs_3_address0 = p_cast63_fu_542_p1;

assign xor_ln147_fu_394_p2 = (icmp_ln148_fu_316_p2 ^ 1'd1);

assign zext_ln150_12_fu_364_p1 = add_ln147_fu_310_p2;

assign zext_ln150_13_fu_376_p1 = shl_ln150_mid1_fu_368_p3;

assign zext_ln150_14_fu_458_p1 = add_ln148_fu_412_p2;

assign zext_ln150_7_fu_272_p1 = shl_ln_fu_264_p3;

assign zext_ln150_8_fu_282_p1 = ap_phi_mux_jj_phi_fu_220_p4;

assign zext_ln150_fu_260_p1 = ap_phi_mux_ii_phi_fu_198_p4;

endmodule //td_fused_top_tdf1_dot_product
module td_fused_top_tdf1_readFilters18 (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_we0,
        weight_vecs_0_d0,
        weight_vecs_1_address0,
        weight_vecs_1_ce0,
        weight_vecs_1_we0,
        weight_vecs_1_d0,
        weight_vecs_2_address0,
        weight_vecs_2_ce0,
        weight_vecs_2_we0,
        weight_vecs_2_d0,
        weight_vecs_3_address0,
        weight_vecs_3_ce0,
        weight_vecs_3_we0,
        weight_vecs_3_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state6 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [6:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [15:0] filter_data_0_q0;
output  [6:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [15:0] filter_data_1_q0;
output  [6:0] filter_data_2_address0;
output   filter_data_2_ce0;
input  [15:0] filter_data_2_q0;
output  [6:0] filter_data_3_address0;
output   filter_data_3_ce0;
input  [15:0] filter_data_3_q0;
input  [1:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [4:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;
output  [4:0] weight_vecs_1_address0;
output   weight_vecs_1_ce0;
output   weight_vecs_1_we0;
output  [15:0] weight_vecs_1_d0;
output  [4:0] weight_vecs_2_address0;
output   weight_vecs_2_ce0;
output   weight_vecs_2_we0;
output  [15:0] weight_vecs_2_d0;
output  [4:0] weight_vecs_3_address0;
output   weight_vecs_3_ce0;
output   weight_vecs_3_we0;
output  [15:0] weight_vecs_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg filter_data_2_ce0;
reg filter_data_3_ce0;
reg input_indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;
reg weight_vecs_1_ce0;
reg weight_vecs_1_we0;
reg weight_vecs_2_ce0;
reg weight_vecs_2_we0;
reg weight_vecs_3_ce0;
reg weight_vecs_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg   [4:0] indvar_flatten13_reg_210;
reg   [3:0] indvar_flatten_reg_221;
reg   [1:0] ii_reg_232;
reg   [1:0] jj_reg_243;
reg   [1:0] kk_reg_254;
wire   [5:0] sext_ln47_fu_287_p1;
reg   [5:0] sext_ln47_reg_602;
wire   [4:0] add_ln47_6_fu_291_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_297_p2;
reg   [0:0] icmp_ln47_reg_612;
reg   [0:0] icmp_ln47_reg_612_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_612_pp0_iter2_reg;
wire   [0:0] icmp_ln48_fu_303_p2;
reg   [0:0] icmp_ln48_reg_616;
wire   [3:0] select_ln48_12_fu_315_p3;
wire   [1:0] select_ln47_11_fu_336_p3;
reg   [1:0] select_ln47_11_reg_629;
reg    ap_enable_reg_pp0_iter1;
wire   [1:0] select_ln48_fu_402_p3;
reg   [1:0] select_ln48_reg_636;
wire   [1:0] select_ln48_11_fu_410_p3;
reg   [1:0] select_ln48_11_reg_642;
wire   [6:0] trunc_ln55_fu_428_p1;
reg   [6:0] trunc_ln55_reg_648;
wire   [4:0] trunc_ln55_16_fu_432_p1;
reg   [4:0] trunc_ln55_16_reg_653;
wire   [1:0] add_ln49_fu_436_p2;
wire   [4:0] add_ln55_14_fu_529_p2;
reg   [4:0] add_ln55_14_reg_683;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_236_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_247_p4;
wire   [63:0] zext_ln55_42_fu_521_p1;
wire   [63:0] zext_ln55_43_fu_535_p1;
wire   [15:0] tmp_fu_542_p6;
wire   [15:0] tmp_s_fu_557_p6;
wire   [15:0] tmp_5_fu_572_p6;
wire   [15:0] tmp_6_fu_587_p6;
wire   [3:0] tmp_52_fu_269_p3;
wire   [4:0] zext_ln55_34_fu_277_p1;
wire   [4:0] zext_ln55_fu_265_p1;
wire   [4:0] sub_ln55_fu_281_p2;
wire   [3:0] add_ln48_6_fu_309_p2;
wire   [1:0] add_ln47_fu_323_p2;
wire   [5:0] zext_ln55_36_fu_343_p1;
wire   [5:0] add_ln55_fu_347_p2;
wire   [7:0] tmp_77_fu_356_p3;
wire   [61:0] sext_ln55_11_fu_364_p1;
wire   [61:0] sext_ln55_fu_352_p1;
wire   [0:0] icmp_ln49_fu_379_p2;
wire   [0:0] xor_ln47_fu_374_p2;
wire   [1:0] select_ln47_fu_329_p3;
wire   [0:0] and_ln47_fu_385_p2;
wire   [0:0] or_ln48_fu_397_p2;
wire   [1:0] add_ln48_fu_391_p2;
wire   [61:0] sub_ln55_11_fu_368_p2;
wire   [61:0] zext_ln55_39_fu_418_p1;
wire   [61:0] add_ln55_11_fu_422_p2;
wire   [3:0] tmp_53_fu_445_p3;
wire   [4:0] zext_ln55_37_fu_452_p1;
wire   [4:0] zext_ln55_35_fu_442_p1;
wire   [4:0] sub_ln55_12_fu_456_p2;
wire   [6:0] p_shl2_cast_fu_469_p3;
wire   [5:0] sext_ln48_fu_462_p1;
wire   [5:0] zext_ln55_38_fu_466_p1;
wire   [5:0] add_ln55_12_fu_481_p2;
wire   [2:0] trunc_ln55_18_fu_491_p1;
wire   [4:0] p_shl1_cast_fu_495_p3;
wire   [4:0] trunc_ln55_17_fu_487_p1;
wire   [6:0] sub_ln55_13_fu_476_p2;
wire   [6:0] zext_ln55_41_fu_512_p1;
wire   [6:0] add_ln55_13_fu_515_p2;
wire   [4:0] sub_ln55_14_fu_503_p2;
wire   [4:0] zext_ln55_40_fu_509_p1;
wire    ap_CS_fsm_state6;
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
end

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U17(
    .din0(filter_data_0_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_fu_542_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U18(
    .din0(filter_data_1_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_s_fu_557_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U19(
    .din0(filter_data_2_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_5_fu_572_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U20(
    .din0(filter_data_3_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_6_fu_587_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_232 <= select_ln47_11_reg_629;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_232 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten13_reg_210 <= add_ln47_6_fu_291_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_210 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_221 <= select_ln48_12_fu_315_p3;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_221 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_243 <= select_ln48_11_reg_642;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_243 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        kk_reg_254 <= add_ln49_fu_436_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_254 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_14_reg_683 <= add_ln55_14_fu_529_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln47_reg_612 <= icmp_ln47_fu_297_p2;
        icmp_ln47_reg_612_pp0_iter1_reg <= icmp_ln47_reg_612;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln47_reg_612_pp0_iter2_reg <= icmp_ln47_reg_612_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln48_reg_616 <= icmp_ln48_fu_303_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln47_11_reg_629 <= select_ln47_11_fu_336_p3;
        select_ln48_11_reg_642 <= select_ln48_11_fu_410_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln48_reg_636 <= select_ln48_fu_402_p3;
        trunc_ln55_16_reg_653 <= trunc_ln55_16_fu_432_p1;
        trunc_ln55_reg_648 <= trunc_ln55_fu_428_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_602 <= sext_ln47_fu_287_p1;
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_236_p4 = select_ln47_11_reg_629;
    end else begin
        ap_phi_mux_ii_phi_fu_236_p4 = ii_reg_232;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_247_p4 = select_ln48_11_reg_642;
    end else begin
        ap_phi_mux_jj_phi_fu_247_p4 = jj_reg_243;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_2_ce0 = 1'b1;
    end else begin
        filter_data_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_3_ce0 = 1'b1;
    end else begin
        filter_data_3_ce0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_we0 = 1'b1;
    end else begin
        weight_vecs_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_we0 = 1'b1;
    end else begin
        weight_vecs_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_we0 = 1'b1;
    end else begin
        weight_vecs_3_we0 = 1'b0;
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
            if ((~((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln47_6_fu_291_p2 = (indvar_flatten13_reg_210 + 5'd1);

assign add_ln47_fu_323_p2 = (ap_phi_mux_ii_phi_fu_236_p4 + 2'd1);

assign add_ln48_6_fu_309_p2 = (indvar_flatten_reg_221 + 4'd1);

assign add_ln48_fu_391_p2 = (select_ln47_fu_329_p3 + 2'd1);

assign add_ln49_fu_436_p2 = (select_ln48_fu_402_p3 + 2'd1);

assign add_ln55_11_fu_422_p2 = (sub_ln55_11_fu_368_p2 + zext_ln55_39_fu_418_p1);

assign add_ln55_12_fu_481_p2 = ((sext_ln48_fu_462_p1) + (zext_ln55_38_fu_466_p1));

assign add_ln55_13_fu_515_p2 = (sub_ln55_13_fu_476_p2 + zext_ln55_41_fu_512_p1);

assign add_ln55_14_fu_529_p2 = (sub_ln55_14_fu_503_p2 + zext_ln55_40_fu_509_p1);

assign add_ln55_fu_347_p2 = ((sext_ln47_reg_602) + (zext_ln55_36_fu_343_p1));

assign and_ln47_fu_385_p2 = (xor_ln47_fu_374_p2 & icmp_ln49_fu_379_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd2];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_1_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_2_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_3_address0 = zext_ln55_42_fu_521_p1;

assign icmp_ln47_fu_297_p2 = ((indvar_flatten13_reg_210 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_303_p2 = ((indvar_flatten_reg_221 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_379_p2 = ((kk_reg_254 == 2'd3) ? 1'b1 : 1'b0);

assign or_ln48_fu_397_p2 = (icmp_ln48_reg_616 | and_ln47_fu_385_p2);

assign p_shl1_cast_fu_495_p3 = {{trunc_ln55_18_fu_491_p1}, {2'd0}};

assign p_shl2_cast_fu_469_p3 = {{trunc_ln55_16_reg_653}, {2'd0}};

assign select_ln47_11_fu_336_p3 = ((icmp_ln48_reg_616[0:0] == 1'b1) ? add_ln47_fu_323_p2 : ap_phi_mux_ii_phi_fu_236_p4);

assign select_ln47_fu_329_p3 = ((icmp_ln48_reg_616[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_247_p4);

assign select_ln48_11_fu_410_p3 = ((and_ln47_fu_385_p2[0:0] == 1'b1) ? add_ln48_fu_391_p2 : select_ln47_fu_329_p3);

assign select_ln48_12_fu_315_p3 = ((icmp_ln48_fu_303_p2[0:0] == 1'b1) ? 4'd1 : add_ln48_6_fu_309_p2);

assign select_ln48_fu_402_p3 = ((or_ln48_fu_397_p2[0:0] == 1'b1) ? 2'd0 : kk_reg_254);

assign sext_ln47_fu_287_p1 = (sub_ln55_fu_281_p2);

assign sext_ln48_fu_462_p1 = (sub_ln55_12_fu_456_p2);

assign sext_ln55_11_fu_364_p1 = (tmp_77_fu_356_p3);

assign sext_ln55_fu_352_p1 = add_ln55_fu_347_p2;

assign sub_ln55_11_fu_368_p2 = ((sext_ln55_11_fu_364_p1) - (sext_ln55_fu_352_p1));

assign sub_ln55_12_fu_456_p2 = (zext_ln55_37_fu_452_p1 - zext_ln55_35_fu_442_p1);

assign sub_ln55_13_fu_476_p2 = (p_shl2_cast_fu_469_p3 - trunc_ln55_reg_648);

assign sub_ln55_14_fu_503_p2 = (p_shl1_cast_fu_495_p3 - trunc_ln55_17_fu_487_p1);

assign sub_ln55_fu_281_p2 = (zext_ln55_34_fu_277_p1 - zext_ln55_fu_265_p1);

assign tmp_52_fu_269_p3 = {{input_indices_23_dout}, {2'd0}};

assign tmp_53_fu_445_p3 = {{select_ln47_11_reg_629}, {2'd0}};

assign tmp_77_fu_356_p3 = {{add_ln55_fu_347_p2}, {2'd0}};

assign trunc_ln55_16_fu_432_p1 = add_ln55_11_fu_422_p2[4:0];

assign trunc_ln55_17_fu_487_p1 = add_ln55_12_fu_481_p2[4:0];

assign trunc_ln55_18_fu_491_p1 = add_ln55_12_fu_481_p2[2:0];

assign trunc_ln55_fu_428_p1 = add_ln55_11_fu_422_p2[6:0];

assign weight_vecs_0_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_0_d0 = tmp_fu_542_p6;

assign weight_vecs_1_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_1_d0 = tmp_s_fu_557_p6;

assign weight_vecs_2_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_2_d0 = tmp_5_fu_572_p6;

assign weight_vecs_3_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_3_d0 = tmp_6_fu_587_p6;

assign xor_ln47_fu_374_p2 = (icmp_ln48_reg_616 ^ 1'd1);

assign zext_ln55_34_fu_277_p1 = tmp_52_fu_269_p3;

assign zext_ln55_35_fu_442_p1 = select_ln47_11_reg_629;

assign zext_ln55_36_fu_343_p1 = select_ln47_11_fu_336_p3;

assign zext_ln55_37_fu_452_p1 = tmp_53_fu_445_p3;

assign zext_ln55_38_fu_466_p1 = select_ln48_11_reg_642;

assign zext_ln55_39_fu_418_p1 = select_ln48_11_fu_410_p3;

assign zext_ln55_40_fu_509_p1 = select_ln48_reg_636;

assign zext_ln55_41_fu_512_p1 = select_ln48_reg_636;

assign zext_ln55_42_fu_521_p1 = add_ln55_13_fu_515_p2;

assign zext_ln55_43_fu_535_p1 = add_ln55_14_reg_683;

assign zext_ln55_fu_265_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf1_readFilters18
module td_fused_top_mux_416_16_1_1 #(
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
    input  [15 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [15 : 0]     sel;
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
module td_fused_top_tdf1_get_next_ijk (
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
output  [1:0] input_indices_2_out_din;
input   input_indices_2_out_full_n;
output   input_indices_2_out_write;
output  [3:0] input_indices_2_out1_din;
input   input_indices_2_out1_full_n;
output   input_indices_2_out1_write;
output  [6:0] output_indices_0_din;
input   output_indices_0_full_n;
output   output_indices_0_write;
output  [13:0] output_indices_1_din;
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
reg   [1:0] i_p_3;
reg   [1:0] j_p_3;
reg   [15:0] i_7;
reg   [15:0] j_7;
reg   [15:0] k_7;
reg   [15:0] i_out_3;
reg   [15:0] j_out_3;
reg    input_indices_2_out_blk_n;
reg    input_indices_2_out1_blk_n;
reg    output_indices_0_blk_n;
reg    output_indices_1_blk_n;
reg    resetMaximum_blk_n;
reg    storeOutput_blk_n;
wire   [1:0] select_ln195_fu_344_p3;
reg    ap_block_state1;
wire   [0:0] or_ln195_fu_318_p2;
wire   [1:0] select_ln195_1_fu_352_p3;
wire   [15:0] select_ln200_fu_284_p3;
wire   [0:0] and_ln195_1_fu_312_p2;
wire   [15:0] select_ln195_2_fu_366_p3;
wire   [0:0] and_ln185_fu_360_p2;
wire   [15:0] select_ln195_3_fu_394_p3;
wire   [0:0] and_ln188_fu_300_p2;
wire   [15:0] select_ln200_1_fu_292_p3;
wire   [15:0] select_ln195_4_fu_402_p3;
wire   [1:0] or_ln177_fu_128_p2;
wire   [0:0] icmp_ln178_fu_141_p2;
wire   [0:0] icmp_ln178_1_fu_147_p2;
wire   [15:0] zext_ln179_fu_116_p1;
wire   [15:0] zext_ln180_fu_124_p1;
wire   [1:0] add_ln184_fu_212_p2;
wire   [1:0] add_ln187_fu_224_p2;
wire   [15:0] add_ln190_fu_236_p2;
wire   [15:0] add_ln194_fu_254_p2;
wire   [15:0] add_ln199_fu_272_p2;
wire   [0:0] icmp_ln200_fu_278_p2;
wire   [15:0] add_ln198_fu_266_p2;
wire   [0:0] icmp_ln185_fu_218_p2;
wire   [0:0] icmp_ln188_fu_230_p2;
wire   [0:0] icmp_ln191_fu_242_p2;
wire   [0:0] icmp_ln195_fu_260_p2;
wire   [0:0] and_ln195_fu_306_p2;
wire   [0:0] xor_ln188_fu_324_p2;
wire   [0:0] and_ln188_1_fu_330_p2;
wire   [1:0] select_ln188_fu_336_p3;
wire   [15:0] add_ln193_fu_248_p2;
wire   [0:0] xor_ln191_fu_374_p2;
wire   [0:0] and_ln191_fu_380_p2;
wire   [15:0] select_ln191_fu_386_p3;
wire   [15:0] add_ln179_fu_164_p2;
wire   [15:0] add_ln180_fu_174_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_p_3 = 2'd0;
#0 j_p_3 = 2'd0;
#0 i_7 = 16'd0;
#0 j_7 = 16'd0;
#0 k_7 = 16'd0;
#0 i_out_3 = 16'd0;
#0 j_out_3 = 16'd0;
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
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln195_1_fu_312_p2))) begin
        i_7 <= select_ln200_fu_284_p3;
        i_out_3 <= select_ln200_1_fu_292_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln195_fu_318_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_p_3 <= select_ln195_fu_344_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln185_fu_360_p2))) begin
        j_7 <= select_ln195_2_fu_366_p3;
        j_out_3 <= select_ln195_4_fu_402_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        j_p_3 <= select_ln195_1_fu_352_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln188_fu_300_p2))) begin
        k_7 <= select_ln195_3_fu_394_p3;
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

assign add_ln179_fu_164_p2 = (i_7 + zext_ln179_fu_116_p1);

assign add_ln180_fu_174_p2 = (j_7 + zext_ln180_fu_124_p1);

assign add_ln184_fu_212_p2 = (j_p_3 + 2'd1);

assign add_ln187_fu_224_p2 = (i_p_3 + 2'd1);

assign add_ln190_fu_236_p2 = (k_7 + 16'd1);

assign add_ln193_fu_248_p2 = (j_7 + 16'd2);

assign add_ln194_fu_254_p2 = (j_out_3 + 16'd1);

assign add_ln198_fu_266_p2 = (i_7 + 16'd2);

assign add_ln199_fu_272_p2 = (i_out_3 + 16'd1);

assign and_ln185_fu_360_p2 = (icmp_ln191_fu_242_p2 & and_ln188_fu_300_p2);

assign and_ln188_1_fu_330_p2 = (xor_ln188_fu_324_p2 & icmp_ln185_fu_218_p2);

assign and_ln188_fu_300_p2 = (icmp_ln188_fu_230_p2 & icmp_ln185_fu_218_p2);

assign and_ln191_fu_380_p2 = (xor_ln191_fu_374_p2 & and_ln188_fu_300_p2);

assign and_ln195_1_fu_312_p2 = (and_ln195_fu_306_p2 & and_ln188_fu_300_p2);

assign and_ln195_fu_306_p2 = (icmp_ln195_fu_260_p2 & icmp_ln191_fu_242_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign ap_return_0 = add_ln179_fu_164_p2;

assign ap_return_1 = add_ln180_fu_174_p2;

assign icmp_ln178_1_fu_147_p2 = ((j_p_3 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln178_fu_141_p2 = ((i_p_3 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln185_fu_218_p2 = ((add_ln184_fu_212_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln188_fu_230_p2 = ((add_ln187_fu_224_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln191_fu_242_p2 = ((add_ln190_fu_236_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln195_fu_260_p2 = ((add_ln194_fu_254_p2 == 16'd112) ? 1'b1 : 1'b0);

assign icmp_ln200_fu_278_p2 = ((add_ln199_fu_272_p2 == 16'd112) ? 1'b1 : 1'b0);

assign input_indices_2_out1_din = k_7[3:0];

assign input_indices_2_out_din = k_7[1:0];

assign or_ln177_fu_128_p2 = (j_p_3 | i_p_3);

assign or_ln195_fu_318_p2 = (icmp_ln185_fu_218_p2 | and_ln195_1_fu_312_p2);

assign output_indices_0_din = i_out_3[6:0];

assign output_indices_1_din = j_out_3[13:0];

assign resetMaximum_din = ((or_ln177_fu_128_p2 == 2'd0) ? 1'b1 : 1'b0);

assign select_ln188_fu_336_p3 = ((and_ln188_1_fu_330_p2[0:0] == 1'b1) ? add_ln187_fu_224_p2 : 2'd0);

assign select_ln191_fu_386_p3 = ((and_ln191_fu_380_p2[0:0] == 1'b1) ? add_ln190_fu_236_p2 : 16'd0);

assign select_ln195_1_fu_352_p3 = ((or_ln195_fu_318_p2[0:0] == 1'b1) ? 2'd0 : add_ln184_fu_212_p2);

assign select_ln195_2_fu_366_p3 = ((and_ln195_1_fu_312_p2[0:0] == 1'b1) ? 16'd0 : add_ln193_fu_248_p2);

assign select_ln195_3_fu_394_p3 = ((and_ln195_1_fu_312_p2[0:0] == 1'b1) ? 16'd0 : select_ln191_fu_386_p3);

assign select_ln195_4_fu_402_p3 = ((and_ln195_1_fu_312_p2[0:0] == 1'b1) ? 16'd0 : add_ln194_fu_254_p2);

assign select_ln195_fu_344_p3 = ((and_ln195_1_fu_312_p2[0:0] == 1'b1) ? 2'd0 : select_ln188_fu_336_p3);

assign select_ln200_1_fu_292_p3 = ((icmp_ln200_fu_278_p2[0:0] == 1'b1) ? 16'd0 : add_ln199_fu_272_p2);

assign select_ln200_fu_284_p3 = ((icmp_ln200_fu_278_p2[0:0] == 1'b1) ? 16'd0 : add_ln198_fu_266_p2);

assign start_out = real_start;

assign storeOutput_din = (icmp_ln178_fu_141_p2 & icmp_ln178_1_fu_147_p2);

assign xor_ln188_fu_324_p2 = (icmp_ln188_fu_230_p2 ^ 1'd1);

assign xor_ln191_fu_374_p2 = (icmp_ln191_fu_242_p2 ^ 1'd1);

assign zext_ln179_fu_116_p1 = i_p_3;

assign zext_ln180_fu_124_p1 = j_p_3;

endmodule //td_fused_top_tdf1_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore(
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
parameter AddressRange = 32'd7;
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
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum2_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 3;
parameter MEM_SIZE = 7;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore(
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
parameter AddressRange = 32'd14;
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



td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 4;
parameter MEM_SIZE = 14;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore(
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
parameter AddressRange = 32'd27;
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
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_products_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 5;
parameter MEM_SIZE = 27;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 5,
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
td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore(
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
parameter AddressRange = 32'd54;
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
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP16_ifmap_vec_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 6;
parameter MEM_SIZE = 54;

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

module td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1
#(parameter
    ID         = 137,
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




































