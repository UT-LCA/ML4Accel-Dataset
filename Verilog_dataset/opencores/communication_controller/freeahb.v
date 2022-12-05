///////////////////////////////////////////////////////////////////////////////
// 
// Copyright (C) Revanth Kamaraj
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
///////////////////////////////////////////////////////////////////////////////
//
// This is a Verilog AHB master. It passes lint in Icarus Verilog and Verilog.
// It is strictly compliant with the AHB 2.0 specification. The logic is
// described in Verilog-1995 for max compatibility.
//
// Icarus Verilog:
// iverilog -g1995 -Wall ahb_master.v
// <No Errors/Warnings>
//
// Verilator:
// vlator --lint-only ahb_master.v
// <No Errors/Warnings>
//
///////////////////////////////////////////////////////////////////////////////

module ahb_master (    
        i_hclk,
        i_hreset_n,
        o_haddr,
        o_hburst,
        o_htrans,
        o_hwdata,
        o_hwrite,
        o_hsize,
        i_hrdata,
        i_hready,
        i_hresp,
        i_hgrant,
        o_hbusreq,
        o_next,
        i_data,
        i_dav,
        i_addr,
        i_size,
        i_wr,
        i_rd,
        i_wrap,
        i_min_len,
        i_sof,
        o_data,
        o_addr,
        o_dav
); 

////////////////////////////////////////////////////////////////////////
// Parameters
////////////////////////////////////////////////////////////////////////

parameter DATA_WDT = 32;
parameter BEAT_WDT = 32; 

///////////////////////////////////////////////////////////////////////
// AHB interface.
///////////////////////////////////////////////////////////////////////

input                           i_hclk;
input                           i_hreset_n;
output     [31:0]               o_haddr;
output     [2:0]                o_hburst;
output     [1:0]                o_htrans;
output    [DATA_WDT-1:0]        o_hwdata;
output                          o_hwrite;
output     [2:0]                o_hsize;
input     [DATA_WDT-1:0]        i_hrdata;
input                           i_hready;
input      [1:0]                i_hresp;
input                           i_hgrant;
output                          o_hbusreq;

///////////////////////////////////////////////////////////////////////
// User interface.
///////////////////////////////////////////////////////////////////////

// Required UI must change only if this is 1. You can also
// change UI signals when the unit idling (SOF=0, RD=0, WR=0).

output                          o_next;    // External FIFO pop. 

// Data to write onto AHB. No need to shift.

input     [DATA_WDT-1:0]        i_data;    // Data to write. Can change during burst if o_next = 1.
input                           i_dav;     // Data to write valid. Can change during burst if o_next = 1.

// Burst properties. Address should be aligned to i_size.

input      [31:0]               i_addr;    // Base address of burst. Hold constant throughout the burst.
input      [2:0]                i_size;    // 2**n bytes/beat. Hold constant throughout the burst.
input                           i_wr;      // Write to AHB bus. Hold constant throughout the burst.
input                           i_rd;      // Read from AHB bus. Hold constant throughout the burst.
input                           i_wrap;    // Enable wrap transfer. i_min_len should be 2**.
input     [BEAT_WDT-1:0]        i_min_len; // Minimum guaranteed length of burst (number of beats). 
                                           // Hold constant throughout the burst.Keep i_sof=0 to extend the 
                                           // burst beyond i_min_len.For wrap, this should be striclty 2**.

// SOF

input                           i_sof;     // 1 = Start of burst. Always 1 for disjoint transfers.
                                           // When i_sof=1, new burst parameters should be
                                           // provided. 

// Data read from AHB. No need to shift.

output     [DATA_WDT-1:0]      o_data;    // Data got from AHB is presented here (read).
output     [31:0]              o_addr;    // Corresponding address is presented here.
output                         o_dav;     // Used as o_data valid indicator.

