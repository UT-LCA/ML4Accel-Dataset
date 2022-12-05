//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"


module glitch_filter
  #(
    parameter SIZE = 3
  ) 
  (
    input in,
    output reg out,
    
    output rise,
    output fall,
    
    input clk,
    input rst  
  );
  
  
  // --------------------------------------------------------------------
  //  in sync flop
  reg in_reg;
  always @(posedge clk)
    in_reg <= in;


  // --------------------------------------------------------------------
  //  glitch filter
  reg [(SIZE-1):0] buffer;
  always @(posedge clk)
    buffer <= { buffer[(SIZE-2):0], in_reg };
    
  wire all_hi = &{in_reg, buffer};
  wire all_lo = ~|{in_reg, buffer};
  
  wire out_en = (all_hi & in_reg) | (all_lo & ~in_reg);
  
  always @(posedge clk)
    if( out_en )
      out <= buffer[(SIZE-1)];


  // --------------------------------------------------------------------
  //  outputs  
  assign fall = all_lo & out;
  assign rise = all_hi & ~out;

  
endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"


module i2c_to_wb_config
  (
    input   [7:0]       i2c_byte_in,
    input               tip_addr_ack,
    output              i2c_ack_out,
    
    input               wb_clk_i,
    input               wb_rst_i  
  );

  
  // --------------------------------------------------------------------
  //  address decoder  
  reg i2c_addr_ack_out_r;
  
  always @(*)
    casez( i2c_byte_in )
      8'b1111_000?: i2c_addr_ack_out_r = 1'b0;
      default:      i2c_addr_ack_out_r = 1'b1;
    endcase
    
    
  // --------------------------------------------------------------------
  //  outputs  
  assign i2c_ack_out = tip_addr_ack ? i2c_addr_ack_out_r : 1'b0;
//   assign i2c_ack_out = 1'b0;
  
    
endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"


