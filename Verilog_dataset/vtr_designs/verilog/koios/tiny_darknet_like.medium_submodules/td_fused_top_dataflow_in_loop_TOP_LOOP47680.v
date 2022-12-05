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

module td_fused_top_dataflow_in_loop_TOP_LOOP47680 (
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
output  [12:0] in_data_address0;
output   in_data_ce0;
output  [63:0] in_data_d0;
input  [63:0] in_data_q0;
output   in_data_we0;
output  [12:0] in_data_address1;
output   in_data_ce1;
output  [63:0] in_data_d1;
input  [63:0] in_data_q1;
output   in_data_we1;
output  [14:0] filter_data_0_address0;
output   filter_data_0_ce0;
output  [31:0] filter_data_0_d0;
input  [31:0] filter_data_0_q0;
output   filter_data_0_we0;
output  [14:0] filter_data_0_address1;
output   filter_data_0_ce1;
output  [31:0] filter_data_0_d1;
input  [31:0] filter_data_0_q1;
output   filter_data_0_we1;
output  [14:0] filter_data_1_address0;
output   filter_data_1_ce0;
output  [31:0] filter_data_1_d0;
input  [31:0] filter_data_1_q0;
output   filter_data_1_we0;
output  [14:0] filter_data_1_address1;
output   filter_data_1_ce1;
output  [31:0] filter_data_1_d1;
input  [31:0] filter_data_1_q1;
output   filter_data_1_we1;
output  [9:0] adjustments_address0;
output   adjustments_ce0;
output  [47:0] adjustments_d0;
input  [47:0] adjustments_q0;
output   adjustments_we0;
output  [9:0] adjustments_address1;
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

wire   [15:0] ifmap_vec_0_0_0_i_q0;
wire   [15:0] ifmap_vec_0_0_0_t_q0;
wire   [15:0] ifmap_vec_1_0_0_i_q0;
wire   [15:0] ifmap_vec_1_0_0_t_q0;
wire   [15:0] weight_vecs_0_0_0_0_i_q0;
wire   [15:0] weight_vecs_0_0_0_0_t_q0;
wire   [15:0] weight_vecs_0_1_0_0_i_q0;
wire   [15:0] weight_vecs_0_1_0_0_t_q0;
wire   [15:0] weight_vecs_1_0_0_0_i_q0;
wire   [15:0] weight_vecs_1_0_0_0_t_q0;
wire   [15:0] weight_vecs_1_1_0_0_i_q0;
wire   [15:0] weight_vecs_1_1_0_0_t_q0;
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
wire   [15:0] accum1_out_0_i_q0;
wire   [15:0] accum1_out_0_i_q1;
wire   [15:0] accum1_out_0_t_q0;
wire   [15:0] accum1_out_0_t_q1;
wire   [15:0] accum1_out_1_i_q0;
wire   [15:0] accum1_out_1_i_q1;
wire   [15:0] accum1_out_1_t_q0;
wire   [15:0] accum1_out_1_t_q1;
wire   [15:0] accum2_out_0_i_q0;
wire   [15:0] accum2_out_0_t_q0;
wire   [15:0] accum2_out_1_i_q0;
wire   [15:0] accum2_out_1_t_q0;
wire    tdf12_get_next_ijk_U0_ap_start;
wire    tdf12_get_next_ijk_U0_ap_done;
wire    tdf12_get_next_ijk_U0_ap_continue;
wire    tdf12_get_next_ijk_U0_ap_idle;
wire    tdf12_get_next_ijk_U0_ap_ready;
wire    tdf12_get_next_ijk_U0_start_out;
wire    tdf12_get_next_ijk_U0_start_write;
wire   [15:0] tdf12_get_next_ijk_U0_indices_0_din;
wire    tdf12_get_next_ijk_U0_indices_0_write;
wire   [15:0] tdf12_get_next_ijk_U0_indices_1_din;
wire    tdf12_get_next_ijk_U0_indices_1_write;
wire   [8:0] tdf12_get_next_ijk_U0_indices_2_out_din;
wire    tdf12_get_next_ijk_U0_indices_2_out_write;
wire   [8:0] tdf12_get_next_ijk_U0_indices_2_out1_din;
wire    tdf12_get_next_ijk_U0_indices_2_out1_write;
wire    tdf12_readInputs_U0_ap_start;
wire    tdf12_readInputs_U0_ap_done;
wire    tdf12_readInputs_U0_ap_continue;
wire    tdf12_readInputs_U0_ap_idle;
wire    tdf12_readInputs_U0_ap_ready;
wire   [12:0] tdf12_readInputs_U0_in_data_address0;
wire    tdf12_readInputs_U0_in_data_ce0;
wire    tdf12_readInputs_U0_indices_01_read;
wire    tdf12_readInputs_U0_indices_12_read;
wire   [5:0] tdf12_readInputs_U0_ifmap_vec_0_0_0_address0;
wire    tdf12_readInputs_U0_ifmap_vec_0_0_0_ce0;
wire    tdf12_readInputs_U0_ifmap_vec_0_0_0_we0;
wire   [15:0] tdf12_readInputs_U0_ifmap_vec_0_0_0_d0;
wire   [5:0] tdf12_readInputs_U0_ifmap_vec_1_0_0_address0;
wire    tdf12_readInputs_U0_ifmap_vec_1_0_0_ce0;
wire    tdf12_readInputs_U0_ifmap_vec_1_0_0_we0;
wire   [15:0] tdf12_readInputs_U0_ifmap_vec_1_0_0_d0;
wire   [3:0] tdf12_readInputs_U0_indices_01_out_din;
wire    tdf12_readInputs_U0_indices_01_out_write;
wire   [7:0] tdf12_readInputs_U0_indices_12_out_din;
wire    tdf12_readInputs_U0_indices_12_out_write;
wire    tdf12_readInputs_U0_in_data_full_n;
wire    tdf12_readInputs_U0_in_data_write;
wire    ap_channel_done_ifmap_vec_1_0_0;
wire    tdf12_readInputs_U0_ifmap_vec_1_0_0_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_1_0_0;
wire    ap_sync_channel_write_ifmap_vec_1_0_0;
wire    ap_channel_done_ifmap_vec_0_0_0;
wire    tdf12_readInputs_U0_ifmap_vec_0_0_0_full_n;
reg    ap_sync_reg_channel_write_ifmap_vec_0_0_0;
wire    ap_sync_channel_write_ifmap_vec_0_0_0;
wire    tdf12_readFilters82_U0_ap_start;
wire    tdf12_readFilters82_U0_ap_done;
wire    tdf12_readFilters82_U0_ap_continue;
wire    tdf12_readFilters82_U0_ap_idle;
wire    tdf12_readFilters82_U0_ap_ready;
wire   [14:0] tdf12_readFilters82_U0_filter_data_0_address0;
wire    tdf12_readFilters82_U0_filter_data_0_ce0;
wire   [14:0] tdf12_readFilters82_U0_filter_data_1_address0;
wire    tdf12_readFilters82_U0_filter_data_1_ce0;
wire    tdf12_readFilters82_U0_indices_23_read;
wire   [5:0] tdf12_readFilters82_U0_weight_vecs_0_0_0_0_address0;
wire    tdf12_readFilters82_U0_weight_vecs_0_0_0_0_ce0;
wire    tdf12_readFilters82_U0_weight_vecs_0_0_0_0_we0;
wire   [15:0] tdf12_readFilters82_U0_weight_vecs_0_0_0_0_d0;
wire   [5:0] tdf12_readFilters82_U0_weight_vecs_0_1_0_0_address0;
wire    tdf12_readFilters82_U0_weight_vecs_0_1_0_0_ce0;
wire    tdf12_readFilters82_U0_weight_vecs_0_1_0_0_we0;
wire   [15:0] tdf12_readFilters82_U0_weight_vecs_0_1_0_0_d0;
wire   [5:0] tdf12_readFilters82_U0_weight_vecs_1_0_0_0_address0;
wire    tdf12_readFilters82_U0_weight_vecs_1_0_0_0_ce0;
wire    tdf12_readFilters82_U0_weight_vecs_1_0_0_0_we0;
wire   [15:0] tdf12_readFilters82_U0_weight_vecs_1_0_0_0_d0;
wire   [5:0] tdf12_readFilters82_U0_weight_vecs_1_1_0_0_address0;
wire    tdf12_readFilters82_U0_weight_vecs_1_1_0_0_ce0;
wire    tdf12_readFilters82_U0_weight_vecs_1_1_0_0_we0;
wire   [15:0] tdf12_readFilters82_U0_weight_vecs_1_1_0_0_d0;
wire    ap_channel_done_weight_vecs_1_1_0_0;
wire    tdf12_readFilters82_U0_weight_vecs_1_1_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_1_0_0;
wire    ap_sync_channel_write_weight_vecs_1_1_0_0;
wire    ap_channel_done_weight_vecs_1_0_0_0;
wire    tdf12_readFilters82_U0_weight_vecs_1_0_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_1_0_0_0;
wire    ap_sync_channel_write_weight_vecs_1_0_0_0;
wire    ap_channel_done_weight_vecs_0_1_0_0;
wire    tdf12_readFilters82_U0_weight_vecs_0_1_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_1_0_0;
wire    ap_sync_channel_write_weight_vecs_0_1_0_0;
wire    ap_channel_done_weight_vecs_0_0_0_0;
wire    tdf12_readFilters82_U0_weight_vecs_0_0_0_0_full_n;
reg    ap_sync_reg_channel_write_weight_vecs_0_0_0_0;
wire    ap_sync_channel_write_weight_vecs_0_0_0_0;
wire    tdf12_dot_product_U0_ap_start;
wire    tdf12_dot_product_U0_ap_done;
wire    tdf12_dot_product_U0_ap_continue;
wire    tdf12_dot_product_U0_ap_idle;
wire    tdf12_dot_product_U0_ap_ready;
wire   [5:0] tdf12_dot_product_U0_ifmap_vec_0_0_0_address0;
wire    tdf12_dot_product_U0_ifmap_vec_0_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_ifmap_vec_1_0_0_address0;
wire    tdf12_dot_product_U0_ifmap_vec_1_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_weight_vecs_0_0_0_0_address0;
wire    tdf12_dot_product_U0_weight_vecs_0_0_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_weight_vecs_0_1_0_0_address0;
wire    tdf12_dot_product_U0_weight_vecs_0_1_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_weight_vecs_1_0_0_0_address0;
wire    tdf12_dot_product_U0_weight_vecs_1_0_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_weight_vecs_1_1_0_0_address0;
wire    tdf12_dot_product_U0_weight_vecs_1_1_0_0_ce0;
wire   [5:0] tdf12_dot_product_U0_products_0_0_address0;
wire    tdf12_dot_product_U0_products_0_0_ce0;
wire    tdf12_dot_product_U0_products_0_0_we0;
wire   [15:0] tdf12_dot_product_U0_products_0_0_d0;
wire   [5:0] tdf12_dot_product_U0_products_0_1_address0;
wire    tdf12_dot_product_U0_products_0_1_ce0;
wire    tdf12_dot_product_U0_products_0_1_we0;
wire   [15:0] tdf12_dot_product_U0_products_0_1_d0;
wire   [5:0] tdf12_dot_product_U0_products_1_0_address0;
wire    tdf12_dot_product_U0_products_1_0_ce0;
wire    tdf12_dot_product_U0_products_1_0_we0;
wire   [15:0] tdf12_dot_product_U0_products_1_0_d0;
wire   [5:0] tdf12_dot_product_U0_products_1_1_address0;
wire    tdf12_dot_product_U0_products_1_1_ce0;
wire    tdf12_dot_product_U0_products_1_1_we0;
wire   [15:0] tdf12_dot_product_U0_products_1_1_d0;
wire    ap_channel_done_products_1_1;
wire    tdf12_dot_product_U0_products_1_1_full_n;
reg    ap_sync_reg_channel_write_products_1_1;
wire    ap_sync_channel_write_products_1_1;
wire    ap_channel_done_products_1_0;
wire    tdf12_dot_product_U0_products_1_0_full_n;
reg    ap_sync_reg_channel_write_products_1_0;
wire    ap_sync_channel_write_products_1_0;
wire    ap_channel_done_products_0_1;
wire    tdf12_dot_product_U0_products_0_1_full_n;
reg    ap_sync_reg_channel_write_products_0_1;
wire    ap_sync_channel_write_products_0_1;
wire    ap_channel_done_products_0_0;
wire    tdf12_dot_product_U0_products_0_0_full_n;
reg    ap_sync_reg_channel_write_products_0_0;
wire    ap_sync_channel_write_products_0_0;
wire    tdf12_accum_1_U0_ap_start;
wire    tdf12_accum_1_U0_ap_done;
wire    tdf12_accum_1_U0_ap_continue;
wire    tdf12_accum_1_U0_ap_idle;
wire    tdf12_accum_1_U0_ap_ready;
wire   [5:0] tdf12_accum_1_U0_accum_in_address0;
wire    tdf12_accum_1_U0_accum_in_ce0;
wire   [5:0] tdf12_accum_1_U0_accum_in_address1;
wire    tdf12_accum_1_U0_accum_in_ce1;
wire   [5:0] tdf12_accum_1_U0_accum_in1_address0;
wire    tdf12_accum_1_U0_accum_in1_ce0;
wire   [5:0] tdf12_accum_1_U0_accum_in1_address1;
wire    tdf12_accum_1_U0_accum_in1_ce1;
wire   [3:0] tdf12_accum_1_U0_accum_out_address0;
wire    tdf12_accum_1_U0_accum_out_ce0;
wire    tdf12_accum_1_U0_accum_out_we0;
wire   [15:0] tdf12_accum_1_U0_accum_out_d0;
wire   [3:0] tdf12_accum_1_U0_accum_out_address1;
wire    tdf12_accum_1_U0_accum_out_ce1;
wire    tdf12_accum_1_U0_accum_out_we1;
wire   [15:0] tdf12_accum_1_U0_accum_out_d1;
wire    ap_channel_done_accum1_out_0;
wire    tdf12_accum_1_U0_accum_out_full_n;
wire    tdf12_accum_1_U1_1_ap_start;
wire    tdf12_accum_1_U1_1_ap_done;
wire    tdf12_accum_1_U1_1_ap_continue;
wire    tdf12_accum_1_U1_1_ap_idle;
wire    tdf12_accum_1_U1_1_ap_ready;
wire   [5:0] tdf12_accum_1_U1_1_accum_in_address0;
wire    tdf12_accum_1_U1_1_accum_in_ce0;
wire   [5:0] tdf12_accum_1_U1_1_accum_in_address1;
wire    tdf12_accum_1_U1_1_accum_in_ce1;
wire   [5:0] tdf12_accum_1_U1_1_accum_in1_address0;
wire    tdf12_accum_1_U1_1_accum_in1_ce0;
wire   [5:0] tdf12_accum_1_U1_1_accum_in1_address1;
wire    tdf12_accum_1_U1_1_accum_in1_ce1;
wire   [3:0] tdf12_accum_1_U1_1_accum_out_address0;
wire    tdf12_accum_1_U1_1_accum_out_ce0;
wire    tdf12_accum_1_U1_1_accum_out_we0;
wire   [15:0] tdf12_accum_1_U1_1_accum_out_d0;
wire   [3:0] tdf12_accum_1_U1_1_accum_out_address1;
wire    tdf12_accum_1_U1_1_accum_out_ce1;
wire    tdf12_accum_1_U1_1_accum_out_we1;
wire   [15:0] tdf12_accum_1_U1_1_accum_out_d1;
wire    ap_channel_done_accum1_out_1;
wire    tdf12_accum_1_U1_1_accum_out_full_n;
wire    tdf12_accum_2_U0_ap_start;
wire    tdf12_accum_2_U0_ap_done;
wire    tdf12_accum_2_U0_ap_continue;
wire    tdf12_accum_2_U0_ap_idle;
wire    tdf12_accum_2_U0_ap_ready;
wire   [3:0] tdf12_accum_2_U0_accum_in_address0;
wire    tdf12_accum_2_U0_accum_in_ce0;
wire   [3:0] tdf12_accum_2_U0_accum_in_address1;
wire    tdf12_accum_2_U0_accum_in_ce1;
wire   [2:0] tdf12_accum_2_U0_accum_out_address0;
wire    tdf12_accum_2_U0_accum_out_ce0;
wire    tdf12_accum_2_U0_accum_out_we0;
wire   [15:0] tdf12_accum_2_U0_accum_out_d0;
wire    ap_channel_done_accum2_out_0;
wire    tdf12_accum_2_U0_accum_out_full_n;
wire    tdf12_accum_2_U1_1_ap_start;
wire    tdf12_accum_2_U1_1_ap_done;
wire    tdf12_accum_2_U1_1_ap_continue;
wire    tdf12_accum_2_U1_1_ap_idle;
wire    tdf12_accum_2_U1_1_ap_ready;
wire   [3:0] tdf12_accum_2_U1_1_accum_in_address0;
wire    tdf12_accum_2_U1_1_accum_in_ce0;
wire   [3:0] tdf12_accum_2_U1_1_accum_in_address1;
wire    tdf12_accum_2_U1_1_accum_in_ce1;
wire   [2:0] tdf12_accum_2_U1_1_accum_out_address0;
wire    tdf12_accum_2_U1_1_accum_out_ce0;
wire    tdf12_accum_2_U1_1_accum_out_we0;
wire   [15:0] tdf12_accum_2_U1_1_accum_out_d0;
wire    ap_channel_done_accum2_out_1;
wire    tdf12_accum_2_U1_1_accum_out_full_n;
wire    tdf12_accum_3_U0_ap_start;
wire    tdf12_accum_3_U0_ap_done;
wire    tdf12_accum_3_U0_ap_continue;
wire    tdf12_accum_3_U0_ap_idle;
wire    tdf12_accum_3_U0_ap_ready;
wire   [15:0] tdf12_accum_3_U0_accum_in_40;
wire    tdf12_accum_3_U0_accum_in_40_ap_vld;
wire   [2:0] tdf12_accum_3_U0_accum_in_address0;
wire    tdf12_accum_3_U0_accum_in_ce0;
wire    ap_channel_done_tmp_channel;
wire    tmp_channel_full_n;
wire    Block_entry_proc_proc573_U0_ap_start;
wire    Block_entry_proc_proc573_U0_ap_done;
wire    Block_entry_proc_proc573_U0_ap_continue;
wire    Block_entry_proc_proc573_U0_ap_idle;
wire    Block_entry_proc_proc573_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc573_U0_ap_return;
wire    ap_channel_done_sums_0;
wire    sums_0_full_n;
wire    tdf12_accum_3_1_U0_ap_start;
wire    tdf12_accum_3_1_U0_ap_done;
wire    tdf12_accum_3_1_U0_ap_continue;
wire    tdf12_accum_3_1_U0_ap_idle;
wire    tdf12_accum_3_1_U0_ap_ready;
wire   [15:0] tdf12_accum_3_1_U0_accum_in_38;
wire    tdf12_accum_3_1_U0_accum_in_38_ap_vld;
wire   [2:0] tdf12_accum_3_1_U0_accum_in_address0;
wire    tdf12_accum_3_1_U0_accum_in_ce0;
wire    ap_channel_done_tmp_272_channel;
wire    tmp_272_channel_full_n;
wire    Block_entry_proc_proc574_U0_ap_start;
wire    Block_entry_proc_proc574_U0_ap_done;
wire    Block_entry_proc_proc574_U0_ap_continue;
wire    Block_entry_proc_proc574_U0_ap_idle;
wire    Block_entry_proc_proc574_U0_ap_ready;
wire   [15:0] Block_entry_proc_proc574_U0_ap_return;
wire    ap_channel_done_sums_1;
wire    sums_1_full_n;
wire    tdf12_adjust_U0_ap_start;
wire    tdf12_adjust_U0_ap_done;
wire    tdf12_adjust_U0_ap_continue;
wire    tdf12_adjust_U0_ap_idle;
wire    tdf12_adjust_U0_ap_ready;
wire   [9:0] tdf12_adjust_U0_adjustments_address0;
wire    tdf12_adjust_U0_adjustments_ce0;
wire    tdf12_adjust_U0_indices_23_read;
wire   [15:0] tdf12_adjust_U0_ap_return_0;
wire   [15:0] tdf12_adjust_U0_ap_return_1;
wire    ap_channel_done_outputs_1;
wire    outputs_1_full_n;
reg    ap_sync_reg_channel_write_outputs_1;
wire    ap_sync_channel_write_outputs_1;
wire    ap_channel_done_outputs_0;
wire    outputs_0_full_n;
reg    ap_sync_reg_channel_write_outputs_0;
wire    ap_sync_channel_write_outputs_0;
wire    tdf12_writeOutputs_unaligned_U0_ap_start;
wire    tdf12_writeOutputs_unaligned_U0_ap_done;
wire    tdf12_writeOutputs_unaligned_U0_ap_continue;
wire    tdf12_writeOutputs_unaligned_U0_ap_idle;
wire    tdf12_writeOutputs_unaligned_U0_ap_ready;
wire    tdf12_writeOutputs_unaligned_U0_indices_01_read;
wire    tdf12_writeOutputs_unaligned_U0_indices_12_read;
wire   [15:0] tdf12_writeOutputs_unaligned_U0_out_data_address1;
wire    tdf12_writeOutputs_unaligned_U0_out_data_ce1;
wire    tdf12_writeOutputs_unaligned_U0_out_data_we1;
wire   [63:0] tdf12_writeOutputs_unaligned_U0_out_data_d1;
wire    tdf12_writeOutputs_unaligned_U0_out_data_full_n;
wire    tdf12_writeOutputs_unaligned_U0_out_data_write;
wire    ap_sync_continue;
wire    ifmap_vec_0_0_0_i_full_n;
wire    ifmap_vec_0_0_0_t_empty_n;
wire    ifmap_vec_1_0_0_i_full_n;
wire    ifmap_vec_1_0_0_t_empty_n;
wire    weight_vecs_0_0_0_0_i_full_n;
wire    weight_vecs_0_0_0_0_t_empty_n;
wire    weight_vecs_0_1_0_0_i_full_n;
wire    weight_vecs_0_1_0_0_t_empty_n;
wire    weight_vecs_1_0_0_0_i_full_n;
wire    weight_vecs_1_0_0_0_t_empty_n;
wire    weight_vecs_1_1_0_0_i_full_n;
wire    weight_vecs_1_1_0_0_t_empty_n;
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
wire    accum1_out_0_i_full_n;
wire    accum1_out_0_t_empty_n;
wire    accum1_out_1_i_full_n;
wire    accum1_out_1_t_empty_n;
wire    accum2_out_0_i_full_n;
wire    accum2_out_0_t_empty_n;
wire    accum2_out_1_i_full_n;
wire    accum2_out_1_t_empty_n;
wire    indices_01_c_full_n;
wire   [15:0] indices_01_c_dout;
wire    indices_01_c_empty_n;
wire    indices_12_c_full_n;
wire   [15:0] indices_12_c_dout;
wire    indices_12_c_empty_n;
wire    indices_23_c_full_n;
wire   [8:0] indices_23_c_dout;
wire    indices_23_c_empty_n;
wire    indices_23_c1_full_n;
wire   [8:0] indices_23_c1_dout;
wire    indices_23_c1_empty_n;
wire    indices_01_c2_full_n;
wire   [3:0] indices_01_c2_dout;
wire    indices_01_c2_empty_n;
wire    indices_12_c3_full_n;
wire   [7:0] indices_12_c3_dout;
wire    indices_12_c3_empty_n;
wire   [15:0] tmp_channel_dout;
wire    tmp_channel_empty_n;
wire   [15:0] sums_0_dout;
wire    sums_0_empty_n;
wire   [15:0] tmp_272_channel_dout;
wire    tmp_272_channel_empty_n;
wire   [15:0] sums_1_dout;
wire    sums_1_empty_n;
wire   [15:0] outputs_0_dout;
wire    outputs_0_empty_n;
wire   [15:0] outputs_1_dout;
wire    outputs_1_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready;
wire    ap_sync_tdf12_get_next_ijk_U0_ap_ready;
reg    ap_sync_reg_tdf12_readInputs_U0_ap_ready;
wire    ap_sync_tdf12_readInputs_U0_ap_ready;
wire   [0:0] start_for_tdf12_readFilters82_U0_din;
wire    start_for_tdf12_readFilters82_U0_full_n;
wire   [0:0] start_for_tdf12_readFilters82_U0_dout;
wire    start_for_tdf12_readFilters82_U0_empty_n;
wire    tdf12_readInputs_U0_start_full_n;
wire    tdf12_readInputs_U0_start_write;
wire    tdf12_readFilters82_U0_start_full_n;
wire    tdf12_readFilters82_U0_start_write;
wire    tdf12_dot_product_U0_start_full_n;
wire    tdf12_dot_product_U0_start_write;
wire    tdf12_accum_1_U0_start_full_n;
wire    tdf12_accum_1_U0_start_write;
wire    tdf12_accum_1_U1_1_start_full_n;
wire    tdf12_accum_1_U1_1_start_write;
wire    tdf12_accum_2_U0_start_full_n;
wire    tdf12_accum_2_U0_start_write;
wire    tdf12_accum_2_U1_1_start_full_n;
wire    tdf12_accum_2_U1_1_start_write;
wire    tdf12_accum_3_U0_start_full_n;
wire    tdf12_accum_3_U0_start_write;
wire    Block_entry_proc_proc573_U0_start_full_n;
wire    Block_entry_proc_proc573_U0_start_write;
wire    tdf12_accum_3_1_U0_start_full_n;
wire    tdf12_accum_3_1_U0_start_write;
wire    Block_entry_proc_proc574_U0_start_full_n;
wire    Block_entry_proc_proc574_U0_start_write;
wire    tdf12_adjust_U0_start_full_n;
wire    tdf12_adjust_U0_start_write;
wire    tdf12_writeOutputs_unaligned_U0_start_full_n;
wire    tdf12_writeOutputs_unaligned_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_sync_reg_channel_write_ifmap_vec_1_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_ifmap_vec_0_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_1_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_1_0_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_1_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_weight_vecs_0_0_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_1_0 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_1 = 1'b0;
#0 ap_sync_reg_channel_write_products_0_0 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_1 = 1'b0;
#0 ap_sync_reg_channel_write_outputs_0 = 1'b0;
#0 ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready = 1'b0;
#0 ap_sync_reg_tdf12_readInputs_U0_ap_ready = 1'b0;
end

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
ifmap_vec_0_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_0_0_0),
    .i_full_n(ifmap_vec_0_0_0_i_full_n),
    .i_ce0(tdf12_readInputs_U0_ifmap_vec_0_0_0_ce0),
    .i_we0(tdf12_readInputs_U0_ifmap_vec_0_0_0_we0),
    .i_address0(tdf12_readInputs_U0_ifmap_vec_0_0_0_address0),
    .i_d0(tdf12_readInputs_U0_ifmap_vec_0_0_0_d0),
    .i_q0(ifmap_vec_0_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_0_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_ifmap_vec_0_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_ifmap_vec_0_0_0_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_0_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
ifmap_vec_1_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_ifmap_vec_1_0_0),
    .i_full_n(ifmap_vec_1_0_0_i_full_n),
    .i_ce0(tdf12_readInputs_U0_ifmap_vec_1_0_0_ce0),
    .i_we0(tdf12_readInputs_U0_ifmap_vec_1_0_0_we0),
    .i_address0(tdf12_readInputs_U0_ifmap_vec_1_0_0_address0),
    .i_d0(tdf12_readInputs_U0_ifmap_vec_1_0_0_d0),
    .i_q0(ifmap_vec_1_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(ifmap_vec_1_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_ifmap_vec_1_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_ifmap_vec_1_0_0_address0),
    .t_d0(16'd0),
    .t_q0(ifmap_vec_1_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
weight_vecs_0_0_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_0_0_0),
    .i_full_n(weight_vecs_0_0_0_0_i_full_n),
    .i_ce0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_ce0),
    .i_we0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_we0),
    .i_address0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_address0),
    .i_d0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_d0),
    .i_q0(weight_vecs_0_0_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_0_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_weight_vecs_0_0_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_weight_vecs_0_0_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_0_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
weight_vecs_0_1_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_0_1_0_0),
    .i_full_n(weight_vecs_0_1_0_0_i_full_n),
    .i_ce0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_ce0),
    .i_we0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_we0),
    .i_address0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_address0),
    .i_d0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_d0),
    .i_q0(weight_vecs_0_1_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_0_1_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_weight_vecs_0_1_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_weight_vecs_0_1_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_0_1_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
weight_vecs_1_0_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_0_0_0),
    .i_full_n(weight_vecs_1_0_0_0_i_full_n),
    .i_ce0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_ce0),
    .i_we0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_we0),
    .i_address0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_address0),
    .i_d0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_d0),
    .i_q0(weight_vecs_1_0_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_0_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_weight_vecs_1_0_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_weight_vecs_1_0_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_0_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
weight_vecs_1_1_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_weight_vecs_1_1_0_0),
    .i_full_n(weight_vecs_1_1_0_0_i_full_n),
    .i_ce0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_ce0),
    .i_we0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_we0),
    .i_address0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_address0),
    .i_d0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_d0),
    .i_q0(weight_vecs_1_1_0_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_dot_product_U0_ap_ready),
    .t_empty_n(weight_vecs_1_1_0_0_t_empty_n),
    .t_ce0(tdf12_dot_product_U0_weight_vecs_1_1_0_0_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_dot_product_U0_weight_vecs_1_1_0_0_address0),
    .t_d0(16'd0),
    .t_q0(weight_vecs_1_1_0_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
products_0_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_0),
    .i_full_n(products_0_0_i_full_n),
    .i_ce0(tdf12_dot_product_U0_products_0_0_ce0),
    .i_we0(tdf12_dot_product_U0_products_0_0_we0),
    .i_address0(tdf12_dot_product_U0_products_0_0_address0),
    .i_d0(tdf12_dot_product_U0_products_0_0_d0),
    .i_q0(products_0_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_1_U0_ap_ready),
    .t_empty_n(products_0_0_t_empty_n),
    .t_ce0(tdf12_accum_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_0_0_t_q0),
    .t_ce1(tdf12_accum_1_U0_accum_in_ce1),
    .t_address1(tdf12_accum_1_U0_accum_in_address1),
    .t_q1(products_0_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
products_0_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_0_1),
    .i_full_n(products_0_1_i_full_n),
    .i_ce0(tdf12_dot_product_U0_products_0_1_ce0),
    .i_we0(tdf12_dot_product_U0_products_0_1_we0),
    .i_address0(tdf12_dot_product_U0_products_0_1_address0),
    .i_d0(tdf12_dot_product_U0_products_0_1_d0),
    .i_q0(products_0_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_0_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_1_U0_ap_ready),
    .t_empty_n(products_0_1_t_empty_n),
    .t_ce0(tdf12_accum_1_U0_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_1_U0_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_0_1_t_q0),
    .t_ce1(tdf12_accum_1_U0_accum_in1_ce1),
    .t_address1(tdf12_accum_1_U0_accum_in1_address1),
    .t_q1(products_0_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
products_1_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_0),
    .i_full_n(products_1_0_i_full_n),
    .i_ce0(tdf12_dot_product_U0_products_1_0_ce0),
    .i_we0(tdf12_dot_product_U0_products_1_0_we0),
    .i_address0(tdf12_dot_product_U0_products_1_0_address0),
    .i_d0(tdf12_dot_product_U0_products_1_0_d0),
    .i_q0(products_1_0_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_0_t_empty_n),
    .t_ce0(tdf12_accum_1_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_1_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(products_1_0_t_q0),
    .t_ce1(tdf12_accum_1_U1_1_accum_in_ce1),
    .t_address1(tdf12_accum_1_U1_1_accum_in_address1),
    .t_q1(products_1_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0 #(
    .DataWidth( 16 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
products_1_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(ap_channel_done_products_1_1),
    .i_full_n(products_1_1_i_full_n),
    .i_ce0(tdf12_dot_product_U0_products_1_1_ce0),
    .i_we0(tdf12_dot_product_U0_products_1_1_we0),
    .i_address0(tdf12_dot_product_U0_products_1_1_address0),
    .i_d0(tdf12_dot_product_U0_products_1_1_d0),
    .i_q0(products_1_1_i_q0),
    .i_ce1(1'b0),
    .i_address1(6'd0),
    .i_q1(products_1_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_1_U1_1_ap_ready),
    .t_empty_n(products_1_1_t_empty_n),
    .t_ce0(tdf12_accum_1_U1_1_accum_in1_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_1_U1_1_accum_in1_address0),
    .t_d0(16'd0),
    .t_q0(products_1_1_t_q0),
    .t_ce1(tdf12_accum_1_U1_1_accum_in1_ce1),
    .t_address1(tdf12_accum_1_U1_1_accum_in1_address1),
    .t_q1(products_1_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
accum1_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf12_accum_1_U0_ap_done),
    .i_full_n(accum1_out_0_i_full_n),
    .i_ce0(tdf12_accum_1_U0_accum_out_ce0),
    .i_we0(tdf12_accum_1_U0_accum_out_we0),
    .i_address0(tdf12_accum_1_U0_accum_out_address0),
    .i_d0(tdf12_accum_1_U0_accum_out_d0),
    .i_q0(accum1_out_0_i_q0),
    .i_ce1(tdf12_accum_1_U0_accum_out_ce1),
    .i_we1(tdf12_accum_1_U0_accum_out_we1),
    .i_address1(tdf12_accum_1_U0_accum_out_address1),
    .i_d1(tdf12_accum_1_U0_accum_out_d1),
    .i_q1(accum1_out_0_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_2_U0_ap_ready),
    .t_empty_n(accum1_out_0_t_empty_n),
    .t_ce0(tdf12_accum_2_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_2_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_0_t_q0),
    .t_ce1(tdf12_accum_2_U0_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf12_accum_2_U0_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_0_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
accum1_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf12_accum_1_U1_1_ap_done),
    .i_full_n(accum1_out_1_i_full_n),
    .i_ce0(tdf12_accum_1_U1_1_accum_out_ce0),
    .i_we0(tdf12_accum_1_U1_1_accum_out_we0),
    .i_address0(tdf12_accum_1_U1_1_accum_out_address0),
    .i_d0(tdf12_accum_1_U1_1_accum_out_d0),
    .i_q0(accum1_out_1_i_q0),
    .i_ce1(tdf12_accum_1_U1_1_accum_out_ce1),
    .i_we1(tdf12_accum_1_U1_1_accum_out_we1),
    .i_address1(tdf12_accum_1_U1_1_accum_out_address1),
    .i_d1(tdf12_accum_1_U1_1_accum_out_d1),
    .i_q1(accum1_out_1_i_q1),
    .t_ce(1'b1),
    .t_read(tdf12_accum_2_U1_1_ap_ready),
    .t_empty_n(accum1_out_1_t_empty_n),
    .t_ce0(tdf12_accum_2_U1_1_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_2_U1_1_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum1_out_1_t_q0),
    .t_ce1(tdf12_accum_2_U1_1_accum_in_ce1),
    .t_we1(1'b0),
    .t_address1(tdf12_accum_2_U1_1_accum_in_address1),
    .t_d1(16'd0),
    .t_q1(accum1_out_1_t_q1)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf12_accum_2_U0_ap_done),
    .i_full_n(accum2_out_0_i_full_n),
    .i_ce0(tdf12_accum_2_U0_accum_out_ce0),
    .i_we0(tdf12_accum_2_U0_accum_out_we0),
    .i_address0(tdf12_accum_2_U0_accum_out_address0),
    .i_d0(tdf12_accum_2_U0_accum_out_d0),
    .i_q0(accum2_out_0_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_accum_3_U0_ap_ready),
    .t_empty_n(accum2_out_0_t_empty_n),
    .t_ce0(tdf12_accum_3_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_3_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_0_t_q0)
);

td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0 #(
    .DataWidth( 16 ),
    .AddressRange( 8 ),
    .AddressWidth( 3 ))
accum2_out_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_ce(1'b1),
    .i_write(tdf12_accum_2_U1_1_ap_done),
    .i_full_n(accum2_out_1_i_full_n),
    .i_ce0(tdf12_accum_2_U1_1_accum_out_ce0),
    .i_we0(tdf12_accum_2_U1_1_accum_out_we0),
    .i_address0(tdf12_accum_2_U1_1_accum_out_address0),
    .i_d0(tdf12_accum_2_U1_1_accum_out_d0),
    .i_q0(accum2_out_1_i_q0),
    .t_ce(1'b1),
    .t_read(tdf12_accum_3_1_U0_ap_ready),
    .t_empty_n(accum2_out_1_t_empty_n),
    .t_ce0(tdf12_accum_3_1_U0_accum_in_ce0),
    .t_we0(1'b0),
    .t_address0(tdf12_accum_3_1_U0_accum_in_address0),
    .t_d0(16'd0),
    .t_q0(accum2_out_1_t_q0)
);

td_fused_top_tdf12_get_next_ijk tdf12_get_next_ijk_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_get_next_ijk_U0_ap_start),
    .start_full_n(start_for_tdf12_readFilters82_U0_full_n),
    .ap_done(tdf12_get_next_ijk_U0_ap_done),
    .ap_continue(tdf12_get_next_ijk_U0_ap_continue),
    .ap_idle(tdf12_get_next_ijk_U0_ap_idle),
    .ap_ready(tdf12_get_next_ijk_U0_ap_ready),
    .start_out(tdf12_get_next_ijk_U0_start_out),
    .start_write(tdf12_get_next_ijk_U0_start_write),
    .indices_0_din(tdf12_get_next_ijk_U0_indices_0_din),
    .indices_0_full_n(indices_01_c_full_n),
    .indices_0_write(tdf12_get_next_ijk_U0_indices_0_write),
    .indices_1_din(tdf12_get_next_ijk_U0_indices_1_din),
    .indices_1_full_n(indices_12_c_full_n),
    .indices_1_write(tdf12_get_next_ijk_U0_indices_1_write),
    .indices_2_out_din(tdf12_get_next_ijk_U0_indices_2_out_din),
    .indices_2_out_full_n(indices_23_c_full_n),
    .indices_2_out_write(tdf12_get_next_ijk_U0_indices_2_out_write),
    .indices_2_out1_din(tdf12_get_next_ijk_U0_indices_2_out1_din),
    .indices_2_out1_full_n(indices_23_c1_full_n),
    .indices_2_out1_write(tdf12_get_next_ijk_U0_indices_2_out1_write)
);

td_fused_top_tdf12_readInputs tdf12_readInputs_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_readInputs_U0_ap_start),
    .ap_done(tdf12_readInputs_U0_ap_done),
    .ap_continue(tdf12_readInputs_U0_ap_continue),
    .ap_idle(tdf12_readInputs_U0_ap_idle),
    .ap_ready(tdf12_readInputs_U0_ap_ready),
    .in_data_address0(tdf12_readInputs_U0_in_data_address0),
    .in_data_ce0(tdf12_readInputs_U0_in_data_ce0),
    .in_data_q0(in_data_q0),
    .indices_01_dout(indices_01_c_dout),
    .indices_01_empty_n(indices_01_c_empty_n),
    .indices_01_read(tdf12_readInputs_U0_indices_01_read),
    .indices_12_dout(indices_12_c_dout),
    .indices_12_empty_n(indices_12_c_empty_n),
    .indices_12_read(tdf12_readInputs_U0_indices_12_read),
    .ifmap_vec_0_0_0_address0(tdf12_readInputs_U0_ifmap_vec_0_0_0_address0),
    .ifmap_vec_0_0_0_ce0(tdf12_readInputs_U0_ifmap_vec_0_0_0_ce0),
    .ifmap_vec_0_0_0_we0(tdf12_readInputs_U0_ifmap_vec_0_0_0_we0),
    .ifmap_vec_0_0_0_d0(tdf12_readInputs_U0_ifmap_vec_0_0_0_d0),
    .ifmap_vec_1_0_0_address0(tdf12_readInputs_U0_ifmap_vec_1_0_0_address0),
    .ifmap_vec_1_0_0_ce0(tdf12_readInputs_U0_ifmap_vec_1_0_0_ce0),
    .ifmap_vec_1_0_0_we0(tdf12_readInputs_U0_ifmap_vec_1_0_0_we0),
    .ifmap_vec_1_0_0_d0(tdf12_readInputs_U0_ifmap_vec_1_0_0_d0),
    .indices_01_out_din(tdf12_readInputs_U0_indices_01_out_din),
    .indices_01_out_full_n(indices_01_c2_full_n),
    .indices_01_out_write(tdf12_readInputs_U0_indices_01_out_write),
    .indices_12_out_din(tdf12_readInputs_U0_indices_12_out_din),
    .indices_12_out_full_n(indices_12_c3_full_n),
    .indices_12_out_write(tdf12_readInputs_U0_indices_12_out_write)
);

td_fused_top_tdf12_readFilters82 tdf12_readFilters82_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_readFilters82_U0_ap_start),
    .ap_done(tdf12_readFilters82_U0_ap_done),
    .ap_continue(tdf12_readFilters82_U0_ap_continue),
    .ap_idle(tdf12_readFilters82_U0_ap_idle),
    .ap_ready(tdf12_readFilters82_U0_ap_ready),
    .filter_data_0_address0(tdf12_readFilters82_U0_filter_data_0_address0),
    .filter_data_0_ce0(tdf12_readFilters82_U0_filter_data_0_ce0),
    .filter_data_0_q0(filter_data_0_q0),
    .filter_data_1_address0(tdf12_readFilters82_U0_filter_data_1_address0),
    .filter_data_1_ce0(tdf12_readFilters82_U0_filter_data_1_ce0),
    .filter_data_1_q0(filter_data_1_q0),
    .indices_23_dout(indices_23_c_dout),
    .indices_23_empty_n(indices_23_c_empty_n),
    .indices_23_read(tdf12_readFilters82_U0_indices_23_read),
    .weight_vecs_0_0_0_0_address0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_address0),
    .weight_vecs_0_0_0_0_ce0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_ce0),
    .weight_vecs_0_0_0_0_we0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_we0),
    .weight_vecs_0_0_0_0_d0(tdf12_readFilters82_U0_weight_vecs_0_0_0_0_d0),
    .weight_vecs_0_1_0_0_address0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_address0),
    .weight_vecs_0_1_0_0_ce0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_ce0),
    .weight_vecs_0_1_0_0_we0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_we0),
    .weight_vecs_0_1_0_0_d0(tdf12_readFilters82_U0_weight_vecs_0_1_0_0_d0),
    .weight_vecs_1_0_0_0_address0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_address0),
    .weight_vecs_1_0_0_0_ce0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_ce0),
    .weight_vecs_1_0_0_0_we0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_we0),
    .weight_vecs_1_0_0_0_d0(tdf12_readFilters82_U0_weight_vecs_1_0_0_0_d0),
    .weight_vecs_1_1_0_0_address0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_address0),
    .weight_vecs_1_1_0_0_ce0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_ce0),
    .weight_vecs_1_1_0_0_we0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_we0),
    .weight_vecs_1_1_0_0_d0(tdf12_readFilters82_U0_weight_vecs_1_1_0_0_d0)
);

