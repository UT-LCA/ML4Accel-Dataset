//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: serirq_defines.v,v 1.2 2008-12-27 19:46:18 hharte Exp $
////  wb_lpc_defines.v                                            ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

// Wishbone SERIRQ Host/Slave Interface Definitions
`define SERIRQ_ST_IDLE    13'h000             // SERIRQ Idle state
`define SERIRQ_ST_START   13'h001             // SERIRQ Start state
`define SERIRQ_ST_START_R 13'h002             // SERIRQ Start state
`define SERIRQ_ST_START_T 13'h004             // SERIRQ Start state
`define SERIRQ_ST_IRQ     13'h008             // SERIRQ IRQ Frame State
`define SERIRQ_ST_IRQ_R   13'h010             // SERIRQ IRQ Frame State
`define SERIRQ_ST_IRQ_T   13'h020             // SERIRQ IRQ Frame State
`define SERIRQ_ST_STOP    13'h040             // SERIRQ Stop State
`define SERIRQ_ST_STOP_R  13'h080             // SERIRQ Stop State
`define SERIRQ_ST_STOP_T  13'h100             // SERIRQ Stop State
`define SERIRQ_ST_WAIT_STOP 13'h200

`define SERIRQ_MODE_CONTINUOUS 1'b0           // Serirq "Continuous Mode"
`define SERIRQ_MODE_QUIET  1'b1               // Serirq "Quiet Mode"
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: serirq_host.v,v 1.2 2008-12-27 19:46:18 hharte Exp $   ////
////  serirq_host.v - SERIRQ Host Controller                      ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/serirq_defines.v"

module serirq_host(clk_i, nrst_i, 
                   serirq_mode_i, irq_o,
                   serirq_o, serirq_i, serirq_oe
);
    // Wishbone Slave Interface
    input              clk_i;
    input              nrst_i;      // Active low reset.
    input              serirq_mode_i; // Mode selection, 0=Continuous, 1=Quiet
    
    // SERIRQ Master Interface
    output reg         serirq_o;    // SERIRQ output
    input              serirq_i;    // SERIRQ Input
    output reg         serirq_oe;   // SERIRQ Output Enable

    output reg  [31:0] irq_o;       // IRQ Output Bus

    reg         [12:0] state;       // Current state
    reg          [4:0] irq_cnt;     // IRQ Frame counter
    reg          [2:0] start_cnt;   // START counter
    reg          [2:0] stop_cnt;    // STOP counter
    reg                current_mode;

    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            state <= `SERIRQ_ST_IDLE;
            serirq_oe <= 1'b0;
            serirq_o <= 4'b1;
            irq_cnt <= 5'h00;
                start_cnt <= 3'b000;
                stop_cnt <= 2'b00;
                irq_o <= 32'hFFFFFFFF;
                current_mode <= `SERIRQ_MODE_CONTINUOUS;
        end
        else begin
            case(state)
                `SERIRQ_ST_IDLE:
                    begin
                        serirq_oe <= 1'b0;
                        start_cnt <= 3'b000;
                        stop_cnt <= 2'b00;
                        serirq_o <= 1'b1;
                        if((current_mode == `SERIRQ_MODE_QUIET) && (serirq_i == 1'b0)) begin
                            start_cnt <= 3'b010;
                            serirq_o <= 1'b0;
                            serirq_oe <= 1'b1;
                            state <= `SERIRQ_ST_START;
                        end
                        else if(current_mode == `SERIRQ_MODE_CONTINUOUS)
                        begin
                            start_cnt <= 3'b000;
                            state <= `SERIRQ_ST_START;
                        end
                        else if((current_mode == `SERIRQ_MODE_QUIET) && (serirq_mode_i == `SERIRQ_MODE_CONTINUOUS)) 
                        begin // Switch to Continuous mode by starting a new cycle to inform the slaves.
                            start_cnt <= 3'b000;
                            state <= `SERIRQ_ST_START;
                        end
                        else
                            state <= `SERIRQ_ST_IDLE;
                    end
                `SERIRQ_ST_START:
                    begin
                        serirq_o <= 1'b0;
                        serirq_oe <= 1'b1;
                        irq_cnt <= 5'h00;
                        start_cnt <= start_cnt + 1;
                        if(start_cnt == 3'b111) begin
                            state <= `SERIRQ_ST_START_R;
                        end
                        else begin
                            state <= `SERIRQ_ST_START;
                        end
                    end
                `SERIRQ_ST_START_R:
                    begin
                        serirq_o <= 1'b1;
                        state <= `SERIRQ_ST_START_T;
                    end
                `SERIRQ_ST_START_T:
                    begin
                        serirq_oe <= 1'b0;
                        state <= `SERIRQ_ST_IRQ;
                    end
                `SERIRQ_ST_IRQ:
                    begin
                        state <= `SERIRQ_ST_IRQ_R;
                    end
                `SERIRQ_ST_IRQ_R:
                    begin
                        irq_o[irq_cnt] <= (serirq_i == 1'b0 ? 1'b0 : 1'b1);
                        state <= `SERIRQ_ST_IRQ_T;
                    end
                `SERIRQ_ST_IRQ_T:
                    begin
                        if(irq_cnt == 5'h1f) begin
                            state <= `SERIRQ_ST_STOP;
                        end else begin
                            state <= `SERIRQ_ST_IRQ;
                            irq_cnt <= irq_cnt + 1;
                        end
                    end
                `SERIRQ_ST_STOP:
                    begin
                        serirq_o <= 1'b0;
                        serirq_oe <= 1'b1;
                        stop_cnt <= stop_cnt + 1;
                        if(stop_cnt == (serirq_mode_i ? 2'b01 : 2'b10)) begin
                            state <= `SERIRQ_ST_STOP_R;
                        end
                        else begin
                            state <= `SERIRQ_ST_STOP;
                        end
                    end
                `SERIRQ_ST_STOP_R:
                    begin
                        serirq_o <= 1'b1;
                        state <= `SERIRQ_ST_STOP_T;
                    end
                `SERIRQ_ST_STOP_T:
                    begin
                        serirq_oe <= 1'b0;
                        state <= `SERIRQ_ST_IDLE;
                        current_mode <= serirq_mode_i;
                    end
            endcase
        end
endmodule

                            
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: serirq_slave.v,v 1.2 2008-12-27 19:46:18 hharte Exp $  ////
////  serirq_slave.v - Wishbone Slave to SERIRQ Host Bridge       ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/lpc/                      ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/serirq_defines.v"

module serirq_slave(clk_i, nrst_i, 
                    irq_i,
                    serirq_o, serirq_i, serirq_oe
);
    // Wishbone Slave Interface
    input             clk_i;
    input             nrst_i;       // Active low reset.
    
    // SERIRQ Master Interface
    output reg        serirq_o;     // SERIRQ output
    input             serirq_i;     // SERIRQ Input
    output reg        serirq_oe;    // SERIRQ Output Enable

    input      [31:0] irq_i;        // IRQ Input Bus
    reg        [31:0] current_irq;

    reg        [12:0] state;        // Current state
    reg         [4:0] irq_cnt;      // IRQ Frame counter

    reg found_stop;
    reg found_start;
    reg serirq_mode;

    wire irq_changed = (serirq_mode & (current_irq != irq_i));
     
    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            state <= `SERIRQ_ST_IDLE;
            serirq_oe <= 1'b0;
            serirq_o <= 4'b1;
            irq_cnt <= 5'h00;
            current_irq <= irq_i;
        end
        else begin
            case(state)
                `SERIRQ_ST_IDLE:
                    begin
                        serirq_oe <= 1'b0;
                        irq_cnt <= 5'h00;
                        serirq_o <= 1'b1;

                        if(found_start == 1'b1) // Wait for Start cycle
                        begin
                            current_irq <= irq_i;
                            if(irq_i[irq_cnt] == 1'b0) begin
                                serirq_oe <= 1'b1;
                                serirq_o <= 1'b0;
                            end
                            state <= `SERIRQ_ST_IRQ_R;
                        end
                        else if(irq_changed) begin
                            current_irq <= irq_i;
                            serirq_o <= 1'b0;
                            serirq_oe <= 1'b1;
                            state <= `SERIRQ_ST_IDLE;
                        end else
                            state <= `SERIRQ_ST_IDLE;
                    end
                `SERIRQ_ST_IRQ:
                    begin
                        if(irq_i[irq_cnt] == 1'b0) begin
                            serirq_oe <= 1'b1;
                            serirq_o <= 1'b0;
                        end
                            if(found_stop == 1'b0)
                                state <= `SERIRQ_ST_IRQ_R;
                            else
                                state <= `SERIRQ_ST_IDLE;
                    end
                `SERIRQ_ST_IRQ_R:
                    begin
                        serirq_o <= 1'b1;
                        if(found_stop == 1'b0)
                            state <= `SERIRQ_ST_IRQ_T;
                        else
                            state <= `SERIRQ_ST_IDLE;
                    end
                `SERIRQ_ST_IRQ_T:
                    begin
                        serirq_oe <= 1'b0;
                        if(irq_cnt == 5'h1f)
                        begin
                            state <= `SERIRQ_ST_WAIT_STOP;
                        end
                        else begin
                            irq_cnt <= irq_cnt + 1;
                            if(found_stop == 1'b0)
                                state <= `SERIRQ_ST_IRQ;
                            else
                                state <= `SERIRQ_ST_IDLE;
                        end
                    end
                    `SERIRQ_ST_WAIT_STOP:
                        begin
                            if(found_stop == 1'b0)
                                state <= `SERIRQ_ST_WAIT_STOP;
                            else
                                state <= `SERIRQ_ST_IDLE;
                        end
            endcase
        end

    reg [3:0] stop_clk_cnt;

    // Look for STOP cycles
    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            found_stop <= 1'b0;
            found_start <= 1'b0;
            serirq_mode <= `SERIRQ_MODE_CONTINUOUS;
            stop_clk_cnt <= 4'h0;
        end
        else begin
            if(serirq_i == 1'b0) begin
                stop_clk_cnt <= stop_clk_cnt + 1;
            end
            else begin
                case (stop_clk_cnt) 
                    4'h2:
                        begin
                            found_stop <= 1'b1;
                            found_start <= 1'b0;
                            serirq_mode <= `SERIRQ_MODE_QUIET;
                        end
                    4'h3:
                        begin
                            found_stop <= 1'b1;
                            found_start <= 1'b0;
                            serirq_mode <= `SERIRQ_MODE_CONTINUOUS;
                        end
                    4'h4:
                        begin
                            found_stop <= 1'b0;
                            found_start <= 1'b1;
                        end
                    4'h6:
                        begin
                            found_stop <= 1'b0;
                            found_start <= 1'b1;
                        end
                    4'h8:
                        begin
                            found_stop <= 1'b0;
                            found_start <= 1'b1;
                        end
                    default:
                        begin
                            found_stop <= 1'b0;
                            found_start <= 1'b0;
                        end
                    endcase
                    stop_clk_cnt <= 4'h0;
            end
        end
endmodule

//
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: wb_dreq_host.v,v 1.2 2008-03-05 05:50:59 hharte Exp $  ////
////  wb_dreq_host.v -  Wishbone DMA Controller for LPC Host      ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/wb_lpc_defines.v"

module wb_dreq_host(clk_i, nrst_i,
                     dma_chan_o, dma_req_o,
                            ldrq_i
);
    // Wishbone Slave Interface
    input       clk_i;
    input       nrst_i;             // Active low reset.

    // Private DMA Interface
    output reg  [2:0] dma_chan_o;
    output reg        dma_req_o;

    // LPC Bus DMA Request Input
    input           ldrq_i;
    
    reg [1:0]   adr_cnt;
    reg [3:0]   state;
    
    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            state <= `LDRQ_ST_IDLE;
            dma_chan_o <= 3'h0;
            dma_req_o <= 3'h0;
            adr_cnt <= 2'b00;
        end
        else begin
            case(state)
                `LDRQ_ST_IDLE:
                    begin
                        dma_req_o <= 1'b0;
                        if(~ldrq_i) begin
                            state <= `LDRQ_ST_ADDR;
                            adr_cnt <= 2'h2;
                        end
                    end
                `LDRQ_ST_ADDR:
                    begin
                        dma_chan_o[adr_cnt] <= ldrq_i;
                        adr_cnt <= adr_cnt - 1;
                        
                        if(adr_cnt == 2'h0)
                            state <= `LDRQ_ST_ACT;
                    end
                `LDRQ_ST_ACT:
                    begin
                        dma_req_o <= ldrq_i;
                        state <= `LDRQ_ST_DONE;
                    end
                `LDRQ_ST_DONE:
                    begin
                        dma_req_o <= 1'b0;
                        state <= `LDRQ_ST_IDLE;
                    end
            endcase
        end

endmodule

                            
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: wb_dreq_periph.v,v 1.2 2008-03-05 05:50:59 hharte Exp $////
////  wb_dreq_periph.v - Wishbone DMA Requestor for LPC Peripheral////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/wb_lpc_defines.v"

module wb_dreq_periph(clk_i, nrst_i,
                      dma_chan_i, dma_req_i,
                      ldrq_o
);
    // Wishbone Slave Interface
    input       clk_i;
    input       nrst_i;             // Active low reset.

    // Private DMA Interface
    input [2:0] dma_chan_i;
    input       dma_req_i;

    // LPC Bus DMA Request Output
    output reg  ldrq_o;
    
    reg [1:0]   adr_cnt;
    reg [3:0]   state;
    
    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            state <= `LDRQ_ST_IDLE;
            ldrq_o <= 1'b1; // LDRQ# Idle
            adr_cnt <= 2'b00;
        end
        else begin
            case(state)
                `LDRQ_ST_IDLE:
                    begin
                        if(dma_req_i) begin
                            ldrq_o <= 1'b0;
                            state <= `LDRQ_ST_ADDR;
                            adr_cnt <= 2'h2;
                        end
                    end
                `LDRQ_ST_ADDR:
                    begin
                        ldrq_o <= dma_chan_i[adr_cnt];
                        adr_cnt <= adr_cnt - 1;
                        
                        if(adr_cnt == 2'h0)
                            state <= `LDRQ_ST_ACT;
                    end
                `LDRQ_ST_ACT:
                    begin
                        ldrq_o <= 1'b1;
                        state <= `LDRQ_ST_DONE;
                    end
                `LDRQ_ST_DONE:
                    begin
                        ldrq_o <= 1'b1;
                        state <= `LDRQ_ST_IDLE;
                    end
            endcase
        end

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  wb_lpc_defines.v                                            ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

// Wishbone LPC Master/Slave Interface Definitions

`define LPC_START       4'b0000
`define LPC_STOP        4'b1111
`define LPC_FW_READ     4'b1101
`define LPC_FW_WRITE    4'b1110

`define LPC_SYNC_READY  4'b0000             // LPC Sync Ready
`define LPC_SYNC_SWAIT  4'b0101             // LPC Sync Short Wait (up to 8 cycles)
`define LPC_SYNC_LWAIT  4'b0110             // LPC Sync Long Wait (no limit)
`define LPC_SYNC_MORE   4'b1001             // LPC Sync Ready More (DMA only)
`define LPC_SYNC_ERROR  4'b1010             // LPC Sync Error

`define LPC_ST_IDLE     14'h000             // LPC Idle state
`define LPC_ST_START    14'h001             // LPC Start state
`define LPC_ST_CYCTYP   14'h002             // LPC Cycle Type State
`define LPC_ST_ADDR     14'h004             // LPC Address state (4 cycles)
`define LPC_ST_CHAN     14'h008             // LPC Address state (4 cycles)
`define LPC_ST_SIZE     14'h010             // LPC Address state (4 cycles)
`define LPC_ST_H_DATA   14'h020             // LPC Host Data state (2 cycles)
`define LPC_ST_P_DATA   14'h040             // LPC Peripheral Data state (2 cycles)
`define LPC_ST_H_TAR1   14'h080             // LPC Host Turnaround 1 (Drive LAD 4'hF)
`define LPC_ST_H_TAR2   14'h100             // LPC Host Turnaround 2 (Float LAD)
`define LPC_ST_P_TAR1   14'h200             // LPC Peripheral Turnaround 1 (Drive LAD = 4'hF)
`define LPC_ST_P_TAR2   14'h400             // LPC Peripheral Turnaround 2 (Float LAD)
`define LPC_ST_WB_RETIRE 14'h400            // Retire Wishbone transfer (Host only), ends WB cycle.
`define LPC_ST_SYNC     14'h800             // LPC Sync State (may be multiple cycles for wait-states)
`define LPC_ST_P_WAIT1  14'h1000            // LPC Sync State (may be multiple cycles for wait-states)
`define LPC_ST_FWW_SYNC 14'h2000            // LPC Sync State for Firmware Writes (must not generate wait-states)


`define WB_SEL_BYTE     4'b0001             // Byte Transfer
`define WB_SEL_SHORT    4'b0011             // Short Transfer
`define WB_SEL_WORD     4'b1111             // Word Transfer

`define WB_TGA_MEM      2'b00               // Memory Cycle
`define WB_TGA_IO       2'b01               // I/O Cycle
`define WB_TGA_FW       2'b10               // Firmware Cycle
`define WB_TGA_DMA      2'b11               // DMA Cycle

// LDRQ States

`define LDRQ_ST_IDLE    4'h0
`define LDRQ_ST_ADDR    4'h1
`define LDRQ_ST_ACT     4'h2
`define LDRQ_ST_DONE    4'h4
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: wb_lpc_host.v,v 1.4 2008-07-26 19:15:31 hharte Exp $   ////
////  wb_lpc_host.v - Wishbone Slave to LPC Host Bridge           ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/wb_lpc_defines.v"

//                  I/O Write       I/O Read        DMA Read        DMA Write
//                                                          
//  States -    1. H Start          H Start         H Start         H Start
//              2. H CYCTYPE+DIR    H CYCTYPE+DIR   H CYCTYPE+DIR   H CYCTYPE+DIR
//              3. H Addr (4)       H Addr (4)      H CHAN+TC       H CHAN+TC
//                                                  H SIZE          H SIZE
//              4. H Data (2)       H TAR  (2)    +-H DATA (2)      H TAR  (2)
//              5. H TAR  (2)       P SYNC (1+)   | H TAR  (2)    +-P SYNC (1+)
//              6. P SYNC (1+)      P DATA (2)    | H SYNC (1+)   +-P DATA (2)
//              7. P TAR  (2)       P TAR  (2)    +-P TAR  (2)      P TAR
//                                                          
module wb_lpc_host(clk_i, nrst_i, wbs_adr_i, wbs_dat_o, wbs_dat_i, wbs_sel_i, wbs_tga_i, wbs_we_i,
                   wbs_stb_i, wbs_cyc_i, wbs_ack_o, wbs_err_o,
                   dma_chan_i, dma_tc_i,
                   lframe_o, lad_i, lad_o, lad_oe
);
    // Wishbone Slave Interface
    input              clk_i;
    input              nrst_i;             // Active low reset.
    input       [31:0] wbs_adr_i;
    output      [31:0] wbs_dat_o;
    input       [31:0] wbs_dat_i;
    input       [3:0]  wbs_sel_i;
    input       [1:0]  wbs_tga_i;
    input              wbs_we_i;
    input              wbs_stb_i;
    input              wbs_cyc_i;
    output reg         wbs_ack_o;
    output reg         wbs_err_o;
    
    // LPC Master Interface
    output reg        lframe_o;     // LPC Frame output (active high)
    output reg        lad_oe;       // LPC AD Output Enable
    input       [3:0] lad_i;        // LPC AD Input Bus
    output reg  [3:0] lad_o;        // LPC AD Output Bus

    // DMA-Specific sideband signals
    input       [2:0] dma_chan_i;   // DMA Channel
    input             dma_tc_i;     // DMA Terminal Count

    reg         [13:0] state;       // Current state
    reg         [2:0] adr_cnt;      // Address nibbe counter
    reg         [3:0] dat_cnt;      // Data nibble counter
    reg         [2:0] xfr_len;      // Number of nibbls for transfer
    wire        [2:0] byte_cnt = dat_cnt[3:1];  // Byte Counter
    wire              nibble_cnt = dat_cnt[0];    // Nibble counter
    reg         [31:0] lpc_dat_i;           // Temporary storage for input word.

    //
    // generate wishbone register signals
    wire wbs_acc = wbs_cyc_i & wbs_stb_i;    // Wishbone access
    wire wbs_wr  = wbs_acc & wbs_we_i;       // Wishbone write access

    // Memory Cycle (tga== 1'b00) is bit 2=1 for LPC Cycle Type.
    wire    mem_xfr = (wbs_tga_i == `WB_TGA_MEM);
    wire    dma_xfr = (wbs_tga_i == `WB_TGA_DMA);
    wire    fw_xfr  = (wbs_tga_i == `WB_TGA_FW);
    
    assign wbs_dat_o[31:0] = lpc_dat_i; 

    always @(posedge clk_i or negedge nrst_i)
        if(~nrst_i)
        begin
            state <= `LPC_ST_IDLE;
            lframe_o <= 1'b0;
            wbs_ack_o <= 1'b0;
            wbs_err_o <= 1'b0;
            lad_oe <= 1'b0;
            lad_o <= 4'b0;
            adr_cnt <= 3'b0;
            dat_cnt <= 4'h0;
            xfr_len <= 3'b000;
            lpc_dat_i <= 32'h00000000;
        end
        else begin
            case(state)
                `LPC_ST_IDLE:
                    begin
                        wbs_ack_o <= 1'b0;
                        wbs_err_o <= 1'b0;
                        lframe_o <= 1'b0;
                        dat_cnt <= 4'h0;                        

                        if(wbs_acc)     // Wishbone access starts LPC transaction
                            state <= `LPC_ST_START;
                        else
                            state <= `LPC_ST_IDLE;
                    end
                `LPC_ST_START:
                    begin
                        lframe_o <= 1'b1;
                        if(~fw_xfr) begin       // For Memory and I/O Cycles
                            lad_o   <= `LPC_START;
                            state   <= `LPC_ST_CYCTYP;
                        end
                        else begin              // Firmware Read and Write Cycles
                            if(wbs_wr)
                                lad_o <= `LPC_FW_WRITE;
                            else
                                lad_o <= `LPC_FW_READ;
                            
                            state   <= `LPC_ST_ADDR;
                        end
                        lad_oe  <= 1'b1;
                        adr_cnt <= ((mem_xfr | fw_xfr) ? 3'b000 : 3'b100);
                    end
                `LPC_ST_CYCTYP:
                    begin
                        lframe_o    <= 1'b0;
                        lad_oe  <= 1'b1;                

                        if(~dma_xfr)
                            begin
                                lad_o   <= {1'b0,mem_xfr,wbs_wr,1'b0};      // Cycle Type/Direction for I/O or MEM
                                state       <= `LPC_ST_ADDR;
                            end
                        else // it is DMA
                            begin
                                lad_o   <= {1'b1,1'b0,~wbs_wr,1'b0};        // Cycle Type/Direction for DMA, r/w is inverted for DMA
                                state       <= `LPC_ST_CHAN;
                            end
                    end
                `LPC_ST_ADDR:   // Output four nubbles of address.
                    begin
                        lframe_o <= 1'b0;       // In case we came here from a Firmware cycle, which skips CYCTYP.
                        
                        // The LPC Bus Address is sent across the bus a nibble at a time;
                        // however, the most significant nibble is sent first.  For firmware and
                        // memory cycles, the address is 32-bits.  Actually, for firmware accesses,
                        // the most significant nibble is known as the IDSEL field.  For I/O,
                        // the address is only 16-bits wide.
                        case(adr_cnt)
                            3'h0:
                                lad_o <= wbs_adr_i[31:28];
                            3'h1:
                                lad_o <= wbs_adr_i[27:24];
                            3'h2:
                                lad_o <= wbs_adr_i[23:20];
                            3'h3:
                                lad_o <= wbs_adr_i[19:16];
                            3'h4:
                                lad_o <= wbs_adr_i[15:12];
                            3'h5:
                                lad_o <= wbs_adr_i[11:8];
                            3'h6:
                                lad_o <= wbs_adr_i[7:4];
                            3'h7:
                                lad_o <= wbs_adr_i[3:0];
                        endcase
                        
                        adr_cnt <= adr_cnt + 1;
                        
                        if(adr_cnt == 4'h7) // Last address nibble.
                            begin
                                if(~fw_xfr)
                                    if(wbs_wr)
                                        state <= `LPC_ST_H_DATA;
                                    else
                                        state <= `LPC_ST_H_TAR1;
                                else    // For firmware read/write, we need to transfer the MSIZE nibble
                                    state <= `LPC_ST_SIZE;
                            end
                        else
                            state <= `LPC_ST_ADDR;
        
                        lad_oe  <= 1'b1;
                        xfr_len     <= 3'b001;      // One Byte Transfer
                    end
                `LPC_ST_CHAN:
                    begin
                        lad_o   <= {dma_tc_i, dma_chan_i};
                        state <= `LPC_ST_SIZE;
                    end
                `LPC_ST_SIZE:
                    begin
                        case(wbs_sel_i)
                            `WB_SEL_BYTE:
                                begin
                                    xfr_len <= 3'b001;
                                    lad_o <= 4'h0;
                                end
                            `WB_SEL_SHORT:
                                begin
                                    xfr_len <= 3'b010;
                                    lad_o <= 4'h1;
                                end
                            `WB_SEL_WORD:
                                begin
                                    xfr_len <= 3'b100;
                                    if(fw_xfr)              // Firmware transfer uses '2' for 4-byte transfer.
                                        lad_o <= 4'h2;
                                    else                    // DMA uses '3' for 4-byte transfer.
                                        lad_o <= 4'h3;
                                end
                            default:
                                begin
                                    xfr_len <= 3'b001;
                                    lad_o <= 4'h0;
                                end
                        endcase
                        if(wbs_wr)
                            state <= `LPC_ST_H_DATA;
                        else
                            state <= `LPC_ST_H_TAR1;
                    end

                `LPC_ST_H_DATA:
                    begin
                        lad_oe  <= 1'b1;
                        case(dat_cnt)   // We only support a single byte for I/O.
                            4'h0:
                                lad_o <= wbs_dat_i[3:0];
                            4'h1:
                                lad_o <= wbs_dat_i[7:4];
                            4'h2:
                                lad_o <= wbs_dat_i[11:8];
                            4'h3:
                                lad_o <= wbs_dat_i[15:12];
                            4'h4:
                                lad_o <= wbs_dat_i[19:16];
                            4'h5:
                                lad_o <= wbs_dat_i[23:20];
                            4'h6:
                                lad_o <= wbs_dat_i[27:24];
                            4'h7:
                                lad_o <= wbs_dat_i[31:28];
                            default:
                                lad_o <= 4'hx;
                        endcase
                        
                        dat_cnt <= dat_cnt + 1;
                        
                        if(nibble_cnt == 1'b1) // end of byte
                            begin
                                if((fw_xfr) && (byte_cnt != xfr_len-1)) // Firmware transfer does not have TAR between bytes.
                                    state <= `LPC_ST_H_DATA;
                                else
                                    state <= `LPC_ST_H_TAR1;
                            end
                        else
                            state <= `LPC_ST_H_DATA;
                    end
        
                `LPC_ST_H_TAR1:
                    begin
                        lad_o <= 4'b1111;       // Drive LAD high
                        lad_oe <= 1'b1;
                        state <= `LPC_ST_H_TAR2;
                    end
                `LPC_ST_H_TAR2:
                    begin
                        lad_oe <= 1'b0;     // float LAD
                        state <= `LPC_ST_SYNC;
                    end
                `LPC_ST_SYNC:
                    begin
                        lad_oe <= 1'b0;     // float LAD
                        if((lad_i == `LPC_SYNC_READY) || (lad_i == `LPC_SYNC_MORE)) begin
                            if(wbs_wr) begin
                                state <= `LPC_ST_P_TAR1;
                            end
                            else begin
                                state <= `LPC_ST_P_DATA;
                            end
                        end else if(lad_i == `LPC_SYNC_ERROR) begin
                            dat_cnt <= { xfr_len, 1'b1 };    // Terminate data transfer
                            wbs_err_o <= 1'b1;    // signal wishbone error
                            state <= `LPC_ST_P_TAR1;
                        end else begin
                            state <= `LPC_ST_SYNC;
                        end
                    end
        
                `LPC_ST_P_DATA:
                    begin
                        case(dat_cnt)
                            4'h0:
                                lpc_dat_i[3:0] <= lad_i;
                            4'h1:
                                lpc_dat_i[7:4] <= lad_i;
                            4'h2:
                                lpc_dat_i[11:8] <= lad_i;
                            4'h3:
                                lpc_dat_i[15:12] <= lad_i;
                            4'h4:
                                lpc_dat_i[19:16] <= lad_i;
                            4'h5:
                                lpc_dat_i[23:20] <= lad_i;
                            4'h6:
                                lpc_dat_i[27:24] <= lad_i;
                            4'h7:
                                lpc_dat_i[31:28] <= lad_i;
                        endcase
                        
                        dat_cnt <= dat_cnt + 1;
                        
                        if(nibble_cnt == 1'b1)          // Byte transfer complete
                            if (byte_cnt == xfr_len-1)  // End of data transfer phase
                                state <= `LPC_ST_P_TAR1;
                            else begin
                                if(fw_xfr) // Firmware transfer does not have TAR between bytes.
                                    state <= `LPC_ST_P_DATA;
                                else
                                    state <= `LPC_ST_SYNC;
                            end
                        else                            // Go to next nibble
                            state <= `LPC_ST_P_DATA;
                    end
                `LPC_ST_P_TAR1:
                    begin
                        lad_oe <= 1'b0;
                        if(byte_cnt == xfr_len) begin
                            state <= `LPC_ST_WB_RETIRE;
                            wbs_ack_o <= wbs_acc;
                        end
                        else begin
                            if(wbs_wr) begin    // DMA READ (Host to Peripheral)
                                state <= `LPC_ST_H_DATA;
                            end
                            else begin  // unhandled READ case
                                state <= `LPC_ST_IDLE;
                            end
                        end
                    end
                `LPC_ST_WB_RETIRE:
                    begin
                        wbs_ack_o <= 1'b0;
                        wbs_err_o <= 1'b0;
                        if(wbs_acc) begin
                            state <= `LPC_ST_WB_RETIRE;
                        end
                        else begin
                            state <= `LPC_ST_IDLE;
                        end
                    end
            endcase
        end

endmodule

                            
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: wb_lpc_periph.v,v 1.4 2008-07-26 19:15:32 hharte Exp $ ////
////  wb_lpc_periph.v - LPC Peripheral to Wishbone Master Bridge  ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

`timescale 1 ns / 1 ns

`include "../../rtl/verilog/wb_lpc_defines.v"

//              I/O Write       I/O Read        DMA Read        DMA Write
//                                                          
//  States - 1. H Start         H Start         H Start         H Start
//           2. H CYCTYPE+DIR   H CYCTYPE+DIR   H CYCTYPE+DIR   H CYCTYPE+DIR
//           3. H Addr (4)      H Addr (4)      H CHAN+TC       H CHAN+TC
//                                              H SIZE          H SIZE
//           4. H Data (2)      H TAR  (2)    +-H DATA (2)      H TAR  (2)
//           5. H TAR  (2)      P SYNC (1+)   | H TAR  (2)    +-P SYNC (1+)
//           6. P SYNC (1+)     P DATA (2)    | H SYNC (1+)   +-P DATA (2)
//           7. P TAR  (2)      P TAR  (2)    +-P TAR  (2)      P TAR
//                                                          

module wb_lpc_periph(clk_i, nrst_i, wbm_adr_o, wbm_dat_o, wbm_dat_i, wbm_sel_o, wbm_tga_o, wbm_we_o,
                     wbm_stb_o, wbm_cyc_o, wbm_ack_i, wbm_err_i,
                     dma_chan_o, dma_tc_o,
                     lframe_i, lad_i, lad_o, lad_oe
);

    // Wishbone Master Interface
    input              clk_i;
    input              nrst_i;
    output reg  [31:0] wbm_adr_o;
    output reg  [31:0] wbm_dat_o;
    input       [31:0] wbm_dat_i;
    output reg   [3:0] wbm_sel_o;
    output reg   [1:0] wbm_tga_o;
    output reg         wbm_we_o;
    output reg         wbm_stb_o;
    output reg         wbm_cyc_o;
    input              wbm_ack_i;
    input              wbm_err_i;	 

    // LPC Slave Interface
    input              lframe_i;    // LPC Frame input (active high)
    output reg         lad_oe;      // LPC AD Output Enable
    input        [3:0] lad_i;       // LPC AD Input Bus
    output reg   [3:0] lad_o;       // LPC AD Output Bus

    // DMA-Specific sideband signals
    output       [2:0] dma_chan_o;  // DMA Channel
    output             dma_tc_o;    // DMA Terminal Count

    reg         [13:0] state;       // Current state
    reg          [2:0] adr_cnt;     // Address nibble counter
    reg          [3:0] dat_cnt;     // Data nibble counter
    wire         [2:0] byte_cnt = dat_cnt[3:1];  // Byte counter
    wire               nibble_cnt = dat_cnt[0];  // Nibble counter

    reg         [31:0] lpc_dat_i;   // Temporary storage for LPC input data.
    reg                mem_xfr;     // LPC Memory Transfer (not I/O)
    reg                dma_xfr;     // LPC DMA Transfer
    reg                fw_xfr;      // LPC Firmware memory read/write
    reg          [2:0] xfr_len;     // Number of nibbls for transfer
    reg                dma_tc;      // DMA Terminal Count
    reg          [2:0] dma_chan;    // DMA Channel

    // These buffer enough state to delay the start of the next Wishbone cycle
    // until the previous Firmware Write has completed.
    reg         [31:0] lpc_adr_reg; // Temporary storage for address received on LPC bus.
    reg         [31:0] lpc_dat_o;   // Temporary storage for LPC output data.
    reg                lpc_write;   // Holds current LPC transfer direction
    reg          [1:0] lpc_tga_o;
    reg                got_ack;     // Set when ack has been received from wbm

    assign dma_chan_o = dma_chan;
    assign dma_tc_o = dma_tc;
    
    always @(posedge clk_i or negedge nrst_i)
    begin
        if(~nrst_i)
        begin
            state <= `LPC_ST_IDLE;
            lpc_adr_reg <= 32'h00000000;
            lpc_dat_o <= 32'h00000000;
            lpc_write <= 1'b0;
            lpc_tga_o <= `WB_TGA_MEM;
            lad_oe <= 1'b0;
            lad_o <= 8'hFF;
            lpc_dat_i <= 32'h00000000;
            mem_xfr <= 1'b0;
            dma_xfr <= 1'b0;
            fw_xfr <= 1'b0;
            xfr_len <= 3'b000;
            dma_tc <= 1'b0;
            dma_chan <= 3'b000;
        end
        else begin
            case(state)
                `LPC_ST_IDLE:
                    begin
                        dat_cnt <= 4'h0;
                        if(lframe_i) begin
                            lad_oe <= 1'b0;
                            xfr_len <= 3'b001;
                                
                            if(lad_i == `LPC_START) begin
                                state <= `LPC_ST_CYCTYP;
                                lpc_write <= 1'b0;
                                fw_xfr <= 1'b0;                                 
                            end
                            else if ((lad_i == `LPC_FW_WRITE) || (lad_i == `LPC_FW_READ)) begin
                                state <= `LPC_ST_ADDR;
                                lpc_write <= (lad_i == `LPC_FW_WRITE) ? 1'b1 : 1'b0;
                                adr_cnt <= 3'b000;
                                fw_xfr <= 1'b1;
                                dma_xfr <= 1'b0;
                                lpc_tga_o <= `WB_TGA_FW;
                            end
                            else
                                state <= `LPC_ST_IDLE;
                        end
                        else
                            state <= `LPC_ST_IDLE;
                    end
                `LPC_ST_CYCTYP:
                    begin
                        lpc_write <= (lad_i[3] ? ~lad_i[1] : lad_i[1]);  // Invert we_o if we are doing DMA.
                        adr_cnt <= (lad_i[2] ? 3'b000 : 3'b100);
                        if(lad_i[3]) begin // dma_xfr
                            lpc_tga_o <= `WB_TGA_DMA;
                            dma_xfr <= 1'b1;
                            mem_xfr <= 1'b0;
                            state <= `LPC_ST_CHAN;									 
                        end
                        else if(lad_i[2]) begin // mem_xfr
                            lpc_tga_o <= `WB_TGA_MEM;
                            dma_xfr <= 1'b0;
                            mem_xfr <= 1'b1;
                            state <= `LPC_ST_ADDR;
                        end
                        else begin
                            lpc_tga_o <= `WB_TGA_IO;
                            dma_xfr <= 1'b0;
                            mem_xfr <= 1'b0;
                            state <= `LPC_ST_ADDR;
                        end
                    end
                `LPC_ST_ADDR:
                    begin
                        case(adr_cnt)
                            3'h0: lpc_adr_reg[31:28] <= lad_i;
                            3'h1: lpc_adr_reg[27:24] <= lad_i;
                            3'h2: lpc_adr_reg[23:20] <= lad_i;
                            3'h3: lpc_adr_reg[19:16] <= lad_i;
                            3'h4: lpc_adr_reg[15:12] <= lad_i;
                            3'h5: lpc_adr_reg[11: 8] <= lad_i;
                            3'h6: lpc_adr_reg[ 7: 4] <= lad_i;
                            3'h7: lpc_adr_reg[ 3: 0] <= lad_i;
                        endcase
                        
                        adr_cnt <= adr_cnt + 1;
                        
                        if(adr_cnt == 3'h7) // Last address nibble.
                            begin
                                if(~fw_xfr)
                                    if(lpc_write)
                                        state <= `LPC_ST_H_DATA;
                                    else
                                        state <= `LPC_ST_H_TAR1;
                                else    // For firmware read/write, we need to read the MSIZE nibble
                                    state <= `LPC_ST_SIZE;
                            end
                        else
                            state <= `LPC_ST_ADDR;
                    end
                `LPC_ST_CHAN:
                    begin
                        lpc_adr_reg <= 32'h00000000;      // Address lines not used for DMA.
                        dma_tc <= lad_i[3];
                        dma_chan <= lad_i[2:0];
                        state <= `LPC_ST_SIZE;
                    end
                `LPC_ST_SIZE:
                    begin
                        case(lad_i)
                            4'h0:    xfr_len <= 3'b001;
                            4'h1:    xfr_len <= 3'b010;
                            4'h2:    xfr_len <= 3'b100;   // Firmware transfer uses '2' for 4-byte transfer.
                            4'h3:    xfr_len <= 3'b100;   // DMA uses '3' for 4-byte transfer.
                            default: xfr_len <= 3'b001;
                        endcase
                        if(lpc_write)
                            state <= `LPC_ST_H_DATA;
                        else
                            state <= `LPC_ST_H_TAR1;
                    end
                `LPC_ST_H_DATA:
                    begin
                        case(dat_cnt)
                            4'h0: lpc_dat_o[ 3: 0] <= lad_i;
                            4'h1: lpc_dat_o[ 7: 4] <= lad_i;
                            4'h2: lpc_dat_o[11: 8] <= lad_i;
                            4'h3: lpc_dat_o[15:12] <= lad_i;
                            4'h4: lpc_dat_o[19:16] <= lad_i;
                            4'h5: lpc_dat_o[23:20] <= lad_i;
                            4'h6: lpc_dat_o[27:24] <= lad_i;
                            4'h7: lpc_dat_o[31:28] <= lad_i;
                        endcase
                        
                        dat_cnt <= dat_cnt + 1;
                        
                        if(nibble_cnt == 1'b1) // end of byte
                            begin
                                if((fw_xfr) && (byte_cnt != xfr_len-1)) // Firmware transfer does not have TAR between bytes.
                                    state <= `LPC_ST_H_DATA;
										  else
                                    state <= `LPC_ST_H_TAR1;
                            end
                        else
                            state <= `LPC_ST_H_DATA;
        
                    end
        
                `LPC_ST_H_TAR1:
                    begin
                        // It is ok to start the Wishbone Cycle, done below...
                        state <= `LPC_ST_H_TAR2;
                    end
                `LPC_ST_H_TAR2:
                    begin
                        state <= (fw_xfr & lpc_write) ? `LPC_ST_FWW_SYNC : `LPC_ST_SYNC;
                        lad_o <= (fw_xfr & lpc_write) ? `LPC_SYNC_READY : `LPC_SYNC_SWAIT;
                        lad_oe <= 1'b1;     // start driving LAD
                    end
                `LPC_ST_SYNC:
                    begin
                        lad_oe <= 1'b1;     // start driving LAD
                        // First byte of WB read, last byte of WB write
                        if(((byte_cnt == xfr_len) & lpc_write) | ((byte_cnt == 0) & ~lpc_write)) begin
                            // Errors can not be signalled for Firmware Memory accesses according to the spec.
                            if((wbm_err_i) && (~fw_xfr)) begin
                                dat_cnt <= { xfr_len, 1'b1 }; // Abort remainder of transfer
                                lad_o <= `LPC_SYNC_ERROR;   // Bus error
                                state <= `LPC_ST_P_TAR1;
                            end else if(got_ack) begin
                                if(lpc_write) begin
                                    lad_o <= `LPC_SYNC_READY;   // Ready
                                    state <= `LPC_ST_P_TAR1;
                                end
                                else begin
                                    // READY+MORE for multi-byte DMA, except the final byte.
                                    // For non-DMA cycles, only READY
                                    lad_o <= (((xfr_len == 1) & ~lpc_write) || (~dma_xfr)) ? `LPC_SYNC_READY : `LPC_SYNC_MORE;
                                    state <= `LPC_ST_P_DATA;
                                end
                            end
                            else begin
                                state <= `LPC_ST_SYNC;
                                lad_o <= `LPC_SYNC_SWAIT;
                            end
                        end
                        else begin  // Multi-byte transfer, just ack right away.
                            if(lpc_write) begin
                                lad_o <= (dma_xfr) ? `LPC_SYNC_MORE : `LPC_SYNC_READY;
                                state <= `LPC_ST_P_TAR1;
                            end
									 else begin
                                lad_o <= ((byte_cnt == xfr_len-1) || (~dma_xfr)) ? `LPC_SYNC_READY : `LPC_SYNC_MORE;   // Ready-More									 
                                state <= `LPC_ST_P_DATA;
                            end
                        end
                    end
                `LPC_ST_FWW_SYNC:	// Firmware write requires a special SYNC without wait-states.
                    begin
                        lad_o <= 4'hF;
                        state <= `LPC_ST_P_TAR2;
                    end
        
                `LPC_ST_P_DATA:
                    begin
                        case(dat_cnt)
                            4'h0: lad_o <= lpc_dat_i[ 3: 0];
                            4'h1: lad_o <= lpc_dat_i[ 7: 4];
                            4'h2: lad_o <= lpc_dat_i[11: 8];
                            4'h3: lad_o <= lpc_dat_i[15:12];
                            4'h4: lad_o <= lpc_dat_i[19:16];
                            4'h5: lad_o <= lpc_dat_i[23:20];
                            4'h6: lad_o <= lpc_dat_i[27:24];
                            4'h7: lad_o <= lpc_dat_i[31:28];
                        endcase
                        
                        dat_cnt <= dat_cnt + 1;
                        
                        if(nibble_cnt == 1'b1)  // Byte transfer complete
                            if (byte_cnt == xfr_len-1) // Byte transfer complete
                                state <= `LPC_ST_P_TAR1;
                            else begin
                                if(fw_xfr) // Firmware transfer does not have TAR between bytes.
                                    state <= `LPC_ST_P_DATA;
                                else
                                    state <= `LPC_ST_SYNC;
                            end
                        else
                            state <= `LPC_ST_P_DATA;
        
                        lad_oe <= 1'b1;
                    end
                `LPC_ST_P_TAR1:
                    begin
                        lad_oe <= 1'b1;
                        lad_o <= 4'hF;
                        state <= `LPC_ST_P_TAR2;
                    end
                `LPC_ST_P_TAR2:
                    begin
                        lad_oe <= 1'b0;     // float LAD
                        if(byte_cnt == xfr_len) begin
                            state <= `LPC_ST_IDLE;
                        end
                        else begin
                            if(lpc_write) begin  // DMA READ (Host to Peripheral)
                                state <= `LPC_ST_P_WAIT1;
                            end
                            else begin  // unhandled READ case
                                state <= `LPC_ST_IDLE;
                            end
                        end

                    end
                    `LPC_ST_P_WAIT1:
                         state <= `LPC_ST_H_DATA;
            endcase
        end

// The goal here is to split the Wishbone cycle handling out of the main state-machine
// so it can run independently.  This is needed so that in the case of a firmware write,
// where the FLASH requires wait-states (which are not allowed for FW write according to
// the LPC Specification.)  In this case, since the FLASH cannot insert wait-states,
// a subsequent LPC operation (which must not be another FW Write) will insert wait-
// states before starting the next Wishbone master cycle.
//
// The only reason that I can think of for the LPC spec to mandate that Firmware Writes
// must not insert wait-states is that since FLASH writes can take a very long time,
// the LPC spec disallowed them to force LPC FLASH programming software to use polling
// to determine when the write is complete rather than inserting a bunch of wait-states,
// which would use up too much LPC bus bandwidth, and block other requests from getting
// through.
//
        if(~nrst_i)
        begin
            wbm_adr_o <= 32'h00000000;
            wbm_dat_o <= 32'h00000000;
            wbm_stb_o <= 1'b0;
            wbm_cyc_o <= 1'b0;
            wbm_we_o <= 1'b0;
            wbm_sel_o <= 4'b0000;
            wbm_tga_o <= `WB_TGA_MEM;
            got_ack <= 1'b0;
        end
        else begin
            if ((state == `LPC_ST_H_TAR1) && (((byte_cnt == xfr_len) & lpc_write) | ((byte_cnt == 0) & ~lpc_write)))
            begin
                // Start Wishbone Cycle
                wbm_stb_o <= 1'b1;
                wbm_cyc_o <= 1'b1;
                wbm_adr_o <= lpc_adr_reg;
                wbm_dat_o <= lpc_dat_o;					 
                wbm_we_o <= lpc_write;
                wbm_tga_o <= lpc_tga_o;
                got_ack <= 1'b0;
                case(xfr_len)
                    3'h0: wbm_sel_o <= `WB_SEL_BYTE;
                    3'h2: wbm_sel_o <= `WB_SEL_SHORT;
                    3'h4: wbm_sel_o <= `WB_SEL_WORD;
                endcase
            end
            else if((wbm_stb_o == 1'b1) && (wbm_ack_i == 1'b1)) begin
                // End Wishbone Cycle
                wbm_stb_o <= 1'b0;
                wbm_cyc_o <= 1'b0;
                wbm_we_o <= 1'b0;
                got_ack <= 1'b1;
                if(~wbm_we_o) begin
                    lpc_dat_i <= wbm_dat_i;
                end
             end
        end
    end
endmodule

                            
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  $Id: wb_regfile.v,v 1.3 2008-07-26 19:15:32 hharte Exp $    ////
////  wb_regfile.v - Small Wishbone register file for testing     ////
////                                                              ////
////  This file is part of the Wishbone LPC Bridge project        ////
////  http://www.opencores.org/projects/wb_lpc/                   ////
////                                                              ////
////  Author:                                                     ////
////      - Howard M. Harte (hharte@opencores.org)                ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Howard M. Harte                           ////
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

module wb_regfile (clk_i, nrst_i, wb_adr_i, wb_dat_o, wb_dat_i, wb_sel_i, wb_we_i,
                   wb_stb_i, wb_cyc_i, wb_ack_o, wb_err_o, ws_i, datareg0, datareg1);

    input          clk_i;
    input          nrst_i;
    input    [3:0] wb_adr_i;
    output reg [31:0] wb_dat_o;
    input   [31:0] wb_dat_i;
    input    [3:0] wb_sel_i;
    input          wb_we_i;
    input          wb_stb_i;
    input          wb_cyc_i;
    output reg     wb_ack_o;
    output         wb_err_o;
    input    [7:0] ws_i;	 
    output  [31:0] datareg0;
    output  [31:0] datareg1;
    reg      [7:0] waitstate;

    //
    // generate wishbone register bank writes
    wire wb_acc = wb_cyc_i & wb_stb_i;    // WISHBONE access
    wire wb_wr  = wb_acc & wb_we_i;       // WISHBONE write access

    reg [7:0]   datareg0_0;
    reg [7:0]   datareg0_1;
    reg [7:0]   datareg0_2;
    reg [7:0]   datareg0_3;

    reg [7:0]   datareg1_0;
    reg [7:0]   datareg1_1;
    reg [7:0]   datareg1_2;
    reg [7:0]   datareg1_3;

    always @(posedge clk_i or negedge nrst_i)
        if (~nrst_i)                // reset registers
            begin
                datareg0_0 <= 8'h00;
                datareg0_1 <= 8'h01;
                datareg0_2 <= 8'h02;
                datareg0_3 <= 8'h03;
                datareg1_0 <= 8'h10;
                datareg1_1 <= 8'h11;
                datareg1_2 <= 8'h12;
                datareg1_3 <= 8'h13;
                wb_ack_o <= 1'b0;
                waitstate <= 4'b0;
					 wb_dat_o <= 32'h00000000;
            end
        else if(wb_wr)          // wishbone write cycle
            case (wb_sel_i)
                4'b0000:
                    case (wb_adr_i)         // synopsys full_case parallel_case
                        4'b0000: datareg0_0 <= wb_dat_i[7:0];
                        4'b0001: datareg0_1 <= wb_dat_i[7:0];
                        4'b0010: datareg0_2 <= wb_dat_i[7:0];
                        4'b0011: datareg0_3 <= wb_dat_i[7:0];
                        4'b0100: datareg1_0 <= wb_dat_i[7:0];
                        4'b0101: datareg1_1 <= wb_dat_i[7:0];
                        4'b0110: datareg1_2 <= wb_dat_i[7:0];
                        4'b0111: datareg1_3 <= wb_dat_i[7:0];
                    endcase
                4'b0001:
                    case (wb_adr_i)         // synopsys full_case parallel_case
                        4'b0000: datareg0_0 <= wb_dat_i[7:0];
                        4'b0001: datareg0_1 <= wb_dat_i[7:0];
                        4'b0010: datareg0_2 <= wb_dat_i[7:0];
                        4'b0011: datareg0_3 <= wb_dat_i[7:0];
                        4'b0100: datareg1_0 <= wb_dat_i[7:0];
                        4'b0101: datareg1_1 <= wb_dat_i[7:0];
                        4'b0110: datareg1_2 <= wb_dat_i[7:0];
                        4'b0111: datareg1_3 <= wb_dat_i[7:0];
                    endcase
                4'b0011:
                    {datareg0_1, datareg0_0} <= wb_dat_i[15:0];
//                  case (wb_adr_i)         // synopsys full_case parallel_case
//                      3'b000: {datareg0_1, datareg0_0} <= wb_dat_i[15:0];
//                  endcase
                4'b1111:
                    {datareg0_3, datareg0_2, datareg0_1, datareg0_0} <= wb_dat_i[31:0];
//                  case (wb_adr_i)         // synopsys full_case parallel_case
//                      3'b000: {datareg0_3, datareg0_2, datareg0_1, datareg0_0} <= wb_dat_i[31:0];
//                  endcase

            endcase
    // generate dat_o
    always @(posedge clk_i)
        case (wb_sel_i)
            4'b0000:
                case (wb_adr_i)     // synopsys full_case parallel_case
                    4'b0000: wb_dat_o[7:0] <= datareg0_0;
                    4'b0001: wb_dat_o[7:0] <= datareg0_1;
                    4'b0010: wb_dat_o[7:0] <= datareg0_2;
                    4'b0011: wb_dat_o[7:0] <= datareg0_3;
                    4'b0100: wb_dat_o[7:0] <= datareg1_0;
                    4'b0101: wb_dat_o[7:0] <= datareg1_1;
                    4'b0110: wb_dat_o[7:0] <= datareg1_2;
                    4'b0111: wb_dat_o[7:0] <= datareg1_3;
                endcase
            4'b0001:
                case (wb_adr_i)     // synopsys full_case parallel_case
                    4'b0000: wb_dat_o[7:0] <= datareg0_0;
                    4'b0001: wb_dat_o[7:0] <= datareg0_1;
                    4'b0010: wb_dat_o[7:0] <= datareg0_2;
                    4'b0011: wb_dat_o[7:0] <= datareg0_3;
                    4'b0100: wb_dat_o[7:0] <= datareg1_0;
                    4'b0101: wb_dat_o[7:0] <= datareg1_1;
                    4'b0110: wb_dat_o[7:0] <= datareg1_2;
                    4'b0111: wb_dat_o[7:0] <= datareg1_3;
                endcase
            4'b0011:
                    wb_dat_o[15:0] <= {datareg0_1, datareg0_0};
            4'b1111:
                    wb_dat_o[31:0] <= {datareg0_3, datareg0_2, datareg0_1, datareg0_0};
        endcase
        
   // generate ack_o
    always @(posedge clk_i or negedge nrst_i)
        if (nrst_i) begin            // not in reset
            if (ws_i == 0) begin
                wb_ack_o <= wb_acc & !wb_ack_o;
                end else
            if((waitstate == 4'b0) && (ws_i != 0)) begin
                wb_ack_o <= 1'b0;
                if(wb_acc) begin
                    waitstate <= waitstate + 1;
                end
            end
            else begin
                if(wb_acc) waitstate <= waitstate + 1;
                if(waitstate == ws_i) begin
                    if(wb_acc) wb_ack_o <= 1'b1;
                    waitstate <= 1'b0;
                end
            end
        end

    assign datareg0 = { datareg0_3, datareg0_2, datareg0_1, datareg0_0 };
    assign datareg1 = { datareg1_3, datareg1_2, datareg1_1, datareg1_0 };

    // Generate an error for registers 0x8-0xF
    assign wb_err_o = wb_ack_o & wb_adr_i[3];

endmodule
