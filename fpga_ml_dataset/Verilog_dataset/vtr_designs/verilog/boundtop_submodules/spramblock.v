`define SIMULATION_MEMORY

 module spramblock (we, addr, datain, dataout, clk);

    input we; 
    input[10 - 1:0] addr; 
    input[32 - 1:0] datain; 
    output[32 - 1:0] dataout; 
    wire[32 - 1:0] dataout;
    input clk; 



defparam new_ram.ADDR_WIDTH = 10;
defparam new_ram.DATA_WIDTH = 32;
single_port_ram new_ram(
  .clk (clk),
  .we(we),
  .data(datain),
  .out(dataout),
  .addr(addr)
  );
  
  
 endmodule
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
