`define SIMULATION_MEMORY

module C_LSTM_stage_2_18_10_16_1 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [17:0] Ct_1_0,
	input [17:0] WixrXtYt_1_0,
	input [17:0] Wic_0,
	input [17:0] bi_0,
	input [17:0] WfxrXtYt_1_0,
	input [17:0] Wfc_0,
	input [17:0] bf_0,
	input [17:0] WoxrXtYt_1_0,
	input [17:0] Woc_0,
	input [17:0] bo_0,
	input [17:0] WcxrXtYt_1_0,
	input [17:0] bc_0,
	output [17:0] out_mt_0,
	output [17:0] out_ct_0,
	input [17:0] Ct_1_1,
	input [17:0] WixrXtYt_1_1,
	input [17:0] Wic_1,
	input [17:0] bi_1,
	input [17:0] WfxrXtYt_1_1,
	input [17:0] Wfc_1,
	input [17:0] bf_1,
	input [17:0] WoxrXtYt_1_1,
	input [17:0] Woc_1,
	input [17:0] bo_1,
	input [17:0] WcxrXtYt_1_1,
	input [17:0] bc_1,
	output [17:0] out_mt_1,
	output [17:0] out_ct_1,
	input [17:0] Ct_1_2,
	input [17:0] WixrXtYt_1_2,
	input [17:0] Wic_2,
	input [17:0] bi_2,
	input [17:0] WfxrXtYt_1_2,
	input [17:0] Wfc_2,
	input [17:0] bf_2,
	input [17:0] WoxrXtYt_1_2,
	input [17:0] Woc_2,
	input [17:0] bo_2,
	input [17:0] WcxrXtYt_1_2,
	input [17:0] bc_2,
	output [17:0] out_mt_2,
	output [17:0] out_ct_2,
	input [17:0] Ct_1_3,
	input [17:0] WixrXtYt_1_3,
	input [17:0] Wic_3,
	input [17:0] bi_3,
	input [17:0] WfxrXtYt_1_3,
	input [17:0] Wfc_3,
	input [17:0] bf_3,
	input [17:0] WoxrXtYt_1_3,
	input [17:0] Woc_3,
	input [17:0] bo_3,
	input [17:0] WcxrXtYt_1_3,
	input [17:0] bc_3,
	output [17:0] out_mt_3,
	output [17:0] out_ct_3,
	input [17:0] Ct_1_4,
	input [17:0] WixrXtYt_1_4,
	input [17:0] Wic_4,
	input [17:0] bi_4,
	input [17:0] WfxrXtYt_1_4,
	input [17:0] Wfc_4,
	input [17:0] bf_4,
	input [17:0] WoxrXtYt_1_4,
	input [17:0] Woc_4,
	input [17:0] bo_4,
	input [17:0] WcxrXtYt_1_4,
	input [17:0] bc_4,
	output [17:0] out_mt_4,
	output [17:0] out_ct_4,
	input [17:0] Ct_1_5,
	input [17:0] WixrXtYt_1_5,
	input [17:0] Wic_5,
	input [17:0] bi_5,
	input [17:0] WfxrXtYt_1_5,
	input [17:0] Wfc_5,
	input [17:0] bf_5,
	input [17:0] WoxrXtYt_1_5,
	input [17:0] Woc_5,
	input [17:0] bo_5,
	input [17:0] WcxrXtYt_1_5,
	input [17:0] bc_5,
	output [17:0] out_mt_5,
	output [17:0] out_ct_5,
	input [17:0] Ct_1_6,
	input [17:0] WixrXtYt_1_6,
	input [17:0] Wic_6,
	input [17:0] bi_6,
	input [17:0] WfxrXtYt_1_6,
	input [17:0] Wfc_6,
	input [17:0] bf_6,
	input [17:0] WoxrXtYt_1_6,
	input [17:0] Woc_6,
	input [17:0] bo_6,
	input [17:0] WcxrXtYt_1_6,
	input [17:0] bc_6,
	output [17:0] out_mt_6,
	output [17:0] out_ct_6,
	input [17:0] Ct_1_7,
	input [17:0] WixrXtYt_1_7,
	input [17:0] Wic_7,
	input [17:0] bi_7,
	input [17:0] WfxrXtYt_1_7,
	input [17:0] Wfc_7,
	input [17:0] bf_7,
	input [17:0] WoxrXtYt_1_7,
	input [17:0] Woc_7,
	input [17:0] bo_7,
	input [17:0] WcxrXtYt_1_7,
	input [17:0] bc_7,
	output [17:0] out_mt_7,
	output [17:0] out_ct_7,
	input [17:0] Ct_1_8,
	input [17:0] WixrXtYt_1_8,
	input [17:0] Wic_8,
	input [17:0] bi_8,
	input [17:0] WfxrXtYt_1_8,
	input [17:0] Wfc_8,
	input [17:0] bf_8,
	input [17:0] WoxrXtYt_1_8,
	input [17:0] Woc_8,
	input [17:0] bo_8,
	input [17:0] WcxrXtYt_1_8,
	input [17:0] bc_8,
	output [17:0] out_mt_8,
	output [17:0] out_ct_8,
	input [17:0] Ct_1_9,
	input [17:0] WixrXtYt_1_9,
	input [17:0] Wic_9,
	input [17:0] bi_9,
	input [17:0] WfxrXtYt_1_9,
	input [17:0] Wfc_9,
	input [17:0] bf_9,
	input [17:0] WoxrXtYt_1_9,
	input [17:0] Woc_9,
	input [17:0] bo_9,
	input [17:0] WcxrXtYt_1_9,
	input [17:0] bc_9,
	output [17:0] out_mt_9,
	output [17:0] out_ct_9,
	input [17:0] Ct_1_10,
	input [17:0] WixrXtYt_1_10,
	input [17:0] Wic_10,
	input [17:0] bi_10,
	input [17:0] WfxrXtYt_1_10,
	input [17:0] Wfc_10,
	input [17:0] bf_10,
	input [17:0] WoxrXtYt_1_10,
	input [17:0] Woc_10,
	input [17:0] bo_10,
	input [17:0] WcxrXtYt_1_10,
	input [17:0] bc_10,
	output [17:0] out_mt_10,
	output [17:0] out_ct_10,
	input [17:0] Ct_1_11,
	input [17:0] WixrXtYt_1_11,
	input [17:0] Wic_11,
	input [17:0] bi_11,
	input [17:0] WfxrXtYt_1_11,
	input [17:0] Wfc_11,
	input [17:0] bf_11,
	input [17:0] WoxrXtYt_1_11,
	input [17:0] Woc_11,
	input [17:0] bo_11,
	input [17:0] WcxrXtYt_1_11,
	input [17:0] bc_11,
	output [17:0] out_mt_11,
	output [17:0] out_ct_11,
	input [17:0] Ct_1_12,
	input [17:0] WixrXtYt_1_12,
	input [17:0] Wic_12,
	input [17:0] bi_12,
	input [17:0] WfxrXtYt_1_12,
	input [17:0] Wfc_12,
	input [17:0] bf_12,
	input [17:0] WoxrXtYt_1_12,
	input [17:0] Woc_12,
	input [17:0] bo_12,
	input [17:0] WcxrXtYt_1_12,
	input [17:0] bc_12,
	output [17:0] out_mt_12,
	output [17:0] out_ct_12,
	input [17:0] Ct_1_13,
	input [17:0] WixrXtYt_1_13,
	input [17:0] Wic_13,
	input [17:0] bi_13,
	input [17:0] WfxrXtYt_1_13,
	input [17:0] Wfc_13,
	input [17:0] bf_13,
	input [17:0] WoxrXtYt_1_13,
	input [17:0] Woc_13,
	input [17:0] bo_13,
	input [17:0] WcxrXtYt_1_13,
	input [17:0] bc_13,
	output [17:0] out_mt_13,
	output [17:0] out_ct_13,
	input [17:0] Ct_1_14,
	input [17:0] WixrXtYt_1_14,
	input [17:0] Wic_14,
	input [17:0] bi_14,
	input [17:0] WfxrXtYt_1_14,
	input [17:0] Wfc_14,
	input [17:0] bf_14,
	input [17:0] WoxrXtYt_1_14,
	input [17:0] Woc_14,
	input [17:0] bo_14,
	input [17:0] WcxrXtYt_1_14,
	input [17:0] bc_14,
	output [17:0] out_mt_14,
	output [17:0] out_ct_14,
	input [17:0] Ct_1_15,
	input [17:0] WixrXtYt_1_15,
	input [17:0] Wic_15,
	input [17:0] bi_15,
	input [17:0] WfxrXtYt_1_15,
	input [17:0] Wfc_15,
	input [17:0] bf_15,
	input [17:0] WoxrXtYt_1_15,
	input [17:0] Woc_15,
	input [17:0] bo_15,
	input [17:0] WcxrXtYt_1_15,
	input [17:0] bc_15,
	output [17:0] out_mt_15,
	output [17:0] out_ct_15,
	output o_valid,
	output o_ready
);

reg reg_i_valid, reg_o_valid;
reg [17:0] reg_Ct_1_0;
reg [17:0] reg_WixrXtYt_1_0;
reg [17:0] reg_Wic_0;
reg [17:0] reg_bi_0;
reg [17:0] reg_WfxrXtYt_1_0;
reg [17:0] reg_Wfc_0;
reg [17:0] reg_bf_0;
reg [17:0] reg_WoxrXtYt_1_0;
reg [17:0] reg_Woc_0;
reg [17:0] reg_bo_0;
reg [17:0] reg_WcxrXtYt_1_0;
reg [17:0] reg_bc_0;
reg [17:0] reg_out_mt_0;
reg [17:0] reg_out_ct_0;
reg [17:0] reg_Ct_1_1;
reg [17:0] reg_WixrXtYt_1_1;
reg [17:0] reg_Wic_1;
reg [17:0] reg_bi_1;
reg [17:0] reg_WfxrXtYt_1_1;
reg [17:0] reg_Wfc_1;
reg [17:0] reg_bf_1;
reg [17:0] reg_WoxrXtYt_1_1;
reg [17:0] reg_Woc_1;
reg [17:0] reg_bo_1;
reg [17:0] reg_WcxrXtYt_1_1;
reg [17:0] reg_bc_1;
reg [17:0] reg_out_mt_1;
reg [17:0] reg_out_ct_1;
reg [17:0] reg_Ct_1_2;
reg [17:0] reg_WixrXtYt_1_2;
reg [17:0] reg_Wic_2;
reg [17:0] reg_bi_2;
reg [17:0] reg_WfxrXtYt_1_2;
reg [17:0] reg_Wfc_2;
reg [17:0] reg_bf_2;
reg [17:0] reg_WoxrXtYt_1_2;
reg [17:0] reg_Woc_2;
reg [17:0] reg_bo_2;
reg [17:0] reg_WcxrXtYt_1_2;
reg [17:0] reg_bc_2;
reg [17:0] reg_out_mt_2;
reg [17:0] reg_out_ct_2;
reg [17:0] reg_Ct_1_3;
reg [17:0] reg_WixrXtYt_1_3;
reg [17:0] reg_Wic_3;
reg [17:0] reg_bi_3;
reg [17:0] reg_WfxrXtYt_1_3;
reg [17:0] reg_Wfc_3;
reg [17:0] reg_bf_3;
reg [17:0] reg_WoxrXtYt_1_3;
reg [17:0] reg_Woc_3;
reg [17:0] reg_bo_3;
reg [17:0] reg_WcxrXtYt_1_3;
reg [17:0] reg_bc_3;
reg [17:0] reg_out_mt_3;
reg [17:0] reg_out_ct_3;
reg [17:0] reg_Ct_1_4;
reg [17:0] reg_WixrXtYt_1_4;
reg [17:0] reg_Wic_4;
reg [17:0] reg_bi_4;
reg [17:0] reg_WfxrXtYt_1_4;
reg [17:0] reg_Wfc_4;
reg [17:0] reg_bf_4;
reg [17:0] reg_WoxrXtYt_1_4;
reg [17:0] reg_Woc_4;
reg [17:0] reg_bo_4;
reg [17:0] reg_WcxrXtYt_1_4;
reg [17:0] reg_bc_4;
reg [17:0] reg_out_mt_4;
reg [17:0] reg_out_ct_4;
reg [17:0] reg_Ct_1_5;
reg [17:0] reg_WixrXtYt_1_5;
reg [17:0] reg_Wic_5;
reg [17:0] reg_bi_5;
reg [17:0] reg_WfxrXtYt_1_5;
reg [17:0] reg_Wfc_5;
reg [17:0] reg_bf_5;
reg [17:0] reg_WoxrXtYt_1_5;
reg [17:0] reg_Woc_5;
reg [17:0] reg_bo_5;
reg [17:0] reg_WcxrXtYt_1_5;
reg [17:0] reg_bc_5;
reg [17:0] reg_out_mt_5;
reg [17:0] reg_out_ct_5;
reg [17:0] reg_Ct_1_6;
reg [17:0] reg_WixrXtYt_1_6;
reg [17:0] reg_Wic_6;
reg [17:0] reg_bi_6;
reg [17:0] reg_WfxrXtYt_1_6;
reg [17:0] reg_Wfc_6;
reg [17:0] reg_bf_6;
reg [17:0] reg_WoxrXtYt_1_6;
reg [17:0] reg_Woc_6;
reg [17:0] reg_bo_6;
reg [17:0] reg_WcxrXtYt_1_6;
reg [17:0] reg_bc_6;
reg [17:0] reg_out_mt_6;
reg [17:0] reg_out_ct_6;
reg [17:0] reg_Ct_1_7;
reg [17:0] reg_WixrXtYt_1_7;
reg [17:0] reg_Wic_7;
reg [17:0] reg_bi_7;
reg [17:0] reg_WfxrXtYt_1_7;
reg [17:0] reg_Wfc_7;
reg [17:0] reg_bf_7;
reg [17:0] reg_WoxrXtYt_1_7;
reg [17:0] reg_Woc_7;
reg [17:0] reg_bo_7;
reg [17:0] reg_WcxrXtYt_1_7;
reg [17:0] reg_bc_7;
reg [17:0] reg_out_mt_7;
reg [17:0] reg_out_ct_7;
reg [17:0] reg_Ct_1_8;
reg [17:0] reg_WixrXtYt_1_8;
reg [17:0] reg_Wic_8;
reg [17:0] reg_bi_8;
reg [17:0] reg_WfxrXtYt_1_8;
reg [17:0] reg_Wfc_8;
reg [17:0] reg_bf_8;
reg [17:0] reg_WoxrXtYt_1_8;
reg [17:0] reg_Woc_8;
reg [17:0] reg_bo_8;
reg [17:0] reg_WcxrXtYt_1_8;
reg [17:0] reg_bc_8;
reg [17:0] reg_out_mt_8;
reg [17:0] reg_out_ct_8;
reg [17:0] reg_Ct_1_9;
reg [17:0] reg_WixrXtYt_1_9;
reg [17:0] reg_Wic_9;
reg [17:0] reg_bi_9;
reg [17:0] reg_WfxrXtYt_1_9;
reg [17:0] reg_Wfc_9;
reg [17:0] reg_bf_9;
reg [17:0] reg_WoxrXtYt_1_9;
reg [17:0] reg_Woc_9;
reg [17:0] reg_bo_9;
reg [17:0] reg_WcxrXtYt_1_9;
reg [17:0] reg_bc_9;
reg [17:0] reg_out_mt_9;
reg [17:0] reg_out_ct_9;
reg [17:0] reg_Ct_1_10;
reg [17:0] reg_WixrXtYt_1_10;
reg [17:0] reg_Wic_10;
reg [17:0] reg_bi_10;
reg [17:0] reg_WfxrXtYt_1_10;
reg [17:0] reg_Wfc_10;
reg [17:0] reg_bf_10;
reg [17:0] reg_WoxrXtYt_1_10;
reg [17:0] reg_Woc_10;
reg [17:0] reg_bo_10;
reg [17:0] reg_WcxrXtYt_1_10;
reg [17:0] reg_bc_10;
reg [17:0] reg_out_mt_10;
reg [17:0] reg_out_ct_10;
reg [17:0] reg_Ct_1_11;
reg [17:0] reg_WixrXtYt_1_11;
reg [17:0] reg_Wic_11;
reg [17:0] reg_bi_11;
reg [17:0] reg_WfxrXtYt_1_11;
reg [17:0] reg_Wfc_11;
reg [17:0] reg_bf_11;
reg [17:0] reg_WoxrXtYt_1_11;
reg [17:0] reg_Woc_11;
reg [17:0] reg_bo_11;
reg [17:0] reg_WcxrXtYt_1_11;
reg [17:0] reg_bc_11;
reg [17:0] reg_out_mt_11;
reg [17:0] reg_out_ct_11;
reg [17:0] reg_Ct_1_12;
reg [17:0] reg_WixrXtYt_1_12;
reg [17:0] reg_Wic_12;
reg [17:0] reg_bi_12;
reg [17:0] reg_WfxrXtYt_1_12;
reg [17:0] reg_Wfc_12;
reg [17:0] reg_bf_12;
reg [17:0] reg_WoxrXtYt_1_12;
reg [17:0] reg_Woc_12;
reg [17:0] reg_bo_12;
reg [17:0] reg_WcxrXtYt_1_12;
reg [17:0] reg_bc_12;
reg [17:0] reg_out_mt_12;
reg [17:0] reg_out_ct_12;
reg [17:0] reg_Ct_1_13;
reg [17:0] reg_WixrXtYt_1_13;
reg [17:0] reg_Wic_13;
reg [17:0] reg_bi_13;
reg [17:0] reg_WfxrXtYt_1_13;
reg [17:0] reg_Wfc_13;
reg [17:0] reg_bf_13;
reg [17:0] reg_WoxrXtYt_1_13;
reg [17:0] reg_Woc_13;
reg [17:0] reg_bo_13;
reg [17:0] reg_WcxrXtYt_1_13;
reg [17:0] reg_bc_13;
reg [17:0] reg_out_mt_13;
reg [17:0] reg_out_ct_13;
reg [17:0] reg_Ct_1_14;
reg [17:0] reg_WixrXtYt_1_14;
reg [17:0] reg_Wic_14;
reg [17:0] reg_bi_14;
reg [17:0] reg_WfxrXtYt_1_14;
reg [17:0] reg_Wfc_14;
reg [17:0] reg_bf_14;
reg [17:0] reg_WoxrXtYt_1_14;
reg [17:0] reg_Woc_14;
reg [17:0] reg_bo_14;
reg [17:0] reg_WcxrXtYt_1_14;
reg [17:0] reg_bc_14;
reg [17:0] reg_out_mt_14;
reg [17:0] reg_out_ct_14;
reg [17:0] reg_Ct_1_15;
reg [17:0] reg_WixrXtYt_1_15;
reg [17:0] reg_Wic_15;
reg [17:0] reg_bi_15;
reg [17:0] reg_WfxrXtYt_1_15;
reg [17:0] reg_Wfc_15;
reg [17:0] reg_bf_15;
reg [17:0] reg_WoxrXtYt_1_15;
reg [17:0] reg_Woc_15;
reg [17:0] reg_bo_15;
reg [17:0] reg_WcxrXtYt_1_15;
reg [17:0] reg_bc_15;
reg [17:0] reg_out_mt_15;
reg [17:0] reg_out_ct_15;

wire input_gate_valid, forget_gate_valid, output_gate_valid, gt_valid;
wire it_gt_mult_valid, ft_Ct_1_mult_valid;
wire ct_valid;
wire tanh_valid_0;
wire [17:0] o_Ct_1_0;
wire [17:0] Ct_1_hold_0;
wire [17:0] o_input_gate_0;
wire [17:0] o_forget_gate_0;
wire [17:0] o_output_gate_0;
wire [17:0] ot_hold_0;
wire [17:0] o_gt_0;
wire [17:0] gt_hold_0;
wire [17:0] o_it_gt_mult_0;
wire [17:0] o_ft_Ct_1_mult_0;
wire [17:0] o_ct_0;
wire [17:0] ct_hold_0;
wire [17:0] o_tanh_0;
wire [17:0] o_mt_0;
wire tanh_valid_1;
wire [17:0] o_Ct_1_1;
wire [17:0] Ct_1_hold_1;
wire [17:0] o_input_gate_1;
wire [17:0] o_forget_gate_1;
wire [17:0] o_output_gate_1;
wire [17:0] ot_hold_1;
wire [17:0] o_gt_1;
wire [17:0] gt_hold_1;
wire [17:0] o_it_gt_mult_1;
wire [17:0] o_ft_Ct_1_mult_1;
wire [17:0] o_ct_1;
wire [17:0] ct_hold_1;
wire [17:0] o_tanh_1;
wire [17:0] o_mt_1;
wire tanh_valid_2;
wire [17:0] o_Ct_1_2;
wire [17:0] Ct_1_hold_2;
wire [17:0] o_input_gate_2;
wire [17:0] o_forget_gate_2;
wire [17:0] o_output_gate_2;
wire [17:0] ot_hold_2;
wire [17:0] o_gt_2;
wire [17:0] gt_hold_2;
wire [17:0] o_it_gt_mult_2;
wire [17:0] o_ft_Ct_1_mult_2;
wire [17:0] o_ct_2;
wire [17:0] ct_hold_2;
wire [17:0] o_tanh_2;
wire [17:0] o_mt_2;
wire tanh_valid_3;
wire [17:0] o_Ct_1_3;
wire [17:0] Ct_1_hold_3;
wire [17:0] o_input_gate_3;
wire [17:0] o_forget_gate_3;
wire [17:0] o_output_gate_3;
wire [17:0] ot_hold_3;
wire [17:0] o_gt_3;
wire [17:0] gt_hold_3;
wire [17:0] o_it_gt_mult_3;
wire [17:0] o_ft_Ct_1_mult_3;
wire [17:0] o_ct_3;
wire [17:0] ct_hold_3;
wire [17:0] o_tanh_3;
wire [17:0] o_mt_3;
wire tanh_valid_4;
wire [17:0] o_Ct_1_4;
wire [17:0] Ct_1_hold_4;
wire [17:0] o_input_gate_4;
wire [17:0] o_forget_gate_4;
wire [17:0] o_output_gate_4;
wire [17:0] ot_hold_4;
wire [17:0] o_gt_4;
wire [17:0] gt_hold_4;
wire [17:0] o_it_gt_mult_4;
wire [17:0] o_ft_Ct_1_mult_4;
wire [17:0] o_ct_4;
wire [17:0] ct_hold_4;
wire [17:0] o_tanh_4;
wire [17:0] o_mt_4;
wire tanh_valid_5;
wire [17:0] o_Ct_1_5;
wire [17:0] Ct_1_hold_5;
wire [17:0] o_input_gate_5;
wire [17:0] o_forget_gate_5;
wire [17:0] o_output_gate_5;
wire [17:0] ot_hold_5;
wire [17:0] o_gt_5;
wire [17:0] gt_hold_5;
wire [17:0] o_it_gt_mult_5;
wire [17:0] o_ft_Ct_1_mult_5;
wire [17:0] o_ct_5;
wire [17:0] ct_hold_5;
wire [17:0] o_tanh_5;
wire [17:0] o_mt_5;
wire tanh_valid_6;
wire [17:0] o_Ct_1_6;
wire [17:0] Ct_1_hold_6;
wire [17:0] o_input_gate_6;
wire [17:0] o_forget_gate_6;
wire [17:0] o_output_gate_6;
wire [17:0] ot_hold_6;
wire [17:0] o_gt_6;
wire [17:0] gt_hold_6;
wire [17:0] o_it_gt_mult_6;
wire [17:0] o_ft_Ct_1_mult_6;
wire [17:0] o_ct_6;
wire [17:0] ct_hold_6;
wire [17:0] o_tanh_6;
wire [17:0] o_mt_6;
wire tanh_valid_7;
wire [17:0] o_Ct_1_7;
wire [17:0] Ct_1_hold_7;
wire [17:0] o_input_gate_7;
wire [17:0] o_forget_gate_7;
wire [17:0] o_output_gate_7;
wire [17:0] ot_hold_7;
wire [17:0] o_gt_7;
wire [17:0] gt_hold_7;
wire [17:0] o_it_gt_mult_7;
wire [17:0] o_ft_Ct_1_mult_7;
wire [17:0] o_ct_7;
wire [17:0] ct_hold_7;
wire [17:0] o_tanh_7;
wire [17:0] o_mt_7;
wire tanh_valid_8;
wire [17:0] o_Ct_1_8;
wire [17:0] Ct_1_hold_8;
wire [17:0] o_input_gate_8;
wire [17:0] o_forget_gate_8;
wire [17:0] o_output_gate_8;
wire [17:0] ot_hold_8;
wire [17:0] o_gt_8;
wire [17:0] gt_hold_8;
wire [17:0] o_it_gt_mult_8;
wire [17:0] o_ft_Ct_1_mult_8;
wire [17:0] o_ct_8;
wire [17:0] ct_hold_8;
wire [17:0] o_tanh_8;
wire [17:0] o_mt_8;
wire tanh_valid_9;
wire [17:0] o_Ct_1_9;
wire [17:0] Ct_1_hold_9;
wire [17:0] o_input_gate_9;
wire [17:0] o_forget_gate_9;
wire [17:0] o_output_gate_9;
wire [17:0] ot_hold_9;
wire [17:0] o_gt_9;
wire [17:0] gt_hold_9;
wire [17:0] o_it_gt_mult_9;
wire [17:0] o_ft_Ct_1_mult_9;
wire [17:0] o_ct_9;
wire [17:0] ct_hold_9;
wire [17:0] o_tanh_9;
wire [17:0] o_mt_9;
wire tanh_valid_10;
wire [17:0] o_Ct_1_10;
wire [17:0] Ct_1_hold_10;
wire [17:0] o_input_gate_10;
wire [17:0] o_forget_gate_10;
wire [17:0] o_output_gate_10;
wire [17:0] ot_hold_10;
wire [17:0] o_gt_10;
wire [17:0] gt_hold_10;
wire [17:0] o_it_gt_mult_10;
wire [17:0] o_ft_Ct_1_mult_10;
wire [17:0] o_ct_10;
wire [17:0] ct_hold_10;
wire [17:0] o_tanh_10;
wire [17:0] o_mt_10;
wire tanh_valid_11;
wire [17:0] o_Ct_1_11;
wire [17:0] Ct_1_hold_11;
wire [17:0] o_input_gate_11;
wire [17:0] o_forget_gate_11;
wire [17:0] o_output_gate_11;
wire [17:0] ot_hold_11;
wire [17:0] o_gt_11;
wire [17:0] gt_hold_11;
wire [17:0] o_it_gt_mult_11;
wire [17:0] o_ft_Ct_1_mult_11;
wire [17:0] o_ct_11;
wire [17:0] ct_hold_11;
wire [17:0] o_tanh_11;
wire [17:0] o_mt_11;
wire tanh_valid_12;
wire [17:0] o_Ct_1_12;
wire [17:0] Ct_1_hold_12;
wire [17:0] o_input_gate_12;
wire [17:0] o_forget_gate_12;
wire [17:0] o_output_gate_12;
wire [17:0] ot_hold_12;
wire [17:0] o_gt_12;
wire [17:0] gt_hold_12;
wire [17:0] o_it_gt_mult_12;
wire [17:0] o_ft_Ct_1_mult_12;
wire [17:0] o_ct_12;
wire [17:0] ct_hold_12;
wire [17:0] o_tanh_12;
wire [17:0] o_mt_12;
wire tanh_valid_13;
wire [17:0] o_Ct_1_13;
wire [17:0] Ct_1_hold_13;
wire [17:0] o_input_gate_13;
wire [17:0] o_forget_gate_13;
wire [17:0] o_output_gate_13;
wire [17:0] ot_hold_13;
wire [17:0] o_gt_13;
wire [17:0] gt_hold_13;
wire [17:0] o_it_gt_mult_13;
wire [17:0] o_ft_Ct_1_mult_13;
wire [17:0] o_ct_13;
wire [17:0] ct_hold_13;
wire [17:0] o_tanh_13;
wire [17:0] o_mt_13;
wire tanh_valid_14;
wire [17:0] o_Ct_1_14;
wire [17:0] Ct_1_hold_14;
wire [17:0] o_input_gate_14;
wire [17:0] o_forget_gate_14;
wire [17:0] o_output_gate_14;
wire [17:0] ot_hold_14;
wire [17:0] o_gt_14;
wire [17:0] gt_hold_14;
wire [17:0] o_it_gt_mult_14;
wire [17:0] o_ft_Ct_1_mult_14;
wire [17:0] o_ct_14;
wire [17:0] ct_hold_14;
wire [17:0] o_tanh_14;
wire [17:0] o_mt_14;
wire tanh_valid_15;
wire [17:0] o_Ct_1_15;
wire [17:0] Ct_1_hold_15;
wire [17:0] o_input_gate_15;
wire [17:0] o_forget_gate_15;
wire [17:0] o_output_gate_15;
wire [17:0] ot_hold_15;
wire [17:0] o_gt_15;
wire [17:0] gt_hold_15;
wire [17:0] o_it_gt_mult_15;
wire [17:0] o_ft_Ct_1_mult_15;
wire [17:0] o_ct_15;
wire [17:0] ct_hold_15;
wire [17:0] o_tanh_15;
wire [17:0] o_mt_15;
wire mt_valid;

lstm_gate_18_10_16_1 lstm_gate_18_10_16_1_input (
	.clk(clk),
	.reset(reset),
	.i_ready(enable),
	.i_valid(reg_i_valid),
	.stage1_result_0(reg_WixrXtYt_1_0),
	.weight_0(reg_Wic_0),
	.Ct_1_0(reg_Ct_1_0),
	.bias_0(reg_bi_0),
	.gate_output_0(o_input_gate_0),
	.stage1_result_1(reg_WixrXtYt_1_1),
	.weight_1(reg_Wic_1),
	.Ct_1_1(reg_Ct_1_1),
	.bias_1(reg_bi_1),
	.gate_output_1(o_input_gate_1),
	.stage1_result_2(reg_WixrXtYt_1_2),
	.weight_2(reg_Wic_2),
	.Ct_1_2(reg_Ct_1_2),
	.bias_2(reg_bi_2),
	.gate_output_2(o_input_gate_2),
	.stage1_result_3(reg_WixrXtYt_1_3),
	.weight_3(reg_Wic_3),
	.Ct_1_3(reg_Ct_1_3),
	.bias_3(reg_bi_3),
	.gate_output_3(o_input_gate_3),
	.stage1_result_4(reg_WixrXtYt_1_4),
	.weight_4(reg_Wic_4),
	.Ct_1_4(reg_Ct_1_4),
	.bias_4(reg_bi_4),
	.gate_output_4(o_input_gate_4),
	.stage1_result_5(reg_WixrXtYt_1_5),
	.weight_5(reg_Wic_5),
	.Ct_1_5(reg_Ct_1_5),
	.bias_5(reg_bi_5),
	.gate_output_5(o_input_gate_5),
	.stage1_result_6(reg_WixrXtYt_1_6),
	.weight_6(reg_Wic_6),
	.Ct_1_6(reg_Ct_1_6),
	.bias_6(reg_bi_6),
	.gate_output_6(o_input_gate_6),
	.stage1_result_7(reg_WixrXtYt_1_7),
	.weight_7(reg_Wic_7),
	.Ct_1_7(reg_Ct_1_7),
	.bias_7(reg_bi_7),
	.gate_output_7(o_input_gate_7),
	.stage1_result_8(reg_WixrXtYt_1_8),
	.weight_8(reg_Wic_8),
	.Ct_1_8(reg_Ct_1_8),
	.bias_8(reg_bi_8),
	.gate_output_8(o_input_gate_8),
	.stage1_result_9(reg_WixrXtYt_1_9),
	.weight_9(reg_Wic_9),
	.Ct_1_9(reg_Ct_1_9),
	.bias_9(reg_bi_9),
	.gate_output_9(o_input_gate_9),
	.stage1_result_10(reg_WixrXtYt_1_10),
	.weight_10(reg_Wic_10),
	.Ct_1_10(reg_Ct_1_10),
	.bias_10(reg_bi_10),
	.gate_output_10(o_input_gate_10),
	.stage1_result_11(reg_WixrXtYt_1_11),
	.weight_11(reg_Wic_11),
	.Ct_1_11(reg_Ct_1_11),
	.bias_11(reg_bi_11),
	.gate_output_11(o_input_gate_11),
	.stage1_result_12(reg_WixrXtYt_1_12),
	.weight_12(reg_Wic_12),
	.Ct_1_12(reg_Ct_1_12),
	.bias_12(reg_bi_12),
	.gate_output_12(o_input_gate_12),
	.stage1_result_13(reg_WixrXtYt_1_13),
	.weight_13(reg_Wic_13),
	.Ct_1_13(reg_Ct_1_13),
	.bias_13(reg_bi_13),
	.gate_output_13(o_input_gate_13),
	.stage1_result_14(reg_WixrXtYt_1_14),
	.weight_14(reg_Wic_14),
	.Ct_1_14(reg_Ct_1_14),
	.bias_14(reg_bi_14),
	.gate_output_14(o_input_gate_14),
	.stage1_result_15(reg_WixrXtYt_1_15),
	.weight_15(reg_Wic_15),
	.Ct_1_15(reg_Ct_1_15),
	.bias_15(reg_bi_15),
	.gate_output_15(o_input_gate_15),
	.o_valid(input_gate_valid),
	.o_ready()
);

lstm_gate_18_10_16_1 lstm_gate_18_10_16_1_forget (
	.clk(clk),
	.reset(reset),
	.i_ready(enable),
	.i_valid(reg_i_valid),
	.stage1_result_0(reg_WfxrXtYt_1_0),
	.weight_0(reg_Wfc_0),
	.Ct_1_0(reg_Ct_1_0),
	.bias_0(reg_bf_0),
	.gate_output_0(o_forget_gate_0),
	.stage1_result_1(reg_WfxrXtYt_1_1),
	.weight_1(reg_Wfc_1),
	.Ct_1_1(reg_Ct_1_1),
	.bias_1(reg_bf_1),
	.gate_output_1(o_forget_gate_1),
	.stage1_result_2(reg_WfxrXtYt_1_2),
	.weight_2(reg_Wfc_2),
	.Ct_1_2(reg_Ct_1_2),
	.bias_2(reg_bf_2),
	.gate_output_2(o_forget_gate_2),
	.stage1_result_3(reg_WfxrXtYt_1_3),
	.weight_3(reg_Wfc_3),
	.Ct_1_3(reg_Ct_1_3),
	.bias_3(reg_bf_3),
	.gate_output_3(o_forget_gate_3),
	.stage1_result_4(reg_WfxrXtYt_1_4),
	.weight_4(reg_Wfc_4),
	.Ct_1_4(reg_Ct_1_4),
	.bias_4(reg_bf_4),
	.gate_output_4(o_forget_gate_4),
	.stage1_result_5(reg_WfxrXtYt_1_5),
	.weight_5(reg_Wfc_5),
	.Ct_1_5(reg_Ct_1_5),
	.bias_5(reg_bf_5),
	.gate_output_5(o_forget_gate_5),
	.stage1_result_6(reg_WfxrXtYt_1_6),
	.weight_6(reg_Wfc_6),
	.Ct_1_6(reg_Ct_1_6),
	.bias_6(reg_bf_6),
	.gate_output_6(o_forget_gate_6),
	.stage1_result_7(reg_WfxrXtYt_1_7),
	.weight_7(reg_Wfc_7),
	.Ct_1_7(reg_Ct_1_7),
	.bias_7(reg_bf_7),
	.gate_output_7(o_forget_gate_7),
	.stage1_result_8(reg_WfxrXtYt_1_8),
	.weight_8(reg_Wfc_8),
	.Ct_1_8(reg_Ct_1_8),
	.bias_8(reg_bf_8),
	.gate_output_8(o_forget_gate_8),
	.stage1_result_9(reg_WfxrXtYt_1_9),
	.weight_9(reg_Wfc_9),
	.Ct_1_9(reg_Ct_1_9),
	.bias_9(reg_bf_9),
	.gate_output_9(o_forget_gate_9),
	.stage1_result_10(reg_WfxrXtYt_1_10),
	.weight_10(reg_Wfc_10),
	.Ct_1_10(reg_Ct_1_10),
	.bias_10(reg_bf_10),
	.gate_output_10(o_forget_gate_10),
	.stage1_result_11(reg_WfxrXtYt_1_11),
	.weight_11(reg_Wfc_11),
	.Ct_1_11(reg_Ct_1_11),
	.bias_11(reg_bf_11),
	.gate_output_11(o_forget_gate_11),
	.stage1_result_12(reg_WfxrXtYt_1_12),
	.weight_12(reg_Wfc_12),
	.Ct_1_12(reg_Ct_1_12),
	.bias_12(reg_bf_12),
	.gate_output_12(o_forget_gate_12),
	.stage1_result_13(reg_WfxrXtYt_1_13),
	.weight_13(reg_Wfc_13),
	.Ct_1_13(reg_Ct_1_13),
	.bias_13(reg_bf_13),
	.gate_output_13(o_forget_gate_13),
	.stage1_result_14(reg_WfxrXtYt_1_14),
	.weight_14(reg_Wfc_14),
	.Ct_1_14(reg_Ct_1_14),
	.bias_14(reg_bf_14),
	.gate_output_14(o_forget_gate_14),
	.stage1_result_15(reg_WfxrXtYt_1_15),
	.weight_15(reg_Wfc_15),
	.Ct_1_15(reg_Ct_1_15),
	.bias_15(reg_bf_15),
	.gate_output_15(o_forget_gate_15),
	.o_valid(forget_gate_valid),
	.o_ready()
);

lstm_gate_18_10_16_1 lstm_gate_18_10_16_1_output (
	.clk(clk),
	.reset(reset),
	.i_ready(enable),
	.i_valid(reg_i_valid),
	.stage1_result_0(reg_WoxrXtYt_1_0),
	.weight_0(reg_Woc_0),
	.Ct_1_0(reg_Ct_1_0),
	.bias_0(reg_bo_0),
	.gate_output_0(o_output_gate_0),
	.stage1_result_1(reg_WoxrXtYt_1_1),
	.weight_1(reg_Woc_1),
	.Ct_1_1(reg_Ct_1_1),
	.bias_1(reg_bo_1),
	.gate_output_1(o_output_gate_1),
	.stage1_result_2(reg_WoxrXtYt_1_2),
	.weight_2(reg_Woc_2),
	.Ct_1_2(reg_Ct_1_2),
	.bias_2(reg_bo_2),
	.gate_output_2(o_output_gate_2),
	.stage1_result_3(reg_WoxrXtYt_1_3),
	.weight_3(reg_Woc_3),
	.Ct_1_3(reg_Ct_1_3),
	.bias_3(reg_bo_3),
	.gate_output_3(o_output_gate_3),
	.stage1_result_4(reg_WoxrXtYt_1_4),
	.weight_4(reg_Woc_4),
	.Ct_1_4(reg_Ct_1_4),
	.bias_4(reg_bo_4),
	.gate_output_4(o_output_gate_4),
	.stage1_result_5(reg_WoxrXtYt_1_5),
	.weight_5(reg_Woc_5),
	.Ct_1_5(reg_Ct_1_5),
	.bias_5(reg_bo_5),
	.gate_output_5(o_output_gate_5),
	.stage1_result_6(reg_WoxrXtYt_1_6),
	.weight_6(reg_Woc_6),
	.Ct_1_6(reg_Ct_1_6),
	.bias_6(reg_bo_6),
	.gate_output_6(o_output_gate_6),
	.stage1_result_7(reg_WoxrXtYt_1_7),
	.weight_7(reg_Woc_7),
	.Ct_1_7(reg_Ct_1_7),
	.bias_7(reg_bo_7),
	.gate_output_7(o_output_gate_7),
	.stage1_result_8(reg_WoxrXtYt_1_8),
	.weight_8(reg_Woc_8),
	.Ct_1_8(reg_Ct_1_8),
	.bias_8(reg_bo_8),
	.gate_output_8(o_output_gate_8),
	.stage1_result_9(reg_WoxrXtYt_1_9),
	.weight_9(reg_Woc_9),
	.Ct_1_9(reg_Ct_1_9),
	.bias_9(reg_bo_9),
	.gate_output_9(o_output_gate_9),
	.stage1_result_10(reg_WoxrXtYt_1_10),
	.weight_10(reg_Woc_10),
	.Ct_1_10(reg_Ct_1_10),
	.bias_10(reg_bo_10),
	.gate_output_10(o_output_gate_10),
	.stage1_result_11(reg_WoxrXtYt_1_11),
	.weight_11(reg_Woc_11),
	.Ct_1_11(reg_Ct_1_11),
	.bias_11(reg_bo_11),
	.gate_output_11(o_output_gate_11),
	.stage1_result_12(reg_WoxrXtYt_1_12),
	.weight_12(reg_Woc_12),
	.Ct_1_12(reg_Ct_1_12),
	.bias_12(reg_bo_12),
	.gate_output_12(o_output_gate_12),
	.stage1_result_13(reg_WoxrXtYt_1_13),
	.weight_13(reg_Woc_13),
	.Ct_1_13(reg_Ct_1_13),
	.bias_13(reg_bo_13),
	.gate_output_13(o_output_gate_13),
	.stage1_result_14(reg_WoxrXtYt_1_14),
	.weight_14(reg_Woc_14),
	.Ct_1_14(reg_Ct_1_14),
	.bias_14(reg_bo_14),
	.gate_output_14(o_output_gate_14),
	.stage1_result_15(reg_WoxrXtYt_1_15),
	.weight_15(reg_Woc_15),
	.Ct_1_15(reg_Ct_1_15),
	.bias_15(reg_bo_15),
	.gate_output_15(o_output_gate_15),
	.o_valid(output_gate_valid),
	.o_ready()
);

output_activation_18_10_16_1 output_activation_18_10_16_1_inst (
	.clk(clk),
	.reset(reset),
	.i_ready(enable),
	.i_valid(reg_i_valid),
	.stage1_result_0(reg_WcxrXtYt_1_0),
	.bias_0(reg_bc_0),
	.output_value_0(o_gt_0),
	.stage1_result_1(reg_WcxrXtYt_1_1),
	.bias_1(reg_bc_1),
	.output_value_1(o_gt_1),
	.stage1_result_2(reg_WcxrXtYt_1_2),
	.bias_2(reg_bc_2),
	.output_value_2(o_gt_2),
	.stage1_result_3(reg_WcxrXtYt_1_3),
	.bias_3(reg_bc_3),
	.output_value_3(o_gt_3),
	.stage1_result_4(reg_WcxrXtYt_1_4),
	.bias_4(reg_bc_4),
	.output_value_4(o_gt_4),
	.stage1_result_5(reg_WcxrXtYt_1_5),
	.bias_5(reg_bc_5),
	.output_value_5(o_gt_5),
	.stage1_result_6(reg_WcxrXtYt_1_6),
	.bias_6(reg_bc_6),
	.output_value_6(o_gt_6),
	.stage1_result_7(reg_WcxrXtYt_1_7),
	.bias_7(reg_bc_7),
	.output_value_7(o_gt_7),
	.stage1_result_8(reg_WcxrXtYt_1_8),
	.bias_8(reg_bc_8),
	.output_value_8(o_gt_8),
	.stage1_result_9(reg_WcxrXtYt_1_9),
	.bias_9(reg_bc_9),
	.output_value_9(o_gt_9),
	.stage1_result_10(reg_WcxrXtYt_1_10),
	.bias_10(reg_bc_10),
	.output_value_10(o_gt_10),
	.stage1_result_11(reg_WcxrXtYt_1_11),
	.bias_11(reg_bc_11),
	.output_value_11(o_gt_11),
	.stage1_result_12(reg_WcxrXtYt_1_12),
	.bias_12(reg_bc_12),
	.output_value_12(o_gt_12),
	.stage1_result_13(reg_WcxrXtYt_1_13),
	.bias_13(reg_bc_13),
	.output_value_13(o_gt_13),
	.stage1_result_14(reg_WcxrXtYt_1_14),
	.bias_14(reg_bc_14),
	.output_value_14(o_gt_14),
	.stage1_result_15(reg_WcxrXtYt_1_15),
	.bias_15(reg_bc_15),
	.output_value_15(o_gt_15),
	.o_valid(gt_valid),
	.o_ready()
);

shift_register_group_18_16_6 shift_register_group_18_16_6_eltwisemult (
	.clk(clk),
	.enable(enable),
	.in_0(o_gt_0),
	.out_0(gt_hold_0),
	.in_1(o_gt_1),
	.out_1(gt_hold_1),
	.in_2(o_gt_2),
	.out_2(gt_hold_2),
	.in_3(o_gt_3),
	.out_3(gt_hold_3),
	.in_4(o_gt_4),
	.out_4(gt_hold_4),
	.in_5(o_gt_5),
	.out_5(gt_hold_5),
	.in_6(o_gt_6),
	.out_6(gt_hold_6),
	.in_7(o_gt_7),
	.out_7(gt_hold_7),
	.in_8(o_gt_8),
	.out_8(gt_hold_8),
	.in_9(o_gt_9),
	.out_9(gt_hold_9),
	.in_10(o_gt_10),
	.out_10(gt_hold_10),
	.in_11(o_gt_11),
	.out_11(gt_hold_11),
	.in_12(o_gt_12),
	.out_12(gt_hold_12),
	.in_13(o_gt_13),
	.out_13(gt_hold_13),
	.in_14(o_gt_14),
	.out_14(gt_hold_14),
	.in_15(o_gt_15),
	.out_15(gt_hold_15),
	.reset(reset)
);

elementwise_mult_core_18_18_10_16_1 elementwise_mult_core_18_18_10_16_1_it_gt_mult (
	.clk(clk),
	.reset(reset),
	.i_valid(forget_gate_valid),
	.i_ready(enable),
	.i_A_0(o_input_gate_0),
	.i_B_0(gt_hold_0),
	.o_C_0(o_it_gt_mult_0),
	.i_A_1(o_input_gate_1),
	.i_B_1(gt_hold_1),
	.o_C_1(o_it_gt_mult_1),
	.i_A_2(o_input_gate_2),
	.i_B_2(gt_hold_2),
	.o_C_2(o_it_gt_mult_2),
	.i_A_3(o_input_gate_3),
	.i_B_3(gt_hold_3),
	.o_C_3(o_it_gt_mult_3),
	.i_A_4(o_input_gate_4),
	.i_B_4(gt_hold_4),
	.o_C_4(o_it_gt_mult_4),
	.i_A_5(o_input_gate_5),
	.i_B_5(gt_hold_5),
	.o_C_5(o_it_gt_mult_5),
	.i_A_6(o_input_gate_6),
	.i_B_6(gt_hold_6),
	.o_C_6(o_it_gt_mult_6),
	.i_A_7(o_input_gate_7),
	.i_B_7(gt_hold_7),
	.o_C_7(o_it_gt_mult_7),
	.i_A_8(o_input_gate_8),
	.i_B_8(gt_hold_8),
	.o_C_8(o_it_gt_mult_8),
	.i_A_9(o_input_gate_9),
	.i_B_9(gt_hold_9),
	.o_C_9(o_it_gt_mult_9),
	.i_A_10(o_input_gate_10),
	.i_B_10(gt_hold_10),
	.o_C_10(o_it_gt_mult_10),
	.i_A_11(o_input_gate_11),
	.i_B_11(gt_hold_11),
	.o_C_11(o_it_gt_mult_11),
	.i_A_12(o_input_gate_12),
	.i_B_12(gt_hold_12),
	.o_C_12(o_it_gt_mult_12),
	.i_A_13(o_input_gate_13),
	.i_B_13(gt_hold_13),
	.o_C_13(o_it_gt_mult_13),
	.i_A_14(o_input_gate_14),
	.i_B_14(gt_hold_14),
	.o_C_14(o_it_gt_mult_14),
	.i_A_15(o_input_gate_15),
	.i_B_15(gt_hold_15),
	.o_C_15(o_it_gt_mult_15),
	.o_valid(it_gt_mult_valid),
	.o_ready()
);

assign o_Ct_1_0 = reg_Ct_1_0;
assign o_Ct_1_1 = reg_Ct_1_1;
assign o_Ct_1_2 = reg_Ct_1_2;
assign o_Ct_1_3 = reg_Ct_1_3;
assign o_Ct_1_4 = reg_Ct_1_4;
assign o_Ct_1_5 = reg_Ct_1_5;
assign o_Ct_1_6 = reg_Ct_1_6;
assign o_Ct_1_7 = reg_Ct_1_7;
assign o_Ct_1_8 = reg_Ct_1_8;
assign o_Ct_1_9 = reg_Ct_1_9;
assign o_Ct_1_10 = reg_Ct_1_10;
assign o_Ct_1_11 = reg_Ct_1_11;
assign o_Ct_1_12 = reg_Ct_1_12;
assign o_Ct_1_13 = reg_Ct_1_13;
assign o_Ct_1_14 = reg_Ct_1_14;
assign o_Ct_1_15 = reg_Ct_1_15;
shift_register_group_18_16_18 shift_register_group_18_16_18_lstm_gate (
	.clk(clk),
	.enable(enable),
	.in_0(o_Ct_1_0),
	.out_0(Ct_1_hold_0),
	.in_1(o_Ct_1_1),
	.out_1(Ct_1_hold_1),
	.in_2(o_Ct_1_2),
	.out_2(Ct_1_hold_2),
	.in_3(o_Ct_1_3),
	.out_3(Ct_1_hold_3),
	.in_4(o_Ct_1_4),
	.out_4(Ct_1_hold_4),
	.in_5(o_Ct_1_5),
	.out_5(Ct_1_hold_5),
	.in_6(o_Ct_1_6),
	.out_6(Ct_1_hold_6),
	.in_7(o_Ct_1_7),
	.out_7(Ct_1_hold_7),
	.in_8(o_Ct_1_8),
	.out_8(Ct_1_hold_8),
	.in_9(o_Ct_1_9),
	.out_9(Ct_1_hold_9),
	.in_10(o_Ct_1_10),
	.out_10(Ct_1_hold_10),
	.in_11(o_Ct_1_11),
	.out_11(Ct_1_hold_11),
	.in_12(o_Ct_1_12),
	.out_12(Ct_1_hold_12),
	.in_13(o_Ct_1_13),
	.out_13(Ct_1_hold_13),
	.in_14(o_Ct_1_14),
	.out_14(Ct_1_hold_14),
	.in_15(o_Ct_1_15),
	.out_15(Ct_1_hold_15),
	.reset(reset)
);

elementwise_mult_core_18_18_10_16_1 elementwise_mult_core_18_18_10_16_1_ft_Ct_1_mult (
	.clk(clk),
	.reset(reset),
	.i_valid(forget_gate_valid),
	.i_ready(enable),
	.i_A_0(Ct_1_hold_0),
	.i_B_0(o_forget_gate_0),
	.o_C_0(o_ft_Ct_1_mult_0),
	.i_A_1(Ct_1_hold_1),
	.i_B_1(o_forget_gate_1),
	.o_C_1(o_ft_Ct_1_mult_1),
	.i_A_2(Ct_1_hold_2),
	.i_B_2(o_forget_gate_2),
	.o_C_2(o_ft_Ct_1_mult_2),
	.i_A_3(Ct_1_hold_3),
	.i_B_3(o_forget_gate_3),
	.o_C_3(o_ft_Ct_1_mult_3),
	.i_A_4(Ct_1_hold_4),
	.i_B_4(o_forget_gate_4),
	.o_C_4(o_ft_Ct_1_mult_4),
	.i_A_5(Ct_1_hold_5),
	.i_B_5(o_forget_gate_5),
	.o_C_5(o_ft_Ct_1_mult_5),
	.i_A_6(Ct_1_hold_6),
	.i_B_6(o_forget_gate_6),
	.o_C_6(o_ft_Ct_1_mult_6),
	.i_A_7(Ct_1_hold_7),
	.i_B_7(o_forget_gate_7),
	.o_C_7(o_ft_Ct_1_mult_7),
	.i_A_8(Ct_1_hold_8),
	.i_B_8(o_forget_gate_8),
	.o_C_8(o_ft_Ct_1_mult_8),
	.i_A_9(Ct_1_hold_9),
	.i_B_9(o_forget_gate_9),
	.o_C_9(o_ft_Ct_1_mult_9),
	.i_A_10(Ct_1_hold_10),
	.i_B_10(o_forget_gate_10),
	.o_C_10(o_ft_Ct_1_mult_10),
	.i_A_11(Ct_1_hold_11),
	.i_B_11(o_forget_gate_11),
	.o_C_11(o_ft_Ct_1_mult_11),
	.i_A_12(Ct_1_hold_12),
	.i_B_12(o_forget_gate_12),
	.o_C_12(o_ft_Ct_1_mult_12),
	.i_A_13(Ct_1_hold_13),
	.i_B_13(o_forget_gate_13),
	.o_C_13(o_ft_Ct_1_mult_13),
	.i_A_14(Ct_1_hold_14),
	.i_B_14(o_forget_gate_14),
	.o_C_14(o_ft_Ct_1_mult_14),
	.i_A_15(Ct_1_hold_15),
	.i_B_15(o_forget_gate_15),
	.o_C_15(o_ft_Ct_1_mult_15),
	.o_valid(ft_Ct_1_mult_valid),
	.o_ready()
);

wire eltwise_add_core_valid;
assign eltwise_add_core_valid = ft_Ct_1_mult_valid & it_gt_mult_valid;

elementwise_add_core_18_18_16 elementwise_add_core_18_18_16_inst (
	.clk(clk),
	.reset(reset),
	.i_valid(eltwise_add_core_valid),
	.i_ready(enable),
	.i_A_0(o_it_gt_mult_0),
	.i_B_0(o_ft_Ct_1_mult_0),
	.o_C_0(o_ct_0),
	.i_A_1(o_it_gt_mult_1),
	.i_B_1(o_ft_Ct_1_mult_1),
	.o_C_1(o_ct_1),
	.i_A_2(o_it_gt_mult_2),
	.i_B_2(o_ft_Ct_1_mult_2),
	.o_C_2(o_ct_2),
	.i_A_3(o_it_gt_mult_3),
	.i_B_3(o_ft_Ct_1_mult_3),
	.o_C_3(o_ct_3),
	.i_A_4(o_it_gt_mult_4),
	.i_B_4(o_ft_Ct_1_mult_4),
	.o_C_4(o_ct_4),
	.i_A_5(o_it_gt_mult_5),
	.i_B_5(o_ft_Ct_1_mult_5),
	.o_C_5(o_ct_5),
	.i_A_6(o_it_gt_mult_6),
	.i_B_6(o_ft_Ct_1_mult_6),
	.o_C_6(o_ct_6),
	.i_A_7(o_it_gt_mult_7),
	.i_B_7(o_ft_Ct_1_mult_7),
	.o_C_7(o_ct_7),
	.i_A_8(o_it_gt_mult_8),
	.i_B_8(o_ft_Ct_1_mult_8),
	.o_C_8(o_ct_8),
	.i_A_9(o_it_gt_mult_9),
	.i_B_9(o_ft_Ct_1_mult_9),
	.o_C_9(o_ct_9),
	.i_A_10(o_it_gt_mult_10),
	.i_B_10(o_ft_Ct_1_mult_10),
	.o_C_10(o_ct_10),
	.i_A_11(o_it_gt_mult_11),
	.i_B_11(o_ft_Ct_1_mult_11),
	.o_C_11(o_ct_11),
	.i_A_12(o_it_gt_mult_12),
	.i_B_12(o_ft_Ct_1_mult_12),
	.o_C_12(o_ct_12),
	.i_A_13(o_it_gt_mult_13),
	.i_B_13(o_ft_Ct_1_mult_13),
	.o_C_13(o_ct_13),
	.i_A_14(o_it_gt_mult_14),
	.i_B_14(o_ft_Ct_1_mult_14),
	.o_C_14(o_ct_14),
	.i_A_15(o_it_gt_mult_15),
	.i_B_15(o_ft_Ct_1_mult_15),
	.o_C_15(o_ct_15),
	.o_valid(ct_valid),
	.o_ready()
);

shift_register_group_18_16_14 shift_register_group_18_16_14_Ct (
	.clk(clk),
	.enable(enable),
	.in_0(o_ct_0),
	.out_0(ct_hold_0),
	.in_1(o_ct_1),
	.out_1(ct_hold_1),
	.in_2(o_ct_2),
	.out_2(ct_hold_2),
	.in_3(o_ct_3),
	.out_3(ct_hold_3),
	.in_4(o_ct_4),
	.out_4(ct_hold_4),
	.in_5(o_ct_5),
	.out_5(ct_hold_5),
	.in_6(o_ct_6),
	.out_6(ct_hold_6),
	.in_7(o_ct_7),
	.out_7(ct_hold_7),
	.in_8(o_ct_8),
	.out_8(ct_hold_8),
	.in_9(o_ct_9),
	.out_9(ct_hold_9),
	.in_10(o_ct_10),
	.out_10(ct_hold_10),
	.in_11(o_ct_11),
	.out_11(ct_hold_11),
	.in_12(o_ct_12),
	.out_12(ct_hold_12),
	.in_13(o_ct_13),
	.out_13(ct_hold_13),
	.in_14(o_ct_14),
	.out_14(ct_hold_14),
	.in_15(o_ct_15),
	.out_15(ct_hold_15),
	.reset(reset)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_0),
	.i_x(o_ct_0),
	.o_y(o_tanh_0)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_1),
	.i_x(o_ct_1),
	.o_y(o_tanh_1)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_2),
	.i_x(o_ct_2),
	.o_y(o_tanh_2)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_3),
	.i_x(o_ct_3),
	.o_y(o_tanh_3)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_4),
	.i_x(o_ct_4),
	.o_y(o_tanh_4)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_5),
	.i_x(o_ct_5),
	.o_y(o_tanh_5)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_6),
	.i_x(o_ct_6),
	.o_y(o_tanh_6)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_7),
	.i_x(o_ct_7),
	.o_y(o_tanh_7)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_8),
	.i_x(o_ct_8),
	.o_y(o_tanh_8)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_9),
	.i_x(o_ct_9),
	.o_y(o_tanh_9)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_10),
	.i_x(o_ct_10),
	.o_y(o_tanh_10)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_11),
	.i_x(o_ct_11),
	.o_y(o_tanh_11)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_12),
	.i_x(o_ct_12),
	.o_y(o_tanh_12)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_13),
	.i_x(o_ct_13),
	.o_y(o_tanh_13)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_14),
	.i_x(o_ct_14),
	.o_y(o_tanh_14)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_15),
	.i_x(o_ct_15),
	.o_y(o_tanh_15)
);

shift_register_group_18_16_18 shift_register_group_18_16_18_Ct (
	.clk(clk),
	.enable(enable),
	.in_0(o_output_gate_0),
	.out_0(ot_hold_0),
	.in_1(o_output_gate_1),
	.out_1(ot_hold_1),
	.in_2(o_output_gate_2),
	.out_2(ot_hold_2),
	.in_3(o_output_gate_3),
	.out_3(ot_hold_3),
	.in_4(o_output_gate_4),
	.out_4(ot_hold_4),
	.in_5(o_output_gate_5),
	.out_5(ot_hold_5),
	.in_6(o_output_gate_6),
	.out_6(ot_hold_6),
	.in_7(o_output_gate_7),
	.out_7(ot_hold_7),
	.in_8(o_output_gate_8),
	.out_8(ot_hold_8),
	.in_9(o_output_gate_9),
	.out_9(ot_hold_9),
	.in_10(o_output_gate_10),
	.out_10(ot_hold_10),
	.in_11(o_output_gate_11),
	.out_11(ot_hold_11),
	.in_12(o_output_gate_12),
	.out_12(ot_hold_12),
	.in_13(o_output_gate_13),
	.out_13(ot_hold_13),
	.in_14(o_output_gate_14),
	.out_14(ot_hold_14),
	.in_15(o_output_gate_15),
	.out_15(ot_hold_15),
	.reset(reset)
);

elementwise_mult_core_18_18_10_16_1 elementwise_mult_core_18_18_10_16_1_ot_tanh_mult (
	.clk(clk),
	.reset(reset),
	.i_valid(tanh_valid_0),
	.i_ready(enable),
	.i_A_0(o_tanh_0),
	.i_B_0(ot_hold_0),
	.o_C_0(o_mt_0),
	.i_A_1(o_tanh_1),
	.i_B_1(ot_hold_1),
	.o_C_1(o_mt_1),
	.i_A_2(o_tanh_2),
	.i_B_2(ot_hold_2),
	.o_C_2(o_mt_2),
	.i_A_3(o_tanh_3),
	.i_B_3(ot_hold_3),
	.o_C_3(o_mt_3),
	.i_A_4(o_tanh_4),
	.i_B_4(ot_hold_4),
	.o_C_4(o_mt_4),
	.i_A_5(o_tanh_5),
	.i_B_5(ot_hold_5),
	.o_C_5(o_mt_5),
	.i_A_6(o_tanh_6),
	.i_B_6(ot_hold_6),
	.o_C_6(o_mt_6),
	.i_A_7(o_tanh_7),
	.i_B_7(ot_hold_7),
	.o_C_7(o_mt_7),
	.i_A_8(o_tanh_8),
	.i_B_8(ot_hold_8),
	.o_C_8(o_mt_8),
	.i_A_9(o_tanh_9),
	.i_B_9(ot_hold_9),
	.o_C_9(o_mt_9),
	.i_A_10(o_tanh_10),
	.i_B_10(ot_hold_10),
	.o_C_10(o_mt_10),
	.i_A_11(o_tanh_11),
	.i_B_11(ot_hold_11),
	.o_C_11(o_mt_11),
	.i_A_12(o_tanh_12),
	.i_B_12(ot_hold_12),
	.o_C_12(o_mt_12),
	.i_A_13(o_tanh_13),
	.i_B_13(ot_hold_13),
	.o_C_13(o_mt_13),
	.i_A_14(o_tanh_14),
	.i_B_14(ot_hold_14),
	.o_C_14(o_mt_14),
	.i_A_15(o_tanh_15),
	.i_B_15(ot_hold_15),
	.o_C_15(o_mt_15),
	.o_valid(mt_valid),
	.o_ready()
);

always @ (posedge clk) begin
	if(reset) begin
		reg_i_valid <= 1'b0;
		reg_o_valid <= 1'b0;
		reg_Ct_1_0 <= 0;
		reg_WixrXtYt_1_0 <= 0;
		reg_Wic_0 <= 0;
		reg_bi_0 <= 0;
		reg_WfxrXtYt_1_0 <= 0;
		reg_Wfc_0 <= 0;
		reg_bf_0 <= 0;
		reg_WoxrXtYt_1_0 <= 0;
		reg_Woc_0 <= 0;
		reg_bo_0 <= 0;
		reg_WcxrXtYt_1_0 <= 0;
		reg_bc_0 <= 0;
		reg_out_mt_0 <= 0;
		reg_out_ct_0 <= 0;
		reg_Ct_1_1 <= 0;
		reg_WixrXtYt_1_1 <= 0;
		reg_Wic_1 <= 0;
		reg_bi_1 <= 0;
		reg_WfxrXtYt_1_1 <= 0;
		reg_Wfc_1 <= 0;
		reg_bf_1 <= 0;
		reg_WoxrXtYt_1_1 <= 0;
		reg_Woc_1 <= 0;
		reg_bo_1 <= 0;
		reg_WcxrXtYt_1_1 <= 0;
		reg_bc_1 <= 0;
		reg_out_mt_1 <= 0;
		reg_out_ct_1 <= 0;
		reg_Ct_1_2 <= 0;
		reg_WixrXtYt_1_2 <= 0;
		reg_Wic_2 <= 0;
		reg_bi_2 <= 0;
		reg_WfxrXtYt_1_2 <= 0;
		reg_Wfc_2 <= 0;
		reg_bf_2 <= 0;
		reg_WoxrXtYt_1_2 <= 0;
		reg_Woc_2 <= 0;
		reg_bo_2 <= 0;
		reg_WcxrXtYt_1_2 <= 0;
		reg_bc_2 <= 0;
		reg_out_mt_2 <= 0;
		reg_out_ct_2 <= 0;
		reg_Ct_1_3 <= 0;
		reg_WixrXtYt_1_3 <= 0;
		reg_Wic_3 <= 0;
		reg_bi_3 <= 0;
		reg_WfxrXtYt_1_3 <= 0;
		reg_Wfc_3 <= 0;
		reg_bf_3 <= 0;
		reg_WoxrXtYt_1_3 <= 0;
		reg_Woc_3 <= 0;
		reg_bo_3 <= 0;
		reg_WcxrXtYt_1_3 <= 0;
		reg_bc_3 <= 0;
		reg_out_mt_3 <= 0;
		reg_out_ct_3 <= 0;
		reg_Ct_1_4 <= 0;
		reg_WixrXtYt_1_4 <= 0;
		reg_Wic_4 <= 0;
		reg_bi_4 <= 0;
		reg_WfxrXtYt_1_4 <= 0;
		reg_Wfc_4 <= 0;
		reg_bf_4 <= 0;
		reg_WoxrXtYt_1_4 <= 0;
		reg_Woc_4 <= 0;
		reg_bo_4 <= 0;
		reg_WcxrXtYt_1_4 <= 0;
		reg_bc_4 <= 0;
		reg_out_mt_4 <= 0;
		reg_out_ct_4 <= 0;
		reg_Ct_1_5 <= 0;
		reg_WixrXtYt_1_5 <= 0;
		reg_Wic_5 <= 0;
		reg_bi_5 <= 0;
		reg_WfxrXtYt_1_5 <= 0;
		reg_Wfc_5 <= 0;
		reg_bf_5 <= 0;
		reg_WoxrXtYt_1_5 <= 0;
		reg_Woc_5 <= 0;
		reg_bo_5 <= 0;
		reg_WcxrXtYt_1_5 <= 0;
		reg_bc_5 <= 0;
		reg_out_mt_5 <= 0;
		reg_out_ct_5 <= 0;
		reg_Ct_1_6 <= 0;
		reg_WixrXtYt_1_6 <= 0;
		reg_Wic_6 <= 0;
		reg_bi_6 <= 0;
		reg_WfxrXtYt_1_6 <= 0;
		reg_Wfc_6 <= 0;
		reg_bf_6 <= 0;
		reg_WoxrXtYt_1_6 <= 0;
		reg_Woc_6 <= 0;
		reg_bo_6 <= 0;
		reg_WcxrXtYt_1_6 <= 0;
		reg_bc_6 <= 0;
		reg_out_mt_6 <= 0;
		reg_out_ct_6 <= 0;
		reg_Ct_1_7 <= 0;
		reg_WixrXtYt_1_7 <= 0;
		reg_Wic_7 <= 0;
		reg_bi_7 <= 0;
		reg_WfxrXtYt_1_7 <= 0;
		reg_Wfc_7 <= 0;
		reg_bf_7 <= 0;
		reg_WoxrXtYt_1_7 <= 0;
		reg_Woc_7 <= 0;
		reg_bo_7 <= 0;
		reg_WcxrXtYt_1_7 <= 0;
		reg_bc_7 <= 0;
		reg_out_mt_7 <= 0;
		reg_out_ct_7 <= 0;
		reg_Ct_1_8 <= 0;
		reg_WixrXtYt_1_8 <= 0;
		reg_Wic_8 <= 0;
		reg_bi_8 <= 0;
		reg_WfxrXtYt_1_8 <= 0;
		reg_Wfc_8 <= 0;
		reg_bf_8 <= 0;
		reg_WoxrXtYt_1_8 <= 0;
		reg_Woc_8 <= 0;
		reg_bo_8 <= 0;
		reg_WcxrXtYt_1_8 <= 0;
		reg_bc_8 <= 0;
		reg_out_mt_8 <= 0;
		reg_out_ct_8 <= 0;
		reg_Ct_1_9 <= 0;
		reg_WixrXtYt_1_9 <= 0;
		reg_Wic_9 <= 0;
		reg_bi_9 <= 0;
		reg_WfxrXtYt_1_9 <= 0;
		reg_Wfc_9 <= 0;
		reg_bf_9 <= 0;
		reg_WoxrXtYt_1_9 <= 0;
		reg_Woc_9 <= 0;
		reg_bo_9 <= 0;
		reg_WcxrXtYt_1_9 <= 0;
		reg_bc_9 <= 0;
		reg_out_mt_9 <= 0;
		reg_out_ct_9 <= 0;
		reg_Ct_1_10 <= 0;
		reg_WixrXtYt_1_10 <= 0;
		reg_Wic_10 <= 0;
		reg_bi_10 <= 0;
		reg_WfxrXtYt_1_10 <= 0;
		reg_Wfc_10 <= 0;
		reg_bf_10 <= 0;
		reg_WoxrXtYt_1_10 <= 0;
		reg_Woc_10 <= 0;
		reg_bo_10 <= 0;
		reg_WcxrXtYt_1_10 <= 0;
		reg_bc_10 <= 0;
		reg_out_mt_10 <= 0;
		reg_out_ct_10 <= 0;
		reg_Ct_1_11 <= 0;
		reg_WixrXtYt_1_11 <= 0;
		reg_Wic_11 <= 0;
		reg_bi_11 <= 0;
		reg_WfxrXtYt_1_11 <= 0;
		reg_Wfc_11 <= 0;
		reg_bf_11 <= 0;
		reg_WoxrXtYt_1_11 <= 0;
		reg_Woc_11 <= 0;
		reg_bo_11 <= 0;
		reg_WcxrXtYt_1_11 <= 0;
		reg_bc_11 <= 0;
		reg_out_mt_11 <= 0;
		reg_out_ct_11 <= 0;
		reg_Ct_1_12 <= 0;
		reg_WixrXtYt_1_12 <= 0;
		reg_Wic_12 <= 0;
		reg_bi_12 <= 0;
		reg_WfxrXtYt_1_12 <= 0;
		reg_Wfc_12 <= 0;
		reg_bf_12 <= 0;
		reg_WoxrXtYt_1_12 <= 0;
		reg_Woc_12 <= 0;
		reg_bo_12 <= 0;
		reg_WcxrXtYt_1_12 <= 0;
		reg_bc_12 <= 0;
		reg_out_mt_12 <= 0;
		reg_out_ct_12 <= 0;
		reg_Ct_1_13 <= 0;
		reg_WixrXtYt_1_13 <= 0;
		reg_Wic_13 <= 0;
		reg_bi_13 <= 0;
		reg_WfxrXtYt_1_13 <= 0;
		reg_Wfc_13 <= 0;
		reg_bf_13 <= 0;
		reg_WoxrXtYt_1_13 <= 0;
		reg_Woc_13 <= 0;
		reg_bo_13 <= 0;
		reg_WcxrXtYt_1_13 <= 0;
		reg_bc_13 <= 0;
		reg_out_mt_13 <= 0;
		reg_out_ct_13 <= 0;
		reg_Ct_1_14 <= 0;
		reg_WixrXtYt_1_14 <= 0;
		reg_Wic_14 <= 0;
		reg_bi_14 <= 0;
		reg_WfxrXtYt_1_14 <= 0;
		reg_Wfc_14 <= 0;
		reg_bf_14 <= 0;
		reg_WoxrXtYt_1_14 <= 0;
		reg_Woc_14 <= 0;
		reg_bo_14 <= 0;
		reg_WcxrXtYt_1_14 <= 0;
		reg_bc_14 <= 0;
		reg_out_mt_14 <= 0;
		reg_out_ct_14 <= 0;
		reg_Ct_1_15 <= 0;
		reg_WixrXtYt_1_15 <= 0;
		reg_Wic_15 <= 0;
		reg_bi_15 <= 0;
		reg_WfxrXtYt_1_15 <= 0;
		reg_Wfc_15 <= 0;
		reg_bf_15 <= 0;
		reg_WoxrXtYt_1_15 <= 0;
		reg_Woc_15 <= 0;
		reg_bo_15 <= 0;
		reg_WcxrXtYt_1_15 <= 0;
		reg_bc_15 <= 0;
		reg_out_mt_15 <= 0;
		reg_out_ct_15 <= 0;
	end else if (enable) begin
		reg_i_valid <= i_valid;
		reg_o_valid <= mt_valid;
		reg_Ct_1_0 <= Ct_1_0;
		reg_WixrXtYt_1_0 <= WixrXtYt_1_0;
		reg_Wic_0 <= Wic_0;
		reg_bi_0 <= bi_0;
		reg_WfxrXtYt_1_0 <= WfxrXtYt_1_0;
		reg_Wfc_0 <= Wfc_0;
		reg_bf_0 <= bf_0;
		reg_WoxrXtYt_1_0 <= WoxrXtYt_1_0;
		reg_Woc_0 <= Woc_0;
		reg_bo_0 <= bo_0;
		reg_WcxrXtYt_1_0 <= WcxrXtYt_1_0;
		reg_bc_0 <= bc_0;
		reg_out_mt_0 <= o_mt_0;
		reg_out_ct_0 <= ct_hold_0;
		reg_Ct_1_1 <= Ct_1_1;
		reg_WixrXtYt_1_1 <= WixrXtYt_1_1;
		reg_Wic_1 <= Wic_1;
		reg_bi_1 <= bi_1;
		reg_WfxrXtYt_1_1 <= WfxrXtYt_1_1;
		reg_Wfc_1 <= Wfc_1;
		reg_bf_1 <= bf_1;
		reg_WoxrXtYt_1_1 <= WoxrXtYt_1_1;
		reg_Woc_1 <= Woc_1;
		reg_bo_1 <= bo_1;
		reg_WcxrXtYt_1_1 <= WcxrXtYt_1_1;
		reg_bc_1 <= bc_1;
		reg_out_mt_1 <= o_mt_1;
		reg_out_ct_1 <= ct_hold_1;
		reg_Ct_1_2 <= Ct_1_2;
		reg_WixrXtYt_1_2 <= WixrXtYt_1_2;
		reg_Wic_2 <= Wic_2;
		reg_bi_2 <= bi_2;
		reg_WfxrXtYt_1_2 <= WfxrXtYt_1_2;
		reg_Wfc_2 <= Wfc_2;
		reg_bf_2 <= bf_2;
		reg_WoxrXtYt_1_2 <= WoxrXtYt_1_2;
		reg_Woc_2 <= Woc_2;
		reg_bo_2 <= bo_2;
		reg_WcxrXtYt_1_2 <= WcxrXtYt_1_2;
		reg_bc_2 <= bc_2;
		reg_out_mt_2 <= o_mt_2;
		reg_out_ct_2 <= ct_hold_2;
		reg_Ct_1_3 <= Ct_1_3;
		reg_WixrXtYt_1_3 <= WixrXtYt_1_3;
		reg_Wic_3 <= Wic_3;
		reg_bi_3 <= bi_3;
		reg_WfxrXtYt_1_3 <= WfxrXtYt_1_3;
		reg_Wfc_3 <= Wfc_3;
		reg_bf_3 <= bf_3;
		reg_WoxrXtYt_1_3 <= WoxrXtYt_1_3;
		reg_Woc_3 <= Woc_3;
		reg_bo_3 <= bo_3;
		reg_WcxrXtYt_1_3 <= WcxrXtYt_1_3;
		reg_bc_3 <= bc_3;
		reg_out_mt_3 <= o_mt_3;
		reg_out_ct_3 <= ct_hold_3;
		reg_Ct_1_4 <= Ct_1_4;
		reg_WixrXtYt_1_4 <= WixrXtYt_1_4;
		reg_Wic_4 <= Wic_4;
		reg_bi_4 <= bi_4;
		reg_WfxrXtYt_1_4 <= WfxrXtYt_1_4;
		reg_Wfc_4 <= Wfc_4;
		reg_bf_4 <= bf_4;
		reg_WoxrXtYt_1_4 <= WoxrXtYt_1_4;
		reg_Woc_4 <= Woc_4;
		reg_bo_4 <= bo_4;
		reg_WcxrXtYt_1_4 <= WcxrXtYt_1_4;
		reg_bc_4 <= bc_4;
		reg_out_mt_4 <= o_mt_4;
		reg_out_ct_4 <= ct_hold_4;
		reg_Ct_1_5 <= Ct_1_5;
		reg_WixrXtYt_1_5 <= WixrXtYt_1_5;
		reg_Wic_5 <= Wic_5;
		reg_bi_5 <= bi_5;
		reg_WfxrXtYt_1_5 <= WfxrXtYt_1_5;
		reg_Wfc_5 <= Wfc_5;
		reg_bf_5 <= bf_5;
		reg_WoxrXtYt_1_5 <= WoxrXtYt_1_5;
		reg_Woc_5 <= Woc_5;
		reg_bo_5 <= bo_5;
		reg_WcxrXtYt_1_5 <= WcxrXtYt_1_5;
		reg_bc_5 <= bc_5;
		reg_out_mt_5 <= o_mt_5;
		reg_out_ct_5 <= ct_hold_5;
		reg_Ct_1_6 <= Ct_1_6;
		reg_WixrXtYt_1_6 <= WixrXtYt_1_6;
		reg_Wic_6 <= Wic_6;
		reg_bi_6 <= bi_6;
		reg_WfxrXtYt_1_6 <= WfxrXtYt_1_6;
		reg_Wfc_6 <= Wfc_6;
		reg_bf_6 <= bf_6;
		reg_WoxrXtYt_1_6 <= WoxrXtYt_1_6;
		reg_Woc_6 <= Woc_6;
		reg_bo_6 <= bo_6;
		reg_WcxrXtYt_1_6 <= WcxrXtYt_1_6;
		reg_bc_6 <= bc_6;
		reg_out_mt_6 <= o_mt_6;
		reg_out_ct_6 <= ct_hold_6;
		reg_Ct_1_7 <= Ct_1_7;
		reg_WixrXtYt_1_7 <= WixrXtYt_1_7;
		reg_Wic_7 <= Wic_7;
		reg_bi_7 <= bi_7;
		reg_WfxrXtYt_1_7 <= WfxrXtYt_1_7;
		reg_Wfc_7 <= Wfc_7;
		reg_bf_7 <= bf_7;
		reg_WoxrXtYt_1_7 <= WoxrXtYt_1_7;
		reg_Woc_7 <= Woc_7;
		reg_bo_7 <= bo_7;
		reg_WcxrXtYt_1_7 <= WcxrXtYt_1_7;
		reg_bc_7 <= bc_7;
		reg_out_mt_7 <= o_mt_7;
		reg_out_ct_7 <= ct_hold_7;
		reg_Ct_1_8 <= Ct_1_8;
		reg_WixrXtYt_1_8 <= WixrXtYt_1_8;
		reg_Wic_8 <= Wic_8;
		reg_bi_8 <= bi_8;
		reg_WfxrXtYt_1_8 <= WfxrXtYt_1_8;
		reg_Wfc_8 <= Wfc_8;
		reg_bf_8 <= bf_8;
		reg_WoxrXtYt_1_8 <= WoxrXtYt_1_8;
		reg_Woc_8 <= Woc_8;
		reg_bo_8 <= bo_8;
		reg_WcxrXtYt_1_8 <= WcxrXtYt_1_8;
		reg_bc_8 <= bc_8;
		reg_out_mt_8 <= o_mt_8;
		reg_out_ct_8 <= ct_hold_8;
		reg_Ct_1_9 <= Ct_1_9;
		reg_WixrXtYt_1_9 <= WixrXtYt_1_9;
		reg_Wic_9 <= Wic_9;
		reg_bi_9 <= bi_9;
		reg_WfxrXtYt_1_9 <= WfxrXtYt_1_9;
		reg_Wfc_9 <= Wfc_9;
		reg_bf_9 <= bf_9;
		reg_WoxrXtYt_1_9 <= WoxrXtYt_1_9;
		reg_Woc_9 <= Woc_9;
		reg_bo_9 <= bo_9;
		reg_WcxrXtYt_1_9 <= WcxrXtYt_1_9;
		reg_bc_9 <= bc_9;
		reg_out_mt_9 <= o_mt_9;
		reg_out_ct_9 <= ct_hold_9;
		reg_Ct_1_10 <= Ct_1_10;
		reg_WixrXtYt_1_10 <= WixrXtYt_1_10;
		reg_Wic_10 <= Wic_10;
		reg_bi_10 <= bi_10;
		reg_WfxrXtYt_1_10 <= WfxrXtYt_1_10;
		reg_Wfc_10 <= Wfc_10;
		reg_bf_10 <= bf_10;
		reg_WoxrXtYt_1_10 <= WoxrXtYt_1_10;
		reg_Woc_10 <= Woc_10;
		reg_bo_10 <= bo_10;
		reg_WcxrXtYt_1_10 <= WcxrXtYt_1_10;
		reg_bc_10 <= bc_10;
		reg_out_mt_10 <= o_mt_10;
		reg_out_ct_10 <= ct_hold_10;
		reg_Ct_1_11 <= Ct_1_11;
		reg_WixrXtYt_1_11 <= WixrXtYt_1_11;
		reg_Wic_11 <= Wic_11;
		reg_bi_11 <= bi_11;
		reg_WfxrXtYt_1_11 <= WfxrXtYt_1_11;
		reg_Wfc_11 <= Wfc_11;
		reg_bf_11 <= bf_11;
		reg_WoxrXtYt_1_11 <= WoxrXtYt_1_11;
		reg_Woc_11 <= Woc_11;
		reg_bo_11 <= bo_11;
		reg_WcxrXtYt_1_11 <= WcxrXtYt_1_11;
		reg_bc_11 <= bc_11;
		reg_out_mt_11 <= o_mt_11;
		reg_out_ct_11 <= ct_hold_11;
		reg_Ct_1_12 <= Ct_1_12;
		reg_WixrXtYt_1_12 <= WixrXtYt_1_12;
		reg_Wic_12 <= Wic_12;
		reg_bi_12 <= bi_12;
		reg_WfxrXtYt_1_12 <= WfxrXtYt_1_12;
		reg_Wfc_12 <= Wfc_12;
		reg_bf_12 <= bf_12;
		reg_WoxrXtYt_1_12 <= WoxrXtYt_1_12;
		reg_Woc_12 <= Woc_12;
		reg_bo_12 <= bo_12;
		reg_WcxrXtYt_1_12 <= WcxrXtYt_1_12;
		reg_bc_12 <= bc_12;
		reg_out_mt_12 <= o_mt_12;
		reg_out_ct_12 <= ct_hold_12;
		reg_Ct_1_13 <= Ct_1_13;
		reg_WixrXtYt_1_13 <= WixrXtYt_1_13;
		reg_Wic_13 <= Wic_13;
		reg_bi_13 <= bi_13;
		reg_WfxrXtYt_1_13 <= WfxrXtYt_1_13;
		reg_Wfc_13 <= Wfc_13;
		reg_bf_13 <= bf_13;
		reg_WoxrXtYt_1_13 <= WoxrXtYt_1_13;
		reg_Woc_13 <= Woc_13;
		reg_bo_13 <= bo_13;
		reg_WcxrXtYt_1_13 <= WcxrXtYt_1_13;
		reg_bc_13 <= bc_13;
		reg_out_mt_13 <= o_mt_13;
		reg_out_ct_13 <= ct_hold_13;
		reg_Ct_1_14 <= Ct_1_14;
		reg_WixrXtYt_1_14 <= WixrXtYt_1_14;
		reg_Wic_14 <= Wic_14;
		reg_bi_14 <= bi_14;
		reg_WfxrXtYt_1_14 <= WfxrXtYt_1_14;
		reg_Wfc_14 <= Wfc_14;
		reg_bf_14 <= bf_14;
		reg_WoxrXtYt_1_14 <= WoxrXtYt_1_14;
		reg_Woc_14 <= Woc_14;
		reg_bo_14 <= bo_14;
		reg_WcxrXtYt_1_14 <= WcxrXtYt_1_14;
		reg_bc_14 <= bc_14;
		reg_out_mt_14 <= o_mt_14;
		reg_out_ct_14 <= ct_hold_14;
		reg_Ct_1_15 <= Ct_1_15;
		reg_WixrXtYt_1_15 <= WixrXtYt_1_15;
		reg_Wic_15 <= Wic_15;
		reg_bi_15 <= bi_15;
		reg_WfxrXtYt_1_15 <= WfxrXtYt_1_15;
		reg_Wfc_15 <= Wfc_15;
		reg_bf_15 <= bf_15;
		reg_WoxrXtYt_1_15 <= WoxrXtYt_1_15;
		reg_Woc_15 <= Woc_15;
		reg_bo_15 <= bo_15;
		reg_WcxrXtYt_1_15 <= WcxrXtYt_1_15;
		reg_bc_15 <= bc_15;
		reg_out_mt_15 <= o_mt_15;
		reg_out_ct_15 <= ct_hold_15;
	end
end
assign out_mt_0 = reg_out_mt_0;
assign out_ct_0 = reg_out_ct_0;
assign out_mt_1 = reg_out_mt_1;
assign out_ct_1 = reg_out_ct_1;
assign out_mt_2 = reg_out_mt_2;
assign out_ct_2 = reg_out_ct_2;
assign out_mt_3 = reg_out_mt_3;
assign out_ct_3 = reg_out_ct_3;
assign out_mt_4 = reg_out_mt_4;
assign out_ct_4 = reg_out_ct_4;
assign out_mt_5 = reg_out_mt_5;
assign out_ct_5 = reg_out_ct_5;
assign out_mt_6 = reg_out_mt_6;
assign out_ct_6 = reg_out_ct_6;
assign out_mt_7 = reg_out_mt_7;
assign out_ct_7 = reg_out_ct_7;
assign out_mt_8 = reg_out_mt_8;
assign out_ct_8 = reg_out_ct_8;
assign out_mt_9 = reg_out_mt_9;
assign out_ct_9 = reg_out_ct_9;
assign out_mt_10 = reg_out_mt_10;
assign out_ct_10 = reg_out_ct_10;
assign out_mt_11 = reg_out_mt_11;
assign out_ct_11 = reg_out_ct_11;
assign out_mt_12 = reg_out_mt_12;
assign out_ct_12 = reg_out_ct_12;
assign out_mt_13 = reg_out_mt_13;
assign out_ct_13 = reg_out_ct_13;
assign out_mt_14 = reg_out_mt_14;
assign out_ct_14 = reg_out_ct_14;
assign out_mt_15 = reg_out_mt_15;
assign out_ct_15 = reg_out_ct_15;
assign o_valid = reg_o_valid;
assign o_ready = enable;
endmodule
module elementwise_mult_core_18_18_10_16_1 (
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	input [17:0] i_A_0,
	input [17:0] i_B_0,
	output [17:0] o_C_0,
	input [17:0] i_A_1,
	input [17:0] i_B_1,
	output [17:0] o_C_1,
	input [17:0] i_A_2,
	input [17:0] i_B_2,
	output [17:0] o_C_2,
	input [17:0] i_A_3,
	input [17:0] i_B_3,
	output [17:0] o_C_3,
	input [17:0] i_A_4,
	input [17:0] i_B_4,
	output [17:0] o_C_4,
	input [17:0] i_A_5,
	input [17:0] i_B_5,
	output [17:0] o_C_5,
	input [17:0] i_A_6,
	input [17:0] i_B_6,
	output [17:0] o_C_6,
	input [17:0] i_A_7,
	input [17:0] i_B_7,
	output [17:0] o_C_7,
	input [17:0] i_A_8,
	input [17:0] i_B_8,
	output [17:0] o_C_8,
	input [17:0] i_A_9,
	input [17:0] i_B_9,
	output [17:0] o_C_9,
	input [17:0] i_A_10,
	input [17:0] i_B_10,
	output [17:0] o_C_10,
	input [17:0] i_A_11,
	input [17:0] i_B_11,
	output [17:0] o_C_11,
	input [17:0] i_A_12,
	input [17:0] i_B_12,
	output [17:0] o_C_12,
	input [17:0] i_A_13,
	input [17:0] i_B_13,
	output [17:0] o_C_13,
	input [17:0] i_A_14,
	input [17:0] i_B_14,
	output [17:0] o_C_14,
	input [17:0] i_A_15,
	input [17:0] i_B_15,
	output [17:0] o_C_15,
	output o_valid,
	output o_ready
);

// Store inputs and outputs in registers
reg [17:0] reg_A_0;
reg [17:0] reg_B_0;
wire [17:0] reg_C_0;
reg [17:0] reg_A_1;
reg [17:0] reg_B_1;
wire [17:0] reg_C_1;
reg [17:0] reg_A_2;
reg [17:0] reg_B_2;
wire [17:0] reg_C_2;
reg [17:0] reg_A_3;
reg [17:0] reg_B_3;
wire [17:0] reg_C_3;
reg [17:0] reg_A_4;
reg [17:0] reg_B_4;
wire [17:0] reg_C_4;
reg [17:0] reg_A_5;
reg [17:0] reg_B_5;
wire [17:0] reg_C_5;
reg [17:0] reg_A_6;
reg [17:0] reg_B_6;
wire [17:0] reg_C_6;
reg [17:0] reg_A_7;
reg [17:0] reg_B_7;
wire [17:0] reg_C_7;
reg [17:0] reg_A_8;
reg [17:0] reg_B_8;
wire [17:0] reg_C_8;
reg [17:0] reg_A_9;
reg [17:0] reg_B_9;
wire [17:0] reg_C_9;
reg [17:0] reg_A_10;
reg [17:0] reg_B_10;
wire [17:0] reg_C_10;
reg [17:0] reg_A_11;
reg [17:0] reg_B_11;
wire [17:0] reg_C_11;
reg [17:0] reg_A_12;
reg [17:0] reg_B_12;
wire [17:0] reg_C_12;
reg [17:0] reg_A_13;
reg [17:0] reg_B_13;
wire [17:0] reg_C_13;
reg [17:0] reg_A_14;
reg [17:0] reg_B_14;
wire [17:0] reg_C_14;
reg [17:0] reg_A_15;
reg [17:0] reg_B_15;
wire [17:0] reg_C_15;

reg valid_A_B;
wire valid_C;
wire enable;
assign enable = i_ready;

wire mult_valid_0;
wire round_valid_0;
wire [36:0] mult_C_0;
wire [36:0] rounded_C_0;
wire mult_valid_1;
wire round_valid_1;
wire [36:0] mult_C_1;
wire [36:0] rounded_C_1;
wire mult_valid_2;
wire round_valid_2;
wire [36:0] mult_C_2;
wire [36:0] rounded_C_2;
wire mult_valid_3;
wire round_valid_3;
wire [36:0] mult_C_3;
wire [36:0] rounded_C_3;
wire mult_valid_4;
wire round_valid_4;
wire [36:0] mult_C_4;
wire [36:0] rounded_C_4;
wire mult_valid_5;
wire round_valid_5;
wire [36:0] mult_C_5;
wire [36:0] rounded_C_5;
wire mult_valid_6;
wire round_valid_6;
wire [36:0] mult_C_6;
wire [36:0] rounded_C_6;
wire mult_valid_7;
wire round_valid_7;
wire [36:0] mult_C_7;
wire [36:0] rounded_C_7;
wire mult_valid_8;
wire round_valid_8;
wire [36:0] mult_C_8;
wire [36:0] rounded_C_8;
wire mult_valid_9;
wire round_valid_9;
wire [36:0] mult_C_9;
wire [36:0] rounded_C_9;
wire mult_valid_10;
wire round_valid_10;
wire [36:0] mult_C_10;
wire [36:0] rounded_C_10;
wire mult_valid_11;
wire round_valid_11;
wire [36:0] mult_C_11;
wire [36:0] rounded_C_11;
wire mult_valid_12;
wire round_valid_12;
wire [36:0] mult_C_12;
wire [36:0] rounded_C_12;
wire mult_valid_13;
wire round_valid_13;
wire [36:0] mult_C_13;
wire [36:0] rounded_C_13;
wire mult_valid_14;
wire round_valid_14;
wire [36:0] mult_C_14;
wire [36:0] rounded_C_14;
wire mult_valid_15;
wire round_valid_15;
wire [36:0] mult_C_15;
wire [36:0] rounded_C_15;

dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst0 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_0),
	.ay(reg_B_0),
	.bx(reg_A_1),
	.by(reg_B_1),
	.o_valid(mult_valid_0),
	.resulta(mult_C_0),
	.resultb(mult_C_1)
);
assign mult_valid_1 = mult_valid_0;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst2 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_2),
	.ay(reg_B_2),
	.bx(reg_A_3),
	.by(reg_B_3),
	.o_valid(mult_valid_2),
	.resulta(mult_C_2),
	.resultb(mult_C_3)
);
assign mult_valid_3 = mult_valid_2;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst4 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_4),
	.ay(reg_B_4),
	.bx(reg_A_5),
	.by(reg_B_5),
	.o_valid(mult_valid_4),
	.resulta(mult_C_4),
	.resultb(mult_C_5)
);
assign mult_valid_5 = mult_valid_4;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst6 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_6),
	.ay(reg_B_6),
	.bx(reg_A_7),
	.by(reg_B_7),
	.o_valid(mult_valid_6),
	.resulta(mult_C_6),
	.resultb(mult_C_7)
);
assign mult_valid_7 = mult_valid_6;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst8 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_8),
	.ay(reg_B_8),
	.bx(reg_A_9),
	.by(reg_B_9),
	.o_valid(mult_valid_8),
	.resulta(mult_C_8),
	.resultb(mult_C_9)
);
assign mult_valid_9 = mult_valid_8;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst10 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_10),
	.ay(reg_B_10),
	.bx(reg_A_11),
	.by(reg_B_11),
	.o_valid(mult_valid_10),
	.resulta(mult_C_10),
	.resultb(mult_C_11)
);
assign mult_valid_11 = mult_valid_10;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst12 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_12),
	.ay(reg_B_12),
	.bx(reg_A_13),
	.by(reg_B_13),
	.o_valid(mult_valid_12),
	.resulta(mult_C_12),
	.resultb(mult_C_13)
);
assign mult_valid_13 = mult_valid_12;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst14 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_14),
	.ay(reg_B_14),
	.bx(reg_A_15),
	.by(reg_B_15),
	.o_valid(mult_valid_14),
	.resulta(mult_C_14),
	.resultb(mult_C_15)
);
assign mult_valid_15 = mult_valid_14;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_0),
	.in(mult_C_0),
	.o_valid(round_valid_0),
	.out(rounded_C_0)
);
assign reg_C_0 = rounded_C_0;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_1),
	.in(mult_C_1),
	.o_valid(round_valid_1),
	.out(rounded_C_1)
);
assign reg_C_1 = rounded_C_1;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_2),
	.in(mult_C_2),
	.o_valid(round_valid_2),
	.out(rounded_C_2)
);
assign reg_C_2 = rounded_C_2;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_3),
	.in(mult_C_3),
	.o_valid(round_valid_3),
	.out(rounded_C_3)
);
assign reg_C_3 = rounded_C_3;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_4),
	.in(mult_C_4),
	.o_valid(round_valid_4),
	.out(rounded_C_4)
);
assign reg_C_4 = rounded_C_4;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_5),
	.in(mult_C_5),
	.o_valid(round_valid_5),
	.out(rounded_C_5)
);
assign reg_C_5 = rounded_C_5;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_6),
	.in(mult_C_6),
	.o_valid(round_valid_6),
	.out(rounded_C_6)
);
assign reg_C_6 = rounded_C_6;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_7),
	.in(mult_C_7),
	.o_valid(round_valid_7),
	.out(rounded_C_7)
);
assign reg_C_7 = rounded_C_7;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_8),
	.in(mult_C_8),
	.o_valid(round_valid_8),
	.out(rounded_C_8)
);
assign reg_C_8 = rounded_C_8;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_9),
	.in(mult_C_9),
	.o_valid(round_valid_9),
	.out(rounded_C_9)
);
assign reg_C_9 = rounded_C_9;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_10),
	.in(mult_C_10),
	.o_valid(round_valid_10),
	.out(rounded_C_10)
);
assign reg_C_10 = rounded_C_10;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_11),
	.in(mult_C_11),
	.o_valid(round_valid_11),
	.out(rounded_C_11)
);
assign reg_C_11 = rounded_C_11;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_12),
	.in(mult_C_12),
	.o_valid(round_valid_12),
	.out(rounded_C_12)
);
assign reg_C_12 = rounded_C_12;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_13),
	.in(mult_C_13),
	.o_valid(round_valid_13),
	.out(rounded_C_13)
);
assign reg_C_13 = rounded_C_13;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_14),
	.in(mult_C_14),
	.o_valid(round_valid_14),
	.out(rounded_C_14)
);
assign reg_C_14 = rounded_C_14;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_15),
	.in(mult_C_15),
	.o_valid(round_valid_15),
	.out(rounded_C_15)
);
assign reg_C_15 = rounded_C_15;
always @ (posedge clk) begin
	if (reset) begin
		valid_A_B <= 1'b0;
		reg_A_0 <= 0;
		reg_B_0 <= 0;
		reg_A_1 <= 0;
		reg_B_1 <= 0;
		reg_A_2 <= 0;
		reg_B_2 <= 0;
		reg_A_3 <= 0;
		reg_B_3 <= 0;
		reg_A_4 <= 0;
		reg_B_4 <= 0;
		reg_A_5 <= 0;
		reg_B_5 <= 0;
		reg_A_6 <= 0;
		reg_B_6 <= 0;
		reg_A_7 <= 0;
		reg_B_7 <= 0;
		reg_A_8 <= 0;
		reg_B_8 <= 0;
		reg_A_9 <= 0;
		reg_B_9 <= 0;
		reg_A_10 <= 0;
		reg_B_10 <= 0;
		reg_A_11 <= 0;
		reg_B_11 <= 0;
		reg_A_12 <= 0;
		reg_B_12 <= 0;
		reg_A_13 <= 0;
		reg_B_13 <= 0;
		reg_A_14 <= 0;
		reg_B_14 <= 0;
		reg_A_15 <= 0;
		reg_B_15 <= 0;
	end else if (enable) begin
		reg_A_0 <= i_A_0;
		reg_B_0 <= i_B_0;
		reg_A_1 <= i_A_1;
		reg_B_1 <= i_B_1;
		reg_A_2 <= i_A_2;
		reg_B_2 <= i_B_2;
		reg_A_3 <= i_A_3;
		reg_B_3 <= i_B_3;
		reg_A_4 <= i_A_4;
		reg_B_4 <= i_B_4;
		reg_A_5 <= i_A_5;
		reg_B_5 <= i_B_5;
		reg_A_6 <= i_A_6;
		reg_B_6 <= i_B_6;
		reg_A_7 <= i_A_7;
		reg_B_7 <= i_B_7;
		reg_A_8 <= i_A_8;
		reg_B_8 <= i_B_8;
		reg_A_9 <= i_A_9;
		reg_B_9 <= i_B_9;
		reg_A_10 <= i_A_10;
		reg_B_10 <= i_B_10;
		reg_A_11 <= i_A_11;
		reg_B_11 <= i_B_11;
		reg_A_12 <= i_A_12;
		reg_B_12 <= i_B_12;
		reg_A_13 <= i_A_13;
		reg_B_13 <= i_B_13;
		reg_A_14 <= i_A_14;
		reg_B_14 <= i_B_14;
		reg_A_15 <= i_A_15;
		reg_B_15 <= i_B_15;
		valid_A_B <= i_valid;
	end
end

assign o_C_0 = reg_C_0;
assign o_C_1 = reg_C_1;
assign o_C_2 = reg_C_2;
assign o_C_3 = reg_C_3;
assign o_C_4 = reg_C_4;
assign o_C_5 = reg_C_5;
assign o_C_6 = reg_C_6;
assign o_C_7 = reg_C_7;
assign o_C_8 = reg_C_8;
assign o_C_9 = reg_C_9;
assign o_C_10 = reg_C_10;
assign o_C_11 = reg_C_11;
assign o_C_12 = reg_C_12;
assign o_C_13 = reg_C_13;
assign o_C_14 = reg_C_14;
assign o_C_15 = reg_C_15;
assign valid_C = round_valid_0;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module shift_register_group_18_16_18 (
	input clk,
	input enable,
	input [17:0] in_0,
	output [17:0] out_0,
	input [17:0] in_1,
	output [17:0] out_1,
	input [17:0] in_2,
	output [17:0] out_2,
	input [17:0] in_3,
	output [17:0] out_3,
	input [17:0] in_4,
	output [17:0] out_4,
	input [17:0] in_5,
	output [17:0] out_5,
	input [17:0] in_6,
	output [17:0] out_6,
	input [17:0] in_7,
	output [17:0] out_7,
	input [17:0] in_8,
	output [17:0] out_8,
	input [17:0] in_9,
	output [17:0] out_9,
	input [17:0] in_10,
	output [17:0] out_10,
	input [17:0] in_11,
	output [17:0] out_11,
	input [17:0] in_12,
	output [17:0] out_12,
	input [17:0] in_13,
	output [17:0] out_13,
	input [17:0] in_14,
	output [17:0] out_14,
	input [17:0] in_15,
	output [17:0] out_15,
	input reset
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

endmodule
module shift_register_unit_18_18 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
reg [17:0] shift_registers_1;
reg [17:0] shift_registers_2;
reg [17:0] shift_registers_3;
reg [17:0] shift_registers_4;
reg [17:0] shift_registers_5;
reg [17:0] shift_registers_6;
reg [17:0] shift_registers_7;
reg [17:0] shift_registers_8;
reg [17:0] shift_registers_9;
reg [17:0] shift_registers_10;
reg [17:0] shift_registers_11;
reg [17:0] shift_registers_12;
reg [17:0] shift_registers_13;
reg [17:0] shift_registers_14;
reg [17:0] shift_registers_15;
reg [17:0] shift_registers_16;
reg [17:0] shift_registers_17;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
		shift_registers_1 <= 18'd0;
		shift_registers_2 <= 18'd0;
		shift_registers_3 <= 18'd0;
		shift_registers_4 <= 18'd0;
		shift_registers_5 <= 18'd0;
		shift_registers_6 <= 18'd0;
		shift_registers_7 <= 18'd0;
		shift_registers_8 <= 18'd0;
		shift_registers_9 <= 18'd0;
		shift_registers_10 <= 18'd0;
		shift_registers_11 <= 18'd0;
		shift_registers_12 <= 18'd0;
		shift_registers_13 <= 18'd0;
		shift_registers_14 <= 18'd0;
		shift_registers_15 <= 18'd0;
		shift_registers_16 <= 18'd0;
		shift_registers_17 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
		shift_registers_3 <= shift_registers_2;
		shift_registers_4 <= shift_registers_3;
		shift_registers_5 <= shift_registers_4;
		shift_registers_6 <= shift_registers_5;
		shift_registers_7 <= shift_registers_6;
		shift_registers_8 <= shift_registers_7;
		shift_registers_9 <= shift_registers_8;
		shift_registers_10 <= shift_registers_9;
		shift_registers_11 <= shift_registers_10;
		shift_registers_12 <= shift_registers_11;
		shift_registers_13 <= shift_registers_12;
		shift_registers_14 <= shift_registers_13;
		shift_registers_15 <= shift_registers_14;
		shift_registers_16 <= shift_registers_15;
		shift_registers_17 <= shift_registers_16;
	end
end

assign out = shift_registers_17;

endmodule
module tanh_core_18_18_10_32_1 ( 
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	output o_ready,
	output o_valid,
	input [17:0] i_x,
	output [17:0] o_y
);

reg [12:0] k_list_0;
reg [12:0] b_list_0;
reg [12:0] k_list_1;
reg [12:0] b_list_1;
reg [12:0] k_list_2;
reg [12:0] b_list_2;
reg [12:0] k_list_3;
reg [12:0] b_list_3;
reg [12:0] k_list_4;
reg [12:0] b_list_4;
reg [12:0] k_list_5;
reg [12:0] b_list_5;
reg [12:0] k_list_6;
reg [12:0] b_list_6;
reg [12:0] k_list_7;
reg [12:0] b_list_7;
reg [12:0] k_list_8;
reg [12:0] b_list_8;
reg [12:0] k_list_9;
reg [12:0] b_list_9;
reg [12:0] k_list_10;
reg [12:0] b_list_10;
reg [12:0] k_list_11;
reg [12:0] b_list_11;
reg [12:0] k_list_12;
reg [12:0] b_list_12;
reg [12:0] k_list_13;
reg [12:0] b_list_13;
reg [12:0] k_list_14;
reg [12:0] b_list_14;
reg [12:0] k_list_15;
reg [12:0] b_list_15;
reg [12:0] k_list_16;
reg [12:0] b_list_16;
reg [12:0] k_list_17;
reg [12:0] b_list_17;
reg [12:0] k_list_18;
reg [12:0] b_list_18;
reg [12:0] k_list_19;
reg [12:0] b_list_19;
reg [12:0] k_list_20;
reg [12:0] b_list_20;
reg [12:0] k_list_21;
reg [12:0] b_list_21;
reg [12:0] k_list_22;
reg [12:0] b_list_22;
reg [12:0] k_list_23;
reg [12:0] b_list_23;
reg [12:0] k_list_24;
reg [12:0] b_list_24;
reg [12:0] k_list_25;
reg [12:0] b_list_25;
reg [12:0] k_list_26;
reg [12:0] b_list_26;
reg [12:0] k_list_27;
reg [12:0] b_list_27;
reg [12:0] k_list_28;
reg [12:0] b_list_28;
reg [12:0] k_list_29;
reg [12:0] b_list_29;
reg [12:0] k_list_30;
reg [12:0] b_list_30;
reg [12:0] k_list_31;
reg [12:0] b_list_31;

always @ (posedge clk) begin
	k_list_0  <= 13'b0011111110101;
	k_list_1  <= 13'b0011110110111;
	k_list_2  <= 13'b0011101000011;
	k_list_3  <= 13'b0011010100100;
	k_list_4  <= 13'b0010111101011;
	k_list_5  <= 13'b0010100101000;
	k_list_6  <= 13'b0010001100111;
	k_list_7  <= 13'b0001110110001;
	k_list_8  <= 13'b0001100001110;
	k_list_9  <= 13'b0001001111111;
	k_list_10 <= 13'b0001000000101;
	k_list_11 <= 13'b0000110011111;
	k_list_12 <= 13'b0000101001011;
	k_list_13 <= 13'b0000100000111;
	k_list_14 <= 13'b0000011010000;
	k_list_15 <= 13'b0000010100100;
	k_list_16 <= 13'b0000010000001;
	k_list_17 <= 13'b0000001100101;
	k_list_18 <= 13'b0000001001111;
	k_list_19 <= 13'b0000000111110;
	k_list_20 <= 13'b0000000110000;
	k_list_21 <= 13'b0000000100110;
	k_list_22 <= 13'b0000000011101;
	k_list_23 <= 13'b0000000010111;
	k_list_24 <= 13'b0000000010010;
	k_list_25 <= 13'b0000000001110;
	k_list_26 <= 13'b0000000001011;
	k_list_27 <= 13'b0000000001000;
	k_list_28 <= 13'b0000000000111;
	k_list_29 <= 13'b0000000000101;
	k_list_30 <= 13'b0000000000100;
	k_list_31 <= 13'b0000000000011;
	b_list_0  <= 13'b0000000000000;
	b_list_1  <= 13'b0000000001000;
	b_list_2  <= 13'b0000000100101;
	b_list_3  <= 13'b0000001100000;
	b_list_4  <= 13'b0000010111101;
	b_list_5  <= 13'b0000100110111;
	b_list_6  <= 13'b0000111001000;
	b_list_7  <= 13'b0001001100111;
	b_list_8  <= 13'b0001100001010;
	b_list_9  <= 13'b0001110101011;
	b_list_10 <= 13'b0010001000011;
	b_list_11 <= 13'b0010011001111;
	b_list_12 <= 13'b0010101001101;
	b_list_13 <= 13'b0010110111100;
	b_list_14 <= 13'b0011000011101;
	b_list_15 <= 13'b0011001101111;
	b_list_16 <= 13'b0011010110101;
	b_list_17 <= 13'b0011011110000;
	b_list_18 <= 13'b0011100100001;
	b_list_19 <= 13'b0011101001010;
	b_list_20 <= 13'b0011101101100;
	b_list_21 <= 13'b0011110001000;
	b_list_22 <= 13'b0011110011110;
	b_list_23 <= 13'b0011110110001;
	b_list_24 <= 13'b0011111000000;
	b_list_25 <= 13'b0011111001101;
	b_list_26 <= 13'b0011111010111;
	b_list_27 <= 13'b0011111011111;
	b_list_28 <= 13'b0011111100101;
	b_list_29 <= 13'b0011111101010;
	b_list_30 <= 13'b0011111101111;
	b_list_31 <= 13'b0011111110010;
end
reg [17:0] x;
reg [17:0] y;
reg valid_x, valid_y, enable;
wire [4:0] sel_k_b;

wire abs_valid, round_valid, mult_valid, compute_valid;
reg use_boundary_value;
reg [12:0] mac_ay;
reg [22:0] mac_az;
reg is_x_negative;
wire is_x_negative_hold;
wire [17:0] abs_x;
wire [17:0] x_partial;
reg [31:0] y_compute;
wire [31:0] x_k_plus_b;
wire [31:0] y_rounded;

assign x_partial = (abs_x >> 7);
assign sel_k_b = x_partial [4:0];

reg [12:0] selected_k, selected_b;
always @ (*) begin
	if (sel_k_b == 0) begin
		selected_k <= k_list_0;
		selected_b <= b_list_0;
	end else if (sel_k_b == 1) begin
		selected_k <= k_list_1;
		selected_b <= b_list_1;
	end else if (sel_k_b == 2) begin
		selected_k <= k_list_2;
		selected_b <= b_list_2;
	end else if (sel_k_b == 3) begin
		selected_k <= k_list_3;
		selected_b <= b_list_3;
	end else if (sel_k_b == 4) begin
		selected_k <= k_list_4;
		selected_b <= b_list_4;
	end else if (sel_k_b == 5) begin
		selected_k <= k_list_5;
		selected_b <= b_list_5;
	end else if (sel_k_b == 6) begin
		selected_k <= k_list_6;
		selected_b <= b_list_6;
	end else if (sel_k_b == 7) begin
		selected_k <= k_list_7;
		selected_b <= b_list_7;
	end else if (sel_k_b == 8) begin
		selected_k <= k_list_8;
		selected_b <= b_list_8;
	end else if (sel_k_b == 9) begin
		selected_k <= k_list_9;
		selected_b <= b_list_9;
	end else if (sel_k_b == 10) begin
		selected_k <= k_list_10;
		selected_b <= b_list_10;
	end else if (sel_k_b == 11) begin
		selected_k <= k_list_11;
		selected_b <= b_list_11;
	end else if (sel_k_b == 12) begin
		selected_k <= k_list_12;
		selected_b <= b_list_12;
	end else if (sel_k_b == 13) begin
		selected_k <= k_list_13;
		selected_b <= b_list_13;
	end else if (sel_k_b == 14) begin
		selected_k <= k_list_14;
		selected_b <= b_list_14;
	end else if (sel_k_b == 15) begin
		selected_k <= k_list_15;
		selected_b <= b_list_15;
	end else if (sel_k_b == 16) begin
		selected_k <= k_list_16;
		selected_b <= b_list_16;
	end else if (sel_k_b == 17) begin
		selected_k <= k_list_17;
		selected_b <= b_list_17;
	end else if (sel_k_b == 18) begin
		selected_k <= k_list_18;
		selected_b <= b_list_18;
	end else if (sel_k_b == 19) begin
		selected_k <= k_list_19;
		selected_b <= b_list_19;
	end else if (sel_k_b == 20) begin
		selected_k <= k_list_20;
		selected_b <= b_list_20;
	end else if (sel_k_b == 21) begin
		selected_k <= k_list_21;
		selected_b <= b_list_21;
	end else if (sel_k_b == 22) begin
		selected_k <= k_list_22;
		selected_b <= b_list_22;
	end else if (sel_k_b == 23) begin
		selected_k <= k_list_23;
		selected_b <= b_list_23;
	end else if (sel_k_b == 24) begin
		selected_k <= k_list_24;
		selected_b <= b_list_24;
	end else if (sel_k_b == 25) begin
		selected_k <= k_list_25;
		selected_b <= b_list_25;
	end else if (sel_k_b == 26) begin
		selected_k <= k_list_26;
		selected_b <= b_list_26;
	end else if (sel_k_b == 27) begin
		selected_k <= k_list_27;
		selected_b <= b_list_27;
	end else if (sel_k_b == 28) begin
		selected_k <= k_list_28;
		selected_b <= b_list_28;
	end else if (sel_k_b == 29) begin
		selected_k <= k_list_29;
		selected_b <= b_list_29;
	end else if (sel_k_b == 30) begin
		selected_k <= k_list_30;
		selected_b <= b_list_30;
	end else if (sel_k_b == 31) begin
		selected_k <= k_list_31;
		selected_b <= b_list_31;
	end else begin
		selected_k <= 0;
		selected_b <= 0;
	end
end
always @ (*) begin
	if (abs_x >= 4096) begin
		use_boundary_value <= 1'b1;
		mac_ay <= 0;
		mac_az <= 2097152;
	end else begin
		use_boundary_value <= 1'b0;
		mac_ay <= selected_k;
		mac_az <= (selected_b << 10);
	end
end
dsp_signed_mac_18_13_23_32 dsp_signed_mac_18_13_23_32_inst (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.ax(abs_x),
	.ay(mac_ay),
	.az(mac_az),
	.i_valid(abs_valid),
	.o_valid(compute_valid),
	.resulta(x_k_plus_b)
);

shift_register_unit_1_3 shift_register_unit_1_3_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(is_x_negative),
	.out(is_x_negative_hold)
);

abs_unit_18 abs_unit_18_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(valid_x),
	.in(x),
	.o_valid(abs_valid),
	.out(abs_x)
);

fp_rounding_unit_1_32_11 fp_rounding_unit_1_32_11_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(compute_valid),
	.in(y_compute),
	.o_valid(round_valid),
	.out(y_rounded)
);

always @ (*) begin
	if (is_x_negative_hold)
		y_compute = 2097152 - x_k_plus_b;
	else 
		y_compute = x_k_plus_b;
	enable = i_ready;
end
always @ (posedge clk) begin
	if (reset) begin 
		valid_x <= 1'b0;
		valid_y <= 1'b0;
		x <= 0;
		y <= 0;
	end else if (enable) begin 
		valid_x <= i_valid;
		valid_y <= round_valid;
		x <= i_x;
		if (x[17] == 1'b1)
			is_x_negative <= 1'b1;
		else
			is_x_negative <= 1'b0;
		y <= y_rounded[17:0];
	end
end

assign o_y = y;
assign o_ready = i_ready;
assign o_valid = valid_y & i_ready;

endmodule
module fp_rounding_unit_1_32_11 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [31:0] in,
	output [31:0] out,
	output o_valid
);

reg [31:0] rounded_result;
reg [31:0] floor;
reg [31:0] ceil;
reg is_ceil;
reg floor_ceil_valid;

always @ (*) begin
	if (is_ceil) begin
		rounded_result = ceil;
	end else begin
		rounded_result = floor;
	end
end

reg valid_reg;
reg [31:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		is_ceil <= 1'b0;
		floor_ceil_valid <= 1'b0;
		valid_reg <= 1'b0;
		floor <= 0;
		ceil <= 0;
		out_reg <= 0;
	end else if (enable) begin
		is_ceil <= in[10];
		floor <= in >>> 11;
		ceil <= (in >>> 11) + 1;
		floor_ceil_valid <= i_valid;
		out_reg <= rounded_result;
		valid_reg <= floor_ceil_valid;
	end
end

assign o_valid = valid_reg;

assign out = out_reg;

endmodule
module abs_unit_18 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [17:0] in,
	output o_valid,
	output [17:0] out
);

reg [17:0] abs_result;

always @ (*) begin
	if (in[17] == 1'b1)
		abs_result = -in;
	else 
		abs_result = in;
end

reg valid_reg;
reg [17:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		valid_reg <= 1'b0;
		out_reg <= 0;
	end else if (enable) begin
		valid_reg <= i_valid;
		out_reg <= abs_result;
	end
end
assign out = out_reg;
assign o_valid = valid_reg;
endmodule
module shift_register_unit_1_3 (
	input clk,
	input reset,
	input enable,
	input [0:0] in,
	output [0:0] out
);

reg [0:0] shift_registers_0;
reg [0:0] shift_registers_1;
reg [0:0] shift_registers_2;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 1'd0;
		shift_registers_1 <= 1'd0;
		shift_registers_2 <= 1'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
	end
end

assign out = shift_registers_2;

endmodule
module dsp_signed_mac_18_13_23_32 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [12:0] ay,
	input [22:0] az,
	output o_valid,
	output [31:0] resulta
);

reg [17:0] reg_ax;
reg [12:0] reg_ay;
reg [22:0] reg_az;
reg [31:0] reg_res;
always @ (posedge clk) begin
	if (reset) begin
		reg_ax  <= 0;
		reg_ay  <= 0;
		reg_az  <= 0;
		reg_res <= 0;
	end else begin
		reg_ax  <= ax;
		reg_ay  <= ay;
		reg_az  <= az;
		reg_res <= (reg_ax * reg_ay) + reg_az;
	end
end

assign resulta = reg_res;
reg input_valid, result_valid, output_valid;
always @ (posedge clk) begin
	if (reset) begin
		output_valid <= 1'b0;
		input_valid <= 1'b0;
		result_valid <= 1'b0;
	end else if (ena) begin
		input_valid <= i_valid;
		result_valid <= input_valid;
		output_valid <= result_valid;
	end
end
assign o_valid = output_valid;
endmodule
module shift_register_group_18_16_14 (
	input clk,
	input enable,
	input [17:0] in_0,
	output [17:0] out_0,
	input [17:0] in_1,
	output [17:0] out_1,
	input [17:0] in_2,
	output [17:0] out_2,
	input [17:0] in_3,
	output [17:0] out_3,
	input [17:0] in_4,
	output [17:0] out_4,
	input [17:0] in_5,
	output [17:0] out_5,
	input [17:0] in_6,
	output [17:0] out_6,
	input [17:0] in_7,
	output [17:0] out_7,
	input [17:0] in_8,
	output [17:0] out_8,
	input [17:0] in_9,
	output [17:0] out_9,
	input [17:0] in_10,
	output [17:0] out_10,
	input [17:0] in_11,
	output [17:0] out_11,
	input [17:0] in_12,
	output [17:0] out_12,
	input [17:0] in_13,
	output [17:0] out_13,
	input [17:0] in_14,
	output [17:0] out_14,
	input [17:0] in_15,
	output [17:0] out_15,
	input reset
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

endmodule
module shift_register_unit_18_14 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
reg [17:0] shift_registers_1;
reg [17:0] shift_registers_2;
reg [17:0] shift_registers_3;
reg [17:0] shift_registers_4;
reg [17:0] shift_registers_5;
reg [17:0] shift_registers_6;
reg [17:0] shift_registers_7;
reg [17:0] shift_registers_8;
reg [17:0] shift_registers_9;
reg [17:0] shift_registers_10;
reg [17:0] shift_registers_11;
reg [17:0] shift_registers_12;
reg [17:0] shift_registers_13;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
		shift_registers_1 <= 18'd0;
		shift_registers_2 <= 18'd0;
		shift_registers_3 <= 18'd0;
		shift_registers_4 <= 18'd0;
		shift_registers_5 <= 18'd0;
		shift_registers_6 <= 18'd0;
		shift_registers_7 <= 18'd0;
		shift_registers_8 <= 18'd0;
		shift_registers_9 <= 18'd0;
		shift_registers_10 <= 18'd0;
		shift_registers_11 <= 18'd0;
		shift_registers_12 <= 18'd0;
		shift_registers_13 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
		shift_registers_3 <= shift_registers_2;
		shift_registers_4 <= shift_registers_3;
		shift_registers_5 <= shift_registers_4;
		shift_registers_6 <= shift_registers_5;
		shift_registers_7 <= shift_registers_6;
		shift_registers_8 <= shift_registers_7;
		shift_registers_9 <= shift_registers_8;
		shift_registers_10 <= shift_registers_9;
		shift_registers_11 <= shift_registers_10;
		shift_registers_12 <= shift_registers_11;
		shift_registers_13 <= shift_registers_12;
	end
end

assign out = shift_registers_13;

endmodule
module elementwise_add_core_18_18_16 (
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	input [17:0] i_A_0,
	input [17:0] i_B_0,
	output [17:0] o_C_0,
	input [17:0] i_A_1,
	input [17:0] i_B_1,
	output [17:0] o_C_1,
	input [17:0] i_A_2,
	input [17:0] i_B_2,
	output [17:0] o_C_2,
	input [17:0] i_A_3,
	input [17:0] i_B_3,
	output [17:0] o_C_3,
	input [17:0] i_A_4,
	input [17:0] i_B_4,
	output [17:0] o_C_4,
	input [17:0] i_A_5,
	input [17:0] i_B_5,
	output [17:0] o_C_5,
	input [17:0] i_A_6,
	input [17:0] i_B_6,
	output [17:0] o_C_6,
	input [17:0] i_A_7,
	input [17:0] i_B_7,
	output [17:0] o_C_7,
	input [17:0] i_A_8,
	input [17:0] i_B_8,
	output [17:0] o_C_8,
	input [17:0] i_A_9,
	input [17:0] i_B_9,
	output [17:0] o_C_9,
	input [17:0] i_A_10,
	input [17:0] i_B_10,
	output [17:0] o_C_10,
	input [17:0] i_A_11,
	input [17:0] i_B_11,
	output [17:0] o_C_11,
	input [17:0] i_A_12,
	input [17:0] i_B_12,
	output [17:0] o_C_12,
	input [17:0] i_A_13,
	input [17:0] i_B_13,
	output [17:0] o_C_13,
	input [17:0] i_A_14,
	input [17:0] i_B_14,
	output [17:0] o_C_14,
	input [17:0] i_A_15,
	input [17:0] i_B_15,
	output [17:0] o_C_15,
	output o_valid,
	output o_ready
);

reg [17:0] reg_A_0;
reg [17:0] reg_B_0;
reg [17:0] reg_C_0;
reg [17:0] reg_A_1;
reg [17:0] reg_B_1;
reg [17:0] reg_C_1;
reg [17:0] reg_A_2;
reg [17:0] reg_B_2;
reg [17:0] reg_C_2;
reg [17:0] reg_A_3;
reg [17:0] reg_B_3;
reg [17:0] reg_C_3;
reg [17:0] reg_A_4;
reg [17:0] reg_B_4;
reg [17:0] reg_C_4;
reg [17:0] reg_A_5;
reg [17:0] reg_B_5;
reg [17:0] reg_C_5;
reg [17:0] reg_A_6;
reg [17:0] reg_B_6;
reg [17:0] reg_C_6;
reg [17:0] reg_A_7;
reg [17:0] reg_B_7;
reg [17:0] reg_C_7;
reg [17:0] reg_A_8;
reg [17:0] reg_B_8;
reg [17:0] reg_C_8;
reg [17:0] reg_A_9;
reg [17:0] reg_B_9;
reg [17:0] reg_C_9;
reg [17:0] reg_A_10;
reg [17:0] reg_B_10;
reg [17:0] reg_C_10;
reg [17:0] reg_A_11;
reg [17:0] reg_B_11;
reg [17:0] reg_C_11;
reg [17:0] reg_A_12;
reg [17:0] reg_B_12;
reg [17:0] reg_C_12;
reg [17:0] reg_A_13;
reg [17:0] reg_B_13;
reg [17:0] reg_C_13;
reg [17:0] reg_A_14;
reg [17:0] reg_B_14;
reg [17:0] reg_C_14;
reg [17:0] reg_A_15;
reg [17:0] reg_B_15;
reg [17:0] reg_C_15;

reg valid_A_B, valid_C;
wire enable;
assign enable = i_ready;

always @ (posedge clk) begin
	if (reset) begin
		valid_A_B <= 1'b0;
		valid_C <= 1'b0;
		reg_A_0 <= 0;
		reg_B_0 <= 0;
		reg_C_0 <= 0;
		reg_A_1 <= 0;
		reg_B_1 <= 0;
		reg_C_1 <= 0;
		reg_A_2 <= 0;
		reg_B_2 <= 0;
		reg_C_2 <= 0;
		reg_A_3 <= 0;
		reg_B_3 <= 0;
		reg_C_3 <= 0;
		reg_A_4 <= 0;
		reg_B_4 <= 0;
		reg_C_4 <= 0;
		reg_A_5 <= 0;
		reg_B_5 <= 0;
		reg_C_5 <= 0;
		reg_A_6 <= 0;
		reg_B_6 <= 0;
		reg_C_6 <= 0;
		reg_A_7 <= 0;
		reg_B_7 <= 0;
		reg_C_7 <= 0;
		reg_A_8 <= 0;
		reg_B_8 <= 0;
		reg_C_8 <= 0;
		reg_A_9 <= 0;
		reg_B_9 <= 0;
		reg_C_9 <= 0;
		reg_A_10 <= 0;
		reg_B_10 <= 0;
		reg_C_10 <= 0;
		reg_A_11 <= 0;
		reg_B_11 <= 0;
		reg_C_11 <= 0;
		reg_A_12 <= 0;
		reg_B_12 <= 0;
		reg_C_12 <= 0;
		reg_A_13 <= 0;
		reg_B_13 <= 0;
		reg_C_13 <= 0;
		reg_A_14 <= 0;
		reg_B_14 <= 0;
		reg_C_14 <= 0;
		reg_A_15 <= 0;
		reg_B_15 <= 0;
		reg_C_15 <= 0;
	end else if (enable) begin
		reg_A_0 <= i_A_0;
		reg_B_0 <= i_B_0;
		reg_C_0 <= reg_A_0 + reg_B_0;
		reg_A_1 <= i_A_1;
		reg_B_1 <= i_B_1;
		reg_C_1 <= reg_A_1 + reg_B_1;
		reg_A_2 <= i_A_2;
		reg_B_2 <= i_B_2;
		reg_C_2 <= reg_A_2 + reg_B_2;
		reg_A_3 <= i_A_3;
		reg_B_3 <= i_B_3;
		reg_C_3 <= reg_A_3 + reg_B_3;
		reg_A_4 <= i_A_4;
		reg_B_4 <= i_B_4;
		reg_C_4 <= reg_A_4 + reg_B_4;
		reg_A_5 <= i_A_5;
		reg_B_5 <= i_B_5;
		reg_C_5 <= reg_A_5 + reg_B_5;
		reg_A_6 <= i_A_6;
		reg_B_6 <= i_B_6;
		reg_C_6 <= reg_A_6 + reg_B_6;
		reg_A_7 <= i_A_7;
		reg_B_7 <= i_B_7;
		reg_C_7 <= reg_A_7 + reg_B_7;
		reg_A_8 <= i_A_8;
		reg_B_8 <= i_B_8;
		reg_C_8 <= reg_A_8 + reg_B_8;
		reg_A_9 <= i_A_9;
		reg_B_9 <= i_B_9;
		reg_C_9 <= reg_A_9 + reg_B_9;
		reg_A_10 <= i_A_10;
		reg_B_10 <= i_B_10;
		reg_C_10 <= reg_A_10 + reg_B_10;
		reg_A_11 <= i_A_11;
		reg_B_11 <= i_B_11;
		reg_C_11 <= reg_A_11 + reg_B_11;
		reg_A_12 <= i_A_12;
		reg_B_12 <= i_B_12;
		reg_C_12 <= reg_A_12 + reg_B_12;
		reg_A_13 <= i_A_13;
		reg_B_13 <= i_B_13;
		reg_C_13 <= reg_A_13 + reg_B_13;
		reg_A_14 <= i_A_14;
		reg_B_14 <= i_B_14;
		reg_C_14 <= reg_A_14 + reg_B_14;
		reg_A_15 <= i_A_15;
		reg_B_15 <= i_B_15;
		reg_C_15 <= reg_A_15 + reg_B_15;
		valid_A_B <= i_valid;
		valid_C <= valid_A_B;
	end
end

assign o_C_0 = reg_C_0;
assign o_C_1 = reg_C_1;
assign o_C_2 = reg_C_2;
assign o_C_3 = reg_C_3;
assign o_C_4 = reg_C_4;
assign o_C_5 = reg_C_5;
assign o_C_6 = reg_C_6;
assign o_C_7 = reg_C_7;
assign o_C_8 = reg_C_8;
assign o_C_9 = reg_C_9;
assign o_C_10 = reg_C_10;
assign o_C_11 = reg_C_11;
assign o_C_12 = reg_C_12;
assign o_C_13 = reg_C_13;
assign o_C_14 = reg_C_14;
assign o_C_15 = reg_C_15;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module shift_register_group_18_16_6 (
	input clk,
	input enable,
	input [17:0] in_0,
	output [17:0] out_0,
	input [17:0] in_1,
	output [17:0] out_1,
	input [17:0] in_2,
	output [17:0] out_2,
	input [17:0] in_3,
	output [17:0] out_3,
	input [17:0] in_4,
	output [17:0] out_4,
	input [17:0] in_5,
	output [17:0] out_5,
	input [17:0] in_6,
	output [17:0] out_6,
	input [17:0] in_7,
	output [17:0] out_7,
	input [17:0] in_8,
	output [17:0] out_8,
	input [17:0] in_9,
	output [17:0] out_9,
	input [17:0] in_10,
	output [17:0] out_10,
	input [17:0] in_11,
	output [17:0] out_11,
	input [17:0] in_12,
	output [17:0] out_12,
	input [17:0] in_13,
	output [17:0] out_13,
	input [17:0] in_14,
	output [17:0] out_14,
	input [17:0] in_15,
	output [17:0] out_15,
	input reset
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

endmodule
module shift_register_unit_18_6 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
reg [17:0] shift_registers_1;
reg [17:0] shift_registers_2;
reg [17:0] shift_registers_3;
reg [17:0] shift_registers_4;
reg [17:0] shift_registers_5;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
		shift_registers_1 <= 18'd0;
		shift_registers_2 <= 18'd0;
		shift_registers_3 <= 18'd0;
		shift_registers_4 <= 18'd0;
		shift_registers_5 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
		shift_registers_3 <= shift_registers_2;
		shift_registers_4 <= shift_registers_3;
		shift_registers_5 <= shift_registers_4;
	end
end

assign out = shift_registers_5;

endmodule
module output_activation_18_10_16_1 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] stage1_result_0,
	input [17:0] bias_0,
	output [17:0] output_value_0,
	input [17:0] stage1_result_1,
	input [17:0] bias_1,
	output [17:0] output_value_1,
	input [17:0] stage1_result_2,
	input [17:0] bias_2,
	output [17:0] output_value_2,
	input [17:0] stage1_result_3,
	input [17:0] bias_3,
	output [17:0] output_value_3,
	input [17:0] stage1_result_4,
	input [17:0] bias_4,
	output [17:0] output_value_4,
	input [17:0] stage1_result_5,
	input [17:0] bias_5,
	output [17:0] output_value_5,
	input [17:0] stage1_result_6,
	input [17:0] bias_6,
	output [17:0] output_value_6,
	input [17:0] stage1_result_7,
	input [17:0] bias_7,
	output [17:0] output_value_7,
	input [17:0] stage1_result_8,
	input [17:0] bias_8,
	output [17:0] output_value_8,
	input [17:0] stage1_result_9,
	input [17:0] bias_9,
	output [17:0] output_value_9,
	input [17:0] stage1_result_10,
	input [17:0] bias_10,
	output [17:0] output_value_10,
	input [17:0] stage1_result_11,
	input [17:0] bias_11,
	output [17:0] output_value_11,
	input [17:0] stage1_result_12,
	input [17:0] bias_12,
	output [17:0] output_value_12,
	input [17:0] stage1_result_13,
	input [17:0] bias_13,
	output [17:0] output_value_13,
	input [17:0] stage1_result_14,
	input [17:0] bias_14,
	output [17:0] output_value_14,
	input [17:0] stage1_result_15,
	input [17:0] bias_15,
	output [17:0] output_value_15,
	output o_valid,
	output o_ready
);

wire adder2_valid, adder2_ready;
wire sigmoid_valid_0, sigmoid_ready_0;
wire [17:0] o_add2_0;
wire [17:0] o_sigmoid_0;
wire sigmoid_valid_1, sigmoid_ready_1;
wire [17:0] o_add2_1;
wire [17:0] o_sigmoid_1;
wire sigmoid_valid_2, sigmoid_ready_2;
wire [17:0] o_add2_2;
wire [17:0] o_sigmoid_2;
wire sigmoid_valid_3, sigmoid_ready_3;
wire [17:0] o_add2_3;
wire [17:0] o_sigmoid_3;
wire sigmoid_valid_4, sigmoid_ready_4;
wire [17:0] o_add2_4;
wire [17:0] o_sigmoid_4;
wire sigmoid_valid_5, sigmoid_ready_5;
wire [17:0] o_add2_5;
wire [17:0] o_sigmoid_5;
wire sigmoid_valid_6, sigmoid_ready_6;
wire [17:0] o_add2_6;
wire [17:0] o_sigmoid_6;
wire sigmoid_valid_7, sigmoid_ready_7;
wire [17:0] o_add2_7;
wire [17:0] o_sigmoid_7;
wire sigmoid_valid_8, sigmoid_ready_8;
wire [17:0] o_add2_8;
wire [17:0] o_sigmoid_8;
wire sigmoid_valid_9, sigmoid_ready_9;
wire [17:0] o_add2_9;
wire [17:0] o_sigmoid_9;
wire sigmoid_valid_10, sigmoid_ready_10;
wire [17:0] o_add2_10;
wire [17:0] o_sigmoid_10;
wire sigmoid_valid_11, sigmoid_ready_11;
wire [17:0] o_add2_11;
wire [17:0] o_sigmoid_11;
wire sigmoid_valid_12, sigmoid_ready_12;
wire [17:0] o_add2_12;
wire [17:0] o_sigmoid_12;
wire sigmoid_valid_13, sigmoid_ready_13;
wire [17:0] o_add2_13;
wire [17:0] o_sigmoid_13;
wire sigmoid_valid_14, sigmoid_ready_14;
wire [17:0] o_add2_14;
wire [17:0] o_sigmoid_14;
wire sigmoid_valid_15, sigmoid_ready_15;
wire [17:0] o_add2_15;
wire [17:0] o_sigmoid_15;
wire enable;
assign enable = i_ready;

elementwise_add_core_18_18_16 elementwise_add_core_18_18_16_inst (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(sigmoid_ready_0),
	.i_A_0(stage1_result_0),
	.i_B_0(bias_0),
	.o_C_0(o_add2_0),
	.i_A_1(stage1_result_1),
	.i_B_1(bias_1),
	.o_C_1(o_add2_1),
	.i_A_2(stage1_result_2),
	.i_B_2(bias_2),
	.o_C_2(o_add2_2),
	.i_A_3(stage1_result_3),
	.i_B_3(bias_3),
	.o_C_3(o_add2_3),
	.i_A_4(stage1_result_4),
	.i_B_4(bias_4),
	.o_C_4(o_add2_4),
	.i_A_5(stage1_result_5),
	.i_B_5(bias_5),
	.o_C_5(o_add2_5),
	.i_A_6(stage1_result_6),
	.i_B_6(bias_6),
	.o_C_6(o_add2_6),
	.i_A_7(stage1_result_7),
	.i_B_7(bias_7),
	.o_C_7(o_add2_7),
	.i_A_8(stage1_result_8),
	.i_B_8(bias_8),
	.o_C_8(o_add2_8),
	.i_A_9(stage1_result_9),
	.i_B_9(bias_9),
	.o_C_9(o_add2_9),
	.i_A_10(stage1_result_10),
	.i_B_10(bias_10),
	.o_C_10(o_add2_10),
	.i_A_11(stage1_result_11),
	.i_B_11(bias_11),
	.o_C_11(o_add2_11),
	.i_A_12(stage1_result_12),
	.i_B_12(bias_12),
	.o_C_12(o_add2_12),
	.i_A_13(stage1_result_13),
	.i_B_13(bias_13),
	.o_C_13(o_add2_13),
	.i_A_14(stage1_result_14),
	.i_B_14(bias_14),
	.o_C_14(o_add2_14),
	.i_A_15(stage1_result_15),
	.i_B_15(bias_15),
	.o_C_15(o_add2_15),
	.o_valid(adder2_valid),
	.o_ready(adder2_ready)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_0),
	.o_valid(sigmoid_valid_0),
	.i_x(o_add2_0),
	.o_y(o_sigmoid_0)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_1),
	.o_valid(sigmoid_valid_1),
	.i_x(o_add2_1),
	.o_y(o_sigmoid_1)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_2),
	.o_valid(sigmoid_valid_2),
	.i_x(o_add2_2),
	.o_y(o_sigmoid_2)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_3),
	.o_valid(sigmoid_valid_3),
	.i_x(o_add2_3),
	.o_y(o_sigmoid_3)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_4),
	.o_valid(sigmoid_valid_4),
	.i_x(o_add2_4),
	.o_y(o_sigmoid_4)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_5),
	.o_valid(sigmoid_valid_5),
	.i_x(o_add2_5),
	.o_y(o_sigmoid_5)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_6),
	.o_valid(sigmoid_valid_6),
	.i_x(o_add2_6),
	.o_y(o_sigmoid_6)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_7),
	.o_valid(sigmoid_valid_7),
	.i_x(o_add2_7),
	.o_y(o_sigmoid_7)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_8),
	.o_valid(sigmoid_valid_8),
	.i_x(o_add2_8),
	.o_y(o_sigmoid_8)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_9),
	.o_valid(sigmoid_valid_9),
	.i_x(o_add2_9),
	.o_y(o_sigmoid_9)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_10),
	.o_valid(sigmoid_valid_10),
	.i_x(o_add2_10),
	.o_y(o_sigmoid_10)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_11),
	.o_valid(sigmoid_valid_11),
	.i_x(o_add2_11),
	.o_y(o_sigmoid_11)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_12),
	.o_valid(sigmoid_valid_12),
	.i_x(o_add2_12),
	.o_y(o_sigmoid_12)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_13),
	.o_valid(sigmoid_valid_13),
	.i_x(o_add2_13),
	.o_y(o_sigmoid_13)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_14),
	.o_valid(sigmoid_valid_14),
	.i_x(o_add2_14),
	.o_y(o_sigmoid_14)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_15),
	.o_valid(sigmoid_valid_15),
	.i_x(o_add2_15),
	.o_y(o_sigmoid_15)
);

assign o_ready = adder2_ready;
assign o_valid = sigmoid_valid_0 & i_ready;
assign output_value_0 = o_sigmoid_0;
assign output_value_1 = o_sigmoid_1;
assign output_value_2 = o_sigmoid_2;
assign output_value_3 = o_sigmoid_3;
assign output_value_4 = o_sigmoid_4;
assign output_value_5 = o_sigmoid_5;
assign output_value_6 = o_sigmoid_6;
assign output_value_7 = o_sigmoid_7;
assign output_value_8 = o_sigmoid_8;
assign output_value_9 = o_sigmoid_9;
assign output_value_10 = o_sigmoid_10;
assign output_value_11 = o_sigmoid_11;
assign output_value_12 = o_sigmoid_12;
assign output_value_13 = o_sigmoid_13;
assign output_value_14 = o_sigmoid_14;
assign output_value_15 = o_sigmoid_15;

endmodule
module sigmoid_core_18_18_10_32_1 ( 
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	output o_ready,
	output o_valid,
	input [17:0] i_x,
	output [17:0] o_y
);

reg [12:0] k_list_0;
reg [12:0] b_list_0;
reg [12:0] k_list_1;
reg [12:0] b_list_1;
reg [12:0] k_list_2;
reg [12:0] b_list_2;
reg [12:0] k_list_3;
reg [12:0] b_list_3;
reg [12:0] k_list_4;
reg [12:0] b_list_4;
reg [12:0] k_list_5;
reg [12:0] b_list_5;
reg [12:0] k_list_6;
reg [12:0] b_list_6;
reg [12:0] k_list_7;
reg [12:0] b_list_7;
reg [12:0] k_list_8;
reg [12:0] b_list_8;
reg [12:0] k_list_9;
reg [12:0] b_list_9;
reg [12:0] k_list_10;
reg [12:0] b_list_10;
reg [12:0] k_list_11;
reg [12:0] b_list_11;
reg [12:0] k_list_12;
reg [12:0] b_list_12;
reg [12:0] k_list_13;
reg [12:0] b_list_13;
reg [12:0] k_list_14;
reg [12:0] b_list_14;
reg [12:0] k_list_15;
reg [12:0] b_list_15;
reg [12:0] k_list_16;
reg [12:0] b_list_16;
reg [12:0] k_list_17;
reg [12:0] b_list_17;
reg [12:0] k_list_18;
reg [12:0] b_list_18;
reg [12:0] k_list_19;
reg [12:0] b_list_19;
reg [12:0] k_list_20;
reg [12:0] b_list_20;
reg [12:0] k_list_21;
reg [12:0] b_list_21;
reg [12:0] k_list_22;
reg [12:0] b_list_22;
reg [12:0] k_list_23;
reg [12:0] b_list_23;
reg [12:0] k_list_24;
reg [12:0] b_list_24;
reg [12:0] k_list_25;
reg [12:0] b_list_25;
reg [12:0] k_list_26;
reg [12:0] b_list_26;
reg [12:0] k_list_27;
reg [12:0] b_list_27;
reg [12:0] k_list_28;
reg [12:0] b_list_28;
reg [12:0] k_list_29;
reg [12:0] b_list_29;
reg [12:0] k_list_30;
reg [12:0] b_list_30;
reg [12:0] k_list_31;
reg [12:0] b_list_31;

always @ (posedge clk) begin
	k_list_0  <= 13'b0000111111101;
	k_list_1  <= 13'b0000111101110;
	k_list_2  <= 13'b0000111010001;
	k_list_3  <= 13'b0000110101001;
	k_list_4  <= 13'b0000101111011;
	k_list_5  <= 13'b0000101001010;
	k_list_6  <= 13'b0000100011010;
	k_list_7  <= 13'b0000011101100;
	k_list_8  <= 13'b0000011000011;
	k_list_9  <= 13'b0000010100000;
	k_list_10 <= 13'b0000010000001;
	k_list_11 <= 13'b0000001101000;
	k_list_12 <= 13'b0000001010011;
	k_list_13 <= 13'b0000001000010;
	k_list_14 <= 13'b0000000110100;
	k_list_15 <= 13'b0000000101001;
	k_list_16 <= 13'b0000000100000;
	k_list_17 <= 13'b0000000011001;
	k_list_18 <= 13'b0000000010100;
	k_list_19 <= 13'b0000000001111;
	k_list_20 <= 13'b0000000001100;
	k_list_21 <= 13'b0000000001001;
	k_list_22 <= 13'b0000000000111;
	k_list_23 <= 13'b0000000000110;
	k_list_24 <= 13'b0000000000100;
	k_list_25 <= 13'b0000000000011;
	k_list_26 <= 13'b0000000000011;
	k_list_27 <= 13'b0000000000010;
	k_list_28 <= 13'b0000000000010;
	k_list_29 <= 13'b0000000000001;
	k_list_30 <= 13'b0000000000001;
	k_list_31 <= 13'b0000000000001;
	b_list_0  <= 13'b0010000000000;
	b_list_1  <= 13'b0010000000100;
	b_list_2  <= 13'b0010000010010;
	b_list_3  <= 13'b0010000110000;
	b_list_4  <= 13'b0010001011110;
	b_list_5  <= 13'b0010010011011;
	b_list_6  <= 13'b0010011100100;
	b_list_7  <= 13'b0010100110011;
	b_list_8  <= 13'b0010110000101;
	b_list_9  <= 13'b0010111010101;
	b_list_10 <= 13'b0011000100010;
	b_list_11 <= 13'b0011001101000;
	b_list_12 <= 13'b0011010100111;
	b_list_13 <= 13'b0011011011110;
	b_list_14 <= 13'b0011100001110;
	b_list_15 <= 13'b0011100111000;
	b_list_16 <= 13'b0011101011011;
	b_list_17 <= 13'b0011101111000;
	b_list_18 <= 13'b0011110010001;
	b_list_19 <= 13'b0011110100101;
	b_list_20 <= 13'b0011110110110;
	b_list_21 <= 13'b0011111000100;
	b_list_22 <= 13'b0011111001111;
	b_list_23 <= 13'b0011111011001;
	b_list_24 <= 13'b0011111100000;
	b_list_25 <= 13'b0011111100110;
	b_list_26 <= 13'b0011111101011;
	b_list_27 <= 13'b0011111101111;
	b_list_28 <= 13'b0011111110011;
	b_list_29 <= 13'b0011111110101;
	b_list_30 <= 13'b0011111110111;
	b_list_31 <= 13'b0011111111001;
end
reg [17:0] x;
reg [17:0] y;
reg valid_x, valid_y, enable;
wire [4:0] sel_k_b;

wire abs_valid, round_valid, mult_valid, compute_valid;
reg use_boundary_value;
reg [12:0] mac_ay;
reg [22:0] mac_az;
reg is_x_negative;
wire is_x_negative_hold;
wire [17:0] abs_x;
wire [17:0] x_partial;
reg [31:0] y_compute;
wire [31:0] x_k_plus_b;
wire [31:0] y_rounded;

assign x_partial = (abs_x >> 8);
assign sel_k_b = x_partial [4:0];

reg [12:0] selected_k, selected_b;
always @ (*) begin
	if (sel_k_b == 0) begin
		selected_k <= k_list_0;
		selected_b <= b_list_0;
	end else if (sel_k_b == 1) begin
		selected_k <= k_list_1;
		selected_b <= b_list_1;
	end else if (sel_k_b == 2) begin
		selected_k <= k_list_2;
		selected_b <= b_list_2;
	end else if (sel_k_b == 3) begin
		selected_k <= k_list_3;
		selected_b <= b_list_3;
	end else if (sel_k_b == 4) begin
		selected_k <= k_list_4;
		selected_b <= b_list_4;
	end else if (sel_k_b == 5) begin
		selected_k <= k_list_5;
		selected_b <= b_list_5;
	end else if (sel_k_b == 6) begin
		selected_k <= k_list_6;
		selected_b <= b_list_6;
	end else if (sel_k_b == 7) begin
		selected_k <= k_list_7;
		selected_b <= b_list_7;
	end else if (sel_k_b == 8) begin
		selected_k <= k_list_8;
		selected_b <= b_list_8;
	end else if (sel_k_b == 9) begin
		selected_k <= k_list_9;
		selected_b <= b_list_9;
	end else if (sel_k_b == 10) begin
		selected_k <= k_list_10;
		selected_b <= b_list_10;
	end else if (sel_k_b == 11) begin
		selected_k <= k_list_11;
		selected_b <= b_list_11;
	end else if (sel_k_b == 12) begin
		selected_k <= k_list_12;
		selected_b <= b_list_12;
	end else if (sel_k_b == 13) begin
		selected_k <= k_list_13;
		selected_b <= b_list_13;
	end else if (sel_k_b == 14) begin
		selected_k <= k_list_14;
		selected_b <= b_list_14;
	end else if (sel_k_b == 15) begin
		selected_k <= k_list_15;
		selected_b <= b_list_15;
	end else if (sel_k_b == 16) begin
		selected_k <= k_list_16;
		selected_b <= b_list_16;
	end else if (sel_k_b == 17) begin
		selected_k <= k_list_17;
		selected_b <= b_list_17;
	end else if (sel_k_b == 18) begin
		selected_k <= k_list_18;
		selected_b <= b_list_18;
	end else if (sel_k_b == 19) begin
		selected_k <= k_list_19;
		selected_b <= b_list_19;
	end else if (sel_k_b == 20) begin
		selected_k <= k_list_20;
		selected_b <= b_list_20;
	end else if (sel_k_b == 21) begin
		selected_k <= k_list_21;
		selected_b <= b_list_21;
	end else if (sel_k_b == 22) begin
		selected_k <= k_list_22;
		selected_b <= b_list_22;
	end else if (sel_k_b == 23) begin
		selected_k <= k_list_23;
		selected_b <= b_list_23;
	end else if (sel_k_b == 24) begin
		selected_k <= k_list_24;
		selected_b <= b_list_24;
	end else if (sel_k_b == 25) begin
		selected_k <= k_list_25;
		selected_b <= b_list_25;
	end else if (sel_k_b == 26) begin
		selected_k <= k_list_26;
		selected_b <= b_list_26;
	end else if (sel_k_b == 27) begin
		selected_k <= k_list_27;
		selected_b <= b_list_27;
	end else if (sel_k_b == 28) begin
		selected_k <= k_list_28;
		selected_b <= b_list_28;
	end else if (sel_k_b == 29) begin
		selected_k <= k_list_29;
		selected_b <= b_list_29;
	end else if (sel_k_b == 30) begin
		selected_k <= k_list_30;
		selected_b <= b_list_30;
	end else if (sel_k_b == 31) begin
		selected_k <= k_list_31;
		selected_b <= b_list_31;
	end else begin
		selected_k <= 0;
		selected_b <= 0;
	end
end
always @ (*) begin
	if (abs_x >= 8192) begin
		use_boundary_value <= 1'b1;
		mac_ay <= 0;
		mac_az <= 2097152;
	end else begin
		use_boundary_value <= 1'b0;
		mac_ay <= selected_k;
		mac_az <= (selected_b << 10);
	end
end
dsp_signed_mac_18_13_23_32 dsp_signed_mac_18_13_23_32_inst (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.ax(abs_x),
	.ay(mac_ay),
	.az(mac_az),
	.i_valid(abs_valid),
	.o_valid(compute_valid),
	.resulta(x_k_plus_b)
);

shift_register_unit_1_3 shift_register_unit_1_3_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(is_x_negative),
	.out(is_x_negative_hold)
);

abs_unit_18 abs_unit_18_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(valid_x),
	.in(x),
	.o_valid(abs_valid),
	.out(abs_x)
);

fp_rounding_unit_1_32_11 fp_rounding_unit_1_32_11_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(compute_valid),
	.in(y_compute),
	.o_valid(round_valid),
	.out(y_rounded)
);

always @ (*) begin
	if (is_x_negative_hold)
		y_compute = 2097152 - x_k_plus_b;
	else 
		y_compute = x_k_plus_b;
	enable = i_ready;
end
always @ (posedge clk) begin
	if (reset) begin 
		valid_x <= 1'b0;
		valid_y <= 1'b0;
		x <= 0;
		y <= 0;
	end else if (enable) begin 
		valid_x <= i_valid;
		valid_y <= round_valid;
		x <= i_x;
		if (x[17] == 1'b1)
			is_x_negative <= 1'b1;
		else
			is_x_negative <= 1'b0;
		y <= y_rounded[17:0];
	end
end

assign o_y = y;
assign o_ready = i_ready;
assign o_valid = valid_y & i_ready;

endmodule
module lstm_gate_18_10_16_1 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] stage1_result_0,
	input [17:0] weight_0,
	input [17:0] Ct_1_0,
	input [17:0] bias_0,
	output [17:0] gate_output_0,
	input [17:0] stage1_result_1,
	input [17:0] weight_1,
	input [17:0] Ct_1_1,
	input [17:0] bias_1,
	output [17:0] gate_output_1,
	input [17:0] stage1_result_2,
	input [17:0] weight_2,
	input [17:0] Ct_1_2,
	input [17:0] bias_2,
	output [17:0] gate_output_2,
	input [17:0] stage1_result_3,
	input [17:0] weight_3,
	input [17:0] Ct_1_3,
	input [17:0] bias_3,
	output [17:0] gate_output_3,
	input [17:0] stage1_result_4,
	input [17:0] weight_4,
	input [17:0] Ct_1_4,
	input [17:0] bias_4,
	output [17:0] gate_output_4,
	input [17:0] stage1_result_5,
	input [17:0] weight_5,
	input [17:0] Ct_1_5,
	input [17:0] bias_5,
	output [17:0] gate_output_5,
	input [17:0] stage1_result_6,
	input [17:0] weight_6,
	input [17:0] Ct_1_6,
	input [17:0] bias_6,
	output [17:0] gate_output_6,
	input [17:0] stage1_result_7,
	input [17:0] weight_7,
	input [17:0] Ct_1_7,
	input [17:0] bias_7,
	output [17:0] gate_output_7,
	input [17:0] stage1_result_8,
	input [17:0] weight_8,
	input [17:0] Ct_1_8,
	input [17:0] bias_8,
	output [17:0] gate_output_8,
	input [17:0] stage1_result_9,
	input [17:0] weight_9,
	input [17:0] Ct_1_9,
	input [17:0] bias_9,
	output [17:0] gate_output_9,
	input [17:0] stage1_result_10,
	input [17:0] weight_10,
	input [17:0] Ct_1_10,
	input [17:0] bias_10,
	output [17:0] gate_output_10,
	input [17:0] stage1_result_11,
	input [17:0] weight_11,
	input [17:0] Ct_1_11,
	input [17:0] bias_11,
	output [17:0] gate_output_11,
	input [17:0] stage1_result_12,
	input [17:0] weight_12,
	input [17:0] Ct_1_12,
	input [17:0] bias_12,
	output [17:0] gate_output_12,
	input [17:0] stage1_result_13,
	input [17:0] weight_13,
	input [17:0] Ct_1_13,
	input [17:0] bias_13,
	output [17:0] gate_output_13,
	input [17:0] stage1_result_14,
	input [17:0] weight_14,
	input [17:0] Ct_1_14,
	input [17:0] bias_14,
	output [17:0] gate_output_14,
	input [17:0] stage1_result_15,
	input [17:0] weight_15,
	input [17:0] Ct_1_15,
	input [17:0] bias_15,
	output [17:0] gate_output_15,
	output o_valid,
	output o_ready
);

wire mult_valid, add0_valid, add1_valid, add2_valid;
wire mult_ready, add0_ready, add1_ready, add2_ready;
wire sigmoid_valid_0, sigmoid_ready_0;
wire [17:0] o_mult_0;
wire [17:0] o_add0_0;
wire [17:0] o_add1_0;
wire [17:0] add1_hold_0;
wire [17:0] o_add2_0;
wire [17:0] o_sigmoid_0;
wire sigmoid_valid_1, sigmoid_ready_1;
wire [17:0] o_mult_1;
wire [17:0] o_add0_1;
wire [17:0] o_add1_1;
wire [17:0] add1_hold_1;
wire [17:0] o_add2_1;
wire [17:0] o_sigmoid_1;
wire sigmoid_valid_2, sigmoid_ready_2;
wire [17:0] o_mult_2;
wire [17:0] o_add0_2;
wire [17:0] o_add1_2;
wire [17:0] add1_hold_2;
wire [17:0] o_add2_2;
wire [17:0] o_sigmoid_2;
wire sigmoid_valid_3, sigmoid_ready_3;
wire [17:0] o_mult_3;
wire [17:0] o_add0_3;
wire [17:0] o_add1_3;
wire [17:0] add1_hold_3;
wire [17:0] o_add2_3;
wire [17:0] o_sigmoid_3;
wire sigmoid_valid_4, sigmoid_ready_4;
wire [17:0] o_mult_4;
wire [17:0] o_add0_4;
wire [17:0] o_add1_4;
wire [17:0] add1_hold_4;
wire [17:0] o_add2_4;
wire [17:0] o_sigmoid_4;
wire sigmoid_valid_5, sigmoid_ready_5;
wire [17:0] o_mult_5;
wire [17:0] o_add0_5;
wire [17:0] o_add1_5;
wire [17:0] add1_hold_5;
wire [17:0] o_add2_5;
wire [17:0] o_sigmoid_5;
wire sigmoid_valid_6, sigmoid_ready_6;
wire [17:0] o_mult_6;
wire [17:0] o_add0_6;
wire [17:0] o_add1_6;
wire [17:0] add1_hold_6;
wire [17:0] o_add2_6;
wire [17:0] o_sigmoid_6;
wire sigmoid_valid_7, sigmoid_ready_7;
wire [17:0] o_mult_7;
wire [17:0] o_add0_7;
wire [17:0] o_add1_7;
wire [17:0] add1_hold_7;
wire [17:0] o_add2_7;
wire [17:0] o_sigmoid_7;
wire sigmoid_valid_8, sigmoid_ready_8;
wire [17:0] o_mult_8;
wire [17:0] o_add0_8;
wire [17:0] o_add1_8;
wire [17:0] add1_hold_8;
wire [17:0] o_add2_8;
wire [17:0] o_sigmoid_8;
wire sigmoid_valid_9, sigmoid_ready_9;
wire [17:0] o_mult_9;
wire [17:0] o_add0_9;
wire [17:0] o_add1_9;
wire [17:0] add1_hold_9;
wire [17:0] o_add2_9;
wire [17:0] o_sigmoid_9;
wire sigmoid_valid_10, sigmoid_ready_10;
wire [17:0] o_mult_10;
wire [17:0] o_add0_10;
wire [17:0] o_add1_10;
wire [17:0] add1_hold_10;
wire [17:0] o_add2_10;
wire [17:0] o_sigmoid_10;
wire sigmoid_valid_11, sigmoid_ready_11;
wire [17:0] o_mult_11;
wire [17:0] o_add0_11;
wire [17:0] o_add1_11;
wire [17:0] add1_hold_11;
wire [17:0] o_add2_11;
wire [17:0] o_sigmoid_11;
wire sigmoid_valid_12, sigmoid_ready_12;
wire [17:0] o_mult_12;
wire [17:0] o_add0_12;
wire [17:0] o_add1_12;
wire [17:0] add1_hold_12;
wire [17:0] o_add2_12;
wire [17:0] o_sigmoid_12;
wire sigmoid_valid_13, sigmoid_ready_13;
wire [17:0] o_mult_13;
wire [17:0] o_add0_13;
wire [17:0] o_add1_13;
wire [17:0] add1_hold_13;
wire [17:0] o_add2_13;
wire [17:0] o_sigmoid_13;
wire sigmoid_valid_14, sigmoid_ready_14;
wire [17:0] o_mult_14;
wire [17:0] o_add0_14;
wire [17:0] o_add1_14;
wire [17:0] add1_hold_14;
wire [17:0] o_add2_14;
wire [17:0] o_sigmoid_14;
wire sigmoid_valid_15, sigmoid_ready_15;
wire [17:0] o_mult_15;
wire [17:0] o_add0_15;
wire [17:0] o_add1_15;
wire [17:0] add1_hold_15;
wire [17:0] o_add2_15;
wire [17:0] o_sigmoid_15;
wire enable;
assign enable = i_ready;

elementwise_mult_core_18_18_10_16_1 elementwise_mult_core_18_18_10_16_1_mult (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(add2_ready),
	.i_A_0(weight_0),
	.i_B_0(Ct_1_0),
	.o_C_0(o_mult_0),
	.i_A_1(weight_1),
	.i_B_1(Ct_1_1),
	.o_C_1(o_mult_1),
	.i_A_2(weight_2),
	.i_B_2(Ct_1_2),
	.o_C_2(o_mult_2),
	.i_A_3(weight_3),
	.i_B_3(Ct_1_3),
	.o_C_3(o_mult_3),
	.i_A_4(weight_4),
	.i_B_4(Ct_1_4),
	.o_C_4(o_mult_4),
	.i_A_5(weight_5),
	.i_B_5(Ct_1_5),
	.o_C_5(o_mult_5),
	.i_A_6(weight_6),
	.i_B_6(Ct_1_6),
	.o_C_6(o_mult_6),
	.i_A_7(weight_7),
	.i_B_7(Ct_1_7),
	.o_C_7(o_mult_7),
	.i_A_8(weight_8),
	.i_B_8(Ct_1_8),
	.o_C_8(o_mult_8),
	.i_A_9(weight_9),
	.i_B_9(Ct_1_9),
	.o_C_9(o_mult_9),
	.i_A_10(weight_10),
	.i_B_10(Ct_1_10),
	.o_C_10(o_mult_10),
	.i_A_11(weight_11),
	.i_B_11(Ct_1_11),
	.o_C_11(o_mult_11),
	.i_A_12(weight_12),
	.i_B_12(Ct_1_12),
	.o_C_12(o_mult_12),
	.i_A_13(weight_13),
	.i_B_13(Ct_1_13),
	.o_C_13(o_mult_13),
	.i_A_14(weight_14),
	.i_B_14(Ct_1_14),
	.o_C_14(o_mult_14),
	.i_A_15(weight_15),
	.i_B_15(Ct_1_15),
	.o_C_15(o_mult_15),
	.o_valid(mult_valid),
	.o_ready(mult_ready)
);

elementwise_add_core_18_18_16 elementwise_add_core_18_18_16_add_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(add2_ready),
	.i_A_0(stage1_result_0),
	.i_B_0(bias_0),
	.o_C_0(o_add1_0),
	.i_A_1(stage1_result_1),
	.i_B_1(bias_1),
	.o_C_1(o_add1_1),
	.i_A_2(stage1_result_2),
	.i_B_2(bias_2),
	.o_C_2(o_add1_2),
	.i_A_3(stage1_result_3),
	.i_B_3(bias_3),
	.o_C_3(o_add1_3),
	.i_A_4(stage1_result_4),
	.i_B_4(bias_4),
	.o_C_4(o_add1_4),
	.i_A_5(stage1_result_5),
	.i_B_5(bias_5),
	.o_C_5(o_add1_5),
	.i_A_6(stage1_result_6),
	.i_B_6(bias_6),
	.o_C_6(o_add1_6),
	.i_A_7(stage1_result_7),
	.i_B_7(bias_7),
	.o_C_7(o_add1_7),
	.i_A_8(stage1_result_8),
	.i_B_8(bias_8),
	.o_C_8(o_add1_8),
	.i_A_9(stage1_result_9),
	.i_B_9(bias_9),
	.o_C_9(o_add1_9),
	.i_A_10(stage1_result_10),
	.i_B_10(bias_10),
	.o_C_10(o_add1_10),
	.i_A_11(stage1_result_11),
	.i_B_11(bias_11),
	.o_C_11(o_add1_11),
	.i_A_12(stage1_result_12),
	.i_B_12(bias_12),
	.o_C_12(o_add1_12),
	.i_A_13(stage1_result_13),
	.i_B_13(bias_13),
	.o_C_13(o_add1_13),
	.i_A_14(stage1_result_14),
	.i_B_14(bias_14),
	.o_C_14(o_add1_14),
	.i_A_15(stage1_result_15),
	.i_B_15(bias_15),
	.o_C_15(o_add1_15),
	.o_valid(add1_valid),
	.o_ready(add1_ready)
);

shift_register_group_18_16_10 shift_register_group_18_16_10_Ct (
	.clk(clk),
	.enable(enable),
	.in_0(o_add1_0),
	.out_0(add1_hold_0),
	.in_1(o_add1_1),
	.out_1(add1_hold_1),
	.in_2(o_add1_2),
	.out_2(add1_hold_2),
	.in_3(o_add1_3),
	.out_3(add1_hold_3),
	.in_4(o_add1_4),
	.out_4(add1_hold_4),
	.in_5(o_add1_5),
	.out_5(add1_hold_5),
	.in_6(o_add1_6),
	.out_6(add1_hold_6),
	.in_7(o_add1_7),
	.out_7(add1_hold_7),
	.in_8(o_add1_8),
	.out_8(add1_hold_8),
	.in_9(o_add1_9),
	.out_9(add1_hold_9),
	.in_10(o_add1_10),
	.out_10(add1_hold_10),
	.in_11(o_add1_11),
	.out_11(add1_hold_11),
	.in_12(o_add1_12),
	.out_12(add1_hold_12),
	.in_13(o_add1_13),
	.out_13(add1_hold_13),
	.in_14(o_add1_14),
	.out_14(add1_hold_14),
	.in_15(o_add1_15),
	.out_15(add1_hold_15),
	.reset(reset)
);

elementwise_add_core_18_18_16 elementwise_add_core_18_18_16_add_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(mult_valid),
	.i_ready(sigmoid_ready_0),
	.i_A_0(add1_hold_0),
	.i_B_0(o_mult_0),
	.o_C_0(o_add2_0),
	.i_A_1(add1_hold_1),
	.i_B_1(o_mult_1),
	.o_C_1(o_add2_1),
	.i_A_2(add1_hold_2),
	.i_B_2(o_mult_2),
	.o_C_2(o_add2_2),
	.i_A_3(add1_hold_3),
	.i_B_3(o_mult_3),
	.o_C_3(o_add2_3),
	.i_A_4(add1_hold_4),
	.i_B_4(o_mult_4),
	.o_C_4(o_add2_4),
	.i_A_5(add1_hold_5),
	.i_B_5(o_mult_5),
	.o_C_5(o_add2_5),
	.i_A_6(add1_hold_6),
	.i_B_6(o_mult_6),
	.o_C_6(o_add2_6),
	.i_A_7(add1_hold_7),
	.i_B_7(o_mult_7),
	.o_C_7(o_add2_7),
	.i_A_8(add1_hold_8),
	.i_B_8(o_mult_8),
	.o_C_8(o_add2_8),
	.i_A_9(add1_hold_9),
	.i_B_9(o_mult_9),
	.o_C_9(o_add2_9),
	.i_A_10(add1_hold_10),
	.i_B_10(o_mult_10),
	.o_C_10(o_add2_10),
	.i_A_11(add1_hold_11),
	.i_B_11(o_mult_11),
	.o_C_11(o_add2_11),
	.i_A_12(add1_hold_12),
	.i_B_12(o_mult_12),
	.o_C_12(o_add2_12),
	.i_A_13(add1_hold_13),
	.i_B_13(o_mult_13),
	.o_C_13(o_add2_13),
	.i_A_14(add1_hold_14),
	.i_B_14(o_mult_14),
	.o_C_14(o_add2_14),
	.i_A_15(add1_hold_15),
	.i_B_15(o_mult_15),
	.o_C_15(o_add2_15),
	.o_valid(add2_valid),
	.o_ready(add2_ready)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_0),
	.o_valid(sigmoid_valid_0),
	.i_x(o_add2_0),
	.o_y(o_sigmoid_0)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_1),
	.o_valid(sigmoid_valid_1),
	.i_x(o_add2_1),
	.o_y(o_sigmoid_1)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_2),
	.o_valid(sigmoid_valid_2),
	.i_x(o_add2_2),
	.o_y(o_sigmoid_2)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_3),
	.o_valid(sigmoid_valid_3),
	.i_x(o_add2_3),
	.o_y(o_sigmoid_3)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_4),
	.o_valid(sigmoid_valid_4),
	.i_x(o_add2_4),
	.o_y(o_sigmoid_4)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_5),
	.o_valid(sigmoid_valid_5),
	.i_x(o_add2_5),
	.o_y(o_sigmoid_5)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_6),
	.o_valid(sigmoid_valid_6),
	.i_x(o_add2_6),
	.o_y(o_sigmoid_6)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_7),
	.o_valid(sigmoid_valid_7),
	.i_x(o_add2_7),
	.o_y(o_sigmoid_7)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_8),
	.o_valid(sigmoid_valid_8),
	.i_x(o_add2_8),
	.o_y(o_sigmoid_8)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_9),
	.o_valid(sigmoid_valid_9),
	.i_x(o_add2_9),
	.o_y(o_sigmoid_9)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_10),
	.o_valid(sigmoid_valid_10),
	.i_x(o_add2_10),
	.o_y(o_sigmoid_10)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_11),
	.o_valid(sigmoid_valid_11),
	.i_x(o_add2_11),
	.o_y(o_sigmoid_11)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_12),
	.o_valid(sigmoid_valid_12),
	.i_x(o_add2_12),
	.o_y(o_sigmoid_12)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_13),
	.o_valid(sigmoid_valid_13),
	.i_x(o_add2_13),
	.o_y(o_sigmoid_13)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_14),
	.o_valid(sigmoid_valid_14),
	.i_x(o_add2_14),
	.o_y(o_sigmoid_14)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_15),
	.o_valid(sigmoid_valid_15),
	.i_x(o_add2_15),
	.o_y(o_sigmoid_15)
);

assign o_ready = mult_ready;
assign o_valid = sigmoid_valid_0 & i_ready;
assign gate_output_0 = o_sigmoid_0;
assign gate_output_1 = o_sigmoid_1;
assign gate_output_2 = o_sigmoid_2;
assign gate_output_3 = o_sigmoid_3;
assign gate_output_4 = o_sigmoid_4;
assign gate_output_5 = o_sigmoid_5;
assign gate_output_6 = o_sigmoid_6;
assign gate_output_7 = o_sigmoid_7;
assign gate_output_8 = o_sigmoid_8;
assign gate_output_9 = o_sigmoid_9;
assign gate_output_10 = o_sigmoid_10;
assign gate_output_11 = o_sigmoid_11;
assign gate_output_12 = o_sigmoid_12;
assign gate_output_13 = o_sigmoid_13;
assign gate_output_14 = o_sigmoid_14;
assign gate_output_15 = o_sigmoid_15;

endmodule
module shift_register_group_18_16_10 (
	input clk,
	input enable,
	input [17:0] in_0,
	output [17:0] out_0,
	input [17:0] in_1,
	output [17:0] out_1,
	input [17:0] in_2,
	output [17:0] out_2,
	input [17:0] in_3,
	output [17:0] out_3,
	input [17:0] in_4,
	output [17:0] out_4,
	input [17:0] in_5,
	output [17:0] out_5,
	input [17:0] in_6,
	output [17:0] out_6,
	input [17:0] in_7,
	output [17:0] out_7,
	input [17:0] in_8,
	output [17:0] out_8,
	input [17:0] in_9,
	output [17:0] out_9,
	input [17:0] in_10,
	output [17:0] out_10,
	input [17:0] in_11,
	output [17:0] out_11,
	input [17:0] in_12,
	output [17:0] out_12,
	input [17:0] in_13,
	output [17:0] out_13,
	input [17:0] in_14,
	output [17:0] out_14,
	input [17:0] in_15,
	output [17:0] out_15,
	input reset
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

endmodule

module dsp_signed_mult_18x18_unit_18_18_1 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [17:0] ay,
	input [17:0] bx,
	input [17:0] by,
	output o_valid,
	output [36:0] resulta,
	output [36:0] resultb 
);

reg [17:0] reg_ax, reg_ay, reg_bx, reg_by;
reg [36:0] reg_resa, reg_resb;
always @(posedge clk) begin
	if (reset) begin
		reg_ax <= 0;
		reg_ay <= 0;
		reg_bx <= 0;
		reg_by <= 0;
		reg_resa <= 0;
		reg_resb <= 0;
	end else if (ena) begin
		reg_ax <= ax;
		reg_ay <= ay;
		reg_bx <= bx;
		reg_by <= by;
		reg_resa <= reg_ax * reg_ay;
		reg_resb <= reg_bx * reg_by;
	end
end

assign resulta = reg_resa;
assign resultb = reg_resb;
reg input_valid, result_valid, output_valid;
always @ (posedge clk) begin
	if (reset) begin
		output_valid <= 1'b0;
		input_valid <= 1'b0;
		result_valid <= 1'b0;
	end else if (ena) begin
		input_valid <= i_valid;
		result_valid <= input_valid;
		output_valid <= result_valid;
	end
end
assign o_valid = output_valid;

endmodule

module fp_rounding_unit_1_37_10 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [36:0] in,
	output [36:0] out,
	output o_valid
);

reg [36:0] rounded_result;
reg [36:0] floor;
reg [36:0] ceil;
reg is_ceil;
reg floor_ceil_valid;

always @ (*) begin
	if (is_ceil) begin
		rounded_result = ceil;
	end else begin
		rounded_result = floor;
	end
end

reg valid_reg;
reg [36:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		is_ceil <= 1'b0;
		floor_ceil_valid <= 1'b0;
		valid_reg <= 1'b0;
		floor <= 0;
		ceil <= 0;
		out_reg <= 0;
	end else if (enable) begin
		is_ceil <= in[9];
		floor <= in >>> 10;
		ceil <= (in >>> 10) + 1;
		floor_ceil_valid <= i_valid;
		out_reg <= rounded_result;
		valid_reg <= floor_ceil_valid;
	end
end

assign o_valid = valid_reg;

assign out = out_reg;

endmodule






