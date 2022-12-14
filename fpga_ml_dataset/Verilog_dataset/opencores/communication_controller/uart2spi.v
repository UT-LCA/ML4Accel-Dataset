//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Tubo 8051 cores common library Module                       ////
////                                                              ////
////  This file is part of the Turbo 8051 cores project           ////
////  http://www.opencores.org/cores/turbo8051/                   ////
////                                                              ////
////  Description                                                 ////
////  Turbo 8051 definitions.                                     ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
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

// #################################################################
// Module: clk_ctl
//
// Description:  Generic clock control logic , clk-out = mclk/(2+clk_div_ratio)
//
//  
// #################################################################


module clk_ctl (
   // Outputs
       clk_o,
   // Inputs
       mclk,
       reset_n, 
       clk_div_ratio 
   );

//---------------------------------
// CLOCK Default Divider value.
// This value will be change from outside
//---------------------------------
parameter  WD = 'h1;

//---------------------------------------------
// All the input to this block are declared here
// --------------------------------------------
   input        mclk          ;// 
   input        reset_n       ;// primary reset signal
   input [WD:0] clk_div_ratio ;// primary clock divide ratio
                               // output clock = selected clock / (div_ratio+1)
   
//---------------------------------------------
// All the output to this block are declared here
// --------------------------------------------
   output       clk_o             ; // clock out

               

//------------------------------------
// Clock Divide func is done here
//------------------------------------
reg  [WD-1:0]    high_count       ; // high level counter
reg  [WD-1:0]    low_count        ; // low level counter
reg              mclk_div         ; // divided clock


assign clk_o  = mclk_div;

always @ (posedge mclk or negedge reset_n)
begin // {
   if(reset_n == 1'b0) 
   begin 
      high_count  <= 'h0;
      low_count   <= 'h0;
      mclk_div    <= 'b0;
   end   
   else 
   begin 
      if(high_count != 0)
      begin // {
         high_count    <= high_count - 1;
         mclk_div      <= 1'b1;
      end   // }
      else if(low_count != 0)
      begin // {
         low_count     <= low_count - 1;
         mclk_div      <= 1'b0;
      end   // }
      else
      begin // {
         high_count    <= clk_div_ratio[WD:1] + clk_div_ratio[0];
         low_count     <= clk_div_ratio[WD:1] + 1;
         mclk_div      <= ~mclk_div;
      end   // }
   end   // }
end   // }


endmodule 

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Tubo 8051 cores UART Interface Module                       ////
////                                                              ////
////  This file is part of the Turbo 8051 cores project           ////
////  http://www.opencores.org/cores/turbo8051/                   ////
////                                                              ////
////  Description                                                 ////
////  Turbo 8051 definitions.                                     ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
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
module uart_core (  
        line_reset_n ,
        line_clk ,

	// configuration control
        cfg_tx_enable  , // Enable Transmit Path
        cfg_rx_enable  , // Enable Received Path
        cfg_stop_bit   , // 0 -> 1 Start , 1 -> 2 Stop Bits
        cfg_pri_mod    , // priority mode, 0 -> nop, 1 -> Even, 2 -> Odd
	cfg_baud_16x   ,

    // TXD Information
        tx_data_avail,
        tx_rd,
        tx_data,
         

    // RXD Information
        rx_ready,
        rx_wr,
        rx_data,

       // Status information
        frm_error,
	par_error,

	baud_clk_16x,

       // Line Interface
        rxd,
        txd

     );



//---------------------------------
// Global Dec
// ---------------------------------

input        line_reset_n         ; // line reset
input        line_clk             ; // line clock

//-------------------------------------
// Configuration 
// -------------------------------------
input         cfg_tx_enable        ; // Tx Enable
input         cfg_rx_enable        ; // Rx Enable
input         cfg_stop_bit         ; // 0 -> 1 Stop, 1 -> 2 Stop
input   [1:0] cfg_pri_mod          ; // priority mode, 0 -> nop, 1 -> Even, 2 -> Odd
input   [11:0] cfg_baud_16x        ; // 16x Baud clock generation

//--------------------------------------
// TXD Path
// -------------------------------------
input         tx_data_avail        ; // Indicate valid TXD Data 
input [7:0]   tx_data              ; // TXD Data to be transmited
output        tx_rd                ; // Indicate TXD Data Been Read


//--------------------------------------
// RXD Path
// -------------------------------------
input         rx_ready            ; // Indicate Ready to accept the Read Data
output [7:0]  rx_data             ; // RXD Data 
output        rx_wr               ; // Valid RXD Data


//--------------------------------------
// ERROR Indication
// -------------------------------------
output        frm_error            ; // framing error
output        par_error            ; // par error

output        baud_clk_16x         ; // 16x Baud clock


//-------------------------------------
// Line Interface
// -------------------------------------
input         rxd                  ; // uart rxd
output        txd                  ; // uart txd

// Wire Declaration

wire [1  : 0]   error_ind          ;


// 16x Baud clock generation
// Example: to generate 19200 Baud clock from 50Mhz Link clock
//    50 * 1000 * 1000 / (2 + cfg_baud_16x) = 19200 * 16
//    cfg_baud_16x = 0xA0 (160)

clk_ctl #(11) u_clk_ctl (
   // Outputs
       .clk_o          (baud_clk_16x),

   // Inputs
       .mclk           (line_clk),
       .reset_n        (line_reset_n), 
       .clk_div_ratio  (cfg_baud_16x)
   );