td_fused_top_tdf12_dot_product tdf12_dot_product_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_dot_product_U0_ap_start),
    .ap_done(tdf12_dot_product_U0_ap_done),
    .ap_continue(tdf12_dot_product_U0_ap_continue),
    .ap_idle(tdf12_dot_product_U0_ap_idle),
    .ap_ready(tdf12_dot_product_U0_ap_ready),
    .ifmap_vec_0_0_0_address0(tdf12_dot_product_U0_ifmap_vec_0_0_0_address0),
    .ifmap_vec_0_0_0_ce0(tdf12_dot_product_U0_ifmap_vec_0_0_0_ce0),
    .ifmap_vec_0_0_0_q0(ifmap_vec_0_0_0_t_q0),
    .ifmap_vec_1_0_0_address0(tdf12_dot_product_U0_ifmap_vec_1_0_0_address0),
    .ifmap_vec_1_0_0_ce0(tdf12_dot_product_U0_ifmap_vec_1_0_0_ce0),
    .ifmap_vec_1_0_0_q0(ifmap_vec_1_0_0_t_q0),
    .weight_vecs_0_0_0_0_address0(tdf12_dot_product_U0_weight_vecs_0_0_0_0_address0),
    .weight_vecs_0_0_0_0_ce0(tdf12_dot_product_U0_weight_vecs_0_0_0_0_ce0),
    .weight_vecs_0_0_0_0_q0(weight_vecs_0_0_0_0_t_q0),
    .weight_vecs_0_1_0_0_address0(tdf12_dot_product_U0_weight_vecs_0_1_0_0_address0),
    .weight_vecs_0_1_0_0_ce0(tdf12_dot_product_U0_weight_vecs_0_1_0_0_ce0),
    .weight_vecs_0_1_0_0_q0(weight_vecs_0_1_0_0_t_q0),
    .weight_vecs_1_0_0_0_address0(tdf12_dot_product_U0_weight_vecs_1_0_0_0_address0),
    .weight_vecs_1_0_0_0_ce0(tdf12_dot_product_U0_weight_vecs_1_0_0_0_ce0),
    .weight_vecs_1_0_0_0_q0(weight_vecs_1_0_0_0_t_q0),
    .weight_vecs_1_1_0_0_address0(tdf12_dot_product_U0_weight_vecs_1_1_0_0_address0),
    .weight_vecs_1_1_0_0_ce0(tdf12_dot_product_U0_weight_vecs_1_1_0_0_ce0),
    .weight_vecs_1_1_0_0_q0(weight_vecs_1_1_0_0_t_q0),
    .products_0_0_address0(tdf12_dot_product_U0_products_0_0_address0),
    .products_0_0_ce0(tdf12_dot_product_U0_products_0_0_ce0),
    .products_0_0_we0(tdf12_dot_product_U0_products_0_0_we0),
    .products_0_0_d0(tdf12_dot_product_U0_products_0_0_d0),
    .products_0_1_address0(tdf12_dot_product_U0_products_0_1_address0),
    .products_0_1_ce0(tdf12_dot_product_U0_products_0_1_ce0),
    .products_0_1_we0(tdf12_dot_product_U0_products_0_1_we0),
    .products_0_1_d0(tdf12_dot_product_U0_products_0_1_d0),
    .products_1_0_address0(tdf12_dot_product_U0_products_1_0_address0),
    .products_1_0_ce0(tdf12_dot_product_U0_products_1_0_ce0),
    .products_1_0_we0(tdf12_dot_product_U0_products_1_0_we0),
    .products_1_0_d0(tdf12_dot_product_U0_products_1_0_d0),
    .products_1_1_address0(tdf12_dot_product_U0_products_1_1_address0),
    .products_1_1_ce0(tdf12_dot_product_U0_products_1_1_ce0),
    .products_1_1_we0(tdf12_dot_product_U0_products_1_1_we0),
    .products_1_1_d0(tdf12_dot_product_U0_products_1_1_d0)
);

