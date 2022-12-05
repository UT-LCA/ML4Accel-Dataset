`define SIMULATION_MEMORY

 module spram21x4 (we, dataout, datain, clk);

    input we; 
    output[21 - 1:0] dataout; 
    wire[21 - 1:0] dataout;
    input[21 - 1:0] datain; 
    input clk; 

	reg [7:0] addr;
	
	always @ (posedge clk)
	begin
	 addr[0] <= we;
	 addr [1] <= addr[0];
	 addr [2] <= addr[1];
	 addr [3] <= addr[2];
	 addr [4] <= addr[3];
	 addr [5] <= addr[4];
	 addr [6] <= addr[5];
	 addr [7] <= addr[6];
	 end
//changed to odin 2 ram specifications

defparam new_ram.ADDR_WIDTH = 8;
defparam new_ram.DATA_WIDTH = 21;
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
