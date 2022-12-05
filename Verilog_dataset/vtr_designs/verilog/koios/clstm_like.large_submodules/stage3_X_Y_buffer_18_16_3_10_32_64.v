`define SIMULATION_MEMORY

module stage3_X_Y_buffer_18_16_3_10_32_64 (
	input clk,
	input reset,
	input i_X_valid,
	input i_Y_valid,
	input feed_start,
	input [17:0] i_X_data_0,
	input [17:0] i_Y_data_0,
	output [17:0] o_data_0,
	input [17:0] i_X_data_1,
	input [17:0] i_Y_data_1,
	output [17:0] o_data_1,
	input [17:0] i_X_data_2,
	input [17:0] i_Y_data_2,
	output [17:0] o_data_2,
	input [17:0] i_X_data_3,
	input [17:0] i_Y_data_3,
	output [17:0] o_data_3,
	input [17:0] i_X_data_4,
	input [17:0] i_Y_data_4,
	output [17:0] o_data_4,
	input [17:0] i_X_data_5,
	input [17:0] i_Y_data_5,
	output [17:0] o_data_5,
	input [17:0] i_X_data_6,
	input [17:0] i_Y_data_6,
	output [17:0] o_data_6,
	input [17:0] i_X_data_7,
	input [17:0] i_Y_data_7,
	output [17:0] o_data_7,
	input [17:0] i_X_data_8,
	input [17:0] i_Y_data_8,
	output [17:0] o_data_8,
	input [17:0] i_X_data_9,
	input [17:0] i_Y_data_9,
	output [17:0] o_data_9,
	input [17:0] i_X_data_10,
	input [17:0] i_Y_data_10,
	output [17:0] o_data_10,
	input [17:0] i_X_data_11,
	input [17:0] i_Y_data_11,
	output [17:0] o_data_11,
	input [17:0] i_X_data_12,
	input [17:0] i_Y_data_12,
	output [17:0] o_data_12,
	input [17:0] i_X_data_13,
	input [17:0] i_Y_data_13,
	output [17:0] o_data_13,
	input [17:0] i_X_data_14,
	input [17:0] i_Y_data_14,
	output [17:0] o_data_14,
	input [17:0] i_X_data_15,
	input [17:0] i_Y_data_15,
	output [17:0] o_data_15,
	output o_valid,
	output o_ready
);

reg reg_feed_start;
reg [17:0] i_data_0;
reg [17:0] i_data_1;
reg [17:0] i_data_2;
reg [17:0] i_data_3;
reg [17:0] i_data_4;
reg [17:0] i_data_5;
reg [17:0] i_data_6;
reg [17:0] i_data_7;
reg [17:0] i_data_8;
reg [17:0] i_data_9;
reg [17:0] i_data_10;
reg [17:0] i_data_11;
reg [17:0] i_data_12;
reg [17:0] i_data_13;
reg [17:0] i_data_14;
reg [17:0] i_data_15;
wire [287:0] packed_o_data;
wire [287:0] packed_data;
reg wen;
wire ready_to_accept_new_X;
wire [13:0] input_index_counter;
assign ready_to_accept_new_X = (input_index_counter >= 32);
assign o_ready = ready_to_accept_new_X;
always @ (*) begin
	if(ready_to_accept_new_X) begin
		wen <= i_X_valid;
		i_data_0 <= i_X_data_0;
		i_data_1 <= i_X_data_1;
		i_data_2 <= i_X_data_2;
		i_data_3 <= i_X_data_3;
		i_data_4 <= i_X_data_4;
		i_data_5 <= i_X_data_5;
		i_data_6 <= i_X_data_6;
		i_data_7 <= i_X_data_7;
		i_data_8 <= i_X_data_8;
		i_data_9 <= i_X_data_9;
		i_data_10 <= i_X_data_10;
		i_data_11 <= i_X_data_11;
		i_data_12 <= i_X_data_12;
		i_data_13 <= i_X_data_13;
		i_data_14 <= i_X_data_14;
		i_data_15 <= i_X_data_15;
	end else begin
		wen <= i_Y_valid;
		i_data_0 <= i_Y_data_0;
		i_data_1 <= i_Y_data_1;
		i_data_2 <= i_Y_data_2;
		i_data_3 <= i_Y_data_3;
		i_data_4 <= i_Y_data_4;
		i_data_5 <= i_Y_data_5;
		i_data_6 <= i_Y_data_6;
		i_data_7 <= i_Y_data_7;
		i_data_8 <= i_Y_data_8;
		i_data_9 <= i_Y_data_9;
		i_data_10 <= i_Y_data_10;
		i_data_11 <= i_Y_data_11;
		i_data_12 <= i_Y_data_12;
		i_data_13 <= i_Y_data_13;
		i_data_14 <= i_Y_data_14;
		i_data_15 <= i_Y_data_15;
	end
end

assign o_data_0 = packed_o_data[17:0];
assign packed_data[17:0] = i_data_0;
assign o_data_1 = packed_o_data[35:18];
assign packed_data[35:18] = i_data_1;
assign o_data_2 = packed_o_data[53:36];
assign packed_data[53:36] = i_data_2;
assign o_data_3 = packed_o_data[71:54];
assign packed_data[71:54] = i_data_3;
assign o_data_4 = packed_o_data[89:72];
assign packed_data[89:72] = i_data_4;
assign o_data_5 = packed_o_data[107:90];
assign packed_data[107:90] = i_data_5;
assign o_data_6 = packed_o_data[125:108];
assign packed_data[125:108] = i_data_6;
assign o_data_7 = packed_o_data[143:126];
assign packed_data[143:126] = i_data_7;
assign o_data_8 = packed_o_data[161:144];
assign packed_data[161:144] = i_data_8;
assign o_data_9 = packed_o_data[179:162];
assign packed_data[179:162] = i_data_9;
assign o_data_10 = packed_o_data[197:180];
assign packed_data[197:180] = i_data_10;
assign o_data_11 = packed_o_data[215:198];
assign packed_data[215:198] = i_data_11;
assign o_data_12 = packed_o_data[233:216];
assign packed_data[233:216] = i_data_12;
assign o_data_13 = packed_o_data[251:234];
assign packed_data[251:234] = i_data_13;
assign o_data_14 = packed_o_data[269:252];
assign packed_data[269:252] = i_data_14;
assign o_data_15 = packed_o_data[287:270];
assign packed_data[287:270] = i_data_15;
counter_41_1_32 counter_41_1_32_inst (
	.clk(clk),
	.reset(reset),
	.ena(wen),
	.count(input_index_counter)
);

wire [13:0] output_index_counter;
reg en_output_counter;
counter_41_1 counter_41_1_inst (
	.clk(clk),
	.reset(reset),
	.ena(en_output_counter),
	.count(output_index_counter)
);

wire incr_loop_index;
assign incr_loop_index = (output_index_counter == 41 && en_output_counter);
reg output_finish;
wire [13:0] loop_counter;
counter_20_1 counter_20_1_inst_loop (
	.clk(clk),
	.reset(reset),
	.ena(incr_loop_index),
	.count(loop_counter)
);

ram_288_0_42 ram_288_0_42_inst (
	.clk(clk),
	.waddr(input_index_counter),
	.wdata(packed_data),
	.wen(wen),
	.raddr(output_index_counter),
	.q(packed_o_data)
);

shift_register_unit_1_2 shift_register_unit_1_2_inst (
	.clk(clk),
	.reset(reset),
	.enable(1'b1),
	.in(en_output_counter),
	.out(o_valid)
);

always @ (posedge clk) begin
	if (reset) begin
		en_output_counter <= 1'b0;
		output_finish <= 1'b0;
		reg_feed_start <= 1'b0;
	end else begin
		en_output_counter <= (reg_feed_start && ~en_output_counter && ~output_finish);
		if(feed_start)
			reg_feed_start <= 1'b1;
		else if (output_finish)
			reg_feed_start <= 1'b0;
		if ((loop_counter == 20)
			&&(output_index_counter == 41)
			&& en_output_counter)
			output_finish <= 1'b1;
		else if (loop_counter == 0 && wen)
			output_finish <= 1'b0;
	end
end

endmodule
module shift_register_unit_1_2 (
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
module ram_288_0_42 (
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
module counter_20_1 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 1) <= 20) begin
			count <= count + 1;
		end else begin
			count <= 14'd0;
		end
	end
end

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
module counter_41_1_32 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 32;
	end else if (ena) begin
		if((count + 1) <= 41) begin
			count <= count + 1;
		end else begin
			count <= 14'd0;
		end
	end
end

endmodule
