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

module td_fused_top_dataflow_in_loop_TOP_LOOP48139 (
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
output  [11:0] filter_data_0_address0;
output   filter_data_0_ce0;
output  [31:0] filter_data_0_d0;
input  [31:0] filter_data_0_q0;
output   filter_data_0_we0;
output  [11:0] filter_data_0_address1;
output   filter_data_0_ce1;
output  [31:0] filter_data_0_d1;
input  [31:0] filter_data_0_q1;
output   filter_data_0_we1;
output  [11:0] filter_data_1_address0;
output   filter_data_1_ce0;
output  [31:0] filter_data_1_d0;
input  [31:0] filter_data_1_q0;
output   filter_data_1_we0;
output  [11:0] filter_data_1_address1;
output   filter_data_1_ce1;
output  [31:0] filter_data_1_d1;
input  [31:0] filter_data_1_q1;
output   filter_data_1_we1;
output  [11:0] filter_data_2_address0;
output   filter_data_2_ce0;
output  [31:0] filter_data_2_d0;
input  [31:0] filter_data_2_q0;
output   filter_data_2_we0;
output  [11:0] filter_data_2_address1;
output   filter_data_2_ce1;
output  [31:0] filter_data_2_d1;
input  [31:0] filter_data_2_q1;
output   filter_data_2_we1;
output  [11:0] filter_data_3_address0;
output   filter_data_3_ce0;
output  [31:0] filter_data_3_d0;
input  [31:0] filter_data_3_q0;
output   filter_data_3_we0;
output  [11:0] filter_data_3_address1;
output   filter_data_3_ce1;
output  [31:0] filter_data_3_d1;
input  [31:0] filter_data_3_q1;
output   filter_data_3_we1;
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

wire   [15:0] ifmap_vec_0_i_q0;
wire   [15:0] ifmap_vec_0_t_q0;
wire   [15:0] ifmap_vec_1_i_q0;
wire   [15:0] ifmap_vec_1_t_q0;
wire   [15:0] weight_vecs_0_0_i_q0;
wire   [15:0] weight_vecs_0_0_t_q0;
wire   [15:0] weight_vecs_0_1_i_q0;
wire   [15:0] weight_vecs_0_1_t_q0;
wire   [15:0] weight_vecs_1_0_i_q0;
wire   [15:0] weight_vecs_1_0_t_q0;
wire   [15:0] weight_vecs_1_1_i_q0;
wire   [15:0] weight_vecs_1_1_t_q0;
wire   [15:0] weight_vecs_2_0_i_q0;
wire   [15:0] weight_vecs_2_0_t_q0;
wire   [15:0] weight_vecs_2_1_i_q0;
wire   [15:0] weight_vecs_2_1_t_q0;
wire   [15:0] weight_vecs_3_0_i_q0;
wire   [15:0] weight_vecs_3_0_t_q0;
wire   [15:0] weight_vecs_3_1_i_q0;
wire   [15:0] weight_vecs_3_1_t_q0;
wire   [15:0] products_0_0_i_q0;
wire   [15:0] products_0_0_i_q1;
wire   [15:0] products_0_0_t_q0;
wire   [15:0] products_0_0_t_q1;
wire   [15:0] products_0_1_i_q0;
wire   [15:0] products_0_1_i_q1;
wire   [15:0] products_0_1_t_q0;
wire   [15:0] products_0_1_t_q1;
wire   [15:0] products_1_0_i_q0;
wire   [15:0] products_1_0_i_q1;
wire   [15:0] products_1_0_t_q0;
wire   [15:0] products_1_0_t_q1;
wire   [15:0] products_1_1_i_q0;
wire   [15:0] products_1_1_i_q1;
wire   [15:0] products_1_1_t_q0;
wire   [15:0] products_1_1_t_q1;
wire   [15:0] products_2_0_i_q0;
wire   [15:0] products_2_0_i_q1;
wire   [15:0] products_2_0_t_q0;
wire   [15:0] products_2_0_t_q1;
wire   [15:0] products_2_1_i_q0;
wire   [15:0] products_2_1_i_q1;
wire   [15:0] products_2_1_t_q0;
wire   [15:0] products_2_1_t_q1;
wire   [15:0] products_3_0_i_q0;
wire   [15:0] products_3_0_i_q1;
wire   [15:0] products_3_0_t_q0;
wire   [15:0] products_3_0_t_q1;
wire   [15:0] products_3_1_i_q0;
wire   [15:0] products_3_1_i_q1;
wire   [15:0] products_3_1_t_q0;
wire   [15:0] products_3_1_t_q1;
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
wire   [15:0] accum2_out_0_t_q0;
wire   [15:0] accum2_out_1_i_q0;
wire   [15:0] accum2_out_1_t_q0;
wire   [15:0] accum2_out_2_i_q0;
wire   [15:0] accum2_out_2_t_q0;
wire   [15:0] accum2_out_3_i_q0;
wire   [15:0] accum2_out_3_t_q0;
wire    tdf5_get_next_ijk_U0_ap_start;
wire    tdf5_get_next_ijk_U0_ap_done;
wire    tdf5_get_next_ijk_U0_ap_continue;
wire    tdf5_get_next_ijk_U0_ap_idle;
wire    tdf5_get_next_ijk_U0_ap_ready;
wire    tdf5_get_next_ijk_U0_start_out;
wire    tdf5_get_next_ijk_U0_start_write;
wire   [4:0] tdf5_get_next_ijk_U0_input_indices_2_out_din;
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
wire    tdf5_readInputs42_U0_ap_start;
wire    tdf5_readInputs42_U0_ap_done;
wire    tdf5_readInputs42_U0_ap_continue;
wire    tdf5_readInputs42_U0_ap_idle;
wire    tdf5_readInputs42_U0_ap_ready;
wire   [13:0] tdf5_readInputs42_U0_in_data_address0;
wire    tdf5_readInputs42_U0_in_data_ce0;
wire   [6:0] tdf5_readInputs42_U0_ifmap_vec_0_address0;
wire    tdf5_readInputs42_U0_ifmap_vec_0_ce0;
wire    tdf5_readInputs42_U0_ifmap_vec_0_we0;
wire   [15:0] tdf5_readInputs42_U0_ifmap_vec_0_d0;
wire   [6:0] tdf5_readInputs42_U0_ifmap_vec_1_address0;
wire    tdf5_readInputs42_U0_ifmap_vec_1_ce0;
wire    tdf5_readInputs42_U0_ifmap_vec_1_we0;
wire   [15:0] tdf5_readInputs42_U0_ifmap_vec_1_d0;
wire    tdf5_readInputs42_U0_in_data_full_n;
wire    tdf5_readInputs42_U0_in_data_write;
wire    ap_channel_done_ifmap_vec_1;
wire    tdf5_readInputs42_U0_ifmap_vec_1_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_1;
wire    ap_sync_channel_write_ifmap_vec_1;
wire    ap_channel_done_ifmap_vec_0;
wire    tdf5_readInputs42_U0_ifmap_vec_0_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_0;
wire    ap_sync_channel_write_ifmap_vec_0;
wire    tdf5_readFilters41_U0_ap_start;
wire    tdf5_readFilters41_U0_ap_done;
wire    tdf5_readFilters41_U0_ap_continue;
wire    tdf5_readFilters41_U0_ap_idle;
wire    tdf5_readFilters41_U0_ap_ready;
wire   [11:0] tdf5_readFilters41_U0_filter_data_0_address0;
wire    tdf5_readFilters41_U0_filter_data_0_ce0;
wire   [11:0] tdf5_readFilters41_U0_filter_data_1_address0;
wire    tdf5_readFilters41_U0_filter_data_1_ce0;
wire   [11:0] tdf5_readFilters41_U0_filter_data_2_address0;
wire    tdf5_readFilters41_U0_filter_data_2_ce0;
wire   [11:0] tdf5_readFilters41_U0_filter_data_3_address0;
wire    tdf5_readFilters41_U0_filter_data_3_ce0;
wire    tdf5_readFilters41_U0_input_indices_23_read;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_0_0_address0;
wire    tdf5_readFilters41_U0_weight_vecs_0_0_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_0_0_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_0_0_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_0_1_address0;
wire    tdf5_readFilters41_U0_weight_vecs_0_1_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_0_1_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_0_1_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_1_0_address0;
wire    tdf5_readFilters41_U0_weight_vecs_1_0_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_1_0_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_1_0_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_1_1_address0;
wire    tdf5_readFilters41_U0_weight_vecs_1_1_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_1_1_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_1_1_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_2_0_address0;
wire    tdf5_readFilters41_U0_weight_vecs_2_0_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_2_0_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_2_0_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_2_1_address0;
wire    tdf5_readFilters41_U0_weight_vecs_2_1_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_2_1_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_2_1_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_3_0_address0;
wire    tdf5_readFilters41_U0_weight_vecs_3_0_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_3_0_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_3_0_d0;
wire   [6:0] tdf5_readFilters41_U0_weight_vecs_3_1_address0;
wire    tdf5_readFilters41_U0_weight_vecs_3_1_ce0;
wire    tdf5_readFilters41_U0_weight_vecs_3_1_we0;
wire   [15:0] tdf5_readFilters41_U0_weight_vecs_3_1_d0;
wire    ap_channel_done_weight_vecs_3_1;
wire    tdf5_readFilters41_U0_weight_vecs_3_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_1;
wire    ap_sync_channel_write_weight_vecs_3_1;
wire    ap_channel_done_weight_vecs_3_0;
wire    tdf5_readFilters41_U0_weight_vecs_3_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_3_0;
wire    ap_sync_channel_write_weight_vecs_3_0;
wire    ap_channel_done_weight_vecs_2_1;
wire    tdf5_readFilters41_U0_weight_vecs_2_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_1;
wire    ap_sync_channel_write_weight_vecs_2_1;
wire    ap_channel_done_weight_vecs_2_0;
wire    tdf5_readFilters41_U0_weight_vecs_2_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_2_0;
wire    ap_sync_channel_write_weight_vecs_2_0;
wire    ap_channel_done_weight_vecs_1_1;
wire    tdf5_readFilters41_U0_weight_vecs_1_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_1;
wire    ap_sync_channel_write_weight_vecs_1_1;
wire    ap_channel_done_weight_vecs_1_0;
wire    tdf5_readFilters41_U0_weight_vecs_1_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_0;
wire    ap_sync_channel_write_weight_vecs_1_0;
wire    ap_channel_done_weight_vecs_0_1;
wire    tdf5_readFilters41_U0_weight_vecs_0_1_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_1;
wire    ap_sync_channel_write_weight_vecs_0_1;
wire    ap_channel_done_weight_vecs_0_0;
wire    tdf5_readFilters41_U0_weight_vecs_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_0;
wire    ap_sync_channel_write_weight_vecs_0_0;
wire    tdf5_dot_product_U0_ap_start;
wire    tdf5_dot_product_U0_ap_done;
wire    tdf5_dot_product_U0_ap_continue;
wire    tdf5_dot_product_U0_ap_idle;
wire    tdf5_dot_product_U0_ap_ready;
wire   [6:0] tdf5_dot_product_U0_ifmap_vec_0_address0;
wire    tdf5_dot_product_U0_ifmap_vec_0_ce0;
wire   [6:0] tdf5_dot_product_U0_ifmap_vec_1_address0;
wire    tdf5_dot_product_U0_ifmap_vec_1_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_0_0_address0;
wire    tdf5_dot_product_U0_weight_vecs_0_0_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_0_1_address0;
wire    tdf5_dot_product_U0_weight_vecs_0_1_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_1_0_address0;
wire    tdf5_dot_product_U0_weight_vecs_1_0_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_1_1_address0;
wire    tdf5_dot_product_U0_weight_vecs_1_1_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_2_0_address0;
wire    tdf5_dot_product_U0_weight_vecs_2_0_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_2_1_address0;
wire    tdf5_dot_product_U0_weight_vecs_2_1_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_3_0_address0;
wire    tdf5_dot_product_U0_weight_vecs_3_0_ce0;
wire   [6:0] tdf5_dot_product_U0_weight_vecs_3_1_address0;
wire    tdf5_dot_product_U0_weight_vecs_3_1_ce0;
wire   [6:0] tdf5_dot_product_U0_products_0_0_address0;
wire    tdf5_dot_product_U0_products_0_0_ce0;
wire    tdf5_dot_product_U0_products_0_0_we0;
wire   [15:0] tdf5_dot_product_U0_products_0_0_d0;
wire   [6:0] tdf5_dot_product_U0_products_0_1_address0;
wire    tdf5_dot_product_U0_products_0_1_ce0;
wire    tdf5_dot_product_U0_products_0_1_we0;
wire   [15:0] tdf5_dot_product_U0_products_0_1_d0;
wire   [6:0] tdf5_dot_product_U0_products_1_0_address0;
wire    tdf5_dot_product_U0_products_1_0_ce0;
wire    tdf5_dot_product_U0_products_1_0_we0;
wire   [15:0] tdf5_dot_product_U0_products_1_0_d0;
wire   [6:0] tdf5_dot_product_U0_products_1_1_address0;
wire    tdf5_dot_product_U0_products_1_1_ce0;
wire    tdf5_dot_product_U0_products_1_1_we0;
wire   [15:0] tdf5_dot_product_U0_products_1_1_d0;
wire   [6:0] tdf5_dot_product_U0_products_2_0_address0;
wire    tdf5_dot_product_U0_products_2_0_ce0;
wire    tdf5_dot_product_U0_products_2_0_we0;
wire   [15:0] tdf5_dot_product_U0_products_2_0_d0;
wire   [6:0] tdf5_dot_product_U0_products_2_1_address0;
wire    tdf5_dot_product_U0_products_2_1_ce0;
wire    tdf5_dot_product_U0_products_2_1_we0;
wire   [15:0] tdf5_dot_product_U0_products_2_1_d0;
wire   [6:0] tdf5_dot_product_U0_products_3_0_address0;
wire    tdf5_dot_product_U0_products_3_0_ce0;
wire    tdf5_dot_product_U0_products_3_0_we0;
wire   [15:0] tdf5_dot_product_U0_products_3_0_d0;
wire   [6:0] tdf5_dot_product_U0_products_3_1_address0;
wire    tdf5_dot_product_U0_products_3_1_ce0;
wire    tdf5_dot_product_U0_products_3_1_we0;
wire   [15:0] tdf5_dot_product_U0_products_3_1_d0;
wire    ap_channel_done_products_3_1;
wire    tdf5_dot_product_U0_products_3_1_full_n;
reg    ap_sync_reg_channel_write_products_3_1;
wire    ap_sync_channel_write_products_3_1;
wire    ap_channel_done_products_3_0;
wire    tdf5_dot_product_U0_products_3_0_full_n;
reg    ap_sync_reg_channel_write_products_3_0;
wire    ap_sync_channel_write_products_3_0;
wire    ap_channel_done_products_2_1;
wire    tdf5_dot_product_U0_products_2_1_full_n;
reg    ap_sync_reg_channel_write_products_2_1;
wire    ap_sync_channel_write_products_2_1;
wire    ap_channel_done_products_2_0;
wire    tdf5_dot_product_U0_products_2_0_full_n;
reg    ap_sync_reg_channel_write_products_2_0;
wire    ap_sync_channel_write_products_2_0;
wire    ap_channel_done_products_1_1;
wire    tdf5_dot_product_U0_products_1_1_full_n;
reg    ap_sync_reg_channel_write_products_1_1;
wire    ap_sync_channel_write_products_1_1;
wire    ap_channel_done_products_1_0;
wire    tdf5_dot_product_U0_products_1_0_full_n;
reg    ap_sync_reg_channel_write_products_1_0;
wire    ap_sync_channel_write_products_1_0;
wire    ap_channel_done_products_0_1;
wire    tdf5_dot_product_U0_products_0_1_full_n;
reg    ap_sync_reg_channel_write_products_0_1;
wire    ap_sync_channel_write_products_0_1;
wire    ap_channel_done_products_0_0;
wire    tdf5_dot_product_U0_products_0_0_full_n;
reg    ap_sync_reg_channel_write_products_0_0;
wire    ap_sync_channel_write_products_0_0;
wire    tdf5_accum_1_U0_ap_start;
wire    tdf5_accum_1_U0_ap_done;
wire    tdf5_accum_1_U0_ap_continue;
wire    tdf5_accum_1_U0_ap_idle;
wire    tdf5_accum_1_U0_ap_ready;
wire   [6:0] tdf5_accum_1_U0_accum_in_address0;
wire    tdf5_accum_1_U0_accum_in_ce0;
wire   [6:0] tdf5_accum_1_U0_accum_in_address1;
wire    tdf5_accum_1_U0_accum_in_ce1;
wire   [6:0] tdf5_accum_1_U0_accum_in1_address0;
wire    tdf5_accum_1_U0_accum_in1_ce0;
wire   [6:0] tdf5_accum_1_U0_accum_in1_address1;
wire    tdf5_accum_1_U0_accum_in1_ce1;
wire   [3:0] tdf5_accum_1_U0_accum_out_address0;
wire    tdf5_accum_1_U0_accum_out_ce0;
wire    tdf5_accum_1_U0_accum_out_we0;
wire   [15:0] tdf5_accum_1_U0_accum_out_d0;
wire   [3:0] tdf5_accum_1_U0_accum_out_address1;
wire    tdf5_accum_1_U0_accum_out_ce1;
wire    tdf5_accum_1_U0_accum_out_we1;
wire   [15:0] tdf5_accum_1_U0_accum_out_d1;
wire    ap_channel_done_accum1_out_0;
wire    tdf5_accum_1_U0_accum_out_full_n;
wire    tdf5_accum_1_U1_1_ap_start;
wire    tdf5_accum_1_U1_1_ap_done;
wire    tdf5_accum_1_U1_1_ap_continue;
wire    tdf5_accum_1_U1_1_ap_idle;
wire    tdf5_accum_1_U1_1_ap_ready;
wire   [6:0] tdf5_accum_1_U1_1_accum_in_address0;
wire    tdf5_accum_1_U1_1_accum_in_ce0;
wire   [6:0] tdf5_accum_1_U1_1_accum_in_address1;
wire    tdf5_accum_1_U1_1_accum_in_ce1;
wire   [6:0] tdf5_accum_1_U1_1_accum_in1_address0;
wire    tdf5_accum_1_U1_1_accum_in1_ce0;
wire   [6:0] tdf5_accum_1_U1_1_accum_in1_address1;
wire    tdf5_accum_1_U1_1_accum_in1_ce1;
wire   [3:0] tdf5_accum_1_U1_1_accum_out_address0;
wire    tdf5_accum_1_U1_1_accum_out_ce0;
wire    tdf5_accum_1_U1_1_accum_out_we0;
wire   [15:0] tdf5_accum_1_U1_1_accum_out_d0;
wire   [3:0] tdf5_accum_1_U1_1_accum_out_address1;
wire    tdf5_accum_1_U1_1_accum_out_ce1;
wire    tdf5_accum_1_U1_1_accum_out_we1;
wire   [15:0] tdf5_accum_1_U1_1_accum_out_d1;
wire    ap_channel_done_accum1_out_1;
wire    tdf5_accum_1_U1_1_accum_out_full_n;
wire    tdf5_accum_1_U2_2_ap_start;
wire    tdf5_accum_1_U2_2_ap_done;
wire    tdf5_accum_1_U2_2_ap_continue;
wire    tdf5_accum_1_U2_2_ap_idle;
wire    tdf5_accum_1_U2_2_ap_ready;
wire   [6:0] tdf5_accum_1_U2_2_accum_in_address0;
wire    tdf5_accum_1_U2_2_accum_in_ce0;
wire   [6:0] tdf5_accum_1_U2_2_accum_in_address1;
wire    tdf5_accum_1_U2_2_accum_in_ce1;
wire   [6:0] tdf5_accum_1_U2_2_accum_in1_address0;
wire    tdf5_accum_1_U2_2_accum_in1_ce0;
wire   [6:0] tdf5_accum_1_U2_2_accum_in1_address1;
wire    tdf5_accum_1_U2_2_accum_in1_ce1;
wire   [3:0] tdf5_accum_1_U2_2_accum_out_address0;
wire    tdf5_accum_1_U2_2_accum_out_ce0;
wire    tdf5_accum_1_U2_2_accum_out_we0;
wire   [15:0] tdf5_accum_1_U2_2_accum_out_d0;
wire   [3:0] tdf5_accum_1_U2_2_accum_out_address1;
wire    tdf5_accum_1_U2_2_accum_out_ce1;
wire    tdf5_accum_1_U2_2_accum_out_we1;
wire   [15:0] tdf5_accum_1_U2_2_accum_out_d1;
wire    ap_channel_done_accum1_out_2;
wire    tdf5_accum_1_U2_2_accum_out_full_n;
wire    tdf5_accum_1_U3_3_ap_start;
wire    tdf5_accum_1_U3_3_ap_done;
wire    tdf5_accum_1_U3_3_ap_continue;
wire    tdf5_accum_1_U3_3_ap_idle;
wire    tdf5_accum_1_U3_3_ap_ready;
wire   [6:0] tdf5_accum_1_U3_3_accum_in_address0;
wire    tdf5_accum_1_U3_3_accum_in_ce0;
wire   [6:0] tdf5_accum_1_U3_3_accum_in_address1;
wire    tdf5_accum_1_U3_3_accum_in_ce1;
wire   [6:0] tdf5_accum_1_U3_3_accum_in1_address0;
wire    tdf5_accum_1_U3_3_accum_in1_ce0;
wire   [6:0] tdf5_accum_1_U3_3_accum_in1_address1;
wire    tdf5_accum_1_U3_3_accum_in1_ce1;
wire   [3:0] tdf5_accum_1_U3_3_accum_out_address0;
wire    tdf5_accum_1_U3_3_accum_out_ce0;
wire    tdf5_accum_1_U3_3_accum_out_we0;
wire   [15:0] tdf5_accum_1_U3_3_accum_out_d0;
wire   [3:0] tdf5_accum_1_U3_3_accum_out_address1;
wire    tdf5_accum_1_U3_3_accum_out_ce1;
wire    tdf5_accum_1_U3_3_accum_out_we1;
wire   [15:0] tdf5_accum_1_U3_3_accum_out_d1;
wire    ap_channel_done_accum1_out_3;
wire    tdf5_accum_1_U3_3_accum_out_full_n;
wire    tdf5_accum_2_U0_ap_start;
wire    tdf5_accum_2_U0_ap_done;
wire    tdf5_accum_2_U0_ap_continue;
wire    tdf5_accum_2_U0_ap_idle;
wire    tdf5_accum_2_U0_ap_ready;
wire   [3:0] tdf5_accum_2_U0_accum_in_address0;
wire    tdf5_accum_2_U0_accum_in_ce0;
wire   [3:0] tdf5_accum_2_U0_accum_in_address1;
wire    tdf5_accum_2_U0_accum_in_ce1;
wire   [2:0] tdf5_accum_2_U0_accum_out_address0;
wire    tdf5_accum_2_U0_accum_out_ce0;
wire    tdf5_accum_2_U0_accum_out_we0;
wire   [15:0] tdf5_accum_2_U0_accum_out_d0;
wire    ap_channel_done_accum2_out_0;
wire    tdf5_accum_2_U0_accum_out_full_n;
wire    tdf5_accum_2_U1_1_ap_start;
wire    tdf5_accum_2_U1_1_ap_done;
wire    tdf5_accum_2_U1_1_ap_continue;
wire    tdf5_accum_2_U1_1_ap_idle;
wire    tdf5_accum_2_U1_1_ap_ready;
wire   [3:0] tdf5_accum_2_U1_1_accum_in_address0;
wire    tdf5_accum_2_U1_1_accum_in_ce0;
wire   [3:0] tdf5_accum_2_U1_1_accum_in_address1;
wire    tdf5_accum_2_U1_1_accum_in_ce1;
wire   [2:0] tdf5_accum_2_U1_1_accum_out_address0;
wire    tdf5_accum_2_U1_1_accum_out_ce0;
wire    tdf5_accum_2_U1_1_accum_out_we0;
wire   [15:0] tdf5_accum_2_U1_1_accum_out_d0;
wire    ap_channel_done_accum2_out_1;
wire    tdf5_accum_2_U1_1_accum_out_full_n;
wire    tdf5_accum_2_U2_2_ap_start;
wire    tdf5_accum_2_U2_2_ap_done;
wire    tdf5_accum_2_U2_2_ap_continue;
wire    tdf5_accum_2_U2_2_ap_idle;
wire    tdf5_accum_2_U2_2_ap_ready;
wire   [3:0] tdf5_accum_2_U2_2_accum_in_address0;
wire    tdf5_accum_2_U2_2_accum_in_ce0;
wire   [3:0] tdf5_accum_2_U2_2_accum_in_address1;
wire    tdf5_accum_2_U2_2_accum_in_ce1;
wire   [2:0] tdf5_accum_2_U2_2_accum_out_address0;
wire    tdf5_accum_2_U2_2_accum_out_ce0;
wire    tdf5_accum_2_U2_2_accum_out_we0;
wire   [15:0] tdf5_accum_2_U2_2_accum_out_d0;
wire    ap_channel_done_accum2_out_2;
wire    tdf5_accum_2_U2_2_accum_out_full_n;
wire    tdf5_accum_2_U3_3_ap_start;
wire    tdf5_accum_2_U3_3_ap_done;
wire    tdf5_accum_2_U3_3_ap_continue;
wire    tdf5_accum_2_U3_3_ap_idle;
wire    tdf5_accum_2_U3_3_ap_ready;
wire   [3:0] tdf5_accum_2_U3_3_accum_in_address0;
wire    tdf5_accum_2_U3_3_accum_in_ce0;
wire   [3:0] tdf5_accum_2_U3_3_accum_in_address1;
wire    tdf5_accum_2_U3_3_accum_in_ce1;
wire   [2:0] tdf5_accum_2_U3_3_accum_out_address0;
wire    tdf5_accum_2_U3_3_accum_out_ce0;
wire    tdf5_accum_2_U3_3_accum_out_we0;
wire   [15:0] tdf5_accum_2_U3_3_accum_out_d0;
wire    ap_channel_done_accum2_out_3;
wire    tdf5_accum_2_U3_3_accum_out_full_n;
wire    tdf5_accum_3_U0_ap_start;
wire    tdf5_accum_3_U0_ap_done;
wire    tdf5_accum_3_U0_ap_continue;
wire    tdf5_accum_3_U0_ap_idle;
wire    tdf5_accum_3_U0_ap_ready;
wire   [15:0] tdf5_accum_3_U0_accum_in_28;
wire    tdf5_accum_3_U0_accum_in_28_ap_vld;
wire   [2:0] tdf5_accum_3_U0_accum_in_address0;
wire    tdf5_accum_3_U0_accum_in_ce0;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc520_U0_ap_start;
wire    Block_entry_proc_proc520_U0_ap_done;
wire    Block_entry_proc_proc520_U0_ap_continue;
wire    Block_entry_proc_proc520_U0_ap_idle;
wire    Block_entry_proc_proc520_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc520_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf5_accum_3_1_U0_ap_start;
wire    tdf5_accum_3_1_U0_ap_done;
wire    tdf5_accum_3_1_U0_ap_continue;
wire    tdf5_accum_3_1_U0_ap_idle;
wire    tdf5_accum_3_1_U0_ap_ready;
wire   [15:0] tdf5_accum_3_1_U0_accum_in_26;
wire    tdf5_accum_3_1_U0_accum_in_26_ap_vld;
wire   [2:0] tdf5_accum_3_1_U0_accum_in_address0;
wire    tdf5_accum_3_1_U0_accum_in_ce0;
wire    ap_channel_done_tmp_141_channel;
wire    tmp_141_channel_full_n;
wire    Block_entry_proc_proc521_U0_ap_start;
wire    Block_entry_proc_proc521_U0_ap_done;
wire    Block_entry_proc_proc521_U0_ap_continue;
wire    Block_entry_proc_proc521_U0_ap_idle;
wire    Block_entry_proc_proc521_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc521_U0_ap_return;
wire    ap_channel_done_sums_1;
wire    sums_1_full_n;
wire    tdf5_accum_3_2_U0_ap_start;
wire    tdf5_accum_3_2_U0_ap_done;
wire    tdf5_accum_3_2_U0_ap_continue;
wire    tdf5_accum_3_2_U0_ap_idle;
wire    tdf5_accum_3_2_U0_ap_ready;
wire   [15:0] tdf5_accum_3_2_U0_accum_in_24;
wire    tdf5_accum_3_2_U0_accum_in_24_ap_vld;
wire   [2:0] tdf5_accum_3_2_U0_accum_in_address0;
wire    tdf5_accum_3_2_U0_accum_in_ce0;
wire    ap_channel_done_tmp_142_channel;
wire    tmp_142_channel_full_n;
wire    Block_entry_proc_proc522_U0_ap_start;
wire    Block_entry_proc_proc522_U0_ap_done;
wire    Block_entry_proc_proc522_U0_ap_continue;
wire    Block_entry_proc_proc522_U0_ap_idle;
wire    Block_entry_proc_proc522_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc522_U0_ap_return;
wire    ap_channel_done_sums_2;
wire    sums_2_full_n;
wire    tdf5_accum_3_3_U0_ap_start;
wire    tdf5_accum_3_3_U0_ap_done;
wire    tdf5_accum_3_3_U0_ap_continue;
wire    tdf5_accum_3_3_U0_ap_idle;
wire    tdf5_accum_3_3_U0_ap_ready;
wire   [15:0] tdf5_accum_3_3_U0_accum_in_22;
wire    tdf5_accum_3_3_U0_accum_in_22_ap_vld;
wire   [2:0] tdf5_accum_3_3_U0_accum_in_address0;
wire    tdf5_accum_3_3_U0_accum_in_ce0;
wire    ap_channel_done_tmp_143_channel;
wire    tmp_143_channel_full_n;
wire    Block_entry_proc_proc523_U0_ap_start;
wire    Block_entry_proc_proc523_U0_ap_done;
wire    Block_entry_proc_proc523_U0_ap_continue;
wire    Block_entry_proc_proc523_U0_ap_idle;
wire    Block_entry_proc_proc523_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc523_U0_ap_return;
wire    ap_channel_done_sums_3;
wire    sums_3_full_n;
wire    tdf5_adjust_U0_ap_start;
wire    tdf5_adjust_U0_ap_done;
wire    tdf5_adjust_U0_ap_continue;
wire    tdf5_adjust_U0_ap_idle;
wire    tdf5_adjust_U0_ap_ready;
wire   [6:0] tdf5_adjust_U0_adjustments_address0;
wire    tdf5_adjust_U0_adjustments_ce0;
wire    tdf5_adjust_U0_input_indices_23_read;
wire   [6:0] tdf5_adjust_U0_input_indices_23_out_din;
wire    tdf5_adjust_U0_input_indices_23_out_write;
wire   [15:0] tdf5_adjust_U0_ap_return_0;
wire   [15:0] tdf5_adjust_U0_ap_return_1;
wire   [15:0] tdf5_adjust_U0_ap_return_2;
wire   [15:0] tdf5_adjust_U0_ap_return_3;
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
wire    tdf5_poolOutputs_U0_ap_start;
wire    tdf5_poolOutputs_U0_ap_done;
wire    tdf5_poolOutputs_U0_ap_continue;
wire    tdf5_poolOutputs_U0_ap_idle;
wire    tdf5_poolOutputs_U0_ap_ready;
wire    tdf5_poolOutputs_U0_output_indices_04_read;
wire    tdf5_poolOutputs_U0_output_indices_15_read;
wire    tdf5_poolOutputs_U0_input_indices_23_read;
wire    tdf5_poolOutputs_U0_resetMaximum6_read;
wire    tdf5_poolOutputs_U0_storeOutput7_read;
wire   [14:0] tdf5_poolOutputs_U0_out_data_address1;
wire    tdf5_poolOutputs_U0_out_data_ce1;
wire    tdf5_poolOutputs_U0_out_data_we1;
wire   [63:0] tdf5_poolOutputs_U0_out_data_d1;
wire    tdf5_poolOutputs_U0_out_data_full_n;
wire    tdf5_poolOutputs_U0_out_data_write;
wire    ap_sync_continue;
wire    ifmap_vec_0_i_full_n;
wire    ifmap_vec_0_t_empty_n;
wire    ifmap_vec_1_i_full_n;
wire    ifmap_vec_1_t_empty_n;
wire    weight_vecs_0_0_i_full_n;
wire    weight_vecs_0_0_t_empty_n;
wire    weight_vecs_0_1_i_full_n;
wire    weight_vecs_0_1_t_empty_n;
wire    weight_vecs_1_0_i_full_n;
wire    weight_vecs_1_0_t_empty_n;
wire    weight_vecs_1_1_i_full_n;
wire    weight_vecs_1_1_t_empty_n;
wire    weight_vecs_2_0_i_full_n;
wire    weight_vecs_2_0_t_empty_n;
wire    weight_vecs_2_1_i_full_n;
wire    weight_vecs_2_1_t_empty_n;
wire    weight_vecs_3_0_i_full_n;
wire    weight_vecs_3_0_t_empty_n;
wire    weight_vecs_3_1_i_full_n;
wire    weight_vecs_3_1_t_empty_n;
wire    products_0_0_i_full_n;
wire    products_0_0_t_empty_n;
wire   [15:0] products_0_0_t_d1;
wire    products_0_0_t_we1;
wire    products_0_1_i_full_n;
wire    products_0_1_t_empty_n;
wire   [15:0] products_0_1_t_d1;
wire    products_0_1_t_we1;
wire    products_1_0_i_full_n;
wire    products_1_0_t_empty_n;
wire   [15:0] products_1_0_t_d1;
wire    products_1_0_t_we1;
wire    products_1_1_i_full_n;
wire    products_1_1_t_empty_n;
wire   [15:0] products_1_1_t_d1;
wire    products_1_1_t_we1;
wire    products_2_0_i_full_n;
wire    products_2_0_t_empty_n;
wire   [15:0] products_2_0_t_d1;
wire    products_2_0_t_we1;
wire    products_2_1_i_full_n;
wire    products_2_1_t_empty_n;
wire   [15:0] products_2_1_t_d1;
wire    products_2_1_t_we1;
wire    products_3_0_i_full_n;
wire    products_3_0_t_empty_n;
wire   [15:0] products_3_0_t_d1;
wire    products_3_0_t_we1;
wire    products_3_1_i_full_n;
wire    products_3_1_t_empty_n;
wire   [15:0] products_3_1_t_d1;
wire    products_3_1_t_we1;
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
wire    input_indices_23_c_full_n;
wire   [4:0] input_indices_23_c_dout;
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
wire   [15:0] tmp_141_channel_dout;
wire    tmp_141_channel_empty_n;
wire   [15:0] sums_1_dout;
wire    sums_1_empty_n;
wire   [15:0] tmp_142_channel_dout;
wire    tmp_142_channel_empty_n;
wire   [15:0] sums_2_dout;
wire    sums_2_empty_n;
wire   [15:0] tmp_143_channel_dout;
wire    tmp_143_channel_empty_n;
wire   [15:0] sums_3_dout;
wire    sums_3_empty_n;
wire    input_indices_23_c2_full_n;
wire   [6:0] input_indices_23_c2_dout;
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
reg    ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready;
wire    ap_sync_tdf5_get_next_ijk_U0_ap_ready;
reg    ap_sync_reg_tdf5_readInputs42_U0_ap_ready;
wire    ap_sync_tdf5_readInputs42_U0_ap_ready;
wire   [0:0] start_for_tdf5_readFilters41_U0_din;
wire    start_for_tdf5_readFilters41_U0_full_n;
wire   [0:0] start_for_tdf5_readFilters41_U0_dout;
wire    start_for_tdf5_readFilters41_U0_empty_n;
wire    tdf5_readInputs42_U0_start_full_n;
wire    tdf5_readInputs42_U0_start_write;
wire    tdf5_readFilters41_U0_start_full_n;
wire    tdf5_readFilters41_U0_start_write;
wire    tdf5_dot_product_U0_start_full_n;
wire    tdf5_dot_product_U0_start_write;
wire    tdf5_accum_1_U0_start_full_n;
wire    tdf5_accum_1_U0_start_write;
wire    tdf5_accum_1_U1_1_start_full_n;
wire    tdf5_accum_1_U1_1_start_write;
wire    tdf5_accum_1_U2_2_start_full_n;
wire    tdf5_accum_1_U2_2_start_write;
wire    tdf5_accum_1_U3_3_start_full_n;
wire    tdf5_accum_1_U3_3_start_write;
wire    tdf5_accum_2_U0_start_full_n;
wire    tdf5_accum_2_U0_start_write;
wire    tdf5_accum_2_U1_1_start_full_n;
wire    tdf5_accum_2_U1_1_start_write;
wire    tdf5_accum_2_U2_2_start_full_n;
wire    tdf5_accum_2_U2_2_start_write;
wire    tdf5_accum_2_U3_3_start_full_n;
wire    tdf5_accum_2_U3_3_start_write;
wire    tdf5_accum_3_U0_start_full_n;
wire    tdf5_accum_3_U0_start_write;
wire    Block_entry_proc_proc520_U0_start_full_n;
wire    Block_entry_proc_proc520_U0_start_write;
wire    tdf5_accum_3_1_U0_start_full_n;
wire    tdf5_accum_3_1_U0_start_write;
wire    Block_entry_proc_proc521_U0_start_full_n;
wire    Block_entry_proc_proc521_U0_start_write;
wire    tdf5_accum_3_2_U0_start_full_n;
wire    tdf5_accum_3_2_U0_start_write;
wire    Block_entry_proc_proc522_U0_start_full_n;
wire    Block_entry_proc_proc522_U0_start_write;
wire    tdf5_accum_3_3_U0_start_full_n;
wire    tdf5_accum_3_3_U0_start_write;
wire    Block_entry_proc_proc523_U0_start_full_n;
wire    Block_entry_proc_proc523_U0_start_write;
wire    tdf5_adjust_U0_start_full_n;
wire    tdf5_adjust_U0_start_write;
wire    tdf5_poolOutputs_U0_start_full_n;
wire    tdf5_poolOutputs_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_input_indices_1 = 1'b0;
#0 ap_sync_reg_channel_write_input_indices_0 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_1 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_3_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_2_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_3_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_2_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_3 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_2 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_1 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_0 = 1'b0;
#0 ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf5_readInputs42_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
ifmap_vec_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_0),
    .i_full_n(ifmap_vec_0_i_full_n),
    .i_ce0(tdf5_readInputs42_U0_ifmap_vec_0_ce0),
    .i_we0(tdf5_readInputs42_U0_ifmap_vec_0_we0),
    .i_address0(tdf5_readInputs42_U0_ifmap_vec_0_address0),
    .i_d0(tdf5_readInputs42_U0_ifmap_vec_0_d0),
    .i_q0(ifmap_vec_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_ifmap_vec_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_ifmap_vec_0_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
ifmap_vec_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_1),
    .i_full_n(ifmap_vec_1_i_full_n),
    .i_ce0(tdf5_readInputs42_U0_ifmap_vec_1_ce0),
    .i_we0(tdf5_readInputs42_U0_ifmap_vec_1_we0),
    .i_address0(tdf5_readInputs42_U0_ifmap_vec_1_address0),
    .i_d0(tdf5_readInputs42_U0_ifmap_vec_1_d0),
    .i_q0(ifmap_vec_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_1_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_ifmap_vec_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_ifmap_vec_1_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_0),
    .i_full_n(weight_vecs_0_0_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_0_0_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_0_0_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_0_0_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_0_0_d0),
    .i_q0(weight_vecs_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_1),
    .i_full_n(weight_vecs_0_1_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_0_1_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_0_1_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_0_1_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_0_1_d0),
    .i_q0(weight_vecs_0_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_1_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_0_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_0_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_0),
    .i_full_n(weight_vecs_1_0_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_1_0_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_1_0_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_1_0_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_1_0_d0),
    .i_q0(weight_vecs_1_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_1_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_1_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_1),
    .i_full_n(weight_vecs_1_1_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_1_1_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_1_1_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_1_1_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_1_1_d0),
    .i_q0(weight_vecs_1_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_1_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_1_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_1_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_0),
    .i_full_n(weight_vecs_2_0_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_2_0_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_2_0_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_2_0_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_2_0_d0),
    .i_q0(weight_vecs_2_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_2_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_2_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_2_1),
    .i_full_n(weight_vecs_2_1_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_2_1_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_2_1_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_2_1_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_2_1_d0),
    .i_q0(weight_vecs_2_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_2_1_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_2_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_2_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_2_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_0),
    .i_full_n(weight_vecs_3_0_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_3_0_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_3_0_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_3_0_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_3_0_d0),
    .i_q0(weight_vecs_3_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_0_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_3_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_3_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
weight_vecs_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_3_1),
    .i_full_n(weight_vecs_3_1_i_full_n),
    .i_ce0(tdf5_readFilters41_U0_weight_vecs_3_1_ce0),
    .i_we0(tdf5_readFilters41_U0_weight_vecs_3_1_we0),
    .i_address0(tdf5_readFilters41_U0_weight_vecs_3_1_address0),
    .i_d0(tdf5_readFilters41_U0_weight_vecs_3_1_d0),
    .i_q0(weight_vecs_3_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_3_1_t_empty_n),
    .t_ce0(tdf5_dot_product_U0_weight_vecs_3_1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_dot_product_U0_weight_vecs_3_1_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_3_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_0),
    .i_full_n(products_0_0_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_0_0_ce0),
    .i_we0(tdf5_dot_product_U0_products_0_0_we0),
    .i_address0(tdf5_dot_product_U0_products_0_0_address0),
    .i_d0(tdf5_dot_product_U0_products_0_0_d0),
    .i_q0(products_0_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_0_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U0_ap_ready),
    .t_empty_n(products_0_0_t_empty_n),
    .t_ce0(tdf5_accum_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_0_0_t_q0),
    .t_ce1(tdf5_accum_1_U0_accum_in_ce1),
    .t_address1(tdf5_accum_1_U0_accum_in_address1),
    .t_q1(products_0_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_1),
    .i_full_n(products_0_1_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_0_1_ce0),
    .i_we0(tdf5_dot_product_U0_products_0_1_we0),
    .i_address0(tdf5_dot_product_U0_products_0_1_address0),
    .i_d0(tdf5_dot_product_U0_products_0_1_d0),
    .i_q0(products_0_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_0_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U0_ap_ready),
    .t_empty_n(products_0_1_t_empty_n),
    .t_ce0(tdf5_accum_1_U0_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U0_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_0_1_t_q0),
    .t_ce1(tdf5_accum_1_U0_accum_in1_ce1),
    .t_address1(tdf5_accum_1_U0_accum_in1_address1),
    .t_q1(products_0_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_0),
    .i_full_n(products_1_0_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_1_0_ce0),
    .i_we0(tdf5_dot_product_U0_products_1_0_we0),
    .i_address0(tdf5_dot_product_U0_products_1_0_address0),
    .i_d0(tdf5_dot_product_U0_products_1_0_d0),
    .i_q0(products_1_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_1_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_0_t_empty_n),
    .t_ce0(tdf5_accum_1_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_1_0_t_q0),
    .t_ce1(tdf5_accum_1_U1_1_accum_in_ce1),
    .t_address1(tdf5_accum_1_U1_1_accum_in_address1),
    .t_q1(products_1_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_1),
    .i_full_n(products_1_1_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_1_1_ce0),
    .i_we0(tdf5_dot_product_U0_products_1_1_we0),
    .i_address0(tdf5_dot_product_U0_products_1_1_address0),
    .i_d0(tdf5_dot_product_U0_products_1_1_d0),
    .i_q0(products_1_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_1_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_1_t_empty_n),
    .t_ce0(tdf5_accum_1_U1_1_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U1_1_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_1_1_t_q0),
    .t_ce1(tdf5_accum_1_U1_1_accum_in1_ce1),
    .t_address1(tdf5_accum_1_U1_1_accum_in1_address1),
    .t_q1(products_1_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_2_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_0),
    .i_full_n(products_2_0_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_2_0_ce0),
    .i_we0(tdf5_dot_product_U0_products_2_0_we0),
    .i_address0(tdf5_dot_product_U0_products_2_0_address0),
    .i_d0(tdf5_dot_product_U0_products_2_0_d0),
    .i_q0(products_2_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_2_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_0_t_empty_n),
    .t_ce0(tdf5_accum_1_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_2_0_t_q0),
    .t_ce1(tdf5_accum_1_U2_2_accum_in_ce1),
    .t_address1(tdf5_accum_1_U2_2_accum_in_address1),
    .t_q1(products_2_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_2_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_2_1),
    .i_full_n(products_2_1_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_2_1_ce0),
    .i_we0(tdf5_dot_product_U0_products_2_1_we0),
    .i_address0(tdf5_dot_product_U0_products_2_1_address0),
    .i_d0(tdf5_dot_product_U0_products_2_1_d0),
    .i_q0(products_2_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_2_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U2_2_ap_ready),
    .t_empty_n(products_2_1_t_empty_n),
    .t_ce0(tdf5_accum_1_U2_2_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U2_2_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_2_1_t_q0),
    .t_ce1(tdf5_accum_1_U2_2_accum_in1_ce1),
    .t_address1(tdf5_accum_1_U2_2_accum_in1_address1),
    .t_q1(products_2_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_3_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_0),
    .i_full_n(products_3_0_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_3_0_ce0),
    .i_we0(tdf5_dot_product_U0_products_3_0_we0),
    .i_address0(tdf5_dot_product_U0_products_3_0_address0),
    .i_d0(tdf5_dot_product_U0_products_3_0_d0),
    .i_q0(products_3_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_3_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_0_t_empty_n),
    .t_ce0(tdf5_accum_1_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_3_0_t_q0),
    .t_ce1(tdf5_accum_1_U3_3_accum_in_ce1),
    .t_address1(tdf5_accum_1_U3_3_accum_in_address1),
    .t_q1(products_3_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
products_3_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_3_1),
    .i_full_n(products_3_1_i_full_n),
    .i_ce0(tdf5_dot_product_U0_products_3_1_ce0),
    .i_we0(tdf5_dot_product_U0_products_3_1_we0),
    .i_address0(tdf5_dot_product_U0_products_3_1_address0),
    .i_d0(tdf5_dot_product_U0_products_3_1_d0),
    .i_q0(products_3_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(7'd0),
    .i_q1(products_3_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_1_U3_3_ap_ready),
    .t_empty_n(products_3_1_t_empty_n),
    .t_ce0(tdf5_accum_1_U3_3_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_1_U3_3_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_3_1_t_q0),
    .t_ce1(tdf5_accum_1_U3_3_accum_in1_ce1),
    .t_address1(tdf5_accum_1_U3_3_accum_in1_address1),
    .t_q1(products_3_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
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
    .i_q1(accum1_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf5_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(tdf5_accum_2_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf5_accum_2_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
accum1_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_1_U1_1_ap_done),
    .i_full_n(accum1_out_1_i_full_n),
    .i_ce0(tdf5_accum_1_U1_1_accum_out_ce0),
    .i_we0(tdf5_accum_1_U1_1_accum_out_we0),
    .i_address0(tdf5_accum_1_U1_1_accum_out_address0),
    .i_d0(tdf5_accum_1_U1_1_accum_out_d0),
    .i_q0(accum1_out_1_i_q0),
    .i_ce1(tdf5_accum_1_U1_1_accum_out_ce1),
    .i_we1(tdf5_accum_1_U1_1_accum_out_we1),
    .i_address1(tdf5_accum_1_U1_1_accum_out_address1),
    .i_d1(tdf5_accum_1_U1_1_accum_out_d1),
    .i_q1(accum1_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_2_U1_1_ap_ready),
    .t_empty_n(accum1_out_1_t_empty_n),
    .t_ce0(tdf5_accum_2_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_2_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_1_t_q0),
    .t_ce1(tdf5_accum_2_U1_1_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf5_accum_2_U1_1_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
accum1_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_1_U2_2_ap_done),
    .i_full_n(accum1_out_2_i_full_n),
    .i_ce0(tdf5_accum_1_U2_2_accum_out_ce0),
    .i_we0(tdf5_accum_1_U2_2_accum_out_we0),
    .i_address0(tdf5_accum_1_U2_2_accum_out_address0),
    .i_d0(tdf5_accum_1_U2_2_accum_out_d0),
    .i_q0(accum1_out_2_i_q0),
    .i_ce1(tdf5_accum_1_U2_2_accum_out_ce1),
    .i_we1(tdf5_accum_1_U2_2_accum_out_we1),
    .i_address1(tdf5_accum_1_U2_2_accum_out_address1),
    .i_d1(tdf5_accum_1_U2_2_accum_out_d1),
    .i_q1(accum1_out_2_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_2_U2_2_ap_ready),
    .t_empty_n(accum1_out_2_t_empty_n),
    .t_ce0(tdf5_accum_2_U2_2_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_2_U2_2_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_2_t_q0),
    .t_ce1(tdf5_accum_2_U2_2_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf5_accum_2_U2_2_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_2_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
accum1_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_1_U3_3_ap_done),
    .i_full_n(accum1_out_3_i_full_n),
    .i_ce0(tdf5_accum_1_U3_3_accum_out_ce0),
    .i_we0(tdf5_accum_1_U3_3_accum_out_we0),
    .i_address0(tdf5_accum_1_U3_3_accum_out_address0),
    .i_d0(tdf5_accum_1_U3_3_accum_out_d0),
    .i_q0(accum1_out_3_i_q0),
    .i_ce1(tdf5_accum_1_U3_3_accum_out_ce1),
    .i_we1(tdf5_accum_1_U3_3_accum_out_we1),
    .i_address1(tdf5_accum_1_U3_3_accum_out_address1),
    .i_d1(tdf5_accum_1_U3_3_accum_out_d1),
    .i_q1(accum1_out_3_i_q1),
    .t_ce(1'b1),
    .t_read(tdf5_accum_2_U3_3_ap_ready),
    .t_empty_n(accum1_out_3_t_empty_n),
    .t_ce0(tdf5_accum_2_U3_3_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_2_U3_3_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_3_t_q0),
    .t_ce1(tdf5_accum_2_U3_3_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf5_accum_2_U3_3_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_3_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_2_U0_ap_done),
    .i_full_n(accum2_out_0_i_full_n),
    .i_ce0(tdf5_accum_2_U0_accum_out_ce0),
    .i_we0(tdf5_accum_2_U0_accum_out_we0),
    .i_address0(tdf5_accum_2_U0_accum_out_address0),
    .i_d0(tdf5_accum_2_U0_accum_out_d0),
    .i_q0(accum2_out_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_accum_3_U0_ap_ready),
    .t_empty_n(accum2_out_0_t_empty_n),
    .t_ce0(tdf5_accum_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_2_U1_1_ap_done),
    .i_full_n(accum2_out_1_i_full_n),
    .i_ce0(tdf5_accum_2_U1_1_accum_out_ce0),
    .i_we0(tdf5_accum_2_U1_1_accum_out_we0),
    .i_address0(tdf5_accum_2_U1_1_accum_out_address0),
    .i_d0(tdf5_accum_2_U1_1_accum_out_d0),
    .i_q0(accum2_out_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_accum_3_1_U0_ap_ready),
    .t_empty_n(accum2_out_1_t_empty_n),
    .t_ce0(tdf5_accum_3_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_3_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_1_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_2_U2_2_ap_done),
    .i_full_n(accum2_out_2_i_full_n),
    .i_ce0(tdf5_accum_2_U2_2_accum_out_ce0),
    .i_we0(tdf5_accum_2_U2_2_accum_out_we0),
    .i_address0(tdf5_accum_2_U2_2_accum_out_address0),
    .i_d0(tdf5_accum_2_U2_2_accum_out_d0),
    .i_q0(accum2_out_2_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_accum_3_2_U0_ap_ready),
    .t_empty_n(accum2_out_2_t_empty_n),
    .t_ce0(tdf5_accum_3_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_3_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_2_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf5_accum_2_U3_3_ap_done),
    .i_full_n(accum2_out_3_i_full_n),
    .i_ce0(tdf5_accum_2_U3_3_accum_out_ce0),
    .i_we0(tdf5_accum_2_U3_3_accum_out_we0),
    .i_address0(tdf5_accum_2_U3_3_accum_out_address0),
    .i_d0(tdf5_accum_2_U3_3_accum_out_d0),
    .i_q0(accum2_out_3_i_q0),
    .t_ce(1'b1),
    .t_read(tdf5_accum_3_3_U0_ap_ready),
    .t_empty_n(accum2_out_3_t_empty_n),
    .t_ce0(tdf5_accum_3_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf5_accum_3_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_3_t_q0)
);

td_fused_top_tdf5_get_next_ijk tdf5_get_next_ijk_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_get_next_ijk_U0_ap_start),
    .start_full_n(start_for_tdf5_readFilters41_U0_full_n),
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

td_fused_top_tdf5_readInputs42 tdf5_readInputs42_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_readInputs42_U0_ap_start),
    .ap_done(tdf5_readInputs42_U0_ap_done),
    .ap_continue(tdf5_readInputs42_U0_ap_continue),
    .ap_idle(tdf5_readInputs42_U0_ap_idle),
    .ap_ready(tdf5_readInputs42_U0_ap_ready),
    .in_data_address0(tdf5_readInputs42_U0_in_data_address0),
    .in_data_ce0(tdf5_readInputs42_U0_in_data_ce0),
    .in_data_q0(in_data_q0),
    .i_15(input_indices_0_dout),
    .j_15(input_indices_1_dout),
    .ifmap_vec_0_address0(tdf5_readInputs42_U0_ifmap_vec_0_address0),
    .ifmap_vec_0_ce0(tdf5_readInputs42_U0_ifmap_vec_0_ce0),
    .ifmap_vec_0_we0(tdf5_readInputs42_U0_ifmap_vec_0_we0),
    .ifmap_vec_0_d0(tdf5_readInputs42_U0_ifmap_vec_0_d0),
    .ifmap_vec_1_address0(tdf5_readInputs42_U0_ifmap_vec_1_address0),
    .ifmap_vec_1_ce0(tdf5_readInputs42_U0_ifmap_vec_1_ce0),
    .ifmap_vec_1_we0(tdf5_readInputs42_U0_ifmap_vec_1_we0),
    .ifmap_vec_1_d0(tdf5_readInputs42_U0_ifmap_vec_1_d0)
);

td_fused_top_tdf5_readFilters41 tdf5_readFilters41_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_readFilters41_U0_ap_start),
    .ap_done(tdf5_readFilters41_U0_ap_done),
    .ap_continue(tdf5_readFilters41_U0_ap_continue),
    .ap_idle(tdf5_readFilters41_U0_ap_idle),
    .ap_ready(tdf5_readFilters41_U0_ap_ready),
    .filter_data_0_address0(tdf5_readFilters41_U0_filter_data_0_address0),
    .filter_data_0_ce0(tdf5_readFilters41_U0_filter_data_0_ce0),
    .filter_data_0_q0(filter_data_0_q0),
    .filter_data_1_address0(tdf5_readFilters41_U0_filter_data_1_address0),
    .filter_data_1_ce0(tdf5_readFilters41_U0_filter_data_1_ce0),
    .filter_data_1_q0(filter_data_1_q0),
    .filter_data_2_address0(tdf5_readFilters41_U0_filter_data_2_address0),
    .filter_data_2_ce0(tdf5_readFilters41_U0_filter_data_2_ce0),
    .filter_data_2_q0(filter_data_2_q0),
    .filter_data_3_address0(tdf5_readFilters41_U0_filter_data_3_address0),
    .filter_data_3_ce0(tdf5_readFilters41_U0_filter_data_3_ce0),
    .filter_data_3_q0(filter_data_3_q0),
    .input_indices_23_dout(input_indices_23_c_dout),
    .input_indices_23_empty_n(input_indices_23_c_empty_n),
    .input_indices_23_read(tdf5_readFilters41_U0_input_indices_23_read),
    .weight_vecs_0_0_address0(tdf5_readFilters41_U0_weight_vecs_0_0_address0),
    .weight_vecs_0_0_ce0(tdf5_readFilters41_U0_weight_vecs_0_0_ce0),
    .weight_vecs_0_0_we0(tdf5_readFilters41_U0_weight_vecs_0_0_we0),
    .weight_vecs_0_0_d0(tdf5_readFilters41_U0_weight_vecs_0_0_d0),
    .weight_vecs_0_1_address0(tdf5_readFilters41_U0_weight_vecs_0_1_address0),
    .weight_vecs_0_1_ce0(tdf5_readFilters41_U0_weight_vecs_0_1_ce0),
    .weight_vecs_0_1_we0(tdf5_readFilters41_U0_weight_vecs_0_1_we0),
    .weight_vecs_0_1_d0(tdf5_readFilters41_U0_weight_vecs_0_1_d0),
    .weight_vecs_1_0_address0(tdf5_readFilters41_U0_weight_vecs_1_0_address0),
    .weight_vecs_1_0_ce0(tdf5_readFilters41_U0_weight_vecs_1_0_ce0),
    .weight_vecs_1_0_we0(tdf5_readFilters41_U0_weight_vecs_1_0_we0),
    .weight_vecs_1_0_d0(tdf5_readFilters41_U0_weight_vecs_1_0_d0),
    .weight_vecs_1_1_address0(tdf5_readFilters41_U0_weight_vecs_1_1_address0),
    .weight_vecs_1_1_ce0(tdf5_readFilters41_U0_weight_vecs_1_1_ce0),
    .weight_vecs_1_1_we0(tdf5_readFilters41_U0_weight_vecs_1_1_we0),
    .weight_vecs_1_1_d0(tdf5_readFilters41_U0_weight_vecs_1_1_d0),
    .weight_vecs_2_0_address0(tdf5_readFilters41_U0_weight_vecs_2_0_address0),
    .weight_vecs_2_0_ce0(tdf5_readFilters41_U0_weight_vecs_2_0_ce0),
    .weight_vecs_2_0_we0(tdf5_readFilters41_U0_weight_vecs_2_0_we0),
    .weight_vecs_2_0_d0(tdf5_readFilters41_U0_weight_vecs_2_0_d0),
    .weight_vecs_2_1_address0(tdf5_readFilters41_U0_weight_vecs_2_1_address0),
    .weight_vecs_2_1_ce0(tdf5_readFilters41_U0_weight_vecs_2_1_ce0),
    .weight_vecs_2_1_we0(tdf5_readFilters41_U0_weight_vecs_2_1_we0),
    .weight_vecs_2_1_d0(tdf5_readFilters41_U0_weight_vecs_2_1_d0),
    .weight_vecs_3_0_address0(tdf5_readFilters41_U0_weight_vecs_3_0_address0),
    .weight_vecs_3_0_ce0(tdf5_readFilters41_U0_weight_vecs_3_0_ce0),
    .weight_vecs_3_0_we0(tdf5_readFilters41_U0_weight_vecs_3_0_we0),
    .weight_vecs_3_0_d0(tdf5_readFilters41_U0_weight_vecs_3_0_d0),
    .weight_vecs_3_1_address0(tdf5_readFilters41_U0_weight_vecs_3_1_address0),
    .weight_vecs_3_1_ce0(tdf5_readFilters41_U0_weight_vecs_3_1_ce0),
    .weight_vecs_3_1_we0(tdf5_readFilters41_U0_weight_vecs_3_1_we0),
    .weight_vecs_3_1_d0(tdf5_readFilters41_U0_weight_vecs_3_1_d0)
);

