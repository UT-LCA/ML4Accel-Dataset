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

module a25_wishbone(
			i_clk,
 
			i_port0_req,
			o_port0_ack,
			i_port0_write,
			i_port0_wdata,
			i_port0_be,
			i_port0_addr,
			o_port0_rdata,
 
			i_port1_req,
			o_port1_ack,
			i_port1_write,
			i_port1_wdata,
			i_port1_be,
			i_port1_addr,
			o_port1_rdata,
 
			i_port2_req,
			o_port2_ack,
			i_port2_write,
			i_port2_wdata,
			i_port2_be,
			i_port2_addr,
			o_port2_rdata,
 
 
			o_wb_adr,
			o_wb_sel,
			o_wb_we,
			o_wb_dat,
			o_wb_cyc,
			o_wb_stb,
			i_wb_dat,
			i_wb_ack
//			i_wb_err
		);
 
 
// ----------------------------------------------------
// Parameters
// ----------------------------------------------------
localparam WBUF = 3;
 
input                       i_clk;
 
 
// Port 0 - dcache uncached
input                       i_port0_req;
output                      o_port0_ack;
input                       i_port0_write;
input       [127:0]         i_port0_wdata;
input       [15:0]          i_port0_be;
input       [31:0]          i_port0_addr;
output      [127:0]         o_port0_rdata;
 
// Port 1 - dcache cached
input                       i_port1_req;
output                      o_port1_ack;
input                       i_port1_write;
input       [127:0]         i_port1_wdata;
input       [15:0]          i_port1_be;
input       [31:0]          i_port1_addr;
output      [127:0]         o_port1_rdata;
 
// Port 2 - instruction cache accesses, read only
input                       i_port2_req;
output                      o_port2_ack;
input                       i_port2_write;
input       [127:0]         i_port2_wdata;
input       [15:0]          i_port2_be;
input       [31:0]          i_port2_addr;
output      [127:0]         o_port2_rdata;
 
 
// 128-bit Wishbone Bus
output      [31:0]          o_wb_adr;
output      [15:0]          o_wb_sel;
output                      o_wb_we;
output      [127:0]         o_wb_dat;
output                      o_wb_cyc;
output                      o_wb_stb;
input       [127:0]         i_wb_dat;
input                       i_wb_ack;
//input                       i_wb_err;
 
// ----------------------------------------------------
// Signals
// ----------------------------------------------------

reg        		    o_wb_adr = 32'd0;
reg             	    o_wb_sel = 16'd0;
reg                         o_wb_we  = 1'd0;
reg        		    o_wb_dat = 128'd0;
reg     	            o_wb_cyc = 1'd0;
reg        	            o_wb_stb = 1'd0;
wire [WBUF-1:0]             wbuf_valid;
wire [WBUF-1:0]             wbuf_accepted;
wire [WBUF-1:0]             wbuf_write;
//wire [127:0]                wbuf_wdata          [WBUF-1:0];
//wire [15:0]                 wbuf_be             [WBUF-1:0];
//wire [31:0]                 wbuf_addr           [WBUF-1:0];
wire [127:0]                wbuf_wdata0; 
wire [127:0]                wbuf_wdata1;
wire [127:0]                wbuf_wdata2;        
wire [15:0]                 wbuf_be0;            
wire [15:0]                 wbuf_be1; 
wire [15:0]                 wbuf_be2; 
wire [31:0]                 wbuf_addr0;   
wire [31:0]                 wbuf_addr1;
wire [31:0]                 wbuf_addr2;
wire [WBUF-1:0]             wbuf_rdata_valid;
wire                        new_access;
reg  [WBUF-1:0]             serving_port = 3'd0;
 

// ----------------------------------------------------
// Instantiate the write buffers
// ----------------------------------------------------