wire [1:0] IDLE      = 0;
wire [1:0] BUSY      = 1;
wire [1:0] NONSEQ    = 2;
wire [1:0] SEQ       = 3;
wire [1:0] OKAY      = 0;
wire [1:0] ERROR     = 1;
wire [1:0] SPLIT     = 2;
wire [1:0] RETRY     = 3;
wire [2:0] SINGLE    = 0; 
wire [2:0] INCR      = 1;
wire [2:0] WRAP4     = 2;
wire [2:0] INCR4     = 3;
wire [2:0] WRAP8     = 4;
wire [2:0] INCR8     = 5;
wire [2:0] WRAP16    = 6;
wire [2:0] INCR16    = 7;

reg [DATA_WDT-1:0] odata;
reg [31:0]         oaddr;
reg                odav;
reg [4:0]           burst_ctr;       
reg [BEAT_WDT-1:0]  beat_ctr;        
reg                 hbusreq;
reg [1:0]           gnt;        
reg [2:0]           hburst;      
reg [DATA_WDT-1:0]  hwdata [1:0];
reg [31:0]          haddr  [1:0];
reg [1:0]           htrans [1:0];
reg [1:0]           hwrite;     
reg [2:0]           hsize  [1:0];
reg [BEAT_WDT-1:0]  min_len [1:0];
reg [BEAT_WDT-1:0]  beat;        
reg [31:0]          addr_mask [1:-1];
reg [1:0]           wrap;
reg                 pend_split;

