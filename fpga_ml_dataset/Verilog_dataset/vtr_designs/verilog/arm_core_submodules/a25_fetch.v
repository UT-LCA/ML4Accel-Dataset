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

module a25_fetch(
		i_clk,
		i_mem_stall,
		i_exec_stall,
		i_conflict,       
		o_fetch_stall,    
                                            
		i_system_rdy,   
 
		i_iaddress,
		i_iaddress_valid,
		i_iaddress_nxt,    
		o_fetch_instruction,
 
		i_cache_enable,
		i_cache_flush,     
		i_cacheable_area,  
 
		o_wb_req,
		o_wb_address,
		i_wb_read_data,
		i_wb_ready 
		);

input                       i_clk;
input                       i_mem_stall;
input                       i_exec_stall;
input                       i_conflict;         // Decode stage stall pipeline because of an instruction conflict
output                      o_fetch_stall;      // when this is asserted all registers 
                                                // in decode and exec stages are frozen
input                       i_system_rdy;       // External system can stall core with this signal
 
input       [31:0]          i_iaddress;
input                       i_iaddress_valid;
input       [31:0]          i_iaddress_nxt;     // un-registered version of address to the cache rams
output      [31:0]          o_fetch_instruction;
 
input                       i_cache_enable;     // cache enable
input                       i_cache_flush;      // cache flush
input       [31:0]          i_cacheable_area;   // each bit corresponds to 2MB address space
 
output                      o_wb_req;
//reg 			    o_wb_req; //jing+
output      [31:0]          o_wb_address;
input       [127:0]         i_wb_read_data;
input                       i_wb_ready;
 
wire                        core_stall;		//jing - add wire -> reg
reg                        cache_stall;		//jing- add wire -> reg
//reg                        o_fetch_stall;	//jing+
wire    [127:0]             cache_read_data128; 
wire    [31:0]              cache_read_data; 
wire                        sel_cache; 
wire                        uncached_instruction_read; 
wire                        address_cachable; 
wire                         icache_wb_req; 	
wire                        wait_wb; 
reg                         wb_req_r = 1'd0;
wire    [31:0]              wb_rdata32; 


 
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
 