a25_wishbone_buf u_wishbone_buf_p0 (
    .i_clk          ( i_clk                 ),
 
    .i_req          ( i_port0_req           ),
    .i_write        ( i_port0_write         ),
    .i_wdata        ( i_port0_wdata         ),
    .i_be           ( i_port0_be            ),
    .i_addr         ( i_port0_addr          ),
    .o_rdata        ( o_port0_rdata         ),
    .o_ack          ( o_port0_ack           ), 

    .o_valid        ( wbuf_valid       [0]  ),
    .i_accepted     ( wbuf_accepted    [0]  ),
    .o_write        ( wbuf_write       [0]  ),
    .o_wdata        ( wbuf_wdata0           ),
    .o_be           ( wbuf_be0              ),
    .o_addr         ( wbuf_addr0            ),
    .i_rdata        ( i_wb_dat              ),
    .i_rdata_valid  ( wbuf_rdata_valid [0]  )
    );
 
 
a25_wishbone_buf u_wishbone_buf_p1 (
    .i_clk          ( i_clk                 ),
 
    .i_req          ( i_port1_req           ),
    .i_write        ( i_port1_write         ),
    .i_wdata        ( i_port1_wdata         ),
    .i_be           ( i_port1_be            ),
    .i_addr         ( i_port1_addr          ),
    .o_rdata        ( o_port1_rdata         ),
    .o_ack          ( o_port1_ack           ),

    .o_valid        ( wbuf_valid        [1] ),
    .i_accepted     ( wbuf_accepted     [1] ),
    .o_write        ( wbuf_write        [1] ),
    .o_wdata        ( wbuf_wdata1           ),
    .o_be           ( wbuf_be1              ),
    .o_addr         ( wbuf_addr1            ),
    .i_rdata        ( i_wb_dat              ),
    .i_rdata_valid  ( wbuf_rdata_valid  [1] )
    );
 
 
a25_wishbone_buf u_wishbone_buf_p2 (
    .i_clk          ( i_clk                 ),
 
    .i_req          ( i_port2_req           ),
    .i_write        ( i_port2_write         ),
    .i_wdata        ( i_port2_wdata         ),
    .i_be           ( i_port2_be            ),
    .i_addr         ( i_port2_addr          ),
    .o_rdata        ( o_port2_rdata         ),
    .o_ack          ( o_port2_ack           ),

    .o_valid        ( wbuf_valid        [2] ),
    .i_accepted     ( wbuf_accepted     [2] ),
    .o_write        ( wbuf_write        [2] ),
    .o_wdata        ( wbuf_wdata2           ),
    .o_be           ( wbuf_be2              ),
    .o_addr         ( wbuf_addr2            ),
    .i_rdata        ( i_wb_dat              ),
    .i_rdata_valid  ( wbuf_rdata_valid  [2] )
    );    


assign new_access       = !o_wb_stb || i_wb_ack;

assign wbuf_accepted[0] = new_access &&  wbuf_valid[0];
assign wbuf_accepted[1] = new_access && !wbuf_valid[0] &&  wbuf_valid[1];
assign wbuf_accepted[2] = new_access && !wbuf_valid[0] && !wbuf_valid[1] && wbuf_valid[2];

//always @(posedge i_clk)
//	begin
    
//	wbuf_accepted[0] <= new_access &&  wbuf_valid[0];
    
//	wbuf_accepted[1] <= new_access && !wbuf_valid[0] &&  wbuf_valid[1];

//	wbuf_accepted[2] <= new_access && !wbuf_valid[0] && !wbuf_valid[1] && wbuf_valid[2];