module i2c_to_wb_fsm
  (
    input         i2c_data,
    input         i2c_data_rise,
    input         i2c_data_fall,

    input         i2c_clk,
    input         i2c_clk_rise,
    input         i2c_clk_fall,

    input         i2c_r_w_bit,
    input         i2c_ack_out,
    output        i2c_ack_done,

    output        tip_addr_byte,
    output        tip_read_byte,
    output        tip_write_byte,
    output        tip_wr_ack,
    output        tip_rd_ack,
    output        tip_addr_ack,

    output  [7:0] state_out,
    output        i2c_error,

    input         wb_clk_i,
    input         wb_rst_i
  );

  // --------------------------------------------------------------------
  //  wires
  wire xmt_byte_done;

  wire tip_ack;


  // --------------------------------------------------------------------
  //  start & stop & ack

  wire start_detected = i2c_data_fall & i2c_clk;
  wire stop_detected  = i2c_data_rise & i2c_clk;


  // --------------------------------------------------------------------
  //  state machine

  localparam   STATE_IDLE       = 8'b00000001;
  localparam   STATE_ADDR_BYTE  = 8'b00000010;
  localparam   STATE_ADDR_ACK   = 8'b00000100;
  localparam   STATE_WRITE      = 8'b00001000;
  localparam   STATE_WR_ACK     = 8'b00010000;
  localparam   STATE_READ       = 8'b00100000;
  localparam   STATE_RD_ACK     = 8'b01000000;
  localparam   STATE_ERROR      = 8'b10000000;

  reg [7:0] state;
  reg [7:0] next_state;

  always @(posedge wb_clk_i or posedge wb_rst_i)
    if(wb_rst_i)
      state <= STATE_IDLE;
    else
      state <= next_state;

  always @(*)
    case( state )
      STATE_IDLE:       if( start_detected )
                          next_state = STATE_ADDR_BYTE;
                        else
                          next_state = STATE_IDLE;

      STATE_ADDR_BYTE:  if( xmt_byte_done )
                          next_state = STATE_ADDR_ACK;
                        else if( stop_detected )
                          next_state = STATE_ERROR;
                        else
                          next_state = STATE_ADDR_BYTE;

      STATE_ADDR_ACK:   if(i2c_ack_out)
                          next_state = STATE_IDLE;
                        else
                          if( i2c_ack_done )
                            if( i2c_r_w_bit )
                              next_state = STATE_READ;
                            else
                              next_state = STATE_WRITE;
                          else if( start_detected | stop_detected )
                            next_state = STATE_ERROR;
                          else
                            next_state = STATE_ADDR_ACK;

      STATE_WRITE:      if( xmt_byte_done )
                          next_state = STATE_WR_ACK;
                        else if( start_detected )
                          next_state = STATE_ADDR_BYTE;
                        else if( stop_detected )
                          next_state = STATE_IDLE;
                        else
                          next_state = STATE_WRITE;

      STATE_WR_ACK:     if( i2c_ack_done )
                          next_state = STATE_WRITE;
                        else if( start_detected | stop_detected )
                          next_state = STATE_ERROR;
                        else
                          next_state = STATE_WR_ACK;

      STATE_READ:       if( xmt_byte_done )
                          next_state = STATE_RD_ACK;
                        else if( start_detected )
                          next_state = STATE_ADDR_BYTE;
                        else if( stop_detected )
                          next_state = STATE_IDLE;
                        else
                          next_state = STATE_READ;

      STATE_RD_ACK:     if( i2c_ack_done )
                          if(i2c_data)
                            next_state = STATE_IDLE;
                          else
                            next_state = STATE_READ;
                        else if( start_detected | stop_detected )
                          next_state = STATE_ERROR;
                        else
                          next_state = STATE_RD_ACK;

      STATE_ERROR:      next_state = STATE_IDLE;

      default:          next_state = STATE_ERROR;
    endcase


  // --------------------------------------------------------------------
  //  bit counter
  reg [3:0] bit_count;

  assign  xmt_byte_done = (bit_count == 4'h7) & i2c_clk_rise;
  assign  tip_ack       = (bit_count == 4'h8);
  assign  i2c_ack_done  = tip_ack & i2c_clk_rise;

  always @(posedge wb_clk_i)
    if( wb_rst_i | i2c_ack_done | start_detected )
      bit_count <= 4'hf;
    else if( i2c_clk_fall )
      bit_count <= bit_count + 1;


  // --------------------------------------------------------------------
  //  debug
  wire i2c_start_error = (state == STATE_ADDR_BYTE) & start_detected;


  // --------------------------------------------------------------------
  //  outputs

  assign state_out = state;

  assign  tip_addr_byte   = (state == STATE_ADDR_BYTE);
  assign  tip_addr_ack    = (state == STATE_ADDR_ACK);
  assign  tip_read_byte   = (state == STATE_READ);
  assign  tip_write_byte  = tip_addr_byte               | (state == STATE_WRITE);
  assign  tip_wr_ack      = tip_addr_ack                | (state == STATE_WR_ACK);
  assign  tip_rd_ack      = (state == STATE_RD_ACK);

  assign i2c_error = (state == STATE_ERROR) | i2c_start_error;

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"


module i2c_to_wb_if
  #(
    parameter DW = 32,
    parameter AW = 8
  )
  (
    input                   i2c_data,
    input                   i2c_ack_done,
    input       [7:0]       i2c_byte_in,
    output reg  [7:0]       i2c_byte_out,
    output                  i2c_parallel_load,
    input                   tip_wr_ack,
    input                   tip_rd_ack,
    input                   tip_addr_ack,

    input       [(DW-1):0]  wb_data_i,
    output      [(DW-1):0]  wb_data_o,
    output      [(AW-1):0]  wb_addr_o,
    output  reg [3:0]       wb_sel_o,
    output                  wb_we_o,
    output                  wb_cyc_o,
    output                  wb_stb_o,
    input                   wb_ack_i,
    input                   wb_err_i,
    input                   wb_rty_i,

    input                   wb_clk_i,
    input                   wb_rst_i
  );


  // --------------------------------------------------------------------
  //  wires
  wire i2c_r_w_bit = i2c_byte_in[0];


  // --------------------------------------------------------------------
  //  state machine

  localparam   STATE_IDLE       = 5'b00001;
  localparam   STATE_WRITE      = 5'b00010;
  localparam   STATE_WRITE_WAIT = 5'b00100;
  localparam   STATE_READ       = 5'b01000;
  localparam   STATE_READ_WAIT  = 5'b10000;

  reg [4:0] state;
  reg [4:0] next_state;

  always @(posedge wb_clk_i or posedge wb_rst_i)
    if(wb_rst_i)
      state <= STATE_IDLE;
    else
      state <= next_state;

  always @(*)
    case( state )
      STATE_IDLE:       if( tip_addr_ack & i2c_ack_done )
                          if(i2c_r_w_bit)
                            next_state = STATE_READ;
                          else
                            next_state = STATE_WRITE_WAIT;
                        else
                          next_state = STATE_IDLE;

      STATE_WRITE:      if( wb_ack_i )
                          next_state = STATE_WRITE_WAIT;
                        else
                          next_state = STATE_WRITE;

      STATE_WRITE_WAIT: if( tip_addr_ack )
                          next_state = STATE_IDLE;
                        else
                          if( tip_wr_ack & i2c_ack_done )
                            next_state = STATE_WRITE;
                          else  
                            next_state = STATE_WRITE_WAIT;

      STATE_READ:       if( wb_ack_i )
                          next_state = STATE_READ_WAIT;
                        else
                          next_state = STATE_READ;

      STATE_READ_WAIT:  if( tip_addr_ack )
                          next_state = STATE_IDLE;
                        else
                          if( tip_rd_ack & i2c_ack_done )
                            if(i2c_data)
                              next_state = STATE_IDLE;
                            else  
                              next_state = STATE_READ;
                          else  
                            next_state = STATE_READ_WAIT;

      default:          next_state = STATE_IDLE;
    endcase


  // --------------------------------------------------------------------
  //  wishbone offset address

  reg [7:0] i2c_offset_r;
  always @(posedge wb_clk_i)
    if( tip_addr_ack )
      if(i2c_r_w_bit)
        i2c_offset_r <= 8'h00;
      else
        i2c_offset_r <= 8'hff;
    else if( i2c_ack_done )
      i2c_offset_r <= i2c_offset_r + 1;


  // --------------------------------------------------------------------
  //  byte lane select

  always @(*)
    case( i2c_offset_r[1:0] )
      2'b00:  wb_sel_o = 4'b0001;
      2'b01:  wb_sel_o = 4'b0010;
      2'b10:  wb_sel_o = 4'b0100;
      2'b11:  wb_sel_o = 4'b1000;
    endcase

  always @(*)
    case( wb_sel_o )
      4'b0001:  i2c_byte_out = wb_data_i[7:0];
      4'b0010:  i2c_byte_out = wb_data_i[15:8];
      4'b0100:  i2c_byte_out = wb_data_i[23:16];
      4'b1000:  i2c_byte_out = wb_data_i[31:24];
      default:  i2c_byte_out = wb_data_i[7:0];
    endcase


  // --------------------------------------------------------------------
  //  outputs
  
  assign i2c_parallel_load = (state == STATE_READ);

  assign wb_addr_o[7:0] = i2c_offset_r;
  assign wb_data_o      = {i2c_byte_in, i2c_byte_in, i2c_byte_in, i2c_byte_in};
  assign wb_cyc_o       = (state == STATE_WRITE) | (state == STATE_READ);
  assign wb_stb_o       = (state == STATE_WRITE) | (state == STATE_READ);
  assign wb_we_o        = (state == STATE_WRITE);


endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"


module i2c_to_wb_top
  #(
    parameter DW = 32,
    parameter AW = 8
  )
  (
    input               i2c_data_in,
    input               i2c_clk_in,
    output              i2c_data_out,
    output              i2c_clk_out,
    output              i2c_data_oe,
    output              i2c_clk_oe,

    input   [(DW-1):0]  wb_data_i,
    output  [(DW-1):0]  wb_data_o,
    output  [(AW-1):0]  wb_addr_o,
    output  [3:0]       wb_sel_o,
    output              wb_we_o,
    output              wb_cyc_o,
    output              wb_stb_o,
    input               wb_ack_i,
    input               wb_err_i,
    input               wb_rty_i,

    input               wb_clk_i,
    input               wb_rst_i
  );

  // --------------------------------------------------------------------
  //  wires
  wire tip_addr_byte;
  wire tip_read_byte;
  wire tip_write_byte;
  wire tip_wr_ack;
  wire tip_rd_ack;
  wire tip_addr_ack;

