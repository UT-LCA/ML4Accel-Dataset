/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: fifo_interface.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

import fifo_package::* ;
interface fifo_bus(input clk_i) ;
   //   wire [DATA_WIDTH-1:0] push_dat ;
   //   wire [DATA_WIDTH-1:0] pop_dat ;
   wire [10:0]           push_dat ;
   wire [10:0]           pop_dat ;
   wire                  push ;
   wire                  pop ;
   wire                  empty ;
   wire                  full ;
   wire                  almost_full ;
   
   modport push_master_mp (
                           output push_dat, push,
                           input  full, almost_full
                           ) ;
   
   modport push_slave_mp (
                          input  push_dat, push,
                          output full, almost_full, empty
                          ) ;
   
   modport pop_master_mp (
                          output pop,
                          input  pop_dat, empty, almost_full, full
                          ) ;
   
   modport pop_slave_mp (
                         input  pop,
                         output pop_dat, empty, almost_full, full
                         ) ;
   
`ifdef SIM
   import fifo_be_package:: * ;
   
   logic [10:0]                 pop_d ;
   logic [10:0]                 push_d ;
   logic                        pop_en;
   logic                        push_en ;
   logic [10:0]                 data ;
   
   assign push_dat = push_d ;
   assign push     = push_en ;
   assign pop_d    = pop_dat ;
   assign pop      = pop_en ;
   
   initial begin
      push_d = 0 ;
      pop_en = 0 ;
      push_en = 0 ;
   end
   
   task burst_read(output logic [10:0] data) ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      data = pop_d ;
      pop_en = 1'b1 ;
   endtask // read
   
   task burst_write(input logic [10:0] data) ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      push_d  = data ;
      push_en = 1'b1 ;
   endtask // write

   task read(output logic [10:0] data) ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      data = pop_d ;
      pop_en = 1'b1 ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      pop_en = 1'b0 ;
   endtask // read
   
   task write(input logic [10:0] data) ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      push_d  = data ;
      push_en = 1'b1 ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      push_d  = 'hxx ;
      push_en = 1'b0 ;
   endtask // write

   task nop() ;
      @(posedge clk_i) ;
      #(STEP*0.1) ;
      push_d  = 11'hxxx ;
      pop_en  = 1'b0 ;
      push_en = 1'b0 ;
   endtask // write

`endif //  `ifdef SIM
   
endinterface : fifo_bus

/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: fifo_package.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

package fifo_package ;
`ifdef SYN
 /* empty */
`else
   timeunit      1ps ;
   timeprecision 1ps ;
