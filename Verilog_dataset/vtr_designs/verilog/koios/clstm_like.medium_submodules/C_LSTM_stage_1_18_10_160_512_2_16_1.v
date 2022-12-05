`define SIMULATION_MEMORY

module C_LSTM_stage_1_18_10_160_512_2_16_1 (
	input clk,
	input reset,
	input enable,
	input i_ready,
	input [17:0] i_Xt_Yt_1_0,
	input [17:0] i_Xt_Yt_1_1,
	input [17:0] i_Xt_Yt_1_2,
	input [17:0] i_Xt_Yt_1_3,
	input [17:0] i_Xt_Yt_1_4,
	input [17:0] i_Xt_Yt_1_5,
	input [17:0] i_Xt_Yt_1_6,
	input [17:0] i_Xt_Yt_1_7,
	input [17:0] i_Xt_Yt_1_8,
	input [17:0] i_Xt_Yt_1_9,
	input [17:0] i_Xt_Yt_1_10,
	input [17:0] i_Xt_Yt_1_11,
	input [17:0] i_Xt_Yt_1_12,
	input [17:0] i_Xt_Yt_1_13,
	input [17:0] i_Xt_Yt_1_14,
	input [17:0] i_Xt_Yt_1_15,
	input [17:0] i_Wixr_real_0_0,
	input [17:0] i_Wixr_imag_0_0,
	input [17:0] i_Wfxr_real_0_0,
	input [17:0] i_Wfxr_imag_0_0,
	input [17:0] i_Woxr_real_0_0,
	input [17:0] i_Woxr_imag_0_0,
	input [17:0] i_Wcxr_real_0_0,
	input [17:0] i_Wcxr_imag_0_0,
	input [17:0] i_Wixr_real_0_1,
	input [17:0] i_Wixr_imag_0_1,
	input [17:0] i_Wfxr_real_0_1,
	input [17:0] i_Wfxr_imag_0_1,
	input [17:0] i_Woxr_real_0_1,
	input [17:0] i_Woxr_imag_0_1,
	input [17:0] i_Wcxr_real_0_1,
	input [17:0] i_Wcxr_imag_0_1,
	input [17:0] i_Wixr_real_0_2,
	input [17:0] i_Wixr_imag_0_2,
	input [17:0] i_Wfxr_real_0_2,
	input [17:0] i_Wfxr_imag_0_2,
	input [17:0] i_Woxr_real_0_2,
	input [17:0] i_Woxr_imag_0_2,
	input [17:0] i_Wcxr_real_0_2,
	input [17:0] i_Wcxr_imag_0_2,
	input [17:0] i_Wixr_real_0_3,
	input [17:0] i_Wixr_imag_0_3,
	input [17:0] i_Wfxr_real_0_3,
	input [17:0] i_Wfxr_imag_0_3,
	input [17:0] i_Woxr_real_0_3,
	input [17:0] i_Woxr_imag_0_3,
	input [17:0] i_Wcxr_real_0_3,
	input [17:0] i_Wcxr_imag_0_3,
	input [17:0] i_Wixr_real_0_4,
	input [17:0] i_Wixr_imag_0_4,
	input [17:0] i_Wfxr_real_0_4,
	input [17:0] i_Wfxr_imag_0_4,
	input [17:0] i_Woxr_real_0_4,
	input [17:0] i_Woxr_imag_0_4,
	input [17:0] i_Wcxr_real_0_4,
	input [17:0] i_Wcxr_imag_0_4,
	input [17:0] i_Wixr_real_0_5,
	input [17:0] i_Wixr_imag_0_5,
	input [17:0] i_Wfxr_real_0_5,
	input [17:0] i_Wfxr_imag_0_5,
	input [17:0] i_Woxr_real_0_5,
	input [17:0] i_Woxr_imag_0_5,
	input [17:0] i_Wcxr_real_0_5,
	input [17:0] i_Wcxr_imag_0_5,
	input [17:0] i_Wixr_real_0_6,
	input [17:0] i_Wixr_imag_0_6,
	input [17:0] i_Wfxr_real_0_6,
	input [17:0] i_Wfxr_imag_0_6,
	input [17:0] i_Woxr_real_0_6,
	input [17:0] i_Woxr_imag_0_6,
	input [17:0] i_Wcxr_real_0_6,
	input [17:0] i_Wcxr_imag_0_6,
	input [17:0] i_Wixr_real_0_7,
	input [17:0] i_Wixr_imag_0_7,
	input [17:0] i_Wfxr_real_0_7,
	input [17:0] i_Wfxr_imag_0_7,
	input [17:0] i_Woxr_real_0_7,
	input [17:0] i_Woxr_imag_0_7,
	input [17:0] i_Wcxr_real_0_7,
	input [17:0] i_Wcxr_imag_0_7,
	input [17:0] i_Wixr_real_0_8,
	input [17:0] i_Wixr_imag_0_8,
	input [17:0] i_Wfxr_real_0_8,
	input [17:0] i_Wfxr_imag_0_8,
	input [17:0] i_Woxr_real_0_8,
	input [17:0] i_Woxr_imag_0_8,
	input [17:0] i_Wcxr_real_0_8,
	input [17:0] i_Wcxr_imag_0_8,
	input [17:0] i_Wixr_real_1_0,
	input [17:0] i_Wixr_imag_1_0,
	input [17:0] i_Wfxr_real_1_0,
	input [17:0] i_Wfxr_imag_1_0,
	input [17:0] i_Woxr_real_1_0,
	input [17:0] i_Woxr_imag_1_0,
	input [17:0] i_Wcxr_real_1_0,
	input [17:0] i_Wcxr_imag_1_0,
	input [17:0] i_Wixr_real_1_1,
	input [17:0] i_Wixr_imag_1_1,
	input [17:0] i_Wfxr_real_1_1,
	input [17:0] i_Wfxr_imag_1_1,
	input [17:0] i_Woxr_real_1_1,
	input [17:0] i_Woxr_imag_1_1,
	input [17:0] i_Wcxr_real_1_1,
	input [17:0] i_Wcxr_imag_1_1,
	input [17:0] i_Wixr_real_1_2,
	input [17:0] i_Wixr_imag_1_2,
	input [17:0] i_Wfxr_real_1_2,
	input [17:0] i_Wfxr_imag_1_2,
	input [17:0] i_Woxr_real_1_2,
	input [17:0] i_Woxr_imag_1_2,
	input [17:0] i_Wcxr_real_1_2,
	input [17:0] i_Wcxr_imag_1_2,
	input [17:0] i_Wixr_real_1_3,
	input [17:0] i_Wixr_imag_1_3,
	input [17:0] i_Wfxr_real_1_3,
	input [17:0] i_Wfxr_imag_1_3,
	input [17:0] i_Woxr_real_1_3,
	input [17:0] i_Woxr_imag_1_3,
	input [17:0] i_Wcxr_real_1_3,
	input [17:0] i_Wcxr_imag_1_3,
	input [17:0] i_Wixr_real_1_4,
	input [17:0] i_Wixr_imag_1_4,
	input [17:0] i_Wfxr_real_1_4,
	input [17:0] i_Wfxr_imag_1_4,
	input [17:0] i_Woxr_real_1_4,
	input [17:0] i_Woxr_imag_1_4,
	input [17:0] i_Wcxr_real_1_4,
	input [17:0] i_Wcxr_imag_1_4,
	input [17:0] i_Wixr_real_1_5,
	input [17:0] i_Wixr_imag_1_5,
	input [17:0] i_Wfxr_real_1_5,
	input [17:0] i_Wfxr_imag_1_5,
	input [17:0] i_Woxr_real_1_5,
	input [17:0] i_Woxr_imag_1_5,
	input [17:0] i_Wcxr_real_1_5,
	input [17:0] i_Wcxr_imag_1_5,
	input [17:0] i_Wixr_real_1_6,
	input [17:0] i_Wixr_imag_1_6,
	input [17:0] i_Wfxr_real_1_6,
	input [17:0] i_Wfxr_imag_1_6,
	input [17:0] i_Woxr_real_1_6,
	input [17:0] i_Woxr_imag_1_6,
	input [17:0] i_Wcxr_real_1_6,
	input [17:0] i_Wcxr_imag_1_6,
	input [17:0] i_Wixr_real_1_7,
	input [17:0] i_Wixr_imag_1_7,
	input [17:0] i_Wfxr_real_1_7,
	input [17:0] i_Wfxr_imag_1_7,
	input [17:0] i_Woxr_real_1_7,
	input [17:0] i_Woxr_imag_1_7,
	input [17:0] i_Wcxr_real_1_7,
	input [17:0] i_Wcxr_imag_1_7,
	input [17:0] i_Wixr_real_1_8,
	input [17:0] i_Wixr_imag_1_8,
	input [17:0] i_Wfxr_real_1_8,
	input [17:0] i_Wfxr_imag_1_8,
	input [17:0] i_Woxr_real_1_8,
	input [17:0] i_Woxr_imag_1_8,
	input [17:0] i_Wcxr_real_1_8,
	input [17:0] i_Wcxr_imag_1_8,
	output o_valid,
	output o_ready,
	output [17:0] o_WixrXtYt_1_0_0,
	output [17:0] o_WfxrXtYt_1_0_0,
	output [17:0] o_WoxrXtYt_1_0_0,
	output [17:0] o_WcxrXtYt_1_0_0,
	output [17:0] o_WixrXtYt_1_0_1,
	output [17:0] o_WfxrXtYt_1_0_1,
	output [17:0] o_WoxrXtYt_1_0_1,
	output [17:0] o_WcxrXtYt_1_0_1,
	output [17:0] o_WixrXtYt_1_0_2,
	output [17:0] o_WfxrXtYt_1_0_2,
	output [17:0] o_WoxrXtYt_1_0_2,
	output [17:0] o_WcxrXtYt_1_0_2,
	output [17:0] o_WixrXtYt_1_0_3,
	output [17:0] o_WfxrXtYt_1_0_3,
	output [17:0] o_WoxrXtYt_1_0_3,
	output [17:0] o_WcxrXtYt_1_0_3,
	output [17:0] o_WixrXtYt_1_0_4,
	output [17:0] o_WfxrXtYt_1_0_4,
	output [17:0] o_WoxrXtYt_1_0_4,
	output [17:0] o_WcxrXtYt_1_0_4,
	output [17:0] o_WixrXtYt_1_0_5,
	output [17:0] o_WfxrXtYt_1_0_5,
	output [17:0] o_WoxrXtYt_1_0_5,
	output [17:0] o_WcxrXtYt_1_0_5,
	output [17:0] o_WixrXtYt_1_0_6,
	output [17:0] o_WfxrXtYt_1_0_6,
	output [17:0] o_WoxrXtYt_1_0_6,
	output [17:0] o_WcxrXtYt_1_0_6,
	output [17:0] o_WixrXtYt_1_0_7,
	output [17:0] o_WfxrXtYt_1_0_7,
	output [17:0] o_WoxrXtYt_1_0_7,
	output [17:0] o_WcxrXtYt_1_0_7,
	output [17:0] o_WixrXtYt_1_0_8,
	output [17:0] o_WfxrXtYt_1_0_8,
	output [17:0] o_WoxrXtYt_1_0_8,
	output [17:0] o_WcxrXtYt_1_0_8,
	output [17:0] o_WixrXtYt_1_0_9,
	output [17:0] o_WfxrXtYt_1_0_9,
	output [17:0] o_WoxrXtYt_1_0_9,
	output [17:0] o_WcxrXtYt_1_0_9,
	output [17:0] o_WixrXtYt_1_0_10,
	output [17:0] o_WfxrXtYt_1_0_10,
	output [17:0] o_WoxrXtYt_1_0_10,
	output [17:0] o_WcxrXtYt_1_0_10,
	output [17:0] o_WixrXtYt_1_0_11,
	output [17:0] o_WfxrXtYt_1_0_11,
	output [17:0] o_WoxrXtYt_1_0_11,
	output [17:0] o_WcxrXtYt_1_0_11,
	output [17:0] o_WixrXtYt_1_0_12,
	output [17:0] o_WfxrXtYt_1_0_12,
	output [17:0] o_WoxrXtYt_1_0_12,
	output [17:0] o_WcxrXtYt_1_0_12,
	output [17:0] o_WixrXtYt_1_0_13,
	output [17:0] o_WfxrXtYt_1_0_13,
	output [17:0] o_WoxrXtYt_1_0_13,
	output [17:0] o_WcxrXtYt_1_0_13,
	output [17:0] o_WixrXtYt_1_0_14,
	output [17:0] o_WfxrXtYt_1_0_14,
	output [17:0] o_WoxrXtYt_1_0_14,
	output [17:0] o_WcxrXtYt_1_0_14,
	output [17:0] o_WixrXtYt_1_0_15,
	output [17:0] o_WfxrXtYt_1_0_15,
	output [17:0] o_WoxrXtYt_1_0_15,
	output [17:0] o_WcxrXtYt_1_0_15,
	output [17:0] o_WixrXtYt_1_1_0,
	output [17:0] o_WfxrXtYt_1_1_0,
	output [17:0] o_WoxrXtYt_1_1_0,
	output [17:0] o_WcxrXtYt_1_1_0,
	output [17:0] o_WixrXtYt_1_1_1,
	output [17:0] o_WfxrXtYt_1_1_1,
	output [17:0] o_WoxrXtYt_1_1_1,
	output [17:0] o_WcxrXtYt_1_1_1,
	output [17:0] o_WixrXtYt_1_1_2,
	output [17:0] o_WfxrXtYt_1_1_2,
	output [17:0] o_WoxrXtYt_1_1_2,
	output [17:0] o_WcxrXtYt_1_1_2,
	output [17:0] o_WixrXtYt_1_1_3,
	output [17:0] o_WfxrXtYt_1_1_3,
	output [17:0] o_WoxrXtYt_1_1_3,
	output [17:0] o_WcxrXtYt_1_1_3,
	output [17:0] o_WixrXtYt_1_1_4,
	output [17:0] o_WfxrXtYt_1_1_4,
	output [17:0] o_WoxrXtYt_1_1_4,
	output [17:0] o_WcxrXtYt_1_1_4,
	output [17:0] o_WixrXtYt_1_1_5,
	output [17:0] o_WfxrXtYt_1_1_5,
	output [17:0] o_WoxrXtYt_1_1_5,
	output [17:0] o_WcxrXtYt_1_1_5,
	output [17:0] o_WixrXtYt_1_1_6,
	output [17:0] o_WfxrXtYt_1_1_6,
	output [17:0] o_WoxrXtYt_1_1_6,
	output [17:0] o_WcxrXtYt_1_1_6,
	output [17:0] o_WixrXtYt_1_1_7,
	output [17:0] o_WfxrXtYt_1_1_7,
	output [17:0] o_WoxrXtYt_1_1_7,
	output [17:0] o_WcxrXtYt_1_1_7,
	output [17:0] o_WixrXtYt_1_1_8,
	output [17:0] o_WfxrXtYt_1_1_8,
	output [17:0] o_WoxrXtYt_1_1_8,
	output [17:0] o_WcxrXtYt_1_1_8,
	output [17:0] o_WixrXtYt_1_1_9,
	output [17:0] o_WfxrXtYt_1_1_9,
	output [17:0] o_WoxrXtYt_1_1_9,
	output [17:0] o_WcxrXtYt_1_1_9,
	output [17:0] o_WixrXtYt_1_1_10,
	output [17:0] o_WfxrXtYt_1_1_10,
	output [17:0] o_WoxrXtYt_1_1_10,
	output [17:0] o_WcxrXtYt_1_1_10,
	output [17:0] o_WixrXtYt_1_1_11,
	output [17:0] o_WfxrXtYt_1_1_11,
	output [17:0] o_WoxrXtYt_1_1_11,
	output [17:0] o_WcxrXtYt_1_1_11,
	output [17:0] o_WixrXtYt_1_1_12,
	output [17:0] o_WfxrXtYt_1_1_12,
	output [17:0] o_WoxrXtYt_1_1_12,
	output [17:0] o_WcxrXtYt_1_1_12,
	output [17:0] o_WixrXtYt_1_1_13,
	output [17:0] o_WfxrXtYt_1_1_13,
	output [17:0] o_WoxrXtYt_1_1_13,
	output [17:0] o_WcxrXtYt_1_1_13,
	output [17:0] o_WixrXtYt_1_1_14,
	output [17:0] o_WfxrXtYt_1_1_14,
	output [17:0] o_WoxrXtYt_1_1_14,
	output [17:0] o_WcxrXtYt_1_1_14,
	output [17:0] o_WixrXtYt_1_1_15,
	output [17:0] o_WfxrXtYt_1_1_15,
	output [17:0] o_WoxrXtYt_1_1_15,
	output [17:0] o_WcxrXtYt_1_1_15,
	input i_valid
);

wire input_gate_mult_valid, forget_gate_mult_valid, output_gate_mult_valid, output_act_mult_valid;
wire input_gate_mult_ready, forget_gate_mult_ready, output_gate_mult_ready, output_act_mult_ready;

// Input Gate Multiplication 
matrix_times_two_vectors_18_10_2_672_16_1 input_gate_mult (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_Xt_Yt_1_0(i_Xt_Yt_1_0),
	.i_Xt_Yt_1_1(i_Xt_Yt_1_1),
	.i_Xt_Yt_1_2(i_Xt_Yt_1_2),
	.i_Xt_Yt_1_3(i_Xt_Yt_1_3),
	.i_Xt_Yt_1_4(i_Xt_Yt_1_4),
	.i_Xt_Yt_1_5(i_Xt_Yt_1_5),
	.i_Xt_Yt_1_6(i_Xt_Yt_1_6),
	.i_Xt_Yt_1_7(i_Xt_Yt_1_7),
	.i_Xt_Yt_1_8(i_Xt_Yt_1_8),
	.i_Xt_Yt_1_9(i_Xt_Yt_1_9),
	.i_Xt_Yt_1_10(i_Xt_Yt_1_10),
	.i_Xt_Yt_1_11(i_Xt_Yt_1_11),
	.i_Xt_Yt_1_12(i_Xt_Yt_1_12),
	.i_Xt_Yt_1_13(i_Xt_Yt_1_13),
	.i_Xt_Yt_1_14(i_Xt_Yt_1_14),
	.i_Xt_Yt_1_15(i_Xt_Yt_1_15),
	.i_Wxr_real_0_0(i_Wixr_real_0_0),
	.i_Wxr_imag_0_0(i_Wixr_imag_0_0),
	.i_Wxr_real_0_1(i_Wixr_real_0_1),
	.i_Wxr_imag_0_1(i_Wixr_imag_0_1),
	.i_Wxr_real_0_2(i_Wixr_real_0_2),
	.i_Wxr_imag_0_2(i_Wixr_imag_0_2),
	.i_Wxr_real_0_3(i_Wixr_real_0_3),
	.i_Wxr_imag_0_3(i_Wixr_imag_0_3),
	.i_Wxr_real_0_4(i_Wixr_real_0_4),
	.i_Wxr_imag_0_4(i_Wixr_imag_0_4),
	.i_Wxr_real_0_5(i_Wixr_real_0_5),
	.i_Wxr_imag_0_5(i_Wixr_imag_0_5),
	.i_Wxr_real_0_6(i_Wixr_real_0_6),
	.i_Wxr_imag_0_6(i_Wixr_imag_0_6),
	.i_Wxr_real_0_7(i_Wixr_real_0_7),
	.i_Wxr_imag_0_7(i_Wixr_imag_0_7),
	.i_Wxr_real_0_8(i_Wixr_real_0_8),
	.i_Wxr_imag_0_8(i_Wixr_imag_0_8),
	.i_Wxr_real_1_0(i_Wixr_real_1_0),
	.i_Wxr_imag_1_0(i_Wixr_imag_1_0),
	.i_Wxr_real_1_1(i_Wixr_real_1_1),
	.i_Wxr_imag_1_1(i_Wixr_imag_1_1),
	.i_Wxr_real_1_2(i_Wixr_real_1_2),
	.i_Wxr_imag_1_2(i_Wixr_imag_1_2),
	.i_Wxr_real_1_3(i_Wixr_real_1_3),
	.i_Wxr_imag_1_3(i_Wixr_imag_1_3),
	.i_Wxr_real_1_4(i_Wixr_real_1_4),
	.i_Wxr_imag_1_4(i_Wixr_imag_1_4),
	.i_Wxr_real_1_5(i_Wixr_real_1_5),
	.i_Wxr_imag_1_5(i_Wixr_imag_1_5),
	.i_Wxr_real_1_6(i_Wixr_real_1_6),
	.i_Wxr_imag_1_6(i_Wixr_imag_1_6),
	.i_Wxr_real_1_7(i_Wixr_real_1_7),
	.i_Wxr_imag_1_7(i_Wixr_imag_1_7),
	.i_Wxr_real_1_8(i_Wixr_real_1_8),
	.i_Wxr_imag_1_8(i_Wixr_imag_1_8),
	.o_W_times_X_Y_0_0(o_WixrXtYt_1_0_0),
	.o_W_times_X_Y_0_1(o_WixrXtYt_1_0_1),
	.o_W_times_X_Y_0_2(o_WixrXtYt_1_0_2),
	.o_W_times_X_Y_0_3(o_WixrXtYt_1_0_3),
	.o_W_times_X_Y_0_4(o_WixrXtYt_1_0_4),
	.o_W_times_X_Y_0_5(o_WixrXtYt_1_0_5),
	.o_W_times_X_Y_0_6(o_WixrXtYt_1_0_6),
	.o_W_times_X_Y_0_7(o_WixrXtYt_1_0_7),
	.o_W_times_X_Y_0_8(o_WixrXtYt_1_0_8),
	.o_W_times_X_Y_0_9(o_WixrXtYt_1_0_9),
	.o_W_times_X_Y_0_10(o_WixrXtYt_1_0_10),
	.o_W_times_X_Y_0_11(o_WixrXtYt_1_0_11),
	.o_W_times_X_Y_0_12(o_WixrXtYt_1_0_12),
	.o_W_times_X_Y_0_13(o_WixrXtYt_1_0_13),
	.o_W_times_X_Y_0_14(o_WixrXtYt_1_0_14),
	.o_W_times_X_Y_0_15(o_WixrXtYt_1_0_15),
	.o_W_times_X_Y_1_0(o_WixrXtYt_1_1_0),
	.o_W_times_X_Y_1_1(o_WixrXtYt_1_1_1),
	.o_W_times_X_Y_1_2(o_WixrXtYt_1_1_2),
	.o_W_times_X_Y_1_3(o_WixrXtYt_1_1_3),
	.o_W_times_X_Y_1_4(o_WixrXtYt_1_1_4),
	.o_W_times_X_Y_1_5(o_WixrXtYt_1_1_5),
	.o_W_times_X_Y_1_6(o_WixrXtYt_1_1_6),
	.o_W_times_X_Y_1_7(o_WixrXtYt_1_1_7),
	.o_W_times_X_Y_1_8(o_WixrXtYt_1_1_8),
	.o_W_times_X_Y_1_9(o_WixrXtYt_1_1_9),
	.o_W_times_X_Y_1_10(o_WixrXtYt_1_1_10),
	.o_W_times_X_Y_1_11(o_WixrXtYt_1_1_11),
	.o_W_times_X_Y_1_12(o_WixrXtYt_1_1_12),
	.o_W_times_X_Y_1_13(o_WixrXtYt_1_1_13),
	.o_W_times_X_Y_1_14(o_WixrXtYt_1_1_14),
	.o_W_times_X_Y_1_15(o_WixrXtYt_1_1_15),
	.o_valid(input_gate_mult_valid),
	.o_ready(input_gate_mult_ready)
);

// Forget Gate Multiplication 
matrix_times_two_vectors_18_10_2_672_16_1 forget_gate_mult (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_Xt_Yt_1_0(i_Xt_Yt_1_0),
	.i_Xt_Yt_1_1(i_Xt_Yt_1_1),
	.i_Xt_Yt_1_2(i_Xt_Yt_1_2),
	.i_Xt_Yt_1_3(i_Xt_Yt_1_3),
	.i_Xt_Yt_1_4(i_Xt_Yt_1_4),
	.i_Xt_Yt_1_5(i_Xt_Yt_1_5),
	.i_Xt_Yt_1_6(i_Xt_Yt_1_6),
	.i_Xt_Yt_1_7(i_Xt_Yt_1_7),
	.i_Xt_Yt_1_8(i_Xt_Yt_1_8),
	.i_Xt_Yt_1_9(i_Xt_Yt_1_9),
	.i_Xt_Yt_1_10(i_Xt_Yt_1_10),
	.i_Xt_Yt_1_11(i_Xt_Yt_1_11),
	.i_Xt_Yt_1_12(i_Xt_Yt_1_12),
	.i_Xt_Yt_1_13(i_Xt_Yt_1_13),
	.i_Xt_Yt_1_14(i_Xt_Yt_1_14),
	.i_Xt_Yt_1_15(i_Xt_Yt_1_15),
	.i_Wxr_real_0_0(i_Wfxr_real_0_0),
	.i_Wxr_imag_0_0(i_Wfxr_imag_0_0),
	.i_Wxr_real_0_1(i_Wfxr_real_0_1),
	.i_Wxr_imag_0_1(i_Wfxr_imag_0_1),
	.i_Wxr_real_0_2(i_Wfxr_real_0_2),
	.i_Wxr_imag_0_2(i_Wfxr_imag_0_2),
	.i_Wxr_real_0_3(i_Wfxr_real_0_3),
	.i_Wxr_imag_0_3(i_Wfxr_imag_0_3),
	.i_Wxr_real_0_4(i_Wfxr_real_0_4),
	.i_Wxr_imag_0_4(i_Wfxr_imag_0_4),
	.i_Wxr_real_0_5(i_Wfxr_real_0_5),
	.i_Wxr_imag_0_5(i_Wfxr_imag_0_5),
	.i_Wxr_real_0_6(i_Wfxr_real_0_6),
	.i_Wxr_imag_0_6(i_Wfxr_imag_0_6),
	.i_Wxr_real_0_7(i_Wfxr_real_0_7),
	.i_Wxr_imag_0_7(i_Wfxr_imag_0_7),
	.i_Wxr_real_0_8(i_Wfxr_real_0_8),
	.i_Wxr_imag_0_8(i_Wfxr_imag_0_8),
	.i_Wxr_real_1_0(i_Wfxr_real_1_0),
	.i_Wxr_imag_1_0(i_Wfxr_imag_1_0),
	.i_Wxr_real_1_1(i_Wfxr_real_1_1),
	.i_Wxr_imag_1_1(i_Wfxr_imag_1_1),
	.i_Wxr_real_1_2(i_Wfxr_real_1_2),
	.i_Wxr_imag_1_2(i_Wfxr_imag_1_2),
	.i_Wxr_real_1_3(i_Wfxr_real_1_3),
	.i_Wxr_imag_1_3(i_Wfxr_imag_1_3),
	.i_Wxr_real_1_4(i_Wfxr_real_1_4),
	.i_Wxr_imag_1_4(i_Wfxr_imag_1_4),
	.i_Wxr_real_1_5(i_Wfxr_real_1_5),
	.i_Wxr_imag_1_5(i_Wfxr_imag_1_5),
	.i_Wxr_real_1_6(i_Wfxr_real_1_6),
	.i_Wxr_imag_1_6(i_Wfxr_imag_1_6),
	.i_Wxr_real_1_7(i_Wfxr_real_1_7),
	.i_Wxr_imag_1_7(i_Wfxr_imag_1_7),
	.i_Wxr_real_1_8(i_Wfxr_real_1_8),
	.i_Wxr_imag_1_8(i_Wfxr_imag_1_8),
	.o_W_times_X_Y_0_0(o_WfxrXtYt_1_0_0),
	.o_W_times_X_Y_0_1(o_WfxrXtYt_1_0_1),
	.o_W_times_X_Y_0_2(o_WfxrXtYt_1_0_2),
	.o_W_times_X_Y_0_3(o_WfxrXtYt_1_0_3),
	.o_W_times_X_Y_0_4(o_WfxrXtYt_1_0_4),
	.o_W_times_X_Y_0_5(o_WfxrXtYt_1_0_5),
	.o_W_times_X_Y_0_6(o_WfxrXtYt_1_0_6),
	.o_W_times_X_Y_0_7(o_WfxrXtYt_1_0_7),
	.o_W_times_X_Y_0_8(o_WfxrXtYt_1_0_8),
	.o_W_times_X_Y_0_9(o_WfxrXtYt_1_0_9),
	.o_W_times_X_Y_0_10(o_WfxrXtYt_1_0_10),
	.o_W_times_X_Y_0_11(o_WfxrXtYt_1_0_11),
	.o_W_times_X_Y_0_12(o_WfxrXtYt_1_0_12),
	.o_W_times_X_Y_0_13(o_WfxrXtYt_1_0_13),
	.o_W_times_X_Y_0_14(o_WfxrXtYt_1_0_14),
	.o_W_times_X_Y_0_15(o_WfxrXtYt_1_0_15),
	.o_W_times_X_Y_1_0(o_WfxrXtYt_1_1_0),
	.o_W_times_X_Y_1_1(o_WfxrXtYt_1_1_1),
	.o_W_times_X_Y_1_2(o_WfxrXtYt_1_1_2),
	.o_W_times_X_Y_1_3(o_WfxrXtYt_1_1_3),
	.o_W_times_X_Y_1_4(o_WfxrXtYt_1_1_4),
	.o_W_times_X_Y_1_5(o_WfxrXtYt_1_1_5),
	.o_W_times_X_Y_1_6(o_WfxrXtYt_1_1_6),
	.o_W_times_X_Y_1_7(o_WfxrXtYt_1_1_7),
	.o_W_times_X_Y_1_8(o_WfxrXtYt_1_1_8),
	.o_W_times_X_Y_1_9(o_WfxrXtYt_1_1_9),
	.o_W_times_X_Y_1_10(o_WfxrXtYt_1_1_10),
	.o_W_times_X_Y_1_11(o_WfxrXtYt_1_1_11),
	.o_W_times_X_Y_1_12(o_WfxrXtYt_1_1_12),
	.o_W_times_X_Y_1_13(o_WfxrXtYt_1_1_13),
	.o_W_times_X_Y_1_14(o_WfxrXtYt_1_1_14),
	.o_W_times_X_Y_1_15(o_WfxrXtYt_1_1_15),
	.o_valid(forget_gate_mult_valid),
	.o_ready(forget_gate_mult_ready)
);

// Output Gate Multiplication 
matrix_times_two_vectors_18_10_2_672_16_1 output_gate_mult (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_Xt_Yt_1_0(i_Xt_Yt_1_0),
	.i_Xt_Yt_1_1(i_Xt_Yt_1_1),
	.i_Xt_Yt_1_2(i_Xt_Yt_1_2),
	.i_Xt_Yt_1_3(i_Xt_Yt_1_3),
	.i_Xt_Yt_1_4(i_Xt_Yt_1_4),
	.i_Xt_Yt_1_5(i_Xt_Yt_1_5),
	.i_Xt_Yt_1_6(i_Xt_Yt_1_6),
	.i_Xt_Yt_1_7(i_Xt_Yt_1_7),
	.i_Xt_Yt_1_8(i_Xt_Yt_1_8),
	.i_Xt_Yt_1_9(i_Xt_Yt_1_9),
	.i_Xt_Yt_1_10(i_Xt_Yt_1_10),
	.i_Xt_Yt_1_11(i_Xt_Yt_1_11),
	.i_Xt_Yt_1_12(i_Xt_Yt_1_12),
	.i_Xt_Yt_1_13(i_Xt_Yt_1_13),
	.i_Xt_Yt_1_14(i_Xt_Yt_1_14),
	.i_Xt_Yt_1_15(i_Xt_Yt_1_15),
	.i_Wxr_real_0_0(i_Woxr_real_0_0),
	.i_Wxr_imag_0_0(i_Woxr_imag_0_0),
	.i_Wxr_real_0_1(i_Woxr_real_0_1),
	.i_Wxr_imag_0_1(i_Woxr_imag_0_1),
	.i_Wxr_real_0_2(i_Woxr_real_0_2),
	.i_Wxr_imag_0_2(i_Woxr_imag_0_2),
	.i_Wxr_real_0_3(i_Woxr_real_0_3),
	.i_Wxr_imag_0_3(i_Woxr_imag_0_3),
	.i_Wxr_real_0_4(i_Woxr_real_0_4),
	.i_Wxr_imag_0_4(i_Woxr_imag_0_4),
	.i_Wxr_real_0_5(i_Woxr_real_0_5),
	.i_Wxr_imag_0_5(i_Woxr_imag_0_5),
	.i_Wxr_real_0_6(i_Woxr_real_0_6),
	.i_Wxr_imag_0_6(i_Woxr_imag_0_6),
	.i_Wxr_real_0_7(i_Woxr_real_0_7),
	.i_Wxr_imag_0_7(i_Woxr_imag_0_7),
	.i_Wxr_real_0_8(i_Woxr_real_0_8),
	.i_Wxr_imag_0_8(i_Woxr_imag_0_8),
	.i_Wxr_real_1_0(i_Woxr_real_1_0),
	.i_Wxr_imag_1_0(i_Woxr_imag_1_0),
	.i_Wxr_real_1_1(i_Woxr_real_1_1),
	.i_Wxr_imag_1_1(i_Woxr_imag_1_1),
	.i_Wxr_real_1_2(i_Woxr_real_1_2),
	.i_Wxr_imag_1_2(i_Woxr_imag_1_2),
	.i_Wxr_real_1_3(i_Woxr_real_1_3),
	.i_Wxr_imag_1_3(i_Woxr_imag_1_3),
	.i_Wxr_real_1_4(i_Woxr_real_1_4),
	.i_Wxr_imag_1_4(i_Woxr_imag_1_4),
	.i_Wxr_real_1_5(i_Woxr_real_1_5),
	.i_Wxr_imag_1_5(i_Woxr_imag_1_5),
	.i_Wxr_real_1_6(i_Woxr_real_1_6),
	.i_Wxr_imag_1_6(i_Woxr_imag_1_6),
	.i_Wxr_real_1_7(i_Woxr_real_1_7),
	.i_Wxr_imag_1_7(i_Woxr_imag_1_7),
	.i_Wxr_real_1_8(i_Woxr_real_1_8),
	.i_Wxr_imag_1_8(i_Woxr_imag_1_8),
	.o_W_times_X_Y_0_0(o_WoxrXtYt_1_0_0),
	.o_W_times_X_Y_0_1(o_WoxrXtYt_1_0_1),
	.o_W_times_X_Y_0_2(o_WoxrXtYt_1_0_2),
	.o_W_times_X_Y_0_3(o_WoxrXtYt_1_0_3),
	.o_W_times_X_Y_0_4(o_WoxrXtYt_1_0_4),
	.o_W_times_X_Y_0_5(o_WoxrXtYt_1_0_5),
	.o_W_times_X_Y_0_6(o_WoxrXtYt_1_0_6),
	.o_W_times_X_Y_0_7(o_WoxrXtYt_1_0_7),
	.o_W_times_X_Y_0_8(o_WoxrXtYt_1_0_8),
	.o_W_times_X_Y_0_9(o_WoxrXtYt_1_0_9),
	.o_W_times_X_Y_0_10(o_WoxrXtYt_1_0_10),
	.o_W_times_X_Y_0_11(o_WoxrXtYt_1_0_11),
	.o_W_times_X_Y_0_12(o_WoxrXtYt_1_0_12),
	.o_W_times_X_Y_0_13(o_WoxrXtYt_1_0_13),
	.o_W_times_X_Y_0_14(o_WoxrXtYt_1_0_14),
	.o_W_times_X_Y_0_15(o_WoxrXtYt_1_0_15),
	.o_W_times_X_Y_1_0(o_WoxrXtYt_1_1_0),
	.o_W_times_X_Y_1_1(o_WoxrXtYt_1_1_1),
	.o_W_times_X_Y_1_2(o_WoxrXtYt_1_1_2),
	.o_W_times_X_Y_1_3(o_WoxrXtYt_1_1_3),
	.o_W_times_X_Y_1_4(o_WoxrXtYt_1_1_4),
	.o_W_times_X_Y_1_5(o_WoxrXtYt_1_1_5),
	.o_W_times_X_Y_1_6(o_WoxrXtYt_1_1_6),
	.o_W_times_X_Y_1_7(o_WoxrXtYt_1_1_7),
	.o_W_times_X_Y_1_8(o_WoxrXtYt_1_1_8),
	.o_W_times_X_Y_1_9(o_WoxrXtYt_1_1_9),
	.o_W_times_X_Y_1_10(o_WoxrXtYt_1_1_10),
	.o_W_times_X_Y_1_11(o_WoxrXtYt_1_1_11),
	.o_W_times_X_Y_1_12(o_WoxrXtYt_1_1_12),
	.o_W_times_X_Y_1_13(o_WoxrXtYt_1_1_13),
	.o_W_times_X_Y_1_14(o_WoxrXtYt_1_1_14),
	.o_W_times_X_Y_1_15(o_WoxrXtYt_1_1_15),
	.o_valid(output_gate_mult_valid),
	.o_ready(output_gate_mult_ready)
);

// Output Activation Multiplication 
matrix_times_two_vectors_18_10_2_672_16_1 output_act_gate_mult (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_Xt_Yt_1_0(i_Xt_Yt_1_0),
	.i_Xt_Yt_1_1(i_Xt_Yt_1_1),
	.i_Xt_Yt_1_2(i_Xt_Yt_1_2),
	.i_Xt_Yt_1_3(i_Xt_Yt_1_3),
	.i_Xt_Yt_1_4(i_Xt_Yt_1_4),
	.i_Xt_Yt_1_5(i_Xt_Yt_1_5),
	.i_Xt_Yt_1_6(i_Xt_Yt_1_6),
	.i_Xt_Yt_1_7(i_Xt_Yt_1_7),
	.i_Xt_Yt_1_8(i_Xt_Yt_1_8),
	.i_Xt_Yt_1_9(i_Xt_Yt_1_9),
	.i_Xt_Yt_1_10(i_Xt_Yt_1_10),
	.i_Xt_Yt_1_11(i_Xt_Yt_1_11),
	.i_Xt_Yt_1_12(i_Xt_Yt_1_12),
	.i_Xt_Yt_1_13(i_Xt_Yt_1_13),
	.i_Xt_Yt_1_14(i_Xt_Yt_1_14),
	.i_Xt_Yt_1_15(i_Xt_Yt_1_15),
	.i_Wxr_real_0_0(i_Wcxr_real_0_0),
	.i_Wxr_imag_0_0(i_Wcxr_imag_0_0),
	.i_Wxr_real_0_1(i_Wcxr_real_0_1),
	.i_Wxr_imag_0_1(i_Wcxr_imag_0_1),
	.i_Wxr_real_0_2(i_Wcxr_real_0_2),
	.i_Wxr_imag_0_2(i_Wcxr_imag_0_2),
	.i_Wxr_real_0_3(i_Wcxr_real_0_3),
	.i_Wxr_imag_0_3(i_Wcxr_imag_0_3),
	.i_Wxr_real_0_4(i_Wcxr_real_0_4),
	.i_Wxr_imag_0_4(i_Wcxr_imag_0_4),
	.i_Wxr_real_0_5(i_Wcxr_real_0_5),
	.i_Wxr_imag_0_5(i_Wcxr_imag_0_5),
	.i_Wxr_real_0_6(i_Wcxr_real_0_6),
	.i_Wxr_imag_0_6(i_Wcxr_imag_0_6),
	.i_Wxr_real_0_7(i_Wcxr_real_0_7),
	.i_Wxr_imag_0_7(i_Wcxr_imag_0_7),
	.i_Wxr_real_0_8(i_Wcxr_real_0_8),
	.i_Wxr_imag_0_8(i_Wcxr_imag_0_8),
	.i_Wxr_real_1_0(i_Wcxr_real_1_0),
	.i_Wxr_imag_1_0(i_Wcxr_imag_1_0),
	.i_Wxr_real_1_1(i_Wcxr_real_1_1),
	.i_Wxr_imag_1_1(i_Wcxr_imag_1_1),
	.i_Wxr_real_1_2(i_Wcxr_real_1_2),
	.i_Wxr_imag_1_2(i_Wcxr_imag_1_2),
	.i_Wxr_real_1_3(i_Wcxr_real_1_3),
	.i_Wxr_imag_1_3(i_Wcxr_imag_1_3),
	.i_Wxr_real_1_4(i_Wcxr_real_1_4),
	.i_Wxr_imag_1_4(i_Wcxr_imag_1_4),
	.i_Wxr_real_1_5(i_Wcxr_real_1_5),
	.i_Wxr_imag_1_5(i_Wcxr_imag_1_5),
	.i_Wxr_real_1_6(i_Wcxr_real_1_6),
	.i_Wxr_imag_1_6(i_Wcxr_imag_1_6),
	.i_Wxr_real_1_7(i_Wcxr_real_1_7),
	.i_Wxr_imag_1_7(i_Wcxr_imag_1_7),
	.i_Wxr_real_1_8(i_Wcxr_real_1_8),
	.i_Wxr_imag_1_8(i_Wcxr_imag_1_8),
	.o_W_times_X_Y_0_0(o_WcxrXtYt_1_0_0),
	.o_W_times_X_Y_0_1(o_WcxrXtYt_1_0_1),
	.o_W_times_X_Y_0_2(o_WcxrXtYt_1_0_2),
	.o_W_times_X_Y_0_3(o_WcxrXtYt_1_0_3),
	.o_W_times_X_Y_0_4(o_WcxrXtYt_1_0_4),
	.o_W_times_X_Y_0_5(o_WcxrXtYt_1_0_5),
	.o_W_times_X_Y_0_6(o_WcxrXtYt_1_0_6),
	.o_W_times_X_Y_0_7(o_WcxrXtYt_1_0_7),
	.o_W_times_X_Y_0_8(o_WcxrXtYt_1_0_8),
	.o_W_times_X_Y_0_9(o_WcxrXtYt_1_0_9),
	.o_W_times_X_Y_0_10(o_WcxrXtYt_1_0_10),
	.o_W_times_X_Y_0_11(o_WcxrXtYt_1_0_11),
	.o_W_times_X_Y_0_12(o_WcxrXtYt_1_0_12),
	.o_W_times_X_Y_0_13(o_WcxrXtYt_1_0_13),
	.o_W_times_X_Y_0_14(o_WcxrXtYt_1_0_14),
	.o_W_times_X_Y_0_15(o_WcxrXtYt_1_0_15),
	.o_W_times_X_Y_1_0(o_WcxrXtYt_1_1_0),
	.o_W_times_X_Y_1_1(o_WcxrXtYt_1_1_1),
	.o_W_times_X_Y_1_2(o_WcxrXtYt_1_1_2),
	.o_W_times_X_Y_1_3(o_WcxrXtYt_1_1_3),
	.o_W_times_X_Y_1_4(o_WcxrXtYt_1_1_4),
	.o_W_times_X_Y_1_5(o_WcxrXtYt_1_1_5),
	.o_W_times_X_Y_1_6(o_WcxrXtYt_1_1_6),
	.o_W_times_X_Y_1_7(o_WcxrXtYt_1_1_7),
	.o_W_times_X_Y_1_8(o_WcxrXtYt_1_1_8),
	.o_W_times_X_Y_1_9(o_WcxrXtYt_1_1_9),
	.o_W_times_X_Y_1_10(o_WcxrXtYt_1_1_10),
	.o_W_times_X_Y_1_11(o_WcxrXtYt_1_1_11),
	.o_W_times_X_Y_1_12(o_WcxrXtYt_1_1_12),
	.o_W_times_X_Y_1_13(o_WcxrXtYt_1_1_13),
	.o_W_times_X_Y_1_14(o_WcxrXtYt_1_1_14),
	.o_W_times_X_Y_1_15(o_WcxrXtYt_1_1_15),
	.o_valid(output_act_mult_valid),
	.o_ready(output_act_mult_ready)
);

assign o_valid = input_gate_mult_valid & forget_gate_mult_valid & output_gate_mult_valid & output_act_mult_valid;
assign o_ready = input_gate_mult_ready & forget_gate_mult_ready & output_gate_mult_ready & output_act_mult_ready;

endmodule
module matrix_times_two_vectors_18_10_2_672_16_1 (
	input clk,
	input reset,
	input enable,
	input i_ready,
	input i_valid,
	input [17:0] i_Xt_Yt_1_0,
	input [17:0] i_Xt_Yt_1_1,
	input [17:0] i_Xt_Yt_1_2,
	input [17:0] i_Xt_Yt_1_3,
	input [17:0] i_Xt_Yt_1_4,
	input [17:0] i_Xt_Yt_1_5,
	input [17:0] i_Xt_Yt_1_6,
	input [17:0] i_Xt_Yt_1_7,
	input [17:0] i_Xt_Yt_1_8,
	input [17:0] i_Xt_Yt_1_9,
	input [17:0] i_Xt_Yt_1_10,
	input [17:0] i_Xt_Yt_1_11,
	input [17:0] i_Xt_Yt_1_12,
	input [17:0] i_Xt_Yt_1_13,
	input [17:0] i_Xt_Yt_1_14,
	input [17:0] i_Xt_Yt_1_15,
	input [17:0] i_Wxr_real_0_0,
	input [17:0] i_Wxr_imag_0_0,
	input [17:0] i_Wxr_real_0_1,
	input [17:0] i_Wxr_imag_0_1,
	input [17:0] i_Wxr_real_0_2,
	input [17:0] i_Wxr_imag_0_2,
	input [17:0] i_Wxr_real_0_3,
	input [17:0] i_Wxr_imag_0_3,
	input [17:0] i_Wxr_real_0_4,
	input [17:0] i_Wxr_imag_0_4,
	input [17:0] i_Wxr_real_0_5,
	input [17:0] i_Wxr_imag_0_5,
	input [17:0] i_Wxr_real_0_6,
	input [17:0] i_Wxr_imag_0_6,
	input [17:0] i_Wxr_real_0_7,
	input [17:0] i_Wxr_imag_0_7,
	input [17:0] i_Wxr_real_0_8,
	input [17:0] i_Wxr_imag_0_8,
	input [17:0] i_Wxr_real_1_0,
	input [17:0] i_Wxr_imag_1_0,
	input [17:0] i_Wxr_real_1_1,
	input [17:0] i_Wxr_imag_1_1,
	input [17:0] i_Wxr_real_1_2,
	input [17:0] i_Wxr_imag_1_2,
	input [17:0] i_Wxr_real_1_3,
	input [17:0] i_Wxr_imag_1_3,
	input [17:0] i_Wxr_real_1_4,
	input [17:0] i_Wxr_imag_1_4,
	input [17:0] i_Wxr_real_1_5,
	input [17:0] i_Wxr_imag_1_5,
	input [17:0] i_Wxr_real_1_6,
	input [17:0] i_Wxr_imag_1_6,
	input [17:0] i_Wxr_real_1_7,
	input [17:0] i_Wxr_imag_1_7,
	input [17:0] i_Wxr_real_1_8,
	input [17:0] i_Wxr_imag_1_8,
	output [17:0] o_W_times_X_Y_0_0,
	output [17:0] o_W_times_X_Y_0_1,
	output [17:0] o_W_times_X_Y_0_2,
	output [17:0] o_W_times_X_Y_0_3,
	output [17:0] o_W_times_X_Y_0_4,
	output [17:0] o_W_times_X_Y_0_5,
	output [17:0] o_W_times_X_Y_0_6,
	output [17:0] o_W_times_X_Y_0_7,
	output [17:0] o_W_times_X_Y_0_8,
	output [17:0] o_W_times_X_Y_0_9,
	output [17:0] o_W_times_X_Y_0_10,
	output [17:0] o_W_times_X_Y_0_11,
	output [17:0] o_W_times_X_Y_0_12,
	output [17:0] o_W_times_X_Y_0_13,
	output [17:0] o_W_times_X_Y_0_14,
	output [17:0] o_W_times_X_Y_0_15,
	output [17:0] o_W_times_X_Y_1_0,
	output [17:0] o_W_times_X_Y_1_1,
	output [17:0] o_W_times_X_Y_1_2,
	output [17:0] o_W_times_X_Y_1_3,
	output [17:0] o_W_times_X_Y_1_4,
	output [17:0] o_W_times_X_Y_1_5,
	output [17:0] o_W_times_X_Y_1_6,
	output [17:0] o_W_times_X_Y_1_7,
	output [17:0] o_W_times_X_Y_1_8,
	output [17:0] o_W_times_X_Y_1_9,
	output [17:0] o_W_times_X_Y_1_10,
	output [17:0] o_W_times_X_Y_1_11,
	output [17:0] o_W_times_X_Y_1_12,
	output [17:0] o_W_times_X_Y_1_13,
	output [17:0] o_W_times_X_Y_1_14,
	output [17:0] o_W_times_X_Y_1_15,
	output o_valid,
	output o_ready
);

multiple_c_matrix_vec_mult_and_sum_18_10_16_1_2_42 multiple_c_matrix_vec_mult_and_sum_18_10_16_1_2_42_inst (
	.clk(clk),
	.reset(reset),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_X_0(i_Xt_Yt_1_0),
	.i_X_1(i_Xt_Yt_1_1),
	.i_X_2(i_Xt_Yt_1_2),
	.i_X_3(i_Xt_Yt_1_3),
	.i_X_4(i_Xt_Yt_1_4),
	.i_X_5(i_Xt_Yt_1_5),
	.i_X_6(i_Xt_Yt_1_6),
	.i_X_7(i_Xt_Yt_1_7),
	.i_X_8(i_Xt_Yt_1_8),
	.i_X_9(i_Xt_Yt_1_9),
	.i_X_10(i_Xt_Yt_1_10),
	.i_X_11(i_Xt_Yt_1_11),
	.i_X_12(i_Xt_Yt_1_12),
	.i_X_13(i_Xt_Yt_1_13),
	.i_X_14(i_Xt_Yt_1_14),
	.i_X_15(i_Xt_Yt_1_15),
	.i_W_real_0_0(i_Wxr_real_0_0),
	.i_W_imag_0_0(i_Wxr_imag_0_0),
	.i_W_real_0_1(i_Wxr_real_0_1),
	.i_W_imag_0_1(i_Wxr_imag_0_1),
	.i_W_real_0_2(i_Wxr_real_0_2),
	.i_W_imag_0_2(i_Wxr_imag_0_2),
	.i_W_real_0_3(i_Wxr_real_0_3),
	.i_W_imag_0_3(i_Wxr_imag_0_3),
	.i_W_real_0_4(i_Wxr_real_0_4),
	.i_W_imag_0_4(i_Wxr_imag_0_4),
	.i_W_real_0_5(i_Wxr_real_0_5),
	.i_W_imag_0_5(i_Wxr_imag_0_5),
	.i_W_real_0_6(i_Wxr_real_0_6),
	.i_W_imag_0_6(i_Wxr_imag_0_6),
	.i_W_real_0_7(i_Wxr_real_0_7),
	.i_W_imag_0_7(i_Wxr_imag_0_7),
	.i_W_real_0_8(i_Wxr_real_0_8),
	.i_W_imag_0_8(i_Wxr_imag_0_8),
	.i_W_real_1_0(i_Wxr_real_1_0),
	.i_W_imag_1_0(i_Wxr_imag_1_0),
	.i_W_real_1_1(i_Wxr_real_1_1),
	.i_W_imag_1_1(i_Wxr_imag_1_1),
	.i_W_real_1_2(i_Wxr_real_1_2),
	.i_W_imag_1_2(i_Wxr_imag_1_2),
	.i_W_real_1_3(i_Wxr_real_1_3),
	.i_W_imag_1_3(i_Wxr_imag_1_3),
	.i_W_real_1_4(i_Wxr_real_1_4),
	.i_W_imag_1_4(i_Wxr_imag_1_4),
	.i_W_real_1_5(i_Wxr_real_1_5),
	.i_W_imag_1_5(i_Wxr_imag_1_5),
	.i_W_real_1_6(i_Wxr_real_1_6),
	.i_W_imag_1_6(i_Wxr_imag_1_6),
	.i_W_real_1_7(i_Wxr_real_1_7),
	.i_W_imag_1_7(i_Wxr_imag_1_7),
	.i_W_real_1_8(i_Wxr_real_1_8),
	.i_W_imag_1_8(i_Wxr_imag_1_8),
	.o_Y_0_0(o_W_times_X_Y_0_0),
	.o_Y_0_1(o_W_times_X_Y_0_1),
	.o_Y_0_2(o_W_times_X_Y_0_2),
	.o_Y_0_3(o_W_times_X_Y_0_3),
	.o_Y_0_4(o_W_times_X_Y_0_4),
	.o_Y_0_5(o_W_times_X_Y_0_5),
	.o_Y_0_6(o_W_times_X_Y_0_6),
	.o_Y_0_7(o_W_times_X_Y_0_7),
	.o_Y_0_8(o_W_times_X_Y_0_8),
	.o_Y_0_9(o_W_times_X_Y_0_9),
	.o_Y_0_10(o_W_times_X_Y_0_10),
	.o_Y_0_11(o_W_times_X_Y_0_11),
	.o_Y_0_12(o_W_times_X_Y_0_12),
	.o_Y_0_13(o_W_times_X_Y_0_13),
	.o_Y_0_14(o_W_times_X_Y_0_14),
	.o_Y_0_15(o_W_times_X_Y_0_15),
	.o_Y_1_0(o_W_times_X_Y_1_0),
	.o_Y_1_1(o_W_times_X_Y_1_1),
	.o_Y_1_2(o_W_times_X_Y_1_2),
	.o_Y_1_3(o_W_times_X_Y_1_3),
	.o_Y_1_4(o_W_times_X_Y_1_4),
	.o_Y_1_5(o_W_times_X_Y_1_5),
	.o_Y_1_6(o_W_times_X_Y_1_6),
	.o_Y_1_7(o_W_times_X_Y_1_7),
	.o_Y_1_8(o_W_times_X_Y_1_8),
	.o_Y_1_9(o_W_times_X_Y_1_9),
	.o_Y_1_10(o_W_times_X_Y_1_10),
	.o_Y_1_11(o_W_times_X_Y_1_11),
	.o_Y_1_12(o_W_times_X_Y_1_12),
	.o_Y_1_13(o_W_times_X_Y_1_13),
	.o_Y_1_14(o_W_times_X_Y_1_14),
	.o_Y_1_15(o_W_times_X_Y_1_15),
	.o_valid(o_valid),
	.o_ready(o_ready)
);

endmodule
module multiple_c_matrix_vec_mult_and_sum_18_10_16_1_2_42 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] i_X_0,
	input [17:0] i_X_1,
	input [17:0] i_X_2,
	input [17:0] i_X_3,
	input [17:0] i_X_4,
	input [17:0] i_X_5,
	input [17:0] i_X_6,
	input [17:0] i_X_7,
	input [17:0] i_X_8,
	input [17:0] i_X_9,
	input [17:0] i_X_10,
	input [17:0] i_X_11,
	input [17:0] i_X_12,
	input [17:0] i_X_13,
	input [17:0] i_X_14,
	input [17:0] i_X_15,
	input [17:0] i_W_real_0_0,
	input [17:0] i_W_imag_0_0,
	input [17:0] i_W_real_0_1,
	input [17:0] i_W_imag_0_1,
	input [17:0] i_W_real_0_2,
	input [17:0] i_W_imag_0_2,
	input [17:0] i_W_real_0_3,
	input [17:0] i_W_imag_0_3,
	input [17:0] i_W_real_0_4,
	input [17:0] i_W_imag_0_4,
	input [17:0] i_W_real_0_5,
	input [17:0] i_W_imag_0_5,
	input [17:0] i_W_real_0_6,
	input [17:0] i_W_imag_0_6,
	input [17:0] i_W_real_0_7,
	input [17:0] i_W_imag_0_7,
	input [17:0] i_W_real_0_8,
	input [17:0] i_W_imag_0_8,
	input [17:0] i_W_real_1_0,
	input [17:0] i_W_imag_1_0,
	input [17:0] i_W_real_1_1,
	input [17:0] i_W_imag_1_1,
	input [17:0] i_W_real_1_2,
	input [17:0] i_W_imag_1_2,
	input [17:0] i_W_real_1_3,
	input [17:0] i_W_imag_1_3,
	input [17:0] i_W_real_1_4,
	input [17:0] i_W_imag_1_4,
	input [17:0] i_W_real_1_5,
	input [17:0] i_W_imag_1_5,
	input [17:0] i_W_real_1_6,
	input [17:0] i_W_imag_1_6,
	input [17:0] i_W_real_1_7,
	input [17:0] i_W_imag_1_7,
	input [17:0] i_W_real_1_8,
	input [17:0] i_W_imag_1_8,
	output [17:0] o_Y_0_0,
	output [17:0] o_Y_0_1,
	output [17:0] o_Y_0_2,
	output [17:0] o_Y_0_3,
	output [17:0] o_Y_0_4,
	output [17:0] o_Y_0_5,
	output [17:0] o_Y_0_6,
	output [17:0] o_Y_0_7,
	output [17:0] o_Y_0_8,
	output [17:0] o_Y_0_9,
	output [17:0] o_Y_0_10,
	output [17:0] o_Y_0_11,
	output [17:0] o_Y_0_12,
	output [17:0] o_Y_0_13,
	output [17:0] o_Y_0_14,
	output [17:0] o_Y_0_15,
	output [17:0] o_Y_1_0,
	output [17:0] o_Y_1_1,
	output [17:0] o_Y_1_2,
	output [17:0] o_Y_1_3,
	output [17:0] o_Y_1_4,
	output [17:0] o_Y_1_5,
	output [17:0] o_Y_1_6,
	output [17:0] o_Y_1_7,
	output [17:0] o_Y_1_8,
	output [17:0] o_Y_1_9,
	output [17:0] o_Y_1_10,
	output [17:0] o_Y_1_11,
	output [17:0] o_Y_1_12,
	output [17:0] o_Y_1_13,
	output [17:0] o_Y_1_14,
	output [17:0] o_Y_1_15,
	output o_valid,
	output o_ready
);

wire matrix_vec_mult_ready, matrix_vec_mult_valid;
wire accum_valid_0;
wire idft_next_out_0;
wire accum_valid_1;
wire idft_next_out_1;
reg idft_out_valid;
wire [17:0] Y_imag_0_0;
wire [17:0] Y_real_0_0;
wire [17:0] sum_Y_real_0_0;
wire [17:0] sum_Y_imag_0_0;
wire [17:0] sum_Y_real_hold_0_0;
wire [17:0] sum_Y_imag_hold_0_0;
wire [17:0] out_Y_idft_0_0;
reg [17:0] reg_Y_0_0;
wire [17:0] Y_imag_0_1;
wire [17:0] Y_real_0_1;
wire [17:0] sum_Y_real_0_1;
wire [17:0] sum_Y_imag_0_1;
wire [17:0] sum_Y_real_hold_0_1;
wire [17:0] sum_Y_imag_hold_0_1;
wire [17:0] out_Y_idft_0_1;
reg [17:0] reg_Y_0_1;
wire [17:0] Y_imag_0_2;
wire [17:0] Y_real_0_2;
wire [17:0] sum_Y_real_0_2;
wire [17:0] sum_Y_imag_0_2;
wire [17:0] sum_Y_real_hold_0_2;
wire [17:0] sum_Y_imag_hold_0_2;
wire [17:0] out_Y_idft_0_2;
reg [17:0] reg_Y_0_2;
wire [17:0] Y_imag_0_3;
wire [17:0] Y_real_0_3;
wire [17:0] sum_Y_real_0_3;
wire [17:0] sum_Y_imag_0_3;
wire [17:0] sum_Y_real_hold_0_3;
wire [17:0] sum_Y_imag_hold_0_3;
wire [17:0] out_Y_idft_0_3;
reg [17:0] reg_Y_0_3;
wire [17:0] Y_imag_0_4;
wire [17:0] Y_real_0_4;
wire [17:0] sum_Y_real_0_4;
wire [17:0] sum_Y_imag_0_4;
wire [17:0] sum_Y_real_hold_0_4;
wire [17:0] sum_Y_imag_hold_0_4;
wire [17:0] out_Y_idft_0_4;
reg [17:0] reg_Y_0_4;
wire [17:0] Y_imag_0_5;
wire [17:0] Y_real_0_5;
wire [17:0] sum_Y_real_0_5;
wire [17:0] sum_Y_imag_0_5;
wire [17:0] sum_Y_real_hold_0_5;
wire [17:0] sum_Y_imag_hold_0_5;
wire [17:0] out_Y_idft_0_5;
reg [17:0] reg_Y_0_5;
wire [17:0] Y_imag_0_6;
wire [17:0] Y_real_0_6;
wire [17:0] sum_Y_real_0_6;
wire [17:0] sum_Y_imag_0_6;
wire [17:0] sum_Y_real_hold_0_6;
wire [17:0] sum_Y_imag_hold_0_6;
wire [17:0] out_Y_idft_0_6;
reg [17:0] reg_Y_0_6;
wire [17:0] Y_imag_0_7;
wire [17:0] Y_real_0_7;
wire [17:0] sum_Y_real_0_7;
wire [17:0] sum_Y_imag_0_7;
wire [17:0] sum_Y_real_hold_0_7;
wire [17:0] sum_Y_imag_hold_0_7;
wire [17:0] out_Y_idft_0_7;
reg [17:0] reg_Y_0_7;
wire [17:0] Y_imag_0_8;
wire [17:0] Y_real_0_8;
wire [17:0] sum_Y_real_0_8;
wire [17:0] sum_Y_imag_0_8;
wire [17:0] sum_Y_real_hold_0_8;
wire [17:0] sum_Y_imag_hold_0_8;
wire [17:0] out_Y_idft_0_8;
reg [17:0] reg_Y_0_8;
wire [17:0] Y_imag_0_9;
wire [17:0] Y_real_0_9;
wire [17:0] sum_Y_real_0_9;
wire [17:0] sum_Y_imag_0_9;
wire [17:0] sum_Y_real_hold_0_9;
wire [17:0] sum_Y_imag_hold_0_9;
wire [17:0] out_Y_idft_0_9;
reg [17:0] reg_Y_0_9;
wire [17:0] Y_imag_0_10;
wire [17:0] Y_real_0_10;
wire [17:0] sum_Y_real_0_10;
wire [17:0] sum_Y_imag_0_10;
wire [17:0] sum_Y_real_hold_0_10;
wire [17:0] sum_Y_imag_hold_0_10;
wire [17:0] out_Y_idft_0_10;
reg [17:0] reg_Y_0_10;
wire [17:0] Y_imag_0_11;
wire [17:0] Y_real_0_11;
wire [17:0] sum_Y_real_0_11;
wire [17:0] sum_Y_imag_0_11;
wire [17:0] sum_Y_real_hold_0_11;
wire [17:0] sum_Y_imag_hold_0_11;
wire [17:0] out_Y_idft_0_11;
reg [17:0] reg_Y_0_11;
wire [17:0] Y_imag_0_12;
wire [17:0] Y_real_0_12;
wire [17:0] sum_Y_real_0_12;
wire [17:0] sum_Y_imag_0_12;
wire [17:0] sum_Y_real_hold_0_12;
wire [17:0] sum_Y_imag_hold_0_12;
wire [17:0] out_Y_idft_0_12;
reg [17:0] reg_Y_0_12;
wire [17:0] Y_imag_0_13;
wire [17:0] Y_real_0_13;
wire [17:0] sum_Y_real_0_13;
wire [17:0] sum_Y_imag_0_13;
wire [17:0] sum_Y_real_hold_0_13;
wire [17:0] sum_Y_imag_hold_0_13;
wire [17:0] out_Y_idft_0_13;
reg [17:0] reg_Y_0_13;
wire [17:0] Y_imag_0_14;
wire [17:0] Y_real_0_14;
wire [17:0] sum_Y_real_0_14;
wire [17:0] sum_Y_imag_0_14;
wire [17:0] sum_Y_real_hold_0_14;
wire [17:0] sum_Y_imag_hold_0_14;
wire [17:0] out_Y_idft_0_14;
reg [17:0] reg_Y_0_14;
wire [17:0] Y_imag_0_15;
wire [17:0] Y_real_0_15;
wire [17:0] sum_Y_real_0_15;
wire [17:0] sum_Y_imag_0_15;
wire [17:0] sum_Y_real_hold_0_15;
wire [17:0] sum_Y_imag_hold_0_15;
wire [17:0] out_Y_idft_0_15;
reg [17:0] reg_Y_0_15;
wire [17:0] Y_imag_1_0;
wire [17:0] Y_real_1_0;
wire [17:0] sum_Y_real_1_0;
wire [17:0] sum_Y_imag_1_0;
wire [17:0] sum_Y_real_hold_1_0;
wire [17:0] sum_Y_imag_hold_1_0;
wire [17:0] out_Y_idft_1_0;
reg [17:0] reg_Y_1_0;
wire [17:0] Y_imag_1_1;
wire [17:0] Y_real_1_1;
wire [17:0] sum_Y_real_1_1;
wire [17:0] sum_Y_imag_1_1;
wire [17:0] sum_Y_real_hold_1_1;
wire [17:0] sum_Y_imag_hold_1_1;
wire [17:0] out_Y_idft_1_1;
reg [17:0] reg_Y_1_1;
wire [17:0] Y_imag_1_2;
wire [17:0] Y_real_1_2;
wire [17:0] sum_Y_real_1_2;
wire [17:0] sum_Y_imag_1_2;
wire [17:0] sum_Y_real_hold_1_2;
wire [17:0] sum_Y_imag_hold_1_2;
wire [17:0] out_Y_idft_1_2;
reg [17:0] reg_Y_1_2;
wire [17:0] Y_imag_1_3;
wire [17:0] Y_real_1_3;
wire [17:0] sum_Y_real_1_3;
wire [17:0] sum_Y_imag_1_3;
wire [17:0] sum_Y_real_hold_1_3;
wire [17:0] sum_Y_imag_hold_1_3;
wire [17:0] out_Y_idft_1_3;
reg [17:0] reg_Y_1_3;
wire [17:0] Y_imag_1_4;
wire [17:0] Y_real_1_4;
wire [17:0] sum_Y_real_1_4;
wire [17:0] sum_Y_imag_1_4;
wire [17:0] sum_Y_real_hold_1_4;
wire [17:0] sum_Y_imag_hold_1_4;
wire [17:0] out_Y_idft_1_4;
reg [17:0] reg_Y_1_4;
wire [17:0] Y_imag_1_5;
wire [17:0] Y_real_1_5;
wire [17:0] sum_Y_real_1_5;
wire [17:0] sum_Y_imag_1_5;
wire [17:0] sum_Y_real_hold_1_5;
wire [17:0] sum_Y_imag_hold_1_5;
wire [17:0] out_Y_idft_1_5;
reg [17:0] reg_Y_1_5;
wire [17:0] Y_imag_1_6;
wire [17:0] Y_real_1_6;
wire [17:0] sum_Y_real_1_6;
wire [17:0] sum_Y_imag_1_6;
wire [17:0] sum_Y_real_hold_1_6;
wire [17:0] sum_Y_imag_hold_1_6;
wire [17:0] out_Y_idft_1_6;
reg [17:0] reg_Y_1_6;
wire [17:0] Y_imag_1_7;
wire [17:0] Y_real_1_7;
wire [17:0] sum_Y_real_1_7;
wire [17:0] sum_Y_imag_1_7;
wire [17:0] sum_Y_real_hold_1_7;
wire [17:0] sum_Y_imag_hold_1_7;
wire [17:0] out_Y_idft_1_7;
reg [17:0] reg_Y_1_7;
wire [17:0] Y_imag_1_8;
wire [17:0] Y_real_1_8;
wire [17:0] sum_Y_real_1_8;
wire [17:0] sum_Y_imag_1_8;
wire [17:0] sum_Y_real_hold_1_8;
wire [17:0] sum_Y_imag_hold_1_8;
wire [17:0] out_Y_idft_1_8;
reg [17:0] reg_Y_1_8;
wire [17:0] Y_imag_1_9;
wire [17:0] Y_real_1_9;
wire [17:0] sum_Y_real_1_9;
wire [17:0] sum_Y_imag_1_9;
wire [17:0] sum_Y_real_hold_1_9;
wire [17:0] sum_Y_imag_hold_1_9;
wire [17:0] out_Y_idft_1_9;
reg [17:0] reg_Y_1_9;
wire [17:0] Y_imag_1_10;
wire [17:0] Y_real_1_10;
wire [17:0] sum_Y_real_1_10;
wire [17:0] sum_Y_imag_1_10;
wire [17:0] sum_Y_real_hold_1_10;
wire [17:0] sum_Y_imag_hold_1_10;
wire [17:0] out_Y_idft_1_10;
reg [17:0] reg_Y_1_10;
wire [17:0] Y_imag_1_11;
wire [17:0] Y_real_1_11;
wire [17:0] sum_Y_real_1_11;
wire [17:0] sum_Y_imag_1_11;
wire [17:0] sum_Y_real_hold_1_11;
wire [17:0] sum_Y_imag_hold_1_11;
wire [17:0] out_Y_idft_1_11;
reg [17:0] reg_Y_1_11;
wire [17:0] Y_imag_1_12;
wire [17:0] Y_real_1_12;
wire [17:0] sum_Y_real_1_12;
wire [17:0] sum_Y_imag_1_12;
wire [17:0] sum_Y_real_hold_1_12;
wire [17:0] sum_Y_imag_hold_1_12;
wire [17:0] out_Y_idft_1_12;
reg [17:0] reg_Y_1_12;
wire [17:0] Y_imag_1_13;
wire [17:0] Y_real_1_13;
wire [17:0] sum_Y_real_1_13;
wire [17:0] sum_Y_imag_1_13;
wire [17:0] sum_Y_real_hold_1_13;
wire [17:0] sum_Y_imag_hold_1_13;
wire [17:0] out_Y_idft_1_13;
reg [17:0] reg_Y_1_13;
wire [17:0] Y_imag_1_14;
wire [17:0] Y_real_1_14;
wire [17:0] sum_Y_real_1_14;
wire [17:0] sum_Y_imag_1_14;
wire [17:0] sum_Y_real_hold_1_14;
wire [17:0] sum_Y_imag_hold_1_14;
wire [17:0] out_Y_idft_1_14;
reg [17:0] reg_Y_1_14;
wire [17:0] Y_imag_1_15;
wire [17:0] Y_real_1_15;
wire [17:0] sum_Y_real_1_15;
wire [17:0] sum_Y_imag_1_15;
wire [17:0] sum_Y_real_hold_1_15;
wire [17:0] sum_Y_imag_hold_1_15;
wire [17:0] out_Y_idft_1_15;
reg [17:0] reg_Y_1_15;
reg reg_o_valid;

// Enable whenever the reciever is ready
wire enable;
assign enable = i_ready;
c_matrix_vec_mult_core_18_10_16_2_1 c_matrix_vec_mult_core_18_10_16_2_1_inst (
	.clk(clk),
	.reset(reset),
	.i_ready(i_ready),
	.i_valid(i_valid),
	.i_X_0(i_X_0),
	.i_X_1(i_X_1),
	.i_X_2(i_X_2),
	.i_X_3(i_X_3),
	.i_X_4(i_X_4),
	.i_X_5(i_X_5),
	.i_X_6(i_X_6),
	.i_X_7(i_X_7),
	.i_X_8(i_X_8),
	.i_X_9(i_X_9),
	.i_X_10(i_X_10),
	.i_X_11(i_X_11),
	.i_X_12(i_X_12),
	.i_X_13(i_X_13),
	.i_X_14(i_X_14),
	.i_X_15(i_X_15),
	.i_W_real_0_0(i_W_real_0_0),
	.i_W_imag_0_0(i_W_imag_0_0),
	.i_W_real_0_1(i_W_real_0_1),
	.i_W_imag_0_1(i_W_imag_0_1),
	.i_W_real_0_2(i_W_real_0_2),
	.i_W_imag_0_2(i_W_imag_0_2),
	.i_W_real_0_3(i_W_real_0_3),
	.i_W_imag_0_3(i_W_imag_0_3),
	.i_W_real_0_4(i_W_real_0_4),
	.i_W_imag_0_4(i_W_imag_0_4),
	.i_W_real_0_5(i_W_real_0_5),
	.i_W_imag_0_5(i_W_imag_0_5),
	.i_W_real_0_6(i_W_real_0_6),
	.i_W_imag_0_6(i_W_imag_0_6),
	.i_W_real_0_7(i_W_real_0_7),
	.i_W_imag_0_7(i_W_imag_0_7),
	.i_W_real_0_8(i_W_real_0_8),
	.i_W_imag_0_8(i_W_imag_0_8),
	.i_W_real_1_0(i_W_real_1_0),
	.i_W_imag_1_0(i_W_imag_1_0),
	.i_W_real_1_1(i_W_real_1_1),
	.i_W_imag_1_1(i_W_imag_1_1),
	.i_W_real_1_2(i_W_real_1_2),
	.i_W_imag_1_2(i_W_imag_1_2),
	.i_W_real_1_3(i_W_real_1_3),
	.i_W_imag_1_3(i_W_imag_1_3),
	.i_W_real_1_4(i_W_real_1_4),
	.i_W_imag_1_4(i_W_imag_1_4),
	.i_W_real_1_5(i_W_real_1_5),
	.i_W_imag_1_5(i_W_imag_1_5),
	.i_W_real_1_6(i_W_real_1_6),
	.i_W_imag_1_6(i_W_imag_1_6),
	.i_W_real_1_7(i_W_real_1_7),
	.i_W_imag_1_7(i_W_imag_1_7),
	.i_W_real_1_8(i_W_real_1_8),
	.i_W_imag_1_8(i_W_imag_1_8),
	.o_Y_real_0_0(Y_real_0_0),
	.o_Y_imag_0_0(Y_imag_0_0),
	.o_Y_real_0_1(Y_real_0_1),
	.o_Y_imag_0_1(Y_imag_0_1),
	.o_Y_real_0_2(Y_real_0_2),
	.o_Y_imag_0_2(Y_imag_0_2),
	.o_Y_real_0_3(Y_real_0_3),
	.o_Y_imag_0_3(Y_imag_0_3),
	.o_Y_real_0_4(Y_real_0_4),
	.o_Y_imag_0_4(Y_imag_0_4),
	.o_Y_real_0_5(Y_real_0_5),
	.o_Y_imag_0_5(Y_imag_0_5),
	.o_Y_real_0_6(Y_real_0_6),
	.o_Y_imag_0_6(Y_imag_0_6),
	.o_Y_real_0_7(Y_real_0_7),
	.o_Y_imag_0_7(Y_imag_0_7),
	.o_Y_real_0_8(Y_real_0_8),
	.o_Y_imag_0_8(Y_imag_0_8),
	.o_Y_real_0_9(Y_real_0_9),
	.o_Y_imag_0_9(Y_imag_0_9),
	.o_Y_real_0_10(Y_real_0_10),
	.o_Y_imag_0_10(Y_imag_0_10),
	.o_Y_real_0_11(Y_real_0_11),
	.o_Y_imag_0_11(Y_imag_0_11),
	.o_Y_real_0_12(Y_real_0_12),
	.o_Y_imag_0_12(Y_imag_0_12),
	.o_Y_real_0_13(Y_real_0_13),
	.o_Y_imag_0_13(Y_imag_0_13),
	.o_Y_real_0_14(Y_real_0_14),
	.o_Y_imag_0_14(Y_imag_0_14),
	.o_Y_real_0_15(Y_real_0_15),
	.o_Y_imag_0_15(Y_imag_0_15),
	.o_Y_real_1_0(Y_real_1_0),
	.o_Y_imag_1_0(Y_imag_1_0),
	.o_Y_real_1_1(Y_real_1_1),
	.o_Y_imag_1_1(Y_imag_1_1),
	.o_Y_real_1_2(Y_real_1_2),
	.o_Y_imag_1_2(Y_imag_1_2),
	.o_Y_real_1_3(Y_real_1_3),
	.o_Y_imag_1_3(Y_imag_1_3),
	.o_Y_real_1_4(Y_real_1_4),
	.o_Y_imag_1_4(Y_imag_1_4),
	.o_Y_real_1_5(Y_real_1_5),
	.o_Y_imag_1_5(Y_imag_1_5),
	.o_Y_real_1_6(Y_real_1_6),
	.o_Y_imag_1_6(Y_imag_1_6),
	.o_Y_real_1_7(Y_real_1_7),
	.o_Y_imag_1_7(Y_imag_1_7),
	.o_Y_real_1_8(Y_real_1_8),
	.o_Y_imag_1_8(Y_imag_1_8),
	.o_Y_real_1_9(Y_real_1_9),
	.o_Y_imag_1_9(Y_imag_1_9),
	.o_Y_real_1_10(Y_real_1_10),
	.o_Y_imag_1_10(Y_imag_1_10),
	.o_Y_real_1_11(Y_real_1_11),
	.o_Y_imag_1_11(Y_imag_1_11),
	.o_Y_real_1_12(Y_real_1_12),
	.o_Y_imag_1_12(Y_imag_1_12),
	.o_Y_real_1_13(Y_real_1_13),
	.o_Y_imag_1_13(Y_imag_1_13),
	.o_Y_real_1_14(Y_real_1_14),
	.o_Y_imag_1_14(Y_imag_1_14),
	.o_Y_real_1_15(Y_real_1_15),
	.o_Y_imag_1_15(Y_imag_1_15),
	.o_ready(matrix_vec_mult_ready),
	.o_valid(matrix_vec_mult_valid)
);

sum_complex_vector_unit_18_18_16_42 sum_complex_vector_unit_18_18_16_42_inst_0 (
	.clk(clk),
	.clr(reset),
	.enable(enable),
	.i_valid(matrix_vec_mult_valid),
	.i_real_0(Y_real_0_0),
	.i_imag_0(Y_imag_0_0),
	.o_real_0(sum_Y_real_0_0),
	.o_imag_0(sum_Y_imag_0_0),
	.i_real_1(Y_real_0_1),
	.i_imag_1(Y_imag_0_1),
	.o_real_1(sum_Y_real_0_1),
	.o_imag_1(sum_Y_imag_0_1),
	.i_real_2(Y_real_0_2),
	.i_imag_2(Y_imag_0_2),
	.o_real_2(sum_Y_real_0_2),
	.o_imag_2(sum_Y_imag_0_2),
	.i_real_3(Y_real_0_3),
	.i_imag_3(Y_imag_0_3),
	.o_real_3(sum_Y_real_0_3),
	.o_imag_3(sum_Y_imag_0_3),
	.i_real_4(Y_real_0_4),
	.i_imag_4(Y_imag_0_4),
	.o_real_4(sum_Y_real_0_4),
	.o_imag_4(sum_Y_imag_0_4),
	.i_real_5(Y_real_0_5),
	.i_imag_5(Y_imag_0_5),
	.o_real_5(sum_Y_real_0_5),
	.o_imag_5(sum_Y_imag_0_5),
	.i_real_6(Y_real_0_6),
	.i_imag_6(Y_imag_0_6),
	.o_real_6(sum_Y_real_0_6),
	.o_imag_6(sum_Y_imag_0_6),
	.i_real_7(Y_real_0_7),
	.i_imag_7(Y_imag_0_7),
	.o_real_7(sum_Y_real_0_7),
	.o_imag_7(sum_Y_imag_0_7),
	.i_real_8(Y_real_0_8),
	.i_imag_8(Y_imag_0_8),
	.o_real_8(sum_Y_real_0_8),
	.o_imag_8(sum_Y_imag_0_8),
	.i_real_9(Y_real_0_9),
	.i_imag_9(Y_imag_0_9),
	.o_real_9(sum_Y_real_0_9),
	.o_imag_9(sum_Y_imag_0_9),
	.i_real_10(Y_real_0_10),
	.i_imag_10(Y_imag_0_10),
	.o_real_10(sum_Y_real_0_10),
	.o_imag_10(sum_Y_imag_0_10),
	.i_real_11(Y_real_0_11),
	.i_imag_11(Y_imag_0_11),
	.o_real_11(sum_Y_real_0_11),
	.o_imag_11(sum_Y_imag_0_11),
	.i_real_12(Y_real_0_12),
	.i_imag_12(Y_imag_0_12),
	.o_real_12(sum_Y_real_0_12),
	.o_imag_12(sum_Y_imag_0_12),
	.i_real_13(Y_real_0_13),
	.i_imag_13(Y_imag_0_13),
	.o_real_13(sum_Y_real_0_13),
	.o_imag_13(sum_Y_imag_0_13),
	.i_real_14(Y_real_0_14),
	.i_imag_14(Y_imag_0_14),
	.o_real_14(sum_Y_real_0_14),
	.o_imag_14(sum_Y_imag_0_14),
	.i_real_15(Y_real_0_15),
	.i_imag_15(Y_imag_0_15),
	.o_real_15(sum_Y_real_0_15),
	.o_imag_15(sum_Y_imag_0_15),
	.o_valid(accum_valid_0)
);

sum_complex_vector_unit_18_18_16_42 sum_complex_vector_unit_18_18_16_42_inst_1 (
	.clk(clk),
	.clr(reset),
	.enable(enable),
	.i_valid(matrix_vec_mult_valid),
	.i_real_0(Y_real_1_0),
	.i_imag_0(Y_imag_1_0),
	.o_real_0(sum_Y_real_1_0),
	.o_imag_0(sum_Y_imag_1_0),
	.i_real_1(Y_real_1_1),
	.i_imag_1(Y_imag_1_1),
	.o_real_1(sum_Y_real_1_1),
	.o_imag_1(sum_Y_imag_1_1),
	.i_real_2(Y_real_1_2),
	.i_imag_2(Y_imag_1_2),
	.o_real_2(sum_Y_real_1_2),
	.o_imag_2(sum_Y_imag_1_2),
	.i_real_3(Y_real_1_3),
	.i_imag_3(Y_imag_1_3),
	.o_real_3(sum_Y_real_1_3),
	.o_imag_3(sum_Y_imag_1_3),
	.i_real_4(Y_real_1_4),
	.i_imag_4(Y_imag_1_4),
	.o_real_4(sum_Y_real_1_4),
	.o_imag_4(sum_Y_imag_1_4),
	.i_real_5(Y_real_1_5),
	.i_imag_5(Y_imag_1_5),
	.o_real_5(sum_Y_real_1_5),
	.o_imag_5(sum_Y_imag_1_5),
	.i_real_6(Y_real_1_6),
	.i_imag_6(Y_imag_1_6),
	.o_real_6(sum_Y_real_1_6),
	.o_imag_6(sum_Y_imag_1_6),
	.i_real_7(Y_real_1_7),
	.i_imag_7(Y_imag_1_7),
	.o_real_7(sum_Y_real_1_7),
	.o_imag_7(sum_Y_imag_1_7),
	.i_real_8(Y_real_1_8),
	.i_imag_8(Y_imag_1_8),
	.o_real_8(sum_Y_real_1_8),
	.o_imag_8(sum_Y_imag_1_8),
	.i_real_9(Y_real_1_9),
	.i_imag_9(Y_imag_1_9),
	.o_real_9(sum_Y_real_1_9),
	.o_imag_9(sum_Y_imag_1_9),
	.i_real_10(Y_real_1_10),
	.i_imag_10(Y_imag_1_10),
	.o_real_10(sum_Y_real_1_10),
	.o_imag_10(sum_Y_imag_1_10),
	.i_real_11(Y_real_1_11),
	.i_imag_11(Y_imag_1_11),
	.o_real_11(sum_Y_real_1_11),
	.o_imag_11(sum_Y_imag_1_11),
	.i_real_12(Y_real_1_12),
	.i_imag_12(Y_imag_1_12),
	.o_real_12(sum_Y_real_1_12),
	.o_imag_12(sum_Y_imag_1_12),
	.i_real_13(Y_real_1_13),
	.i_imag_13(Y_imag_1_13),
	.o_real_13(sum_Y_real_1_13),
	.o_imag_13(sum_Y_imag_1_13),
	.i_real_14(Y_real_1_14),
	.i_imag_14(Y_imag_1_14),
	.o_real_14(sum_Y_real_1_14),
	.o_imag_14(sum_Y_imag_1_14),
	.i_real_15(Y_real_1_15),
	.i_imag_15(Y_imag_1_15),
	.o_real_15(sum_Y_real_1_15),
	.o_imag_15(sum_Y_imag_1_15),
	.o_valid(accum_valid_1)
);

shift_register_group_18_16_1 shift_register_group_18_16_1_inst_real_0 (
	.clk(clk),
	.enable(enable),
	.in_0(sum_Y_real_0_0),
	.out_0(sum_Y_real_hold_0_0),
	.in_1(sum_Y_real_0_1),
	.out_1(sum_Y_real_hold_0_1),
	.in_2(sum_Y_real_0_2),
	.out_2(sum_Y_real_hold_0_2),
	.in_3(sum_Y_real_0_3),
	.out_3(sum_Y_real_hold_0_3),
	.in_4(sum_Y_real_0_4),
	.out_4(sum_Y_real_hold_0_4),
	.in_5(sum_Y_real_0_5),
	.out_5(sum_Y_real_hold_0_5),
	.in_6(sum_Y_real_0_6),
	.out_6(sum_Y_real_hold_0_6),
	.in_7(sum_Y_real_0_7),
	.out_7(sum_Y_real_hold_0_7),
	.in_8(sum_Y_real_0_8),
	.out_8(sum_Y_real_hold_0_8),
	.in_9(sum_Y_real_0_9),
	.out_9(sum_Y_real_hold_0_9),
	.in_10(sum_Y_real_0_10),
	.out_10(sum_Y_real_hold_0_10),
	.in_11(sum_Y_real_0_11),
	.out_11(sum_Y_real_hold_0_11),
	.in_12(sum_Y_real_0_12),
	.out_12(sum_Y_real_hold_0_12),
	.in_13(sum_Y_real_0_13),
	.out_13(sum_Y_real_hold_0_13),
	.in_14(sum_Y_real_0_14),
	.out_14(sum_Y_real_hold_0_14),
	.in_15(sum_Y_real_0_15),
	.out_15(sum_Y_real_hold_0_15),
	.reset(reset)
);

shift_register_group_18_16_1 shift_register_group_18_16_1_inst_imag_0 (
	.clk(clk),
	.enable(enable),
	.in_0(sum_Y_imag_0_0),
	.out_0(sum_Y_imag_hold_0_0),
	.in_1(sum_Y_imag_0_1),
	.out_1(sum_Y_imag_hold_0_1),
	.in_2(sum_Y_imag_0_2),
	.out_2(sum_Y_imag_hold_0_2),
	.in_3(sum_Y_imag_0_3),
	.out_3(sum_Y_imag_hold_0_3),
	.in_4(sum_Y_imag_0_4),
	.out_4(sum_Y_imag_hold_0_4),
	.in_5(sum_Y_imag_0_5),
	.out_5(sum_Y_imag_hold_0_5),
	.in_6(sum_Y_imag_0_6),
	.out_6(sum_Y_imag_hold_0_6),
	.in_7(sum_Y_imag_0_7),
	.out_7(sum_Y_imag_hold_0_7),
	.in_8(sum_Y_imag_0_8),
	.out_8(sum_Y_imag_hold_0_8),
	.in_9(sum_Y_imag_0_9),
	.out_9(sum_Y_imag_hold_0_9),
	.in_10(sum_Y_imag_0_10),
	.out_10(sum_Y_imag_hold_0_10),
	.in_11(sum_Y_imag_0_11),
	.out_11(sum_Y_imag_hold_0_11),
	.in_12(sum_Y_imag_0_12),
	.out_12(sum_Y_imag_hold_0_12),
	.in_13(sum_Y_imag_0_13),
	.out_13(sum_Y_imag_hold_0_13),
	.in_14(sum_Y_imag_0_14),
	.out_14(sum_Y_imag_hold_0_14),
	.in_15(sum_Y_imag_0_15),
	.out_15(sum_Y_imag_hold_0_15),
	.reset(reset)
);

shift_register_group_18_16_1 shift_register_group_18_16_1_inst_real_1 (
	.clk(clk),
	.enable(enable),
	.in_0(sum_Y_real_1_0),
	.out_0(sum_Y_real_hold_1_0),
	.in_1(sum_Y_real_1_1),
	.out_1(sum_Y_real_hold_1_1),
	.in_2(sum_Y_real_1_2),
	.out_2(sum_Y_real_hold_1_2),
	.in_3(sum_Y_real_1_3),
	.out_3(sum_Y_real_hold_1_3),
	.in_4(sum_Y_real_1_4),
	.out_4(sum_Y_real_hold_1_4),
	.in_5(sum_Y_real_1_5),
	.out_5(sum_Y_real_hold_1_5),
	.in_6(sum_Y_real_1_6),
	.out_6(sum_Y_real_hold_1_6),
	.in_7(sum_Y_real_1_7),
	.out_7(sum_Y_real_hold_1_7),
	.in_8(sum_Y_real_1_8),
	.out_8(sum_Y_real_hold_1_8),
	.in_9(sum_Y_real_1_9),
	.out_9(sum_Y_real_hold_1_9),
	.in_10(sum_Y_real_1_10),
	.out_10(sum_Y_real_hold_1_10),
	.in_11(sum_Y_real_1_11),
	.out_11(sum_Y_real_hold_1_11),
	.in_12(sum_Y_real_1_12),
	.out_12(sum_Y_real_hold_1_12),
	.in_13(sum_Y_real_1_13),
	.out_13(sum_Y_real_hold_1_13),
	.in_14(sum_Y_real_1_14),
	.out_14(sum_Y_real_hold_1_14),
	.in_15(sum_Y_real_1_15),
	.out_15(sum_Y_real_hold_1_15),
	.reset(reset)
);

shift_register_group_18_16_1 shift_register_group_18_16_1_inst_imag_1 (
	.clk(clk),
	.enable(enable),
	.in_0(sum_Y_imag_1_0),
	.out_0(sum_Y_imag_hold_1_0),
	.in_1(sum_Y_imag_1_1),
	.out_1(sum_Y_imag_hold_1_1),
	.in_2(sum_Y_imag_1_2),
	.out_2(sum_Y_imag_hold_1_2),
	.in_3(sum_Y_imag_1_3),
	.out_3(sum_Y_imag_hold_1_3),
	.in_4(sum_Y_imag_1_4),
	.out_4(sum_Y_imag_hold_1_4),
	.in_5(sum_Y_imag_1_5),
	.out_5(sum_Y_imag_hold_1_5),
	.in_6(sum_Y_imag_1_6),
	.out_6(sum_Y_imag_hold_1_6),
	.in_7(sum_Y_imag_1_7),
	.out_7(sum_Y_imag_hold_1_7),
	.in_8(sum_Y_imag_1_8),
	.out_8(sum_Y_imag_hold_1_8),
	.in_9(sum_Y_imag_1_9),
	.out_9(sum_Y_imag_hold_1_9),
	.in_10(sum_Y_imag_1_10),
	.out_10(sum_Y_imag_hold_1_10),
	.in_11(sum_Y_imag_1_11),
	.out_11(sum_Y_imag_hold_1_11),
	.in_12(sum_Y_imag_1_12),
	.out_12(sum_Y_imag_hold_1_12),
	.in_13(sum_Y_imag_1_13),
	.out_13(sum_Y_imag_hold_1_13),
	.in_14(sum_Y_imag_1_14),
	.out_14(sum_Y_imag_hold_1_14),
	.in_15(sum_Y_imag_1_15),
	.out_15(sum_Y_imag_hold_1_15),
	.reset(reset)
);

idft_16_top_18 idft_16_top_18_inst_0 (
	.clk(clk),
	.reset(reset),
	.next(accum_valid_0),
	.X0(sum_Y_real_hold_0_0),
	.Y0(out_Y_idft_0_0),
	.X1(sum_Y_imag_hold_0_0),
	.Y1(),
	.X2(sum_Y_real_hold_0_1),
	.Y2(out_Y_idft_0_1),
	.X3(sum_Y_imag_hold_0_1),
	.Y3(),
	.X4(sum_Y_real_hold_0_2),
	.Y4(out_Y_idft_0_2),
	.X5(sum_Y_imag_hold_0_2),
	.Y5(),
	.X6(sum_Y_real_hold_0_3),
	.Y6(out_Y_idft_0_3),
	.X7(sum_Y_imag_hold_0_3),
	.Y7(),
	.X8(sum_Y_real_hold_0_4),
	.Y8(out_Y_idft_0_4),
	.X9(sum_Y_imag_hold_0_4),
	.Y9(),
	.X10(sum_Y_real_hold_0_5),
	.Y10(out_Y_idft_0_5),
	.X11(sum_Y_imag_hold_0_5),
	.Y11(),
	.X12(sum_Y_real_hold_0_6),
	.Y12(out_Y_idft_0_6),
	.X13(sum_Y_imag_hold_0_6),
	.Y13(),
	.X14(sum_Y_real_hold_0_7),
	.Y14(out_Y_idft_0_7),
	.X15(sum_Y_imag_hold_0_7),
	.Y15(),
	.X16(sum_Y_real_hold_0_8),
	.Y16(out_Y_idft_0_8),
	.X17(sum_Y_imag_hold_0_8),
	.Y17(),
	.X18(sum_Y_real_hold_0_9),
	.Y18(out_Y_idft_0_9),
	.X19(sum_Y_imag_hold_0_9),
	.Y19(),
	.X20(sum_Y_real_hold_0_10),
	.Y20(out_Y_idft_0_10),
	.X21(sum_Y_imag_hold_0_10),
	.Y21(),
	.X22(sum_Y_real_hold_0_11),
	.Y22(out_Y_idft_0_11),
	.X23(sum_Y_imag_hold_0_11),
	.Y23(),
	.X24(sum_Y_real_hold_0_12),
	.Y24(out_Y_idft_0_12),
	.X25(sum_Y_imag_hold_0_12),
	.Y25(),
	.X26(sum_Y_real_hold_0_13),
	.Y26(out_Y_idft_0_13),
	.X27(sum_Y_imag_hold_0_13),
	.Y27(),
	.X28(sum_Y_real_hold_0_14),
	.Y28(out_Y_idft_0_14),
	.X29(sum_Y_imag_hold_0_14),
	.Y29(),
	.X30(sum_Y_real_hold_0_15),
	.Y30(out_Y_idft_0_15),
	.X31(sum_Y_imag_hold_0_15),
	.Y31(),
	.next_out(idft_next_out_0)
);

idft_16_top_18 idft_16_top_18_inst_1 (
	.clk(clk),
	.reset(reset),
	.next(accum_valid_1),
	.X0(sum_Y_real_hold_1_0),
	.Y0(out_Y_idft_1_0),
	.X1(sum_Y_imag_hold_1_0),
	.Y1(),
	.X2(sum_Y_real_hold_1_1),
	.Y2(out_Y_idft_1_1),
	.X3(sum_Y_imag_hold_1_1),
	.Y3(),
	.X4(sum_Y_real_hold_1_2),
	.Y4(out_Y_idft_1_2),
	.X5(sum_Y_imag_hold_1_2),
	.Y5(),
	.X6(sum_Y_real_hold_1_3),
	.Y6(out_Y_idft_1_3),
	.X7(sum_Y_imag_hold_1_3),
	.Y7(),
	.X8(sum_Y_real_hold_1_4),
	.Y8(out_Y_idft_1_4),
	.X9(sum_Y_imag_hold_1_4),
	.Y9(),
	.X10(sum_Y_real_hold_1_5),
	.Y10(out_Y_idft_1_5),
	.X11(sum_Y_imag_hold_1_5),
	.Y11(),
	.X12(sum_Y_real_hold_1_6),
	.Y12(out_Y_idft_1_6),
	.X13(sum_Y_imag_hold_1_6),
	.Y13(),
	.X14(sum_Y_real_hold_1_7),
	.Y14(out_Y_idft_1_7),
	.X15(sum_Y_imag_hold_1_7),
	.Y15(),
	.X16(sum_Y_real_hold_1_8),
	.Y16(out_Y_idft_1_8),
	.X17(sum_Y_imag_hold_1_8),
	.Y17(),
	.X18(sum_Y_real_hold_1_9),
	.Y18(out_Y_idft_1_9),
	.X19(sum_Y_imag_hold_1_9),
	.Y19(),
	.X20(sum_Y_real_hold_1_10),
	.Y20(out_Y_idft_1_10),
	.X21(sum_Y_imag_hold_1_10),
	.Y21(),
	.X22(sum_Y_real_hold_1_11),
	.Y22(out_Y_idft_1_11),
	.X23(sum_Y_imag_hold_1_11),
	.Y23(),
	.X24(sum_Y_real_hold_1_12),
	.Y24(out_Y_idft_1_12),
	.X25(sum_Y_imag_hold_1_12),
	.Y25(),
	.X26(sum_Y_real_hold_1_13),
	.Y26(out_Y_idft_1_13),
	.X27(sum_Y_imag_hold_1_13),
	.Y27(),
	.X28(sum_Y_real_hold_1_14),
	.Y28(out_Y_idft_1_14),
	.X29(sum_Y_imag_hold_1_14),
	.Y29(),
	.X30(sum_Y_real_hold_1_15),
	.Y30(out_Y_idft_1_15),
	.X31(sum_Y_imag_hold_1_15),
	.Y31(),
	.next_out(idft_next_out_1)
);

always @ (posedge clk) begin
	if (reset) begin
		reg_Y_0_0 <= 0;
		reg_Y_0_1 <= 0;
		reg_Y_0_2 <= 0;
		reg_Y_0_3 <= 0;
		reg_Y_0_4 <= 0;
		reg_Y_0_5 <= 0;
		reg_Y_0_6 <= 0;
		reg_Y_0_7 <= 0;
		reg_Y_0_8 <= 0;
		reg_Y_0_9 <= 0;
		reg_Y_0_10 <= 0;
		reg_Y_0_11 <= 0;
		reg_Y_0_12 <= 0;
		reg_Y_0_13 <= 0;
		reg_Y_0_14 <= 0;
		reg_Y_0_15 <= 0;
		reg_Y_1_0 <= 0;
		reg_Y_1_1 <= 0;
		reg_Y_1_2 <= 0;
		reg_Y_1_3 <= 0;
		reg_Y_1_4 <= 0;
		reg_Y_1_5 <= 0;
		reg_Y_1_6 <= 0;
		reg_Y_1_7 <= 0;
		reg_Y_1_8 <= 0;
		reg_Y_1_9 <= 0;
		reg_Y_1_10 <= 0;
		reg_Y_1_11 <= 0;
		reg_Y_1_12 <= 0;
		reg_Y_1_13 <= 0;
		reg_Y_1_14 <= 0;
		reg_Y_1_15 <= 0;
		idft_out_valid <= 1'b0;
		reg_o_valid <= 1'b0;
	end else if (enable) begin
		reg_Y_0_0 <= (out_Y_idft_0_0 >>> 4);
		reg_Y_0_1 <= (out_Y_idft_0_1 >>> 4);
		reg_Y_0_2 <= (out_Y_idft_0_2 >>> 4);
		reg_Y_0_3 <= (out_Y_idft_0_3 >>> 4);
		reg_Y_0_4 <= (out_Y_idft_0_4 >>> 4);
		reg_Y_0_5 <= (out_Y_idft_0_5 >>> 4);
		reg_Y_0_6 <= (out_Y_idft_0_6 >>> 4);
		reg_Y_0_7 <= (out_Y_idft_0_7 >>> 4);
		reg_Y_0_8 <= (out_Y_idft_0_8 >>> 4);
		reg_Y_0_9 <= (out_Y_idft_0_9 >>> 4);
		reg_Y_0_10 <= (out_Y_idft_0_10 >>> 4);
		reg_Y_0_11 <= (out_Y_idft_0_11 >>> 4);
		reg_Y_0_12 <= (out_Y_idft_0_12 >>> 4);
		reg_Y_0_13 <= (out_Y_idft_0_13 >>> 4);
		reg_Y_0_14 <= (out_Y_idft_0_14 >>> 4);
		reg_Y_0_15 <= (out_Y_idft_0_15 >>> 4);
		reg_Y_1_0 <= (out_Y_idft_1_0 >>> 4);
		reg_Y_1_1 <= (out_Y_idft_1_1 >>> 4);
		reg_Y_1_2 <= (out_Y_idft_1_2 >>> 4);
		reg_Y_1_3 <= (out_Y_idft_1_3 >>> 4);
		reg_Y_1_4 <= (out_Y_idft_1_4 >>> 4);
		reg_Y_1_5 <= (out_Y_idft_1_5 >>> 4);
		reg_Y_1_6 <= (out_Y_idft_1_6 >>> 4);
		reg_Y_1_7 <= (out_Y_idft_1_7 >>> 4);
		reg_Y_1_8 <= (out_Y_idft_1_8 >>> 4);
		reg_Y_1_9 <= (out_Y_idft_1_9 >>> 4);
		reg_Y_1_10 <= (out_Y_idft_1_10 >>> 4);
		reg_Y_1_11 <= (out_Y_idft_1_11 >>> 4);
		reg_Y_1_12 <= (out_Y_idft_1_12 >>> 4);
		reg_Y_1_13 <= (out_Y_idft_1_13 >>> 4);
		reg_Y_1_14 <= (out_Y_idft_1_14 >>> 4);
		reg_Y_1_15 <= (out_Y_idft_1_15 >>> 4);
		idft_out_valid <= idft_next_out_0;
		reg_o_valid <= idft_out_valid;
	end
end

assign o_valid = enable & reg_o_valid;
assign o_ready = matrix_vec_mult_ready;
assign o_Y_0_0 = reg_Y_0_0;
assign o_Y_0_1 = reg_Y_0_1;
assign o_Y_0_2 = reg_Y_0_2;
assign o_Y_0_3 = reg_Y_0_3;
assign o_Y_0_4 = reg_Y_0_4;
assign o_Y_0_5 = reg_Y_0_5;
assign o_Y_0_6 = reg_Y_0_6;
assign o_Y_0_7 = reg_Y_0_7;
assign o_Y_0_8 = reg_Y_0_8;
assign o_Y_0_9 = reg_Y_0_9;
assign o_Y_0_10 = reg_Y_0_10;
assign o_Y_0_11 = reg_Y_0_11;
assign o_Y_0_12 = reg_Y_0_12;
assign o_Y_0_13 = reg_Y_0_13;
assign o_Y_0_14 = reg_Y_0_14;
assign o_Y_0_15 = reg_Y_0_15;
assign o_Y_1_0 = reg_Y_1_0;
assign o_Y_1_1 = reg_Y_1_1;
assign o_Y_1_2 = reg_Y_1_2;
assign o_Y_1_3 = reg_Y_1_3;
assign o_Y_1_4 = reg_Y_1_4;
assign o_Y_1_5 = reg_Y_1_5;
assign o_Y_1_6 = reg_Y_1_6;
assign o_Y_1_7 = reg_Y_1_7;
assign o_Y_1_8 = reg_Y_1_8;
assign o_Y_1_9 = reg_Y_1_9;
assign o_Y_1_10 = reg_Y_1_10;
assign o_Y_1_11 = reg_Y_1_11;
assign o_Y_1_12 = reg_Y_1_12;
assign o_Y_1_13 = reg_Y_1_13;
assign o_Y_1_14 = reg_Y_1_14;
assign o_Y_1_15 = reg_Y_1_15;

endmodule
module sum_complex_vector_unit_18_18_16_42 (
	input clk,
	input clr,
	input i_valid,
	input enable,
	input [17:0] i_real_0,
	input [17:0] i_imag_0,
	output [17:0] o_real_0,
	output [17:0] o_imag_0,
	input [17:0] i_real_1,
	input [17:0] i_imag_1,
	output [17:0] o_real_1,
	output [17:0] o_imag_1,
	input [17:0] i_real_2,
	input [17:0] i_imag_2,
	output [17:0] o_real_2,
	output [17:0] o_imag_2,
	input [17:0] i_real_3,
	input [17:0] i_imag_3,
	output [17:0] o_real_3,
	output [17:0] o_imag_3,
	input [17:0] i_real_4,
	input [17:0] i_imag_4,
	output [17:0] o_real_4,
	output [17:0] o_imag_4,
	input [17:0] i_real_5,
	input [17:0] i_imag_5,
	output [17:0] o_real_5,
	output [17:0] o_imag_5,
	input [17:0] i_real_6,
	input [17:0] i_imag_6,
	output [17:0] o_real_6,
	output [17:0] o_imag_6,
	input [17:0] i_real_7,
	input [17:0] i_imag_7,
	output [17:0] o_real_7,
	output [17:0] o_imag_7,
	input [17:0] i_real_8,
	input [17:0] i_imag_8,
	output [17:0] o_real_8,
	output [17:0] o_imag_8,
	input [17:0] i_real_9,
	input [17:0] i_imag_9,
	output [17:0] o_real_9,
	output [17:0] o_imag_9,
	input [17:0] i_real_10,
	input [17:0] i_imag_10,
	output [17:0] o_real_10,
	output [17:0] o_imag_10,
	input [17:0] i_real_11,
	input [17:0] i_imag_11,
	output [17:0] o_real_11,
	output [17:0] o_imag_11,
	input [17:0] i_real_12,
	input [17:0] i_imag_12,
	output [17:0] o_real_12,
	output [17:0] o_imag_12,
	input [17:0] i_real_13,
	input [17:0] i_imag_13,
	output [17:0] o_real_13,
	output [17:0] o_imag_13,
	input [17:0] i_real_14,
	input [17:0] i_imag_14,
	output [17:0] o_real_14,
	output [17:0] o_imag_14,
	input [17:0] i_real_15,
	input [17:0] i_imag_15,
	output [17:0] o_real_15,
	output [17:0] o_imag_15,
	output o_valid
);

reg [17:0] sum_real_0;
reg [17:0] sum_imag_0;
reg [17:0] sum_real_1;
reg [17:0] sum_imag_1;
reg [17:0] sum_real_2;
reg [17:0] sum_imag_2;
reg [17:0] sum_real_3;
reg [17:0] sum_imag_3;
reg [17:0] sum_real_4;
reg [17:0] sum_imag_4;
reg [17:0] sum_real_5;
reg [17:0] sum_imag_5;
reg [17:0] sum_real_6;
reg [17:0] sum_imag_6;
reg [17:0] sum_real_7;
reg [17:0] sum_imag_7;
reg [17:0] sum_real_8;
reg [17:0] sum_imag_8;
reg [17:0] sum_real_9;
reg [17:0] sum_imag_9;
reg [17:0] sum_real_10;
reg [17:0] sum_imag_10;
reg [17:0] sum_real_11;
reg [17:0] sum_imag_11;
reg [17:0] sum_real_12;
reg [17:0] sum_imag_12;
reg [17:0] sum_real_13;
reg [17:0] sum_imag_13;
reg [17:0] sum_real_14;
reg [17:0] sum_imag_14;
reg [17:0] sum_real_15;
reg [17:0] sum_imag_15;
reg reg_i_valid;

// Count the number data in accumulation
reg [13:0] counter;
wire counter_full;
always @ (posedge clk) begin 
	if (clr) begin
		sum_real_0 <= 0;
		sum_imag_0 <= 0;
		sum_real_1 <= 0;
		sum_imag_1 <= 0;
		sum_real_2 <= 0;
		sum_imag_2 <= 0;
		sum_real_3 <= 0;
		sum_imag_3 <= 0;
		sum_real_4 <= 0;
		sum_imag_4 <= 0;
		sum_real_5 <= 0;
		sum_imag_5 <= 0;
		sum_real_6 <= 0;
		sum_imag_6 <= 0;
		sum_real_7 <= 0;
		sum_imag_7 <= 0;
		sum_real_8 <= 0;
		sum_imag_8 <= 0;
		sum_real_9 <= 0;
		sum_imag_9 <= 0;
		sum_real_10 <= 0;
		sum_imag_10 <= 0;
		sum_real_11 <= 0;
		sum_imag_11 <= 0;
		sum_real_12 <= 0;
		sum_imag_12 <= 0;
		sum_real_13 <= 0;
		sum_imag_13 <= 0;
		sum_real_14 <= 0;
		sum_imag_14 <= 0;
		sum_real_15 <= 0;
		sum_imag_15 <= 0;
		counter <= 14'd0;
		reg_i_valid <= 1'b0;
	end else if (enable) begin
		reg_i_valid <= i_valid;
		// Accumulate the number only when data is valid
		if (i_valid) begin
			if (counter == 42)
				counter <= 1;
			else
				counter <= counter + 1;

			if (counter == 42) begin
				sum_real_0 <= i_real_0;
				sum_imag_0 <= i_imag_0;
				sum_real_1 <= i_real_1;
				sum_imag_1 <= i_imag_1;
				sum_real_2 <= i_real_2;
				sum_imag_2 <= i_imag_2;
				sum_real_3 <= i_real_3;
				sum_imag_3 <= i_imag_3;
				sum_real_4 <= i_real_4;
				sum_imag_4 <= i_imag_4;
				sum_real_5 <= i_real_5;
				sum_imag_5 <= i_imag_5;
				sum_real_6 <= i_real_6;
				sum_imag_6 <= i_imag_6;
				sum_real_7 <= i_real_7;
				sum_imag_7 <= i_imag_7;
				sum_real_8 <= i_real_8;
				sum_imag_8 <= i_imag_8;
				sum_real_9 <= i_real_9;
				sum_imag_9 <= i_imag_9;
				sum_real_10 <= i_real_10;
				sum_imag_10 <= i_imag_10;
				sum_real_11 <= i_real_11;
				sum_imag_11 <= i_imag_11;
				sum_real_12 <= i_real_12;
				sum_imag_12 <= i_imag_12;
				sum_real_13 <= i_real_13;
				sum_imag_13 <= i_imag_13;
				sum_real_14 <= i_real_14;
				sum_imag_14 <= i_imag_14;
				sum_real_15 <= i_real_15;
				sum_imag_15 <= i_imag_15;
			end else begin
				sum_real_0 <= sum_real_0 + i_real_0;
				sum_imag_0 <= sum_imag_0 + i_imag_0;
				sum_real_1 <= sum_real_1 + i_real_1;
				sum_imag_1 <= sum_imag_1 + i_imag_1;
				sum_real_2 <= sum_real_2 + i_real_2;
				sum_imag_2 <= sum_imag_2 + i_imag_2;
				sum_real_3 <= sum_real_3 + i_real_3;
				sum_imag_3 <= sum_imag_3 + i_imag_3;
				sum_real_4 <= sum_real_4 + i_real_4;
				sum_imag_4 <= sum_imag_4 + i_imag_4;
				sum_real_5 <= sum_real_5 + i_real_5;
				sum_imag_5 <= sum_imag_5 + i_imag_5;
				sum_real_6 <= sum_real_6 + i_real_6;
				sum_imag_6 <= sum_imag_6 + i_imag_6;
				sum_real_7 <= sum_real_7 + i_real_7;
				sum_imag_7 <= sum_imag_7 + i_imag_7;
				sum_real_8 <= sum_real_8 + i_real_8;
				sum_imag_8 <= sum_imag_8 + i_imag_8;
				sum_real_9 <= sum_real_9 + i_real_9;
				sum_imag_9 <= sum_imag_9 + i_imag_9;
				sum_real_10 <= sum_real_10 + i_real_10;
				sum_imag_10 <= sum_imag_10 + i_imag_10;
				sum_real_11 <= sum_real_11 + i_real_11;
				sum_imag_11 <= sum_imag_11 + i_imag_11;
				sum_real_12 <= sum_real_12 + i_real_12;
				sum_imag_12 <= sum_imag_12 + i_imag_12;
				sum_real_13 <= sum_real_13 + i_real_13;
				sum_imag_13 <= sum_imag_13 + i_imag_13;
				sum_real_14 <= sum_real_14 + i_real_14;
				sum_imag_14 <= sum_imag_14 + i_imag_14;
				sum_real_15 <= sum_real_15 + i_real_15;
				sum_imag_15 <= sum_imag_15 + i_imag_15;
			end
		end
	end
end

assign counter_full = (counter == 42);
assign o_real_0 = sum_real_0;
assign o_imag_0 = sum_imag_0;
assign o_real_1 = sum_real_1;
assign o_imag_1 = sum_imag_1;
assign o_real_2 = sum_real_2;
assign o_imag_2 = sum_imag_2;
assign o_real_3 = sum_real_3;
assign o_imag_3 = sum_imag_3;
assign o_real_4 = sum_real_4;
assign o_imag_4 = sum_imag_4;
assign o_real_5 = sum_real_5;
assign o_imag_5 = sum_imag_5;
assign o_real_6 = sum_real_6;
assign o_imag_6 = sum_imag_6;
assign o_real_7 = sum_real_7;
assign o_imag_7 = sum_imag_7;
assign o_real_8 = sum_real_8;
assign o_imag_8 = sum_imag_8;
assign o_real_9 = sum_real_9;
assign o_imag_9 = sum_imag_9;
assign o_real_10 = sum_real_10;
assign o_imag_10 = sum_imag_10;
assign o_real_11 = sum_real_11;
assign o_imag_11 = sum_imag_11;
assign o_real_12 = sum_real_12;
assign o_imag_12 = sum_imag_12;
assign o_real_13 = sum_real_13;
assign o_imag_13 = sum_imag_13;
assign o_real_14 = sum_real_14;
assign o_imag_14 = sum_imag_14;
assign o_real_15 = sum_real_15;
assign o_imag_15 = sum_imag_15;
assign o_valid = counter_full & reg_i_valid;

endmodule

module c_matrix_vec_mult_core_18_10_16_2_1 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] i_X_0,
	input [17:0] i_X_1,
	input [17:0] i_X_2,
	input [17:0] i_X_3,
	input [17:0] i_X_4,
	input [17:0] i_X_5,
	input [17:0] i_X_6,
	input [17:0] i_X_7,
	input [17:0] i_X_8,
	input [17:0] i_X_9,
	input [17:0] i_X_10,
	input [17:0] i_X_11,
	input [17:0] i_X_12,
	input [17:0] i_X_13,
	input [17:0] i_X_14,
	input [17:0] i_X_15,
	input [17:0] i_W_real_0_0,
	input [17:0] i_W_imag_0_0,
	input [17:0] i_W_real_0_1,
	input [17:0] i_W_imag_0_1,
	input [17:0] i_W_real_0_2,
	input [17:0] i_W_imag_0_2,
	input [17:0] i_W_real_0_3,
	input [17:0] i_W_imag_0_3,
	input [17:0] i_W_real_0_4,
	input [17:0] i_W_imag_0_4,
	input [17:0] i_W_real_0_5,
	input [17:0] i_W_imag_0_5,
	input [17:0] i_W_real_0_6,
	input [17:0] i_W_imag_0_6,
	input [17:0] i_W_real_0_7,
	input [17:0] i_W_imag_0_7,
	input [17:0] i_W_real_0_8,
	input [17:0] i_W_imag_0_8,
	input [17:0] i_W_real_1_0,
	input [17:0] i_W_imag_1_0,
	input [17:0] i_W_real_1_1,
	input [17:0] i_W_imag_1_1,
	input [17:0] i_W_real_1_2,
	input [17:0] i_W_imag_1_2,
	input [17:0] i_W_real_1_3,
	input [17:0] i_W_imag_1_3,
	input [17:0] i_W_real_1_4,
	input [17:0] i_W_imag_1_4,
	input [17:0] i_W_real_1_5,
	input [17:0] i_W_imag_1_5,
	input [17:0] i_W_real_1_6,
	input [17:0] i_W_imag_1_6,
	input [17:0] i_W_real_1_7,
	input [17:0] i_W_imag_1_7,
	input [17:0] i_W_real_1_8,
	input [17:0] i_W_imag_1_8,
	output [17:0] o_Y_real_0_0,
	output [17:0] o_Y_imag_0_0,
	output [17:0] o_Y_real_0_1,
	output [17:0] o_Y_imag_0_1,
	output [17:0] o_Y_real_0_2,
	output [17:0] o_Y_imag_0_2,
	output [17:0] o_Y_real_0_3,
	output [17:0] o_Y_imag_0_3,
	output [17:0] o_Y_real_0_4,
	output [17:0] o_Y_imag_0_4,
	output [17:0] o_Y_real_0_5,
	output [17:0] o_Y_imag_0_5,
	output [17:0] o_Y_real_0_6,
	output [17:0] o_Y_imag_0_6,
	output [17:0] o_Y_real_0_7,
	output [17:0] o_Y_imag_0_7,
	output [17:0] o_Y_real_0_8,
	output [17:0] o_Y_imag_0_8,
	output [17:0] o_Y_real_0_9,
	output [17:0] o_Y_imag_0_9,
	output [17:0] o_Y_real_0_10,
	output [17:0] o_Y_imag_0_10,
	output [17:0] o_Y_real_0_11,
	output [17:0] o_Y_imag_0_11,
	output [17:0] o_Y_real_0_12,
	output [17:0] o_Y_imag_0_12,
	output [17:0] o_Y_real_0_13,
	output [17:0] o_Y_imag_0_13,
	output [17:0] o_Y_real_0_14,
	output [17:0] o_Y_imag_0_14,
	output [17:0] o_Y_real_0_15,
	output [17:0] o_Y_imag_0_15,
	output [17:0] o_Y_real_1_0,
	output [17:0] o_Y_imag_1_0,
	output [17:0] o_Y_real_1_1,
	output [17:0] o_Y_imag_1_1,
	output [17:0] o_Y_real_1_2,
	output [17:0] o_Y_imag_1_2,
	output [17:0] o_Y_real_1_3,
	output [17:0] o_Y_imag_1_3,
	output [17:0] o_Y_real_1_4,
	output [17:0] o_Y_imag_1_4,
	output [17:0] o_Y_real_1_5,
	output [17:0] o_Y_imag_1_5,
	output [17:0] o_Y_real_1_6,
	output [17:0] o_Y_imag_1_6,
	output [17:0] o_Y_real_1_7,
	output [17:0] o_Y_imag_1_7,
	output [17:0] o_Y_real_1_8,
	output [17:0] o_Y_imag_1_8,
	output [17:0] o_Y_real_1_9,
	output [17:0] o_Y_imag_1_9,
	output [17:0] o_Y_real_1_10,
	output [17:0] o_Y_imag_1_10,
	output [17:0] o_Y_real_1_11,
	output [17:0] o_Y_imag_1_11,
	output [17:0] o_Y_real_1_12,
	output [17:0] o_Y_imag_1_12,
	output [17:0] o_Y_real_1_13,
	output [17:0] o_Y_imag_1_13,
	output [17:0] o_Y_real_1_14,
	output [17:0] o_Y_imag_1_14,
	output [17:0] o_Y_real_1_15,
	output [17:0] o_Y_imag_1_15,
	output o_ready,
	output o_valid
);

// Enable whenever reciever is ready
wire enable;
assign enable = i_ready;
// Register the inputs
reg [17:0] reg_X_0;
reg [17:0] reg_X_2_0;
reg [17:0] reg_X_1;
reg [17:0] reg_X_2_1;
reg [17:0] reg_X_2;
reg [17:0] reg_X_2_2;
reg [17:0] reg_X_3;
reg [17:0] reg_X_2_3;
reg [17:0] reg_X_4;
reg [17:0] reg_X_2_4;
reg [17:0] reg_X_5;
reg [17:0] reg_X_2_5;
reg [17:0] reg_X_6;
reg [17:0] reg_X_2_6;
reg [17:0] reg_X_7;
reg [17:0] reg_X_2_7;
reg [17:0] reg_X_8;
reg [17:0] reg_X_2_8;
reg [17:0] reg_X_9;
reg [17:0] reg_X_2_9;
reg [17:0] reg_X_10;
reg [17:0] reg_X_2_10;
reg [17:0] reg_X_11;
reg [17:0] reg_X_2_11;
reg [17:0] reg_X_12;
reg [17:0] reg_X_2_12;
reg [17:0] reg_X_13;
reg [17:0] reg_X_2_13;
reg [17:0] reg_X_14;
reg [17:0] reg_X_2_14;
reg [17:0] reg_X_15;
reg [17:0] reg_X_2_15;
reg [17:0] reg_W_real_0_0;
reg [17:0] reg_W_imag_0_0;
reg [17:0] reg_W_real_0_1;
reg [17:0] reg_W_imag_0_1;
reg [17:0] reg_W_real_0_2;
reg [17:0] reg_W_imag_0_2;
reg [17:0] reg_W_real_0_3;
reg [17:0] reg_W_imag_0_3;
reg [17:0] reg_W_real_0_4;
reg [17:0] reg_W_imag_0_4;
reg [17:0] reg_W_real_0_5;
reg [17:0] reg_W_imag_0_5;
reg [17:0] reg_W_real_0_6;
reg [17:0] reg_W_imag_0_6;
reg [17:0] reg_W_real_0_7;
reg [17:0] reg_W_imag_0_7;
reg [17:0] reg_W_real_0_8;
reg [17:0] reg_W_imag_0_8;
reg [17:0] reg_W_real_1_0;
reg [17:0] reg_W_imag_1_0;
reg [17:0] reg_W_real_1_1;
reg [17:0] reg_W_imag_1_1;
reg [17:0] reg_W_real_1_2;
reg [17:0] reg_W_imag_1_2;
reg [17:0] reg_W_real_1_3;
reg [17:0] reg_W_imag_1_3;
reg [17:0] reg_W_real_1_4;
reg [17:0] reg_W_imag_1_4;
reg [17:0] reg_W_real_1_5;
reg [17:0] reg_W_imag_1_5;
reg [17:0] reg_W_real_1_6;
reg [17:0] reg_W_imag_1_6;
reg [17:0] reg_W_real_1_7;
reg [17:0] reg_W_imag_1_7;
reg [17:0] reg_W_real_1_8;
reg [17:0] reg_W_imag_1_8;
reg reg_i_valid;

// Register the outputs
reg [17:0] reg_Y_real_0_0;
reg [17:0] reg_Y_imag_0_0;
reg [17:0] reg_Y_real_0_1;
reg [17:0] reg_Y_imag_0_1;
reg [17:0] reg_Y_real_0_2;
reg [17:0] reg_Y_imag_0_2;
reg [17:0] reg_Y_real_0_3;
reg [17:0] reg_Y_imag_0_3;
reg [17:0] reg_Y_real_0_4;
reg [17:0] reg_Y_imag_0_4;
reg [17:0] reg_Y_real_0_5;
reg [17:0] reg_Y_imag_0_5;
reg [17:0] reg_Y_real_0_6;
reg [17:0] reg_Y_imag_0_6;
reg [17:0] reg_Y_real_0_7;
reg [17:0] reg_Y_imag_0_7;
reg [17:0] reg_Y_real_0_8;
reg [17:0] reg_Y_imag_0_8;
reg [17:0] reg_Y_real_0_9;
reg [17:0] reg_Y_imag_0_9;
reg [17:0] reg_Y_real_0_10;
reg [17:0] reg_Y_imag_0_10;
reg [17:0] reg_Y_real_0_11;
reg [17:0] reg_Y_imag_0_11;
reg [17:0] reg_Y_real_0_12;
reg [17:0] reg_Y_imag_0_12;
reg [17:0] reg_Y_real_0_13;
reg [17:0] reg_Y_imag_0_13;
reg [17:0] reg_Y_real_0_14;
reg [17:0] reg_Y_imag_0_14;
reg [17:0] reg_Y_real_0_15;
reg [17:0] reg_Y_imag_0_15;
reg [17:0] reg_Y_real_1_0;
reg [17:0] reg_Y_imag_1_0;
reg [17:0] reg_Y_real_1_1;
reg [17:0] reg_Y_imag_1_1;
reg [17:0] reg_Y_real_1_2;
reg [17:0] reg_Y_imag_1_2;
reg [17:0] reg_Y_real_1_3;
reg [17:0] reg_Y_imag_1_3;
reg [17:0] reg_Y_real_1_4;
reg [17:0] reg_Y_imag_1_4;
reg [17:0] reg_Y_real_1_5;
reg [17:0] reg_Y_imag_1_5;
reg [17:0] reg_Y_real_1_6;
reg [17:0] reg_Y_imag_1_6;
reg [17:0] reg_Y_real_1_7;
reg [17:0] reg_Y_imag_1_7;
reg [17:0] reg_Y_real_1_8;
reg [17:0] reg_Y_imag_1_8;
reg [17:0] reg_Y_real_1_9;
reg [17:0] reg_Y_imag_1_9;
reg [17:0] reg_Y_real_1_10;
reg [17:0] reg_Y_imag_1_10;
reg [17:0] reg_Y_real_1_11;
reg [17:0] reg_Y_imag_1_11;
reg [17:0] reg_Y_real_1_12;
reg [17:0] reg_Y_imag_1_12;
reg [17:0] reg_Y_real_1_13;
reg [17:0] reg_Y_imag_1_13;
reg [17:0] reg_Y_real_1_14;
reg [17:0] reg_Y_imag_1_14;
reg [17:0] reg_Y_real_1_15;
reg [17:0] reg_Y_imag_1_15;
reg reg_o_valid;

// Inter-connections
reg fft_valid;
reg reg_o_ready;
wire o_fft_next;
wire mult_X_real_W_real_valid_0;
wire mult_X_imag_W_real_valid_0;
wire mult_X_real_W_imag_valid_0;
wire mult_X_imag_W_imag_valid_0;
wire sub_y_real_valid_0;
wire add_y_imag_valid_0;
wire mult_X_real_W_real_valid_1;
wire mult_X_imag_W_real_valid_1;
wire mult_X_real_W_imag_valid_1;
wire mult_X_imag_W_imag_valid_1;
wire sub_y_real_valid_1;
wire add_y_imag_valid_1;

wire [17:0] W_real_wires_0_0;
wire [17:0] W_imag_wires_0_0;
wire [17:0] W_real_holder_0_0;
wire [17:0] W_imag_holder_0_0;
wire [17:0] o_mult_X_real_W_real_0_0;
wire [17:0] o_mult_X_imag_W_real_0_0;
wire [17:0] o_mult_X_real_W_imag_0_0;
wire [17:0] o_mult_X_imag_W_imag_0_0;
wire [17:0] o_sub_y_real_0_0;
wire [17:0] o_add_y_imag_0_0;
wire [17:0] W_real_wires_0_1;
wire [17:0] W_imag_wires_0_1;
wire [17:0] W_real_holder_0_1;
wire [17:0] W_imag_holder_0_1;
wire [17:0] o_mult_X_real_W_real_0_1;
wire [17:0] o_mult_X_imag_W_real_0_1;
wire [17:0] o_mult_X_real_W_imag_0_1;
wire [17:0] o_mult_X_imag_W_imag_0_1;
wire [17:0] o_sub_y_real_0_1;
wire [17:0] o_add_y_imag_0_1;
wire [17:0] W_real_wires_0_2;
wire [17:0] W_imag_wires_0_2;
wire [17:0] W_real_holder_0_2;
wire [17:0] W_imag_holder_0_2;
wire [17:0] o_mult_X_real_W_real_0_2;
wire [17:0] o_mult_X_imag_W_real_0_2;
wire [17:0] o_mult_X_real_W_imag_0_2;
wire [17:0] o_mult_X_imag_W_imag_0_2;
wire [17:0] o_sub_y_real_0_2;
wire [17:0] o_add_y_imag_0_2;
wire [17:0] W_real_wires_0_3;
wire [17:0] W_imag_wires_0_3;
wire [17:0] W_real_holder_0_3;
wire [17:0] W_imag_holder_0_3;
wire [17:0] o_mult_X_real_W_real_0_3;
wire [17:0] o_mult_X_imag_W_real_0_3;
wire [17:0] o_mult_X_real_W_imag_0_3;
wire [17:0] o_mult_X_imag_W_imag_0_3;
wire [17:0] o_sub_y_real_0_3;
wire [17:0] o_add_y_imag_0_3;
wire [17:0] W_real_wires_0_4;
wire [17:0] W_imag_wires_0_4;
wire [17:0] W_real_holder_0_4;
wire [17:0] W_imag_holder_0_4;
wire [17:0] o_mult_X_real_W_real_0_4;
wire [17:0] o_mult_X_imag_W_real_0_4;
wire [17:0] o_mult_X_real_W_imag_0_4;
wire [17:0] o_mult_X_imag_W_imag_0_4;
wire [17:0] o_sub_y_real_0_4;
wire [17:0] o_add_y_imag_0_4;
wire [17:0] W_real_wires_0_5;
wire [17:0] W_imag_wires_0_5;
wire [17:0] W_real_holder_0_5;
wire [17:0] W_imag_holder_0_5;
wire [17:0] o_mult_X_real_W_real_0_5;
wire [17:0] o_mult_X_imag_W_real_0_5;
wire [17:0] o_mult_X_real_W_imag_0_5;
wire [17:0] o_mult_X_imag_W_imag_0_5;
wire [17:0] o_sub_y_real_0_5;
wire [17:0] o_add_y_imag_0_5;
wire [17:0] W_real_wires_0_6;
wire [17:0] W_imag_wires_0_6;
wire [17:0] W_real_holder_0_6;
wire [17:0] W_imag_holder_0_6;
wire [17:0] o_mult_X_real_W_real_0_6;
wire [17:0] o_mult_X_imag_W_real_0_6;
wire [17:0] o_mult_X_real_W_imag_0_6;
wire [17:0] o_mult_X_imag_W_imag_0_6;
wire [17:0] o_sub_y_real_0_6;
wire [17:0] o_add_y_imag_0_6;
wire [17:0] W_real_wires_0_7;
wire [17:0] W_imag_wires_0_7;
wire [17:0] W_real_holder_0_7;
wire [17:0] W_imag_holder_0_7;
wire [17:0] o_mult_X_real_W_real_0_7;
wire [17:0] o_mult_X_imag_W_real_0_7;
wire [17:0] o_mult_X_real_W_imag_0_7;
wire [17:0] o_mult_X_imag_W_imag_0_7;
wire [17:0] o_sub_y_real_0_7;
wire [17:0] o_add_y_imag_0_7;
wire [17:0] W_real_wires_0_8;
wire [17:0] W_imag_wires_0_8;
wire [17:0] W_real_holder_0_8;
wire [17:0] W_imag_holder_0_8;
wire [17:0] o_mult_X_real_W_real_0_8;
wire [17:0] o_mult_X_imag_W_real_0_8;
wire [17:0] o_mult_X_real_W_imag_0_8;
wire [17:0] o_mult_X_imag_W_imag_0_8;
wire [17:0] o_sub_y_real_0_8;
wire [17:0] o_add_y_imag_0_8;
wire [17:0] W_real_wires_1_0;
wire [17:0] W_imag_wires_1_0;
wire [17:0] W_real_holder_1_0;
wire [17:0] W_imag_holder_1_0;
wire [17:0] o_mult_X_real_W_real_1_0;
wire [17:0] o_mult_X_imag_W_real_1_0;
wire [17:0] o_mult_X_real_W_imag_1_0;
wire [17:0] o_mult_X_imag_W_imag_1_0;
wire [17:0] o_sub_y_real_1_0;
wire [17:0] o_add_y_imag_1_0;
wire [17:0] W_real_wires_1_1;
wire [17:0] W_imag_wires_1_1;
wire [17:0] W_real_holder_1_1;
wire [17:0] W_imag_holder_1_1;
wire [17:0] o_mult_X_real_W_real_1_1;
wire [17:0] o_mult_X_imag_W_real_1_1;
wire [17:0] o_mult_X_real_W_imag_1_1;
wire [17:0] o_mult_X_imag_W_imag_1_1;
wire [17:0] o_sub_y_real_1_1;
wire [17:0] o_add_y_imag_1_1;
wire [17:0] W_real_wires_1_2;
wire [17:0] W_imag_wires_1_2;
wire [17:0] W_real_holder_1_2;
wire [17:0] W_imag_holder_1_2;
wire [17:0] o_mult_X_real_W_real_1_2;
wire [17:0] o_mult_X_imag_W_real_1_2;
wire [17:0] o_mult_X_real_W_imag_1_2;
wire [17:0] o_mult_X_imag_W_imag_1_2;
wire [17:0] o_sub_y_real_1_2;
wire [17:0] o_add_y_imag_1_2;
wire [17:0] W_real_wires_1_3;
wire [17:0] W_imag_wires_1_3;
wire [17:0] W_real_holder_1_3;
wire [17:0] W_imag_holder_1_3;
wire [17:0] o_mult_X_real_W_real_1_3;
wire [17:0] o_mult_X_imag_W_real_1_3;
wire [17:0] o_mult_X_real_W_imag_1_3;
wire [17:0] o_mult_X_imag_W_imag_1_3;
wire [17:0] o_sub_y_real_1_3;
wire [17:0] o_add_y_imag_1_3;
wire [17:0] W_real_wires_1_4;
wire [17:0] W_imag_wires_1_4;
wire [17:0] W_real_holder_1_4;
wire [17:0] W_imag_holder_1_4;
wire [17:0] o_mult_X_real_W_real_1_4;
wire [17:0] o_mult_X_imag_W_real_1_4;
wire [17:0] o_mult_X_real_W_imag_1_4;
wire [17:0] o_mult_X_imag_W_imag_1_4;
wire [17:0] o_sub_y_real_1_4;
wire [17:0] o_add_y_imag_1_4;
wire [17:0] W_real_wires_1_5;
wire [17:0] W_imag_wires_1_5;
wire [17:0] W_real_holder_1_5;
wire [17:0] W_imag_holder_1_5;
wire [17:0] o_mult_X_real_W_real_1_5;
wire [17:0] o_mult_X_imag_W_real_1_5;
wire [17:0] o_mult_X_real_W_imag_1_5;
wire [17:0] o_mult_X_imag_W_imag_1_5;
wire [17:0] o_sub_y_real_1_5;
wire [17:0] o_add_y_imag_1_5;
wire [17:0] W_real_wires_1_6;
wire [17:0] W_imag_wires_1_6;
wire [17:0] W_real_holder_1_6;
wire [17:0] W_imag_holder_1_6;
wire [17:0] o_mult_X_real_W_real_1_6;
wire [17:0] o_mult_X_imag_W_real_1_6;
wire [17:0] o_mult_X_real_W_imag_1_6;
wire [17:0] o_mult_X_imag_W_imag_1_6;
wire [17:0] o_sub_y_real_1_6;
wire [17:0] o_add_y_imag_1_6;
wire [17:0] W_real_wires_1_7;
wire [17:0] W_imag_wires_1_7;
wire [17:0] W_real_holder_1_7;
wire [17:0] W_imag_holder_1_7;
wire [17:0] o_mult_X_real_W_real_1_7;
wire [17:0] o_mult_X_imag_W_real_1_7;
wire [17:0] o_mult_X_real_W_imag_1_7;
wire [17:0] o_mult_X_imag_W_imag_1_7;
wire [17:0] o_sub_y_real_1_7;
wire [17:0] o_add_y_imag_1_7;
wire [17:0] W_real_wires_1_8;
wire [17:0] W_imag_wires_1_8;
wire [17:0] W_real_holder_1_8;
wire [17:0] W_imag_holder_1_8;
wire [17:0] o_mult_X_real_W_real_1_8;
wire [17:0] o_mult_X_imag_W_real_1_8;
wire [17:0] o_mult_X_real_W_imag_1_8;
wire [17:0] o_mult_X_imag_W_imag_1_8;
wire [17:0] o_sub_y_real_1_8;
wire [17:0] o_add_y_imag_1_8;
wire [17:0] o_fft_X_real_0;
wire [17:0] o_fft_X_imag_0;
wire [17:0] o_fft_X_real_1;
wire [17:0] o_fft_X_imag_1;
wire [17:0] o_fft_X_real_2;
wire [17:0] o_fft_X_imag_2;
wire [17:0] o_fft_X_real_3;
wire [17:0] o_fft_X_imag_3;
wire [17:0] o_fft_X_real_4;
wire [17:0] o_fft_X_imag_4;
wire [17:0] o_fft_X_real_5;
wire [17:0] o_fft_X_imag_5;
wire [17:0] o_fft_X_real_6;
wire [17:0] o_fft_X_imag_6;
wire [17:0] o_fft_X_real_7;
wire [17:0] o_fft_X_imag_7;
wire [17:0] o_fft_X_real_8;
wire [17:0] o_fft_X_imag_8;
wire [17:0] o_fft_X_real_9;
wire [17:0] o_fft_X_imag_9;
wire [17:0] o_fft_X_real_10;
wire [17:0] o_fft_X_imag_10;
wire [17:0] o_fft_X_real_11;
wire [17:0] o_fft_X_imag_11;
wire [17:0] o_fft_X_real_12;
wire [17:0] o_fft_X_imag_12;
wire [17:0] o_fft_X_real_13;
wire [17:0] o_fft_X_imag_13;
wire [17:0] o_fft_X_real_14;
wire [17:0] o_fft_X_imag_14;
wire [17:0] o_fft_X_real_15;
wire [17:0] o_fft_X_imag_15;

// Hold weights value until X_FFT finishes
assign W_real_wires_0_0 = reg_W_real_0_0;
assign W_imag_wires_0_0 = reg_W_imag_0_0;
assign W_real_wires_0_1 = reg_W_real_0_1;
assign W_imag_wires_0_1 = reg_W_imag_0_1;
assign W_real_wires_0_2 = reg_W_real_0_2;
assign W_imag_wires_0_2 = reg_W_imag_0_2;
assign W_real_wires_0_3 = reg_W_real_0_3;
assign W_imag_wires_0_3 = reg_W_imag_0_3;
assign W_real_wires_0_4 = reg_W_real_0_4;
assign W_imag_wires_0_4 = reg_W_imag_0_4;
assign W_real_wires_0_5 = reg_W_real_0_5;
assign W_imag_wires_0_5 = reg_W_imag_0_5;
assign W_real_wires_0_6 = reg_W_real_0_6;
assign W_imag_wires_0_6 = reg_W_imag_0_6;
assign W_real_wires_0_7 = reg_W_real_0_7;
assign W_imag_wires_0_7 = reg_W_imag_0_7;
assign W_real_wires_0_8 = reg_W_real_0_8;
assign W_imag_wires_0_8 = reg_W_imag_0_8;
assign W_real_wires_1_0 = reg_W_real_1_0;
assign W_imag_wires_1_0 = reg_W_imag_1_0;
assign W_real_wires_1_1 = reg_W_real_1_1;
assign W_imag_wires_1_1 = reg_W_imag_1_1;
assign W_real_wires_1_2 = reg_W_real_1_2;
assign W_imag_wires_1_2 = reg_W_imag_1_2;
assign W_real_wires_1_3 = reg_W_real_1_3;
assign W_imag_wires_1_3 = reg_W_imag_1_3;
assign W_real_wires_1_4 = reg_W_real_1_4;
assign W_imag_wires_1_4 = reg_W_imag_1_4;
assign W_real_wires_1_5 = reg_W_real_1_5;
assign W_imag_wires_1_5 = reg_W_imag_1_5;
assign W_real_wires_1_6 = reg_W_real_1_6;
assign W_imag_wires_1_6 = reg_W_imag_1_6;
assign W_real_wires_1_7 = reg_W_real_1_7;
assign W_imag_wires_1_7 = reg_W_imag_1_7;
assign W_real_wires_1_8 = reg_W_real_1_8;
assign W_imag_wires_1_8 = reg_W_imag_1_8;

shift_register_group_18_910 shift_register_group_18_910_inst_0_real (
	.clk(clk),
	.enable(enable),
	.in_0(W_real_wires_0_0),
	.out_0(W_real_holder_0_0),
	.in_1(W_real_wires_0_1),
	.out_1(W_real_holder_0_1),
	.in_2(W_real_wires_0_2),
	.out_2(W_real_holder_0_2),
	.in_3(W_real_wires_0_3),
	.out_3(W_real_holder_0_3),
	.in_4(W_real_wires_0_4),
	.out_4(W_real_holder_0_4),
	.in_5(W_real_wires_0_5),
	.out_5(W_real_holder_0_5),
	.in_6(W_real_wires_0_6),
	.out_6(W_real_holder_0_6),
	.in_7(W_real_wires_0_7),
	.out_7(W_real_holder_0_7),
	.in_8(W_real_wires_0_8),
	.out_8(W_real_holder_0_8),
	.reset(reset)
);

shift_register_group_18_910 shift_register_group_18_910_inst_0_imag (
	.clk(clk),
	.enable(enable),
	.in_0(W_imag_wires_0_0),
	.out_0(W_imag_holder_0_0),
	.in_1(W_imag_wires_0_1),
	.out_1(W_imag_holder_0_1),
	.in_2(W_imag_wires_0_2),
	.out_2(W_imag_holder_0_2),
	.in_3(W_imag_wires_0_3),
	.out_3(W_imag_holder_0_3),
	.in_4(W_imag_wires_0_4),
	.out_4(W_imag_holder_0_4),
	.in_5(W_imag_wires_0_5),
	.out_5(W_imag_holder_0_5),
	.in_6(W_imag_wires_0_6),
	.out_6(W_imag_holder_0_6),
	.in_7(W_imag_wires_0_7),
	.out_7(W_imag_holder_0_7),
	.in_8(W_imag_wires_0_8),
	.out_8(W_imag_holder_0_8),
	.reset(reset)
);

shift_register_group_18_910 shift_register_group_18_910_inst_1_real (
	.clk(clk),
	.enable(enable),
	.in_0(W_real_wires_1_0),
	.out_0(W_real_holder_1_0),
	.in_1(W_real_wires_1_1),
	.out_1(W_real_holder_1_1),
	.in_2(W_real_wires_1_2),
	.out_2(W_real_holder_1_2),
	.in_3(W_real_wires_1_3),
	.out_3(W_real_holder_1_3),
	.in_4(W_real_wires_1_4),
	.out_4(W_real_holder_1_4),
	.in_5(W_real_wires_1_5),
	.out_5(W_real_holder_1_5),
	.in_6(W_real_wires_1_6),
	.out_6(W_real_holder_1_6),
	.in_7(W_real_wires_1_7),
	.out_7(W_real_holder_1_7),
	.in_8(W_real_wires_1_8),
	.out_8(W_real_holder_1_8),
	.reset(reset)
);

shift_register_group_18_910 shift_register_group_18_910_inst_1_imag (
	.clk(clk),
	.enable(enable),
	.in_0(W_imag_wires_1_0),
	.out_0(W_imag_holder_1_0),
	.in_1(W_imag_wires_1_1),
	.out_1(W_imag_holder_1_1),
	.in_2(W_imag_wires_1_2),
	.out_2(W_imag_holder_1_2),
	.in_3(W_imag_wires_1_3),
	.out_3(W_imag_holder_1_3),
	.in_4(W_imag_wires_1_4),
	.out_4(W_imag_holder_1_4),
	.in_5(W_imag_wires_1_5),
	.out_5(W_imag_holder_1_5),
	.in_6(W_imag_wires_1_6),
	.out_6(W_imag_holder_1_6),
	.in_7(W_imag_wires_1_7),
	.out_7(W_imag_holder_1_7),
	.in_8(W_imag_wires_1_8),
	.out_8(W_imag_holder_1_8),
	.reset(reset)
);

dft_16_top_18 dft_16_top_18_inst (
	.clk(clk),
	.reset(reset),
	.next(reg_i_valid),
	.X0(reg_X_2_0),
	.Y0(o_fft_X_real_0),
	.X1(0),
	.Y1(o_fft_X_imag_0),
	.X2(reg_X_2_1),
	.Y2(o_fft_X_real_1),
	.X3(0),
	.Y3(o_fft_X_imag_1),
	.X4(reg_X_2_2),
	.Y4(o_fft_X_real_2),
	.X5(0),
	.Y5(o_fft_X_imag_2),
	.X6(reg_X_2_3),
	.Y6(o_fft_X_real_3),
	.X7(0),
	.Y7(o_fft_X_imag_3),
	.X8(reg_X_2_4),
	.Y8(o_fft_X_real_4),
	.X9(0),
	.Y9(o_fft_X_imag_4),
	.X10(reg_X_2_5),
	.Y10(o_fft_X_real_5),
	.X11(0),
	.Y11(o_fft_X_imag_5),
	.X12(reg_X_2_6),
	.Y12(o_fft_X_real_6),
	.X13(0),
	.Y13(o_fft_X_imag_6),
	.X14(reg_X_2_7),
	.Y14(o_fft_X_real_7),
	.X15(0),
	.Y15(o_fft_X_imag_7),
	.X16(reg_X_2_8),
	.Y16(o_fft_X_real_8),
	.X17(0),
	.Y17(o_fft_X_imag_8),
	.X18(reg_X_2_9),
	.Y18(o_fft_X_real_9),
	.X19(0),
	.Y19(o_fft_X_imag_9),
	.X20(reg_X_2_10),
	.Y20(o_fft_X_real_10),
	.X21(0),
	.Y21(o_fft_X_imag_10),
	.X22(reg_X_2_11),
	.Y22(o_fft_X_real_11),
	.X23(0),
	.Y23(o_fft_X_imag_11),
	.X24(reg_X_2_12),
	.Y24(o_fft_X_real_12),
	.X25(0),
	.Y25(o_fft_X_imag_12),
	.X26(reg_X_2_13),
	.Y26(o_fft_X_real_13),
	.X27(0),
	.Y27(o_fft_X_imag_13),
	.X28(reg_X_2_14),
	.Y28(o_fft_X_real_14),
	.X29(0),
	.Y29(o_fft_X_imag_14),
	.X30(reg_X_2_15),
	.Y30(o_fft_X_real_15),
	.X31(0),
	.Y31(o_fft_X_imag_15),
	.next_out(o_fft_next)
);
elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_0_real_real (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(W_real_holder_0_0),
	.i_B_0(o_fft_X_real_0),
	.o_C_0(o_mult_X_real_W_real_0_0),
	.i_A_1(W_real_holder_0_1),
	.i_B_1(o_fft_X_real_1),
	.o_C_1(o_mult_X_real_W_real_0_1),
	.i_A_2(W_real_holder_0_2),
	.i_B_2(o_fft_X_real_2),
	.o_C_2(o_mult_X_real_W_real_0_2),
	.i_A_3(W_real_holder_0_3),
	.i_B_3(o_fft_X_real_3),
	.o_C_3(o_mult_X_real_W_real_0_3),
	.i_A_4(W_real_holder_0_4),
	.i_B_4(o_fft_X_real_4),
	.o_C_4(o_mult_X_real_W_real_0_4),
	.i_A_5(W_real_holder_0_5),
	.i_B_5(o_fft_X_real_5),
	.o_C_5(o_mult_X_real_W_real_0_5),
	.i_A_6(W_real_holder_0_6),
	.i_B_6(o_fft_X_real_6),
	.o_C_6(o_mult_X_real_W_real_0_6),
	.i_A_7(W_real_holder_0_7),
	.i_B_7(o_fft_X_real_7),
	.o_C_7(o_mult_X_real_W_real_0_7),
	.i_A_8(W_real_holder_0_8),
	.i_B_8(o_fft_X_real_8),
	.o_C_8(o_mult_X_real_W_real_0_8),
	.o_valid(mult_X_real_W_real_valid_0),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_0_real_imag (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(W_imag_holder_0_0),
	.i_B_0(o_fft_X_real_0),
	.o_C_0(o_mult_X_real_W_imag_0_0),
	.i_A_1(W_imag_holder_0_1),
	.i_B_1(o_fft_X_real_1),
	.o_C_1(o_mult_X_real_W_imag_0_1),
	.i_A_2(W_imag_holder_0_2),
	.i_B_2(o_fft_X_real_2),
	.o_C_2(o_mult_X_real_W_imag_0_2),
	.i_A_3(W_imag_holder_0_3),
	.i_B_3(o_fft_X_real_3),
	.o_C_3(o_mult_X_real_W_imag_0_3),
	.i_A_4(W_imag_holder_0_4),
	.i_B_4(o_fft_X_real_4),
	.o_C_4(o_mult_X_real_W_imag_0_4),
	.i_A_5(W_imag_holder_0_5),
	.i_B_5(o_fft_X_real_5),
	.o_C_5(o_mult_X_real_W_imag_0_5),
	.i_A_6(W_imag_holder_0_6),
	.i_B_6(o_fft_X_real_6),
	.o_C_6(o_mult_X_real_W_imag_0_6),
	.i_A_7(W_imag_holder_0_7),
	.i_B_7(o_fft_X_real_7),
	.o_C_7(o_mult_X_real_W_imag_0_7),
	.i_A_8(W_imag_holder_0_8),
	.i_B_8(o_fft_X_real_8),
	.o_C_8(o_mult_X_real_W_imag_0_8),
	.o_valid(mult_X_real_W_imag_valid_0),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_0_imag_real (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(o_fft_X_imag_0),
	.i_B_0(W_real_holder_0_0),
	.o_C_0(o_mult_X_imag_W_real_0_0),
	.i_A_1(o_fft_X_imag_1),
	.i_B_1(W_real_holder_0_1),
	.o_C_1(o_mult_X_imag_W_real_0_1),
	.i_A_2(o_fft_X_imag_2),
	.i_B_2(W_real_holder_0_2),
	.o_C_2(o_mult_X_imag_W_real_0_2),
	.i_A_3(o_fft_X_imag_3),
	.i_B_3(W_real_holder_0_3),
	.o_C_3(o_mult_X_imag_W_real_0_3),
	.i_A_4(o_fft_X_imag_4),
	.i_B_4(W_real_holder_0_4),
	.o_C_4(o_mult_X_imag_W_real_0_4),
	.i_A_5(o_fft_X_imag_5),
	.i_B_5(W_real_holder_0_5),
	.o_C_5(o_mult_X_imag_W_real_0_5),
	.i_A_6(o_fft_X_imag_6),
	.i_B_6(W_real_holder_0_6),
	.o_C_6(o_mult_X_imag_W_real_0_6),
	.i_A_7(o_fft_X_imag_7),
	.i_B_7(W_real_holder_0_7),
	.o_C_7(o_mult_X_imag_W_real_0_7),
	.i_A_8(o_fft_X_imag_8),
	.i_B_8(W_real_holder_0_8),
	.o_C_8(o_mult_X_imag_W_real_0_8),
	.o_valid(mult_X_imag_W_real_valid_0),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_0_imag_imag (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(o_fft_X_imag_0),
	.i_B_0(W_imag_holder_0_0),
	.o_C_0(o_mult_X_imag_W_imag_0_0),
	.i_A_1(o_fft_X_imag_1),
	.i_B_1(W_imag_holder_0_1),
	.o_C_1(o_mult_X_imag_W_imag_0_1),
	.i_A_2(o_fft_X_imag_2),
	.i_B_2(W_imag_holder_0_2),
	.o_C_2(o_mult_X_imag_W_imag_0_2),
	.i_A_3(o_fft_X_imag_3),
	.i_B_3(W_imag_holder_0_3),
	.o_C_3(o_mult_X_imag_W_imag_0_3),
	.i_A_4(o_fft_X_imag_4),
	.i_B_4(W_imag_holder_0_4),
	.o_C_4(o_mult_X_imag_W_imag_0_4),
	.i_A_5(o_fft_X_imag_5),
	.i_B_5(W_imag_holder_0_5),
	.o_C_5(o_mult_X_imag_W_imag_0_5),
	.i_A_6(o_fft_X_imag_6),
	.i_B_6(W_imag_holder_0_6),
	.o_C_6(o_mult_X_imag_W_imag_0_6),
	.i_A_7(o_fft_X_imag_7),
	.i_B_7(W_imag_holder_0_7),
	.o_C_7(o_mult_X_imag_W_imag_0_7),
	.i_A_8(o_fft_X_imag_8),
	.i_B_8(W_imag_holder_0_8),
	.o_C_8(o_mult_X_imag_W_imag_0_8),
	.o_valid(mult_X_imag_W_imag_valid_0),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_1_real_real (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(W_real_holder_1_0),
	.i_B_0(o_fft_X_real_0),
	.o_C_0(o_mult_X_real_W_real_1_0),
	.i_A_1(W_real_holder_1_1),
	.i_B_1(o_fft_X_real_1),
	.o_C_1(o_mult_X_real_W_real_1_1),
	.i_A_2(W_real_holder_1_2),
	.i_B_2(o_fft_X_real_2),
	.o_C_2(o_mult_X_real_W_real_1_2),
	.i_A_3(W_real_holder_1_3),
	.i_B_3(o_fft_X_real_3),
	.o_C_3(o_mult_X_real_W_real_1_3),
	.i_A_4(W_real_holder_1_4),
	.i_B_4(o_fft_X_real_4),
	.o_C_4(o_mult_X_real_W_real_1_4),
	.i_A_5(W_real_holder_1_5),
	.i_B_5(o_fft_X_real_5),
	.o_C_5(o_mult_X_real_W_real_1_5),
	.i_A_6(W_real_holder_1_6),
	.i_B_6(o_fft_X_real_6),
	.o_C_6(o_mult_X_real_W_real_1_6),
	.i_A_7(W_real_holder_1_7),
	.i_B_7(o_fft_X_real_7),
	.o_C_7(o_mult_X_real_W_real_1_7),
	.i_A_8(W_real_holder_1_8),
	.i_B_8(o_fft_X_real_8),
	.o_C_8(o_mult_X_real_W_real_1_8),
	.o_valid(mult_X_real_W_real_valid_1),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_1_real_imag (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(W_imag_holder_1_0),
	.i_B_0(o_fft_X_real_0),
	.o_C_0(o_mult_X_real_W_imag_1_0),
	.i_A_1(W_imag_holder_1_1),
	.i_B_1(o_fft_X_real_1),
	.o_C_1(o_mult_X_real_W_imag_1_1),
	.i_A_2(W_imag_holder_1_2),
	.i_B_2(o_fft_X_real_2),
	.o_C_2(o_mult_X_real_W_imag_1_2),
	.i_A_3(W_imag_holder_1_3),
	.i_B_3(o_fft_X_real_3),
	.o_C_3(o_mult_X_real_W_imag_1_3),
	.i_A_4(W_imag_holder_1_4),
	.i_B_4(o_fft_X_real_4),
	.o_C_4(o_mult_X_real_W_imag_1_4),
	.i_A_5(W_imag_holder_1_5),
	.i_B_5(o_fft_X_real_5),
	.o_C_5(o_mult_X_real_W_imag_1_5),
	.i_A_6(W_imag_holder_1_6),
	.i_B_6(o_fft_X_real_6),
	.o_C_6(o_mult_X_real_W_imag_1_6),
	.i_A_7(W_imag_holder_1_7),
	.i_B_7(o_fft_X_real_7),
	.o_C_7(o_mult_X_real_W_imag_1_7),
	.i_A_8(W_imag_holder_1_8),
	.i_B_8(o_fft_X_real_8),
	.o_C_8(o_mult_X_real_W_imag_1_8),
	.o_valid(mult_X_real_W_imag_valid_1),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_1_imag_real (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(o_fft_X_imag_0),
	.i_B_0(W_real_holder_1_0),
	.o_C_0(o_mult_X_imag_W_real_1_0),
	.i_A_1(o_fft_X_imag_1),
	.i_B_1(W_real_holder_1_1),
	.o_C_1(o_mult_X_imag_W_real_1_1),
	.i_A_2(o_fft_X_imag_2),
	.i_B_2(W_real_holder_1_2),
	.o_C_2(o_mult_X_imag_W_real_1_2),
	.i_A_3(o_fft_X_imag_3),
	.i_B_3(W_real_holder_1_3),
	.o_C_3(o_mult_X_imag_W_real_1_3),
	.i_A_4(o_fft_X_imag_4),
	.i_B_4(W_real_holder_1_4),
	.o_C_4(o_mult_X_imag_W_real_1_4),
	.i_A_5(o_fft_X_imag_5),
	.i_B_5(W_real_holder_1_5),
	.o_C_5(o_mult_X_imag_W_real_1_5),
	.i_A_6(o_fft_X_imag_6),
	.i_B_6(W_real_holder_1_6),
	.o_C_6(o_mult_X_imag_W_real_1_6),
	.i_A_7(o_fft_X_imag_7),
	.i_B_7(W_real_holder_1_7),
	.o_C_7(o_mult_X_imag_W_real_1_7),
	.i_A_8(o_fft_X_imag_8),
	.i_B_8(W_real_holder_1_8),
	.o_C_8(o_mult_X_imag_W_real_1_8),
	.o_valid(mult_X_imag_W_real_valid_1),
	.o_ready()
);

elementwise_mult_core_18_1810_9_1 elementwise_mult_core_18_1810_9_1_inst_1_imag_imag (
	.clk(clk),
	.reset(reset),
	.i_valid(fft_valid),
	.i_ready(enable),
	.i_A_0(o_fft_X_imag_0),
	.i_B_0(W_imag_holder_1_0),
	.o_C_0(o_mult_X_imag_W_imag_1_0),
	.i_A_1(o_fft_X_imag_1),
	.i_B_1(W_imag_holder_1_1),
	.o_C_1(o_mult_X_imag_W_imag_1_1),
	.i_A_2(o_fft_X_imag_2),
	.i_B_2(W_imag_holder_1_2),
	.o_C_2(o_mult_X_imag_W_imag_1_2),
	.i_A_3(o_fft_X_imag_3),
	.i_B_3(W_imag_holder_1_3),
	.o_C_3(o_mult_X_imag_W_imag_1_3),
	.i_A_4(o_fft_X_imag_4),
	.i_B_4(W_imag_holder_1_4),
	.o_C_4(o_mult_X_imag_W_imag_1_4),
	.i_A_5(o_fft_X_imag_5),
	.i_B_5(W_imag_holder_1_5),
	.o_C_5(o_mult_X_imag_W_imag_1_5),
	.i_A_6(o_fft_X_imag_6),
	.i_B_6(W_imag_holder_1_6),
	.o_C_6(o_mult_X_imag_W_imag_1_6),
	.i_A_7(o_fft_X_imag_7),
	.i_B_7(W_imag_holder_1_7),
	.o_C_7(o_mult_X_imag_W_imag_1_7),
	.i_A_8(o_fft_X_imag_8),
	.i_B_8(W_imag_holder_1_8),
	.o_C_8(o_mult_X_imag_W_imag_1_8),
	.o_valid(mult_X_imag_W_imag_valid_1),
	.o_ready()
);

wire sub_core_valid_0;
assign sub_core_valid_0 = mult_X_real_W_real_valid_0 & mult_X_imag_W_imag_valid_0;

elementwise_sub_core_18_18_9 elementwise_sub_core_18_18_9_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(sub_core_valid_0),
	.i_ready(enable),
	.i_A_0(o_mult_X_real_W_real_0_0),
	.i_B_0(o_mult_X_imag_W_imag_0_0),
	.o_C_0(o_sub_y_real_0_0),
	.i_A_1(o_mult_X_real_W_real_0_1),
	.i_B_1(o_mult_X_imag_W_imag_0_1),
	.o_C_1(o_sub_y_real_0_1),
	.i_A_2(o_mult_X_real_W_real_0_2),
	.i_B_2(o_mult_X_imag_W_imag_0_2),
	.o_C_2(o_sub_y_real_0_2),
	.i_A_3(o_mult_X_real_W_real_0_3),
	.i_B_3(o_mult_X_imag_W_imag_0_3),
	.o_C_3(o_sub_y_real_0_3),
	.i_A_4(o_mult_X_real_W_real_0_4),
	.i_B_4(o_mult_X_imag_W_imag_0_4),
	.o_C_4(o_sub_y_real_0_4),
	.i_A_5(o_mult_X_real_W_real_0_5),
	.i_B_5(o_mult_X_imag_W_imag_0_5),
	.o_C_5(o_sub_y_real_0_5),
	.i_A_6(o_mult_X_real_W_real_0_6),
	.i_B_6(o_mult_X_imag_W_imag_0_6),
	.o_C_6(o_sub_y_real_0_6),
	.i_A_7(o_mult_X_real_W_real_0_7),
	.i_B_7(o_mult_X_imag_W_imag_0_7),
	.o_C_7(o_sub_y_real_0_7),
	.i_A_8(o_mult_X_real_W_real_0_8),
	.i_B_8(o_mult_X_imag_W_imag_0_8),
	.o_C_8(o_sub_y_real_0_8),
	.o_valid(sub_y_real_valid_0),
	.o_ready()
);

wire sub_core_valid_1;
assign sub_core_valid_1 = mult_X_real_W_real_valid_1 & mult_X_imag_W_imag_valid_1;

elementwise_sub_core_18_18_9 elementwise_sub_core_18_18_9_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(sub_core_valid_1),
	.i_ready(enable),
	.i_A_0(o_mult_X_real_W_real_1_0),
	.i_B_0(o_mult_X_imag_W_imag_1_0),
	.o_C_0(o_sub_y_real_1_0),
	.i_A_1(o_mult_X_real_W_real_1_1),
	.i_B_1(o_mult_X_imag_W_imag_1_1),
	.o_C_1(o_sub_y_real_1_1),
	.i_A_2(o_mult_X_real_W_real_1_2),
	.i_B_2(o_mult_X_imag_W_imag_1_2),
	.o_C_2(o_sub_y_real_1_2),
	.i_A_3(o_mult_X_real_W_real_1_3),
	.i_B_3(o_mult_X_imag_W_imag_1_3),
	.o_C_3(o_sub_y_real_1_3),
	.i_A_4(o_mult_X_real_W_real_1_4),
	.i_B_4(o_mult_X_imag_W_imag_1_4),
	.o_C_4(o_sub_y_real_1_4),
	.i_A_5(o_mult_X_real_W_real_1_5),
	.i_B_5(o_mult_X_imag_W_imag_1_5),
	.o_C_5(o_sub_y_real_1_5),
	.i_A_6(o_mult_X_real_W_real_1_6),
	.i_B_6(o_mult_X_imag_W_imag_1_6),
	.o_C_6(o_sub_y_real_1_6),
	.i_A_7(o_mult_X_real_W_real_1_7),
	.i_B_7(o_mult_X_imag_W_imag_1_7),
	.o_C_7(o_sub_y_real_1_7),
	.i_A_8(o_mult_X_real_W_real_1_8),
	.i_B_8(o_mult_X_imag_W_imag_1_8),
	.o_C_8(o_sub_y_real_1_8),
	.o_valid(sub_y_real_valid_1),
	.o_ready()
);

wire add_core_valid_0;
assign add_core_valid_0 = mult_X_real_W_imag_valid_0 & mult_X_imag_W_real_valid_0;

elementwise_add_core_18_18_9 elementwise_add_core_18_18_9_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(add_core_valid_0),
	.i_ready(enable),
	.i_A_0(o_mult_X_real_W_imag_0_0),
	.i_B_0(o_mult_X_imag_W_real_0_0),
	.o_C_0(o_add_y_imag_0_0),
	.i_A_1(o_mult_X_real_W_imag_0_1),
	.i_B_1(o_mult_X_imag_W_real_0_1),
	.o_C_1(o_add_y_imag_0_1),
	.i_A_2(o_mult_X_real_W_imag_0_2),
	.i_B_2(o_mult_X_imag_W_real_0_2),
	.o_C_2(o_add_y_imag_0_2),
	.i_A_3(o_mult_X_real_W_imag_0_3),
	.i_B_3(o_mult_X_imag_W_real_0_3),
	.o_C_3(o_add_y_imag_0_3),
	.i_A_4(o_mult_X_real_W_imag_0_4),
	.i_B_4(o_mult_X_imag_W_real_0_4),
	.o_C_4(o_add_y_imag_0_4),
	.i_A_5(o_mult_X_real_W_imag_0_5),
	.i_B_5(o_mult_X_imag_W_real_0_5),
	.o_C_5(o_add_y_imag_0_5),
	.i_A_6(o_mult_X_real_W_imag_0_6),
	.i_B_6(o_mult_X_imag_W_real_0_6),
	.o_C_6(o_add_y_imag_0_6),
	.i_A_7(o_mult_X_real_W_imag_0_7),
	.i_B_7(o_mult_X_imag_W_real_0_7),
	.o_C_7(o_add_y_imag_0_7),
	.i_A_8(o_mult_X_real_W_imag_0_8),
	.i_B_8(o_mult_X_imag_W_real_0_8),
	.o_C_8(o_add_y_imag_0_8),
	.o_valid(add_y_imag_valid_0),
	.o_ready()
);

wire add_core_valid_1;
assign add_core_valid_1 = mult_X_real_W_imag_valid_1 & mult_X_imag_W_real_valid_1;

elementwise_add_core_18_18_9 elementwise_add_core_18_18_9_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(add_core_valid_1),
	.i_ready(enable),
	.i_A_0(o_mult_X_real_W_imag_1_0),
	.i_B_0(o_mult_X_imag_W_real_1_0),
	.o_C_0(o_add_y_imag_1_0),
	.i_A_1(o_mult_X_real_W_imag_1_1),
	.i_B_1(o_mult_X_imag_W_real_1_1),
	.o_C_1(o_add_y_imag_1_1),
	.i_A_2(o_mult_X_real_W_imag_1_2),
	.i_B_2(o_mult_X_imag_W_real_1_2),
	.o_C_2(o_add_y_imag_1_2),
	.i_A_3(o_mult_X_real_W_imag_1_3),
	.i_B_3(o_mult_X_imag_W_real_1_3),
	.o_C_3(o_add_y_imag_1_3),
	.i_A_4(o_mult_X_real_W_imag_1_4),
	.i_B_4(o_mult_X_imag_W_real_1_4),
	.o_C_4(o_add_y_imag_1_4),
	.i_A_5(o_mult_X_real_W_imag_1_5),
	.i_B_5(o_mult_X_imag_W_real_1_5),
	.o_C_5(o_add_y_imag_1_5),
	.i_A_6(o_mult_X_real_W_imag_1_6),
	.i_B_6(o_mult_X_imag_W_real_1_6),
	.o_C_6(o_add_y_imag_1_6),
	.i_A_7(o_mult_X_real_W_imag_1_7),
	.i_B_7(o_mult_X_imag_W_real_1_7),
	.o_C_7(o_add_y_imag_1_7),
	.i_A_8(o_mult_X_real_W_imag_1_8),
	.i_B_8(o_mult_X_imag_W_real_1_8),
	.o_C_8(o_add_y_imag_1_8),
	.o_valid(add_y_imag_valid_1),
	.o_ready()
);

always @ (posedge clk) begin 
	if (reset) begin
		reg_i_valid <= 1'b0;
		fft_valid <= 1'b0;
		reg_o_valid <= 1'b0;
		reg_o_ready <= 1'b0;
		reg_X_0 <= 0;
		reg_X_2_0 <= 0;
		reg_X_1 <= 0;
		reg_X_2_1 <= 0;
		reg_X_2 <= 0;
		reg_X_2_2 <= 0;
		reg_X_3 <= 0;
		reg_X_2_3 <= 0;
		reg_X_4 <= 0;
		reg_X_2_4 <= 0;
		reg_X_5 <= 0;
		reg_X_2_5 <= 0;
		reg_X_6 <= 0;
		reg_X_2_6 <= 0;
		reg_X_7 <= 0;
		reg_X_2_7 <= 0;
		reg_X_8 <= 0;
		reg_X_2_8 <= 0;
		reg_X_9 <= 0;
		reg_X_2_9 <= 0;
		reg_X_10 <= 0;
		reg_X_2_10 <= 0;
		reg_X_11 <= 0;
		reg_X_2_11 <= 0;
		reg_X_12 <= 0;
		reg_X_2_12 <= 0;
		reg_X_13 <= 0;
		reg_X_2_13 <= 0;
		reg_X_14 <= 0;
		reg_X_2_14 <= 0;
		reg_X_15 <= 0;
		reg_X_2_15 <= 0;
		reg_W_real_0_0 <= 0;
		reg_W_imag_0_0 <= 0;
		reg_W_real_0_1 <= 0;
		reg_W_imag_0_1 <= 0;
		reg_W_real_0_2 <= 0;
		reg_W_imag_0_2 <= 0;
		reg_W_real_0_3 <= 0;
		reg_W_imag_0_3 <= 0;
		reg_W_real_0_4 <= 0;
		reg_W_imag_0_4 <= 0;
		reg_W_real_0_5 <= 0;
		reg_W_imag_0_5 <= 0;
		reg_W_real_0_6 <= 0;
		reg_W_imag_0_6 <= 0;
		reg_W_real_0_7 <= 0;
		reg_W_imag_0_7 <= 0;
		reg_W_real_0_8 <= 0;
		reg_W_imag_0_8 <= 0;
		reg_W_real_1_0 <= 0;
		reg_W_imag_1_0 <= 0;
		reg_W_real_1_1 <= 0;
		reg_W_imag_1_1 <= 0;
		reg_W_real_1_2 <= 0;
		reg_W_imag_1_2 <= 0;
		reg_W_real_1_3 <= 0;
		reg_W_imag_1_3 <= 0;
		reg_W_real_1_4 <= 0;
		reg_W_imag_1_4 <= 0;
		reg_W_real_1_5 <= 0;
		reg_W_imag_1_5 <= 0;
		reg_W_real_1_6 <= 0;
		reg_W_imag_1_6 <= 0;
		reg_W_real_1_7 <= 0;
		reg_W_imag_1_7 <= 0;
		reg_W_real_1_8 <= 0;
		reg_W_imag_1_8 <= 0;
		reg_Y_real_0_0 <= 0;
		reg_Y_imag_0_0 <= 0;
		reg_Y_real_0_1 <= 0;
		reg_Y_imag_0_1 <= 0;
		reg_Y_real_0_2 <= 0;
		reg_Y_imag_0_2 <= 0;
		reg_Y_real_0_3 <= 0;
		reg_Y_imag_0_3 <= 0;
		reg_Y_real_0_4 <= 0;
		reg_Y_imag_0_4 <= 0;
		reg_Y_real_0_5 <= 0;
		reg_Y_imag_0_5 <= 0;
		reg_Y_real_0_6 <= 0;
		reg_Y_imag_0_6 <= 0;
		reg_Y_real_0_7 <= 0;
		reg_Y_imag_0_7 <= 0;
		reg_Y_real_0_8 <= 0;
		reg_Y_imag_0_8 <= 0;
		reg_Y_real_0_9 <= 0;
		reg_Y_imag_0_9 <= 0;
		reg_Y_real_0_10 <= 0;
		reg_Y_imag_0_10 <= 0;
		reg_Y_real_0_11 <= 0;
		reg_Y_imag_0_11 <= 0;
		reg_Y_real_0_12 <= 0;
		reg_Y_imag_0_12 <= 0;
		reg_Y_real_0_13 <= 0;
		reg_Y_imag_0_13 <= 0;
		reg_Y_real_0_14 <= 0;
		reg_Y_imag_0_14 <= 0;
		reg_Y_real_0_15 <= 0;
		reg_Y_imag_0_15 <= 0;
		reg_Y_real_1_0 <= 0;
		reg_Y_imag_1_0 <= 0;
		reg_Y_real_1_1 <= 0;
		reg_Y_imag_1_1 <= 0;
		reg_Y_real_1_2 <= 0;
		reg_Y_imag_1_2 <= 0;
		reg_Y_real_1_3 <= 0;
		reg_Y_imag_1_3 <= 0;
		reg_Y_real_1_4 <= 0;
		reg_Y_imag_1_4 <= 0;
		reg_Y_real_1_5 <= 0;
		reg_Y_imag_1_5 <= 0;
		reg_Y_real_1_6 <= 0;
		reg_Y_imag_1_6 <= 0;
		reg_Y_real_1_7 <= 0;
		reg_Y_imag_1_7 <= 0;
		reg_Y_real_1_8 <= 0;
		reg_Y_imag_1_8 <= 0;
		reg_Y_real_1_9 <= 0;
		reg_Y_imag_1_9 <= 0;
		reg_Y_real_1_10 <= 0;
		reg_Y_imag_1_10 <= 0;
		reg_Y_real_1_11 <= 0;
		reg_Y_imag_1_11 <= 0;
		reg_Y_real_1_12 <= 0;
		reg_Y_imag_1_12 <= 0;
		reg_Y_real_1_13 <= 0;
		reg_Y_imag_1_13 <= 0;
		reg_Y_real_1_14 <= 0;
		reg_Y_imag_1_14 <= 0;
		reg_Y_real_1_15 <= 0;
		reg_Y_imag_1_15 <= 0;
	end else if (enable) begin
		reg_i_valid <= i_valid;
		fft_valid <= o_fft_next;
		reg_o_valid <= add_y_imag_valid_0 & sub_y_real_valid_0;
		reg_o_ready <= ~i_valid & enable;
		reg_X_0 <= i_X_0;
		reg_X_2_0 <= reg_X_0;
		reg_X_1 <= i_X_1;
		reg_X_2_1 <= reg_X_1;
		reg_X_2 <= i_X_2;
		reg_X_2_2 <= reg_X_2;
		reg_X_3 <= i_X_3;
		reg_X_2_3 <= reg_X_3;
		reg_X_4 <= i_X_4;
		reg_X_2_4 <= reg_X_4;
		reg_X_5 <= i_X_5;
		reg_X_2_5 <= reg_X_5;
		reg_X_6 <= i_X_6;
		reg_X_2_6 <= reg_X_6;
		reg_X_7 <= i_X_7;
		reg_X_2_7 <= reg_X_7;
		reg_X_8 <= i_X_8;
		reg_X_2_8 <= reg_X_8;
		reg_X_9 <= i_X_9;
		reg_X_2_9 <= reg_X_9;
		reg_X_10 <= i_X_10;
		reg_X_2_10 <= reg_X_10;
		reg_X_11 <= i_X_11;
		reg_X_2_11 <= reg_X_11;
		reg_X_12 <= i_X_12;
		reg_X_2_12 <= reg_X_12;
		reg_X_13 <= i_X_13;
		reg_X_2_13 <= reg_X_13;
		reg_X_14 <= i_X_14;
		reg_X_2_14 <= reg_X_14;
		reg_X_15 <= i_X_15;
		reg_X_2_15 <= reg_X_15;
		reg_W_real_0_0 <= i_W_real_0_0;
		reg_W_imag_0_0 <= i_W_imag_0_0;
		reg_W_real_0_1 <= i_W_real_0_1;
		reg_W_imag_0_1 <= i_W_imag_0_1;
		reg_W_real_0_2 <= i_W_real_0_2;
		reg_W_imag_0_2 <= i_W_imag_0_2;
		reg_W_real_0_3 <= i_W_real_0_3;
		reg_W_imag_0_3 <= i_W_imag_0_3;
		reg_W_real_0_4 <= i_W_real_0_4;
		reg_W_imag_0_4 <= i_W_imag_0_4;
		reg_W_real_0_5 <= i_W_real_0_5;
		reg_W_imag_0_5 <= i_W_imag_0_5;
		reg_W_real_0_6 <= i_W_real_0_6;
		reg_W_imag_0_6 <= i_W_imag_0_6;
		reg_W_real_0_7 <= i_W_real_0_7;
		reg_W_imag_0_7 <= i_W_imag_0_7;
		reg_W_real_0_8 <= i_W_real_0_8;
		reg_W_imag_0_8 <= i_W_imag_0_8;
		reg_W_real_1_0 <= i_W_real_1_0;
		reg_W_imag_1_0 <= i_W_imag_1_0;
		reg_W_real_1_1 <= i_W_real_1_1;
		reg_W_imag_1_1 <= i_W_imag_1_1;
		reg_W_real_1_2 <= i_W_real_1_2;
		reg_W_imag_1_2 <= i_W_imag_1_2;
		reg_W_real_1_3 <= i_W_real_1_3;
		reg_W_imag_1_3 <= i_W_imag_1_3;
		reg_W_real_1_4 <= i_W_real_1_4;
		reg_W_imag_1_4 <= i_W_imag_1_4;
		reg_W_real_1_5 <= i_W_real_1_5;
		reg_W_imag_1_5 <= i_W_imag_1_5;
		reg_W_real_1_6 <= i_W_real_1_6;
		reg_W_imag_1_6 <= i_W_imag_1_6;
		reg_W_real_1_7 <= i_W_real_1_7;
		reg_W_imag_1_7 <= i_W_imag_1_7;
		reg_W_real_1_8 <= i_W_real_1_8;
		reg_W_imag_1_8 <= i_W_imag_1_8;
		reg_Y_real_0_0 <= o_sub_y_real_0_0;
		reg_Y_imag_0_0 <= o_add_y_imag_0_0;
		reg_Y_real_0_1 <= o_sub_y_real_0_1;
		reg_Y_imag_0_1 <= o_add_y_imag_0_1;
		reg_Y_real_0_2 <= o_sub_y_real_0_2;
		reg_Y_imag_0_2 <= o_add_y_imag_0_2;
		reg_Y_real_0_3 <= o_sub_y_real_0_3;
		reg_Y_imag_0_3 <= o_add_y_imag_0_3;
		reg_Y_real_0_4 <= o_sub_y_real_0_4;
		reg_Y_imag_0_4 <= o_add_y_imag_0_4;
		reg_Y_real_0_5 <= o_sub_y_real_0_5;
		reg_Y_imag_0_5 <= o_add_y_imag_0_5;
		reg_Y_real_0_6 <= o_sub_y_real_0_6;
		reg_Y_imag_0_6 <= o_add_y_imag_0_6;
		reg_Y_real_0_7 <= o_sub_y_real_0_7;
		reg_Y_imag_0_7 <= o_add_y_imag_0_7;
		reg_Y_real_0_8 <= o_sub_y_real_0_8;
		reg_Y_imag_0_8 <= o_add_y_imag_0_8;
		reg_Y_real_0_9 <= o_sub_y_real_0_7;
		reg_Y_imag_0_9 <= -o_add_y_imag_0_7;
		reg_Y_real_0_10 <= o_sub_y_real_0_6;
		reg_Y_imag_0_10 <= -o_add_y_imag_0_6;
		reg_Y_real_0_11 <= o_sub_y_real_0_5;
		reg_Y_imag_0_11 <= -o_add_y_imag_0_5;
		reg_Y_real_0_12 <= o_sub_y_real_0_4;
		reg_Y_imag_0_12 <= -o_add_y_imag_0_4;
		reg_Y_real_0_13 <= o_sub_y_real_0_3;
		reg_Y_imag_0_13 <= -o_add_y_imag_0_3;
		reg_Y_real_0_14 <= o_sub_y_real_0_2;
		reg_Y_imag_0_14 <= -o_add_y_imag_0_2;
		reg_Y_real_0_15 <= o_sub_y_real_0_1;
		reg_Y_imag_0_15 <= -o_add_y_imag_0_1;
		reg_Y_real_1_0 <= o_sub_y_real_1_0;
		reg_Y_imag_1_0 <= o_add_y_imag_1_0;
		reg_Y_real_1_1 <= o_sub_y_real_1_1;
		reg_Y_imag_1_1 <= o_add_y_imag_1_1;
		reg_Y_real_1_2 <= o_sub_y_real_1_2;
		reg_Y_imag_1_2 <= o_add_y_imag_1_2;
		reg_Y_real_1_3 <= o_sub_y_real_1_3;
		reg_Y_imag_1_3 <= o_add_y_imag_1_3;
		reg_Y_real_1_4 <= o_sub_y_real_1_4;
		reg_Y_imag_1_4 <= o_add_y_imag_1_4;
		reg_Y_real_1_5 <= o_sub_y_real_1_5;
		reg_Y_imag_1_5 <= o_add_y_imag_1_5;
		reg_Y_real_1_6 <= o_sub_y_real_1_6;
		reg_Y_imag_1_6 <= o_add_y_imag_1_6;
		reg_Y_real_1_7 <= o_sub_y_real_1_7;
		reg_Y_imag_1_7 <= o_add_y_imag_1_7;
		reg_Y_real_1_8 <= o_sub_y_real_1_8;
		reg_Y_imag_1_8 <= o_add_y_imag_1_8;
		reg_Y_real_1_9 <= o_sub_y_real_1_7;
		reg_Y_imag_1_9 <= -o_add_y_imag_1_7;
		reg_Y_real_1_10 <= o_sub_y_real_1_6;
		reg_Y_imag_1_10 <= -o_add_y_imag_1_6;
		reg_Y_real_1_11 <= o_sub_y_real_1_5;
		reg_Y_imag_1_11 <= -o_add_y_imag_1_5;
		reg_Y_real_1_12 <= o_sub_y_real_1_4;
		reg_Y_imag_1_12 <= -o_add_y_imag_1_4;
		reg_Y_real_1_13 <= o_sub_y_real_1_3;
		reg_Y_imag_1_13 <= -o_add_y_imag_1_3;
		reg_Y_real_1_14 <= o_sub_y_real_1_2;
		reg_Y_imag_1_14 <= -o_add_y_imag_1_2;
		reg_Y_real_1_15 <= o_sub_y_real_1_1;
		reg_Y_imag_1_15 <= -o_add_y_imag_1_1;
	end
end

assign o_ready = reg_o_ready & i_ready;
assign o_valid = reg_o_valid;
assign o_Y_real_0_0 = reg_Y_real_0_0;
assign o_Y_imag_0_0 = reg_Y_imag_0_0;
assign o_Y_real_0_1 = reg_Y_real_0_1;
assign o_Y_imag_0_1 = reg_Y_imag_0_1;
assign o_Y_real_0_2 = reg_Y_real_0_2;
assign o_Y_imag_0_2 = reg_Y_imag_0_2;
assign o_Y_real_0_3 = reg_Y_real_0_3;
assign o_Y_imag_0_3 = reg_Y_imag_0_3;
assign o_Y_real_0_4 = reg_Y_real_0_4;
assign o_Y_imag_0_4 = reg_Y_imag_0_4;
assign o_Y_real_0_5 = reg_Y_real_0_5;
assign o_Y_imag_0_5 = reg_Y_imag_0_5;
assign o_Y_real_0_6 = reg_Y_real_0_6;
assign o_Y_imag_0_6 = reg_Y_imag_0_6;
assign o_Y_real_0_7 = reg_Y_real_0_7;
assign o_Y_imag_0_7 = reg_Y_imag_0_7;
assign o_Y_real_0_8 = reg_Y_real_0_8;
assign o_Y_imag_0_8 = reg_Y_imag_0_8;
assign o_Y_real_0_9 = reg_Y_real_0_9;
assign o_Y_imag_0_9 = reg_Y_imag_0_9;
assign o_Y_real_0_10 = reg_Y_real_0_10;
assign o_Y_imag_0_10 = reg_Y_imag_0_10;
assign o_Y_real_0_11 = reg_Y_real_0_11;
assign o_Y_imag_0_11 = reg_Y_imag_0_11;
assign o_Y_real_0_12 = reg_Y_real_0_12;
assign o_Y_imag_0_12 = reg_Y_imag_0_12;
assign o_Y_real_0_13 = reg_Y_real_0_13;
assign o_Y_imag_0_13 = reg_Y_imag_0_13;
assign o_Y_real_0_14 = reg_Y_real_0_14;
assign o_Y_imag_0_14 = reg_Y_imag_0_14;
assign o_Y_real_0_15 = reg_Y_real_0_15;
assign o_Y_imag_0_15 = reg_Y_imag_0_15;
assign o_Y_real_1_0 = reg_Y_real_1_0;
assign o_Y_imag_1_0 = reg_Y_imag_1_0;
assign o_Y_real_1_1 = reg_Y_real_1_1;
assign o_Y_imag_1_1 = reg_Y_imag_1_1;
assign o_Y_real_1_2 = reg_Y_real_1_2;
assign o_Y_imag_1_2 = reg_Y_imag_1_2;
assign o_Y_real_1_3 = reg_Y_real_1_3;
assign o_Y_imag_1_3 = reg_Y_imag_1_3;
assign o_Y_real_1_4 = reg_Y_real_1_4;
assign o_Y_imag_1_4 = reg_Y_imag_1_4;
assign o_Y_real_1_5 = reg_Y_real_1_5;
assign o_Y_imag_1_5 = reg_Y_imag_1_5;
assign o_Y_real_1_6 = reg_Y_real_1_6;
assign o_Y_imag_1_6 = reg_Y_imag_1_6;
assign o_Y_real_1_7 = reg_Y_real_1_7;
assign o_Y_imag_1_7 = reg_Y_imag_1_7;
assign o_Y_real_1_8 = reg_Y_real_1_8;
assign o_Y_imag_1_8 = reg_Y_imag_1_8;
assign o_Y_real_1_9 = reg_Y_real_1_9;
assign o_Y_imag_1_9 = reg_Y_imag_1_9;
assign o_Y_real_1_10 = reg_Y_real_1_10;
assign o_Y_imag_1_10 = reg_Y_imag_1_10;
assign o_Y_real_1_11 = reg_Y_real_1_11;
assign o_Y_imag_1_11 = reg_Y_imag_1_11;
assign o_Y_real_1_12 = reg_Y_real_1_12;
assign o_Y_imag_1_12 = reg_Y_imag_1_12;
assign o_Y_real_1_13 = reg_Y_real_1_13;
assign o_Y_imag_1_13 = reg_Y_imag_1_13;
assign o_Y_real_1_14 = reg_Y_real_1_14;
assign o_Y_imag_1_14 = reg_Y_imag_1_14;
assign o_Y_real_1_15 = reg_Y_real_1_15;
assign o_Y_imag_1_15 = reg_Y_imag_1_15;

endmodule
module elementwise_add_core_18_18_9 (
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
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module elementwise_sub_core_18_18_9 (
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
	end else if (enable) begin
		reg_A_0 <= i_A_0;
		reg_B_0 <= i_B_0;
		reg_C_0 <= reg_A_0 - reg_B_0;
		reg_A_1 <= i_A_1;
		reg_B_1 <= i_B_1;
		reg_C_1 <= reg_A_1 - reg_B_1;
		reg_A_2 <= i_A_2;
		reg_B_2 <= i_B_2;
		reg_C_2 <= reg_A_2 - reg_B_2;
		reg_A_3 <= i_A_3;
		reg_B_3 <= i_B_3;
		reg_C_3 <= reg_A_3 - reg_B_3;
		reg_A_4 <= i_A_4;
		reg_B_4 <= i_B_4;
		reg_C_4 <= reg_A_4 - reg_B_4;
		reg_A_5 <= i_A_5;
		reg_B_5 <= i_B_5;
		reg_C_5 <= reg_A_5 - reg_B_5;
		reg_A_6 <= i_A_6;
		reg_B_6 <= i_B_6;
		reg_C_6 <= reg_A_6 - reg_B_6;
		reg_A_7 <= i_A_7;
		reg_B_7 <= i_B_7;
		reg_C_7 <= reg_A_7 - reg_B_7;
		reg_A_8 <= i_A_8;
		reg_B_8 <= i_B_8;
		reg_C_8 <= reg_A_8 - reg_B_8;
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
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
module elementwise_mult_core_18_1810_9_1 (
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
	.bx(),
	.by(),
	.o_valid(mult_valid_8),
	.resulta(mult_C_8),
	.resultb()
);
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
assign valid_C = round_valid_0;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

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
module dft_16_top_18 (
	input clk,
	input reset,
	input next,
	input [17:0] X0,
	output [17:0] Y0,
	input [17:0] X1,
	output [17:0] Y1,
	input [17:0] X2,
	output [17:0] Y2,
	input [17:0] X3,
	output [17:0] Y3,
	input [17:0] X4,
	output [17:0] Y4,
	input [17:0] X5,
	output [17:0] Y5,
	input [17:0] X6,
	output [17:0] Y6,
	input [17:0] X7,
	output [17:0] Y7,
	input [17:0] X8,
	output [17:0] Y8,
	input [17:0] X9,
	output [17:0] Y9,
	input [17:0] X10,
	output [17:0] Y10,
	input [17:0] X11,
	output [17:0] Y11,
	input [17:0] X12,
	output [17:0] Y12,
	input [17:0] X13,
	output [17:0] Y13,
	input [17:0] X14,
	output [17:0] Y14,
	input [17:0] X15,
	output [17:0] Y15,
	input [17:0] X16,
	output [17:0] Y16,
	input [17:0] X17,
	output [17:0] Y17,
	input [17:0] X18,
	output [17:0] Y18,
	input [17:0] X19,
	output [17:0] Y19,
	input [17:0] X20,
	output [17:0] Y20,
	input [17:0] X21,
	output [17:0] Y21,
	input [17:0] X22,
	output [17:0] Y22,
	input [17:0] X23,
	output [17:0] Y23,
	input [17:0] X24,
	output [17:0] Y24,
	input [17:0] X25,
	output [17:0] Y25,
	input [17:0] X26,
	output [17:0] Y26,
	input [17:0] X27,
	output [17:0] Y27,
	input [17:0] X28,
	output [17:0] Y28,
	input [17:0] X29,
	output [17:0] Y29,
	input [17:0] X30,
	output [17:0] Y30,
	input [17:0] X31,
	output [17:0] Y31,
	output next_out
);

wire [17:0] t0_0;
wire [17:0] t0_1;
wire [17:0] t0_2;
wire [17:0] t0_3;
wire [17:0] t0_4;
wire [17:0] t0_5;
wire [17:0] t0_6;
wire [17:0] t0_7;
wire [17:0] t0_8;
wire [17:0] t0_9;
wire [17:0] t0_10;
wire [17:0] t0_11;
wire [17:0] t0_12;
wire [17:0] t0_13;
wire [17:0] t0_14;
wire [17:0] t0_15;
wire [17:0] t0_16;
wire [17:0] t0_17;
wire [17:0] t0_18;
wire [17:0] t0_19;
wire [17:0] t0_20;
wire [17:0] t0_21;
wire [17:0] t0_22;
wire [17:0] t0_23;
wire [17:0] t0_24;
wire [17:0] t0_25;
wire [17:0] t0_26;
wire [17:0] t0_27;
wire [17:0] t0_28;
wire [17:0] t0_29;
wire [17:0] t0_30;
wire [17:0] t0_31;
wire next_0;
wire [17:0] t1_0;
wire [17:0] t1_1;
wire [17:0] t1_2;
wire [17:0] t1_3;
wire [17:0] t1_4;
wire [17:0] t1_5;
wire [17:0] t1_6;
wire [17:0] t1_7;
wire [17:0] t1_8;
wire [17:0] t1_9;
wire [17:0] t1_10;
wire [17:0] t1_11;
wire [17:0] t1_12;
wire [17:0] t1_13;
wire [17:0] t1_14;
wire [17:0] t1_15;
wire [17:0] t1_16;
wire [17:0] t1_17;
wire [17:0] t1_18;
wire [17:0] t1_19;
wire [17:0] t1_20;
wire [17:0] t1_21;
wire [17:0] t1_22;
wire [17:0] t1_23;
wire [17:0] t1_24;
wire [17:0] t1_25;
wire [17:0] t1_26;
wire [17:0] t1_27;
wire [17:0] t1_28;
wire [17:0] t1_29;
wire [17:0] t1_30;
wire [17:0] t1_31;
wire next_1;
wire [17:0] t2_0;
wire [17:0] t2_1;
wire [17:0] t2_2;
wire [17:0] t2_3;
wire [17:0] t2_4;
wire [17:0] t2_5;
wire [17:0] t2_6;
wire [17:0] t2_7;
wire [17:0] t2_8;
wire [17:0] t2_9;
wire [17:0] t2_10;
wire [17:0] t2_11;
wire [17:0] t2_12;
wire [17:0] t2_13;
wire [17:0] t2_14;
wire [17:0] t2_15;
wire [17:0] t2_16;
wire [17:0] t2_17;
wire [17:0] t2_18;
wire [17:0] t2_19;
wire [17:0] t2_20;
wire [17:0] t2_21;
wire [17:0] t2_22;
wire [17:0] t2_23;
wire [17:0] t2_24;
wire [17:0] t2_25;
wire [17:0] t2_26;
wire [17:0] t2_27;
wire [17:0] t2_28;
wire [17:0] t2_29;
wire [17:0] t2_30;
wire [17:0] t2_31;
wire next_2;

assign t0_0 = X0;
assign Y0 = t2_0;
assign t0_1 = X1;
assign Y1 = t2_1;
assign t0_2 = X2;
assign Y2 = t2_2;
assign t0_3 = X3;
assign Y3 = t2_3;
assign t0_4 = X4;
assign Y4 = t2_4;
assign t0_5 = X5;
assign Y5 = t2_5;
assign t0_6 = X6;
assign Y6 = t2_6;
assign t0_7 = X7;
assign Y7 = t2_7;
assign t0_8 = X8;
assign Y8 = t2_8;
assign t0_9 = X9;
assign Y9 = t2_9;
assign t0_10 = X10;
assign Y10 = t2_10;
assign t0_11 = X11;
assign Y11 = t2_11;
assign t0_12 = X12;
assign Y12 = t2_12;
assign t0_13 = X13;
assign Y13 = t2_13;
assign t0_14 = X14;
assign Y14 = t2_14;
assign t0_15 = X15;
assign Y15 = t2_15;
assign t0_16 = X16;
assign Y16 = t2_16;
assign t0_17 = X17;
assign Y17 = t2_17;
assign t0_18 = X18;
assign Y18 = t2_18;
assign t0_19 = X19;
assign Y19 = t2_19;
assign t0_20 = X20;
assign Y20 = t2_20;
assign t0_21 = X21;
assign Y21 = t2_21;
assign t0_22 = X22;
assign Y22 = t2_22;
assign t0_23 = X23;
assign Y23 = t2_23;
assign t0_24 = X24;
assign Y24 = t2_24;
assign t0_25 = X25;
assign Y25 = t2_25;
assign t0_26 = X26;
assign Y26 = t2_26;
assign t0_27 = X27;
assign Y27 = t2_27;
assign t0_28 = X28;
assign Y28 = t2_28;
assign t0_29 = X29;
assign Y29 = t2_29;
assign t0_30 = X30;
assign Y30 = t2_30;
assign t0_31 = X31;
assign Y31 = t2_31;
assign next_0 = next;
assign next_out = next_2;
codeBlock88206_18 codeBlock88206_18_inst (
	.clk(clk),
	.reset(reset),
	.next_in(next_0),
	.X0_in(t0_0),
	.Y0(t1_0),
	.X1_in(t0_1),
	.Y1(t1_1),
	.X2_in(t0_2),
	.Y2(t1_2),
	.X3_in(t0_3),
	.Y3(t1_3),
	.X4_in(t0_4),
	.Y4(t1_4),
	.X5_in(t0_5),
	.Y5(t1_5),
	.X6_in(t0_6),
	.Y6(t1_6),
	.X7_in(t0_7),
	.Y7(t1_7),
	.X8_in(t0_8),
	.Y8(t1_8),
	.X9_in(t0_9),
	.Y9(t1_9),
	.X10_in(t0_10),
	.Y10(t1_10),
	.X11_in(t0_11),
	.Y11(t1_11),
	.X12_in(t0_12),
	.Y12(t1_12),
	.X13_in(t0_13),
	.Y13(t1_13),
	.X14_in(t0_14),
	.Y14(t1_14),
	.X15_in(t0_15),
	.Y15(t1_15),
	.X16_in(t0_16),
	.Y16(t1_16),
	.X17_in(t0_17),
	.Y17(t1_17),
	.X18_in(t0_18),
	.Y18(t1_18),
	.X19_in(t0_19),
	.Y19(t1_19),
	.X20_in(t0_20),
	.Y20(t1_20),
	.X21_in(t0_21),
	.Y21(t1_21),
	.X22_in(t0_22),
	.Y22(t1_22),
	.X23_in(t0_23),
	.Y23(t1_23),
	.X24_in(t0_24),
	.Y24(t1_24),
	.X25_in(t0_25),
	.Y25(t1_25),
	.X26_in(t0_26),
	.Y26(t1_26),
	.X27_in(t0_27),
	.Y27(t1_27),
	.X28_in(t0_28),
	.Y28(t1_28),
	.X29_in(t0_29),
	.Y29(t1_29),
	.X30_in(t0_30),
	.Y30(t1_30),
	.X31_in(t0_31),
	.Y31(t1_31),
	.next_out(next_1)
);

codeBlock89324_18 codeBlock89324_18_inst (
	.clk(clk),
	.reset(reset),
	.next_in(next_1),
	.X0_in(t1_0),
	.Y0(t2_0),
	.X1_in(t1_1),
	.Y1(t2_1),
	.X2_in(t1_2),
	.Y2(t2_2),
	.X3_in(t1_3),
	.Y3(t2_3),
	.X4_in(t1_4),
	.Y4(t2_4),
	.X5_in(t1_5),
	.Y5(t2_5),
	.X6_in(t1_6),
	.Y6(t2_6),
	.X7_in(t1_7),
	.Y7(t2_7),
	.X8_in(t1_8),
	.Y8(t2_8),
	.X9_in(t1_9),
	.Y9(t2_9),
	.X10_in(t1_10),
	.Y10(t2_10),
	.X11_in(t1_11),
	.Y11(t2_11),
	.X12_in(t1_12),
	.Y12(t2_12),
	.X13_in(t1_13),
	.Y13(t2_13),
	.X14_in(t1_14),
	.Y14(t2_14),
	.X15_in(t1_15),
	.Y15(t2_15),
	.X16_in(t1_16),
	.Y16(t2_16),
	.X17_in(t1_17),
	.Y17(t2_17),
	.X18_in(t1_18),
	.Y18(t2_18),
	.X19_in(t1_19),
	.Y19(t2_19),
	.X20_in(t1_20),
	.Y20(t2_20),
	.X21_in(t1_21),
	.Y21(t2_21),
	.X22_in(t1_22),
	.Y22(t2_22),
	.X23_in(t1_23),
	.Y23(t2_23),
	.X24_in(t1_24),
	.Y24(t2_24),
	.X25_in(t1_25),
	.Y25(t2_25),
	.X26_in(t1_26),
	.Y26(t2_26),
	.X27_in(t1_27),
	.Y27(t2_27),
	.X28_in(t1_28),
	.Y28(t2_28),
	.X29_in(t1_29),
	.Y29(t2_29),
	.X30_in(t1_30),
	.Y30(t2_30),
	.X31_in(t1_31),
	.Y31(t2_31),
	.next_out(next_2)
);

endmodule
module codeBlock89324_18 (
	input clk,
	input reset,
	input next_in,
	input [17:0] X0_in,
	output [17:0] Y0,
	input [17:0] X1_in,
	output [17:0] Y1,
	input [17:0] X2_in,
	output [17:0] Y2,
	input [17:0] X3_in,
	output [17:0] Y3,
	input [17:0] X4_in,
	output [17:0] Y4,
	input [17:0] X5_in,
	output [17:0] Y5,
	input [17:0] X6_in,
	output [17:0] Y6,
	input [17:0] X7_in,
	output [17:0] Y7,
	input [17:0] X8_in,
	output [17:0] Y8,
	input [17:0] X9_in,
	output [17:0] Y9,
	input [17:0] X10_in,
	output [17:0] Y10,
	input [17:0] X11_in,
	output [17:0] Y11,
	input [17:0] X12_in,
	output [17:0] Y12,
	input [17:0] X13_in,
	output [17:0] Y13,
	input [17:0] X14_in,
	output [17:0] Y14,
	input [17:0] X15_in,
	output [17:0] Y15,
	input [17:0] X16_in,
	output [17:0] Y16,
	input [17:0] X17_in,
	output [17:0] Y17,
	input [17:0] X18_in,
	output [17:0] Y18,
	input [17:0] X19_in,
	output [17:0] Y19,
	input [17:0] X20_in,
	output [17:0] Y20,
	input [17:0] X21_in,
	output [17:0] Y21,
	input [17:0] X22_in,
	output [17:0] Y22,
	input [17:0] X23_in,
	output [17:0] Y23,
	input [17:0] X24_in,
	output [17:0] Y24,
	input [17:0] X25_in,
	output [17:0] Y25,
	input [17:0] X26_in,
	output [17:0] Y26,
	input [17:0] X27_in,
	output [17:0] Y27,
	input [17:0] X28_in,
	output [17:0] Y28,
	input [17:0] X29_in,
	output [17:0] Y29,
	input [17:0] X30_in,
	output [17:0] Y30,
	input [17:0] X31_in,
	output [17:0] Y31,
	output next_out
);

reg next;
reg [17:0] X0;
reg [17:0] X1;
reg [17:0] X2;
reg [17:0] X3;
reg [17:0] X4;
reg [17:0] X5;
reg [17:0] X6;
reg [17:0] X7;
reg [17:0] X8;
reg [17:0] X9;
reg [17:0] X10;
reg [17:0] X11;
reg [17:0] X12;
reg [17:0] X13;
reg [17:0] X14;
reg [17:0] X15;
reg [17:0] X16;
reg [17:0] X17;
reg [17:0] X18;
reg [17:0] X19;
reg [17:0] X20;
reg [17:0] X21;
reg [17:0] X22;
reg [17:0] X23;
reg [17:0] X24;
reg [17:0] X25;
reg [17:0] X26;
reg [17:0] X27;
reg [17:0] X28;
reg [17:0] X29;
reg [17:0] X30;
reg [17:0] X31;

shiftRegFIFO_2_1 shiftRegFIFO_2_1_inst (
	.X(next),
	.Y(next_out),
	.reset(reset),
	.clk(clk)
);

wire  [17:0] a65;
 		wire  [17:0] a66;
 		wire  [17:0] a67;
 		wire  [17:0] a68;
 		wire  [17:0] a73;
 		wire  [17:0] a74;
 		wire  [17:0] a75;
 		wire  [17:0] a76;
 		wire  [17:0] a81;
 		wire  [17:0] a82;
 		wire  [17:0] a83;
 		wire  [17:0] a84;
 		wire  [17:0] a89;
 		wire  [17:0] a90;
 		wire  [17:0] a91;
 		wire  [17:0] a92;
 		wire  [17:0] a97;
 		wire  [17:0] a98;
 		wire  [17:0] a99;
 		wire  [17:0] a100;
 		wire  [17:0] a105;
 		wire  [17:0] a106;
 		wire  [17:0] a107;
 		wire  [17:0] a108;
 		wire  [17:0] a113;
 		wire  [17:0] a114;
 		wire  [17:0] a115;
 		wire  [17:0] a116;
 		wire  [17:0] a121;
 		wire  [17:0] a122;
 		wire  [17:0] a123;
 		wire  [17:0] a124;
 		wire  [17:0] t402;
 		wire  [17:0] t403;
 		wire  [17:0] t404;
 		wire  [17:0] t405;
 		wire  [17:0] t406;
 		wire  [17:0] t407;
 		wire  [17:0] t408;
 		wire  [17:0] t409;
 		wire  [17:0] t418;
 		wire  [17:0] t419;
 		wire  [17:0] t420;
 		wire  [17:0] t421;
 		wire  [17:0] t422;
 		wire  [17:0] t423;
 		wire  [17:0] t424;
 		wire  [17:0] t425;
 		wire  [17:0] t434;
 		wire  [17:0] t435;
 		wire  [17:0] t436;
 		wire  [17:0] t437;
 		wire  [17:0] t438;
 		wire  [17:0] t439;
 		wire  [17:0] t440;
 		wire  [17:0] t441;
 		wire  [17:0] t450;
 		wire  [17:0] t451;
 		wire  [17:0] t452;
 		wire  [17:0] t453;
 		wire  [17:0] t454;
 		wire  [17:0] t455;
 		wire  [17:0] t456;
 		wire  [17:0] t457;
 		wire  [17:0] t410;
 		wire  [17:0] t411;
 		wire  [17:0] t412;
 		wire  [17:0] t413;
 		wire  [17:0] t414;
 		wire  [17:0] t415;
 		wire  [17:0] t416;
 		wire  [17:0] t417;
 		wire  [17:0] t426;
 		wire  [17:0] t427;
 		wire  [17:0] t428;
 		wire  [17:0] t429;
 		wire  [17:0] t430;
 		wire  [17:0] t431;
 		wire  [17:0] t432;
 		wire  [17:0] t433;
 		wire  [17:0] t442;
 		wire  [17:0] t443;
 		wire  [17:0] t444;
 		wire  [17:0] t445;
 		wire  [17:0] t446;
 		wire  [17:0] t447;
 		wire  [17:0] t448;
 		wire  [17:0] t449;
 		wire  [17:0] t458;
 		wire  [17:0] t459;
 		wire  [17:0] t460;
 		wire  [17:0] t461;
 		wire  [17:0] t462;
 		wire  [17:0] t463;
 		wire  [17:0] t464;
 		wire  [17:0] t465;
assign a65 = X0;
 		assign a66 = X16;
 		assign a67 = X1;
 		assign a68 = X17;
 		assign a73 = X8;
 		assign a74 = X24;
 		assign a75 = X9;
 		assign a76 = X25;
 		assign a81 = X2;
 		assign a82 = X18;
 		assign a83 = X3;
 		assign a84 = X19;
 		assign a89 = X10;
 		assign a90 = X26;
 		assign a91 = X11;
 		assign a92 = X27;
 		assign a97 = X4;
 		assign a98 = X20;
 		assign a99 = X5;
 		assign a100 = X21;
 		assign a105 = X12;
 		assign a106 = X28;
 		assign a107 = X13;
 		assign a108 = X29;
 		assign a113 = X6;
 		assign a114 = X22;
 		assign a115 = X7;
 		assign a116 = X23;
 		assign a121 = X14;
 		assign a122 = X30;
 		assign a123 = X15;
 		assign a124 = X31;
 		assign Y0 = t410;
 		assign Y1 = t411;
 		assign Y16 = t412;
 		assign Y17 = t413;
 		assign Y8 = t414;
 		assign Y9 = t415;
 		assign Y24 = t416;
 		assign Y25 = t417;
 		assign Y2 = t426;
 		assign Y3 = t427;
 		assign Y18 = t428;
 		assign Y19 = t429;
 		assign Y10 = t430;
 		assign Y11 = t431;
 		assign Y26 = t432;
 		assign Y27 = t433;
 		assign Y4 = t442;
 		assign Y5 = t443;
 		assign Y20 = t444;
 		assign Y21 = t445;
 		assign Y12 = t446;
 		assign Y13 = t447;
 		assign Y28 = t448;
 		assign Y29 = t449;
 		assign Y6 = t458;
 		assign Y7 = t459;
 		assign Y22 = t460;
 		assign Y23 = t461;
 		assign Y14 = t462;
 		assign Y15 = t463;
 		assign Y30 = t464;
 		assign Y31 = t465;

addfxp_18_1 add89336(.a(a65), .b(a66), .clk(clk), .q(t402));
 		addfxp_18_1 add89351(.a(a67), .b(a68), .clk(clk), .q(t403));
 		subfxp_18_1 sub89366(.a(a65), .b(a66), .clk(clk), .q(t404));
 		subfxp_18_1 sub89381(.a(a67), .b(a68), .clk(clk), .q(t405));
 		addfxp_18_1 add89396(.a(a73), .b(a74), .clk(clk), .q(t406));
 		addfxp_18_1 add89411(.a(a75), .b(a76), .clk(clk), .q(t407));
 		subfxp_18_1 sub89426(.a(a73), .b(a74), .clk(clk), .q(t408));
 		subfxp_18_1 sub89441(.a(a75), .b(a76), .clk(clk), .q(t409));
 		addfxp_18_1 add89544(.a(a81), .b(a82), .clk(clk), .q(t418));
 		addfxp_18_1 add89559(.a(a83), .b(a84), .clk(clk), .q(t419));
 		subfxp_18_1 sub89574(.a(a81), .b(a82), .clk(clk), .q(t420));
 		subfxp_18_1 sub89589(.a(a83), .b(a84), .clk(clk), .q(t421));
 		addfxp_18_1 add89604(.a(a89), .b(a90), .clk(clk), .q(t422));
 		addfxp_18_1 add89619(.a(a91), .b(a92), .clk(clk), .q(t423));
 		subfxp_18_1 sub89634(.a(a89), .b(a90), .clk(clk), .q(t424));
 		subfxp_18_1 sub89649(.a(a91), .b(a92), .clk(clk), .q(t425));
 		addfxp_18_1 add89752(.a(a97), .b(a98), .clk(clk), .q(t434));
 		addfxp_18_1 add89767(.a(a99), .b(a100), .clk(clk), .q(t435));
 		subfxp_18_1 sub89782(.a(a97), .b(a98), .clk(clk), .q(t436));
		subfxp_18_1 sub89797(.a(a99), .b(a100), .clk(clk), .q(t437));
 		addfxp_18_1 add89812(.a(a105), .b(a106), .clk(clk), .q(t438));
 		addfxp_18_1 add89827(.a(a107), .b(a108), .clk(clk), .q(t439));
 		subfxp_18_1 sub89842(.a(a105), .b(a106), .clk(clk), .q(t440));
 		subfxp_18_1 sub89857(.a(a107), .b(a108), .clk(clk), .q(t441));
 		addfxp_18_1 add89960(.a(a113), .b(a114), .clk(clk), .q(t450));
 		addfxp_18_1 add89975(.a(a115), .b(a116), .clk(clk), .q(t451));
 		subfxp_18_1 sub89990(.a(a113), .b(a114), .clk(clk), .q(t452));
 		subfxp_18_1 sub90005(.a(a115), .b(a116), .clk(clk), .q(t453));
 		addfxp_18_1 add90020(.a(a121), .b(a122), .clk(clk), .q(t454));
 		addfxp_18_1 add90035(.a(a123), .b(a124), .clk(clk), .q(t455));
 		subfxp_18_1 sub90050(.a(a121), .b(a122), .clk(clk), .q(t456));
 		subfxp_18_1 sub90065(.a(a123), .b(a124), .clk(clk), .q(t457));
 		addfxp_18_1 add89448(.a(t402), .b(t406), .clk(clk), .q(t410));
 		addfxp_18_1 add89455(.a(t403), .b(t407), .clk(clk), .q(t411));
 		subfxp_18_1 sub89462(.a(t402), .b(t406), .clk(clk), .q(t412));
 		subfxp_18_1 sub89469(.a(t403), .b(t407), .clk(clk), .q(t413));
 		addfxp_18_1 add89492(.a(t404), .b(t409), .clk(clk), .q(t414));
 		subfxp_18_1 sub89499(.a(t405), .b(t408), .clk(clk), .q(t415));
 		subfxp_18_1 sub89506(.a(t404), .b(t409), .clk(clk), .q(t416));
 		addfxp_18_1 add89513(.a(t405), .b(t408), .clk(clk), .q(t417));
 		addfxp_18_1 add89656(.a(t418), .b(t422), .clk(clk), .q(t426));
 		addfxp_18_1 add89663(.a(t419), .b(t423), .clk(clk), .q(t427));
 		subfxp_18_1 sub89670(.a(t418), .b(t422), .clk(clk), .q(t428));
 		subfxp_18_1 sub89677(.a(t419), .b(t423), .clk(clk), .q(t429));
 		addfxp_18_1 add89700(.a(t420), .b(t425), .clk(clk), .q(t430));
 		subfxp_18_1 sub89707(.a(t421), .b(t424), .clk(clk), .q(t431));
 		subfxp_18_1 sub89714(.a(t420), .b(t425), .clk(clk), .q(t432));
 		addfxp_18_1 add89721(.a(t421), .b(t424), .clk(clk), .q(t433));
 		addfxp_18_1 add89864(.a(t434), .b(t438), .clk(clk), .q(t442));
 		addfxp_18_1 add89871(.a(t435), .b(t439), .clk(clk), .q(t443));
 		subfxp_18_1 sub89878(.a(t434), .b(t438), .clk(clk), .q(t444));
 		subfxp_18_1 sub89885(.a(t435), .b(t439), .clk(clk), .q(t445));
 		addfxp_18_1 add89908(.a(t436), .b(t441), .clk(clk), .q(t446));
 		subfxp_18_1 sub89915(.a(t437), .b(t440), .clk(clk), .q(t447));
 		subfxp_18_1 sub89922(.a(t436), .b(t441), .clk(clk), .q(t448));
 		addfxp_18_1 add89929(.a(t437), .b(t440), .clk(clk), .q(t449));
 		addfxp_18_1 add90072(.a(t450), .b(t454), .clk(clk), .q(t458));
 		addfxp_18_1 add90079(.a(t451), .b(t455), .clk(clk), .q(t459));
 		subfxp_18_1 sub90086(.a(t450), .b(t454), .clk(clk), .q(t460));
 		subfxp_18_1 sub90093(.a(t451), .b(t455), .clk(clk), .q(t461));
 		addfxp_18_1 add90116(.a(t452), .b(t457), .clk(clk), .q(t462));
 		subfxp_18_1 sub90123(.a(t453), .b(t456), .clk(clk), .q(t463));
 		subfxp_18_1 sub90130(.a(t452), .b(t457), .clk(clk), .q(t464));
 		addfxp_18_1 add90137(.a(t453), .b(t456), .clk(clk), .q(t465));

always @(posedge clk) begin
	if (reset == 1) begin
		next <= 1'b0;
	end else begin
		X0 <= X0_in;
		X1 <= X1_in;
		X2 <= X2_in;
		X3 <= X3_in;
		X4 <= X4_in;
		X5 <= X5_in;
		X6 <= X6_in;
		X7 <= X7_in;
		X8 <= X8_in;
		X9 <= X9_in;
		X10 <= X10_in;
		X11 <= X11_in;
		X12 <= X12_in;
		X13 <= X13_in;
		X14 <= X14_in;
		X15 <= X15_in;
		X16 <= X16_in;
		X17 <= X17_in;
		X18 <= X18_in;
		X19 <= X19_in;
		X20 <= X20_in;
		X21 <= X21_in;
		X22 <= X22_in;
		X23 <= X23_in;
		X24 <= X24_in;
		X25 <= X25_in;
		X26 <= X26_in;
		X27 <= X27_in;
		X28 <= X28_in;
		X29 <= X29_in;
		X30 <= X30_in;
		X31 <= X31_in;
		next <= next_in;
	end
end

endmodule
module codeBlock88206_18 (
	input clk,
	input reset,
	input next_in,
	input [17:0] X0_in,
	output [17:0] Y0,
	input [17:0] X1_in,
	output [17:0] Y1,
	input [17:0] X2_in,
	output [17:0] Y2,
	input [17:0] X3_in,
	output [17:0] Y3,
	input [17:0] X4_in,
	output [17:0] Y4,
	input [17:0] X5_in,
	output [17:0] Y5,
	input [17:0] X6_in,
	output [17:0] Y6,
	input [17:0] X7_in,
	output [17:0] Y7,
	input [17:0] X8_in,
	output [17:0] Y8,
	input [17:0] X9_in,
	output [17:0] Y9,
	input [17:0] X10_in,
	output [17:0] Y10,
	input [17:0] X11_in,
	output [17:0] Y11,
	input [17:0] X12_in,
	output [17:0] Y12,
	input [17:0] X13_in,
	output [17:0] Y13,
	input [17:0] X14_in,
	output [17:0] Y14,
	input [17:0] X15_in,
	output [17:0] Y15,
	input [17:0] X16_in,
	output [17:0] Y16,
	input [17:0] X17_in,
	output [17:0] Y17,
	input [17:0] X18_in,
	output [17:0] Y18,
	input [17:0] X19_in,
	output [17:0] Y19,
	input [17:0] X20_in,
	output [17:0] Y20,
	input [17:0] X21_in,
	output [17:0] Y21,
	input [17:0] X22_in,
	output [17:0] Y22,
	input [17:0] X23_in,
	output [17:0] Y23,
	input [17:0] X24_in,
	output [17:0] Y24,
	input [17:0] X25_in,
	output [17:0] Y25,
	input [17:0] X26_in,
	output [17:0] Y26,
	input [17:0] X27_in,
	output [17:0] Y27,
	input [17:0] X28_in,
	output [17:0] Y28,
	input [17:0] X29_in,
	output [17:0] Y29,
	input [17:0] X30_in,
	output [17:0] Y30,
	input [17:0] X31_in,
	output [17:0] Y31,
	output next_out
);

reg next;
reg [17:0] X0;
reg [17:0] X1;
reg [17:0] X2;
reg [17:0] X3;
reg [17:0] X4;
reg [17:0] X5;
reg [17:0] X6;
reg [17:0] X7;
reg [17:0] X8;
reg [17:0] X9;
reg [17:0] X10;
reg [17:0] X11;
reg [17:0] X12;
reg [17:0] X13;
reg [17:0] X14;
reg [17:0] X15;
reg [17:0] X16;
reg [17:0] X17;
reg [17:0] X18;
reg [17:0] X19;
reg [17:0] X20;
reg [17:0] X21;
reg [17:0] X22;
reg [17:0] X23;
reg [17:0] X24;
reg [17:0] X25;
reg [17:0] X26;
reg [17:0] X27;
reg [17:0] X28;
reg [17:0] X29;
reg [17:0] X30;
reg [17:0] X31;
shiftRegFIFO_5_1 shiftRegFIFO_5_1_inst (
	.X(next),
	.Y(next_out),
	.reset(reset),
	.clk(clk)
);
wire  [17:0] a249;
 		wire  [17:0] a250;
 		wire  [17:0] a251;
 		wire  [17:0] a252;
 		wire  [17:0] a257;
 		wire  [17:0] a258;
 		wire  [17:0] a259;
 		wire  [17:0] a260;
 		wire  [17:0] a265;
 		wire  [17:0] a266;
 		wire  [17:0] a267;
 		wire  [17:0] a268;
 		wire  [17:0] a273;
 		wire  [17:0] a274;
 		wire  [17:0] a275;
 		wire  [17:0] a276;
 		wire  [17:0] a281;
 		wire  [17:0] a282;
 		wire  [17:0] a283;
 		wire  [17:0] a284;
 		wire  [17:0] a289;
 		wire  [17:0] a290;
 		wire  [17:0] a291;
 		wire  [17:0] a292;
 		wire  [17:0] a297;
 		wire  [17:0] a298;
 		wire  [17:0] a299;
 		wire  [17:0] a300;
 		wire  [17:0] a305;
 		wire  [17:0] a306;
 		wire  [17:0] a307;
 		wire  [17:0] a308;
 		wire  [17:0] t914;
 		wire  [17:0] t915;
 		wire  [17:0] t916;
 		wire  [17:0] t917;
 		wire  [17:0] t918;
 		wire  [17:0] t919;
 		wire  [17:0] t920;
 		wire  [17:0] t921;
 		wire  [17:0] t930;
 		wire  [17:0] t931;
 		wire  [17:0] t932;
 		wire  [17:0] t933;
 		wire  [17:0] t934;
 		wire  [17:0] t935;
 		wire  [17:0] t936;
 		wire  [17:0] t937;
 		wire  [17:0] t952;
 		wire  [17:0] t953;
 		wire  [17:0] t954;
 		wire  [17:0] t955;
 		wire  [17:0] t956;
 		wire  [17:0] t957;
 		wire  [17:0] t958;
 		wire  [17:0] t959;
 		wire  [17:0] t972;
 		wire  [17:0] t973;
 		wire  [17:0] t974;
 		wire  [17:0] t975;
 		wire  [17:0] t976;
 		wire  [17:0] t977;
 		wire  [17:0] t978;
 		wire  [17:0] t979;
 		wire  [17:0] t922;
 		wire  [17:0] t923;
 		wire  [17:0] t924;
 		wire  [17:0] t925;
 		wire  [17:0] t926;
 		wire  [17:0] t927;
 		wire  [17:0] t928;
 		wire  [17:0] t929;
 		wire  [17:0] t938;
 		wire  [17:0] t939;
 		wire  [17:0] t940;
 		wire  [17:0] t941;
 		wire  [17:0] t944;
 		wire  [17:0] t945;
 		wire  [17:0] t946;
 		wire  [17:0] t947;
 		wire  [17:0] t960;
 		wire  [17:0] t961;
 		wire  [17:0] t962;
 		wire  [17:0] t963;
 		wire  [17:0] t964;
 		wire  [17:0] t965;
 		wire  [17:0] t966;
 		wire  [17:0] t967;
 		wire  [17:0] t980;
 		wire  [17:0] t981;
 		wire  [17:0] t982;
 		wire  [17:0] t983;
 		wire  [17:0] t986;
 		wire  [17:0] t987;
 		wire  [17:0] t988;
 		wire  [17:0] t989;
 		reg  [17:0] tm24;
 		reg  [17:0] tm27;
 		reg  [17:0] tm30;
 		reg  [17:0] tm33;
 		reg  [17:0] tm36;
 		reg  [17:0] tm39;
 		reg  [17:0] tm42;
 		reg  [17:0] tm45;
 		reg  [17:0] tm48;
 		reg  [17:0] tm51;
 		reg  [17:0] tm54;
 		reg  [17:0] tm57;
 		reg  [17:0] tm60;
 		reg  [17:0] tm63;
 		reg  [17:0] tm66;
 		reg  [17:0] tm69;
 		wire  [17:0] a225;
 		wire  [17:0] a226;
 		wire  [17:0] a227;
 		wire  [17:0] a228;
 		wire  [17:0] a229;
 		wire  [17:0] a230;
 		wire  [17:0] a231;
 		wire  [17:0] a232;
 		wire  [17:0] a233;
 		wire  [17:0] a234;
 		wire  [17:0] a235;
 		wire  [17:0] a236;
 		wire  [17:0] a237;
 		wire  [17:0] a238;
 		wire  [17:0] a239;
 		wire  [17:0] a240;
 		wire  [17:0] a241;
 		wire  [17:0] a242;
 		wire  [17:0] a243;
 		wire  [17:0] a244;
 		wire  [17:0] a245;
 		wire  [17:0] a246;
 		wire  [17:0] a247;
 		wire  [17:0] a248;
 		reg  [17:0] tm25;
 		reg  [17:0] tm28;
 		reg  [17:0] tm31;
 		reg  [17:0] tm34;
 		reg  [17:0] tm37;
 		reg  [17:0] tm40;
 		reg  [17:0] tm43;
 		reg  [17:0] tm46;
 		reg  [17:0] tm49;
 		reg  [17:0] tm52;
 		reg  [17:0] tm55;
 		reg  [17:0] tm58;
 		reg  [17:0] tm61;
 		reg  [17:0] tm64;
 		reg  [17:0] tm67;
 		reg  [17:0] tm70;
 		wire  [17:0] t942;
 		wire  [17:0] t943;
 		wire  [17:0] t948;
 		wire  [17:0] t949;
 		wire  [17:0] t950;
 		wire  [17:0] t951;
 		wire  [17:0] t968;
 		wire  [17:0] t969;
 		wire  [17:0] t970;
 		wire  [17:0] t971;
 		wire  [17:0] t984;
 		wire  [17:0] t985;
 		wire  [17:0] t990;
 		wire  [17:0] t991;
 		wire  [17:0] t992;
 		wire  [17:0] t993;
 		reg  [17:0] tm26;
 		reg  [17:0] tm29;
 		reg  [17:0] tm32;
 		reg  [17:0] tm35;
 		reg  [17:0] tm38;
 		reg  [17:0] tm41;
 		reg  [17:0] tm44;
 		reg  [17:0] tm47;
 		reg  [17:0] tm50;
 		reg  [17:0] tm53;
 		reg  [17:0] tm56;
 		reg  [17:0] tm59;
 		reg  [17:0] tm62;
 		reg  [17:0] tm65;
 		reg  [17:0] tm68;
 		reg  [17:0] tm71;

wire [17:0] tm0;
assign tm0 = (18'hb505 >> (18-18));
wire  [17:0] tm2;
assign tm2 = (18'hec83 >> (18-18));
wire  [17:0] tm3;
assign tm3 = (18'h61f8 >> (18-18));

assign a249 = X0;
 		assign a250 = X16;
 		assign a251 = X1;
 		assign a252 = X17;
 		assign a257 = X8;
 		assign a258 = X24;
 		assign a259 = X9;
 		assign a260 = X25;
 		assign a265 = X2;
 		assign a266 = X18;
 		assign a267 = X3;
 		assign a268 = X19;
 		assign a273 = X10;
 		assign a274 = X26;
 		assign a275 = X11;
 		assign a276 = X27;
 		assign a281 = X4;
 		assign a282 = X20;
 		assign a283 = X5;
 		assign a284 = X21;
 		assign a289 = X12;
 		assign a290 = X28;
 		assign a291 = X13;
 		assign a292 = X29;
 		assign a297 = X6;
 		assign a298 = X22;
 		assign a299 = X7;
 		assign a300 = X23;
 		assign a305 = X14;
 		assign a306 = X30;
 		assign a307 = X15;
 		assign a308 = X31;
 		assign Y0 = tm26;
 		assign Y1 = tm29;
 		assign Y4 = tm32;
 		assign Y5 = tm35;
 		assign Y2 = tm38;
 		assign Y3 = tm41;
 		assign Y6 = tm44;
 		assign Y7 = tm47;
 		assign Y8 = tm50;
 		assign Y9 = tm53;
 		assign Y12 = t942;
 		assign Y13 = t943;
 		assign Y10 = t948;
 		assign Y11 = t949;
 		assign Y14 = t950;
 		assign Y15 = t951;
 		assign Y16 = tm56;
 		assign Y17 = tm59;
 		assign Y20 = tm62;
 		assign Y21 = tm65;
 		assign Y18 = t968;
 		assign Y19 = t969;
 		assign Y22 = t970;
 		assign Y23 = (~(t971)+1);
 		assign Y24 = tm68;
 		assign Y25 = tm71;
 		assign Y28 = t984;
 		assign Y29 = (~(t985)+1);
 		assign Y26 = t990;
 		assign Y27 = t991;
 		assign Y30 = (~(t992)+1);
 		assign Y31 = t993;

addfxp_18_1 add88218(.a(a249), .b(a250), .clk(clk), .q(t914));
 		addfxp_18_1 add88233(.a(a251), .b(a252), .clk(clk), .q(t915));
 		subfxp_18_1 sub88248(.a(a249), .b(a250), .clk(clk), .q(t916));
 		subfxp_18_1 sub88263(.a(a251), .b(a252), .clk(clk), .q(t917));
 		addfxp_18_1 add88278(.a(a257), .b(a258), .clk(clk), .q(t918));
 		addfxp_18_1 add88293(.a(a259), .b(a260), .clk(clk), .q(t919));
 		subfxp_18_1 sub88308(.a(a257), .b(a258), .clk(clk), .q(t920));
 		subfxp_18_1 sub88323(.a(a259), .b(a260), .clk(clk), .q(t921));
 		addfxp_18_1 add88426(.a(a265), .b(a266), .clk(clk), .q(t930));
 		addfxp_18_1 add88441(.a(a267), .b(a268), .clk(clk), .q(t931));
 		subfxp_18_1 sub88456(.a(a265), .b(a266), .clk(clk), .q(t932));
 		subfxp_18_1 sub88471(.a(a267), .b(a268), .clk(clk), .q(t933));
 		addfxp_18_1 add88486(.a(a273), .b(a274), .clk(clk), .q(t934));
 		addfxp_18_1 add88501(.a(a275), .b(a276), .clk(clk), .q(t935));
 		subfxp_18_1 sub88516(.a(a273), .b(a274), .clk(clk), .q(t936));
 		subfxp_18_1 sub88531(.a(a275), .b(a276), .clk(clk), .q(t937));
 		addfxp_18_1 add88746(.a(a281), .b(a282), .clk(clk), .q(t952));
 		addfxp_18_1 add88761(.a(a283), .b(a284), .clk(clk), .q(t953));
 		subfxp_18_1 sub88776(.a(a281), .b(a282), .clk(clk), .q(t954));
 		subfxp_18_1 sub88791(.a(a283), .b(a284), .clk(clk), .q(t955));
 		addfxp_18_1 add88806(.a(a289), .b(a290), .clk(clk), .q(t956));
 		addfxp_18_1 add88821(.a(a291), .b(a292), .clk(clk), .q(t957));
 		subfxp_18_1 sub88836(.a(a289), .b(a290), .clk(clk), .q(t958));
 		subfxp_18_1 sub88851(.a(a291), .b(a292), .clk(clk), .q(t959));
 		addfxp_18_1 add89012(.a(a297), .b(a298), .clk(clk), .q(t972));
 		addfxp_18_1 add89027(.a(a299), .b(a300), .clk(clk), .q(t973));
 		subfxp_18_1 sub89042(.a(a297), .b(a298), .clk(clk), .q(t974));
 		subfxp_18_1 sub89057(.a(a299), .b(a300), .clk(clk), .q(t975));
 		addfxp_18_1 add89072(.a(a305), .b(a306), .clk(clk), .q(t976));
 		addfxp_18_1 add89087(.a(a307), .b(a308), .clk(clk), .q(t977));
 		subfxp_18_1 sub89102(.a(a305), .b(a306), .clk(clk), .q(t978));
 		subfxp_18_1 sub89117(.a(a307), .b(a308), .clk(clk), .q(t979));
 		addfxp_18_1 add88330(.a(t914), .b(t918), .clk(clk), .q(t922));
 		addfxp_18_1 add88337(.a(t915), .b(t919), .clk(clk), .q(t923));
 		subfxp_18_1 sub88344(.a(t914), .b(t918), .clk(clk), .q(t924));
 		subfxp_18_1 sub88351(.a(t915), .b(t919), .clk(clk), .q(t925));
 		addfxp_18_1 add88374(.a(t916), .b(t921), .clk(clk), .q(t926));
 		subfxp_18_1 sub88381(.a(t917), .b(t920), .clk(clk), .q(t927));
 		subfxp_18_1 sub88388(.a(t916), .b(t921), .clk(clk), .q(t928));
 		addfxp_18_1 add88395(.a(t917), .b(t920), .clk(clk), .q(t929));
 		addfxp_18_1 add88538(.a(t930), .b(t934), .clk(clk), .q(t938));
 		addfxp_18_1 add88545(.a(t931), .b(t935), .clk(clk), .q(t939));
 		subfxp_18_1 sub88552(.a(t930), .b(t934), .clk(clk), .q(t940));
 		subfxp_18_1 sub88559(.a(t931), .b(t935), .clk(clk), .q(t941));
 		addfxp_18_1 add88610(.a(t932), .b(t937), .clk(clk), .q(t944));
 		subfxp_18_1 sub88617(.a(t933), .b(t936), .clk(clk), .q(t945));
 		subfxp_18_1 sub88624(.a(t932), .b(t937), .clk(clk), .q(t946));
 		addfxp_18_1 add88631(.a(t933), .b(t936), .clk(clk), .q(t947));
 		addfxp_18_1 add88858(.a(t952), .b(t956), .clk(clk), .q(t960));
 		addfxp_18_1 add88865(.a(t953), .b(t957), .clk(clk), .q(t961));
 		subfxp_18_1 sub88872(.a(t952), .b(t956), .clk(clk), .q(t962));
 		subfxp_18_1 sub88879(.a(t953), .b(t957), .clk(clk), .q(t963));
 		addfxp_18_1 add88903(.a(t954), .b(t959), .clk(clk), .q(t964));
 		subfxp_18_1 sub88910(.a(t955), .b(t958), .clk(clk), .q(t965));
 		subfxp_18_1 sub88917(.a(t954), .b(t959), .clk(clk), .q(t966));
 		addfxp_18_1 add88924(.a(t955), .b(t958), .clk(clk), .q(t967));
 		addfxp_18_1 add89124(.a(t972), .b(t976), .clk(clk), .q(t980));
 		addfxp_18_1 add89131(.a(t973), .b(t977), .clk(clk), .q(t981));
 		subfxp_18_1 sub89138(.a(t972), .b(t976), .clk(clk), .q(t982));
 		subfxp_18_1 sub89145(.a(t973), .b(t977), .clk(clk), .q(t983));
 		addfxp_18_1 add89197(.a(t974), .b(t979), .clk(clk), .q(t986));
 		subfxp_18_1 sub89204(.a(t975), .b(t978), .clk(clk), .q(t987));
 		subfxp_18_1 sub89211(.a(t974), .b(t979), .clk(clk), .q(t988));
 		addfxp_18_1 add89218(.a(t975), .b(t978), .clk(clk), .q(t989));

multfix_alt_dsp_18 m88566(.ax(tm0), .ay(t940), .bx(tm0), .by(t941), .clk(clk), .a_q_sc(a225), .a_q_unsc(), .b_q_sc(a226), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88570(.ax(tm2), .ay(t944), .bx(tm3), .by(t945), .clk(clk), .a_q_sc(a227), .a_q_unsc(), .b_q_sc(a228), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88572(.ax(tm2), .ay(t945), .bx(tm3), .by(t944), .clk(clk), .a_q_sc(a229), .a_q_unsc(), .b_q_sc(a230), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88574(.ax(tm3), .ay(t946), .bx(tm2), .by(t947), .clk(clk), .a_q_sc(a231), .a_q_unsc(), .b_q_sc(a232), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88576(.ax(tm3), .ay(t947), .bx(tm2), .by(t946), .clk(clk), .a_q_sc(a233), .a_q_unsc(), .b_q_sc(a234), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88578(.ax(tm0), .ay(t964), .bx(tm0), .by(t965), .clk(clk), .a_q_sc(a235), .a_q_unsc(), .b_q_sc(a236), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88580(.ax(tm0), .ay(t967), .bx(tm0), .by(t966), .clk(clk), .a_q_sc(a237), .a_q_unsc(), .b_q_sc(a238), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88582(.ax(tm0), .ay(t983), .bx(tm0), .by(t982), .clk(clk), .a_q_sc(a239), .a_q_unsc(), .b_q_sc(a240), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88584(.ax(tm3), .ay(t986), .bx(tm2), .by(t987), .clk(clk), .a_q_sc(a241), .a_q_unsc(), .b_q_sc(a242), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88586(.ax(tm3), .ay(t987), .bx(tm2), .by(t986), .clk(clk), .a_q_sc(a243), .a_q_unsc(), .b_q_sc(a244), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88588(.ax(tm2), .ay(t988), .bx(tm3), .by(t989), .clk(clk), .a_q_sc(a245), .a_q_unsc(), .b_q_sc(a246), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88590(.ax(tm3), .ay(t988), .bx(tm2), .by(t989), .clk(clk), .a_q_sc(a247), .a_q_unsc(), .b_q_sc(a248), .b_q_unsc(), .rst(reset));

addfxp_18_1 add88580(.a(a225), .b(a226), .clk(clk), .q(t942));
 		subfxp_18_1 sub88587(.a(a226), .b(a225), .clk(clk), .q(t943));
 		addfxp_18_1 add88652(.a(a227), .b(a228), .clk(clk), .q(t948));
 		subfxp_18_1 sub88673(.a(a229), .b(a230), .clk(clk), .q(t949));
 		addfxp_18_1 add88694(.a(a231), .b(a232), .clk(clk), .q(t950));
 		subfxp_18_1 sub88715(.a(a233), .b(a234), .clk(clk), .q(t951));
 		addfxp_18_1 add88945(.a(a235), .b(a236), .clk(clk), .q(t968));
 		subfxp_18_1 sub88952(.a(a236), .b(a235), .clk(clk), .q(t969));
 		subfxp_18_1 sub88973(.a(a237), .b(a238), .clk(clk), .q(t970));
 		addfxp_18_1 add88980(.a(a238), .b(a237), .clk(clk), .q(t971));
 		subfxp_18_1 sub89166(.a(a239), .b(a240), .clk(clk), .q(t984));
 		addfxp_18_1 add89173(.a(a240), .b(a239), .clk(clk), .q(t985));
 		addfxp_18_1 add89239(.a(a241), .b(a242), .clk(clk), .q(t990));
 		subfxp_18_1 sub89260(.a(a243), .b(a244), .clk(clk), .q(t991));
 		addfxp_18_1 add89281(.a(a245), .b(a246), .clk(clk), .q(t992));
 		subfxp_18_1 sub89302(.a(a247), .b(a248), .clk(clk), .q(t993));

always @(posedge clk) begin
	if (reset == 1) begin
		next <= 1'b0;
	end else begin
		X0 <= X0_in;
		X1 <= X1_in;
		X2 <= X2_in;
		X3 <= X3_in;
		X4 <= X4_in;
		X5 <= X5_in;
		X6 <= X6_in;
		X7 <= X7_in;
		X8 <= X8_in;
		X9 <= X9_in;
		X10 <= X10_in;
		X11 <= X11_in;
		X12 <= X12_in;
		X13 <= X13_in;
		X14 <= X14_in;
		X15 <= X15_in;
		X16 <= X16_in;
		X17 <= X17_in;
		X18 <= X18_in;
		X19 <= X19_in;
		X20 <= X20_in;
		X21 <= X21_in;
		X22 <= X22_in;
		X23 <= X23_in;
		X24 <= X24_in;
		X25 <= X25_in;
		X26 <= X26_in;
		X27 <= X27_in;
		X28 <= X28_in;
		X29 <= X29_in;
		X30 <= X30_in;
		X31 <= X31_in;
		next <= next_in;
		tm24 <= t922;
		tm27 <= t923;
		tm30 <= t924;
		tm33 <= t925;
		tm36 <= t926;
		tm39 <= t927;
		tm42 <= t928;
		tm45 <= t929;
		tm48 <= t938;
		tm51 <= t939;
		tm54 <= t960;
		tm57 <= t961;
		tm60 <= t963;
		tm63 <= (~(t962)+1);
		tm66 <= t980;
		tm69 <= t981;
		tm25 <= tm24;
		tm28 <= tm27;
		tm31 <= tm30;
		tm34 <= tm33;
		tm37 <= tm36;
		tm40 <= tm39;
		tm43 <= tm42;
		tm46 <= tm45;
		tm49 <= tm48;
		tm52 <= tm51;
		tm55 <= tm54;
		tm58 <= tm57;
		tm61 <= tm60;
		tm64 <= tm63;
		tm67 <= tm66;
		tm70 <= tm69;
		tm26 <= tm25;
		tm29 <= tm28;
		tm32 <= tm31;
		tm35 <= tm34;
		tm38 <= tm37;
		tm41 <= tm40;
		tm44 <= tm43;
		tm47 <= tm46;
		tm50 <= tm49;
		tm53 <= tm52;
		tm56 <= tm55;
		tm59 <= tm58;
		tm62 <= tm61;
		tm65 <= tm64;
		tm68 <= tm67;
		tm71 <= tm70;
	end
end

endmodule
module shift_register_group_18_910 (
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
	input reset
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_10 shift_register_unit_18_10_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

endmodule
module shift_register_unit_18_10 (
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
	end
end

assign out = shift_registers_9;

endmodule

module addfxp_18_1 (
	input [17:0] a,
	input [17:0] b,
	input clk,
	output [17:0] q
);

reg [17:0] res_0;
assign q = res_0;

always @(posedge clk) begin
	res_0 <= a + b;
end

endmodule

module multfix_alt_dsp_18 (
	input [17:0] ax,
	input [17:0] ay,
	input [17:0] bx,
	input [17:0] by,
	input clk,
	output [17:0] a_q_sc,
	output [17:0] a_q_unsc,
	output [17:0] b_q_sc,
	output [17:0] b_q_unsc,
	input rst
);

wire [35:0] a_res;
wire [35:0] b_res;

assign a_q_unsc = a_res[17:0];
assign a_q_sc = {a_res[35-1], a_res[32			:16]};
assign b_q_unsc = b_res[17:0];
assign b_q_sc = {b_res[35-1], b_res[32			:16]};

dsp_signed_mult_18x18_unit_18_36_0 dsp_signed_mult_18x18_unit_18_36_0_inst (
	.clk(clk),
	.ena(1'b1),
	.reset(rst),
	.i_valid(),
	.o_valid(),
	.ax(ax),
	.ay(ay),
	.bx(bx),
	.by(by),
	.resulta(a_res),
	.resultb(b_res)
);

endmodule
module dsp_signed_mult_18x18_unit_18_36_0 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [17:0] ay,
	input [17:0] bx,
	input [17:0] by,
	output o_valid,
	output [35:0] resulta,
	output [35:0] resultb 
);

reg [35:0] reg_resa, reg_resb;
always @(posedge clk) begin
	reg_resa <= ax * ay;
	reg_resb <= bx * by;
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

module shiftRegFIFO_2_1 (
	input [0:0] X,
	output [0:0] Y,
	input reset,
	input clk
);

reg [0:0] mem_0;
reg [0:0] mem_1;
assign Y = mem_1;

always @ (posedge clk) begin
	if (reset) begin
		mem_0 <= 0;
		mem_1 <= 0;
	end else begin
		mem_1 <= mem_0;
		mem_0 <= X;
	end
end

endmodule

module shiftRegFIFO_5_1 (
	input [0:0] X,
	output [0:0] Y,
	input reset,
	input clk
);

reg [0:0] mem_0;
reg [0:0] mem_1;
reg [0:0] mem_2;
reg [0:0] mem_3;
reg [0:0] mem_4;
assign Y = mem_4;

always @ (posedge clk) begin
	if (reset) begin
		mem_0 <= 0;
		mem_1 <= 0;
		mem_2 <= 0;
		mem_3 <= 0;
		mem_4 <= 0;
	end else begin
		mem_1 <= mem_0;
		mem_2 <= mem_1;
		mem_3 <= mem_2;
		mem_4 <= mem_3;
		mem_0 <= X;
	end
end

endmodule

module subfxp_18_1 (
	input [17:0] a,
	input [17:0] b,
	input clk,
	output [17:0] q
);

reg [17:0] res_0;
assign q = res_0;

always @(posedge clk) begin
	res_0 <= a + b;
end

endmodule

module idft_16_top_18 (
	input clk,
	input reset,
	input next,
	input [17:0] X0,
	output [17:0] Y0,
	input [17:0] X1,
	output [17:0] Y1,
	input [17:0] X2,
	output [17:0] Y2,
	input [17:0] X3,
	output [17:0] Y3,
	input [17:0] X4,
	output [17:0] Y4,
	input [17:0] X5,
	output [17:0] Y5,
	input [17:0] X6,
	output [17:0] Y6,
	input [17:0] X7,
	output [17:0] Y7,
	input [17:0] X8,
	output [17:0] Y8,
	input [17:0] X9,
	output [17:0] Y9,
	input [17:0] X10,
	output [17:0] Y10,
	input [17:0] X11,
	output [17:0] Y11,
	input [17:0] X12,
	output [17:0] Y12,
	input [17:0] X13,
	output [17:0] Y13,
	input [17:0] X14,
	output [17:0] Y14,
	input [17:0] X15,
	output [17:0] Y15,
	input [17:0] X16,
	output [17:0] Y16,
	input [17:0] X17,
	output [17:0] Y17,
	input [17:0] X18,
	output [17:0] Y18,
	input [17:0] X19,
	output [17:0] Y19,
	input [17:0] X20,
	output [17:0] Y20,
	input [17:0] X21,
	output [17:0] Y21,
	input [17:0] X22,
	output [17:0] Y22,
	input [17:0] X23,
	output [17:0] Y23,
	input [17:0] X24,
	output [17:0] Y24,
	input [17:0] X25,
	output [17:0] Y25,
	input [17:0] X26,
	output [17:0] Y26,
	input [17:0] X27,
	output [17:0] Y27,
	input [17:0] X28,
	output [17:0] Y28,
	input [17:0] X29,
	output [17:0] Y29,
	input [17:0] X30,
	output [17:0] Y30,
	input [17:0] X31,
	output [17:0] Y31,
	output next_out
);
wire [17:0] t0_0;
wire [17:0] t0_1;
wire [17:0] t0_2;
wire [17:0] t0_3;
wire [17:0] t0_4;
wire [17:0] t0_5;
wire [17:0] t0_6;
wire [17:0] t0_7;
wire [17:0] t0_8;
wire [17:0] t0_9;
wire [17:0] t0_10;
wire [17:0] t0_11;
wire [17:0] t0_12;
wire [17:0] t0_13;
wire [17:0] t0_14;
wire [17:0] t0_15;
wire [17:0] t0_16;
wire [17:0] t0_17;
wire [17:0] t0_18;
wire [17:0] t0_19;
wire [17:0] t0_20;
wire [17:0] t0_21;
wire [17:0] t0_22;
wire [17:0] t0_23;
wire [17:0] t0_24;
wire [17:0] t0_25;
wire [17:0] t0_26;
wire [17:0] t0_27;
wire [17:0] t0_28;
wire [17:0] t0_29;
wire [17:0] t0_30;
wire [17:0] t0_31;
wire next_0;
wire [17:0] t1_0;
wire [17:0] t1_1;
wire [17:0] t1_2;
wire [17:0] t1_3;
wire [17:0] t1_4;
wire [17:0] t1_5;
wire [17:0] t1_6;
wire [17:0] t1_7;
wire [17:0] t1_8;
wire [17:0] t1_9;
wire [17:0] t1_10;
wire [17:0] t1_11;
wire [17:0] t1_12;
wire [17:0] t1_13;
wire [17:0] t1_14;
wire [17:0] t1_15;
wire [17:0] t1_16;
wire [17:0] t1_17;
wire [17:0] t1_18;
wire [17:0] t1_19;
wire [17:0] t1_20;
wire [17:0] t1_21;
wire [17:0] t1_22;
wire [17:0] t1_23;
wire [17:0] t1_24;
wire [17:0] t1_25;
wire [17:0] t1_26;
wire [17:0] t1_27;
wire [17:0] t1_28;
wire [17:0] t1_29;
wire [17:0] t1_30;
wire [17:0] t1_31;
wire next_1;
wire [17:0] t2_0;
wire [17:0] t2_1;
wire [17:0] t2_2;
wire [17:0] t2_3;
wire [17:0] t2_4;
wire [17:0] t2_5;
wire [17:0] t2_6;
wire [17:0] t2_7;
wire [17:0] t2_8;
wire [17:0] t2_9;
wire [17:0] t2_10;
wire [17:0] t2_11;
wire [17:0] t2_12;
wire [17:0] t2_13;
wire [17:0] t2_14;
wire [17:0] t2_15;
wire [17:0] t2_16;
wire [17:0] t2_17;
wire [17:0] t2_18;
wire [17:0] t2_19;
wire [17:0] t2_20;
wire [17:0] t2_21;
wire [17:0] t2_22;
wire [17:0] t2_23;
wire [17:0] t2_24;
wire [17:0] t2_25;
wire [17:0] t2_26;
wire [17:0] t2_27;
wire [17:0] t2_28;
wire [17:0] t2_29;
wire [17:0] t2_30;
wire [17:0] t2_31;
wire next_2;

assign t0_0 = X0;
assign Y0 = t2_0;
assign t0_1 = X1;
assign Y1 = t2_1;
assign t0_2 = X2;
assign Y2 = t2_2;
assign t0_3 = X3;
assign Y3 = t2_3;
assign t0_4 = X4;
assign Y4 = t2_4;
assign t0_5 = X5;
assign Y5 = t2_5;
assign t0_6 = X6;
assign Y6 = t2_6;
assign t0_7 = X7;
assign Y7 = t2_7;
assign t0_8 = X8;
assign Y8 = t2_8;
assign t0_9 = X9;
assign Y9 = t2_9;
assign t0_10 = X10;
assign Y10 = t2_10;
assign t0_11 = X11;
assign Y11 = t2_11;
assign t0_12 = X12;
assign Y12 = t2_12;
assign t0_13 = X13;
assign Y13 = t2_13;
assign t0_14 = X14;
assign Y14 = t2_14;
assign t0_15 = X15;
assign Y15 = t2_15;
assign t0_16 = X16;
assign Y16 = t2_16;
assign t0_17 = X17;
assign Y17 = t2_17;
assign t0_18 = X18;
assign Y18 = t2_18;
assign t0_19 = X19;
assign Y19 = t2_19;
assign t0_20 = X20;
assign Y20 = t2_20;
assign t0_21 = X21;
assign Y21 = t2_21;
assign t0_22 = X22;
assign Y22 = t2_22;
assign t0_23 = X23;
assign Y23 = t2_23;
assign t0_24 = X24;
assign Y24 = t2_24;
assign t0_25 = X25;
assign Y25 = t2_25;
assign t0_26 = X26;
assign Y26 = t2_26;
assign t0_27 = X27;
assign Y27 = t2_27;
assign t0_28 = X28;
assign Y28 = t2_28;
assign t0_29 = X29;
assign Y29 = t2_29;
assign t0_30 = X30;
assign Y30 = t2_30;
assign t0_31 = X31;
assign Y31 = t2_31;
assign next_0 = next;
assign next_out = next_2;
codeBlock98050_18 codeBlock98050_18_inst (
	.clk(clk),
	.reset(reset),
	.next_in(next_0),
	.X0_in(t0_0),
	.Y0(t1_0),
	.X1_in(t0_1),
	.Y1(t1_1),
	.X2_in(t0_2),
	.Y2(t1_2),
	.X3_in(t0_3),
	.Y3(t1_3),
	.X4_in(t0_4),
	.Y4(t1_4),
	.X5_in(t0_5),
	.Y5(t1_5),
	.X6_in(t0_6),
	.Y6(t1_6),
	.X7_in(t0_7),
	.Y7(t1_7),
	.X8_in(t0_8),
	.Y8(t1_8),
	.X9_in(t0_9),
	.Y9(t1_9),
	.X10_in(t0_10),
	.Y10(t1_10),
	.X11_in(t0_11),
	.Y11(t1_11),
	.X12_in(t0_12),
	.Y12(t1_12),
	.X13_in(t0_13),
	.Y13(t1_13),
	.X14_in(t0_14),
	.Y14(t1_14),
	.X15_in(t0_15),
	.Y15(t1_15),
	.X16_in(t0_16),
	.Y16(t1_16),
	.X17_in(t0_17),
	.Y17(t1_17),
	.X18_in(t0_18),
	.Y18(t1_18),
	.X19_in(t0_19),
	.Y19(t1_19),
	.X20_in(t0_20),
	.Y20(t1_20),
	.X21_in(t0_21),
	.Y21(t1_21),
	.X22_in(t0_22),
	.Y22(t1_22),
	.X23_in(t0_23),
	.Y23(t1_23),
	.X24_in(t0_24),
	.Y24(t1_24),
	.X25_in(t0_25),
	.Y25(t1_25),
	.X26_in(t0_26),
	.Y26(t1_26),
	.X27_in(t0_27),
	.Y27(t1_27),
	.X28_in(t0_28),
	.Y28(t1_28),
	.X29_in(t0_29),
	.Y29(t1_29),
	.X30_in(t0_30),
	.Y30(t1_30),
	.X31_in(t0_31),
	.Y31(t1_31),
	.next_out(next_1)
);

codeBlock99168_18 codeBlock99168_18_inst (
	.clk(clk),
	.reset(reset),
	.next_in(next_1),
	.X0_in(t1_0),
	.Y0(t2_0),
	.X1_in(t1_1),
	.Y1(t2_1),
	.X2_in(t1_2),
	.Y2(t2_2),
	.X3_in(t1_3),
	.Y3(t2_3),
	.X4_in(t1_4),
	.Y4(t2_4),
	.X5_in(t1_5),
	.Y5(t2_5),
	.X6_in(t1_6),
	.Y6(t2_6),
	.X7_in(t1_7),
	.Y7(t2_7),
	.X8_in(t1_8),
	.Y8(t2_8),
	.X9_in(t1_9),
	.Y9(t2_9),
	.X10_in(t1_10),
	.Y10(t2_10),
	.X11_in(t1_11),
	.Y11(t2_11),
	.X12_in(t1_12),
	.Y12(t2_12),
	.X13_in(t1_13),
	.Y13(t2_13),
	.X14_in(t1_14),
	.Y14(t2_14),
	.X15_in(t1_15),
	.Y15(t2_15),
	.X16_in(t1_16),
	.Y16(t2_16),
	.X17_in(t1_17),
	.Y17(t2_17),
	.X18_in(t1_18),
	.Y18(t2_18),
	.X19_in(t1_19),
	.Y19(t2_19),
	.X20_in(t1_20),
	.Y20(t2_20),
	.X21_in(t1_21),
	.Y21(t2_21),
	.X22_in(t1_22),
	.Y22(t2_22),
	.X23_in(t1_23),
	.Y23(t2_23),
	.X24_in(t1_24),
	.Y24(t2_24),
	.X25_in(t1_25),
	.Y25(t2_25),
	.X26_in(t1_26),
	.Y26(t2_26),
	.X27_in(t1_27),
	.Y27(t2_27),
	.X28_in(t1_28),
	.Y28(t2_28),
	.X29_in(t1_29),
	.Y29(t2_29),
	.X30_in(t1_30),
	.Y30(t2_30),
	.X31_in(t1_31),
	.Y31(t2_31),
	.next_out(next_2)
);

endmodule
module codeBlock99168_18 (
	input clk,
	input reset,
	input next_in,
	input [17:0] X0_in,
	output [17:0] Y0,
	input [17:0] X1_in,
	output [17:0] Y1,
	input [17:0] X2_in,
	output [17:0] Y2,
	input [17:0] X3_in,
	output [17:0] Y3,
	input [17:0] X4_in,
	output [17:0] Y4,
	input [17:0] X5_in,
	output [17:0] Y5,
	input [17:0] X6_in,
	output [17:0] Y6,
	input [17:0] X7_in,
	output [17:0] Y7,
	input [17:0] X8_in,
	output [17:0] Y8,
	input [17:0] X9_in,
	output [17:0] Y9,
	input [17:0] X10_in,
	output [17:0] Y10,
	input [17:0] X11_in,
	output [17:0] Y11,
	input [17:0] X12_in,
	output [17:0] Y12,
	input [17:0] X13_in,
	output [17:0] Y13,
	input [17:0] X14_in,
	output [17:0] Y14,
	input [17:0] X15_in,
	output [17:0] Y15,
	input [17:0] X16_in,
	output [17:0] Y16,
	input [17:0] X17_in,
	output [17:0] Y17,
	input [17:0] X18_in,
	output [17:0] Y18,
	input [17:0] X19_in,
	output [17:0] Y19,
	input [17:0] X20_in,
	output [17:0] Y20,
	input [17:0] X21_in,
	output [17:0] Y21,
	input [17:0] X22_in,
	output [17:0] Y22,
	input [17:0] X23_in,
	output [17:0] Y23,
	input [17:0] X24_in,
	output [17:0] Y24,
	input [17:0] X25_in,
	output [17:0] Y25,
	input [17:0] X26_in,
	output [17:0] Y26,
	input [17:0] X27_in,
	output [17:0] Y27,
	input [17:0] X28_in,
	output [17:0] Y28,
	input [17:0] X29_in,
	output [17:0] Y29,
	input [17:0] X30_in,
	output [17:0] Y30,
	input [17:0] X31_in,
	output [17:0] Y31,
	output next_out
);

reg next;
reg [17:0] X0;
reg [17:0] X1;
reg [17:0] X2;
reg [17:0] X3;
reg [17:0] X4;
reg [17:0] X5;
reg [17:0] X6;
reg [17:0] X7;
reg [17:0] X8;
reg [17:0] X9;
reg [17:0] X10;
reg [17:0] X11;
reg [17:0] X12;
reg [17:0] X13;
reg [17:0] X14;
reg [17:0] X15;
reg [17:0] X16;
reg [17:0] X17;
reg [17:0] X18;
reg [17:0] X19;
reg [17:0] X20;
reg [17:0] X21;
reg [17:0] X22;
reg [17:0] X23;
reg [17:0] X24;
reg [17:0] X25;
reg [17:0] X26;
reg [17:0] X27;
reg [17:0] X28;
reg [17:0] X29;
reg [17:0] X30;
reg [17:0] X31;
shiftRegFIFO_2_1 shiftRegFIFO_2_1_inst (
	.X(next),
	.Y(next_out),
	.reset(reset),
	.clk(clk)
);
wire  [17:0] a65;
 		wire  [17:0] a66;
 		wire  [17:0] a67;
 		wire  [17:0] a68;
 		wire  [17:0] a73;
 		wire  [17:0] a74;
 		wire  [17:0] a75;
 		wire  [17:0] a76;
 		wire  [17:0] a81;
 		wire  [17:0] a82;
 		wire  [17:0] a83;
 		wire  [17:0] a84;
 		wire  [17:0] a89;
 		wire  [17:0] a90;
 		wire  [17:0] a91;
 		wire  [17:0] a92;
 		wire  [17:0] a97;
 		wire  [17:0] a98;
 		wire  [17:0] a99;
 		wire  [17:0] a100;
 		wire  [17:0] a105;
 		wire  [17:0] a106;
 		wire  [17:0] a107;
 		wire  [17:0] a108;
 		wire  [17:0] a113;
 		wire  [17:0] a114;
 		wire  [17:0] a115;
 		wire  [17:0] a116;
 		wire  [17:0] a121;
 		wire  [17:0] a122;
 		wire  [17:0] a123;
 		wire  [17:0] a124;
 		wire  [17:0] t402;
 		wire  [17:0] t403;
 		wire  [17:0] t404;
 		wire  [17:0] t405;
 		wire  [17:0] t406;
 		wire  [17:0] t407;
 		wire  [17:0] t408;
 		wire  [17:0] t409;
 		wire  [17:0] t418;
 		wire  [17:0] t419;
 		wire  [17:0] t420;
 		wire  [17:0] t421;
 		wire  [17:0] t422;
 		wire  [17:0] t423;
 		wire  [17:0] t424;
 		wire  [17:0] t425;
 		wire  [17:0] t434;
 		wire  [17:0] t435;
 		wire  [17:0] t436;
 		wire  [17:0] t437;
 		wire  [17:0] t438;
 		wire  [17:0] t439;
 		wire  [17:0] t440;
 		wire  [17:0] t441;
 		wire  [17:0] t450;
 		wire  [17:0] t451;
 		wire  [17:0] t452;
 		wire  [17:0] t453;
 		wire  [17:0] t454;
 		wire  [17:0] t455;
 		wire  [17:0] t456;
 		wire  [17:0] t457;
 		wire  [17:0] t410;
 		wire  [17:0] t411;
 		wire  [17:0] t412;
 		wire  [17:0] t413;
 		wire  [17:0] t414;
 		wire  [17:0] t415;
 		wire  [17:0] t416;
 		wire  [17:0] t417;
 		wire  [17:0] t426;
 		wire  [17:0] t427;
 		wire  [17:0] t428;
 		wire  [17:0] t429;
 		wire  [17:0] t430;
 		wire  [17:0] t431;
 		wire  [17:0] t432;
 		wire  [17:0] t433;
 		wire  [17:0] t442;
 		wire  [17:0] t443;
 		wire  [17:0] t444;
 		wire  [17:0] t445;
 		wire  [17:0] t446;
 		wire  [17:0] t447;
 		wire  [17:0] t448;
 		wire  [17:0] t449;
 		wire  [17:0] t458;
 		wire  [17:0] t459;
 		wire  [17:0] t460;
 		wire  [17:0] t461;
 		wire  [17:0] t462;
 		wire  [17:0] t463;
 		wire  [17:0] t464;
 		wire  [17:0] t465;

assign a65 = X0;
 		assign a66 = X16;
 		assign a67 = X1;
 		assign a68 = X17;
 		assign a73 = X8;
 		assign a74 = X24;
 		assign a75 = X9;
 		assign a76 = X25;
 		assign a81 = X2;
 		assign a82 = X18;
 		assign a83 = X3;
 		assign a84 = X19;
 		assign a89 = X10;
 		assign a90 = X26;
 		assign a91 = X11;
 		assign a92 = X27;
 		assign a97 = X4;
 		assign a98 = X20;
 		assign a99 = X5;
 		assign a100 = X21;
 		assign a105 = X12;
 		assign a106 = X28;
 		assign a107 = X13;
 		assign a108 = X29;
 		assign a113 = X6;
 		assign a114 = X22;
 		assign a115 = X7;
 		assign a116 = X23;
 		assign a121 = X14;
 		assign a122 = X30;
 		assign a123 = X15;
 		assign a124 = X31;
 		assign Y0 = t410;
 		assign Y1 = t411;
 		assign Y16 = t412;
 		assign Y17 = t413;
 		assign Y8 = t414;
 		assign Y9 = t415;
 		assign Y24 = t416;
 		assign Y25 = t417;
 		assign Y2 = t426;
 		assign Y3 = t427;
 		assign Y18 = t428;
 		assign Y19 = t429;
 		assign Y10 = t430;
 		assign Y11 = t431;
 		assign Y26 = t432;
 		assign Y27 = t433;
 		assign Y4 = t442;
 		assign Y5 = t443;
 		assign Y20 = t444;
 		assign Y21 = t445;
 		assign Y12 = t446;
 		assign Y13 = t447;
 		assign Y28 = t448;
 		assign Y29 = t449;
 		assign Y6 = t458;
 		assign Y7 = t459;
 		assign Y22 = t460;
 		assign Y23 = t461;
 		assign Y14 = t462;
 		assign Y15 = t463;
 		assign Y30 = t464;
 		assign Y31 = t465;

addfxp_18_1 add99180(.a(a65), .b(a66), .clk(clk), .q(t402));
 		addfxp_18_1 add99195(.a(a67), .b(a68), .clk(clk), .q(t403));
 		subfxp_18_1 sub99210(.a(a65), .b(a66), .clk(clk), .q(t404));
 		subfxp_18_1 sub99225(.a(a67), .b(a68), .clk(clk), .q(t405));
 		addfxp_18_1 add99240(.a(a73), .b(a74), .clk(clk), .q(t406));
 		addfxp_18_1 add99255(.a(a75), .b(a76), .clk(clk), .q(t407));
 		subfxp_18_1 sub99270(.a(a73), .b(a74), .clk(clk), .q(t408));
 		subfxp_18_1 sub99285(.a(a75), .b(a76), .clk(clk), .q(t409));
 		addfxp_18_1 add99388(.a(a81), .b(a82), .clk(clk), .q(t418));
 		addfxp_18_1 add99403(.a(a83), .b(a84), .clk(clk), .q(t419));
 		subfxp_18_1 sub99418(.a(a81), .b(a82), .clk(clk), .q(t420));
 		subfxp_18_1 sub99433(.a(a83), .b(a84), .clk(clk), .q(t421));
 		addfxp_18_1 add99448(.a(a89), .b(a90), .clk(clk), .q(t422));
 		addfxp_18_1 add99463(.a(a91), .b(a92), .clk(clk), .q(t423));
 		subfxp_18_1 sub99478(.a(a89), .b(a90), .clk(clk), .q(t424));
 		subfxp_18_1 sub99493(.a(a91), .b(a92), .clk(clk), .q(t425));
 		addfxp_18_1 add99596(.a(a97), .b(a98), .clk(clk), .q(t434));
 		addfxp_18_1 add99611(.a(a99), .b(a100), .clk(clk), .q(t435));
 		subfxp_18_1 sub99626(.a(a97), .b(a98), .clk(clk), .q(t436));
 		subfxp_18_1 sub99641(.a(a99), .b(a100), .clk(clk), .q(t437));
 		addfxp_18_1 add99656(.a(a105), .b(a106), .clk(clk), .q(t438));
 		addfxp_18_1 add99671(.a(a107), .b(a108), .clk(clk), .q(t439));
 		subfxp_18_1 sub99686(.a(a105), .b(a106), .clk(clk), .q(t440));
 		subfxp_18_1 sub99701(.a(a107), .b(a108), .clk(clk), .q(t441));
 		addfxp_18_1 add99804(.a(a113), .b(a114), .clk(clk), .q(t450));
 		addfxp_18_1 add99819(.a(a115), .b(a116), .clk(clk), .q(t451));
 		subfxp_18_1 sub99834(.a(a113), .b(a114), .clk(clk), .q(t452));
 		subfxp_18_1 sub99849(.a(a115), .b(a116), .clk(clk), .q(t453));
 		addfxp_18_1 add99864(.a(a121), .b(a122), .clk(clk), .q(t454));
 		addfxp_18_1 add99879(.a(a123), .b(a124), .clk(clk), .q(t455));
 		subfxp_18_1 sub99894(.a(a121), .b(a122), .clk(clk), .q(t456));
 		subfxp_18_1 sub99909(.a(a123), .b(a124), .clk(clk), .q(t457));
 		addfxp_18_1 add99292(.a(t402), .b(t406), .clk(clk), .q(t410));
 		addfxp_18_1 add99299(.a(t403), .b(t407), .clk(clk), .q(t411));
 		subfxp_18_1 sub99306(.a(t402), .b(t406), .clk(clk), .q(t412));
 		subfxp_18_1 sub99313(.a(t403), .b(t407), .clk(clk), .q(t413));
 		subfxp_18_1 sub99336(.a(t404), .b(t409), .clk(clk), .q(t414));
 		addfxp_18_1 add99343(.a(t405), .b(t408), .clk(clk), .q(t415));
 		addfxp_18_1 add99350(.a(t404), .b(t409), .clk(clk), .q(t416));
 		subfxp_18_1 sub99357(.a(t405), .b(t408), .clk(clk), .q(t417));
 		addfxp_18_1 add99500(.a(t418), .b(t422), .clk(clk), .q(t426));
 		addfxp_18_1 add99507(.a(t419), .b(t423), .clk(clk), .q(t427));
 		subfxp_18_1 sub99514(.a(t418), .b(t422), .clk(clk), .q(t428));
 		subfxp_18_1 sub99521(.a(t419), .b(t423), .clk(clk), .q(t429));
 		subfxp_18_1 sub99544(.a(t420), .b(t425), .clk(clk), .q(t430));
 		addfxp_18_1 add99551(.a(t421), .b(t424), .clk(clk), .q(t431));
 		addfxp_18_1 add99558(.a(t420), .b(t425), .clk(clk), .q(t432));
 		subfxp_18_1 sub99565(.a(t421), .b(t424), .clk(clk), .q(t433));
 		addfxp_18_1 add99708(.a(t434), .b(t438), .clk(clk), .q(t442));
 		addfxp_18_1 add99715(.a(t435), .b(t439), .clk(clk), .q(t443));
 		subfxp_18_1 sub99722(.a(t434), .b(t438), .clk(clk), .q(t444));
 		subfxp_18_1 sub99729(.a(t435), .b(t439), .clk(clk), .q(t445));
 		subfxp_18_1 sub99752(.a(t436), .b(t441), .clk(clk), .q(t446));
 		addfxp_18_1 add99759(.a(t437), .b(t440), .clk(clk), .q(t447));
 		addfxp_18_1 add99766(.a(t436), .b(t441), .clk(clk), .q(t448));
 		subfxp_18_1 sub99773(.a(t437), .b(t440), .clk(clk), .q(t449));
 		addfxp_18_1 add99916(.a(t450), .b(t454), .clk(clk), .q(t458));
 		addfxp_18_1 add99923(.a(t451), .b(t455), .clk(clk), .q(t459));
 		subfxp_18_1 sub99930(.a(t450), .b(t454), .clk(clk), .q(t460));
 		subfxp_18_1 sub99937(.a(t451), .b(t455), .clk(clk), .q(t461));
 		subfxp_18_1 sub99960(.a(t452), .b(t457), .clk(clk), .q(t462));
 		addfxp_18_1 add99967(.a(t453), .b(t456), .clk(clk), .q(t463));
 		addfxp_18_1 add99974(.a(t452), .b(t457), .clk(clk), .q(t464));
 		subfxp_18_1 sub99981(.a(t453), .b(t456), .clk(clk), .q(t465));

always @(posedge clk) begin
	if (reset == 1) begin
		next <= 1'b0;
	end else begin
		X0 <= X0_in;
		X1 <= X1_in;
		X2 <= X2_in;
		X3 <= X3_in;
		X4 <= X4_in;
		X5 <= X5_in;
		X6 <= X6_in;
		X7 <= X7_in;
		X8 <= X8_in;
		X9 <= X9_in;
		X10 <= X10_in;
		X11 <= X11_in;
		X12 <= X12_in;
		X13 <= X13_in;
		X14 <= X14_in;
		X15 <= X15_in;
		X16 <= X16_in;
		X17 <= X17_in;
		X18 <= X18_in;
		X19 <= X19_in;
		X20 <= X20_in;
		X21 <= X21_in;
		X22 <= X22_in;
		X23 <= X23_in;
		X24 <= X24_in;
		X25 <= X25_in;
		X26 <= X26_in;
		X27 <= X27_in;
		X28 <= X28_in;
		X29 <= X29_in;
		X30 <= X30_in;
		X31 <= X31_in;
		next <= next_in;
	end
end

endmodule
module codeBlock98050_18 (
	input clk,
	input reset,
	input next_in,
	input [17:0] X0_in,
	output [17:0] Y0,
	input [17:0] X1_in,
	output [17:0] Y1,
	input [17:0] X2_in,
	output [17:0] Y2,
	input [17:0] X3_in,
	output [17:0] Y3,
	input [17:0] X4_in,
	output [17:0] Y4,
	input [17:0] X5_in,
	output [17:0] Y5,
	input [17:0] X6_in,
	output [17:0] Y6,
	input [17:0] X7_in,
	output [17:0] Y7,
	input [17:0] X8_in,
	output [17:0] Y8,
	input [17:0] X9_in,
	output [17:0] Y9,
	input [17:0] X10_in,
	output [17:0] Y10,
	input [17:0] X11_in,
	output [17:0] Y11,
	input [17:0] X12_in,
	output [17:0] Y12,
	input [17:0] X13_in,
	output [17:0] Y13,
	input [17:0] X14_in,
	output [17:0] Y14,
	input [17:0] X15_in,
	output [17:0] Y15,
	input [17:0] X16_in,
	output [17:0] Y16,
	input [17:0] X17_in,
	output [17:0] Y17,
	input [17:0] X18_in,
	output [17:0] Y18,
	input [17:0] X19_in,
	output [17:0] Y19,
	input [17:0] X20_in,
	output [17:0] Y20,
	input [17:0] X21_in,
	output [17:0] Y21,
	input [17:0] X22_in,
	output [17:0] Y22,
	input [17:0] X23_in,
	output [17:0] Y23,
	input [17:0] X24_in,
	output [17:0] Y24,
	input [17:0] X25_in,
	output [17:0] Y25,
	input [17:0] X26_in,
	output [17:0] Y26,
	input [17:0] X27_in,
	output [17:0] Y27,
	input [17:0] X28_in,
	output [17:0] Y28,
	input [17:0] X29_in,
	output [17:0] Y29,
	input [17:0] X30_in,
	output [17:0] Y30,
	input [17:0] X31_in,
	output [17:0] Y31,
	output next_out
);

reg next;
reg [17:0] X0;
reg [17:0] X1;
reg [17:0] X2;
reg [17:0] X3;
reg [17:0] X4;
reg [17:0] X5;
reg [17:0] X6;
reg [17:0] X7;
reg [17:0] X8;
reg [17:0] X9;
reg [17:0] X10;
reg [17:0] X11;
reg [17:0] X12;
reg [17:0] X13;
reg [17:0] X14;
reg [17:0] X15;
reg [17:0] X16;
reg [17:0] X17;
reg [17:0] X18;
reg [17:0] X19;
reg [17:0] X20;
reg [17:0] X21;
reg [17:0] X22;
reg [17:0] X23;
reg [17:0] X24;
reg [17:0] X25;
reg [17:0] X26;
reg [17:0] X27;
reg [17:0] X28;
reg [17:0] X29;
reg [17:0] X30;
reg [17:0] X31;
shiftRegFIFO_5_1 shiftRegFIFO_5_1_inst (
	.X(next),
	.Y(next_out),
	.reset(reset),
	.clk(clk)
);
wire  [17:0] a249;
 		wire  [17:0] a250;
 		wire  [17:0] a251;
 		wire  [17:0] a252;
 		wire  [17:0] a257;
 		wire  [17:0] a258;
 		wire  [17:0] a259;
 		wire  [17:0] a260;
 		wire  [17:0] a265;
 		wire  [17:0] a266;
 		wire  [17:0] a267;
 		wire  [17:0] a268;
 		wire  [17:0] a273;
 		wire  [17:0] a274;
 		wire  [17:0] a275;
 		wire  [17:0] a276;
 		wire  [17:0] a281;
 		wire  [17:0] a282;
 		wire  [17:0] a283;
 		wire  [17:0] a284;
 		wire  [17:0] a289;
 		wire  [17:0] a290;
 		wire  [17:0] a291;
 		wire  [17:0] a292;
 		wire  [17:0] a297;
 		wire  [17:0] a298;
 		wire  [17:0] a299;
 		wire  [17:0] a300;
 		wire  [17:0] a305;
 		wire  [17:0] a306;
 		wire  [17:0] a307;
 		wire  [17:0] a308;
 		wire  [17:0] t914;
 		wire  [17:0] t915;
 		wire  [17:0] t916;
 		wire  [17:0] t917;
 		wire  [17:0] t918;
 		wire  [17:0] t919;
 		wire  [17:0] t920;
 		wire  [17:0] t921;
 		wire  [17:0] t930;
 		wire  [17:0] t931;
 		wire  [17:0] t932;
 		wire  [17:0] t933;
 		wire  [17:0] t934;
 		wire  [17:0] t935;
 		wire  [17:0] t936;
 		wire  [17:0] t937;
 		wire  [17:0] t952;
 		wire  [17:0] t953;
 		wire  [17:0] t954;
 		wire  [17:0] t955;
 		wire  [17:0] t956;
 		wire  [17:0] t957;
 		wire  [17:0] t958;
 		wire  [17:0] t959;
 		wire  [17:0] t972;
 		wire  [17:0] t973;
 		wire  [17:0] t974;
 		wire  [17:0] t975;
 		wire  [17:0] t976;
 		wire  [17:0] t977;
 		wire  [17:0] t978;
 		wire  [17:0] t979;
 		wire  [17:0] t922;
 		wire  [17:0] t923;
 		wire  [17:0] t924;
 		wire  [17:0] t925;
 		wire  [17:0] t926;
 		wire  [17:0] t927;
 		wire  [17:0] t928;
 		wire  [17:0] t929;
 		wire  [17:0] t938;
 		wire  [17:0] t939;
 		wire  [17:0] t940;
 		wire  [17:0] t941;
 		wire  [17:0] t944;
 		wire  [17:0] t945;
 		wire  [17:0] t946;
 		wire  [17:0] t947;
 		wire  [17:0] t960;
 		wire  [17:0] t961;
 		wire  [17:0] t962;
 		wire  [17:0] t963;
 		wire  [17:0] t964;
 		wire  [17:0] t965;
 		wire  [17:0] t966;
 		wire  [17:0] t967;
 		wire  [17:0] t980;
 		wire  [17:0] t981;
 		wire  [17:0] t982;
 		wire  [17:0] t983;
 		wire  [17:0] t986;
 		wire  [17:0] t987;
 		wire  [17:0] t988;
 		wire  [17:0] t989;
 		reg  [17:0] tm24;
 		reg  [17:0] tm27;
 		reg  [17:0] tm30;
 		reg  [17:0] tm33;
 		reg  [17:0] tm36;
 		reg  [17:0] tm39;
 		reg  [17:0] tm42;
 		reg  [17:0] tm45;
 		reg  [17:0] tm48;
 		reg  [17:0] tm51;
 		reg  [17:0] tm54;
 		reg  [17:0] tm57;
 		reg  [17:0] tm60;
 		reg  [17:0] tm63;
 		reg  [17:0] tm66;
 		reg  [17:0] tm69;
 		wire  [17:0] a225;
 		wire  [17:0] a226;
 		wire  [17:0] a227;
 		wire  [17:0] a228;
 		wire  [17:0] a229;
 		wire  [17:0] a230;
 		wire  [17:0] a231;
 		wire  [17:0] a232;
 		wire  [17:0] a233;
 		wire  [17:0] a234;
 		wire  [17:0] a235;
 		wire  [17:0] a236;
 		wire  [17:0] a237;
 		wire  [17:0] a238;
 		wire  [17:0] a239;
 		wire  [17:0] a240;
 		wire  [17:0] a241;
 		wire  [17:0] a242;
 		wire  [17:0] a243;
 		wire  [17:0] a244;
 		wire  [17:0] a245;
 		wire  [17:0] a246;
 		wire  [17:0] a247;
 		wire  [17:0] a248;
 		reg  [17:0] tm25;
 		reg  [17:0] tm28;
 		reg  [17:0] tm31;
 		reg  [17:0] tm34;
 		reg  [17:0] tm37;
 		reg  [17:0] tm40;
 		reg  [17:0] tm43;
 		reg  [17:0] tm46;
 		reg  [17:0] tm49;
 		reg  [17:0] tm52;
 		reg  [17:0] tm55;
 		reg  [17:0] tm58;
 		reg  [17:0] tm61;
 		reg  [17:0] tm64;
 		reg  [17:0] tm67;
 		reg  [17:0] tm70;
 		wire  [17:0] t942;
 		wire  [17:0] t943;
 		wire  [17:0] t948;
 		wire  [17:0] t949;
 		wire  [17:0] t950;
 		wire  [17:0] t951;
 		wire  [17:0] t968;
 		wire  [17:0] t969;
 		wire  [17:0] t970;
 		wire  [17:0] t971;
 		wire  [17:0] t984;
 		wire  [17:0] t985;
 		wire  [17:0] t990;
 		wire  [17:0] t991;
 		wire  [17:0] t992;
 		wire  [17:0] t993;
 		reg  [17:0] tm26;
 		reg  [17:0] tm29;
 		reg  [17:0] tm32;
 		reg  [17:0] tm35;
 		reg  [17:0] tm38;
 		reg  [17:0] tm41;
 		reg  [17:0] tm44;
 		reg  [17:0] tm47;
 		reg  [17:0] tm50;
 		reg  [17:0] tm53;
 		reg  [17:0] tm56;
 		reg  [17:0] tm59;
 		reg  [17:0] tm62;
 		reg  [17:0] tm65;
 		reg  [17:0] tm68;
 		reg  [17:0] tm71;

wire  [17:0] tm0;
assign tm0 = (18'hb505 >> (18-18));
wire  [17:0] tm2;
assign tm2 = (18'hec83 >> (18-18));
wire  [17:0] tm3;
assign tm3 = (18'h61f8 >> (18-18));

assign a249 = X0;
 		assign a250 = X16;
 		assign a251 = X1;
 		assign a252 = X17;
 		assign a257 = X8;
 		assign a258 = X24;
 		assign a259 = X9;
 		assign a260 = X25;
 		assign a265 = X2;
 		assign a266 = X18;
 		assign a267 = X3;
 		assign a268 = X19;
 		assign a273 = X10;
 		assign a274 = X26;
 		assign a275 = X11;
 		assign a276 = X27;
 		assign a281 = X4;
 		assign a282 = X20;
 		assign a283 = X5;
 		assign a284 = X21;
 		assign a289 = X12;
 		assign a290 = X28;
 		assign a291 = X13;
 		assign a292 = X29;
 		assign a297 = X6;
 		assign a298 = X22;
 		assign a299 = X7;
 		assign a300 = X23;
 		assign a305 = X14;
 		assign a306 = X30;
 		assign a307 = X15;
 		assign a308 = X31;
 		assign Y0 = tm26;
 		assign Y1 = tm29;
 		assign Y4 = tm32;
 		assign Y5 = tm35;
 		assign Y2 = tm38;
 		assign Y3 = tm41;
 		assign Y6 = tm44;
 		assign Y7 = tm47;
 		assign Y8 = tm50;
 		assign Y9 = tm53;
 		assign Y12 = t942;
 		assign Y13 = t943;
 		assign Y10 = t948;
 		assign Y11 = t949;
 		assign Y14 = t950;
 		assign Y15 = t951;
 		assign Y16 = tm56;
 		assign Y17 = tm59;
 		assign Y20 = tm62;
 		assign Y21 = tm65;
 		assign Y18 = t968;
 		assign Y19 = t969;
 		assign Y22 = (~(t970)+1);
 		assign Y23 = t971;
 		assign Y24 = tm68;
 		assign Y25 = tm71;
 		assign Y28 = (~(t984)+1);
 		assign Y29 = t985;
 		assign Y26 = t990;
 		assign Y27 = t991;
 		assign Y30 = t992;
 		assign Y31 = (~(t993)+1);

addfxp_18_1 add98062(.a(a249), .b(a250), .clk(clk), .q(t914));
 		addfxp_18_1 add98077(.a(a251), .b(a252), .clk(clk), .q(t915));
 		subfxp_18_1 sub98092(.a(a249), .b(a250), .clk(clk), .q(t916));
 		subfxp_18_1 sub98107(.a(a251), .b(a252), .clk(clk), .q(t917));
 		addfxp_18_1 add98122(.a(a257), .b(a258), .clk(clk), .q(t918));
 		addfxp_18_1 add98137(.a(a259), .b(a260), .clk(clk), .q(t919));
 		subfxp_18_1 sub98152(.a(a257), .b(a258), .clk(clk), .q(t920));
 		subfxp_18_1 sub98167(.a(a259), .b(a260), .clk(clk), .q(t921));
 		addfxp_18_1 add98270(.a(a265), .b(a266), .clk(clk), .q(t930));
 		addfxp_18_1 add98285(.a(a267), .b(a268), .clk(clk), .q(t931));
 		subfxp_18_1 sub98300(.a(a265), .b(a266), .clk(clk), .q(t932));
 		subfxp_18_1 sub98315(.a(a267), .b(a268), .clk(clk), .q(t933));
 		addfxp_18_1 add98330(.a(a273), .b(a274), .clk(clk), .q(t934));
 		addfxp_18_1 add98345(.a(a275), .b(a276), .clk(clk), .q(t935));
 		subfxp_18_1 sub98360(.a(a273), .b(a274), .clk(clk), .q(t936));
 		subfxp_18_1 sub98375(.a(a275), .b(a276), .clk(clk), .q(t937));
 		addfxp_18_1 add98590(.a(a281), .b(a282), .clk(clk), .q(t952));
 		addfxp_18_1 add98605(.a(a283), .b(a284), .clk(clk), .q(t953));
 		subfxp_18_1 sub98620(.a(a281), .b(a282), .clk(clk), .q(t954));
 		subfxp_18_1 sub98635(.a(a283), .b(a284), .clk(clk), .q(t955));
 		addfxp_18_1 add98650(.a(a289), .b(a290), .clk(clk), .q(t956));
 		addfxp_18_1 add98665(.a(a291), .b(a292), .clk(clk), .q(t957));
 		subfxp_18_1 sub98680(.a(a289), .b(a290), .clk(clk), .q(t958));
 		subfxp_18_1 sub98695(.a(a291), .b(a292), .clk(clk), .q(t959));
 		addfxp_18_1 add98856(.a(a297), .b(a298), .clk(clk), .q(t972));
 		addfxp_18_1 add98871(.a(a299), .b(a300), .clk(clk), .q(t973));
 		subfxp_18_1 sub98886(.a(a297), .b(a298), .clk(clk), .q(t974));
 		subfxp_18_1 sub98901(.a(a299), .b(a300), .clk(clk), .q(t975));
 		addfxp_18_1 add98916(.a(a305), .b(a306), .clk(clk), .q(t976));
 		addfxp_18_1 add98931(.a(a307), .b(a308), .clk(clk), .q(t977));
 		subfxp_18_1 sub98946(.a(a305), .b(a306), .clk(clk), .q(t978));
 		subfxp_18_1 sub98961(.a(a307), .b(a308), .clk(clk), .q(t979));
 		addfxp_18_1 add98174(.a(t914), .b(t918), .clk(clk), .q(t922));
 		addfxp_18_1 add98181(.a(t915), .b(t919), .clk(clk), .q(t923));
 		subfxp_18_1 sub98188(.a(t914), .b(t918), .clk(clk), .q(t924));
 		subfxp_18_1 sub98195(.a(t915), .b(t919), .clk(clk), .q(t925));
 		subfxp_18_1 sub98218(.a(t916), .b(t921), .clk(clk), .q(t926));
 		addfxp_18_1 add98225(.a(t917), .b(t920), .clk(clk), .q(t927));
 		addfxp_18_1 add98232(.a(t916), .b(t921), .clk(clk), .q(t928));
 		subfxp_18_1 sub98239(.a(t917), .b(t920), .clk(clk), .q(t929));
 		addfxp_18_1 add98382(.a(t930), .b(t934), .clk(clk), .q(t938));
 		addfxp_18_1 add98389(.a(t931), .b(t935), .clk(clk), .q(t939));
 		subfxp_18_1 sub98396(.a(t930), .b(t934), .clk(clk), .q(t940));
 		subfxp_18_1 sub98403(.a(t931), .b(t935), .clk(clk), .q(t941));
 		subfxp_18_1 sub98454(.a(t932), .b(t937), .clk(clk), .q(t944));
 		addfxp_18_1 add98461(.a(t933), .b(t936), .clk(clk), .q(t945));
 		addfxp_18_1 add98468(.a(t932), .b(t937), .clk(clk), .q(t946));
 		subfxp_18_1 sub98475(.a(t933), .b(t936), .clk(clk), .q(t947));
 		addfxp_18_1 add98702(.a(t952), .b(t956), .clk(clk), .q(t960));
 		addfxp_18_1 add98709(.a(t953), .b(t957), .clk(clk), .q(t961));
 		subfxp_18_1 sub98716(.a(t952), .b(t956), .clk(clk), .q(t962));
 		subfxp_18_1 sub98723(.a(t953), .b(t957), .clk(clk), .q(t963));
 		subfxp_18_1 sub98747(.a(t954), .b(t959), .clk(clk), .q(t964));
 		addfxp_18_1 add98754(.a(t955), .b(t958), .clk(clk), .q(t965));
 		addfxp_18_1 add98761(.a(t954), .b(t959), .clk(clk), .q(t966));
 		subfxp_18_1 sub98768(.a(t955), .b(t958), .clk(clk), .q(t967));
 		addfxp_18_1 add98968(.a(t972), .b(t976), .clk(clk), .q(t980));
 		addfxp_18_1 add98975(.a(t973), .b(t977), .clk(clk), .q(t981));
 		subfxp_18_1 sub98982(.a(t972), .b(t976), .clk(clk), .q(t982));
 		subfxp_18_1 sub98989(.a(t973), .b(t977), .clk(clk), .q(t983));
 		subfxp_18_1 sub99041(.a(t974), .b(t979), .clk(clk), .q(t986));
 		addfxp_18_1 add99048(.a(t975), .b(t978), .clk(clk), .q(t987));
 		addfxp_18_1 add99055(.a(t974), .b(t979), .clk(clk), .q(t988));
 		subfxp_18_1 sub99062(.a(t975), .b(t978), .clk(clk), .q(t989));

multfix_alt_dsp_18 m88566(.ax(tm0), .ay(t940), .bx(tm0), .by(t941), .clk(clk), .a_q_sc(a225), .a_q_unsc(), .b_q_sc(a226), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88570(.ax(tm2), .ay(t944), .bx(tm3), .by(t945), .clk(clk), .a_q_sc(a227), .a_q_unsc(), .b_q_sc(a228), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88572(.ax(tm3), .ay(t944), .bx(tm2), .by(t945), .clk(clk), .a_q_sc(a229), .a_q_unsc(), .b_q_sc(a230), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88574(.ax(tm3), .ay(t946), .bx(tm2), .by(t947), .clk(clk), .a_q_sc(a231), .a_q_unsc(), .b_q_sc(a232), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88576(.ax(tm2), .ay(t946), .bx(tm3), .by(t947), .clk(clk), .a_q_sc(a233), .a_q_unsc(), .b_q_sc(a234), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88578(.ax(tm0), .ay(t964), .bx(tm0), .by(t965), .clk(clk), .a_q_sc(a235), .a_q_unsc(), .b_q_sc(a236), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88580(.ax(tm0), .ay(t966), .bx(tm0), .by(t967), .clk(clk), .a_q_sc(a237), .a_q_unsc(), .b_q_sc(a238), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88582(.ax(tm0), .ay(t982), .bx(tm0), .by(t983), .clk(clk), .a_q_sc(a239), .a_q_unsc(), .b_q_sc(a240), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88584(.ax(tm3), .ay(t986), .bx(tm2), .by(t987), .clk(clk), .a_q_sc(a241), .a_q_unsc(), .b_q_sc(a242), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88586(.ax(tm2), .ay(t986), .bx(tm3), .by(t987), .clk(clk), .a_q_sc(a243), .a_q_unsc(), .b_q_sc(a244), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88588(.ax(tm3), .ay(t989), .bx(tm2), .by(t988), .clk(clk), .a_q_sc(a245), .a_q_unsc(), .b_q_sc(a246), .b_q_unsc(), .rst(reset));
 			multfix_alt_dsp_18 m88590(.ax(tm3), .ay(t988), .bx(tm2), .by(t989), .clk(clk), .a_q_sc(a247), .a_q_unsc(), .b_q_sc(a248), .b_q_unsc(), .rst(reset));

subfxp_18_1 sub98424(.a(a225), .b(a226), .clk(clk), .q(t942));
 		addfxp_18_1 add98431(.a(a225), .b(a226), .clk(clk), .q(t943));
 		subfxp_18_1 sub98496(.a(a227), .b(a228), .clk(clk), .q(t948));
 		addfxp_18_1 add98517(.a(a229), .b(a230), .clk(clk), .q(t949));
 		subfxp_18_1 sub98538(.a(a231), .b(a232), .clk(clk), .q(t950));
 		addfxp_18_1 add98559(.a(a233), .b(a234), .clk(clk), .q(t951));
 		subfxp_18_1 sub98789(.a(a235), .b(a236), .clk(clk), .q(t968));
 		addfxp_18_1 add98796(.a(a235), .b(a236), .clk(clk), .q(t969));
 		addfxp_18_1 add98817(.a(a237), .b(a238), .clk(clk), .q(t970));
 		subfxp_18_1 sub98824(.a(a237), .b(a238), .clk(clk), .q(t971));
 		addfxp_18_1 add99010(.a(a239), .b(a240), .clk(clk), .q(t984));
 		subfxp_18_1 sub99017(.a(a239), .b(a240), .clk(clk), .q(t985));
 		subfxp_18_1 sub99083(.a(a241), .b(a242), .clk(clk), .q(t990));
 		addfxp_18_1 add99104(.a(a243), .b(a244), .clk(clk), .q(t991));
 		subfxp_18_1 sub99125(.a(a245), .b(a246), .clk(clk), .q(t992));
 		addfxp_18_1 add99146(.a(a247), .b(a248), .clk(clk), .q(t993));

always @(posedge clk) begin
	if (reset == 1) begin
		next <= 1'b0;
	end else begin
		X0 <= X0_in;
		X1 <= X1_in;
		X2 <= X2_in;
		X3 <= X3_in;
		X4 <= X4_in;
		X5 <= X5_in;
		X6 <= X6_in;
		X7 <= X7_in;
		X8 <= X8_in;
		X9 <= X9_in;
		X10 <= X10_in;
		X11 <= X11_in;
		X12 <= X12_in;
		X13 <= X13_in;
		X14 <= X14_in;
		X15 <= X15_in;
		X16 <= X16_in;
		X17 <= X17_in;
		X18 <= X18_in;
		X19 <= X19_in;
		X20 <= X20_in;
		X21 <= X21_in;
		X22 <= X22_in;
		X23 <= X23_in;
		X24 <= X24_in;
		X25 <= X25_in;
		X26 <= X26_in;
		X27 <= X27_in;
		X28 <= X28_in;
		X29 <= X29_in;
		X30 <= X30_in;
		X31 <= X31_in;
		next <= next_in;
		tm24 <= t922;
		tm27 <= t923;
		tm30 <= t924;
		tm33 <= t925;
		tm36 <= t926;
		tm39 <= t927;
		tm42 <= t928;
		tm45 <= t929;
		tm48 <= t938;
		tm51 <= t939;
		tm54 <= t960;
		tm57 <= t961;
		tm60 <= (~(t963)+1);
		tm63 <= t962;
		tm66 <= t980;
		tm69 <= t981;
		tm25 <= tm24;
		tm28 <= tm27;
		tm31 <= tm30;
		tm34 <= tm33;
		tm37 <= tm36;
		tm40 <= tm39;
		tm43 <= tm42;
		tm46 <= tm45;
		tm49 <= tm48;
		tm52 <= tm51;
		tm55 <= tm54;
		tm58 <= tm57;
		tm61 <= tm60;
		tm64 <= tm63;
		tm67 <= tm66;
		tm70 <= tm69;
		tm26 <= tm25;
		tm29 <= tm28;
		tm32 <= tm31;
		tm35 <= tm34;
		tm38 <= tm37;
		tm41 <= tm40;
		tm44 <= tm43;
		tm47 <= tm46;
		tm50 <= tm49;
		tm53 <= tm52;
		tm56 <= tm55;
		tm59 <= tm58;
		tm62 <= tm61;
		tm65 <= tm64;
		tm68 <= tm67;
		tm71 <= tm70;
	end
end

endmodule

module shift_register_group_18_16_1 (
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

shift_register_unit_18_1 shift_register_unit_18_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_1 shift_register_unit_18_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

endmodule
module shift_register_unit_18_1 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
	end
end

assign out = shift_registers_0;

endmodule






















