td_fused_top_tdf5_dot_product tdf5_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_dot_product_U0_ap_start),
    .ap_done(tdf5_dot_product_U0_ap_done),
    .ap_continue(tdf5_dot_product_U0_ap_continue),
    .ap_idle(tdf5_dot_product_U0_ap_idle),
    .ap_ready(tdf5_dot_product_U0_ap_ready),
    .ifmap_vec_0_address0(tdf5_dot_product_U0_ifmap_vec_0_address0),
    .ifmap_vec_0_ce0(tdf5_dot_product_U0_ifmap_vec_0_ce0),
    .ifmap_vec_0_q0(ifmap_vec_0_t_q0),
    .ifmap_vec_1_address0(tdf5_dot_product_U0_ifmap_vec_1_address0),
    .ifmap_vec_1_ce0(tdf5_dot_product_U0_ifmap_vec_1_ce0),
    .ifmap_vec_1_q0(ifmap_vec_1_t_q0),
    .weight_vecs_0_0_address0(tdf5_dot_product_U0_weight_vecs_0_0_address0),
    .weight_vecs_0_0_ce0(tdf5_dot_product_U0_weight_vecs_0_0_ce0),
    .weight_vecs_0_0_q0(weight_vecs_0_0_t_q0),
    .weight_vecs_0_1_address0(tdf5_dot_product_U0_weight_vecs_0_1_address0),
    .weight_vecs_0_1_ce0(tdf5_dot_product_U0_weight_vecs_0_1_ce0),
    .weight_vecs_0_1_q0(weight_vecs_0_1_t_q0),
    .weight_vecs_1_0_address0(tdf5_dot_product_U0_weight_vecs_1_0_address0),
    .weight_vecs_1_0_ce0(tdf5_dot_product_U0_weight_vecs_1_0_ce0),
    .weight_vecs_1_0_q0(weight_vecs_1_0_t_q0),
    .weight_vecs_1_1_address0(tdf5_dot_product_U0_weight_vecs_1_1_address0),
    .weight_vecs_1_1_ce0(tdf5_dot_product_U0_weight_vecs_1_1_ce0),
    .weight_vecs_1_1_q0(weight_vecs_1_1_t_q0),
    .weight_vecs_2_0_address0(tdf5_dot_product_U0_weight_vecs_2_0_address0),
    .weight_vecs_2_0_ce0(tdf5_dot_product_U0_weight_vecs_2_0_ce0),
    .weight_vecs_2_0_q0(weight_vecs_2_0_t_q0),
    .weight_vecs_2_1_address0(tdf5_dot_product_U0_weight_vecs_2_1_address0),
    .weight_vecs_2_1_ce0(tdf5_dot_product_U0_weight_vecs_2_1_ce0),
    .weight_vecs_2_1_q0(weight_vecs_2_1_t_q0),
    .weight_vecs_3_0_address0(tdf5_dot_product_U0_weight_vecs_3_0_address0),
    .weight_vecs_3_0_ce0(tdf5_dot_product_U0_weight_vecs_3_0_ce0),
    .weight_vecs_3_0_q0(weight_vecs_3_0_t_q0),
    .weight_vecs_3_1_address0(tdf5_dot_product_U0_weight_vecs_3_1_address0),
    .weight_vecs_3_1_ce0(tdf5_dot_product_U0_weight_vecs_3_1_ce0),
    .weight_vecs_3_1_q0(weight_vecs_3_1_t_q0),
    .products_0_0_address0(tdf5_dot_product_U0_products_0_0_address0),
    .products_0_0_ce0(tdf5_dot_product_U0_products_0_0_ce0),
    .products_0_0_we0(tdf5_dot_product_U0_products_0_0_we0),
    .products_0_0_d0(tdf5_dot_product_U0_products_0_0_d0),
    .products_0_1_address0(tdf5_dot_product_U0_products_0_1_address0),
    .products_0_1_ce0(tdf5_dot_product_U0_products_0_1_ce0),
    .products_0_1_we0(tdf5_dot_product_U0_products_0_1_we0),
    .products_0_1_d0(tdf5_dot_product_U0_products_0_1_d0),
    .products_1_0_address0(tdf5_dot_product_U0_products_1_0_address0),
    .products_1_0_ce0(tdf5_dot_product_U0_products_1_0_ce0),
    .products_1_0_we0(tdf5_dot_product_U0_products_1_0_we0),
    .products_1_0_d0(tdf5_dot_product_U0_products_1_0_d0),
    .products_1_1_address0(tdf5_dot_product_U0_products_1_1_address0),
    .products_1_1_ce0(tdf5_dot_product_U0_products_1_1_ce0),
    .products_1_1_we0(tdf5_dot_product_U0_products_1_1_we0),
    .products_1_1_d0(tdf5_dot_product_U0_products_1_1_d0),
    .products_2_0_address0(tdf5_dot_product_U0_products_2_0_address0),
    .products_2_0_ce0(tdf5_dot_product_U0_products_2_0_ce0),
    .products_2_0_we0(tdf5_dot_product_U0_products_2_0_we0),
    .products_2_0_d0(tdf5_dot_product_U0_products_2_0_d0),
    .products_2_1_address0(tdf5_dot_product_U0_products_2_1_address0),
    .products_2_1_ce0(tdf5_dot_product_U0_products_2_1_ce0),
    .products_2_1_we0(tdf5_dot_product_U0_products_2_1_we0),
    .products_2_1_d0(tdf5_dot_product_U0_products_2_1_d0),
    .products_3_0_address0(tdf5_dot_product_U0_products_3_0_address0),
    .products_3_0_ce0(tdf5_dot_product_U0_products_3_0_ce0),
    .products_3_0_we0(tdf5_dot_product_U0_products_3_0_we0),
    .products_3_0_d0(tdf5_dot_product_U0_products_3_0_d0),
    .products_3_1_address0(tdf5_dot_product_U0_products_3_1_address0),
    .products_3_1_ce0(tdf5_dot_product_U0_products_3_1_ce0),
    .products_3_1_we0(tdf5_dot_product_U0_products_3_1_we0),
    .products_3_1_d0(tdf5_dot_product_U0_products_3_1_d0)
);

