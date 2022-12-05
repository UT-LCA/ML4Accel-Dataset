`define SIMULATION_MEMORY

module stage2_parameter_buffer_18_3_16_64 (
	input clk,
	input reset,
	output [17:0] o_Wic_0,
	output [17:0] o_bi_0,
	output [17:0] o_Wfc_0,
	output [17:0] o_bf_0,
	output [17:0] o_Woc_0,
	output [17:0] o_bo_0,
	output [17:0] o_bc_0,
	output [17:0] o_Wic_1,
	output [17:0] o_bi_1,
	output [17:0] o_Wfc_1,
	output [17:0] o_bf_1,
	output [17:0] o_Woc_1,
	output [17:0] o_bo_1,
	output [17:0] o_bc_1,
	output [17:0] o_Wic_2,
	output [17:0] o_bi_2,
	output [17:0] o_Wfc_2,
	output [17:0] o_bf_2,
	output [17:0] o_Woc_2,
	output [17:0] o_bo_2,
	output [17:0] o_bc_2,
	output [17:0] o_Wic_3,
	output [17:0] o_bi_3,
	output [17:0] o_Wfc_3,
	output [17:0] o_bf_3,
	output [17:0] o_Woc_3,
	output [17:0] o_bo_3,
	output [17:0] o_bc_3,
	output [17:0] o_Wic_4,
	output [17:0] o_bi_4,
	output [17:0] o_Wfc_4,
	output [17:0] o_bf_4,
	output [17:0] o_Woc_4,
	output [17:0] o_bo_4,
	output [17:0] o_bc_4,
	output [17:0] o_Wic_5,
	output [17:0] o_bi_5,
	output [17:0] o_Wfc_5,
	output [17:0] o_bf_5,
	output [17:0] o_Woc_5,
	output [17:0] o_bo_5,
	output [17:0] o_bc_5,
	output [17:0] o_Wic_6,
	output [17:0] o_bi_6,
	output [17:0] o_Wfc_6,
	output [17:0] o_bf_6,
	output [17:0] o_Woc_6,
	output [17:0] o_bo_6,
	output [17:0] o_bc_6,
	output [17:0] o_Wic_7,
	output [17:0] o_bi_7,
	output [17:0] o_Wfc_7,
	output [17:0] o_bf_7,
	output [17:0] o_Woc_7,
	output [17:0] o_bo_7,
	output [17:0] o_bc_7,
	output [17:0] o_Wic_8,
	output [17:0] o_bi_8,
	output [17:0] o_Wfc_8,
	output [17:0] o_bf_8,
	output [17:0] o_Woc_8,
	output [17:0] o_bo_8,
	output [17:0] o_bc_8,
	output [17:0] o_Wic_9,
	output [17:0] o_bi_9,
	output [17:0] o_Wfc_9,
	output [17:0] o_bf_9,
	output [17:0] o_Woc_9,
	output [17:0] o_bo_9,
	output [17:0] o_bc_9,
	output [17:0] o_Wic_10,
	output [17:0] o_bi_10,
	output [17:0] o_Wfc_10,
	output [17:0] o_bf_10,
	output [17:0] o_Woc_10,
	output [17:0] o_bo_10,
	output [17:0] o_bc_10,
	output [17:0] o_Wic_11,
	output [17:0] o_bi_11,
	output [17:0] o_Wfc_11,
	output [17:0] o_bf_11,
	output [17:0] o_Woc_11,
	output [17:0] o_bo_11,
	output [17:0] o_bc_11,
	output [17:0] o_Wic_12,
	output [17:0] o_bi_12,
	output [17:0] o_Wfc_12,
	output [17:0] o_bf_12,
	output [17:0] o_Woc_12,
	output [17:0] o_bo_12,
	output [17:0] o_bc_12,
	output [17:0] o_Wic_13,
	output [17:0] o_bi_13,
	output [17:0] o_Wfc_13,
	output [17:0] o_bf_13,
	output [17:0] o_Woc_13,
	output [17:0] o_bo_13,
	output [17:0] o_bc_13,
	output [17:0] o_Wic_14,
	output [17:0] o_bi_14,
	output [17:0] o_Wfc_14,
	output [17:0] o_bf_14,
	output [17:0] o_Woc_14,
	output [17:0] o_bo_14,
	output [17:0] o_bc_14,
	output [17:0] o_Wic_15,
	output [17:0] o_bi_15,
	output [17:0] o_Wfc_15,
	output [17:0] o_bf_15,
	output [17:0] o_Woc_15,
	output [17:0] o_bo_15,
	output [17:0] o_bc_15,
	output [17:0] o_Wic_16,
	output [17:0] o_bi_16,
	output [17:0] o_Wfc_16,
	output [17:0] o_bf_16,
	output [17:0] o_Woc_16,
	output [17:0] o_bo_16,
	output [17:0] o_bc_16,
	output [17:0] o_Wic_17,
	output [17:0] o_bi_17,
	output [17:0] o_Wfc_17,
	output [17:0] o_bf_17,
	output [17:0] o_Woc_17,
	output [17:0] o_bo_17,
	output [17:0] o_bc_17,
	output [17:0] o_Wic_18,
	output [17:0] o_bi_18,
	output [17:0] o_Wfc_18,
	output [17:0] o_bf_18,
	output [17:0] o_Woc_18,
	output [17:0] o_bo_18,
	output [17:0] o_bc_18,
	output [17:0] o_Wic_19,
	output [17:0] o_bi_19,
	output [17:0] o_Wfc_19,
	output [17:0] o_bf_19,
	output [17:0] o_Woc_19,
	output [17:0] o_bo_19,
	output [17:0] o_bc_19,
	output [17:0] o_Wic_20,
	output [17:0] o_bi_20,
	output [17:0] o_Wfc_20,
	output [17:0] o_bf_20,
	output [17:0] o_Woc_20,
	output [17:0] o_bo_20,
	output [17:0] o_bc_20,
	output [17:0] o_Wic_21,
	output [17:0] o_bi_21,
	output [17:0] o_Wfc_21,
	output [17:0] o_bf_21,
	output [17:0] o_Woc_21,
	output [17:0] o_bo_21,
	output [17:0] o_bc_21,
	output [17:0] o_Wic_22,
	output [17:0] o_bi_22,
	output [17:0] o_Wfc_22,
	output [17:0] o_bf_22,
	output [17:0] o_Woc_22,
	output [17:0] o_bo_22,
	output [17:0] o_bc_22,
	output [17:0] o_Wic_23,
	output [17:0] o_bi_23,
	output [17:0] o_Wfc_23,
	output [17:0] o_bf_23,
	output [17:0] o_Woc_23,
	output [17:0] o_bo_23,
	output [17:0] o_bc_23,
	output [17:0] o_Wic_24,
	output [17:0] o_bi_24,
	output [17:0] o_Wfc_24,
	output [17:0] o_bf_24,
	output [17:0] o_Woc_24,
	output [17:0] o_bo_24,
	output [17:0] o_bc_24,
	output [17:0] o_Wic_25,
	output [17:0] o_bi_25,
	output [17:0] o_Wfc_25,
	output [17:0] o_bf_25,
	output [17:0] o_Woc_25,
	output [17:0] o_bo_25,
	output [17:0] o_bc_25,
	output [17:0] o_Wic_26,
	output [17:0] o_bi_26,
	output [17:0] o_Wfc_26,
	output [17:0] o_bf_26,
	output [17:0] o_Woc_26,
	output [17:0] o_bo_26,
	output [17:0] o_bc_26,
	output [17:0] o_Wic_27,
	output [17:0] o_bi_27,
	output [17:0] o_Wfc_27,
	output [17:0] o_bf_27,
	output [17:0] o_Woc_27,
	output [17:0] o_bo_27,
	output [17:0] o_bc_27,
	output [17:0] o_Wic_28,
	output [17:0] o_bi_28,
	output [17:0] o_Wfc_28,
	output [17:0] o_bf_28,
	output [17:0] o_Woc_28,
	output [17:0] o_bo_28,
	output [17:0] o_bc_28,
	output [17:0] o_Wic_29,
	output [17:0] o_bi_29,
	output [17:0] o_Wfc_29,
	output [17:0] o_bf_29,
	output [17:0] o_Woc_29,
	output [17:0] o_bo_29,
	output [17:0] o_bc_29,
	output [17:0] o_Wic_30,
	output [17:0] o_bi_30,
	output [17:0] o_Wfc_30,
	output [17:0] o_bf_30,
	output [17:0] o_Woc_30,
	output [17:0] o_bo_30,
	output [17:0] o_bc_30,
	output [17:0] o_Wic_31,
	output [17:0] o_bi_31,
	output [17:0] o_Wfc_31,
	output [17:0] o_bf_31,
	output [17:0] o_Woc_31,
	output [17:0] o_bo_31,
	output [17:0] o_bc_31,
	output [17:0] o_Wic_32,
	output [17:0] o_bi_32,
	output [17:0] o_Wfc_32,
	output [17:0] o_bf_32,
	output [17:0] o_Woc_32,
	output [17:0] o_bo_32,
	output [17:0] o_bc_32,
	output [17:0] o_Wic_33,
	output [17:0] o_bi_33,
	output [17:0] o_Wfc_33,
	output [17:0] o_bf_33,
	output [17:0] o_Woc_33,
	output [17:0] o_bo_33,
	output [17:0] o_bc_33,
	output [17:0] o_Wic_34,
	output [17:0] o_bi_34,
	output [17:0] o_Wfc_34,
	output [17:0] o_bf_34,
	output [17:0] o_Woc_34,
	output [17:0] o_bo_34,
	output [17:0] o_bc_34,
	output [17:0] o_Wic_35,
	output [17:0] o_bi_35,
	output [17:0] o_Wfc_35,
	output [17:0] o_bf_35,
	output [17:0] o_Woc_35,
	output [17:0] o_bo_35,
	output [17:0] o_bc_35,
	output [17:0] o_Wic_36,
	output [17:0] o_bi_36,
	output [17:0] o_Wfc_36,
	output [17:0] o_bf_36,
	output [17:0] o_Woc_36,
	output [17:0] o_bo_36,
	output [17:0] o_bc_36,
	output [17:0] o_Wic_37,
	output [17:0] o_bi_37,
	output [17:0] o_Wfc_37,
	output [17:0] o_bf_37,
	output [17:0] o_Woc_37,
	output [17:0] o_bo_37,
	output [17:0] o_bc_37,
	output [17:0] o_Wic_38,
	output [17:0] o_bi_38,
	output [17:0] o_Wfc_38,
	output [17:0] o_bf_38,
	output [17:0] o_Woc_38,
	output [17:0] o_bo_38,
	output [17:0] o_bc_38,
	output [17:0] o_Wic_39,
	output [17:0] o_bi_39,
	output [17:0] o_Wfc_39,
	output [17:0] o_bf_39,
	output [17:0] o_Woc_39,
	output [17:0] o_bo_39,
	output [17:0] o_bc_39,
	output [17:0] o_Wic_40,
	output [17:0] o_bi_40,
	output [17:0] o_Wfc_40,
	output [17:0] o_bf_40,
	output [17:0] o_Woc_40,
	output [17:0] o_bo_40,
	output [17:0] o_bc_40,
	output [17:0] o_Wic_41,
	output [17:0] o_bi_41,
	output [17:0] o_Wfc_41,
	output [17:0] o_bf_41,
	output [17:0] o_Woc_41,
	output [17:0] o_bo_41,
	output [17:0] o_bc_41,
	output [17:0] o_Wic_42,
	output [17:0] o_bi_42,
	output [17:0] o_Wfc_42,
	output [17:0] o_bf_42,
	output [17:0] o_Woc_42,
	output [17:0] o_bo_42,
	output [17:0] o_bc_42,
	output [17:0] o_Wic_43,
	output [17:0] o_bi_43,
	output [17:0] o_Wfc_43,
	output [17:0] o_bf_43,
	output [17:0] o_Woc_43,
	output [17:0] o_bo_43,
	output [17:0] o_bc_43,
	output [17:0] o_Wic_44,
	output [17:0] o_bi_44,
	output [17:0] o_Wfc_44,
	output [17:0] o_bf_44,
	output [17:0] o_Woc_44,
	output [17:0] o_bo_44,
	output [17:0] o_bc_44,
	output [17:0] o_Wic_45,
	output [17:0] o_bi_45,
	output [17:0] o_Wfc_45,
	output [17:0] o_bf_45,
	output [17:0] o_Woc_45,
	output [17:0] o_bo_45,
	output [17:0] o_bc_45,
	output [17:0] o_Wic_46,
	output [17:0] o_bi_46,
	output [17:0] o_Wfc_46,
	output [17:0] o_bf_46,
	output [17:0] o_Woc_46,
	output [17:0] o_bo_46,
	output [17:0] o_bc_46,
	output [17:0] o_Wic_47,
	output [17:0] o_bi_47,
	output [17:0] o_Wfc_47,
	output [17:0] o_bf_47,
	output [17:0] o_Woc_47,
	output [17:0] o_bo_47,
	output [17:0] o_bc_47,
	input incr_index
);

wire [17:0] Wic_0_0;
wire [17:0] bi_0_0;
wire [17:0] Wfc_0_0;
wire [17:0] bf_0_0;
wire [17:0] Woc_0_0;
wire [17:0] bo_0_0;
wire [17:0] bc_0_0;
wire [17:0] Wic_0_1;
wire [17:0] bi_0_1;
wire [17:0] Wfc_0_1;
wire [17:0] bf_0_1;
wire [17:0] Woc_0_1;
wire [17:0] bo_0_1;
wire [17:0] bc_0_1;
wire [17:0] Wic_0_2;
wire [17:0] bi_0_2;
wire [17:0] Wfc_0_2;
wire [17:0] bf_0_2;
wire [17:0] Woc_0_2;
wire [17:0] bo_0_2;
wire [17:0] bc_0_2;
wire [17:0] Wic_0_3;
wire [17:0] bi_0_3;
wire [17:0] Wfc_0_3;
wire [17:0] bf_0_3;
wire [17:0] Woc_0_3;
wire [17:0] bo_0_3;
wire [17:0] bc_0_3;
wire [17:0] Wic_0_4;
wire [17:0] bi_0_4;
wire [17:0] Wfc_0_4;
wire [17:0] bf_0_4;
wire [17:0] Woc_0_4;
wire [17:0] bo_0_4;
wire [17:0] bc_0_4;
wire [17:0] Wic_0_5;
wire [17:0] bi_0_5;
wire [17:0] Wfc_0_5;
wire [17:0] bf_0_5;
wire [17:0] Woc_0_5;
wire [17:0] bo_0_5;
wire [17:0] bc_0_5;
wire [17:0] Wic_0_6;
wire [17:0] bi_0_6;
wire [17:0] Wfc_0_6;
wire [17:0] bf_0_6;
wire [17:0] Woc_0_6;
wire [17:0] bo_0_6;
wire [17:0] bc_0_6;
wire [17:0] Wic_0_7;
wire [17:0] bi_0_7;
wire [17:0] Wfc_0_7;
wire [17:0] bf_0_7;
wire [17:0] Woc_0_7;
wire [17:0] bo_0_7;
wire [17:0] bc_0_7;
wire [17:0] Wic_0_8;
wire [17:0] bi_0_8;
wire [17:0] Wfc_0_8;
wire [17:0] bf_0_8;
wire [17:0] Woc_0_8;
wire [17:0] bo_0_8;
wire [17:0] bc_0_8;
wire [17:0] Wic_0_9;
wire [17:0] bi_0_9;
wire [17:0] Wfc_0_9;
wire [17:0] bf_0_9;
wire [17:0] Woc_0_9;
wire [17:0] bo_0_9;
wire [17:0] bc_0_9;
wire [17:0] Wic_0_10;
wire [17:0] bi_0_10;
wire [17:0] Wfc_0_10;
wire [17:0] bf_0_10;
wire [17:0] Woc_0_10;
wire [17:0] bo_0_10;
wire [17:0] bc_0_10;
wire [17:0] Wic_0_11;
wire [17:0] bi_0_11;
wire [17:0] Wfc_0_11;
wire [17:0] bf_0_11;
wire [17:0] Woc_0_11;
wire [17:0] bo_0_11;
wire [17:0] bc_0_11;
wire [17:0] Wic_0_12;
wire [17:0] bi_0_12;
wire [17:0] Wfc_0_12;
wire [17:0] bf_0_12;
wire [17:0] Woc_0_12;
wire [17:0] bo_0_12;
wire [17:0] bc_0_12;
wire [17:0] Wic_0_13;
wire [17:0] bi_0_13;
wire [17:0] Wfc_0_13;
wire [17:0] bf_0_13;
wire [17:0] Woc_0_13;
wire [17:0] bo_0_13;
wire [17:0] bc_0_13;
wire [17:0] Wic_0_14;
wire [17:0] bi_0_14;
wire [17:0] Wfc_0_14;
wire [17:0] bf_0_14;
wire [17:0] Woc_0_14;
wire [17:0] bo_0_14;
wire [17:0] bc_0_14;
wire [17:0] Wic_0_15;
wire [17:0] bi_0_15;
wire [17:0] Wfc_0_15;
wire [17:0] bf_0_15;
wire [17:0] Woc_0_15;
wire [17:0] bo_0_15;
wire [17:0] bc_0_15;
wire [17:0] Wic_1_0;
wire [17:0] bi_1_0;
wire [17:0] Wfc_1_0;
wire [17:0] bf_1_0;
wire [17:0] Woc_1_0;
wire [17:0] bo_1_0;
wire [17:0] bc_1_0;
wire [17:0] Wic_1_1;
wire [17:0] bi_1_1;
wire [17:0] Wfc_1_1;
wire [17:0] bf_1_1;
wire [17:0] Woc_1_1;
wire [17:0] bo_1_1;
wire [17:0] bc_1_1;
wire [17:0] Wic_1_2;
wire [17:0] bi_1_2;
wire [17:0] Wfc_1_2;
wire [17:0] bf_1_2;
wire [17:0] Woc_1_2;
wire [17:0] bo_1_2;
wire [17:0] bc_1_2;
wire [17:0] Wic_1_3;
wire [17:0] bi_1_3;
wire [17:0] Wfc_1_3;
wire [17:0] bf_1_3;
wire [17:0] Woc_1_3;
wire [17:0] bo_1_3;
wire [17:0] bc_1_3;
wire [17:0] Wic_1_4;
wire [17:0] bi_1_4;
wire [17:0] Wfc_1_4;
wire [17:0] bf_1_4;
wire [17:0] Woc_1_4;
wire [17:0] bo_1_4;
wire [17:0] bc_1_4;
wire [17:0] Wic_1_5;
wire [17:0] bi_1_5;
wire [17:0] Wfc_1_5;
wire [17:0] bf_1_5;
wire [17:0] Woc_1_5;
wire [17:0] bo_1_5;
wire [17:0] bc_1_5;
wire [17:0] Wic_1_6;
wire [17:0] bi_1_6;
wire [17:0] Wfc_1_6;
wire [17:0] bf_1_6;
wire [17:0] Woc_1_6;
wire [17:0] bo_1_6;
wire [17:0] bc_1_6;
wire [17:0] Wic_1_7;
wire [17:0] bi_1_7;
wire [17:0] Wfc_1_7;
wire [17:0] bf_1_7;
wire [17:0] Woc_1_7;
wire [17:0] bo_1_7;
wire [17:0] bc_1_7;
wire [17:0] Wic_1_8;
wire [17:0] bi_1_8;
wire [17:0] Wfc_1_8;
wire [17:0] bf_1_8;
wire [17:0] Woc_1_8;
wire [17:0] bo_1_8;
wire [17:0] bc_1_8;
wire [17:0] Wic_1_9;
wire [17:0] bi_1_9;
wire [17:0] Wfc_1_9;
wire [17:0] bf_1_9;
wire [17:0] Woc_1_9;
wire [17:0] bo_1_9;
wire [17:0] bc_1_9;
wire [17:0] Wic_1_10;
wire [17:0] bi_1_10;
wire [17:0] Wfc_1_10;
wire [17:0] bf_1_10;
wire [17:0] Woc_1_10;
wire [17:0] bo_1_10;
wire [17:0] bc_1_10;
wire [17:0] Wic_1_11;
wire [17:0] bi_1_11;
wire [17:0] Wfc_1_11;
wire [17:0] bf_1_11;
wire [17:0] Woc_1_11;
wire [17:0] bo_1_11;
wire [17:0] bc_1_11;
wire [17:0] Wic_1_12;
wire [17:0] bi_1_12;
wire [17:0] Wfc_1_12;
wire [17:0] bf_1_12;
wire [17:0] Woc_1_12;
wire [17:0] bo_1_12;
wire [17:0] bc_1_12;
wire [17:0] Wic_1_13;
wire [17:0] bi_1_13;
wire [17:0] Wfc_1_13;
wire [17:0] bf_1_13;
wire [17:0] Woc_1_13;
wire [17:0] bo_1_13;
wire [17:0] bc_1_13;
wire [17:0] Wic_1_14;
wire [17:0] bi_1_14;
wire [17:0] Wfc_1_14;
wire [17:0] bf_1_14;
wire [17:0] Woc_1_14;
wire [17:0] bo_1_14;
wire [17:0] bc_1_14;
wire [17:0] Wic_1_15;
wire [17:0] bi_1_15;
wire [17:0] Wfc_1_15;
wire [17:0] bf_1_15;
wire [17:0] Woc_1_15;
wire [17:0] bo_1_15;
wire [17:0] bc_1_15;
wire [17:0] Wic_2_0;
wire [17:0] bi_2_0;
wire [17:0] Wfc_2_0;
wire [17:0] bf_2_0;
wire [17:0] Woc_2_0;
wire [17:0] bo_2_0;
wire [17:0] bc_2_0;
wire [17:0] Wic_2_1;
wire [17:0] bi_2_1;
wire [17:0] Wfc_2_1;
wire [17:0] bf_2_1;
wire [17:0] Woc_2_1;
wire [17:0] bo_2_1;
wire [17:0] bc_2_1;
wire [17:0] Wic_2_2;
wire [17:0] bi_2_2;
wire [17:0] Wfc_2_2;
wire [17:0] bf_2_2;
wire [17:0] Woc_2_2;
wire [17:0] bo_2_2;
wire [17:0] bc_2_2;
wire [17:0] Wic_2_3;
wire [17:0] bi_2_3;
wire [17:0] Wfc_2_3;
wire [17:0] bf_2_3;
wire [17:0] Woc_2_3;
wire [17:0] bo_2_3;
wire [17:0] bc_2_3;
wire [17:0] Wic_2_4;
wire [17:0] bi_2_4;
wire [17:0] Wfc_2_4;
wire [17:0] bf_2_4;
wire [17:0] Woc_2_4;
wire [17:0] bo_2_4;
wire [17:0] bc_2_4;
wire [17:0] Wic_2_5;
wire [17:0] bi_2_5;
wire [17:0] Wfc_2_5;
wire [17:0] bf_2_5;
wire [17:0] Woc_2_5;
wire [17:0] bo_2_5;
wire [17:0] bc_2_5;
wire [17:0] Wic_2_6;
wire [17:0] bi_2_6;
wire [17:0] Wfc_2_6;
wire [17:0] bf_2_6;
wire [17:0] Woc_2_6;
wire [17:0] bo_2_6;
wire [17:0] bc_2_6;
wire [17:0] Wic_2_7;
wire [17:0] bi_2_7;
wire [17:0] Wfc_2_7;
wire [17:0] bf_2_7;
wire [17:0] Woc_2_7;
wire [17:0] bo_2_7;
wire [17:0] bc_2_7;
wire [17:0] Wic_2_8;
wire [17:0] bi_2_8;
wire [17:0] Wfc_2_8;
wire [17:0] bf_2_8;
wire [17:0] Woc_2_8;
wire [17:0] bo_2_8;
wire [17:0] bc_2_8;
wire [17:0] Wic_2_9;
wire [17:0] bi_2_9;
wire [17:0] Wfc_2_9;
wire [17:0] bf_2_9;
wire [17:0] Woc_2_9;
wire [17:0] bo_2_9;
wire [17:0] bc_2_9;
wire [17:0] Wic_2_10;
wire [17:0] bi_2_10;
wire [17:0] Wfc_2_10;
wire [17:0] bf_2_10;
wire [17:0] Woc_2_10;
wire [17:0] bo_2_10;
wire [17:0] bc_2_10;
wire [17:0] Wic_2_11;
wire [17:0] bi_2_11;
wire [17:0] Wfc_2_11;
wire [17:0] bf_2_11;
wire [17:0] Woc_2_11;
wire [17:0] bo_2_11;
wire [17:0] bc_2_11;
wire [17:0] Wic_2_12;
wire [17:0] bi_2_12;
wire [17:0] Wfc_2_12;
wire [17:0] bf_2_12;
wire [17:0] Woc_2_12;
wire [17:0] bo_2_12;
wire [17:0] bc_2_12;
wire [17:0] Wic_2_13;
wire [17:0] bi_2_13;
wire [17:0] Wfc_2_13;
wire [17:0] bf_2_13;
wire [17:0] Woc_2_13;
wire [17:0] bo_2_13;
wire [17:0] bc_2_13;
wire [17:0] Wic_2_14;
wire [17:0] bi_2_14;
wire [17:0] Wfc_2_14;
wire [17:0] bf_2_14;
wire [17:0] Woc_2_14;
wire [17:0] bo_2_14;
wire [17:0] bc_2_14;
wire [17:0] Wic_2_15;
wire [17:0] bi_2_15;
wire [17:0] Wfc_2_15;
wire [17:0] bf_2_15;
wire [17:0] Woc_2_15;
wire [17:0] bo_2_15;
wire [17:0] bc_2_15;

wire [13:0] input_index_counter;
counter_63_3 counter_63_3_inst (
	.clk(clk),
	.reset(reset),
	.ena(incr_index),
	.count(input_index_counter)
);

weight_buffer_18_16_3_64_Wic_0 weight_buffer_18_16_3_64_Wic_0_inst (
	.clk(clk),
	.q_0_0(Wic_0_0),
	.q_0_1(Wic_0_1),
	.q_0_2(Wic_0_2),
	.q_0_3(Wic_0_3),
	.q_0_4(Wic_0_4),
	.q_0_5(Wic_0_5),
	.q_0_6(Wic_0_6),
	.q_0_7(Wic_0_7),
	.q_0_8(Wic_0_8),
	.q_0_9(Wic_0_9),
	.q_0_10(Wic_0_10),
	.q_0_11(Wic_0_11),
	.q_0_12(Wic_0_12),
	.q_0_13(Wic_0_13),
	.q_0_14(Wic_0_14),
	.q_0_15(Wic_0_15),
	.q_1_0(Wic_1_0),
	.q_1_1(Wic_1_1),
	.q_1_2(Wic_1_2),
	.q_1_3(Wic_1_3),
	.q_1_4(Wic_1_4),
	.q_1_5(Wic_1_5),
	.q_1_6(Wic_1_6),
	.q_1_7(Wic_1_7),
	.q_1_8(Wic_1_8),
	.q_1_9(Wic_1_9),
	.q_1_10(Wic_1_10),
	.q_1_11(Wic_1_11),
	.q_1_12(Wic_1_12),
	.q_1_13(Wic_1_13),
	.q_1_14(Wic_1_14),
	.q_1_15(Wic_1_15),
	.q_2_0(Wic_2_0),
	.q_2_1(Wic_2_1),
	.q_2_2(Wic_2_2),
	.q_2_3(Wic_2_3),
	.q_2_4(Wic_2_4),
	.q_2_5(Wic_2_5),
	.q_2_6(Wic_2_6),
	.q_2_7(Wic_2_7),
	.q_2_8(Wic_2_8),
	.q_2_9(Wic_2_9),
	.q_2_10(Wic_2_10),
	.q_2_11(Wic_2_11),
	.q_2_12(Wic_2_12),
	.q_2_13(Wic_2_13),
	.q_2_14(Wic_2_14),
	.q_2_15(Wic_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_bi_0 weight_buffer_18_16_3_64_bi_0_inst (
	.clk(clk),
	.q_0_0(bi_0_0),
	.q_0_1(bi_0_1),
	.q_0_2(bi_0_2),
	.q_0_3(bi_0_3),
	.q_0_4(bi_0_4),
	.q_0_5(bi_0_5),
	.q_0_6(bi_0_6),
	.q_0_7(bi_0_7),
	.q_0_8(bi_0_8),
	.q_0_9(bi_0_9),
	.q_0_10(bi_0_10),
	.q_0_11(bi_0_11),
	.q_0_12(bi_0_12),
	.q_0_13(bi_0_13),
	.q_0_14(bi_0_14),
	.q_0_15(bi_0_15),
	.q_1_0(bi_1_0),
	.q_1_1(bi_1_1),
	.q_1_2(bi_1_2),
	.q_1_3(bi_1_3),
	.q_1_4(bi_1_4),
	.q_1_5(bi_1_5),
	.q_1_6(bi_1_6),
	.q_1_7(bi_1_7),
	.q_1_8(bi_1_8),
	.q_1_9(bi_1_9),
	.q_1_10(bi_1_10),
	.q_1_11(bi_1_11),
	.q_1_12(bi_1_12),
	.q_1_13(bi_1_13),
	.q_1_14(bi_1_14),
	.q_1_15(bi_1_15),
	.q_2_0(bi_2_0),
	.q_2_1(bi_2_1),
	.q_2_2(bi_2_2),
	.q_2_3(bi_2_3),
	.q_2_4(bi_2_4),
	.q_2_5(bi_2_5),
	.q_2_6(bi_2_6),
	.q_2_7(bi_2_7),
	.q_2_8(bi_2_8),
	.q_2_9(bi_2_9),
	.q_2_10(bi_2_10),
	.q_2_11(bi_2_11),
	.q_2_12(bi_2_12),
	.q_2_13(bi_2_13),
	.q_2_14(bi_2_14),
	.q_2_15(bi_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_Wfc_0 weight_buffer_18_16_3_64_Wfc_0_inst (
	.clk(clk),
	.q_0_0(Wfc_0_0),
	.q_0_1(Wfc_0_1),
	.q_0_2(Wfc_0_2),
	.q_0_3(Wfc_0_3),
	.q_0_4(Wfc_0_4),
	.q_0_5(Wfc_0_5),
	.q_0_6(Wfc_0_6),
	.q_0_7(Wfc_0_7),
	.q_0_8(Wfc_0_8),
	.q_0_9(Wfc_0_9),
	.q_0_10(Wfc_0_10),
	.q_0_11(Wfc_0_11),
	.q_0_12(Wfc_0_12),
	.q_0_13(Wfc_0_13),
	.q_0_14(Wfc_0_14),
	.q_0_15(Wfc_0_15),
	.q_1_0(Wfc_1_0),
	.q_1_1(Wfc_1_1),
	.q_1_2(Wfc_1_2),
	.q_1_3(Wfc_1_3),
	.q_1_4(Wfc_1_4),
	.q_1_5(Wfc_1_5),
	.q_1_6(Wfc_1_6),
	.q_1_7(Wfc_1_7),
	.q_1_8(Wfc_1_8),
	.q_1_9(Wfc_1_9),
	.q_1_10(Wfc_1_10),
	.q_1_11(Wfc_1_11),
	.q_1_12(Wfc_1_12),
	.q_1_13(Wfc_1_13),
	.q_1_14(Wfc_1_14),
	.q_1_15(Wfc_1_15),
	.q_2_0(Wfc_2_0),
	.q_2_1(Wfc_2_1),
	.q_2_2(Wfc_2_2),
	.q_2_3(Wfc_2_3),
	.q_2_4(Wfc_2_4),
	.q_2_5(Wfc_2_5),
	.q_2_6(Wfc_2_6),
	.q_2_7(Wfc_2_7),
	.q_2_8(Wfc_2_8),
	.q_2_9(Wfc_2_9),
	.q_2_10(Wfc_2_10),
	.q_2_11(Wfc_2_11),
	.q_2_12(Wfc_2_12),
	.q_2_13(Wfc_2_13),
	.q_2_14(Wfc_2_14),
	.q_2_15(Wfc_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_bf_0 weight_buffer_18_16_3_64_bf_0_inst (
	.clk(clk),
	.q_0_0(bf_0_0),
	.q_0_1(bf_0_1),
	.q_0_2(bf_0_2),
	.q_0_3(bf_0_3),
	.q_0_4(bf_0_4),
	.q_0_5(bf_0_5),
	.q_0_6(bf_0_6),
	.q_0_7(bf_0_7),
	.q_0_8(bf_0_8),
	.q_0_9(bf_0_9),
	.q_0_10(bf_0_10),
	.q_0_11(bf_0_11),
	.q_0_12(bf_0_12),
	.q_0_13(bf_0_13),
	.q_0_14(bf_0_14),
	.q_0_15(bf_0_15),
	.q_1_0(bf_1_0),
	.q_1_1(bf_1_1),
	.q_1_2(bf_1_2),
	.q_1_3(bf_1_3),
	.q_1_4(bf_1_4),
	.q_1_5(bf_1_5),
	.q_1_6(bf_1_6),
	.q_1_7(bf_1_7),
	.q_1_8(bf_1_8),
	.q_1_9(bf_1_9),
	.q_1_10(bf_1_10),
	.q_1_11(bf_1_11),
	.q_1_12(bf_1_12),
	.q_1_13(bf_1_13),
	.q_1_14(bf_1_14),
	.q_1_15(bf_1_15),
	.q_2_0(bf_2_0),
	.q_2_1(bf_2_1),
	.q_2_2(bf_2_2),
	.q_2_3(bf_2_3),
	.q_2_4(bf_2_4),
	.q_2_5(bf_2_5),
	.q_2_6(bf_2_6),
	.q_2_7(bf_2_7),
	.q_2_8(bf_2_8),
	.q_2_9(bf_2_9),
	.q_2_10(bf_2_10),
	.q_2_11(bf_2_11),
	.q_2_12(bf_2_12),
	.q_2_13(bf_2_13),
	.q_2_14(bf_2_14),
	.q_2_15(bf_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_Woc_0 weight_buffer_18_16_3_64_Woc_0_inst (
	.clk(clk),
	.q_0_0(Woc_0_0),
	.q_0_1(Woc_0_1),
	.q_0_2(Woc_0_2),
	.q_0_3(Woc_0_3),
	.q_0_4(Woc_0_4),
	.q_0_5(Woc_0_5),
	.q_0_6(Woc_0_6),
	.q_0_7(Woc_0_7),
	.q_0_8(Woc_0_8),
	.q_0_9(Woc_0_9),
	.q_0_10(Woc_0_10),
	.q_0_11(Woc_0_11),
	.q_0_12(Woc_0_12),
	.q_0_13(Woc_0_13),
	.q_0_14(Woc_0_14),
	.q_0_15(Woc_0_15),
	.q_1_0(Woc_1_0),
	.q_1_1(Woc_1_1),
	.q_1_2(Woc_1_2),
	.q_1_3(Woc_1_3),
	.q_1_4(Woc_1_4),
	.q_1_5(Woc_1_5),
	.q_1_6(Woc_1_6),
	.q_1_7(Woc_1_7),
	.q_1_8(Woc_1_8),
	.q_1_9(Woc_1_9),
	.q_1_10(Woc_1_10),
	.q_1_11(Woc_1_11),
	.q_1_12(Woc_1_12),
	.q_1_13(Woc_1_13),
	.q_1_14(Woc_1_14),
	.q_1_15(Woc_1_15),
	.q_2_0(Woc_2_0),
	.q_2_1(Woc_2_1),
	.q_2_2(Woc_2_2),
	.q_2_3(Woc_2_3),
	.q_2_4(Woc_2_4),
	.q_2_5(Woc_2_5),
	.q_2_6(Woc_2_6),
	.q_2_7(Woc_2_7),
	.q_2_8(Woc_2_8),
	.q_2_9(Woc_2_9),
	.q_2_10(Woc_2_10),
	.q_2_11(Woc_2_11),
	.q_2_12(Woc_2_12),
	.q_2_13(Woc_2_13),
	.q_2_14(Woc_2_14),
	.q_2_15(Woc_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_bo_0 weight_buffer_18_16_3_64_bo_0_inst (
	.clk(clk),
	.q_0_0(bo_0_0),
	.q_0_1(bo_0_1),
	.q_0_2(bo_0_2),
	.q_0_3(bo_0_3),
	.q_0_4(bo_0_4),
	.q_0_5(bo_0_5),
	.q_0_6(bo_0_6),
	.q_0_7(bo_0_7),
	.q_0_8(bo_0_8),
	.q_0_9(bo_0_9),
	.q_0_10(bo_0_10),
	.q_0_11(bo_0_11),
	.q_0_12(bo_0_12),
	.q_0_13(bo_0_13),
	.q_0_14(bo_0_14),
	.q_0_15(bo_0_15),
	.q_1_0(bo_1_0),
	.q_1_1(bo_1_1),
	.q_1_2(bo_1_2),
	.q_1_3(bo_1_3),
	.q_1_4(bo_1_4),
	.q_1_5(bo_1_5),
	.q_1_6(bo_1_6),
	.q_1_7(bo_1_7),
	.q_1_8(bo_1_8),
	.q_1_9(bo_1_9),
	.q_1_10(bo_1_10),
	.q_1_11(bo_1_11),
	.q_1_12(bo_1_12),
	.q_1_13(bo_1_13),
	.q_1_14(bo_1_14),
	.q_1_15(bo_1_15),
	.q_2_0(bo_2_0),
	.q_2_1(bo_2_1),
	.q_2_2(bo_2_2),
	.q_2_3(bo_2_3),
	.q_2_4(bo_2_4),
	.q_2_5(bo_2_5),
	.q_2_6(bo_2_6),
	.q_2_7(bo_2_7),
	.q_2_8(bo_2_8),
	.q_2_9(bo_2_9),
	.q_2_10(bo_2_10),
	.q_2_11(bo_2_11),
	.q_2_12(bo_2_12),
	.q_2_13(bo_2_13),
	.q_2_14(bo_2_14),
	.q_2_15(bo_2_15),
	.index(input_index_counter)
);

weight_buffer_18_16_3_64_bc_0 weight_buffer_18_16_3_64_bc_0_inst (
	.clk(clk),
	.q_0_0(bc_0_0),
	.q_0_1(bc_0_1),
	.q_0_2(bc_0_2),
	.q_0_3(bc_0_3),
	.q_0_4(bc_0_4),
	.q_0_5(bc_0_5),
	.q_0_6(bc_0_6),
	.q_0_7(bc_0_7),
	.q_0_8(bc_0_8),
	.q_0_9(bc_0_9),
	.q_0_10(bc_0_10),
	.q_0_11(bc_0_11),
	.q_0_12(bc_0_12),
	.q_0_13(bc_0_13),
	.q_0_14(bc_0_14),
	.q_0_15(bc_0_15),
	.q_1_0(bc_1_0),
	.q_1_1(bc_1_1),
	.q_1_2(bc_1_2),
	.q_1_3(bc_1_3),
	.q_1_4(bc_1_4),
	.q_1_5(bc_1_5),
	.q_1_6(bc_1_6),
	.q_1_7(bc_1_7),
	.q_1_8(bc_1_8),
	.q_1_9(bc_1_9),
	.q_1_10(bc_1_10),
	.q_1_11(bc_1_11),
	.q_1_12(bc_1_12),
	.q_1_13(bc_1_13),
	.q_1_14(bc_1_14),
	.q_1_15(bc_1_15),
	.q_2_0(bc_2_0),
	.q_2_1(bc_2_1),
	.q_2_2(bc_2_2),
	.q_2_3(bc_2_3),
	.q_2_4(bc_2_4),
	.q_2_5(bc_2_5),
	.q_2_6(bc_2_6),
	.q_2_7(bc_2_7),
	.q_2_8(bc_2_8),
	.q_2_9(bc_2_9),
	.q_2_10(bc_2_10),
	.q_2_11(bc_2_11),
	.q_2_12(bc_2_12),
	.q_2_13(bc_2_13),
	.q_2_14(bc_2_14),
	.q_2_15(bc_2_15),
	.index(input_index_counter)
);

assign o_Wic_0 = Wic_0_0;
assign o_bi_0 = bi_0_0;
assign o_Wfc_0 = Wfc_0_0;
assign o_bf_0 = bf_0_0;
assign o_Woc_0 = Woc_0_0;
assign o_bo_0 = bo_0_0;
assign o_bc_0 = bc_0_0;
assign o_Wic_1 = Wic_0_1;
assign o_bi_1 = bi_0_1;
assign o_Wfc_1 = Wfc_0_1;
assign o_bf_1 = bf_0_1;
assign o_Woc_1 = Woc_0_1;
assign o_bo_1 = bo_0_1;
assign o_bc_1 = bc_0_1;
assign o_Wic_2 = Wic_0_2;
assign o_bi_2 = bi_0_2;
assign o_Wfc_2 = Wfc_0_2;
assign o_bf_2 = bf_0_2;
assign o_Woc_2 = Woc_0_2;
assign o_bo_2 = bo_0_2;
assign o_bc_2 = bc_0_2;
assign o_Wic_3 = Wic_0_3;
assign o_bi_3 = bi_0_3;
assign o_Wfc_3 = Wfc_0_3;
assign o_bf_3 = bf_0_3;
assign o_Woc_3 = Woc_0_3;
assign o_bo_3 = bo_0_3;
assign o_bc_3 = bc_0_3;
assign o_Wic_4 = Wic_0_4;
assign o_bi_4 = bi_0_4;
assign o_Wfc_4 = Wfc_0_4;
assign o_bf_4 = bf_0_4;
assign o_Woc_4 = Woc_0_4;
assign o_bo_4 = bo_0_4;
assign o_bc_4 = bc_0_4;
assign o_Wic_5 = Wic_0_5;
assign o_bi_5 = bi_0_5;
assign o_Wfc_5 = Wfc_0_5;
assign o_bf_5 = bf_0_5;
assign o_Woc_5 = Woc_0_5;
assign o_bo_5 = bo_0_5;
assign o_bc_5 = bc_0_5;
assign o_Wic_6 = Wic_0_6;
assign o_bi_6 = bi_0_6;
assign o_Wfc_6 = Wfc_0_6;
assign o_bf_6 = bf_0_6;
assign o_Woc_6 = Woc_0_6;
assign o_bo_6 = bo_0_6;
assign o_bc_6 = bc_0_6;
assign o_Wic_7 = Wic_0_7;
assign o_bi_7 = bi_0_7;
assign o_Wfc_7 = Wfc_0_7;
assign o_bf_7 = bf_0_7;
assign o_Woc_7 = Woc_0_7;
assign o_bo_7 = bo_0_7;
assign o_bc_7 = bc_0_7;
assign o_Wic_8 = Wic_0_8;
assign o_bi_8 = bi_0_8;
assign o_Wfc_8 = Wfc_0_8;
assign o_bf_8 = bf_0_8;
assign o_Woc_8 = Woc_0_8;
assign o_bo_8 = bo_0_8;
assign o_bc_8 = bc_0_8;
assign o_Wic_9 = Wic_0_9;
assign o_bi_9 = bi_0_9;
assign o_Wfc_9 = Wfc_0_9;
assign o_bf_9 = bf_0_9;
assign o_Woc_9 = Woc_0_9;
assign o_bo_9 = bo_0_9;
assign o_bc_9 = bc_0_9;
assign o_Wic_10 = Wic_0_10;
assign o_bi_10 = bi_0_10;
assign o_Wfc_10 = Wfc_0_10;
assign o_bf_10 = bf_0_10;
assign o_Woc_10 = Woc_0_10;
assign o_bo_10 = bo_0_10;
assign o_bc_10 = bc_0_10;
assign o_Wic_11 = Wic_0_11;
assign o_bi_11 = bi_0_11;
assign o_Wfc_11 = Wfc_0_11;
assign o_bf_11 = bf_0_11;
assign o_Woc_11 = Woc_0_11;
assign o_bo_11 = bo_0_11;
assign o_bc_11 = bc_0_11;
assign o_Wic_12 = Wic_0_12;
assign o_bi_12 = bi_0_12;
assign o_Wfc_12 = Wfc_0_12;
assign o_bf_12 = bf_0_12;
assign o_Woc_12 = Woc_0_12;
assign o_bo_12 = bo_0_12;
assign o_bc_12 = bc_0_12;
assign o_Wic_13 = Wic_0_13;
assign o_bi_13 = bi_0_13;
assign o_Wfc_13 = Wfc_0_13;
assign o_bf_13 = bf_0_13;
assign o_Woc_13 = Woc_0_13;
assign o_bo_13 = bo_0_13;
assign o_bc_13 = bc_0_13;
assign o_Wic_14 = Wic_0_14;
assign o_bi_14 = bi_0_14;
assign o_Wfc_14 = Wfc_0_14;
assign o_bf_14 = bf_0_14;
assign o_Woc_14 = Woc_0_14;
assign o_bo_14 = bo_0_14;
assign o_bc_14 = bc_0_14;
assign o_Wic_15 = Wic_0_15;
assign o_bi_15 = bi_0_15;
assign o_Wfc_15 = Wfc_0_15;
assign o_bf_15 = bf_0_15;
assign o_Woc_15 = Woc_0_15;
assign o_bo_15 = bo_0_15;
assign o_bc_15 = bc_0_15;
assign o_Wic_16 = Wic_1_0;
assign o_bi_16 = bi_1_0;
assign o_Wfc_16 = Wfc_1_0;
assign o_bf_16 = bf_1_0;
assign o_Woc_16 = Woc_1_0;
assign o_bo_16 = bo_1_0;
assign o_bc_16 = bc_1_0;
assign o_Wic_17 = Wic_1_1;
assign o_bi_17 = bi_1_1;
assign o_Wfc_17 = Wfc_1_1;
assign o_bf_17 = bf_1_1;
assign o_Woc_17 = Woc_1_1;
assign o_bo_17 = bo_1_1;
assign o_bc_17 = bc_1_1;
assign o_Wic_18 = Wic_1_2;
assign o_bi_18 = bi_1_2;
assign o_Wfc_18 = Wfc_1_2;
assign o_bf_18 = bf_1_2;
assign o_Woc_18 = Woc_1_2;
assign o_bo_18 = bo_1_2;
assign o_bc_18 = bc_1_2;
assign o_Wic_19 = Wic_1_3;
assign o_bi_19 = bi_1_3;
assign o_Wfc_19 = Wfc_1_3;
assign o_bf_19 = bf_1_3;
assign o_Woc_19 = Woc_1_3;
assign o_bo_19 = bo_1_3;
assign o_bc_19 = bc_1_3;
assign o_Wic_20 = Wic_1_4;
assign o_bi_20 = bi_1_4;
assign o_Wfc_20 = Wfc_1_4;
assign o_bf_20 = bf_1_4;
assign o_Woc_20 = Woc_1_4;
assign o_bo_20 = bo_1_4;
assign o_bc_20 = bc_1_4;
assign o_Wic_21 = Wic_1_5;
assign o_bi_21 = bi_1_5;
assign o_Wfc_21 = Wfc_1_5;
assign o_bf_21 = bf_1_5;
assign o_Woc_21 = Woc_1_5;
assign o_bo_21 = bo_1_5;
assign o_bc_21 = bc_1_5;
assign o_Wic_22 = Wic_1_6;
assign o_bi_22 = bi_1_6;
assign o_Wfc_22 = Wfc_1_6;
assign o_bf_22 = bf_1_6;
assign o_Woc_22 = Woc_1_6;
assign o_bo_22 = bo_1_6;
assign o_bc_22 = bc_1_6;
assign o_Wic_23 = Wic_1_7;
assign o_bi_23 = bi_1_7;
assign o_Wfc_23 = Wfc_1_7;
assign o_bf_23 = bf_1_7;
assign o_Woc_23 = Woc_1_7;
assign o_bo_23 = bo_1_7;
assign o_bc_23 = bc_1_7;
assign o_Wic_24 = Wic_1_8;
assign o_bi_24 = bi_1_8;
assign o_Wfc_24 = Wfc_1_8;
assign o_bf_24 = bf_1_8;
assign o_Woc_24 = Woc_1_8;
assign o_bo_24 = bo_1_8;
assign o_bc_24 = bc_1_8;
assign o_Wic_25 = Wic_1_9;
assign o_bi_25 = bi_1_9;
assign o_Wfc_25 = Wfc_1_9;
assign o_bf_25 = bf_1_9;
assign o_Woc_25 = Woc_1_9;
assign o_bo_25 = bo_1_9;
assign o_bc_25 = bc_1_9;
assign o_Wic_26 = Wic_1_10;
assign o_bi_26 = bi_1_10;
assign o_Wfc_26 = Wfc_1_10;
assign o_bf_26 = bf_1_10;
assign o_Woc_26 = Woc_1_10;
assign o_bo_26 = bo_1_10;
assign o_bc_26 = bc_1_10;
assign o_Wic_27 = Wic_1_11;
assign o_bi_27 = bi_1_11;
assign o_Wfc_27 = Wfc_1_11;
assign o_bf_27 = bf_1_11;
assign o_Woc_27 = Woc_1_11;
assign o_bo_27 = bo_1_11;
assign o_bc_27 = bc_1_11;
assign o_Wic_28 = Wic_1_12;
assign o_bi_28 = bi_1_12;
assign o_Wfc_28 = Wfc_1_12;
assign o_bf_28 = bf_1_12;
assign o_Woc_28 = Woc_1_12;
assign o_bo_28 = bo_1_12;
assign o_bc_28 = bc_1_12;
assign o_Wic_29 = Wic_1_13;
assign o_bi_29 = bi_1_13;
assign o_Wfc_29 = Wfc_1_13;
assign o_bf_29 = bf_1_13;
assign o_Woc_29 = Woc_1_13;
assign o_bo_29 = bo_1_13;
assign o_bc_29 = bc_1_13;
assign o_Wic_30 = Wic_1_14;
assign o_bi_30 = bi_1_14;
assign o_Wfc_30 = Wfc_1_14;
assign o_bf_30 = bf_1_14;
assign o_Woc_30 = Woc_1_14;
assign o_bo_30 = bo_1_14;
assign o_bc_30 = bc_1_14;
assign o_Wic_31 = Wic_1_15;
assign o_bi_31 = bi_1_15;
assign o_Wfc_31 = Wfc_1_15;
assign o_bf_31 = bf_1_15;
assign o_Woc_31 = Woc_1_15;
assign o_bo_31 = bo_1_15;
assign o_bc_31 = bc_1_15;
assign o_Wic_32 = Wic_2_0;
assign o_bi_32 = bi_2_0;
assign o_Wfc_32 = Wfc_2_0;
assign o_bf_32 = bf_2_0;
assign o_Woc_32 = Woc_2_0;
assign o_bo_32 = bo_2_0;
assign o_bc_32 = bc_2_0;
assign o_Wic_33 = Wic_2_1;
assign o_bi_33 = bi_2_1;
assign o_Wfc_33 = Wfc_2_1;
assign o_bf_33 = bf_2_1;
assign o_Woc_33 = Woc_2_1;
assign o_bo_33 = bo_2_1;
assign o_bc_33 = bc_2_1;
assign o_Wic_34 = Wic_2_2;
assign o_bi_34 = bi_2_2;
assign o_Wfc_34 = Wfc_2_2;
assign o_bf_34 = bf_2_2;
assign o_Woc_34 = Woc_2_2;
assign o_bo_34 = bo_2_2;
assign o_bc_34 = bc_2_2;
assign o_Wic_35 = Wic_2_3;
assign o_bi_35 = bi_2_3;
assign o_Wfc_35 = Wfc_2_3;
assign o_bf_35 = bf_2_3;
assign o_Woc_35 = Woc_2_3;
assign o_bo_35 = bo_2_3;
assign o_bc_35 = bc_2_3;
assign o_Wic_36 = Wic_2_4;
assign o_bi_36 = bi_2_4;
assign o_Wfc_36 = Wfc_2_4;
assign o_bf_36 = bf_2_4;
assign o_Woc_36 = Woc_2_4;
assign o_bo_36 = bo_2_4;
assign o_bc_36 = bc_2_4;
assign o_Wic_37 = Wic_2_5;
assign o_bi_37 = bi_2_5;
assign o_Wfc_37 = Wfc_2_5;
assign o_bf_37 = bf_2_5;
assign o_Woc_37 = Woc_2_5;
assign o_bo_37 = bo_2_5;
assign o_bc_37 = bc_2_5;
assign o_Wic_38 = Wic_2_6;
assign o_bi_38 = bi_2_6;
assign o_Wfc_38 = Wfc_2_6;
assign o_bf_38 = bf_2_6;
assign o_Woc_38 = Woc_2_6;
assign o_bo_38 = bo_2_6;
assign o_bc_38 = bc_2_6;
assign o_Wic_39 = Wic_2_7;
assign o_bi_39 = bi_2_7;
assign o_Wfc_39 = Wfc_2_7;
assign o_bf_39 = bf_2_7;
assign o_Woc_39 = Woc_2_7;
assign o_bo_39 = bo_2_7;
assign o_bc_39 = bc_2_7;
assign o_Wic_40 = Wic_2_8;
assign o_bi_40 = bi_2_8;
assign o_Wfc_40 = Wfc_2_8;
assign o_bf_40 = bf_2_8;
assign o_Woc_40 = Woc_2_8;
assign o_bo_40 = bo_2_8;
assign o_bc_40 = bc_2_8;
assign o_Wic_41 = Wic_2_9;
assign o_bi_41 = bi_2_9;
assign o_Wfc_41 = Wfc_2_9;
assign o_bf_41 = bf_2_9;
assign o_Woc_41 = Woc_2_9;
assign o_bo_41 = bo_2_9;
assign o_bc_41 = bc_2_9;
assign o_Wic_42 = Wic_2_10;
assign o_bi_42 = bi_2_10;
assign o_Wfc_42 = Wfc_2_10;
assign o_bf_42 = bf_2_10;
assign o_Woc_42 = Woc_2_10;
assign o_bo_42 = bo_2_10;
assign o_bc_42 = bc_2_10;
assign o_Wic_43 = Wic_2_11;
assign o_bi_43 = bi_2_11;
assign o_Wfc_43 = Wfc_2_11;
assign o_bf_43 = bf_2_11;
assign o_Woc_43 = Woc_2_11;
assign o_bo_43 = bo_2_11;
assign o_bc_43 = bc_2_11;
assign o_Wic_44 = Wic_2_12;
assign o_bi_44 = bi_2_12;
assign o_Wfc_44 = Wfc_2_12;
assign o_bf_44 = bf_2_12;
assign o_Woc_44 = Woc_2_12;
assign o_bo_44 = bo_2_12;
assign o_bc_44 = bc_2_12;
assign o_Wic_45 = Wic_2_13;
assign o_bi_45 = bi_2_13;
assign o_Wfc_45 = Wfc_2_13;
assign o_bf_45 = bf_2_13;
assign o_Woc_45 = Woc_2_13;
assign o_bo_45 = bo_2_13;
assign o_bc_45 = bc_2_13;
assign o_Wic_46 = Wic_2_14;
assign o_bi_46 = bi_2_14;
assign o_Wfc_46 = Wfc_2_14;
assign o_bf_46 = bf_2_14;
assign o_Woc_46 = Woc_2_14;
assign o_bo_46 = bo_2_14;
assign o_bc_46 = bc_2_14;
assign o_Wic_47 = Wic_2_15;
assign o_bi_47 = bi_2_15;
assign o_Wfc_47 = Wfc_2_15;
assign o_bf_47 = bf_2_15;
assign o_Woc_47 = Woc_2_15;
assign o_bo_47 = bo_2_15;
assign o_bc_47 = bc_2_15;

endmodule
module weight_buffer_18_16_3_64_bc_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;
`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_bo_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;
`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_Woc_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;
`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_bf_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_Wfc_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_bi_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module weight_buffer_18_16_3_64_Wic_0 (
	input clk,
	output [17:0] q_0_0,
	output [17:0] q_0_1,
	output [17:0] q_0_2,
	output [17:0] q_0_3,
	output [17:0] q_0_4,
	output [17:0] q_0_5,
	output [17:0] q_0_6,
	output [17:0] q_0_7,
	output [17:0] q_0_8,
	output [17:0] q_0_9,
	output [17:0] q_0_10,
	output [17:0] q_0_11,
	output [17:0] q_0_12,
	output [17:0] q_0_13,
	output [17:0] q_0_14,
	output [17:0] q_0_15,
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	output [17:0] q_1_9,
	output [17:0] q_1_10,
	output [17:0] q_1_11,
	output [17:0] q_1_12,
	output [17:0] q_1_13,
	output [17:0] q_1_14,
	output [17:0] q_1_15,
	output [17:0] q_2_0,
	output [17:0] q_2_1,
	output [17:0] q_2_2,
	output [17:0] q_2_3,
	output [17:0] q_2_4,
	output [17:0] q_2_5,
	output [17:0] q_2_6,
	output [17:0] q_2_7,
	output [17:0] q_2_8,
	output [17:0] q_2_9,
	output [17:0] q_2_10,
	output [17:0] q_2_11,
	output [17:0] q_2_12,
	output [17:0] q_2_13,
	output [17:0] q_2_14,
	output [17:0] q_2_15,
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;
wire [287:0] packed_result_2;
reg [5:0] addrs_2;
reg [5:0] addrs_base_2;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_base_2 <= 2;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
	addrs_2 <= index + addrs_base_2;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY 
defparam ram_inst_0.DATA_WIDTH = 288;
defparam ram_inst_0.ADDR_WIDTH = 6;
defparam ram_inst_1.DATA_WIDTH = 288;
defparam ram_inst_1.ADDR_WIDTH = 6;
defparam ram_inst_2.DATA_WIDTH = 288;
defparam ram_inst_2.ADDR_WIDTH = 6;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
	.out(packed_result_1),
	.clk(clk)
);

