`define SIMULATION_MEMORY

module weight_cache_2048_8_0_weight_init_00 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

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

parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 14;
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



