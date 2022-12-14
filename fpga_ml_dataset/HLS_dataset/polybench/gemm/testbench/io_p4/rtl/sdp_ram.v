// A parameterized, inferable, simple dual-port, dual-clock block RAM in Verilog. (one wr + one rd port)
`include "macro.v"
module sdp_ram(a_clk, a_en, a_wr, a_addr, a_din,
			   b_clk, b_en, b_addr, b_dout );

parameter INIT_FILE = "/mif/"; 
parameter DATA_WIDTH = 32;
parameter DATA_NUM = 100;
parameter ADDR_WIDTH = `CLOG2(DATA_NUM);

// Port A
input wire a_clk;
input wire a_en;
input wire a_wr;
input wire [ADDR_WIDTH-1:0] a_addr;
input wire [DATA_WIDTH-1:0] a_din;
 
// Port B
input wire b_clk;
input wire b_en;
input wire [ADDR_WIDTH-1:0] b_addr;
output reg [DATA_WIDTH-1:0] b_dout;

// Shared memory
/*(* ram_style = "block" *)*/ reg [DATA_WIDTH-1:0] mem [DATA_NUM-1:0];

generate
    if(INIT_FILE!=0)
    begin:init_gen
        initial $readmemh(INIT_FILE, mem);
    end
endgenerate
 
// Port A
always @(posedge a_clk) 
begin
    if(a_en && a_wr) mem[a_addr] <= a_din;
end

// Port B
always @(posedge b_clk) 
begin
	if(b_en) b_dout <= mem[b_addr];
end

endmodule