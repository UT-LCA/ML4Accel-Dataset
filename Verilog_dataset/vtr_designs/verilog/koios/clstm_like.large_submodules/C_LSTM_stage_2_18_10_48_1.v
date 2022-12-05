`define SIMULATION_MEMORY

module C_LSTM_stage_2_18_10_48_1 (
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
	input [17:0] Ct_1_16,
	input [17:0] WixrXtYt_1_16,
	input [17:0] Wic_16,
	input [17:0] bi_16,
	input [17:0] WfxrXtYt_1_16,
	input [17:0] Wfc_16,
	input [17:0] bf_16,
	input [17:0] WoxrXtYt_1_16,
	input [17:0] Woc_16,
	input [17:0] bo_16,
	input [17:0] WcxrXtYt_1_16,
	input [17:0] bc_16,
	output [17:0] out_mt_16,
	output [17:0] out_ct_16,
	input [17:0] Ct_1_17,
	input [17:0] WixrXtYt_1_17,
	input [17:0] Wic_17,
	input [17:0] bi_17,
	input [17:0] WfxrXtYt_1_17,
	input [17:0] Wfc_17,
	input [17:0] bf_17,
	input [17:0] WoxrXtYt_1_17,
	input [17:0] Woc_17,
	input [17:0] bo_17,
	input [17:0] WcxrXtYt_1_17,
	input [17:0] bc_17,
	output [17:0] out_mt_17,
	output [17:0] out_ct_17,
	input [17:0] Ct_1_18,
	input [17:0] WixrXtYt_1_18,
	input [17:0] Wic_18,
	input [17:0] bi_18,
	input [17:0] WfxrXtYt_1_18,
	input [17:0] Wfc_18,
	input [17:0] bf_18,
	input [17:0] WoxrXtYt_1_18,
	input [17:0] Woc_18,
	input [17:0] bo_18,
	input [17:0] WcxrXtYt_1_18,
	input [17:0] bc_18,
	output [17:0] out_mt_18,
	output [17:0] out_ct_18,
	input [17:0] Ct_1_19,
	input [17:0] WixrXtYt_1_19,
	input [17:0] Wic_19,
	input [17:0] bi_19,
	input [17:0] WfxrXtYt_1_19,
	input [17:0] Wfc_19,
	input [17:0] bf_19,
	input [17:0] WoxrXtYt_1_19,
	input [17:0] Woc_19,
	input [17:0] bo_19,
	input [17:0] WcxrXtYt_1_19,
	input [17:0] bc_19,
	output [17:0] out_mt_19,
	output [17:0] out_ct_19,
	input [17:0] Ct_1_20,
	input [17:0] WixrXtYt_1_20,
	input [17:0] Wic_20,
	input [17:0] bi_20,
	input [17:0] WfxrXtYt_1_20,
	input [17:0] Wfc_20,
	input [17:0] bf_20,
	input [17:0] WoxrXtYt_1_20,
	input [17:0] Woc_20,
	input [17:0] bo_20,
	input [17:0] WcxrXtYt_1_20,
	input [17:0] bc_20,
	output [17:0] out_mt_20,
	output [17:0] out_ct_20,
	input [17:0] Ct_1_21,
	input [17:0] WixrXtYt_1_21,
	input [17:0] Wic_21,
	input [17:0] bi_21,
	input [17:0] WfxrXtYt_1_21,
	input [17:0] Wfc_21,
	input [17:0] bf_21,
	input [17:0] WoxrXtYt_1_21,
	input [17:0] Woc_21,
	input [17:0] bo_21,
	input [17:0] WcxrXtYt_1_21,
	input [17:0] bc_21,
	output [17:0] out_mt_21,
	output [17:0] out_ct_21,
	input [17:0] Ct_1_22,
	input [17:0] WixrXtYt_1_22,
	input [17:0] Wic_22,
	input [17:0] bi_22,
	input [17:0] WfxrXtYt_1_22,
	input [17:0] Wfc_22,
	input [17:0] bf_22,
	input [17:0] WoxrXtYt_1_22,
	input [17:0] Woc_22,
	input [17:0] bo_22,
	input [17:0] WcxrXtYt_1_22,
	input [17:0] bc_22,
	output [17:0] out_mt_22,
	output [17:0] out_ct_22,
	input [17:0] Ct_1_23,
	input [17:0] WixrXtYt_1_23,
	input [17:0] Wic_23,
	input [17:0] bi_23,
	input [17:0] WfxrXtYt_1_23,
	input [17:0] Wfc_23,
	input [17:0] bf_23,
	input [17:0] WoxrXtYt_1_23,
	input [17:0] Woc_23,
	input [17:0] bo_23,
	input [17:0] WcxrXtYt_1_23,
	input [17:0] bc_23,
	output [17:0] out_mt_23,
	output [17:0] out_ct_23,
	input [17:0] Ct_1_24,
	input [17:0] WixrXtYt_1_24,
	input [17:0] Wic_24,
	input [17:0] bi_24,
	input [17:0] WfxrXtYt_1_24,
	input [17:0] Wfc_24,
	input [17:0] bf_24,
	input [17:0] WoxrXtYt_1_24,
	input [17:0] Woc_24,
	input [17:0] bo_24,
	input [17:0] WcxrXtYt_1_24,
	input [17:0] bc_24,
	output [17:0] out_mt_24,
	output [17:0] out_ct_24,
	input [17:0] Ct_1_25,
	input [17:0] WixrXtYt_1_25,
	input [17:0] Wic_25,
	input [17:0] bi_25,
	input [17:0] WfxrXtYt_1_25,
	input [17:0] Wfc_25,
	input [17:0] bf_25,
	input [17:0] WoxrXtYt_1_25,
	input [17:0] Woc_25,
	input [17:0] bo_25,
	input [17:0] WcxrXtYt_1_25,
	input [17:0] bc_25,
	output [17:0] out_mt_25,
	output [17:0] out_ct_25,
	input [17:0] Ct_1_26,
	input [17:0] WixrXtYt_1_26,
	input [17:0] Wic_26,
	input [17:0] bi_26,
	input [17:0] WfxrXtYt_1_26,
	input [17:0] Wfc_26,
	input [17:0] bf_26,
	input [17:0] WoxrXtYt_1_26,
	input [17:0] Woc_26,
	input [17:0] bo_26,
	input [17:0] WcxrXtYt_1_26,
	input [17:0] bc_26,
	output [17:0] out_mt_26,
	output [17:0] out_ct_26,
	input [17:0] Ct_1_27,
	input [17:0] WixrXtYt_1_27,
	input [17:0] Wic_27,
	input [17:0] bi_27,
	input [17:0] WfxrXtYt_1_27,
	input [17:0] Wfc_27,
	input [17:0] bf_27,
	input [17:0] WoxrXtYt_1_27,
	input [17:0] Woc_27,
	input [17:0] bo_27,
	input [17:0] WcxrXtYt_1_27,
	input [17:0] bc_27,
	output [17:0] out_mt_27,
	output [17:0] out_ct_27,
	input [17:0] Ct_1_28,
	input [17:0] WixrXtYt_1_28,
	input [17:0] Wic_28,
	input [17:0] bi_28,
	input [17:0] WfxrXtYt_1_28,
	input [17:0] Wfc_28,
	input [17:0] bf_28,
	input [17:0] WoxrXtYt_1_28,
	input [17:0] Woc_28,
	input [17:0] bo_28,
	input [17:0] WcxrXtYt_1_28,
	input [17:0] bc_28,
	output [17:0] out_mt_28,
	output [17:0] out_ct_28,
	input [17:0] Ct_1_29,
	input [17:0] WixrXtYt_1_29,
	input [17:0] Wic_29,
	input [17:0] bi_29,
	input [17:0] WfxrXtYt_1_29,
	input [17:0] Wfc_29,
	input [17:0] bf_29,
	input [17:0] WoxrXtYt_1_29,
	input [17:0] Woc_29,
	input [17:0] bo_29,
	input [17:0] WcxrXtYt_1_29,
	input [17:0] bc_29,
	output [17:0] out_mt_29,
	output [17:0] out_ct_29,
	input [17:0] Ct_1_30,
	input [17:0] WixrXtYt_1_30,
	input [17:0] Wic_30,
	input [17:0] bi_30,
	input [17:0] WfxrXtYt_1_30,
	input [17:0] Wfc_30,
	input [17:0] bf_30,
	input [17:0] WoxrXtYt_1_30,
	input [17:0] Woc_30,
	input [17:0] bo_30,
	input [17:0] WcxrXtYt_1_30,
	input [17:0] bc_30,
	output [17:0] out_mt_30,
	output [17:0] out_ct_30,
	input [17:0] Ct_1_31,
	input [17:0] WixrXtYt_1_31,
	input [17:0] Wic_31,
	input [17:0] bi_31,
	input [17:0] WfxrXtYt_1_31,
	input [17:0] Wfc_31,
	input [17:0] bf_31,
	input [17:0] WoxrXtYt_1_31,
	input [17:0] Woc_31,
	input [17:0] bo_31,
	input [17:0] WcxrXtYt_1_31,
	input [17:0] bc_31,
	output [17:0] out_mt_31,
	output [17:0] out_ct_31,
	input [17:0] Ct_1_32,
	input [17:0] WixrXtYt_1_32,
	input [17:0] Wic_32,
	input [17:0] bi_32,
	input [17:0] WfxrXtYt_1_32,
	input [17:0] Wfc_32,
	input [17:0] bf_32,
	input [17:0] WoxrXtYt_1_32,
	input [17:0] Woc_32,
	input [17:0] bo_32,
	input [17:0] WcxrXtYt_1_32,
	input [17:0] bc_32,
	output [17:0] out_mt_32,
	output [17:0] out_ct_32,
	input [17:0] Ct_1_33,
	input [17:0] WixrXtYt_1_33,
	input [17:0] Wic_33,
	input [17:0] bi_33,
	input [17:0] WfxrXtYt_1_33,
	input [17:0] Wfc_33,
	input [17:0] bf_33,
	input [17:0] WoxrXtYt_1_33,
	input [17:0] Woc_33,
	input [17:0] bo_33,
	input [17:0] WcxrXtYt_1_33,
	input [17:0] bc_33,
	output [17:0] out_mt_33,
	output [17:0] out_ct_33,
	input [17:0] Ct_1_34,
	input [17:0] WixrXtYt_1_34,
	input [17:0] Wic_34,
	input [17:0] bi_34,
	input [17:0] WfxrXtYt_1_34,
	input [17:0] Wfc_34,
	input [17:0] bf_34,
	input [17:0] WoxrXtYt_1_34,
	input [17:0] Woc_34,
	input [17:0] bo_34,
	input [17:0] WcxrXtYt_1_34,
	input [17:0] bc_34,
	output [17:0] out_mt_34,
	output [17:0] out_ct_34,
	input [17:0] Ct_1_35,
	input [17:0] WixrXtYt_1_35,
	input [17:0] Wic_35,
	input [17:0] bi_35,
	input [17:0] WfxrXtYt_1_35,
	input [17:0] Wfc_35,
	input [17:0] bf_35,
	input [17:0] WoxrXtYt_1_35,
	input [17:0] Woc_35,
	input [17:0] bo_35,
	input [17:0] WcxrXtYt_1_35,
	input [17:0] bc_35,
	output [17:0] out_mt_35,
	output [17:0] out_ct_35,
	input [17:0] Ct_1_36,
	input [17:0] WixrXtYt_1_36,
	input [17:0] Wic_36,
	input [17:0] bi_36,
	input [17:0] WfxrXtYt_1_36,
	input [17:0] Wfc_36,
	input [17:0] bf_36,
	input [17:0] WoxrXtYt_1_36,
	input [17:0] Woc_36,
	input [17:0] bo_36,
	input [17:0] WcxrXtYt_1_36,
	input [17:0] bc_36,
	output [17:0] out_mt_36,
	output [17:0] out_ct_36,
	input [17:0] Ct_1_37,
	input [17:0] WixrXtYt_1_37,
	input [17:0] Wic_37,
	input [17:0] bi_37,
	input [17:0] WfxrXtYt_1_37,
	input [17:0] Wfc_37,
	input [17:0] bf_37,
	input [17:0] WoxrXtYt_1_37,
	input [17:0] Woc_37,
	input [17:0] bo_37,
	input [17:0] WcxrXtYt_1_37,
	input [17:0] bc_37,
	output [17:0] out_mt_37,
	output [17:0] out_ct_37,
	input [17:0] Ct_1_38,
	input [17:0] WixrXtYt_1_38,
	input [17:0] Wic_38,
	input [17:0] bi_38,
	input [17:0] WfxrXtYt_1_38,
	input [17:0] Wfc_38,
	input [17:0] bf_38,
	input [17:0] WoxrXtYt_1_38,
	input [17:0] Woc_38,
	input [17:0] bo_38,
	input [17:0] WcxrXtYt_1_38,
	input [17:0] bc_38,
	output [17:0] out_mt_38,
	output [17:0] out_ct_38,
	input [17:0] Ct_1_39,
	input [17:0] WixrXtYt_1_39,
	input [17:0] Wic_39,
	input [17:0] bi_39,
	input [17:0] WfxrXtYt_1_39,
	input [17:0] Wfc_39,
	input [17:0] bf_39,
	input [17:0] WoxrXtYt_1_39,
	input [17:0] Woc_39,
	input [17:0] bo_39,
	input [17:0] WcxrXtYt_1_39,
	input [17:0] bc_39,
	output [17:0] out_mt_39,
	output [17:0] out_ct_39,
	input [17:0] Ct_1_40,
	input [17:0] WixrXtYt_1_40,
	input [17:0] Wic_40,
	input [17:0] bi_40,
	input [17:0] WfxrXtYt_1_40,
	input [17:0] Wfc_40,
	input [17:0] bf_40,
	input [17:0] WoxrXtYt_1_40,
	input [17:0] Woc_40,
	input [17:0] bo_40,
	input [17:0] WcxrXtYt_1_40,
	input [17:0] bc_40,
	output [17:0] out_mt_40,
	output [17:0] out_ct_40,
	input [17:0] Ct_1_41,
	input [17:0] WixrXtYt_1_41,
	input [17:0] Wic_41,
	input [17:0] bi_41,
	input [17:0] WfxrXtYt_1_41,
	input [17:0] Wfc_41,
	input [17:0] bf_41,
	input [17:0] WoxrXtYt_1_41,
	input [17:0] Woc_41,
	input [17:0] bo_41,
	input [17:0] WcxrXtYt_1_41,
	input [17:0] bc_41,
	output [17:0] out_mt_41,
	output [17:0] out_ct_41,
	input [17:0] Ct_1_42,
	input [17:0] WixrXtYt_1_42,
	input [17:0] Wic_42,
	input [17:0] bi_42,
	input [17:0] WfxrXtYt_1_42,
	input [17:0] Wfc_42,
	input [17:0] bf_42,
	input [17:0] WoxrXtYt_1_42,
	input [17:0] Woc_42,
	input [17:0] bo_42,
	input [17:0] WcxrXtYt_1_42,
	input [17:0] bc_42,
	output [17:0] out_mt_42,
	output [17:0] out_ct_42,
	input [17:0] Ct_1_43,
	input [17:0] WixrXtYt_1_43,
	input [17:0] Wic_43,
	input [17:0] bi_43,
	input [17:0] WfxrXtYt_1_43,
	input [17:0] Wfc_43,
	input [17:0] bf_43,
	input [17:0] WoxrXtYt_1_43,
	input [17:0] Woc_43,
	input [17:0] bo_43,
	input [17:0] WcxrXtYt_1_43,
	input [17:0] bc_43,
	output [17:0] out_mt_43,
	output [17:0] out_ct_43,
	input [17:0] Ct_1_44,
	input [17:0] WixrXtYt_1_44,
	input [17:0] Wic_44,
	input [17:0] bi_44,
	input [17:0] WfxrXtYt_1_44,
	input [17:0] Wfc_44,
	input [17:0] bf_44,
	input [17:0] WoxrXtYt_1_44,
	input [17:0] Woc_44,
	input [17:0] bo_44,
	input [17:0] WcxrXtYt_1_44,
	input [17:0] bc_44,
	output [17:0] out_mt_44,
	output [17:0] out_ct_44,
	input [17:0] Ct_1_45,
	input [17:0] WixrXtYt_1_45,
	input [17:0] Wic_45,
	input [17:0] bi_45,
	input [17:0] WfxrXtYt_1_45,
	input [17:0] Wfc_45,
	input [17:0] bf_45,
	input [17:0] WoxrXtYt_1_45,
	input [17:0] Woc_45,
	input [17:0] bo_45,
	input [17:0] WcxrXtYt_1_45,
	input [17:0] bc_45,
	output [17:0] out_mt_45,
	output [17:0] out_ct_45,
	input [17:0] Ct_1_46,
	input [17:0] WixrXtYt_1_46,
	input [17:0] Wic_46,
	input [17:0] bi_46,
	input [17:0] WfxrXtYt_1_46,
	input [17:0] Wfc_46,
	input [17:0] bf_46,
	input [17:0] WoxrXtYt_1_46,
	input [17:0] Woc_46,
	input [17:0] bo_46,
	input [17:0] WcxrXtYt_1_46,
	input [17:0] bc_46,
	output [17:0] out_mt_46,
	output [17:0] out_ct_46,
	input [17:0] Ct_1_47,
	input [17:0] WixrXtYt_1_47,
	input [17:0] Wic_47,
	input [17:0] bi_47,
	input [17:0] WfxrXtYt_1_47,
	input [17:0] Wfc_47,
	input [17:0] bf_47,
	input [17:0] WoxrXtYt_1_47,
	input [17:0] Woc_47,
	input [17:0] bo_47,
	input [17:0] WcxrXtYt_1_47,
	input [17:0] bc_47,
	output [17:0] out_mt_47,
	output [17:0] out_ct_47,
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
reg [17:0] reg_Ct_1_16;
reg [17:0] reg_WixrXtYt_1_16;
reg [17:0] reg_Wic_16;
reg [17:0] reg_bi_16;
reg [17:0] reg_WfxrXtYt_1_16;
reg [17:0] reg_Wfc_16;
reg [17:0] reg_bf_16;
reg [17:0] reg_WoxrXtYt_1_16;
reg [17:0] reg_Woc_16;
reg [17:0] reg_bo_16;
reg [17:0] reg_WcxrXtYt_1_16;
reg [17:0] reg_bc_16;
reg [17:0] reg_out_mt_16;
reg [17:0] reg_out_ct_16;
reg [17:0] reg_Ct_1_17;
reg [17:0] reg_WixrXtYt_1_17;
reg [17:0] reg_Wic_17;
reg [17:0] reg_bi_17;
reg [17:0] reg_WfxrXtYt_1_17;
reg [17:0] reg_Wfc_17;
reg [17:0] reg_bf_17;
reg [17:0] reg_WoxrXtYt_1_17;
reg [17:0] reg_Woc_17;
reg [17:0] reg_bo_17;
reg [17:0] reg_WcxrXtYt_1_17;
reg [17:0] reg_bc_17;
reg [17:0] reg_out_mt_17;
reg [17:0] reg_out_ct_17;
reg [17:0] reg_Ct_1_18;
reg [17:0] reg_WixrXtYt_1_18;
reg [17:0] reg_Wic_18;
reg [17:0] reg_bi_18;
reg [17:0] reg_WfxrXtYt_1_18;
reg [17:0] reg_Wfc_18;
reg [17:0] reg_bf_18;
reg [17:0] reg_WoxrXtYt_1_18;
reg [17:0] reg_Woc_18;
reg [17:0] reg_bo_18;
reg [17:0] reg_WcxrXtYt_1_18;
reg [17:0] reg_bc_18;
reg [17:0] reg_out_mt_18;
reg [17:0] reg_out_ct_18;
reg [17:0] reg_Ct_1_19;
reg [17:0] reg_WixrXtYt_1_19;
reg [17:0] reg_Wic_19;
reg [17:0] reg_bi_19;
reg [17:0] reg_WfxrXtYt_1_19;
reg [17:0] reg_Wfc_19;
reg [17:0] reg_bf_19;
reg [17:0] reg_WoxrXtYt_1_19;
reg [17:0] reg_Woc_19;
reg [17:0] reg_bo_19;
reg [17:0] reg_WcxrXtYt_1_19;
reg [17:0] reg_bc_19;
reg [17:0] reg_out_mt_19;
reg [17:0] reg_out_ct_19;
reg [17:0] reg_Ct_1_20;
reg [17:0] reg_WixrXtYt_1_20;
reg [17:0] reg_Wic_20;
reg [17:0] reg_bi_20;
reg [17:0] reg_WfxrXtYt_1_20;
reg [17:0] reg_Wfc_20;
reg [17:0] reg_bf_20;
reg [17:0] reg_WoxrXtYt_1_20;
reg [17:0] reg_Woc_20;
reg [17:0] reg_bo_20;
reg [17:0] reg_WcxrXtYt_1_20;
reg [17:0] reg_bc_20;
reg [17:0] reg_out_mt_20;
reg [17:0] reg_out_ct_20;
reg [17:0] reg_Ct_1_21;
reg [17:0] reg_WixrXtYt_1_21;
reg [17:0] reg_Wic_21;
reg [17:0] reg_bi_21;
reg [17:0] reg_WfxrXtYt_1_21;
reg [17:0] reg_Wfc_21;
reg [17:0] reg_bf_21;
reg [17:0] reg_WoxrXtYt_1_21;
reg [17:0] reg_Woc_21;
reg [17:0] reg_bo_21;
reg [17:0] reg_WcxrXtYt_1_21;
reg [17:0] reg_bc_21;
reg [17:0] reg_out_mt_21;
reg [17:0] reg_out_ct_21;
reg [17:0] reg_Ct_1_22;
reg [17:0] reg_WixrXtYt_1_22;
reg [17:0] reg_Wic_22;
reg [17:0] reg_bi_22;
reg [17:0] reg_WfxrXtYt_1_22;
reg [17:0] reg_Wfc_22;
reg [17:0] reg_bf_22;
reg [17:0] reg_WoxrXtYt_1_22;
reg [17:0] reg_Woc_22;
reg [17:0] reg_bo_22;
reg [17:0] reg_WcxrXtYt_1_22;
reg [17:0] reg_bc_22;
reg [17:0] reg_out_mt_22;
reg [17:0] reg_out_ct_22;
reg [17:0] reg_Ct_1_23;
reg [17:0] reg_WixrXtYt_1_23;
reg [17:0] reg_Wic_23;
reg [17:0] reg_bi_23;
reg [17:0] reg_WfxrXtYt_1_23;
reg [17:0] reg_Wfc_23;
reg [17:0] reg_bf_23;
reg [17:0] reg_WoxrXtYt_1_23;
reg [17:0] reg_Woc_23;
reg [17:0] reg_bo_23;
reg [17:0] reg_WcxrXtYt_1_23;
reg [17:0] reg_bc_23;
reg [17:0] reg_out_mt_23;
reg [17:0] reg_out_ct_23;
reg [17:0] reg_Ct_1_24;
reg [17:0] reg_WixrXtYt_1_24;
reg [17:0] reg_Wic_24;
reg [17:0] reg_bi_24;
reg [17:0] reg_WfxrXtYt_1_24;
reg [17:0] reg_Wfc_24;
reg [17:0] reg_bf_24;
reg [17:0] reg_WoxrXtYt_1_24;
reg [17:0] reg_Woc_24;
reg [17:0] reg_bo_24;
reg [17:0] reg_WcxrXtYt_1_24;
reg [17:0] reg_bc_24;
reg [17:0] reg_out_mt_24;
reg [17:0] reg_out_ct_24;
reg [17:0] reg_Ct_1_25;
reg [17:0] reg_WixrXtYt_1_25;
reg [17:0] reg_Wic_25;
reg [17:0] reg_bi_25;
reg [17:0] reg_WfxrXtYt_1_25;
reg [17:0] reg_Wfc_25;
reg [17:0] reg_bf_25;
reg [17:0] reg_WoxrXtYt_1_25;
reg [17:0] reg_Woc_25;
reg [17:0] reg_bo_25;
reg [17:0] reg_WcxrXtYt_1_25;
reg [17:0] reg_bc_25;
reg [17:0] reg_out_mt_25;
reg [17:0] reg_out_ct_25;
reg [17:0] reg_Ct_1_26;
reg [17:0] reg_WixrXtYt_1_26;
reg [17:0] reg_Wic_26;
reg [17:0] reg_bi_26;
reg [17:0] reg_WfxrXtYt_1_26;
reg [17:0] reg_Wfc_26;
reg [17:0] reg_bf_26;
reg [17:0] reg_WoxrXtYt_1_26;
reg [17:0] reg_Woc_26;
reg [17:0] reg_bo_26;
reg [17:0] reg_WcxrXtYt_1_26;
reg [17:0] reg_bc_26;
reg [17:0] reg_out_mt_26;
reg [17:0] reg_out_ct_26;
reg [17:0] reg_Ct_1_27;
reg [17:0] reg_WixrXtYt_1_27;
reg [17:0] reg_Wic_27;
reg [17:0] reg_bi_27;
reg [17:0] reg_WfxrXtYt_1_27;
reg [17:0] reg_Wfc_27;
reg [17:0] reg_bf_27;
reg [17:0] reg_WoxrXtYt_1_27;
reg [17:0] reg_Woc_27;
reg [17:0] reg_bo_27;
reg [17:0] reg_WcxrXtYt_1_27;
reg [17:0] reg_bc_27;
reg [17:0] reg_out_mt_27;
reg [17:0] reg_out_ct_27;
reg [17:0] reg_Ct_1_28;
reg [17:0] reg_WixrXtYt_1_28;
reg [17:0] reg_Wic_28;
reg [17:0] reg_bi_28;
reg [17:0] reg_WfxrXtYt_1_28;
reg [17:0] reg_Wfc_28;
reg [17:0] reg_bf_28;
reg [17:0] reg_WoxrXtYt_1_28;
reg [17:0] reg_Woc_28;
reg [17:0] reg_bo_28;
reg [17:0] reg_WcxrXtYt_1_28;
reg [17:0] reg_bc_28;
reg [17:0] reg_out_mt_28;
reg [17:0] reg_out_ct_28;
reg [17:0] reg_Ct_1_29;
reg [17:0] reg_WixrXtYt_1_29;
reg [17:0] reg_Wic_29;
reg [17:0] reg_bi_29;
reg [17:0] reg_WfxrXtYt_1_29;
reg [17:0] reg_Wfc_29;
reg [17:0] reg_bf_29;
reg [17:0] reg_WoxrXtYt_1_29;
reg [17:0] reg_Woc_29;
reg [17:0] reg_bo_29;
reg [17:0] reg_WcxrXtYt_1_29;
reg [17:0] reg_bc_29;
reg [17:0] reg_out_mt_29;
reg [17:0] reg_out_ct_29;
reg [17:0] reg_Ct_1_30;
reg [17:0] reg_WixrXtYt_1_30;
reg [17:0] reg_Wic_30;
reg [17:0] reg_bi_30;
reg [17:0] reg_WfxrXtYt_1_30;
reg [17:0] reg_Wfc_30;
reg [17:0] reg_bf_30;
reg [17:0] reg_WoxrXtYt_1_30;
reg [17:0] reg_Woc_30;
reg [17:0] reg_bo_30;
reg [17:0] reg_WcxrXtYt_1_30;
reg [17:0] reg_bc_30;
reg [17:0] reg_out_mt_30;
reg [17:0] reg_out_ct_30;
reg [17:0] reg_Ct_1_31;
reg [17:0] reg_WixrXtYt_1_31;
reg [17:0] reg_Wic_31;
reg [17:0] reg_bi_31;
reg [17:0] reg_WfxrXtYt_1_31;
reg [17:0] reg_Wfc_31;
reg [17:0] reg_bf_31;
reg [17:0] reg_WoxrXtYt_1_31;
reg [17:0] reg_Woc_31;
reg [17:0] reg_bo_31;
reg [17:0] reg_WcxrXtYt_1_31;
reg [17:0] reg_bc_31;
reg [17:0] reg_out_mt_31;
reg [17:0] reg_out_ct_31;
reg [17:0] reg_Ct_1_32;
reg [17:0] reg_WixrXtYt_1_32;
reg [17:0] reg_Wic_32;
reg [17:0] reg_bi_32;
reg [17:0] reg_WfxrXtYt_1_32;
reg [17:0] reg_Wfc_32;
reg [17:0] reg_bf_32;
reg [17:0] reg_WoxrXtYt_1_32;
reg [17:0] reg_Woc_32;
reg [17:0] reg_bo_32;
reg [17:0] reg_WcxrXtYt_1_32;
reg [17:0] reg_bc_32;
reg [17:0] reg_out_mt_32;
reg [17:0] reg_out_ct_32;
reg [17:0] reg_Ct_1_33;
reg [17:0] reg_WixrXtYt_1_33;
reg [17:0] reg_Wic_33;
reg [17:0] reg_bi_33;
reg [17:0] reg_WfxrXtYt_1_33;
reg [17:0] reg_Wfc_33;
reg [17:0] reg_bf_33;
reg [17:0] reg_WoxrXtYt_1_33;
reg [17:0] reg_Woc_33;
reg [17:0] reg_bo_33;
reg [17:0] reg_WcxrXtYt_1_33;
reg [17:0] reg_bc_33;
reg [17:0] reg_out_mt_33;
reg [17:0] reg_out_ct_33;
reg [17:0] reg_Ct_1_34;
reg [17:0] reg_WixrXtYt_1_34;
reg [17:0] reg_Wic_34;
reg [17:0] reg_bi_34;
reg [17:0] reg_WfxrXtYt_1_34;
reg [17:0] reg_Wfc_34;
reg [17:0] reg_bf_34;
reg [17:0] reg_WoxrXtYt_1_34;
reg [17:0] reg_Woc_34;
reg [17:0] reg_bo_34;
reg [17:0] reg_WcxrXtYt_1_34;
reg [17:0] reg_bc_34;
reg [17:0] reg_out_mt_34;
reg [17:0] reg_out_ct_34;
reg [17:0] reg_Ct_1_35;
reg [17:0] reg_WixrXtYt_1_35;
reg [17:0] reg_Wic_35;
reg [17:0] reg_bi_35;
reg [17:0] reg_WfxrXtYt_1_35;
reg [17:0] reg_Wfc_35;
reg [17:0] reg_bf_35;
reg [17:0] reg_WoxrXtYt_1_35;
reg [17:0] reg_Woc_35;
reg [17:0] reg_bo_35;
reg [17:0] reg_WcxrXtYt_1_35;
reg [17:0] reg_bc_35;
reg [17:0] reg_out_mt_35;
reg [17:0] reg_out_ct_35;
reg [17:0] reg_Ct_1_36;
reg [17:0] reg_WixrXtYt_1_36;
reg [17:0] reg_Wic_36;
reg [17:0] reg_bi_36;
reg [17:0] reg_WfxrXtYt_1_36;
reg [17:0] reg_Wfc_36;
reg [17:0] reg_bf_36;
reg [17:0] reg_WoxrXtYt_1_36;
reg [17:0] reg_Woc_36;
reg [17:0] reg_bo_36;
reg [17:0] reg_WcxrXtYt_1_36;
reg [17:0] reg_bc_36;
reg [17:0] reg_out_mt_36;
reg [17:0] reg_out_ct_36;
reg [17:0] reg_Ct_1_37;
reg [17:0] reg_WixrXtYt_1_37;
reg [17:0] reg_Wic_37;
reg [17:0] reg_bi_37;
reg [17:0] reg_WfxrXtYt_1_37;
reg [17:0] reg_Wfc_37;
reg [17:0] reg_bf_37;
reg [17:0] reg_WoxrXtYt_1_37;
reg [17:0] reg_Woc_37;
reg [17:0] reg_bo_37;
reg [17:0] reg_WcxrXtYt_1_37;
reg [17:0] reg_bc_37;
reg [17:0] reg_out_mt_37;
reg [17:0] reg_out_ct_37;
reg [17:0] reg_Ct_1_38;
reg [17:0] reg_WixrXtYt_1_38;
reg [17:0] reg_Wic_38;
reg [17:0] reg_bi_38;
reg [17:0] reg_WfxrXtYt_1_38;
reg [17:0] reg_Wfc_38;
reg [17:0] reg_bf_38;
reg [17:0] reg_WoxrXtYt_1_38;
reg [17:0] reg_Woc_38;
reg [17:0] reg_bo_38;
reg [17:0] reg_WcxrXtYt_1_38;
reg [17:0] reg_bc_38;
reg [17:0] reg_out_mt_38;
reg [17:0] reg_out_ct_38;
reg [17:0] reg_Ct_1_39;
reg [17:0] reg_WixrXtYt_1_39;
reg [17:0] reg_Wic_39;
reg [17:0] reg_bi_39;
reg [17:0] reg_WfxrXtYt_1_39;
reg [17:0] reg_Wfc_39;
reg [17:0] reg_bf_39;
reg [17:0] reg_WoxrXtYt_1_39;
reg [17:0] reg_Woc_39;
reg [17:0] reg_bo_39;
reg [17:0] reg_WcxrXtYt_1_39;
reg [17:0] reg_bc_39;
reg [17:0] reg_out_mt_39;
reg [17:0] reg_out_ct_39;
reg [17:0] reg_Ct_1_40;
reg [17:0] reg_WixrXtYt_1_40;
reg [17:0] reg_Wic_40;
reg [17:0] reg_bi_40;
reg [17:0] reg_WfxrXtYt_1_40;
reg [17:0] reg_Wfc_40;
reg [17:0] reg_bf_40;
reg [17:0] reg_WoxrXtYt_1_40;
reg [17:0] reg_Woc_40;
reg [17:0] reg_bo_40;
reg [17:0] reg_WcxrXtYt_1_40;
reg [17:0] reg_bc_40;
reg [17:0] reg_out_mt_40;
reg [17:0] reg_out_ct_40;
reg [17:0] reg_Ct_1_41;
reg [17:0] reg_WixrXtYt_1_41;
reg [17:0] reg_Wic_41;
reg [17:0] reg_bi_41;
reg [17:0] reg_WfxrXtYt_1_41;
reg [17:0] reg_Wfc_41;
reg [17:0] reg_bf_41;
reg [17:0] reg_WoxrXtYt_1_41;
reg [17:0] reg_Woc_41;
reg [17:0] reg_bo_41;
reg [17:0] reg_WcxrXtYt_1_41;
reg [17:0] reg_bc_41;
reg [17:0] reg_out_mt_41;
reg [17:0] reg_out_ct_41;
reg [17:0] reg_Ct_1_42;
reg [17:0] reg_WixrXtYt_1_42;
reg [17:0] reg_Wic_42;
reg [17:0] reg_bi_42;
reg [17:0] reg_WfxrXtYt_1_42;
reg [17:0] reg_Wfc_42;
reg [17:0] reg_bf_42;
reg [17:0] reg_WoxrXtYt_1_42;
reg [17:0] reg_Woc_42;
reg [17:0] reg_bo_42;
reg [17:0] reg_WcxrXtYt_1_42;
reg [17:0] reg_bc_42;
reg [17:0] reg_out_mt_42;
reg [17:0] reg_out_ct_42;
reg [17:0] reg_Ct_1_43;
reg [17:0] reg_WixrXtYt_1_43;
reg [17:0] reg_Wic_43;
reg [17:0] reg_bi_43;
reg [17:0] reg_WfxrXtYt_1_43;
reg [17:0] reg_Wfc_43;
reg [17:0] reg_bf_43;
reg [17:0] reg_WoxrXtYt_1_43;
reg [17:0] reg_Woc_43;
reg [17:0] reg_bo_43;
reg [17:0] reg_WcxrXtYt_1_43;
reg [17:0] reg_bc_43;
reg [17:0] reg_out_mt_43;
reg [17:0] reg_out_ct_43;
reg [17:0] reg_Ct_1_44;
reg [17:0] reg_WixrXtYt_1_44;
reg [17:0] reg_Wic_44;
reg [17:0] reg_bi_44;
reg [17:0] reg_WfxrXtYt_1_44;
reg [17:0] reg_Wfc_44;
reg [17:0] reg_bf_44;
reg [17:0] reg_WoxrXtYt_1_44;
reg [17:0] reg_Woc_44;
reg [17:0] reg_bo_44;
reg [17:0] reg_WcxrXtYt_1_44;
reg [17:0] reg_bc_44;
reg [17:0] reg_out_mt_44;
reg [17:0] reg_out_ct_44;
reg [17:0] reg_Ct_1_45;
reg [17:0] reg_WixrXtYt_1_45;
reg [17:0] reg_Wic_45;
reg [17:0] reg_bi_45;
reg [17:0] reg_WfxrXtYt_1_45;
reg [17:0] reg_Wfc_45;
reg [17:0] reg_bf_45;
reg [17:0] reg_WoxrXtYt_1_45;
reg [17:0] reg_Woc_45;
reg [17:0] reg_bo_45;
reg [17:0] reg_WcxrXtYt_1_45;
reg [17:0] reg_bc_45;
reg [17:0] reg_out_mt_45;
reg [17:0] reg_out_ct_45;
reg [17:0] reg_Ct_1_46;
reg [17:0] reg_WixrXtYt_1_46;
reg [17:0] reg_Wic_46;
reg [17:0] reg_bi_46;
reg [17:0] reg_WfxrXtYt_1_46;
reg [17:0] reg_Wfc_46;
reg [17:0] reg_bf_46;
reg [17:0] reg_WoxrXtYt_1_46;
reg [17:0] reg_Woc_46;
reg [17:0] reg_bo_46;
reg [17:0] reg_WcxrXtYt_1_46;
reg [17:0] reg_bc_46;
reg [17:0] reg_out_mt_46;
reg [17:0] reg_out_ct_46;
reg [17:0] reg_Ct_1_47;
reg [17:0] reg_WixrXtYt_1_47;
reg [17:0] reg_Wic_47;
reg [17:0] reg_bi_47;
reg [17:0] reg_WfxrXtYt_1_47;
reg [17:0] reg_Wfc_47;
reg [17:0] reg_bf_47;
reg [17:0] reg_WoxrXtYt_1_47;
reg [17:0] reg_Woc_47;
reg [17:0] reg_bo_47;
reg [17:0] reg_WcxrXtYt_1_47;
reg [17:0] reg_bc_47;
reg [17:0] reg_out_mt_47;
reg [17:0] reg_out_ct_47;

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
wire tanh_valid_16;
wire [17:0] o_Ct_1_16;
wire [17:0] Ct_1_hold_16;
wire [17:0] o_input_gate_16;
wire [17:0] o_forget_gate_16;
wire [17:0] o_output_gate_16;
wire [17:0] ot_hold_16;
wire [17:0] o_gt_16;
wire [17:0] gt_hold_16;
wire [17:0] o_it_gt_mult_16;
wire [17:0] o_ft_Ct_1_mult_16;
wire [17:0] o_ct_16;
wire [17:0] ct_hold_16;
wire [17:0] o_tanh_16;
wire [17:0] o_mt_16;
wire tanh_valid_17;
wire [17:0] o_Ct_1_17;
wire [17:0] Ct_1_hold_17;
wire [17:0] o_input_gate_17;
wire [17:0] o_forget_gate_17;
wire [17:0] o_output_gate_17;
wire [17:0] ot_hold_17;
wire [17:0] o_gt_17;
wire [17:0] gt_hold_17;
wire [17:0] o_it_gt_mult_17;
wire [17:0] o_ft_Ct_1_mult_17;
wire [17:0] o_ct_17;
wire [17:0] ct_hold_17;
wire [17:0] o_tanh_17;
wire [17:0] o_mt_17;
wire tanh_valid_18;
wire [17:0] o_Ct_1_18;
wire [17:0] Ct_1_hold_18;
wire [17:0] o_input_gate_18;
wire [17:0] o_forget_gate_18;
wire [17:0] o_output_gate_18;
wire [17:0] ot_hold_18;
wire [17:0] o_gt_18;
wire [17:0] gt_hold_18;
wire [17:0] o_it_gt_mult_18;
wire [17:0] o_ft_Ct_1_mult_18;
wire [17:0] o_ct_18;
wire [17:0] ct_hold_18;
wire [17:0] o_tanh_18;
wire [17:0] o_mt_18;
wire tanh_valid_19;
wire [17:0] o_Ct_1_19;
wire [17:0] Ct_1_hold_19;
wire [17:0] o_input_gate_19;
wire [17:0] o_forget_gate_19;
wire [17:0] o_output_gate_19;
wire [17:0] ot_hold_19;
wire [17:0] o_gt_19;
wire [17:0] gt_hold_19;
wire [17:0] o_it_gt_mult_19;
wire [17:0] o_ft_Ct_1_mult_19;
wire [17:0] o_ct_19;
wire [17:0] ct_hold_19;
wire [17:0] o_tanh_19;
wire [17:0] o_mt_19;
wire tanh_valid_20;
wire [17:0] o_Ct_1_20;
wire [17:0] Ct_1_hold_20;
wire [17:0] o_input_gate_20;
wire [17:0] o_forget_gate_20;
wire [17:0] o_output_gate_20;
wire [17:0] ot_hold_20;
wire [17:0] o_gt_20;
wire [17:0] gt_hold_20;
wire [17:0] o_it_gt_mult_20;
wire [17:0] o_ft_Ct_1_mult_20;
wire [17:0] o_ct_20;
wire [17:0] ct_hold_20;
wire [17:0] o_tanh_20;
wire [17:0] o_mt_20;
wire tanh_valid_21;
wire [17:0] o_Ct_1_21;
wire [17:0] Ct_1_hold_21;
wire [17:0] o_input_gate_21;
wire [17:0] o_forget_gate_21;
wire [17:0] o_output_gate_21;
wire [17:0] ot_hold_21;
wire [17:0] o_gt_21;
wire [17:0] gt_hold_21;
wire [17:0] o_it_gt_mult_21;
wire [17:0] o_ft_Ct_1_mult_21;
wire [17:0] o_ct_21;
wire [17:0] ct_hold_21;
wire [17:0] o_tanh_21;
wire [17:0] o_mt_21;
wire tanh_valid_22;
wire [17:0] o_Ct_1_22;
wire [17:0] Ct_1_hold_22;
wire [17:0] o_input_gate_22;
wire [17:0] o_forget_gate_22;
wire [17:0] o_output_gate_22;
wire [17:0] ot_hold_22;
wire [17:0] o_gt_22;
wire [17:0] gt_hold_22;
wire [17:0] o_it_gt_mult_22;
wire [17:0] o_ft_Ct_1_mult_22;
wire [17:0] o_ct_22;
wire [17:0] ct_hold_22;
wire [17:0] o_tanh_22;
wire [17:0] o_mt_22;
wire tanh_valid_23;
wire [17:0] o_Ct_1_23;
wire [17:0] Ct_1_hold_23;
wire [17:0] o_input_gate_23;
wire [17:0] o_forget_gate_23;
wire [17:0] o_output_gate_23;
wire [17:0] ot_hold_23;
wire [17:0] o_gt_23;
wire [17:0] gt_hold_23;
wire [17:0] o_it_gt_mult_23;
wire [17:0] o_ft_Ct_1_mult_23;
wire [17:0] o_ct_23;
wire [17:0] ct_hold_23;
wire [17:0] o_tanh_23;
wire [17:0] o_mt_23;
wire tanh_valid_24;
wire [17:0] o_Ct_1_24;
wire [17:0] Ct_1_hold_24;
wire [17:0] o_input_gate_24;
wire [17:0] o_forget_gate_24;
wire [17:0] o_output_gate_24;
wire [17:0] ot_hold_24;
wire [17:0] o_gt_24;
wire [17:0] gt_hold_24;
wire [17:0] o_it_gt_mult_24;
wire [17:0] o_ft_Ct_1_mult_24;
wire [17:0] o_ct_24;
wire [17:0] ct_hold_24;
wire [17:0] o_tanh_24;
wire [17:0] o_mt_24;
wire tanh_valid_25;
wire [17:0] o_Ct_1_25;
wire [17:0] Ct_1_hold_25;
wire [17:0] o_input_gate_25;
wire [17:0] o_forget_gate_25;
wire [17:0] o_output_gate_25;
wire [17:0] ot_hold_25;
wire [17:0] o_gt_25;
wire [17:0] gt_hold_25;
wire [17:0] o_it_gt_mult_25;
wire [17:0] o_ft_Ct_1_mult_25;
wire [17:0] o_ct_25;
wire [17:0] ct_hold_25;
wire [17:0] o_tanh_25;
wire [17:0] o_mt_25;
wire tanh_valid_26;
wire [17:0] o_Ct_1_26;
wire [17:0] Ct_1_hold_26;
wire [17:0] o_input_gate_26;
wire [17:0] o_forget_gate_26;
wire [17:0] o_output_gate_26;
wire [17:0] ot_hold_26;
wire [17:0] o_gt_26;
wire [17:0] gt_hold_26;
wire [17:0] o_it_gt_mult_26;
wire [17:0] o_ft_Ct_1_mult_26;
wire [17:0] o_ct_26;
wire [17:0] ct_hold_26;
wire [17:0] o_tanh_26;
wire [17:0] o_mt_26;
wire tanh_valid_27;
wire [17:0] o_Ct_1_27;
wire [17:0] Ct_1_hold_27;
wire [17:0] o_input_gate_27;
wire [17:0] o_forget_gate_27;
wire [17:0] o_output_gate_27;
wire [17:0] ot_hold_27;
wire [17:0] o_gt_27;
wire [17:0] gt_hold_27;
wire [17:0] o_it_gt_mult_27;
wire [17:0] o_ft_Ct_1_mult_27;
wire [17:0] o_ct_27;
wire [17:0] ct_hold_27;
wire [17:0] o_tanh_27;
wire [17:0] o_mt_27;
wire tanh_valid_28;
wire [17:0] o_Ct_1_28;
wire [17:0] Ct_1_hold_28;
wire [17:0] o_input_gate_28;
wire [17:0] o_forget_gate_28;
wire [17:0] o_output_gate_28;
wire [17:0] ot_hold_28;
wire [17:0] o_gt_28;
wire [17:0] gt_hold_28;
wire [17:0] o_it_gt_mult_28;
wire [17:0] o_ft_Ct_1_mult_28;
wire [17:0] o_ct_28;
wire [17:0] ct_hold_28;
wire [17:0] o_tanh_28;
wire [17:0] o_mt_28;
wire tanh_valid_29;
wire [17:0] o_Ct_1_29;
wire [17:0] Ct_1_hold_29;
wire [17:0] o_input_gate_29;
wire [17:0] o_forget_gate_29;
wire [17:0] o_output_gate_29;
wire [17:0] ot_hold_29;
wire [17:0] o_gt_29;
wire [17:0] gt_hold_29;
wire [17:0] o_it_gt_mult_29;
wire [17:0] o_ft_Ct_1_mult_29;
wire [17:0] o_ct_29;
wire [17:0] ct_hold_29;
wire [17:0] o_tanh_29;
wire [17:0] o_mt_29;
wire tanh_valid_30;
wire [17:0] o_Ct_1_30;
wire [17:0] Ct_1_hold_30;
wire [17:0] o_input_gate_30;
wire [17:0] o_forget_gate_30;
wire [17:0] o_output_gate_30;
wire [17:0] ot_hold_30;
wire [17:0] o_gt_30;
wire [17:0] gt_hold_30;
wire [17:0] o_it_gt_mult_30;
wire [17:0] o_ft_Ct_1_mult_30;
wire [17:0] o_ct_30;
wire [17:0] ct_hold_30;
wire [17:0] o_tanh_30;
wire [17:0] o_mt_30;
wire tanh_valid_31;
wire [17:0] o_Ct_1_31;
wire [17:0] Ct_1_hold_31;
wire [17:0] o_input_gate_31;
wire [17:0] o_forget_gate_31;
wire [17:0] o_output_gate_31;
wire [17:0] ot_hold_31;
wire [17:0] o_gt_31;
wire [17:0] gt_hold_31;
wire [17:0] o_it_gt_mult_31;
wire [17:0] o_ft_Ct_1_mult_31;
wire [17:0] o_ct_31;
wire [17:0] ct_hold_31;
wire [17:0] o_tanh_31;
wire [17:0] o_mt_31;
wire tanh_valid_32;
wire [17:0] o_Ct_1_32;
wire [17:0] Ct_1_hold_32;
wire [17:0] o_input_gate_32;
wire [17:0] o_forget_gate_32;
wire [17:0] o_output_gate_32;
wire [17:0] ot_hold_32;
wire [17:0] o_gt_32;
wire [17:0] gt_hold_32;
wire [17:0] o_it_gt_mult_32;
wire [17:0] o_ft_Ct_1_mult_32;
wire [17:0] o_ct_32;
wire [17:0] ct_hold_32;
wire [17:0] o_tanh_32;
wire [17:0] o_mt_32;
wire tanh_valid_33;
wire [17:0] o_Ct_1_33;
wire [17:0] Ct_1_hold_33;
wire [17:0] o_input_gate_33;
wire [17:0] o_forget_gate_33;
wire [17:0] o_output_gate_33;
wire [17:0] ot_hold_33;
wire [17:0] o_gt_33;
wire [17:0] gt_hold_33;
wire [17:0] o_it_gt_mult_33;
wire [17:0] o_ft_Ct_1_mult_33;
wire [17:0] o_ct_33;
wire [17:0] ct_hold_33;
wire [17:0] o_tanh_33;
wire [17:0] o_mt_33;
wire tanh_valid_34;
wire [17:0] o_Ct_1_34;
wire [17:0] Ct_1_hold_34;
wire [17:0] o_input_gate_34;
wire [17:0] o_forget_gate_34;
wire [17:0] o_output_gate_34;
wire [17:0] ot_hold_34;
wire [17:0] o_gt_34;
wire [17:0] gt_hold_34;
wire [17:0] o_it_gt_mult_34;
wire [17:0] o_ft_Ct_1_mult_34;
wire [17:0] o_ct_34;
wire [17:0] ct_hold_34;
wire [17:0] o_tanh_34;
wire [17:0] o_mt_34;
wire tanh_valid_35;
wire [17:0] o_Ct_1_35;
wire [17:0] Ct_1_hold_35;
wire [17:0] o_input_gate_35;
wire [17:0] o_forget_gate_35;
wire [17:0] o_output_gate_35;
wire [17:0] ot_hold_35;
wire [17:0] o_gt_35;
wire [17:0] gt_hold_35;
wire [17:0] o_it_gt_mult_35;
wire [17:0] o_ft_Ct_1_mult_35;
wire [17:0] o_ct_35;
wire [17:0] ct_hold_35;
wire [17:0] o_tanh_35;
wire [17:0] o_mt_35;
wire tanh_valid_36;
wire [17:0] o_Ct_1_36;
wire [17:0] Ct_1_hold_36;
wire [17:0] o_input_gate_36;
wire [17:0] o_forget_gate_36;
wire [17:0] o_output_gate_36;
wire [17:0] ot_hold_36;
wire [17:0] o_gt_36;
wire [17:0] gt_hold_36;
wire [17:0] o_it_gt_mult_36;
wire [17:0] o_ft_Ct_1_mult_36;
wire [17:0] o_ct_36;
wire [17:0] ct_hold_36;
wire [17:0] o_tanh_36;
wire [17:0] o_mt_36;
wire tanh_valid_37;
wire [17:0] o_Ct_1_37;
wire [17:0] Ct_1_hold_37;
wire [17:0] o_input_gate_37;
wire [17:0] o_forget_gate_37;
wire [17:0] o_output_gate_37;
wire [17:0] ot_hold_37;
wire [17:0] o_gt_37;
wire [17:0] gt_hold_37;
wire [17:0] o_it_gt_mult_37;
wire [17:0] o_ft_Ct_1_mult_37;
wire [17:0] o_ct_37;
wire [17:0] ct_hold_37;
wire [17:0] o_tanh_37;
wire [17:0] o_mt_37;
wire tanh_valid_38;
wire [17:0] o_Ct_1_38;
wire [17:0] Ct_1_hold_38;
wire [17:0] o_input_gate_38;
wire [17:0] o_forget_gate_38;
wire [17:0] o_output_gate_38;
wire [17:0] ot_hold_38;
wire [17:0] o_gt_38;
wire [17:0] gt_hold_38;
wire [17:0] o_it_gt_mult_38;
wire [17:0] o_ft_Ct_1_mult_38;
wire [17:0] o_ct_38;
wire [17:0] ct_hold_38;
wire [17:0] o_tanh_38;
wire [17:0] o_mt_38;
wire tanh_valid_39;
wire [17:0] o_Ct_1_39;
wire [17:0] Ct_1_hold_39;
wire [17:0] o_input_gate_39;
wire [17:0] o_forget_gate_39;
wire [17:0] o_output_gate_39;
wire [17:0] ot_hold_39;
wire [17:0] o_gt_39;
wire [17:0] gt_hold_39;
wire [17:0] o_it_gt_mult_39;
wire [17:0] o_ft_Ct_1_mult_39;
wire [17:0] o_ct_39;
wire [17:0] ct_hold_39;
wire [17:0] o_tanh_39;
wire [17:0] o_mt_39;
wire tanh_valid_40;
wire [17:0] o_Ct_1_40;
wire [17:0] Ct_1_hold_40;
wire [17:0] o_input_gate_40;
wire [17:0] o_forget_gate_40;
wire [17:0] o_output_gate_40;
wire [17:0] ot_hold_40;
wire [17:0] o_gt_40;
wire [17:0] gt_hold_40;
wire [17:0] o_it_gt_mult_40;
wire [17:0] o_ft_Ct_1_mult_40;
wire [17:0] o_ct_40;
wire [17:0] ct_hold_40;
wire [17:0] o_tanh_40;
wire [17:0] o_mt_40;
wire tanh_valid_41;
wire [17:0] o_Ct_1_41;
wire [17:0] Ct_1_hold_41;
wire [17:0] o_input_gate_41;
wire [17:0] o_forget_gate_41;
wire [17:0] o_output_gate_41;
wire [17:0] ot_hold_41;
wire [17:0] o_gt_41;
wire [17:0] gt_hold_41;
wire [17:0] o_it_gt_mult_41;
wire [17:0] o_ft_Ct_1_mult_41;
wire [17:0] o_ct_41;
wire [17:0] ct_hold_41;
wire [17:0] o_tanh_41;
wire [17:0] o_mt_41;
wire tanh_valid_42;
wire [17:0] o_Ct_1_42;
wire [17:0] Ct_1_hold_42;
wire [17:0] o_input_gate_42;
wire [17:0] o_forget_gate_42;
wire [17:0] o_output_gate_42;
wire [17:0] ot_hold_42;
wire [17:0] o_gt_42;
wire [17:0] gt_hold_42;
wire [17:0] o_it_gt_mult_42;
wire [17:0] o_ft_Ct_1_mult_42;
wire [17:0] o_ct_42;
wire [17:0] ct_hold_42;
wire [17:0] o_tanh_42;
wire [17:0] o_mt_42;
wire tanh_valid_43;
wire [17:0] o_Ct_1_43;
wire [17:0] Ct_1_hold_43;
wire [17:0] o_input_gate_43;
wire [17:0] o_forget_gate_43;
wire [17:0] o_output_gate_43;
wire [17:0] ot_hold_43;
wire [17:0] o_gt_43;
wire [17:0] gt_hold_43;
wire [17:0] o_it_gt_mult_43;
wire [17:0] o_ft_Ct_1_mult_43;
wire [17:0] o_ct_43;
wire [17:0] ct_hold_43;
wire [17:0] o_tanh_43;
wire [17:0] o_mt_43;
wire tanh_valid_44;
wire [17:0] o_Ct_1_44;
wire [17:0] Ct_1_hold_44;
wire [17:0] o_input_gate_44;
wire [17:0] o_forget_gate_44;
wire [17:0] o_output_gate_44;
wire [17:0] ot_hold_44;
wire [17:0] o_gt_44;
wire [17:0] gt_hold_44;
wire [17:0] o_it_gt_mult_44;
wire [17:0] o_ft_Ct_1_mult_44;
wire [17:0] o_ct_44;
wire [17:0] ct_hold_44;
wire [17:0] o_tanh_44;
wire [17:0] o_mt_44;
wire tanh_valid_45;
wire [17:0] o_Ct_1_45;
wire [17:0] Ct_1_hold_45;
wire [17:0] o_input_gate_45;
wire [17:0] o_forget_gate_45;
wire [17:0] o_output_gate_45;
wire [17:0] ot_hold_45;
wire [17:0] o_gt_45;
wire [17:0] gt_hold_45;
wire [17:0] o_it_gt_mult_45;
wire [17:0] o_ft_Ct_1_mult_45;
wire [17:0] o_ct_45;
wire [17:0] ct_hold_45;
wire [17:0] o_tanh_45;
wire [17:0] o_mt_45;
wire tanh_valid_46;
wire [17:0] o_Ct_1_46;
wire [17:0] Ct_1_hold_46;
wire [17:0] o_input_gate_46;
wire [17:0] o_forget_gate_46;
wire [17:0] o_output_gate_46;
wire [17:0] ot_hold_46;
wire [17:0] o_gt_46;
wire [17:0] gt_hold_46;
wire [17:0] o_it_gt_mult_46;
wire [17:0] o_ft_Ct_1_mult_46;
wire [17:0] o_ct_46;
wire [17:0] ct_hold_46;
wire [17:0] o_tanh_46;
wire [17:0] o_mt_46;
wire tanh_valid_47;
wire [17:0] o_Ct_1_47;
wire [17:0] Ct_1_hold_47;
wire [17:0] o_input_gate_47;
wire [17:0] o_forget_gate_47;
wire [17:0] o_output_gate_47;
wire [17:0] ot_hold_47;
wire [17:0] o_gt_47;
wire [17:0] gt_hold_47;
wire [17:0] o_it_gt_mult_47;
wire [17:0] o_ft_Ct_1_mult_47;
wire [17:0] o_ct_47;
wire [17:0] ct_hold_47;
wire [17:0] o_tanh_47;
wire [17:0] o_mt_47;
wire mt_valid;

lstm_gate_18_10_48_1 lstm_gate_18_10_48_1_input (
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
	.stage1_result_16(reg_WixrXtYt_1_16),
	.weight_16(reg_Wic_16),
	.Ct_1_16(reg_Ct_1_16),
	.bias_16(reg_bi_16),
	.gate_output_16(o_input_gate_16),
	.stage1_result_17(reg_WixrXtYt_1_17),
	.weight_17(reg_Wic_17),
	.Ct_1_17(reg_Ct_1_17),
	.bias_17(reg_bi_17),
	.gate_output_17(o_input_gate_17),
	.stage1_result_18(reg_WixrXtYt_1_18),
	.weight_18(reg_Wic_18),
	.Ct_1_18(reg_Ct_1_18),
	.bias_18(reg_bi_18),
	.gate_output_18(o_input_gate_18),
	.stage1_result_19(reg_WixrXtYt_1_19),
	.weight_19(reg_Wic_19),
	.Ct_1_19(reg_Ct_1_19),
	.bias_19(reg_bi_19),
	.gate_output_19(o_input_gate_19),
	.stage1_result_20(reg_WixrXtYt_1_20),
	.weight_20(reg_Wic_20),
	.Ct_1_20(reg_Ct_1_20),
	.bias_20(reg_bi_20),
	.gate_output_20(o_input_gate_20),
	.stage1_result_21(reg_WixrXtYt_1_21),
	.weight_21(reg_Wic_21),
	.Ct_1_21(reg_Ct_1_21),
	.bias_21(reg_bi_21),
	.gate_output_21(o_input_gate_21),
	.stage1_result_22(reg_WixrXtYt_1_22),
	.weight_22(reg_Wic_22),
	.Ct_1_22(reg_Ct_1_22),
	.bias_22(reg_bi_22),
	.gate_output_22(o_input_gate_22),
	.stage1_result_23(reg_WixrXtYt_1_23),
	.weight_23(reg_Wic_23),
	.Ct_1_23(reg_Ct_1_23),
	.bias_23(reg_bi_23),
	.gate_output_23(o_input_gate_23),
	.stage1_result_24(reg_WixrXtYt_1_24),
	.weight_24(reg_Wic_24),
	.Ct_1_24(reg_Ct_1_24),
	.bias_24(reg_bi_24),
	.gate_output_24(o_input_gate_24),
	.stage1_result_25(reg_WixrXtYt_1_25),
	.weight_25(reg_Wic_25),
	.Ct_1_25(reg_Ct_1_25),
	.bias_25(reg_bi_25),
	.gate_output_25(o_input_gate_25),
	.stage1_result_26(reg_WixrXtYt_1_26),
	.weight_26(reg_Wic_26),
	.Ct_1_26(reg_Ct_1_26),
	.bias_26(reg_bi_26),
	.gate_output_26(o_input_gate_26),
	.stage1_result_27(reg_WixrXtYt_1_27),
	.weight_27(reg_Wic_27),
	.Ct_1_27(reg_Ct_1_27),
	.bias_27(reg_bi_27),
	.gate_output_27(o_input_gate_27),
	.stage1_result_28(reg_WixrXtYt_1_28),
	.weight_28(reg_Wic_28),
	.Ct_1_28(reg_Ct_1_28),
	.bias_28(reg_bi_28),
	.gate_output_28(o_input_gate_28),
	.stage1_result_29(reg_WixrXtYt_1_29),
	.weight_29(reg_Wic_29),
	.Ct_1_29(reg_Ct_1_29),
	.bias_29(reg_bi_29),
	.gate_output_29(o_input_gate_29),
	.stage1_result_30(reg_WixrXtYt_1_30),
	.weight_30(reg_Wic_30),
	.Ct_1_30(reg_Ct_1_30),
	.bias_30(reg_bi_30),
	.gate_output_30(o_input_gate_30),
	.stage1_result_31(reg_WixrXtYt_1_31),
	.weight_31(reg_Wic_31),
	.Ct_1_31(reg_Ct_1_31),
	.bias_31(reg_bi_31),
	.gate_output_31(o_input_gate_31),
	.stage1_result_32(reg_WixrXtYt_1_32),
	.weight_32(reg_Wic_32),
	.Ct_1_32(reg_Ct_1_32),
	.bias_32(reg_bi_32),
	.gate_output_32(o_input_gate_32),
	.stage1_result_33(reg_WixrXtYt_1_33),
	.weight_33(reg_Wic_33),
	.Ct_1_33(reg_Ct_1_33),
	.bias_33(reg_bi_33),
	.gate_output_33(o_input_gate_33),
	.stage1_result_34(reg_WixrXtYt_1_34),
	.weight_34(reg_Wic_34),
	.Ct_1_34(reg_Ct_1_34),
	.bias_34(reg_bi_34),
	.gate_output_34(o_input_gate_34),
	.stage1_result_35(reg_WixrXtYt_1_35),
	.weight_35(reg_Wic_35),
	.Ct_1_35(reg_Ct_1_35),
	.bias_35(reg_bi_35),
	.gate_output_35(o_input_gate_35),
	.stage1_result_36(reg_WixrXtYt_1_36),
	.weight_36(reg_Wic_36),
	.Ct_1_36(reg_Ct_1_36),
	.bias_36(reg_bi_36),
	.gate_output_36(o_input_gate_36),
	.stage1_result_37(reg_WixrXtYt_1_37),
	.weight_37(reg_Wic_37),
	.Ct_1_37(reg_Ct_1_37),
	.bias_37(reg_bi_37),
	.gate_output_37(o_input_gate_37),
	.stage1_result_38(reg_WixrXtYt_1_38),
	.weight_38(reg_Wic_38),
	.Ct_1_38(reg_Ct_1_38),
	.bias_38(reg_bi_38),
	.gate_output_38(o_input_gate_38),
	.stage1_result_39(reg_WixrXtYt_1_39),
	.weight_39(reg_Wic_39),
	.Ct_1_39(reg_Ct_1_39),
	.bias_39(reg_bi_39),
	.gate_output_39(o_input_gate_39),
	.stage1_result_40(reg_WixrXtYt_1_40),
	.weight_40(reg_Wic_40),
	.Ct_1_40(reg_Ct_1_40),
	.bias_40(reg_bi_40),
	.gate_output_40(o_input_gate_40),
	.stage1_result_41(reg_WixrXtYt_1_41),
	.weight_41(reg_Wic_41),
	.Ct_1_41(reg_Ct_1_41),
	.bias_41(reg_bi_41),
	.gate_output_41(o_input_gate_41),
	.stage1_result_42(reg_WixrXtYt_1_42),
	.weight_42(reg_Wic_42),
	.Ct_1_42(reg_Ct_1_42),
	.bias_42(reg_bi_42),
	.gate_output_42(o_input_gate_42),
	.stage1_result_43(reg_WixrXtYt_1_43),
	.weight_43(reg_Wic_43),
	.Ct_1_43(reg_Ct_1_43),
	.bias_43(reg_bi_43),
	.gate_output_43(o_input_gate_43),
	.stage1_result_44(reg_WixrXtYt_1_44),
	.weight_44(reg_Wic_44),
	.Ct_1_44(reg_Ct_1_44),
	.bias_44(reg_bi_44),
	.gate_output_44(o_input_gate_44),
	.stage1_result_45(reg_WixrXtYt_1_45),
	.weight_45(reg_Wic_45),
	.Ct_1_45(reg_Ct_1_45),
	.bias_45(reg_bi_45),
	.gate_output_45(o_input_gate_45),
	.stage1_result_46(reg_WixrXtYt_1_46),
	.weight_46(reg_Wic_46),
	.Ct_1_46(reg_Ct_1_46),
	.bias_46(reg_bi_46),
	.gate_output_46(o_input_gate_46),
	.stage1_result_47(reg_WixrXtYt_1_47),
	.weight_47(reg_Wic_47),
	.Ct_1_47(reg_Ct_1_47),
	.bias_47(reg_bi_47),
	.gate_output_47(o_input_gate_47),
	.o_valid(input_gate_valid),
	.o_ready()
);

lstm_gate_18_10_48_1 lstm_gate_18_10_48_1_forget (
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
	.stage1_result_16(reg_WfxrXtYt_1_16),
	.weight_16(reg_Wfc_16),
	.Ct_1_16(reg_Ct_1_16),
	.bias_16(reg_bf_16),
	.gate_output_16(o_forget_gate_16),
	.stage1_result_17(reg_WfxrXtYt_1_17),
	.weight_17(reg_Wfc_17),
	.Ct_1_17(reg_Ct_1_17),
	.bias_17(reg_bf_17),
	.gate_output_17(o_forget_gate_17),
	.stage1_result_18(reg_WfxrXtYt_1_18),
	.weight_18(reg_Wfc_18),
	.Ct_1_18(reg_Ct_1_18),
	.bias_18(reg_bf_18),
	.gate_output_18(o_forget_gate_18),
	.stage1_result_19(reg_WfxrXtYt_1_19),
	.weight_19(reg_Wfc_19),
	.Ct_1_19(reg_Ct_1_19),
	.bias_19(reg_bf_19),
	.gate_output_19(o_forget_gate_19),
	.stage1_result_20(reg_WfxrXtYt_1_20),
	.weight_20(reg_Wfc_20),
	.Ct_1_20(reg_Ct_1_20),
	.bias_20(reg_bf_20),
	.gate_output_20(o_forget_gate_20),
	.stage1_result_21(reg_WfxrXtYt_1_21),
	.weight_21(reg_Wfc_21),
	.Ct_1_21(reg_Ct_1_21),
	.bias_21(reg_bf_21),
	.gate_output_21(o_forget_gate_21),
	.stage1_result_22(reg_WfxrXtYt_1_22),
	.weight_22(reg_Wfc_22),
	.Ct_1_22(reg_Ct_1_22),
	.bias_22(reg_bf_22),
	.gate_output_22(o_forget_gate_22),
	.stage1_result_23(reg_WfxrXtYt_1_23),
	.weight_23(reg_Wfc_23),
	.Ct_1_23(reg_Ct_1_23),
	.bias_23(reg_bf_23),
	.gate_output_23(o_forget_gate_23),
	.stage1_result_24(reg_WfxrXtYt_1_24),
	.weight_24(reg_Wfc_24),
	.Ct_1_24(reg_Ct_1_24),
	.bias_24(reg_bf_24),
	.gate_output_24(o_forget_gate_24),
	.stage1_result_25(reg_WfxrXtYt_1_25),
	.weight_25(reg_Wfc_25),
	.Ct_1_25(reg_Ct_1_25),
	.bias_25(reg_bf_25),
	.gate_output_25(o_forget_gate_25),
	.stage1_result_26(reg_WfxrXtYt_1_26),
	.weight_26(reg_Wfc_26),
	.Ct_1_26(reg_Ct_1_26),
	.bias_26(reg_bf_26),
	.gate_output_26(o_forget_gate_26),
	.stage1_result_27(reg_WfxrXtYt_1_27),
	.weight_27(reg_Wfc_27),
	.Ct_1_27(reg_Ct_1_27),
	.bias_27(reg_bf_27),
	.gate_output_27(o_forget_gate_27),
	.stage1_result_28(reg_WfxrXtYt_1_28),
	.weight_28(reg_Wfc_28),
	.Ct_1_28(reg_Ct_1_28),
	.bias_28(reg_bf_28),
	.gate_output_28(o_forget_gate_28),
	.stage1_result_29(reg_WfxrXtYt_1_29),
	.weight_29(reg_Wfc_29),
	.Ct_1_29(reg_Ct_1_29),
	.bias_29(reg_bf_29),
	.gate_output_29(o_forget_gate_29),
	.stage1_result_30(reg_WfxrXtYt_1_30),
	.weight_30(reg_Wfc_30),
	.Ct_1_30(reg_Ct_1_30),
	.bias_30(reg_bf_30),
	.gate_output_30(o_forget_gate_30),
	.stage1_result_31(reg_WfxrXtYt_1_31),
	.weight_31(reg_Wfc_31),
	.Ct_1_31(reg_Ct_1_31),
	.bias_31(reg_bf_31),
	.gate_output_31(o_forget_gate_31),
	.stage1_result_32(reg_WfxrXtYt_1_32),
	.weight_32(reg_Wfc_32),
	.Ct_1_32(reg_Ct_1_32),
	.bias_32(reg_bf_32),
	.gate_output_32(o_forget_gate_32),
	.stage1_result_33(reg_WfxrXtYt_1_33),
	.weight_33(reg_Wfc_33),
	.Ct_1_33(reg_Ct_1_33),
	.bias_33(reg_bf_33),
	.gate_output_33(o_forget_gate_33),
	.stage1_result_34(reg_WfxrXtYt_1_34),
	.weight_34(reg_Wfc_34),
	.Ct_1_34(reg_Ct_1_34),
	.bias_34(reg_bf_34),
	.gate_output_34(o_forget_gate_34),
	.stage1_result_35(reg_WfxrXtYt_1_35),
	.weight_35(reg_Wfc_35),
	.Ct_1_35(reg_Ct_1_35),
	.bias_35(reg_bf_35),
	.gate_output_35(o_forget_gate_35),
	.stage1_result_36(reg_WfxrXtYt_1_36),
	.weight_36(reg_Wfc_36),
	.Ct_1_36(reg_Ct_1_36),
	.bias_36(reg_bf_36),
	.gate_output_36(o_forget_gate_36),
	.stage1_result_37(reg_WfxrXtYt_1_37),
	.weight_37(reg_Wfc_37),
	.Ct_1_37(reg_Ct_1_37),
	.bias_37(reg_bf_37),
	.gate_output_37(o_forget_gate_37),
	.stage1_result_38(reg_WfxrXtYt_1_38),
	.weight_38(reg_Wfc_38),
	.Ct_1_38(reg_Ct_1_38),
	.bias_38(reg_bf_38),
	.gate_output_38(o_forget_gate_38),
	.stage1_result_39(reg_WfxrXtYt_1_39),
	.weight_39(reg_Wfc_39),
	.Ct_1_39(reg_Ct_1_39),
	.bias_39(reg_bf_39),
	.gate_output_39(o_forget_gate_39),
	.stage1_result_40(reg_WfxrXtYt_1_40),
	.weight_40(reg_Wfc_40),
	.Ct_1_40(reg_Ct_1_40),
	.bias_40(reg_bf_40),
	.gate_output_40(o_forget_gate_40),
	.stage1_result_41(reg_WfxrXtYt_1_41),
	.weight_41(reg_Wfc_41),
	.Ct_1_41(reg_Ct_1_41),
	.bias_41(reg_bf_41),
	.gate_output_41(o_forget_gate_41),
	.stage1_result_42(reg_WfxrXtYt_1_42),
	.weight_42(reg_Wfc_42),
	.Ct_1_42(reg_Ct_1_42),
	.bias_42(reg_bf_42),
	.gate_output_42(o_forget_gate_42),
	.stage1_result_43(reg_WfxrXtYt_1_43),
	.weight_43(reg_Wfc_43),
	.Ct_1_43(reg_Ct_1_43),
	.bias_43(reg_bf_43),
	.gate_output_43(o_forget_gate_43),
	.stage1_result_44(reg_WfxrXtYt_1_44),
	.weight_44(reg_Wfc_44),
	.Ct_1_44(reg_Ct_1_44),
	.bias_44(reg_bf_44),
	.gate_output_44(o_forget_gate_44),
	.stage1_result_45(reg_WfxrXtYt_1_45),
	.weight_45(reg_Wfc_45),
	.Ct_1_45(reg_Ct_1_45),
	.bias_45(reg_bf_45),
	.gate_output_45(o_forget_gate_45),
	.stage1_result_46(reg_WfxrXtYt_1_46),
	.weight_46(reg_Wfc_46),
	.Ct_1_46(reg_Ct_1_46),
	.bias_46(reg_bf_46),
	.gate_output_46(o_forget_gate_46),
	.stage1_result_47(reg_WfxrXtYt_1_47),
	.weight_47(reg_Wfc_47),
	.Ct_1_47(reg_Ct_1_47),
	.bias_47(reg_bf_47),
	.gate_output_47(o_forget_gate_47),
	.o_valid(forget_gate_valid),
	.o_ready()
);

lstm_gate_18_10_48_1 lstm_gate_18_10_48_1_output (
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
	.stage1_result_16(reg_WoxrXtYt_1_16),
	.weight_16(reg_Woc_16),
	.Ct_1_16(reg_Ct_1_16),
	.bias_16(reg_bo_16),
	.gate_output_16(o_output_gate_16),
	.stage1_result_17(reg_WoxrXtYt_1_17),
	.weight_17(reg_Woc_17),
	.Ct_1_17(reg_Ct_1_17),
	.bias_17(reg_bo_17),
	.gate_output_17(o_output_gate_17),
	.stage1_result_18(reg_WoxrXtYt_1_18),
	.weight_18(reg_Woc_18),
	.Ct_1_18(reg_Ct_1_18),
	.bias_18(reg_bo_18),
	.gate_output_18(o_output_gate_18),
	.stage1_result_19(reg_WoxrXtYt_1_19),
	.weight_19(reg_Woc_19),
	.Ct_1_19(reg_Ct_1_19),
	.bias_19(reg_bo_19),
	.gate_output_19(o_output_gate_19),
	.stage1_result_20(reg_WoxrXtYt_1_20),
	.weight_20(reg_Woc_20),
	.Ct_1_20(reg_Ct_1_20),
	.bias_20(reg_bo_20),
	.gate_output_20(o_output_gate_20),
	.stage1_result_21(reg_WoxrXtYt_1_21),
	.weight_21(reg_Woc_21),
	.Ct_1_21(reg_Ct_1_21),
	.bias_21(reg_bo_21),
	.gate_output_21(o_output_gate_21),
	.stage1_result_22(reg_WoxrXtYt_1_22),
	.weight_22(reg_Woc_22),
	.Ct_1_22(reg_Ct_1_22),
	.bias_22(reg_bo_22),
	.gate_output_22(o_output_gate_22),
	.stage1_result_23(reg_WoxrXtYt_1_23),
	.weight_23(reg_Woc_23),
	.Ct_1_23(reg_Ct_1_23),
	.bias_23(reg_bo_23),
	.gate_output_23(o_output_gate_23),
	.stage1_result_24(reg_WoxrXtYt_1_24),
	.weight_24(reg_Woc_24),
	.Ct_1_24(reg_Ct_1_24),
	.bias_24(reg_bo_24),
	.gate_output_24(o_output_gate_24),
	.stage1_result_25(reg_WoxrXtYt_1_25),
	.weight_25(reg_Woc_25),
	.Ct_1_25(reg_Ct_1_25),
	.bias_25(reg_bo_25),
	.gate_output_25(o_output_gate_25),
	.stage1_result_26(reg_WoxrXtYt_1_26),
	.weight_26(reg_Woc_26),
	.Ct_1_26(reg_Ct_1_26),
	.bias_26(reg_bo_26),
	.gate_output_26(o_output_gate_26),
	.stage1_result_27(reg_WoxrXtYt_1_27),
	.weight_27(reg_Woc_27),
	.Ct_1_27(reg_Ct_1_27),
	.bias_27(reg_bo_27),
	.gate_output_27(o_output_gate_27),
	.stage1_result_28(reg_WoxrXtYt_1_28),
	.weight_28(reg_Woc_28),
	.Ct_1_28(reg_Ct_1_28),
	.bias_28(reg_bo_28),
	.gate_output_28(o_output_gate_28),
	.stage1_result_29(reg_WoxrXtYt_1_29),
	.weight_29(reg_Woc_29),
	.Ct_1_29(reg_Ct_1_29),
	.bias_29(reg_bo_29),
	.gate_output_29(o_output_gate_29),
	.stage1_result_30(reg_WoxrXtYt_1_30),
	.weight_30(reg_Woc_30),
	.Ct_1_30(reg_Ct_1_30),
	.bias_30(reg_bo_30),
	.gate_output_30(o_output_gate_30),
	.stage1_result_31(reg_WoxrXtYt_1_31),
	.weight_31(reg_Woc_31),
	.Ct_1_31(reg_Ct_1_31),
	.bias_31(reg_bo_31),
	.gate_output_31(o_output_gate_31),
	.stage1_result_32(reg_WoxrXtYt_1_32),
	.weight_32(reg_Woc_32),
	.Ct_1_32(reg_Ct_1_32),
	.bias_32(reg_bo_32),
	.gate_output_32(o_output_gate_32),
	.stage1_result_33(reg_WoxrXtYt_1_33),
	.weight_33(reg_Woc_33),
	.Ct_1_33(reg_Ct_1_33),
	.bias_33(reg_bo_33),
	.gate_output_33(o_output_gate_33),
	.stage1_result_34(reg_WoxrXtYt_1_34),
	.weight_34(reg_Woc_34),
	.Ct_1_34(reg_Ct_1_34),
	.bias_34(reg_bo_34),
	.gate_output_34(o_output_gate_34),
	.stage1_result_35(reg_WoxrXtYt_1_35),
	.weight_35(reg_Woc_35),
	.Ct_1_35(reg_Ct_1_35),
	.bias_35(reg_bo_35),
	.gate_output_35(o_output_gate_35),
	.stage1_result_36(reg_WoxrXtYt_1_36),
	.weight_36(reg_Woc_36),
	.Ct_1_36(reg_Ct_1_36),
	.bias_36(reg_bo_36),
	.gate_output_36(o_output_gate_36),
	.stage1_result_37(reg_WoxrXtYt_1_37),
	.weight_37(reg_Woc_37),
	.Ct_1_37(reg_Ct_1_37),
	.bias_37(reg_bo_37),
	.gate_output_37(o_output_gate_37),
	.stage1_result_38(reg_WoxrXtYt_1_38),
	.weight_38(reg_Woc_38),
	.Ct_1_38(reg_Ct_1_38),
	.bias_38(reg_bo_38),
	.gate_output_38(o_output_gate_38),
	.stage1_result_39(reg_WoxrXtYt_1_39),
	.weight_39(reg_Woc_39),
	.Ct_1_39(reg_Ct_1_39),
	.bias_39(reg_bo_39),
	.gate_output_39(o_output_gate_39),
	.stage1_result_40(reg_WoxrXtYt_1_40),
	.weight_40(reg_Woc_40),
	.Ct_1_40(reg_Ct_1_40),
	.bias_40(reg_bo_40),
	.gate_output_40(o_output_gate_40),
	.stage1_result_41(reg_WoxrXtYt_1_41),
	.weight_41(reg_Woc_41),
	.Ct_1_41(reg_Ct_1_41),
	.bias_41(reg_bo_41),
	.gate_output_41(o_output_gate_41),
	.stage1_result_42(reg_WoxrXtYt_1_42),
	.weight_42(reg_Woc_42),
	.Ct_1_42(reg_Ct_1_42),
	.bias_42(reg_bo_42),
	.gate_output_42(o_output_gate_42),
	.stage1_result_43(reg_WoxrXtYt_1_43),
	.weight_43(reg_Woc_43),
	.Ct_1_43(reg_Ct_1_43),
	.bias_43(reg_bo_43),
	.gate_output_43(o_output_gate_43),
	.stage1_result_44(reg_WoxrXtYt_1_44),
	.weight_44(reg_Woc_44),
	.Ct_1_44(reg_Ct_1_44),
	.bias_44(reg_bo_44),
	.gate_output_44(o_output_gate_44),
	.stage1_result_45(reg_WoxrXtYt_1_45),
	.weight_45(reg_Woc_45),
	.Ct_1_45(reg_Ct_1_45),
	.bias_45(reg_bo_45),
	.gate_output_45(o_output_gate_45),
	.stage1_result_46(reg_WoxrXtYt_1_46),
	.weight_46(reg_Woc_46),
	.Ct_1_46(reg_Ct_1_46),
	.bias_46(reg_bo_46),
	.gate_output_46(o_output_gate_46),
	.stage1_result_47(reg_WoxrXtYt_1_47),
	.weight_47(reg_Woc_47),
	.Ct_1_47(reg_Ct_1_47),
	.bias_47(reg_bo_47),
	.gate_output_47(o_output_gate_47),
	.o_valid(output_gate_valid),
	.o_ready()
);

output_activation_18_10_48_1 output_activation_18_10_48_1_inst (
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
	.stage1_result_16(reg_WcxrXtYt_1_16),
	.bias_16(reg_bc_16),
	.output_value_16(o_gt_16),
	.stage1_result_17(reg_WcxrXtYt_1_17),
	.bias_17(reg_bc_17),
	.output_value_17(o_gt_17),
	.stage1_result_18(reg_WcxrXtYt_1_18),
	.bias_18(reg_bc_18),
	.output_value_18(o_gt_18),
	.stage1_result_19(reg_WcxrXtYt_1_19),
	.bias_19(reg_bc_19),
	.output_value_19(o_gt_19),
	.stage1_result_20(reg_WcxrXtYt_1_20),
	.bias_20(reg_bc_20),
	.output_value_20(o_gt_20),
	.stage1_result_21(reg_WcxrXtYt_1_21),
	.bias_21(reg_bc_21),
	.output_value_21(o_gt_21),
	.stage1_result_22(reg_WcxrXtYt_1_22),
	.bias_22(reg_bc_22),
	.output_value_22(o_gt_22),
	.stage1_result_23(reg_WcxrXtYt_1_23),
	.bias_23(reg_bc_23),
	.output_value_23(o_gt_23),
	.stage1_result_24(reg_WcxrXtYt_1_24),
	.bias_24(reg_bc_24),
	.output_value_24(o_gt_24),
	.stage1_result_25(reg_WcxrXtYt_1_25),
	.bias_25(reg_bc_25),
	.output_value_25(o_gt_25),
	.stage1_result_26(reg_WcxrXtYt_1_26),
	.bias_26(reg_bc_26),
	.output_value_26(o_gt_26),
	.stage1_result_27(reg_WcxrXtYt_1_27),
	.bias_27(reg_bc_27),
	.output_value_27(o_gt_27),
	.stage1_result_28(reg_WcxrXtYt_1_28),
	.bias_28(reg_bc_28),
	.output_value_28(o_gt_28),
	.stage1_result_29(reg_WcxrXtYt_1_29),
	.bias_29(reg_bc_29),
	.output_value_29(o_gt_29),
	.stage1_result_30(reg_WcxrXtYt_1_30),
	.bias_30(reg_bc_30),
	.output_value_30(o_gt_30),
	.stage1_result_31(reg_WcxrXtYt_1_31),
	.bias_31(reg_bc_31),
	.output_value_31(o_gt_31),
	.stage1_result_32(reg_WcxrXtYt_1_32),
	.bias_32(reg_bc_32),
	.output_value_32(o_gt_32),
	.stage1_result_33(reg_WcxrXtYt_1_33),
	.bias_33(reg_bc_33),
	.output_value_33(o_gt_33),
	.stage1_result_34(reg_WcxrXtYt_1_34),
	.bias_34(reg_bc_34),
	.output_value_34(o_gt_34),
	.stage1_result_35(reg_WcxrXtYt_1_35),
	.bias_35(reg_bc_35),
	.output_value_35(o_gt_35),
	.stage1_result_36(reg_WcxrXtYt_1_36),
	.bias_36(reg_bc_36),
	.output_value_36(o_gt_36),
	.stage1_result_37(reg_WcxrXtYt_1_37),
	.bias_37(reg_bc_37),
	.output_value_37(o_gt_37),
	.stage1_result_38(reg_WcxrXtYt_1_38),
	.bias_38(reg_bc_38),
	.output_value_38(o_gt_38),
	.stage1_result_39(reg_WcxrXtYt_1_39),
	.bias_39(reg_bc_39),
	.output_value_39(o_gt_39),
	.stage1_result_40(reg_WcxrXtYt_1_40),
	.bias_40(reg_bc_40),
	.output_value_40(o_gt_40),
	.stage1_result_41(reg_WcxrXtYt_1_41),
	.bias_41(reg_bc_41),
	.output_value_41(o_gt_41),
	.stage1_result_42(reg_WcxrXtYt_1_42),
	.bias_42(reg_bc_42),
	.output_value_42(o_gt_42),
	.stage1_result_43(reg_WcxrXtYt_1_43),
	.bias_43(reg_bc_43),
	.output_value_43(o_gt_43),
	.stage1_result_44(reg_WcxrXtYt_1_44),
	.bias_44(reg_bc_44),
	.output_value_44(o_gt_44),
	.stage1_result_45(reg_WcxrXtYt_1_45),
	.bias_45(reg_bc_45),
	.output_value_45(o_gt_45),
	.stage1_result_46(reg_WcxrXtYt_1_46),
	.bias_46(reg_bc_46),
	.output_value_46(o_gt_46),
	.stage1_result_47(reg_WcxrXtYt_1_47),
	.bias_47(reg_bc_47),
	.output_value_47(o_gt_47),
	.o_valid(gt_valid),
	.o_ready()
);

shift_register_group_18_48_6 shift_register_group_18_48_6_eltwisemult (
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
	.in_16(o_gt_16),
	.out_16(gt_hold_16),
	.in_17(o_gt_17),
	.out_17(gt_hold_17),
	.in_18(o_gt_18),
	.out_18(gt_hold_18),
	.in_19(o_gt_19),
	.out_19(gt_hold_19),
	.in_20(o_gt_20),
	.out_20(gt_hold_20),
	.in_21(o_gt_21),
	.out_21(gt_hold_21),
	.in_22(o_gt_22),
	.out_22(gt_hold_22),
	.in_23(o_gt_23),
	.out_23(gt_hold_23),
	.in_24(o_gt_24),
	.out_24(gt_hold_24),
	.in_25(o_gt_25),
	.out_25(gt_hold_25),
	.in_26(o_gt_26),
	.out_26(gt_hold_26),
	.in_27(o_gt_27),
	.out_27(gt_hold_27),
	.in_28(o_gt_28),
	.out_28(gt_hold_28),
	.in_29(o_gt_29),
	.out_29(gt_hold_29),
	.in_30(o_gt_30),
	.out_30(gt_hold_30),
	.in_31(o_gt_31),
	.out_31(gt_hold_31),
	.in_32(o_gt_32),
	.out_32(gt_hold_32),
	.in_33(o_gt_33),
	.out_33(gt_hold_33),
	.in_34(o_gt_34),
	.out_34(gt_hold_34),
	.in_35(o_gt_35),
	.out_35(gt_hold_35),
	.in_36(o_gt_36),
	.out_36(gt_hold_36),
	.in_37(o_gt_37),
	.out_37(gt_hold_37),
	.in_38(o_gt_38),
	.out_38(gt_hold_38),
	.in_39(o_gt_39),
	.out_39(gt_hold_39),
	.in_40(o_gt_40),
	.out_40(gt_hold_40),
	.in_41(o_gt_41),
	.out_41(gt_hold_41),
	.in_42(o_gt_42),
	.out_42(gt_hold_42),
	.in_43(o_gt_43),
	.out_43(gt_hold_43),
	.in_44(o_gt_44),
	.out_44(gt_hold_44),
	.in_45(o_gt_45),
	.out_45(gt_hold_45),
	.in_46(o_gt_46),
	.out_46(gt_hold_46),
	.in_47(o_gt_47),
	.out_47(gt_hold_47),
	.reset(reset)
);

elementwise_mult_core_18_18_10_48_1 elementwise_mult_core_18_18_10_48_1_it_gt_mult (
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
	.i_A_16(o_input_gate_16),
	.i_B_16(gt_hold_16),
	.o_C_16(o_it_gt_mult_16),
	.i_A_17(o_input_gate_17),
	.i_B_17(gt_hold_17),
	.o_C_17(o_it_gt_mult_17),
	.i_A_18(o_input_gate_18),
	.i_B_18(gt_hold_18),
	.o_C_18(o_it_gt_mult_18),
	.i_A_19(o_input_gate_19),
	.i_B_19(gt_hold_19),
	.o_C_19(o_it_gt_mult_19),
	.i_A_20(o_input_gate_20),
	.i_B_20(gt_hold_20),
	.o_C_20(o_it_gt_mult_20),
	.i_A_21(o_input_gate_21),
	.i_B_21(gt_hold_21),
	.o_C_21(o_it_gt_mult_21),
	.i_A_22(o_input_gate_22),
	.i_B_22(gt_hold_22),
	.o_C_22(o_it_gt_mult_22),
	.i_A_23(o_input_gate_23),
	.i_B_23(gt_hold_23),
	.o_C_23(o_it_gt_mult_23),
	.i_A_24(o_input_gate_24),
	.i_B_24(gt_hold_24),
	.o_C_24(o_it_gt_mult_24),
	.i_A_25(o_input_gate_25),
	.i_B_25(gt_hold_25),
	.o_C_25(o_it_gt_mult_25),
	.i_A_26(o_input_gate_26),
	.i_B_26(gt_hold_26),
	.o_C_26(o_it_gt_mult_26),
	.i_A_27(o_input_gate_27),
	.i_B_27(gt_hold_27),
	.o_C_27(o_it_gt_mult_27),
	.i_A_28(o_input_gate_28),
	.i_B_28(gt_hold_28),
	.o_C_28(o_it_gt_mult_28),
	.i_A_29(o_input_gate_29),
	.i_B_29(gt_hold_29),
	.o_C_29(o_it_gt_mult_29),
	.i_A_30(o_input_gate_30),
	.i_B_30(gt_hold_30),
	.o_C_30(o_it_gt_mult_30),
	.i_A_31(o_input_gate_31),
	.i_B_31(gt_hold_31),
	.o_C_31(o_it_gt_mult_31),
	.i_A_32(o_input_gate_32),
	.i_B_32(gt_hold_32),
	.o_C_32(o_it_gt_mult_32),
	.i_A_33(o_input_gate_33),
	.i_B_33(gt_hold_33),
	.o_C_33(o_it_gt_mult_33),
	.i_A_34(o_input_gate_34),
	.i_B_34(gt_hold_34),
	.o_C_34(o_it_gt_mult_34),
	.i_A_35(o_input_gate_35),
	.i_B_35(gt_hold_35),
	.o_C_35(o_it_gt_mult_35),
	.i_A_36(o_input_gate_36),
	.i_B_36(gt_hold_36),
	.o_C_36(o_it_gt_mult_36),
	.i_A_37(o_input_gate_37),
	.i_B_37(gt_hold_37),
	.o_C_37(o_it_gt_mult_37),
	.i_A_38(o_input_gate_38),
	.i_B_38(gt_hold_38),
	.o_C_38(o_it_gt_mult_38),
	.i_A_39(o_input_gate_39),
	.i_B_39(gt_hold_39),
	.o_C_39(o_it_gt_mult_39),
	.i_A_40(o_input_gate_40),
	.i_B_40(gt_hold_40),
	.o_C_40(o_it_gt_mult_40),
	.i_A_41(o_input_gate_41),
	.i_B_41(gt_hold_41),
	.o_C_41(o_it_gt_mult_41),
	.i_A_42(o_input_gate_42),
	.i_B_42(gt_hold_42),
	.o_C_42(o_it_gt_mult_42),
	.i_A_43(o_input_gate_43),
	.i_B_43(gt_hold_43),
	.o_C_43(o_it_gt_mult_43),
	.i_A_44(o_input_gate_44),
	.i_B_44(gt_hold_44),
	.o_C_44(o_it_gt_mult_44),
	.i_A_45(o_input_gate_45),
	.i_B_45(gt_hold_45),
	.o_C_45(o_it_gt_mult_45),
	.i_A_46(o_input_gate_46),
	.i_B_46(gt_hold_46),
	.o_C_46(o_it_gt_mult_46),
	.i_A_47(o_input_gate_47),
	.i_B_47(gt_hold_47),
	.o_C_47(o_it_gt_mult_47),
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
assign o_Ct_1_16 = reg_Ct_1_16;
assign o_Ct_1_17 = reg_Ct_1_17;
assign o_Ct_1_18 = reg_Ct_1_18;
assign o_Ct_1_19 = reg_Ct_1_19;
assign o_Ct_1_20 = reg_Ct_1_20;
assign o_Ct_1_21 = reg_Ct_1_21;
assign o_Ct_1_22 = reg_Ct_1_22;
assign o_Ct_1_23 = reg_Ct_1_23;
assign o_Ct_1_24 = reg_Ct_1_24;
assign o_Ct_1_25 = reg_Ct_1_25;
assign o_Ct_1_26 = reg_Ct_1_26;
assign o_Ct_1_27 = reg_Ct_1_27;
assign o_Ct_1_28 = reg_Ct_1_28;
assign o_Ct_1_29 = reg_Ct_1_29;
assign o_Ct_1_30 = reg_Ct_1_30;
assign o_Ct_1_31 = reg_Ct_1_31;
assign o_Ct_1_32 = reg_Ct_1_32;
assign o_Ct_1_33 = reg_Ct_1_33;
assign o_Ct_1_34 = reg_Ct_1_34;
assign o_Ct_1_35 = reg_Ct_1_35;
assign o_Ct_1_36 = reg_Ct_1_36;
assign o_Ct_1_37 = reg_Ct_1_37;
assign o_Ct_1_38 = reg_Ct_1_38;
assign o_Ct_1_39 = reg_Ct_1_39;
assign o_Ct_1_40 = reg_Ct_1_40;
assign o_Ct_1_41 = reg_Ct_1_41;
assign o_Ct_1_42 = reg_Ct_1_42;
assign o_Ct_1_43 = reg_Ct_1_43;
assign o_Ct_1_44 = reg_Ct_1_44;
assign o_Ct_1_45 = reg_Ct_1_45;
assign o_Ct_1_46 = reg_Ct_1_46;
assign o_Ct_1_47 = reg_Ct_1_47;
shift_register_group_18_48_18 shift_register_group_18_48_18_lstm_gate (
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
	.in_16(o_Ct_1_16),
	.out_16(Ct_1_hold_16),
	.in_17(o_Ct_1_17),
	.out_17(Ct_1_hold_17),
	.in_18(o_Ct_1_18),
	.out_18(Ct_1_hold_18),
	.in_19(o_Ct_1_19),
	.out_19(Ct_1_hold_19),
	.in_20(o_Ct_1_20),
	.out_20(Ct_1_hold_20),
	.in_21(o_Ct_1_21),
	.out_21(Ct_1_hold_21),
	.in_22(o_Ct_1_22),
	.out_22(Ct_1_hold_22),
	.in_23(o_Ct_1_23),
	.out_23(Ct_1_hold_23),
	.in_24(o_Ct_1_24),
	.out_24(Ct_1_hold_24),
	.in_25(o_Ct_1_25),
	.out_25(Ct_1_hold_25),
	.in_26(o_Ct_1_26),
	.out_26(Ct_1_hold_26),
	.in_27(o_Ct_1_27),
	.out_27(Ct_1_hold_27),
	.in_28(o_Ct_1_28),
	.out_28(Ct_1_hold_28),
	.in_29(o_Ct_1_29),
	.out_29(Ct_1_hold_29),
	.in_30(o_Ct_1_30),
	.out_30(Ct_1_hold_30),
	.in_31(o_Ct_1_31),
	.out_31(Ct_1_hold_31),
	.in_32(o_Ct_1_32),
	.out_32(Ct_1_hold_32),
	.in_33(o_Ct_1_33),
	.out_33(Ct_1_hold_33),
	.in_34(o_Ct_1_34),
	.out_34(Ct_1_hold_34),
	.in_35(o_Ct_1_35),
	.out_35(Ct_1_hold_35),
	.in_36(o_Ct_1_36),
	.out_36(Ct_1_hold_36),
	.in_37(o_Ct_1_37),
	.out_37(Ct_1_hold_37),
	.in_38(o_Ct_1_38),
	.out_38(Ct_1_hold_38),
	.in_39(o_Ct_1_39),
	.out_39(Ct_1_hold_39),
	.in_40(o_Ct_1_40),
	.out_40(Ct_1_hold_40),
	.in_41(o_Ct_1_41),
	.out_41(Ct_1_hold_41),
	.in_42(o_Ct_1_42),
	.out_42(Ct_1_hold_42),
	.in_43(o_Ct_1_43),
	.out_43(Ct_1_hold_43),
	.in_44(o_Ct_1_44),
	.out_44(Ct_1_hold_44),
	.in_45(o_Ct_1_45),
	.out_45(Ct_1_hold_45),
	.in_46(o_Ct_1_46),
	.out_46(Ct_1_hold_46),
	.in_47(o_Ct_1_47),
	.out_47(Ct_1_hold_47),
	.reset(reset)
);

elementwise_mult_core_18_18_10_48_1 elementwise_mult_core_18_18_10_48_1_ft_Ct_1_mult (
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
	.i_A_16(Ct_1_hold_16),
	.i_B_16(o_forget_gate_16),
	.o_C_16(o_ft_Ct_1_mult_16),
	.i_A_17(Ct_1_hold_17),
	.i_B_17(o_forget_gate_17),
	.o_C_17(o_ft_Ct_1_mult_17),
	.i_A_18(Ct_1_hold_18),
	.i_B_18(o_forget_gate_18),
	.o_C_18(o_ft_Ct_1_mult_18),
	.i_A_19(Ct_1_hold_19),
	.i_B_19(o_forget_gate_19),
	.o_C_19(o_ft_Ct_1_mult_19),
	.i_A_20(Ct_1_hold_20),
	.i_B_20(o_forget_gate_20),
	.o_C_20(o_ft_Ct_1_mult_20),
	.i_A_21(Ct_1_hold_21),
	.i_B_21(o_forget_gate_21),
	.o_C_21(o_ft_Ct_1_mult_21),
	.i_A_22(Ct_1_hold_22),
	.i_B_22(o_forget_gate_22),
	.o_C_22(o_ft_Ct_1_mult_22),
	.i_A_23(Ct_1_hold_23),
	.i_B_23(o_forget_gate_23),
	.o_C_23(o_ft_Ct_1_mult_23),
	.i_A_24(Ct_1_hold_24),
	.i_B_24(o_forget_gate_24),
	.o_C_24(o_ft_Ct_1_mult_24),
	.i_A_25(Ct_1_hold_25),
	.i_B_25(o_forget_gate_25),
	.o_C_25(o_ft_Ct_1_mult_25),
	.i_A_26(Ct_1_hold_26),
	.i_B_26(o_forget_gate_26),
	.o_C_26(o_ft_Ct_1_mult_26),
	.i_A_27(Ct_1_hold_27),
	.i_B_27(o_forget_gate_27),
	.o_C_27(o_ft_Ct_1_mult_27),
	.i_A_28(Ct_1_hold_28),
	.i_B_28(o_forget_gate_28),
	.o_C_28(o_ft_Ct_1_mult_28),
	.i_A_29(Ct_1_hold_29),
	.i_B_29(o_forget_gate_29),
	.o_C_29(o_ft_Ct_1_mult_29),
	.i_A_30(Ct_1_hold_30),
	.i_B_30(o_forget_gate_30),
	.o_C_30(o_ft_Ct_1_mult_30),
	.i_A_31(Ct_1_hold_31),
	.i_B_31(o_forget_gate_31),
	.o_C_31(o_ft_Ct_1_mult_31),
	.i_A_32(Ct_1_hold_32),
	.i_B_32(o_forget_gate_32),
	.o_C_32(o_ft_Ct_1_mult_32),
	.i_A_33(Ct_1_hold_33),
	.i_B_33(o_forget_gate_33),
	.o_C_33(o_ft_Ct_1_mult_33),
	.i_A_34(Ct_1_hold_34),
	.i_B_34(o_forget_gate_34),
	.o_C_34(o_ft_Ct_1_mult_34),
	.i_A_35(Ct_1_hold_35),
	.i_B_35(o_forget_gate_35),
	.o_C_35(o_ft_Ct_1_mult_35),
	.i_A_36(Ct_1_hold_36),
	.i_B_36(o_forget_gate_36),
	.o_C_36(o_ft_Ct_1_mult_36),
	.i_A_37(Ct_1_hold_37),
	.i_B_37(o_forget_gate_37),
	.o_C_37(o_ft_Ct_1_mult_37),
	.i_A_38(Ct_1_hold_38),
	.i_B_38(o_forget_gate_38),
	.o_C_38(o_ft_Ct_1_mult_38),
	.i_A_39(Ct_1_hold_39),
	.i_B_39(o_forget_gate_39),
	.o_C_39(o_ft_Ct_1_mult_39),
	.i_A_40(Ct_1_hold_40),
	.i_B_40(o_forget_gate_40),
	.o_C_40(o_ft_Ct_1_mult_40),
	.i_A_41(Ct_1_hold_41),
	.i_B_41(o_forget_gate_41),
	.o_C_41(o_ft_Ct_1_mult_41),
	.i_A_42(Ct_1_hold_42),
	.i_B_42(o_forget_gate_42),
	.o_C_42(o_ft_Ct_1_mult_42),
	.i_A_43(Ct_1_hold_43),
	.i_B_43(o_forget_gate_43),
	.o_C_43(o_ft_Ct_1_mult_43),
	.i_A_44(Ct_1_hold_44),
	.i_B_44(o_forget_gate_44),
	.o_C_44(o_ft_Ct_1_mult_44),
	.i_A_45(Ct_1_hold_45),
	.i_B_45(o_forget_gate_45),
	.o_C_45(o_ft_Ct_1_mult_45),
	.i_A_46(Ct_1_hold_46),
	.i_B_46(o_forget_gate_46),
	.o_C_46(o_ft_Ct_1_mult_46),
	.i_A_47(Ct_1_hold_47),
	.i_B_47(o_forget_gate_47),
	.o_C_47(o_ft_Ct_1_mult_47),
	.o_valid(ft_Ct_1_mult_valid),
	.o_ready()
);

wire eltwise_add_core_valid;
assign eltwise_add_core_valid = ft_Ct_1_mult_valid & it_gt_mult_valid;

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_inst (
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
	.i_A_16(o_it_gt_mult_16),
	.i_B_16(o_ft_Ct_1_mult_16),
	.o_C_16(o_ct_16),
	.i_A_17(o_it_gt_mult_17),
	.i_B_17(o_ft_Ct_1_mult_17),
	.o_C_17(o_ct_17),
	.i_A_18(o_it_gt_mult_18),
	.i_B_18(o_ft_Ct_1_mult_18),
	.o_C_18(o_ct_18),
	.i_A_19(o_it_gt_mult_19),
	.i_B_19(o_ft_Ct_1_mult_19),
	.o_C_19(o_ct_19),
	.i_A_20(o_it_gt_mult_20),
	.i_B_20(o_ft_Ct_1_mult_20),
	.o_C_20(o_ct_20),
	.i_A_21(o_it_gt_mult_21),
	.i_B_21(o_ft_Ct_1_mult_21),
	.o_C_21(o_ct_21),
	.i_A_22(o_it_gt_mult_22),
	.i_B_22(o_ft_Ct_1_mult_22),
	.o_C_22(o_ct_22),
	.i_A_23(o_it_gt_mult_23),
	.i_B_23(o_ft_Ct_1_mult_23),
	.o_C_23(o_ct_23),
	.i_A_24(o_it_gt_mult_24),
	.i_B_24(o_ft_Ct_1_mult_24),
	.o_C_24(o_ct_24),
	.i_A_25(o_it_gt_mult_25),
	.i_B_25(o_ft_Ct_1_mult_25),
	.o_C_25(o_ct_25),
	.i_A_26(o_it_gt_mult_26),
	.i_B_26(o_ft_Ct_1_mult_26),
	.o_C_26(o_ct_26),
	.i_A_27(o_it_gt_mult_27),
	.i_B_27(o_ft_Ct_1_mult_27),
	.o_C_27(o_ct_27),
	.i_A_28(o_it_gt_mult_28),
	.i_B_28(o_ft_Ct_1_mult_28),
	.o_C_28(o_ct_28),
	.i_A_29(o_it_gt_mult_29),
	.i_B_29(o_ft_Ct_1_mult_29),
	.o_C_29(o_ct_29),
	.i_A_30(o_it_gt_mult_30),
	.i_B_30(o_ft_Ct_1_mult_30),
	.o_C_30(o_ct_30),
	.i_A_31(o_it_gt_mult_31),
	.i_B_31(o_ft_Ct_1_mult_31),
	.o_C_31(o_ct_31),
	.i_A_32(o_it_gt_mult_32),
	.i_B_32(o_ft_Ct_1_mult_32),
	.o_C_32(o_ct_32),
	.i_A_33(o_it_gt_mult_33),
	.i_B_33(o_ft_Ct_1_mult_33),
	.o_C_33(o_ct_33),
	.i_A_34(o_it_gt_mult_34),
	.i_B_34(o_ft_Ct_1_mult_34),
	.o_C_34(o_ct_34),
	.i_A_35(o_it_gt_mult_35),
	.i_B_35(o_ft_Ct_1_mult_35),
	.o_C_35(o_ct_35),
	.i_A_36(o_it_gt_mult_36),
	.i_B_36(o_ft_Ct_1_mult_36),
	.o_C_36(o_ct_36),
	.i_A_37(o_it_gt_mult_37),
	.i_B_37(o_ft_Ct_1_mult_37),
	.o_C_37(o_ct_37),
	.i_A_38(o_it_gt_mult_38),
	.i_B_38(o_ft_Ct_1_mult_38),
	.o_C_38(o_ct_38),
	.i_A_39(o_it_gt_mult_39),
	.i_B_39(o_ft_Ct_1_mult_39),
	.o_C_39(o_ct_39),
	.i_A_40(o_it_gt_mult_40),
	.i_B_40(o_ft_Ct_1_mult_40),
	.o_C_40(o_ct_40),
	.i_A_41(o_it_gt_mult_41),
	.i_B_41(o_ft_Ct_1_mult_41),
	.o_C_41(o_ct_41),
	.i_A_42(o_it_gt_mult_42),
	.i_B_42(o_ft_Ct_1_mult_42),
	.o_C_42(o_ct_42),
	.i_A_43(o_it_gt_mult_43),
	.i_B_43(o_ft_Ct_1_mult_43),
	.o_C_43(o_ct_43),
	.i_A_44(o_it_gt_mult_44),
	.i_B_44(o_ft_Ct_1_mult_44),
	.o_C_44(o_ct_44),
	.i_A_45(o_it_gt_mult_45),
	.i_B_45(o_ft_Ct_1_mult_45),
	.o_C_45(o_ct_45),
	.i_A_46(o_it_gt_mult_46),
	.i_B_46(o_ft_Ct_1_mult_46),
	.o_C_46(o_ct_46),
	.i_A_47(o_it_gt_mult_47),
	.i_B_47(o_ft_Ct_1_mult_47),
	.o_C_47(o_ct_47),
	.o_valid(ct_valid),
	.o_ready()
);

shift_register_group_18_48_14 shift_register_group_18_48_14_Ct (
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
	.in_16(o_ct_16),
	.out_16(ct_hold_16),
	.in_17(o_ct_17),
	.out_17(ct_hold_17),
	.in_18(o_ct_18),
	.out_18(ct_hold_18),
	.in_19(o_ct_19),
	.out_19(ct_hold_19),
	.in_20(o_ct_20),
	.out_20(ct_hold_20),
	.in_21(o_ct_21),
	.out_21(ct_hold_21),
	.in_22(o_ct_22),
	.out_22(ct_hold_22),
	.in_23(o_ct_23),
	.out_23(ct_hold_23),
	.in_24(o_ct_24),
	.out_24(ct_hold_24),
	.in_25(o_ct_25),
	.out_25(ct_hold_25),
	.in_26(o_ct_26),
	.out_26(ct_hold_26),
	.in_27(o_ct_27),
	.out_27(ct_hold_27),
	.in_28(o_ct_28),
	.out_28(ct_hold_28),
	.in_29(o_ct_29),
	.out_29(ct_hold_29),
	.in_30(o_ct_30),
	.out_30(ct_hold_30),
	.in_31(o_ct_31),
	.out_31(ct_hold_31),
	.in_32(o_ct_32),
	.out_32(ct_hold_32),
	.in_33(o_ct_33),
	.out_33(ct_hold_33),
	.in_34(o_ct_34),
	.out_34(ct_hold_34),
	.in_35(o_ct_35),
	.out_35(ct_hold_35),
	.in_36(o_ct_36),
	.out_36(ct_hold_36),
	.in_37(o_ct_37),
	.out_37(ct_hold_37),
	.in_38(o_ct_38),
	.out_38(ct_hold_38),
	.in_39(o_ct_39),
	.out_39(ct_hold_39),
	.in_40(o_ct_40),
	.out_40(ct_hold_40),
	.in_41(o_ct_41),
	.out_41(ct_hold_41),
	.in_42(o_ct_42),
	.out_42(ct_hold_42),
	.in_43(o_ct_43),
	.out_43(ct_hold_43),
	.in_44(o_ct_44),
	.out_44(ct_hold_44),
	.in_45(o_ct_45),
	.out_45(ct_hold_45),
	.in_46(o_ct_46),
	.out_46(ct_hold_46),
	.in_47(o_ct_47),
	.out_47(ct_hold_47),
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

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_16 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_16),
	.i_x(o_ct_16),
	.o_y(o_tanh_16)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_17 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_17),
	.i_x(o_ct_17),
	.o_y(o_tanh_17)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_18 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_18),
	.i_x(o_ct_18),
	.o_y(o_tanh_18)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_19 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_19),
	.i_x(o_ct_19),
	.o_y(o_tanh_19)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_20 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_20),
	.i_x(o_ct_20),
	.o_y(o_tanh_20)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_21 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_21),
	.i_x(o_ct_21),
	.o_y(o_tanh_21)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_22 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_22),
	.i_x(o_ct_22),
	.o_y(o_tanh_22)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_23 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_23),
	.i_x(o_ct_23),
	.o_y(o_tanh_23)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_24 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_24),
	.i_x(o_ct_24),
	.o_y(o_tanh_24)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_25 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_25),
	.i_x(o_ct_25),
	.o_y(o_tanh_25)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_26 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_26),
	.i_x(o_ct_26),
	.o_y(o_tanh_26)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_27 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_27),
	.i_x(o_ct_27),
	.o_y(o_tanh_27)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_28 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_28),
	.i_x(o_ct_28),
	.o_y(o_tanh_28)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_29 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_29),
	.i_x(o_ct_29),
	.o_y(o_tanh_29)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_30 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_30),
	.i_x(o_ct_30),
	.o_y(o_tanh_30)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_31 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_31),
	.i_x(o_ct_31),
	.o_y(o_tanh_31)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_32 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_32),
	.i_x(o_ct_32),
	.o_y(o_tanh_32)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_33 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_33),
	.i_x(o_ct_33),
	.o_y(o_tanh_33)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_34 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_34),
	.i_x(o_ct_34),
	.o_y(o_tanh_34)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_35 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_35),
	.i_x(o_ct_35),
	.o_y(o_tanh_35)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_36 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_36),
	.i_x(o_ct_36),
	.o_y(o_tanh_36)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_37 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_37),
	.i_x(o_ct_37),
	.o_y(o_tanh_37)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_38 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_38),
	.i_x(o_ct_38),
	.o_y(o_tanh_38)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_39 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_39),
	.i_x(o_ct_39),
	.o_y(o_tanh_39)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_40 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_40),
	.i_x(o_ct_40),
	.o_y(o_tanh_40)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_41 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_41),
	.i_x(o_ct_41),
	.o_y(o_tanh_41)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_42 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_42),
	.i_x(o_ct_42),
	.o_y(o_tanh_42)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_43 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_43),
	.i_x(o_ct_43),
	.o_y(o_tanh_43)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_44 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_44),
	.i_x(o_ct_44),
	.o_y(o_tanh_44)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_45 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_45),
	.i_x(o_ct_45),
	.o_y(o_tanh_45)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_46 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_46),
	.i_x(o_ct_46),
	.o_y(o_tanh_46)
);

tanh_core_18_18_10_32_1 tanh_core_18_18_10_32_1_inst_47 (
	.clk(clk),
	.reset(reset),
	.i_valid(ct_valid),
	.i_ready(enable),
	.o_ready(),
	.o_valid(tanh_valid_47),
	.i_x(o_ct_47),
	.o_y(o_tanh_47)
);

shift_register_group_18_48_18 shift_register_group_18_48_18_Ct (
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
	.in_16(o_output_gate_16),
	.out_16(ot_hold_16),
	.in_17(o_output_gate_17),
	.out_17(ot_hold_17),
	.in_18(o_output_gate_18),
	.out_18(ot_hold_18),
	.in_19(o_output_gate_19),
	.out_19(ot_hold_19),
	.in_20(o_output_gate_20),
	.out_20(ot_hold_20),
	.in_21(o_output_gate_21),
	.out_21(ot_hold_21),
	.in_22(o_output_gate_22),
	.out_22(ot_hold_22),
	.in_23(o_output_gate_23),
	.out_23(ot_hold_23),
	.in_24(o_output_gate_24),
	.out_24(ot_hold_24),
	.in_25(o_output_gate_25),
	.out_25(ot_hold_25),
	.in_26(o_output_gate_26),
	.out_26(ot_hold_26),
	.in_27(o_output_gate_27),
	.out_27(ot_hold_27),
	.in_28(o_output_gate_28),
	.out_28(ot_hold_28),
	.in_29(o_output_gate_29),
	.out_29(ot_hold_29),
	.in_30(o_output_gate_30),
	.out_30(ot_hold_30),
	.in_31(o_output_gate_31),
	.out_31(ot_hold_31),
	.in_32(o_output_gate_32),
	.out_32(ot_hold_32),
	.in_33(o_output_gate_33),
	.out_33(ot_hold_33),
	.in_34(o_output_gate_34),
	.out_34(ot_hold_34),
	.in_35(o_output_gate_35),
	.out_35(ot_hold_35),
	.in_36(o_output_gate_36),
	.out_36(ot_hold_36),
	.in_37(o_output_gate_37),
	.out_37(ot_hold_37),
	.in_38(o_output_gate_38),
	.out_38(ot_hold_38),
	.in_39(o_output_gate_39),
	.out_39(ot_hold_39),
	.in_40(o_output_gate_40),
	.out_40(ot_hold_40),
	.in_41(o_output_gate_41),
	.out_41(ot_hold_41),
	.in_42(o_output_gate_42),
	.out_42(ot_hold_42),
	.in_43(o_output_gate_43),
	.out_43(ot_hold_43),
	.in_44(o_output_gate_44),
	.out_44(ot_hold_44),
	.in_45(o_output_gate_45),
	.out_45(ot_hold_45),
	.in_46(o_output_gate_46),
	.out_46(ot_hold_46),
	.in_47(o_output_gate_47),
	.out_47(ot_hold_47),
	.reset(reset)
);

elementwise_mult_core_18_18_10_48_1 elementwise_mult_core_18_18_10_48_1_ot_tanh_mult (
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
	.i_A_16(o_tanh_16),
	.i_B_16(ot_hold_16),
	.o_C_16(o_mt_16),
	.i_A_17(o_tanh_17),
	.i_B_17(ot_hold_17),
	.o_C_17(o_mt_17),
	.i_A_18(o_tanh_18),
	.i_B_18(ot_hold_18),
	.o_C_18(o_mt_18),
	.i_A_19(o_tanh_19),
	.i_B_19(ot_hold_19),
	.o_C_19(o_mt_19),
	.i_A_20(o_tanh_20),
	.i_B_20(ot_hold_20),
	.o_C_20(o_mt_20),
	.i_A_21(o_tanh_21),
	.i_B_21(ot_hold_21),
	.o_C_21(o_mt_21),
	.i_A_22(o_tanh_22),
	.i_B_22(ot_hold_22),
	.o_C_22(o_mt_22),
	.i_A_23(o_tanh_23),
	.i_B_23(ot_hold_23),
	.o_C_23(o_mt_23),
	.i_A_24(o_tanh_24),
	.i_B_24(ot_hold_24),
	.o_C_24(o_mt_24),
	.i_A_25(o_tanh_25),
	.i_B_25(ot_hold_25),
	.o_C_25(o_mt_25),
	.i_A_26(o_tanh_26),
	.i_B_26(ot_hold_26),
	.o_C_26(o_mt_26),
	.i_A_27(o_tanh_27),
	.i_B_27(ot_hold_27),
	.o_C_27(o_mt_27),
	.i_A_28(o_tanh_28),
	.i_B_28(ot_hold_28),
	.o_C_28(o_mt_28),
	.i_A_29(o_tanh_29),
	.i_B_29(ot_hold_29),
	.o_C_29(o_mt_29),
	.i_A_30(o_tanh_30),
	.i_B_30(ot_hold_30),
	.o_C_30(o_mt_30),
	.i_A_31(o_tanh_31),
	.i_B_31(ot_hold_31),
	.o_C_31(o_mt_31),
	.i_A_32(o_tanh_32),
	.i_B_32(ot_hold_32),
	.o_C_32(o_mt_32),
	.i_A_33(o_tanh_33),
	.i_B_33(ot_hold_33),
	.o_C_33(o_mt_33),
	.i_A_34(o_tanh_34),
	.i_B_34(ot_hold_34),
	.o_C_34(o_mt_34),
	.i_A_35(o_tanh_35),
	.i_B_35(ot_hold_35),
	.o_C_35(o_mt_35),
	.i_A_36(o_tanh_36),
	.i_B_36(ot_hold_36),
	.o_C_36(o_mt_36),
	.i_A_37(o_tanh_37),
	.i_B_37(ot_hold_37),
	.o_C_37(o_mt_37),
	.i_A_38(o_tanh_38),
	.i_B_38(ot_hold_38),
	.o_C_38(o_mt_38),
	.i_A_39(o_tanh_39),
	.i_B_39(ot_hold_39),
	.o_C_39(o_mt_39),
	.i_A_40(o_tanh_40),
	.i_B_40(ot_hold_40),
	.o_C_40(o_mt_40),
	.i_A_41(o_tanh_41),
	.i_B_41(ot_hold_41),
	.o_C_41(o_mt_41),
	.i_A_42(o_tanh_42),
	.i_B_42(ot_hold_42),
	.o_C_42(o_mt_42),
	.i_A_43(o_tanh_43),
	.i_B_43(ot_hold_43),
	.o_C_43(o_mt_43),
	.i_A_44(o_tanh_44),
	.i_B_44(ot_hold_44),
	.o_C_44(o_mt_44),
	.i_A_45(o_tanh_45),
	.i_B_45(ot_hold_45),
	.o_C_45(o_mt_45),
	.i_A_46(o_tanh_46),
	.i_B_46(ot_hold_46),
	.o_C_46(o_mt_46),
	.i_A_47(o_tanh_47),
	.i_B_47(ot_hold_47),
	.o_C_47(o_mt_47),
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
		reg_Ct_1_16 <= 0;
		reg_WixrXtYt_1_16 <= 0;
		reg_Wic_16 <= 0;
		reg_bi_16 <= 0;
		reg_WfxrXtYt_1_16 <= 0;
		reg_Wfc_16 <= 0;
		reg_bf_16 <= 0;
		reg_WoxrXtYt_1_16 <= 0;
		reg_Woc_16 <= 0;
		reg_bo_16 <= 0;
		reg_WcxrXtYt_1_16 <= 0;
		reg_bc_16 <= 0;
		reg_out_mt_16 <= 0;
		reg_out_ct_16 <= 0;
		reg_Ct_1_17 <= 0;
		reg_WixrXtYt_1_17 <= 0;
		reg_Wic_17 <= 0;
		reg_bi_17 <= 0;
		reg_WfxrXtYt_1_17 <= 0;
		reg_Wfc_17 <= 0;
		reg_bf_17 <= 0;
		reg_WoxrXtYt_1_17 <= 0;
		reg_Woc_17 <= 0;
		reg_bo_17 <= 0;
		reg_WcxrXtYt_1_17 <= 0;
		reg_bc_17 <= 0;
		reg_out_mt_17 <= 0;
		reg_out_ct_17 <= 0;
		reg_Ct_1_18 <= 0;
		reg_WixrXtYt_1_18 <= 0;
		reg_Wic_18 <= 0;
		reg_bi_18 <= 0;
		reg_WfxrXtYt_1_18 <= 0;
		reg_Wfc_18 <= 0;
		reg_bf_18 <= 0;
		reg_WoxrXtYt_1_18 <= 0;
		reg_Woc_18 <= 0;
		reg_bo_18 <= 0;
		reg_WcxrXtYt_1_18 <= 0;
		reg_bc_18 <= 0;
		reg_out_mt_18 <= 0;
		reg_out_ct_18 <= 0;
		reg_Ct_1_19 <= 0;
		reg_WixrXtYt_1_19 <= 0;
		reg_Wic_19 <= 0;
		reg_bi_19 <= 0;
		reg_WfxrXtYt_1_19 <= 0;
		reg_Wfc_19 <= 0;
		reg_bf_19 <= 0;
		reg_WoxrXtYt_1_19 <= 0;
		reg_Woc_19 <= 0;
		reg_bo_19 <= 0;
		reg_WcxrXtYt_1_19 <= 0;
		reg_bc_19 <= 0;
		reg_out_mt_19 <= 0;
		reg_out_ct_19 <= 0;
		reg_Ct_1_20 <= 0;
		reg_WixrXtYt_1_20 <= 0;
		reg_Wic_20 <= 0;
		reg_bi_20 <= 0;
		reg_WfxrXtYt_1_20 <= 0;
		reg_Wfc_20 <= 0;
		reg_bf_20 <= 0;
		reg_WoxrXtYt_1_20 <= 0;
		reg_Woc_20 <= 0;
		reg_bo_20 <= 0;
		reg_WcxrXtYt_1_20 <= 0;
		reg_bc_20 <= 0;
		reg_out_mt_20 <= 0;
		reg_out_ct_20 <= 0;
		reg_Ct_1_21 <= 0;
		reg_WixrXtYt_1_21 <= 0;
		reg_Wic_21 <= 0;
		reg_bi_21 <= 0;
		reg_WfxrXtYt_1_21 <= 0;
		reg_Wfc_21 <= 0;
		reg_bf_21 <= 0;
		reg_WoxrXtYt_1_21 <= 0;
		reg_Woc_21 <= 0;
		reg_bo_21 <= 0;
		reg_WcxrXtYt_1_21 <= 0;
		reg_bc_21 <= 0;
		reg_out_mt_21 <= 0;
		reg_out_ct_21 <= 0;
		reg_Ct_1_22 <= 0;
		reg_WixrXtYt_1_22 <= 0;
		reg_Wic_22 <= 0;
		reg_bi_22 <= 0;
		reg_WfxrXtYt_1_22 <= 0;
		reg_Wfc_22 <= 0;
		reg_bf_22 <= 0;
		reg_WoxrXtYt_1_22 <= 0;
		reg_Woc_22 <= 0;
		reg_bo_22 <= 0;
		reg_WcxrXtYt_1_22 <= 0;
		reg_bc_22 <= 0;
		reg_out_mt_22 <= 0;
		reg_out_ct_22 <= 0;
		reg_Ct_1_23 <= 0;
		reg_WixrXtYt_1_23 <= 0;
		reg_Wic_23 <= 0;
		reg_bi_23 <= 0;
		reg_WfxrXtYt_1_23 <= 0;
		reg_Wfc_23 <= 0;
		reg_bf_23 <= 0;
		reg_WoxrXtYt_1_23 <= 0;
		reg_Woc_23 <= 0;
		reg_bo_23 <= 0;
		reg_WcxrXtYt_1_23 <= 0;
		reg_bc_23 <= 0;
		reg_out_mt_23 <= 0;
		reg_out_ct_23 <= 0;
		reg_Ct_1_24 <= 0;
		reg_WixrXtYt_1_24 <= 0;
		reg_Wic_24 <= 0;
		reg_bi_24 <= 0;
		reg_WfxrXtYt_1_24 <= 0;
		reg_Wfc_24 <= 0;
		reg_bf_24 <= 0;
		reg_WoxrXtYt_1_24 <= 0;
		reg_Woc_24 <= 0;
		reg_bo_24 <= 0;
		reg_WcxrXtYt_1_24 <= 0;
		reg_bc_24 <= 0;
		reg_out_mt_24 <= 0;
		reg_out_ct_24 <= 0;
		reg_Ct_1_25 <= 0;
		reg_WixrXtYt_1_25 <= 0;
		reg_Wic_25 <= 0;
		reg_bi_25 <= 0;
		reg_WfxrXtYt_1_25 <= 0;
		reg_Wfc_25 <= 0;
		reg_bf_25 <= 0;
		reg_WoxrXtYt_1_25 <= 0;
		reg_Woc_25 <= 0;
		reg_bo_25 <= 0;
		reg_WcxrXtYt_1_25 <= 0;
		reg_bc_25 <= 0;
		reg_out_mt_25 <= 0;
		reg_out_ct_25 <= 0;
		reg_Ct_1_26 <= 0;
		reg_WixrXtYt_1_26 <= 0;
		reg_Wic_26 <= 0;
		reg_bi_26 <= 0;
		reg_WfxrXtYt_1_26 <= 0;
		reg_Wfc_26 <= 0;
		reg_bf_26 <= 0;
		reg_WoxrXtYt_1_26 <= 0;
		reg_Woc_26 <= 0;
		reg_bo_26 <= 0;
		reg_WcxrXtYt_1_26 <= 0;
		reg_bc_26 <= 0;
		reg_out_mt_26 <= 0;
		reg_out_ct_26 <= 0;
		reg_Ct_1_27 <= 0;
		reg_WixrXtYt_1_27 <= 0;
		reg_Wic_27 <= 0;
		reg_bi_27 <= 0;
		reg_WfxrXtYt_1_27 <= 0;
		reg_Wfc_27 <= 0;
		reg_bf_27 <= 0;
		reg_WoxrXtYt_1_27 <= 0;
		reg_Woc_27 <= 0;
		reg_bo_27 <= 0;
		reg_WcxrXtYt_1_27 <= 0;
		reg_bc_27 <= 0;
		reg_out_mt_27 <= 0;
		reg_out_ct_27 <= 0;
		reg_Ct_1_28 <= 0;
		reg_WixrXtYt_1_28 <= 0;
		reg_Wic_28 <= 0;
		reg_bi_28 <= 0;
		reg_WfxrXtYt_1_28 <= 0;
		reg_Wfc_28 <= 0;
		reg_bf_28 <= 0;
		reg_WoxrXtYt_1_28 <= 0;
		reg_Woc_28 <= 0;
		reg_bo_28 <= 0;
		reg_WcxrXtYt_1_28 <= 0;
		reg_bc_28 <= 0;
		reg_out_mt_28 <= 0;
		reg_out_ct_28 <= 0;
		reg_Ct_1_29 <= 0;
		reg_WixrXtYt_1_29 <= 0;
		reg_Wic_29 <= 0;
		reg_bi_29 <= 0;
		reg_WfxrXtYt_1_29 <= 0;
		reg_Wfc_29 <= 0;
		reg_bf_29 <= 0;
		reg_WoxrXtYt_1_29 <= 0;
		reg_Woc_29 <= 0;
		reg_bo_29 <= 0;
		reg_WcxrXtYt_1_29 <= 0;
		reg_bc_29 <= 0;
		reg_out_mt_29 <= 0;
		reg_out_ct_29 <= 0;
		reg_Ct_1_30 <= 0;
		reg_WixrXtYt_1_30 <= 0;
		reg_Wic_30 <= 0;
		reg_bi_30 <= 0;
		reg_WfxrXtYt_1_30 <= 0;
		reg_Wfc_30 <= 0;
		reg_bf_30 <= 0;
		reg_WoxrXtYt_1_30 <= 0;
		reg_Woc_30 <= 0;
		reg_bo_30 <= 0;
		reg_WcxrXtYt_1_30 <= 0;
		reg_bc_30 <= 0;
		reg_out_mt_30 <= 0;
		reg_out_ct_30 <= 0;
		reg_Ct_1_31 <= 0;
		reg_WixrXtYt_1_31 <= 0;
		reg_Wic_31 <= 0;
		reg_bi_31 <= 0;
		reg_WfxrXtYt_1_31 <= 0;
		reg_Wfc_31 <= 0;
		reg_bf_31 <= 0;
		reg_WoxrXtYt_1_31 <= 0;
		reg_Woc_31 <= 0;
		reg_bo_31 <= 0;
		reg_WcxrXtYt_1_31 <= 0;
		reg_bc_31 <= 0;
		reg_out_mt_31 <= 0;
		reg_out_ct_31 <= 0;
		reg_Ct_1_32 <= 0;
		reg_WixrXtYt_1_32 <= 0;
		reg_Wic_32 <= 0;
		reg_bi_32 <= 0;
		reg_WfxrXtYt_1_32 <= 0;
		reg_Wfc_32 <= 0;
		reg_bf_32 <= 0;
		reg_WoxrXtYt_1_32 <= 0;
		reg_Woc_32 <= 0;
		reg_bo_32 <= 0;
		reg_WcxrXtYt_1_32 <= 0;
		reg_bc_32 <= 0;
		reg_out_mt_32 <= 0;
		reg_out_ct_32 <= 0;
		reg_Ct_1_33 <= 0;
		reg_WixrXtYt_1_33 <= 0;
		reg_Wic_33 <= 0;
		reg_bi_33 <= 0;
		reg_WfxrXtYt_1_33 <= 0;
		reg_Wfc_33 <= 0;
		reg_bf_33 <= 0;
		reg_WoxrXtYt_1_33 <= 0;
		reg_Woc_33 <= 0;
		reg_bo_33 <= 0;
		reg_WcxrXtYt_1_33 <= 0;
		reg_bc_33 <= 0;
		reg_out_mt_33 <= 0;
		reg_out_ct_33 <= 0;
		reg_Ct_1_34 <= 0;
		reg_WixrXtYt_1_34 <= 0;
		reg_Wic_34 <= 0;
		reg_bi_34 <= 0;
		reg_WfxrXtYt_1_34 <= 0;
		reg_Wfc_34 <= 0;
		reg_bf_34 <= 0;
		reg_WoxrXtYt_1_34 <= 0;
		reg_Woc_34 <= 0;
		reg_bo_34 <= 0;
		reg_WcxrXtYt_1_34 <= 0;
		reg_bc_34 <= 0;
		reg_out_mt_34 <= 0;
		reg_out_ct_34 <= 0;
		reg_Ct_1_35 <= 0;
		reg_WixrXtYt_1_35 <= 0;
		reg_Wic_35 <= 0;
		reg_bi_35 <= 0;
		reg_WfxrXtYt_1_35 <= 0;
		reg_Wfc_35 <= 0;
		reg_bf_35 <= 0;
		reg_WoxrXtYt_1_35 <= 0;
		reg_Woc_35 <= 0;
		reg_bo_35 <= 0;
		reg_WcxrXtYt_1_35 <= 0;
		reg_bc_35 <= 0;
		reg_out_mt_35 <= 0;
		reg_out_ct_35 <= 0;
		reg_Ct_1_36 <= 0;
		reg_WixrXtYt_1_36 <= 0;
		reg_Wic_36 <= 0;
		reg_bi_36 <= 0;
		reg_WfxrXtYt_1_36 <= 0;
		reg_Wfc_36 <= 0;
		reg_bf_36 <= 0;
		reg_WoxrXtYt_1_36 <= 0;
		reg_Woc_36 <= 0;
		reg_bo_36 <= 0;
		reg_WcxrXtYt_1_36 <= 0;
		reg_bc_36 <= 0;
		reg_out_mt_36 <= 0;
		reg_out_ct_36 <= 0;
		reg_Ct_1_37 <= 0;
		reg_WixrXtYt_1_37 <= 0;
		reg_Wic_37 <= 0;
		reg_bi_37 <= 0;
		reg_WfxrXtYt_1_37 <= 0;
		reg_Wfc_37 <= 0;
		reg_bf_37 <= 0;
		reg_WoxrXtYt_1_37 <= 0;
		reg_Woc_37 <= 0;
		reg_bo_37 <= 0;
		reg_WcxrXtYt_1_37 <= 0;
		reg_bc_37 <= 0;
		reg_out_mt_37 <= 0;
		reg_out_ct_37 <= 0;
		reg_Ct_1_38 <= 0;
		reg_WixrXtYt_1_38 <= 0;
		reg_Wic_38 <= 0;
		reg_bi_38 <= 0;
		reg_WfxrXtYt_1_38 <= 0;
		reg_Wfc_38 <= 0;
		reg_bf_38 <= 0;
		reg_WoxrXtYt_1_38 <= 0;
		reg_Woc_38 <= 0;
		reg_bo_38 <= 0;
		reg_WcxrXtYt_1_38 <= 0;
		reg_bc_38 <= 0;
		reg_out_mt_38 <= 0;
		reg_out_ct_38 <= 0;
		reg_Ct_1_39 <= 0;
		reg_WixrXtYt_1_39 <= 0;
		reg_Wic_39 <= 0;
		reg_bi_39 <= 0;
		reg_WfxrXtYt_1_39 <= 0;
		reg_Wfc_39 <= 0;
		reg_bf_39 <= 0;
		reg_WoxrXtYt_1_39 <= 0;
		reg_Woc_39 <= 0;
		reg_bo_39 <= 0;
		reg_WcxrXtYt_1_39 <= 0;
		reg_bc_39 <= 0;
		reg_out_mt_39 <= 0;
		reg_out_ct_39 <= 0;
		reg_Ct_1_40 <= 0;
		reg_WixrXtYt_1_40 <= 0;
		reg_Wic_40 <= 0;
		reg_bi_40 <= 0;
		reg_WfxrXtYt_1_40 <= 0;
		reg_Wfc_40 <= 0;
		reg_bf_40 <= 0;
		reg_WoxrXtYt_1_40 <= 0;
		reg_Woc_40 <= 0;
		reg_bo_40 <= 0;
		reg_WcxrXtYt_1_40 <= 0;
		reg_bc_40 <= 0;
		reg_out_mt_40 <= 0;
		reg_out_ct_40 <= 0;
		reg_Ct_1_41 <= 0;
		reg_WixrXtYt_1_41 <= 0;
		reg_Wic_41 <= 0;
		reg_bi_41 <= 0;
		reg_WfxrXtYt_1_41 <= 0;
		reg_Wfc_41 <= 0;
		reg_bf_41 <= 0;
		reg_WoxrXtYt_1_41 <= 0;
		reg_Woc_41 <= 0;
		reg_bo_41 <= 0;
		reg_WcxrXtYt_1_41 <= 0;
		reg_bc_41 <= 0;
		reg_out_mt_41 <= 0;
		reg_out_ct_41 <= 0;
		reg_Ct_1_42 <= 0;
		reg_WixrXtYt_1_42 <= 0;
		reg_Wic_42 <= 0;
		reg_bi_42 <= 0;
		reg_WfxrXtYt_1_42 <= 0;
		reg_Wfc_42 <= 0;
		reg_bf_42 <= 0;
		reg_WoxrXtYt_1_42 <= 0;
		reg_Woc_42 <= 0;
		reg_bo_42 <= 0;
		reg_WcxrXtYt_1_42 <= 0;
		reg_bc_42 <= 0;
		reg_out_mt_42 <= 0;
		reg_out_ct_42 <= 0;
		reg_Ct_1_43 <= 0;
		reg_WixrXtYt_1_43 <= 0;
		reg_Wic_43 <= 0;
		reg_bi_43 <= 0;
		reg_WfxrXtYt_1_43 <= 0;
		reg_Wfc_43 <= 0;
		reg_bf_43 <= 0;
		reg_WoxrXtYt_1_43 <= 0;
		reg_Woc_43 <= 0;
		reg_bo_43 <= 0;
		reg_WcxrXtYt_1_43 <= 0;
		reg_bc_43 <= 0;
		reg_out_mt_43 <= 0;
		reg_out_ct_43 <= 0;
		reg_Ct_1_44 <= 0;
		reg_WixrXtYt_1_44 <= 0;
		reg_Wic_44 <= 0;
		reg_bi_44 <= 0;
		reg_WfxrXtYt_1_44 <= 0;
		reg_Wfc_44 <= 0;
		reg_bf_44 <= 0;
		reg_WoxrXtYt_1_44 <= 0;
		reg_Woc_44 <= 0;
		reg_bo_44 <= 0;
		reg_WcxrXtYt_1_44 <= 0;
		reg_bc_44 <= 0;
		reg_out_mt_44 <= 0;
		reg_out_ct_44 <= 0;
		reg_Ct_1_45 <= 0;
		reg_WixrXtYt_1_45 <= 0;
		reg_Wic_45 <= 0;
		reg_bi_45 <= 0;
		reg_WfxrXtYt_1_45 <= 0;
		reg_Wfc_45 <= 0;
		reg_bf_45 <= 0;
		reg_WoxrXtYt_1_45 <= 0;
		reg_Woc_45 <= 0;
		reg_bo_45 <= 0;
		reg_WcxrXtYt_1_45 <= 0;
		reg_bc_45 <= 0;
		reg_out_mt_45 <= 0;
		reg_out_ct_45 <= 0;
		reg_Ct_1_46 <= 0;
		reg_WixrXtYt_1_46 <= 0;
		reg_Wic_46 <= 0;
		reg_bi_46 <= 0;
		reg_WfxrXtYt_1_46 <= 0;
		reg_Wfc_46 <= 0;
		reg_bf_46 <= 0;
		reg_WoxrXtYt_1_46 <= 0;
		reg_Woc_46 <= 0;
		reg_bo_46 <= 0;
		reg_WcxrXtYt_1_46 <= 0;
		reg_bc_46 <= 0;
		reg_out_mt_46 <= 0;
		reg_out_ct_46 <= 0;
		reg_Ct_1_47 <= 0;
		reg_WixrXtYt_1_47 <= 0;
		reg_Wic_47 <= 0;
		reg_bi_47 <= 0;
		reg_WfxrXtYt_1_47 <= 0;
		reg_Wfc_47 <= 0;
		reg_bf_47 <= 0;
		reg_WoxrXtYt_1_47 <= 0;
		reg_Woc_47 <= 0;
		reg_bo_47 <= 0;
		reg_WcxrXtYt_1_47 <= 0;
		reg_bc_47 <= 0;
		reg_out_mt_47 <= 0;
		reg_out_ct_47 <= 0;
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
		reg_Ct_1_16 <= Ct_1_16;
		reg_WixrXtYt_1_16 <= WixrXtYt_1_16;
		reg_Wic_16 <= Wic_16;
		reg_bi_16 <= bi_16;
		reg_WfxrXtYt_1_16 <= WfxrXtYt_1_16;
		reg_Wfc_16 <= Wfc_16;
		reg_bf_16 <= bf_16;
		reg_WoxrXtYt_1_16 <= WoxrXtYt_1_16;
		reg_Woc_16 <= Woc_16;
		reg_bo_16 <= bo_16;
		reg_WcxrXtYt_1_16 <= WcxrXtYt_1_16;
		reg_bc_16 <= bc_16;
		reg_out_mt_16 <= o_mt_16;
		reg_out_ct_16 <= ct_hold_16;
		reg_Ct_1_17 <= Ct_1_17;
		reg_WixrXtYt_1_17 <= WixrXtYt_1_17;
		reg_Wic_17 <= Wic_17;
		reg_bi_17 <= bi_17;
		reg_WfxrXtYt_1_17 <= WfxrXtYt_1_17;
		reg_Wfc_17 <= Wfc_17;
		reg_bf_17 <= bf_17;
		reg_WoxrXtYt_1_17 <= WoxrXtYt_1_17;
		reg_Woc_17 <= Woc_17;
		reg_bo_17 <= bo_17;
		reg_WcxrXtYt_1_17 <= WcxrXtYt_1_17;
		reg_bc_17 <= bc_17;
		reg_out_mt_17 <= o_mt_17;
		reg_out_ct_17 <= ct_hold_17;
		reg_Ct_1_18 <= Ct_1_18;
		reg_WixrXtYt_1_18 <= WixrXtYt_1_18;
		reg_Wic_18 <= Wic_18;
		reg_bi_18 <= bi_18;
		reg_WfxrXtYt_1_18 <= WfxrXtYt_1_18;
		reg_Wfc_18 <= Wfc_18;
		reg_bf_18 <= bf_18;
		reg_WoxrXtYt_1_18 <= WoxrXtYt_1_18;
		reg_Woc_18 <= Woc_18;
		reg_bo_18 <= bo_18;
		reg_WcxrXtYt_1_18 <= WcxrXtYt_1_18;
		reg_bc_18 <= bc_18;
		reg_out_mt_18 <= o_mt_18;
		reg_out_ct_18 <= ct_hold_18;
		reg_Ct_1_19 <= Ct_1_19;
		reg_WixrXtYt_1_19 <= WixrXtYt_1_19;
		reg_Wic_19 <= Wic_19;
		reg_bi_19 <= bi_19;
		reg_WfxrXtYt_1_19 <= WfxrXtYt_1_19;
		reg_Wfc_19 <= Wfc_19;
		reg_bf_19 <= bf_19;
		reg_WoxrXtYt_1_19 <= WoxrXtYt_1_19;
		reg_Woc_19 <= Woc_19;
		reg_bo_19 <= bo_19;
		reg_WcxrXtYt_1_19 <= WcxrXtYt_1_19;
		reg_bc_19 <= bc_19;
		reg_out_mt_19 <= o_mt_19;
		reg_out_ct_19 <= ct_hold_19;
		reg_Ct_1_20 <= Ct_1_20;
		reg_WixrXtYt_1_20 <= WixrXtYt_1_20;
		reg_Wic_20 <= Wic_20;
		reg_bi_20 <= bi_20;
		reg_WfxrXtYt_1_20 <= WfxrXtYt_1_20;
		reg_Wfc_20 <= Wfc_20;
		reg_bf_20 <= bf_20;
		reg_WoxrXtYt_1_20 <= WoxrXtYt_1_20;
		reg_Woc_20 <= Woc_20;
		reg_bo_20 <= bo_20;
		reg_WcxrXtYt_1_20 <= WcxrXtYt_1_20;
		reg_bc_20 <= bc_20;
		reg_out_mt_20 <= o_mt_20;
		reg_out_ct_20 <= ct_hold_20;
		reg_Ct_1_21 <= Ct_1_21;
		reg_WixrXtYt_1_21 <= WixrXtYt_1_21;
		reg_Wic_21 <= Wic_21;
		reg_bi_21 <= bi_21;
		reg_WfxrXtYt_1_21 <= WfxrXtYt_1_21;
		reg_Wfc_21 <= Wfc_21;
		reg_bf_21 <= bf_21;
		reg_WoxrXtYt_1_21 <= WoxrXtYt_1_21;
		reg_Woc_21 <= Woc_21;
		reg_bo_21 <= bo_21;
		reg_WcxrXtYt_1_21 <= WcxrXtYt_1_21;
		reg_bc_21 <= bc_21;
		reg_out_mt_21 <= o_mt_21;
		reg_out_ct_21 <= ct_hold_21;
		reg_Ct_1_22 <= Ct_1_22;
		reg_WixrXtYt_1_22 <= WixrXtYt_1_22;
		reg_Wic_22 <= Wic_22;
		reg_bi_22 <= bi_22;
		reg_WfxrXtYt_1_22 <= WfxrXtYt_1_22;
		reg_Wfc_22 <= Wfc_22;
		reg_bf_22 <= bf_22;
		reg_WoxrXtYt_1_22 <= WoxrXtYt_1_22;
		reg_Woc_22 <= Woc_22;
		reg_bo_22 <= bo_22;
		reg_WcxrXtYt_1_22 <= WcxrXtYt_1_22;
		reg_bc_22 <= bc_22;
		reg_out_mt_22 <= o_mt_22;
		reg_out_ct_22 <= ct_hold_22;
		reg_Ct_1_23 <= Ct_1_23;
		reg_WixrXtYt_1_23 <= WixrXtYt_1_23;
		reg_Wic_23 <= Wic_23;
		reg_bi_23 <= bi_23;
		reg_WfxrXtYt_1_23 <= WfxrXtYt_1_23;
		reg_Wfc_23 <= Wfc_23;
		reg_bf_23 <= bf_23;
		reg_WoxrXtYt_1_23 <= WoxrXtYt_1_23;
		reg_Woc_23 <= Woc_23;
		reg_bo_23 <= bo_23;
		reg_WcxrXtYt_1_23 <= WcxrXtYt_1_23;
		reg_bc_23 <= bc_23;
		reg_out_mt_23 <= o_mt_23;
		reg_out_ct_23 <= ct_hold_23;
		reg_Ct_1_24 <= Ct_1_24;
		reg_WixrXtYt_1_24 <= WixrXtYt_1_24;
		reg_Wic_24 <= Wic_24;
		reg_bi_24 <= bi_24;
		reg_WfxrXtYt_1_24 <= WfxrXtYt_1_24;
		reg_Wfc_24 <= Wfc_24;
		reg_bf_24 <= bf_24;
		reg_WoxrXtYt_1_24 <= WoxrXtYt_1_24;
		reg_Woc_24 <= Woc_24;
		reg_bo_24 <= bo_24;
		reg_WcxrXtYt_1_24 <= WcxrXtYt_1_24;
		reg_bc_24 <= bc_24;
		reg_out_mt_24 <= o_mt_24;
		reg_out_ct_24 <= ct_hold_24;
		reg_Ct_1_25 <= Ct_1_25;
		reg_WixrXtYt_1_25 <= WixrXtYt_1_25;
		reg_Wic_25 <= Wic_25;
		reg_bi_25 <= bi_25;
		reg_WfxrXtYt_1_25 <= WfxrXtYt_1_25;
		reg_Wfc_25 <= Wfc_25;
		reg_bf_25 <= bf_25;
		reg_WoxrXtYt_1_25 <= WoxrXtYt_1_25;
		reg_Woc_25 <= Woc_25;
		reg_bo_25 <= bo_25;
		reg_WcxrXtYt_1_25 <= WcxrXtYt_1_25;
		reg_bc_25 <= bc_25;
		reg_out_mt_25 <= o_mt_25;
		reg_out_ct_25 <= ct_hold_25;
		reg_Ct_1_26 <= Ct_1_26;
		reg_WixrXtYt_1_26 <= WixrXtYt_1_26;
		reg_Wic_26 <= Wic_26;
		reg_bi_26 <= bi_26;
		reg_WfxrXtYt_1_26 <= WfxrXtYt_1_26;
		reg_Wfc_26 <= Wfc_26;
		reg_bf_26 <= bf_26;
		reg_WoxrXtYt_1_26 <= WoxrXtYt_1_26;
		reg_Woc_26 <= Woc_26;
		reg_bo_26 <= bo_26;
		reg_WcxrXtYt_1_26 <= WcxrXtYt_1_26;
		reg_bc_26 <= bc_26;
		reg_out_mt_26 <= o_mt_26;
		reg_out_ct_26 <= ct_hold_26;
		reg_Ct_1_27 <= Ct_1_27;
		reg_WixrXtYt_1_27 <= WixrXtYt_1_27;
		reg_Wic_27 <= Wic_27;
		reg_bi_27 <= bi_27;
		reg_WfxrXtYt_1_27 <= WfxrXtYt_1_27;
		reg_Wfc_27 <= Wfc_27;
		reg_bf_27 <= bf_27;
		reg_WoxrXtYt_1_27 <= WoxrXtYt_1_27;
		reg_Woc_27 <= Woc_27;
		reg_bo_27 <= bo_27;
		reg_WcxrXtYt_1_27 <= WcxrXtYt_1_27;
		reg_bc_27 <= bc_27;
		reg_out_mt_27 <= o_mt_27;
		reg_out_ct_27 <= ct_hold_27;
		reg_Ct_1_28 <= Ct_1_28;
		reg_WixrXtYt_1_28 <= WixrXtYt_1_28;
		reg_Wic_28 <= Wic_28;
		reg_bi_28 <= bi_28;
		reg_WfxrXtYt_1_28 <= WfxrXtYt_1_28;
		reg_Wfc_28 <= Wfc_28;
		reg_bf_28 <= bf_28;
		reg_WoxrXtYt_1_28 <= WoxrXtYt_1_28;
		reg_Woc_28 <= Woc_28;
		reg_bo_28 <= bo_28;
		reg_WcxrXtYt_1_28 <= WcxrXtYt_1_28;
		reg_bc_28 <= bc_28;
		reg_out_mt_28 <= o_mt_28;
		reg_out_ct_28 <= ct_hold_28;
		reg_Ct_1_29 <= Ct_1_29;
		reg_WixrXtYt_1_29 <= WixrXtYt_1_29;
		reg_Wic_29 <= Wic_29;
		reg_bi_29 <= bi_29;
		reg_WfxrXtYt_1_29 <= WfxrXtYt_1_29;
		reg_Wfc_29 <= Wfc_29;
		reg_bf_29 <= bf_29;
		reg_WoxrXtYt_1_29 <= WoxrXtYt_1_29;
		reg_Woc_29 <= Woc_29;
		reg_bo_29 <= bo_29;
		reg_WcxrXtYt_1_29 <= WcxrXtYt_1_29;
		reg_bc_29 <= bc_29;
		reg_out_mt_29 <= o_mt_29;
		reg_out_ct_29 <= ct_hold_29;
		reg_Ct_1_30 <= Ct_1_30;
		reg_WixrXtYt_1_30 <= WixrXtYt_1_30;
		reg_Wic_30 <= Wic_30;
		reg_bi_30 <= bi_30;
		reg_WfxrXtYt_1_30 <= WfxrXtYt_1_30;
		reg_Wfc_30 <= Wfc_30;
		reg_bf_30 <= bf_30;
		reg_WoxrXtYt_1_30 <= WoxrXtYt_1_30;
		reg_Woc_30 <= Woc_30;
		reg_bo_30 <= bo_30;
		reg_WcxrXtYt_1_30 <= WcxrXtYt_1_30;
		reg_bc_30 <= bc_30;
		reg_out_mt_30 <= o_mt_30;
		reg_out_ct_30 <= ct_hold_30;
		reg_Ct_1_31 <= Ct_1_31;
		reg_WixrXtYt_1_31 <= WixrXtYt_1_31;
		reg_Wic_31 <= Wic_31;
		reg_bi_31 <= bi_31;
		reg_WfxrXtYt_1_31 <= WfxrXtYt_1_31;
		reg_Wfc_31 <= Wfc_31;
		reg_bf_31 <= bf_31;
		reg_WoxrXtYt_1_31 <= WoxrXtYt_1_31;
		reg_Woc_31 <= Woc_31;
		reg_bo_31 <= bo_31;
		reg_WcxrXtYt_1_31 <= WcxrXtYt_1_31;
		reg_bc_31 <= bc_31;
		reg_out_mt_31 <= o_mt_31;
		reg_out_ct_31 <= ct_hold_31;
		reg_Ct_1_32 <= Ct_1_32;
		reg_WixrXtYt_1_32 <= WixrXtYt_1_32;
		reg_Wic_32 <= Wic_32;
		reg_bi_32 <= bi_32;
		reg_WfxrXtYt_1_32 <= WfxrXtYt_1_32;
		reg_Wfc_32 <= Wfc_32;
		reg_bf_32 <= bf_32;
		reg_WoxrXtYt_1_32 <= WoxrXtYt_1_32;
		reg_Woc_32 <= Woc_32;
		reg_bo_32 <= bo_32;
		reg_WcxrXtYt_1_32 <= WcxrXtYt_1_32;
		reg_bc_32 <= bc_32;
		reg_out_mt_32 <= o_mt_32;
		reg_out_ct_32 <= ct_hold_32;
		reg_Ct_1_33 <= Ct_1_33;
		reg_WixrXtYt_1_33 <= WixrXtYt_1_33;
		reg_Wic_33 <= Wic_33;
		reg_bi_33 <= bi_33;
		reg_WfxrXtYt_1_33 <= WfxrXtYt_1_33;
		reg_Wfc_33 <= Wfc_33;
		reg_bf_33 <= bf_33;
		reg_WoxrXtYt_1_33 <= WoxrXtYt_1_33;
		reg_Woc_33 <= Woc_33;
		reg_bo_33 <= bo_33;
		reg_WcxrXtYt_1_33 <= WcxrXtYt_1_33;
		reg_bc_33 <= bc_33;
		reg_out_mt_33 <= o_mt_33;
		reg_out_ct_33 <= ct_hold_33;
		reg_Ct_1_34 <= Ct_1_34;
		reg_WixrXtYt_1_34 <= WixrXtYt_1_34;
		reg_Wic_34 <= Wic_34;
		reg_bi_34 <= bi_34;
		reg_WfxrXtYt_1_34 <= WfxrXtYt_1_34;
		reg_Wfc_34 <= Wfc_34;
		reg_bf_34 <= bf_34;
		reg_WoxrXtYt_1_34 <= WoxrXtYt_1_34;
		reg_Woc_34 <= Woc_34;
		reg_bo_34 <= bo_34;
		reg_WcxrXtYt_1_34 <= WcxrXtYt_1_34;
		reg_bc_34 <= bc_34;
		reg_out_mt_34 <= o_mt_34;
		reg_out_ct_34 <= ct_hold_34;
		reg_Ct_1_35 <= Ct_1_35;
		reg_WixrXtYt_1_35 <= WixrXtYt_1_35;
		reg_Wic_35 <= Wic_35;
		reg_bi_35 <= bi_35;
		reg_WfxrXtYt_1_35 <= WfxrXtYt_1_35;
		reg_Wfc_35 <= Wfc_35;
		reg_bf_35 <= bf_35;
		reg_WoxrXtYt_1_35 <= WoxrXtYt_1_35;
		reg_Woc_35 <= Woc_35;
		reg_bo_35 <= bo_35;
		reg_WcxrXtYt_1_35 <= WcxrXtYt_1_35;
		reg_bc_35 <= bc_35;
		reg_out_mt_35 <= o_mt_35;
		reg_out_ct_35 <= ct_hold_35;
		reg_Ct_1_36 <= Ct_1_36;
		reg_WixrXtYt_1_36 <= WixrXtYt_1_36;
		reg_Wic_36 <= Wic_36;
		reg_bi_36 <= bi_36;
		reg_WfxrXtYt_1_36 <= WfxrXtYt_1_36;
		reg_Wfc_36 <= Wfc_36;
		reg_bf_36 <= bf_36;
		reg_WoxrXtYt_1_36 <= WoxrXtYt_1_36;
		reg_Woc_36 <= Woc_36;
		reg_bo_36 <= bo_36;
		reg_WcxrXtYt_1_36 <= WcxrXtYt_1_36;
		reg_bc_36 <= bc_36;
		reg_out_mt_36 <= o_mt_36;
		reg_out_ct_36 <= ct_hold_36;
		reg_Ct_1_37 <= Ct_1_37;
		reg_WixrXtYt_1_37 <= WixrXtYt_1_37;
		reg_Wic_37 <= Wic_37;
		reg_bi_37 <= bi_37;
		reg_WfxrXtYt_1_37 <= WfxrXtYt_1_37;
		reg_Wfc_37 <= Wfc_37;
		reg_bf_37 <= bf_37;
		reg_WoxrXtYt_1_37 <= WoxrXtYt_1_37;
		reg_Woc_37 <= Woc_37;
		reg_bo_37 <= bo_37;
		reg_WcxrXtYt_1_37 <= WcxrXtYt_1_37;
		reg_bc_37 <= bc_37;
		reg_out_mt_37 <= o_mt_37;
		reg_out_ct_37 <= ct_hold_37;
		reg_Ct_1_38 <= Ct_1_38;
		reg_WixrXtYt_1_38 <= WixrXtYt_1_38;
		reg_Wic_38 <= Wic_38;
		reg_bi_38 <= bi_38;
		reg_WfxrXtYt_1_38 <= WfxrXtYt_1_38;
		reg_Wfc_38 <= Wfc_38;
		reg_bf_38 <= bf_38;
		reg_WoxrXtYt_1_38 <= WoxrXtYt_1_38;
		reg_Woc_38 <= Woc_38;
		reg_bo_38 <= bo_38;
		reg_WcxrXtYt_1_38 <= WcxrXtYt_1_38;
		reg_bc_38 <= bc_38;
		reg_out_mt_38 <= o_mt_38;
		reg_out_ct_38 <= ct_hold_38;
		reg_Ct_1_39 <= Ct_1_39;
		reg_WixrXtYt_1_39 <= WixrXtYt_1_39;
		reg_Wic_39 <= Wic_39;
		reg_bi_39 <= bi_39;
		reg_WfxrXtYt_1_39 <= WfxrXtYt_1_39;
		reg_Wfc_39 <= Wfc_39;
		reg_bf_39 <= bf_39;
		reg_WoxrXtYt_1_39 <= WoxrXtYt_1_39;
		reg_Woc_39 <= Woc_39;
		reg_bo_39 <= bo_39;
		reg_WcxrXtYt_1_39 <= WcxrXtYt_1_39;
		reg_bc_39 <= bc_39;
		reg_out_mt_39 <= o_mt_39;
		reg_out_ct_39 <= ct_hold_39;
		reg_Ct_1_40 <= Ct_1_40;
		reg_WixrXtYt_1_40 <= WixrXtYt_1_40;
		reg_Wic_40 <= Wic_40;
		reg_bi_40 <= bi_40;
		reg_WfxrXtYt_1_40 <= WfxrXtYt_1_40;
		reg_Wfc_40 <= Wfc_40;
		reg_bf_40 <= bf_40;
		reg_WoxrXtYt_1_40 <= WoxrXtYt_1_40;
		reg_Woc_40 <= Woc_40;
		reg_bo_40 <= bo_40;
		reg_WcxrXtYt_1_40 <= WcxrXtYt_1_40;
		reg_bc_40 <= bc_40;
		reg_out_mt_40 <= o_mt_40;
		reg_out_ct_40 <= ct_hold_40;
		reg_Ct_1_41 <= Ct_1_41;
		reg_WixrXtYt_1_41 <= WixrXtYt_1_41;
		reg_Wic_41 <= Wic_41;
		reg_bi_41 <= bi_41;
		reg_WfxrXtYt_1_41 <= WfxrXtYt_1_41;
		reg_Wfc_41 <= Wfc_41;
		reg_bf_41 <= bf_41;
		reg_WoxrXtYt_1_41 <= WoxrXtYt_1_41;
		reg_Woc_41 <= Woc_41;
		reg_bo_41 <= bo_41;
		reg_WcxrXtYt_1_41 <= WcxrXtYt_1_41;
		reg_bc_41 <= bc_41;
		reg_out_mt_41 <= o_mt_41;
		reg_out_ct_41 <= ct_hold_41;
		reg_Ct_1_42 <= Ct_1_42;
		reg_WixrXtYt_1_42 <= WixrXtYt_1_42;
		reg_Wic_42 <= Wic_42;
		reg_bi_42 <= bi_42;
		reg_WfxrXtYt_1_42 <= WfxrXtYt_1_42;
		reg_Wfc_42 <= Wfc_42;
		reg_bf_42 <= bf_42;
		reg_WoxrXtYt_1_42 <= WoxrXtYt_1_42;
		reg_Woc_42 <= Woc_42;
		reg_bo_42 <= bo_42;
		reg_WcxrXtYt_1_42 <= WcxrXtYt_1_42;
		reg_bc_42 <= bc_42;
		reg_out_mt_42 <= o_mt_42;
		reg_out_ct_42 <= ct_hold_42;
		reg_Ct_1_43 <= Ct_1_43;
		reg_WixrXtYt_1_43 <= WixrXtYt_1_43;
		reg_Wic_43 <= Wic_43;
		reg_bi_43 <= bi_43;
		reg_WfxrXtYt_1_43 <= WfxrXtYt_1_43;
		reg_Wfc_43 <= Wfc_43;
		reg_bf_43 <= bf_43;
		reg_WoxrXtYt_1_43 <= WoxrXtYt_1_43;
		reg_Woc_43 <= Woc_43;
		reg_bo_43 <= bo_43;
		reg_WcxrXtYt_1_43 <= WcxrXtYt_1_43;
		reg_bc_43 <= bc_43;
		reg_out_mt_43 <= o_mt_43;
		reg_out_ct_43 <= ct_hold_43;
		reg_Ct_1_44 <= Ct_1_44;
		reg_WixrXtYt_1_44 <= WixrXtYt_1_44;
		reg_Wic_44 <= Wic_44;
		reg_bi_44 <= bi_44;
		reg_WfxrXtYt_1_44 <= WfxrXtYt_1_44;
		reg_Wfc_44 <= Wfc_44;
		reg_bf_44 <= bf_44;
		reg_WoxrXtYt_1_44 <= WoxrXtYt_1_44;
		reg_Woc_44 <= Woc_44;
		reg_bo_44 <= bo_44;
		reg_WcxrXtYt_1_44 <= WcxrXtYt_1_44;
		reg_bc_44 <= bc_44;
		reg_out_mt_44 <= o_mt_44;
		reg_out_ct_44 <= ct_hold_44;
		reg_Ct_1_45 <= Ct_1_45;
		reg_WixrXtYt_1_45 <= WixrXtYt_1_45;
		reg_Wic_45 <= Wic_45;
		reg_bi_45 <= bi_45;
		reg_WfxrXtYt_1_45 <= WfxrXtYt_1_45;
		reg_Wfc_45 <= Wfc_45;
		reg_bf_45 <= bf_45;
		reg_WoxrXtYt_1_45 <= WoxrXtYt_1_45;
		reg_Woc_45 <= Woc_45;
		reg_bo_45 <= bo_45;
		reg_WcxrXtYt_1_45 <= WcxrXtYt_1_45;
		reg_bc_45 <= bc_45;
		reg_out_mt_45 <= o_mt_45;
		reg_out_ct_45 <= ct_hold_45;
		reg_Ct_1_46 <= Ct_1_46;
		reg_WixrXtYt_1_46 <= WixrXtYt_1_46;
		reg_Wic_46 <= Wic_46;
		reg_bi_46 <= bi_46;
		reg_WfxrXtYt_1_46 <= WfxrXtYt_1_46;
		reg_Wfc_46 <= Wfc_46;
		reg_bf_46 <= bf_46;
		reg_WoxrXtYt_1_46 <= WoxrXtYt_1_46;
		reg_Woc_46 <= Woc_46;
		reg_bo_46 <= bo_46;
		reg_WcxrXtYt_1_46 <= WcxrXtYt_1_46;
		reg_bc_46 <= bc_46;
		reg_out_mt_46 <= o_mt_46;
		reg_out_ct_46 <= ct_hold_46;
		reg_Ct_1_47 <= Ct_1_47;
		reg_WixrXtYt_1_47 <= WixrXtYt_1_47;
		reg_Wic_47 <= Wic_47;
		reg_bi_47 <= bi_47;
		reg_WfxrXtYt_1_47 <= WfxrXtYt_1_47;
		reg_Wfc_47 <= Wfc_47;
		reg_bf_47 <= bf_47;
		reg_WoxrXtYt_1_47 <= WoxrXtYt_1_47;
		reg_Woc_47 <= Woc_47;
		reg_bo_47 <= bo_47;
		reg_WcxrXtYt_1_47 <= WcxrXtYt_1_47;
		reg_bc_47 <= bc_47;
		reg_out_mt_47 <= o_mt_47;
		reg_out_ct_47 <= ct_hold_47;
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
assign out_mt_16 = reg_out_mt_16;
assign out_ct_16 = reg_out_ct_16;
assign out_mt_17 = reg_out_mt_17;
assign out_ct_17 = reg_out_ct_17;
assign out_mt_18 = reg_out_mt_18;
assign out_ct_18 = reg_out_ct_18;
assign out_mt_19 = reg_out_mt_19;
assign out_ct_19 = reg_out_ct_19;
assign out_mt_20 = reg_out_mt_20;
assign out_ct_20 = reg_out_ct_20;
assign out_mt_21 = reg_out_mt_21;
assign out_ct_21 = reg_out_ct_21;
assign out_mt_22 = reg_out_mt_22;
assign out_ct_22 = reg_out_ct_22;
assign out_mt_23 = reg_out_mt_23;
assign out_ct_23 = reg_out_ct_23;
assign out_mt_24 = reg_out_mt_24;
assign out_ct_24 = reg_out_ct_24;
assign out_mt_25 = reg_out_mt_25;
assign out_ct_25 = reg_out_ct_25;
assign out_mt_26 = reg_out_mt_26;
assign out_ct_26 = reg_out_ct_26;
assign out_mt_27 = reg_out_mt_27;
assign out_ct_27 = reg_out_ct_27;
assign out_mt_28 = reg_out_mt_28;
assign out_ct_28 = reg_out_ct_28;
assign out_mt_29 = reg_out_mt_29;
assign out_ct_29 = reg_out_ct_29;
assign out_mt_30 = reg_out_mt_30;
assign out_ct_30 = reg_out_ct_30;
assign out_mt_31 = reg_out_mt_31;
assign out_ct_31 = reg_out_ct_31;
assign out_mt_32 = reg_out_mt_32;
assign out_ct_32 = reg_out_ct_32;
assign out_mt_33 = reg_out_mt_33;
assign out_ct_33 = reg_out_ct_33;
assign out_mt_34 = reg_out_mt_34;
assign out_ct_34 = reg_out_ct_34;
assign out_mt_35 = reg_out_mt_35;
assign out_ct_35 = reg_out_ct_35;
assign out_mt_36 = reg_out_mt_36;
assign out_ct_36 = reg_out_ct_36;
assign out_mt_37 = reg_out_mt_37;
assign out_ct_37 = reg_out_ct_37;
assign out_mt_38 = reg_out_mt_38;
assign out_ct_38 = reg_out_ct_38;
assign out_mt_39 = reg_out_mt_39;
assign out_ct_39 = reg_out_ct_39;
assign out_mt_40 = reg_out_mt_40;
assign out_ct_40 = reg_out_ct_40;
assign out_mt_41 = reg_out_mt_41;
assign out_ct_41 = reg_out_ct_41;
assign out_mt_42 = reg_out_mt_42;
assign out_ct_42 = reg_out_ct_42;
assign out_mt_43 = reg_out_mt_43;
assign out_ct_43 = reg_out_ct_43;
assign out_mt_44 = reg_out_mt_44;
assign out_ct_44 = reg_out_ct_44;
assign out_mt_45 = reg_out_mt_45;
assign out_ct_45 = reg_out_ct_45;
assign out_mt_46 = reg_out_mt_46;
assign out_ct_46 = reg_out_ct_46;
assign out_mt_47 = reg_out_mt_47;
assign out_ct_47 = reg_out_ct_47;
assign o_valid = reg_o_valid;
assign o_ready = enable;
endmodule
module elementwise_mult_core_18_18_10_48_1 (
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
	input [17:0] i_A_16,
	input [17:0] i_B_16,
	output [17:0] o_C_16,
	input [17:0] i_A_17,
	input [17:0] i_B_17,
	output [17:0] o_C_17,
	input [17:0] i_A_18,
	input [17:0] i_B_18,
	output [17:0] o_C_18,
	input [17:0] i_A_19,
	input [17:0] i_B_19,
	output [17:0] o_C_19,
	input [17:0] i_A_20,
	input [17:0] i_B_20,
	output [17:0] o_C_20,
	input [17:0] i_A_21,
	input [17:0] i_B_21,
	output [17:0] o_C_21,
	input [17:0] i_A_22,
	input [17:0] i_B_22,
	output [17:0] o_C_22,
	input [17:0] i_A_23,
	input [17:0] i_B_23,
	output [17:0] o_C_23,
	input [17:0] i_A_24,
	input [17:0] i_B_24,
	output [17:0] o_C_24,
	input [17:0] i_A_25,
	input [17:0] i_B_25,
	output [17:0] o_C_25,
	input [17:0] i_A_26,
	input [17:0] i_B_26,
	output [17:0] o_C_26,
	input [17:0] i_A_27,
	input [17:0] i_B_27,
	output [17:0] o_C_27,
	input [17:0] i_A_28,
	input [17:0] i_B_28,
	output [17:0] o_C_28,
	input [17:0] i_A_29,
	input [17:0] i_B_29,
	output [17:0] o_C_29,
	input [17:0] i_A_30,
	input [17:0] i_B_30,
	output [17:0] o_C_30,
	input [17:0] i_A_31,
	input [17:0] i_B_31,
	output [17:0] o_C_31,
	input [17:0] i_A_32,
	input [17:0] i_B_32,
	output [17:0] o_C_32,
	input [17:0] i_A_33,
	input [17:0] i_B_33,
	output [17:0] o_C_33,
	input [17:0] i_A_34,
	input [17:0] i_B_34,
	output [17:0] o_C_34,
	input [17:0] i_A_35,
	input [17:0] i_B_35,
	output [17:0] o_C_35,
	input [17:0] i_A_36,
	input [17:0] i_B_36,
	output [17:0] o_C_36,
	input [17:0] i_A_37,
	input [17:0] i_B_37,
	output [17:0] o_C_37,
	input [17:0] i_A_38,
	input [17:0] i_B_38,
	output [17:0] o_C_38,
	input [17:0] i_A_39,
	input [17:0] i_B_39,
	output [17:0] o_C_39,
	input [17:0] i_A_40,
	input [17:0] i_B_40,
	output [17:0] o_C_40,
	input [17:0] i_A_41,
	input [17:0] i_B_41,
	output [17:0] o_C_41,
	input [17:0] i_A_42,
	input [17:0] i_B_42,
	output [17:0] o_C_42,
	input [17:0] i_A_43,
	input [17:0] i_B_43,
	output [17:0] o_C_43,
	input [17:0] i_A_44,
	input [17:0] i_B_44,
	output [17:0] o_C_44,
	input [17:0] i_A_45,
	input [17:0] i_B_45,
	output [17:0] o_C_45,
	input [17:0] i_A_46,
	input [17:0] i_B_46,
	output [17:0] o_C_46,
	input [17:0] i_A_47,
	input [17:0] i_B_47,
	output [17:0] o_C_47,
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
reg [17:0] reg_A_16;
reg [17:0] reg_B_16;
wire [17:0] reg_C_16;
reg [17:0] reg_A_17;
reg [17:0] reg_B_17;
wire [17:0] reg_C_17;
reg [17:0] reg_A_18;
reg [17:0] reg_B_18;
wire [17:0] reg_C_18;
reg [17:0] reg_A_19;
reg [17:0] reg_B_19;
wire [17:0] reg_C_19;
reg [17:0] reg_A_20;
reg [17:0] reg_B_20;
wire [17:0] reg_C_20;
reg [17:0] reg_A_21;
reg [17:0] reg_B_21;
wire [17:0] reg_C_21;
reg [17:0] reg_A_22;
reg [17:0] reg_B_22;
wire [17:0] reg_C_22;
reg [17:0] reg_A_23;
reg [17:0] reg_B_23;
wire [17:0] reg_C_23;
reg [17:0] reg_A_24;
reg [17:0] reg_B_24;
wire [17:0] reg_C_24;
reg [17:0] reg_A_25;
reg [17:0] reg_B_25;
wire [17:0] reg_C_25;
reg [17:0] reg_A_26;
reg [17:0] reg_B_26;
wire [17:0] reg_C_26;
reg [17:0] reg_A_27;
reg [17:0] reg_B_27;
wire [17:0] reg_C_27;
reg [17:0] reg_A_28;
reg [17:0] reg_B_28;
wire [17:0] reg_C_28;
reg [17:0] reg_A_29;
reg [17:0] reg_B_29;
wire [17:0] reg_C_29;
reg [17:0] reg_A_30;
reg [17:0] reg_B_30;
wire [17:0] reg_C_30;
reg [17:0] reg_A_31;
reg [17:0] reg_B_31;
wire [17:0] reg_C_31;
reg [17:0] reg_A_32;
reg [17:0] reg_B_32;
wire [17:0] reg_C_32;
reg [17:0] reg_A_33;
reg [17:0] reg_B_33;
wire [17:0] reg_C_33;
reg [17:0] reg_A_34;
reg [17:0] reg_B_34;
wire [17:0] reg_C_34;
reg [17:0] reg_A_35;
reg [17:0] reg_B_35;
wire [17:0] reg_C_35;
reg [17:0] reg_A_36;
reg [17:0] reg_B_36;
wire [17:0] reg_C_36;
reg [17:0] reg_A_37;
reg [17:0] reg_B_37;
wire [17:0] reg_C_37;
reg [17:0] reg_A_38;
reg [17:0] reg_B_38;
wire [17:0] reg_C_38;
reg [17:0] reg_A_39;
reg [17:0] reg_B_39;
wire [17:0] reg_C_39;
reg [17:0] reg_A_40;
reg [17:0] reg_B_40;
wire [17:0] reg_C_40;
reg [17:0] reg_A_41;
reg [17:0] reg_B_41;
wire [17:0] reg_C_41;
reg [17:0] reg_A_42;
reg [17:0] reg_B_42;
wire [17:0] reg_C_42;
reg [17:0] reg_A_43;
reg [17:0] reg_B_43;
wire [17:0] reg_C_43;
reg [17:0] reg_A_44;
reg [17:0] reg_B_44;
wire [17:0] reg_C_44;
reg [17:0] reg_A_45;
reg [17:0] reg_B_45;
wire [17:0] reg_C_45;
reg [17:0] reg_A_46;
reg [17:0] reg_B_46;
wire [17:0] reg_C_46;
reg [17:0] reg_A_47;
reg [17:0] reg_B_47;
wire [17:0] reg_C_47;

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
wire mult_valid_16;
wire round_valid_16;
wire [36:0] mult_C_16;
wire [36:0] rounded_C_16;
wire mult_valid_17;
wire round_valid_17;
wire [36:0] mult_C_17;
wire [36:0] rounded_C_17;
wire mult_valid_18;
wire round_valid_18;
wire [36:0] mult_C_18;
wire [36:0] rounded_C_18;
wire mult_valid_19;
wire round_valid_19;
wire [36:0] mult_C_19;
wire [36:0] rounded_C_19;
wire mult_valid_20;
wire round_valid_20;
wire [36:0] mult_C_20;
wire [36:0] rounded_C_20;
wire mult_valid_21;
wire round_valid_21;
wire [36:0] mult_C_21;
wire [36:0] rounded_C_21;
wire mult_valid_22;
wire round_valid_22;
wire [36:0] mult_C_22;
wire [36:0] rounded_C_22;
wire mult_valid_23;
wire round_valid_23;
wire [36:0] mult_C_23;
wire [36:0] rounded_C_23;
wire mult_valid_24;
wire round_valid_24;
wire [36:0] mult_C_24;
wire [36:0] rounded_C_24;
wire mult_valid_25;
wire round_valid_25;
wire [36:0] mult_C_25;
wire [36:0] rounded_C_25;
wire mult_valid_26;
wire round_valid_26;
wire [36:0] mult_C_26;
wire [36:0] rounded_C_26;
wire mult_valid_27;
wire round_valid_27;
wire [36:0] mult_C_27;
wire [36:0] rounded_C_27;
wire mult_valid_28;
wire round_valid_28;
wire [36:0] mult_C_28;
wire [36:0] rounded_C_28;
wire mult_valid_29;
wire round_valid_29;
wire [36:0] mult_C_29;
wire [36:0] rounded_C_29;
wire mult_valid_30;
wire round_valid_30;
wire [36:0] mult_C_30;
wire [36:0] rounded_C_30;
wire mult_valid_31;
wire round_valid_31;
wire [36:0] mult_C_31;
wire [36:0] rounded_C_31;
wire mult_valid_32;
wire round_valid_32;
wire [36:0] mult_C_32;
wire [36:0] rounded_C_32;
wire mult_valid_33;
wire round_valid_33;
wire [36:0] mult_C_33;
wire [36:0] rounded_C_33;
wire mult_valid_34;
wire round_valid_34;
wire [36:0] mult_C_34;
wire [36:0] rounded_C_34;
wire mult_valid_35;
wire round_valid_35;
wire [36:0] mult_C_35;
wire [36:0] rounded_C_35;
wire mult_valid_36;
wire round_valid_36;
wire [36:0] mult_C_36;
wire [36:0] rounded_C_36;
wire mult_valid_37;
wire round_valid_37;
wire [36:0] mult_C_37;
wire [36:0] rounded_C_37;
wire mult_valid_38;
wire round_valid_38;
wire [36:0] mult_C_38;
wire [36:0] rounded_C_38;
wire mult_valid_39;
wire round_valid_39;
wire [36:0] mult_C_39;
wire [36:0] rounded_C_39;
wire mult_valid_40;
wire round_valid_40;
wire [36:0] mult_C_40;
wire [36:0] rounded_C_40;
wire mult_valid_41;
wire round_valid_41;
wire [36:0] mult_C_41;
wire [36:0] rounded_C_41;
wire mult_valid_42;
wire round_valid_42;
wire [36:0] mult_C_42;
wire [36:0] rounded_C_42;
wire mult_valid_43;
wire round_valid_43;
wire [36:0] mult_C_43;
wire [36:0] rounded_C_43;
wire mult_valid_44;
wire round_valid_44;
wire [36:0] mult_C_44;
wire [36:0] rounded_C_44;
wire mult_valid_45;
wire round_valid_45;
wire [36:0] mult_C_45;
wire [36:0] rounded_C_45;
wire mult_valid_46;
wire round_valid_46;
wire [36:0] mult_C_46;
wire [36:0] rounded_C_46;
wire mult_valid_47;
wire round_valid_47;
wire [36:0] mult_C_47;
wire [36:0] rounded_C_47;

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
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst16 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_16),
	.ay(reg_B_16),
	.bx(reg_A_17),
	.by(reg_B_17),
	.o_valid(mult_valid_16),
	.resulta(mult_C_16),
	.resultb(mult_C_17)
);
assign mult_valid_17 = mult_valid_16;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst18 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_18),
	.ay(reg_B_18),
	.bx(reg_A_19),
	.by(reg_B_19),
	.o_valid(mult_valid_18),
	.resulta(mult_C_18),
	.resultb(mult_C_19)
);
assign mult_valid_19 = mult_valid_18;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst20 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_20),
	.ay(reg_B_20),
	.bx(reg_A_21),
	.by(reg_B_21),
	.o_valid(mult_valid_20),
	.resulta(mult_C_20),
	.resultb(mult_C_21)
);
assign mult_valid_21 = mult_valid_20;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst22 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_22),
	.ay(reg_B_22),
	.bx(reg_A_23),
	.by(reg_B_23),
	.o_valid(mult_valid_22),
	.resulta(mult_C_22),
	.resultb(mult_C_23)
);
assign mult_valid_23 = mult_valid_22;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst24 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_24),
	.ay(reg_B_24),
	.bx(reg_A_25),
	.by(reg_B_25),
	.o_valid(mult_valid_24),
	.resulta(mult_C_24),
	.resultb(mult_C_25)
);
assign mult_valid_25 = mult_valid_24;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst26 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_26),
	.ay(reg_B_26),
	.bx(reg_A_27),
	.by(reg_B_27),
	.o_valid(mult_valid_26),
	.resulta(mult_C_26),
	.resultb(mult_C_27)
);
assign mult_valid_27 = mult_valid_26;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst28 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_28),
	.ay(reg_B_28),
	.bx(reg_A_29),
	.by(reg_B_29),
	.o_valid(mult_valid_28),
	.resulta(mult_C_28),
	.resultb(mult_C_29)
);
assign mult_valid_29 = mult_valid_28;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst30 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_30),
	.ay(reg_B_30),
	.bx(reg_A_31),
	.by(reg_B_31),
	.o_valid(mult_valid_30),
	.resulta(mult_C_30),
	.resultb(mult_C_31)
);
assign mult_valid_31 = mult_valid_30;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst32 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_32),
	.ay(reg_B_32),
	.bx(reg_A_33),
	.by(reg_B_33),
	.o_valid(mult_valid_32),
	.resulta(mult_C_32),
	.resultb(mult_C_33)
);
assign mult_valid_33 = mult_valid_32;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst34 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_34),
	.ay(reg_B_34),
	.bx(reg_A_35),
	.by(reg_B_35),
	.o_valid(mult_valid_34),
	.resulta(mult_C_34),
	.resultb(mult_C_35)
);
assign mult_valid_35 = mult_valid_34;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst36 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_36),
	.ay(reg_B_36),
	.bx(reg_A_37),
	.by(reg_B_37),
	.o_valid(mult_valid_36),
	.resulta(mult_C_36),
	.resultb(mult_C_37)
);
assign mult_valid_37 = mult_valid_36;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst38 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_38),
	.ay(reg_B_38),
	.bx(reg_A_39),
	.by(reg_B_39),
	.o_valid(mult_valid_38),
	.resulta(mult_C_38),
	.resultb(mult_C_39)
);
assign mult_valid_39 = mult_valid_38;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst40 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_40),
	.ay(reg_B_40),
	.bx(reg_A_41),
	.by(reg_B_41),
	.o_valid(mult_valid_40),
	.resulta(mult_C_40),
	.resultb(mult_C_41)
);
assign mult_valid_41 = mult_valid_40;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst42 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_42),
	.ay(reg_B_42),
	.bx(reg_A_43),
	.by(reg_B_43),
	.o_valid(mult_valid_42),
	.resulta(mult_C_42),
	.resultb(mult_C_43)
);
assign mult_valid_43 = mult_valid_42;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst44 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_44),
	.ay(reg_B_44),
	.bx(reg_A_45),
	.by(reg_B_45),
	.o_valid(mult_valid_44),
	.resulta(mult_C_44),
	.resultb(mult_C_45)
);
assign mult_valid_45 = mult_valid_44;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst46 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_46),
	.ay(reg_B_46),
	.bx(reg_A_47),
	.by(reg_B_47),
	.o_valid(mult_valid_46),
	.resulta(mult_C_46),
	.resultb(mult_C_47)
);
assign mult_valid_47 = mult_valid_46;
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
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_16),
	.in(mult_C_16),
	.o_valid(round_valid_16),
	.out(rounded_C_16)
);
assign reg_C_16 = rounded_C_16;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_17),
	.in(mult_C_17),
	.o_valid(round_valid_17),
	.out(rounded_C_17)
);
assign reg_C_17 = rounded_C_17;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_18),
	.in(mult_C_18),
	.o_valid(round_valid_18),
	.out(rounded_C_18)
);
assign reg_C_18 = rounded_C_18;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_19),
	.in(mult_C_19),
	.o_valid(round_valid_19),
	.out(rounded_C_19)
);
assign reg_C_19 = rounded_C_19;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_20),
	.in(mult_C_20),
	.o_valid(round_valid_20),
	.out(rounded_C_20)
);
assign reg_C_20 = rounded_C_20;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_21),
	.in(mult_C_21),
	.o_valid(round_valid_21),
	.out(rounded_C_21)
);
assign reg_C_21 = rounded_C_21;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_22),
	.in(mult_C_22),
	.o_valid(round_valid_22),
	.out(rounded_C_22)
);
assign reg_C_22 = rounded_C_22;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_23),
	.in(mult_C_23),
	.o_valid(round_valid_23),
	.out(rounded_C_23)
);
assign reg_C_23 = rounded_C_23;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_24),
	.in(mult_C_24),
	.o_valid(round_valid_24),
	.out(rounded_C_24)
);
assign reg_C_24 = rounded_C_24;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_25),
	.in(mult_C_25),
	.o_valid(round_valid_25),
	.out(rounded_C_25)
);
assign reg_C_25 = rounded_C_25;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_26),
	.in(mult_C_26),
	.o_valid(round_valid_26),
	.out(rounded_C_26)
);
assign reg_C_26 = rounded_C_26;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_27),
	.in(mult_C_27),
	.o_valid(round_valid_27),
	.out(rounded_C_27)
);
assign reg_C_27 = rounded_C_27;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_28),
	.in(mult_C_28),
	.o_valid(round_valid_28),
	.out(rounded_C_28)
);
assign reg_C_28 = rounded_C_28;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_29),
	.in(mult_C_29),
	.o_valid(round_valid_29),
	.out(rounded_C_29)
);
assign reg_C_29 = rounded_C_29;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_30),
	.in(mult_C_30),
	.o_valid(round_valid_30),
	.out(rounded_C_30)
);
assign reg_C_30 = rounded_C_30;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_31),
	.in(mult_C_31),
	.o_valid(round_valid_31),
	.out(rounded_C_31)
);
assign reg_C_31 = rounded_C_31;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_32),
	.in(mult_C_32),
	.o_valid(round_valid_32),
	.out(rounded_C_32)
);
assign reg_C_32 = rounded_C_32;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_33),
	.in(mult_C_33),
	.o_valid(round_valid_33),
	.out(rounded_C_33)
);
assign reg_C_33 = rounded_C_33;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_34),
	.in(mult_C_34),
	.o_valid(round_valid_34),
	.out(rounded_C_34)
);
assign reg_C_34 = rounded_C_34;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_35),
	.in(mult_C_35),
	.o_valid(round_valid_35),
	.out(rounded_C_35)
);
assign reg_C_35 = rounded_C_35;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_36),
	.in(mult_C_36),
	.o_valid(round_valid_36),
	.out(rounded_C_36)
);
assign reg_C_36 = rounded_C_36;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_37),
	.in(mult_C_37),
	.o_valid(round_valid_37),
	.out(rounded_C_37)
);
assign reg_C_37 = rounded_C_37;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_38),
	.in(mult_C_38),
	.o_valid(round_valid_38),
	.out(rounded_C_38)
);
assign reg_C_38 = rounded_C_38;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_39),
	.in(mult_C_39),
	.o_valid(round_valid_39),
	.out(rounded_C_39)
);
assign reg_C_39 = rounded_C_39;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_40),
	.in(mult_C_40),
	.o_valid(round_valid_40),
	.out(rounded_C_40)
);
assign reg_C_40 = rounded_C_40;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_41),
	.in(mult_C_41),
	.o_valid(round_valid_41),
	.out(rounded_C_41)
);
assign reg_C_41 = rounded_C_41;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_42),
	.in(mult_C_42),
	.o_valid(round_valid_42),
	.out(rounded_C_42)
);
assign reg_C_42 = rounded_C_42;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_43),
	.in(mult_C_43),
	.o_valid(round_valid_43),
	.out(rounded_C_43)
);
assign reg_C_43 = rounded_C_43;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_44),
	.in(mult_C_44),
	.o_valid(round_valid_44),
	.out(rounded_C_44)
);
assign reg_C_44 = rounded_C_44;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_45),
	.in(mult_C_45),
	.o_valid(round_valid_45),
	.out(rounded_C_45)
);
assign reg_C_45 = rounded_C_45;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_46),
	.in(mult_C_46),
	.o_valid(round_valid_46),
	.out(rounded_C_46)
);
assign reg_C_46 = rounded_C_46;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_47),
	.in(mult_C_47),
	.o_valid(round_valid_47),
	.out(rounded_C_47)
);
assign reg_C_47 = rounded_C_47;
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
		reg_A_16 <= 0;
		reg_B_16 <= 0;
		reg_A_17 <= 0;
		reg_B_17 <= 0;
		reg_A_18 <= 0;
		reg_B_18 <= 0;
		reg_A_19 <= 0;
		reg_B_19 <= 0;
		reg_A_20 <= 0;
		reg_B_20 <= 0;
		reg_A_21 <= 0;
		reg_B_21 <= 0;
		reg_A_22 <= 0;
		reg_B_22 <= 0;
		reg_A_23 <= 0;
		reg_B_23 <= 0;
		reg_A_24 <= 0;
		reg_B_24 <= 0;
		reg_A_25 <= 0;
		reg_B_25 <= 0;
		reg_A_26 <= 0;
		reg_B_26 <= 0;
		reg_A_27 <= 0;
		reg_B_27 <= 0;
		reg_A_28 <= 0;
		reg_B_28 <= 0;
		reg_A_29 <= 0;
		reg_B_29 <= 0;
		reg_A_30 <= 0;
		reg_B_30 <= 0;
		reg_A_31 <= 0;
		reg_B_31 <= 0;
		reg_A_32 <= 0;
		reg_B_32 <= 0;
		reg_A_33 <= 0;
		reg_B_33 <= 0;
		reg_A_34 <= 0;
		reg_B_34 <= 0;
		reg_A_35 <= 0;
		reg_B_35 <= 0;
		reg_A_36 <= 0;
		reg_B_36 <= 0;
		reg_A_37 <= 0;
		reg_B_37 <= 0;
		reg_A_38 <= 0;
		reg_B_38 <= 0;
		reg_A_39 <= 0;
		reg_B_39 <= 0;
		reg_A_40 <= 0;
		reg_B_40 <= 0;
		reg_A_41 <= 0;
		reg_B_41 <= 0;
		reg_A_42 <= 0;
		reg_B_42 <= 0;
		reg_A_43 <= 0;
		reg_B_43 <= 0;
		reg_A_44 <= 0;
		reg_B_44 <= 0;
		reg_A_45 <= 0;
		reg_B_45 <= 0;
		reg_A_46 <= 0;
		reg_B_46 <= 0;
		reg_A_47 <= 0;
		reg_B_47 <= 0;
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
		reg_A_16 <= i_A_16;
		reg_B_16 <= i_B_16;
		reg_A_17 <= i_A_17;
		reg_B_17 <= i_B_17;
		reg_A_18 <= i_A_18;
		reg_B_18 <= i_B_18;
		reg_A_19 <= i_A_19;
		reg_B_19 <= i_B_19;
		reg_A_20 <= i_A_20;
		reg_B_20 <= i_B_20;
		reg_A_21 <= i_A_21;
		reg_B_21 <= i_B_21;
		reg_A_22 <= i_A_22;
		reg_B_22 <= i_B_22;
		reg_A_23 <= i_A_23;
		reg_B_23 <= i_B_23;
		reg_A_24 <= i_A_24;
		reg_B_24 <= i_B_24;
		reg_A_25 <= i_A_25;
		reg_B_25 <= i_B_25;
		reg_A_26 <= i_A_26;
		reg_B_26 <= i_B_26;
		reg_A_27 <= i_A_27;
		reg_B_27 <= i_B_27;
		reg_A_28 <= i_A_28;
		reg_B_28 <= i_B_28;
		reg_A_29 <= i_A_29;
		reg_B_29 <= i_B_29;
		reg_A_30 <= i_A_30;
		reg_B_30 <= i_B_30;
		reg_A_31 <= i_A_31;
		reg_B_31 <= i_B_31;
		reg_A_32 <= i_A_32;
		reg_B_32 <= i_B_32;
		reg_A_33 <= i_A_33;
		reg_B_33 <= i_B_33;
		reg_A_34 <= i_A_34;
		reg_B_34 <= i_B_34;
		reg_A_35 <= i_A_35;
		reg_B_35 <= i_B_35;
		reg_A_36 <= i_A_36;
		reg_B_36 <= i_B_36;
		reg_A_37 <= i_A_37;
		reg_B_37 <= i_B_37;
		reg_A_38 <= i_A_38;
		reg_B_38 <= i_B_38;
		reg_A_39 <= i_A_39;
		reg_B_39 <= i_B_39;
		reg_A_40 <= i_A_40;
		reg_B_40 <= i_B_40;
		reg_A_41 <= i_A_41;
		reg_B_41 <= i_B_41;
		reg_A_42 <= i_A_42;
		reg_B_42 <= i_B_42;
		reg_A_43 <= i_A_43;
		reg_B_43 <= i_B_43;
		reg_A_44 <= i_A_44;
		reg_B_44 <= i_B_44;
		reg_A_45 <= i_A_45;
		reg_B_45 <= i_B_45;
		reg_A_46 <= i_A_46;
		reg_B_46 <= i_B_46;
		reg_A_47 <= i_A_47;
		reg_B_47 <= i_B_47;
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
assign o_C_16 = reg_C_16;
assign o_C_17 = reg_C_17;
assign o_C_18 = reg_C_18;
assign o_C_19 = reg_C_19;
assign o_C_20 = reg_C_20;
assign o_C_21 = reg_C_21;
assign o_C_22 = reg_C_22;
assign o_C_23 = reg_C_23;
assign o_C_24 = reg_C_24;
assign o_C_25 = reg_C_25;
assign o_C_26 = reg_C_26;
assign o_C_27 = reg_C_27;
assign o_C_28 = reg_C_28;
assign o_C_29 = reg_C_29;
assign o_C_30 = reg_C_30;
assign o_C_31 = reg_C_31;
assign o_C_32 = reg_C_32;
assign o_C_33 = reg_C_33;
assign o_C_34 = reg_C_34;
assign o_C_35 = reg_C_35;
assign o_C_36 = reg_C_36;
assign o_C_37 = reg_C_37;
assign o_C_38 = reg_C_38;
assign o_C_39 = reg_C_39;
assign o_C_40 = reg_C_40;
assign o_C_41 = reg_C_41;
assign o_C_42 = reg_C_42;
assign o_C_43 = reg_C_43;
assign o_C_44 = reg_C_44;
assign o_C_45 = reg_C_45;
assign o_C_46 = reg_C_46;
assign o_C_47 = reg_C_47;
assign valid_C = round_valid_0;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module shift_register_group_18_48_18 (
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
	input [17:0] in_16,
	output [17:0] out_16,
	input [17:0] in_17,
	output [17:0] out_17,
	input [17:0] in_18,
	output [17:0] out_18,
	input [17:0] in_19,
	output [17:0] out_19,
	input [17:0] in_20,
	output [17:0] out_20,
	input [17:0] in_21,
	output [17:0] out_21,
	input [17:0] in_22,
	output [17:0] out_22,
	input [17:0] in_23,
	output [17:0] out_23,
	input [17:0] in_24,
	output [17:0] out_24,
	input [17:0] in_25,
	output [17:0] out_25,
	input [17:0] in_26,
	output [17:0] out_26,
	input [17:0] in_27,
	output [17:0] out_27,
	input [17:0] in_28,
	output [17:0] out_28,
	input [17:0] in_29,
	output [17:0] out_29,
	input [17:0] in_30,
	output [17:0] out_30,
	input [17:0] in_31,
	output [17:0] out_31,
	input [17:0] in_32,
	output [17:0] out_32,
	input [17:0] in_33,
	output [17:0] out_33,
	input [17:0] in_34,
	output [17:0] out_34,
	input [17:0] in_35,
	output [17:0] out_35,
	input [17:0] in_36,
	output [17:0] out_36,
	input [17:0] in_37,
	output [17:0] out_37,
	input [17:0] in_38,
	output [17:0] out_38,
	input [17:0] in_39,
	output [17:0] out_39,
	input [17:0] in_40,
	output [17:0] out_40,
	input [17:0] in_41,
	output [17:0] out_41,
	input [17:0] in_42,
	output [17:0] out_42,
	input [17:0] in_43,
	output [17:0] out_43,
	input [17:0] in_44,
	output [17:0] out_44,
	input [17:0] in_45,
	output [17:0] out_45,
	input [17:0] in_46,
	output [17:0] out_46,
	input [17:0] in_47,
	output [17:0] out_47,
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

shift_register_unit_18_18 shift_register_unit_18_18_inst_16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_16),
	.out(out_16)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_17),
	.out(out_17)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_18),
	.out(out_18)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_19),
	.out(out_19)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_20),
	.out(out_20)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_21),
	.out(out_21)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_22),
	.out(out_22)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_23),
	.out(out_23)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_24),
	.out(out_24)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_25),
	.out(out_25)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_26),
	.out(out_26)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_27),
	.out(out_27)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_28),
	.out(out_28)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_29),
	.out(out_29)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_30),
	.out(out_30)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_31),
	.out(out_31)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_32),
	.out(out_32)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_33),
	.out(out_33)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_34),
	.out(out_34)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_35),
	.out(out_35)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_36),
	.out(out_36)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_37),
	.out(out_37)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_38),
	.out(out_38)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_39),
	.out(out_39)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_40),
	.out(out_40)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_41),
	.out(out_41)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_42),
	.out(out_42)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_43),
	.out(out_43)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_44),
	.out(out_44)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_45),
	.out(out_45)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_46),
	.out(out_46)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_47),
	.out(out_47)
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
module shift_register_group_18_48_14 (
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
	input [17:0] in_16,
	output [17:0] out_16,
	input [17:0] in_17,
	output [17:0] out_17,
	input [17:0] in_18,
	output [17:0] out_18,
	input [17:0] in_19,
	output [17:0] out_19,
	input [17:0] in_20,
	output [17:0] out_20,
	input [17:0] in_21,
	output [17:0] out_21,
	input [17:0] in_22,
	output [17:0] out_22,
	input [17:0] in_23,
	output [17:0] out_23,
	input [17:0] in_24,
	output [17:0] out_24,
	input [17:0] in_25,
	output [17:0] out_25,
	input [17:0] in_26,
	output [17:0] out_26,
	input [17:0] in_27,
	output [17:0] out_27,
	input [17:0] in_28,
	output [17:0] out_28,
	input [17:0] in_29,
	output [17:0] out_29,
	input [17:0] in_30,
	output [17:0] out_30,
	input [17:0] in_31,
	output [17:0] out_31,
	input [17:0] in_32,
	output [17:0] out_32,
	input [17:0] in_33,
	output [17:0] out_33,
	input [17:0] in_34,
	output [17:0] out_34,
	input [17:0] in_35,
	output [17:0] out_35,
	input [17:0] in_36,
	output [17:0] out_36,
	input [17:0] in_37,
	output [17:0] out_37,
	input [17:0] in_38,
	output [17:0] out_38,
	input [17:0] in_39,
	output [17:0] out_39,
	input [17:0] in_40,
	output [17:0] out_40,
	input [17:0] in_41,
	output [17:0] out_41,
	input [17:0] in_42,
	output [17:0] out_42,
	input [17:0] in_43,
	output [17:0] out_43,
	input [17:0] in_44,
	output [17:0] out_44,
	input [17:0] in_45,
	output [17:0] out_45,
	input [17:0] in_46,
	output [17:0] out_46,
	input [17:0] in_47,
	output [17:0] out_47,
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

shift_register_unit_18_14 shift_register_unit_18_14_inst_16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_16),
	.out(out_16)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_17),
	.out(out_17)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_18),
	.out(out_18)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_19),
	.out(out_19)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_20),
	.out(out_20)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_21),
	.out(out_21)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_22),
	.out(out_22)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_23),
	.out(out_23)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_24),
	.out(out_24)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_25),
	.out(out_25)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_26),
	.out(out_26)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_27),
	.out(out_27)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_28),
	.out(out_28)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_29),
	.out(out_29)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_30),
	.out(out_30)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_31),
	.out(out_31)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_32),
	.out(out_32)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_33),
	.out(out_33)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_34),
	.out(out_34)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_35),
	.out(out_35)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_36),
	.out(out_36)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_37),
	.out(out_37)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_38),
	.out(out_38)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_39),
	.out(out_39)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_40),
	.out(out_40)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_41),
	.out(out_41)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_42),
	.out(out_42)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_43),
	.out(out_43)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_44),
	.out(out_44)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_45),
	.out(out_45)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_46),
	.out(out_46)
);

shift_register_unit_18_14 shift_register_unit_18_14_inst_47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_47),
	.out(out_47)
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
module elementwise_add_core_18_18_48 (
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
	input [17:0] i_A_16,
	input [17:0] i_B_16,
	output [17:0] o_C_16,
	input [17:0] i_A_17,
	input [17:0] i_B_17,
	output [17:0] o_C_17,
	input [17:0] i_A_18,
	input [17:0] i_B_18,
	output [17:0] o_C_18,
	input [17:0] i_A_19,
	input [17:0] i_B_19,
	output [17:0] o_C_19,
	input [17:0] i_A_20,
	input [17:0] i_B_20,
	output [17:0] o_C_20,
	input [17:0] i_A_21,
	input [17:0] i_B_21,
	output [17:0] o_C_21,
	input [17:0] i_A_22,
	input [17:0] i_B_22,
	output [17:0] o_C_22,
	input [17:0] i_A_23,
	input [17:0] i_B_23,
	output [17:0] o_C_23,
	input [17:0] i_A_24,
	input [17:0] i_B_24,
	output [17:0] o_C_24,
	input [17:0] i_A_25,
	input [17:0] i_B_25,
	output [17:0] o_C_25,
	input [17:0] i_A_26,
	input [17:0] i_B_26,
	output [17:0] o_C_26,
	input [17:0] i_A_27,
	input [17:0] i_B_27,
	output [17:0] o_C_27,
	input [17:0] i_A_28,
	input [17:0] i_B_28,
	output [17:0] o_C_28,
	input [17:0] i_A_29,
	input [17:0] i_B_29,
	output [17:0] o_C_29,
	input [17:0] i_A_30,
	input [17:0] i_B_30,
	output [17:0] o_C_30,
	input [17:0] i_A_31,
	input [17:0] i_B_31,
	output [17:0] o_C_31,
	input [17:0] i_A_32,
	input [17:0] i_B_32,
	output [17:0] o_C_32,
	input [17:0] i_A_33,
	input [17:0] i_B_33,
	output [17:0] o_C_33,
	input [17:0] i_A_34,
	input [17:0] i_B_34,
	output [17:0] o_C_34,
	input [17:0] i_A_35,
	input [17:0] i_B_35,
	output [17:0] o_C_35,
	input [17:0] i_A_36,
	input [17:0] i_B_36,
	output [17:0] o_C_36,
	input [17:0] i_A_37,
	input [17:0] i_B_37,
	output [17:0] o_C_37,
	input [17:0] i_A_38,
	input [17:0] i_B_38,
	output [17:0] o_C_38,
	input [17:0] i_A_39,
	input [17:0] i_B_39,
	output [17:0] o_C_39,
	input [17:0] i_A_40,
	input [17:0] i_B_40,
	output [17:0] o_C_40,
	input [17:0] i_A_41,
	input [17:0] i_B_41,
	output [17:0] o_C_41,
	input [17:0] i_A_42,
	input [17:0] i_B_42,
	output [17:0] o_C_42,
	input [17:0] i_A_43,
	input [17:0] i_B_43,
	output [17:0] o_C_43,
	input [17:0] i_A_44,
	input [17:0] i_B_44,
	output [17:0] o_C_44,
	input [17:0] i_A_45,
	input [17:0] i_B_45,
	output [17:0] o_C_45,
	input [17:0] i_A_46,
	input [17:0] i_B_46,
	output [17:0] o_C_46,
	input [17:0] i_A_47,
	input [17:0] i_B_47,
	output [17:0] o_C_47,
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
reg [17:0] reg_A_16;
reg [17:0] reg_B_16;
reg [17:0] reg_C_16;
reg [17:0] reg_A_17;
reg [17:0] reg_B_17;
reg [17:0] reg_C_17;
reg [17:0] reg_A_18;
reg [17:0] reg_B_18;
reg [17:0] reg_C_18;
reg [17:0] reg_A_19;
reg [17:0] reg_B_19;
reg [17:0] reg_C_19;
reg [17:0] reg_A_20;
reg [17:0] reg_B_20;
reg [17:0] reg_C_20;
reg [17:0] reg_A_21;
reg [17:0] reg_B_21;
reg [17:0] reg_C_21;
reg [17:0] reg_A_22;
reg [17:0] reg_B_22;
reg [17:0] reg_C_22;
reg [17:0] reg_A_23;
reg [17:0] reg_B_23;
reg [17:0] reg_C_23;
reg [17:0] reg_A_24;
reg [17:0] reg_B_24;
reg [17:0] reg_C_24;
reg [17:0] reg_A_25;
reg [17:0] reg_B_25;
reg [17:0] reg_C_25;
reg [17:0] reg_A_26;
reg [17:0] reg_B_26;
reg [17:0] reg_C_26;
reg [17:0] reg_A_27;
reg [17:0] reg_B_27;
reg [17:0] reg_C_27;
reg [17:0] reg_A_28;
reg [17:0] reg_B_28;
reg [17:0] reg_C_28;
reg [17:0] reg_A_29;
reg [17:0] reg_B_29;
reg [17:0] reg_C_29;
reg [17:0] reg_A_30;
reg [17:0] reg_B_30;
reg [17:0] reg_C_30;
reg [17:0] reg_A_31;
reg [17:0] reg_B_31;
reg [17:0] reg_C_31;
reg [17:0] reg_A_32;
reg [17:0] reg_B_32;
reg [17:0] reg_C_32;
reg [17:0] reg_A_33;
reg [17:0] reg_B_33;
reg [17:0] reg_C_33;
reg [17:0] reg_A_34;
reg [17:0] reg_B_34;
reg [17:0] reg_C_34;
reg [17:0] reg_A_35;
reg [17:0] reg_B_35;
reg [17:0] reg_C_35;
reg [17:0] reg_A_36;
reg [17:0] reg_B_36;
reg [17:0] reg_C_36;
reg [17:0] reg_A_37;
reg [17:0] reg_B_37;
reg [17:0] reg_C_37;
reg [17:0] reg_A_38;
reg [17:0] reg_B_38;
reg [17:0] reg_C_38;
reg [17:0] reg_A_39;
reg [17:0] reg_B_39;
reg [17:0] reg_C_39;
reg [17:0] reg_A_40;
reg [17:0] reg_B_40;
reg [17:0] reg_C_40;
reg [17:0] reg_A_41;
reg [17:0] reg_B_41;
reg [17:0] reg_C_41;
reg [17:0] reg_A_42;
reg [17:0] reg_B_42;
reg [17:0] reg_C_42;
reg [17:0] reg_A_43;
reg [17:0] reg_B_43;
reg [17:0] reg_C_43;
reg [17:0] reg_A_44;
reg [17:0] reg_B_44;
reg [17:0] reg_C_44;
reg [17:0] reg_A_45;
reg [17:0] reg_B_45;
reg [17:0] reg_C_45;
reg [17:0] reg_A_46;
reg [17:0] reg_B_46;
reg [17:0] reg_C_46;
reg [17:0] reg_A_47;
reg [17:0] reg_B_47;
reg [17:0] reg_C_47;

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
		reg_A_16 <= 0;
		reg_B_16 <= 0;
		reg_C_16 <= 0;
		reg_A_17 <= 0;
		reg_B_17 <= 0;
		reg_C_17 <= 0;
		reg_A_18 <= 0;
		reg_B_18 <= 0;
		reg_C_18 <= 0;
		reg_A_19 <= 0;
		reg_B_19 <= 0;
		reg_C_19 <= 0;
		reg_A_20 <= 0;
		reg_B_20 <= 0;
		reg_C_20 <= 0;
		reg_A_21 <= 0;
		reg_B_21 <= 0;
		reg_C_21 <= 0;
		reg_A_22 <= 0;
		reg_B_22 <= 0;
		reg_C_22 <= 0;
		reg_A_23 <= 0;
		reg_B_23 <= 0;
		reg_C_23 <= 0;
		reg_A_24 <= 0;
		reg_B_24 <= 0;
		reg_C_24 <= 0;
		reg_A_25 <= 0;
		reg_B_25 <= 0;
		reg_C_25 <= 0;
		reg_A_26 <= 0;
		reg_B_26 <= 0;
		reg_C_26 <= 0;
		reg_A_27 <= 0;
		reg_B_27 <= 0;
		reg_C_27 <= 0;
		reg_A_28 <= 0;
		reg_B_28 <= 0;
		reg_C_28 <= 0;
		reg_A_29 <= 0;
		reg_B_29 <= 0;
		reg_C_29 <= 0;
		reg_A_30 <= 0;
		reg_B_30 <= 0;
		reg_C_30 <= 0;
		reg_A_31 <= 0;
		reg_B_31 <= 0;
		reg_C_31 <= 0;
		reg_A_32 <= 0;
		reg_B_32 <= 0;
		reg_C_32 <= 0;
		reg_A_33 <= 0;
		reg_B_33 <= 0;
		reg_C_33 <= 0;
		reg_A_34 <= 0;
		reg_B_34 <= 0;
		reg_C_34 <= 0;
		reg_A_35 <= 0;
		reg_B_35 <= 0;
		reg_C_35 <= 0;
		reg_A_36 <= 0;
		reg_B_36 <= 0;
		reg_C_36 <= 0;
		reg_A_37 <= 0;
		reg_B_37 <= 0;
		reg_C_37 <= 0;
		reg_A_38 <= 0;
		reg_B_38 <= 0;
		reg_C_38 <= 0;
		reg_A_39 <= 0;
		reg_B_39 <= 0;
		reg_C_39 <= 0;
		reg_A_40 <= 0;
		reg_B_40 <= 0;
		reg_C_40 <= 0;
		reg_A_41 <= 0;
		reg_B_41 <= 0;
		reg_C_41 <= 0;
		reg_A_42 <= 0;
		reg_B_42 <= 0;
		reg_C_42 <= 0;
		reg_A_43 <= 0;
		reg_B_43 <= 0;
		reg_C_43 <= 0;
		reg_A_44 <= 0;
		reg_B_44 <= 0;
		reg_C_44 <= 0;
		reg_A_45 <= 0;
		reg_B_45 <= 0;
		reg_C_45 <= 0;
		reg_A_46 <= 0;
		reg_B_46 <= 0;
		reg_C_46 <= 0;
		reg_A_47 <= 0;
		reg_B_47 <= 0;
		reg_C_47 <= 0;
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
		reg_A_16 <= i_A_16;
		reg_B_16 <= i_B_16;
		reg_C_16 <= reg_A_16 + reg_B_16;
		reg_A_17 <= i_A_17;
		reg_B_17 <= i_B_17;
		reg_C_17 <= reg_A_17 + reg_B_17;
		reg_A_18 <= i_A_18;
		reg_B_18 <= i_B_18;
		reg_C_18 <= reg_A_18 + reg_B_18;
		reg_A_19 <= i_A_19;
		reg_B_19 <= i_B_19;
		reg_C_19 <= reg_A_19 + reg_B_19;
		reg_A_20 <= i_A_20;
		reg_B_20 <= i_B_20;
		reg_C_20 <= reg_A_20 + reg_B_20;
		reg_A_21 <= i_A_21;
		reg_B_21 <= i_B_21;
		reg_C_21 <= reg_A_21 + reg_B_21;
		reg_A_22 <= i_A_22;
		reg_B_22 <= i_B_22;
		reg_C_22 <= reg_A_22 + reg_B_22;
		reg_A_23 <= i_A_23;
		reg_B_23 <= i_B_23;
		reg_C_23 <= reg_A_23 + reg_B_23;
		reg_A_24 <= i_A_24;
		reg_B_24 <= i_B_24;
		reg_C_24 <= reg_A_24 + reg_B_24;
		reg_A_25 <= i_A_25;
		reg_B_25 <= i_B_25;
		reg_C_25 <= reg_A_25 + reg_B_25;
		reg_A_26 <= i_A_26;
		reg_B_26 <= i_B_26;
		reg_C_26 <= reg_A_26 + reg_B_26;
		reg_A_27 <= i_A_27;
		reg_B_27 <= i_B_27;
		reg_C_27 <= reg_A_27 + reg_B_27;
		reg_A_28 <= i_A_28;
		reg_B_28 <= i_B_28;
		reg_C_28 <= reg_A_28 + reg_B_28;
		reg_A_29 <= i_A_29;
		reg_B_29 <= i_B_29;
		reg_C_29 <= reg_A_29 + reg_B_29;
		reg_A_30 <= i_A_30;
		reg_B_30 <= i_B_30;
		reg_C_30 <= reg_A_30 + reg_B_30;
		reg_A_31 <= i_A_31;
		reg_B_31 <= i_B_31;
		reg_C_31 <= reg_A_31 + reg_B_31;
		reg_A_32 <= i_A_32;
		reg_B_32 <= i_B_32;
		reg_C_32 <= reg_A_32 + reg_B_32;
		reg_A_33 <= i_A_33;
		reg_B_33 <= i_B_33;
		reg_C_33 <= reg_A_33 + reg_B_33;
		reg_A_34 <= i_A_34;
		reg_B_34 <= i_B_34;
		reg_C_34 <= reg_A_34 + reg_B_34;
		reg_A_35 <= i_A_35;
		reg_B_35 <= i_B_35;
		reg_C_35 <= reg_A_35 + reg_B_35;
		reg_A_36 <= i_A_36;
		reg_B_36 <= i_B_36;
		reg_C_36 <= reg_A_36 + reg_B_36;
		reg_A_37 <= i_A_37;
		reg_B_37 <= i_B_37;
		reg_C_37 <= reg_A_37 + reg_B_37;
		reg_A_38 <= i_A_38;
		reg_B_38 <= i_B_38;
		reg_C_38 <= reg_A_38 + reg_B_38;
		reg_A_39 <= i_A_39;
		reg_B_39 <= i_B_39;
		reg_C_39 <= reg_A_39 + reg_B_39;
		reg_A_40 <= i_A_40;
		reg_B_40 <= i_B_40;
		reg_C_40 <= reg_A_40 + reg_B_40;
		reg_A_41 <= i_A_41;
		reg_B_41 <= i_B_41;
		reg_C_41 <= reg_A_41 + reg_B_41;
		reg_A_42 <= i_A_42;
		reg_B_42 <= i_B_42;
		reg_C_42 <= reg_A_42 + reg_B_42;
		reg_A_43 <= i_A_43;
		reg_B_43 <= i_B_43;
		reg_C_43 <= reg_A_43 + reg_B_43;
		reg_A_44 <= i_A_44;
		reg_B_44 <= i_B_44;
		reg_C_44 <= reg_A_44 + reg_B_44;
		reg_A_45 <= i_A_45;
		reg_B_45 <= i_B_45;
		reg_C_45 <= reg_A_45 + reg_B_45;
		reg_A_46 <= i_A_46;
		reg_B_46 <= i_B_46;
		reg_C_46 <= reg_A_46 + reg_B_46;
		reg_A_47 <= i_A_47;
		reg_B_47 <= i_B_47;
		reg_C_47 <= reg_A_47 + reg_B_47;
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
assign o_C_16 = reg_C_16;
assign o_C_17 = reg_C_17;
assign o_C_18 = reg_C_18;
assign o_C_19 = reg_C_19;
assign o_C_20 = reg_C_20;
assign o_C_21 = reg_C_21;
assign o_C_22 = reg_C_22;
assign o_C_23 = reg_C_23;
assign o_C_24 = reg_C_24;
assign o_C_25 = reg_C_25;
assign o_C_26 = reg_C_26;
assign o_C_27 = reg_C_27;
assign o_C_28 = reg_C_28;
assign o_C_29 = reg_C_29;
assign o_C_30 = reg_C_30;
assign o_C_31 = reg_C_31;
assign o_C_32 = reg_C_32;
assign o_C_33 = reg_C_33;
assign o_C_34 = reg_C_34;
assign o_C_35 = reg_C_35;
assign o_C_36 = reg_C_36;
assign o_C_37 = reg_C_37;
assign o_C_38 = reg_C_38;
assign o_C_39 = reg_C_39;
assign o_C_40 = reg_C_40;
assign o_C_41 = reg_C_41;
assign o_C_42 = reg_C_42;
assign o_C_43 = reg_C_43;
assign o_C_44 = reg_C_44;
assign o_C_45 = reg_C_45;
assign o_C_46 = reg_C_46;
assign o_C_47 = reg_C_47;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module shift_register_group_18_48_6 (
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
	input [17:0] in_16,
	output [17:0] out_16,
	input [17:0] in_17,
	output [17:0] out_17,
	input [17:0] in_18,
	output [17:0] out_18,
	input [17:0] in_19,
	output [17:0] out_19,
	input [17:0] in_20,
	output [17:0] out_20,
	input [17:0] in_21,
	output [17:0] out_21,
	input [17:0] in_22,
	output [17:0] out_22,
	input [17:0] in_23,
	output [17:0] out_23,
	input [17:0] in_24,
	output [17:0] out_24,
	input [17:0] in_25,
	output [17:0] out_25,
	input [17:0] in_26,
	output [17:0] out_26,
	input [17:0] in_27,
	output [17:0] out_27,
	input [17:0] in_28,
	output [17:0] out_28,
	input [17:0] in_29,
	output [17:0] out_29,
	input [17:0] in_30,
	output [17:0] out_30,
	input [17:0] in_31,
	output [17:0] out_31,
	input [17:0] in_32,
	output [17:0] out_32,
	input [17:0] in_33,
	output [17:0] out_33,
	input [17:0] in_34,
	output [17:0] out_34,
	input [17:0] in_35,
	output [17:0] out_35,
	input [17:0] in_36,
	output [17:0] out_36,
	input [17:0] in_37,
	output [17:0] out_37,
	input [17:0] in_38,
	output [17:0] out_38,
	input [17:0] in_39,
	output [17:0] out_39,
	input [17:0] in_40,
	output [17:0] out_40,
	input [17:0] in_41,
	output [17:0] out_41,
	input [17:0] in_42,
	output [17:0] out_42,
	input [17:0] in_43,
	output [17:0] out_43,
	input [17:0] in_44,
	output [17:0] out_44,
	input [17:0] in_45,
	output [17:0] out_45,
	input [17:0] in_46,
	output [17:0] out_46,
	input [17:0] in_47,
	output [17:0] out_47,
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

shift_register_unit_18_6 shift_register_unit_18_6_inst_16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_16),
	.out(out_16)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_17),
	.out(out_17)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_18),
	.out(out_18)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_19),
	.out(out_19)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_20),
	.out(out_20)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_21),
	.out(out_21)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_22),
	.out(out_22)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_23),
	.out(out_23)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_24),
	.out(out_24)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_25),
	.out(out_25)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_26),
	.out(out_26)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_27),
	.out(out_27)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_28),
	.out(out_28)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_29),
	.out(out_29)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_30),
	.out(out_30)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_31),
	.out(out_31)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_32),
	.out(out_32)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_33),
	.out(out_33)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_34),
	.out(out_34)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_35),
	.out(out_35)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_36),
	.out(out_36)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_37),
	.out(out_37)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_38),
	.out(out_38)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_39),
	.out(out_39)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_40),
	.out(out_40)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_41),
	.out(out_41)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_42),
	.out(out_42)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_43),
	.out(out_43)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_44),
	.out(out_44)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_45),
	.out(out_45)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_46),
	.out(out_46)
);

shift_register_unit_18_6 shift_register_unit_18_6_inst_47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_47),
	.out(out_47)
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
module output_activation_18_10_48_1 (
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
	input [17:0] stage1_result_16,
	input [17:0] bias_16,
	output [17:0] output_value_16,
	input [17:0] stage1_result_17,
	input [17:0] bias_17,
	output [17:0] output_value_17,
	input [17:0] stage1_result_18,
	input [17:0] bias_18,
	output [17:0] output_value_18,
	input [17:0] stage1_result_19,
	input [17:0] bias_19,
	output [17:0] output_value_19,
	input [17:0] stage1_result_20,
	input [17:0] bias_20,
	output [17:0] output_value_20,
	input [17:0] stage1_result_21,
	input [17:0] bias_21,
	output [17:0] output_value_21,
	input [17:0] stage1_result_22,
	input [17:0] bias_22,
	output [17:0] output_value_22,
	input [17:0] stage1_result_23,
	input [17:0] bias_23,
	output [17:0] output_value_23,
	input [17:0] stage1_result_24,
	input [17:0] bias_24,
	output [17:0] output_value_24,
	input [17:0] stage1_result_25,
	input [17:0] bias_25,
	output [17:0] output_value_25,
	input [17:0] stage1_result_26,
	input [17:0] bias_26,
	output [17:0] output_value_26,
	input [17:0] stage1_result_27,
	input [17:0] bias_27,
	output [17:0] output_value_27,
	input [17:0] stage1_result_28,
	input [17:0] bias_28,
	output [17:0] output_value_28,
	input [17:0] stage1_result_29,
	input [17:0] bias_29,
	output [17:0] output_value_29,
	input [17:0] stage1_result_30,
	input [17:0] bias_30,
	output [17:0] output_value_30,
	input [17:0] stage1_result_31,
	input [17:0] bias_31,
	output [17:0] output_value_31,
	input [17:0] stage1_result_32,
	input [17:0] bias_32,
	output [17:0] output_value_32,
	input [17:0] stage1_result_33,
	input [17:0] bias_33,
	output [17:0] output_value_33,
	input [17:0] stage1_result_34,
	input [17:0] bias_34,
	output [17:0] output_value_34,
	input [17:0] stage1_result_35,
	input [17:0] bias_35,
	output [17:0] output_value_35,
	input [17:0] stage1_result_36,
	input [17:0] bias_36,
	output [17:0] output_value_36,
	input [17:0] stage1_result_37,
	input [17:0] bias_37,
	output [17:0] output_value_37,
	input [17:0] stage1_result_38,
	input [17:0] bias_38,
	output [17:0] output_value_38,
	input [17:0] stage1_result_39,
	input [17:0] bias_39,
	output [17:0] output_value_39,
	input [17:0] stage1_result_40,
	input [17:0] bias_40,
	output [17:0] output_value_40,
	input [17:0] stage1_result_41,
	input [17:0] bias_41,
	output [17:0] output_value_41,
	input [17:0] stage1_result_42,
	input [17:0] bias_42,
	output [17:0] output_value_42,
	input [17:0] stage1_result_43,
	input [17:0] bias_43,
	output [17:0] output_value_43,
	input [17:0] stage1_result_44,
	input [17:0] bias_44,
	output [17:0] output_value_44,
	input [17:0] stage1_result_45,
	input [17:0] bias_45,
	output [17:0] output_value_45,
	input [17:0] stage1_result_46,
	input [17:0] bias_46,
	output [17:0] output_value_46,
	input [17:0] stage1_result_47,
	input [17:0] bias_47,
	output [17:0] output_value_47,
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
wire sigmoid_valid_16, sigmoid_ready_16;
wire [17:0] o_add2_16;
wire [17:0] o_sigmoid_16;
wire sigmoid_valid_17, sigmoid_ready_17;
wire [17:0] o_add2_17;
wire [17:0] o_sigmoid_17;
wire sigmoid_valid_18, sigmoid_ready_18;
wire [17:0] o_add2_18;
wire [17:0] o_sigmoid_18;
wire sigmoid_valid_19, sigmoid_ready_19;
wire [17:0] o_add2_19;
wire [17:0] o_sigmoid_19;
wire sigmoid_valid_20, sigmoid_ready_20;
wire [17:0] o_add2_20;
wire [17:0] o_sigmoid_20;
wire sigmoid_valid_21, sigmoid_ready_21;
wire [17:0] o_add2_21;
wire [17:0] o_sigmoid_21;
wire sigmoid_valid_22, sigmoid_ready_22;
wire [17:0] o_add2_22;
wire [17:0] o_sigmoid_22;
wire sigmoid_valid_23, sigmoid_ready_23;
wire [17:0] o_add2_23;
wire [17:0] o_sigmoid_23;
wire sigmoid_valid_24, sigmoid_ready_24;
wire [17:0] o_add2_24;
wire [17:0] o_sigmoid_24;
wire sigmoid_valid_25, sigmoid_ready_25;
wire [17:0] o_add2_25;
wire [17:0] o_sigmoid_25;
wire sigmoid_valid_26, sigmoid_ready_26;
wire [17:0] o_add2_26;
wire [17:0] o_sigmoid_26;
wire sigmoid_valid_27, sigmoid_ready_27;
wire [17:0] o_add2_27;
wire [17:0] o_sigmoid_27;
wire sigmoid_valid_28, sigmoid_ready_28;
wire [17:0] o_add2_28;
wire [17:0] o_sigmoid_28;
wire sigmoid_valid_29, sigmoid_ready_29;
wire [17:0] o_add2_29;
wire [17:0] o_sigmoid_29;
wire sigmoid_valid_30, sigmoid_ready_30;
wire [17:0] o_add2_30;
wire [17:0] o_sigmoid_30;
wire sigmoid_valid_31, sigmoid_ready_31;
wire [17:0] o_add2_31;
wire [17:0] o_sigmoid_31;
wire sigmoid_valid_32, sigmoid_ready_32;
wire [17:0] o_add2_32;
wire [17:0] o_sigmoid_32;
wire sigmoid_valid_33, sigmoid_ready_33;
wire [17:0] o_add2_33;
wire [17:0] o_sigmoid_33;
wire sigmoid_valid_34, sigmoid_ready_34;
wire [17:0] o_add2_34;
wire [17:0] o_sigmoid_34;
wire sigmoid_valid_35, sigmoid_ready_35;
wire [17:0] o_add2_35;
wire [17:0] o_sigmoid_35;
wire sigmoid_valid_36, sigmoid_ready_36;
wire [17:0] o_add2_36;
wire [17:0] o_sigmoid_36;
wire sigmoid_valid_37, sigmoid_ready_37;
wire [17:0] o_add2_37;
wire [17:0] o_sigmoid_37;
wire sigmoid_valid_38, sigmoid_ready_38;
wire [17:0] o_add2_38;
wire [17:0] o_sigmoid_38;
wire sigmoid_valid_39, sigmoid_ready_39;
wire [17:0] o_add2_39;
wire [17:0] o_sigmoid_39;
wire sigmoid_valid_40, sigmoid_ready_40;
wire [17:0] o_add2_40;
wire [17:0] o_sigmoid_40;
wire sigmoid_valid_41, sigmoid_ready_41;
wire [17:0] o_add2_41;
wire [17:0] o_sigmoid_41;
wire sigmoid_valid_42, sigmoid_ready_42;
wire [17:0] o_add2_42;
wire [17:0] o_sigmoid_42;
wire sigmoid_valid_43, sigmoid_ready_43;
wire [17:0] o_add2_43;
wire [17:0] o_sigmoid_43;
wire sigmoid_valid_44, sigmoid_ready_44;
wire [17:0] o_add2_44;
wire [17:0] o_sigmoid_44;
wire sigmoid_valid_45, sigmoid_ready_45;
wire [17:0] o_add2_45;
wire [17:0] o_sigmoid_45;
wire sigmoid_valid_46, sigmoid_ready_46;
wire [17:0] o_add2_46;
wire [17:0] o_sigmoid_46;
wire sigmoid_valid_47, sigmoid_ready_47;
wire [17:0] o_add2_47;
wire [17:0] o_sigmoid_47;
wire enable;
assign enable = i_ready;

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_inst (
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
	.i_A_16(stage1_result_16),
	.i_B_16(bias_16),
	.o_C_16(o_add2_16),
	.i_A_17(stage1_result_17),
	.i_B_17(bias_17),
	.o_C_17(o_add2_17),
	.i_A_18(stage1_result_18),
	.i_B_18(bias_18),
	.o_C_18(o_add2_18),
	.i_A_19(stage1_result_19),
	.i_B_19(bias_19),
	.o_C_19(o_add2_19),
	.i_A_20(stage1_result_20),
	.i_B_20(bias_20),
	.o_C_20(o_add2_20),
	.i_A_21(stage1_result_21),
	.i_B_21(bias_21),
	.o_C_21(o_add2_21),
	.i_A_22(stage1_result_22),
	.i_B_22(bias_22),
	.o_C_22(o_add2_22),
	.i_A_23(stage1_result_23),
	.i_B_23(bias_23),
	.o_C_23(o_add2_23),
	.i_A_24(stage1_result_24),
	.i_B_24(bias_24),
	.o_C_24(o_add2_24),
	.i_A_25(stage1_result_25),
	.i_B_25(bias_25),
	.o_C_25(o_add2_25),
	.i_A_26(stage1_result_26),
	.i_B_26(bias_26),
	.o_C_26(o_add2_26),
	.i_A_27(stage1_result_27),
	.i_B_27(bias_27),
	.o_C_27(o_add2_27),
	.i_A_28(stage1_result_28),
	.i_B_28(bias_28),
	.o_C_28(o_add2_28),
	.i_A_29(stage1_result_29),
	.i_B_29(bias_29),
	.o_C_29(o_add2_29),
	.i_A_30(stage1_result_30),
	.i_B_30(bias_30),
	.o_C_30(o_add2_30),
	.i_A_31(stage1_result_31),
	.i_B_31(bias_31),
	.o_C_31(o_add2_31),
	.i_A_32(stage1_result_32),
	.i_B_32(bias_32),
	.o_C_32(o_add2_32),
	.i_A_33(stage1_result_33),
	.i_B_33(bias_33),
	.o_C_33(o_add2_33),
	.i_A_34(stage1_result_34),
	.i_B_34(bias_34),
	.o_C_34(o_add2_34),
	.i_A_35(stage1_result_35),
	.i_B_35(bias_35),
	.o_C_35(o_add2_35),
	.i_A_36(stage1_result_36),
	.i_B_36(bias_36),
	.o_C_36(o_add2_36),
	.i_A_37(stage1_result_37),
	.i_B_37(bias_37),
	.o_C_37(o_add2_37),
	.i_A_38(stage1_result_38),
	.i_B_38(bias_38),
	.o_C_38(o_add2_38),
	.i_A_39(stage1_result_39),
	.i_B_39(bias_39),
	.o_C_39(o_add2_39),
	.i_A_40(stage1_result_40),
	.i_B_40(bias_40),
	.o_C_40(o_add2_40),
	.i_A_41(stage1_result_41),
	.i_B_41(bias_41),
	.o_C_41(o_add2_41),
	.i_A_42(stage1_result_42),
	.i_B_42(bias_42),
	.o_C_42(o_add2_42),
	.i_A_43(stage1_result_43),
	.i_B_43(bias_43),
	.o_C_43(o_add2_43),
	.i_A_44(stage1_result_44),
	.i_B_44(bias_44),
	.o_C_44(o_add2_44),
	.i_A_45(stage1_result_45),
	.i_B_45(bias_45),
	.o_C_45(o_add2_45),
	.i_A_46(stage1_result_46),
	.i_B_46(bias_46),
	.o_C_46(o_add2_46),
	.i_A_47(stage1_result_47),
	.i_B_47(bias_47),
	.o_C_47(o_add2_47),
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

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_16 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_16),
	.o_valid(sigmoid_valid_16),
	.i_x(o_add2_16),
	.o_y(o_sigmoid_16)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_17 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_17),
	.o_valid(sigmoid_valid_17),
	.i_x(o_add2_17),
	.o_y(o_sigmoid_17)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_18 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_18),
	.o_valid(sigmoid_valid_18),
	.i_x(o_add2_18),
	.o_y(o_sigmoid_18)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_19 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_19),
	.o_valid(sigmoid_valid_19),
	.i_x(o_add2_19),
	.o_y(o_sigmoid_19)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_20 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_20),
	.o_valid(sigmoid_valid_20),
	.i_x(o_add2_20),
	.o_y(o_sigmoid_20)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_21 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_21),
	.o_valid(sigmoid_valid_21),
	.i_x(o_add2_21),
	.o_y(o_sigmoid_21)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_22 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_22),
	.o_valid(sigmoid_valid_22),
	.i_x(o_add2_22),
	.o_y(o_sigmoid_22)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_23 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_23),
	.o_valid(sigmoid_valid_23),
	.i_x(o_add2_23),
	.o_y(o_sigmoid_23)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_24 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_24),
	.o_valid(sigmoid_valid_24),
	.i_x(o_add2_24),
	.o_y(o_sigmoid_24)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_25 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_25),
	.o_valid(sigmoid_valid_25),
	.i_x(o_add2_25),
	.o_y(o_sigmoid_25)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_26 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_26),
	.o_valid(sigmoid_valid_26),
	.i_x(o_add2_26),
	.o_y(o_sigmoid_26)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_27 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_27),
	.o_valid(sigmoid_valid_27),
	.i_x(o_add2_27),
	.o_y(o_sigmoid_27)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_28 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_28),
	.o_valid(sigmoid_valid_28),
	.i_x(o_add2_28),
	.o_y(o_sigmoid_28)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_29 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_29),
	.o_valid(sigmoid_valid_29),
	.i_x(o_add2_29),
	.o_y(o_sigmoid_29)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_30 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_30),
	.o_valid(sigmoid_valid_30),
	.i_x(o_add2_30),
	.o_y(o_sigmoid_30)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_31 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_31),
	.o_valid(sigmoid_valid_31),
	.i_x(o_add2_31),
	.o_y(o_sigmoid_31)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_32 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_32),
	.o_valid(sigmoid_valid_32),
	.i_x(o_add2_32),
	.o_y(o_sigmoid_32)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_33 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_33),
	.o_valid(sigmoid_valid_33),
	.i_x(o_add2_33),
	.o_y(o_sigmoid_33)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_34 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_34),
	.o_valid(sigmoid_valid_34),
	.i_x(o_add2_34),
	.o_y(o_sigmoid_34)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_35 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_35),
	.o_valid(sigmoid_valid_35),
	.i_x(o_add2_35),
	.o_y(o_sigmoid_35)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_36 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_36),
	.o_valid(sigmoid_valid_36),
	.i_x(o_add2_36),
	.o_y(o_sigmoid_36)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_37 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_37),
	.o_valid(sigmoid_valid_37),
	.i_x(o_add2_37),
	.o_y(o_sigmoid_37)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_38 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_38),
	.o_valid(sigmoid_valid_38),
	.i_x(o_add2_38),
	.o_y(o_sigmoid_38)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_39 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_39),
	.o_valid(sigmoid_valid_39),
	.i_x(o_add2_39),
	.o_y(o_sigmoid_39)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_40 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_40),
	.o_valid(sigmoid_valid_40),
	.i_x(o_add2_40),
	.o_y(o_sigmoid_40)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_41 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_41),
	.o_valid(sigmoid_valid_41),
	.i_x(o_add2_41),
	.o_y(o_sigmoid_41)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_42 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_42),
	.o_valid(sigmoid_valid_42),
	.i_x(o_add2_42),
	.o_y(o_sigmoid_42)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_43 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_43),
	.o_valid(sigmoid_valid_43),
	.i_x(o_add2_43),
	.o_y(o_sigmoid_43)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_44 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_44),
	.o_valid(sigmoid_valid_44),
	.i_x(o_add2_44),
	.o_y(o_sigmoid_44)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_45 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_45),
	.o_valid(sigmoid_valid_45),
	.i_x(o_add2_45),
	.o_y(o_sigmoid_45)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_46 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_46),
	.o_valid(sigmoid_valid_46),
	.i_x(o_add2_46),
	.o_y(o_sigmoid_46)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_47 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_47),
	.o_valid(sigmoid_valid_47),
	.i_x(o_add2_47),
	.o_y(o_sigmoid_47)
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
assign output_value_16 = o_sigmoid_16;
assign output_value_17 = o_sigmoid_17;
assign output_value_18 = o_sigmoid_18;
assign output_value_19 = o_sigmoid_19;
assign output_value_20 = o_sigmoid_20;
assign output_value_21 = o_sigmoid_21;
assign output_value_22 = o_sigmoid_22;
assign output_value_23 = o_sigmoid_23;
assign output_value_24 = o_sigmoid_24;
assign output_value_25 = o_sigmoid_25;
assign output_value_26 = o_sigmoid_26;
assign output_value_27 = o_sigmoid_27;
assign output_value_28 = o_sigmoid_28;
assign output_value_29 = o_sigmoid_29;
assign output_value_30 = o_sigmoid_30;
assign output_value_31 = o_sigmoid_31;
assign output_value_32 = o_sigmoid_32;
assign output_value_33 = o_sigmoid_33;
assign output_value_34 = o_sigmoid_34;
assign output_value_35 = o_sigmoid_35;
assign output_value_36 = o_sigmoid_36;
assign output_value_37 = o_sigmoid_37;
assign output_value_38 = o_sigmoid_38;
assign output_value_39 = o_sigmoid_39;
assign output_value_40 = o_sigmoid_40;
assign output_value_41 = o_sigmoid_41;
assign output_value_42 = o_sigmoid_42;
assign output_value_43 = o_sigmoid_43;
assign output_value_44 = o_sigmoid_44;
assign output_value_45 = o_sigmoid_45;
assign output_value_46 = o_sigmoid_46;
assign output_value_47 = o_sigmoid_47;

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
module lstm_gate_18_10_48_1 (
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
	input [17:0] stage1_result_16,
	input [17:0] weight_16,
	input [17:0] Ct_1_16,
	input [17:0] bias_16,
	output [17:0] gate_output_16,
	input [17:0] stage1_result_17,
	input [17:0] weight_17,
	input [17:0] Ct_1_17,
	input [17:0] bias_17,
	output [17:0] gate_output_17,
	input [17:0] stage1_result_18,
	input [17:0] weight_18,
	input [17:0] Ct_1_18,
	input [17:0] bias_18,
	output [17:0] gate_output_18,
	input [17:0] stage1_result_19,
	input [17:0] weight_19,
	input [17:0] Ct_1_19,
	input [17:0] bias_19,
	output [17:0] gate_output_19,
	input [17:0] stage1_result_20,
	input [17:0] weight_20,
	input [17:0] Ct_1_20,
	input [17:0] bias_20,
	output [17:0] gate_output_20,
	input [17:0] stage1_result_21,
	input [17:0] weight_21,
	input [17:0] Ct_1_21,
	input [17:0] bias_21,
	output [17:0] gate_output_21,
	input [17:0] stage1_result_22,
	input [17:0] weight_22,
	input [17:0] Ct_1_22,
	input [17:0] bias_22,
	output [17:0] gate_output_22,
	input [17:0] stage1_result_23,
	input [17:0] weight_23,
	input [17:0] Ct_1_23,
	input [17:0] bias_23,
	output [17:0] gate_output_23,
	input [17:0] stage1_result_24,
	input [17:0] weight_24,
	input [17:0] Ct_1_24,
	input [17:0] bias_24,
	output [17:0] gate_output_24,
	input [17:0] stage1_result_25,
	input [17:0] weight_25,
	input [17:0] Ct_1_25,
	input [17:0] bias_25,
	output [17:0] gate_output_25,
	input [17:0] stage1_result_26,
	input [17:0] weight_26,
	input [17:0] Ct_1_26,
	input [17:0] bias_26,
	output [17:0] gate_output_26,
	input [17:0] stage1_result_27,
	input [17:0] weight_27,
	input [17:0] Ct_1_27,
	input [17:0] bias_27,
	output [17:0] gate_output_27,
	input [17:0] stage1_result_28,
	input [17:0] weight_28,
	input [17:0] Ct_1_28,
	input [17:0] bias_28,
	output [17:0] gate_output_28,
	input [17:0] stage1_result_29,
	input [17:0] weight_29,
	input [17:0] Ct_1_29,
	input [17:0] bias_29,
	output [17:0] gate_output_29,
	input [17:0] stage1_result_30,
	input [17:0] weight_30,
	input [17:0] Ct_1_30,
	input [17:0] bias_30,
	output [17:0] gate_output_30,
	input [17:0] stage1_result_31,
	input [17:0] weight_31,
	input [17:0] Ct_1_31,
	input [17:0] bias_31,
	output [17:0] gate_output_31,
	input [17:0] stage1_result_32,
	input [17:0] weight_32,
	input [17:0] Ct_1_32,
	input [17:0] bias_32,
	output [17:0] gate_output_32,
	input [17:0] stage1_result_33,
	input [17:0] weight_33,
	input [17:0] Ct_1_33,
	input [17:0] bias_33,
	output [17:0] gate_output_33,
	input [17:0] stage1_result_34,
	input [17:0] weight_34,
	input [17:0] Ct_1_34,
	input [17:0] bias_34,
	output [17:0] gate_output_34,
	input [17:0] stage1_result_35,
	input [17:0] weight_35,
	input [17:0] Ct_1_35,
	input [17:0] bias_35,
	output [17:0] gate_output_35,
	input [17:0] stage1_result_36,
	input [17:0] weight_36,
	input [17:0] Ct_1_36,
	input [17:0] bias_36,
	output [17:0] gate_output_36,
	input [17:0] stage1_result_37,
	input [17:0] weight_37,
	input [17:0] Ct_1_37,
	input [17:0] bias_37,
	output [17:0] gate_output_37,
	input [17:0] stage1_result_38,
	input [17:0] weight_38,
	input [17:0] Ct_1_38,
	input [17:0] bias_38,
	output [17:0] gate_output_38,
	input [17:0] stage1_result_39,
	input [17:0] weight_39,
	input [17:0] Ct_1_39,
	input [17:0] bias_39,
	output [17:0] gate_output_39,
	input [17:0] stage1_result_40,
	input [17:0] weight_40,
	input [17:0] Ct_1_40,
	input [17:0] bias_40,
	output [17:0] gate_output_40,
	input [17:0] stage1_result_41,
	input [17:0] weight_41,
	input [17:0] Ct_1_41,
	input [17:0] bias_41,
	output [17:0] gate_output_41,
	input [17:0] stage1_result_42,
	input [17:0] weight_42,
	input [17:0] Ct_1_42,
	input [17:0] bias_42,
	output [17:0] gate_output_42,
	input [17:0] stage1_result_43,
	input [17:0] weight_43,
	input [17:0] Ct_1_43,
	input [17:0] bias_43,
	output [17:0] gate_output_43,
	input [17:0] stage1_result_44,
	input [17:0] weight_44,
	input [17:0] Ct_1_44,
	input [17:0] bias_44,
	output [17:0] gate_output_44,
	input [17:0] stage1_result_45,
	input [17:0] weight_45,
	input [17:0] Ct_1_45,
	input [17:0] bias_45,
	output [17:0] gate_output_45,
	input [17:0] stage1_result_46,
	input [17:0] weight_46,
	input [17:0] Ct_1_46,
	input [17:0] bias_46,
	output [17:0] gate_output_46,
	input [17:0] stage1_result_47,
	input [17:0] weight_47,
	input [17:0] Ct_1_47,
	input [17:0] bias_47,
	output [17:0] gate_output_47,
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
wire sigmoid_valid_16, sigmoid_ready_16;
wire [17:0] o_mult_16;
wire [17:0] o_add0_16;
wire [17:0] o_add1_16;
wire [17:0] add1_hold_16;
wire [17:0] o_add2_16;
wire [17:0] o_sigmoid_16;
wire sigmoid_valid_17, sigmoid_ready_17;
wire [17:0] o_mult_17;
wire [17:0] o_add0_17;
wire [17:0] o_add1_17;
wire [17:0] add1_hold_17;
wire [17:0] o_add2_17;
wire [17:0] o_sigmoid_17;
wire sigmoid_valid_18, sigmoid_ready_18;
wire [17:0] o_mult_18;
wire [17:0] o_add0_18;
wire [17:0] o_add1_18;
wire [17:0] add1_hold_18;
wire [17:0] o_add2_18;
wire [17:0] o_sigmoid_18;
wire sigmoid_valid_19, sigmoid_ready_19;
wire [17:0] o_mult_19;
wire [17:0] o_add0_19;
wire [17:0] o_add1_19;
wire [17:0] add1_hold_19;
wire [17:0] o_add2_19;
wire [17:0] o_sigmoid_19;
wire sigmoid_valid_20, sigmoid_ready_20;
wire [17:0] o_mult_20;
wire [17:0] o_add0_20;
wire [17:0] o_add1_20;
wire [17:0] add1_hold_20;
wire [17:0] o_add2_20;
wire [17:0] o_sigmoid_20;
wire sigmoid_valid_21, sigmoid_ready_21;
wire [17:0] o_mult_21;
wire [17:0] o_add0_21;
wire [17:0] o_add1_21;
wire [17:0] add1_hold_21;
wire [17:0] o_add2_21;
wire [17:0] o_sigmoid_21;
wire sigmoid_valid_22, sigmoid_ready_22;
wire [17:0] o_mult_22;
wire [17:0] o_add0_22;
wire [17:0] o_add1_22;
wire [17:0] add1_hold_22;
wire [17:0] o_add2_22;
wire [17:0] o_sigmoid_22;
wire sigmoid_valid_23, sigmoid_ready_23;
wire [17:0] o_mult_23;
wire [17:0] o_add0_23;
wire [17:0] o_add1_23;
wire [17:0] add1_hold_23;
wire [17:0] o_add2_23;
wire [17:0] o_sigmoid_23;
wire sigmoid_valid_24, sigmoid_ready_24;
wire [17:0] o_mult_24;
wire [17:0] o_add0_24;
wire [17:0] o_add1_24;
wire [17:0] add1_hold_24;
wire [17:0] o_add2_24;
wire [17:0] o_sigmoid_24;
wire sigmoid_valid_25, sigmoid_ready_25;
wire [17:0] o_mult_25;
wire [17:0] o_add0_25;
wire [17:0] o_add1_25;
wire [17:0] add1_hold_25;
wire [17:0] o_add2_25;
wire [17:0] o_sigmoid_25;
wire sigmoid_valid_26, sigmoid_ready_26;
wire [17:0] o_mult_26;
wire [17:0] o_add0_26;
wire [17:0] o_add1_26;
wire [17:0] add1_hold_26;
wire [17:0] o_add2_26;
wire [17:0] o_sigmoid_26;
wire sigmoid_valid_27, sigmoid_ready_27;
wire [17:0] o_mult_27;
wire [17:0] o_add0_27;
wire [17:0] o_add1_27;
wire [17:0] add1_hold_27;
wire [17:0] o_add2_27;
wire [17:0] o_sigmoid_27;
wire sigmoid_valid_28, sigmoid_ready_28;
wire [17:0] o_mult_28;
wire [17:0] o_add0_28;
wire [17:0] o_add1_28;
wire [17:0] add1_hold_28;
wire [17:0] o_add2_28;
wire [17:0] o_sigmoid_28;
wire sigmoid_valid_29, sigmoid_ready_29;
wire [17:0] o_mult_29;
wire [17:0] o_add0_29;
wire [17:0] o_add1_29;
wire [17:0] add1_hold_29;
wire [17:0] o_add2_29;
wire [17:0] o_sigmoid_29;
wire sigmoid_valid_30, sigmoid_ready_30;
wire [17:0] o_mult_30;
wire [17:0] o_add0_30;
wire [17:0] o_add1_30;
wire [17:0] add1_hold_30;
wire [17:0] o_add2_30;
wire [17:0] o_sigmoid_30;
wire sigmoid_valid_31, sigmoid_ready_31;
wire [17:0] o_mult_31;
wire [17:0] o_add0_31;
wire [17:0] o_add1_31;
wire [17:0] add1_hold_31;
wire [17:0] o_add2_31;
wire [17:0] o_sigmoid_31;
wire sigmoid_valid_32, sigmoid_ready_32;
wire [17:0] o_mult_32;
wire [17:0] o_add0_32;
wire [17:0] o_add1_32;
wire [17:0] add1_hold_32;
wire [17:0] o_add2_32;
wire [17:0] o_sigmoid_32;
wire sigmoid_valid_33, sigmoid_ready_33;
wire [17:0] o_mult_33;
wire [17:0] o_add0_33;
wire [17:0] o_add1_33;
wire [17:0] add1_hold_33;
wire [17:0] o_add2_33;
wire [17:0] o_sigmoid_33;
wire sigmoid_valid_34, sigmoid_ready_34;
wire [17:0] o_mult_34;
wire [17:0] o_add0_34;
wire [17:0] o_add1_34;
wire [17:0] add1_hold_34;
wire [17:0] o_add2_34;
wire [17:0] o_sigmoid_34;
wire sigmoid_valid_35, sigmoid_ready_35;
wire [17:0] o_mult_35;
wire [17:0] o_add0_35;
wire [17:0] o_add1_35;
wire [17:0] add1_hold_35;
wire [17:0] o_add2_35;
wire [17:0] o_sigmoid_35;
wire sigmoid_valid_36, sigmoid_ready_36;
wire [17:0] o_mult_36;
wire [17:0] o_add0_36;
wire [17:0] o_add1_36;
wire [17:0] add1_hold_36;
wire [17:0] o_add2_36;
wire [17:0] o_sigmoid_36;
wire sigmoid_valid_37, sigmoid_ready_37;
wire [17:0] o_mult_37;
wire [17:0] o_add0_37;
wire [17:0] o_add1_37;
wire [17:0] add1_hold_37;
wire [17:0] o_add2_37;
wire [17:0] o_sigmoid_37;
wire sigmoid_valid_38, sigmoid_ready_38;
wire [17:0] o_mult_38;
wire [17:0] o_add0_38;
wire [17:0] o_add1_38;
wire [17:0] add1_hold_38;
wire [17:0] o_add2_38;
wire [17:0] o_sigmoid_38;
wire sigmoid_valid_39, sigmoid_ready_39;
wire [17:0] o_mult_39;
wire [17:0] o_add0_39;
wire [17:0] o_add1_39;
wire [17:0] add1_hold_39;
wire [17:0] o_add2_39;
wire [17:0] o_sigmoid_39;
wire sigmoid_valid_40, sigmoid_ready_40;
wire [17:0] o_mult_40;
wire [17:0] o_add0_40;
wire [17:0] o_add1_40;
wire [17:0] add1_hold_40;
wire [17:0] o_add2_40;
wire [17:0] o_sigmoid_40;
wire sigmoid_valid_41, sigmoid_ready_41;
wire [17:0] o_mult_41;
wire [17:0] o_add0_41;
wire [17:0] o_add1_41;
wire [17:0] add1_hold_41;
wire [17:0] o_add2_41;
wire [17:0] o_sigmoid_41;
wire sigmoid_valid_42, sigmoid_ready_42;
wire [17:0] o_mult_42;
wire [17:0] o_add0_42;
wire [17:0] o_add1_42;
wire [17:0] add1_hold_42;
wire [17:0] o_add2_42;
wire [17:0] o_sigmoid_42;
wire sigmoid_valid_43, sigmoid_ready_43;
wire [17:0] o_mult_43;
wire [17:0] o_add0_43;
wire [17:0] o_add1_43;
wire [17:0] add1_hold_43;
wire [17:0] o_add2_43;
wire [17:0] o_sigmoid_43;
wire sigmoid_valid_44, sigmoid_ready_44;
wire [17:0] o_mult_44;
wire [17:0] o_add0_44;
wire [17:0] o_add1_44;
wire [17:0] add1_hold_44;
wire [17:0] o_add2_44;
wire [17:0] o_sigmoid_44;
wire sigmoid_valid_45, sigmoid_ready_45;
wire [17:0] o_mult_45;
wire [17:0] o_add0_45;
wire [17:0] o_add1_45;
wire [17:0] add1_hold_45;
wire [17:0] o_add2_45;
wire [17:0] o_sigmoid_45;
wire sigmoid_valid_46, sigmoid_ready_46;
wire [17:0] o_mult_46;
wire [17:0] o_add0_46;
wire [17:0] o_add1_46;
wire [17:0] add1_hold_46;
wire [17:0] o_add2_46;
wire [17:0] o_sigmoid_46;
wire sigmoid_valid_47, sigmoid_ready_47;
wire [17:0] o_mult_47;
wire [17:0] o_add0_47;
wire [17:0] o_add1_47;
wire [17:0] add1_hold_47;
wire [17:0] o_add2_47;
wire [17:0] o_sigmoid_47;
wire enable;
assign enable = i_ready;

elementwise_mult_core_18_18_10_48_1 elementwise_mult_core_18_18_10_48_1_mult (
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
	.i_A_16(weight_16),
	.i_B_16(Ct_1_16),
	.o_C_16(o_mult_16),
	.i_A_17(weight_17),
	.i_B_17(Ct_1_17),
	.o_C_17(o_mult_17),
	.i_A_18(weight_18),
	.i_B_18(Ct_1_18),
	.o_C_18(o_mult_18),
	.i_A_19(weight_19),
	.i_B_19(Ct_1_19),
	.o_C_19(o_mult_19),
	.i_A_20(weight_20),
	.i_B_20(Ct_1_20),
	.o_C_20(o_mult_20),
	.i_A_21(weight_21),
	.i_B_21(Ct_1_21),
	.o_C_21(o_mult_21),
	.i_A_22(weight_22),
	.i_B_22(Ct_1_22),
	.o_C_22(o_mult_22),
	.i_A_23(weight_23),
	.i_B_23(Ct_1_23),
	.o_C_23(o_mult_23),
	.i_A_24(weight_24),
	.i_B_24(Ct_1_24),
	.o_C_24(o_mult_24),
	.i_A_25(weight_25),
	.i_B_25(Ct_1_25),
	.o_C_25(o_mult_25),
	.i_A_26(weight_26),
	.i_B_26(Ct_1_26),
	.o_C_26(o_mult_26),
	.i_A_27(weight_27),
	.i_B_27(Ct_1_27),
	.o_C_27(o_mult_27),
	.i_A_28(weight_28),
	.i_B_28(Ct_1_28),
	.o_C_28(o_mult_28),
	.i_A_29(weight_29),
	.i_B_29(Ct_1_29),
	.o_C_29(o_mult_29),
	.i_A_30(weight_30),
	.i_B_30(Ct_1_30),
	.o_C_30(o_mult_30),
	.i_A_31(weight_31),
	.i_B_31(Ct_1_31),
	.o_C_31(o_mult_31),
	.i_A_32(weight_32),
	.i_B_32(Ct_1_32),
	.o_C_32(o_mult_32),
	.i_A_33(weight_33),
	.i_B_33(Ct_1_33),
	.o_C_33(o_mult_33),
	.i_A_34(weight_34),
	.i_B_34(Ct_1_34),
	.o_C_34(o_mult_34),
	.i_A_35(weight_35),
	.i_B_35(Ct_1_35),
	.o_C_35(o_mult_35),
	.i_A_36(weight_36),
	.i_B_36(Ct_1_36),
	.o_C_36(o_mult_36),
	.i_A_37(weight_37),
	.i_B_37(Ct_1_37),
	.o_C_37(o_mult_37),
	.i_A_38(weight_38),
	.i_B_38(Ct_1_38),
	.o_C_38(o_mult_38),
	.i_A_39(weight_39),
	.i_B_39(Ct_1_39),
	.o_C_39(o_mult_39),
	.i_A_40(weight_40),
	.i_B_40(Ct_1_40),
	.o_C_40(o_mult_40),
	.i_A_41(weight_41),
	.i_B_41(Ct_1_41),
	.o_C_41(o_mult_41),
	.i_A_42(weight_42),
	.i_B_42(Ct_1_42),
	.o_C_42(o_mult_42),
	.i_A_43(weight_43),
	.i_B_43(Ct_1_43),
	.o_C_43(o_mult_43),
	.i_A_44(weight_44),
	.i_B_44(Ct_1_44),
	.o_C_44(o_mult_44),
	.i_A_45(weight_45),
	.i_B_45(Ct_1_45),
	.o_C_45(o_mult_45),
	.i_A_46(weight_46),
	.i_B_46(Ct_1_46),
	.o_C_46(o_mult_46),
	.i_A_47(weight_47),
	.i_B_47(Ct_1_47),
	.o_C_47(o_mult_47),
	.o_valid(mult_valid),
	.o_ready(mult_ready)
);

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_add_1 (
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
	.i_A_16(stage1_result_16),
	.i_B_16(bias_16),
	.o_C_16(o_add1_16),
	.i_A_17(stage1_result_17),
	.i_B_17(bias_17),
	.o_C_17(o_add1_17),
	.i_A_18(stage1_result_18),
	.i_B_18(bias_18),
	.o_C_18(o_add1_18),
	.i_A_19(stage1_result_19),
	.i_B_19(bias_19),
	.o_C_19(o_add1_19),
	.i_A_20(stage1_result_20),
	.i_B_20(bias_20),
	.o_C_20(o_add1_20),
	.i_A_21(stage1_result_21),
	.i_B_21(bias_21),
	.o_C_21(o_add1_21),
	.i_A_22(stage1_result_22),
	.i_B_22(bias_22),
	.o_C_22(o_add1_22),
	.i_A_23(stage1_result_23),
	.i_B_23(bias_23),
	.o_C_23(o_add1_23),
	.i_A_24(stage1_result_24),
	.i_B_24(bias_24),
	.o_C_24(o_add1_24),
	.i_A_25(stage1_result_25),
	.i_B_25(bias_25),
	.o_C_25(o_add1_25),
	.i_A_26(stage1_result_26),
	.i_B_26(bias_26),
	.o_C_26(o_add1_26),
	.i_A_27(stage1_result_27),
	.i_B_27(bias_27),
	.o_C_27(o_add1_27),
	.i_A_28(stage1_result_28),
	.i_B_28(bias_28),
	.o_C_28(o_add1_28),
	.i_A_29(stage1_result_29),
	.i_B_29(bias_29),
	.o_C_29(o_add1_29),
	.i_A_30(stage1_result_30),
	.i_B_30(bias_30),
	.o_C_30(o_add1_30),
	.i_A_31(stage1_result_31),
	.i_B_31(bias_31),
	.o_C_31(o_add1_31),
	.i_A_32(stage1_result_32),
	.i_B_32(bias_32),
	.o_C_32(o_add1_32),
	.i_A_33(stage1_result_33),
	.i_B_33(bias_33),
	.o_C_33(o_add1_33),
	.i_A_34(stage1_result_34),
	.i_B_34(bias_34),
	.o_C_34(o_add1_34),
	.i_A_35(stage1_result_35),
	.i_B_35(bias_35),
	.o_C_35(o_add1_35),
	.i_A_36(stage1_result_36),
	.i_B_36(bias_36),
	.o_C_36(o_add1_36),
	.i_A_37(stage1_result_37),
	.i_B_37(bias_37),
	.o_C_37(o_add1_37),
	.i_A_38(stage1_result_38),
	.i_B_38(bias_38),
	.o_C_38(o_add1_38),
	.i_A_39(stage1_result_39),
	.i_B_39(bias_39),
	.o_C_39(o_add1_39),
	.i_A_40(stage1_result_40),
	.i_B_40(bias_40),
	.o_C_40(o_add1_40),
	.i_A_41(stage1_result_41),
	.i_B_41(bias_41),
	.o_C_41(o_add1_41),
	.i_A_42(stage1_result_42),
	.i_B_42(bias_42),
	.o_C_42(o_add1_42),
	.i_A_43(stage1_result_43),
	.i_B_43(bias_43),
	.o_C_43(o_add1_43),
	.i_A_44(stage1_result_44),
	.i_B_44(bias_44),
	.o_C_44(o_add1_44),
	.i_A_45(stage1_result_45),
	.i_B_45(bias_45),
	.o_C_45(o_add1_45),
	.i_A_46(stage1_result_46),
	.i_B_46(bias_46),
	.o_C_46(o_add1_46),
	.i_A_47(stage1_result_47),
	.i_B_47(bias_47),
	.o_C_47(o_add1_47),
	.o_valid(add1_valid),
	.o_ready(add1_ready)
);

shift_register_group_18_48_10 shift_register_group_18_48_10_Ct (
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
	.in_16(o_add1_16),
	.out_16(add1_hold_16),
	.in_17(o_add1_17),
	.out_17(add1_hold_17),
	.in_18(o_add1_18),
	.out_18(add1_hold_18),
	.in_19(o_add1_19),
	.out_19(add1_hold_19),
	.in_20(o_add1_20),
	.out_20(add1_hold_20),
	.in_21(o_add1_21),
	.out_21(add1_hold_21),
	.in_22(o_add1_22),
	.out_22(add1_hold_22),
	.in_23(o_add1_23),
	.out_23(add1_hold_23),
	.in_24(o_add1_24),
	.out_24(add1_hold_24),
	.in_25(o_add1_25),
	.out_25(add1_hold_25),
	.in_26(o_add1_26),
	.out_26(add1_hold_26),
	.in_27(o_add1_27),
	.out_27(add1_hold_27),
	.in_28(o_add1_28),
	.out_28(add1_hold_28),
	.in_29(o_add1_29),
	.out_29(add1_hold_29),
	.in_30(o_add1_30),
	.out_30(add1_hold_30),
	.in_31(o_add1_31),
	.out_31(add1_hold_31),
	.in_32(o_add1_32),
	.out_32(add1_hold_32),
	.in_33(o_add1_33),
	.out_33(add1_hold_33),
	.in_34(o_add1_34),
	.out_34(add1_hold_34),
	.in_35(o_add1_35),
	.out_35(add1_hold_35),
	.in_36(o_add1_36),
	.out_36(add1_hold_36),
	.in_37(o_add1_37),
	.out_37(add1_hold_37),
	.in_38(o_add1_38),
	.out_38(add1_hold_38),
	.in_39(o_add1_39),
	.out_39(add1_hold_39),
	.in_40(o_add1_40),
	.out_40(add1_hold_40),
	.in_41(o_add1_41),
	.out_41(add1_hold_41),
	.in_42(o_add1_42),
	.out_42(add1_hold_42),
	.in_43(o_add1_43),
	.out_43(add1_hold_43),
	.in_44(o_add1_44),
	.out_44(add1_hold_44),
	.in_45(o_add1_45),
	.out_45(add1_hold_45),
	.in_46(o_add1_46),
	.out_46(add1_hold_46),
	.in_47(o_add1_47),
	.out_47(add1_hold_47),
	.reset(reset)
);

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_add_2 (
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
	.i_A_16(add1_hold_16),
	.i_B_16(o_mult_16),
	.o_C_16(o_add2_16),
	.i_A_17(add1_hold_17),
	.i_B_17(o_mult_17),
	.o_C_17(o_add2_17),
	.i_A_18(add1_hold_18),
	.i_B_18(o_mult_18),
	.o_C_18(o_add2_18),
	.i_A_19(add1_hold_19),
	.i_B_19(o_mult_19),
	.o_C_19(o_add2_19),
	.i_A_20(add1_hold_20),
	.i_B_20(o_mult_20),
	.o_C_20(o_add2_20),
	.i_A_21(add1_hold_21),
	.i_B_21(o_mult_21),
	.o_C_21(o_add2_21),
	.i_A_22(add1_hold_22),
	.i_B_22(o_mult_22),
	.o_C_22(o_add2_22),
	.i_A_23(add1_hold_23),
	.i_B_23(o_mult_23),
	.o_C_23(o_add2_23),
	.i_A_24(add1_hold_24),
	.i_B_24(o_mult_24),
	.o_C_24(o_add2_24),
	.i_A_25(add1_hold_25),
	.i_B_25(o_mult_25),
	.o_C_25(o_add2_25),
	.i_A_26(add1_hold_26),
	.i_B_26(o_mult_26),
	.o_C_26(o_add2_26),
	.i_A_27(add1_hold_27),
	.i_B_27(o_mult_27),
	.o_C_27(o_add2_27),
	.i_A_28(add1_hold_28),
	.i_B_28(o_mult_28),
	.o_C_28(o_add2_28),
	.i_A_29(add1_hold_29),
	.i_B_29(o_mult_29),
	.o_C_29(o_add2_29),
	.i_A_30(add1_hold_30),
	.i_B_30(o_mult_30),
	.o_C_30(o_add2_30),
	.i_A_31(add1_hold_31),
	.i_B_31(o_mult_31),
	.o_C_31(o_add2_31),
	.i_A_32(add1_hold_32),
	.i_B_32(o_mult_32),
	.o_C_32(o_add2_32),
	.i_A_33(add1_hold_33),
	.i_B_33(o_mult_33),
	.o_C_33(o_add2_33),
	.i_A_34(add1_hold_34),
	.i_B_34(o_mult_34),
	.o_C_34(o_add2_34),
	.i_A_35(add1_hold_35),
	.i_B_35(o_mult_35),
	.o_C_35(o_add2_35),
	.i_A_36(add1_hold_36),
	.i_B_36(o_mult_36),
	.o_C_36(o_add2_36),
	.i_A_37(add1_hold_37),
	.i_B_37(o_mult_37),
	.o_C_37(o_add2_37),
	.i_A_38(add1_hold_38),
	.i_B_38(o_mult_38),
	.o_C_38(o_add2_38),
	.i_A_39(add1_hold_39),
	.i_B_39(o_mult_39),
	.o_C_39(o_add2_39),
	.i_A_40(add1_hold_40),
	.i_B_40(o_mult_40),
	.o_C_40(o_add2_40),
	.i_A_41(add1_hold_41),
	.i_B_41(o_mult_41),
	.o_C_41(o_add2_41),
	.i_A_42(add1_hold_42),
	.i_B_42(o_mult_42),
	.o_C_42(o_add2_42),
	.i_A_43(add1_hold_43),
	.i_B_43(o_mult_43),
	.o_C_43(o_add2_43),
	.i_A_44(add1_hold_44),
	.i_B_44(o_mult_44),
	.o_C_44(o_add2_44),
	.i_A_45(add1_hold_45),
	.i_B_45(o_mult_45),
	.o_C_45(o_add2_45),
	.i_A_46(add1_hold_46),
	.i_B_46(o_mult_46),
	.o_C_46(o_add2_46),
	.i_A_47(add1_hold_47),
	.i_B_47(o_mult_47),
	.o_C_47(o_add2_47),
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

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_16 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_16),
	.o_valid(sigmoid_valid_16),
	.i_x(o_add2_16),
	.o_y(o_sigmoid_16)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_17 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_17),
	.o_valid(sigmoid_valid_17),
	.i_x(o_add2_17),
	.o_y(o_sigmoid_17)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_18 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_18),
	.o_valid(sigmoid_valid_18),
	.i_x(o_add2_18),
	.o_y(o_sigmoid_18)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_19 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_19),
	.o_valid(sigmoid_valid_19),
	.i_x(o_add2_19),
	.o_y(o_sigmoid_19)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_20 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_20),
	.o_valid(sigmoid_valid_20),
	.i_x(o_add2_20),
	.o_y(o_sigmoid_20)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_21 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_21),
	.o_valid(sigmoid_valid_21),
	.i_x(o_add2_21),
	.o_y(o_sigmoid_21)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_22 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_22),
	.o_valid(sigmoid_valid_22),
	.i_x(o_add2_22),
	.o_y(o_sigmoid_22)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_23 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_23),
	.o_valid(sigmoid_valid_23),
	.i_x(o_add2_23),
	.o_y(o_sigmoid_23)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_24 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_24),
	.o_valid(sigmoid_valid_24),
	.i_x(o_add2_24),
	.o_y(o_sigmoid_24)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_25 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_25),
	.o_valid(sigmoid_valid_25),
	.i_x(o_add2_25),
	.o_y(o_sigmoid_25)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_26 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_26),
	.o_valid(sigmoid_valid_26),
	.i_x(o_add2_26),
	.o_y(o_sigmoid_26)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_27 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_27),
	.o_valid(sigmoid_valid_27),
	.i_x(o_add2_27),
	.o_y(o_sigmoid_27)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_28 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_28),
	.o_valid(sigmoid_valid_28),
	.i_x(o_add2_28),
	.o_y(o_sigmoid_28)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_29 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_29),
	.o_valid(sigmoid_valid_29),
	.i_x(o_add2_29),
	.o_y(o_sigmoid_29)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_30 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_30),
	.o_valid(sigmoid_valid_30),
	.i_x(o_add2_30),
	.o_y(o_sigmoid_30)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_31 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_31),
	.o_valid(sigmoid_valid_31),
	.i_x(o_add2_31),
	.o_y(o_sigmoid_31)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_32 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_32),
	.o_valid(sigmoid_valid_32),
	.i_x(o_add2_32),
	.o_y(o_sigmoid_32)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_33 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_33),
	.o_valid(sigmoid_valid_33),
	.i_x(o_add2_33),
	.o_y(o_sigmoid_33)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_34 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_34),
	.o_valid(sigmoid_valid_34),
	.i_x(o_add2_34),
	.o_y(o_sigmoid_34)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_35 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_35),
	.o_valid(sigmoid_valid_35),
	.i_x(o_add2_35),
	.o_y(o_sigmoid_35)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_36 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_36),
	.o_valid(sigmoid_valid_36),
	.i_x(o_add2_36),
	.o_y(o_sigmoid_36)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_37 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_37),
	.o_valid(sigmoid_valid_37),
	.i_x(o_add2_37),
	.o_y(o_sigmoid_37)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_38 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_38),
	.o_valid(sigmoid_valid_38),
	.i_x(o_add2_38),
	.o_y(o_sigmoid_38)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_39 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_39),
	.o_valid(sigmoid_valid_39),
	.i_x(o_add2_39),
	.o_y(o_sigmoid_39)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_40 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_40),
	.o_valid(sigmoid_valid_40),
	.i_x(o_add2_40),
	.o_y(o_sigmoid_40)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_41 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_41),
	.o_valid(sigmoid_valid_41),
	.i_x(o_add2_41),
	.o_y(o_sigmoid_41)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_42 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_42),
	.o_valid(sigmoid_valid_42),
	.i_x(o_add2_42),
	.o_y(o_sigmoid_42)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_43 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_43),
	.o_valid(sigmoid_valid_43),
	.i_x(o_add2_43),
	.o_y(o_sigmoid_43)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_44 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_44),
	.o_valid(sigmoid_valid_44),
	.i_x(o_add2_44),
	.o_y(o_sigmoid_44)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_45 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_45),
	.o_valid(sigmoid_valid_45),
	.i_x(o_add2_45),
	.o_y(o_sigmoid_45)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_46 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_46),
	.o_valid(sigmoid_valid_46),
	.i_x(o_add2_46),
	.o_y(o_sigmoid_46)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_47 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_47),
	.o_valid(sigmoid_valid_47),
	.i_x(o_add2_47),
	.o_y(o_sigmoid_47)
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
assign gate_output_16 = o_sigmoid_16;
assign gate_output_17 = o_sigmoid_17;
assign gate_output_18 = o_sigmoid_18;
assign gate_output_19 = o_sigmoid_19;
assign gate_output_20 = o_sigmoid_20;
assign gate_output_21 = o_sigmoid_21;
assign gate_output_22 = o_sigmoid_22;
assign gate_output_23 = o_sigmoid_23;
assign gate_output_24 = o_sigmoid_24;
assign gate_output_25 = o_sigmoid_25;
assign gate_output_26 = o_sigmoid_26;
assign gate_output_27 = o_sigmoid_27;
assign gate_output_28 = o_sigmoid_28;
assign gate_output_29 = o_sigmoid_29;
assign gate_output_30 = o_sigmoid_30;
assign gate_output_31 = o_sigmoid_31;
assign gate_output_32 = o_sigmoid_32;
assign gate_output_33 = o_sigmoid_33;
assign gate_output_34 = o_sigmoid_34;
assign gate_output_35 = o_sigmoid_35;
assign gate_output_36 = o_sigmoid_36;
assign gate_output_37 = o_sigmoid_37;
assign gate_output_38 = o_sigmoid_38;
assign gate_output_39 = o_sigmoid_39;
assign gate_output_40 = o_sigmoid_40;
assign gate_output_41 = o_sigmoid_41;
assign gate_output_42 = o_sigmoid_42;
assign gate_output_43 = o_sigmoid_43;
assign gate_output_44 = o_sigmoid_44;
assign gate_output_45 = o_sigmoid_45;
assign gate_output_46 = o_sigmoid_46;
assign gate_output_47 = o_sigmoid_47;

endmodule
module shift_register_group_18_48_10 (
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
	input [17:0] in_16,
	output [17:0] out_16,
	input [17:0] in_17,
	output [17:0] out_17,
	input [17:0] in_18,
	output [17:0] out_18,
	input [17:0] in_19,
	output [17:0] out_19,
	input [17:0] in_20,
	output [17:0] out_20,
	input [17:0] in_21,
	output [17:0] out_21,
	input [17:0] in_22,
	output [17:0] out_22,
	input [17:0] in_23,
	output [17:0] out_23,
	input [17:0] in_24,
	output [17:0] out_24,
	input [17:0] in_25,
	output [17:0] out_25,
	input [17:0] in_26,
	output [17:0] out_26,
	input [17:0] in_27,
	output [17:0] out_27,
	input [17:0] in_28,
	output [17:0] out_28,
	input [17:0] in_29,
	output [17:0] out_29,
	input [17:0] in_30,
	output [17:0] out_30,
	input [17:0] in_31,
	output [17:0] out_31,
	input [17:0] in_32,
	output [17:0] out_32,
	input [17:0] in_33,
	output [17:0] out_33,
	input [17:0] in_34,
	output [17:0] out_34,
	input [17:0] in_35,
	output [17:0] out_35,
	input [17:0] in_36,
	output [17:0] out_36,
	input [17:0] in_37,
	output [17:0] out_37,
	input [17:0] in_38,
	output [17:0] out_38,
	input [17:0] in_39,
	output [17:0] out_39,
	input [17:0] in_40,
	output [17:0] out_40,
	input [17:0] in_41,
	output [17:0] out_41,
	input [17:0] in_42,
	output [17:0] out_42,
	input [17:0] in_43,
	output [17:0] out_43,
	input [17:0] in_44,
	output [17:0] out_44,
	input [17:0] in_45,
	output [17:0] out_45,
	input [17:0] in_46,
	output [17:0] out_46,
	input [17:0] in_47,
	output [17:0] out_47,
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

shift_register_unit_18_18 shift_register_unit_18_18_inst_16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_16),
	.out(out_16)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_17),
	.out(out_17)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_18),
	.out(out_18)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_19),
	.out(out_19)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_20),
	.out(out_20)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_21),
	.out(out_21)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_22),
	.out(out_22)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_23),
	.out(out_23)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_24),
	.out(out_24)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_25),
	.out(out_25)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_26),
	.out(out_26)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_27),
	.out(out_27)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_28),
	.out(out_28)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_29),
	.out(out_29)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_30),
	.out(out_30)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_31),
	.out(out_31)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_32),
	.out(out_32)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_33),
	.out(out_33)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_34),
	.out(out_34)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_35),
	.out(out_35)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_36),
	.out(out_36)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_37),
	.out(out_37)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_38),
	.out(out_38)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_39),
	.out(out_39)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_40),
	.out(out_40)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_41),
	.out(out_41)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_42),
	.out(out_42)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_43),
	.out(out_43)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_44),
	.out(out_44)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_45),
	.out(out_45)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_46),
	.out(out_46)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_47),
	.out(out_47)
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