td_fused_top_tdf5_accum_1 tdf5_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_1_U0_ap_start),
    .ap_done(tdf5_accum_1_U0_ap_done),
    .ap_continue(tdf5_accum_1_U0_ap_continue),
    .ap_idle(tdf5_accum_1_U0_ap_idle),
    .ap_ready(tdf5_accum_1_U0_ap_ready),
    .accum_in_address0(tdf5_accum_1_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_1_U0_accum_in_ce0),
    .accum_in_q0(products_0_0_t_q0),
    .accum_in_address1(tdf5_accum_1_U0_accum_in_address1),
    .accum_in_ce1(tdf5_accum_1_U0_accum_in_ce1),
    .accum_in_q1(products_0_0_t_q1),
    .accum_in1_address0(tdf5_accum_1_U0_accum_in1_address0),
    .accum_in1_ce0(tdf5_accum_1_U0_accum_in1_ce0),
    .accum_in1_q0(products_0_1_t_q0),
    .accum_in1_address1(tdf5_accum_1_U0_accum_in1_address1),
    .accum_in1_ce1(tdf5_accum_1_U0_accum_in1_ce1),
    .accum_in1_q1(products_0_1_t_q1),
    .accum_out_address0(tdf5_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf5_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf5_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf5_accum_1_U0_accum_out_d0),
    .accum_out_address1(tdf5_accum_1_U0_accum_out_address1),
    .accum_out_ce1(tdf5_accum_1_U0_accum_out_ce1),
    .accum_out_we1(tdf5_accum_1_U0_accum_out_we1),
    .accum_out_d1(tdf5_accum_1_U0_accum_out_d1)
);

td_fused_top_tdf5_accum_1 tdf5_accum_1_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_1_U1_1_ap_start),
    .ap_done(tdf5_accum_1_U1_1_ap_done),
    .ap_continue(tdf5_accum_1_U1_1_ap_continue),
    .ap_idle(tdf5_accum_1_U1_1_ap_idle),
    .ap_ready(tdf5_accum_1_U1_1_ap_ready),
    .accum_in_address0(tdf5_accum_1_U1_1_accum_in_address0),
    .accum_in_ce0(tdf5_accum_1_U1_1_accum_in_ce0),
    .accum_in_q0(products_1_0_t_q0),
    .accum_in_address1(tdf5_accum_1_U1_1_accum_in_address1),
    .accum_in_ce1(tdf5_accum_1_U1_1_accum_in_ce1),
    .accum_in_q1(products_1_0_t_q1),
    .accum_in1_address0(tdf5_accum_1_U1_1_accum_in1_address0),
    .accum_in1_ce0(tdf5_accum_1_U1_1_accum_in1_ce0),
    .accum_in1_q0(products_1_1_t_q0),
    .accum_in1_address1(tdf5_accum_1_U1_1_accum_in1_address1),
    .accum_in1_ce1(tdf5_accum_1_U1_1_accum_in1_ce1),
    .accum_in1_q1(products_1_1_t_q1),
    .accum_out_address0(tdf5_accum_1_U1_1_accum_out_address0),
    .accum_out_ce0(tdf5_accum_1_U1_1_accum_out_ce0),
    .accum_out_we0(tdf5_accum_1_U1_1_accum_out_we0),
    .accum_out_d0(tdf5_accum_1_U1_1_accum_out_d0),
    .accum_out_address1(tdf5_accum_1_U1_1_accum_out_address1),
    .accum_out_ce1(tdf5_accum_1_U1_1_accum_out_ce1),
    .accum_out_we1(tdf5_accum_1_U1_1_accum_out_we1),
    .accum_out_d1(tdf5_accum_1_U1_1_accum_out_d1)
);

td_fused_top_tdf5_accum_1 tdf5_accum_1_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_1_U2_2_ap_start),
    .ap_done(tdf5_accum_1_U2_2_ap_done),
    .ap_continue(tdf5_accum_1_U2_2_ap_continue),
    .ap_idle(tdf5_accum_1_U2_2_ap_idle),
    .ap_ready(tdf5_accum_1_U2_2_ap_ready),
    .accum_in_address0(tdf5_accum_1_U2_2_accum_in_address0),
    .accum_in_ce0(tdf5_accum_1_U2_2_accum_in_ce0),
    .accum_in_q0(products_2_0_t_q0),
    .accum_in_address1(tdf5_accum_1_U2_2_accum_in_address1),
    .accum_in_ce1(tdf5_accum_1_U2_2_accum_in_ce1),
    .accum_in_q1(products_2_0_t_q1),
    .accum_in1_address0(tdf5_accum_1_U2_2_accum_in1_address0),
    .accum_in1_ce0(tdf5_accum_1_U2_2_accum_in1_ce0),
    .accum_in1_q0(products_2_1_t_q0),
    .accum_in1_address1(tdf5_accum_1_U2_2_accum_in1_address1),
    .accum_in1_ce1(tdf5_accum_1_U2_2_accum_in1_ce1),
    .accum_in1_q1(products_2_1_t_q1),
    .accum_out_address0(tdf5_accum_1_U2_2_accum_out_address0),
    .accum_out_ce0(tdf5_accum_1_U2_2_accum_out_ce0),
    .accum_out_we0(tdf5_accum_1_U2_2_accum_out_we0),
    .accum_out_d0(tdf5_accum_1_U2_2_accum_out_d0),
    .accum_out_address1(tdf5_accum_1_U2_2_accum_out_address1),
    .accum_out_ce1(tdf5_accum_1_U2_2_accum_out_ce1),
    .accum_out_we1(tdf5_accum_1_U2_2_accum_out_we1),
    .accum_out_d1(tdf5_accum_1_U2_2_accum_out_d1)
);

td_fused_top_tdf5_accum_1 tdf5_accum_1_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_1_U3_3_ap_start),
    .ap_done(tdf5_accum_1_U3_3_ap_done),
    .ap_continue(tdf5_accum_1_U3_3_ap_continue),
    .ap_idle(tdf5_accum_1_U3_3_ap_idle),
    .ap_ready(tdf5_accum_1_U3_3_ap_ready),
    .accum_in_address0(tdf5_accum_1_U3_3_accum_in_address0),
    .accum_in_ce0(tdf5_accum_1_U3_3_accum_in_ce0),
    .accum_in_q0(products_3_0_t_q0),
    .accum_in_address1(tdf5_accum_1_U3_3_accum_in_address1),
    .accum_in_ce1(tdf5_accum_1_U3_3_accum_in_ce1),
    .accum_in_q1(products_3_0_t_q1),
    .accum_in1_address0(tdf5_accum_1_U3_3_accum_in1_address0),
    .accum_in1_ce0(tdf5_accum_1_U3_3_accum_in1_ce0),
    .accum_in1_q0(products_3_1_t_q0),
    .accum_in1_address1(tdf5_accum_1_U3_3_accum_in1_address1),
    .accum_in1_ce1(tdf5_accum_1_U3_3_accum_in1_ce1),
    .accum_in1_q1(products_3_1_t_q1),
    .accum_out_address0(tdf5_accum_1_U3_3_accum_out_address0),
    .accum_out_ce0(tdf5_accum_1_U3_3_accum_out_ce0),
    .accum_out_we0(tdf5_accum_1_U3_3_accum_out_we0),
    .accum_out_d0(tdf5_accum_1_U3_3_accum_out_d0),
    .accum_out_address1(tdf5_accum_1_U3_3_accum_out_address1),
    .accum_out_ce1(tdf5_accum_1_U3_3_accum_out_ce1),
    .accum_out_we1(tdf5_accum_1_U3_3_accum_out_we1),
    .accum_out_d1(tdf5_accum_1_U3_3_accum_out_d1)
);

td_fused_top_tdf5_accum_2 tdf5_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_2_U0_ap_start),
    .ap_done(tdf5_accum_2_U0_ap_done),
    .ap_continue(tdf5_accum_2_U0_ap_continue),
    .ap_idle(tdf5_accum_2_U0_ap_idle),
    .ap_ready(tdf5_accum_2_U0_ap_ready),
    .accum_in_address0(tdf5_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0),
    .accum_in_address1(tdf5_accum_2_U0_accum_in_address1),
    .accum_in_ce1(tdf5_accum_2_U0_accum_in_ce1),
    .accum_in_q1(accum1_out_0_t_q1),
    .accum_out_address0(tdf5_accum_2_U0_accum_out_address0),
    .accum_out_ce0(tdf5_accum_2_U0_accum_out_ce0),
    .accum_out_we0(tdf5_accum_2_U0_accum_out_we0),
    .accum_out_d0(tdf5_accum_2_U0_accum_out_d0)
);

td_fused_top_tdf5_accum_2 tdf5_accum_2_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_2_U1_1_ap_start),
    .ap_done(tdf5_accum_2_U1_1_ap_done),
    .ap_continue(tdf5_accum_2_U1_1_ap_continue),
    .ap_idle(tdf5_accum_2_U1_1_ap_idle),
    .ap_ready(tdf5_accum_2_U1_1_ap_ready),
    .accum_in_address0(tdf5_accum_2_U1_1_accum_in_address0),
    .accum_in_ce0(tdf5_accum_2_U1_1_accum_in_ce0),
    .accum_in_q0(accum1_out_1_t_q0),
    .accum_in_address1(tdf5_accum_2_U1_1_accum_in_address1),
    .accum_in_ce1(tdf5_accum_2_U1_1_accum_in_ce1),
    .accum_in_q1(accum1_out_1_t_q1),
    .accum_out_address0(tdf5_accum_2_U1_1_accum_out_address0),
    .accum_out_ce0(tdf5_accum_2_U1_1_accum_out_ce0),
    .accum_out_we0(tdf5_accum_2_U1_1_accum_out_we0),
    .accum_out_d0(tdf5_accum_2_U1_1_accum_out_d0)
);

td_fused_top_tdf5_accum_2 tdf5_accum_2_U2_2(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_2_U2_2_ap_start),
    .ap_done(tdf5_accum_2_U2_2_ap_done),
    .ap_continue(tdf5_accum_2_U2_2_ap_continue),
    .ap_idle(tdf5_accum_2_U2_2_ap_idle),
    .ap_ready(tdf5_accum_2_U2_2_ap_ready),
    .accum_in_address0(tdf5_accum_2_U2_2_accum_in_address0),
    .accum_in_ce0(tdf5_accum_2_U2_2_accum_in_ce0),
    .accum_in_q0(accum1_out_2_t_q0),
    .accum_in_address1(tdf5_accum_2_U2_2_accum_in_address1),
    .accum_in_ce1(tdf5_accum_2_U2_2_accum_in_ce1),
    .accum_in_q1(accum1_out_2_t_q1),
    .accum_out_address0(tdf5_accum_2_U2_2_accum_out_address0),
    .accum_out_ce0(tdf5_accum_2_U2_2_accum_out_ce0),
    .accum_out_we0(tdf5_accum_2_U2_2_accum_out_we0),
    .accum_out_d0(tdf5_accum_2_U2_2_accum_out_d0)
);

td_fused_top_tdf5_accum_2 tdf5_accum_2_U3_3(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_2_U3_3_ap_start),
    .ap_done(tdf5_accum_2_U3_3_ap_done),
    .ap_continue(tdf5_accum_2_U3_3_ap_continue),
    .ap_idle(tdf5_accum_2_U3_3_ap_idle),
    .ap_ready(tdf5_accum_2_U3_3_ap_ready),
    .accum_in_address0(tdf5_accum_2_U3_3_accum_in_address0),
    .accum_in_ce0(tdf5_accum_2_U3_3_accum_in_ce0),
    .accum_in_q0(accum1_out_3_t_q0),
    .accum_in_address1(tdf5_accum_2_U3_3_accum_in_address1),
    .accum_in_ce1(tdf5_accum_2_U3_3_accum_in_ce1),
    .accum_in_q1(accum1_out_3_t_q1),
    .accum_out_address0(tdf5_accum_2_U3_3_accum_out_address0),
    .accum_out_ce0(tdf5_accum_2_U3_3_accum_out_ce0),
    .accum_out_we0(tdf5_accum_2_U3_3_accum_out_we0),
    .accum_out_d0(tdf5_accum_2_U3_3_accum_out_d0)
);

td_fused_top_tdf5_accum_3 tdf5_accum_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_3_U0_ap_start),
    .ap_done(tdf5_accum_3_U0_ap_done),
    .ap_continue(tdf5_accum_3_U0_ap_continue),
    .ap_idle(tdf5_accum_3_U0_ap_idle),
    .ap_ready(tdf5_accum_3_U0_ap_ready),
    .accum_in_28(tdf5_accum_3_U0_accum_in_28),
    .accum_in_28_ap_vld(tdf5_accum_3_U0_accum_in_28_ap_vld),
    .accum_in_address0(tdf5_accum_3_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_0_t_q0)
);

td_fused_top_Block_entry_proc_proc520 Block_entry_proc_proc520_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc520_U0_ap_start),
    .ap_done(Block_entry_proc_proc520_U0_ap_done),
    .ap_continue(Block_entry_proc_proc520_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc520_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc520_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc520_U0_ap_return)
);

td_fused_top_tdf5_accum_3_1 tdf5_accum_3_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_3_1_U0_ap_start),
    .ap_done(tdf5_accum_3_1_U0_ap_done),
    .ap_continue(tdf5_accum_3_1_U0_ap_continue),
    .ap_idle(tdf5_accum_3_1_U0_ap_idle),
    .ap_ready(tdf5_accum_3_1_U0_ap_ready),
    .accum_in_26(tdf5_accum_3_1_U0_accum_in_26),
    .accum_in_26_ap_vld(tdf5_accum_3_1_U0_accum_in_26_ap_vld),
    .accum_in_address0(tdf5_accum_3_1_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_3_1_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_1_t_q0)
);

td_fused_top_Block_entry_proc_proc521 Block_entry_proc_proc521_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc521_U0_ap_start),
    .ap_done(Block_entry_proc_proc521_U0_ap_done),
    .ap_continue(Block_entry_proc_proc521_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc521_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc521_U0_ap_ready),
    .tmp_141(tmp_141_channel_dout),
    .ap_return(Block_entry_proc_proc521_U0_ap_return)
);

td_fused_top_tdf5_accum_3_2 tdf5_accum_3_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_3_2_U0_ap_start),
    .ap_done(tdf5_accum_3_2_U0_ap_done),
    .ap_continue(tdf5_accum_3_2_U0_ap_continue),
    .ap_idle(tdf5_accum_3_2_U0_ap_idle),
    .ap_ready(tdf5_accum_3_2_U0_ap_ready),
    .accum_in_24(tdf5_accum_3_2_U0_accum_in_24),
    .accum_in_24_ap_vld(tdf5_accum_3_2_U0_accum_in_24_ap_vld),
    .accum_in_address0(tdf5_accum_3_2_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_3_2_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_2_t_q0)
);

td_fused_top_Block_entry_proc_proc522 Block_entry_proc_proc522_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc522_U0_ap_start),
    .ap_done(Block_entry_proc_proc522_U0_ap_done),
    .ap_continue(Block_entry_proc_proc522_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc522_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc522_U0_ap_ready),
    .tmp_142(tmp_142_channel_dout),
    .ap_return(Block_entry_proc_proc522_U0_ap_return)
);

td_fused_top_tdf5_accum_3_3 tdf5_accum_3_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_accum_3_3_U0_ap_start),
    .ap_done(tdf5_accum_3_3_U0_ap_done),
    .ap_continue(tdf5_accum_3_3_U0_ap_continue),
    .ap_idle(tdf5_accum_3_3_U0_ap_idle),
    .ap_ready(tdf5_accum_3_3_U0_ap_ready),
    .accum_in_22(tdf5_accum_3_3_U0_accum_in_22),
    .accum_in_22_ap_vld(tdf5_accum_3_3_U0_accum_in_22_ap_vld),
    .accum_in_address0(tdf5_accum_3_3_U0_accum_in_address0),
    .accum_in_ce0(tdf5_accum_3_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_3_t_q0)
);

td_fused_top_Block_entry_proc_proc523 Block_entry_proc_proc523_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc523_U0_ap_start),
    .ap_done(Block_entry_proc_proc523_U0_ap_done),
    .ap_continue(Block_entry_proc_proc523_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc523_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc523_U0_ap_ready),
    .tmp_143(tmp_143_channel_dout),
    .ap_return(Block_entry_proc_proc523_U0_ap_return)
);

