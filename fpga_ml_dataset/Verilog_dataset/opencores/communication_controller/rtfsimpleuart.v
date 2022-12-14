// ============================================================================
//	(C) 2007,2013  Robert Finch
//  All rights reserved.
//	robfinch@<remove>finitron.ca
//
//	edge_det.v
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//    Notes:
//
//	Edge detector
//	This little core detects an edge (positive, negative, and
//	either) in the input signal.
//
//   	Verilog 1995
// ============================================================================

module edge_det(rst, clk, ce, i, pe, ne, ee);
input rst;		// reset
input clk;		// clock
input ce;		// clock enable
input i;		// input signal
output pe;		// positive transition detected
output ne;		// negative transition detected
output ee;		// either edge (positive or negative) transition detected

reg ed;
always @(posedge clk)
	if (rst)
		ed <= 1'b0;
	else if (ce)
		ed <= i;

assign pe = ~ed & i;	// positive: was low and is now high
assign ne = ed & ~i;	// negative: was high and is now low
assign ee = ed ^ i;		// either: signal is now opposite to what it was
	
endmodule
// ============================================================================
//        __
//   \\__/ o\    (C) 2015  Robert Finch, Stratford
//    \  __ /    All rights reserved.
//     \/_//     robfinch<remove>@finitron.ca
//       ||
//
// This source file is free software: you can redistribute it and/or modify 
// it under the terms of the GNU Lesser General Public License as published 
// by the Free Software Foundation, either version 3 of the License, or     
// (at your option) any later version.                                      
//                                                                          
// This source file is distributed in the hope that it will be useful,      
// but WITHOUT ANY WARRANTY; without even the implied warranty of           
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            
// GNU General Public License for more details.                             
//                                                                          
// You should have received a copy of the GNU General Public License        
// along with this program.  If not, see <http://www.gnu.org/licenses/>.    
//
// This core simulates a serial transmitter by outputing a text stream.
// ============================================================================
//
module rtfSerialTxSim(rst,baud16,txd);
input rst;
input baud16;
output txd;

reg [9:0] buff;
reg [9:0] buf2;
reg [5:0] cnt;
reg [3:0]  bitcnt;
reg [7:0] msg [0:7];
reg [7:0] msgndx;

assign txd = buff[9];

always @(posedge baud16)
if (rst) begin
    cnt <= 6'd0;
    buff <= 10'h3FF;
    buf2 <= 10'h3ff;
    msg[0] = "H";
    msg[1] = "i";
    msg[2] = "T";
    msg[3] = "h";
    msg[4] = "e";
    msg[5] = "r";
    msg[6] = "e";
    msg[7] = " ";
    msgndx <= 4'd0; 