td_fused_top_tdf12_accum_1 tdf12_accum_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_1_U0_ap_start),
    .ap_done(tdf12_accum_1_U0_ap_done),
    .ap_continue(tdf12_accum_1_U0_ap_continue),
    .ap_idle(tdf12_accum_1_U0_ap_idle),
    .ap_ready(tdf12_accum_1_U0_ap_ready),
    .accum_in_address0(tdf12_accum_1_U0_accum_in_address0),
    .accum_in_ce0(tdf12_accum_1_U0_accum_in_ce0),
    .accum_in_q0(products_0_0_t_q0),
    .accum_in_address1(tdf12_accum_1_U0_accum_in_address1),
    .accum_in_ce1(tdf12_accum_1_U0_accum_in_ce1),
    .accum_in_q1(products_0_0_t_q1),
    .accum_in1_address0(tdf12_accum_1_U0_accum_in1_address0),
    .accum_in1_ce0(tdf12_accum_1_U0_accum_in1_ce0),
    .accum_in1_q0(products_0_1_t_q0),
    .accum_in1_address1(tdf12_accum_1_U0_accum_in1_address1),
    .accum_in1_ce1(tdf12_accum_1_U0_accum_in1_ce1),
    .accum_in1_q1(products_0_1_t_q1),
    .accum_out_address0(tdf12_accum_1_U0_accum_out_address0),
    .accum_out_ce0(tdf12_accum_1_U0_accum_out_ce0),
    .accum_out_we0(tdf12_accum_1_U0_accum_out_we0),
    .accum_out_d0(tdf12_accum_1_U0_accum_out_d0),
    .accum_out_address1(tdf12_accum_1_U0_accum_out_address1),
    .accum_out_ce1(tdf12_accum_1_U0_accum_out_ce1),
    .accum_out_we1(tdf12_accum_1_U0_accum_out_we1),
    .accum_out_d1(tdf12_accum_1_U0_accum_out_d1)
);

td_fused_top_tdf12_accum_1 tdf12_accum_1_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_1_U1_1_ap_start),
    .ap_done(tdf12_accum_1_U1_1_ap_done),
    .ap_continue(tdf12_accum_1_U1_1_ap_continue),
    .ap_idle(tdf12_accum_1_U1_1_ap_idle),
    .ap_ready(tdf12_accum_1_U1_1_ap_ready),
    .accum_in_address0(tdf12_accum_1_U1_1_accum_in_address0),
    .accum_in_ce0(tdf12_accum_1_U1_1_accum_in_ce0),
    .accum_in_q0(products_1_0_t_q0),
    .accum_in_address1(tdf12_accum_1_U1_1_accum_in_address1),
    .accum_in_ce1(tdf12_accum_1_U1_1_accum_in_ce1),
    .accum_in_q1(products_1_0_t_q1),
    .accum_in1_address0(tdf12_accum_1_U1_1_accum_in1_address0),
    .accum_in1_ce0(tdf12_accum_1_U1_1_accum_in1_ce0),
    .accum_in1_q0(products_1_1_t_q0),
    .accum_in1_address1(tdf12_accum_1_U1_1_accum_in1_address1),
    .accum_in1_ce1(tdf12_accum_1_U1_1_accum_in1_ce1),
    .accum_in1_q1(products_1_1_t_q1),
    .accum_out_address0(tdf12_accum_1_U1_1_accum_out_address0),
    .accum_out_ce0(tdf12_accum_1_U1_1_accum_out_ce0),
    .accum_out_we0(tdf12_accum_1_U1_1_accum_out_we0),
    .accum_out_d0(tdf12_accum_1_U1_1_accum_out_d0),
    .accum_out_address1(tdf12_accum_1_U1_1_accum_out_address1),
    .accum_out_ce1(tdf12_accum_1_U1_1_accum_out_ce1),
    .accum_out_we1(tdf12_accum_1_U1_1_accum_out_we1),
    .accum_out_d1(tdf12_accum_1_U1_1_accum_out_d1)
);

td_fused_top_tdf12_accum_2 tdf12_accum_2_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_2_U0_ap_start),
    .ap_done(tdf12_accum_2_U0_ap_done),
    .ap_continue(tdf12_accum_2_U0_ap_continue),
    .ap_idle(tdf12_accum_2_U0_ap_idle),
    .ap_ready(tdf12_accum_2_U0_ap_ready),
    .accum_in_address0(tdf12_accum_2_U0_accum_in_address0),
    .accum_in_ce0(tdf12_accum_2_U0_accum_in_ce0),
    .accum_in_q0(accum1_out_0_t_q0),
    .accum_in_address1(tdf12_accum_2_U0_accum_in_address1),
    .accum_in_ce1(tdf12_accum_2_U0_accum_in_ce1),
    .accum_in_q1(accum1_out_0_t_q1),
    .accum_out_address0(tdf12_accum_2_U0_accum_out_address0),
    .accum_out_ce0(tdf12_accum_2_U0_accum_out_ce0),
    .accum_out_we0(tdf12_accum_2_U0_accum_out_we0),
    .accum_out_d0(tdf12_accum_2_U0_accum_out_d0)
);

td_fused_top_tdf12_accum_2 tdf12_accum_2_U1_1(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_2_U1_1_ap_start),
    .ap_done(tdf12_accum_2_U1_1_ap_done),
    .ap_continue(tdf12_accum_2_U1_1_ap_continue),
    .ap_idle(tdf12_accum_2_U1_1_ap_idle),
    .ap_ready(tdf12_accum_2_U1_1_ap_ready),
    .accum_in_address0(tdf12_accum_2_U1_1_accum_in_address0),
    .accum_in_ce0(tdf12_accum_2_U1_1_accum_in_ce0),
    .accum_in_q0(accum1_out_1_t_q0),
    .accum_in_address1(tdf12_accum_2_U1_1_accum_in_address1),
    .accum_in_ce1(tdf12_accum_2_U1_1_accum_in_ce1),
    .accum_in_q1(accum1_out_1_t_q1),
    .accum_out_address0(tdf12_accum_2_U1_1_accum_out_address0),
    .accum_out_ce0(tdf12_accum_2_U1_1_accum_out_ce0),
    .accum_out_we0(tdf12_accum_2_U1_1_accum_out_we0),
    .accum_out_d0(tdf12_accum_2_U1_1_accum_out_d0)
);

td_fused_top_tdf12_accum_3 tdf12_accum_3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_3_U0_ap_start),
    .ap_done(tdf12_accum_3_U0_ap_done),
    .ap_continue(tdf12_accum_3_U0_ap_continue),
    .ap_idle(tdf12_accum_3_U0_ap_idle),
    .ap_ready(tdf12_accum_3_U0_ap_ready),
    .accum_in_40(tdf12_accum_3_U0_accum_in_40),
    .accum_in_40_ap_vld(tdf12_accum_3_U0_accum_in_40_ap_vld),
    .accum_in_address0(tdf12_accum_3_U0_accum_in_address0),
    .accum_in_ce0(tdf12_accum_3_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_0_t_q0)
);

td_fused_top_Block_entry_proc_proc573 Block_entry_proc_proc573_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc573_U0_ap_start),
    .ap_done(Block_entry_proc_proc573_U0_ap_done),
    .ap_continue(Block_entry_proc_proc573_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc573_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc573_U0_ap_ready),
    .tmp(tmp_channel_dout),
    .ap_return(Block_entry_proc_proc573_U0_ap_return)
);

td_fused_top_tdf12_accum_3_1 tdf12_accum_3_1_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_accum_3_1_U0_ap_start),
    .ap_done(tdf12_accum_3_1_U0_ap_done),
    .ap_continue(tdf12_accum_3_1_U0_ap_continue),
    .ap_idle(tdf12_accum_3_1_U0_ap_idle),
    .ap_ready(tdf12_accum_3_1_U0_ap_ready),
    .accum_in_38(tdf12_accum_3_1_U0_accum_in_38),
    .accum_in_38_ap_vld(tdf12_accum_3_1_U0_accum_in_38_ap_vld),
    .accum_in_address0(tdf12_accum_3_1_U0_accum_in_address0),
    .accum_in_ce0(tdf12_accum_3_1_U0_accum_in_ce0),
    .accum_in_q0(accum2_out_1_t_q0)
);

td_fused_top_Block_entry_proc_proc574 Block_entry_proc_proc574_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_entry_proc_proc574_U0_ap_start),
    .ap_done(Block_entry_proc_proc574_U0_ap_done),
    .ap_continue(Block_entry_proc_proc574_U0_ap_continue),
    .ap_idle(Block_entry_proc_proc574_U0_ap_idle),
    .ap_ready(Block_entry_proc_proc574_U0_ap_ready),
    .tmp_272(tmp_272_channel_dout),
    .ap_return(Block_entry_proc_proc574_U0_ap_return)
);

td_fused_top_tdf12_adjust tdf12_adjust_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_adjust_U0_ap_start),
    .ap_done(tdf12_adjust_U0_ap_done),
    .ap_continue(tdf12_adjust_U0_ap_continue),
    .ap_idle(tdf12_adjust_U0_ap_idle),
    .ap_ready(tdf12_adjust_U0_ap_ready),
    .sums_0_read(sums_0_dout),
    .sums_1_read(sums_1_dout),
    .adjustments_address0(tdf12_adjust_U0_adjustments_address0),
    .adjustments_ce0(tdf12_adjust_U0_adjustments_ce0),
    .adjustments_q0(adjustments_q0),
    .indices_23_dout(indices_23_c1_dout),
    .indices_23_empty_n(indices_23_c1_empty_n),
    .indices_23_read(tdf12_adjust_U0_indices_23_read),
    .ap_return_0(tdf12_adjust_U0_ap_return_0),
    .ap_return_1(tdf12_adjust_U0_ap_return_1)
);

td_fused_top_tdf12_writeOutputs_unaligned tdf12_writeOutputs_unaligned_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tdf12_writeOutputs_unaligned_U0_ap_start),
    .ap_done(tdf12_writeOutputs_unaligned_U0_ap_done),
    .ap_continue(tdf12_writeOutputs_unaligned_U0_ap_continue),
    .ap_idle(tdf12_writeOutputs_unaligned_U0_ap_idle),
    .ap_ready(tdf12_writeOutputs_unaligned_U0_ap_ready),
    .indices_01_dout(indices_01_c2_dout),
    .indices_01_empty_n(indices_01_c2_empty_n),
    .indices_01_read(tdf12_writeOutputs_unaligned_U0_indices_01_read),
    .indices_12_dout(indices_12_c3_dout),
    .indices_12_empty_n(indices_12_c3_empty_n),
    .indices_12_read(tdf12_writeOutputs_unaligned_U0_indices_12_read),
    .p_read(outputs_0_dout),
    .p_read1(outputs_1_dout),
    .out_data_address1(tdf12_writeOutputs_unaligned_U0_out_data_address1),
    .out_data_ce1(tdf12_writeOutputs_unaligned_U0_out_data_ce1),
    .out_data_we1(tdf12_writeOutputs_unaligned_U0_out_data_we1),
    .out_data_d1(tdf12_writeOutputs_unaligned_U0_out_data_d1)
);

td_fused_top_fifo_w16_d2_S_x9 indices_01_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_01_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_readInputs_U0_indices_01_read),
    .if_dout(indices_01_c_dout),
    .if_full_n(indices_01_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_get_next_ijk_U0_indices_0_write),
    .if_din(tdf12_get_next_ijk_U0_indices_0_din)
);

td_fused_top_fifo_w16_d2_S_x9 indices_12_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_12_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_readInputs_U0_indices_12_read),
    .if_dout(indices_12_c_dout),
    .if_full_n(indices_12_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_get_next_ijk_U0_indices_1_write),
    .if_din(tdf12_get_next_ijk_U0_indices_1_din)
);

td_fused_top_fifo_w9_d2_S indices_23_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_23_c_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_readFilters82_U0_indices_23_read),
    .if_dout(indices_23_c_dout),
    .if_full_n(indices_23_c_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_get_next_ijk_U0_indices_2_out_write),
    .if_din(tdf12_get_next_ijk_U0_indices_2_out_din)
);

td_fused_top_fifo_w9_d8_S indices_23_c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_23_c1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_adjust_U0_indices_23_read),
    .if_dout(indices_23_c1_dout),
    .if_full_n(indices_23_c1_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_get_next_ijk_U0_indices_2_out1_write),
    .if_din(tdf12_get_next_ijk_U0_indices_2_out1_din)
);

td_fused_top_fifo_w4_d8_S_x0 indices_01_c2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_01_c2_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_writeOutputs_unaligned_U0_indices_01_read),
    .if_dout(indices_01_c2_dout),
    .if_full_n(indices_01_c2_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_readInputs_U0_indices_01_out_write),
    .if_din(tdf12_readInputs_U0_indices_01_out_din)
);

td_fused_top_fifo_w8_d8_S_x indices_12_c3_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(indices_12_c3_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_writeOutputs_unaligned_U0_indices_12_read),
    .if_dout(indices_12_c3_dout),
    .if_full_n(indices_12_c3_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_readInputs_U0_indices_12_out_write),
    .if_din(tdf12_readInputs_U0_indices_12_out_din)
);

td_fused_top_fifo_w16_d2_S_x9 tmp_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc573_U0_ap_ready),
    .if_dout(tmp_channel_dout),
    .if_full_n(tmp_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_accum_3_U0_ap_done),
    .if_din(tdf12_accum_3_U0_accum_in_40)
);

td_fused_top_fifo_w16_d2_S_x9 sums_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_adjust_U0_ap_ready),
    .if_dout(sums_0_dout),
    .if_full_n(sums_0_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc573_U0_ap_done),
    .if_din(Block_entry_proc_proc573_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x9 tmp_272_channel_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(tmp_272_channel_empty_n),
    .if_read_ce(1'b1),
    .if_read(Block_entry_proc_proc574_U0_ap_ready),
    .if_dout(tmp_272_channel_dout),
    .if_full_n(tmp_272_channel_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_accum_3_1_U0_ap_done),
    .if_din(tdf12_accum_3_1_U0_accum_in_38)
);

td_fused_top_fifo_w16_d2_S_x9 sums_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(sums_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_adjust_U0_ap_ready),
    .if_dout(sums_1_dout),
    .if_full_n(sums_1_full_n),
    .if_write_ce(1'b1),
    .if_write(Block_entry_proc_proc574_U0_ap_done),
    .if_din(Block_entry_proc_proc574_U0_ap_return)
);

td_fused_top_fifo_w16_d2_S_x9 outputs_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_writeOutputs_unaligned_U0_ap_ready),
    .if_dout(outputs_0_dout),
    .if_full_n(outputs_0_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_0),
    .if_din(tdf12_adjust_U0_ap_return_0)
);

td_fused_top_fifo_w16_d2_S_x9 outputs_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(outputs_1_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_writeOutputs_unaligned_U0_ap_ready),
    .if_dout(outputs_1_dout),
    .if_full_n(outputs_1_full_n),
    .if_write_ce(1'b1),
    .if_write(ap_channel_done_outputs_1),
    .if_din(tdf12_adjust_U0_ap_return_1)
);