td_fused_top_tdf5_adjust tdf5_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf5_adjust_U0_ap_start),
    .ap_done(tdf5_adjust_U0_ap_done),
    .ap_continue(tdf5_adjust_U0_ap_continue),
    .ap_idle(tdf5_adjust_U0_ap_idle),
    .ap_ready(tdf5_adjust_U0_ap_ready),
    .sums_0_read(sums_0_dout),
    .sums_1_read(sums_1_dout),
    .sums_2_read(sums_2_dout),
    .sums_3_read(sums_3_dout),
    .adjustments_address0(tdf5_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf5_adjust_U0_adjustments_ce0),
    .adjustments_q0(adjustments_q0),
    .input_indices_23_dout(input_indices_23_c1_dout),
    .input_indices_23_empty_n(input_indices_23_c1_empty_n),
    .input_indices_23_read(tdf5_adjust_U0_input_indices_23_read),
    .input_indices_23_out_din(tdf5_adjust_U0_input_indices_23_out_din),
    .input_indices_23_out_full_n(input_indices_23_c2_full_n),
    .input_indices_23_out_write(tdf5_adjust_U0_input_indices_23_out_write),
    .ap_return_0(tdf5_adjust_U0_ap_return_0),
    .ap_return_1(tdf5_adjust_U0_ap_return_1),
    .ap_return_2(tdf5_adjust_U0_ap_return_2),
    .ap_return_3(tdf5_adjust_U0_ap_return_3)
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
    .input_indices_23_dout(input_indices_23_c2_dout),
    .input_indices_23_empty_n(input_indices_23_c2_empty_n),
    .input_indices_23_read(tdf5_poolOutputs_U0_input_indices_23_read),
    .resetMaximum6_dout(resetMaximum6_c_dout),
    .resetMaximum6_empty_n(resetMaximum6_c_empty_n),
    .resetMaximum6_read(tdf5_poolOutputs_U0_resetMaximum6_read),
    .storeOutput7_dout(storeOutput7_c_dout),
    .storeOutput7_empty_n(storeOutput7_c_empty_n),
    .storeOutput7_read(tdf5_poolOutputs_U0_storeOutput7_read),
    .outputs_0_read(outputs_0_dout),
    .outputs_1_read(outputs_1_dout),
    .outputs_2_read(outputs_2_dout),
    .outputs_3_read(outputs_3_dout),
    .out_data_address1(tdf5_poolOutputs_U0_out_data_address1),
    .out_data_ce1(tdf5_poolOutputs_U0_out_data_ce1),
    .out_data_we1(tdf5_poolOutputs_U0_out_data_we1),
    .out_data_d1(tdf5_poolOutputs_U0_out_data_d1)
);

td_fused_top_fifo_w5_d2_S_x0 input_indices_23_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readFilters41_U0_input_indices_23_read),
    .if_dout(input_indices_23_c_dout),
    .if_full_n(input_indices_23_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_input_indices_2_out_write),
    .if_din(tdf5_get_next_ijk_U0_input_indices_2_out_din)
);

td_fused_top_fifo_w7_d8_S input_indices_23_c1_U(
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

td_fused_top_fifo_w5_d9_S_x output_indices_04_c_U(
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

td_fused_top_fifo_w10_d9_S output_indices_15_c_U(
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

td_fused_top_fifo_w1_d9_S_x resetMaximum6_c_U(
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

td_fused_top_fifo_w1_d9_S_x storeOutput7_c_U(
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
    .if_read(tdf5_readInputs42_U0_ap_ready),
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
    .if_read(tdf5_readInputs42_U0_ap_ready),
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
    .if_read(Block_entry_proc_proc520_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_accum_3_U0_ap_done),
    .if_din(tdf5_accum_3_U0_accum_in_28)
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
    .if_write(Block_entry_proc_proc520_U0_ap_done),
    .if_din(Block_entry_proc_proc520_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x2 tmp_141_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_141_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc521_U0_ap_ready),
    .if_dout(tmp_141_channel_dout),
    .if_full_n(tmp_141_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_accum_3_1_U0_ap_done),
    .if_din(tdf5_accum_3_1_U0_accum_in_26)
);

td_fused_top_fifo_w16_d2_S_x2 sums_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_adjust_U0_ap_ready),
    .if_dout(sums_1_dout),
    .if_full_n(sums_1_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc521_U0_ap_done),
    .if_din(Block_entry_proc_proc521_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x2 tmp_142_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_142_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc522_U0_ap_ready),
    .if_dout(tmp_142_channel_dout),
    .if_full_n(tmp_142_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_accum_3_2_U0_ap_done),
    .if_din(tdf5_accum_3_2_U0_accum_in_24)
);

td_fused_top_fifo_w16_d2_S_x2 sums_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_adjust_U0_ap_ready),
    .if_dout(sums_2_dout),
    .if_full_n(sums_2_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc522_U0_ap_done),
    .if_din(Block_entry_proc_proc522_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x2 tmp_143_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_143_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc523_U0_ap_ready),
    .if_dout(tmp_143_channel_dout),
    .if_full_n(tmp_143_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_accum_3_3_U0_ap_done),
    .if_din(tdf5_accum_3_3_U0_accum_in_22)
);

td_fused_top_fifo_w16_d2_S_x2 sums_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_adjust_U0_ap_ready),
    .if_dout(sums_3_dout),
    .if_full_n(sums_3_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc523_U0_ap_done),
    .if_din(Block_entry_proc_proc523_U0_ap_return)
);

td_fused_top_fifo_w7_d2_S input_indices_23_c2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(input_indices_23_c2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_input_indices_23_read),
    .if_dout(input_indices_23_c2_dout),
    .if_full_n(input_indices_23_c2_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_adjust_U0_input_indices_23_out_write),
    .if_din(tdf5_adjust_U0_input_indices_23_out_din)
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
    .if_write(ap_channel_done_outputs_0),
    .if_din(tdf5_adjust_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x2 outputs_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_ap_ready),
    .if_dout(outputs_1_dout),
    .if_full_n(outputs_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_1),
    .if_din(tdf5_adjust_U0_ap_return_1)
);

td_fused_top_fifo_w16_d2_S_x2 outputs_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_ap_ready),
    .if_dout(outputs_2_dout),
    .if_full_n(outputs_2_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_2),
    .if_din(tdf5_adjust_U0_ap_return_2)
);

td_fused_top_fifo_w16_d2_S_x2 outputs_3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_poolOutputs_U0_ap_ready),
    .if_dout(outputs_3_dout),
    .if_full_n(outputs_3_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_3),
    .if_din(tdf5_adjust_U0_ap_return_3)
);

