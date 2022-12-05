`define SIMULATION_MEMORY

module stage2_mt_buffer_18_1_16_64_32 (
	input clk,
	input reset,
	input i_valid,
	input [17:0] data_0,
	output [17:0] q_0,
	input [17:0] data_1,
	output [17:0] q_1,
	input [17:0] data_2,
	output [17:0] q_2,
	input [17:0] data_3,
	output [17:0] q_3,
	input [17:0] data_4,
	output [17:0] q_4,
	input [17:0] data_5,
	output [17:0] q_5,
	input [17:0] data_6,
	output [17:0] q_6,
	input [17:0] data_7,
	output [17:0] q_7,
	input [17:0] data_8,
	output [17:0] q_8,
	input [17:0] data_9,
	output [17:0] q_9,
	input [17:0] data_10,
	output [17:0] q_10,
	input [17:0] data_11,
	output [17:0] q_11,
	input [17:0] data_12,
	output [17:0] q_12,
	input [17:0] data_13,
	output [17:0] q_13,
	input [17:0] data_14,
	output [17:0] q_14,
	input [17:0] data_15,
	output [17:0] q_15,
	output o_valid
);

wire [287:0] packed_result;
wire [287:0] packed_data;

wire [13:0] input_index_counter;
reg is_buffer_full;
counter_63_1 counter_63_1_inst_in (
	.clk(clk),
	.reset(reset),
	.ena(i_valid),
	.count(input_index_counter)
);

reg en_output_counter;
wire [13:0] output_index_counter;
counter_63_1 counter_63_1_inst_out_count (
	.clk(clk),
	.reset(reset),
	.ena(en_output_counter),
	.count(output_index_counter)
);

reg [5:0] raddr;
always @ (*) begin
	if (is_buffer_full)
		raddr <= output_index_counter;
	else
		raddr <= input_index_counter;
end

wire incr_loop_index;
assign incr_loop_index = (output_index_counter ==  (63) && en_output_counter);

reg is_output_enough;
wire [13:0] loop_counter;
counter_30_1 counter_30_1_inst_out_enough (
	.clk(clk),
	.reset(reset),
	.ena(incr_loop_index),
	.count(loop_counter)
);

ram_288_0_64 ram_288_0_64_inst (
	.clk(clk),
	.waddr(input_index_counter),
	.wdata(packed_data),
	.wen(i_valid),
	.raddr(raddr),
	.q(packed_result)
);

assign q_0 = packed_result[17:0];
assign packed_data[17:0] = data_0;
assign q_1 = packed_result[35:18];
assign packed_data[35:18] = data_1;
assign q_2 = packed_result[53:36];
assign packed_data[53:36] = data_2;
assign q_3 = packed_result[71:54];
assign packed_data[71:54] = data_3;
assign q_4 = packed_result[89:72];
assign packed_data[89:72] = data_4;
assign q_5 = packed_result[107:90];
assign packed_data[107:90] = data_5;
assign q_6 = packed_result[125:108];
assign packed_data[125:108] = data_6;
assign q_7 = packed_result[143:126];
assign packed_data[143:126] = data_7;
assign q_8 = packed_result[161:144];
assign packed_data[161:144] = data_8;
assign q_9 = packed_result[179:162];
assign packed_data[179:162] = data_9;
assign q_10 = packed_result[197:180];
assign packed_data[197:180] = data_10;
assign q_11 = packed_result[215:198];
assign packed_data[215:198] = data_11;
assign q_12 = packed_result[233:216];
assign packed_data[233:216] = data_12;
assign q_13 = packed_result[251:234];
assign packed_data[251:234] = data_13;
assign q_14 = packed_result[269:252];
assign packed_data[269:252] = data_14;
assign q_15 = packed_result[287:270];
assign packed_data[287:270] = data_15;

always @ (posedge clk) begin
	if (reset) begin
		en_output_counter <= 1'b0;
		is_buffer_full <= 1'b0;
		is_output_enough <= 1'b0;
	end else begin
		en_output_counter <= (is_buffer_full && ~en_output_counter && ~is_output_enough);
		if (input_index_counter == 63 && i_valid)
			is_buffer_full <= 1'b1;
		else if (input_index_counter == 0 && output_index_counter == 0 && is_output_enough)
			is_buffer_full <= 1'b0;
		if ((loop_counter == (30))
			&&(output_index_counter == 63)
			&& en_output_counter)
			is_output_enough <= 1'b1;
		else if (loop_counter == 0 && i_valid)
			is_output_enough <= 1'b0;
	end
end

wire valid_1, valid_2, is_buffer_full_hold;
shift_register_unit_12 shift_register_unit_12_inst_is_buffer_full (
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.in(is_buffer_full),
	.out(is_buffer_full_hold)
);

shift_register_unit_12 shift_register_unit_12_inst_valid1 (
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.in(i_valid),
	.out(valid_1)
);

shift_register_unit_12 shift_register_unit_12_inst_valid2 (
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.in(en_output_counter),
	.out(valid_2)
);

reg output_valid;
always @ (*) begin
	if (is_buffer_full_hold)
		output_valid <= valid_2;
	else
		output_valid <= valid_1;
end
assign o_valid = output_valid;

endmodule
module shift_register_unit_12 (
	input clk,
	input reset,
	input enable,
	input [0:0] in,
	output [0:0] out
);

reg [0:0] shift_registers_0;
reg [0:0] shift_registers_1;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 1'd0;
		shift_registers_1 <= 1'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
	end
end

assign out = shift_registers_1;

endmodule
module ram_288_0_64 (
	input clk,
	input [5:0] waddr,
	input [287:0] wdata,
	input wen,
	input [5:0] raddr,
	output [287:0] q
);

wire [287:0] rd_dummy_signal;
wire [287:0] wr_dummy_signal;
assign rd_dummy_signal = 0;

dual_port_ram u_dual_port_ram(
	.addr1(waddr),
	.we1(wen),
	.data1(wdata),
	.out1(wr_dummy_signal),
	.addr2(raddr),
	.we2(1'b0),
	.data2(rd_dummy_signal),
	.out2(q),
	.clk(clk)
);
endmodule
module counter_30_1 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 1) <= 30) begin
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

module dual_port_ram(
clk,
addr1,
addr2,
data1,
data2,
we1,
we2,
out1,
out2
);

parameter DATA_WIDTH = 288;
parameter ADDR_WIDTH = 6;
input clk;
input [ADDR_WIDTH-1:0] addr1;
input [ADDR_WIDTH-1:0] addr2;
input [DATA_WIDTH-1:0] data1;
input [DATA_WIDTH-1:0] data2;
input we1;
input we2;
output reg [DATA_WIDTH-1:0] out1;
output reg [DATA_WIDTH-1:0] out2;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we1) begin
    ram[addr1] <= data1;
  end
  else begin
    out1 <= ram[addr1];
  end
end

always @(posedge clk) begin
  if (we2) begin
    ram [addr2] <= data2;
  end
  else begin
    out2 <= ram[addr2];
  end
end

endmodule






