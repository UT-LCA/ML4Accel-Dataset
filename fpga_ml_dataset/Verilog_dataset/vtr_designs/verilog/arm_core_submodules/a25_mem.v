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

module a25_mem(
		i_clk,
		i_fetch_stall,          
		i_exec_stall,          
		o_mem_stall,        
 
		i_daddress,
		i_daddress_valid,
		i_daddress_nxt,        
		i_write_data,
		i_write_enable,
		i_exclusive,            
		i_byte_enable,
		i_exec_load_rd,         
		i_cache_enable,       
		i_cache_flush,    
		i_cacheable_area,    
 
		o_mem_read_data,
		o_mem_read_data_valid,
		o_mem_load_rd,        
                                                       
		o_wb_cached_req,  
		o_wb_uncached_req,     
		o_wb_write,            
		o_wb_byte_enable,   
		o_wb_write_data,
		o_wb_address,                                         
		i_wb_uncached_rdata,                            
		i_wb_cached_rdata,                                
		i_wb_cached_ready,      
		i_wb_uncached_ready     
		);
 


input                       i_clk;
input                       i_fetch_stall;          // Fetch stage asserting stall
input                       i_exec_stall;           // Execute stage asserting stall
output                      o_mem_stall;            // Mem stage asserting stall
 
input       [31:0]          i_daddress;
input                       i_daddress_valid;
input       [31:0]          i_daddress_nxt;         // un-registered version of address to the cache rams
input       [31:0]          i_write_data;
input                       i_write_enable;
input                       i_exclusive;            // high for read part of swap access
input       [3:0]           i_byte_enable;
input       [8:0]           i_exec_load_rd;         // The destination register for a load instruction
input                       i_cache_enable;         // cache enable
input                       i_cache_flush;          // cache flush
input       [31:0]          i_cacheable_area;       // each bit corresponds to 2MB address space
 
output      [31:0]          o_mem_read_data;
output                      o_mem_read_data_valid;
output      [10:0]          o_mem_load_rd;          // The destination register for a load instruction
 
// Wishbone accesses                                                         
output                      o_wb_cached_req;        // Cached Request
output                      o_wb_uncached_req;      // Unached Request
output                      o_wb_write;             // Read=0, Write=1
output     [15:0]           o_wb_byte_enable;       // byte eable
output     [127:0]          o_wb_write_data;
output     [31:0]           o_wb_address;           // wb bus                                 
input      [127:0]          i_wb_uncached_rdata;    // wb bus                              
input      [127:0]          i_wb_cached_rdata;      // wb bus                              
input                       i_wb_cached_ready;      // wishbone access complete and read data valid
input                       i_wb_uncached_ready;     // wishbone access complete and read data valid
 
wire    [31:0]              cache_read_data;
wire                        address_cachable;
wire                        sel_cache_p;
wire                        sel_cache;
wire                        cached_wb_req;
wire                        uncached_data_access;
wire                        uncached_data_access_p;
wire                        cache_stall;
wire                        uncached_wb_wait;
reg                         uncached_wb_req_r = 1'd0;
reg                         uncached_wb_stop_r = 1'd0;
reg                         cached_wb_stop_r = 1'd0;
wire                        daddress_valid_p;  // pulse
reg      [31:0]             mem_read_data_r = 32'd0;
reg                         mem_read_data_valid_r = 1'd0;
reg      [10:0]             mem_load_rd_r = 11'd0;
wire     [10:0]             mem_load_rd_c;
wire     [31:0]             mem_read_data_c;
wire                        mem_read_data_valid_c;
reg                         mem_stall_r = 1'd0;
wire                        use_mem_reg;
reg                         fetch_only_stall_r = 1'd0;
wire                        fetch_only_stall;
wire                        void_output;
wire                        wb_stop;
reg                         daddress_valid_stop_r = 1'd0;
wire     [31:0]             wb_rdata32;
 
// ======================================
// Memory Decode
// ======================================

//assign address_cachable         = in_cachable_mem( i_daddress ) && i_cacheable_area[i_daddress[25:21]];
//in_cachable_mem = in_loboot_mem  ( address ) ||  in_main_mem  ( address ) ; 

 
// e.g. 24 for 32MBytes, 26 for 128MBytes
localparam MAIN_MSB             = 26; 
 
// e.g. 13 for 4k words
localparam BOOT_MSB             = 13;
 
localparam MAIN_BASE            = 32'h00000000; /*  Main Memory            */
localparam BOOT_BASE            = 32'h00000000; /*  Cachable Boot Memory   */
localparam AMBER_TM_BASE        = 16'h1300;      /*  Timers Module          */
localparam AMBER_IC_BASE        = 16'h1400;      /*  Interrupt Controller   */
localparam AMBER_UART0_BASE     = 16'h1600;      /*  UART 0                 */
localparam AMBER_UART1_BASE     = 16'h1700;      /*  UART 1                 */
localparam ETHMAC_BASE          = 16'h2000;      /*  Ethernet MAC           */
localparam HIBOOT_BASE          = 32'h28000000; /*  Uncachable Boot Memory */
localparam TEST_BASE            = 16'hf000;      /*  Test Module            */
 
 
 
//function in_loboot_mem;
//    input [31:0] address;
//begin
//in_loboot_mem  = (address >= BOOT_BASE   && 
//                 address < (BOOT_BASE   + 2**(BOOT_MSB+1)-1));
//end
//endfunction
 
 
//function in_hiboot_mem;
//    input [31:0] address;
//begin
//in_hiboot_mem  = (address[31:BOOT_MSB+1] == HIBOOT_BASE[31:BOOT_MSB+1]);
//		= (address[31:14] == HIBOOT_BASE>>(BOOT_MSB+1));   fixed

//end
//endfunction
 
 
//function in_boot_mem;
//    input [31:0] address;
//begin
//in_boot_mem  =  in_loboot_mem(address) || in_hiboot_mem(address);
//end
//endfunction
 
 
//function in_main_mem;
//    input [31:0] address;
//begin
//in_main_mem  = (address >= MAIN_BASE   && 
//                address < (MAIN_BASE   + 2**(MAIN_MSB+1)-1)) &&
//                !in_boot_mem ( address );
//end
//endfunction
 
 
// UART 0 address space
//function in_uart0;
//    input [31:0] address;
//begin
//    in_uart0 = address [31:16] == AMBER_UART0_BASE;
//end
//endfunction
 
 
// UART 1 address space
//function in_uart1;
//    input [31:0] address;
//begin
//    in_uart1 = address [31:16] == AMBER_UART1_BASE;
//end
//endfunction
 
 
// Interrupt Controller address space
//function in_ic;
//    input [31:0] address;
//begin
//    in_ic = address [31:16] == AMBER_IC_BASE;
//end
//endfunction
 
 
// Timer Module address space
//function in_tm;
//    input [31:0] address;
//begin
//    in_tm = address [31:16] == AMBER_TM_BASE;
//end
//endfunction
 
 
// Test module
//function in_test;
//    input [31:0] address;
//begin
//    in_test = address [31:16] == TEST_BASE;
//end
//endfunction
 
 
// Ethernet MAC
//function in_ethmac;
//    input [31:0] address;
//begin
//    in_ethmac = address [31:16] == ETHMAC_BASE;
//end
//endfunction
 
 
// Used in fetch.v and l2cache.v to allow accesses to these addresses
// to be cached
//function in_cachable_mem;
//    input [31:0] address;
//begin
//    in_cachable_mem = in_loboot_mem     ( address ) || 
//                      in_main_mem       ( address ) ; 
//end
//endfunction



