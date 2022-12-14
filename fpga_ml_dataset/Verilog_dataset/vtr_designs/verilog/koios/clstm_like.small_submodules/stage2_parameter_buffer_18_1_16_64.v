`define SIMULATION_MEMORY

module stage2_parameter_buffer_18_1_16_64 (
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

wire [13:0] input_index_counter;
counter_63_1 counter_63_1_inst (
	.clk(clk),
	.reset(reset),
	.ena(incr_index),
	.count(input_index_counter)
);

weight_buffer_18_16_1_64_Wic_0 weight_buffer_18_16_1_64_Wic_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_bi_0 weight_buffer_18_16_1_64_bi_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_Wfc_0 weight_buffer_18_16_1_64_Wfc_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_bf_0 weight_buffer_18_16_1_64_bf_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_Woc_0 weight_buffer_18_16_1_64_Woc_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_bo_0 weight_buffer_18_16_1_64_bo_0_inst (
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
	.index(input_index_counter)
);

weight_buffer_18_16_1_64_bc_0 weight_buffer_18_16_1_64_bc_0_inst (
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

endmodule
module weight_buffer_18_16_1_64_bc_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_bo_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_Woc_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_bf_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_Wfc_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_bi_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule
module weight_buffer_18_16_1_64_Wic_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(288'd0),
	.out(packed_result_0),
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

endmodule

module counter_63_1 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 1) <= 63) begin
			count <= count + 1;
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






