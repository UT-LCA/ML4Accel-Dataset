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






