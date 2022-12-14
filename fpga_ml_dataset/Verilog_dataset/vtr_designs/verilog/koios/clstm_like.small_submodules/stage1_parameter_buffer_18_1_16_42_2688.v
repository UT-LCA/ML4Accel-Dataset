`define SIMULATION_MEMORY

module stage1_parameter_buffer_18_1_16_42_2688 (
	input clk,
	input reset,
	output [17:0] Wixr_real_0_0,
	output [17:0] Wixr_imag_0_0,
	output [17:0] Wfxr_real_0_0,
	output [17:0] Wfxr_imag_0_0,
	output [17:0] Woxr_real_0_0,
	output [17:0] Woxr_imag_0_0,
	output [17:0] Wcxr_real_0_0,
	output [17:0] Wcxr_imag_0_0,
	output [17:0] Wixr_real_0_1,
	output [17:0] Wixr_imag_0_1,
	output [17:0] Wfxr_real_0_1,
	output [17:0] Wfxr_imag_0_1,
	output [17:0] Woxr_real_0_1,
	output [17:0] Woxr_imag_0_1,
	output [17:0] Wcxr_real_0_1,
	output [17:0] Wcxr_imag_0_1,
	output [17:0] Wixr_real_0_2,
	output [17:0] Wixr_imag_0_2,
	output [17:0] Wfxr_real_0_2,
	output [17:0] Wfxr_imag_0_2,
	output [17:0] Woxr_real_0_2,
	output [17:0] Woxr_imag_0_2,
	output [17:0] Wcxr_real_0_2,
	output [17:0] Wcxr_imag_0_2,
	output [17:0] Wixr_real_0_3,
	output [17:0] Wixr_imag_0_3,
	output [17:0] Wfxr_real_0_3,
	output [17:0] Wfxr_imag_0_3,
	output [17:0] Woxr_real_0_3,
	output [17:0] Woxr_imag_0_3,
	output [17:0] Wcxr_real_0_3,
	output [17:0] Wcxr_imag_0_3,
	output [17:0] Wixr_real_0_4,
	output [17:0] Wixr_imag_0_4,
	output [17:0] Wfxr_real_0_4,
	output [17:0] Wfxr_imag_0_4,
	output [17:0] Woxr_real_0_4,
	output [17:0] Woxr_imag_0_4,
	output [17:0] Wcxr_real_0_4,
	output [17:0] Wcxr_imag_0_4,
	output [17:0] Wixr_real_0_5,
	output [17:0] Wixr_imag_0_5,
	output [17:0] Wfxr_real_0_5,
	output [17:0] Wfxr_imag_0_5,
	output [17:0] Woxr_real_0_5,
	output [17:0] Woxr_imag_0_5,
	output [17:0] Wcxr_real_0_5,
	output [17:0] Wcxr_imag_0_5,
	output [17:0] Wixr_real_0_6,
	output [17:0] Wixr_imag_0_6,
	output [17:0] Wfxr_real_0_6,
	output [17:0] Wfxr_imag_0_6,
	output [17:0] Woxr_real_0_6,
	output [17:0] Woxr_imag_0_6,
	output [17:0] Wcxr_real_0_6,
	output [17:0] Wcxr_imag_0_6,
	output [17:0] Wixr_real_0_7,
	output [17:0] Wixr_imag_0_7,
	output [17:0] Wfxr_real_0_7,
	output [17:0] Wfxr_imag_0_7,
	output [17:0] Woxr_real_0_7,
	output [17:0] Woxr_imag_0_7,
	output [17:0] Wcxr_real_0_7,
	output [17:0] Wcxr_imag_0_7,
	output [17:0] Wixr_real_0_8,
	output [17:0] Wixr_imag_0_8,
	output [17:0] Wfxr_real_0_8,
	output [17:0] Wfxr_imag_0_8,
	output [17:0] Woxr_real_0_8,
	output [17:0] Woxr_imag_0_8,
	output [17:0] Wcxr_real_0_8,
	output [17:0] Wcxr_imag_0_8,
	input incr_index
);

// A counter that counts how many sub blocks we have processed
wire [13:0] input_index_counter;
counter_41_1 counter_41_1_inst (
	.clk(clk),
	.reset(reset),
	.ena(incr_index),
	.count(input_index_counter)
);

wire incr_row_index;
assign incr_row_index = (input_index_counter == 41);
wire counter_enable_row_index;
assign counter_enable_row_index = (incr_row_index & incr_index);

// A counter that records which weight portion to use
wire [13:0] weight_row_index_counter;
counter_63_1 counter_63_1_inst (
	.clk(clk),
	.reset(reset),
	.ena(counter_enable_row_index),
	.count(weight_row_index_counter)
);

reg [13:0] weight_index;
always @ (*) begin
	weight_index = weight_row_index_counter * 42 + input_index_counter;
end

// Input Gate
weight_buffer_18_9_42_1_2688Wixr_real_half_0 Wixr_real_buffer (
	.clk(clk),
	.q_0_0(Wixr_real_0_0),
	.q_0_1(Wixr_real_0_1),
	.q_0_2(Wixr_real_0_2),
	.q_0_3(Wixr_real_0_3),
	.q_0_4(Wixr_real_0_4),
	.q_0_5(Wixr_real_0_5),
	.q_0_6(Wixr_real_0_6),
	.q_0_7(Wixr_real_0_7),
	.q_0_8(Wixr_real_0_8),
	.index(weight_index)
);

weight_buffer_18_9_42_1_2688Wixr_imag_half_0 Wixr_imag_buffer (
	.clk(clk),
	.q_0_0(Wixr_imag_0_0),
	.q_0_1(Wixr_imag_0_1),
	.q_0_2(Wixr_imag_0_2),
	.q_0_3(Wixr_imag_0_3),
	.q_0_4(Wixr_imag_0_4),
	.q_0_5(Wixr_imag_0_5),
	.q_0_6(Wixr_imag_0_6),
	.q_0_7(Wixr_imag_0_7),
	.q_0_8(Wixr_imag_0_8),
	.index(weight_index)
);

// Forget Gate
weight_buffer_18_9_42_1_2688Wfxr_real_half_0 Wfxr_real_buffer (
	.clk(clk),
	.q_0_0(Wfxr_real_0_0),
	.q_0_1(Wfxr_real_0_1),
	.q_0_2(Wfxr_real_0_2),
	.q_0_3(Wfxr_real_0_3),
	.q_0_4(Wfxr_real_0_4),
	.q_0_5(Wfxr_real_0_5),
	.q_0_6(Wfxr_real_0_6),
	.q_0_7(Wfxr_real_0_7),
	.q_0_8(Wfxr_real_0_8),
	.index(weight_index)
);

weight_buffer_18_9_42_1_2688Wfxr_imag_half_0 Wfxr_imag_buffer (
	.clk(clk),
	.q_0_0(Wfxr_imag_0_0),
	.q_0_1(Wfxr_imag_0_1),
	.q_0_2(Wfxr_imag_0_2),
	.q_0_3(Wfxr_imag_0_3),
	.q_0_4(Wfxr_imag_0_4),
	.q_0_5(Wfxr_imag_0_5),
	.q_0_6(Wfxr_imag_0_6),
	.q_0_7(Wfxr_imag_0_7),
	.q_0_8(Wfxr_imag_0_8),
	.index(weight_index)
);

// Output Gate
weight_buffer_18_9_42_1_2688Woxr_real_half_0 Woxr_real_buffer (
	.clk(clk),
	.q_0_0(Woxr_real_0_0),
	.q_0_1(Woxr_real_0_1),
	.q_0_2(Woxr_real_0_2),
	.q_0_3(Woxr_real_0_3),
	.q_0_4(Woxr_real_0_4),
	.q_0_5(Woxr_real_0_5),
	.q_0_6(Woxr_real_0_6),
	.q_0_7(Woxr_real_0_7),
	.q_0_8(Woxr_real_0_8),
	.index(weight_index)
);

weight_buffer_18_9_42_1_2688Woxr_imag_half_0 Woxr_imag_buffer (
	.clk(clk),
	.q_0_0(Woxr_imag_0_0),
	.q_0_1(Woxr_imag_0_1),
	.q_0_2(Woxr_imag_0_2),
	.q_0_3(Woxr_imag_0_3),
	.q_0_4(Woxr_imag_0_4),
	.q_0_5(Woxr_imag_0_5),
	.q_0_6(Woxr_imag_0_6),
	.q_0_7(Woxr_imag_0_7),
	.q_0_8(Woxr_imag_0_8),
	.index(weight_index)
);

// Output Activation Gate
weight_buffer_18_9_42_1_2688Wcxr_real_half_0 Wcxr_real_buffer (
	.clk(clk),
	.q_0_0(Wcxr_real_0_0),
	.q_0_1(Wcxr_real_0_1),
	.q_0_2(Wcxr_real_0_2),
	.q_0_3(Wcxr_real_0_3),
	.q_0_4(Wcxr_real_0_4),
	.q_0_5(Wcxr_real_0_5),
	.q_0_6(Wcxr_real_0_6),
	.q_0_7(Wcxr_real_0_7),
	.q_0_8(Wcxr_real_0_8),
	.index(weight_index)
);

weight_buffer_18_9_42_1_2688Wcxr_imag_half_0 Wcxr_imag_buffer (
	.clk(clk),
	.q_0_0(Wcxr_imag_0_0),
	.q_0_1(Wcxr_imag_0_1),
	.q_0_2(Wcxr_imag_0_2),
	.q_0_3(Wcxr_imag_0_3),
	.q_0_4(Wcxr_imag_0_4),
	.q_0_5(Wcxr_imag_0_5),
	.q_0_6(Wcxr_imag_0_6),
	.q_0_7(Wcxr_imag_0_7),
	.q_0_8(Wcxr_imag_0_8),
	.index(weight_index)
);

endmodule
module weight_buffer_18_9_42_1_2688Wcxr_imag_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Wcxr_real_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Woxr_imag_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;
`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif

single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Woxr_real_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Wfxr_imag_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Wfxr_real_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Wixr_imag_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule
module weight_buffer_18_9_42_1_2688Wixr_real_half_0 (
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
	input [11:0] index
);

wire [161:0] packed_result_0;
reg [11:0] addrs_0;
reg [11:0] addrs_base_0;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_0 <= index + addrs_base_0;
end

wire rom_we;
assign rom_we = 1'b0;

`ifdef SIMULATION_MEMORY
defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
`endif
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
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

endmodule

module counter_41_1 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 1) <= 41) begin
			count <= count + 1;
		end else begin
			count <= 14'd0;
		end
	end
end

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









