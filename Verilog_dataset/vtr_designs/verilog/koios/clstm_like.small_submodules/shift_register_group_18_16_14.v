`define SIMULATION_MEMORY

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
