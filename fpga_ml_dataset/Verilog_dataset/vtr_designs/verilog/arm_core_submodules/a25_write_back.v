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

module a25_write_back(
			i_clk,
			i_mem_stall,                
 
			i_mem_read_data,          
			i_mem_read_data_valid,    
			i_mem_load_rd,           
 
			o_wb_read_data,           
			o_wb_read_data_valid,     
			o_wb_load_rd,           
 
			i_daddress,
//			i_daddress_valid
			);

input                       i_clk;
input                       i_mem_stall;                // Mem stage asserting stall
 
input       [31:0]          i_mem_read_data;            // data reads
input                       i_mem_read_data_valid;      // read data is valid
input       [10:0]          i_mem_load_rd;              // Rd for data reads
 
output      [31:0]          o_wb_read_data;            // data reads
output                      o_wb_read_data_valid;    // read data is valid
output      [10:0]          o_wb_load_rd;              // Rd for data reads
 
input       [31:0]          i_daddress;
//input                       i_daddress_valid;
 
reg  [31:0]         mem_read_data_r = 32'd0;          // Register read data from Data Cache
reg                 mem_read_data_valid_r = 1'd0;    // Register read data from Data Cache
reg  [10:0]         mem_load_rd_r = 11'd0;            // Register the Rd value for loads
 
assign o_wb_read_data       = mem_read_data_r;
assign o_wb_read_data_valid = mem_read_data_valid_r;
assign o_wb_load_rd         = mem_load_rd_r;
 
 
always @( posedge i_clk )
    if ( !i_mem_stall )
        begin                                                                                                             
        mem_read_data_r         <= i_mem_read_data;
        mem_read_data_valid_r   <= i_mem_read_data_valid;
        mem_load_rd_r           <= i_mem_load_rd;
        end
 
 
// Used by a25_decompile.v, so simulation only
//synopsys translate_off    
reg  [31:0]         daddress_r = 32'd0;               // Register read data from Data Cache
always @( posedge i_clk )
    if ( !i_mem_stall )
        daddress_r              <= i_daddress;
//synopsys translate_on    
 
endmodule