`endif
   // -- read for manual -> 4.4 FIFO Control Register (FCR)
   // -- almost trgger level --
   localparam LEVEL_1 = 5'h1 ;
   localparam LEVEL_2 = 5'h4 ;
   localparam LEVEL_3 = 5'h8 ;
   localparam LEVEL_4 = 5'hE ;
   
   typedef  struct { 
                     logic [10:0] mem [0:15] ;
                     logic [0:0]  err [0:15] ;
                     logic [3:0]  write_pointer ;
                     logic [3:0]  read_pointer ;
                     logic        full ;
                     logic        almost_full ;
                     logic        empty ;
                     } u_fifo_t ;

endpackage : fifo_package
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_16550_rll.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

module uart_16550_rll(interface wb_bus, uart_bus uart_bus) ;
   import uart_package:: * ;
   
   wire    clk_i  = wb_bus.clk_i ;
   wire    nrst_i = wb_bus.nrst_i ;
   wire    overrun ;
   wire    rec_buf_empty ;
   wire    trans_buf_empty ;
   wire    rec_clk_en ;
   wire    rec_sample_pulse ;
   wire    leading_edge ;
   wire    trans_clk_en ;
   wire    txd_out ;
   wire    rxd_clean ;
   wire    rxd_clean_out ;
   wire    timeout_signal ;
   
   fifo_bus
     fifo_pop_trans(.clk_i(clk_i)),
     fifo_push_rec(.clk_i(clk_i)) ;
   
   //   uart_bus uart_bus() ;
   u_reg_t u_reg ;
   codec_state_t rec_next_state ;
   u_codec_t trans_codec ;
   
   // -- loopback mode --
   assign  uart_bus.stx_o = u_reg.modem_control_reg.loopback == 1'b1 ? 1'b1 : txd_out ;
   assign  rxd_clean      = u_reg.modem_control_reg.loopback == 1'b1 ? txd_out : rxd_clean_out ;
   
   uart_register u_register(.clk_i(clk_i),
                            .nrst_i(nrst_i),
                            .wb_bus(wb_bus),
                            .uart_bus(uart_bus),
                            .u_reg(u_reg),
                            .fifo_pop_trans(fifo_pop_trans),
                            .fifo_push_rec(fifo_push_rec),
                            .timeout_signal(timeout_signal),
                            .overrun(overrun),
                            .rec_buf_empty(rec_buf_empty),
                            .trans_buf_empty(trans_buf_empty)) ;
   
   uart_transmitter u_trans(.clk_i(clk_i),
                            .nrst_i(nrst_i),
                            .trans_clk_en(trans_clk_en),
                            .txd_out(txd_out),
                            .fifo_pop(fifo_pop_trans.pop_master_mp),
                            .u_reg(u_reg),
                            .trans_codec(trans_codec),
                            .trans_buf_empty(trans_buf_empty)) ;
   
   uart_receiver u_rec(.clk_i(clk_i),
                       .nrst_i(nrst_i),
                       .rec_clk_en(rec_clk_en),
                       .rec_sample_pulse(rec_sample_pulse),
                       .rxd_clean(rxd_clean),
                       .leading_edge(leading_edge),
                       .timeout_signal(timeout_signal),
                       .fifo_push(fifo_push_rec.push_master_mp),
                       .u_reg(u_reg),
                       .next_state(rec_next_state),
                       .overrun(overrun),
                       .rec_buf_empty(rec_buf_empty)) ;
   
   uart_baud u_baud(.clk_i(clk_i),
                    .nrst_i(nrst_i),
                    .u_reg(u_reg),
                    .rec_next_state(rec_next_state),
                    .trans_codec(trans_codec),
                    .rxd_clean(rxd_clean),
                    .rec_clk_en(rec_clk_en),
                    .rec_sample_pulse(rec_sample_pulse),
                    .leading_edge(leading_edge),
                    .timeout_signal(timeout_signal),
                    .trans_clk_en(trans_clk_en)) ;
   
   uart_noize_shaver u_shaver(.clk_i(clk_i),
                              .nrst_i(nrst_i),
                              .rxd_i(uart_bus.srx_i),
                              .rxd_clean(rxd_clean_out)) ;
   
endmodule

/// END OF FILE ///
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_baud.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif
import uart_package:: * ;
module uart_baud
  (
   input wire clk_i,
   input wire nrst_i,
   input u_reg_t u_reg,
   input codec_state_t  rec_next_state,
   input u_codec_t  trans_codec,
   input wire  rxd_clean,
   output wire rec_clk_en,
   output wire rec_sample_pulse,
   output wire leading_edge,
   output wire timeout_signal,
   output wire trans_clk_en
   ) ;

   // -------------------
   // -- receiver baud --
   // -------------------
   // -- leading edge generate --
   logic [3:0] rec_count ;
   logic [7:0] rec_divisor ;
   logic       rxd_l ;
   logic [5:0] timeout_c ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rxd_l <= #1 1'b1 ;
      else
        rxd_l <= #1 rxd_clean ;
   end

   wire rec_count_enable = rec_count == 4'hf ;
   wire rec_count_sample = rec_count == 4'h8 ;
   assign leading_edge = (rxd_l & ~rxd_clean) && (rec_next_state == IDLE ||
                                                  rec_next_state == TIMEOUT ||
                                                  rec_next_state == STOP) ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_count <= #1 4'h0 ;
      else if(rec_next_state == IDLE || rec_count_enable == 1'b1 || leading_edge == 1'b1)
        rec_count <= #1 4'h0 ;
      else
        rec_count <= #1 rec_count + 4'h1 ;
   end
   wire rec_count_end      = rec_divisor == u_reg.baud_reg && rec_count_enable == 1'b1 ;
   // sample pulse position -> baud_reg/2 
   assign rec_sample_pulse = rec_divisor == {1'b0, u_reg.baud_reg[7:1]} && rec_count_sample == 1'b1 ;
   assign rec_clk_en       = rec_count_end ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_divisor <= #1 8'h00 ;
      else if(rec_count_end == 1'b1 || rec_next_state == IDLE || leading_edge == 1'b1)
        rec_divisor <= #1 8'h00 ;
      else if(rec_count_enable == 1'b1)
        rec_divisor <= #1 rec_divisor + 8'h01 ;
      else
        rec_divisor <= #1 rec_divisor ;
   end

   // -- timeout counter --
   // about 4 character :: read for manual -> 4.3 Interrupt Identification Register (IIR)
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        timeout_c <= #1 6'h00 ;
      else if(timeout_signal == 1'b1 || rec_next_state == IDLE || leading_edge == 1'b1)
        timeout_c <= #1 6'h00 ;
      else if(rec_count_end == 1'b1)
        timeout_c <= #1 timeout_c + 6'h01 ;
      else
        timeout_c <= #1 timeout_c ;
   end
   assign timeout_signal = timeout_c == 6'h28 && rec_count_end == 1'b1 ;
   
   // ----------------------
   // -- transmitter baud --
   // ----------------------
   logic [3:0] trans_count ;
   logic [7:0] trans_divisor ;

   wire        trans_count_enable = trans_count == 4'hf ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        trans_count <= #1 4'h0 ;
      else if(trans_codec.state == IDLE || trans_count_enable == 1'b1)
        trans_count <= #1 4'h0 ;
      else
        trans_count <= trans_count + 4'h1 ;
   end
   
   wire trans_count_end = trans_divisor == u_reg.baud_reg && trans_count_enable == 1'b1 ;
   assign trans_clk_en = trans_count_end ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        trans_divisor <= #1 8'h00 ;
      else if(trans_count_end == 1'b1 || trans_codec.state == IDLE)
        trans_divisor <= #1 8'h00 ;
      else if(trans_count_enable == 1'b1)
        trans_divisor <= #1 trans_divisor + 8'h01 ;
      else
        trans_divisor <= #1 trans_divisor ;
   end
   
endmodule
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_codec_state.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif
import uart_package:: * ;
module uart_codec_state(input  u_reg_t       u_reg,
                        input  u_codec_t     codec,
                        input  wire          receiver_mode,
                        input  wire          timeout_signal,
                        output codec_state_t next_state
                        ) ;
   
   //   import uart_package:: * ;
   
   // -- count state -------------------
   // -  IDLE --> START -> SEND0..SEND6->SEND7->PARITY->STOP
   // -   ^         ^               |      |     ^      ^ |
   // -   |         |               +------+---->+------+ |
   // -   +---------+-------------------------------------+
   // - IDLE -> START  :: transmit data : start bit
   // - STOP -> START  :: transmit data : start bit
   // - START -> SEND0 :: alway
   // - SEND1 -> SEND2 :: alway
   // -  .......
   // - SEND6 -> PARITY :: 7bit && parity  
   // - SEND6 -> STOP   :: 7bit    
   // - SEND6 -> SEND7 :: 8bit 
   // - SEND7 -> PARITY :: 8bit && parity  
   // - SEND7 -> STOP   :: 8bit  
   // - STOP  -> IDLE   :: not start bit
   // ----------------------------------
   always_comb begin
      case (codec.state)
        IDLE : begin
           if(codec.start == 1'b1)
             next_state = START ;
           else
             next_state = IDLE ;
        end
        
        TIMEOUT : begin
           if(codec.start == 1'b1)
             next_state = START ;
           else if(timeout_signal == 1'b1 || u_reg.line_status_reg.data_ready == 1'b0)
             next_state = IDLE ;
           else
             next_state = TIMEOUT ;
        end
        
        START : next_state = SEL_0 ;
        SEL_0 : next_state = SEL_1 ;
        SEL_1 : next_state = SEL_2 ;
        SEL_2 : next_state = SEL_3 ;
        SEL_3 : next_state = SEL_4 ;
        SEL_4 : next_state = SEL_5 ;
        SEL_5 : begin
           if(u_reg.line_control_reg.char_length == CHAR_7_BIT)
             next_state = DATA_END ;
           else
             next_state = SEL_6 ;
        end
        
        SEL_6 : next_state = DATA_END ;
        
        DATA_END : begin
           if(u_reg.line_control_reg.parity_enable == 1'b1)
             next_state = PARITY ;
           else
             next_state = STOP ;
        end
        
        PARITY :  next_state = STOP ;

        STOP : begin
           if(codec.start == 1'b1)
             next_state = START ;
           else if(u_reg.line_status_reg.data_ready == 1'b1 && receiver_mode == 1'b1) 
             next_state = TIMEOUT ;
           else
             next_state = IDLE ;
        end
        default : next_state = IDLE ;
      endcase
   end
endmodule
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_fifo.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

  // module uart_fifo #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 2)
  import fifo_package:: * ;
  module uart_fifo
    (input wire clk_i,
     input wire nrst_i,
     input wire clear,
     input wire [1:0] almost_empty_level,
     fifo_bus   fifo_pop,
     fifo_bus   fifo_push,
     output wire all_error
     ) ;

   parameter ADDR_WIDTH = 2 ;
   parameter DATA_WIDTH = 2 ;
   
   //   u_fifo_t  #(DATA_WIDTH(8), ADDR_WIDTH(4)) u_fifo ;
   u_fifo_t    u_fifo ;
   wire [ADDR_WIDTH-1:0] r_c1 ;
   reg                   f_fr ;
   wire                  pop    = fifo_pop.pop ;
   wire                  push   = fifo_push.push ;
   wire [DATA_WIDTH-1:0] push_dat = fifo_push.push_dat ;
   logic  almost_full ;
   
   assign fifo_push.empty = (u_fifo.write_pointer == u_fifo.read_pointer) & ~f_fr ;
   assign fifo_push.full  = (u_fifo.write_pointer == u_fifo.read_pointer) &  f_fr ;
   
   assign fifo_pop.empty = (u_fifo.write_pointer == u_fifo.read_pointer) & ~f_fr ;
   assign fifo_pop.full  = (u_fifo.write_pointer == u_fifo.read_pointer) &  f_fr ;
   assign fifo_push.almost_full = almost_full ;
   
   always_comb begin
      case (almost_empty_level)
        2'b00   : begin
           almost_full = f_fr == 1'b1
                                ? (u_fifo.write_pointer - u_fifo.read_pointer) == LEVEL_1
                                : (u_fifo.write_pointer + u_fifo.read_pointer) == LEVEL_1 ;
        end
        2'b01   : begin
           almost_full = f_fr == 1'b1
                                ? (u_fifo.write_pointer - u_fifo.read_pointer) == LEVEL_2
                                : (u_fifo.write_pointer + u_fifo.read_pointer) == LEVEL_2 ;
        end
        2'b10   : begin
           almost_full = f_fr == 1'b1
                                ? (u_fifo.write_pointer - u_fifo.read_pointer) == LEVEL_3
                                : (u_fifo.write_pointer + u_fifo.read_pointer) == LEVEL_3 ;
        end
        2'b11   : begin
           almost_full = f_fr == 1'b1
                                ? (u_fifo.write_pointer - u_fifo.read_pointer) == LEVEL_4
                                : (u_fifo.write_pointer + u_fifo.read_pointer) == LEVEL_4 ;
        end
      endcase // case (almost_empty_level)
   end // always_comb begin
   
   assign #100 fifo_pop.pop_dat   =  u_fifo.mem[u_fifo.read_pointer] ;
   assign  all_error = u_fifo.err[0] |
                       u_fifo.err[1] |
                       u_fifo.err[2] |
                       u_fifo.err[3] |
                       u_fifo.err[4] |
                       u_fifo.err[5] |
                       u_fifo.err[6] |
                       u_fifo.err[7] |
                       u_fifo.err[8] |
                       u_fifo.err[9] |
                       u_fifo.err[10] |
                       u_fifo.err[11] |
                       u_fifo.err[12] |
                       u_fifo.err[13] |
                       u_fifo.err[14] |
                       u_fifo.err[15] ;



   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0) begin
         u_fifo.err[0] <= #1 1'b0 ;
         u_fifo.err[1] <= #1 1'b0 ;
         u_fifo.err[2] <= #1 1'b0 ;
         u_fifo.err[3] <= #1 1'b0 ;
         u_fifo.err[4] <= #1 1'b0 ;
         u_fifo.err[5] <= #1 1'b0 ;
         u_fifo.err[6] <= #1 1'b0 ;
         u_fifo.err[7] <= #1 1'b0 ;
         u_fifo.err[8] <= #1 1'b0 ;
         u_fifo.err[9] <= #1 1'b0 ;
         u_fifo.err[10] <= #1 1'b0 ;
         u_fifo.err[11] <= #1 1'b0 ;
         u_fifo.err[12] <= #1 1'b0 ;
         u_fifo.err[13] <= #1 1'b0 ;
         u_fifo.err[14] <= #1 1'b0 ;
         u_fifo.err[15] <= #1 1'b0 ;
         u_fifo.mem[4'h0] <= #1 11'h000 ; // initial addr:'h0->data::'h0
      end
      else
        case ({push, pop})
          2'b01 : u_fifo.err[u_fifo.read_pointer] <= #1 1'b0 ;
          2'b10 : begin
             u_fifo.mem[u_fifo.write_pointer] <= #1 push_dat[10:0] ;
             u_fifo.err[u_fifo.write_pointer] <= #1 |(push_dat[10:8]) ;
          end
          2'b11 : begin
             u_fifo.mem[u_fifo.write_pointer] <= #1 push_dat[10:0] ;
             u_fifo.err[u_fifo.write_pointer] <= #1 |(push_dat[10:8]) ;
             u_fifo.err[u_fifo.read_pointer]  <= #1 1'b0 ;
          end
          default : u_fifo.err <= #1 u_fifo.err ;
        endcase // case ({push, pop})
   end // always @ (posedge clk_i, negedge nrst_i)
   
   assign r_c1 = u_fifo.read_pointer - 'h01 ;
   
   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        f_fr <= #1 1'b0 ;
      else if(r_c1 == u_fifo.write_pointer)
        f_fr <= #1 1'b1 ;
      else if(pop == 1'b1 || clear == 1'b1)
        f_fr <= #1 1'b0 ;
      else
        f_fr <= #1 f_fr ;
   end
   
   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_fifo.write_pointer <= #1 'h00 ;
      else if(clear == 1'b1)
        u_fifo.write_pointer <= #1 'h00 ;
      else if(push == 1'b1)
        u_fifo.write_pointer <= #1 u_fifo.write_pointer + 'h01 ;
      else
        u_fifo.write_pointer <= #1 u_fifo.write_pointer ;
   end

   // -- read pinter inc & clear to current error bit --
   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_fifo.read_pointer <= #1 'h00 ;
      else if(clear == 1'b1)
        u_fifo.read_pointer <= #1 'h00 ;
      else if(pop == 1'b1)
        u_fifo.read_pointer <= #1 u_fifo.read_pointer + 'h01 ;
      else
        u_fifo.read_pointer <= #1 u_fifo.read_pointer ;
   end

endmodule
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_interface.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */
// --- uart16550 interface signale ---
`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif
interface uart_bus ;
   
   
   wire  stx_o ;
   wire  srx_i ;
   wire  rts_o ;
   wire  cts_i ;
   wire  dtr_o ;
   wire  dsr_i ;
   wire  ri_i ;
   wire  dcd_i ;
