//
//
//

`include "timescale.v"


module i2s_to_wb_dma_fsm
  (
    input           dma_enable,
    input           dma_ack_i,
    
    input           fifo_empty,
    input           fifo_full,
    
    output          fifo_wr_enable,
    
    output          dma_fsm_error,

    input           dma_clk_i,
    input           dma_rst_i
  );
  

  // -----------------------------
  //  state machine binary definitions
  parameter IDLE_STATE  = 4'b0001;
  parameter DMA_STATE   = 4'b0010;
  parameter WAIT_STATE  = 4'b0100;
  parameter ERROR_STATE = 4'b1000;


  // -----------------------------
  //  state machine flop
  reg [3:0] state;
  reg [3:0] next_state;

  always @(posedge dma_clk_i)
    if(dma_rst_i)
      state <= IDLE_STATE;
    else
      state <= next_state;


  // -----------------------------
  //  state machine
  always @(*)
    case(state)
      IDLE_STATE:   if( dma_enable & fifo_empty )
                      next_state <= DMA_STATE;
                    else
                      next_state <= IDLE_STATE;

      DMA_STATE:    if( ~dma_enable | fifo_full )
                      next_state <= IDLE_STATE;
                    else if( ~dma_ack_i )
                      next_state <= WAIT_STATE;
                    else
                      next_state <= DMA_STATE;

      WAIT_STATE:   if( dma_ack_i )
                      next_state <= DMA_STATE; 
                    else
                      next_state <= WAIT_STATE;

      ERROR_STATE:  next_state <= IDLE_STATE;

      default:      next_state <= ERROR_STATE;

    endcase
    
         
  // -----------------------------
  //  outputs
  assign fifo_wr_enable = ( (state == DMA_STATE) | (state == WAIT_STATE) ) & (next_state != WAIT_STATE) & dma_enable & ~fifo_full;
  assign dma_fsm_error  = (state == ERROR_STATE);
  

endmodule

//
//
//

`include "timescale.v"


module i2s_to_wb_fifo_fsm
  (
    input   i2s_ws_edge,
    input   i2s_ws_i, 
    
    input   fifo_enable,
    input   fifo_empty,
    input   fifo_ack,
    
    output  fifo_pop_right,
    output  fifo_pop_left,
    output  fifo_fsm_error,
    output  fifo_ready,

    input   i2s_clk_i,
    input   i2s_rst_i
  );
  

  // -----------------------------
  //  state machine binary definitions
  parameter IDLE_STATE  = 4'b0001;
  parameter ACK_WAIT    = 4'b0010;
  parameter POP_STATE   = 4'b0100;
  parameter ERROR_STATE = 4'b1000;


  // -----------------------------
  //  state machine flop
  reg [3:0] state;
  reg [3:0] next_state;

  always @(posedge i2s_clk_i or posedge i2s_rst_i)
    if(i2s_rst_i)
      state <= IDLE_STATE;
    else
      state <= next_state;


  // -----------------------------
  //  state machine
  always @(*)
    case(state)
      IDLE_STATE:   if( fifo_enable & ~fifo_ack )
                      next_state <= ACK_WAIT;
                    else
                      next_state <= IDLE_STATE;

      ACK_WAIT:     if( ~fifo_enable )
                      next_state <= IDLE_STATE;
                    else if( fifo_ack )
                      next_state <= POP_STATE;
                    else
                      next_state <= ACK_WAIT;

      POP_STATE:    if( fifo_empty )
                      next_state <= ERROR_STATE;
                    else
                      next_state <= IDLE_STATE;

      ERROR_STATE:  next_state <= ACK_WAIT;

      default:      next_state <= ERROR_STATE;

    endcase
    
    
  // -----------------------------
  //  outputs
  assign fifo_pop_right = (state == POP_STATE) & i2s_ws_i; 
  assign fifo_pop_left  = (state == POP_STATE) & ~i2s_ws_i; 
  assign fifo_fsm_error = (state == ERROR_STATE);
  assign fifo_ready     = (state == ACK_WAIT);

