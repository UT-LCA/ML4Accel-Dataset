// A parameterized, inferable, single-port ROM in Verilog.
`include "macro.v"
module sp_rom(a_clk, a_en, a_addr, a_dout);

parameter INIT_FILE = "/mif/"; 
parameter DATA_WIDTH = 32;
parameter DATA_NUM = 100;
parameter ADDR_WIDTH = `CLOG2(DATA_NUM);

// Port A
input wire a_clk;
input wire a_en;
input wire [ADDR_WIDTH-1:0] a_addr;
output reg [DATA_WIDTH-1:0] a_dout;

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
    if(a_en) a_dout <= mem[a_addr];
end

endmodule