//   wire i2c_ack_out = 1'b0;
  wire i2c_ack_out;
  wire i2c_ack_done;

  wire [7:0]  i2c_byte_out;
  wire        i2c_parallel_load;


  // --------------------------------------------------------------------
  //  glitch filter

  wire gf_i2c_data_in;
  wire gf_i2c_data_in_rise;
  wire gf_i2c_data_in_fall;

  glitch_filter
    i_gf_i2c_data_in(
    .in(i2c_data_in),
    .out(gf_i2c_data_in),

    .rise(gf_i2c_data_in_rise),
    .fall(gf_i2c_data_in_fall),

    .clk(wb_clk_i),
    .rst(wb_rst_i)
  );

  wire gf_i2c_clk_in;
  wire gf_i2c_clk_in_rise;
  wire gf_i2c_clk_in_fall;

  glitch_filter
    i_gf_i2c_clk_in(
    .in(i2c_clk_in),
    .out(gf_i2c_clk_in),

    .rise(gf_i2c_clk_in_rise),
    .fall(gf_i2c_clk_in_fall),

    .clk(wb_clk_i),
    .rst(wb_rst_i)
  );


  // --------------------------------------------------------------------
  //  i2c data shift register w/ parallel load

  reg  [8:0]  i2c_data_in_r;                    // add throw away bit for serial_out
  wire        serial_out = i2c_data_in_r[8];

  always @(posedge wb_clk_i)
    if( i2c_parallel_load )
      i2c_data_in_r[7:0] <= i2c_byte_out;
    else if( (tip_write_byte & gf_i2c_clk_in_rise) | (tip_read_byte & gf_i2c_clk_in_fall) )
      i2c_data_in_r <= {i2c_data_in_r[7:0], gf_i2c_data_in};


  // --------------------------------------------------------------------
  //  main state machine
  i2c_to_wb_fsm
    i_i2c_to_wb_fsm
    (
      .i2c_data(gf_i2c_data_in),
      .i2c_data_rise(gf_i2c_data_in_rise),
      .i2c_data_fall(gf_i2c_data_in_fall),

      .i2c_clk(gf_i2c_clk_in),
      .i2c_clk_rise(gf_i2c_clk_in_rise),
      .i2c_clk_fall(gf_i2c_clk_in_fall),

      .i2c_r_w_bit(i2c_data_in_r[0]),
      .i2c_ack_out(i2c_ack_out),
      .i2c_ack_done(i2c_ack_done),

      .tip_addr_byte(tip_addr_byte),
      .tip_read_byte(tip_read_byte),
      .tip_write_byte(tip_write_byte),
      .tip_wr_ack(tip_wr_ack),
      .tip_rd_ack(tip_rd_ack),
      .tip_addr_ack(tip_addr_ack),

      .state_out(),
      .i2c_error(),

      .wb_clk_i(wb_clk_i),
      .wb_rst_i(wb_rst_i)
    );


  // --------------------------------------------------------------------
  //  i2c_to_wb_config
  i2c_to_wb_config
    i_i2c_to_wb_config
    (
      .i2c_byte_in(i2c_data_in_r[7:0]),
      .tip_addr_ack(tip_addr_ack),
      .i2c_ack_out(i2c_ack_out),

      .wb_clk_i(wb_clk_i),
      .wb_rst_i(wb_rst_i)
    );


  // --------------------------------------------------------------------
  //  i2c_to_wb_if
  i2c_to_wb_if #( .DW(DW), .AW(AW) )
    i_i2c_to_wb_if(
      .i2c_data(gf_i2c_data_in),
      .i2c_ack_done(i2c_ack_done),
      .i2c_byte_in(i2c_data_in_r[7:0]),
      .i2c_byte_out(i2c_byte_out),
      .i2c_parallel_load(i2c_parallel_load),
      .tip_wr_ack(tip_wr_ack),
      .tip_rd_ack(tip_rd_ack),
      .tip_addr_ack(tip_addr_ack),

      .wb_data_i(wb_data_i),
      .wb_data_o(wb_data_o),
      .wb_addr_o(wb_addr_o),
      .wb_sel_o(wb_sel_o),
      .wb_we_o(wb_we_o),
      .wb_cyc_o(wb_cyc_o),
      .wb_stb_o(wb_stb_o),
      .wb_ack_i(wb_ack_i),
      .wb_err_i(wb_err_i),
      .wb_rty_i(wb_rty_i),

      .wb_clk_i(wb_clk_i),
      .wb_rst_i(wb_rst_i)
    );


  // --------------------------------------------------------------------
  //  i2c_data out sync

  reg i2c_data_oe_r;
  always @(posedge wb_clk_i)
    if( wb_rst_i )
      i2c_data_oe_r <= 1'b0;
    else if( gf_i2c_clk_in_fall )
      i2c_data_oe_r <= tip_read_byte | tip_wr_ack;

  reg i2c_data_mux_select_r;
  always @(posedge wb_clk_i)
    if( gf_i2c_clk_in_fall )
      i2c_data_mux_select_r <= tip_wr_ack;


  // --------------------------------------------------------------------
  //  outputs

  assign i2c_data_out = i2c_data_mux_select_r ? i2c_ack_out : serial_out;
  assign i2c_data_oe  = i2c_data_oe_r;
  assign i2c_clk_out  = 1'b1;
  assign i2c_clk_oe   = 1'b0;

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`timescale 1ns/10ps
