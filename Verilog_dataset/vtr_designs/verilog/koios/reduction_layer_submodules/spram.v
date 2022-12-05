`define DWIDTH 16
`define LOGDWIDTH 4
`define AWIDTH 5
`define MEM_SIZE 2048
`define NUM_INPUTS 128
`define VCS

module spram (
        addr, 
        d, 
        we, 
        q,  
        clk);

input [`AWIDTH-1:0] addr;
input [`NUM_INPUTS*`DWIDTH-1:0] d;
input we;
output reg [`NUM_INPUTS*`DWIDTH-1:0] q;
input clk;

`ifdef VCS

reg [`NUM_INPUTS*`DWIDTH-1:0] ram[((1<<`AWIDTH)-1):0];

always @(posedge clk)  
begin 
    if (we) 
      ram[addr] <= d;
    else 
      q <= ram[addr];
end

`else

single_port_ram u_single_port_ram(
.addr(addr),
.we(we),
.data(d),
.out(q),
.clk(clk)
);

`endif

endmodule