assign address_cachable         = (
					 (i_daddress >= BOOT_BASE  &&  i_daddress < (BOOT_BASE   + 32'h7fff))     // in_loboot_mem  ( address )
					|| ( 
						(i_daddress >= MAIN_BASE  &&  i_daddress < (MAIN_BASE   + 32'hfffffff)) 
							&& !( (i_daddress >= BOOT_BASE && i_daddress < (BOOT_BASE  + 32'h7fff))
											||(i_daddress[31:14] == HIBOOT_BASE>>(14)))
					   )
				  )
				&& ((i_daddress[25:21] == 5'b00000) ? i_cacheable_area[0] :
					(i_daddress[25:21] == 5'b00001) ? i_cacheable_area[1] :
					(i_daddress[25:21] == 5'b00010) ? i_cacheable_area[2] :
					(i_daddress[25:21] == 5'b00011) ? i_cacheable_area[3] :
					(i_daddress[25:21] == 5'b00100) ? i_cacheable_area[4] :
					(i_daddress[25:21] == 5'b00101) ? i_cacheable_area[5] :
					(i_daddress[25:21] == 5'b00110) ? i_cacheable_area[6] :
					(i_daddress[25:21] == 5'b00111) ? i_cacheable_area[7] :
					(i_daddress[25:21] == 5'b01000) ? i_cacheable_area[8] :
					(i_daddress[25:21] == 5'b01001) ? i_cacheable_area[9] :
					(i_daddress[25:21] == 5'b01010) ? i_cacheable_area[10] :
					(i_daddress[25:21] == 5'b01011) ? i_cacheable_area[11] :
					(i_daddress[25:21] == 5'b01100) ? i_cacheable_area[12] :
					(i_daddress[25:21] == 5'b01101) ? i_cacheable_area[13] :
					(i_daddress[25:21] == 5'b01110) ? i_cacheable_area[14] :
					(i_daddress[25:21] == 5'b01111) ? i_cacheable_area[15] :
					(i_daddress[25:21] == 5'b10000) ? i_cacheable_area[16] :
					(i_daddress[25:21] == 5'b10001) ? i_cacheable_area[17] :
					(i_daddress[25:21] == 5'b10010) ? i_cacheable_area[18] :
					(i_daddress[25:21] == 5'b10011) ? i_cacheable_area[19] :
					(i_daddress[25:21] == 5'b10100) ? i_cacheable_area[20] :
					(i_daddress[25:21] == 5'b10101) ? i_cacheable_area[21] :
					(i_daddress[25:21] == 5'b10110) ? i_cacheable_area[22] :
					(i_daddress[25:21] == 5'b10111) ? i_cacheable_area[23] :
					(i_daddress[25:21] == 5'b11000) ? i_cacheable_area[24] :
					(i_daddress[25:21] == 5'b11001) ? i_cacheable_area[25] :
					(i_daddress[25:21] == 5'b11010) ? i_cacheable_area[26] :
					(i_daddress[25:21] == 5'b11011) ? i_cacheable_area[27] :
					(i_daddress[25:21] == 5'b11100) ? i_cacheable_area[28] :
					(i_daddress[25:21] == 5'b11101) ? i_cacheable_area[29] :
					(i_daddress[25:21] == 5'b11110) ? i_cacheable_area[30] :
					i_cacheable_area[31] );

//i_cacheable_area[i_daddress[25:21]];
assign sel_cache_p              = daddress_valid_p && address_cachable && i_cache_enable && !i_exclusive;
assign sel_cache                = i_daddress_valid && address_cachable && i_cache_enable && !i_exclusive;
assign uncached_data_access     = i_daddress_valid && !sel_cache && !cache_stall;
assign uncached_data_access_p   = daddress_valid_p && !sel_cache;
 
assign use_mem_reg              = wb_stop && !mem_stall_r;
assign o_mem_read_data          = use_mem_reg ? mem_read_data_r       : mem_read_data_c;
assign o_mem_load_rd            = use_mem_reg ? mem_load_rd_r         : mem_load_rd_c;
assign o_mem_read_data_valid    = !void_output && (use_mem_reg ? mem_read_data_valid_r : mem_read_data_valid_c);
 
 
// Return read data either from the wishbone bus or the cache
assign wb_rdata32               = i_daddress[3:2] == 2'd0 ? i_wb_uncached_rdata[ 31: 0] :
                                  i_daddress[3:2] == 2'd1 ? i_wb_uncached_rdata[ 63:32] :
                                  i_daddress[3:2] == 2'd2 ? i_wb_uncached_rdata[ 95:64] :
                                                            i_wb_uncached_rdata[127:96] ;
 
assign mem_read_data_c          = sel_cache             ? cache_read_data : 
                                  uncached_data_access  ? wb_rdata32      :
                                                          32'h76543210    ;
 
assign mem_load_rd_c            = {i_daddress[1:0], i_exec_load_rd};
assign mem_read_data_valid_c    = i_daddress_valid && !i_write_enable && !o_mem_stall;
 
assign o_mem_stall              = uncached_wb_wait || cache_stall;
 
// Request wishbone access
assign o_wb_byte_enable         = i_daddress[3:2] == 2'd0 ? {12'd0, i_byte_enable       } :
                                  i_daddress[3:2] == 2'd1 ? { 8'd0, i_byte_enable,  4'd0} :
                                  i_daddress[3:2] == 2'd2 ? { 4'd0, i_byte_enable,  8'd0} :
                                                            {       i_byte_enable, 12'd0} ;
 
assign o_wb_write               = i_write_enable;
assign o_wb_address             = {i_daddress[31:2], 2'd0};
assign o_wb_write_data          = {4{i_write_data}};
assign o_wb_cached_req          = !cached_wb_stop_r && cached_wb_req;
assign o_wb_uncached_req        = !uncached_wb_stop_r && uncached_data_access_p;
 
assign uncached_wb_wait         = (o_wb_uncached_req || uncached_wb_req_r) && !i_wb_uncached_ready;
 
always @( posedge i_clk )
    begin
    uncached_wb_req_r <=  (o_wb_uncached_req || uncached_wb_req_r) && !i_wb_uncached_ready;
    end
 
assign fetch_only_stall     = i_fetch_stall && !o_mem_stall;
 
always @( posedge i_clk )
    fetch_only_stall_r <= fetch_only_stall;
 
assign void_output = (fetch_only_stall_r && fetch_only_stall) || (fetch_only_stall_r && mem_read_data_valid_r);
 
 
// pulse this signal
assign daddress_valid_p = i_daddress_valid && !daddress_valid_stop_r;
 
always @( posedge i_clk )
    begin
    uncached_wb_stop_r      <= (uncached_wb_stop_r || (uncached_data_access_p&&!cache_stall)) && (i_fetch_stall || o_mem_stall);
    cached_wb_stop_r        <= (cached_wb_stop_r   || cached_wb_req)          && (i_fetch_stall || o_mem_stall);
    daddress_valid_stop_r   <= (daddress_valid_stop_r || daddress_valid_p)    && (i_fetch_stall || o_mem_stall);
    // hold this until the mem access completes
    mem_stall_r <= o_mem_stall;
    end
 
 
assign wb_stop = uncached_wb_stop_r || cached_wb_stop_r;
 
always @( posedge i_clk )
    if ( !wb_stop || o_mem_stall )
        begin
        mem_read_data_r         <= mem_read_data_c;
        mem_load_rd_r           <= mem_load_rd_c;
        mem_read_data_valid_r   <= mem_read_data_valid_c;
        end
 
 
// ======================================
// L1 Data Cache
// ======================================
a25_dcache u_dcache (
    .i_clk                      ( i_clk                 ),
    .i_request                  ( sel_cache_p           ),
    .i_exclusive                ( i_exclusive           ),
    .i_write_data               ( i_write_data          ),
    .i_write_enable             ( i_write_enable        ),
    .i_address                  ( i_daddress            ),
    .i_address_nxt              ( i_daddress_nxt        ),
    .i_byte_enable              ( i_byte_enable         ),
    .i_cache_enable             ( i_cache_enable        ),
    .i_cache_flush              ( i_cache_flush         ),
    .i_fetch_stall              ( i_fetch_stall         ),
    .i_exec_stall               ( i_exec_stall          ),
    .i_wb_cached_rdata          ( i_wb_cached_rdata     ),
    .i_wb_cached_ready          ( i_wb_cached_ready     ),

   .o_read_data                ( cache_read_data       ), 
   .o_stall                    ( cache_stall           ),
   .o_wb_cached_req            ( cached_wb_req         )

);
 
 
 
endmodule
module a25_dcache 

		(
		i_clk, 		
		i_request,
		i_exclusive,     
		i_write_data,
		i_write_enable,     
		i_address,         
		i_address_nxt,     
		i_byte_enable,
		i_cache_enable,  
		i_cache_flush,     
		i_fetch_stall,
		i_exec_stall,                                                   
		i_wb_cached_rdata,                            
		i_wb_cached_ready,  

		o_read_data,    
		o_stall, 
		o_wb_cached_req           
		);

 
 
`ifndef _A25_CONFIG_DEFINES
`define _A25_CONFIG_DEFINES
 
// Cache Ways
// Changing this parameter is the recommended
// way to change the Amber cache size; 2, 3, 4 and 8 ways are supported.
//
//   2 ways -> 8KB  cache
//   3 ways -> 12KB cache
//   4 ways -> 16KB cache
//   8 ways -> 32KB cache
//
//   e.g. if both caches have 8 ways, the total is 32KB icache + 32KB dcache = 64KB
 
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
 
 
// --------------------------------------------------------------------
// Debug switches 
// --------------------------------------------------------------------
 
// Enable the decompiler. The default output file is amber.dis
//`define A25_DECOMPILE
 
// Co-processor 15 debug. Registers in here control the cache
//`define A25_COPRO15_DEBUG
 
// Cache debug
//`define A25_CACHE_DEBUG
 
// --------------------------------------------------------------------
 
 
// --------------------------------------------------------------------
// File Names
// --------------------------------------------------------------------
//`ifndef A25_DECOMPILE_FILE
//    `define A25_DECOMPILE_FILE    "amber.dis"
//`endif

`endif
// ---------------------------------------------------------
// Cache Configuration
 
// Limited to Linux 4k page sizes -> 256 lines
parameter CACHE_LINES          = 256;

// This cannot be changed without some major surgeory on
// this module                                       
parameter CACHE_WORDS_PER_LINE = 4;
 
// Changing this parameter is the recommended
// way to change the overall cache size; 2, 4 and 8 ways are supported.
//   2 ways -> 8KB  cache
//   4 ways -> 16KB cache
//   8 ways -> 32KB cache
parameter WAYS              = `A25_DCACHE_WAYS;			//4
 
// derived configuration parameters
//parameter CACHE_ADDR_WIDTH  = log2 ( CACHE_LINES );                        // = 8
//parameter WORD_SEL_WIDTH    = log2 ( CACHE_WORDS_PER_LINE );               // = 2
//parameter TAG_ADDR_WIDTH    = 32 - CACHE_ADDR_WIDTH - WORD_SEL_WIDTH - 2;  // = 20
//parameter TAG_WIDTH         = TAG_ADDR_WIDTH + 1;                          // = 21, including Valid flag
//parameter CACHE_LINE_WIDTH  = CACHE_WORDS_PER_LINE * 32;                   // = 128
//parameter TAG_ADDR32_LSB    = CACHE_ADDR_WIDTH + WORD_SEL_WIDTH + 2;       // = 12
//parameter CACHE_ADDR32_MSB  = CACHE_ADDR_WIDTH + WORD_SEL_WIDTH + 2 - 1;   // = 11
//parameter CACHE_ADDR32_LSB  =                    WORD_SEL_WIDTH + 2;   // = 4
//parameter WORD_SEL_MSB      = WORD_SEL_WIDTH + 2 - 1;                      // = 3
//parameter WORD_SEL_LSB      =                  2;                           // = 2
// ---------------------------------------------------------

parameter CACHE_ADDR_WIDTH  = 8;                        // = 8
parameter WORD_SEL_WIDTH    = 2;         	      // = 2
parameter TAG_ADDR_WIDTH    = 20;  			// = 20
parameter TAG_WIDTH         = 21;                          // = 21, including Valid flag
parameter CACHE_LINE_WIDTH  = 128;                   // = 128
parameter TAG_ADDR32_LSB    = 12;     		  // = 12
parameter CACHE_ADDR32_MSB  = 11;  			 // = 11
parameter CACHE_ADDR32_LSB  = 4;  			 // = 4
parameter WORD_SEL_MSB      = 3;                      // = 3
parameter WORD_SEL_LSB      = 2;                           // = 2


input                               i_clk; 		// Read / Write requests from core
input                               i_request;
input                               i_exclusive;        // exclusive access, part of swap instruction
input      [31:0]                   i_write_data;
input                               i_write_enable;     // write request from execute stage
input      [31:0]                   i_address;          // registered address from execute
input      [31:0]                   i_address_nxt;      // un-registered version of address from execute stage
input      [3:0]                    i_byte_enable;
input                               i_cache_enable;     // from co-processor 15 configuration register
input                               i_cache_flush;      // from co-processor 15 register
 
output      [31:0]                  o_read_data;                                                       
input                               i_fetch_stall;
input                               i_exec_stall;
output                              o_stall;
 
// WB Read Request                                                          
output                              o_wb_cached_req;        // Read Request
input      [127:0]                  i_wb_cached_rdata;      // wb bus                              
input                               i_wb_cached_ready;       // wb_stb && !wb_ack
 
//////////////////////////////////////////////////////////////////
//                                                              //
//  Parameters file for Amber 25 Core                           //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  Holds general parameters that are used is several core      //
//  modules                                                     //
//                                                              //
//  Author(s):                                                  //
//      - Conor Santifort, csantifort.amber@gmail.com           //
//                                                              //
//////////////////////////////////////////////////////////////////
//                                                              //
// Copyright (C) 2011 Authors and OPENCORES.ORG                 //
//                                                              //
// This source file may be used and distributed without         //
// restriction provided that this copyright statement is not    //
// removed from the file and that any derivative work contains  //
// the original copyright notice and the associated disclaimer. //
//                                                              //
// This source file is free software; you can redistribute it   //
// and/or modify it under the terms of the GNU Lesser General   //
// Public License as published by the Free Software Foundation; //
// either version 2.1 of the License, or (at your option) any   //
// later version.                                               //
//                                                              //
// This source is distributed in the hope that it will be       //
// useful, but WITHOUT ANY WARRANTY; without even the implied   //
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      //
// PURPOSE.  See the GNU Lesser General Public License for more //
// details.                                                     //
//                                                              //
// You should have received a copy of the GNU Lesser General    //
// Public License along with this source; if not, download it   //
// from http://www.opencores.org/lgpl.shtml                     //
//                                                              //
//////////////////////////////////////////////////////////////////
 
 
// Instruction Types
localparam [3:0]    REGOP       = 4'h0, // Data processing
                    MULT        = 4'h1, // Multiply
                    SWAP        = 4'h2, // Single Data Swap
                    TRANS       = 4'h3, // Single data transfer
                    MTRANS      = 4'h4, // Multi-word data transfer
                    BRANCH      = 4'h5, // Branch
                    CODTRANS    = 4'h6, // Co-processor data transfer
                    COREGOP     = 4'h7, // Co-processor data operation
                    CORTRANS    = 4'h8, // Co-processor register transfer
                    SWI         = 4'h9; // software interrupt
 
 
// Opcodes
localparam [3:0] AND = 4'h0,        // Logical AND
                 EOR = 4'h1,        // Logical Exclusive OR
                 SUB = 4'h2,        // Subtract
                 RSB = 4'h3,        // Reverse Subtract
                 ADD = 4'h4,        // Add
                 ADC = 4'h5,        // Add with Carry
                 SBC = 4'h6,        // Subtract with Carry
                 RSC = 4'h7,        // Reverse Subtract with Carry
                 TST = 4'h8,        // Test  (using AND operator)
                 TEQ = 4'h9,        // Test Equivalence (using EOR operator)
                 CMP = 4'ha,       // Compare (using Subtract operator)
                 CMN = 4'hb,       // Compare Negated
                 ORR = 4'hc,       // Logical OR
                 MOV = 4'hd,       // Move
                 BIC = 4'he,       // Bit Clear (using AND & NOT operators)
                 MVN = 4'hf;       // Move NOT
 
// Condition Encoding
localparam [3:0] EQ  = 4'h0,        // Equal            / Z set
                 NE  = 4'h1,        // Not equal        / Z clear
                 CS  = 4'h2,        // Carry set        / C set
                 CC  = 4'h3,        // Carry clear      / C clear
                 MI  = 4'h4,        // Minus            / N set
                 PL  = 4'h5,        // Plus             / N clear
                 VS  = 4'h6,        // Overflow         / V set
                 VC  = 4'h7,        // No overflow      / V clear
                 HI  = 4'h8,        // Unsigned higher  / C set and Z clear
                 LS  = 4'h9,        // Unsigned lower
                                    // or same          / C clear or Z set
                 GE  = 4'ha,        // Signed greater 
                                    // than or equal    / N == V
                 LT  = 4'hb,        // Signed less than / N != V
                 GT  = 4'hc,        // Signed greater
                                    // than             / Z == 0, N == V
                 LE  = 4'hd,        // Signed less than
                                    // or equal         / Z == 1, N != V
                 AL  = 4'he,        // Always
                 NV  = 4'hf;        // Never
 
// Any instruction with a condition field of 0b1111 is UNPREDICTABLE.                
 
// Shift Types
localparam [1:0] LSL = 2'h0,
                 LSR = 2'h1,
                 ASR = 2'h2,
                 RRX = 2'h3,
                 ROR = 2'h3; 
 
// Modes
localparam [1:0] SVC  =  2'b11,  // Supervisor
                 IRQ  =  2'b10,  // Interrupt
                 FIRQ =  2'b01,  // Fast Interrupt
                 USR  =  2'b00;  // User
 
// One-Hot Mode encodings
localparam [5:0] OH_USR  = 0,
                 OH_IRQ  = 1,
                 OH_FIRQ = 2,
                 OH_SVC  = 3;
 
 
// One-hot encoded
localparam       C_INIT   = 0,
                 C_CORE   = 1,
                 C_FILL   = 2,
                 C_INVA   = 3,
                 C_STATES = 4;
 
localparam [3:0] CS_INIT               = 4'd0,
                 CS_IDLE               = 4'd1,
                 CS_FILL               = 4'd2,
                 CS_FILL_COMPLETE      = 4'd3,
                 CS_TURN_AROUND        = 4'd4,
                 CS_WRITE_HIT          = 4'd5,
                 CS_WRITE_HIT_WAIT_WB  = 4'd6,
                 CS_WRITE_MISS_WAIT_WB = 4'd7,
                 CS_EX_DELETE          = 4'd8;
 
 
reg  [3:0]                  c_state    = CS_IDLE;
//reg  [C_STATES-1:0]         source_sel = 4'd1 << C_CORE;
reg  [C_STATES-1:0]         source_sel = 4'b10;
reg  [CACHE_ADDR_WIDTH:0]   init_count = 9'd0;
 
wire [TAG_WIDTH-1:0]        tag_rdata_way0;
wire [TAG_WIDTH-1:0]        tag_rdata_way1;
wire [TAG_WIDTH-1:0]        tag_rdata_way2;
wire [TAG_WIDTH-1:0]        tag_rdata_way3;
wire [CACHE_LINE_WIDTH-1:0] data_rdata_way0;
wire [CACHE_LINE_WIDTH-1:0] data_rdata_way1;
wire [CACHE_LINE_WIDTH-1:0] data_rdata_way2;
wire [CACHE_LINE_WIDTH-1:0] data_rdata_way3;
wire [WAYS-1:0]             data_wenable_way;
wire [WAYS-1:0]             data_hit_way;
reg  [WAYS-1:0]             data_hit_way_r = 4'd0;
wire [WAYS-1:0]             tag_wenable_way;
reg  [WAYS-1:0]             select_way = 4'd0;
wire [WAYS-1:0]             next_way;
reg  [WAYS-1:0]             valid_bits_r = 4'd0;
 
reg  [3:0]                  random_num = 4'hf;
 
wire [CACHE_ADDR_WIDTH-1:0] tag_address;
wire [TAG_WIDTH-1:0]        tag_wdata;
wire                        tag_wenable;
 
wire [CACHE_LINE_WIDTH-1:0] read_miss_wdata;
wire [CACHE_LINE_WIDTH-1:0] write_hit_wdata;
reg  [CACHE_LINE_WIDTH-1:0] data_wdata_r = 128'd0;
wire [CACHE_LINE_WIDTH-1:0] consecutive_write_wdata;
wire [CACHE_LINE_WIDTH-1:0] data_wdata;
wire [CACHE_ADDR_WIDTH-1:0] data_address;
wire [31:0]                 write_data_word;
 
wire                        idle_hit;
wire                        read_miss;
wire                        write_miss;
wire                        write_hit;
wire                        consecutive_write;
wire                        fill_state;
 
reg  [31:0]                 miss_address = 32'd0;
wire [CACHE_LINE_WIDTH-1:0] hit_rdata;
 
wire                        read_stall;
wire                        write_stall;
wire                        cache_busy_stall;
wire                        core_stall;
wire                        write_state;
 
wire                        request_pulse;
wire                        request_hold;
reg                         request_r = 1'd0;
wire [CACHE_ADDR_WIDTH-1:0] address;
reg  [CACHE_LINE_WIDTH-1:0] wb_rdata_burst = 128'd0;
 
wire                        exclusive_access;
wire                        ex_read_hit;
reg                         ex_read_hit_r = 1'd0;
reg  [WAYS-1:0]             ex_read_hit_way = 4'd0;
reg  [CACHE_ADDR_WIDTH-1:0] ex_read_address;
wire                        ex_read_hit_clear;
wire                        ex_read_cache_busy;
 
reg  [31:0]                 wb_address = 32'd0;
//wire                        rbuf_hit = 1'd0;
wire                        wb_hit;
wire [127:0]                read_data128;
//genvar                      i;

 
// ======================================
// Address to use for cache access
// ======================================
// If currently stalled then the address for the next
// cycle will be the same as it is in the current cycle
//
assign core_stall = i_fetch_stall || i_exec_stall || o_stall;
 
assign address = core_stall ? i_address    [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                              i_address_nxt[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] ;
 
// ======================================
// Outputs
// ======================================
 
assign read_data128 = wb_hit ? i_wb_cached_rdata : hit_rdata;
 
assign o_read_data  = i_address[WORD_SEL_MSB:WORD_SEL_LSB] == 2'd0 ? read_data128 [31:0]   :
                      i_address[WORD_SEL_MSB:WORD_SEL_LSB] == 2'd1 ? read_data128 [63:32]  :
                      i_address[WORD_SEL_MSB:WORD_SEL_LSB] == 2'd2 ? read_data128 [95:64]  :
                                                                     read_data128 [127:96] ;
 
// Don't allow the cache to stall the wb i/f for an exclusive access
// The cache needs a couple of cycles to flush a potential copy of the exclusive
// address, but the wb can do the access in parallel. So there is no
// stall in the state CS_EX_DELETE, even though the cache is out of action. 
// This works fine as long as the wb is stalling the core
assign o_stall         = request_hold && ( read_stall || write_stall || cache_busy_stall || ex_read_cache_busy );
 
assign o_wb_cached_req = ( (read_miss || write_miss || write_hit) && c_state == CS_IDLE ) || consecutive_write;
 
 
// ======================================
// Cache State Machine
// ======================================
 
// Little State Machine to Flush Tag RAMS
always @ ( posedge i_clk )
    if ( i_cache_flush )
        begin
        c_state     <= CS_INIT;
        source_sel  <= 4'b1;  //1'd1 << C_INIT
        init_count  <= 9'd0;
        `ifdef A25_CACHE_DEBUG  
        `TB_DEBUG_MESSAGE  
        $display("Cache Flush");
        `endif            
        end
    else    
        case ( c_state )
            CS_INIT :
                if ( init_count < CACHE_LINES )
                    begin
                    init_count  <= init_count + 1'd1;
   		    source_sel  <= 4'b1;  //1'd1 << C_INIT
                    end
                else
                    begin
                    source_sel  <= 4'b10;  //1'd1 << C_CORE
                    c_state     <= CS_TURN_AROUND;
                    end 
 
             CS_IDLE :
                begin
	        if ( ex_read_hit || ex_read_hit_r )
		            begin
		            select_way  <= data_hit_way | ex_read_hit_way;
		            c_state     <= CS_EX_DELETE;        
		            source_sel  <= 4'b1000;   //1'd1 << C_INVA
		            end
		        else if ( read_miss ) 
			begin
		            c_state <= CS_FILL; 
            		source_sel  <= 4'b10;  //1'd1 << C_CORE
			end
		        else if ( write_hit )
		            begin
            			source_sel  <= 4'b10;  //1'd1 << C_CORE
		            if ( i_wb_cached_ready )
		                c_state <= CS_WRITE_HIT;  
      
		            else    
		                c_state <= CS_WRITE_HIT_WAIT_WB;        
		            end    
		        else if ( write_miss && !i_wb_cached_ready )
			begin
            			source_sel  <= 4'b10;  //1'd1 << C_CORE
		                c_state <= CS_WRITE_MISS_WAIT_WB;        
			end
                end
 
 
             CS_FILL :
                // third read of burst of 4
                // wb read request asserted, wait for ack
                if ( i_wb_cached_ready ) 
                    begin
                    c_state     <= CS_FILL_COMPLETE;
                    source_sel  <= 4'b100;   //1'd1 << C_FILL
 
                    // Pick a way to write the cache update into
                    // Either pick one of the invalid caches, or if all are valid, then pick
                    // one randomly
 
                    select_way  <= next_way; 
                    random_num  <= {random_num[2], random_num[1], random_num[0], 
                                     random_num[3]^random_num[2]};
                    end
 
 
             // Write the read fetch data in this cycle
             CS_FILL_COMPLETE : 
                begin
                // Back to normal cache operations, but
                // use physical address for first read as
                // address moved before the stall was asserted for the read_miss
                // However don't use it if its a non-cached address!
                source_sel  <= 4'b10;  //1'd1 << C_CORE          
                c_state     <= CS_TURN_AROUND;    
                end                                 
 
 
             // Ignore the tag read data in this cycle   
             // Wait 1 cycle to pre-read the cache and return to normal operation                 
             CS_TURN_AROUND : 
                begin
                c_state     <= CS_IDLE;
                end
 
 
             // Flush the entry matching an exclusive access         
             CS_EX_DELETE:       
                begin
                `ifdef A25_CACHE_DEBUG    
                `TB_DEBUG_MESSAGE
                $display("Cache deleted Locked entry");
                `endif    
                c_state    <= CS_TURN_AROUND;
                source_sel  <= 4'b10;  //1'd1 << C_CORE 
                end
 
 
             CS_WRITE_HIT:
                if ( !consecutive_write )           
                    c_state     <= CS_IDLE;
 
 
             CS_WRITE_HIT_WAIT_WB:
                // wait for an ack on the wb bus to complete the write
                if ( i_wb_cached_ready ) 
                    c_state     <= CS_IDLE;
 
 
             CS_WRITE_MISS_WAIT_WB:
                // wait for an ack on the wb bus to complete the write
                if ( i_wb_cached_ready ) 
                    c_state     <= CS_IDLE;
 
        endcase                       
 
 
// ======================================
// Capture WB Block Read - burst of 4 words
// ======================================
always @ ( posedge i_clk )
    if ( i_wb_cached_ready )
        wb_rdata_burst <= i_wb_cached_rdata;
 
 
 
// ======================================
// Miss Address
// ======================================
always @ ( posedge i_clk )
    if ( o_wb_cached_req || write_hit )
        miss_address <= i_address;
 
always @ ( posedge i_clk )
    if ( write_hit )
        begin
        data_hit_way_r      <= data_hit_way;
        end
 
always @ ( posedge i_clk )
    if ( write_hit || consecutive_write )
        begin
        data_wdata_r   <= data_wdata;
        end
 
assign consecutive_write = miss_address[31:4] == i_address[31:4] && 
                           i_write_enable && 
                           c_state == CS_WRITE_HIT && 
                           request_pulse;
 
 
always @(posedge i_clk)
    if ( o_wb_cached_req )
        wb_address <= i_address;
    else if ( i_wb_cached_ready && fill_state )    
        wb_address <= {wb_address[31:4], wb_address[3:2] + 1'd1, 2'd0};
 
assign fill_state       = c_state == CS_FILL ;
assign wb_hit           = i_address == wb_address && i_wb_cached_ready && fill_state;
 
 
// ======================================
// Hold Requests
// ======================================
always @(posedge i_clk)
    request_r <= (request_pulse || request_r) && o_stall;
 
assign request_hold = request_pulse || request_r;
 
 
// ======================================
// Remember Read-Modify-Write Hit
// ======================================
assign ex_read_hit_clear = c_state == CS_EX_DELETE;
 
always @ ( posedge i_clk )
    if ( ex_read_hit_clear )
        begin
        ex_read_hit_r   <= 1'd0;
        ex_read_hit_way <= 4'd0;
        end
    else if ( ex_read_hit )
        begin
 
        `ifdef A25_CACHE_DEBUG
            `TB_DEBUG_MESSAGE
            $display ("Exclusive access cache hit address 0x%08h", i_address);
        `endif
 
        ex_read_hit_r   <= 1'd1;
        ex_read_hit_way <= data_hit_way;
        end
    else if ( c_state == CS_FILL_COMPLETE && ex_read_hit_r )
        ex_read_hit_way <= select_way;
 
 
always @ (posedge i_clk)
    if ( ex_read_hit )
        ex_read_address <= i_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB];
 
 
assign tag_address      = source_sel[C_FILL] ? miss_address      [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_INVA] ? ex_read_address                                       :
                          source_sel[C_INIT] ? init_count[CACHE_ADDR_WIDTH-1:0]                      :
                          source_sel[C_CORE] ? address                                               :
                                               {CACHE_ADDR_WIDTH{1'd0}}                              ;
 
 
assign data_address     = consecutive_write  ? miss_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] : 
                          write_hit          ? i_address   [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_FILL] ? miss_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] : 
                          source_sel[C_CORE] ? address                                         :
                                               {CACHE_ADDR_WIDTH{1'd0}}                        ;
 
 
assign tag_wdata        = source_sel[C_FILL] ? {1'd1, miss_address[31:12]} :  // [31:TAG_ADDR32_LSB]
                                               {TAG_WIDTH{1'd0}}                       ;
 
 
    // Data comes in off the WB bus in wrap4 with the missed data word first
assign data_wdata       = write_hit && c_state == CS_IDLE ? write_hit_wdata : 
                          consecutive_write               ? consecutive_write_wdata :
                                                            read_miss_wdata ;
 
assign read_miss_wdata  = wb_rdata_burst;
 
 
assign write_hit_wdata  = i_address[3:2] == 2'd0 ? {hit_rdata[127:32], write_data_word                   } :
                          i_address[3:2] == 2'd1 ? {hit_rdata[127:64], write_data_word, hit_rdata[31:0]  } :
                          i_address[3:2] == 2'd2 ? {hit_rdata[127:96], write_data_word, hit_rdata[63:0]  } :
                                                   {                   write_data_word, hit_rdata[95:0]  } ;
wire [31:0] con_read_data_word;
wire [31:0] con_write_data_word;
 
assign consecutive_write_wdata = 
                          i_address[3:2] == 2'd0 ? {data_wdata_r[127:32], con_write_data_word                           } :
                          i_address[3:2] == 2'd1 ? {data_wdata_r[127:64], con_write_data_word, data_wdata_r[31:0]  } :
                          i_address[3:2] == 2'd2 ? {data_wdata_r[127:96], con_write_data_word, data_wdata_r[63:0]  } :
                                                   {                      con_write_data_word, data_wdata_r[95:0]  } ;
assign con_read_data_word = 
                          i_address[3:2] == 2'd0 ? data_wdata_r[ 31:  0] :
                          i_address[3:2] == 2'd1 ? data_wdata_r[ 63: 32] : 
                          i_address[3:2] == 2'd2 ? data_wdata_r[ 95: 64] : 
                                                   data_wdata_r[127: 96] ;
 
 
assign con_write_data_word  = 
                          i_byte_enable == 4'b0001 ? { con_read_data_word[31: 8], i_write_data[ 7: 0]                          } :
                          i_byte_enable == 4'b0010 ? { con_read_data_word[31:16], i_write_data[15: 8], con_read_data_word[ 7:0]} :
                          i_byte_enable == 4'b0100 ? { con_read_data_word[31:24], i_write_data[23:16], con_read_data_word[15:0]} :
                          i_byte_enable == 4'b1000 ? {                            i_write_data[31:24], con_read_data_word[23:0]} :
                          i_byte_enable == 4'b0011 ? { con_read_data_word[31:16], i_write_data[15: 0]                          } :
                          i_byte_enable == 4'b1100 ? {                            i_write_data[31:16], con_read_data_word[15:0]} :
                                                                   i_write_data                                                  ;
 
 
 
 
// Use Byte Enables
assign write_data_word  = i_byte_enable == 4'b0001 ? { o_read_data[31: 8], i_write_data[ 7: 0]                   } :
                          i_byte_enable == 4'b0010 ? { o_read_data[31:16], i_write_data[15: 8], o_read_data[ 7:0]} :
                          i_byte_enable == 4'b0100 ? { o_read_data[31:24], i_write_data[23:16], o_read_data[15:0]} :
                          i_byte_enable == 4'b1000 ? {                     i_write_data[31:24], o_read_data[23:0]} :
                          i_byte_enable == 4'b0011 ? { o_read_data[31:16], i_write_data[15: 0]                   } :
                          i_byte_enable == 4'b1100 ? {                     i_write_data[31:16], o_read_data[15:0]} :
                                                     i_write_data                                                  ;
 
 
assign tag_wenable      = source_sel[C_INVA] ? 1'd1  :
                          source_sel[C_FILL] ? 1'd1  :
                          source_sel[C_INIT] ? 1'd1  :
                          source_sel[C_CORE] ? 1'd0  :
                                               1'd0  ;
 
 
assign request_pulse    = i_request && i_cache_enable;
 
assign exclusive_access = i_exclusive && i_cache_enable;
 
 
//always@(posedge i_clk)
//	idle_hit <= |data_hit_way;

assign idle_hit         = |data_hit_way;
 
assign write_hit        = request_hold &&  i_write_enable && idle_hit;
 
assign write_miss       = request_hold &&  i_write_enable && !idle_hit && !consecutive_write;
 
assign read_miss        = request_hold && !idle_hit && !i_write_enable;
 
                          // Exclusive read idle_hit
assign ex_read_hit      = exclusive_access && !i_write_enable && idle_hit;
 
                          // Added to fix rare swap bug which occurs when the cache starts
                          // a fill just as the swap instruction starts to execute. The cache
                          // fails to check for a read idle_hit on the swap read cycle.
                          // This signal stalls the core in that case until after the
                          // fill has completed.
assign ex_read_cache_busy = exclusive_access && !i_write_enable && c_state != CS_IDLE;
 
                          // Need to stall for a write miss to wait for the current wb 
                          // read miss access to complete. Also for a write idle_hit, need 
                          // to stall for 1 cycle while the data cache is being written to
assign write_state      = c_state == CS_IDLE || c_state == CS_WRITE_HIT ||  
                          c_state == CS_WRITE_HIT_WAIT_WB ||  c_state == CS_WRITE_MISS_WAIT_WB;
 
assign write_stall      = (write_miss && !(i_wb_cached_ready && write_state)) || (write_hit && !i_wb_cached_ready);
 
//assign read_stall       = request_hold && !idle_hit && !rbuf_hit && !wb_hit && !i_write_enable;

assign read_stall       = request_hold && !idle_hit && !wb_hit && !i_write_enable;
 
assign cache_busy_stall = c_state == CS_FILL_COMPLETE || c_state == CS_TURN_AROUND || c_state == CS_INIT ||
//                          (fill_state && !rbuf_hit && !wb_hit) ||
                          (fill_state && !wb_hit) ||
                          (c_state == CS_WRITE_HIT && !consecutive_write);
 
 
// ======================================
// Instantiate RAMS
// ======================================
 
//generate
//    for ( i=0; i<WAYS;i=i+1 ) begin : rams
 
        // Tag RAMs 
//        `ifdef XILINX_SPARTAN6_FPGA
//        xs6_sram_256x21_line_en
//        `endif
 
//        `ifdef XILINX_VIRTEX6_FPGA
//        xv6_sram_256x21_line_en
//        `endif
 
//        `ifndef XILINX_FPGA
//        generic_sram_line_en 
//        `endif
 
//            #(
//            .DATA_WIDTH                 ( TAG_WIDTH             ),
//            .INITIALIZE_TO_ZERO         ( 1                     ),
//            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))
        single_port_ram_21_8 u_tag0 (
            .clk                    ( i_clk                 ),
            .data                   ( tag_wdata             ),
            .we                     ( tag_wenable_way[0]    ),
            .addr                   ( tag_address           ),
            .out                    ( tag_rdata_way0      )
            );
 
        // Data RAMs 
//        `ifdef XILINX_SPARTAN6_FPGA
//        xs6_sram_256x128_byte_en
//        `endif
 
//       `ifdef XILINX_VIRTEX6_FPGA
//       xv6_sram_256x128_byte_en
//        `endif
 
//        `ifndef XILINX_FPGA
//        generic_sram_byte_en0
//        `endif
 
//            #(
//            .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
//            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
        single_port_ram_128_8 u_data0 (
            .clk                      ( i_clk                         ),
            .data                     ( data_wdata                    ),
            .we                       ( data_wenable_way[0]           ),
            .addr                     ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                      ( data_rdata_way0             )
            );                                                     
 
 
        // Per tag-ram write-enable
        assign tag_wenable_way[0]  = tag_wenable && ( select_way[0] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[0] = (source_sel[C_FILL] && select_way[0]) || 
                                     (write_hit && data_hit_way[0] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[0]);
        // Per data-ram idle_hit flag
        assign data_hit_way[0]     = tag_rdata_way0[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way0[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;   



 	 single_port_ram_21_8 u_tag1 (
        	.clk                    ( i_clk                 ),
         	.data                   ( tag_wdata             ),
        	.we                     ( tag_wenable_way[1]    ),
        	.addr                   ( tag_address           ),
       		.out                    ( tag_rdata_way1      )
      		);

  
        single_port_ram_128_8 u_data1 (
            .clk                      ( i_clk                         ),
            .data                     ( data_wdata                    ),
            .we                       ( data_wenable_way[1]           ),
            .addr                     ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                      ( data_rdata_way1             )
            );          

        // Per tag-ram write-enable
        assign tag_wenable_way[1]  = tag_wenable && ( select_way[1] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[1] = (source_sel[C_FILL] && select_way[1]) || 
                                     (write_hit && data_hit_way[1] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[1]);
        // Per data-ram idle_hit flag
        assign data_hit_way[1]     = tag_rdata_way1[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way1[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;             


  single_port_ram_21_8 u_tag2 (
            .clk                    ( i_clk                 ),
            .data                   ( tag_wdata             ),
            .we                     ( tag_wenable_way[2]    ),
            .addr                   ( tag_address           ),
            .out                    ( tag_rdata_way2      )
            );

  
        single_port_ram_128_8 u_data2 (
            .clk                      ( i_clk                         ),
            .data                     ( data_wdata                    ),
            .we                       ( data_wenable_way[2]           ),
            .addr                     ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                      ( data_rdata_way2             )
            );          

        // Per tag-ram write-enable
        assign tag_wenable_way[2]  = tag_wenable && ( select_way[2] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[2] = (source_sel[C_FILL] && select_way[2]) || 
                                     (write_hit && data_hit_way[2] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[2]);
        // Per data-ram idle_hit flag
        assign data_hit_way[2]     = tag_rdata_way2[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way2[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE; 


  single_port_ram_21_8 u_tag3 (
            .clk                    ( i_clk                 ),
            .data                   ( tag_wdata             ),
            .we                     ( tag_wenable_way[3]    ),
            .addr                   ( tag_address           ),
            .out                    ( tag_rdata_way3      )
            );

  
        single_port_ram_128_8 u_data3 (
            .clk                      ( i_clk                         ),
            .data                     ( data_wdata                    ),
            .we                       ( data_wenable_way[3]           ),
            .addr                     ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                      ( data_rdata_way3             )
            );          

        // Per tag-ram write-enable
        assign tag_wenable_way[3]  = tag_wenable && ( select_way[3] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[3] = (source_sel[C_FILL] && select_way[3]) || 
                                     (write_hit && data_hit_way[3] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[3]);
        // Per data-ram idle_hit flag
        assign data_hit_way[3]     = tag_rdata_way3[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way3[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE; 
                                      
//    end                                                         
//endgenerate
 
 
// ======================================
// Register Valid Bits
// ======================================
//generate
//if ( WAYS == 2 ) begin : valid_bits_2ways
 
//    always @ ( posedge i_clk )
//        if ( c_state == CS_IDLE )
//            valid_bits_r <= {tag_rdata_way[1][TAG_WIDTH-1], 
//                             tag_rdata_way[0][TAG_WIDTH-1]};
 
//end
//else if ( WAYS == 3 ) begin : valid_bits_3ways
 
//    always @ ( posedge i_clk )
//      if ( c_state == CS_IDLE )
//            valid_bits_r <= {tag_rdata_way[2][TAG_WIDTH-1], 
//                             tag_rdata_way[1][TAG_WIDTH-1], 
//                             tag_rdata_way[0][TAG_WIDTH-1]};
 
//end
//else if ( WAYS == 4 ) begin : valid_bits_4ways
 
    always @ ( posedge i_clk )
        if ( c_state == CS_IDLE )

            valid_bits_r <= {tag_rdata_way3[TAG_WIDTH-1], 
                             tag_rdata_way2[TAG_WIDTH-1], 
                             tag_rdata_way1[TAG_WIDTH-1], 
                             tag_rdata_way0[TAG_WIDTH-1]};
 
//end
//else begin : valid_bits_8ways
 
//    always @ ( posedge i_clk )
//        if ( c_state == CS_IDLE )
//            valid_bits_r <= {tag_rdata_way[7][TAG_WIDTH-1], 
//                             tag_rdata_way[6][TAG_WIDTH-1], 
//                             tag_rdata_way[5][TAG_WIDTH-1], 
//                             tag_rdata_way[4][TAG_WIDTH-1], 
//                             tag_rdata_way[3][TAG_WIDTH-1], 
//                             tag_rdata_way[2][TAG_WIDTH-1], 
//                            tag_rdata_way[1][TAG_WIDTH-1], 
//                             tag_rdata_way[0][TAG_WIDTH-1]};
 
//end
//endgenerate
 
 
// ======================================
// Select read idle_hit data
// ======================================
 
//generate
//if ( WAYS == 2 ) begin : read_data_2ways
 
//    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
//                          data_hit_way[1] ? data_rdata_way[1] :
//                                     {CACHE_LINE_WIDTH{1'd1}} ;  // all 1's for debug
 
//end
//else if ( WAYS == 3 ) begin : read_data_3ways
 
//    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
//                          data_hit_way[1] ? data_rdata_way[1] :
//                          data_hit_way[2] ? data_rdata_way[2] :
//                                     {CACHE_LINE_WIDTH{1'd1}} ;  // all 1's for debug
 
//end
//else if ( WAYS == 4 ) begin : read_data_4ways
 
    assign hit_rdata    = data_hit_way[0] ? data_rdata_way0 :
                          data_hit_way[1] ? data_rdata_way1 :
                          data_hit_way[2] ? data_rdata_way2 :
                          data_hit_way[3] ? data_rdata_way3 :
			128'hffffffffffffffffffffffffffffffff;
                                 //    {CACHE_LINE_WIDTH{1'd1}} ;  // all 1's for debug
 
//end
//else begin : read_data_8ways
 
//    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
//                          data_hit_way[1] ? data_rdata_way[1] :
//                          data_hit_way[2] ? data_rdata_way[2] :
//                          data_hit_way[3] ? data_rdata_way[3] :
//                         data_hit_way[4] ? data_rdata_way[4] :
//                          data_hit_way[5] ? data_rdata_way[5] :
//                          data_hit_way[6] ? data_rdata_way[6] :
//                          data_hit_way[7] ? data_rdata_way[7] :
//                                     {CACHE_LINE_WIDTH{1'd1}} ;  // all 1's for debug
 
//end
//endgenerate
 
 
// ======================================
// Function to select the way to use
// for fills
// ======================================
//generate
//if ( WAYS == 2 ) begin : pick_way_2ways
 
 //   assign next_way = pick_way ( valid_bits_r, random_num );
 
//    function [WAYS-1:0] pick_way;
 //   input [WAYS-1:0] valid_bits;
//    input [3:0]      random_num;
 //   begin
 //       if (      valid_bits[0] == 1'd0 )
            // way 0 not occupied so use it
//            pick_way     = 2'b01;
//        else if ( valid_bits[1] == 1'd0 )
            // way 1 not occupied so use it
//            pick_way     = 2'b10;
//        else
//            begin
            // All ways occupied so pick one randomly
//            case (random_num[3:1])
//                3'd0, 3'd3,
//                3'd5, 3'd6: pick_way = 2'b10;
//                default:    pick_way = 2'b01;
//            endcase
//            end
//   end
//    endfunction
 
//end
//else if ( WAYS == 3 ) begin : pick_way_3ways
 
//    assign next_way = pick_way ( valid_bits_r, random_num );
 
//    function [WAYS-1:0] pick_way;
//    input [WAYS-1:0] valid_bits;
//    input [3:0]      random_num;
//    begin
//        if (      valid_bits[0] == 1'd0 )
 //           // way 0 not occupied so use it
//            pick_way     = 3'b001;
//        else if ( valid_bits[1] == 1'd0 )
//            // way 1 not occupied so use it
//            pick_way     = 3'b010;
//        else if ( valid_bits[2] == 1'd0 )
            // way 2 not occupied so use it
//            pick_way     = 3'b100;
//        else
 //           begin
            // All ways occupied so pick one randomly
 //           case (random_num[3:1])
 //               3'd0, 3'd1, 3'd2: pick_way = 3'b010;
 //               3'd2, 3'd3, 3'd4: pick_way = 3'b100;
 //               default:          pick_way = 3'b001;
//            endcase
//            end
//    end
//    endfunction
 
//end
//else if ( WAYS == 4 ) begin : pick_way_4ways
 
//    assign next_way = pick_way ( valid_bits_r, random_num );
 
assign next_way   = 	valid_bits_r[0] == 1'd0 ? 4'b0001:
			valid_bits_r[1] == 1'd0 ? 4'b0010:
			valid_bits_r[2] == 1'd0 ? 4'b0100:
			valid_bits_r[3] == 1'd0 ? 4'b1000:
						  (
						    random_num[3:1] == 3'd0 ? 4'b0100:
						    random_num[3:1] == 3'd1 ? 4'b0100:
						    random_num[3:1] == 3'd2 ? 4'b1000:
						    random_num[3:1] == 3'd3 ? 4'b1000:
						    random_num[3:1] == 3'd4 ? 4'b0001:
						    random_num[3:1] == 3'd5 ? 4'b0001:
						    			      4'b0010
							);

//    function [WAYS-1:0] pick_way;
//   input [WAYS-1:0] valid_bits;
//   input [3:0]      random_num;
//    begin
//        if (      valid_bits[0] == 1'd0 )
//            // way 0 not occupied so use it
//            pick_way     = 4'b0001;
//        else if ( valid_bits[1] == 1'd0 )
//            // way 1 not occupied so use it
//            pick_way     = 4'b0010;
//        else if ( valid_bits[2] == 1'd0 )
 //           // way 2 not occupied so use it
//            pick_way     = 4'b0100;
//        else if ( valid_bits[3] == 1'd0 )
//            // way 3 not occupied so use it
//            pick_way     = 4'b1000;
 //       else
//            begin
            // All ways occupied so pick one randomly
//            case (random_num[3:1])
//                3'd0, 3'd1: pick_way = 4'b0100;
//                3'd2, 3'd3: pick_way = 4'b1000;
//                3'd4, 3'd5: pick_way = 4'b0001;
//                default:    pick_way = 4'b0010;
//           endcase
//            end
//    end
//    endfunction
 
//end
//else begin : pick_way_8ways
 
//    assign next_way = pick_way ( valid_bits_r, random_num );
 
//    function [WAYS-1:0] pick_way;
//    input [WAYS-1:0] valid_bits;CACHE_LINE_WIDTH
//    input [3:0]      random_num;
 //   begin
 //       if (      valid_bits[0] == 1'd0 )
            // way 0 not occupied so use it
//            pick_way     = 8'b00000001;
//        else if ( valid_bits[1] == 1'd0 )
            // way 1 not occupied so use it
//            pick_way     = 8'b00000010;
//        else if ( valid_bits[2] == 1'd0 )
            // way 2 not occupied so use it
//            pick_way     = 8'b00000100;
//        else if ( valid_bits[3] == 1'd0 )
            // way 3 not occupied so use it
//            pick_way     = 8'b00001000;
//        else if ( valid_bits[4] == 1'd0 )
            // way 3 not occupied so use it
//            pick_way     = 8'b00010000;
//        else if ( valid_bits[5] == 1'd0 )
            // way 3 not occupied so use it
//            pick_way     = 8'b00100000;
//        else if ( valid_bits[6] == 1'd0 )
            // way 3 not occupied so use it
//            pick_way     = 8'b01000000;
//        else if ( valid_bits[7] == 1'd0 )
            // way 3 not occupied so use it
//            pick_way     = 8'b10000000;
//        else
 //           begin
            // All ways occupied so pick one randomly
//            case (random_num[3:1])
//                3'd0:       pick_way = 8'b00010000;
//               3'd1:       pick_way = 8'b00100000;
//                3'd2:       pick_way = 8'b01000000;
//                3'd3:       pick_way = 8'b10000000;
//                3'd4:       pick_way = 8'b00000001;
//               3'd5:       pick_way = 8'b00000010;
//                3'd6:       pick_way = 8'b00000100;
//                default:    pick_way = 8'b00001000;
//            endcase
//            end
//    end
//   endfunction
 
//end
//endgenerate

 
// ========================================================
// Debug WB bus - not synthesizable
// ========================================================
//synopsys translate_off
//wire    [(6*8)-1:0]     xSOURCE_SEL;
//wire    [(22*8)-1:0]    xC_STATE;
// 
//assign xSOURCE_SEL = source_sel[C_CORE]               ? "C_CORE"                :
//                     source_sel[C_INIT]               ? "C_INIT"                :
//                     source_sel[C_FILL]               ? "C_FILL"                :
//							"C_INVA"                ;
// 
//assign xC_STATE    = c_state == CS_INIT               ? "CS_INIT"               :
//                     c_state == CS_IDLE               ? "CS_IDLE"               :
//                     c_state == CS_FILL               ? "CS_FILL"               :
//                     c_state == CS_FILL_COMPLETE      ? "CS_FILL_COMPLETE"      :
//                     c_state == CS_EX_DELETE          ? "CS_EX_DELETE"          :
//                     c_state == CS_TURN_AROUND        ? "CS_TURN_AROUND"        :
//                     c_state == CS_WRITE_HIT          ? "CS_WRITE_HIT"          :
//                     c_state == CS_WRITE_HIT_WAIT_WB  ? "CS_WRITE_HIT_WAIT_WB"  :
//							"CS_WRITE_MISS_WAIT_WB" ;
 
/* 
generate
if ( WAYS == 2 ) begin : check_hit_2ways
 
    always @( posedge i_clk )
        if ( (data_hit_way[0] + data_hit_way[1] ) > 4'd1 )
            begin
            `TB_ERROR_MESSAGE
            $display("Hit in more than one cache ways!");                                                  
            end
 
end
else if ( WAYS == 3 ) begin : check_hit_3ways
 
    always @( posedge i_clk )
        if ( (data_hit_way[0] + data_hit_way[1] + data_hit_way[2] ) > 4'd1 )
            begin
            `TB_ERROR_MESSAGE
            $display("Hit in more than one cache ways!");                                                  
            end
 
end
else if ( WAYS == 4 ) begin : check_hit_4ways
 
    always @( posedge i_clk )
        if ( (data_hit_way[0] + data_hit_way[1] + 
              data_hit_way[2] + data_hit_way[3] ) > 4'd1 )
            begin
            `TB_ERROR_MESSAGE
            $display("Hit in more than one cache ways!");                                                  
            end
 
end
else if ( WAYS == 8 )  begin : check_hit_8ways
 
    always @( posedge i_clk )
        if ( (data_hit_way[0] + data_hit_way[1] + 
              data_hit_way[2] + data_hit_way[3] +
              data_hit_way[4] + data_hit_way[5] +
              data_hit_way[6] + data_hit_way[7] ) > 4'd1 )
            begin
            `TB_ERROR_MESSAGE
            $display("Hit in more than one cache ways!");                                                  
            end
 
end
else begin : check_hit_nways
 
    initial
        begin
        ` 
        $display("Unsupported number of ways %0d", WAYS);
        $display("Set A25_DCACHE_WAYS in a25_config_defines.v to either 2,3,4 or 8");
        end
 
end
endgenerate
*/ 
 
//synopsys translate_on
 
endmodule
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
module single_port_ram_21_8(
			clk,
			data,
			we,
			addr, 
			out
			);
`define ADDR_WIDTH_21_8 8
`define DATA_WIDTH_21_8 21

    input 				clk;
    input	[`DATA_WIDTH_21_8-1:0] 	data;
    input 				we;
    input	[`ADDR_WIDTH_21_8-1:0] 	addr;

    
    output	[`DATA_WIDTH_21_8-1:0] 	out;
    reg		[`DATA_WIDTH_21_8-1:0] 	out;
     
    reg 	[`DATA_WIDTH_21_8-1:0] 	RAM[255:0];
     
    always @ (posedge clk) 
    begin 
        if (we) 
	begin
	RAM[addr] <= data;
        out <= RAM[addr]; 
	end
    end 
     
endmodule