single_port_ram ram_inst_2 (
	.we(rom_we),
	.addr(addrs_2),
	.data(288'd0),
	.out(packed_result_2),
	.clk(clk)
);

// Unpack result
assign q_0_0 = packed_result_0[17:0];
assign q_0_1 = packed_result_0[35:18];
assign q_0_2 = packed_result_0[53:36];
assign q_0_3 = packed_result_0[71:54];
assign q_0_4 = packed_result_0[89:72];
assign q_0_5 = packed_result_0[107:90];
assign q_0_6 = packed_result_0[125:108];
assign q_0_7 = packed_result_0[143:126];
assign q_0_8 = packed_result_0[161:144];
assign q_0_9 = packed_result_0[179:162];
assign q_0_10 = packed_result_0[197:180];
assign q_0_11 = packed_result_0[215:198];
assign q_0_12 = packed_result_0[233:216];
assign q_0_13 = packed_result_0[251:234];
assign q_0_14 = packed_result_0[269:252];
assign q_0_15 = packed_result_0[287:270];
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];
assign q_1_9 = packed_result_1[179:162];
assign q_1_10 = packed_result_1[197:180];
assign q_1_11 = packed_result_1[215:198];
assign q_1_12 = packed_result_1[233:216];
assign q_1_13 = packed_result_1[251:234];
assign q_1_14 = packed_result_1[269:252];
assign q_1_15 = packed_result_1[287:270];
assign q_2_0 = packed_result_2[17:0];
assign q_2_1 = packed_result_2[35:18];
assign q_2_2 = packed_result_2[53:36];
assign q_2_3 = packed_result_2[71:54];
assign q_2_4 = packed_result_2[89:72];
assign q_2_5 = packed_result_2[107:90];
assign q_2_6 = packed_result_2[125:108];
assign q_2_7 = packed_result_2[143:126];
assign q_2_8 = packed_result_2[161:144];
assign q_2_9 = packed_result_2[179:162];
assign q_2_10 = packed_result_2[197:180];
assign q_2_11 = packed_result_2[215:198];
assign q_2_12 = packed_result_2[233:216];
assign q_2_13 = packed_result_2[251:234];
assign q_2_14 = packed_result_2[269:252];
assign q_2_15 = packed_result_2[287:270];

endmodule
module counter_63_3 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 3) <= 63) begin
			count <= count + 3;
		end else begin
			count <= 14'd0;
		end
	end
end

endmodule

module single_port_ram(
clk,
addr,
data,
we,
out
);

parameter DATA_WIDTH = 288;
parameter ADDR_WIDTH = 6;
input clk;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;
input we;
output reg [DATA_WIDTH-1:0] out;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we) begin
    ram[addr] <= data;
  end
  else begin
    out <= ram[addr];
  end
end

endmodule