//	end

 
always @(posedge i_clk)
    begin
    if (new_access)
        begin
        if (wbuf_valid[0])
            begin
            o_wb_adr        <= wbuf_addr0;
            o_wb_sel        <= wbuf_be0;
            o_wb_we         <= wbuf_write[0];
            o_wb_dat        <= wbuf_wdata0;
            o_wb_cyc        <= 1'd1;
            o_wb_stb        <= 1'd1;
            serving_port    <= 3'b001;
            end
        else if (wbuf_valid[1])
            begin
  //          o_wb_adr        <= wbuf_addr [1];
  //          o_wb_sel        <= wbuf_be   [1];
  //          o_wb_we         <= wbuf_write[1];
  //          o_wb_dat        <= wbuf_wdata[1];
            o_wb_adr        <= wbuf_addr1;
            o_wb_sel        <= wbuf_be1;
            o_wb_we         <= wbuf_write[1];
            o_wb_dat        <= wbuf_wdata1;
            o_wb_cyc        <= 1'd1;
            o_wb_stb        <= 1'd1;
            serving_port    <= 3'b010;
            end
        else if (wbuf_valid[2])
            begin
  //          o_wb_adr        <= wbuf_addr [2];
  //          o_wb_sel        <= wbuf_be   [2];
  //          o_wb_we         <= wbuf_write[2];
  //          o_wb_dat        <= wbuf_wdata[2];
            o_wb_adr        <= wbuf_addr2;
            o_wb_sel        <= wbuf_be2;
            o_wb_we         <= wbuf_write[2];
            o_wb_dat        <= wbuf_wdata2;
            o_wb_cyc        <= 1'd1;
            o_wb_stb        <= 1'd1;
            serving_port    <= 3'b100;
            end
        else
            begin
            o_wb_cyc        <= 1'd0;
            o_wb_stb        <= 1'd0;
 
            // Don't need to change these values because they are ignored
            // when stb is low, but it makes for a cleaner waveform, at the expense of a few gates
            o_wb_we         <= 1'd0;
            o_wb_adr        <= 32'd0;
            o_wb_dat        <= 128'd0;
 
            serving_port    <= 3'b000;
            end    
        end
    end
 
 
assign {wbuf_rdata_valid[2], wbuf_rdata_valid[1], wbuf_rdata_valid[0]} = {3{i_wb_ack & ~ o_wb_we}} & serving_port;
 
 
endmodule
 module a25_wishbone_buf (
 			i_clk,
 
// Core side
			i_req,
			i_write,
			i_wdata,
			i_be,
			i_addr,
			o_rdata,
			o_ack,
 
// Wishbone side
			o_valid,
			i_accepted,
			o_write,
			o_wdata,
			o_be,
			o_addr,
			i_rdata,
			i_rdata_valid
			);
 
input                       i_clk;
 
// Core side
input                       i_req;
input                       i_write;
input       [127:0]         i_wdata;
input       [15:0]          i_be;
input       [31:0]          i_addr;
output      [127:0]         o_rdata;
output                      o_ack;
 
// Wishbone side
output                      o_valid;
input                       i_accepted;
output                      o_write;
output      [127:0]         o_wdata;
output      [15:0]          o_be;
output      [31:0]          o_addr;
input       [127:0]         i_rdata;
input                       i_rdata_valid;
 
// ----------------------------------------------------
// Signals
// ----------------------------------------------------
reg  [1:0]                  wbuf_used_r     = 2'd0;
//reg  [31:0]                 wbuf_addr_r     [1:0]; 
reg  [31:0]                 wbuf_addr_r0;
reg  [31:0]                 wbuf_addr_r1;
//reg  [127:0]                wbuf_wdata_r    [1:0]; 
reg  [127:0]                wbuf_wdata_r0;
reg  [127:0]                wbuf_wdata_r1;
//reg  [15:0]                 wbuf_be_r       [1:0]; 
reg  [15:0]                 wbuf_be_r0;
reg  [15:0]                 wbuf_be_r1;
reg  [1:0]                  wbuf_write_r    = 2'd0;
reg                         wbuf_wp_r       = 1'd0;        // write buf write pointer
reg                         wbuf_rp_r       = 1'd0;        // write buf read pointer
reg                         busy_reading_r  = 1'd0;
reg                         wait_rdata_valid_r = 1'd0;
wire                        in_wreq;
reg                         ack_owed_r      = 1'd0;
reg			    push;  //wire to reg	
reg			    pop;	//wire to reg
 