td_fused_top_start_for_tdf5_readFilters41_U0 start_for_tdf5_readFilters41_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(start_for_tdf5_readFilters41_U0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf5_readFilters41_U0_ap_ready),
    .if_dout(start_for_tdf5_readFilters41_U0_dout),
    .if_full_n(start_for_tdf5_readFilters41_U0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf5_get_next_ijk_U0_start_write),
    .if_din(start_for_tdf5_readFilters41_U0_din)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_0 <= 1'b0;
    end else begin
        if (((tdf5_readInputs42_U0_ap_done & tdf5_readInputs42_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_readInputs42_U0_ap_done & tdf5_readInputs42_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_1 <= ap_sync_channel_write_ifmap_vec_1;
        end
    end
end

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
        ap_sync_reg_channel_write_outputs_0 <= 1'b0;
    end else begin
        if (((tdf5_adjust_U0_ap_done & tdf5_adjust_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_adjust_U0_ap_done & tdf5_adjust_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_adjust_U0_ap_done & tdf5_adjust_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_adjust_U0_ap_done & tdf5_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_3 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_3 <= ap_sync_channel_write_outputs_3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_0 <= 1'b0;
    end else begin
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_0_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_0_1 <= ap_sync_channel_write_products_0_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_1_0 <= 1'b0;
    end else begin
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_1 <= ap_sync_channel_write_products_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_2_0 <= 1'b0;
    end else begin
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_2_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_2_1 <= ap_sync_channel_write_products_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_3_0 <= 1'b0;
    end else begin
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_dot_product_U0_ap_done & tdf5_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_3_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_3_1 <= ap_sync_channel_write_products_3_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_0 <= 1'b0;
    end else begin
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_1 <= ap_sync_channel_write_weight_vecs_0_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_0 <= 1'b0;
    end else begin
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_1 <= ap_sync_channel_write_weight_vecs_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_2_0 <= 1'b0;
    end else begin
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_2_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_2_1 <= ap_sync_channel_write_weight_vecs_2_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_3_0 <= 1'b0;
    end else begin
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf5_readFilters41_U0_ap_done & tdf5_readFilters41_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_3_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_3_1 <= ap_sync_channel_write_weight_vecs_3_1;
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
        ap_sync_reg_tdf5_readInputs42_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf5_readInputs42_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf5_readInputs42_U0_ap_ready <= ap_sync_tdf5_readInputs42_U0_ap_ready;
        end
    end
end

assign Block_entry_proc_proc520_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc520_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc520_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc520_U0_start_write = 1'b0;

assign Block_entry_proc_proc521_U0_ap_continue = sums_1_full_n;

assign Block_entry_proc_proc521_U0_ap_start = tmp_141_channel_empty_n;

assign Block_entry_proc_proc521_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc521_U0_start_write = 1'b0;

assign Block_entry_proc_proc522_U0_ap_continue = sums_2_full_n;

assign Block_entry_proc_proc522_U0_ap_start = tmp_142_channel_empty_n;

assign Block_entry_proc_proc522_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc522_U0_start_write = 1'b0;

assign Block_entry_proc_proc523_U0_ap_continue = sums_3_full_n;

assign Block_entry_proc_proc523_U0_ap_start = tmp_143_channel_empty_n;

assign Block_entry_proc_proc523_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc523_U0_start_write = 1'b0;

assign adjustments_address0 = tdf5_adjust_U0_adjustments_address0;

assign adjustments_address1 = 7'd0;

assign adjustments_ce0 = tdf5_adjust_U0_adjustments_ce0;

assign adjustments_ce1 = 1'b0;

assign adjustments_d0 = 48'd0;

assign adjustments_d1 = 48'd0;

assign adjustments_we0 = 1'b0;

assign adjustments_we1 = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf5_accum_1_U0_ap_done;

assign ap_channel_done_accum1_out_1 = tdf5_accum_1_U1_1_ap_done;

assign ap_channel_done_accum1_out_2 = tdf5_accum_1_U2_2_ap_done;

assign ap_channel_done_accum1_out_3 = tdf5_accum_1_U3_3_ap_done;

assign ap_channel_done_accum2_out_0 = tdf5_accum_2_U0_ap_done;

assign ap_channel_done_accum2_out_1 = tdf5_accum_2_U1_1_ap_done;

assign ap_channel_done_accum2_out_2 = tdf5_accum_2_U2_2_ap_done;

assign ap_channel_done_accum2_out_3 = tdf5_accum_2_U3_3_ap_done;

assign ap_channel_done_ifmap_vec_0 = (tdf5_readInputs42_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_0 ^ 1'b1));

assign ap_channel_done_ifmap_vec_1 = (tdf5_readInputs42_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_1 ^ 1'b1));

assign ap_channel_done_input_indices_0 = (tdf5_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_0 ^ 1'b1));

assign ap_channel_done_input_indices_1 = (tdf5_get_next_ijk_U0_ap_done & (ap_sync_reg_channel_write_input_indices_1 ^ 1'b1));

assign ap_channel_done_outputs_0 = (tdf5_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_0 ^ 1'b1));

assign ap_channel_done_outputs_1 = (tdf5_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_1 ^ 1'b1));

assign ap_channel_done_outputs_2 = (tdf5_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_2 ^ 1'b1));

assign ap_channel_done_outputs_3 = (tdf5_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_3 ^ 1'b1));

assign ap_channel_done_products_0_0 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_0 ^ 1'b1));

assign ap_channel_done_products_0_1 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_1 ^ 1'b1));

assign ap_channel_done_products_1_0 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_0 ^ 1'b1));

assign ap_channel_done_products_1_1 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_1 ^ 1'b1));

assign ap_channel_done_products_2_0 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_0 ^ 1'b1));

assign ap_channel_done_products_2_1 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_2_1 ^ 1'b1));

assign ap_channel_done_products_3_0 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_0 ^ 1'b1));

assign ap_channel_done_products_3_1 = (tdf5_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_3_1 ^ 1'b1));

assign ap_channel_done_sums_0 = Block_entry_proc_proc520_U0_ap_done;

assign ap_channel_done_sums_1 = Block_entry_proc_proc521_U0_ap_done;

assign ap_channel_done_sums_2 = Block_entry_proc_proc522_U0_ap_done;

assign ap_channel_done_sums_3 = Block_entry_proc_proc523_U0_ap_done;

assign ap_channel_done_tmp_141_channel = tdf5_accum_3_1_U0_ap_done;

assign ap_channel_done_tmp_142_channel = tdf5_accum_3_2_U0_ap_done;

assign ap_channel_done_tmp_143_channel = tdf5_accum_3_3_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf5_accum_3_U0_ap_done;

assign ap_channel_done_weight_vecs_0_0 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_0_1 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_0 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_1 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_0 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_2_1 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_2_1 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_0 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_3_1 = (tdf5_readFilters41_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_3_1 ^ 1'b1));

assign ap_done = tdf5_poolOutputs_U0_ap_done;

assign ap_idle = (tdf5_readInputs42_U0_ap_idle & tdf5_readFilters41_U0_ap_idle & tdf5_poolOutputs_U0_ap_idle & tdf5_get_next_ijk_U0_ap_idle & tdf5_dot_product_U0_ap_idle & tdf5_adjust_U0_ap_idle & tdf5_accum_3_U0_ap_idle & tdf5_accum_3_3_U0_ap_idle & tdf5_accum_3_2_U0_ap_idle & tdf5_accum_3_1_U0_ap_idle & tdf5_accum_2_U3_3_ap_idle & tdf5_accum_2_U2_2_ap_idle & tdf5_accum_2_U1_1_ap_idle & tdf5_accum_2_U0_ap_idle & tdf5_accum_1_U3_3_ap_idle & tdf5_accum_1_U2_2_ap_idle & tdf5_accum_1_U1_1_ap_idle & tdf5_accum_1_U0_ap_idle & (1'b1 ^ accum2_out_3_t_empty_n) & (1'b1 ^ accum2_out_2_t_empty_n) & (1'b1 ^ accum2_out_1_t_empty_n) & (1'b1 ^ accum2_out_0_t_empty_n) & (1'b1 ^ accum1_out_3_t_empty_n) & (1'b1 ^ accum1_out_2_t_empty_n) & (1'b1 ^ accum1_out_1_t_empty_n) & (1'b1 ^ accum1_out_0_t_empty_n) & (outputs_3_empty_n ^ 1'b1) & (outputs_2_empty_n ^ 1'b1) & (outputs_1_empty_n ^ 1'b1) & (outputs_0_empty_n ^ 1'b1) & (sums_3_empty_n ^ 1'b1) & (tmp_143_channel_empty_n ^ 1'b1) & (sums_2_empty_n ^ 1'b1) & (tmp_142_channel_empty_n ^ 1'b1) & (sums_1_empty_n ^ 1'b1) & (tmp_141_channel_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (input_indices_1_empty_n ^ 1'b1) & (input_indices_0_empty_n ^ 1'b1) & (products_3_1_t_empty_n ^ 1'b1) & (products_3_0_t_empty_n ^ 1'b1) & (products_2_1_t_empty_n ^ 1'b1) & (products_2_0_t_empty_n ^ 1'b1) & (products_1_1_t_empty_n ^ 1'b1) & (products_1_0_t_empty_n ^ 1'b1) & (products_0_1_t_empty_n ^ 1'b1) & (products_0_0_t_empty_n ^ 1'b1) & (weight_vecs_3_1_t_empty_n ^ 1'b1) & (weight_vecs_3_0_t_empty_n ^ 1'b1) & (weight_vecs_2_1_t_empty_n ^ 1'b1) & (weight_vecs_2_0_t_empty_n ^ 1'b1) & (weight_vecs_1_1_t_empty_n ^ 1'b1) & (weight_vecs_1_0_t_empty_n ^ 1'b1) & (weight_vecs_0_1_t_empty_n ^ 1'b1) & (weight_vecs_0_0_t_empty_n ^ 1'b1) & (ifmap_vec_1_t_empty_n ^ 1'b1) & (ifmap_vec_0_t_empty_n ^ 1'b1) & Block_entry_proc_proc523_U0_ap_idle & Block_entry_proc_proc522_U0_ap_idle & Block_entry_proc_proc521_U0_ap_idle & Block_entry_proc_proc520_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_channel_write_ifmap_vec_0 = ((tdf5_readInputs42_U0_ifmap_vec_0_full_n & ap_channel_done_ifmap_vec_0) | ap_sync_reg_channel_write_ifmap_vec_0);

assign ap_sync_channel_write_ifmap_vec_1 = ((tdf5_readInputs42_U0_ifmap_vec_1_full_n & ap_channel_done_ifmap_vec_1) | ap_sync_reg_channel_write_ifmap_vec_1);

assign ap_sync_channel_write_input_indices_0 = ((input_indices_0_full_n & ap_channel_done_input_indices_0) | ap_sync_reg_channel_write_input_indices_0);

assign ap_sync_channel_write_input_indices_1 = ((input_indices_1_full_n & ap_channel_done_input_indices_1) | ap_sync_reg_channel_write_input_indices_1);

assign ap_sync_channel_write_outputs_0 = ((outputs_0_full_n & ap_channel_done_outputs_0) | ap_sync_reg_channel_write_outputs_0);

assign ap_sync_channel_write_outputs_1 = ((outputs_1_full_n & ap_channel_done_outputs_1) | ap_sync_reg_channel_write_outputs_1);

assign ap_sync_channel_write_outputs_2 = ((outputs_2_full_n & ap_channel_done_outputs_2) | ap_sync_reg_channel_write_outputs_2);

assign ap_sync_channel_write_outputs_3 = ((outputs_3_full_n & ap_channel_done_outputs_3) | ap_sync_reg_channel_write_outputs_3);

assign ap_sync_channel_write_products_0_0 = ((tdf5_dot_product_U0_products_0_0_full_n & ap_channel_done_products_0_0) | ap_sync_reg_channel_write_products_0_0);

assign ap_sync_channel_write_products_0_1 = ((tdf5_dot_product_U0_products_0_1_full_n & ap_channel_done_products_0_1) | ap_sync_reg_channel_write_products_0_1);

assign ap_sync_channel_write_products_1_0 = ((tdf5_dot_product_U0_products_1_0_full_n & ap_channel_done_products_1_0) | ap_sync_reg_channel_write_products_1_0);

assign ap_sync_channel_write_products_1_1 = ((tdf5_dot_product_U0_products_1_1_full_n & ap_channel_done_products_1_1) | ap_sync_reg_channel_write_products_1_1);

assign ap_sync_channel_write_products_2_0 = ((tdf5_dot_product_U0_products_2_0_full_n & ap_channel_done_products_2_0) | ap_sync_reg_channel_write_products_2_0);

assign ap_sync_channel_write_products_2_1 = ((tdf5_dot_product_U0_products_2_1_full_n & ap_channel_done_products_2_1) | ap_sync_reg_channel_write_products_2_1);

assign ap_sync_channel_write_products_3_0 = ((tdf5_dot_product_U0_products_3_0_full_n & ap_channel_done_products_3_0) | ap_sync_reg_channel_write_products_3_0);

assign ap_sync_channel_write_products_3_1 = ((tdf5_dot_product_U0_products_3_1_full_n & ap_channel_done_products_3_1) | ap_sync_reg_channel_write_products_3_1);

assign ap_sync_channel_write_weight_vecs_0_0 = ((tdf5_readFilters41_U0_weight_vecs_0_0_full_n & ap_channel_done_weight_vecs_0_0) | ap_sync_reg_channel_write_weight_vecs_0_0);

assign ap_sync_channel_write_weight_vecs_0_1 = ((tdf5_readFilters41_U0_weight_vecs_0_1_full_n & ap_channel_done_weight_vecs_0_1) | ap_sync_reg_channel_write_weight_vecs_0_1);

assign ap_sync_channel_write_weight_vecs_1_0 = ((tdf5_readFilters41_U0_weight_vecs_1_0_full_n & ap_channel_done_weight_vecs_1_0) | ap_sync_reg_channel_write_weight_vecs_1_0);

assign ap_sync_channel_write_weight_vecs_1_1 = ((tdf5_readFilters41_U0_weight_vecs_1_1_full_n & ap_channel_done_weight_vecs_1_1) | ap_sync_reg_channel_write_weight_vecs_1_1);

assign ap_sync_channel_write_weight_vecs_2_0 = ((tdf5_readFilters41_U0_weight_vecs_2_0_full_n & ap_channel_done_weight_vecs_2_0) | ap_sync_reg_channel_write_weight_vecs_2_0);

assign ap_sync_channel_write_weight_vecs_2_1 = ((tdf5_readFilters41_U0_weight_vecs_2_1_full_n & ap_channel_done_weight_vecs_2_1) | ap_sync_reg_channel_write_weight_vecs_2_1);

assign ap_sync_channel_write_weight_vecs_3_0 = ((tdf5_readFilters41_U0_weight_vecs_3_0_full_n & ap_channel_done_weight_vecs_3_0) | ap_sync_reg_channel_write_weight_vecs_3_0);

assign ap_sync_channel_write_weight_vecs_3_1 = ((tdf5_readFilters41_U0_weight_vecs_3_1_full_n & ap_channel_done_weight_vecs_3_1) | ap_sync_reg_channel_write_weight_vecs_3_1);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf5_poolOutputs_U0_ap_done;

assign ap_sync_ready = (ap_sync_tdf5_readInputs42_U0_ap_ready & ap_sync_tdf5_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf5_get_next_ijk_U0_ap_ready = (tdf5_get_next_ijk_U0_ap_ready | ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf5_readInputs42_U0_ap_ready = (tdf5_readInputs42_U0_ap_ready | ap_sync_reg_tdf5_readInputs42_U0_ap_ready);

assign filter_data_0_address0 = tdf5_readFilters41_U0_filter_data_0_address0;

assign filter_data_0_address1 = 12'd0;

assign filter_data_0_ce0 = tdf5_readFilters41_U0_filter_data_0_ce0;

assign filter_data_0_ce1 = 1'b0;

assign filter_data_0_d0 = 32'd0;

assign filter_data_0_d1 = 32'd0;

assign filter_data_0_we0 = 1'b0;

assign filter_data_0_we1 = 1'b0;

assign filter_data_1_address0 = tdf5_readFilters41_U0_filter_data_1_address0;

assign filter_data_1_address1 = 12'd0;

assign filter_data_1_ce0 = tdf5_readFilters41_U0_filter_data_1_ce0;

assign filter_data_1_ce1 = 1'b0;

assign filter_data_1_d0 = 32'd0;

assign filter_data_1_d1 = 32'd0;

assign filter_data_1_we0 = 1'b0;

assign filter_data_1_we1 = 1'b0;

assign filter_data_2_address0 = tdf5_readFilters41_U0_filter_data_2_address0;

assign filter_data_2_address1 = 12'd0;

assign filter_data_2_ce0 = tdf5_readFilters41_U0_filter_data_2_ce0;

assign filter_data_2_ce1 = 1'b0;

assign filter_data_2_d0 = 32'd0;

assign filter_data_2_d1 = 32'd0;

assign filter_data_2_we0 = 1'b0;

assign filter_data_2_we1 = 1'b0;

assign filter_data_3_address0 = tdf5_readFilters41_U0_filter_data_3_address0;

assign filter_data_3_address1 = 12'd0;

assign filter_data_3_ce0 = tdf5_readFilters41_U0_filter_data_3_ce0;

assign filter_data_3_ce1 = 1'b0;

assign filter_data_3_d0 = 32'd0;

assign filter_data_3_d1 = 32'd0;

assign filter_data_3_we0 = 1'b0;

assign filter_data_3_we1 = 1'b0;

assign in_data_address0 = tdf5_readInputs42_U0_in_data_address0;

assign in_data_address1 = 14'd0;

assign in_data_ce0 = tdf5_readInputs42_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = tdf5_readInputs42_U0_in_data_write;

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

assign products_0_0_t_d1 = 16'd0;

assign products_0_0_t_we1 = 1'b0;

assign products_0_1_t_d1 = 16'd0;

assign products_0_1_t_we1 = 1'b0;

assign products_1_0_t_d1 = 16'd0;

assign products_1_0_t_we1 = 1'b0;

assign products_1_1_t_d1 = 16'd0;

assign products_1_1_t_we1 = 1'b0;

assign products_2_0_t_d1 = 16'd0;

assign products_2_0_t_we1 = 1'b0;

assign products_2_1_t_d1 = 16'd0;

assign products_2_1_t_we1 = 1'b0;

assign products_3_0_t_d1 = 16'd0;

assign products_3_0_t_we1 = 1'b0;

assign products_3_1_t_d1 = 16'd0;

assign products_3_1_t_we1 = 1'b0;

assign resetMaximum6_c_din = tdf5_get_next_ijk_U0_resetMaximum_din;

assign start_for_tdf5_readFilters41_U0_din = 1'b1;

assign storeOutput7_c_din = tdf5_get_next_ijk_U0_storeOutput_din;

assign tdf5_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf5_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf5_accum_1_U0_ap_start = (products_0_1_t_empty_n & products_0_0_t_empty_n);

assign tdf5_accum_1_U0_start_full_n = 1'b1;

assign tdf5_accum_1_U0_start_write = 1'b0;

assign tdf5_accum_1_U1_1_accum_out_full_n = accum1_out_1_i_full_n;

assign tdf5_accum_1_U1_1_ap_continue = accum1_out_1_i_full_n;

assign tdf5_accum_1_U1_1_ap_start = (products_1_1_t_empty_n & products_1_0_t_empty_n);

assign tdf5_accum_1_U1_1_start_full_n = 1'b1;

assign tdf5_accum_1_U1_1_start_write = 1'b0;

assign tdf5_accum_1_U2_2_accum_out_full_n = accum1_out_2_i_full_n;

assign tdf5_accum_1_U2_2_ap_continue = accum1_out_2_i_full_n;

assign tdf5_accum_1_U2_2_ap_start = (products_2_1_t_empty_n & products_2_0_t_empty_n);

assign tdf5_accum_1_U2_2_start_full_n = 1'b1;

assign tdf5_accum_1_U2_2_start_write = 1'b0;

assign tdf5_accum_1_U3_3_accum_out_full_n = accum1_out_3_i_full_n;

assign tdf5_accum_1_U3_3_ap_continue = accum1_out_3_i_full_n;

assign tdf5_accum_1_U3_3_ap_start = (products_3_1_t_empty_n & products_3_0_t_empty_n);

assign tdf5_accum_1_U3_3_start_full_n = 1'b1;

assign tdf5_accum_1_U3_3_start_write = 1'b0;

assign tdf5_accum_2_U0_accum_out_full_n = accum2_out_0_i_full_n;

assign tdf5_accum_2_U0_ap_continue = accum2_out_0_i_full_n;

assign tdf5_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf5_accum_2_U0_start_full_n = 1'b1;

assign tdf5_accum_2_U0_start_write = 1'b0;

assign tdf5_accum_2_U1_1_accum_out_full_n = accum2_out_1_i_full_n;

assign tdf5_accum_2_U1_1_ap_continue = accum2_out_1_i_full_n;

assign tdf5_accum_2_U1_1_ap_start = accum1_out_1_t_empty_n;

assign tdf5_accum_2_U1_1_start_full_n = 1'b1;

assign tdf5_accum_2_U1_1_start_write = 1'b0;

assign tdf5_accum_2_U2_2_accum_out_full_n = accum2_out_2_i_full_n;

assign tdf5_accum_2_U2_2_ap_continue = accum2_out_2_i_full_n;

assign tdf5_accum_2_U2_2_ap_start = accum1_out_2_t_empty_n;

assign tdf5_accum_2_U2_2_start_full_n = 1'b1;

assign tdf5_accum_2_U2_2_start_write = 1'b0;

assign tdf5_accum_2_U3_3_accum_out_full_n = accum2_out_3_i_full_n;

assign tdf5_accum_2_U3_3_ap_continue = accum2_out_3_i_full_n;

assign tdf5_accum_2_U3_3_ap_start = accum1_out_3_t_empty_n;

assign tdf5_accum_2_U3_3_start_full_n = 1'b1;

assign tdf5_accum_2_U3_3_start_write = 1'b0;

assign tdf5_accum_3_1_U0_ap_continue = tmp_141_channel_full_n;

assign tdf5_accum_3_1_U0_ap_start = accum2_out_1_t_empty_n;

assign tdf5_accum_3_1_U0_start_full_n = 1'b1;

assign tdf5_accum_3_1_U0_start_write = 1'b0;

assign tdf5_accum_3_2_U0_ap_continue = tmp_142_channel_full_n;

assign tdf5_accum_3_2_U0_ap_start = accum2_out_2_t_empty_n;

assign tdf5_accum_3_2_U0_start_full_n = 1'b1;

assign tdf5_accum_3_2_U0_start_write = 1'b0;

assign tdf5_accum_3_3_U0_ap_continue = tmp_143_channel_full_n;

assign tdf5_accum_3_3_U0_ap_start = accum2_out_3_t_empty_n;

assign tdf5_accum_3_3_U0_start_full_n = 1'b1;

assign tdf5_accum_3_3_U0_start_write = 1'b0;

assign tdf5_accum_3_U0_ap_continue = tmp_channel_full_n;

assign tdf5_accum_3_U0_ap_start = accum2_out_0_t_empty_n;

assign tdf5_accum_3_U0_start_full_n = 1'b1;

assign tdf5_accum_3_U0_start_write = 1'b0;

assign tdf5_adjust_U0_ap_continue = (ap_sync_channel_write_outputs_3 & ap_sync_channel_write_outputs_2 & ap_sync_channel_write_outputs_1 & ap_sync_channel_write_outputs_0);

assign tdf5_adjust_U0_ap_start = (sums_3_empty_n & sums_2_empty_n & sums_1_empty_n & sums_0_empty_n);

assign tdf5_adjust_U0_start_full_n = 1'b1;

assign tdf5_adjust_U0_start_write = 1'b0;

assign tdf5_dot_product_U0_ap_continue = (ap_sync_channel_write_products_3_1 & ap_sync_channel_write_products_3_0 & ap_sync_channel_write_products_2_1 & ap_sync_channel_write_products_2_0 & ap_sync_channel_write_products_1_1 & ap_sync_channel_write_products_1_0 & ap_sync_channel_write_products_0_1 & ap_sync_channel_write_products_0_0);

assign tdf5_dot_product_U0_ap_start = (weight_vecs_3_1_t_empty_n & weight_vecs_3_0_t_empty_n & weight_vecs_2_1_t_empty_n & weight_vecs_2_0_t_empty_n & weight_vecs_1_1_t_empty_n & weight_vecs_1_0_t_empty_n & weight_vecs_0_1_t_empty_n & weight_vecs_0_0_t_empty_n & ifmap_vec_1_t_empty_n & ifmap_vec_0_t_empty_n);

assign tdf5_dot_product_U0_products_0_0_full_n = products_0_0_i_full_n;

assign tdf5_dot_product_U0_products_0_1_full_n = products_0_1_i_full_n;

assign tdf5_dot_product_U0_products_1_0_full_n = products_1_0_i_full_n;

assign tdf5_dot_product_U0_products_1_1_full_n = products_1_1_i_full_n;

assign tdf5_dot_product_U0_products_2_0_full_n = products_2_0_i_full_n;

assign tdf5_dot_product_U0_products_2_1_full_n = products_2_1_i_full_n;

assign tdf5_dot_product_U0_products_3_0_full_n = products_3_0_i_full_n;

assign tdf5_dot_product_U0_products_3_1_full_n = products_3_1_i_full_n;

assign tdf5_dot_product_U0_start_full_n = 1'b1;

assign tdf5_dot_product_U0_start_write = 1'b0;

assign tdf5_get_next_ijk_U0_ap_continue = (ap_sync_channel_write_input_indices_1 & ap_sync_channel_write_input_indices_0);

assign tdf5_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf5_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf5_poolOutputs_U0_ap_continue = ap_continue;

assign tdf5_poolOutputs_U0_ap_start = (outputs_3_empty_n & outputs_2_empty_n & outputs_1_empty_n & outputs_0_empty_n);

assign tdf5_poolOutputs_U0_out_data_full_n = out_data_full_n;

assign tdf5_poolOutputs_U0_out_data_write = 1'b0;

assign tdf5_poolOutputs_U0_start_full_n = 1'b1;

assign tdf5_poolOutputs_U0_start_write = 1'b0;

assign tdf5_readFilters41_U0_ap_continue = (ap_sync_channel_write_weight_vecs_3_1 & ap_sync_channel_write_weight_vecs_3_0 & ap_sync_channel_write_weight_vecs_2_1 & ap_sync_channel_write_weight_vecs_2_0 & ap_sync_channel_write_weight_vecs_1_1 & ap_sync_channel_write_weight_vecs_1_0 & ap_sync_channel_write_weight_vecs_0_1 & ap_sync_channel_write_weight_vecs_0_0);

assign tdf5_readFilters41_U0_ap_start = start_for_tdf5_readFilters41_U0_empty_n;

assign tdf5_readFilters41_U0_start_full_n = 1'b1;

assign tdf5_readFilters41_U0_start_write = 1'b0;

assign tdf5_readFilters41_U0_weight_vecs_0_0_full_n = weight_vecs_0_0_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_0_1_full_n = weight_vecs_0_1_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_1_0_full_n = weight_vecs_1_0_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_1_1_full_n = weight_vecs_1_1_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_2_0_full_n = weight_vecs_2_0_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_2_1_full_n = weight_vecs_2_1_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_3_0_full_n = weight_vecs_3_0_i_full_n;

assign tdf5_readFilters41_U0_weight_vecs_3_1_full_n = weight_vecs_3_1_i_full_n;

assign tdf5_readInputs42_U0_ap_continue = (ap_sync_channel_write_ifmap_vec_1 & ap_sync_channel_write_ifmap_vec_0);

assign tdf5_readInputs42_U0_ap_start = (input_indices_1_empty_n & input_indices_0_empty_n & (ap_sync_reg_tdf5_readInputs42_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf5_readInputs42_U0_ifmap_vec_0_full_n = ifmap_vec_0_i_full_n;

assign tdf5_readInputs42_U0_ifmap_vec_1_full_n = ifmap_vec_1_i_full_n;

assign tdf5_readInputs42_U0_in_data_full_n = in_data_empty_n;

assign tdf5_readInputs42_U0_in_data_write = 1'b0;

assign tdf5_readInputs42_U0_start_full_n = 1'b1;

assign tdf5_readInputs42_U0_start_write = 1'b0;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP48139
module td_fused_top_start_for_tdf5_readFilters41_U0 (
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

td_fused_top_start_for_tdf5_readFilters41_U0_shiftReg 
U_td_fused_top_start_for_tdf5_readFilters41_U0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_start_for_tdf5_readFilters41_U0_shiftReg (
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
module td_fused_top_fifo_w10_d9_S (
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

td_fused_top_fifo_w10_d9_S_shiftReg 
U_td_fused_top_fifo_w10_d9_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w10_d9_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd10;
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
module td_fused_top_fifo_w5_d9_S_x (
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

td_fused_top_fifo_w5_d9_S_x_shiftReg 
U_td_fused_top_fifo_w5_d9_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w5_d9_S_x_shiftReg (
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
module td_fused_top_fifo_w7_d8_S (
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

td_fused_top_fifo_w7_d8_S_shiftReg 
U_td_fused_top_fifo_w7_d8_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w7_d8_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd7;
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
module td_fused_top_fifo_w5_d2_S_x0 (
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

td_fused_top_fifo_w5_d2_S_x0_shiftReg 
U_td_fused_top_fifo_w5_d2_S_x0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w5_d2_S_x0_shiftReg (
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
input  [4:0] output_indices_04_dout;
input   output_indices_04_empty_n;
output   output_indices_04_read;
input  [9:0] output_indices_15_dout;
input   output_indices_15_empty_n;
output   output_indices_15_read;
input  [6:0] input_indices_23_dout;
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
output  [14:0] out_data_address1;
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
reg   [15:0] max_vals_5_0;
reg   [15:0] max_vals_5_1;
reg   [15:0] max_vals_5_2;
reg   [15:0] max_vals_5_3;
reg    output_indices_04_blk_n;
wire    ap_CS_fsm_state2;
reg    output_indices_15_blk_n;
reg    input_indices_23_blk_n;
reg    resetMaximum6_blk_n;
reg    storeOutput7_blk_n;
reg   [4:0] output_indices_04_read_reg_281;
reg   [9:0] output_indices_15_read_reg_286;
reg   [6:0] input_indices_23_read_reg_291;
wire   [0:0] storeOutput7_read_read_fu_110_p2;
reg   [0:0] storeOutput7_read_reg_296;
wire    grp_tdf5_writeOutputs_aligned_fu_116_ap_start;
wire    grp_tdf5_writeOutputs_aligned_fu_116_ap_done;
wire    grp_tdf5_writeOutputs_aligned_fu_116_ap_idle;
wire    grp_tdf5_writeOutputs_aligned_fu_116_ap_ready;
wire   [14:0] grp_tdf5_writeOutputs_aligned_fu_116_out_data_address1;
wire    grp_tdf5_writeOutputs_aligned_fu_116_out_data_ce1;
wire    grp_tdf5_writeOutputs_aligned_fu_116_out_data_we1;
wire   [63:0] grp_tdf5_writeOutputs_aligned_fu_116_out_data_d1;
reg    grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [15:0] select_ln24_fu_179_p3;
reg    ap_block_state2;
wire   [15:0] select_ln24_4_fu_197_p3;
wire   [15:0] select_ln24_5_fu_215_p3;
wire   [15:0] select_ln24_6_fu_233_p3;
reg    ap_block_state1;
wire   [0:0] grp_fu_133_p2;
wire   [0:0] or_ln24_fu_173_p2;
wire   [0:0] grp_fu_138_p2;
wire   [0:0] or_ln24_4_fu_191_p2;
wire   [0:0] grp_fu_143_p2;
wire   [0:0] or_ln24_5_fu_209_p2;
wire   [0:0] grp_fu_148_p2;
wire   [0:0] or_ln24_6_fu_227_p2;
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
#0 max_vals_5_0 = 16'd0;
#0 max_vals_5_1 = 16'd0;
#0 max_vals_5_2 = 16'd0;
#0 max_vals_5_3 = 16'd0;
#0 grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg = 1'b0;
end

td_fused_top_tdf5_writeOutputs_aligned grp_tdf5_writeOutputs_aligned_fu_116(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_tdf5_writeOutputs_aligned_fu_116_ap_start),
    .ap_done(grp_tdf5_writeOutputs_aligned_fu_116_ap_done),
    .ap_idle(grp_tdf5_writeOutputs_aligned_fu_116_ap_idle),
    .ap_ready(grp_tdf5_writeOutputs_aligned_fu_116_ap_ready),
    .i(output_indices_04_read_reg_281),
    .j(output_indices_15_read_reg_286),
    .k(input_indices_23_read_reg_291),
    .out_data_address1(grp_tdf5_writeOutputs_aligned_fu_116_out_data_address1),
    .out_data_ce1(grp_tdf5_writeOutputs_aligned_fu_116_out_data_ce1),
    .out_data_we1(grp_tdf5_writeOutputs_aligned_fu_116_out_data_we1),
    .out_data_d1(grp_tdf5_writeOutputs_aligned_fu_116_out_data_d1),
    .max_vals_5_0(max_vals_5_0),
    .max_vals_5_1(max_vals_5_1),
    .max_vals_5_2(max_vals_5_2),
    .max_vals_5_3(max_vals_5_3)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U826(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_133_ce),
    .din0(max_vals_5_0),
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
hcmp_16ns_16ns_1_2_no_dsp_1_U827(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_138_ce),
    .din0(max_vals_5_1),
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
hcmp_16ns_16ns_1_2_no_dsp_1_U828(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_143_ce),
    .din0(max_vals_5_2),
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
hcmp_16ns_16ns_1_2_no_dsp_1_U829(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_148_ce),
    .din0(max_vals_5_3),
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
        grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b1;
        end else if ((grp_tdf5_writeOutputs_aligned_fu_116_ap_ready == 1'b1)) begin
            grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg <= 1'b0;
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
        max_vals_5_0 <= select_ln24_fu_179_p3;
        max_vals_5_1 <= select_ln24_4_fu_197_p3;
        max_vals_5_2 <= select_ln24_5_fu_215_p3;
        max_vals_5_3 <= select_ln24_6_fu_233_p3;
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
    ap_block_state4_on_subcall_done = ((grp_tdf5_writeOutputs_aligned_fu_116_ap_done == 1'b0) & (storeOutput7_read_reg_296 == 1'd1));
end

assign grp_tdf5_writeOutputs_aligned_fu_116_ap_start = grp_tdf5_writeOutputs_aligned_fu_116_ap_start_reg;

assign or_ln24_4_fu_191_p2 = (resetMaximum6_dout | grp_fu_138_p2);

assign or_ln24_5_fu_209_p2 = (resetMaximum6_dout | grp_fu_143_p2);

assign or_ln24_6_fu_227_p2 = (resetMaximum6_dout | grp_fu_148_p2);

assign or_ln24_fu_173_p2 = (resetMaximum6_dout | grp_fu_133_p2);

assign out_data_address1 = grp_tdf5_writeOutputs_aligned_fu_116_out_data_address1;

assign out_data_ce1 = grp_tdf5_writeOutputs_aligned_fu_116_out_data_ce1;

assign out_data_d1 = grp_tdf5_writeOutputs_aligned_fu_116_out_data_d1;

assign out_data_we1 = grp_tdf5_writeOutputs_aligned_fu_116_out_data_we1;

assign select_ln24_4_fu_197_p3 = ((or_ln24_4_fu_191_p2[0:0] == 1'b1) ? outputs_1_read : max_vals_5_1);

assign select_ln24_5_fu_215_p3 = ((or_ln24_5_fu_209_p2[0:0] == 1'b1) ? outputs_2_read : max_vals_5_2);

assign select_ln24_6_fu_233_p3 = ((or_ln24_6_fu_227_p2[0:0] == 1'b1) ? outputs_3_read : max_vals_5_3);

assign select_ln24_fu_179_p3 = ((or_ln24_fu_173_p2[0:0] == 1'b1) ? outputs_0_read : max_vals_5_0);

assign storeOutput7_read_read_fu_110_p2 = storeOutput7_dout;

endmodule //td_fused_top_tdf5_poolOutputs
module td_fused_top_tdf5_writeOutputs_aligned (
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
        max_vals_5_0,
        max_vals_5_1,
        max_vals_5_2,
        max_vals_5_3
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
input  [6:0] k;
output  [14:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_5_0;
input  [15:0] max_vals_5_1;
input  [15:0] max_vals_5_2;
input  [15:0] max_vals_5_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [9:0] add_ln123_fu_105_p2;
reg   [9:0] add_ln123_reg_178;
wire   [63:0] zext_ln123_4_fu_132_p1;
wire    ap_CS_fsm_state2;
wire   [6:0] tmp_s_fu_87_p3;
wire   [9:0] tmp_fu_79_p3;
wire   [9:0] zext_ln123_fu_95_p1;
wire   [9:0] sub_ln123_fu_99_p2;
wire   [14:0] tmp_69_cast_fu_111_p3;
wire   [14:0] zext_ln123_3_fu_122_p1;
wire   [14:0] add_ln123_2_fu_126_p2;
wire   [15:0] bitcast_ln123_6_fu_161_p1;
wire   [15:0] bitcast_ln123_5_fu_153_p1;
wire   [15:0] bitcast_ln123_4_fu_145_p1;
wire   [15:0] bitcast_ln123_fu_137_p1;
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
        add_ln123_reg_178 <= add_ln123_fu_105_p2;
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

assign add_ln123_2_fu_126_p2 = (tmp_69_cast_fu_111_p3 + zext_ln123_3_fu_122_p1);

assign add_ln123_fu_105_p2 = (sub_ln123_fu_99_p2 + j);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln123_4_fu_145_p1 = max_vals_5_1;

assign bitcast_ln123_5_fu_153_p1 = max_vals_5_2;

assign bitcast_ln123_6_fu_161_p1 = max_vals_5_3;

assign bitcast_ln123_fu_137_p1 = max_vals_5_0;

assign out_data_address1 = zext_ln123_4_fu_132_p1;

assign out_data_d1 = {{{{bitcast_ln123_6_fu_161_p1}, {bitcast_ln123_5_fu_153_p1}}, {bitcast_ln123_4_fu_145_p1}}, {bitcast_ln123_fu_137_p1}};

assign sub_ln123_fu_99_p2 = (tmp_fu_79_p3 - zext_ln123_fu_95_p1);

assign tmp_69_cast_fu_111_p3 = {{add_ln123_reg_178}, {5'd0}};

assign tmp_fu_79_p3 = {{i}, {5'd0}};

assign tmp_s_fu_87_p3 = {{i}, {2'd0}};

assign zext_ln123_3_fu_122_p1 = k;

assign zext_ln123_4_fu_132_p1 = add_ln123_2_fu_126_p2;

assign zext_ln123_fu_95_p1 = tmp_s_fu_87_p3;

endmodule //td_fused_top_tdf5_writeOutputs_aligned
module td_fused_top_tdf5_adjust (
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
output  [6:0] adjustments_address0;
output   adjustments_ce0;
input  [47:0] adjustments_q0;
input  [6:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [6:0] input_indices_23_out_din;
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
wire   [4:0] trunc_ln235_fu_268_p1;
reg   [4:0] trunc_ln235_reg_550;
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
reg   [15:0] tmp_138_i_i_reg_602;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter2_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter3_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter4_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter5_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter6_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter7_reg;
reg   [15:0] tmp_138_i_i_reg_602_pp0_iter8_reg;
reg   [15:0] tmp_139_i_i_reg_607;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter2_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter3_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter4_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter5_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter6_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter7_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter8_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter9_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter10_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter11_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter12_reg;
reg   [15:0] tmp_139_i_i_reg_607_pp0_iter13_reg;
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
wire   [6:0] ochan_fu_288_p3;
wire   [15:0] data_V_fu_401_p1;
wire   [0:0] p_Result_s_fu_404_p3;
wire   [0:0] icmp_ln223_fu_419_p2;
wire   [15:0] activated_fu_412_p3;
wire   [0:0] icmp_ln223_5_fu_432_p2;
wire   [15:0] select_ln223_fu_424_p3;
wire   [0:0] icmp_ln223_6_fu_445_p2;
wire   [15:0] select_ln223_9_fu_437_p3;
wire   [15:0] select_ln223_10_fu_466_p3;
wire   [15:0] select_ln223_11_fu_474_p3;
wire   [15:0] select_ln223_12_fu_490_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U803(
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
hsub_16ns_16ns_16_7_full_dsp_1_U804(
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
hmul_16ns_16ns_16_5_max_dsp_1_U805(
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
mux_42_1_1_1_U806(
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
mux_42_1_1_1_U807(
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
mux_42_1_1_1_U808(
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
mux_42_1_1_1_U809(
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
mux_42_16_1_1_U810(
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
        tmp_138_i_i_reg_602_pp0_iter2_reg <= tmp_138_i_i_reg_602;
        tmp_138_i_i_reg_602_pp0_iter3_reg <= tmp_138_i_i_reg_602_pp0_iter2_reg;
        tmp_138_i_i_reg_602_pp0_iter4_reg <= tmp_138_i_i_reg_602_pp0_iter3_reg;
        tmp_138_i_i_reg_602_pp0_iter5_reg <= tmp_138_i_i_reg_602_pp0_iter4_reg;
        tmp_138_i_i_reg_602_pp0_iter6_reg <= tmp_138_i_i_reg_602_pp0_iter5_reg;
        tmp_138_i_i_reg_602_pp0_iter7_reg <= tmp_138_i_i_reg_602_pp0_iter6_reg;
        tmp_138_i_i_reg_602_pp0_iter8_reg <= tmp_138_i_i_reg_602_pp0_iter7_reg;
        tmp_139_i_i_reg_607_pp0_iter10_reg <= tmp_139_i_i_reg_607_pp0_iter9_reg;
        tmp_139_i_i_reg_607_pp0_iter11_reg <= tmp_139_i_i_reg_607_pp0_iter10_reg;
        tmp_139_i_i_reg_607_pp0_iter12_reg <= tmp_139_i_i_reg_607_pp0_iter11_reg;
        tmp_139_i_i_reg_607_pp0_iter13_reg <= tmp_139_i_i_reg_607_pp0_iter12_reg;
        tmp_139_i_i_reg_607_pp0_iter2_reg <= tmp_139_i_i_reg_607;
        tmp_139_i_i_reg_607_pp0_iter3_reg <= tmp_139_i_i_reg_607_pp0_iter2_reg;
        tmp_139_i_i_reg_607_pp0_iter4_reg <= tmp_139_i_i_reg_607_pp0_iter3_reg;
        tmp_139_i_i_reg_607_pp0_iter5_reg <= tmp_139_i_i_reg_607_pp0_iter4_reg;
        tmp_139_i_i_reg_607_pp0_iter6_reg <= tmp_139_i_i_reg_607_pp0_iter5_reg;
        tmp_139_i_i_reg_607_pp0_iter7_reg <= tmp_139_i_i_reg_607_pp0_iter6_reg;
        tmp_139_i_i_reg_607_pp0_iter8_reg <= tmp_139_i_i_reg_607_pp0_iter7_reg;
        tmp_139_i_i_reg_607_pp0_iter9_reg <= tmp_139_i_i_reg_607_pp0_iter8_reg;
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
        tmp_138_i_i_reg_602 <= {{adjustments_q0[31:16]}};
        tmp_139_i_i_reg_607 <= {{adjustments_q0[47:32]}};
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
        trunc_ln235_reg_550 <= trunc_ln235_fu_268_p1;
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

assign grp_fu_256_p1 = tmp_139_i_i_reg_607_pp0_iter13_reg;

assign grp_fu_260_p1 = trunc_ln220_reg_597;

assign grp_fu_264_p1 = tmp_138_i_i_reg_602_pp0_iter8_reg;

assign icmp_ln213_fu_278_p2 = ((o_reg_197 == 3'd4) ? 1'b1 : 1'b0);

assign icmp_ln223_5_fu_432_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln223_6_fu_445_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln223_fu_419_p2 = ((trunc_ln219_reg_564_pp0_iter21_reg == 2'd0) ? 1'b1 : 1'b0);

assign input_indices_23_out_din = input_indices_23_dout;

assign ochan_fu_288_p3 = {{trunc_ln235_reg_550}, {trunc_ln219_fu_284_p1}};

assign outputs_0_1_fu_482_p3 = ((icmp_ln223_6_fu_445_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_11_fu_474_p3);

assign outputs_1_1_fu_498_p3 = ((icmp_ln223_6_fu_445_p2[0:0] == 1'b1) ? outputs_1_011_reg_208 : select_ln223_12_fu_490_p3);

assign outputs_2_1_fu_458_p3 = ((icmp_ln223_6_fu_445_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_2_09_reg_232);

assign outputs_3_1_fu_450_p3 = ((icmp_ln223_6_fu_445_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_9_fu_437_p3);

assign p_Result_s_fu_404_p3 = data_V_fu_401_p1[32'd15];

assign select_ln223_10_fu_466_p3 = ((icmp_ln223_fu_419_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_0_010_reg_220);

assign select_ln223_11_fu_474_p3 = ((icmp_ln223_5_fu_432_p2[0:0] == 1'b1) ? outputs_0_010_reg_220 : select_ln223_10_fu_466_p3);

assign select_ln223_12_fu_490_p3 = ((icmp_ln223_5_fu_432_p2[0:0] == 1'b1) ? activated_fu_412_p3 : outputs_1_011_reg_208);

assign select_ln223_9_fu_437_p3 = ((icmp_ln223_5_fu_432_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : select_ln223_fu_424_p3);

assign select_ln223_fu_424_p3 = ((icmp_ln223_fu_419_p2[0:0] == 1'b1) ? outputs_3_08_reg_244 : activated_fu_412_p3);

assign trunc_ln219_fu_284_p1 = o_reg_197[1:0];

assign trunc_ln220_fu_356_p1 = adjustments_q0[15:0];

assign trunc_ln235_fu_268_p1 = input_indices_23_dout[4:0];

assign zext_ln220_fu_295_p1 = ochan_fu_288_p3;

endmodule //td_fused_top_tdf5_adjust
module td_fused_top_Block_entry_proc_proc523 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_143,
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
input  [15:0] tmp_143;
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
            ap_return_preg <= tmp_143;
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
        ap_return = tmp_143;
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

endmodule //td_fused_top_Block_entry_proc_proc523
module td_fused_top_tdf5_accum_3_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_22,
        accum_in_22_ap_vld,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_22;
output   accum_in_22_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_22;
reg accum_in_22_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln111_fu_73_p2;
reg   [3:0] add_ln111_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln111_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln111_fu_79_p1;
reg   [15:0] accum_in_22_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_22_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U799(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_22_preg <= 16'd0;
    end else begin
        if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_22_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln111_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_55 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        sum_01_reg_55 <= grp_fu_68_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        accum_in_load_reg_103 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln111_reg_90 <= add_ln111_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_22 = sum_01_reg_55;
    end else begin
        accum_in_22 = accum_in_22_preg;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_22_ap_vld = 1'b1;
    end else begin
        accum_in_22_ap_vld = 1'b0;
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln111_fu_79_p1;

assign add_ln111_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln111_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln111_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf5_accum_3_3
module td_fused_top_Block_entry_proc_proc522 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_142,
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
input  [15:0] tmp_142;
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
            ap_return_preg <= tmp_142;
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
        ap_return = tmp_142;
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

endmodule //td_fused_top_Block_entry_proc_proc522
module td_fused_top_tdf5_accum_3_2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_24,
        accum_in_24_ap_vld,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_24;
output   accum_in_24_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_24;
reg accum_in_24_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln111_fu_73_p2;
reg   [3:0] add_ln111_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln111_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln111_fu_79_p1;
reg   [15:0] accum_in_24_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_24_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U795(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_24_preg <= 16'd0;
    end else begin
        if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_24_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln111_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_55 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        sum_01_reg_55 <= grp_fu_68_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        accum_in_load_reg_103 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln111_reg_90 <= add_ln111_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_24 = sum_01_reg_55;
    end else begin
        accum_in_24 = accum_in_24_preg;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_24_ap_vld = 1'b1;
    end else begin
        accum_in_24_ap_vld = 1'b0;
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln111_fu_79_p1;

assign add_ln111_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln111_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln111_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf5_accum_3_2
module td_fused_top_Block_entry_proc_proc521 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_141,
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
input  [15:0] tmp_141;
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
            ap_return_preg <= tmp_141;
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
        ap_return = tmp_141;
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

endmodule //td_fused_top_Block_entry_proc_proc521
module td_fused_top_tdf5_accum_3_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_26,
        accum_in_26_ap_vld,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_26;
output   accum_in_26_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_26;
reg accum_in_26_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln111_fu_73_p2;
reg   [3:0] add_ln111_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln111_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln111_fu_79_p1;
reg   [15:0] accum_in_26_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_26_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U791(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_26_preg <= 16'd0;
    end else begin
        if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_26_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln111_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_55 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        sum_01_reg_55 <= grp_fu_68_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        accum_in_load_reg_103 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln111_reg_90 <= add_ln111_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_26 = sum_01_reg_55;
    end else begin
        accum_in_26 = accum_in_26_preg;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_26_ap_vld = 1'b1;
    end else begin
        accum_in_26_ap_vld = 1'b0;
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln111_fu_79_p1;

assign add_ln111_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln111_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln111_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf5_accum_3_1
module td_fused_top_Block_entry_proc_proc520 (
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

endmodule //td_fused_top_Block_entry_proc_proc520
module td_fused_top_tdf5_accum_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_28,
        accum_in_28_ap_vld,
        accum_in_address0,
        accum_in_ce0,
        accum_in_q0
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] accum_in_28;
output   accum_in_28_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_28;
reg accum_in_28_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln111_fu_73_p2;
reg   [3:0] add_ln111_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln111_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln111_fu_79_p1;
reg   [15:0] accum_in_28_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_28_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U787(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_28_preg <= 16'd0;
    end else begin
        if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_28_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln111_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sum_01_reg_55 <= 16'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        sum_01_reg_55 <= grp_fu_68_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        accum_in_load_reg_103 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln111_reg_90 <= add_ln111_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_28 = sum_01_reg_55;
    end else begin
        accum_in_28 = accum_in_28_preg;
    end
end

always @ (*) begin
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_28_ap_vld = 1'b1;
    end else begin
        accum_in_28_ap_vld = 1'b0;
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln111_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_in_address0 = zext_ln111_fu_79_p1;

assign add_ln111_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln111_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln111_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf5_accum_3
module td_fused_top_tdf5_accum_2 (
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
reg   [3:0] out_idx_reg_66;
reg   [3:0] out_idx_reg_66_pp0_iter1_reg;
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
reg   [3:0] out_idx_reg_66_pp0_iter2_reg;
reg   [3:0] out_idx_reg_66_pp0_iter3_reg;
reg   [3:0] out_idx_reg_66_pp0_iter4_reg;
reg   [3:0] out_idx_reg_66_pp0_iter5_reg;
reg   [3:0] out_idx_reg_66_pp0_iter6_reg;
reg   [3:0] out_idx_reg_66_pp0_iter7_reg;
reg   [3:0] out_idx_reg_66_pp0_iter8_reg;
reg   [3:0] out_idx_reg_66_pp0_iter9_reg;
wire   [3:0] add_ln98_fu_82_p2;
reg   [3:0] add_ln98_reg_121;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln84_fu_88_p2;
reg   [0:0] icmp_ln84_reg_126;
reg   [0:0] icmp_ln84_reg_126_pp0_iter1_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter2_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter3_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter4_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter5_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter6_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter7_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter8_reg;
reg   [0:0] icmp_ln84_reg_126_pp0_iter9_reg;
reg   [15:0] accum_in_load_reg_140;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] accum_in_load_1_reg_145;
wire   [15:0] grp_fu_78_p2;
reg   [15:0] sum0_reg_150;
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
reg   [3:0] ap_phi_mux_out_idx_phi_fu_70_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln94_fu_100_p1;
wire   [63:0] zext_ln94_1_fu_111_p1;
wire   [63:0] zext_ln84_fu_116_p1;
wire   [3:0] i_12_fu_94_p2;
wire   [3:0] or_ln94_fu_105_p2;
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
hadd_16ns_16ns_16_8_full_dsp_1_U784(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(accum_in_load_1_reg_145),
    .din1(accum_in_load_reg_140),
    .dout(grp_fu_78_p2)
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
        out_idx_reg_66 <= 4'd0;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln84_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_66 <= add_ln98_reg_121;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln84_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_load_1_reg_145 <= accum_in_q0;
        accum_in_load_reg_140 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln98_reg_121 <= add_ln98_fu_82_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln84_reg_126 <= icmp_ln84_fu_88_p2;
        icmp_ln84_reg_126_pp0_iter1_reg <= icmp_ln84_reg_126;
        out_idx_reg_66_pp0_iter1_reg <= out_idx_reg_66;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln84_reg_126_pp0_iter2_reg <= icmp_ln84_reg_126_pp0_iter1_reg;
        icmp_ln84_reg_126_pp0_iter3_reg <= icmp_ln84_reg_126_pp0_iter2_reg;
        icmp_ln84_reg_126_pp0_iter4_reg <= icmp_ln84_reg_126_pp0_iter3_reg;
        icmp_ln84_reg_126_pp0_iter5_reg <= icmp_ln84_reg_126_pp0_iter4_reg;
        icmp_ln84_reg_126_pp0_iter6_reg <= icmp_ln84_reg_126_pp0_iter5_reg;
        icmp_ln84_reg_126_pp0_iter7_reg <= icmp_ln84_reg_126_pp0_iter6_reg;
        icmp_ln84_reg_126_pp0_iter8_reg <= icmp_ln84_reg_126_pp0_iter7_reg;
        icmp_ln84_reg_126_pp0_iter9_reg <= icmp_ln84_reg_126_pp0_iter8_reg;
        out_idx_reg_66_pp0_iter2_reg <= out_idx_reg_66_pp0_iter1_reg;
        out_idx_reg_66_pp0_iter3_reg <= out_idx_reg_66_pp0_iter2_reg;
        out_idx_reg_66_pp0_iter4_reg <= out_idx_reg_66_pp0_iter3_reg;
        out_idx_reg_66_pp0_iter5_reg <= out_idx_reg_66_pp0_iter4_reg;
        out_idx_reg_66_pp0_iter6_reg <= out_idx_reg_66_pp0_iter5_reg;
        out_idx_reg_66_pp0_iter7_reg <= out_idx_reg_66_pp0_iter6_reg;
        out_idx_reg_66_pp0_iter8_reg <= out_idx_reg_66_pp0_iter7_reg;
        out_idx_reg_66_pp0_iter9_reg <= out_idx_reg_66_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln84_reg_126_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum0_reg_150 <= grp_fu_78_p2;
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
    if (((icmp_ln84_reg_126_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln84_fu_88_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln84_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_out_idx_phi_fu_70_p4 = add_ln98_reg_121;
    end else begin
        ap_phi_mux_out_idx_phi_fu_70_p4 = out_idx_reg_66;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln84_fu_88_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln84_fu_88_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
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

assign accum_in_address0 = zext_ln94_1_fu_111_p1;

assign accum_in_address1 = zext_ln94_fu_100_p1;

assign accum_out_address0 = zext_ln84_fu_116_p1;

assign accum_out_d0 = sum0_reg_150;

assign add_ln98_fu_82_p2 = (ap_phi_mux_out_idx_phi_fu_70_p4 + 4'd1);

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

assign i_12_fu_94_p2 = ap_phi_mux_out_idx_phi_fu_70_p4 << 4'd1;

assign icmp_ln84_fu_88_p2 = ((ap_phi_mux_out_idx_phi_fu_70_p4 == 4'd8) ? 1'b1 : 1'b0);

assign or_ln94_fu_105_p2 = (i_12_fu_94_p2 | 4'd1);

assign zext_ln84_fu_116_p1 = out_idx_reg_66_pp0_iter9_reg;

assign zext_ln94_1_fu_111_p1 = or_ln94_fu_105_p2;

assign zext_ln94_fu_100_p1 = i_12_fu_94_p2;

endmodule //td_fused_top_tdf5_accum_2
module td_fused_top_tdf5_accum_1 (
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
parameter    ap_ST_fsm_state17 = 11'd256;
parameter    ap_ST_fsm_state18 = 11'd512;
parameter    ap_ST_fsm_state19 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [6:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;
output  [6:0] accum_in_address1;
output   accum_in_ce1;
input  [15:0] accum_in_q1;
output  [6:0] accum_in1_address0;
output   accum_in1_ce0;
input  [15:0] accum_in1_q0;
output  [6:0] accum_in1_address1;
output   accum_in1_ce1;
input  [15:0] accum_in1_q1;
output  [3:0] accum_out_address0;
output   accum_out_ce0;
output   accum_out_we0;
output  [15:0] accum_out_d0;
output  [3:0] accum_out_address1;
output   accum_out_ce1;
output   accum_out_we1;
output  [15:0] accum_out_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[6:0] accum_in_address0;
reg accum_in_ce0;
reg[6:0] accum_in_address1;
reg accum_in_ce1;
reg[6:0] accum_in1_address0;
reg accum_in1_ce0;
reg[6:0] accum_in1_address1;
reg accum_in1_ce1;
reg accum_out_ce0;
reg accum_out_we0;
reg accum_out_ce1;
reg accum_out_we1;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] x_reg_263;
reg   [15:0] psum_2_03_reg_275;
reg   [15:0] psum_1_02_reg_287;
reg   [15:0] psum_0_01_reg_299;
reg   [15:0] psum_15_016_reg_311;
reg   [15:0] psum_14_015_reg_323;
reg   [15:0] psum_13_014_reg_335;
reg   [15:0] psum_12_013_reg_347;
reg   [15:0] psum_11_012_reg_359;
reg   [15:0] psum_10_011_reg_371;
reg   [15:0] psum_9_010_reg_383;
reg   [15:0] psum_8_09_reg_395;
reg   [15:0] psum_7_08_reg_407;
reg   [15:0] psum_6_07_reg_419;
reg   [15:0] psum_5_06_reg_431;
reg   [15:0] psum_4_05_reg_443;
reg   [15:0] psum_3_04_reg_455;
wire   [0:0] icmp_ln49_fu_536_p2;
reg   [0:0] icmp_ln49_reg_775;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state9_pp0_stage0_iter1;
wire    ap_block_state16_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln49_reg_775_pp0_iter1_reg;
wire   [6:0] lshr_ln_fu_542_p4;
reg   [6:0] lshr_ln_reg_779;
reg   [15:0] accum_in_load_reg_809;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state10_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in1_load_reg_814;
reg   [15:0] accum_in_load_15_reg_819;
reg   [15:0] accum_in1_load_8_reg_824;
reg   [15:0] accum_in_load_16_reg_849;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state11_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in1_load_9_reg_854;
reg   [15:0] accum_in_load_17_reg_859;
reg   [15:0] accum_in1_load_10_reg_864;
reg   [15:0] accum_in_load_18_reg_889;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state12_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
reg   [15:0] accum_in1_load_11_reg_894;
reg   [15:0] accum_in_load_19_reg_899;
reg   [15:0] accum_in1_load_12_reg_904;
reg   [15:0] accum_in_load_20_reg_929;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state6_pp0_stage4_iter0;
wire    ap_block_state13_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_11001;
reg   [15:0] accum_in1_load_13_reg_934;
reg   [15:0] accum_in_load_21_reg_939;
reg   [15:0] accum_in1_load_14_reg_944;
wire   [7:0] add_ln49_fu_636_p2;
reg   [7:0] add_ln49_reg_949;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state8_pp0_stage6_iter0;
wire    ap_block_state15_pp0_stage6_iter1;
wire    ap_block_pp0_stage6_11001;
wire   [15:0] grp_fu_508_p2;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_513_p2;
wire   [15:0] grp_fu_518_p2;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state7_pp0_stage5_iter0;
wire    ap_block_state14_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_11001;
reg    ap_enable_reg_pp0_iter2;
wire   [4:0] add_ln57_fu_659_p2;
wire    ap_CS_fsm_state18;
wire   [0:0] tmp_fu_642_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage3_subdone;
reg    ap_condition_pp0_exit_iter0_state5;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_pp0_stage0_subdone;
reg   [7:0] ap_phi_mux_x_phi_fu_267_p4;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage2;
wire   [15:0] ap_phi_mux_psum_15_016_phi_fu_315_p4;
wire   [15:0] ap_phi_mux_psum_14_015_phi_fu_327_p4;
wire    ap_block_pp0_stage6;
wire   [15:0] ap_phi_mux_psum_13_014_phi_fu_339_p4;
wire   [15:0] ap_phi_mux_psum_12_013_phi_fu_351_p4;
wire   [15:0] ap_phi_mux_psum_11_012_phi_fu_363_p4;
wire    ap_block_pp0_stage5;
wire   [15:0] ap_phi_mux_psum_10_011_phi_fu_375_p4;
wire   [15:0] ap_phi_mux_psum_9_010_phi_fu_387_p4;
wire   [15:0] ap_phi_mux_psum_8_09_phi_fu_399_p4;
wire    ap_block_pp0_stage4;
wire   [15:0] ap_phi_mux_psum_7_08_phi_fu_411_p4;
wire   [15:0] ap_phi_mux_psum_6_07_phi_fu_423_p4;
wire   [15:0] ap_phi_mux_psum_5_06_phi_fu_435_p4;
wire    ap_block_pp0_stage3;
wire   [15:0] ap_phi_mux_psum_4_05_phi_fu_447_p4;
wire   [15:0] ap_phi_mux_psum_3_04_phi_fu_459_p4;
reg   [4:0] q_reg_467;
wire    ap_CS_fsm_state17;
reg   [15:0] ap_phi_mux_phi_ln69_phi_fu_481_p16;
wire   [3:0] trunc_ln57_fu_655_p1;
wire   [63:0] zext_ln53_fu_552_p1;
wire   [63:0] zext_ln53_8_fu_564_p1;
wire   [63:0] zext_ln53_9_fu_575_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln53_10_fu_586_p1;
wire   [63:0] zext_ln53_11_fu_597_p1;
wire   [63:0] zext_ln53_12_fu_608_p1;
wire   [63:0] zext_ln53_13_fu_619_p1;
wire   [63:0] zext_ln53_14_fu_630_p1;
wire   [63:0] zext_ln57_fu_650_p1;
wire   [63:0] zext_ln57_2_fu_671_p1;
reg   [15:0] grp_fu_508_p0;
reg   [15:0] grp_fu_508_p1;
reg   [15:0] grp_fu_513_p0;
reg   [15:0] grp_fu_513_p1;
reg   [15:0] grp_fu_518_p0;
reg   [15:0] grp_fu_518_p1;
wire   [6:0] or_ln53_fu_558_p2;
wire   [6:0] or_ln53_7_fu_570_p2;
wire   [6:0] or_ln53_8_fu_581_p2;
wire   [6:0] or_ln53_9_fu_592_p2;
wire   [6:0] or_ln53_10_fu_603_p2;
wire   [6:0] or_ln53_11_fu_614_p2;
wire   [6:0] or_ln53_12_fu_625_p2;
wire   [3:0] or_ln57_fu_665_p2;
wire   [0:0] icmp_ln69_fu_676_p2;
wire   [0:0] icmp_ln69_7_fu_690_p2;
wire   [15:0] select_ln69_fu_682_p3;
wire   [0:0] icmp_ln69_8_fu_704_p2;
wire   [15:0] select_ln69_7_fu_696_p3;
wire   [0:0] icmp_ln69_9_fu_718_p2;
wire   [15:0] select_ln69_8_fu_710_p3;
wire   [0:0] icmp_ln69_10_fu_732_p2;
wire   [15:0] select_ln69_9_fu_724_p3;
wire   [0:0] icmp_ln69_11_fu_746_p2;
wire   [15:0] select_ln69_10_fu_738_p3;
wire   [0:0] icmp_ln69_12_fu_760_p2;
wire   [15:0] select_ln69_11_fu_752_p3;
wire    ap_CS_fsm_state19;
reg   [10:0] ap_NS_fsm;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_pp0_stage5_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_728;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U778(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_508_p0),
    .din1(grp_fu_508_p1),
    .dout(grp_fu_508_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U779(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_513_p0),
    .din1(grp_fu_513_p1),
    .dout(grp_fu_513_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U780(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_518_p0),
    .din1(grp_fu_518_p1),
    .dout(grp_fu_518_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state19)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state5) & (1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3_subdone))) begin
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
        if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6_subdone)))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state17)) begin
        q_reg_467 <= 5'd0;
    end else if (((tmp_fu_642_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        q_reg_467 <= add_ln57_fu_659_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        x_reg_263 <= add_ln49_reg_949;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_263 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        accum_in1_load_10_reg_864 <= accum_in1_q0;
        accum_in1_load_9_reg_854 <= accum_in1_q1;
        accum_in_load_16_reg_849 <= accum_in_q1;
        accum_in_load_17_reg_859 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        accum_in1_load_11_reg_894 <= accum_in1_q1;
        accum_in1_load_12_reg_904 <= accum_in1_q0;
        accum_in_load_18_reg_889 <= accum_in_q1;
        accum_in_load_19_reg_899 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        accum_in1_load_13_reg_934 <= accum_in1_q1;
        accum_in1_load_14_reg_944 <= accum_in1_q0;
        accum_in_load_20_reg_929 <= accum_in_q1;
        accum_in_load_21_reg_939 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        accum_in1_load_8_reg_824 <= accum_in1_q0;
        accum_in1_load_reg_814 <= accum_in1_q1;
        accum_in_load_15_reg_819 <= accum_in_q0;
        accum_in_load_reg_809 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6_11001))) begin
        add_ln49_reg_949 <= add_ln49_fu_636_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln49_reg_775 <= icmp_ln49_fu_536_p2;
        icmp_ln49_reg_775_pp0_iter1_reg <= icmp_ln49_reg_775;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln49_fu_536_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        lshr_ln_reg_779 <= {{ap_phi_mux_x_phi_fu_267_p4[7:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        psum_0_01_reg_299 <= grp_fu_508_p2;
        psum_1_02_reg_287 <= grp_fu_513_p2;
        psum_2_03_reg_275 <= grp_fu_518_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage5_11001))) begin
        psum_10_011_reg_371 <= grp_fu_513_p2;
        psum_11_012_reg_359 <= grp_fu_518_p2;
        psum_9_010_reg_383 <= grp_fu_508_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage6_11001))) begin
        psum_12_013_reg_347 <= grp_fu_508_p2;
        psum_13_014_reg_335 <= grp_fu_513_p2;
        psum_14_015_reg_323 <= grp_fu_518_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        psum_15_016_reg_311 <= grp_fu_508_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        psum_3_04_reg_455 <= grp_fu_508_p2;
        psum_4_05_reg_443 <= grp_fu_513_p2;
        psum_5_06_reg_431 <= grp_fu_518_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4) & (icmp_ln49_reg_775_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        psum_6_07_reg_419 <= grp_fu_508_p2;
        psum_7_08_reg_407 <= grp_fu_513_p2;
        psum_8_09_reg_395 <= grp_fu_518_p2;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in1_address0 = zext_ln53_14_fu_630_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address0 = zext_ln53_12_fu_608_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address0 = zext_ln53_10_fu_586_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address0 = zext_ln53_8_fu_564_p1;
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
            accum_in1_address1 = zext_ln53_13_fu_619_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address1 = zext_ln53_11_fu_597_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address1 = zext_ln53_9_fu_575_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address1 = zext_ln53_fu_552_p1;
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
            accum_in_address0 = zext_ln53_14_fu_630_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address0 = zext_ln53_12_fu_608_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address0 = zext_ln53_10_fu_586_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address0 = zext_ln53_8_fu_564_p1;
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
            accum_in_address1 = zext_ln53_13_fu_619_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address1 = zext_ln53_11_fu_597_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address1 = zext_ln53_9_fu_575_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address1 = zext_ln53_fu_552_p1;
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
    if ((1'b1 == ap_CS_fsm_state18)) begin
        accum_out_ce0 = 1'b1;
    end else begin
        accum_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        accum_out_ce1 = 1'b1;
    end else begin
        accum_out_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_642_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_642_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        accum_out_we1 = 1'b1;
    end else begin
        accum_out_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln49_reg_775 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
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
    if (((tmp_fu_642_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        if ((trunc_ln57_fu_655_p1 == 4'd0)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_0_01_reg_299;
        end else if ((1'b1 == ap_condition_728)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_14_015_reg_323;
        end else if ((trunc_ln57_fu_655_p1 == 4'd12)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_12_013_reg_347;
        end else if ((trunc_ln57_fu_655_p1 == 4'd10)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_10_011_reg_371;
        end else if ((trunc_ln57_fu_655_p1 == 4'd8)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_8_09_reg_395;
        end else if ((trunc_ln57_fu_655_p1 == 4'd6)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_6_07_reg_419;
        end else if ((trunc_ln57_fu_655_p1 == 4'd4)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_4_05_reg_443;
        end else if ((trunc_ln57_fu_655_p1 == 4'd2)) begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = psum_2_03_reg_275;
        end else begin
            ap_phi_mux_phi_ln69_phi_fu_481_p16 = 'bx;
        end
    end else begin
        ap_phi_mux_phi_ln69_phi_fu_481_p16 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln49_reg_775 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_x_phi_fu_267_p4 = add_ln49_reg_949;
    end else begin
        ap_phi_mux_x_phi_fu_267_p4 = x_reg_263;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_508_p0 = ap_phi_mux_psum_15_016_phi_fu_315_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_508_p0 = ap_phi_mux_psum_12_013_phi_fu_351_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_508_p0 = ap_phi_mux_psum_9_010_phi_fu_387_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_508_p0 = ap_phi_mux_psum_6_07_phi_fu_423_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_508_p0 = ap_phi_mux_psum_3_04_phi_fu_459_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_508_p0 = grp_fu_508_p2;
    end else begin
        grp_fu_508_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_508_p1 = accum_in1_load_14_reg_944;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_508_p1 = accum_in_load_20_reg_929;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_508_p1 = accum_in1_load_11_reg_894;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_508_p1 = accum_in_load_17_reg_859;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_508_p1 = accum_in1_load_8_reg_824;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_508_p1 = accum_in_load_reg_809;
    end else begin
        grp_fu_508_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_513_p0 = ap_phi_mux_psum_13_014_phi_fu_339_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_513_p0 = ap_phi_mux_psum_10_011_phi_fu_375_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_513_p0 = ap_phi_mux_psum_7_08_phi_fu_411_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_513_p0 = ap_phi_mux_psum_4_05_phi_fu_447_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_513_p0 = grp_fu_513_p2;
        end else begin
            grp_fu_513_p0 = 'bx;
        end
    end else begin
        grp_fu_513_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_513_p1 = accum_in1_load_13_reg_934;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_513_p1 = accum_in_load_19_reg_899;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_513_p1 = accum_in1_load_10_reg_864;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_513_p1 = accum_in_load_16_reg_849;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_513_p1 = accum_in1_load_reg_814;
        end else begin
            grp_fu_513_p1 = 'bx;
        end
    end else begin
        grp_fu_513_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_518_p0 = ap_phi_mux_psum_14_015_phi_fu_327_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_518_p0 = ap_phi_mux_psum_11_012_phi_fu_363_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_518_p0 = ap_phi_mux_psum_8_09_phi_fu_399_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_518_p0 = ap_phi_mux_psum_5_06_phi_fu_435_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_518_p0 = grp_fu_518_p2;
        end else begin
            grp_fu_518_p0 = 'bx;
        end
    end else begin
        grp_fu_518_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_518_p1 = accum_in_load_21_reg_939;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_518_p1 = accum_in1_load_12_reg_904;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_518_p1 = accum_in_load_18_reg_889;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_518_p1 = accum_in1_load_9_reg_854;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_518_p1 = accum_in_load_15_reg_819;
        end else begin
            grp_fu_518_p1 = 'bx;
        end
    end else begin
        grp_fu_518_p1 = 'bx;
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
            if ((~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
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
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((~((icmp_ln49_reg_775 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone)) & (1'b0 == ap_block_pp0_stage3_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else if (((icmp_ln49_reg_775 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state17;
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
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            if (((tmp_fu_642_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
                ap_NS_fsm = ap_ST_fsm_state18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_out_address0 = zext_ln57_2_fu_671_p1;

assign accum_out_address1 = zext_ln57_fu_650_p1;

assign accum_out_d0 = ((icmp_ln69_12_fu_760_p2[0:0] == 1'b1) ? psum_13_014_reg_335 : select_ln69_11_fu_752_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln69_phi_fu_481_p16;

assign add_ln49_fu_636_p2 = (x_reg_263 + 8'd16);

assign add_ln57_fu_659_p2 = (q_reg_467 + 5'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state17 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd10];

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

assign ap_block_state15_pp0_stage6_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_728 = (~(trunc_ln57_fu_655_p1 == 4'd0) & ~(trunc_ln57_fu_655_p1 == 4'd12) & ~(trunc_ln57_fu_655_p1 == 4'd10) & ~(trunc_ln57_fu_655_p1 == 4'd8) & ~(trunc_ln57_fu_655_p1 == 4'd6) & ~(trunc_ln57_fu_655_p1 == 4'd4) & ~(trunc_ln57_fu_655_p1 == 4'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_psum_10_011_phi_fu_375_p4 = grp_fu_513_p2;

assign ap_phi_mux_psum_11_012_phi_fu_363_p4 = grp_fu_518_p2;

assign ap_phi_mux_psum_12_013_phi_fu_351_p4 = grp_fu_508_p2;

assign ap_phi_mux_psum_13_014_phi_fu_339_p4 = grp_fu_513_p2;

assign ap_phi_mux_psum_14_015_phi_fu_327_p4 = grp_fu_518_p2;

assign ap_phi_mux_psum_15_016_phi_fu_315_p4 = grp_fu_508_p2;

assign ap_phi_mux_psum_3_04_phi_fu_459_p4 = grp_fu_508_p2;

assign ap_phi_mux_psum_4_05_phi_fu_447_p4 = grp_fu_513_p2;

assign ap_phi_mux_psum_5_06_phi_fu_435_p4 = grp_fu_518_p2;

assign ap_phi_mux_psum_6_07_phi_fu_423_p4 = grp_fu_508_p2;

assign ap_phi_mux_psum_7_08_phi_fu_411_p4 = grp_fu_513_p2;

assign ap_phi_mux_psum_8_09_phi_fu_399_p4 = grp_fu_518_p2;

assign ap_phi_mux_psum_9_010_phi_fu_387_p4 = grp_fu_508_p2;

assign icmp_ln49_fu_536_p2 = ((ap_phi_mux_x_phi_fu_267_p4 < 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln69_10_fu_732_p2 = ((or_ln57_fu_665_p2 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln69_11_fu_746_p2 = ((or_ln57_fu_665_p2 == 4'd11) ? 1'b1 : 1'b0);

assign icmp_ln69_12_fu_760_p2 = ((or_ln57_fu_665_p2 == 4'd13) ? 1'b1 : 1'b0);

assign icmp_ln69_7_fu_690_p2 = ((or_ln57_fu_665_p2 == 4'd3) ? 1'b1 : 1'b0);

assign icmp_ln69_8_fu_704_p2 = ((or_ln57_fu_665_p2 == 4'd5) ? 1'b1 : 1'b0);

assign icmp_ln69_9_fu_718_p2 = ((or_ln57_fu_665_p2 == 4'd7) ? 1'b1 : 1'b0);

assign icmp_ln69_fu_676_p2 = ((or_ln57_fu_665_p2 == 4'd1) ? 1'b1 : 1'b0);

assign lshr_ln_fu_542_p4 = {{ap_phi_mux_x_phi_fu_267_p4[7:1]}};

assign or_ln53_10_fu_603_p2 = (lshr_ln_reg_779 | 7'd5);

assign or_ln53_11_fu_614_p2 = (lshr_ln_reg_779 | 7'd6);

assign or_ln53_12_fu_625_p2 = (lshr_ln_reg_779 | 7'd7);

assign or_ln53_7_fu_570_p2 = (lshr_ln_reg_779 | 7'd2);

assign or_ln53_8_fu_581_p2 = (lshr_ln_reg_779 | 7'd3);

assign or_ln53_9_fu_592_p2 = (lshr_ln_reg_779 | 7'd4);

assign or_ln53_fu_558_p2 = (lshr_ln_fu_542_p4 | 7'd1);

assign or_ln57_fu_665_p2 = (trunc_ln57_fu_655_p1 | 4'd1);

assign select_ln69_10_fu_738_p3 = ((icmp_ln69_10_fu_732_p2[0:0] == 1'b1) ? psum_9_010_reg_383 : select_ln69_9_fu_724_p3);

assign select_ln69_11_fu_752_p3 = ((icmp_ln69_11_fu_746_p2[0:0] == 1'b1) ? psum_11_012_reg_359 : select_ln69_10_fu_738_p3);

assign select_ln69_7_fu_696_p3 = ((icmp_ln69_7_fu_690_p2[0:0] == 1'b1) ? psum_3_04_reg_455 : select_ln69_fu_682_p3);

assign select_ln69_8_fu_710_p3 = ((icmp_ln69_8_fu_704_p2[0:0] == 1'b1) ? psum_5_06_reg_431 : select_ln69_7_fu_696_p3);

assign select_ln69_9_fu_724_p3 = ((icmp_ln69_9_fu_718_p2[0:0] == 1'b1) ? psum_7_08_reg_407 : select_ln69_8_fu_710_p3);

assign select_ln69_fu_682_p3 = ((icmp_ln69_fu_676_p2[0:0] == 1'b1) ? psum_1_02_reg_287 : psum_15_016_reg_311);

assign tmp_fu_642_p3 = q_reg_467[32'd4];

assign trunc_ln57_fu_655_p1 = q_reg_467[3:0];

assign zext_ln53_10_fu_586_p1 = or_ln53_8_fu_581_p2;

assign zext_ln53_11_fu_597_p1 = or_ln53_9_fu_592_p2;

assign zext_ln53_12_fu_608_p1 = or_ln53_10_fu_603_p2;

assign zext_ln53_13_fu_619_p1 = or_ln53_11_fu_614_p2;

assign zext_ln53_14_fu_630_p1 = or_ln53_12_fu_625_p2;

assign zext_ln53_8_fu_564_p1 = or_ln53_fu_558_p2;

assign zext_ln53_9_fu_575_p1 = or_ln53_7_fu_570_p2;

assign zext_ln53_fu_552_p1 = lshr_ln_fu_542_p4;

assign zext_ln57_2_fu_671_p1 = or_ln57_fu_665_p2;

assign zext_ln57_fu_650_p1 = q_reg_467;

endmodule //td_fused_top_tdf5_accum_1
module td_fused_top_tdf5_dot_product (
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
        weight_vecs_0_0_address0,
        weight_vecs_0_0_ce0,
        weight_vecs_0_0_q0,
        weight_vecs_0_1_address0,
        weight_vecs_0_1_ce0,
        weight_vecs_0_1_q0,
        weight_vecs_1_0_address0,
        weight_vecs_1_0_ce0,
        weight_vecs_1_0_q0,
        weight_vecs_1_1_address0,
        weight_vecs_1_1_ce0,
        weight_vecs_1_1_q0,
        weight_vecs_2_0_address0,
        weight_vecs_2_0_ce0,
        weight_vecs_2_0_q0,
        weight_vecs_2_1_address0,
        weight_vecs_2_1_ce0,
        weight_vecs_2_1_q0,
        weight_vecs_3_0_address0,
        weight_vecs_3_0_ce0,
        weight_vecs_3_0_q0,
        weight_vecs_3_1_address0,
        weight_vecs_3_1_ce0,
        weight_vecs_3_1_q0,
        products_0_0_address0,
        products_0_0_ce0,
        products_0_0_we0,
        products_0_0_d0,
        products_0_1_address0,
        products_0_1_ce0,
        products_0_1_we0,
        products_0_1_d0,
        products_1_0_address0,
        products_1_0_ce0,
        products_1_0_we0,
        products_1_0_d0,
        products_1_1_address0,
        products_1_1_ce0,
        products_1_1_we0,
        products_1_1_d0,
        products_2_0_address0,
        products_2_0_ce0,
        products_2_0_we0,
        products_2_0_d0,
        products_2_1_address0,
        products_2_1_ce0,
        products_2_1_we0,
        products_2_1_d0,
        products_3_0_address0,
        products_3_0_ce0,
        products_3_0_we0,
        products_3_0_d0,
        products_3_1_address0,
        products_3_1_ce0,
        products_3_1_we0,
        products_3_1_d0
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
output  [6:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
input  [15:0] ifmap_vec_0_q0;
output  [6:0] ifmap_vec_1_address0;
output   ifmap_vec_1_ce0;
input  [15:0] ifmap_vec_1_q0;
output  [6:0] weight_vecs_0_0_address0;
output   weight_vecs_0_0_ce0;
input  [15:0] weight_vecs_0_0_q0;
output  [6:0] weight_vecs_0_1_address0;
output   weight_vecs_0_1_ce0;
input  [15:0] weight_vecs_0_1_q0;
output  [6:0] weight_vecs_1_0_address0;
output   weight_vecs_1_0_ce0;
input  [15:0] weight_vecs_1_0_q0;
output  [6:0] weight_vecs_1_1_address0;
output   weight_vecs_1_1_ce0;
input  [15:0] weight_vecs_1_1_q0;
output  [6:0] weight_vecs_2_0_address0;
output   weight_vecs_2_0_ce0;
input  [15:0] weight_vecs_2_0_q0;
output  [6:0] weight_vecs_2_1_address0;
output   weight_vecs_2_1_ce0;
input  [15:0] weight_vecs_2_1_q0;
output  [6:0] weight_vecs_3_0_address0;
output   weight_vecs_3_0_ce0;
input  [15:0] weight_vecs_3_0_q0;
output  [6:0] weight_vecs_3_1_address0;
output   weight_vecs_3_1_ce0;
input  [15:0] weight_vecs_3_1_q0;
output  [6:0] products_0_0_address0;
output   products_0_0_ce0;
output   products_0_0_we0;
output  [15:0] products_0_0_d0;
output  [6:0] products_0_1_address0;
output   products_0_1_ce0;
output   products_0_1_we0;
output  [15:0] products_0_1_d0;
output  [6:0] products_1_0_address0;
output   products_1_0_ce0;
output   products_1_0_we0;
output  [15:0] products_1_0_d0;
output  [6:0] products_1_1_address0;
output   products_1_1_ce0;
output   products_1_1_we0;
output  [15:0] products_1_1_d0;
output  [6:0] products_2_0_address0;
output   products_2_0_ce0;
output   products_2_0_we0;
output  [15:0] products_2_0_d0;
output  [6:0] products_2_1_address0;
output   products_2_1_ce0;
output   products_2_1_we0;
output  [15:0] products_2_1_d0;
output  [6:0] products_3_0_address0;
output   products_3_0_ce0;
output   products_3_0_we0;
output  [15:0] products_3_0_d0;
output  [6:0] products_3_1_address0;
output   products_3_1_ce0;
output   products_3_1_we0;
output  [15:0] products_3_1_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_0_ce0;
reg ifmap_vec_1_ce0;
reg weight_vecs_0_0_ce0;
reg weight_vecs_0_1_ce0;
reg weight_vecs_1_0_ce0;
reg weight_vecs_1_1_ce0;
reg weight_vecs_2_0_ce0;
reg weight_vecs_2_1_ce0;
reg weight_vecs_3_0_ce0;
reg weight_vecs_3_1_ce0;
reg products_0_0_ce0;
reg products_0_0_we0;
reg products_0_1_ce0;
reg products_0_1_we0;
reg products_1_0_ce0;
reg products_1_0_we0;
reg products_1_1_ce0;
reg products_1_1_we0;
reg products_2_0_ce0;
reg products_2_0_we0;
reg products_2_1_ce0;
reg products_2_1_we0;
reg products_3_0_ce0;
reg products_3_0_we0;
reg products_3_1_ce0;
reg products_3_1_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [6:0] indvar_flatten17_reg_334;
reg   [1:0] ii_reg_345;
reg   [5:0] indvar_flatten_reg_356;
reg   [1:0] jj_reg_367;
reg   [4:0] ic_reg_378;
wire   [6:0] add_ln147_3_fu_421_p2;
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
wire   [0:0] icmp_ln147_fu_455_p2;
reg   [0:0] icmp_ln147_reg_730;
reg   [0:0] icmp_ln147_reg_730_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter4_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter5_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter6_reg;
reg   [0:0] icmp_ln147_reg_730_pp0_iter7_reg;
wire   [1:0] select_ln147_11_fu_489_p3;
reg   [1:0] select_ln147_11_reg_734;
wire   [1:0] select_ln148_7_fu_591_p3;
reg   [1:0] select_ln148_7_reg_739;
wire   [5:0] empty_103_fu_603_p2;
reg   [5:0] empty_103_reg_744;
wire   [3:0] select_ln148_8_fu_619_p3;
reg   [3:0] select_ln148_8_reg_749;
reg   [3:0] select_ln148_8_reg_749_pp0_iter1_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter2_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter3_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter4_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter5_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter6_reg;
reg   [3:0] select_ln148_8_reg_749_pp0_iter7_reg;
reg   [2:0] newIndex_reg_755;
reg   [2:0] newIndex_reg_755_pp0_iter1_reg;
reg   [2:0] newIndex_reg_755_pp0_iter2_reg;
reg   [2:0] newIndex_reg_755_pp0_iter3_reg;
reg   [2:0] newIndex_reg_755_pp0_iter4_reg;
reg   [2:0] newIndex_reg_755_pp0_iter5_reg;
reg   [2:0] newIndex_reg_755_pp0_iter6_reg;
reg   [2:0] newIndex_reg_755_pp0_iter7_reg;
reg   [2:0] tmp_s_reg_761;
reg   [2:0] tmp_s_reg_761_pp0_iter1_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter2_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter3_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter4_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter5_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter6_reg;
reg   [2:0] tmp_s_reg_761_pp0_iter7_reg;
wire   [4:0] add_ln149_fu_657_p2;
wire   [5:0] select_ln148_9_fu_669_p3;
reg   [15:0] ifmap_vec_0_load_reg_826;
reg   [15:0] weight_vecs_0_0_load_reg_834;
reg   [15:0] weight_vecs_1_0_load_reg_839;
reg   [15:0] weight_vecs_2_0_load_reg_844;
reg   [15:0] weight_vecs_3_0_load_reg_849;
reg   [15:0] ifmap_vec_1_load_reg_854;
reg   [15:0] weight_vecs_0_1_load_reg_862;
reg   [15:0] weight_vecs_1_1_load_reg_867;
reg   [15:0] weight_vecs_2_1_load_reg_872;
reg   [15:0] weight_vecs_3_1_load_reg_877;
wire   [15:0] grp_fu_389_p2;
reg   [15:0] mul_reg_882;
wire   [15:0] grp_fu_393_p2;
reg   [15:0] mul_1_reg_887;
wire   [15:0] grp_fu_397_p2;
reg   [15:0] mul_2_reg_892;
wire   [15:0] grp_fu_401_p2;
reg   [15:0] mul_3_reg_897;
wire   [15:0] grp_fu_405_p2;
reg   [15:0] mul27_1_reg_902;
wire   [15:0] grp_fu_409_p2;
reg   [15:0] mul27_1_1_reg_907;
wire   [15:0] grp_fu_413_p2;
reg   [15:0] mul27_1_2_reg_912;
wire   [15:0] grp_fu_417_p2;
reg   [15:0] mul27_1_3_reg_917;
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
reg   [1:0] ap_phi_mux_ii_phi_fu_349_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_371_p4;
wire   [63:0] tmp_88_fu_683_p1;
wire   [63:0] zext_ln153_fu_703_p1;
wire   [63:0] zext_ln153_5_fu_717_p1;
wire   [3:0] shl_ln_fu_431_p3;
wire   [3:0] zext_ln150_fu_427_p1;
wire   [3:0] sub_ln150_fu_439_p2;
wire   [3:0] zext_ln150_3_fu_445_p1;
wire   [0:0] icmp_ln148_fu_467_p2;
wire   [1:0] add_ln147_fu_461_p2;
wire   [3:0] tmp_fu_501_p3;
wire   [4:0] tmp_cast_fu_509_p1;
wire   [4:0] select_ln147_13_cast_fu_497_p1;
wire   [4:0] empty_102_fu_513_p2;
wire   [3:0] shl_ln150_mid1_fu_527_p3;
wire   [3:0] zext_ln150_6_fu_523_p1;
wire   [3:0] sub_ln150_3_fu_535_p2;
wire   [3:0] add_ln150_fu_449_p2;
wire   [0:0] tmp_43_fu_557_p3;
wire   [0:0] xor_ln149_fu_565_p2;
wire   [1:0] select_ln147_fu_473_p3;
wire   [0:0] or_ln147_fu_571_p2;
wire   [4:0] select_ln147_10_fu_481_p3;
wire   [1:0] add_ln148_fu_577_p2;
wire   [5:0] sext_ln150_fu_519_p1;
wire   [5:0] select_ln148_9_cast_fu_599_p1;
wire   [3:0] select_ln147_12_fu_541_p3;
wire   [3:0] zext_ln150_7_fu_609_p1;
wire   [3:0] select_ln147_13_fu_549_p3;
wire   [3:0] add_ln150_3_fu_613_p2;
wire   [4:0] select_ln148_fu_583_p3;
wire   [3:0] trunc_ln149_fu_627_p1;
wire   [3:0] or_ln150_fu_641_p2;
wire   [5:0] add_ln148_3_fu_663_p2;
wire   [8:0] tmp_44_fu_677_p3;
wire   [6:0] lshr_ln_fu_697_p3;
wire   [6:0] lshr_ln153_5_fu_711_p3;
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
hmul_16ns_16ns_16_5_max_dsp_1_U752(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_826),
    .din1(weight_vecs_0_0_load_reg_834),
    .dout(grp_fu_389_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U753(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_826),
    .din1(weight_vecs_1_0_load_reg_839),
    .dout(grp_fu_393_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U754(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_826),
    .din1(weight_vecs_2_0_load_reg_844),
    .dout(grp_fu_397_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U755(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_load_reg_826),
    .din1(weight_vecs_3_0_load_reg_849),
    .dout(grp_fu_401_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U756(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_854),
    .din1(weight_vecs_0_1_load_reg_862),
    .dout(grp_fu_405_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U757(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_854),
    .din1(weight_vecs_1_1_load_reg_867),
    .dout(grp_fu_409_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U758(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_854),
    .din1(weight_vecs_2_1_load_reg_872),
    .dout(grp_fu_413_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U759(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_load_reg_854),
    .din1(weight_vecs_3_1_load_reg_877),
    .dout(grp_fu_417_p2)
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
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_455_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        ic_reg_378 <= add_ln149_fu_657_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_378 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_730 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_345 <= select_ln147_11_reg_734;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_345 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_455_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten17_reg_334 <= add_ln147_3_fu_421_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten17_reg_334 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_455_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_356 <= select_ln148_9_fu_669_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_356 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_730 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_367 <= select_ln148_7_reg_739;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_367 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_455_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_103_reg_744 <= empty_103_fu_603_p2;
        newIndex_reg_755 <= {{select_ln148_fu_583_p3[3:1]}};
        select_ln148_8_reg_749 <= select_ln148_8_fu_619_p3;
        tmp_s_reg_761 <= {{or_ln150_fu_641_p2[3:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln147_reg_730 <= icmp_ln147_fu_455_p2;
        icmp_ln147_reg_730_pp0_iter1_reg <= icmp_ln147_reg_730;
        newIndex_reg_755_pp0_iter1_reg <= newIndex_reg_755;
        select_ln148_8_reg_749_pp0_iter1_reg <= select_ln148_8_reg_749;
        tmp_s_reg_761_pp0_iter1_reg <= tmp_s_reg_761;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_730_pp0_iter2_reg <= icmp_ln147_reg_730_pp0_iter1_reg;
        icmp_ln147_reg_730_pp0_iter3_reg <= icmp_ln147_reg_730_pp0_iter2_reg;
        icmp_ln147_reg_730_pp0_iter4_reg <= icmp_ln147_reg_730_pp0_iter3_reg;
        icmp_ln147_reg_730_pp0_iter5_reg <= icmp_ln147_reg_730_pp0_iter4_reg;
        icmp_ln147_reg_730_pp0_iter6_reg <= icmp_ln147_reg_730_pp0_iter5_reg;
        icmp_ln147_reg_730_pp0_iter7_reg <= icmp_ln147_reg_730_pp0_iter6_reg;
        newIndex_reg_755_pp0_iter2_reg <= newIndex_reg_755_pp0_iter1_reg;
        newIndex_reg_755_pp0_iter3_reg <= newIndex_reg_755_pp0_iter2_reg;
        newIndex_reg_755_pp0_iter4_reg <= newIndex_reg_755_pp0_iter3_reg;
        newIndex_reg_755_pp0_iter5_reg <= newIndex_reg_755_pp0_iter4_reg;
        newIndex_reg_755_pp0_iter6_reg <= newIndex_reg_755_pp0_iter5_reg;
        newIndex_reg_755_pp0_iter7_reg <= newIndex_reg_755_pp0_iter6_reg;
        select_ln148_8_reg_749_pp0_iter2_reg <= select_ln148_8_reg_749_pp0_iter1_reg;
        select_ln148_8_reg_749_pp0_iter3_reg <= select_ln148_8_reg_749_pp0_iter2_reg;
        select_ln148_8_reg_749_pp0_iter4_reg <= select_ln148_8_reg_749_pp0_iter3_reg;
        select_ln148_8_reg_749_pp0_iter5_reg <= select_ln148_8_reg_749_pp0_iter4_reg;
        select_ln148_8_reg_749_pp0_iter6_reg <= select_ln148_8_reg_749_pp0_iter5_reg;
        select_ln148_8_reg_749_pp0_iter7_reg <= select_ln148_8_reg_749_pp0_iter6_reg;
        tmp_s_reg_761_pp0_iter2_reg <= tmp_s_reg_761_pp0_iter1_reg;
        tmp_s_reg_761_pp0_iter3_reg <= tmp_s_reg_761_pp0_iter2_reg;
        tmp_s_reg_761_pp0_iter4_reg <= tmp_s_reg_761_pp0_iter3_reg;
        tmp_s_reg_761_pp0_iter5_reg <= tmp_s_reg_761_pp0_iter4_reg;
        tmp_s_reg_761_pp0_iter6_reg <= tmp_s_reg_761_pp0_iter5_reg;
        tmp_s_reg_761_pp0_iter7_reg <= tmp_s_reg_761_pp0_iter6_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_730_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_load_reg_826 <= ifmap_vec_0_q0;
        ifmap_vec_1_load_reg_854 <= ifmap_vec_1_q0;
        weight_vecs_0_0_load_reg_834 <= weight_vecs_0_0_q0;
        weight_vecs_0_1_load_reg_862 <= weight_vecs_0_1_q0;
        weight_vecs_1_0_load_reg_839 <= weight_vecs_1_0_q0;
        weight_vecs_1_1_load_reg_867 <= weight_vecs_1_1_q0;
        weight_vecs_2_0_load_reg_844 <= weight_vecs_2_0_q0;
        weight_vecs_2_1_load_reg_872 <= weight_vecs_2_1_q0;
        weight_vecs_3_0_load_reg_849 <= weight_vecs_3_0_q0;
        weight_vecs_3_1_load_reg_877 <= weight_vecs_3_1_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_730_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul27_1_1_reg_907 <= grp_fu_409_p2;
        mul27_1_2_reg_912 <= grp_fu_413_p2;
        mul27_1_3_reg_917 <= grp_fu_417_p2;
        mul27_1_reg_902 <= grp_fu_405_p2;
        mul_1_reg_887 <= grp_fu_393_p2;
        mul_2_reg_892 <= grp_fu_397_p2;
        mul_3_reg_897 <= grp_fu_401_p2;
        mul_reg_882 <= grp_fu_389_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_fu_455_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln147_11_reg_734 <= select_ln147_11_fu_489_p3;
        select_ln148_7_reg_739 <= select_ln148_7_fu_591_p3;
    end
end

always @ (*) begin
    if ((icmp_ln147_fu_455_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_730 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_349_p4 = select_ln147_11_reg_734;
    end else begin
        ap_phi_mux_ii_phi_fu_349_p4 = ii_reg_345;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln147_reg_730 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_371_p4 = select_ln148_7_reg_739;
    end else begin
        ap_phi_mux_jj_phi_fu_371_p4 = jj_reg_367;
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
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_1_we0 = 1'b1;
    end else begin
        products_0_1_we0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_1_we0 = 1'b1;
    end else begin
        products_1_1_we0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_2_1_we0 = 1'b1;
    end else begin
        products_2_1_we0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
    if (((ap_enable_reg_pp0_iter8 == 1'b1) & (icmp_ln147_reg_730_pp0_iter7_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_3_1_we0 = 1'b1;
    end else begin
        products_3_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_ce0 = 1'b1;
    end else begin
        weight_vecs_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_ce0 = 1'b1;
    end else begin
        weight_vecs_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_ce0 = 1'b1;
    end else begin
        weight_vecs_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_ce0 = 1'b1;
    end else begin
        weight_vecs_3_1_ce0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln147_fu_455_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter8 == 1'b1) & (ap_enable_reg_pp0_iter7 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln147_fu_455_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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

assign add_ln147_3_fu_421_p2 = (indvar_flatten17_reg_334 + 7'd1);

assign add_ln147_fu_461_p2 = (ap_phi_mux_ii_phi_fu_349_p4 + 2'd1);

assign add_ln148_3_fu_663_p2 = (indvar_flatten_reg_356 + 6'd1);

assign add_ln148_fu_577_p2 = (select_ln147_fu_473_p3 + 2'd1);

assign add_ln149_fu_657_p2 = (select_ln148_fu_583_p3 + 5'd2);

assign add_ln150_3_fu_613_p2 = (select_ln147_12_fu_541_p3 + zext_ln150_7_fu_609_p1);

assign add_ln150_fu_449_p2 = (sub_ln150_fu_439_p2 + zext_ln150_3_fu_445_p1);

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

assign empty_102_fu_513_p2 = (tmp_cast_fu_509_p1 - select_ln147_13_cast_fu_497_p1);

assign empty_103_fu_603_p2 = ((sext_ln150_fu_519_p1) + (select_ln148_9_cast_fu_599_p1));

assign icmp_ln147_fu_455_p2 = ((indvar_flatten17_reg_334 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_467_p2 = ((indvar_flatten_reg_356 == 6'd24) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = tmp_88_fu_683_p1;

assign ifmap_vec_1_address0 = tmp_88_fu_683_p1;

assign lshr_ln153_5_fu_711_p3 = {{select_ln148_8_reg_749_pp0_iter7_reg}, {tmp_s_reg_761_pp0_iter7_reg}};

assign lshr_ln_fu_697_p3 = {{select_ln148_8_reg_749_pp0_iter7_reg}, {newIndex_reg_755_pp0_iter7_reg}};

assign or_ln147_fu_571_p2 = (xor_ln149_fu_565_p2 | icmp_ln148_fu_467_p2);

assign or_ln150_fu_641_p2 = (trunc_ln149_fu_627_p1 | 4'd1);

assign products_0_0_address0 = zext_ln153_fu_703_p1;

assign products_0_0_d0 = mul_reg_882;

assign products_0_1_address0 = zext_ln153_5_fu_717_p1;

assign products_0_1_d0 = mul27_1_reg_902;

assign products_1_0_address0 = zext_ln153_fu_703_p1;

assign products_1_0_d0 = mul_1_reg_887;

assign products_1_1_address0 = zext_ln153_5_fu_717_p1;

assign products_1_1_d0 = mul27_1_1_reg_907;

assign products_2_0_address0 = zext_ln153_fu_703_p1;

assign products_2_0_d0 = mul_2_reg_892;

assign products_2_1_address0 = zext_ln153_5_fu_717_p1;

assign products_2_1_d0 = mul27_1_2_reg_912;

assign products_3_0_address0 = zext_ln153_fu_703_p1;

assign products_3_0_d0 = mul_3_reg_897;

assign products_3_1_address0 = zext_ln153_5_fu_717_p1;

assign products_3_1_d0 = mul27_1_3_reg_917;

assign select_ln147_10_fu_481_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? 5'd0 : ic_reg_378);

assign select_ln147_11_fu_489_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? add_ln147_fu_461_p2 : ap_phi_mux_ii_phi_fu_349_p4);

assign select_ln147_12_fu_541_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? sub_ln150_3_fu_535_p2 : sub_ln150_fu_439_p2);

assign select_ln147_13_cast_fu_497_p1 = select_ln147_11_fu_489_p3;

assign select_ln147_13_fu_549_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? sub_ln150_3_fu_535_p2 : add_ln150_fu_449_p2);

assign select_ln147_fu_473_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_371_p4);

assign select_ln148_7_fu_591_p3 = ((or_ln147_fu_571_p2[0:0] == 1'b1) ? select_ln147_fu_473_p3 : add_ln148_fu_577_p2);

assign select_ln148_8_fu_619_p3 = ((or_ln147_fu_571_p2[0:0] == 1'b1) ? select_ln147_13_fu_549_p3 : add_ln150_3_fu_613_p2);

assign select_ln148_9_cast_fu_599_p1 = select_ln148_7_fu_591_p3;

assign select_ln148_9_fu_669_p3 = ((icmp_ln148_fu_467_p2[0:0] == 1'b1) ? 6'd1 : add_ln148_3_fu_663_p2);

assign select_ln148_fu_583_p3 = ((or_ln147_fu_571_p2[0:0] == 1'b1) ? select_ln147_10_fu_481_p3 : 5'd0);

assign sext_ln150_fu_519_p1 = (empty_102_fu_513_p2);

assign shl_ln150_mid1_fu_527_p3 = {{add_ln147_fu_461_p2}, {2'd0}};

assign shl_ln_fu_431_p3 = {{ap_phi_mux_ii_phi_fu_349_p4}, {2'd0}};

assign sub_ln150_3_fu_535_p2 = (shl_ln150_mid1_fu_527_p3 - zext_ln150_6_fu_523_p1);

assign sub_ln150_fu_439_p2 = (shl_ln_fu_431_p3 - zext_ln150_fu_427_p1);

assign tmp_43_fu_557_p3 = ic_reg_378[32'd4];

assign tmp_44_fu_677_p3 = {{empty_103_reg_744}, {newIndex_reg_755}};

assign tmp_88_fu_683_p1 = (tmp_44_fu_677_p3);

assign tmp_cast_fu_509_p1 = tmp_fu_501_p3;

assign tmp_fu_501_p3 = {{select_ln147_11_fu_489_p3}, {2'd0}};

assign trunc_ln149_fu_627_p1 = select_ln148_fu_583_p3[3:0];

assign weight_vecs_0_0_address0 = tmp_88_fu_683_p1;

assign weight_vecs_0_1_address0 = tmp_88_fu_683_p1;

assign weight_vecs_1_0_address0 = tmp_88_fu_683_p1;

assign weight_vecs_1_1_address0 = tmp_88_fu_683_p1;

assign weight_vecs_2_0_address0 = tmp_88_fu_683_p1;

assign weight_vecs_2_1_address0 = tmp_88_fu_683_p1;

assign weight_vecs_3_0_address0 = tmp_88_fu_683_p1;

assign weight_vecs_3_1_address0 = tmp_88_fu_683_p1;

assign xor_ln149_fu_565_p2 = (tmp_43_fu_557_p3 ^ 1'd1);

assign zext_ln150_3_fu_445_p1 = ap_phi_mux_jj_phi_fu_371_p4;

assign zext_ln150_6_fu_523_p1 = add_ln147_fu_461_p2;

assign zext_ln150_7_fu_609_p1 = add_ln148_fu_577_p2;

assign zext_ln150_fu_427_p1 = ap_phi_mux_ii_phi_fu_349_p4;

assign zext_ln153_5_fu_717_p1 = lshr_ln153_5_fu_711_p3;

assign zext_ln153_fu_703_p1 = lshr_ln_fu_697_p3;

endmodule //td_fused_top_tdf5_dot_product
module td_fused_top_tdf5_readFilters41 (
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
        weight_vecs_0_0_address0,
        weight_vecs_0_0_ce0,
        weight_vecs_0_0_we0,
        weight_vecs_0_0_d0,
        weight_vecs_0_1_address0,
        weight_vecs_0_1_ce0,
        weight_vecs_0_1_we0,
        weight_vecs_0_1_d0,
        weight_vecs_1_0_address0,
        weight_vecs_1_0_ce0,
        weight_vecs_1_0_we0,
        weight_vecs_1_0_d0,
        weight_vecs_1_1_address0,
        weight_vecs_1_1_ce0,
        weight_vecs_1_1_we0,
        weight_vecs_1_1_d0,
        weight_vecs_2_0_address0,
        weight_vecs_2_0_ce0,
        weight_vecs_2_0_we0,
        weight_vecs_2_0_d0,
        weight_vecs_2_1_address0,
        weight_vecs_2_1_ce0,
        weight_vecs_2_1_we0,
        weight_vecs_2_1_d0,
        weight_vecs_3_0_address0,
        weight_vecs_3_0_ce0,
        weight_vecs_3_0_we0,
        weight_vecs_3_0_d0,
        weight_vecs_3_1_address0,
        weight_vecs_3_1_ce0,
        weight_vecs_3_1_we0,
        weight_vecs_3_1_d0
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
output  [11:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [31:0] filter_data_0_q0;
output  [11:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [31:0] filter_data_1_q0;
output  [11:0] filter_data_2_address0;
output   filter_data_2_ce0;
input  [31:0] filter_data_2_q0;
output  [11:0] filter_data_3_address0;
output   filter_data_3_ce0;
input  [31:0] filter_data_3_q0;
input  [4:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [6:0] weight_vecs_0_0_address0;
output   weight_vecs_0_0_ce0;
output   weight_vecs_0_0_we0;
output  [15:0] weight_vecs_0_0_d0;
output  [6:0] weight_vecs_0_1_address0;
output   weight_vecs_0_1_ce0;
output   weight_vecs_0_1_we0;
output  [15:0] weight_vecs_0_1_d0;
output  [6:0] weight_vecs_1_0_address0;
output   weight_vecs_1_0_ce0;
output   weight_vecs_1_0_we0;
output  [15:0] weight_vecs_1_0_d0;
output  [6:0] weight_vecs_1_1_address0;
output   weight_vecs_1_1_ce0;
output   weight_vecs_1_1_we0;
output  [15:0] weight_vecs_1_1_d0;
output  [6:0] weight_vecs_2_0_address0;
output   weight_vecs_2_0_ce0;
output   weight_vecs_2_0_we0;
output  [15:0] weight_vecs_2_0_d0;
output  [6:0] weight_vecs_2_1_address0;
output   weight_vecs_2_1_ce0;
output   weight_vecs_2_1_we0;
output  [15:0] weight_vecs_2_1_d0;
output  [6:0] weight_vecs_3_0_address0;
output   weight_vecs_3_0_ce0;
output   weight_vecs_3_0_we0;
output  [15:0] weight_vecs_3_0_d0;
output  [6:0] weight_vecs_3_1_address0;
output   weight_vecs_3_1_ce0;
output   weight_vecs_3_1_we0;
output  [15:0] weight_vecs_3_1_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg filter_data_2_ce0;
reg filter_data_3_ce0;
reg input_indices_23_read;
reg weight_vecs_0_0_ce0;
reg weight_vecs_0_0_we0;
reg weight_vecs_0_1_ce0;
reg weight_vecs_0_1_we0;
reg weight_vecs_1_0_ce0;
reg weight_vecs_1_0_we0;
reg weight_vecs_1_1_ce0;
reg weight_vecs_1_1_we0;
reg weight_vecs_2_0_ce0;
reg weight_vecs_2_0_we0;
reg weight_vecs_2_1_ce0;
reg weight_vecs_2_1_we0;
reg weight_vecs_3_0_ce0;
reg weight_vecs_3_0_we0;
reg weight_vecs_3_1_ce0;
reg weight_vecs_3_1_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg   [6:0] indvar_flatten13_reg_288;
reg   [1:0] ii_reg_299;
reg   [5:0] indvar_flatten_reg_310;
reg   [1:0] jj_reg_321;
reg   [4:0] kk_reg_332;
wire   [8:0] sext_ln47_fu_365_p1;
reg   [8:0] sext_ln47_reg_737;
wire   [6:0] add_ln47_3_fu_369_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_375_p2;
reg   [0:0] icmp_ln47_reg_747;
reg   [0:0] icmp_ln47_reg_747_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_747_pp0_iter2_reg;
wire   [1:0] select_ln47_6_fu_409_p3;
reg   [1:0] select_ln47_6_reg_751;
wire   [8:0] add_ln55_fu_421_p2;
reg   [8:0] add_ln55_reg_758;
wire   [1:0] select_ln48_5_fu_460_p3;
reg   [1:0] select_ln48_5_reg_764;
reg   [2:0] lshr_ln_reg_771;
reg   [2:0] lshr_ln_reg_771_pp0_iter1_reg;
reg   [2:0] lshr_ln_reg_771_pp0_iter2_reg;
wire   [4:0] add_ln49_fu_478_p2;
wire   [5:0] select_ln48_6_fu_490_p3;
wire   [5:0] add_ln55_6_fu_554_p2;
reg   [5:0] add_ln55_6_reg_787;
reg   [5:0] add_ln55_6_reg_787_pp0_iter2_reg;
reg   [31:0] filter_data_0_load_reg_812;
reg   [31:0] filter_data_1_load_reg_817;
reg   [31:0] filter_data_2_load_reg_822;
reg   [31:0] filter_data_3_load_reg_827;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_303_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_325_p4;
wire   [63:0] tmp_27_fu_560_p3;
wire   [63:0] sext_ln55_6_fu_577_p1;
wire   [6:0] tmp_s_fu_347_p3;
wire   [7:0] zext_ln55_15_fu_355_p1;
wire   [7:0] zext_ln55_fu_343_p1;
wire   [7:0] sub_ln55_fu_359_p2;
wire   [0:0] icmp_ln48_fu_387_p2;
wire   [1:0] add_ln47_fu_381_p2;
wire   [8:0] zext_ln55_17_fu_417_p1;
wire   [0:0] tmp_41_fu_426_p3;
wire   [0:0] xor_ln49_fu_434_p2;
wire   [1:0] select_ln47_fu_393_p3;
wire   [0:0] or_ln47_fu_440_p2;
wire   [4:0] select_ln47_5_fu_401_p3;
wire   [1:0] add_ln48_fu_446_p2;
wire   [4:0] select_ln48_fu_452_p3;
wire   [5:0] add_ln48_3_fu_484_p2;
wire   [10:0] tmp_40_fu_504_p3;
wire   [60:0] sext_ln55_5_fu_511_p1;
wire   [60:0] sext_ln55_fu_501_p1;
wire   [3:0] tmp_26_fu_521_p3;
wire   [4:0] zext_ln55_18_fu_528_p1;
wire   [4:0] zext_ln55_16_fu_498_p1;
wire   [4:0] sub_ln55_6_fu_532_p2;
wire   [60:0] sub_ln55_5_fu_515_p2;
wire   [60:0] zext_ln55_20_fu_545_p1;
wire   [5:0] sext_ln48_fu_538_p1;
wire   [5:0] zext_ln55_19_fu_542_p1;
wire   [60:0] add_ln55_5_fu_548_p2;
wire   [8:0] tmp_42_fu_571_p3;
wire   [31:0] tmp_fu_589_p6;
wire   [15:0] trunc_ln55_fu_602_p1;
wire   [31:0] tmp_7_fu_611_p6;
wire   [15:0] trunc_ln55_7_fu_624_p1;
wire   [31:0] tmp_8_fu_633_p6;
wire   [15:0] trunc_ln55_8_fu_646_p1;
wire   [31:0] tmp_9_fu_655_p6;
wire   [15:0] trunc_ln55_9_fu_668_p1;
wire   [15:0] tmp_131_i_i_fu_677_p4;
wire   [15:0] tmp_133_i_i_fu_692_p4;
wire   [15:0] tmp_135_i_i_fu_707_p4;
wire   [15:0] tmp_137_i_i_fu_722_p4;
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

td_fused_top_mux_416_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mux_416_32_1_1_U735(
    .din0(filter_data_0_load_reg_812),
    .din1(32'd0),
    .din2(32'd0),
    .din3(32'd0),
    .din4(16'd0),
    .dout(tmp_fu_589_p6)
);

td_fused_top_mux_416_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mux_416_32_1_1_U736(
    .din0(filter_data_1_load_reg_817),
    .din1(32'd0),
    .din2(32'd0),
    .din3(32'd0),
    .din4(16'd0),
    .dout(tmp_7_fu_611_p6)
);

td_fused_top_mux_416_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mux_416_32_1_1_U737(
    .din0(filter_data_2_load_reg_822),
    .din1(32'd0),
    .din2(32'd0),
    .din3(32'd0),
    .din4(16'd0),
    .dout(tmp_8_fu_633_p6)
);

td_fused_top_mux_416_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 32 ))
mux_416_32_1_1_U738(
    .din0(filter_data_3_load_reg_827),
    .din1(32'd0),
    .din2(32'd0),
    .din3(32'd0),
    .din4(16'd0),
    .dout(tmp_9_fu_655_p6)
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
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_747 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_299 <= select_ln47_6_reg_751;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_299 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_375_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten13_reg_288 <= add_ln47_3_fu_369_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_288 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_375_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_310 <= select_ln48_6_fu_490_p3;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_310 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_747 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_321 <= select_ln48_5_reg_764;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_321 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_375_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_reg_332 <= add_ln49_fu_478_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_332 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_747 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_6_reg_787 <= add_ln55_6_fu_554_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_6_reg_787_pp0_iter2_reg <= add_ln55_6_reg_787;
        icmp_ln47_reg_747_pp0_iter2_reg <= icmp_ln47_reg_747_pp0_iter1_reg;
        lshr_ln_reg_771_pp0_iter2_reg <= lshr_ln_reg_771_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_375_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_reg_758 <= add_ln55_fu_421_p2;
        lshr_ln_reg_771 <= {{select_ln48_fu_452_p3[3:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_747_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_load_reg_812 <= filter_data_0_q0;
        filter_data_1_load_reg_817 <= filter_data_1_q0;
        filter_data_2_load_reg_822 <= filter_data_2_q0;
        filter_data_3_load_reg_827 <= filter_data_3_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln47_reg_747 <= icmp_ln47_fu_375_p2;
        icmp_ln47_reg_747_pp0_iter1_reg <= icmp_ln47_reg_747;
        lshr_ln_reg_771_pp0_iter1_reg <= lshr_ln_reg_771;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_375_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln47_6_reg_751 <= select_ln47_6_fu_409_p3;
        select_ln48_5_reg_764 <= select_ln48_5_fu_460_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_737 <= sext_ln47_fu_365_p1;
    end
end

always @ (*) begin
    if ((icmp_ln47_fu_375_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_747 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_303_p4 = select_ln47_6_reg_751;
    end else begin
        ap_phi_mux_ii_phi_fu_303_p4 = ii_reg_299;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_747 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_325_p4 = select_ln48_5_reg_764;
    end else begin
        ap_phi_mux_jj_phi_fu_325_p4 = jj_reg_321;
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
        weight_vecs_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_we0 = 1'b1;
    end else begin
        weight_vecs_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_we0 = 1'b1;
    end else begin
        weight_vecs_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_ce0 = 1'b1;
    end else begin
        weight_vecs_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_we0 = 1'b1;
    end else begin
        weight_vecs_2_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_ce0 = 1'b1;
    end else begin
        weight_vecs_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_we0 = 1'b1;
    end else begin
        weight_vecs_2_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_ce0 = 1'b1;
    end else begin
        weight_vecs_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_we0 = 1'b1;
    end else begin
        weight_vecs_3_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_ce0 = 1'b1;
    end else begin
        weight_vecs_3_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_747_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_we0 = 1'b1;
    end else begin
        weight_vecs_3_1_we0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_375_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_375_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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

assign add_ln47_3_fu_369_p2 = (indvar_flatten13_reg_288 + 7'd1);

assign add_ln47_fu_381_p2 = (ap_phi_mux_ii_phi_fu_303_p4 + 2'd1);

assign add_ln48_3_fu_484_p2 = (indvar_flatten_reg_310 + 6'd1);

assign add_ln48_fu_446_p2 = (select_ln47_fu_393_p3 + 2'd1);

assign add_ln49_fu_478_p2 = (select_ln48_fu_452_p3 + 5'd2);

assign add_ln55_5_fu_548_p2 = (sub_ln55_5_fu_515_p2 + zext_ln55_20_fu_545_p1);

assign add_ln55_6_fu_554_p2 = ((sext_ln48_fu_538_p1) + (zext_ln55_19_fu_542_p1));

assign add_ln55_fu_421_p2 = ((sext_ln47_reg_737) + (zext_ln55_17_fu_417_p1));

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

assign filter_data_0_address0 = tmp_27_fu_560_p3;

assign filter_data_1_address0 = tmp_27_fu_560_p3;

assign filter_data_2_address0 = tmp_27_fu_560_p3;

assign filter_data_3_address0 = tmp_27_fu_560_p3;

assign icmp_ln47_fu_375_p2 = ((indvar_flatten13_reg_288 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_387_p2 = ((indvar_flatten_reg_310 == 6'd24) ? 1'b1 : 1'b0);

assign or_ln47_fu_440_p2 = (xor_ln49_fu_434_p2 | icmp_ln48_fu_387_p2);

assign select_ln47_5_fu_401_p3 = ((icmp_ln48_fu_387_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_332);

assign select_ln47_6_fu_409_p3 = ((icmp_ln48_fu_387_p2[0:0] == 1'b1) ? add_ln47_fu_381_p2 : ap_phi_mux_ii_phi_fu_303_p4);

assign select_ln47_fu_393_p3 = ((icmp_ln48_fu_387_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_325_p4);

assign select_ln48_5_fu_460_p3 = ((or_ln47_fu_440_p2[0:0] == 1'b1) ? select_ln47_fu_393_p3 : add_ln48_fu_446_p2);

assign select_ln48_6_fu_490_p3 = ((icmp_ln48_fu_387_p2[0:0] == 1'b1) ? 6'd1 : add_ln48_3_fu_484_p2);

assign select_ln48_fu_452_p3 = ((or_ln47_fu_440_p2[0:0] == 1'b1) ? select_ln47_5_fu_401_p3 : 5'd0);

assign sext_ln47_fu_365_p1 = (sub_ln55_fu_359_p2);

assign sext_ln48_fu_538_p1 = (sub_ln55_6_fu_532_p2);

assign sext_ln55_5_fu_511_p1 = (tmp_40_fu_504_p3);

assign sext_ln55_6_fu_577_p1 = (tmp_42_fu_571_p3);

assign sext_ln55_fu_501_p1 = add_ln55_reg_758;

assign sub_ln55_5_fu_515_p2 = ((sext_ln55_5_fu_511_p1) - (sext_ln55_fu_501_p1));

assign sub_ln55_6_fu_532_p2 = (zext_ln55_18_fu_528_p1 - zext_ln55_16_fu_498_p1);

assign sub_ln55_fu_359_p2 = (zext_ln55_15_fu_355_p1 - zext_ln55_fu_343_p1);

assign tmp_131_i_i_fu_677_p4 = {{tmp_fu_589_p6[31:16]}};

assign tmp_133_i_i_fu_692_p4 = {{tmp_7_fu_611_p6[31:16]}};

assign tmp_135_i_i_fu_707_p4 = {{tmp_8_fu_633_p6[31:16]}};

assign tmp_137_i_i_fu_722_p4 = {{tmp_9_fu_655_p6[31:16]}};

assign tmp_26_fu_521_p3 = {{select_ln47_6_reg_751}, {2'd0}};

assign tmp_27_fu_560_p3 = {{add_ln55_5_fu_548_p2}, {lshr_ln_reg_771}};

assign tmp_40_fu_504_p3 = {{add_ln55_reg_758}, {2'd0}};

assign tmp_41_fu_426_p3 = kk_reg_332[32'd4];

assign tmp_42_fu_571_p3 = {{add_ln55_6_reg_787_pp0_iter2_reg}, {lshr_ln_reg_771_pp0_iter2_reg}};

assign tmp_s_fu_347_p3 = {{input_indices_23_dout}, {2'd0}};

assign trunc_ln55_7_fu_624_p1 = tmp_7_fu_611_p6[15:0];

assign trunc_ln55_8_fu_646_p1 = tmp_8_fu_633_p6[15:0];

assign trunc_ln55_9_fu_668_p1 = tmp_9_fu_655_p6[15:0];

assign trunc_ln55_fu_602_p1 = tmp_fu_589_p6[15:0];

assign weight_vecs_0_0_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_0_0_d0 = trunc_ln55_fu_602_p1;

assign weight_vecs_0_1_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_0_1_d0 = tmp_131_i_i_fu_677_p4;

assign weight_vecs_1_0_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_1_0_d0 = trunc_ln55_7_fu_624_p1;

assign weight_vecs_1_1_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_1_1_d0 = tmp_133_i_i_fu_692_p4;

assign weight_vecs_2_0_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_2_0_d0 = trunc_ln55_8_fu_646_p1;

assign weight_vecs_2_1_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_2_1_d0 = tmp_135_i_i_fu_707_p4;

assign weight_vecs_3_0_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_3_0_d0 = trunc_ln55_9_fu_668_p1;

assign weight_vecs_3_1_address0 = sext_ln55_6_fu_577_p1;

assign weight_vecs_3_1_d0 = tmp_137_i_i_fu_722_p4;

assign xor_ln49_fu_434_p2 = (tmp_41_fu_426_p3 ^ 1'd1);

assign zext_ln55_15_fu_355_p1 = tmp_s_fu_347_p3;

assign zext_ln55_16_fu_498_p1 = select_ln47_6_reg_751;

assign zext_ln55_17_fu_417_p1 = select_ln47_6_fu_409_p3;

assign zext_ln55_18_fu_528_p1 = tmp_26_fu_521_p3;

assign zext_ln55_19_fu_542_p1 = select_ln48_5_reg_764;

assign zext_ln55_20_fu_545_p1 = select_ln48_5_reg_764;

assign zext_ln55_fu_343_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf5_readFilters41
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
output  [4:0] input_indices_2_out_din;
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
wire   [1:0] select_ln172_fu_342_p3;
reg    ap_block_state1;
wire   [0:0] or_ln172_fu_316_p2;
wire   [1:0] select_ln172_1_fu_350_p3;
wire   [15:0] select_ln177_fu_282_p3;
wire   [0:0] and_ln172_1_fu_310_p2;
wire   [15:0] select_ln172_2_fu_364_p3;
wire   [0:0] and_ln162_fu_358_p2;
wire   [15:0] select_ln172_3_fu_392_p3;
wire   [0:0] and_ln165_fu_298_p2;
wire   [15:0] select_ln177_1_fu_290_p3;
wire   [15:0] select_ln172_4_fu_400_p3;
wire   [1:0] or_ln154_fu_126_p2;
wire   [0:0] icmp_ln155_fu_139_p2;
wire   [0:0] icmp_ln155_1_fu_145_p2;
wire   [15:0] zext_ln156_fu_114_p1;
wire   [15:0] zext_ln157_fu_122_p1;
wire   [1:0] add_ln161_fu_210_p2;
wire   [1:0] add_ln164_fu_222_p2;
wire   [15:0] add_ln167_fu_234_p2;
wire   [15:0] add_ln171_fu_252_p2;
wire   [15:0] add_ln176_fu_270_p2;
wire   [0:0] icmp_ln177_fu_276_p2;
wire   [15:0] add_ln175_fu_264_p2;
wire   [0:0] icmp_ln162_fu_216_p2;
wire   [0:0] icmp_ln165_fu_228_p2;
wire   [0:0] icmp_ln168_fu_240_p2;
wire   [0:0] icmp_ln172_fu_258_p2;
wire   [0:0] and_ln172_fu_304_p2;
wire   [0:0] xor_ln165_fu_322_p2;
wire   [0:0] and_ln165_1_fu_328_p2;
wire   [1:0] select_ln165_fu_334_p3;
wire   [15:0] add_ln170_fu_246_p2;
wire   [0:0] xor_ln168_fu_372_p2;
wire   [0:0] and_ln168_fu_378_p2;
wire   [15:0] select_ln168_fu_384_p3;
wire   [15:0] add_ln156_fu_162_p2;
wire   [15:0] add_ln157_fu_172_p2;
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
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln172_1_fu_310_p2))) begin
        i_3 <= select_ln177_fu_282_p3;
        i_out_1 <= select_ln177_1_fu_290_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln172_fu_316_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_p_1 <= select_ln172_fu_342_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln162_fu_358_p2))) begin
        j_3 <= select_ln172_2_fu_364_p3;
        j_out_1 <= select_ln172_4_fu_400_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        j_p_1 <= select_ln172_1_fu_350_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln165_fu_298_p2))) begin
        k_3 <= select_ln172_3_fu_392_p3;
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

assign add_ln156_fu_162_p2 = (i_3 + zext_ln156_fu_114_p1);

assign add_ln157_fu_172_p2 = (j_3 + zext_ln157_fu_122_p1);

assign add_ln161_fu_210_p2 = (j_p_1 + 2'd1);

assign add_ln164_fu_222_p2 = (i_p_1 + 2'd1);

assign add_ln167_fu_234_p2 = (k_3 + 16'd1);

assign add_ln170_fu_246_p2 = (j_3 + 16'd2);

assign add_ln171_fu_252_p2 = (j_out_1 + 16'd1);

assign add_ln175_fu_264_p2 = (i_3 + 16'd2);

assign add_ln176_fu_270_p2 = (i_out_1 + 16'd1);

assign and_ln162_fu_358_p2 = (icmp_ln168_fu_240_p2 & and_ln165_fu_298_p2);

assign and_ln165_1_fu_328_p2 = (xor_ln165_fu_322_p2 & icmp_ln162_fu_216_p2);

assign and_ln165_fu_298_p2 = (icmp_ln165_fu_228_p2 & icmp_ln162_fu_216_p2);

assign and_ln168_fu_378_p2 = (xor_ln168_fu_372_p2 & and_ln165_fu_298_p2);

assign and_ln172_1_fu_310_p2 = (and_ln172_fu_304_p2 & and_ln165_fu_298_p2);

assign and_ln172_fu_304_p2 = (icmp_ln172_fu_258_p2 & icmp_ln168_fu_240_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign ap_return_0 = add_ln156_fu_162_p2;

assign ap_return_1 = add_ln157_fu_172_p2;

assign icmp_ln155_1_fu_145_p2 = ((j_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln155_fu_139_p2 = ((i_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln162_fu_216_p2 = ((add_ln161_fu_210_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln165_fu_228_p2 = ((add_ln164_fu_222_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln168_fu_240_p2 = ((add_ln167_fu_234_p2 == 16'd32) ? 1'b1 : 1'b0);

assign icmp_ln172_fu_258_p2 = ((add_ln171_fu_252_p2 == 16'd28) ? 1'b1 : 1'b0);

assign icmp_ln177_fu_276_p2 = ((add_ln176_fu_270_p2 == 16'd28) ? 1'b1 : 1'b0);

assign input_indices_2_out1_din = k_3[6:0];

assign input_indices_2_out_din = k_3[4:0];

assign or_ln154_fu_126_p2 = (j_p_1 | i_p_1);

assign or_ln172_fu_316_p2 = (icmp_ln162_fu_216_p2 | and_ln172_1_fu_310_p2);

assign output_indices_0_din = i_out_1[4:0];

assign output_indices_1_din = j_out_1[9:0];

assign resetMaximum_din = ((or_ln154_fu_126_p2 == 2'd0) ? 1'b1 : 1'b0);

assign select_ln165_fu_334_p3 = ((and_ln165_1_fu_328_p2[0:0] == 1'b1) ? add_ln164_fu_222_p2 : 2'd0);

assign select_ln168_fu_384_p3 = ((and_ln168_fu_378_p2[0:0] == 1'b1) ? add_ln167_fu_234_p2 : 16'd0);

assign select_ln172_1_fu_350_p3 = ((or_ln172_fu_316_p2[0:0] == 1'b1) ? 2'd0 : add_ln161_fu_210_p2);

assign select_ln172_2_fu_364_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : add_ln170_fu_246_p2);

assign select_ln172_3_fu_392_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : select_ln168_fu_384_p3);

assign select_ln172_4_fu_400_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : add_ln171_fu_252_p2);

assign select_ln172_fu_342_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 2'd0 : select_ln165_fu_334_p3);

assign select_ln177_1_fu_290_p3 = ((icmp_ln177_fu_276_p2[0:0] == 1'b1) ? 16'd0 : add_ln176_fu_270_p2);

assign select_ln177_fu_282_p3 = ((icmp_ln177_fu_276_p2[0:0] == 1'b1) ? 16'd0 : add_ln175_fu_264_p2);

assign start_out = real_start;

assign storeOutput_din = (icmp_ln155_fu_139_p2 & icmp_ln155_1_fu_145_p2);

assign xor_ln165_fu_322_p2 = (icmp_ln165_fu_228_p2 ^ 1'd1);

assign xor_ln168_fu_372_p2 = (icmp_ln168_fu_240_p2 ^ 1'd1);

assign zext_ln156_fu_114_p1 = i_p_1;

assign zext_ln157_fu_122_p1 = j_p_1;

endmodule //td_fused_top_tdf5_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 3,
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
td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore(
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
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum2_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore(
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
input we1;
input[DataWidth - 1:0] d1;
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 7,
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
        td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore(
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
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_products_0_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 7,
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
td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore(
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
output[DataWidth - 1:0] q1;



td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP48139_ifmap_vec_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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

module td_fused_top_mux_416_32_1_1 #(
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
    input  [31 : 0]     din0,
    input  [31 : 0]     din1,
    input  [31 : 0]     din2,
    input  [31 : 0]     din3,
    input  [15 : 0]    din4,
    output [31 : 0]   dout);

// puts internal signals
wire [15 : 0]     sel;
// level 1 signals
wire [31 : 0]         mux_1_0;
wire [31 : 0]         mux_1_1;
// level 2 signals
wire [31 : 0]         mux_2_0;
// level 3 signals
wire [31 : 0]         mux_3_0;
// level 4 signals
wire [31 : 0]         mux_4_0;
// level 5 signals
wire [31 : 0]         mux_5_0;
// level 6 signals
wire [31 : 0]         mux_6_0;
// level 7 signals
wire [31 : 0]         mux_7_0;
// level 8 signals
wire [31 : 0]         mux_8_0;
// level 9 signals
wire [31 : 0]         mux_9_0;
// level 10 signals
wire [31 : 0]         mux_10_0;
// level 11 signals
wire [31 : 0]         mux_11_0;
// level 12 signals
wire [31 : 0]         mux_12_0;
// level 13 signals
wire [31 : 0]         mux_13_0;
// level 14 signals
wire [31 : 0]         mux_14_0;
// level 15 signals
wire [31 : 0]         mux_15_0;
// level 16 signals
wire [31 : 0]         mux_16_0;

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







































