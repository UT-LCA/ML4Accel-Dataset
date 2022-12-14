`define SIMULATION_MEMORY

module buffer_16_24200_buffer_init_04 (
	input clk,
	input wen,
	input [14:0] waddr,
	input [15:0] wdata,
	input [14:0] raddr,
	output [15:0] rdata
);

reg [14:0] raddr_reg;
reg [15:0] rdata_reg;
reg [15:0] pipeline_reg_0;
wire [15:0] rd_dummy_signal;
wire [15:0] wr_dummy_signal;
wire [15:0] rdata_wire;
assign rd_dummy_signal = 0;

always @(posedge clk) begin
	rdata_reg <= rdata_wire;
	raddr_reg <= raddr;
	pipeline_reg_0 <= rdata_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 16;
defparam u_dual_port_ram.ADDR_WIDTH = 15;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(waddr),
	.we1(wen),
	.data1(wdata),
	.out1(wr_dummy_signal),
	.addr2(raddr_reg),
	.we2(1'b0),
	.data2(rd_dummy_signal),
	.out2(rdata_wire),
	.clk(clk)
);
assign rdata = pipeline_reg_0;

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

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
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



