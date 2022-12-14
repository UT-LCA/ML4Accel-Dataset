`define SIMULATION_MEMORY

module weight_buffer_18_16_2_64_bo_0 (
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
	input [5:0] index
);

wire [287:0] packed_result_0;
reg [5:0] addrs_0;
reg [5:0] addrs_base_0;
wire [287:0] packed_result_1;
reg [5:0] addrs_1;
reg [5:0] addrs_base_1;

always @ (posedge clk) begin
	addrs_base_0 <= 0;
	addrs_base_1 <= 1;
	addrs_0 <= index + addrs_base_0;
	addrs_1 <= index + addrs_base_1;
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

single_port_ram ram_inst_1 (
	.we(rom_we),
	.addr(addrs_1),
	.data(288'd0),
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