uart_txfsm u_txfsm (
               . reset_n           ( line_reset_n      ),
               . baud_clk_16x      ( baud_clk_16x      ),

               . cfg_tx_enable     ( cfg_tx_enable     ),
               . cfg_stop_bit      ( cfg_stop_bit      ),
               . cfg_pri_mod       ( cfg_pri_mod       ),

       // FIFO control signal
               . fifo_empty        ( !tx_data_avail    ),
               . fifo_rd           ( tx_rd             ),
               . fifo_data         ( tx_data           ),

          // Line Interface
               . so                ( txd                )
          );


uart_rxfsm u_rxfsm (
               . reset_n           (  line_reset_n     ),
               . baud_clk_16x      (  baud_clk_16x     ) ,

               . cfg_rx_enable     (  cfg_rx_enable    ),
               . cfg_stop_bit      (  cfg_stop_bit     ),
               . cfg_pri_mod       (  cfg_pri_mod      ),

               . error_ind         (  error_ind        ),

       // FIFO control signal
               .  fifo_aval        ( rx_ready          ),
               .  fifo_wr          ( rx_wr             ),
               .  fifo_data        ( rx_data           ),

          // Line Interface
               .  si               (rxd              )
          );


wire   frm_error          = (error_ind == 2'b01);
wire   par_error          = (error_ind == 2'b10);



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Tubo 8051 cores UART Interface Module                       ////
////                                                              ////
////  This file is part of the Turbo 8051 cores project           ////
////  http://www.opencores.org/cores/turbo8051/                   ////
////                                                              ////
////  Description                                                 ////
////  Turbo 8051 definitions.                                     ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
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

// UART rx state machine

module uart_rxfsm (
             reset_n        ,
             baud_clk_16x   ,

             cfg_rx_enable  ,
             cfg_stop_bit   ,
             cfg_pri_mod    ,

             error_ind      ,

       // FIFO control signal
             fifo_aval      ,
             fifo_wr        ,
             fifo_data      ,

          // Line Interface
             si  
          );


input             reset_n        ; // active low reset signal
input             baud_clk_16x   ; // baud clock-16x

input             cfg_rx_enable  ; // transmit interface enable
input             cfg_stop_bit   ; // stop bit 
                                   // 0 --> 1 stop, 1 --> 2 Stop
input   [1:0]     cfg_pri_mod    ;// Priority Mode
                                   // 2'b00 --> None
                                   // 2'b10 --> Even priority
                                   // 2'b11 --> Odd priority

output [1:0]      error_ind     ; // 2'b00 --> Normal
                                  // 2'b01 --> framing error
                                  // 2'b10 --> parity error
                                  // 2'b11 --> fifo full
//--------------------------------------
//   FIFO control signal
//--------------------------------------
input             fifo_aval      ; // fifo empty
output            fifo_wr        ; // fifo write, assumed no back to back write
output  [7:0]     fifo_data      ; // fifo write data

// Line Interface
input             si             ;  // rxd pin



reg     [7:0]    fifo_data       ; // fifo write data
reg              fifo_wr         ; // fifo write 
reg    [1:0]     error_ind       ; 
reg    [2:0]     cnt             ;
reg    [3:0]     offset          ; // free-running counter from 0 - 15
reg    [3:0]     rxpos           ; // stable rx position
reg    [2:0]     rxstate         ;
reg              si_d            ; // delayed si
reg              si_2d           ; // 2 cycle delayed si

parameter idle_st      = 3'b000;
parameter xfr_start    = 3'b001;
parameter xfr_data_st  = 3'b010;
parameter xfr_pri_st   = 3'b011;
parameter xfr_stop_st1 = 3'b100;
parameter xfr_stop_st2 = 3'b101;


always @(negedge reset_n or posedge baud_clk_16x) begin
   if(reset_n == 0) begin
      rxstate   <= 3'b0;
      offset    <= 4'b0;
      rxpos     <= 4'b0;
      cnt       <= 3'b0;
      error_ind <= 2'b0;
      fifo_wr   <= 1'b0;
      fifo_data <= 8'h0;
      si_d      <= 1'b1;
      si_2d     <= 1'b1;
   end
   else begin
      // two cycle double sync uart-si to take care of async behaviour
      si_d      <= si;
      si_2d     <= si_d;
      offset     <= offset + 1;
      case(rxstate)
       idle_st   : begin
            if(!si_2d) begin // Start indication
               if(fifo_aval && cfg_rx_enable) begin
                 rxstate   <=   xfr_start;
                 cnt       <=   0;
                 rxpos     <=   offset + 8; // Assign center rxoffset
                 error_ind <= 2'b00;
               end
               else begin
                  error_ind <= 2'b11; // fifo full error indication
               end
            end else begin
               error_ind <= 2'b00; // Reset Error
            end
         end
      xfr_start : begin
            // Make Sure that minimum 8 cycle low is detected
            if(cnt < 7 && si_2d) begin // Start indication
               rxstate <=   idle_st;
            end
            else if(cnt == 7 && !si_2d) begin // Start indication
                rxstate <=   xfr_data_st;
                cnt     <=   0;
            end else begin
              cnt  <= cnt +1;
            end
         end
      xfr_data_st : begin
             if(rxpos == offset) begin
                fifo_data[cnt] <= si_2d;
                cnt            <= cnt+1;
                if(cnt == 7) begin
                   fifo_wr <= 1;
                   if(cfg_pri_mod == 2'b00)  // No Priority
                       rxstate <=   xfr_stop_st1;
                   else rxstate <= xfr_pri_st;  
                end
             end
          end
       xfr_pri_st   : begin
            fifo_wr <= 0;
            if(rxpos == offset) begin
               if(cfg_pri_mod == 2'b10)  // even priority
                  if( si_2d != ^fifo_data) error_ind <= 2'b10;
               else  // Odd Priority
                  if( si_2d != ~(^fifo_data)) error_ind <= 2'b10;
               rxstate <=   xfr_stop_st1;
            end
         end
       xfr_stop_st1  : begin
          fifo_wr <= 0;
          if(rxpos == offset) begin
             if(si_2d) begin
               if(cfg_stop_bit) // Two Stop bit
                  rxstate <=   xfr_stop_st2;
               else   
                  rxstate <=   idle_st;
             end else begin // Framing error
                error_ind <= 2'b01;
                rxstate   <=   idle_st;
             end
          end
       end
       xfr_stop_st2  : begin
          if(rxpos == offset) begin
             if(si_2d) begin
                rxstate <=   idle_st;
             end else begin // Framing error
                error_ind <= 2'b01;
                rxstate   <=   idle_st;
             end
          end
       end
    endcase
   end
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Tubo 8051 cores UART Interface Module                       ////
////                                                              ////
////  This file is part of the Turbo 8051 cores project           ////
////  http://www.opencores.org/cores/turbo8051/                   ////
////                                                              ////
////  Description                                                 ////
////  Turbo 8051 definitions.                                     ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
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


// UART tx state machine

module uart_txfsm (
             reset_n        ,
             baud_clk_16x   ,

             cfg_tx_enable  ,
             cfg_stop_bit   ,
             cfg_pri_mod    ,

       // FIFO control signal
             fifo_empty     ,
             fifo_rd        ,
             fifo_data      ,

          // Line Interface
             so  
          );


input             reset_n        ; // active low reset signal
input             baud_clk_16x   ; // baud clock-16x

input             cfg_tx_enable  ; // transmit interface enable
input             cfg_stop_bit   ; // stop bit 
                                   // 0 --> 1 stop, 1 --> 2 Stop
input   [1:0]     cfg_pri_mod    ;// Priority Mode
                                   // 2'b00 --> None
                                   // 2'b10 --> Even priority
                                   // 2'b11 --> Odd priority

//--------------------------------------
//   FIFO control signal
//--------------------------------------
input             fifo_empty     ; // fifo empty
output            fifo_rd        ; // fifo read, assumed no back to back read
input  [7:0]      fifo_data      ; // fifo read data

// Line Interface
output            so             ;  // txd pin


reg  [2:0]         txstate       ; // tx state
reg                so            ; // txd pin
reg  [7:0]         txdata        ; // local txdata
reg                fifo_rd       ; // Fifo read enable
reg  [2:0]         cnt           ; // local data cont
reg  [3:0]         divcnt        ; // clock div count

parameter idle_st      = 3'b000;
parameter xfr_data_st  = 3'b001;
parameter xfr_pri_st   = 3'b010;
parameter xfr_stop_st1 = 3'b011;
parameter xfr_stop_st2 = 3'b100;


always @(negedge reset_n or posedge baud_clk_16x)
begin
   if(reset_n == 1'b0) begin
      txstate  <= idle_st;
      so       <= 1'b1;
      cnt      <= 3'b0;
      txdata   <= 8'h0;
      fifo_rd  <= 1'b0;
      divcnt   <= 4'b0;
   end
   else begin
      divcnt <= divcnt+1;
      if(divcnt == 4'b0000) begin // Do at once in 16 clock
         case(txstate)
          idle_st      : begin
               if(!fifo_empty && cfg_tx_enable) begin
                  so       <= 1'b0 ; // Start bit
                  cnt      <= 3'b0;
                  fifo_rd  <= 1'b1;
                  txdata   <= fifo_data;
                  txstate  <= xfr_data_st;  
               end
            end

          xfr_data_st  : begin
              fifo_rd  <= 1'b0;
              so   <= txdata[cnt];
              cnt  <= cnt+1;
              if(cnt == 7) begin
                 if(cfg_pri_mod == 2'b00) begin // No Priority
                    txstate  <= xfr_stop_st1;  
                 end
                 else begin
                    txstate <= xfr_pri_st;  
                 end
              end
           end

          xfr_pri_st   : begin
               if(cfg_pri_mod == 2'b10)  // even priority
                   so <= ^txdata;
               else begin // Odd Priority
                   so <= ~(^txdata);
               end
               txstate  <= xfr_stop_st1;  
            end

          xfr_stop_st1  : begin // First Stop Bit
               so <= 1;
               if(cfg_stop_bit == 0)  // 1 Stop Bit
                    txstate <= idle_st;
               else // 2 Stop Bit 
                  txstate  <= xfr_stop_st2;
            end

          xfr_stop_st2  : begin // Second Stop Bit
               so <= 1;
               txstate <= idle_st;
            end
         endcase
      end else begin
        fifo_rd  <= 1'b0;
     end
   end
end


endmodule