endinterface : uart_bus

interface wb_bus() ;
   wire  clk_i ;   // clock 
   wire  nrst_i ;  // reset 
   wire [31:0] adr_i ;   // address
   wire [31:0] dat_i ;   // data input
   wire [31:0]  dat_o ;   // data output
   wire         we_i  ;   // write enable
   wire [3:0]   sel_i ;   // select
   wire         stb_i ;   // strobe signal
   wire         ack_o ;   // acknowledge
   wire         cyc_i ;   // cycle assrted
   wire         intr_o ;  // interrupt output
   
   modport master_mp(
                     output  clk_i, nrst_i, adr_i, dat_i, we_i, sel_i, cyc_i, stb_i,
                     input  dat_o, ack_o, intr_o
                     ) ;
   
   modport slave_mp(
                    input  clk_i, nrst_i, adr_i, dat_i, we_i, sel_i, stb_i, cyc_i,
                    output dat_o, ack_o, intr_o) ;
   
endinterface : wb_bus

/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_noize_shaver.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

module uart_noize_shaver
  (
   input wire clk_i,
   input wire nrst_i,
   input wire rxd_i,
   output rxd_clean
   ) ;
   // -- receiver baud --
   logic [3:0] count ;
   logic [3:0] shift ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        count <= #1 0 ;
      else
        count <= #1 count + 4'h1 ;
   end
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        shift <= #1 4'b1111 ;
      else if(count == 4'h0)
        shift <= #1 {shift[2:0], rxd_i} ;
      else
        shift <= #1 shift ;
   end
   
   assign rxd_clean = shift == 4'hf ||
                      shift == 4'he ||
                      shift == 4'hd ||
                      shift == 4'hb ||
                      shift == 4'h7 ;
endmodule
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_package.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

package uart_package ;
`ifdef SYN
 /* empty */
`else
   timeunit      1ps ;
   timeprecision 1ps ;
`endif

   localparam   UART_RXD               =  'h0 ;
   localparam   UART_TXD               =  'h0 ;
   localparam   UART_INTERRUPT_ENABLE  =  'h1 ;
   localparam   UART_INTERRUPT_IDENT   =  'h2 ;
   localparam   UART_FIFO_CONTROL      =  'h2 ;
   localparam   UART_LINE_CONTROL      =  'h3 ;
   localparam   UART_MODEM_CONTROL     =  'h4 ;
   localparam   UART_LINE_STATUS       =  'h5 ;
   localparam   UART_MODEM_STATUS      =  'h6 ;
   localparam   UART_SCRATCH           =  'h7 ;
   localparam   UART_BAUD              =  'h0 ;
   
typedef enum logic [3:0] {
                          IDLE,
                          TIMEOUT,
                          STOP,
                          START,
                          SEL_0,
                          SEL_1,
                          SEL_2,
                          SEL_3,
                          SEL_4,
                          SEL_5,
                          SEL_6,
                          DATA_END,
                          PARITY
                          } codec_state_t ;

// -- read for manual - 4.5 Line Control Register (LCR) --
typedef enum logic [1:0] {
                          CHAR_8_BIT   = 2'b11,
                          CHAR_7_BIT   = 2'b10,
                          CHAR_6_BIT   = 2'b01,
                          CHAR_5_BIT   = 2'b00
                          } char_length_t ;

// -- read for manual - 4.3 Interrupt Identification Register (IIR) --
typedef enum logic [3:0] {
                          REC_LINE_STATUS     = 4'b0110,
                          REC_DATA_AVAILABLE  = 4'b0100,
                          TIME_OUT            = 4'b1100,
                          TRANS_REG_EMPTY     = 4'b0010,
                          MODEM_STATUS        = 4'b0000,
                          NO_INTERRUPT        = 4'b0001   // -- bit 0 -> "1" no interrupt pending
                          } interrupt_identification_t ;

typedef struct packed {
                       logic [3:0] ignored_74_bit ;
                       logic modem_status ;
                       logic rec_line_status ;
                       logic trans_holding_reg_empty ;
                       logic rec_data_available ;
                       } interrupt_enable_reg_t ;

typedef struct packed {
                       logic [3:0] ignored_74_value_hC ;
                       interrupt_identification_t  interrupt_identification ;
                       } interrupt_identification_reg_t ;

typedef struct packed {
                       logic modem_status ;
                       logic transmitter_holding_register_empty ;
                       logic timeout_indication ;
                       logic receiver_data_available ;
                       logic receiver_line_status ;
                       } interrupt_pending_reg_t ;

// -- read for manual - 4.4 FIFO Control Register (FCR) --
typedef enum logic [1:0] {
                          BYTE_1  = 2'b00,
                          BYTE_4  = 2'b01,
                          BYTE_8  = 2'b10,
                          BYTE_14 = 2'b11
                          } define_fifo_trigger_level_t ;

typedef struct packed {
                       define_fifo_trigger_level_t define_fifo_trigger_level ;
                       logic [2:0]                 ignored_53_bit ;
                       logic                       transmitter_fifo_reset ;
                       logic                       receiver_fifo_reset ;
                       logic                       ignored_0_bit ;
                       } fifo_control_reg_t ;

typedef struct packed {
                       logic         divisor_access ;
                       logic         break_control_bit ;
                       logic         stick_parity ;
                       logic         even_parity ;
                       logic         parity_enable ;
                       logic         stop_bit_count ;
                       char_length_t char_length ;
                       } line_control_reg_t ;

typedef struct packed {
                       logic [2:0]  ignored_75_bit ;
                       logic loopback ;
                       logic out2 ;
                       logic out1 ;
                       logic rts ;
                       logic dtr ;
                       } modem_control_reg_t ;

typedef struct packed {
                       logic        all_error ;
                       logic        trans_empty ;
                       logic        trans_fifo_empty ;
                       logic        break_intr ;
                       logic        framing_err ;
                       logic        parity_err ;
                       logic        overrun_err ;
                       logic        data_ready ;
                       } line_status_reg_t ;

typedef struct packed {
                       logic dcd ;
                       logic ri ;
                       logic dsr ;
                       logic cts ;
                       logic dcd_indicator ;
                       logic ri_indicator ;
                       logic dsr_indicator ;
                       logic cts_indicator ;
                       } modem_status_reg_t ;

typedef struct packed{
                      interrupt_enable_reg_t          interrupt_enable_reg ;
                      interrupt_identification_reg_t  interrupt_ident_reg ;
                      fifo_control_reg_t              fifo_control_reg ;
                      modem_control_reg_t             modem_control_reg ;
                      line_control_reg_t              line_control_reg ;
                      line_status_reg_t               line_status_reg ;
                      modem_status_reg_t              modem_status_reg ;
                      interrupt_pending_reg_t         interrupt_pending_reg ;
                      logic [7:0]                     scratch_reg ;
                      logic [7:0]                     baud_reg ;
                      } u_reg_t ;

typedef struct packed{
                      logic [7:0]   data_r ;
                      logic         start ;
                      logic         line ;
                      logic         framing_err ;
                      logic         parity_err ;
                      logic         break_err ;
                      codec_state_t state ;
                      } u_codec_t ;
endpackage : uart_package

/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_receiver.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

import uart_package:: * ;
module uart_receiver(
                     input wire     clk_i,
                     input wire     nrst_i,
                     input wire     rxd_clean,
                     input wire     rec_clk_en,
                     input wire     rec_sample_pulse,
                     input wire     leading_edge,
                     input wire     timeout_signal,
                     fifo_bus       fifo_push,
                     input  u_reg_t u_reg,
                     output codec_state_t next_state,
                     output  logic  rec_buf_empty,
                     output  logic  overrun
                     ) ;
   
   //   codec_state_t     next_state ;
   u_codec_t         rec_codec ;
   
   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_codec.line <= #1 1'b1 ;
      else
        rec_codec.line <= #1 rxd_clean ;
   end
   
   // --- fifo push --  
   assign fifo_push.push_dat =  {rec_codec.parity_err,    // bit[10]
                                 rec_codec.framing_err,   //     9
                                 rec_codec.break_err,     //     8
                                 rec_codec.data_r}  ;     //     [7:0]
   logic push_dly ;
   always @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        push_dly <= #1 1'b0 ;
      else
        push_dly <= #1 next_state == STOP && rec_sample_pulse == 1'b1 ;
   end
   assign fifo_push.push = push_dly == 1'b1 ;
   
   // -- trasmitter state logic --
   uart_codec_state rec_state(.u_reg(u_reg),
                              .codec(rec_codec),
                              .receiver_mode(1'b1),
                              .timeout_signal(timeout_signal),
                              .next_state(next_state)) ;
   
   // -- state register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_codec.state <= #1 IDLE ;
      else if(rec_clk_en == 1'b1 || leading_edge == 1'b1)
        rec_codec.state <= #1 next_state ;
      else
        rec_codec.state <= #1 rec_codec.state ;
   end
   
   // -- line input --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0) begin
         rec_codec.data_r <= #1 8'h00 ;
         rec_codec.framing_err <= #1 1'b0 ;
         rec_codec.parity_err  <= #1 1'b0 ;
         rec_codec.break_err   <= #1 1'b0 ;
         overrun <= #1 1'b0 ;
      end
      else begin
         if(rec_sample_pulse == 1'b1)
           case (next_state)
             IDLE  : /* empty */ ;
             START : begin 
                overrun   <= #1 1'b0 ;
                rec_codec.framing_err <= #1 1'b0 ;
                rec_codec.parity_err  <= #1 1'b0 ;
                rec_codec.break_err   <= #1 1'b0 ;
             end
             SEL_0 : rec_codec.data_r[0] <= #1 rec_codec.line ;
             SEL_1 : rec_codec.data_r[1] <= #1 rec_codec.line ;
             SEL_2 : rec_codec.data_r[2] <= #1 rec_codec.line ;
             SEL_3 : rec_codec.data_r[3] <= #1 rec_codec.line ;
             SEL_4 : rec_codec.data_r[4] <= #1 rec_codec.line ;
             SEL_5 : rec_codec.data_r[5] <= #1 rec_codec.line ;
             SEL_6 : rec_codec.data_r[6] <= #1 rec_codec.line ;
             DATA_END : begin
                if(u_reg.line_control_reg.char_length == CHAR_7_BIT) begin
                   rec_codec.data_r[6] <= #1 rec_codec.line ;
                   rec_codec.data_r[7] <= #1 1'b0 ;
                end
                else begin
                   rec_codec.data_r[7] <= #1 rec_codec.line ;
                end
                overrun <= #1 fifo_push.full ;
             end
             PARITY : begin
                if(u_reg.line_control_reg.even_parity == 1'b1)
                  rec_codec.parity_err <= #1 (^rec_codec.data_r) ^ rec_codec.line ;
                else
                  rec_codec.parity_err <= #1 ~(^rec_codec.data_r) ^ rec_codec.line ;
             end
             STOP  : begin
                rec_codec.framing_err <= #1 rec_codec.line == 1'b0 &&
                                         rec_codec.data_r[7:0] != 8'h00 ;
                rec_codec.break_err <= #1 rec_codec.data_r[7:0] == 8'h00 &&
                                       rec_codec.line == 1'b0 &&
                                       rec_codec.parity_err == 1'b0 ;
             end
             default : /* empty */ ;
           endcase // case (state)
      end // if (sample_en == 1'b1)
   end // always_ff @ (posedge clk, negedge nrst)
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_buf_empty <= 1'b0 ;
      else if(next_state == IDLE || next_state == STOP)
        rec_buf_empty <= #1 1'b1 ;
      else
        rec_buf_empty <= #1 1'b0 ;
   end
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        rec_codec.start <= #1 1'b0 ;
      else if(rec_codec.state == START)
        rec_codec.start <= #1 1'b0 ;
      else if(leading_edge == 1'b1)
        rec_codec.start <= #1 1'b1 ;
      else
        rec_codec.start <= #1 rec_codec.start ;
   end
   
endmodule

/// END OF FILE ///
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_register.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */

`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif

import uart_package:: * ;
module uart_register
  (
   input wire     clk_i,
   input wire     nrst_i,
   wb_bus         wb_bus,
   uart_bus       uart_bus,
   output u_reg_t u_reg,
   fifo_bus       fifo_pop_trans,
   fifo_bus       fifo_push_rec,
   input wire     timeout_signal,
   input wire     overrun,
   input wire     rec_buf_empty,
   input wire     trans_buf_empty
   ) ;
   
   localparam   WRITE                  = 1'b1 ;
   localparam   READ                   = 1'b0 ;
   localparam   ENABLE                 = 1'b1 ;
   localparam   DISABLE                = 1'b0 ;
   
   fifo_bus
     fifo_pop_rec(.clk_i(clk_i)),
     fifo_push_trans(.clk_i(clk_i)) ;
   
   logic [31:0]   rdat ;
   
   wire [31:0]    dat_i  = wb_bus.dat_i ;
   wire           we_i   = wb_bus.we_i ;
   
`ifdef ALIGN_4B
   wire           uart_stb = wb_bus.cyc_i == 1'b1 && wb_bus.stb_i == 1'b1 && wb_bus.sel_i == 4'b1111 ;
   wire           stb_rxd_fifo = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_RXD && u_reg.line_control_reg.divisor_access == 1'b0 ;
   wire           stb_txd_fifo = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_TXD && u_reg.line_control_reg.divisor_access == 1'b0 ;
   wire           stb_interrupt_enable_reg  = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_INTERRUPT_ENABLE ;
   wire           stb_interrupt_ident_reg   = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_INTERRUPT_IDENT ;
   wire           stb_fifo_control_reg      = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_FIFO_CONTROL ;
   wire           stb_line_control_reg      = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_LINE_CONTROL ;
   wire           stb_modem_control_reg     = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_MODEM_CONTROL ;
   wire           stb_line_status_reg       = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_LINE_STATUS ;
   wire           stb_modem_status_reg      = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_MODEM_STATUS ;
   wire           stb_scratch_reg           = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_SCRATCH ;
   wire           stb_baud_reg = uart_stb == 1'b1 && wb_bus.adr_i[4:2] == UART_BAUD && u_reg.line_control_reg.divisor_access == 1'b1 ;
`else
   wire           uart_stb = wb_bus.cyc_i == 1'b1 && wb_bus.stb_i == 1'b1 ;
   wire           stb_rxd_fifo = wb_bus.sel_i[0] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_RXD && u_reg.line_control_reg.divisor_access == 1'b0 ;
   wire           stb_txd_fifo = wb_bus.sel_i[0] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_TXD && u_reg.line_control_reg.divisor_access == 1'b0 ;
   wire           stb_interrupt_enable_reg  = wb_bus.sel_i[1] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_INTERRUPT_ENABLE ;
   wire           stb_interrupt_ident_reg   = wb_bus.sel_i[2] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_INTERRUPT_IDENT ;
   wire           stb_fifo_control_reg      = wb_bus.sel_i[2] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_FIFO_CONTROL ;
   wire           stb_line_control_reg      = wb_bus.sel_i[3] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_LINE_CONTROL ;
   wire           stb_modem_control_reg     = wb_bus.sel_i[0] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_MODEM_CONTROL ;
   wire           stb_line_status_reg       = wb_bus.sel_i[1] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_LINE_STATUS ;
   wire           stb_modem_status_reg      = wb_bus.sel_i[2] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_MODEM_STATUS ;
   wire           stb_scratch_reg           = wb_bus.sel_i[3] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_SCRATCH ;
   wire           stb_baud_reg = wb_bus.sel_i[0] == 1'b1 && uart_stb == 1'b1 && wb_bus.adr_i[2:0] == UART_BAUD && u_reg.line_control_reg.divisor_access == 1'b1 ;
`endif   
   // -- assign wb_bus.intr_o = u_reg.interrupt_identification.intr_active == 1'b1 ;
   assign wb_bus.intr_o = u_reg.interrupt_pending_reg.modem_status ||
                          u_reg.interrupt_pending_reg.transmitter_holding_register_empty ||
                          u_reg.interrupt_pending_reg.timeout_indication ||
                          u_reg.interrupt_pending_reg.receiver_data_available ||
                          u_reg.interrupt_pending_reg.receiver_line_status ;
   
   assign wb_bus.dat_o  = rdat ;
   assign wb_bus.ack_o  = uart_stb == 1'b1 ; // no wait
   assign dat_i         = wb_bus.dat_i ;
   
   // -- uart line :: read for manual -> 4.6 Modem Control Register (MCR) --
   assign uart_bus.dtr_o = u_reg.modem_control_reg.dtr == 1'b0 ;
   assign uart_bus.rts_o = u_reg.modem_control_reg.rts == 1'b0 ;
   
   wire           cts = u_reg.modem_control_reg.loopback == 1'b1 ? uart_bus.rts_o : uart_bus.cts_i == 1'b0 ;
   wire           dsr = u_reg.modem_control_reg.loopback == 1'b1 ? uart_bus.dtr_o : uart_bus.dsr_i == 1'b0 ;
   wire           ri  = u_reg.modem_control_reg.loopback == 1'b1 ? u_reg.modem_control_reg.out1 : uart_bus.ri_i == 1'b0 ;
   wire           dcd = u_reg.modem_control_reg.loopback == 1'b1 ? u_reg.modem_control_reg.out2 : uart_bus.dcd_i == 1'b0 ;

`ifdef ALIGN_4B   
   // -- data read selector --   
   always_comb begin
      unique case ({
                    stb_baud_reg,
                    stb_scratch_reg,
                    stb_rxd_fifo,
                    stb_interrupt_enable_reg,
                    stb_interrupt_ident_reg,
                    stb_line_control_reg,
                    stb_modem_control_reg,
                    stb_line_status_reg,
                    stb_modem_status_reg
                    })
        9'h100 : rdat = {24'h0, u_reg.baud_reg} ;
        9'h080 : rdat = {24'h0, u_reg.scratch_reg} ;
        9'h040 : rdat = {24'h0, fifo_pop_rec.pop_dat[7:0]} ;
        9'h020 : rdat = {24'h0, u_reg.interrupt_enable_reg} ;
        9'h010 : rdat = {24'h0, u_reg.interrupt_ident_reg} ;
        9'h008 : rdat = {24'h0, u_reg.line_control_reg} ; 
        9'h004 : rdat = {24'h0, u_reg.modem_control_reg} ;
        9'h002 : rdat = {24'h0, u_reg.line_status_reg} ;
        9'h001 : rdat = {24'h0, u_reg.modem_status_reg} ;
        default : rdat = 32'h0 ;
      endcase
   end
