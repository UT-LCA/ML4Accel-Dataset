`define SIMULATION_MEMORY

module single_port_ram(
clk,
addr,
data,
we,
out
);

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
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