endmodule

// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module i2s_to_wb_top
  (
    input   [31:0]  wbs_data_i,
    output  [31:0]  wbs_data_o,
    input   [31:0]  wbs_addr_i,
    input   [3:0]   wbs_sel_i,
    input           wbs_we_i,
    input           wbs_cyc_i,
    input           wbs_stb_i,
    output          wbs_ack_o,
    output          wbs_err_o,
    output          wbs_rty_o,

    input           i2s_sck_i,
    input           i2s_ws_i,
    output          i2s_sd_o,

    input           i2s_clk_i,
    input           i2s_rst_i
  );
  
  
  //---------------------------------------------------
  // register encoder
  reg [3:0] register_index_r;

  always @(*)
    case( wbs_addr_i[19:0] )
      20'h0_0000: register_index_r = 4'h0;
      20'h0_0004: register_index_r = 4'h1;
      20'h0_0008: register_index_r = 4'h2;
      20'h0_000c: register_index_r = 4'h3;
      20'h0_0010: register_index_r = 4'h4;
      default:    register_index_r = 4'hf;
    endcase


  //---------------------------------------------------
  // register offset 0x0  -- 
  reg [31:0]  i2s_register_0;
  wire        i2s_register_0_we = (wbs_cyc_i & wbs_stb_i & wbs_we_i) & (register_index_r == 4'h0);

  always @( posedge i2s_clk_i )
    if( i2s_rst_i )
      i2s_register_0 <= 32'h00000000;
    else if( i2s_register_0_we )
      i2s_register_0 <= wbs_data_i;


  //---------------------------------------------------
  // register offset 0x4  -- 
  reg [31:0]  i2s_register_1;

  always @( posedge i2s_clk_i )
    if( i2s_rst_i )
      i2s_register_1 <= 32'h00000000;
    else if( (wbs_cyc_i & wbs_stb_i & wbs_we_i) & (register_index_r == 4'h1) )
      i2s_register_1 <= wbs_data_i;
      

  //---------------------------------------------------
  // register offset 0x8  -- read only
  wire [31:0] i2s_register_2;
  

  //---------------------------------------------------
  // register offset 0xc  -- read only
  wire [31:0] i2s_register_3;

  
  //---------------------------------------------------
  // register offset 0x10  -- write only
  wire [31:0] i2s_register_4;
  wire        i2s_register_4_we = (wbs_cyc_i & wbs_stb_i & wbs_we_i) & (register_index_r == 4'h4);

  
  //---------------------------------------------------
  // register mux
  reg [31:0]  wbs_data_o_r;

  always @(*)
    case( register_index_r )
      4'h0:     wbs_data_o_r = i2s_register_0;
      4'h1:     wbs_data_o_r = i2s_register_1;
      4'h2:     wbs_data_o_r = i2s_register_2;
      4'h3:     wbs_data_o_r = i2s_register_3;
      4'h4:     wbs_data_o_r = i2s_register_4;
      4'hf:     wbs_data_o_r = 32'h1bad_c0de;
      default:  wbs_data_o_r = 32'h1bad_c0de;
    endcase
    

  //---------------------------------------------------
  // wishbone clock domain
  wire        i2s_ws_edge;
  wire [31:0] fifo_right_data; 
  wire [31:0] fifo_left_data; 
  wire        fifo_ack;
  wire        fifo_ready;
  
  i2s_to_wb_tx_if #( .DMA_BUFFER_MAX_WIDTH(12) )
    i_i2s_to_wb_tx_if
    (
      .i2s_enable(i2s_register_0[0]),
      .i2s_ws_edge(i2s_ws_edge),
      .i2s_ws_i(i2s_ws_i),
      
      .fifo_ack(fifo_ack),
      
      .fifo_ready(fifo_ready),
      .fifo_right_data(fifo_right_data),
      .fifo_left_data(fifo_left_data),
      
      .dma_rd_pointer_i( wbs_data_i ),
      .dma_rd_pointer_o( i2s_register_4 ),
      
      .dma_rd_pointer_we( i2s_register_4_we ),
      .dma_word_size( {9'h0, 3'b100} ),
      .dma_buffer_size( 12'h1BC ),
      
      .dma_overflow_error(),
  
      .i2s_clk_i(i2s_clk_i),
      .i2s_rst_i(i2s_rst_i)
    );
    
    
  //---------------------------------------------------
  // i2s clock domain
  
  i2s_to_wb_tx
    i_i2s_to_wb_tx
    (
      .fifo_right_data(fifo_right_data),
      .fifo_left_data(fifo_left_data),
      .fifo_ready(fifo_ready),
      
      .fifo_ack(fifo_ack),
    
      .i2s_ws_edge(i2s_ws_edge),
    
      .i2s_enable(i2s_register_0[0]),
      .i2s_sck_i(i2s_sck_i),
      .i2s_ws_i(i2s_ws_i),
      .i2s_sd_o(i2s_sd_o)
    );
    
    
  //---------------------------------------------------
  // assign outputs
  
  assign wbs_data_o = wbs_data_o_r;
  assign wbs_ack_o  = wbs_cyc_i & wbs_stb_i;
  assign wbs_err_o  = 1'b0;
  assign wbs_rty_o  = 1'b0;
  

endmodule
// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module i2s_to_wb_tx_dma
  #(
    parameter DMA_BUFFER_MAX_WIDTH = 12
  )
  (
    input   [31:0]  wbm_data_i,
    output  [31:0]  wbm_data_o,
    output  [31:0]  wbm_addr_o,
    output  [3:0]   wbm_sel_o,
    output          wbm_we_o,
    output          wbm_cyc_o,
    output          wbm_stb_o,
    input           wbm_ack_i,
    input           wbm_err_i,
    input           wbm_rty_i,
  
    input           i2s_enable,

    input           fifo_pop,
    
    output          fifo_empty,
  
    output  [31:0]  dma_rd_pointer_o,
    input   [31:0]  dma_rd_pointer_i,
    
    input           dma_rd_pointer_we,
    
    input   [(DMA_BUFFER_MAX_WIDTH - 1):0]  dma_word_size,
    input   [(DMA_BUFFER_MAX_WIDTH - 1):0]  dma_buffer_size,
    
    output          dma_overflow_error,
    
    input           i2s_clk_i,
    output          i2s_rst_i
  );
  

  //---------------------------------------------------
  // fifo
  wire        fifo_wr_enable;
  wire        fifo_full;
    
  sync_fifo #( .depth(4), .width(32) )
    i_fifo
    (
     .clk(i2s_clk_i),
     .reset(i2s_rst_i),
     .wr_enable(fifo_wr_enable),
     .rd_enable( fifo_pop ),
     .empty(fifo_empty),
     .full(fifo_full),
     .rd_data(wbm_data_o),
     .wr_data(wbm_data_i),
     .count()
     );
     
     
  //---------------------------------------------------
  // 
  wire dma_fsm_error;
  
  i2s_to_wb_dma_fsm 
    i_i2s_to_wb_dma_fsm
    (
      .dma_enable(i2s_enable),
      .dma_ack_i(wbm_ack_i),
      
      .fifo_empty(fifo_empty),
      .fifo_full(fifo_full),
      
      .fifo_wr_enable(fifo_wr_enable),
      .dma_fsm_error(dma_fsm_error),
  
      .dma_clk_i(i2s_clk_i),
      .dma_rst_i(i2s_rst_i)
    );
    

  //---------------------------------------------------
  // 
  reg  [31:0]  dma_buffer_base_r;
  wire [31:DMA_BUFFER_MAX_WIDTH] dma_buffer_base_w = dma_buffer_base_r[31:DMA_BUFFER_MAX_WIDTH];
  
  always @(posedge i2s_clk_i)
    if( i2s_rst_i )
      dma_buffer_base_r <= 0;
    else if( dma_rd_pointer_we )
      dma_buffer_base_r <= dma_rd_pointer_i;
  

  //---------------------------------------------------
  // 
  reg  [DMA_BUFFER_MAX_WIDTH:0]  dma_rd_pointer_o_r;
  
  wire [(DMA_BUFFER_MAX_WIDTH - 1):0] dma_middle = dma_buffer_base_r[(DMA_BUFFER_MAX_WIDTH - 1):0] + {1'b0, dma_buffer_size[(DMA_BUFFER_MAX_WIDTH - 1):1]}; 
  wire [(DMA_BUFFER_MAX_WIDTH - 1):0] dma_bottom = dma_buffer_base_r[(DMA_BUFFER_MAX_WIDTH - 1):0] + dma_buffer_size - dma_word_size - 1;
  
  always @(posedge i2s_clk_i)
    if( dma_rd_pointer_we )
      dma_rd_pointer_o_r <= {1'b0, dma_buffer_base_r[(DMA_BUFFER_MAX_WIDTH - 1):0]};
    else if( dma_rd_pointer_o_r > dma_bottom )
      dma_rd_pointer_o_r <= {1'b0, dma_buffer_base_r[(DMA_BUFFER_MAX_WIDTH - 1):0]};
    else if(fifo_wr_enable)  
      dma_rd_pointer_o_r <= dma_rd_pointer_o_r + dma_word_size;
  

  //---------------------------------------------------
  // assign outputs
  
  assign dma_rd_pointer_o    = {dma_buffer_base_w, dma_rd_pointer_o_r[(DMA_BUFFER_MAX_WIDTH - 1):0]};
  assign dma_overflow_error  = dma_rd_pointer_o_r[DMA_BUFFER_MAX_WIDTH];
  
  assign wbm_addr_o = {dma_buffer_base_w, dma_rd_pointer_o_r[(DMA_BUFFER_MAX_WIDTH - 1):0]};
  assign wbm_sel_o  = 4'b1111;
  assign wbm_we_o   = 1'b0;
  assign wbm_cyc_o  = fifo_wr_enable;
  assign wbm_stb_o  = fifo_wr_enable;
  
endmodule


// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module i2s_to_wb_tx_if
  #(
    parameter DMA_BUFFER_MAX_WIDTH = 12
  )
  (
    input           i2s_enable,
    input           i2s_ws_edge,
    input           i2s_ws_i,
    
    input           fifo_ack,
    
    output          fifo_ready,
    output  [31:0]  fifo_right_data,
    output  [31:0]  fifo_left_data,
    
    output  [31:0]  dma_rd_pointer_o,
    input   [31:0]  dma_rd_pointer_i,
    
    input           dma_rd_pointer_we,
    
    input   [(DMA_BUFFER_MAX_WIDTH - 1):0]  dma_word_size,
    input   [(DMA_BUFFER_MAX_WIDTH - 1):0]  dma_buffer_size,
    
    output          dma_overflow_error,

    input           i2s_clk_i,
    input           i2s_rst_i
  );
  
  //---------------------------------------------------
  // 
  wire  [31:0]  wbm_right_data_i;
  wire  [31:0]  wbm_right_data_o;
  wire  [31:0]  wbm_right_addr_o;
  wire  [3:0]   wbm_right_sel_o;
  wire          wbm_right_we_o;
  wire          wbm_right_cyc_o;
  wire          wbm_right_stb_o;
  wire          wbm_right_ack_i;
  wire          wbm_right_err_i;
  wire          wbm_right_rty_i;

    
  //---------------------------------------------------
  //  sync fifo_ack
  reg  [1:0]  fifo_ack_r;
  wire        fifo_ack_s = fifo_ack_r[1];

  always @(posedge i2s_clk_i)
    fifo_ack_r <= {fifo_ack_r[0], fifo_ack};
      

  //---------------------------------------------------
  //  sync i2s_ws_edge
  reg  [1:0]  i2s_ws_edge_r;
  wire        i2s_ws_edge_s = i2s_ws_edge_r[1];

  always @(posedge i2s_clk_i)
    i2s_ws_edge_r <= {i2s_ws_edge_r[0], i2s_ws_edge};
      

  //---------------------------------------------------
  //  sync i2s_ws_i
  reg  [1:0]  i2s_ws_i_r;
  wire        i2s_ws_i_s = i2s_ws_i_r[1];

  always @(posedge i2s_clk_i)
    i2s_ws_i_r <= {i2s_ws_i_r[0], i2s_ws_i};
    

  //---------------------------------------------------
  //
  wire [31:0] tone_out;

  tone_440_rom
    i_tone_440_rom
    (
      .addr(dma_rd_pointer_o[8:2]),
      .q(tone_out)
    );
    
    assign wbm_right_ack_i  = wbm_right_cyc_o & wbm_right_stb_o;
    assign wbm_right_data_i = tone_out;

    
  //---------------------------------------------------
  // fifo fsm
  wire fifo_empty;
  wire fifo_pop_right;
  wire fifo_pop_left;
  wire fifo_fsm_error;
  
  i2s_to_wb_fifo_fsm 
    i_i2s_to_wb_fifo_fsm
    (
      .i2s_ws_edge(i2s_ws_edge_s),
      .i2s_ws_i(i2s_ws_i_s),
      
      .fifo_enable(i2s_enable),
      .fifo_empty(fifo_empty),
      .fifo_ack(fifo_ack_s),
      
      .fifo_pop_right(fifo_pop_right),
      .fifo_pop_left(fifo_pop_left),
      .fifo_fsm_error(fifo_fsm_error),
      .fifo_ready(fifo_ready),
  
      .i2s_clk_i(i2s_clk_i),
      .i2s_rst_i(i2s_rst_i)
    );
    
    
  //---------------------------------------------------
  //  
  i2s_to_wb_tx_dma #( .DMA_BUFFER_MAX_WIDTH(DMA_BUFFER_MAX_WIDTH) )
    i_tx_dma_right
    (
      .wbm_data_i(wbm_right_data_i),
      .wbm_data_o(wbm_right_data_o),
      .wbm_addr_o(wbm_right_addr_o),
      .wbm_sel_o(wbm_right_sel_o),
      .wbm_we_o(wbm_right_we_o),
      .wbm_cyc_o(wbm_right_cyc_o),
      .wbm_stb_o(wbm_right_stb_o),
      .wbm_ack_i(wbm_right_ack_i),
      .wbm_err_i(wbm_right_err_i),
      .wbm_rty_i(wbm_right_rty_i),
    
      .i2s_enable(i2s_enable),
  
      .fifo_pop(fifo_pop_right),
      
      .fifo_empty(fifo_empty),
    
      .dma_rd_pointer_o(dma_rd_pointer_o),
      .dma_rd_pointer_i(dma_rd_pointer_i),
      
      .dma_rd_pointer_we(dma_rd_pointer_we),
      
      .dma_word_size(dma_word_size),
      .dma_buffer_size(dma_buffer_size),
      
      .dma_overflow_error(dma_overflow_error),
      
      .i2s_clk_i(i2s_clk_i),
      .i2s_rst_i(i2s_rst_i)
    );
  

  //---------------------------------------------------
  // assign outputs
  
  assign fifo_left_data   = 32'h0;
  assign fifo_right_data  = wbm_right_data_o;

  
endmodule



// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module i2s_to_wb_tx
  (
    input   [31:0]  fifo_right_data,
    input   [31:0]  fifo_left_data,
    input           fifo_ready,
    
    output reg      fifo_ack,
    
    output          i2s_ws_edge,
  
    input           i2s_enable,
    input           i2s_sck_i,
    input           i2s_ws_i,
    output          i2s_sd_o
  );

  //---------------------------------------------------
  // fifo_ready edge detection
  reg [2:0] fifo_ready_r;
  wire      fifo_ready_s = fifo_ready_r[1];

  always @(posedge i2s_sck_i)
    fifo_ready_r <= {fifo_ready_r[1:0], fifo_ready};

  wire fifo_ready_rise_edge = (fifo_ready_r[1] ^ fifo_ready_r[2]) & fifo_ready_r[1];


  //---------------------------------------------------
  // i2s_ws_i edge detection
  reg [1:0] i2s_ws_i_r;

  always @(posedge i2s_sck_i)
    i2s_ws_i_r <= {i2s_ws_i_r[0], i2s_ws_i};

  wire i2s_ws_rise_edge;
  wire i2s_ws_fall_edge;

  assign i2s_ws_rise_edge = (i2s_ws_i_r[0] ^ i2s_ws_i_r[1]) & i2s_ws_i_r[0];  // right
  assign i2s_ws_fall_edge = (i2s_ws_i_r[0] ^ i2s_ws_i_r[1]) & ~i2s_ws_i_r[0]; // left


  //---------------------------------------------------
  //  data out shift reg
  reg  [31:0] sd_r;
  wire [31:0] sd_w = i2s_ws_i ? fifo_right_data : fifo_left_data;

  always @(negedge i2s_sck_i)
    if( i2s_ws_edge )
      sd_r <= sd_w;
    else
      sd_r <= {sd_r[30:0], 1'b0};

  //---------------------------------------------------
  // ack flop
  always @(posedge i2s_sck_i)
    if( fifo_ready_s & i2s_ws_edge )
      fifo_ack <= 1'b1;
    else if( ~fifo_ready_s )
      fifo_ack <= 1'b0;
  
  
  //---------------------------------------------------
  // assign outputs

  assign i2s_sd_o     = sd_r[31];
  assign i2s_ws_edge  = i2s_ws_rise_edge | i2s_ws_fall_edge;

endmodule



// -*- mode: Verilog; verilog-auto-lineup-declaration: nil; -*-
//-----------------------------------------------------------------------------
// Title         : Synchronous FIFO
// Project       : Common
//-----------------------------------------------------------------------------
// File          : sync_fifo.v
//-----------------------------------------------------------------------------
// Description : Synchronous FIFO using BRAM.
//
// Implements a variable width/depth synchronous FIFO. The synthesis
// tool may choose to implement the memory as a block RAM.
//-----------------------------------------------------------------------------
// Copyright 1994-2009 Beyond Circuits. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//   1. Redistributions of source code must retain the above copyright notice, 
//      this list of conditions and the following disclaimer.
//   2. Redistributions in binary form must reproduce the above copyright notice, 
//      this list of conditions and the following disclaimer in the documentation 
//      and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE BEYOND CIRCUITS ``AS IS'' AND ANY EXPRESS OR 
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
// SHALL BEYOND CIRCUITS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY 
// OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//------------------------------------------------------------------------------

`timescale 1ns/1ns
module sync_fifo
  #(
    parameter depth = 32,
    parameter width = 32,
    // Need the log of the parameters as parameters also due to an XST bug.
    parameter log2_depth = log2(depth),
    parameter log2_depthp1 = log2(depth+1)
    )
  (
   input clk,
   input reset,
   input wr_enable,
   input rd_enable,
   output reg empty,
   output reg full,
   output [width-1:0] rd_data,
   input [width-1:0] wr_data,
   output reg [log2_depthp1-1:0] count
   );

  // log2 -- return the log base 2 of value.
  function integer log2;
    input [31:0] value;
    begin
      value = value-1;
      for (log2=0; value>0; log2=log2+1)
	value = value>>1;
    end
  endfunction

  // increment -- add one to value modulo depth.
  function [log2_depth-1:0] increment;
    input [log2_depth-1:0] value;
    begin
      if (value == depth-1)
	increment = 0;
      else
	increment = value+1;
    end
  endfunction

  // writing -- true when we write to the RAM.
  wire writing = wr_enable && (rd_enable || !full);

  // reading -- true when we are reading from the RAM.
  wire reading = rd_enable && !empty;

  // rd_ptr -- the read pointer.
  reg [log2_depth-1:0] rd_ptr;

  // next_rd_ptr -- the next value for the read pointer.
  // We need to name this combinational value because it
  // is needed to use the write-before-read style RAM.
  reg [log2_depth-1:0] next_rd_ptr;
  always @(*)
    if (reset)
      next_rd_ptr = 0;
    else if (reading)
      next_rd_ptr = increment(rd_ptr);
    else
      next_rd_ptr = rd_ptr;

  always @(posedge clk)
    rd_ptr <= next_rd_ptr;

  // wr_ptr -- the write pointer
  reg [log2_depth-1:0] wr_ptr;

  // next_wr_ptr -- the next value for the write pointer.
  reg [log2_depth-1:0] next_wr_ptr;
  always @(*)
    if (reset)
      next_wr_ptr = 0;
    else if (writing)
      next_wr_ptr = increment(wr_ptr);
    else
      next_wr_ptr = wr_ptr;

  always @(posedge clk)
    wr_ptr <= next_wr_ptr;
      
  // count -- the number of valid entries in the FIFO.
  always @(posedge clk)
    if (reset)
      count <= 0;
    else if (writing && !reading)
      count <= count+1;
    else if (reading && !writing)
      count <= count-1;

  // empty -- true if the FIFO is empty.
  // Note that this doesn't depend on count so if the count
  // output is unused the logic for computing the count can
  // be optimized away.
  always @(posedge clk)
    if (reset)
      empty <= 1;
    else if (reading && next_wr_ptr == next_rd_ptr && !full)
      empty <= 1;
    else
      if (writing && !reading)
	empty <= 0;
  
  // full -- true if the FIFO is full.
  // Again, this is not dependent on count.
  always @(posedge clk)
    if (reset)
      full <= 0;
    else if (writing && next_wr_ptr == next_rd_ptr)
      full <= 1;
    else if (reading && !writing)
      full <= 0;
  
  // We need to infer a write first style RAM so that when 
  // the FIFO is empty the write data can flow through to
  // the read side and be available the next clock cycle.
  reg [width-1:0] mem [depth-1:0];
  always @(posedge clk)
    begin
      if (writing)
	mem[wr_ptr] <= wr_data;
      rd_ptr <= next_rd_ptr;
    end

  assign rd_data = mem[rd_ptr];

endmodule
`timescale 1ns/10ps
// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module tone_440_rom( addr, q );

  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 7;
  
  input [(ADDR_WIDTH-1):0] addr;
  output [(DATA_WIDTH-1):0] q;
  
  // Declare the RAM variable
  reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
  reg [ADDR_WIDTH-1:0] addr_reg;
  
  
  assign q = ram[addr];

  initial
    $readmemh( "../../../../i2s_to_wb/scilab/tone_roms/tone_440_at_48000sps_rom.txt", ram );

endmodule// --------------------------------------------------------------------
//
// --------------------------------------------------------------------

`include "timescale.v"


module tone_660_rom( addr, q );

  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 7;
  
  input [(ADDR_WIDTH-1):0] addr;
  output [(DATA_WIDTH-1):0] q;
  
  // Declare the RAM variable
  reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
  reg [ADDR_WIDTH-1:0] addr_reg;
  
  
  assign q = ram[addr];

  initial
    $readmemh( "../../../../i2s_to_wb/scilab/tone_roms/tone_660_at_48000sps_rom.txt", ram );

endmodule