// ----------------------------------------------------
// Access Buffer
// ----------------------------------------------------
assign in_wreq = i_req && i_write;
assign push    = i_req && !busy_reading_r && (wbuf_used_r == 2'd1 || (wbuf_used_r == 2'd0 && !i_accepted));
assign pop     = o_valid && i_accepted && wbuf_used_r != 2'd0;
 
always @(posedge i_clk)
    if (push && pop)
        wbuf_used_r     <= wbuf_used_r;
    else if (push)
        wbuf_used_r     <= wbuf_used_r + 1'd1;
    else if (pop)
        wbuf_used_r     <= wbuf_used_r - 1'd1;
 
always @(posedge i_clk)
    if (push && in_wreq && !o_ack)
        ack_owed_r <= 1'd1;
    else if (!i_req && o_ack)
        ack_owed_r <= 1'd0;
 
always @(posedge i_clk)
    if (push)
        begin
		if ( wbuf_wp_r == 1'd0)
		begin
		wbuf_wdata_r0   <= i_wdata;
      	  	wbuf_addr_r0   <= i_addr;
      	  	wbuf_be_r0   <= i_write ? i_be : 16'hffff;
        	wbuf_write_r [0]   <= i_write;
		end


       		else if ( wbuf_wp_r == 1'd1)
		begin
		wbuf_wdata_r1   <= i_wdata;
        	wbuf_addr_r1    <= i_addr;
        	wbuf_be_r1      <= i_write ? i_be : 16'hffff;
        	wbuf_write_r [1]   <= i_write;
		end

        	wbuf_wp_r                  <= !wbuf_wp_r;
        end
 
always @(posedge i_clk)
    if (pop)
        wbuf_rp_r                  <= !wbuf_rp_r;
 
 
// ----------------------------------------------------
// Output logic
// ----------------------------------------------------
//assign o_wdata = wbuf_used_r != 2'd0 ? wbuf_wdata_r[wbuf_rp_r] : i_wdata;
assign o_wdata = wbuf_used_r != 2'd0 ? (wbuf_rp_r == 1'd0 ? wbuf_wdata_r0 : wbuf_wdata_r1 ) : i_wdata;

//assign o_write = wbuf_used_r != 2'd0 ? wbuf_write_r[wbuf_rp_r] : i_write;
assign o_write = wbuf_used_r != 2'd0 ? (wbuf_rp_r == 1'd0 ? wbuf_write_r[0] : wbuf_write_r[1]) : i_write;

//assign o_addr  = wbuf_used_r != 2'd0 ? wbuf_addr_r [wbuf_rp_r] : i_addr;
assign o_addr  = wbuf_used_r != 2'd0 ? (wbuf_rp_r == 1'd0 ? wbuf_addr_r0 : wbuf_addr_r1 ) : i_addr;

//assign o_be    = wbuf_used_r != 2'd0 ? wbuf_be_r   [wbuf_rp_r] : i_write ? i_be : 16'hffff;
assign o_be    = wbuf_used_r != 2'd0 ? (wbuf_rp_r == 1'd0 ? wbuf_be_r0 : wbuf_be_r1) : i_write ? i_be : 16'hffff;

assign o_ack   = (in_wreq ? (wbuf_used_r == 2'd0) : i_rdata_valid) || (ack_owed_r && pop); 

assign o_valid = (wbuf_used_r != 2'd0 || i_req) && !wait_rdata_valid_r;
 
assign o_rdata = i_rdata;
 
 
always@(posedge i_clk)
    if (o_valid && !o_write)
        busy_reading_r <= 1'd1;
    else if (i_rdata_valid)
        busy_reading_r <= 1'd0;
 
always@(posedge i_clk)
    if (o_valid && !o_write && i_accepted)
        wait_rdata_valid_r <= 1'd1;
    else if (i_rdata_valid)  
        wait_rdata_valid_r <= 1'd0;
endmodule