`else // ALINE_1B
   assign rdat[7:0]  =  stb_rxd_fifo == 1'b1             ? fifo_pop_rec.pop_dat[7:0]  : 8'h0 |
                        stb_baud_reg == 1'b1             ? u_reg.baud_reg             : 8'h0 ;
   assign rdat[15:8] =  stb_interrupt_enable_reg == 1'b1 ? u_reg.interrupt_enable_reg : 8'h0 |
                        stb_line_status_reg == 1'b1      ? u_reg.line_status_reg      : 8'h0 ;
   assign rdat[23:16] = stb_interrupt_ident_reg          ? u_reg.interrupt_ident_reg  : 8'h0 |
                        stb_modem_status_reg == 1'b1     ? u_reg.modem_status_reg     : 8'h0 ;
   assign rdat[31:24] = stb_line_control_reg == 1'b1     ? u_reg.line_control_reg     : 8'h0 |
                        stb_scratch_reg == 1'b1          ? u_reg.scratch_reg          : 8'h0 ;
`endif
   
   // -- fifo signal --
   wire         fifo_rec_reset    =  u_reg.fifo_control_reg.receiver_fifo_reset == 1'b1 ;
   wire         fifo_trans_reset  =  u_reg.fifo_control_reg.transmitter_fifo_reset == 1'b1 ; 
   wire         all_error_rec ;
   
   // -- recevied fifo --
   uart_fifo #(.DATA_WIDTH(11), .ADDR_WIDTH(4)) fifo_rec
     (
      .clk_i(clk_i),
      .nrst_i(nrst_i),
      .clear(fifo_rec_reset),
      .almost_empty_level(u_reg.fifo_control_reg.define_fifo_trigger_level),
      .fifo_pop(fifo_pop_rec.pop_slave_mp),
      .fifo_push(fifo_push_rec.push_slave_mp),
      .all_error(all_error_rec)
      ) ;
   
   // -- transmitter fifo --
   uart_fifo #(.DATA_WIDTH(11), .ADDR_WIDTH(4)) fifo_trans
     (
      .clk_i(clk_i),
      .nrst_i(nrst_i),
      .clear(fifo_trans_reset),
      .almost_empty_level(u_reg.fifo_control_reg.define_fifo_trigger_level),
      .fifo_pop(fifo_pop_trans.pop_slave_mp),
      .fifo_push(fifo_push_trans.push_slave_mp),
      .all_error() /* N.C. */
      ) ;
   
   // -------------------
   // -- UART REGISTER --
   // -------------------
   
   assign fifo_push_trans.push = stb_txd_fifo == 1'b1 && we_i == WRITE ;
   assign fifo_push_trans.push_dat = dat_i[7:0] ;
   assign fifo_pop_rec.pop = stb_rxd_fifo == 1'b1 && we_i == READ ;
   
   // -- interrupt enable register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.interrupt_enable_reg <= 'h0 ;
      else if(stb_interrupt_enable_reg == 1'b1 && we_i == WRITE)
        u_reg.interrupt_enable_reg <= dat_i[7:0] ;
      else
        u_reg.interrupt_enable_reg <= u_reg.interrupt_enable_reg[7:0] ;
   end
   
   // -- fifo control register write only --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.fifo_control_reg <= 'hc0 ;
      else if(stb_fifo_control_reg == 1'b1 && we_i == WRITE)
        u_reg.fifo_control_reg <= dat_i[7:0] ;
      else begin
        u_reg.fifo_control_reg[7:3] <= u_reg.fifo_control_reg[7:3] ;
        u_reg.fifo_control_reg[2:1] <= 2'b00 ;                        // -- fifo_cleaer
        u_reg.fifo_control_reg[0] <= u_reg.fifo_control_reg[0] ;
      end
   end
   
   // -- line control register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_control_reg <= 'h03 ;
      else if(stb_line_control_reg == 1'b1 && we_i == WRITE)
        u_reg.line_control_reg <= dat_i[7:0] ;
      else
        u_reg.line_control_reg <= u_reg.line_control_reg[7:0] ;
   end
   
   // -- modem control register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.modem_control_reg <= 'h0 ;
      else if(stb_modem_control_reg == 1'b1 && we_i == WRITE)
        u_reg.modem_control_reg <= dat_i[7:0] ;
      else
        u_reg.modem_control_reg <= u_reg.modem_control_reg[7:0] ;
   end
   
   // -- scratch register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.scratch_reg <= 'h0 ;
      else if(stb_scratch_reg == 1'b1 && we_i == WRITE)
        u_reg.scratch_reg <= dat_i[7:0] ;
      else
        u_reg.scratch_reg <= u_reg.scratch_reg[7:0] ;
   end
   
   // -- scratch register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.baud_reg <= 'h0 ;
      else if(stb_baud_reg == 1'b1 && we_i == WRITE)
        u_reg.baud_reg <= dat_i[7:0] ;
      else
        u_reg.baud_reg <= u_reg.baud_reg[7:0] ;
   end
   
   // -- read for manual - 4.7 Line Status Register (LSR)
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0) begin
         {u_reg.line_status_reg.data_ready, 
          u_reg.line_status_reg.trans_fifo_empty, 
          u_reg.line_status_reg.trans_empty} <= #1 3'h0 ;
      end 
      else begin
         u_reg.line_status_reg.data_ready       <= #1 fifo_pop_rec.empty == 1'b0 ;
         u_reg.line_status_reg.trans_fifo_empty <= #1 fifo_push_trans.empty ;
         u_reg.line_status_reg.trans_empty      <= #1 fifo_push_trans.empty | trans_buf_empty ;
      end        
   end // always_ff @ (posedge clk_i, negedge nrst_i)
   
   // -- overrun error --
   logic overrun_err_r ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        overrun_err_r <= #1 1'b1 ;
      else
        overrun_err_r <= #1 overrun ;
   end
   wire overrun_err_set = overrun & ~overrun_err_r ;
   wire overrun_err_clr = we_i == READ && stb_line_status_reg == 1'b1 ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_status_reg.overrun_err <= #1 1'b0 ;
      else if(overrun_err_set == 1'b1)
        u_reg.line_status_reg.overrun_err <= #1 1'b1 ;
      else if(overrun_err_clr == 1'b1)
        u_reg.line_status_reg.overrun_err <= #1 1'b0 ;
      else
        u_reg.line_status_reg.overrun_err <= #1 u_reg.line_status_reg.overrun_err ;
   end  
   
   // -- parity error --
   logic parity_err_r ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        parity_err_r <= #1 1'b1 ;
      else
        parity_err_r <= #1  fifo_pop_rec.pop_dat[10] ;
   end
   wire parity_err_set = fifo_pop_rec.pop_dat[10] & ~parity_err_r ;
   wire parity_err_clr = we_i == READ && stb_line_status_reg == 1'b1 ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_status_reg.parity_err <= #1 1'b0 ;
      else if(parity_err_set == 1'b1)
        u_reg.line_status_reg.parity_err <= #1 1'b1 ;
      else if(parity_err_clr == 1'b1)
        u_reg.line_status_reg.parity_err <= #1 1'b0 ;
      else
        u_reg.line_status_reg.parity_err <= #1 u_reg.line_status_reg.parity_err ;
   end  
   
   // -- framing error --
   logic framing_err_r ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        framing_err_r <= #1 1'b1 ;
      else
        framing_err_r <= #1  fifo_pop_rec.pop_dat[9] ;
   end
   wire framing_err_set = fifo_pop_rec.pop_dat[9] & ~framing_err_r ;
   wire framing_err_clr = we_i == READ && stb_line_status_reg == 1'b1 ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_status_reg.framing_err <= #1 1'b0 ;
      else if(framing_err_set == 1'b1)
        u_reg.line_status_reg.framing_err <= #1 1'b1 ;
      else if(framing_err_clr == 1'b1)
        u_reg.line_status_reg.framing_err <= #1 1'b0 ;
      else
        u_reg.line_status_reg.framing_err <= #1 u_reg.line_status_reg.framing_err ;
   end  
   
   // -- break interrupt indicator --
   logic break_intr_r ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        break_intr_r <= #1 1'b1 ;
      else
        break_intr_r <= #1  fifo_pop_rec.pop_dat[8] ;
   end
   wire break_intr_set = fifo_pop_rec.pop_dat[8] & ~break_intr_r ;
   wire break_intr_clr = we_i == READ && stb_line_status_reg == 1'b1 ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_status_reg.break_intr <= #1 1'b0 ;
      else if(break_intr_set == 1'b1)
        u_reg.line_status_reg.break_intr <= #1 1'b1 ;
      else if(break_intr_clr == 1'b1)
        u_reg.line_status_reg.break_intr <= #1 1'b0 ;
      else
        u_reg.line_status_reg.break_intr <= #1 u_reg.line_status_reg.break_intr ;
   end  
   
   // -- parity error or framing error or break indication --
   logic all_error_r ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        all_error_r <= #1 1'b1 ;
      else
        all_error_r <= #1  all_error_rec | overrun ;
   end
   wire all_error_set = all_error_rec & ~all_error_r ;
   wire all_error_clr = we_i == READ && stb_line_status_reg == 1'b1 ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.line_status_reg.all_error <= #1 1'b0 ;
      else if(all_error_set == 1'b1)
        u_reg.line_status_reg.all_error <= #1 1'b1 ;
      else if(all_error_clr == 1'b1)
        u_reg.line_status_reg.all_error <= #1 1'b0 ;
      else
        u_reg.line_status_reg.all_error <= #1 u_reg.line_status_reg.all_error ;
   end  
   
   // -- read for manual - 4.8 Modem Status Register (MSR)
   wire [3:0] modem_cont = {dcd, ri, dsr, cts} ;
   logic [3:0] modem_contl ;
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
       modem_contl <= #1 4'h0 ;
      else
        modem_contl <= #1 modem_cont ;
   end
   
   wire [3:0]  modem_pulse = modem_cont ^ modem_contl ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.modem_status_reg[3:0] <= #1 0 ;
      else if(stb_modem_status_reg == 1'b1 && we_i == READ)
        u_reg.modem_status_reg[3:0] <= #1 0 ;
      else if(modem_pulse != 4'h0) begin
         u_reg.modem_status_reg[3:0] <= #1 modem_pulse ;
      end
      else
        u_reg.modem_status_reg[3:0] <= #1 u_reg.modem_status_reg[3:0] ;
   end
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.modem_status_reg[7:4] <= #1 0 ;
      else
        u_reg.modem_status_reg[7:4] <= modem_cont ;
   end
   
   // -- read for manual - 4.3 Interrupt Identification Register (IIR) --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0) begin
         u_reg.interrupt_ident_reg.interrupt_identification <= #1 NO_INTERRUPT ;
         u_reg.interrupt_ident_reg.ignored_74_value_hC <= #1 4'hC ;
      end
      else begin
         priority casex({u_reg.interrupt_pending_reg.receiver_line_status,
                       u_reg.interrupt_pending_reg.receiver_data_available,
                       u_reg.interrupt_pending_reg.timeout_indication,
                       u_reg.interrupt_pending_reg.transmitter_holding_register_empty,
                       u_reg.interrupt_pending_reg.modem_status}) 
           5'b1xxxx : u_reg.interrupt_ident_reg.interrupt_identification <= #1 REC_LINE_STATUS ;
           5'b01xxx : u_reg.interrupt_ident_reg.interrupt_identification <= #1 REC_DATA_AVAILABLE ;
           5'b001xx : u_reg.interrupt_ident_reg.interrupt_identification <= #1 TIME_OUT ;
           5'b0001x : u_reg.interrupt_ident_reg.interrupt_identification <= #1 TRANS_REG_EMPTY ;
           5'b00001 : u_reg.interrupt_ident_reg.interrupt_identification <= #1 MODEM_STATUS ;
           default : u_reg.interrupt_ident_reg <= #1 {4'hC, NO_INTERRUPT} ;
         endcase // case (u_reg.interrupt_pending_reg.receiver_line_status,...
      end // else: !if(nrst_i == 1'b0)
   end
   
   // -- interrupt paending register --
   wire receiver_data_available_reset ;
   logic [4:0] interrupt_pending_reg_set_r ;
   wire [4:0] interrupt_pending_reg_reset
              = {
                 (stb_modem_status_reg == 1'b1 && we_i == 1'b0),
                 ((stb_txd_fifo == 1'b1 && we_i == WRITE) || (stb_interrupt_ident_reg == 1'b1 && we_i == READ)),
                 (stb_rxd_fifo == 1'b1 && we_i == READ),
                 (receiver_data_available_reset == 1'b1),
                 (stb_line_status_reg == 1'b1 && we_i == READ)
                 } ;
   

   wire       modem_status_intr = |modem_pulse[3:0] ;
   wire       transmitter_holding_regster_empty_intr = fifo_pop_trans.empty & trans_buf_empty ;
   wire       timeout_indication_intr = timeout_signal ;
   wire       receiver_data_available_intr = fifo_push_rec.almost_full ;
   //   wire       receiver_line_status_intr = all_error_rec | overrun ;
   wire       receiver_line_status_intr ;
   assign     receiver_line_status_intr = u_reg.line_status_reg.break_intr |
                                          u_reg.line_status_reg.framing_err |
                                          u_reg.line_status_reg.parity_err |
                                          u_reg.line_status_reg.overrun_err ;
   
   wire [4:0] interrupt_pending_reg_set_w
              = {
                 (modem_status_intr == 1'b1                      && u_reg.interrupt_enable_reg.modem_status == 1'b1),
                 (transmitter_holding_regster_empty_intr == 1'b1 && u_reg.interrupt_enable_reg.trans_holding_reg_empty == 1'b1),
                 (timeout_indication_intr == 1'b1                && u_reg.interrupt_enable_reg.rec_data_available == 1'b1),
                 (receiver_data_available_intr == 1'b1           && u_reg.interrupt_enable_reg.rec_data_available == 1'b1),
                 (receiver_line_status_intr == 1'b1              && u_reg.interrupt_enable_reg.rec_line_status == 1'b1)
                 } ;

   wire [4:0] interrupt_pending_reg_set = interrupt_pending_reg_set_w & ~(interrupt_pending_reg_set_r) ;
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        interrupt_pending_reg_set_r <= #1 5'h0 ;
      else
        interrupt_pending_reg_set_r <= #1 interrupt_pending_reg_set_w ;
   end
   assign receiver_data_available_reset = interrupt_pending_reg_set_r[1] & ~interrupt_pending_reg_set_w[1] ;

   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        u_reg.interrupt_pending_reg <= #1 5'h00 ;
      else if(interrupt_pending_reg_set != 0)
        u_reg.interrupt_pending_reg <= #1 u_reg.interrupt_pending_reg | interrupt_pending_reg_set ;
      else if(interrupt_pending_reg_reset != 0)
        u_reg.interrupt_pending_reg <= #1 u_reg.interrupt_pending_reg & ~(interrupt_pending_reg_reset) ;
      else
        u_reg.interrupt_pending_reg <= #1 u_reg.interrupt_pending_reg ;
   end  
   
endmodule

/// END OF FILE ///
/* *****************************************************************************
   * title:         uart_16550_rll module                                      *
   * description:   RS232 Protocol 16550D uart (mostly supported)              *
   * languages:     systemVerilog                                              *
   *                                                                           *
   * Copyright (C) 2010 miyagi.hiroshi                                         *
   *                                                                           *
   * This library is free software; you can redistribute it and/or             *
   * modify it under the terms of the GNU Lesser General Public                *
   * License as published by the Free Software Foundation; either              *
   * version 2.1 of the License, or (at your option) any later version.        *
   *                                                                           *
   * This library is distributed in the hope that it will be useful,           *
   * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU         *
   * Lesser General Public License for more details.                           *
   *                                                                           *
   * You should have received a copy of the GNU Lesser General Public          *
   * License along with this library; if not, write to the Free Software       *
   * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111*1307  USA *
   *                                                                           *
   *         ***  GNU LESSER GENERAL PUBLIC LICENSE  ***                       *
   *           from http://www.gnu.org/licenses/lgpl.txt                       *
   *****************************************************************************
   *                            redleaflogic,ltd                               *
   *                    miyagi.hiroshi@redleaflogic.biz                        *
   *          $Id: uart_transmitter.sv 108 2010-03-30 02:56:26Z hiroshi $         *
   ***************************************************************************** */
   
`ifdef SYN
/* empty */
`else
timeunit      1ps ;
timeprecision 1ps ;
`endif
import uart_package:: * ;
module uart_transmitter(input wire    clk_i,
                        input wire    nrst_i,
                        input wire    trans_clk_en,
                        output wire   txd_out,
                        fifo_bus      fifo_pop,
                        input u_reg_t u_reg,
                        output u_codec_t trans_codec,
                        output logic  trans_buf_empty) ;
   
   codec_state_t   next_state ;
   //   u_codec_t       trans_codec ;
   logic                              pop ;
   
   assign fifo_pop.pop = pop ;
   
   // -- break signal output --
   assign txd_out = u_reg.line_control_reg.break_control_bit == 1'b1 ? 1'b0 : trans_codec.line ;
   
   // -- trasmitter state logic --
   uart_codec_state trans_state(.u_reg(u_reg),
                                .codec(trans_codec),
                                .receiver_mode(1'b0),
                                .timeout_signal(1'b1),
                                .next_state(next_state)) ;
   
   // -- state register --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        trans_codec.state <= #1 IDLE ;
      else if(trans_clk_en == 1'b1 || trans_codec.state == IDLE)
        trans_codec.state <= #1 next_state ;
      else
        trans_codec.state <= #1 trans_codec.state ;
   end
   
   // -- line output --
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0) begin
         trans_codec.data_r <= #1 8'h00 ;
         trans_codec.line   <= #1 1'b1 ;
         trans_codec.framing_err <= #1 1'b0 ;
         trans_codec.parity_err  <= #1 1'b0 ;
         trans_codec.break_err   <= #1 1'b0 ;
      end
      else if(trans_clk_en == 1'b1)
        case (trans_codec.state)
          IDLE : trans_codec.line <= #1 1'b1 ;
          
          START : begin
             trans_codec.data_r <= #1 fifo_pop.pop_dat[7:0] ;
             trans_codec.line   <= #1 1'b0 ;
          end
          
          SEL_0 : trans_codec.line <= #1 trans_codec.data_r[0] ;
          SEL_1 : trans_codec.line <= #1 trans_codec.data_r[1] ;
          SEL_2 : trans_codec.line <= #1 trans_codec.data_r[2] ;
          SEL_3 : trans_codec.line <= #1 trans_codec.data_r[3] ;
          SEL_4 : trans_codec.line <= #1 trans_codec.data_r[4] ;
          SEL_5 : trans_codec.line <= #1 trans_codec.data_r[5] ;
          SEL_6 : trans_codec.line <= #1 trans_codec.data_r[6] ;
          
          DATA_END : begin
             if(u_reg.line_control_reg.char_length == CHAR_7_BIT)
               trans_codec.line <= #1 trans_codec.data_r[6] ;
             else
               trans_codec.line <= #1 trans_codec.data_r[7] ;
          end
          
          PARITY : begin
             case ({u_reg.line_control_reg.even_parity,
                    u_reg.line_control_reg.stick_parity})
               2'b00  : trans_codec.line <= #1 u_reg.line_control_reg.char_length == CHAR_7_BIT
                                            ?  ~(^trans_codec.data_r[6:0])
                                              : ~(^trans_codec.data_r[7:0]) ;
               2'b01  : trans_codec.line <= #1  1'b1 ;
               2'b10  : trans_codec.line <= #1 u_reg.line_control_reg.char_length == CHAR_7_BIT
                                            ?  (^trans_codec.data_r[6:0])
                                              :  (^trans_codec.data_r[7:0]) ;
               2'b11  : trans_codec.line <= #1  1'b0 ;
               default : trans_codec.line <= #1 1'b0 ;
             endcase
          end
          
          STOP : trans_codec.line   <= #1 1'b1 ;
          
          default : trans_codec.line <= #1 1'b1 ;
        endcase // case (state)
   end // always_ff @ (posedge clk, negedge nrst)
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        pop <= 1'b0 ;
      else if(trans_codec.state == START && trans_clk_en == 1'b1)
        pop <= 1'b1 ;
      else
        pop <= 1'b0 ;
   end
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        trans_codec.start <= 1'b0 ;
      else if(fifo_pop.empty == 1'b0)
        trans_codec.start <= 1'b1 ;
      else
        trans_codec.start <= 1'b0 ;
   end
   
   always_ff @(posedge clk_i, negedge nrst_i) begin
      if(nrst_i == 1'b0)
        trans_buf_empty <= 1'b0 ;
      else if(next_state == IDLE || next_state == STOP)
        trans_buf_empty <= #1 1'b1 ;
      else
        trans_buf_empty <= #1 1'b0 ;
   end
   
endmodule

/// END OF FILE ///
