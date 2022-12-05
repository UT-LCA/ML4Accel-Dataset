`define SIMULATION_MEMORY

module signal_width_reducer (
	input clk,
	input [15:0] signals_0_0,
	output reduced_signals_0_0,
	input [15:0] signals_0_1,
	output reduced_signals_0_1,
	input [15:0] signals_0_2,
	output reduced_signals_0_2,
	input [15:0] signals_0_3,
	output reduced_signals_0_3,
	input [15:0] signals_1_0,
	output reduced_signals_1_0,
	input [15:0] signals_1_1,
	output reduced_signals_1_1,
	input [15:0] signals_1_2,
	output reduced_signals_1_2,
	input [15:0] signals_1_3,
	output reduced_signals_1_3,
	input [15:0] signals_2_0,
	output reduced_signals_2_0,
	input [15:0] signals_2_1,
	output reduced_signals_2_1,
	input [15:0] signals_2_2,
	output reduced_signals_2_2,
	input [15:0] signals_2_3,
	output reduced_signals_2_3,
	input [15:0] signals_3_0,
	output reduced_signals_3_0,
	input [15:0] signals_3_1,
	output reduced_signals_3_1,
	input [15:0] signals_3_2,
	output reduced_signals_3_2,
	input [15:0] signals_3_3,
	output reduced_signals_3_3,
	input [15:0] signals_4_0,
	output reduced_signals_4_0,
	input [15:0] signals_4_1,
	output reduced_signals_4_1,
	input [15:0] signals_4_2,
	output reduced_signals_4_2,
	input [15:0] signals_4_3,
	output reduced_signals_4_3,
	input [15:0] signals_5_0,
	output reduced_signals_5_0,
	input [15:0] signals_5_1,
	output reduced_signals_5_1,
	input [15:0] signals_5_2,
	output reduced_signals_5_2,
	input [15:0] signals_5_3,
	output reduced_signals_5_3,
	input reset
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_0_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_0_0),
	.reduced_signal(reduced_signals_0_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_0_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_0_1),
	.reduced_signal(reduced_signals_0_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_0_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_0_2),
	.reduced_signal(reduced_signals_0_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_0_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_0_3),
	.reduced_signal(reduced_signals_0_3)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_1_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_1_0),
	.reduced_signal(reduced_signals_1_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_1_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_1_1),
	.reduced_signal(reduced_signals_1_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_1_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_1_2),
	.reduced_signal(reduced_signals_1_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_1_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_1_3),
	.reduced_signal(reduced_signals_1_3)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_2_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_2_0),
	.reduced_signal(reduced_signals_2_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_2_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_2_1),
	.reduced_signal(reduced_signals_2_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_2_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_2_2),
	.reduced_signal(reduced_signals_2_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_2_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_2_3),
	.reduced_signal(reduced_signals_2_3)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_3_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_3_0),
	.reduced_signal(reduced_signals_3_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_3_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_3_1),
	.reduced_signal(reduced_signals_3_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_3_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_3_2),
	.reduced_signal(reduced_signals_3_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_3_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_3_3),
	.reduced_signal(reduced_signals_3_3)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_4_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_4_0),
	.reduced_signal(reduced_signals_4_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_4_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_4_1),
	.reduced_signal(reduced_signals_4_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_4_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_4_2),
	.reduced_signal(reduced_signals_4_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_4_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_4_3),
	.reduced_signal(reduced_signals_4_3)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_5_0 (
	.clk(clk),
	.reset(reset),
	.signal(signals_5_0),
	.reduced_signal(reduced_signals_5_0)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_5_1 (
	.clk(clk),
	.reset(reset),
	.signal(signals_5_1),
	.reduced_signal(reduced_signals_5_1)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_5_2 (
	.clk(clk),
	.reset(reset),
	.signal(signals_5_2),
	.reduced_signal(reduced_signals_5_2)
);

pipelined_xor_tree_16 pipelined_xor_tree_16_inst_5_3 (
	.clk(clk),
	.reset(reset),
	.signal(signals_5_3),
	.reduced_signal(reduced_signals_5_3)
);

endmodule
module pipelined_xor_tree_16 (
	input clk,
	input reset,
	input [15:0] signal,
	output reduced_signal
);

reg pipeline_0_0;
reg pipeline_0_1;
reg pipeline_0_2;
reg pipeline_1_0;
reg pipeline_1_1;
reg pipeline_1_2;
reg pipeline_2_0;
reg pipeline_2_1;
reg pipeline_2_2;
reg pipeline_3_0;
reg pipeline_3_1;
reg pipeline_3_2;
reg pipeline_4_0;
reg pipeline_4_1;
reg pipeline_4_2;
reg pipeline_5_0;
reg pipeline_5_1;
reg pipeline_5_2;
reg pipeline_6_0;
reg pipeline_6_1;
reg pipeline_6_2;
reg pipeline_7_0;
reg pipeline_7_1;
reg pipeline_7_2;
reg pipeline_8_0;
reg pipeline_8_1;
reg pipeline_8_2;
reg pipeline_9_0;
reg pipeline_9_1;
reg pipeline_9_2;
reg pipeline_10_0;
reg pipeline_10_1;
reg pipeline_10_2;
reg pipeline_11_0;
reg pipeline_11_1;
reg pipeline_11_2;
reg pipeline_12_0;
reg pipeline_12_1;
reg pipeline_12_2;
reg pipeline_13_0;
reg pipeline_13_1;
reg pipeline_13_2;
reg pipeline_14_0;
reg pipeline_14_1;
reg pipeline_14_2;
reg pipeline_15_0;
reg pipeline_15_1;
reg pipeline_15_2;

always @ (posedge clk) begin
	if (reset) begin
		pipeline_0_0 <= 0;
		pipeline_0_1 <= 0;
		pipeline_0_2 <= 0;
		pipeline_1_0 <= 0;
		pipeline_1_1 <= 0;
		pipeline_1_2 <= 0;
		pipeline_2_0 <= 0;
		pipeline_2_1 <= 0;
		pipeline_2_2 <= 0;
		pipeline_3_0 <= 0;
		pipeline_3_1 <= 0;
		pipeline_3_2 <= 0;
		pipeline_4_0 <= 0;
		pipeline_4_1 <= 0;
		pipeline_4_2 <= 0;
		pipeline_5_0 <= 0;
		pipeline_5_1 <= 0;
		pipeline_5_2 <= 0;
		pipeline_6_0 <= 0;
		pipeline_6_1 <= 0;
		pipeline_6_2 <= 0;
		pipeline_7_0 <= 0;
		pipeline_7_1 <= 0;
		pipeline_7_2 <= 0;
		pipeline_8_0 <= 0;
		pipeline_8_1 <= 0;
		pipeline_8_2 <= 0;
		pipeline_9_0 <= 0;
		pipeline_9_1 <= 0;
		pipeline_9_2 <= 0;
		pipeline_10_0 <= 0;
		pipeline_10_1 <= 0;
		pipeline_10_2 <= 0;
		pipeline_11_0 <= 0;
		pipeline_11_1 <= 0;
		pipeline_11_2 <= 0;
		pipeline_12_0 <= 0;
		pipeline_12_1 <= 0;
		pipeline_12_2 <= 0;
		pipeline_13_0 <= 0;
		pipeline_13_1 <= 0;
		pipeline_13_2 <= 0;
		pipeline_14_0 <= 0;
		pipeline_14_1 <= 0;
		pipeline_14_2 <= 0;
		pipeline_15_0 <= 0;
		pipeline_15_1 <= 0;
		pipeline_15_2 <= 0;
	end else begin
		pipeline_0_0 <= signal[15];
		pipeline_1_0 <= signal[14];
		pipeline_2_0 <= signal[13];
		pipeline_3_0 <= signal[12];
		pipeline_4_0 <= signal[11];
		pipeline_5_0 <= signal[10];
		pipeline_6_0 <= signal[9];
		pipeline_7_0 <= signal[8];
		pipeline_8_0 <= signal[7];
		pipeline_9_0 <= signal[6];
		pipeline_10_0 <= signal[5];
		pipeline_11_0 <= signal[4];
		pipeline_12_0 <= signal[3];
		pipeline_13_0 <= signal[2];
		pipeline_14_0 <= signal[1];
		pipeline_15_0 <= signal[0];
		pipeline_0_1 <= pipeline_0_0 ^ pipeline_1_0^ pipeline_2_0 ^ pipeline_3_0;
		pipeline_4_1 <= pipeline_4_0 ^ pipeline_5_0^ pipeline_6_0 ^ pipeline_7_0;
		pipeline_8_1 <= pipeline_8_0 ^ pipeline_9_0^ pipeline_10_0 ^ pipeline_11_0;
		pipeline_12_1 <= pipeline_12_0 ^ pipeline_13_0^ pipeline_14_0 ^ pipeline_15_0;
		pipeline_0_2 <= pipeline_0_1 ^ pipeline_4_1^ pipeline_8_1 ^ pipeline_12_1;
	end
end

assign reduced_signal = pipeline_0_2;

endmodule
