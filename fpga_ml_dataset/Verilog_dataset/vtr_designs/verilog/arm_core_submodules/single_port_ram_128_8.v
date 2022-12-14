`define ADDR_WIDTH_21_8 8
`define DATA_WIDTH_21_8 21
`define ADDR_WIDTH_128_8 8
`define DATA_WIDTH_128_8 128
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
//`define A25_DECOMPILE
//`define A25_COPRO15_DEBUG
//`define A25_CACHE_DEBUG
//    `define A25_DECOMPILE_FILE    "amber.dis"

module single_port_ram_128_8(
			clk,
			data,
			we,
			addr, 
			out
			);
`define ADDR_WIDTH_128_8 8
`define DATA_WIDTH_128_8 128

    input 					clk;
    input	[`DATA_WIDTH_128_8-1:0] 	data;
    input 					we;
    input	[`ADDR_WIDTH_128_8-1:0] 	addr;

    
    output	[`DATA_WIDTH_128_8-1:0] 	out;
    reg		[`DATA_WIDTH_128_8-1:0] 	out;
     
    reg 	[`DATA_WIDTH_128_8-1:0] 	RAM[255:0];
     
    always @ (posedge clk) 
    begin 
        if (we) 
	begin
	RAM[addr] <= data;
        out <= RAM[addr]; 
	end
    end 
     
endmodule