wire [BEAT_WDT-1:0] beat_ctr_val  = hburst == INCR ? beat_ctr  : (beat_ctr - {{(BEAT_WDT-1){1'd0}}, rd_wr}); 
wire [4:0] burst_ctr_val          = hburst == INCR ? burst_ctr : (burst_ctr - {4'd0, rd_wr});
wire spl_ret_cyc_1                = gnt[1] && !i_hready && (i_hresp == RETRY || i_hresp == SPLIT);
wire rd_wr                        = i_rd || (i_wr && i_dav);
wire cont                         = ~i_sof;
wire [31:0] bt                    = htrans[0] != BUSY ? 32'd1 : 32'd0;

assign  {o_haddr, o_hburst, o_htrans, o_hwdata, o_hwrite, o_hsize} = 
        {haddr[0], hburst, htrans[0], hwdata[1], hwrite[0], hsize[0]};
assign o_next    = (i_hready && i_hgrant && !pend_split);
assign o_hbusreq = hbusreq;
assign o_data    = odata;
assign o_addr    = oaddr;
assign o_dav     = odav;

always @ (i_wrap, i_min_len, i_size) 
        addr_mask[-1] = get_address_mask (i_wrap, i_min_len, i_size);

always @ (posedge i_hclk or negedge i_hreset_n)
begin
        if ( !i_hreset_n )
                gnt <= 2'd0;
        else if ( spl_ret_cyc_1 )
                gnt <= 2'd0; 
        else if ( i_hready )
                gnt <= {gnt[0], i_hgrant};
end

always @ (posedge i_hclk or negedge i_hreset_n)
begin
        if ( !i_hreset_n )
                hbusreq <= 1'd0;
        else
                hbusreq <= i_rd | i_wr;
end

always @ (posedge i_hclk or negedge i_hreset_n)
begin
        if ( !i_hreset_n )
        begin
                htrans[0]    <= IDLE;
                pend_split   <= 1'd0;
                hwdata[0]    <= {DATA_WDT{1'd0}};
                hwrite[0]    <= 1'd0;
                addr_mask[0] <= 32'd0;
                hsize[0]     <= 3'd0; 
                wrap[0]      <= 1'd0;
                burst_ctr    <= 5'd0;
                beat_ctr     <= {(BEAT_WDT){1'd0}};
                min_len[0]   <= {(BEAT_WDT){1'd0}};
        end
        else if ( spl_ret_cyc_1 ) 
        begin
                htrans[0]  <= IDLE;
                pend_split <= 1'd1;
        end
        else if ( i_hready && i_hgrant )
        begin
                pend_split <= 1'd0; 

                if ( pend_split )
                begin
                        

                        {hwrite[0], hsize[0], addr_mask[0], wrap[0], min_len[0], haddr[0]} <= 
                        {hwrite[1], hsize[1], addr_mask[1], wrap[1], min_len[1], haddr[1]};

                        hwdata[0] <= unshift(hwdata[1], haddr[1]);
                        {burst_ctr, hburst} <= compute_hburst (
                                                beat, 
                                                1'd1, 
                                                1'd0, 
                                                hsize[1], 
                                                addr_mask[1], 
                                                haddr[1], 
                                                wrap[1],
                                                {{(32-BEAT_WDT){1'd0}}, min_len[1]}
                                               );
                        htrans[0] <= NONSEQ;
                        beat_ctr  <= beat;
                end
                else
                begin
                        {hwdata[0], hwrite[0], hsize[0], addr_mask[0]    , wrap[0], min_len[0]} <= 
                        {i_data,         i_wr, i_size  , addr_mask[-1]   , i_wrap , i_min_len }; 

                        if ( !cont && !rd_wr ) 
                        begin:blk0
                                htrans[0] <= IDLE;
                        end
                        else if 
                        ( 
                                (!cont && rd_wr)                        || 
                                !gnt[0]                                 || 
                                (burst_ctr == 1 && o_hburst != INCR)    || 
                                (htrans[0] == IDLE)                     || 
                                 b1k_spec(haddr[0], i_size, addr_mask[0])
                        )
                        begin:blk1
                                haddr[0] <= gen_addr ( (~cont) ? i_addr : haddr[0], {31'd0, rd_wr}, {29'd0, i_size}, cont, addr_mask[-1] );

                                {burst_ctr, hburst} <= compute_hburst   (
                                                        beat_ctr,    
                                                        cont,
                                                        rd_wr,
                                                        i_size, 
                                                        addr_mask[-1], 
                                                        (~cont) ? i_addr : haddr[0],
                                                        i_wrap,
                                                        {{(32-BEAT_WDT){1'd0}}, i_min_len}
                                                       );

                                htrans[0] <=  rd_wr == 1'd1 ? NONSEQ : IDLE;
                                beat_ctr  <=  cont == 1'd0 ? i_min_len : beat_ctr_val;
                        end
                        else
                        begin:blk2
                                haddr[0]  <= gen_addr(haddr[0], bt, {29'd0, i_size}, 1'd1, addr_mask[-1]);
                                htrans[0] <= rd_wr  == 1'd1 ? SEQ : BUSY;
                                burst_ctr <= burst_ctr_val;
                                beat_ctr  <= beat_ctr_val;
                        end
                end 
        end
end

always @ (posedge i_hclk or negedge i_hreset_n)
begin
        if ( !i_hreset_n )
        begin
                hwdata[1]    <= {DATA_WDT{1'd0}};
                haddr[1]     <= 32'd0;
                hwrite[1]    <= 1'd0;
                htrans[1]    <= IDLE;
                addr_mask[1] <= 32'd0;
                hsize[1]     <= 3'd0;
                beat         <= {(BEAT_WDT){1'd0}}; 
        end
        else if ( i_hready && gnt[0] )
        begin                        
                hwdata[1] <= shift(hwdata[0], haddr[0]);

                {haddr[1], hwrite[1], hsize[1], htrans[1], addr_mask[1], wrap[1], beat} <= 
                {haddr[0], hwrite[0], hsize[0], htrans[0], addr_mask[0], wrap[0], beat_ctr};                 
        end
end

always @ (posedge i_hclk or negedge i_hreset_n)
begin
        if ( !i_hreset_n )
        begin
                odav  <= 1'd0;
                odata <= {DATA_WDT{1'd0}};
                oaddr <= 32'd0;
        end
        else if ( gnt[1] && i_hready && (htrans[1] == SEQ || htrans[1] == NONSEQ) )
        begin
                odav  <= ~hwrite[1];
                odata <= unshift(i_hrdata, haddr[1]);
                oaddr <= haddr[1];
        end
        else
        begin
                odav <= 1'd0;
        end
end

function [31:0] get_address_mask ( input wrap, 
                                   input [BEAT_WDT-1:0] len, 
                                   input [2:0] hsize );
begin
        get_address_mask = {32{1'd0}}; 

        if ( wrap == 0 )
        begin
                get_address_mask = 32'hFFFF_FFFF;
        end
        else 
        begin:blk3
                integer i;

                for(i=0;i<BEAT_WDT;i=i+1)
                        if ( len == 1 << i )
                                get_address_mask = (1 << ({29'd0, hsize} + i)) - 1;
        end
end
endfunction

function [DATA_WDT-1:0] shift ( input [DATA_WDT-1:0] data, input [31:0] addr );
reg [31:0] shamt;
begin
        shamt = addr % (DATA_WDT/8); 
        shift = data << shamt;
end
endfunction

function [DATA_WDT-1:0] unshift ( input [DATA_WDT-1:0] data, input [31:0] addr );
reg [31:0] shamt;
begin
        shamt   = addr % (DATA_WDT/8); 
        unshift = data >> shamt;
end     
endfunction

function [7:0] compute_hburst 
(
                               input [BEAT_WDT-1:0]  beat,
                               input                 cont, 
                               input                 rd_wr,
                               input [2:0]           sz, 
                               input [31:0]          mask,
                               input [31:0]          prev_addr,
                               input                 wrap,
                               input [31:0]          min_len
);
reg [31:0] addr;
reg [BEAT_WDT-1:0] val;
begin:blk5
        integer i;

        val  = cont == 1'd0 ? min_len : beat;
        addr = gen_addr(prev_addr, {31'd0, rd_wr}, {29'd0, sz}, cont, mask);

        compute_hburst =        (val >= 16 && no_cross(addr, 32'd15, sz, mask)) == 1'd1 ? {5'd16, INCR16} :
                                (val >= 8  && no_cross(addr, 32'd7,  sz, mask)) == 1'd1 ? {5'd8 , INCR8 } :
                                (val >= 4  && no_cross(addr, 32'd3,  sz, mask)) == 1'd1 ? {5'd4 , INCR4 } : 
                                                                                          {5'd0 , INCR  } ;

        if ( wrap == 1'd1 )
        begin
                if ( compute_hburst[2:0] == INCR )
                        compute_hburst[2:0] = SINGLE;
                else 
                begin
                        case ( min_len )
                        32'd4       : compute_hburst[2:0] = WRAP4;
                        32'd8       : compute_hburst[2:0] = WRAP8;
                        32'd16      : compute_hburst[2:0] = WRAP16;
                        default     : compute_hburst[2:0] = SINGLE;
                        endcase
                end
        end
end
endfunction

function no_cross 
(
        input [31:0] addr, 
        input [31:0] val, 
        input [2:0]  sz, 
        input [31:0] mask
);
reg [31:0] comp_addr;
integer i;
begin
        comp_addr = gen_addr(addr, val, 32'd1 << sz, 1'd1, mask );

        if ( comp_addr[31:10] != addr[31:10] )
                no_cross = 1'd0; 
        else
                no_cross = 1'd1; 
end
endfunction

function get_bit ( input [31:0] data, integer sel );
        get_bit = data[sel];
endfunction

function [31:0] gen_addr ( input [31:0] addr, input [31:0] rd_wr, 
                           input [31:0] sz,   input cont, 
                           input [31:0] mask );
integer i;
begin
        for(i=0;i<32;i=i+1)
        begin
                if ( mask[i] )
                        gen_addr[i] = cont == 1'd0 ? addr[i] : 
                                      get_bit(addr + (rd_wr << sz), i);
                else
                        gen_addr[i] = addr[i];
        end
end
endfunction

function b1k_spec ( input [31:0] addr, input [2:0] size, input [31:0] mask );
reg [31:0] comp_addr;
begin:blk4
        comp_addr = gen_addr ( addr, 32'd1, {29'd0, size}, 1'd1, mask );

        if ( comp_addr[31:10] != addr[31:10] )
                b1k_spec = 1'd1;
        else
                b1k_spec = 1'd0;
end
endfunction

endmodule

///////////////////////////////////////////////////////////////////////////////
// EOF
///////////////////////////////////////////////////////////////////////////////

