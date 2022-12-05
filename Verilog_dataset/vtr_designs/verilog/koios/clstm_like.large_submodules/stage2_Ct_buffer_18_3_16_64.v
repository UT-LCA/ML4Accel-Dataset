`define SIMULATION_MEMORY

module stage2_Ct_buffer_18_3_16_64 (
	input clk,
	input reset,
	input wen,
	input ren,
	input [17:0] i_Ct_0,
	input [17:0] i_Ct_1,
	input [17:0] i_Ct_2,
	input [17:0] i_Ct_3,
	input [17:0] i_Ct_4,
	input [17:0] i_Ct_5,
	input [17:0] i_Ct_6,
	input [17:0] i_Ct_7,
	input [17:0] i_Ct_8,
	input [17:0] i_Ct_9,
	input [17:0] i_Ct_10,
	input [17:0] i_Ct_11,
	input [17:0] i_Ct_12,
	input [17:0] i_Ct_13,
	input [17:0] i_Ct_14,
	input [17:0] i_Ct_15,
	output [17:0] o_Ct_0,
	output [17:0] o_Ct_1,
	output [17:0] o_Ct_2,
	output [17:0] o_Ct_3,
	output [17:0] o_Ct_4,
	output [17:0] o_Ct_5,
	output [17:0] o_Ct_6,
	output [17:0] o_Ct_7,
	output [17:0] o_Ct_8,
	output [17:0] o_Ct_9,
	output [17:0] o_Ct_10,
	output [17:0] o_Ct_11,
	output [17:0] o_Ct_12,
	output [17:0] o_Ct_13,
	output [17:0] o_Ct_14,
	output [17:0] o_Ct_15,
	output [17:0] o_Ct_16,
	output [17:0] o_Ct_17,
	output [17:0] o_Ct_18,
	output [17:0] o_Ct_19,
	output [17:0] o_Ct_20,
	output [17:0] o_Ct_21,
	output [17:0] o_Ct_22,
	output [17:0] o_Ct_23,
	output [17:0] o_Ct_24,
	output [17:0] o_Ct_25,
	output [17:0] o_Ct_26,
	output [17:0] o_Ct_27,
	output [17:0] o_Ct_28,
	output [17:0] o_Ct_29,
	output [17:0] o_Ct_30,
	output [17:0] o_Ct_31,
	output [17:0] o_Ct_32,
	output [17:0] o_Ct_33,
	output [17:0] o_Ct_34,
	output [17:0] o_Ct_35,
	output [17:0] o_Ct_36,
	output [17:0] o_Ct_37,
	output [17:0] o_Ct_38,
	output [17:0] o_Ct_39,
	output [17:0] o_Ct_40,
	output [17:0] o_Ct_41,
	output [17:0] o_Ct_42,
	output [17:0] o_Ct_43,
	output [17:0] o_Ct_44,
	output [17:0] o_Ct_45,
	output [17:0] o_Ct_46,
	output [17:0] o_Ct_47,
	output o_valid
);

wire [287:0] packed_o_Ct_0;
reg [5:0] raddrs_0;
wire [287:0] packed_o_Ct_1;
reg [5:0] raddrs_1;
wire [287:0] packed_o_Ct_2;
reg [5:0] raddrs_2;
wire [287:0] packed_Ct;

wire [13:0] input_index_counter;
counter_63_1 counter_63_1_inst_in (
	.clk(clk),
	.reset(reset),
	.ena(wen),
	.count(input_index_counter)
);

wire [13:0] output_index_counter;
counter_63_1 counter_63_1_inst_out (
	.clk(clk),
	.reset(reset),
	.ena(ren),
	.count(output_index_counter)
);

always @ (posedge clk) begin
	if ((input_index_counter + 0) < 64)
		raddrs_0 <= input_index_counter + 0;
	else
		raddrs_0 <= 64;
	if ((input_index_counter + 1) < 64)
		raddrs_1 <= input_index_counter + 1;
	else
		raddrs_1 <= 64;
	if ((input_index_counter + 2) < 64)
		raddrs_2 <= input_index_counter + 2;
	else
		raddrs_2 <= 64;
end

assign packed_Ct[17:0] = i_Ct_0;
assign packed_Ct[35:18] = i_Ct_1;
assign packed_Ct[53:36] = i_Ct_2;
assign packed_Ct[71:54] = i_Ct_3;
assign packed_Ct[89:72] = i_Ct_4;
assign packed_Ct[107:90] = i_Ct_5;
assign packed_Ct[125:108] = i_Ct_6;
assign packed_Ct[143:126] = i_Ct_7;
assign packed_Ct[161:144] = i_Ct_8;
assign packed_Ct[179:162] = i_Ct_9;
assign packed_Ct[197:180] = i_Ct_10;
assign packed_Ct[215:198] = i_Ct_11;
assign packed_Ct[233:216] = i_Ct_12;
assign packed_Ct[251:234] = i_Ct_13;
assign packed_Ct[269:252] = i_Ct_14;
assign packed_Ct[287:270] = i_Ct_15;

ram_288_0_64 ram_288_0_64_inst_0 (
	.clk(clk),
	.waddr(input_index_counter),
	.wdata(packed_Ct),
	.wen(wen),
	.raddr(raddrs_0),
	.q(packed_o_Ct_0)
);

ram_288_0_64 ram_288_0_64_inst_1 (
	.clk(clk),
	.waddr(input_index_counter),
	.wdata(packed_Ct),
	.wen(wen),
	.raddr(raddrs_1),
	.q(packed_o_Ct_1)
);

ram_288_0_64 ram_288_0_64_inst_2 (
	.clk(clk),
	.waddr(input_index_counter),
	.wdata(packed_Ct),
	.wen(wen),
	.raddr(raddrs_2),
	.q(packed_o_Ct_2)
);

assign o_Ct_0 = packed_o_Ct_0[17:0];
assign o_Ct_1 = packed_o_Ct_0[35:18];
assign o_Ct_2 = packed_o_Ct_0[53:36];
assign o_Ct_3 = packed_o_Ct_0[71:54];
assign o_Ct_4 = packed_o_Ct_0[89:72];
assign o_Ct_5 = packed_o_Ct_0[107:90];
assign o_Ct_6 = packed_o_Ct_0[125:108];
assign o_Ct_7 = packed_o_Ct_0[143:126];
assign o_Ct_8 = packed_o_Ct_0[161:144];
assign o_Ct_9 = packed_o_Ct_0[179:162];
assign o_Ct_10 = packed_o_Ct_0[197:180];
assign o_Ct_11 = packed_o_Ct_0[215:198];
assign o_Ct_12 = packed_o_Ct_0[233:216];
assign o_Ct_13 = packed_o_Ct_0[251:234];
assign o_Ct_14 = packed_o_Ct_0[269:252];
assign o_Ct_15 = packed_o_Ct_0[287:270];
assign o_Ct_16 = packed_o_Ct_1[17:0];
assign o_Ct_17 = packed_o_Ct_1[35:18];
assign o_Ct_18 = packed_o_Ct_1[53:36];
assign o_Ct_19 = packed_o_Ct_1[71:54];
assign o_Ct_20 = packed_o_Ct_1[89:72];
assign o_Ct_21 = packed_o_Ct_1[107:90];
assign o_Ct_22 = packed_o_Ct_1[125:108];
assign o_Ct_23 = packed_o_Ct_1[143:126];
assign o_Ct_24 = packed_o_Ct_1[161:144];
assign o_Ct_25 = packed_o_Ct_1[179:162];
assign o_Ct_26 = packed_o_Ct_1[197:180];
assign o_Ct_27 = packed_o_Ct_1[215:198];
assign o_Ct_28 = packed_o_Ct_1[233:216];
assign o_Ct_29 = packed_o_Ct_1[251:234];
assign o_Ct_30 = packed_o_Ct_1[269:252];
assign o_Ct_31 = packed_o_Ct_1[287:270];
assign o_Ct_32 = packed_o_Ct_2[17:0];
assign o_Ct_33 = packed_o_Ct_2[35:18];
assign o_Ct_34 = packed_o_Ct_2[53:36];
assign o_Ct_35 = packed_o_Ct_2[71:54];
assign o_Ct_36 = packed_o_Ct_2[89:72];
assign o_Ct_37 = packed_o_Ct_2[107:90];
assign o_Ct_38 = packed_o_Ct_2[125:108];
assign o_Ct_39 = packed_o_Ct_2[143:126];
assign o_Ct_40 = packed_o_Ct_2[161:144];
assign o_Ct_41 = packed_o_Ct_2[179:162];
assign o_Ct_42 = packed_o_Ct_2[197:180];
assign o_Ct_43 = packed_o_Ct_2[215:198];
assign o_Ct_44 = packed_o_Ct_2[233:216];
assign o_Ct_45 = packed_o_Ct_2[251:234];
assign o_Ct_46 = packed_o_Ct_2[269:252];
assign o_Ct_47 = packed_o_Ct_2[287:270];
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









