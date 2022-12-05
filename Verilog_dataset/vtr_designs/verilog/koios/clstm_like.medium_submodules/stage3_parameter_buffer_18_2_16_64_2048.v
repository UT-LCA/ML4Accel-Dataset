`define SIMULATION_MEMORY

module stage3_parameter_buffer_18_2_16_64_2048 (
	input clk,
	input reset,
	output [17:0] Wym_real_0_0,
	output [17:0] Wym_imag_0_0,
	output [17:0] Wym_real_0_1,
	output [17:0] Wym_imag_0_1,
	output [17:0] Wym_real_0_2,
	output [17:0] Wym_imag_0_2,
	output [17:0] Wym_real_0_3,
	output [17:0] Wym_imag_0_3,
	output [17:0] Wym_real_0_4,
	output [17:0] Wym_imag_0_4,
	output [17:0] Wym_real_0_5,
	output [17:0] Wym_imag_0_5,
	output [17:0] Wym_real_0_6,
	output [17:0] Wym_imag_0_6,
	output [17:0] Wym_real_0_7,
	output [17:0] Wym_imag_0_7,
	output [17:0] Wym_real_0_8,
	output [17:0] Wym_imag_0_8,
	output [17:0] Wym_real_1_0,
	output [17:0] Wym_imag_1_0,
	output [17:0] Wym_real_1_1,
	output [17:0] Wym_imag_1_1,
	output [17:0] Wym_real_1_2,
	output [17:0] Wym_imag_1_2,
	output [17:0] Wym_real_1_3,
	output [17:0] Wym_imag_1_3,
	output [17:0] Wym_real_1_4,
	output [17:0] Wym_imag_1_4,
	output [17:0] Wym_real_1_5,
	output [17:0] Wym_imag_1_5,
	output [17:0] Wym_real_1_6,
	output [17:0] Wym_imag_1_6,
	output [17:0] Wym_real_1_7,
	output [17:0] Wym_imag_1_7,
	output [17:0] Wym_real_1_8,
	output [17:0] Wym_imag_1_8,
	input incr_index
);

wire [13:0] input_index_counter;
counter_63_1 counter_63_1_inst_input (
	.clk(clk),
	.reset(reset),
	.ena(incr_index),
	.count(input_index_counter)
);

wire incr_row_index;
assign incr_row_index = (input_index_counter == 63 & incr_index);
wire [13:0] weight_row_index_counter;
counter_31_2 counter_31_2_inst_weight (
	.clk(clk),
	.reset(reset),
	.ena(incr_row_index),
	.count(weight_row_index_counter)
);

reg [13:0] weight_index;
always @ (*) begin
	weight_index = weight_row_index_counter * 64 + input_index_counter;
end
weight_buffer_18_9_2_64_2048_Wym_real_half_0 weight_buffer_18_9_2_64_2048_Wym_real_half_0_inst_real (
	.clk(clk),
	.q_0_0(Wym_real_0_0),
	.q_0_1(Wym_real_0_1),
	.q_0_2(Wym_real_0_2),
	.q_0_3(Wym_real_0_3),
	.q_0_4(Wym_real_0_4),
	.q_0_5(Wym_real_0_5),
	.q_0_6(Wym_real_0_6),
	.q_0_7(Wym_real_0_7),
	.q_0_8(Wym_real_0_8),
	.q_1_0(Wym_real_1_0),
	.q_1_1(Wym_real_1_1),
	.q_1_2(Wym_real_1_2),
	.q_1_3(Wym_real_1_3),
	.q_1_4(Wym_real_1_4),
	.q_1_5(Wym_real_1_5),
	.q_1_6(Wym_real_1_6),
	.q_1_7(Wym_real_1_7),
	.q_1_8(Wym_real_1_8),
	.index(weight_index)
);

weight_buffer_18_9_2_64_2048_Wym_imag_half_0 weight_buffer_18_9_2_64_2048_Wym_imag_half_0_inst_imag (
	.clk(clk),
	.q_0_0(Wym_imag_0_0),
	.q_0_1(Wym_imag_0_1),
	.q_0_2(Wym_imag_0_2),
	.q_0_3(Wym_imag_0_3),
	.q_0_4(Wym_imag_0_4),
	.q_0_5(Wym_imag_0_5),
	.q_0_6(Wym_imag_0_6),
	.q_0_7(Wym_imag_0_7),
	.q_0_8(Wym_imag_0_8),
	.q_1_0(Wym_imag_1_0),
	.q_1_1(Wym_imag_1_1),
	.q_1_2(Wym_imag_1_2),
	.q_1_3(Wym_imag_1_3),
	.q_1_4(Wym_imag_1_4),
	.q_1_5(Wym_imag_1_5),
	.q_1_6(Wym_imag_1_6),
	.q_1_7(Wym_imag_1_7),
	.q_1_8(Wym_imag_1_8),
	.index(weight_index)
);

endmodule
module weight_buffer_18_9_2_64_2048_Wym_imag_half_0 (
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
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	input [10:0] index
);

wire [161:0] packed_result_0;
reg [10:0] addrs_0;
reg [10:0] addrs_base_0;
wire [161:0] packed_result_1;
reg [10:0] addrs_1;
reg [10:0] addrs_base_1;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 64;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
end

wire rom_we;
assign rom_we = 1'b0;

defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
defparam ram_inst_1.DATA_WIDTH = 162;
defparam ram_inst_1.ADDR_WIDTH = 12;
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(162'd0),
	.out(packed_result_1),
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
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];

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
module weight_buffer_18_9_2_64_2048_Wym_real_half_0 (
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
	output [17:0] q_1_0,
	output [17:0] q_1_1,
	output [17:0] q_1_2,
	output [17:0] q_1_3,
	output [17:0] q_1_4,
	output [17:0] q_1_5,
	output [17:0] q_1_6,
	output [17:0] q_1_7,
	output [17:0] q_1_8,
	input [10:0] index
);

wire [161:0] packed_result_0;
reg [10:0] addrs_0;
reg [10:0] addrs_base_0;
wire [161:0] packed_result_1;
reg [10:0] addrs_1;
reg [10:0] addrs_base_1;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 64;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
end

wire rom_we;
assign rom_we = 1'b0;

defparam ram_inst_0.DATA_WIDTH = 162;
defparam ram_inst_0.ADDR_WIDTH = 12;
defparam ram_inst_1.DATA_WIDTH = 162;
defparam ram_inst_1.ADDR_WIDTH = 12;
single_port_ram ram_inst_0 (
	.we(rom_we),
	.addr(addrs_0),
	.data(162'd0),
	.out(packed_result_0),
	.clk(clk)
);

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(162'd0),
	.out(packed_result_1),
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
assign q_1_0 = packed_result_1[17:0];
assign q_1_1 = packed_result_1[35:18];
assign q_1_2 = packed_result_1[53:36];
assign q_1_3 = packed_result_1[71:54];
assign q_1_4 = packed_result_1[89:72];
assign q_1_5 = packed_result_1[107:90];
assign q_1_6 = packed_result_1[125:108];
assign q_1_7 = packed_result_1[143:126];
assign q_1_8 = packed_result_1[161:144];

endmodule
module counter_31_2 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 2) <= 31) begin
			count <= count + 2;
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