end
else begin
    cnt <= cnt + 6'd1;
    if (cnt==6'd15) begin
        cnt <= 6'd0;
        bitcnt <= bitcnt + 4'd1;
        if (bitcnt==4'd9) begin
            bitcnt <= 4'd0;
            buff <= buf2;
            msgndx <= msgndx + 8'd1;
            buf2 <= {1'b0,msg[msgndx],^msg[msgndx]};
        end
        else
            buff <= {buff[8:0],1'b1};
    end
end

endmodule
// ============================================================================
//	(C) 2011,2013,2015  Robert Finch
//  All rights reserved.
//	robfinch@<remove>finitron.ca
//
//	rtfSimpleUartRx.v
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//	Simple UART receiver core
//		Features:
//			false start bit detection
//			framing error detection
//			overrun state detection
//			resynchronization on every character
//			fixed format 1 start - 8 data - 1 stop bits
//			uses 16x clock rate
//			
//		This core may be used as a standalone peripheral
//	on a SoC bus if all that is desired is recieve
//	capability. It requires a 16x baud rate clock.
//	
//   	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|WISHBONE Datasheet
//	|WISHBONE SoC Architecture Specification, Revision B.3
//	|
//	|Description:						Specifications:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|General Description:				simple serial UART receiver
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported Cycles:					SLAVE,READ
//	|									SLAVE,BLOCK READ
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Data port, size:					8 bit
//	|Data port, granularity:			8 bit
//	|Data port, maximum operand size:	8 bit
//	|Data transfer ordering:			Undefined
//	|Data transfer sequencing:			Undefined
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Clock frequency constraints:		none
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported signal list and			Signal Name		WISHBONE equiv.
//	|cross reference to equivalent		ack_o			ACK_O
//	|WISHBONE signals					
//	|									clk_i			CLK_I
//	|                                   rst_i           RST_I
//	|									dat_o(7:0)		DAT_O()
//	|									cyc_i			CYC_I
//	|									stb_i			STB_I
//	|									we_i			WE_I
//	|
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Special requirements:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//
//	Ref: Spartan3 -4
//	27 LUTs / 24 slices / 170 MHz
//==============================================================================

`define IDLE	0
`define CNT		1

module rtfSimpleUartRx(
	// WISHBONE SoC bus interface
	input rst_i,			// reset
	input clk_i,			// clock
	input cyc_i,			// cycle is valid
	input stb_i,			// strobe
	output ack_o,			// data is ready
	input we_i,				// write (this signal is used to qualify reads)
	output [7:0] dat_o,		// data out
	//------------------------
	input cs_i,				// chip select
	input baud16x_ce,		// baud rate clock enable
    input tri0 baud8x,       // switches to mode baudX8
	input clear,			// clear reciever
	input rxd,				// external serial input
	output reg data_present,	// data present in fifo
	output reg frame_err,		// framing error
	output reg overrun			// receiver overrun
);

//0 - simple sampling at middle of symbol period
//>0 - sampling of 3 middle ticks of sumbol perion and results as majority
parameter SamplerStyle = 0;

// variables
reg [7:0] cnt;			// sample bit rate counter
reg [9:0] rx_data;		// working receive data register
reg state;				// state machine
reg wf;					// buffer write
reg [7:0] dat;

wire isX8;
buf(isX8, baud8x);
reg modeX8;

assign ack_o = cyc_i & stb_i & cs_i;
assign dat_o = ack_o ? dat : 8'b0;

// update data register
always @(posedge clk_i)
	if (wf) dat <= rx_data[8:1];

// on a read clear the data present status
// but set the status when the data register
// is updated by the receiver		
always @(posedge clk_i)
    if (rst_i)
        data_present <= 0;
    else if (wf) 
        data_present <= 1;
	else if (ack_o & ~we_i) data_present <= 0;


// Three stage synchronizer to synchronize incoming data to
// the local clock (avoids metastability).
reg [5:0] rxdd          /* synthesis ramstyle = "logic" */; // synchronizer flops
reg rxdsmp;             // majority samples
reg rdxstart;           // for majority style sample solid 3tik-wide sample
reg [1:0] rxdsum;
always @(posedge clk_i)
if (baud16x_ce) begin
	rxdd <= {rxdd[4:0],rxd};
    if (SamplerStyle == 0) begin
        rxdsmp <= rxdd[3];
        rdxstart <= rxdd[4]&~rxdd[3];
    end
    else begin
        rxdsum[1] <= rxdsum[0];
        rxdsum[0] <= {1'b0,rxdd[3]} + {1'b0,rxdd[4]} + {1'b0,rxdd[5]};
        rxdsmp <= rxdsum[1];
        rdxstart <= (rxdsum[0] == 2'b00) & ((rxdsum[1] == 2'b11));
    end
end


`define CNT_FRAME  (8'h97)
`define CNT_FINISH (8'h9D)

always @(posedge clk_i) begin
	if (rst_i) begin
		state <= `IDLE;
		wf <= 1'b0;
		overrun <= 1'b0;
        frame_err <= 1'b0;
	end
	else begin

		// Clear write flag
		wf <= 1'b0;

		if (clear) begin
			wf <= 1'b0;
			state <= `IDLE;
			overrun <= 1'b0;
            frame_err <= 1'b0;
		end

		else if (baud16x_ce) begin

			case (state)

			// Sit in the idle state until a start bit is
			// detected.
			`IDLE:
				// look for start bit
				if (rdxstart)
					state <= `CNT;

			`CNT:
				begin
					// End of the frame ?
					// - check for framing error
					// - write data to read buffer
					if (cnt==`CNT_FRAME)
						begin	
							frame_err <= ~rxdsmp;
                            overrun <= data_present;
							if (!data_present)
								wf <= 1'b1;
                            state <= `IDLE;
						end
					// Switch back to the idle state a little
					// bit too soon.
					//if (cnt==`CNT_FINISH) begin
					//	state <= `IDLE;
                    //end

					// On start bit check make sure the start
					// bit is low, otherwise go back to the
					// idle state because it's a false start.
					if (cnt==8'h07 && rxdsmp)
						state <= `IDLE;

					if (cnt[3:0]==4'h7)
						rx_data <= {rxdsmp,rx_data[9:1]};
				end

			endcase
		end
	end
end


// bit rate counter
always @(posedge clk_i)
	if (baud16x_ce) begin
		if (state == `IDLE) begin
			cnt <= modeX8;
            modeX8 <= isX8;
        end
        else begin
            cnt[7:1] <= cnt[7:1] + cnt[0];
            cnt[0] <= ~cnt[0] | (modeX8);
        end
	end

endmodule

// ============================================================================
//	(C) 2011,2013  Robert Finch
//  All rights reserved.
//	robfinch@<remove>finitron.ca
//
//	rtfSimpleUartTx.v
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//		Simple uart transmitter core.
//		Features:
//			Fixed format 1 start - 8 data - 1 stop bits
//
//
//   	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|WISHBONE Datasheet
//	|WISHBONE SoC Architecture Specification, Revision B.3
//	|
//	|Description:						Specifications:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|General Description:				simple serial UART transmitter
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported Cycles:					SLAVE,WRITE
//	|									SLAVE,BLOCK WRITE
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Data port, size:					8 bit
//	|Data port, granularity:			8 bit
//	|Data port, maximum operand size:	8 bit
//	|Data transfer ordering:			Undefined
//	|Data transfer sequencing:			Undefined
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Clock frequency constraints:		none
//  |      Baud Generates by X16 or X8 CLK_I depends on baud8x pin
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported signal list and			Signal Name		WISHBONE equiv.
//	|cross reference to equivalent		ack_o			ACK_O
//	|WISHBONE signals					
//	|									clk_i			CLK_I
//	|                                   rst_i           RST_I 
//	|									dat_i[7:0]		DAT_I()
//	|									cyc_i			CYC_I
//	|									stb_i			STB_I
//	|									we_i			WE_I
//	|
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Special requirements:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//
//
//	REF: Spartan3 - 4
//	30 LUTs / 23 slices / 165MHz
//============================================================================ */

module rtfSimpleUartTx(
	// WISHBONE SoC bus interface
	input rst_i,		// reset
	input clk_i,		// clock
	input cyc_i,		// cycle valid
	input stb_i,		// strobe
	output ack_o,		// transfer done
	input we_i,			// write transmitter
	input [7:0] dat_i,	// data in
	//--------------------
	input cs_i,			// chip select
	input baud16x_ce,	// baud rate clock enable
    input tri0 baud8x,       // switches to mode baudX8
	input cts,			// clear to send
	output txd,			// external serial output
	output reg empty, 	// buffer is empty
    output reg txc          // tx complete flag
);

reg [9:0] tx_data;	// transmit data working reg (raw)
reg [7:0] fdo;		// data output
reg [7:0] cnt;		// baud clock counter
reg rd;

wire isX8;
buf(isX8, baud8x);
reg  modeX8;

assign ack_o = cyc_i & stb_i & cs_i;
assign txd = tx_data[0];

always @(posedge clk_i)
	if (ack_o & we_i) fdo <= dat_i;

// set full / empty status
always @(posedge clk_i)
	if (rst_i) empty <= 1;
	else begin
	if (ack_o & we_i) empty <= 0;
	else if (rd) empty <= 1;
	end

`define CNT_FINISH (8'h9F)
always @(posedge clk_i)
	if (rst_i) begin
		cnt <= `CNT_FINISH;
		rd <= 0;
		tx_data <= 10'h3FF;
        txc <= 1'b1;
        modeX8 <= 1'b0;
	end
	else begin

		rd <= 0;

		if (baud16x_ce) begin

			// Load next data ?
			if (cnt==`CNT_FINISH) begin
                modeX8 <= isX8;
				if (!empty && cts) begin
					tx_data <= {1'b1,fdo,1'b0};
					rd <= 1;
                    cnt <= modeX8;
                    txc <= 1'b0;
				end
                else
                    txc <= 1'b1;
			end
			// Shift the data out. LSB first.
			else begin
                cnt[7:1] <= cnt[7:1] + cnt[0];
                cnt[0] <= ~cnt[0] | (modeX8);

                if (cnt[3:0]==4'hF)
                    tx_data <= {1'b1,tx_data[9:1]};
            end
		end
	end

endmodule
// ============================================================================
//	(C) 2007,2011,2013,2015  Robert Finch
//  All rights reserved.
//	robfinch@<remove>finitron.ca
//
//	rtfSimpleUart.v
//		Basic uart with	baud rate generator based on a harmonic
//	frequency synthesizer.
//
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//
//  	To use:
// 
//  	Set the pClkFreq parameter to the frequency of the system
//  	clock (clk_i). This can be done when the core is instanced.
// 
//    1) set the baud rate value in the clock multiplier
//    registers (CM1,2,3). A default multiplier value may
//    be specified using the pClkMul parameter, so it
//    doesn't have to be programmed at run time. (Note the
//    pBaud parameter may also be set, but it doesn't work
//    in all cases due to arithmetic limitations).
//    2) enable communication by activating the rts, and
//    dtr signals in the modem control register. These
//    signals are defaulted to be active on reset, so they
//    may not need to be set. The pRts and pDtr parameters
//    may be used to change the default setting.
//    3) use interrupts or poll the status register to
//    determine when to transmit or receive a byte of data
//    4) read / write the transmit / recieve data buffer
//    for communication.
//
//    Notes:
//    	This core only supports a single transmission /
//    reception format: 1 start, 8 data, and 1 stop bit (no
//    parity).	
//    	The baud rate generator uses a 24 bit harmonic
//    frequency synthesizer. Compute the multiplier value
//    as if a 32 bit value was needed, then take the upper
//    24 bits of the value. (The number of significant bits
//    in the value determine the minimum frequency
//    resolution or the precision of the value).
//
//    				baud rate * 16
//    	value = -----------------------
//    			(clock frequency / 2^32)
//  
//  		eg			38400 * 16
//  		value = -----------------------
//				(28.63636MHz / 2^32)
//				
//				= 92149557.65
//				= 057E1736 (hex)
//				
//				
//		taking the upper 24 bits
//				top 24 = 057E17
//						= 359959
//				
//		so the value needed to be programmed into the register
//	for 38.4k baud is 57E17 (hex)
//		eg 	CM0 = 0 (not used)
//			CM1 = 17 hex
//			CM2 = 7E hex
//			CM3 = 05 hex
//
//
//	Register Description
//
//	reg
//	0	read / write (RW)
//		TRB - transmit / receive buffer
//		transmit / receive buffer
//		write 	- write to transmit buffer
//		read	- read from receive buffer
//
//	1	read only (RO)
//		LS	- line status register
//		bit 0 = receiver not empty, this bit is set if there is
//				any data available in the receiver fifo
//		bit 1 = overrun, this bit is set if receiver overrun occurs
//		bit 3 = framing error, this bit is set if there was a
//				framing error with the current byte in the receiver
//				buffer.
//		bit 5 = transmitter not full, this bit is set if the transmitter
//				can accept more data
//		bit 6 = transmitter empty, this bit is set if the transmitter is
//				completely empty
//
//	2	MS	- modem status register (RO)
//		writing to the modem status register clears the change
//		indicators, which should clear a modem status interrupt
//		bit 3 = change on dcd signal
//		bit 4 = cts signal level
//		bit 5 = dsr signal level
//		bit 6 = ri signal level
//		bit 7 = dcd signal level
//
//	3	IS	- interrupt status register (RO)
//		bit 0-4 = mailbox number
//		bit 0,1	= 00
//		bit 2-4	= encoded interrupt value
//		bit 5-6 = not used, reserved
//		bit 7 = 1 = interrupt pending, 0 = no interrupt
//
//	4	IE	- interrupt enable register (RW)
//		bit 0 = receive interrupt (data present)
//		bit 1 = transmit interrupt (data empty)
//		bit 3 = modem status (dcd) register change
//		bit 5-7 = unused, reserved
//
//	5	FF	- frame format register		(RW)
//		this register doesn't do anything in the simpleUart
//		but is reserved for compatiblity with the more
//		advanced uart
//
//	6	MC	- modem control register (RW)
//		bit 0 = dtr signal level output
//		bit 1 = rts signal level output
//
//	7	- control register
//		bit 0 = hardware flow control,
//			when this bit is set, the transmitter output is
//			controlled by the cts signal line automatically
//
//
//		* Clock multiplier steps the 16xbaud clock frequency
//		in increments of 1/2^32 of the clk_i input using a
//		harmonic frequency synthesizer
//		eg. to get a 9600 baud 16x clock (153.6 kHz) with a
//		27.175 MHz clock input,
//		value  = upper24(9600 * 16  / (27.175MHz / 2^32))
//		Higher frequency baud rates will exhibit more jitter
//		on the 16x clock, but this will mostly be masked by the 
//		16x clock factor.
//
//	8	CM0	- Clock Multiplier byte 0 (RW)
//		this is the least significant byte
//		of the clock multiplier value
//		this register is not used unless the clock
//		multiplier is set to contain 32 bit values
//
//	9	CM1 - Clock Multiplier byte 1	(RW)
//		this is the third most significant byte
//		of the clock multiplier value
//		this register is not used unless the clock
//		multiplier is set to contain 24 or 32 bit values
//
//	10	CM2 - Clock Multiplier byte 2	(RW)
//		this is the second most significant byte of the clock
//		multiplier value
//
//	11	CM3	- Clock Multiplier byte 3 	(RW)
//		this is the most significant byte of the multiplier value
//
//	12	FC	- Fifo control register		(RW)
//		this register doesnt' do anything in the simpleUart
//		but is reserved for compatibility with the more
//		advanced uart
//		
//	13-14	reserved registers
//
//	15	SPR	- scratch pad register (RW)
//
//
//   	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|WISHBONE Datasheet
//	|WISHBONE SoC Architecture Specification, Revision B.3
//	|
//	|Description:						Specifications:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|General Description:				simple UART core
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported Cycles:					SLAVE,READ/WRITE
//	|									SLAVE,BLOCK READ/WRITE
//	|									SLAVE,RMW
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Data port, size:					8 bit
//	|Data port, granularity:			8 bit
//	|Data port, maximum operand size:	8 bit
//	|Data transfer ordering:			Undefined
//	|Data transfer sequencing:			Undefined
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Clock frequency constraints:		none
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Supported signal list and			Signal Name		WISHBONE equiv.
//	|cross reference to equivalent		ack_o			ACK_O
//	|WISHBONE signals					adr_i[3:0]		ADR_I()
//	|									clk_i			CLK_I
//	|                                   rst_i           RST_I()
//	|									dat_i(7:0)		DAT_I()
//	|									dat_o(7:0)		DAT_O()
//	|									cyc_i			CYC_I
//	|									stb_i			STB_I
//	|									we_i			WE_I
//	|
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//	|Special requirements:
//	+- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//
//=============================================================================

`define UART_TRB    4'd0    // transmit/receive buffer
`define UART_LS     4'd1    // line status register
`define UART_MS     4'd2    // modem status register
`define UART_IS		4'd3	// interrupt status register
`define UART_IER    4'd4    // interrupt enable
`define UART_FF     4'd5    // frame format register
`define UART_MC     4'd6    // modem control register
`define UART_CTRL	4'd7	// control register
`define UART_CLKM0	4'd8	// clock multiplier byte 0
`define UART_CLKM1	4'd9	// clock multiplier byte 1
`define UART_CLKM2	4'd10	// clock multiplier byte 2
`define UART_CLKM3	4'd11	// clock multiplier byte 3
`define UART_FC     4'd12   // fifo control register

module rtfSimpleUart(
	// WISHBONE Slave interface
	input rst_i,		// reset
	input clk_i,		// eg 100.7MHz
	input cyc_i,		// cycle valid
	input stb_i,		// strobe
	input we_i,			// 1 = write
	input [31:0] adr_i,		// register address
	input [7:0] dat_i,		// data input bus
	output reg [7:0] dat_o,	// data output bus
	output ack_o,		// transfer acknowledge
	output vol_o,		// volatile register selected
	output irq_o,		// interrupt request
	//----------------
	input cts_ni,		// clear to send - active low - (flow control)
	output reg rts_no,	// request to send - active low - (flow control)
	input dsr_ni,		// data set ready - active low
	input dcd_ni,		// data carrier detect - active low
	output reg dtr_no,	// data terminal ready - active low
	input rxd_i,			// serial data in
	output txd_o,			// serial data out
	output data_present_o,
	//----------------
	output baud16_clk
);
parameter pClkFreq = 20000000;	// clock frequency in MHz
parameter pBaud = 19200;
parameter pClkMul = (4096 * pBaud) / (pClkFreq / 65536);
parameter pRts = 1;		// default to active
parameter pDtr = 1;

wire cs = cyc_i && stb_i && (adr_i[31:4]==28'hFFDC_0A0);
assign ack_o = cs;
assign vol_o = cs && adr_i[3:2]==2'b00;

//-------------------------------------------
// variables
reg [23:0] c;	// current count
reg [23:0] ck_mul;	// baud rate clock multiplier
wire tx_empty;
wire baud16;	// edge detector (active one cycle only!)
reg rx_present_ie;
reg tx_empty_ie;
reg dcd_ie;
reg hwfc;			// hardware flow control enable
wire clear = cyc_i && stb_i && we_i && adr_i==4'd13;
wire frame_err;		// receiver char framing error
wire over_run;		// receiver over run
reg [1:0] ctsx;		// cts_ni sampling
reg [1:0] dcdx;
reg [1:0] dsrx;
wire dcd_chg = dcdx[1]^dcdx[0];


wire rxIRQ = data_present_o & rx_present_ie;
wire txIRQ = tx_empty & tx_empty_ie;
wire msIRQ = dcd_chg & dcd_ie;

assign irq_o = 
	  rxIRQ
	| txIRQ
	| msIRQ
	;
assign baud16_clk = baud16;

wire [2:0] irqenc =
	rxIRQ ? 1 :
	txIRQ ? 3 :
	msIRQ ? 4 :
	0;

wire [7:0] rx_do;
wire txrx = cs && adr_i[3:0]==4'd0;

rtfSimpleUartRx uart_rx0(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.cyc_i(cyc_i),
	.stb_i(stb_i),
	.cs_i(txrx),
	.we_i(we_i),
	.dat_o(rx_do),
	.baud16x_ce(baud16),
	.clear(clear),
	.rxd(rxd_i),
	.data_present(data_present_o),
	.frame_err(frame_err),
	.overrun(over_run)
);

rtfSimpleUartTx uart_tx0(
	.rst_i(rst_i),
	.clk_i(clk_i),
	.cyc_i(cyc_i),
	.stb_i(stb_i),
	.cs_i(txrx),
	.we_i(we_i),
	.dat_i(dat_i),
	.baud16x_ce(baud16),
	.cts(ctsx[1]|~hwfc),
	.txd(txd_o),
	.empty(tx_empty)
);

// mux the reg outputs
always @*
	if (cs) begin
		case(adr_i[3:0])	// synopsys full_case parallel_case
		`UART_MS:	dat_o <= {dcdx[1],1'b0,dsrx[1],ctsx[1],dcd_chg,3'b0};
		`UART_IS:	dat_o <= {irq_o, 2'b0, irqenc, 2'b0};
		`UART_LS:	dat_o <= {1'b0, tx_empty, tx_empty, 1'b0, frame_err, 1'b0, over_run, data_present_o};
		default:	dat_o <= rx_do;
		endcase
	end
	else
		dat_o <= 8'b0;

// Note: baud clock should pulse high for only a single
// cycle!
always @(posedge clk_i)
	if (rst_i)
		c <= 0;
	else
		c <= c + ck_mul;

// for detecting an edge on the msb
edge_det ed0(.rst(rst_i), .clk(clk_i), .ce(1'b1), .i(c[23]), .pe(baud16), .ne(), .ee() );

// register updates
always @(posedge clk_i) begin
	if (rst_i) begin
		rts_no <= ~pRts;
		rx_present_ie <= 1'b0;
		tx_empty_ie <= 1'b0;
		dcd_ie <= 1'b0;
		hwfc <= 1'b1;
		dtr_no <= ~pDtr;
		ck_mul <= pClkMul;
	end
	else if (cs & we_i) begin
		case (adr_i)
		`UART_IER:
				begin
				rx_present_ie <= dat_i[0];
				tx_empty_ie <= dat_i[1];
				dcd_ie <= dat_i[3];
				end
		`UART_MC:
				begin
				dtr_no <= ~dat_i[0];
				rts_no <= ~dat_i[1];
				end
		`UART_CTRL:		hwfc <= dat_i[0];
		`UART_CLKM1:	ck_mul[7:0] <= dat_i;
		`UART_CLKM2:	ck_mul[15:8] <= dat_i;
		`UART_CLKM3:	ck_mul[23:16] <= dat_i;
		default:
			;
		endcase
	end
end


// synchronize external signals
always @(posedge clk_i)
	ctsx <= {ctsx[0],~cts_ni};

always @(posedge clk_i)
	dcdx <= {dcdx[0],~dcd_ni};

always @(posedge clk_i)
	dsrx <= {dsrx[0],~dsr_ni};

endmodule