assign address_cachable         = (
					 ( i_iaddress >= 32'h00000000  &&  i_iaddress < 32'h7fff) 
					|| ( 
						(i_iaddress >= MAIN_BASE  &&  i_iaddress < (MAIN_BASE   + 32'hfffffff)) 
							&& !( (i_iaddress >= BOOT_BASE && i_iaddress < (BOOT_BASE  + 32'h7fff))
											||(i_iaddress[31:14] == HIBOOT_BASE>>(14)))
					   )
				  )
				&& ((i_iaddress[25:21] == 5'b00000) ? i_cacheable_area[0] :
					(i_iaddress[25:21] == 5'b00001) ? i_cacheable_area[1] :
					(i_iaddress[25:21] == 5'b00010) ? i_cacheable_area[2] :
					(i_iaddress[25:21] == 5'b00011) ? i_cacheable_area[3] :
					(i_iaddress[25:21] == 5'b00100) ? i_cacheable_area[4] :
					(i_iaddress[25:21] == 5'b00101) ? i_cacheable_area[5] :
					(i_iaddress[25:21] == 5'b00110) ? i_cacheable_area[6] :
					(i_iaddress[25:21] == 5'b00111) ? i_cacheable_area[7] :
					(i_iaddress[25:21] == 5'b01000) ? i_cacheable_area[8] :
					(i_iaddress[25:21] == 5'b01001) ? i_cacheable_area[9] :
					(i_iaddress[25:21] == 5'b01010) ? i_cacheable_area[10] :
					(i_iaddress[25:21] == 5'b01011) ? i_cacheable_area[11] :
					(i_iaddress[25:21] == 5'b01100) ? i_cacheable_area[12] :
					(i_iaddress[25:21] == 5'b01101) ? i_cacheable_area[13] :
					(i_iaddress[25:21] == 5'b01110) ? i_cacheable_area[14] :
					(i_iaddress[25:21] == 5'b01111) ? i_cacheable_area[15] :
					(i_iaddress[25:21] == 5'b10000) ? i_cacheable_area[16] :
					(i_iaddress[25:21] == 5'b10001) ? i_cacheable_area[17] :
					(i_iaddress[25:21] == 5'b10010) ? i_cacheable_area[18] :
					(i_iaddress[25:21] == 5'b10011) ? i_cacheable_area[19] :
					(i_iaddress[25:21] == 5'b10100) ? i_cacheable_area[20] :
					(i_iaddress[25:21] == 5'b10101) ? i_cacheable_area[21] :
					(i_iaddress[25:21] == 5'b10110) ? i_cacheable_area[22] :
					(i_iaddress[25:21] == 5'b10111) ? i_cacheable_area[23] :
					(i_iaddress[25:21] == 5'b11000) ? i_cacheable_area[24] :
					(i_iaddress[25:21] == 5'b11001) ? i_cacheable_area[25] :
					(i_iaddress[25:21] == 5'b11010) ? i_cacheable_area[26] :
					(i_iaddress[25:21] == 5'b11011) ? i_cacheable_area[27] :
					(i_iaddress[25:21] == 5'b11100) ? i_cacheable_area[28] :
					(i_iaddress[25:21] == 5'b11101) ? i_cacheable_area[29] :
					(i_iaddress[25:21] == 5'b11110) ? i_cacheable_area[30] :
					i_cacheable_area[31] );

//i_cacheable_area[i_iaddress[25:21]];
 
assign sel_cache         = address_cachable && i_iaddress_valid && i_cache_enable;
 
// Don't start wishbone transfers when the cache is stalling the core
// The cache stalls the core during its initialization sequence
assign uncached_instruction_read = !sel_cache && i_iaddress_valid && !cache_stall;
 
// Return read data either from the wishbone bus or the cache 
assign cache_read_data     = i_iaddress[3:2] == 2'd0    ? cache_read_data128[ 31: 0] :
                             i_iaddress[3:2] == 2'd1    ? cache_read_data128[ 63:32] :
                             i_iaddress[3:2] == 2'd2    ? cache_read_data128[ 95:64] :
                                                          cache_read_data128[127:96] ;
 
assign wb_rdata32 = i_iaddress[3:2] == 2'd0 ? i_wb_read_data[ 31: 0] :
                    i_iaddress[3:2] == 2'd1 ? i_wb_read_data[ 63:32] :
                    i_iaddress[3:2] == 2'd2 ? i_wb_read_data[ 95:64] :
                                              i_wb_read_data[127:96] ;
 
assign o_fetch_instruction = sel_cache                  ? cache_read_data : 
                             uncached_instruction_read  ? wb_rdata32      :
                                                          32'hffeeddcc    ;
 
// Stall the instruction decode and execute stages of the core
// when the fetch stage needs more than 1 cycle to return the requested
// read data

assign o_fetch_stall    = !i_system_rdy || wait_wb || cache_stall;
 
assign o_wb_address     = i_iaddress;
assign o_wb_req         = icache_wb_req || uncached_instruction_read;
 
assign wait_wb          = (o_wb_req || wb_req_r) && !i_wb_ready;
 
always @(posedge i_clk)
    wb_req_r <= o_wb_req && !i_wb_ready;
 
assign core_stall = o_fetch_stall || i_mem_stall || i_exec_stall || i_conflict;
 
// ======================================
// L1 Instruction Cache
// ======================================
a25_icache u_cache (
    .i_clk                      ( i_clk                 ),
    .i_core_stall               ( core_stall            ),
    .o_stall                    ( cache_stall           ),
 
    .i_select                   ( sel_cache             ),
    .i_address                  ( i_iaddress            ),
    .i_address_nxt              ( i_iaddress_nxt        ),
    .i_cache_enable             ( i_cache_enable        ),
    .i_cache_flush              ( i_cache_flush         ),
    .o_read_data                ( cache_read_data128    ),
 
    .o_wb_req                   ( icache_wb_req         ),
    .i_wb_read_data             ( i_wb_read_data        ),
    .i_wb_ready                 ( i_wb_ready            )
);
 
 
endmodule
module a25_icache 
 

 		(
		i_clk,
		i_core_stall,
		o_stall,
 
		i_select,
		i_address,     
		i_address_nxt,
		i_cache_enable, 
		i_cache_flush, 
  		o_read_data,                                                       
 
		o_wb_req,       
		i_wb_read_data,                 
		i_wb_ready
		);
 
 
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
 
 
 
`ifndef _A25_CONFIG_DEFINES
`define _A25_CONFIG_DEFINES
 

 
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4

`endif

parameter CACHE_LINES          = 256;  
 
// This cannot be changed without some major surgeory on
// this module                                       
parameter CACHE_WORDS_PER_LINE = 4;
 

parameter WAYS              = `A25_ICACHE_WAYS;
 

parameter CACHE_ADDR_WIDTH  = 8;                     // = 8
parameter WORD_SEL_WIDTH    = 2;               // = 2
parameter TAG_ADDR_WIDTH    = 20;  // = 20
parameter TAG_WIDTH         = 21;                          // = 21, including Valid flag
parameter CACHE_LINE_WIDTH  = 128;                  // = 128
parameter TAG_ADDR32_LSB    = 12;       // = 12
parameter CACHE_ADDR32_MSB  = 11;   // = 11
parameter CACHE_ADDR32_LSB  = 4;   // = 4
parameter WORD_SEL_MSB      = 3;                     // = 3
parameter WORD_SEL_LSB      = 2;                          // = 2
// ---------------------------------------------------------


input                               i_clk;
input                               i_core_stall;
output                              o_stall;
 
// Read / Write requests from core
input                               i_select;
input      [31:0]                   i_address;          // registered address from execute
input      [31:0]                   i_address_nxt;      // un-registered version of address from execute stage
input                               i_cache_enable;     // from co-processor 15 configuration register
input                               i_cache_flush;      // from co-processor 15 register
 
output     [127:0]                  o_read_data;                                                       
 
// WB Read Request                                                          
output                              o_wb_req;          // Read Request
input      [127:0]                  i_wb_read_data;                 
input                               i_wb_ready;


// One-hot encoded
localparam       C_INIT   = 0,
                 C_CORE   = 1,
                 C_FILL   = 2,
                 C_INVA   = 3,
                 C_STATES = 4;
 
localparam [3:0] CS_INIT            = 4'd0,
                 CS_IDLE            = 4'd1,
                 CS_FILL0           = 4'd2,
                 CS_FILL1           = 4'd3,
                 CS_FILL2           = 4'd4,
                 CS_FILL3           = 4'd5,
                 CS_FILL4           = 4'd6,
                 CS_FILL_COMPLETE   = 4'd7,
                 CS_TURN_AROUND     = 4'd8,
                 CS_WRITE_HIT1      = 4'd9,
                 CS_EX_DELETE       = 4'd10;
 
//reg                              o_wb_req; //jing+
//reg                              o_stall; //jing+
//reg     [127:0]                  o_read_data; //jing+                                                      

reg  [3:0]                  c_state    = 4'd1 ;   // c_state    = CS_IDLE
reg  [C_STATES-1:0]         source_sel = 4'b10;   //1'd1 << C_CORE 
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
wire [WAYS-1:0]             tag_wenable_way; 
reg  [WAYS-1:0]             select_way = 4'd0; 
wire [WAYS-1:0]             next_way; 
reg  [WAYS-1:0]             valid_bits_r = 4'd0;
 
reg  [3:0]                  random_num = 4'hf;
 
wire [CACHE_ADDR_WIDTH-1:0] tag_address; 
wire [TAG_WIDTH-1:0]        tag_wdata; 
wire                        tag_wenable; 
 
wire [CACHE_ADDR_WIDTH-1:0] data_address; 
wire [31:0]                 write_data_word; 
 
wire                        idle_hit; 
reg                        read_miss; //jing
wire                        read_miss_fill; 
wire                        invalid_read; 
wire                        fill_state; 
 
reg  [31:0]                 miss_address = 32'd0;
wire [CACHE_LINE_WIDTH-1:0] hit_rdata; 
 
wire                        cache_busy_stall; 
wire                        read_stall; 
 
wire                        enable; 
wire [CACHE_ADDR_WIDTH-1:0] address; 
wire [31:0]                 address_c; 
reg  [31:0]                 address_r = 32'd0;
 
reg  [31:0]                 wb_address = 32'd0;
wire                        wb_hit; //jing - add wire -> reg
wire                        read_buf_hit; //jing - add wire -> reg
reg  [127:0]                read_buf_data_r;
reg  [31:0]                 read_buf_addr_r;
reg                         read_buf_valid_r;
//genvar                      i;
 
// ======================================
// Address to use for cache access
// ======================================
// If currently stalled then the address for the next
// cycle will be the same as it is in the current cycle
//
assign address_c = i_core_stall ? i_address    : 
                                  i_address_nxt; 
 
assign address   = address_c[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB];
 
 
// ======================================
// Outputs
// ======================================
assign o_read_data      = wb_hit       ? i_wb_read_data  : 
                          read_buf_hit ? read_buf_data_r :
                                         hit_rdata ;
 
 
// Don't allow the cache to stall the wb i/f for an exclusive access
// The cache needs a couple of cycles to flush a potential copy of the exclusive
// address, but the wb can do the access in parallel. So there is no
// stall in the state CS_EX_DELETE, even though the cache is out of action. 
// This works fine as long as the wb is stalling the core
//assign o_stall          = read_stall  || cache_busy_stall;
always @ ( posedge i_clk ) 
	o_stall         <= read_stall  || cache_busy_stall;
 
assign o_wb_req         = read_miss && c_state == CS_IDLE;
 

// ======================================
// Read Buffer
// ======================================
always@(posedge i_clk)
    if ( i_cache_flush )
        read_buf_valid_r <= 1'd0;
    else if (i_wb_ready && c_state == CS_FILL3)
        begin
        read_buf_data_r  <= i_wb_read_data;
        read_buf_addr_r  <= miss_address;
        read_buf_valid_r <= 1'd1;
        end
    else if (o_wb_req)
        read_buf_valid_r <= 1'd0;
 
 
assign read_buf_hit     = read_buf_valid_r && i_address[31:4] == read_buf_addr_r[31:4];
 
// ======================================
// Cache State Machine
// ======================================
 
// Little State Machine to Flush Tag RAMS
always @ ( posedge i_clk )
    if ( i_cache_flush )
        begin
        c_state     <= CS_INIT;
        source_sel  <= 4'd1;  //1'd1 << C_INIT
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
                    source_sel  <= 4'b10;  //1'd1 << C_CORE
 
                if ( read_miss ) 
                    c_state <= CS_FILL3; 
               end
 
 
             CS_FILL3 :
                begin
                // Pick a way to write the cache update into
                // Either pick one of the invalid caches, or if all are valid, then pick
                // one randomly
                select_way  <= next_way; 
                random_num  <= {random_num[2], random_num[1], random_num[0], 
                                 random_num[3]^random_num[2]};
 
                // third read of burst of 4
                // wb read request asserted, wait for ack
                if ( i_wb_ready ) 
                    begin
                    c_state     <= CS_FILL_COMPLETE;
                    end
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
 
        endcase                       
 
 
// ======================================
// Miss Address
// ======================================
always @ ( posedge i_clk )
    if ( c_state == CS_IDLE )
        miss_address <= i_address;
 
 
always @ ( posedge i_clk )
    address_r <= address_c;
 
assign invalid_read = address_r != i_address;
 
 
always @(posedge i_clk)
    if ( o_wb_req )
        wb_address <= i_address;
    else if ( i_wb_ready && fill_state )    
        wb_address <= {wb_address[31:4], wb_address[3:2] + 1'd1, 2'd0};
 
assign fill_state       = c_state == CS_FILL3;
assign wb_hit           = i_address == wb_address && i_wb_ready && fill_state;
 
assign tag_address      = read_miss_fill     ? miss_address      [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_INIT] ? init_count[CACHE_ADDR_WIDTH-1:0]                      :
                                               address                                               ;
 
 
assign data_address     = read_miss_fill     ? miss_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] : 
                                               address                                         ;
 
 
assign tag_wdata        = read_miss_fill     ? {1'd1, miss_address[31:12]} :     //  [31:TAG_ADDR32_LSB]
                                               21'd0                       ;   //   {TAG_WIDTH{1'd0}}   TAG_WIDTH =21
 
 
assign read_miss_fill   = c_state == CS_FILL3 && i_wb_ready;
 
 
 
assign tag_wenable      = read_miss_fill     ? 1'd1  :
                          source_sel[C_INVA] ? 1'd1  :
                          source_sel[C_FILL] ? 1'd1  :
                          source_sel[C_INIT] ? 1'd1  :
                          source_sel[C_CORE] ? 1'd0  :
                                               1'd0  ;
 
 
assign enable           = i_select && i_cache_enable;
 
assign idle_hit         = |data_hit_way;
 
assign read_miss        = enable && !idle_hit && !invalid_read;
 
assign read_stall       = (i_select && i_cache_enable) && !(|data_hit_way) && !wb_hit && !read_buf_hit;
//assign read_stall       = enable && !idle_hit && !wb_hit && !read_buf_hit;
 
assign cache_busy_stall = (c_state == CS_TURN_AROUND  && enable && !read_buf_hit) || c_state == CS_INIT;
 
 
// ======================================
// Instantiate RAMS
// ======================================
 
//generate
//    for ( i=0; i<WAYS;i=i+1 ) begin : rams
 
//            #(
//            .DATA_WIDTH                 ( TAG_WIDTH             ),
//            .INITIALIZE_TO_ZERO         ( 1                     ),
//            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))

        single_port_ram_21_8 u_tag0 (
            .clk               ( i_clk                 ),
            .data              ( tag_wdata             ),
            .we                ( tag_wenable_way[0]    ),
            .addr              ( tag_address           ),
            .out               ( tag_rdata_way0        )
            );
 
//           #(
//            .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
//            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
        single_port_ram_128_8 u_data0 (
            .clk                ( i_clk                         ),
            .data               ( i_wb_read_data                ),
            .we                 ( data_wenable_way[0]           ),
            .addr               ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                ( data_rdata_way0               )
            );       

        // Per tag-ram write-enable
        assign tag_wenable_way[0]  = tag_wenable && ( select_way[0] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[0] = ( source_sel[C_FILL] || read_miss_fill ) && select_way[0];
 
        // Per data-ram idle_hit flag
        assign data_hit_way[0]     = tag_rdata_way0[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way0[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;

//            #(
//            .DATA_WIDTH                 ( TAG_WIDTH             ),
//            .INITIALIZE_TO_ZERO         ( 1                     ),
//            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))
        single_port_ram_21_8 u_tag1 (
            .clk                ( i_clk                 ),
            .data               ( tag_wdata             ),
            .we                 ( tag_wenable_way[1]    ),
            .addr               ( tag_address           ),
 
            .out                ( tag_rdata_way1      )
            );
  
//     #(
//            .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
//            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
        single_port_ram_128_8 u_data1 (
            .clk                 ( i_clk                         ),
            .data                ( i_wb_read_data                ),
            .we                  ( data_wenable_way[1]           ),
            .addr                ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                 ( data_rdata_way1             )
            ); 

        // Per tag-ram write-enable
        assign tag_wenable_way[1]  = tag_wenable && ( select_way[1] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[1] = ( source_sel[C_FILL] || read_miss_fill ) && select_way[1];
 
        // Per data-ram idle_hit flag
        assign data_hit_way[1]     = tag_rdata_way1[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way1[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;  

//            #(
//            .DATA_WIDTH                 ( TAG_WIDTH             ),
//            .INITIALIZE_TO_ZERO         ( 1                     ),
//            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))
        single_port_ram_21_8 u_tag2 (
            .clk                ( i_clk                 ),
            .data               ( tag_wdata             ),
            .we                 ( tag_wenable_way[2]    ),
            .addr               ( tag_address           ),
 
            .out                ( tag_rdata_way2      )
            );
     
//          #(
//            .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
//            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
        single_port_ram_128_8 u_data2 (
            .clk                 ( i_clk                         ),
            .data                ( i_wb_read_data                ),
            .we                  ( data_wenable_way[2]           ),
            .addr                ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                 ( data_rdata_way2             )
            );  

        // Per tag-ram write-enable
        assign tag_wenable_way[2]  = tag_wenable && ( select_way[2] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[2] = ( source_sel[C_FILL] || read_miss_fill ) && select_way[2];
 
        // Per data-ram idle_hit flag
        assign data_hit_way[2]     = tag_rdata_way2[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way2[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;  

//            #(
//            .DATA_WIDTH                 ( TAG_WIDTH             ),
//            .INITIALIZE_TO_ZERO         ( 1                     ),
//            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))
       single_port_ram_21_8 u_tag3 (
            .clk                ( i_clk                 ),
            .data               ( tag_wdata             ),
            .we                 ( tag_wenable_way[3]    ),
            .addr               ( tag_address           ),
 
            .out                ( tag_rdata_way3      )
            );


                                             
 
//          #(
//           .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
//            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
       single_port_ram_128_8 u_data3 (
            .clk                 ( i_clk                         ),
            .data                ( i_wb_read_data                ),
            .we                  ( data_wenable_way[3]           ),
            .addr                ( data_address                  ),
//            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .out                 ( data_rdata_way3             )
            ); 

 
        // Per tag-ram write-enable
        assign tag_wenable_way[3]  = tag_wenable && ( select_way[3] || source_sel[C_INIT] );
 
        // Per data-ram write-enable
        assign data_wenable_way[3] = ( source_sel[C_FILL] || read_miss_fill ) && select_way[3];
 
        // Per data-ram idle_hit flag
        assign data_hit_way[3]     = tag_rdata_way3[TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way3[19:0] == i_address[31:12] &&  
                                     c_state == CS_IDLE;                                                               
//    end                                                         
//endgenerate

 
    always @ ( posedge i_clk )
        if ( c_state == CS_IDLE )
            valid_bits_r <= {tag_rdata_way3[TAG_WIDTH-1], 
                             tag_rdata_way2[TAG_WIDTH-1], 
                             tag_rdata_way1[TAG_WIDTH-1], 
                             tag_rdata_way0[TAG_WIDTH-1]};

 
    assign hit_rdata    = data_hit_way[0] ? data_rdata_way0 :
                          data_hit_way[1] ? data_rdata_way1 :
                          data_hit_way[2] ? data_rdata_way2 :
                          data_hit_way[3] ? data_rdata_way3 :
			128'hffffffffffffffffffffffffffffffff;
                                //     {CACHE_LINE_WIDTH{1'd1}} ;  // all 1's for debug
 


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


endmodule

module single_port_ram_128_8(
			clk,
			data,
			we,
			addr, 
			out
			);

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