td_fused_top_start_for_tdf12_readFilters82_U0 start_for_tdf12_readFilters82_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_empty_n(start_for_tdf12_readFilters82_U0_empty_n),
    .if_read_ce(1'b1),
    .if_read(tdf12_readFilters82_U0_ap_ready),
    .if_dout(start_for_tdf12_readFilters82_U0_dout),
    .if_full_n(start_for_tdf12_readFilters82_U0_full_n),
    .if_write_ce(1'b1),
    .if_write(tdf12_get_next_ijk_U0_start_write),
    .if_din(start_for_tdf12_readFilters82_U0_din)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_0_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readInputs_U0_ap_done & tdf12_readInputs_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_0_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_0_0_0 <= ap_sync_channel_write_ifmap_vec_0_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_ifmap_vec_1_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readInputs_U0_ap_done & tdf12_readInputs_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_ifmap_vec_1_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_ifmap_vec_1_0_0 <= ap_sync_channel_write_ifmap_vec_1_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_outputs_0 <= 1'b0;
    end else begin
        if (((tdf12_adjust_U0_ap_done & tdf12_adjust_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf12_adjust_U0_ap_done & tdf12_adjust_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_outputs_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_outputs_1 <= ap_sync_channel_write_outputs_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_products_0_0 <= 1'b0;
    end else begin
        if (((tdf12_dot_product_U0_ap_done & tdf12_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf12_dot_product_U0_ap_done & tdf12_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf12_dot_product_U0_ap_done & tdf12_dot_product_U0_ap_continue) == 1'b1)) begin
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
        if (((tdf12_dot_product_U0_ap_done & tdf12_dot_product_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_products_1_1 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_products_1_1 <= ap_sync_channel_write_products_1_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_0_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readFilters82_U0_ap_done & tdf12_readFilters82_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_0_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_0_0_0 <= ap_sync_channel_write_weight_vecs_0_0_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_0_1_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readFilters82_U0_ap_done & tdf12_readFilters82_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_0_1_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_0_1_0_0 <= ap_sync_channel_write_weight_vecs_0_1_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_0_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readFilters82_U0_ap_done & tdf12_readFilters82_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_0_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_0_0_0 <= ap_sync_channel_write_weight_vecs_1_0_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_channel_write_weight_vecs_1_1_0_0 <= 1'b0;
    end else begin
        if (((tdf12_readFilters82_U0_ap_done & tdf12_readFilters82_U0_ap_continue) == 1'b1)) begin
            ap_sync_reg_channel_write_weight_vecs_1_1_0_0 <= 1'b0;
        end else begin
            ap_sync_reg_channel_write_weight_vecs_1_1_0_0 <= ap_sync_channel_write_weight_vecs_1_1_0_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready <= ap_sync_tdf12_get_next_ijk_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tdf12_readInputs_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tdf12_readInputs_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tdf12_readInputs_U0_ap_ready <= ap_sync_tdf12_readInputs_U0_ap_ready;
        end
    end
end

assign Block_entry_proc_proc573_U0_ap_continue = sums_0_full_n;

assign Block_entry_proc_proc573_U0_ap_start = tmp_channel_empty_n;

assign Block_entry_proc_proc573_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc573_U0_start_write = 1'b0;

assign Block_entry_proc_proc574_U0_ap_continue = sums_1_full_n;

assign Block_entry_proc_proc574_U0_ap_start = tmp_272_channel_empty_n;

assign Block_entry_proc_proc574_U0_start_full_n = 1'b1;

assign Block_entry_proc_proc574_U0_start_write = 1'b0;

assign adjustments_address0 = tdf12_adjust_U0_adjustments_address0;

assign adjustments_address1 = 10'd0;

assign adjustments_ce0 = tdf12_adjust_U0_adjustments_ce0;

assign adjustments_ce1 = 1'b0;

assign adjustments_d0 = 48'd0;

assign adjustments_d1 = 48'd0;

assign adjustments_we0 = 1'b0;

assign adjustments_we1 = 1'b0;

assign ap_channel_done_accum1_out_0 = tdf12_accum_1_U0_ap_done;

assign ap_channel_done_accum1_out_1 = tdf12_accum_1_U1_1_ap_done;

assign ap_channel_done_accum2_out_0 = tdf12_accum_2_U0_ap_done;

assign ap_channel_done_accum2_out_1 = tdf12_accum_2_U1_1_ap_done;

assign ap_channel_done_ifmap_vec_0_0_0 = (tdf12_readInputs_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_0_0_0 ^ 1'b1));

assign ap_channel_done_ifmap_vec_1_0_0 = (tdf12_readInputs_U0_ap_done & (ap_sync_reg_channel_write_ifmap_vec_1_0_0 ^ 1'b1));

assign ap_channel_done_outputs_0 = (tdf12_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_0 ^ 1'b1));

assign ap_channel_done_outputs_1 = (tdf12_adjust_U0_ap_done & (ap_sync_reg_channel_write_outputs_1 ^ 1'b1));

assign ap_channel_done_products_0_0 = (tdf12_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_0 ^ 1'b1));

assign ap_channel_done_products_0_1 = (tdf12_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_0_1 ^ 1'b1));

assign ap_channel_done_products_1_0 = (tdf12_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_0 ^ 1'b1));

assign ap_channel_done_products_1_1 = (tdf12_dot_product_U0_ap_done & (ap_sync_reg_channel_write_products_1_1 ^ 1'b1));

assign ap_channel_done_sums_0 = Block_entry_proc_proc573_U0_ap_done;

assign ap_channel_done_sums_1 = Block_entry_proc_proc574_U0_ap_done;

assign ap_channel_done_tmp_272_channel = tdf12_accum_3_1_U0_ap_done;

assign ap_channel_done_tmp_channel = tdf12_accum_3_U0_ap_done;

assign ap_channel_done_weight_vecs_0_0_0_0 = (tdf12_readFilters82_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_0_0_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_0_1_0_0 = (tdf12_readFilters82_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_0_1_0_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_0_0_0 = (tdf12_readFilters82_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_0_0_0 ^ 1'b1));

assign ap_channel_done_weight_vecs_1_1_0_0 = (tdf12_readFilters82_U0_ap_done & (ap_sync_reg_channel_write_weight_vecs_1_1_0_0 ^ 1'b1));

assign ap_done = tdf12_writeOutputs_unaligned_U0_ap_done;

assign ap_idle = (tdf12_writeOutputs_unaligned_U0_ap_idle & tdf12_readInputs_U0_ap_idle & tdf12_readFilters82_U0_ap_idle & tdf12_get_next_ijk_U0_ap_idle & tdf12_dot_product_U0_ap_idle & tdf12_adjust_U0_ap_idle & tdf12_accum_3_U0_ap_idle & tdf12_accum_3_1_U0_ap_idle & tdf12_accum_2_U1_1_ap_idle & tdf12_accum_2_U0_ap_idle & tdf12_accum_1_U1_1_ap_idle & tdf12_accum_1_U0_ap_idle & (tmp_272_channel_empty_n ^ 1'b1) & (sums_0_empty_n ^ 1'b1) & (tmp_channel_empty_n ^ 1'b1) & (products_1_1_t_empty_n ^ 1'b1) & (products_1_0_t_empty_n ^ 1'b1) & (products_0_1_t_empty_n ^ 1'b1) & (products_0_0_t_empty_n ^ 1'b1) & (weight_vecs_1_1_0_0_t_empty_n ^ 1'b1) & (weight_vecs_1_0_0_0_t_empty_n ^ 1'b1) & (weight_vecs_0_1_0_0_t_empty_n ^ 1'b1) & (weight_vecs_0_0_0_0_t_empty_n ^ 1'b1) & (ifmap_vec_1_0_0_t_empty_n ^ 1'b1) & (ifmap_vec_0_0_0_t_empty_n ^ 1'b1) & (1'b1 ^ accum2_out_1_t_empty_n) & (1'b1 ^ accum2_out_0_t_empty_n) & (1'b1 ^ accum1_out_1_t_empty_n) & (1'b1 ^ accum1_out_0_t_empty_n) & (outputs_1_empty_n ^ 1'b1) & (outputs_0_empty_n ^ 1'b1) & (sums_1_empty_n ^ 1'b1) & Block_entry_proc_proc574_U0_ap_idle & Block_entry_proc_proc573_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_channel_write_ifmap_vec_0_0_0 = ((tdf12_readInputs_U0_ifmap_vec_0_0_0_full_n & ap_channel_done_ifmap_vec_0_0_0) | ap_sync_reg_channel_write_ifmap_vec_0_0_0);

assign ap_sync_channel_write_ifmap_vec_1_0_0 = ((tdf12_readInputs_U0_ifmap_vec_1_0_0_full_n & ap_channel_done_ifmap_vec_1_0_0) | ap_sync_reg_channel_write_ifmap_vec_1_0_0);

assign ap_sync_channel_write_outputs_0 = ((outputs_0_full_n & ap_channel_done_outputs_0) | ap_sync_reg_channel_write_outputs_0);

assign ap_sync_channel_write_outputs_1 = ((outputs_1_full_n & ap_channel_done_outputs_1) | ap_sync_reg_channel_write_outputs_1);

assign ap_sync_channel_write_products_0_0 = ((tdf12_dot_product_U0_products_0_0_full_n & ap_channel_done_products_0_0) | ap_sync_reg_channel_write_products_0_0);

assign ap_sync_channel_write_products_0_1 = ((tdf12_dot_product_U0_products_0_1_full_n & ap_channel_done_products_0_1) | ap_sync_reg_channel_write_products_0_1);

assign ap_sync_channel_write_products_1_0 = ((tdf12_dot_product_U0_products_1_0_full_n & ap_channel_done_products_1_0) | ap_sync_reg_channel_write_products_1_0);

assign ap_sync_channel_write_products_1_1 = ((tdf12_dot_product_U0_products_1_1_full_n & ap_channel_done_products_1_1) | ap_sync_reg_channel_write_products_1_1);

assign ap_sync_channel_write_weight_vecs_0_0_0_0 = ((tdf12_readFilters82_U0_weight_vecs_0_0_0_0_full_n & ap_channel_done_weight_vecs_0_0_0_0) | ap_sync_reg_channel_write_weight_vecs_0_0_0_0);

assign ap_sync_channel_write_weight_vecs_0_1_0_0 = ((tdf12_readFilters82_U0_weight_vecs_0_1_0_0_full_n & ap_channel_done_weight_vecs_0_1_0_0) | ap_sync_reg_channel_write_weight_vecs_0_1_0_0);

assign ap_sync_channel_write_weight_vecs_1_0_0_0 = ((tdf12_readFilters82_U0_weight_vecs_1_0_0_0_full_n & ap_channel_done_weight_vecs_1_0_0_0) | ap_sync_reg_channel_write_weight_vecs_1_0_0_0);

assign ap_sync_channel_write_weight_vecs_1_1_0_0 = ((tdf12_readFilters82_U0_weight_vecs_1_1_0_0_full_n & ap_channel_done_weight_vecs_1_1_0_0) | ap_sync_reg_channel_write_weight_vecs_1_1_0_0);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = tdf12_writeOutputs_unaligned_U0_ap_done;

assign ap_sync_ready = (ap_sync_tdf12_readInputs_U0_ap_ready & ap_sync_tdf12_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf12_get_next_ijk_U0_ap_ready = (tdf12_get_next_ijk_U0_ap_ready | ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready);

assign ap_sync_tdf12_readInputs_U0_ap_ready = (tdf12_readInputs_U0_ap_ready | ap_sync_reg_tdf12_readInputs_U0_ap_ready);

assign filter_data_0_address0 = tdf12_readFilters82_U0_filter_data_0_address0;

assign filter_data_0_address1 = 15'd0;

assign filter_data_0_ce0 = tdf12_readFilters82_U0_filter_data_0_ce0;

assign filter_data_0_ce1 = 1'b0;

assign filter_data_0_d0 = 32'd0;

assign filter_data_0_d1 = 32'd0;

assign filter_data_0_we0 = 1'b0;

assign filter_data_0_we1 = 1'b0;

assign filter_data_1_address0 = tdf12_readFilters82_U0_filter_data_1_address0;

assign filter_data_1_address1 = 15'd0;

assign filter_data_1_ce0 = tdf12_readFilters82_U0_filter_data_1_ce0;

assign filter_data_1_ce1 = 1'b0;

assign filter_data_1_d0 = 32'd0;

assign filter_data_1_d1 = 32'd0;

assign filter_data_1_we0 = 1'b0;

assign filter_data_1_we1 = 1'b0;

assign in_data_address0 = tdf12_readInputs_U0_in_data_address0;

assign in_data_address1 = 13'd0;

assign in_data_ce0 = tdf12_readInputs_U0_in_data_ce0;

assign in_data_ce1 = 1'b0;

assign in_data_d0 = 64'd0;

assign in_data_d1 = 64'd0;

assign in_data_read = tdf12_readInputs_U0_in_data_write;

assign in_data_we0 = 1'b0;

assign in_data_we1 = 1'b0;

assign out_data_address0 = 16'd0;

assign out_data_address1 = tdf12_writeOutputs_unaligned_U0_out_data_address1;

assign out_data_ce0 = 1'b0;

assign out_data_ce1 = tdf12_writeOutputs_unaligned_U0_out_data_ce1;

assign out_data_d0 = 64'd0;

assign out_data_d1 = tdf12_writeOutputs_unaligned_U0_out_data_d1;

assign out_data_we0 = 1'b0;

assign out_data_we1 = tdf12_writeOutputs_unaligned_U0_out_data_we1;

assign out_data_write = tdf12_writeOutputs_unaligned_U0_out_data_write;

assign products_0_0_t_d1 = 16'd0;

assign products_0_0_t_we1 = 1'b0;

assign products_0_1_t_d1 = 16'd0;

assign products_0_1_t_we1 = 1'b0;

assign products_1_0_t_d1 = 16'd0;

assign products_1_0_t_we1 = 1'b0;

assign products_1_1_t_d1 = 16'd0;

assign products_1_1_t_we1 = 1'b0;

assign start_for_tdf12_readFilters82_U0_din = 1'b1;

assign tdf12_accum_1_U0_accum_out_full_n = accum1_out_0_i_full_n;

assign tdf12_accum_1_U0_ap_continue = accum1_out_0_i_full_n;

assign tdf12_accum_1_U0_ap_start = (products_0_1_t_empty_n & products_0_0_t_empty_n);

assign tdf12_accum_1_U0_start_full_n = 1'b1;

assign tdf12_accum_1_U0_start_write = 1'b0;

assign tdf12_accum_1_U1_1_accum_out_full_n = accum1_out_1_i_full_n;

assign tdf12_accum_1_U1_1_ap_continue = accum1_out_1_i_full_n;

assign tdf12_accum_1_U1_1_ap_start = (products_1_1_t_empty_n & products_1_0_t_empty_n);

assign tdf12_accum_1_U1_1_start_full_n = 1'b1;

assign tdf12_accum_1_U1_1_start_write = 1'b0;

assign tdf12_accum_2_U0_accum_out_full_n = accum2_out_0_i_full_n;

assign tdf12_accum_2_U0_ap_continue = accum2_out_0_i_full_n;

assign tdf12_accum_2_U0_ap_start = accum1_out_0_t_empty_n;

assign tdf12_accum_2_U0_start_full_n = 1'b1;

assign tdf12_accum_2_U0_start_write = 1'b0;

assign tdf12_accum_2_U1_1_accum_out_full_n = accum2_out_1_i_full_n;

assign tdf12_accum_2_U1_1_ap_continue = accum2_out_1_i_full_n;

assign tdf12_accum_2_U1_1_ap_start = accum1_out_1_t_empty_n;

assign tdf12_accum_2_U1_1_start_full_n = 1'b1;

assign tdf12_accum_2_U1_1_start_write = 1'b0;

assign tdf12_accum_3_1_U0_ap_continue = tmp_272_channel_full_n;

assign tdf12_accum_3_1_U0_ap_start = accum2_out_1_t_empty_n;

assign tdf12_accum_3_1_U0_start_full_n = 1'b1;

assign tdf12_accum_3_1_U0_start_write = 1'b0;

assign tdf12_accum_3_U0_ap_continue = tmp_channel_full_n;

assign tdf12_accum_3_U0_ap_start = accum2_out_0_t_empty_n;

assign tdf12_accum_3_U0_start_full_n = 1'b1;

assign tdf12_accum_3_U0_start_write = 1'b0;

assign tdf12_adjust_U0_ap_continue = (ap_sync_channel_write_outputs_1 & ap_sync_channel_write_outputs_0);

assign tdf12_adjust_U0_ap_start = (sums_1_empty_n & sums_0_empty_n);

assign tdf12_adjust_U0_start_full_n = 1'b1;

assign tdf12_adjust_U0_start_write = 1'b0;

assign tdf12_dot_product_U0_ap_continue = (ap_sync_channel_write_products_1_1 & ap_sync_channel_write_products_1_0 & ap_sync_channel_write_products_0_1 & ap_sync_channel_write_products_0_0);

assign tdf12_dot_product_U0_ap_start = (weight_vecs_1_1_0_0_t_empty_n & weight_vecs_1_0_0_0_t_empty_n & weight_vecs_0_1_0_0_t_empty_n & weight_vecs_0_0_0_0_t_empty_n & ifmap_vec_1_0_0_t_empty_n & ifmap_vec_0_0_0_t_empty_n);

assign tdf12_dot_product_U0_products_0_0_full_n = products_0_0_i_full_n;

assign tdf12_dot_product_U0_products_0_1_full_n = products_0_1_i_full_n;

assign tdf12_dot_product_U0_products_1_0_full_n = products_1_0_i_full_n;

assign tdf12_dot_product_U0_products_1_1_full_n = products_1_1_i_full_n;

assign tdf12_dot_product_U0_start_full_n = 1'b1;

assign tdf12_dot_product_U0_start_write = 1'b0;

assign tdf12_get_next_ijk_U0_ap_continue = 1'b1;

assign tdf12_get_next_ijk_U0_ap_start = ((ap_sync_reg_tdf12_get_next_ijk_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf12_readFilters82_U0_ap_continue = (ap_sync_channel_write_weight_vecs_1_1_0_0 & ap_sync_channel_write_weight_vecs_1_0_0_0 & ap_sync_channel_write_weight_vecs_0_1_0_0 & ap_sync_channel_write_weight_vecs_0_0_0_0);

assign tdf12_readFilters82_U0_ap_start = start_for_tdf12_readFilters82_U0_empty_n;

assign tdf12_readFilters82_U0_start_full_n = 1'b1;

assign tdf12_readFilters82_U0_start_write = 1'b0;

assign tdf12_readFilters82_U0_weight_vecs_0_0_0_0_full_n = weight_vecs_0_0_0_0_i_full_n;

assign tdf12_readFilters82_U0_weight_vecs_0_1_0_0_full_n = weight_vecs_0_1_0_0_i_full_n;

assign tdf12_readFilters82_U0_weight_vecs_1_0_0_0_full_n = weight_vecs_1_0_0_0_i_full_n;

assign tdf12_readFilters82_U0_weight_vecs_1_1_0_0_full_n = weight_vecs_1_1_0_0_i_full_n;

assign tdf12_readInputs_U0_ap_continue = (ap_sync_channel_write_ifmap_vec_1_0_0 & ap_sync_channel_write_ifmap_vec_0_0_0);

assign tdf12_readInputs_U0_ap_start = ((ap_sync_reg_tdf12_readInputs_U0_ap_ready ^ 1'b1) & ap_start);

assign tdf12_readInputs_U0_ifmap_vec_0_0_0_full_n = ifmap_vec_0_0_0_i_full_n;

assign tdf12_readInputs_U0_ifmap_vec_1_0_0_full_n = ifmap_vec_1_0_0_i_full_n;

assign tdf12_readInputs_U0_in_data_full_n = in_data_empty_n;

assign tdf12_readInputs_U0_in_data_write = 1'b0;

assign tdf12_readInputs_U0_start_full_n = 1'b1;

assign tdf12_readInputs_U0_start_write = 1'b0;

assign tdf12_writeOutputs_unaligned_U0_ap_continue = ap_continue;

assign tdf12_writeOutputs_unaligned_U0_ap_start = (outputs_1_empty_n & outputs_0_empty_n);

assign tdf12_writeOutputs_unaligned_U0_out_data_full_n = out_data_full_n;

assign tdf12_writeOutputs_unaligned_U0_out_data_write = 1'b0;

assign tdf12_writeOutputs_unaligned_U0_start_full_n = 1'b1;

assign tdf12_writeOutputs_unaligned_U0_start_write = 1'b0;

endmodule //td_fused_top_dataflow_in_loop_TOP_LOOP47680
module td_fused_top_start_for_tdf12_readFilters82_U0 (
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

td_fused_top_start_for_tdf12_readFilters82_U0_shiftReg 
U_td_fused_top_start_for_tdf12_readFilters82_U0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_start_for_tdf12_readFilters82_U0_shiftReg (
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
module td_fused_top_fifo_w16_d2_S_x9 (
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

td_fused_top_fifo_w16_d2_S_x9_shiftReg 
U_td_fused_top_fifo_w16_d2_S_x9_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w16_d2_S_x9_shiftReg (
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
module td_fused_top_fifo_w8_d8_S_x (
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
parameter DATA_WIDTH  = 32'd8;
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

td_fused_top_fifo_w8_d8_S_x_shiftReg 
U_td_fused_top_fifo_w8_d8_S_x_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w8_d8_S_x_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd8;
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
module td_fused_top_fifo_w4_d8_S_x0 (
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

td_fused_top_fifo_w4_d8_S_x0_shiftReg 
U_td_fused_top_fifo_w4_d8_S_x0_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w4_d8_S_x0_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd4;
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
module td_fused_top_fifo_w9_d8_S (
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
parameter DATA_WIDTH  = 32'd9;
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

td_fused_top_fifo_w9_d8_S_shiftReg 
U_td_fused_top_fifo_w9_d8_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w9_d8_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd9;
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
module td_fused_top_fifo_w9_d2_S (
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
parameter DATA_WIDTH  = 32'd9;
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

td_fused_top_fifo_w9_d2_S_shiftReg 
U_td_fused_top_fifo_w9_d2_S_ram (
    .clk(clk),
    .data(shiftReg_data),
    .ce(shiftReg_ce),
    .a(shiftReg_addr),
    .q(shiftReg_q)
);

endmodule  
module td_fused_top_fifo_w9_d2_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd9;
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
module td_fused_top_tdf12_writeOutputs_unaligned (
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
        p_read,
        p_read1,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

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
input  [15:0] p_read;
input  [15:0] p_read1;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg indices_01_read;
reg indices_12_read;
reg out_data_ce1;
reg out_data_we1;

reg    ap_done_reg;
  reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_3;
reg   [15:0] outputChanIdx_3;
reg   [15:0] outputRow_3_0;
reg   [15:0] outputRow_3_1;
reg   [15:0] outputRow_3_2;
reg   [15:0] outputRow_3_3;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg   [3:0] indices_01_read_reg_387;
reg   [7:0] indices_12_read_reg_393;
wire   [9:0] add_ln94_fu_189_p2;
reg   [9:0] add_ln94_reg_398;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [15:0] mul_ln89_fu_198_p2;
reg   [15:0] mul_ln89_reg_413;
wire   [1:0] add_ln85_fu_204_p2;
reg   [1:0] add_ln85_reg_418;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln88_fu_263_p2;
reg   [0:0] icmp_ln88_reg_429;
wire   [0:0] icmp_ln85_fu_210_p2;
reg   [1:0] o_reg_131;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln94_12_fu_301_p1;
wire   [15:0] select_ln97_fu_359_p3;
wire   [15:0] select_ln86_fu_220_p3;
wire   [1:0] trunc_ln86_1_fu_226_p1;
reg   [15:0] empty_fu_86;
wire   [15:0] add_ln87_fu_257_p2;
reg    ap_block_state1;
wire   [7:0] tmp_fu_154_p3;
wire   [4:0] tmp_s_fu_165_p3;
wire   [8:0] zext_ln94_fu_161_p1;
wire   [8:0] zext_ln94_9_fu_172_p1;
wire   [8:0] sub_ln94_fu_176_p2;
wire   [9:0] sub_ln94_cast_fu_182_p1;
wire   [9:0] zext_ln94_10_fu_186_p1;
wire   [8:0] mul_ln89_fu_198_p1;
wire   [0:0] trunc_ln86_fu_216_p1;
wire   [8:0] trunc_ln94_fu_288_p1;
wire   [15:0] zext_ln94_11_fu_292_p1;
wire   [15:0] add_ln94_4_fu_296_p2;
wire   [15:0] bitcast_ln94_12_fu_330_p1;
wire   [15:0] bitcast_ln94_11_fu_322_p1;
wire   [15:0] bitcast_ln94_10_fu_314_p1;
wire   [15:0] bitcast_ln94_fu_306_p1;
wire   [15:0] add_ln96_fu_347_p2;
wire   [0:0] icmp_ln97_fu_353_p2;
reg   [4:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 outputCount_3 = 16'd0;
#0 outputChanIdx_3 = 16'd0;
#0 outputRow_3_0 = 16'd0;
#0 outputRow_3_1 = 16'd0;
#0 outputRow_3_2 = 16'd0;
#0 outputRow_3_3 = 16'd0;
end

td_fused_top_mul_10s_9ns_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 16 ))
mul_10s_9ns_16_1_1_U1925(
    .din0(add_ln94_reg_398),
    .din1(mul_ln89_fu_198_p1),
    .dout(mul_ln89_fu_198_p2)
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
        end else if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_fu_86 <= outputCount_3;
    end else if (((icmp_ln85_fu_210_p2 == 1'd0) & (icmp_ln88_fu_263_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        empty_fu_86 <= add_ln87_fu_257_p2;
    end else if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        empty_fu_86 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        o_reg_131 <= add_ln85_reg_418;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        o_reg_131 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln85_reg_418 <= add_ln85_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln94_reg_398 <= add_ln94_fu_189_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        icmp_ln88_reg_429 <= icmp_ln88_fu_263_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_01_read_reg_387 <= indices_01_dout;
        indices_12_read_reg_393 <= indices_12_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        mul_ln89_reg_413 <= mul_ln89_fu_198_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        outputChanIdx_3 <= select_ln97_fu_359_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        outputCount_3 <= empty_fu_86;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd0))) begin
        outputRow_3_0 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd1))) begin
        outputRow_3_1 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd2))) begin
        outputRow_3_2 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd3))) begin
        outputRow_3_3 <= select_ln86_fu_220_p3;
    end
end

always @ (*) begin
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
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
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln85_fu_204_p2 = (o_reg_131 + 2'd1);

assign add_ln87_fu_257_p2 = (empty_fu_86 + 16'd1);

assign add_ln94_4_fu_296_p2 = (mul_ln89_reg_413 + zext_ln94_11_fu_292_p1);

assign add_ln94_fu_189_p2 = ((sub_ln94_cast_fu_182_p1) + (zext_ln94_10_fu_186_p1));

assign add_ln96_fu_347_p2 = (outputChanIdx_3 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign bitcast_ln94_10_fu_314_p1 = outputRow_3_1;

assign bitcast_ln94_11_fu_322_p1 = outputRow_3_2;

assign bitcast_ln94_12_fu_330_p1 = outputRow_3_3;

assign bitcast_ln94_fu_306_p1 = outputRow_3_0;

assign icmp_ln85_fu_210_p2 = ((o_reg_131 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln88_fu_263_p2 = ((add_ln87_fu_257_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_353_p2 = ((add_ln96_fu_347_p2 == 16'd250) ? 1'b1 : 1'b0);

assign mul_ln89_fu_198_p1 = 16'd250;

assign out_data_address1 = zext_ln94_12_fu_301_p1;

assign out_data_d1 = {{{{bitcast_ln94_12_fu_330_p1}, {bitcast_ln94_11_fu_322_p1}}, {bitcast_ln94_10_fu_314_p1}}, {bitcast_ln94_fu_306_p1}};

assign select_ln86_fu_220_p3 = ((trunc_ln86_fu_216_p1[0:0] == 1'b1) ? p_read1 : p_read);

assign select_ln97_fu_359_p3 = ((icmp_ln97_fu_353_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_347_p2);

assign sub_ln94_cast_fu_182_p1 = (sub_ln94_fu_176_p2);

assign sub_ln94_fu_176_p2 = (zext_ln94_fu_161_p1 - zext_ln94_9_fu_172_p1);

assign tmp_fu_154_p3 = {{indices_01_read_reg_387}, {4'd0}};

assign tmp_s_fu_165_p3 = {{indices_01_read_reg_387}, {1'd0}};

assign trunc_ln86_1_fu_226_p1 = empty_fu_86[1:0];

assign trunc_ln86_fu_216_p1 = o_reg_131[0:0];

assign trunc_ln94_fu_288_p1 = outputChanIdx_3[8:0];

assign zext_ln94_10_fu_186_p1 = indices_12_read_reg_393;

assign zext_ln94_11_fu_292_p1 = trunc_ln94_fu_288_p1;

assign zext_ln94_12_fu_301_p1 = add_ln94_4_fu_296_p2;

assign zext_ln94_9_fu_172_p1 = tmp_s_fu_165_p3;

assign zext_ln94_fu_161_p1 = tmp_fu_154_p3;

endmodule //td_fused_top_tdf12_writeOutputs_unaligned
module td_fused_top_mul_10s_9ns_16_1_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0 td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout )
);

endmodule
module td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0(a, b, p);
input[10 - 1 : 0] a; 
input[9 - 1 : 0] b; 
output[16 - 1 : 0] p;

assign p = (a) * ({1'b0, b});
endmodule
module td_fused_top_tdf12_adjust (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        sums_0_read,
        sums_1_read,
        adjustments_address0,
        adjustments_ce0,
        adjustments_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        ap_return_0,
        ap_return_1
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
output  [9:0] adjustments_address0;
output   adjustments_ce0;
input  [47:0] adjustments_q0;
input  [8:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg adjustments_ce0;
reg indices_23_read;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [1:0] o_reg_111;
reg   [15:0] outputs_0_05_reg_122;
reg   [15:0] outputs_1_04_reg_134;
reg   [8:0] indices_23_read_reg_281;
wire   [1:0] add_ln213_fu_158_p2;
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
wire   [0:0] icmp_ln213_fu_164_p2;
reg   [0:0] icmp_ln213_reg_291;
reg   [0:0] icmp_ln213_reg_291_pp0_iter1_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter2_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter3_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter4_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter5_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter6_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter7_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter8_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter9_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter10_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter11_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter12_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter13_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter14_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter15_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter16_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter17_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter18_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter19_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter20_reg;
reg   [0:0] icmp_ln213_reg_291_pp0_iter21_reg;
wire   [0:0] trunc_ln219_fu_170_p1;
reg   [0:0] trunc_ln219_reg_295;
reg   [0:0] trunc_ln219_reg_295_pp0_iter1_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter2_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter3_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter4_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter5_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter6_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter7_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter8_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter9_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter10_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter11_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter12_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter13_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter14_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter15_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter16_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter17_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter18_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter19_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter20_reg;
reg   [0:0] trunc_ln219_reg_295_pp0_iter21_reg;
wire   [15:0] trunc_ln220_fu_186_p1;
reg   [15:0] trunc_ln220_reg_307;
reg   [15:0] tmp_270_i_i_reg_312;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter2_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter3_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter4_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter5_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter6_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter7_reg;
reg   [15:0] tmp_270_i_i_reg_312_pp0_iter8_reg;
reg   [15:0] tmp_271_i_i_reg_317;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter2_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter3_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter4_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter5_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter6_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter7_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter8_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter9_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter10_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter11_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter12_reg;
reg   [15:0] tmp_271_i_i_reg_317_pp0_iter13_reg;
wire   [15:0] select_ln219_fu_210_p3;
reg   [15:0] select_ln219_reg_322;
wire   [15:0] grp_fu_150_p2;
reg   [15:0] sub_i_i_i_reg_332;
wire   [15:0] grp_fu_154_p2;
reg   [15:0] normalized_reg_342;
wire   [15:0] grp_fu_146_p2;
reg   [15:0] biased_reg_352;
wire   [15:0] select_ln223_fu_245_p3;
reg    ap_enable_reg_pp0_iter22;
wire   [15:0] select_ln223_25_fu_252_p3;
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
wire   [63:0] zext_ln220_fu_181_p1;
wire   [15:0] grp_fu_146_p1;
wire   [15:0] grp_fu_150_p1;
wire   [15:0] grp_fu_154_p1;
wire   [9:0] ochan_fu_174_p3;
wire   [15:0] data_V_fu_227_p1;
wire   [0:0] p_Result_s_fu_230_p3;
wire   [15:0] activated_fu_238_p3;
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
hadd_16ns_16ns_16_8_full_dsp_1_U1918(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(normalized_reg_342),
    .din1(grp_fu_146_p1),
    .dout(grp_fu_146_p2)
);

td_fused_top_hsub_16ns_16ns_16_7_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 7 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hsub_16ns_16ns_16_7_full_dsp_1_U1919(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(select_ln219_reg_322),
    .din1(grp_fu_150_p1),
    .dout(grp_fu_150_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1920(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sub_i_i_i_reg_332),
    .din1(grp_fu_154_p1),
    .dout(grp_fu_154_p2)
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
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter20 == 1'b0) & (1'b1 == ap_condition_pp0_exit_iter21_state23)) | (~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter21 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter22 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter21_state23))) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter20;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter22 <= ap_enable_reg_pp0_iter21;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((icmp_ln213_fu_164_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        o_reg_111 <= add_ln213_fu_158_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        o_reg_111 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln213_reg_291_pp0_iter20_reg == 1'd0))) begin
        biased_reg_352 <= grp_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln213_reg_291 <= icmp_ln213_fu_164_p2;
        icmp_ln213_reg_291_pp0_iter1_reg <= icmp_ln213_reg_291;
        trunc_ln219_reg_295_pp0_iter1_reg <= trunc_ln219_reg_295;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln213_reg_291_pp0_iter10_reg <= icmp_ln213_reg_291_pp0_iter9_reg;
        icmp_ln213_reg_291_pp0_iter11_reg <= icmp_ln213_reg_291_pp0_iter10_reg;
        icmp_ln213_reg_291_pp0_iter12_reg <= icmp_ln213_reg_291_pp0_iter11_reg;
        icmp_ln213_reg_291_pp0_iter13_reg <= icmp_ln213_reg_291_pp0_iter12_reg;
        icmp_ln213_reg_291_pp0_iter14_reg <= icmp_ln213_reg_291_pp0_iter13_reg;
        icmp_ln213_reg_291_pp0_iter15_reg <= icmp_ln213_reg_291_pp0_iter14_reg;
        icmp_ln213_reg_291_pp0_iter16_reg <= icmp_ln213_reg_291_pp0_iter15_reg;
        icmp_ln213_reg_291_pp0_iter17_reg <= icmp_ln213_reg_291_pp0_iter16_reg;
        icmp_ln213_reg_291_pp0_iter18_reg <= icmp_ln213_reg_291_pp0_iter17_reg;
        icmp_ln213_reg_291_pp0_iter19_reg <= icmp_ln213_reg_291_pp0_iter18_reg;
        icmp_ln213_reg_291_pp0_iter20_reg <= icmp_ln213_reg_291_pp0_iter19_reg;
        icmp_ln213_reg_291_pp0_iter21_reg <= icmp_ln213_reg_291_pp0_iter20_reg;
        icmp_ln213_reg_291_pp0_iter2_reg <= icmp_ln213_reg_291_pp0_iter1_reg;
        icmp_ln213_reg_291_pp0_iter3_reg <= icmp_ln213_reg_291_pp0_iter2_reg;
        icmp_ln213_reg_291_pp0_iter4_reg <= icmp_ln213_reg_291_pp0_iter3_reg;
        icmp_ln213_reg_291_pp0_iter5_reg <= icmp_ln213_reg_291_pp0_iter4_reg;
        icmp_ln213_reg_291_pp0_iter6_reg <= icmp_ln213_reg_291_pp0_iter5_reg;
        icmp_ln213_reg_291_pp0_iter7_reg <= icmp_ln213_reg_291_pp0_iter6_reg;
        icmp_ln213_reg_291_pp0_iter8_reg <= icmp_ln213_reg_291_pp0_iter7_reg;
        icmp_ln213_reg_291_pp0_iter9_reg <= icmp_ln213_reg_291_pp0_iter8_reg;
        tmp_270_i_i_reg_312_pp0_iter2_reg <= tmp_270_i_i_reg_312;
        tmp_270_i_i_reg_312_pp0_iter3_reg <= tmp_270_i_i_reg_312_pp0_iter2_reg;
        tmp_270_i_i_reg_312_pp0_iter4_reg <= tmp_270_i_i_reg_312_pp0_iter3_reg;
        tmp_270_i_i_reg_312_pp0_iter5_reg <= tmp_270_i_i_reg_312_pp0_iter4_reg;
        tmp_270_i_i_reg_312_pp0_iter6_reg <= tmp_270_i_i_reg_312_pp0_iter5_reg;
        tmp_270_i_i_reg_312_pp0_iter7_reg <= tmp_270_i_i_reg_312_pp0_iter6_reg;
        tmp_270_i_i_reg_312_pp0_iter8_reg <= tmp_270_i_i_reg_312_pp0_iter7_reg;
        tmp_271_i_i_reg_317_pp0_iter10_reg <= tmp_271_i_i_reg_317_pp0_iter9_reg;
        tmp_271_i_i_reg_317_pp0_iter11_reg <= tmp_271_i_i_reg_317_pp0_iter10_reg;
        tmp_271_i_i_reg_317_pp0_iter12_reg <= tmp_271_i_i_reg_317_pp0_iter11_reg;
        tmp_271_i_i_reg_317_pp0_iter13_reg <= tmp_271_i_i_reg_317_pp0_iter12_reg;
        tmp_271_i_i_reg_317_pp0_iter2_reg <= tmp_271_i_i_reg_317;
        tmp_271_i_i_reg_317_pp0_iter3_reg <= tmp_271_i_i_reg_317_pp0_iter2_reg;
        tmp_271_i_i_reg_317_pp0_iter4_reg <= tmp_271_i_i_reg_317_pp0_iter3_reg;
        tmp_271_i_i_reg_317_pp0_iter5_reg <= tmp_271_i_i_reg_317_pp0_iter4_reg;
        tmp_271_i_i_reg_317_pp0_iter6_reg <= tmp_271_i_i_reg_317_pp0_iter5_reg;
        tmp_271_i_i_reg_317_pp0_iter7_reg <= tmp_271_i_i_reg_317_pp0_iter6_reg;
        tmp_271_i_i_reg_317_pp0_iter8_reg <= tmp_271_i_i_reg_317_pp0_iter7_reg;
        tmp_271_i_i_reg_317_pp0_iter9_reg <= tmp_271_i_i_reg_317_pp0_iter8_reg;
        trunc_ln219_reg_295_pp0_iter10_reg <= trunc_ln219_reg_295_pp0_iter9_reg;
        trunc_ln219_reg_295_pp0_iter11_reg <= trunc_ln219_reg_295_pp0_iter10_reg;
        trunc_ln219_reg_295_pp0_iter12_reg <= trunc_ln219_reg_295_pp0_iter11_reg;
        trunc_ln219_reg_295_pp0_iter13_reg <= trunc_ln219_reg_295_pp0_iter12_reg;
        trunc_ln219_reg_295_pp0_iter14_reg <= trunc_ln219_reg_295_pp0_iter13_reg;
        trunc_ln219_reg_295_pp0_iter15_reg <= trunc_ln219_reg_295_pp0_iter14_reg;
        trunc_ln219_reg_295_pp0_iter16_reg <= trunc_ln219_reg_295_pp0_iter15_reg;
        trunc_ln219_reg_295_pp0_iter17_reg <= trunc_ln219_reg_295_pp0_iter16_reg;
        trunc_ln219_reg_295_pp0_iter18_reg <= trunc_ln219_reg_295_pp0_iter17_reg;
        trunc_ln219_reg_295_pp0_iter19_reg <= trunc_ln219_reg_295_pp0_iter18_reg;
        trunc_ln219_reg_295_pp0_iter20_reg <= trunc_ln219_reg_295_pp0_iter19_reg;
        trunc_ln219_reg_295_pp0_iter21_reg <= trunc_ln219_reg_295_pp0_iter20_reg;
        trunc_ln219_reg_295_pp0_iter2_reg <= trunc_ln219_reg_295_pp0_iter1_reg;
        trunc_ln219_reg_295_pp0_iter3_reg <= trunc_ln219_reg_295_pp0_iter2_reg;
        trunc_ln219_reg_295_pp0_iter4_reg <= trunc_ln219_reg_295_pp0_iter3_reg;
        trunc_ln219_reg_295_pp0_iter5_reg <= trunc_ln219_reg_295_pp0_iter4_reg;
        trunc_ln219_reg_295_pp0_iter6_reg <= trunc_ln219_reg_295_pp0_iter5_reg;
        trunc_ln219_reg_295_pp0_iter7_reg <= trunc_ln219_reg_295_pp0_iter6_reg;
        trunc_ln219_reg_295_pp0_iter8_reg <= trunc_ln219_reg_295_pp0_iter7_reg;
        trunc_ln219_reg_295_pp0_iter9_reg <= trunc_ln219_reg_295_pp0_iter8_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_23_read_reg_281 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln213_reg_291_pp0_iter12_reg == 1'd0))) begin
        normalized_reg_342 <= grp_fu_154_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter22 == 1'b1) & (icmp_ln213_reg_291_pp0_iter21_reg == 1'd0))) begin
        outputs_0_05_reg_122 <= select_ln223_fu_245_p3;
        outputs_1_04_reg_134 <= select_ln223_25_fu_252_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_reg_291 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln219_reg_322 <= select_ln219_fu_210_p3;
        tmp_270_i_i_reg_312 <= {{adjustments_q0[31:16]}};
        tmp_271_i_i_reg_317 <= {{adjustments_q0[47:32]}};
        trunc_ln220_reg_307 <= trunc_ln220_fu_186_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln213_reg_291_pp0_iter7_reg == 1'd0))) begin
        sub_i_i_i_reg_332 <= grp_fu_150_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln213_fu_164_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln219_reg_295 <= trunc_ln219_fu_170_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((icmp_ln213_fu_164_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter21 == 1'b1) & (ap_enable_reg_pp0_iter20 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter21 == 1'b1) & (ap_enable_reg_pp0_iter20 == 1'b0))) begin
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

assign activated_fu_238_p3 = ((p_Result_s_fu_230_p3[0:0] == 1'b1) ? 16'd0 : biased_reg_352);

assign add_ln213_fu_158_p2 = (o_reg_111 + 2'd1);

assign adjustments_address0 = zext_ln220_fu_181_p1;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state25 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
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

assign ap_return_0 = outputs_0_05_reg_122;

assign ap_return_1 = outputs_1_04_reg_134;

assign data_V_fu_227_p1 = biased_reg_352;

assign grp_fu_146_p1 = tmp_271_i_i_reg_317_pp0_iter13_reg;

assign grp_fu_150_p1 = trunc_ln220_reg_307;

assign grp_fu_154_p1 = tmp_270_i_i_reg_312_pp0_iter8_reg;

assign icmp_ln213_fu_164_p2 = ((o_reg_111 == 2'd2) ? 1'b1 : 1'b0);

assign ochan_fu_174_p3 = {{indices_23_read_reg_281}, {trunc_ln219_fu_170_p1}};

assign p_Result_s_fu_230_p3 = data_V_fu_227_p1[32'd15];

assign select_ln219_fu_210_p3 = ((trunc_ln219_reg_295[0:0] == 1'b1) ? sums_1_read : sums_0_read);

assign select_ln223_25_fu_252_p3 = ((trunc_ln219_reg_295_pp0_iter21_reg[0:0] == 1'b1) ? activated_fu_238_p3 : outputs_1_04_reg_134);

assign select_ln223_fu_245_p3 = ((trunc_ln219_reg_295_pp0_iter21_reg[0:0] == 1'b1) ? outputs_0_05_reg_122 : activated_fu_238_p3);

assign trunc_ln219_fu_170_p1 = o_reg_111[0:0];

assign trunc_ln220_fu_186_p1 = adjustments_q0[15:0];

assign zext_ln220_fu_181_p1 = ochan_fu_174_p3;

endmodule //td_fused_top_tdf12_adjust
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
module td_fused_top_Block_entry_proc_proc574 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tmp_272,
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
input  [15:0] tmp_272;
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
            ap_return_preg <= tmp_272;
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
        ap_return = tmp_272;
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

endmodule //td_fused_top_Block_entry_proc_proc574
module td_fused_top_tdf12_accum_3_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_38,
        accum_in_38_ap_vld,
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
output  [15:0] accum_in_38;
output   accum_in_38_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_38;
reg accum_in_38_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln87_fu_73_p2;
reg   [3:0] add_ln87_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln87_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln87_fu_79_p1;
reg   [15:0] accum_in_38_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_38_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1914(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_38_preg <= 16'd0;
    end else begin
        if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_38_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln87_reg_90;
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
        add_ln87_reg_90 <= add_ln87_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_38 = sum_01_reg_55;
    end else begin
        accum_in_38 = accum_in_38_preg;
    end
end

always @ (*) begin
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_38_ap_vld = 1'b1;
    end else begin
        accum_in_38_ap_vld = 1'b0;
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
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign accum_in_address0 = zext_ln87_fu_79_p1;

assign add_ln87_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln87_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln87_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf12_accum_3_1
module td_fused_top_Block_entry_proc_proc573 (
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

endmodule //td_fused_top_Block_entry_proc_proc573
module td_fused_top_tdf12_accum_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        accum_in_40,
        accum_in_40_ap_vld,
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
output  [15:0] accum_in_40;
output   accum_in_40_ap_vld;
output  [2:0] accum_in_address0;
output   accum_in_ce0;
input  [15:0] accum_in_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[15:0] accum_in_40;
reg accum_in_40_ap_vld;
reg accum_in_ce0;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln87_fu_73_p2;
reg   [3:0] add_ln87_reg_90;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln87_fu_84_p2;
reg   [15:0] accum_in_load_reg_103;
wire    ap_CS_fsm_state3;
wire   [15:0] grp_fu_68_p2;
wire    ap_CS_fsm_state11;
reg   [3:0] i_1_1_reg_44;
reg    ap_block_state1;
reg   [15:0] sum_01_reg_55;
wire   [63:0] zext_ln87_fu_79_p1;
reg   [15:0] accum_in_40_preg;
wire    ap_CS_fsm_state4;
reg   [10:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 accum_in_40_preg = 16'd0;
end

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1910(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(sum_01_reg_55),
    .din1(accum_in_load_reg_103),
    .dout(grp_fu_68_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        accum_in_40_preg <= 16'd0;
    end else begin
        if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            accum_in_40_preg <= sum_01_reg_55;
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
        end else if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1_1_reg_44 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        i_1_1_reg_44 <= add_ln87_reg_90;
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
        add_ln87_reg_90 <= add_ln87_fu_73_p2;
    end
end

always @ (*) begin
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_40 = sum_01_reg_55;
    end else begin
        accum_in_40 = accum_in_40_preg;
    end
end

always @ (*) begin
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        accum_in_40_ap_vld = 1'b1;
    end else begin
        accum_in_40_ap_vld = 1'b0;
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
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if (((icmp_ln87_fu_84_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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

assign accum_in_address0 = zext_ln87_fu_79_p1;

assign add_ln87_fu_73_p2 = (i_1_1_reg_44 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign icmp_ln87_fu_84_p2 = ((i_1_1_reg_44 == 4'd8) ? 1'b1 : 1'b0);

assign zext_ln87_fu_79_p1 = i_1_1_reg_44;

endmodule //td_fused_top_tdf12_accum_3
module td_fused_top_tdf12_accum_2 (
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
wire   [3:0] add_ln74_fu_82_p2;
reg   [3:0] add_ln74_reg_121;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] icmp_ln60_fu_88_p2;
reg   [0:0] icmp_ln60_reg_126;
reg   [0:0] icmp_ln60_reg_126_pp0_iter1_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter2_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter3_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter4_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter5_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter6_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter7_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter8_reg;
reg   [0:0] icmp_ln60_reg_126_pp0_iter9_reg;
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
wire   [63:0] zext_ln70_fu_100_p1;
wire   [63:0] zext_ln70_2_fu_111_p1;
wire   [63:0] zext_ln60_fu_116_p1;
wire   [3:0] i_12_fu_94_p2;
wire   [3:0] or_ln70_fu_105_p2;
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
hadd_16ns_16ns_16_8_full_dsp_1_U1907(
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
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln60_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_idx_reg_66 <= add_ln74_reg_121;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln60_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        accum_in_load_1_reg_145 <= accum_in_q0;
        accum_in_load_reg_140 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln74_reg_121 <= add_ln74_fu_82_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln60_reg_126 <= icmp_ln60_fu_88_p2;
        icmp_ln60_reg_126_pp0_iter1_reg <= icmp_ln60_reg_126;
        out_idx_reg_66_pp0_iter1_reg <= out_idx_reg_66;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln60_reg_126_pp0_iter2_reg <= icmp_ln60_reg_126_pp0_iter1_reg;
        icmp_ln60_reg_126_pp0_iter3_reg <= icmp_ln60_reg_126_pp0_iter2_reg;
        icmp_ln60_reg_126_pp0_iter4_reg <= icmp_ln60_reg_126_pp0_iter3_reg;
        icmp_ln60_reg_126_pp0_iter5_reg <= icmp_ln60_reg_126_pp0_iter4_reg;
        icmp_ln60_reg_126_pp0_iter6_reg <= icmp_ln60_reg_126_pp0_iter5_reg;
        icmp_ln60_reg_126_pp0_iter7_reg <= icmp_ln60_reg_126_pp0_iter6_reg;
        icmp_ln60_reg_126_pp0_iter8_reg <= icmp_ln60_reg_126_pp0_iter7_reg;
        icmp_ln60_reg_126_pp0_iter9_reg <= icmp_ln60_reg_126_pp0_iter8_reg;
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
    if (((icmp_ln60_reg_126_pp0_iter8_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
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
    if (((icmp_ln60_reg_126_pp0_iter9_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln60_fu_88_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln60_reg_126 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_out_idx_phi_fu_70_p4 = add_ln74_reg_121;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln60_fu_88_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln60_fu_88_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter10 == 1'b1) & (ap_enable_reg_pp0_iter9 == 1'b0)))) begin
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

assign accum_in_address0 = zext_ln70_2_fu_111_p1;

assign accum_in_address1 = zext_ln70_fu_100_p1;

assign accum_out_address0 = zext_ln60_fu_116_p1;

assign accum_out_d0 = sum0_reg_150;

assign add_ln74_fu_82_p2 = (ap_phi_mux_out_idx_phi_fu_70_p4 + 4'd1);

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

assign icmp_ln60_fu_88_p2 = ((ap_phi_mux_out_idx_phi_fu_70_p4 == 4'd8) ? 1'b1 : 1'b0);

assign or_ln70_fu_105_p2 = (i_12_fu_94_p2 | 4'd1);

assign zext_ln60_fu_116_p1 = out_idx_reg_66_pp0_iter9_reg;

assign zext_ln70_2_fu_111_p1 = or_ln70_fu_105_p2;

assign zext_ln70_fu_100_p1 = i_12_fu_94_p2;

endmodule //td_fused_top_tdf12_accum_2
module td_fused_top_tdf12_accum_1 (
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
reg[5:0] accum_in_address0;
reg accum_in_ce0;
reg[5:0] accum_in_address1;
reg accum_in_ce1;
reg[5:0] accum_in1_address0;
reg accum_in1_ce0;
reg[5:0] accum_in1_address1;
reg accum_in1_ce1;
reg accum_out_ce0;
reg accum_out_we0;
reg accum_out_ce1;
reg accum_out_we1;

reg    ap_done_reg;
  reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] x_reg_263;
reg   [15:0] psum_2_03_reg_274;
reg   [15:0] psum_1_02_reg_286;
reg   [15:0] psum_0_01_reg_298;
reg   [15:0] psum_15_016_reg_310;
reg   [15:0] psum_14_015_reg_322;
reg   [15:0] psum_13_014_reg_334;
reg   [15:0] psum_12_013_reg_346;
reg   [15:0] psum_11_012_reg_358;
reg   [15:0] psum_10_011_reg_370;
reg   [15:0] psum_9_010_reg_382;
reg   [15:0] psum_8_09_reg_394;
reg   [15:0] psum_7_08_reg_406;
reg   [15:0] psum_6_07_reg_418;
reg   [15:0] psum_5_06_reg_430;
reg   [15:0] psum_4_05_reg_442;
reg   [15:0] psum_3_04_reg_454;
wire   [0:0] tmp_fu_535_p3;
reg   [0:0] tmp_reg_776;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state9_pp0_stage0_iter1;
wire    ap_block_state16_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_reg_776_pp0_iter1_reg;
wire   [7:0] add_ln25_fu_543_p2;
reg   [7:0] add_ln25_reg_780;
reg    ap_enable_reg_pp0_iter0;
wire   [5:0] lshr_ln_fu_549_p4;
reg   [5:0] lshr_ln_reg_785;
reg   [15:0] accum_in_load_reg_815;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state10_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
reg   [15:0] accum_in1_load_reg_820;
reg   [15:0] accum_in_load_36_reg_825;
reg   [15:0] accum_in1_load_22_reg_830;
reg   [15:0] accum_in_load_37_reg_855;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state11_pp0_stage2_iter1;
wire    ap_block_pp0_stage2_11001;
reg   [15:0] accum_in1_load_23_reg_860;
reg   [15:0] accum_in_load_38_reg_865;
reg   [15:0] accum_in1_load_24_reg_870;
reg   [15:0] accum_in_load_39_reg_895;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage3_iter0;
wire    ap_block_state12_pp0_stage3_iter1;
wire    ap_block_pp0_stage3_11001;
reg   [15:0] accum_in1_load_25_reg_900;
reg   [15:0] accum_in_load_40_reg_905;
reg   [15:0] accum_in1_load_26_reg_910;
reg   [15:0] accum_in_load_41_reg_935;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state6_pp0_stage4_iter0;
wire    ap_block_state13_pp0_stage4_iter1;
wire    ap_block_pp0_stage4_11001;
reg   [15:0] accum_in1_load_27_reg_940;
reg   [15:0] accum_in_load_42_reg_945;
reg   [15:0] accum_in1_load_28_reg_950;
wire   [15:0] grp_fu_507_p2;
reg    ap_enable_reg_pp0_iter1;
wire   [15:0] grp_fu_512_p2;
wire   [15:0] grp_fu_517_p2;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state7_pp0_stage5_iter0;
wire    ap_block_state14_pp0_stage5_iter1;
wire    ap_block_pp0_stage5_11001;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state8_pp0_stage6_iter0;
wire    ap_block_state15_pp0_stage6_iter1;
wire    ap_block_pp0_stage6_11001;
reg    ap_enable_reg_pp0_iter2;
wire   [4:0] add_ln33_fu_660_p2;
wire    ap_CS_fsm_state18;
wire   [0:0] tmp_81_fu_643_p3;
reg    ap_block_state1;
wire    ap_block_pp0_stage3_subdone;
reg    ap_condition_pp0_exit_iter0_state5;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_pp0_stage0_subdone;
reg   [7:0] ap_phi_mux_x_phi_fu_267_p4;
wire    ap_block_pp0_stage0;
wire    ap_block_pp0_stage2;
wire   [15:0] ap_phi_mux_psum_15_016_phi_fu_314_p4;
wire   [15:0] ap_phi_mux_psum_14_015_phi_fu_326_p4;
wire    ap_block_pp0_stage6;
wire   [15:0] ap_phi_mux_psum_13_014_phi_fu_338_p4;
wire   [15:0] ap_phi_mux_psum_12_013_phi_fu_350_p4;
wire   [15:0] ap_phi_mux_psum_11_012_phi_fu_362_p4;
wire    ap_block_pp0_stage5;
wire   [15:0] ap_phi_mux_psum_10_011_phi_fu_374_p4;
wire   [15:0] ap_phi_mux_psum_9_010_phi_fu_386_p4;
wire   [15:0] ap_phi_mux_psum_8_09_phi_fu_398_p4;
wire    ap_block_pp0_stage4;
wire   [15:0] ap_phi_mux_psum_7_08_phi_fu_410_p4;
wire   [15:0] ap_phi_mux_psum_6_07_phi_fu_422_p4;
wire   [15:0] ap_phi_mux_psum_5_06_phi_fu_434_p4;
wire    ap_block_pp0_stage3;
wire   [15:0] ap_phi_mux_psum_4_05_phi_fu_446_p4;
wire   [15:0] ap_phi_mux_psum_3_04_phi_fu_458_p4;
reg   [4:0] q_reg_466;
wire    ap_CS_fsm_state17;
reg   [15:0] ap_phi_mux_phi_ln45_phi_fu_480_p16;
wire   [3:0] trunc_ln33_fu_656_p1;
wire   [63:0] zext_ln29_fu_559_p1;
wire   [63:0] zext_ln29_22_fu_571_p1;
wire   [63:0] zext_ln29_23_fu_582_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln29_24_fu_593_p1;
wire   [63:0] zext_ln29_25_fu_604_p1;
wire   [63:0] zext_ln29_26_fu_615_p1;
wire   [63:0] zext_ln29_27_fu_626_p1;
wire   [63:0] zext_ln29_28_fu_637_p1;
wire   [63:0] zext_ln33_fu_651_p1;
wire   [63:0] zext_ln33_4_fu_672_p1;
reg   [15:0] grp_fu_507_p0;
reg   [15:0] grp_fu_507_p1;
reg   [15:0] grp_fu_512_p0;
reg   [15:0] grp_fu_512_p1;
reg   [15:0] grp_fu_517_p0;
reg   [15:0] grp_fu_517_p1;
wire   [5:0] or_ln29_fu_565_p2;
wire   [5:0] or_ln29_19_fu_577_p2;
wire   [5:0] or_ln29_20_fu_588_p2;
wire   [5:0] or_ln29_21_fu_599_p2;
wire   [5:0] or_ln29_22_fu_610_p2;
wire   [5:0] or_ln29_23_fu_621_p2;
wire   [5:0] or_ln29_24_fu_632_p2;
wire   [3:0] or_ln33_fu_666_p2;
wire   [0:0] icmp_ln45_fu_677_p2;
wire   [0:0] icmp_ln45_7_fu_691_p2;
wire   [15:0] select_ln45_fu_683_p3;
wire   [0:0] icmp_ln45_8_fu_705_p2;
wire   [15:0] select_ln45_7_fu_697_p3;
wire   [0:0] icmp_ln45_9_fu_719_p2;
wire   [15:0] select_ln45_8_fu_711_p3;
wire   [0:0] icmp_ln45_10_fu_733_p2;
wire   [15:0] select_ln45_9_fu_725_p3;
wire   [0:0] icmp_ln45_11_fu_747_p2;
wire   [15:0] select_ln45_10_fu_739_p3;
wire   [0:0] icmp_ln45_12_fu_761_p2;
wire   [15:0] select_ln45_11_fu_753_p3;
wire    ap_CS_fsm_state19;
reg   [10:0] ap_NS_fsm;
wire    ap_block_pp0_stage1_subdone;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_pp0_stage5_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_726;
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
hadd_16ns_16ns_16_8_full_dsp_1_U1901(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_507_p0),
    .din1(grp_fu_507_p1),
    .dout(grp_fu_507_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1902(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_512_p0),
    .din1(grp_fu_512_p1),
    .dout(grp_fu_512_p2)
);

td_fused_top_hadd_16ns_16ns_16_8_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 8 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hadd_16ns_16ns_16_8_full_dsp_1_U1903(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(grp_fu_517_p0),
    .din1(grp_fu_517_p1),
    .dout(grp_fu_517_p2)
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
        q_reg_466 <= 5'd0;
    end else if (((tmp_81_fu_643_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        q_reg_466 <= add_ln33_fu_660_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_776 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        x_reg_263 <= add_ln25_reg_780;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        x_reg_263 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_776 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        accum_in1_load_22_reg_830 <= accum_in1_q0;
        accum_in1_load_reg_820 <= accum_in1_q1;
        accum_in_load_36_reg_825 <= accum_in_q0;
        accum_in_load_reg_815 <= accum_in_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_776 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        accum_in1_load_23_reg_860 <= accum_in1_q1;
        accum_in1_load_24_reg_870 <= accum_in1_q0;
        accum_in_load_37_reg_855 <= accum_in_q1;
        accum_in_load_38_reg_865 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_776 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        accum_in1_load_25_reg_900 <= accum_in1_q1;
        accum_in1_load_26_reg_910 <= accum_in1_q0;
        accum_in_load_39_reg_895 <= accum_in_q1;
        accum_in_load_40_reg_905 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_reg_776 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        accum_in1_load_27_reg_940 <= accum_in1_q1;
        accum_in1_load_28_reg_950 <= accum_in1_q0;
        accum_in_load_41_reg_935 <= accum_in_q1;
        accum_in_load_42_reg_945 <= accum_in_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_535_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln25_reg_780 <= add_ln25_fu_543_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_535_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        lshr_ln_reg_785 <= {{ap_phi_mux_x_phi_fu_267_p4[6:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage2_11001))) begin
        psum_0_01_reg_298 <= grp_fu_507_p2;
        psum_1_02_reg_286 <= grp_fu_512_p2;
        psum_2_03_reg_274 <= grp_fu_517_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage5) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage5_11001))) begin
        psum_10_011_reg_370 <= grp_fu_512_p2;
        psum_11_012_reg_358 <= grp_fu_517_p2;
        psum_9_010_reg_382 <= grp_fu_507_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage6) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage6_11001))) begin
        psum_12_013_reg_346 <= grp_fu_507_p2;
        psum_13_014_reg_334 <= grp_fu_512_p2;
        psum_14_015_reg_322 <= grp_fu_517_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        psum_15_016_reg_310 <= grp_fu_507_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001))) begin
        psum_3_04_reg_454 <= grp_fu_507_p2;
        psum_4_05_reg_442 <= grp_fu_512_p2;
        psum_5_06_reg_430 <= grp_fu_517_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage4) & (tmp_reg_776_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage4_11001))) begin
        psum_6_07_reg_418 <= grp_fu_507_p2;
        psum_7_08_reg_406 <= grp_fu_512_p2;
        psum_8_09_reg_394 <= grp_fu_517_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_776 <= ap_phi_mux_x_phi_fu_267_p4[32'd7];
        tmp_reg_776_pp0_iter1_reg <= tmp_reg_776;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            accum_in1_address0 = zext_ln29_28_fu_637_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address0 = zext_ln29_26_fu_615_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address0 = zext_ln29_24_fu_593_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address0 = zext_ln29_22_fu_571_p1;
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
            accum_in1_address1 = zext_ln29_27_fu_626_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in1_address1 = zext_ln29_25_fu_604_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in1_address1 = zext_ln29_23_fu_582_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in1_address1 = zext_ln29_fu_559_p1;
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
            accum_in_address0 = zext_ln29_28_fu_637_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address0 = zext_ln29_26_fu_615_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address0 = zext_ln29_24_fu_593_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address0 = zext_ln29_22_fu_571_p1;
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
            accum_in_address1 = zext_ln29_27_fu_626_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            accum_in_address1 = zext_ln29_25_fu_604_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            accum_in_address1 = zext_ln29_23_fu_582_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            accum_in_address1 = zext_ln29_fu_559_p1;
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
    if (((tmp_81_fu_643_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        accum_out_we0 = 1'b1;
    end else begin
        accum_out_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_81_fu_643_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        accum_out_we1 = 1'b1;
    end else begin
        accum_out_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_reg_776 == 1'd1)) begin
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
    if (((tmp_81_fu_643_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
        if ((trunc_ln33_fu_656_p1 == 4'd0)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_0_01_reg_298;
        end else if ((1'b1 == ap_condition_726)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_14_015_reg_322;
        end else if ((trunc_ln33_fu_656_p1 == 4'd12)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_12_013_reg_346;
        end else if ((trunc_ln33_fu_656_p1 == 4'd10)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_10_011_reg_370;
        end else if ((trunc_ln33_fu_656_p1 == 4'd8)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_8_09_reg_394;
        end else if ((trunc_ln33_fu_656_p1 == 4'd6)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_6_07_reg_418;
        end else if ((trunc_ln33_fu_656_p1 == 4'd4)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_4_05_reg_442;
        end else if ((trunc_ln33_fu_656_p1 == 4'd2)) begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = psum_2_03_reg_274;
        end else begin
            ap_phi_mux_phi_ln45_phi_fu_480_p16 = 'bx;
        end
    end else begin
        ap_phi_mux_phi_ln45_phi_fu_480_p16 = 'bx;
    end
end

always @ (*) begin
    if (((tmp_reg_776 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_x_phi_fu_267_p4 = add_ln25_reg_780;
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
        grp_fu_507_p0 = ap_phi_mux_psum_15_016_phi_fu_314_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_507_p0 = ap_phi_mux_psum_12_013_phi_fu_350_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_507_p0 = ap_phi_mux_psum_9_010_phi_fu_386_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_507_p0 = ap_phi_mux_psum_6_07_phi_fu_422_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_507_p0 = ap_phi_mux_psum_3_04_phi_fu_458_p4;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_507_p0 = grp_fu_507_p2;
    end else begin
        grp_fu_507_p0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        grp_fu_507_p1 = accum_in1_load_28_reg_950;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage6) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage6))) begin
        grp_fu_507_p1 = accum_in_load_41_reg_935;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage5))) begin
        grp_fu_507_p1 = accum_in1_load_25_reg_900;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage4))) begin
        grp_fu_507_p1 = accum_in_load_38_reg_865;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3))) begin
        grp_fu_507_p1 = accum_in1_load_22_reg_830;
    end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage2))) begin
        grp_fu_507_p1 = accum_in_load_reg_815;
    end else begin
        grp_fu_507_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_512_p0 = ap_phi_mux_psum_13_014_phi_fu_338_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_512_p0 = ap_phi_mux_psum_10_011_phi_fu_374_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_512_p0 = ap_phi_mux_psum_7_08_phi_fu_410_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_512_p0 = ap_phi_mux_psum_4_05_phi_fu_446_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_512_p0 = grp_fu_512_p2;
        end else begin
            grp_fu_512_p0 = 'bx;
        end
    end else begin
        grp_fu_512_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_512_p1 = accum_in1_load_27_reg_940;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_512_p1 = accum_in_load_40_reg_905;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_512_p1 = accum_in1_load_24_reg_870;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_512_p1 = accum_in_load_37_reg_855;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_512_p1 = accum_in1_load_reg_820;
        end else begin
            grp_fu_512_p1 = 'bx;
        end
    end else begin
        grp_fu_512_p1 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_517_p0 = ap_phi_mux_psum_14_015_phi_fu_326_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_517_p0 = ap_phi_mux_psum_11_012_phi_fu_362_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_517_p0 = ap_phi_mux_psum_8_09_phi_fu_398_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_517_p0 = ap_phi_mux_psum_5_06_phi_fu_434_p4;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_517_p0 = grp_fu_517_p2;
        end else begin
            grp_fu_517_p0 = 'bx;
        end
    end else begin
        grp_fu_517_p0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage6) & (1'b0 == ap_block_pp0_stage6))) begin
            grp_fu_517_p1 = accum_in_load_42_reg_945;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage5) & (1'b0 == ap_block_pp0_stage5))) begin
            grp_fu_517_p1 = accum_in1_load_26_reg_910;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage4) & (1'b0 == ap_block_pp0_stage4))) begin
            grp_fu_517_p1 = accum_in_load_39_reg_895;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage3) & (1'b0 == ap_block_pp0_stage3))) begin
            grp_fu_517_p1 = accum_in1_load_23_reg_860;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage2) & (1'b0 == ap_block_pp0_stage2))) begin
            grp_fu_517_p1 = accum_in_load_36_reg_825;
        end else begin
            grp_fu_517_p1 = 'bx;
        end
    end else begin
        grp_fu_517_p1 = 'bx;
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
            if ((~((tmp_reg_776 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone)) & (1'b0 == ap_block_pp0_stage3_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else if (((tmp_reg_776 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage3_subdone))) begin
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
            if (((tmp_81_fu_643_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state18))) begin
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

assign accum_out_address0 = zext_ln33_4_fu_672_p1;

assign accum_out_address1 = zext_ln33_fu_651_p1;

assign accum_out_d0 = ((icmp_ln45_12_fu_761_p2[0:0] == 1'b1) ? psum_13_014_reg_334 : select_ln45_11_fu_753_p3);

assign accum_out_d1 = ap_phi_mux_phi_ln45_phi_fu_480_p16;

assign add_ln25_fu_543_p2 = (ap_phi_mux_x_phi_fu_267_p4 + 8'd16);

assign add_ln33_fu_660_p2 = (q_reg_466 + 5'd2);

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
    ap_condition_726 = (~(trunc_ln33_fu_656_p1 == 4'd0) & ~(trunc_ln33_fu_656_p1 == 4'd12) & ~(trunc_ln33_fu_656_p1 == 4'd10) & ~(trunc_ln33_fu_656_p1 == 4'd8) & ~(trunc_ln33_fu_656_p1 == 4'd6) & ~(trunc_ln33_fu_656_p1 == 4'd4) & ~(trunc_ln33_fu_656_p1 == 4'd2));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_mux_psum_10_011_phi_fu_374_p4 = grp_fu_512_p2;

assign ap_phi_mux_psum_11_012_phi_fu_362_p4 = grp_fu_517_p2;

assign ap_phi_mux_psum_12_013_phi_fu_350_p4 = grp_fu_507_p2;

assign ap_phi_mux_psum_13_014_phi_fu_338_p4 = grp_fu_512_p2;

assign ap_phi_mux_psum_14_015_phi_fu_326_p4 = grp_fu_517_p2;

assign ap_phi_mux_psum_15_016_phi_fu_314_p4 = grp_fu_507_p2;

assign ap_phi_mux_psum_3_04_phi_fu_458_p4 = grp_fu_507_p2;

assign ap_phi_mux_psum_4_05_phi_fu_446_p4 = grp_fu_512_p2;

assign ap_phi_mux_psum_5_06_phi_fu_434_p4 = grp_fu_517_p2;

assign ap_phi_mux_psum_6_07_phi_fu_422_p4 = grp_fu_507_p2;

assign ap_phi_mux_psum_7_08_phi_fu_410_p4 = grp_fu_512_p2;

assign ap_phi_mux_psum_8_09_phi_fu_398_p4 = grp_fu_517_p2;

assign ap_phi_mux_psum_9_010_phi_fu_386_p4 = grp_fu_507_p2;

assign icmp_ln45_10_fu_733_p2 = ((or_ln33_fu_666_p2 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln45_11_fu_747_p2 = ((or_ln33_fu_666_p2 == 4'd11) ? 1'b1 : 1'b0);

assign icmp_ln45_12_fu_761_p2 = ((or_ln33_fu_666_p2 == 4'd13) ? 1'b1 : 1'b0);

assign icmp_ln45_7_fu_691_p2 = ((or_ln33_fu_666_p2 == 4'd3) ? 1'b1 : 1'b0);

assign icmp_ln45_8_fu_705_p2 = ((or_ln33_fu_666_p2 == 4'd5) ? 1'b1 : 1'b0);

assign icmp_ln45_9_fu_719_p2 = ((or_ln33_fu_666_p2 == 4'd7) ? 1'b1 : 1'b0);

assign icmp_ln45_fu_677_p2 = ((or_ln33_fu_666_p2 == 4'd1) ? 1'b1 : 1'b0);

assign lshr_ln_fu_549_p4 = {{ap_phi_mux_x_phi_fu_267_p4[6:1]}};

assign or_ln29_19_fu_577_p2 = (lshr_ln_reg_785 | 6'd2);

assign or_ln29_20_fu_588_p2 = (lshr_ln_reg_785 | 6'd3);

assign or_ln29_21_fu_599_p2 = (lshr_ln_reg_785 | 6'd4);

assign or_ln29_22_fu_610_p2 = (lshr_ln_reg_785 | 6'd5);

assign or_ln29_23_fu_621_p2 = (lshr_ln_reg_785 | 6'd6);

assign or_ln29_24_fu_632_p2 = (lshr_ln_reg_785 | 6'd7);

assign or_ln29_fu_565_p2 = (lshr_ln_fu_549_p4 | 6'd1);

assign or_ln33_fu_666_p2 = (trunc_ln33_fu_656_p1 | 4'd1);

assign select_ln45_10_fu_739_p3 = ((icmp_ln45_10_fu_733_p2[0:0] == 1'b1) ? psum_9_010_reg_382 : select_ln45_9_fu_725_p3);

assign select_ln45_11_fu_753_p3 = ((icmp_ln45_11_fu_747_p2[0:0] == 1'b1) ? psum_11_012_reg_358 : select_ln45_10_fu_739_p3);

assign select_ln45_7_fu_697_p3 = ((icmp_ln45_7_fu_691_p2[0:0] == 1'b1) ? psum_3_04_reg_454 : select_ln45_fu_683_p3);

assign select_ln45_8_fu_711_p3 = ((icmp_ln45_8_fu_705_p2[0:0] == 1'b1) ? psum_5_06_reg_430 : select_ln45_7_fu_697_p3);

assign select_ln45_9_fu_725_p3 = ((icmp_ln45_9_fu_719_p2[0:0] == 1'b1) ? psum_7_08_reg_406 : select_ln45_8_fu_711_p3);

assign select_ln45_fu_683_p3 = ((icmp_ln45_fu_677_p2[0:0] == 1'b1) ? psum_1_02_reg_286 : psum_15_016_reg_310);

assign tmp_81_fu_643_p3 = q_reg_466[32'd4];

assign tmp_fu_535_p3 = ap_phi_mux_x_phi_fu_267_p4[32'd7];

assign trunc_ln33_fu_656_p1 = q_reg_466[3:0];

assign zext_ln29_22_fu_571_p1 = or_ln29_fu_565_p2;

assign zext_ln29_23_fu_582_p1 = or_ln29_19_fu_577_p2;

assign zext_ln29_24_fu_593_p1 = or_ln29_20_fu_588_p2;

assign zext_ln29_25_fu_604_p1 = or_ln29_21_fu_599_p2;

assign zext_ln29_26_fu_615_p1 = or_ln29_22_fu_610_p2;

assign zext_ln29_27_fu_626_p1 = or_ln29_23_fu_621_p2;

assign zext_ln29_28_fu_637_p1 = or_ln29_24_fu_632_p2;

assign zext_ln29_fu_559_p1 = lshr_ln_fu_549_p4;

assign zext_ln33_4_fu_672_p1 = or_ln33_fu_666_p2;

assign zext_ln33_fu_651_p1 = q_reg_466;

endmodule //td_fused_top_tdf12_accum_1
module td_fused_top_tdf12_dot_product (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ifmap_vec_0_0_0_address0,
        ifmap_vec_0_0_0_ce0,
        ifmap_vec_0_0_0_q0,
        ifmap_vec_1_0_0_address0,
        ifmap_vec_1_0_0_ce0,
        ifmap_vec_1_0_0_q0,
        weight_vecs_0_0_0_0_address0,
        weight_vecs_0_0_0_0_ce0,
        weight_vecs_0_0_0_0_q0,
        weight_vecs_0_1_0_0_address0,
        weight_vecs_0_1_0_0_ce0,
        weight_vecs_0_1_0_0_q0,
        weight_vecs_1_0_0_0_address0,
        weight_vecs_1_0_0_0_ce0,
        weight_vecs_1_0_0_0_q0,
        weight_vecs_1_1_0_0_address0,
        weight_vecs_1_1_0_0_ce0,
        weight_vecs_1_1_0_0_q0,
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
        products_1_1_d0
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
output  [5:0] ifmap_vec_0_0_0_address0;
output   ifmap_vec_0_0_0_ce0;
input  [15:0] ifmap_vec_0_0_0_q0;
output  [5:0] ifmap_vec_1_0_0_address0;
output   ifmap_vec_1_0_0_ce0;
input  [15:0] ifmap_vec_1_0_0_q0;
output  [5:0] weight_vecs_0_0_0_0_address0;
output   weight_vecs_0_0_0_0_ce0;
input  [15:0] weight_vecs_0_0_0_0_q0;
output  [5:0] weight_vecs_0_1_0_0_address0;
output   weight_vecs_0_1_0_0_ce0;
input  [15:0] weight_vecs_0_1_0_0_q0;
output  [5:0] weight_vecs_1_0_0_0_address0;
output   weight_vecs_1_0_0_0_ce0;
input  [15:0] weight_vecs_1_0_0_0_q0;
output  [5:0] weight_vecs_1_1_0_0_address0;
output   weight_vecs_1_1_0_0_ce0;
input  [15:0] weight_vecs_1_1_0_0_q0;
output  [5:0] products_0_0_address0;
output   products_0_0_ce0;
output   products_0_0_we0;
output  [15:0] products_0_0_d0;
output  [5:0] products_0_1_address0;
output   products_0_1_ce0;
output   products_0_1_we0;
output  [15:0] products_0_1_d0;
output  [5:0] products_1_0_address0;
output   products_1_0_ce0;
output   products_1_0_we0;
output  [15:0] products_1_0_d0;
output  [5:0] products_1_1_address0;
output   products_1_1_ce0;
output   products_1_1_we0;
output  [15:0] products_1_1_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_0_0_0_ce0;
reg ifmap_vec_1_0_0_ce0;
reg weight_vecs_0_0_0_0_ce0;
reg weight_vecs_0_1_0_0_ce0;
reg weight_vecs_1_0_0_0_ce0;
reg weight_vecs_1_1_0_0_ce0;
reg products_0_0_ce0;
reg products_0_0_we0;
reg products_0_1_ce0;
reg products_0_1_we0;
reg products_1_0_ce0;
reg products_1_0_we0;
reg products_1_1_ce0;
reg products_1_1_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] ic_0_0_0_reg_180;
wire   [0:0] icmp_ln149_fu_207_p2;
reg   [0:0] icmp_ln149_reg_239;
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
reg   [0:0] icmp_ln149_reg_239_pp0_iter1_reg;
reg   [0:0] icmp_ln149_reg_239_pp0_iter2_reg;
reg   [0:0] icmp_ln149_reg_239_pp0_iter3_reg;
reg   [0:0] icmp_ln149_reg_239_pp0_iter4_reg;
reg   [0:0] icmp_ln149_reg_239_pp0_iter5_reg;
reg   [0:0] icmp_ln149_reg_239_pp0_iter6_reg;
wire   [7:0] add_ln149_fu_213_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [63:0] newIndex78_fu_229_p1;
reg   [63:0] newIndex78_reg_248;
reg   [63:0] newIndex78_reg_248_pp0_iter1_reg;
reg   [63:0] newIndex78_reg_248_pp0_iter2_reg;
reg   [63:0] newIndex78_reg_248_pp0_iter3_reg;
reg   [63:0] newIndex78_reg_248_pp0_iter4_reg;
reg   [63:0] newIndex78_reg_248_pp0_iter5_reg;
reg   [63:0] newIndex78_reg_248_pp0_iter6_reg;
reg   [15:0] ifmap_vec_0_0_0_load_reg_286;
reg   [15:0] weight_vecs_0_0_0_0_load_reg_292;
reg   [15:0] weight_vecs_1_0_0_0_load_reg_297;
reg   [15:0] ifmap_vec_1_0_0_load_reg_302;
reg   [15:0] weight_vecs_0_1_0_0_load_reg_308;
reg   [15:0] weight_vecs_1_1_0_0_load_reg_313;
wire   [15:0] grp_fu_191_p2;
reg   [15:0] mul_reg_318;
wire   [15:0] grp_fu_195_p2;
reg   [15:0] mul_0_0_0_1_reg_323;
wire   [15:0] grp_fu_199_p2;
reg   [15:0] mul_0_0_1_reg_328;
wire   [15:0] grp_fu_203_p2;
reg   [15:0] mul_0_0_1_1_reg_333;
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
wire    ap_block_pp0_stage0;
wire   [5:0] newIndex7_fu_219_p4;
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
hmul_16ns_16ns_16_5_max_dsp_1_U1887(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_0_0_load_reg_286),
    .din1(weight_vecs_0_0_0_0_load_reg_292),
    .dout(grp_fu_191_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1888(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_0_0_0_load_reg_286),
    .din1(weight_vecs_1_0_0_0_load_reg_297),
    .dout(grp_fu_195_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1889(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_0_0_load_reg_302),
    .din1(weight_vecs_0_1_0_0_load_reg_308),
    .dout(grp_fu_199_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1890(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_1_0_0_load_reg_302),
    .din1(weight_vecs_1_1_0_0_load_reg_313),
    .dout(grp_fu_203_p2)
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_fu_207_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ic_0_0_0_reg_180 <= add_ln149_fu_213_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_0_0_0_reg_180 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln149_reg_239 <= icmp_ln149_fu_207_p2;
        icmp_ln149_reg_239_pp0_iter1_reg <= icmp_ln149_reg_239;
        newIndex78_reg_248_pp0_iter1_reg[5 : 0] <= newIndex78_reg_248[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln149_reg_239_pp0_iter2_reg <= icmp_ln149_reg_239_pp0_iter1_reg;
        icmp_ln149_reg_239_pp0_iter3_reg <= icmp_ln149_reg_239_pp0_iter2_reg;
        icmp_ln149_reg_239_pp0_iter4_reg <= icmp_ln149_reg_239_pp0_iter3_reg;
        icmp_ln149_reg_239_pp0_iter5_reg <= icmp_ln149_reg_239_pp0_iter4_reg;
        icmp_ln149_reg_239_pp0_iter6_reg <= icmp_ln149_reg_239_pp0_iter5_reg;
        newIndex78_reg_248_pp0_iter2_reg[5 : 0] <= newIndex78_reg_248_pp0_iter1_reg[5 : 0];
        newIndex78_reg_248_pp0_iter3_reg[5 : 0] <= newIndex78_reg_248_pp0_iter2_reg[5 : 0];
        newIndex78_reg_248_pp0_iter4_reg[5 : 0] <= newIndex78_reg_248_pp0_iter3_reg[5 : 0];
        newIndex78_reg_248_pp0_iter5_reg[5 : 0] <= newIndex78_reg_248_pp0_iter4_reg[5 : 0];
        newIndex78_reg_248_pp0_iter6_reg[5 : 0] <= newIndex78_reg_248_pp0_iter5_reg[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_reg_239 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_0_0_load_reg_286 <= ifmap_vec_0_0_0_q0;
        ifmap_vec_1_0_0_load_reg_302 <= ifmap_vec_1_0_0_q0;
        weight_vecs_0_0_0_0_load_reg_292 <= weight_vecs_0_0_0_0_q0;
        weight_vecs_0_1_0_0_load_reg_308 <= weight_vecs_0_1_0_0_q0;
        weight_vecs_1_0_0_0_load_reg_297 <= weight_vecs_1_0_0_0_q0;
        weight_vecs_1_1_0_0_load_reg_313 <= weight_vecs_1_1_0_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_reg_239_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_0_0_0_1_reg_323 <= grp_fu_195_p2;
        mul_0_0_1_1_reg_333 <= grp_fu_203_p2;
        mul_0_0_1_reg_328 <= grp_fu_199_p2;
        mul_reg_318 <= grp_fu_191_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln149_fu_207_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        newIndex78_reg_248[5 : 0] <= newIndex78_fu_229_p1[5 : 0];
    end
end

always @ (*) begin
    if ((icmp_ln149_fu_207_p2 == 1'd1)) begin
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
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_0_ce0 = 1'b1;
    end else begin
        products_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln149_reg_239_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_0_we0 = 1'b1;
    end else begin
        products_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_1_ce0 = 1'b1;
    end else begin
        products_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln149_reg_239_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_0_1_we0 = 1'b1;
    end else begin
        products_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_0_ce0 = 1'b1;
    end else begin
        products_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln149_reg_239_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_0_we0 = 1'b1;
    end else begin
        products_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_1_ce0 = 1'b1;
    end else begin
        products_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln149_reg_239_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        products_1_1_we0 = 1'b1;
    end else begin
        products_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_0_0_ce0 = 1'b0;
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
            if ((~((icmp_ln149_fu_207_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((icmp_ln149_fu_207_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
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

assign add_ln149_fu_213_p2 = (ic_0_0_0_reg_180 + 8'd2);

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

assign icmp_ln149_fu_207_p2 = ((ic_0_0_0_reg_180 == 8'd128) ? 1'b1 : 1'b0);

assign ifmap_vec_0_0_0_address0 = newIndex78_fu_229_p1;

assign ifmap_vec_1_0_0_address0 = newIndex78_fu_229_p1;

assign newIndex78_fu_229_p1 = newIndex7_fu_219_p4;

assign newIndex7_fu_219_p4 = {{ic_0_0_0_reg_180[6:1]}};

assign products_0_0_address0 = newIndex78_reg_248_pp0_iter6_reg;

assign products_0_0_d0 = mul_reg_318;

assign products_0_1_address0 = newIndex78_reg_248_pp0_iter6_reg;

assign products_0_1_d0 = mul_0_0_1_reg_328;

assign products_1_0_address0 = newIndex78_reg_248_pp0_iter6_reg;

assign products_1_0_d0 = mul_0_0_0_1_reg_323;

assign products_1_1_address0 = newIndex78_reg_248_pp0_iter6_reg;

assign products_1_1_d0 = mul_0_0_1_1_reg_333;

assign weight_vecs_0_0_0_0_address0 = newIndex78_fu_229_p1;

assign weight_vecs_0_1_0_0_address0 = newIndex78_fu_229_p1;

assign weight_vecs_1_0_0_0_address0 = newIndex78_fu_229_p1;

assign weight_vecs_1_1_0_0_address0 = newIndex78_fu_229_p1;

always @ (posedge ap_clk) begin
    newIndex78_reg_248[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter1_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter2_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter3_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter4_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter5_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    newIndex78_reg_248_pp0_iter6_reg[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
end

endmodule //td_fused_top_tdf12_dot_product
module td_fused_top_tdf12_readFilters82 (
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
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_0_0_0_address0,
        weight_vecs_0_0_0_0_ce0,
        weight_vecs_0_0_0_0_we0,
        weight_vecs_0_0_0_0_d0,
        weight_vecs_0_1_0_0_address0,
        weight_vecs_0_1_0_0_ce0,
        weight_vecs_0_1_0_0_we0,
        weight_vecs_0_1_0_0_d0,
        weight_vecs_1_0_0_0_address0,
        weight_vecs_1_0_0_0_ce0,
        weight_vecs_1_0_0_0_we0,
        weight_vecs_1_0_0_0_d0,
        weight_vecs_1_1_0_0_address0,
        weight_vecs_1_1_0_0_ce0,
        weight_vecs_1_1_0_0_we0,
        weight_vecs_1_1_0_0_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [14:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [31:0] filter_data_0_q0;
output  [14:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [31:0] filter_data_1_q0;
input  [8:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [5:0] weight_vecs_0_0_0_0_address0;
output   weight_vecs_0_0_0_0_ce0;
output   weight_vecs_0_0_0_0_we0;
output  [15:0] weight_vecs_0_0_0_0_d0;
output  [5:0] weight_vecs_0_1_0_0_address0;
output   weight_vecs_0_1_0_0_ce0;
output   weight_vecs_0_1_0_0_we0;
output  [15:0] weight_vecs_0_1_0_0_d0;
output  [5:0] weight_vecs_1_0_0_0_address0;
output   weight_vecs_1_0_0_0_ce0;
output   weight_vecs_1_0_0_0_we0;
output  [15:0] weight_vecs_1_0_0_0_d0;
output  [5:0] weight_vecs_1_1_0_0_address0;
output   weight_vecs_1_1_0_0_ce0;
output   weight_vecs_1_1_0_0_we0;
output  [15:0] weight_vecs_1_1_0_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg indices_23_read;
reg weight_vecs_0_0_0_0_ce0;
reg weight_vecs_0_0_0_0_we0;
reg weight_vecs_0_1_0_0_ce0;
reg weight_vecs_0_1_0_0_we0;
reg weight_vecs_1_0_0_0_ce0;
reg weight_vecs_1_0_0_0_we0;
reg weight_vecs_1_1_0_0_ce0;
reg weight_vecs_1_1_0_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [7:0] kk_0_0_0_i_i_reg_160;
reg   [8:0] indices_23_read_reg_261;
wire   [0:0] icmp_ln49_fu_171_p2;
reg   [0:0] icmp_ln49_reg_266;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [7:0] add_ln49_fu_177_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [5:0] lshr_ln_fu_183_p4;
reg   [5:0] lshr_ln_reg_275;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire   [63:0] zext_ln55_fu_200_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln55_7_fu_206_p1;
wire   [14:0] tmp_s_fu_193_p3;
wire   [15:0] trunc_ln55_fu_213_p1;
wire   [15:0] trunc_ln55_19_fu_222_p1;
wire   [15:0] tmp_268_i_i_fu_231_p4;
wire   [15:0] tmp_269_i_i_fu_246_p4;
wire    ap_CS_fsm_state4;
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
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_fu_171_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_0_0_0_i_i_reg_160 <= add_ln49_fu_177_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_0_0_i_i_reg_160 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln49_reg_266 <= icmp_ln49_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_23_read_reg_261 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_fu_171_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lshr_ln_reg_275 <= {{kk_0_0_0_i_i_reg_160[6:1]}};
    end
end

always @ (*) begin
    if ((icmp_ln49_fu_171_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_0_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_1_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_1_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_0_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_1_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_1_0_0_we0 = 1'b0;
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
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln49_fu_171_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln49_fu_171_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln49_fu_177_p2 = (kk_0_0_0_i_i_reg_160 + 8'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = zext_ln55_fu_200_p1;

assign filter_data_1_address0 = zext_ln55_fu_200_p1;

assign icmp_ln49_fu_171_p2 = ((kk_0_0_0_i_i_reg_160 == 8'd128) ? 1'b1 : 1'b0);

assign lshr_ln_fu_183_p4 = {{kk_0_0_0_i_i_reg_160[6:1]}};

assign tmp_268_i_i_fu_231_p4 = {{filter_data_0_q0[31:16]}};

assign tmp_269_i_i_fu_246_p4 = {{filter_data_1_q0[31:16]}};

assign tmp_s_fu_193_p3 = {{indices_23_read_reg_261}, {lshr_ln_fu_183_p4}};

assign trunc_ln55_19_fu_222_p1 = filter_data_1_q0[15:0];

assign trunc_ln55_fu_213_p1 = filter_data_0_q0[15:0];

assign weight_vecs_0_0_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_0_0_0_0_d0 = trunc_ln55_fu_213_p1;

assign weight_vecs_0_1_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_0_1_0_0_d0 = tmp_268_i_i_fu_231_p4;

assign weight_vecs_1_0_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_1_0_0_0_d0 = trunc_ln55_19_fu_222_p1;

assign weight_vecs_1_1_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_1_1_0_0_d0 = tmp_269_i_i_fu_246_p4;

assign zext_ln55_7_fu_206_p1 = lshr_ln_reg_275;

assign zext_ln55_fu_200_p1 = tmp_s_fu_193_p3;

endmodule //td_fused_top_tdf12_readFilters82
module td_fused_top_tdf12_readInputs (
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
        ifmap_vec_0_0_0_address0,
        ifmap_vec_0_0_0_ce0,
        ifmap_vec_0_0_0_we0,
        ifmap_vec_0_0_0_d0,
        ifmap_vec_1_0_0_address0,
        ifmap_vec_1_0_0_ce0,
        ifmap_vec_1_0_0_we0,
        ifmap_vec_1_0_0_d0,
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
parameter    ap_ST_fsm_state6 = 4'd8;

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
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [5:0] ifmap_vec_0_0_0_address0;
output   ifmap_vec_0_0_0_ce0;
output   ifmap_vec_0_0_0_we0;
output  [15:0] ifmap_vec_0_0_0_d0;
output  [5:0] ifmap_vec_1_0_0_address0;
output   ifmap_vec_1_0_0_ce0;
output   ifmap_vec_1_0_0_we0;
output  [15:0] ifmap_vec_1_0_0_d0;
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
reg ifmap_vec_0_0_0_ce0;
reg ifmap_vec_0_0_0_we0;
reg ifmap_vec_1_0_0_ce0;
reg ifmap_vec_1_0_0_we0;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [7:0] kk_0_i_i_reg_165;
wire   [3:0] trunc_ln165_fu_176_p1;
reg   [3:0] trunc_ln165_reg_566;
reg   [15:0] col_coord_reg_571;
wire   [0:0] is_padding_fu_198_p2;
reg   [0:0] is_padding_reg_576;
wire   [9:0] add_ln32_fu_258_p2;
reg   [9:0] add_ln32_reg_584;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln25_fu_264_p2;
reg   [0:0] icmp_ln25_reg_589;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln25_reg_589_pp0_iter1_reg;
wire   [7:0] add_ln25_fu_270_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [1:0] empty_144_fu_298_p1;
reg   [1:0] empty_144_reg_603;
reg   [5:0] lshr_ln5_reg_608;
reg   [5:0] lshr_ln5_reg_608_pp0_iter1_reg;
wire   [6:0] sub_ln32_24_fu_391_p2;
reg   [6:0] sub_ln32_24_reg_613;
wire   [63:0] lshr_ln32_fu_401_p2;
reg   [63:0] lshr_ln32_reg_618;
wire   [6:0] sub_ln32_27_fu_485_p2;
reg   [6:0] sub_ln32_27_reg_623;
wire   [63:0] lshr_ln32_12_fu_495_p2;
reg   [63:0] lshr_ln32_12_reg_628;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
wire   [63:0] sext_ln32_fu_293_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln33_fu_531_p1;
reg    ap_block_state1;
wire   [0:0] cmp7_i_i_fu_186_p2;
wire   [0:0] icmp_ln24_fu_192_p2;
wire   [3:0] empty_142_fu_204_p1;
wire   [3:0] row_coord_int_fu_207_p3;
wire   [7:0] tmp_fu_220_p3;
wire   [4:0] tmp_s_fu_232_p3;
wire   [8:0] zext_ln32_fu_228_p1;
wire   [8:0] zext_ln32_53_fu_240_p1;
wire   [8:0] sub_ln32_fu_244_p2;
wire   [3:0] col_coord_int_fu_213_p3;
wire   [9:0] sub_ln32_cast_fu_250_p1;
wire   [9:0] zext_ln32_54_fu_254_p1;
wire   [4:0] lshr_ln_fu_276_p4;
wire   [14:0] tmp_78_fu_286_p3;
wire   [5:0] tmp_54_fu_312_p3;
wire   [5:0] empty_145_fu_319_p2;
wire   [6:0] zext_ln32_55_fu_331_p1;
wire   [6:0] zext_ln32_56_fu_335_p1;
wire   [0:0] icmp_ln32_fu_325_p2;
wire   [6:0] sub_ln32_22_fu_349_p2;
wire   [6:0] sub_ln32_23_fu_361_p2;
reg   [63:0] tmp_79_fu_339_p4;
wire   [6:0] xor_ln32_fu_355_p2;
wire   [6:0] select_ln32_fu_367_p3;
wire   [6:0] select_ln32_19_fu_383_p3;
wire   [63:0] select_ln32_18_fu_375_p3;
wire   [63:0] zext_ln32_57_fu_397_p1;
wire   [5:0] empty_146_fu_407_p2;
wire   [5:0] empty_147_fu_413_p2;
wire   [6:0] zext_ln32_59_fu_425_p1;
wire   [6:0] zext_ln32_60_fu_429_p1;
wire   [0:0] icmp_ln32_4_fu_419_p2;
wire   [6:0] sub_ln32_25_fu_443_p2;
wire   [6:0] sub_ln32_26_fu_455_p2;
reg   [63:0] tmp_80_fu_433_p4;
wire   [6:0] xor_ln32_4_fu_449_p2;
wire   [6:0] select_ln32_20_fu_461_p3;
wire   [6:0] select_ln32_22_fu_477_p3;
wire   [63:0] select_ln32_21_fu_469_p3;
wire   [63:0] zext_ln32_61_fu_491_p1;
wire   [63:0] zext_ln32_58_fu_501_p1;
wire   [63:0] lshr_ln32_11_fu_504_p2;
wire   [63:0] and_ln32_fu_510_p2;
wire   [15:0] trunc_ln32_fu_515_p1;
wire   [15:0] bitcast_ln32_fu_519_p1;
wire   [63:0] zext_ln32_62_fu_536_p1;
wire   [63:0] lshr_ln32_13_fu_539_p2;
wire   [63:0] and_ln32_4_fu_545_p2;
wire   [15:0] trunc_ln32_7_fu_550_p1;
wire   [15:0] bitcast_ln32_10_fu_554_p1;
wire    ap_CS_fsm_state6;
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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
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
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_fu_264_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_0_i_i_reg_165 <= add_ln25_fu_270_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_165 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln32_reg_584 <= add_ln32_fu_258_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        col_coord_reg_571 <= indices_12_dout;
        is_padding_reg_576 <= is_padding_fu_198_p2;
        trunc_ln165_reg_566 <= trunc_ln165_fu_176_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_fu_264_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_144_reg_603 <= empty_144_fu_298_p1;
        lshr_ln5_reg_608 <= {{kk_0_i_i_reg_165[6:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln25_reg_589 <= icmp_ln25_fu_264_p2;
        icmp_ln25_reg_589_pp0_iter1_reg <= icmp_ln25_reg_589;
        lshr_ln5_reg_608_pp0_iter1_reg <= lshr_ln5_reg_608;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_reg_589 == 1'd0) & (is_padding_reg_576 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lshr_ln32_12_reg_628 <= lshr_ln32_12_fu_495_p2;
        lshr_ln32_reg_618 <= lshr_ln32_fu_401_p2;
        sub_ln32_24_reg_613[6 : 1] <= sub_ln32_24_fu_391_p2[6 : 1];
        sub_ln32_27_reg_623[6 : 1] <= sub_ln32_27_fu_485_p2[6 : 1];
    end
end

always @ (*) begin
    if ((icmp_ln25_fu_264_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_589_pp0_iter1_reg == 1'd0))) begin
        ifmap_vec_0_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_1_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_589_pp0_iter1_reg == 1'd0))) begin
        ifmap_vec_1_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_1_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln25_fu_264_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln25_fu_264_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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

assign add_ln25_fu_270_p2 = (kk_0_i_i_reg_165 + 8'd2);

assign add_ln32_fu_258_p2 = ((sub_ln32_cast_fu_250_p1) + (zext_ln32_54_fu_254_p1));

assign and_ln32_4_fu_545_p2 = (lshr_ln32_13_fu_539_p2 & lshr_ln32_12_reg_628);

assign and_ln32_fu_510_p2 = (lshr_ln32_reg_618 & lshr_ln32_11_fu_504_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_10_fu_554_p1 = trunc_ln32_7_fu_550_p1;

assign bitcast_ln32_fu_519_p1 = trunc_ln32_fu_515_p1;

assign cmp7_i_i_fu_186_p2 = ((indices_01_dout > 16'd13) ? 1'b1 : 1'b0);

assign col_coord_int_fu_213_p3 = ((is_padding_reg_576[0:0] == 1'b1) ? 4'd0 : empty_142_fu_204_p1);

assign empty_142_fu_204_p1 = col_coord_reg_571[3:0];

assign empty_144_fu_298_p1 = kk_0_i_i_reg_165[1:0];

assign empty_145_fu_319_p2 = (tmp_54_fu_312_p3 | 6'd15);

assign empty_146_fu_407_p2 = (tmp_54_fu_312_p3 | 6'd16);

assign empty_147_fu_413_p2 = (tmp_54_fu_312_p3 | 6'd31);

assign icmp_ln24_fu_192_p2 = ((indices_12_dout > 16'd13) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_264_p2 = ((kk_0_i_i_reg_165 == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln32_4_fu_419_p2 = ((empty_146_fu_407_p2 > empty_147_fu_413_p2) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_325_p2 = ((tmp_54_fu_312_p3 > empty_145_fu_319_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_0_0_0_address0 = zext_ln33_fu_531_p1;

assign ifmap_vec_0_0_0_d0 = ((is_padding_reg_576[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_519_p1);

assign ifmap_vec_1_0_0_address0 = zext_ln33_fu_531_p1;

assign ifmap_vec_1_0_0_d0 = ((is_padding_reg_576[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_10_fu_554_p1);

assign in_data_address0 = sext_ln32_fu_293_p1;

assign indices_01_out_din = indices_01_dout[3:0];

assign indices_12_out_din = indices_12_dout[7:0];

assign is_padding_fu_198_p2 = (icmp_ln24_fu_192_p2 | cmp7_i_i_fu_186_p2);

assign lshr_ln32_11_fu_504_p2 = 64'd18446744073709551615 >> zext_ln32_58_fu_501_p1;

assign lshr_ln32_12_fu_495_p2 = select_ln32_21_fu_469_p3 >> zext_ln32_61_fu_491_p1;

assign lshr_ln32_13_fu_539_p2 = 64'd18446744073709551615 >> zext_ln32_62_fu_536_p1;

assign lshr_ln32_fu_401_p2 = select_ln32_18_fu_375_p3 >> zext_ln32_57_fu_397_p1;

assign lshr_ln_fu_276_p4 = {{kk_0_i_i_reg_165[6:2]}};

assign row_coord_int_fu_207_p3 = ((is_padding_reg_576[0:0] == 1'b1) ? 4'd0 : trunc_ln165_reg_566);

assign select_ln32_18_fu_375_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? tmp_79_fu_339_p4 : in_data_q0);

assign select_ln32_19_fu_383_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? xor_ln32_fu_355_p2 : zext_ln32_55_fu_331_p1);

assign select_ln32_20_fu_461_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? sub_ln32_25_fu_443_p2 : sub_ln32_26_fu_455_p2);

assign select_ln32_21_fu_469_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? tmp_80_fu_433_p4 : in_data_q0);

assign select_ln32_22_fu_477_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? xor_ln32_4_fu_449_p2 : zext_ln32_59_fu_425_p1);

assign select_ln32_fu_367_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? sub_ln32_22_fu_349_p2 : sub_ln32_23_fu_361_p2);

assign sext_ln32_fu_293_p1 = (tmp_78_fu_286_p3);

assign sub_ln32_22_fu_349_p2 = (zext_ln32_55_fu_331_p1 - zext_ln32_56_fu_335_p1);

assign sub_ln32_23_fu_361_p2 = (zext_ln32_56_fu_335_p1 - zext_ln32_55_fu_331_p1);

assign sub_ln32_24_fu_391_p2 = (7'd63 - select_ln32_fu_367_p3);

assign sub_ln32_25_fu_443_p2 = (zext_ln32_59_fu_425_p1 - zext_ln32_60_fu_429_p1);

assign sub_ln32_26_fu_455_p2 = (zext_ln32_60_fu_429_p1 - zext_ln32_59_fu_425_p1);

assign sub_ln32_27_fu_485_p2 = (7'd63 - select_ln32_20_fu_461_p3);

assign sub_ln32_cast_fu_250_p1 = (sub_ln32_fu_244_p2);

assign sub_ln32_fu_244_p2 = (zext_ln32_fu_228_p1 - zext_ln32_53_fu_240_p1);

assign tmp_54_fu_312_p3 = {{empty_144_reg_603}, {4'd0}};

assign tmp_78_fu_286_p3 = {{add_ln32_reg_584}, {lshr_ln_fu_276_p4}};

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_79_fu_339_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_79_fu_339_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

integer ap_tvar_int_1;

always @ (in_data_q0) begin
    //for (ap_tvar_int_1 = 64 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 64; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 63 - 0) begin
            tmp_80_fu_433_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_80_fu_433_p4[ap_tvar_int_1] = in_data_q0[63 - ap_tvar_int_1];
        end
    end
end

assign tmp_fu_220_p3 = {{row_coord_int_fu_207_p3}, {4'd0}};

assign tmp_s_fu_232_p3 = {{row_coord_int_fu_207_p3}, {1'd0}};

assign trunc_ln165_fu_176_p1 = indices_01_dout[3:0];

assign trunc_ln32_7_fu_550_p1 = and_ln32_4_fu_545_p2[15:0];

assign trunc_ln32_fu_515_p1 = and_ln32_fu_510_p2[15:0];

assign xor_ln32_4_fu_449_p2 = (zext_ln32_59_fu_425_p1 ^ 7'd63);

assign xor_ln32_fu_355_p2 = (zext_ln32_55_fu_331_p1 ^ 7'd63);

assign zext_ln32_53_fu_240_p1 = tmp_s_fu_232_p3;

assign zext_ln32_54_fu_254_p1 = col_coord_int_fu_213_p3;

assign zext_ln32_55_fu_331_p1 = tmp_54_fu_312_p3;

assign zext_ln32_56_fu_335_p1 = empty_145_fu_319_p2;

assign zext_ln32_57_fu_397_p1 = select_ln32_19_fu_383_p3;

assign zext_ln32_58_fu_501_p1 = sub_ln32_24_reg_613;

assign zext_ln32_59_fu_425_p1 = empty_146_fu_407_p2;

assign zext_ln32_60_fu_429_p1 = empty_147_fu_413_p2;

assign zext_ln32_61_fu_491_p1 = select_ln32_22_fu_477_p3;

assign zext_ln32_62_fu_536_p1 = sub_ln32_27_reg_623;

assign zext_ln32_fu_228_p1 = tmp_fu_220_p3;

assign zext_ln33_fu_531_p1 = lshr_ln5_reg_608_pp0_iter1_reg;

always @ (posedge ap_clk) begin
    sub_ln32_24_reg_613[0] <= 1'b0;
    sub_ln32_27_reg_623[0] <= 1'b0;
end

endmodule //td_fused_top_tdf12_readInputs
module td_fused_top_tdf12_get_next_ijk (
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
        indices_2_out1_write
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
output  [8:0] indices_2_out_din;
input   indices_2_out_full_n;
output   indices_2_out_write;
output  [8:0] indices_2_out1_din;
input   indices_2_out1_full_n;
output   indices_2_out1_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg indices_0_write;
reg indices_1_write;
reg indices_2_out_write;
reg indices_2_out1_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg   [15:0] i_5;
reg   [15:0] j_5;
reg   [15:0] k_5;
reg    indices_0_blk_n;
reg    indices_1_blk_n;
reg    indices_2_out_blk_n;
reg    indices_2_out1_blk_n;
reg   [0:0] ap_phi_mux_j_9_flag_0_i_phi_fu_77_p6;
reg    ap_block_state1;
wire   [0:0] icmp_ln108_fu_141_p2;
wire   [0:0] icmp_ln111_fu_154_p2;
reg   [15:0] ap_phi_mux_j_9_new_0_i_phi_fu_91_p6;
wire   [15:0] add_ln110_fu_147_p2;
reg   [15:0] ap_phi_mux_k_9_new_0_i_phi_fu_104_p6;
wire   [15:0] add_ln107_fu_134_p2;
wire   [15:0] select_ln114_fu_172_p3;
wire   [8:0] trunc_ln106_fu_128_p1;
wire   [15:0] add_ln113_fu_160_p2;
wire   [0:0] icmp_ln114_fu_166_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_5 = 16'd0;
#0 j_5 = 16'd0;
#0 k_5 = 16'd0;
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
        end else if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (icmp_ln111_fu_154_p2 == 1'd1) & (icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_5 <= select_ln114_fu_172_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (ap_phi_mux_j_9_flag_0_i_phi_fu_77_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_5 <= ap_phi_mux_j_9_new_0_i_phi_fu_91_p6;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        k_5 <= ap_phi_mux_k_9_new_0_i_phi_fu_104_p6;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if (((icmp_ln108_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_j_9_flag_0_i_phi_fu_77_p6 = 1'd0;
    end else if ((((icmp_ln111_fu_154_p2 == 1'd0) & (icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln111_fu_154_p2 == 1'd1) & (icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_j_9_flag_0_i_phi_fu_77_p6 = 1'd1;
    end else begin
        ap_phi_mux_j_9_flag_0_i_phi_fu_77_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln111_fu_154_p2 == 1'd0)) begin
            ap_phi_mux_j_9_new_0_i_phi_fu_91_p6 = add_ln110_fu_147_p2;
        end else if ((icmp_ln111_fu_154_p2 == 1'd1)) begin
            ap_phi_mux_j_9_new_0_i_phi_fu_91_p6 = 16'd0;
        end else begin
            ap_phi_mux_j_9_new_0_i_phi_fu_91_p6 = 'bx;
        end
    end else begin
        ap_phi_mux_j_9_new_0_i_phi_fu_91_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln108_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_k_9_new_0_i_phi_fu_104_p6 = add_ln107_fu_134_p2;
    end else if ((((icmp_ln111_fu_154_p2 == 1'd0) & (icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln111_fu_154_p2 == 1'd1) & (icmp_ln108_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_k_9_new_0_i_phi_fu_104_p6 = 16'd0;
    end else begin
        ap_phi_mux_k_9_new_0_i_phi_fu_104_p6 = 'bx;
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
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out_write = 1'b1;
    end else begin
        indices_2_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln107_fu_134_p2 = (k_5 + 16'd1);

assign add_ln110_fu_147_p2 = (j_5 + 16'd1);

assign add_ln113_fu_160_p2 = (i_5 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign icmp_ln108_fu_141_p2 = ((add_ln107_fu_134_p2 == 16'd500) ? 1'b1 : 1'b0);

assign icmp_ln111_fu_154_p2 = ((add_ln110_fu_147_p2 == 16'd14) ? 1'b1 : 1'b0);

assign icmp_ln114_fu_166_p2 = ((add_ln113_fu_160_p2 == 16'd14) ? 1'b1 : 1'b0);

assign indices_0_din = i_5;

assign indices_1_din = j_5;

assign indices_2_out1_din = trunc_ln106_fu_128_p1;

assign indices_2_out_din = trunc_ln106_fu_128_p1;

assign select_ln114_fu_172_p3 = ((icmp_ln114_fu_166_p2[0:0] == 1'b1) ? 16'd0 : add_ln113_fu_160_p2);

assign start_out = real_start;

assign trunc_ln106_fu_128_p1 = k_5[8:0];

endmodule //td_fused_top_tdf12_get_next_ijk
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0
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
td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum2_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore(
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



td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_accum1_out_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0
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
        td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore_U_0 (
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
        td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore_U_1 (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore(
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
parameter AddressRange = 32'd64;
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



td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_products_0_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 6;
parameter MEM_SIZE = 64;

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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0
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
td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore_U (
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore(
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
parameter AddressRange = 32'd128;
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



td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore_ram_U(
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
module td_fused_top_dataflow_in_loop_TOP_LOOP47680_ifmap_vec_0_0_0_memcore_ram (addr0, ce0, d0, we0, q0, addr1, ce1, d1, we1, q1,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 7;
parameter MEM_SIZE = 128;

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
