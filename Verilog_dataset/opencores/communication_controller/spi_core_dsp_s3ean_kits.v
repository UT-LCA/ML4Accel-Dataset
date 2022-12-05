module adc(sdo,spi_clk,clk,rst,conv);
	parameter WIDTH=14; //multiple of two
	parameter PATTERN = {WIDTH/2{2'b10}};
	parameter COUNTMAX = 34;

	input rst, conv, spi_clk, clk;
	output sdo;
	
	reg [WIDTH-1:0] mem;
	reg sdo;
	
	reg flag;
	reg [6:0] count;
	
	integer N;
	
	initial
	begin
		mem = PATTERN;
	end
	
/*	always@ (posedge conv or posedge rst)
	begin
		if(rst)
			flag <= 0;
		else
			flag <= 1;
	end*/
	
	always@ (posedge clk or posedge rst)
	begin
		if(rst)
			flag <= 0;
		else if (conv)
			flag <= 1;
		else if (count == COUNTMAX)
		begin
			count <= 'b0;
			flag <= 0;
			mem = ~mem;	
		end
	end
	
	always @(negedge spi_clk or posedge rst)
	begin
		if (rst)
			count <= 0;
		else if(flag & !rst)
			if(count==COUNTMAX)
				count <= 'b0;
			else
				count <= count+1;
	end

	always@(count)
	begin
	case(count)
		0 : sdo <= 'bZ;
		1 : sdo <= 'bZ;
		2 : sdo <= 'bZ;
		3 : sdo <= mem[13];
		4 : sdo <= mem[12];
		5 : sdo <= mem[11];
		6 : sdo <= mem[10];
		7 : sdo <= mem[9];
		8 : sdo <= mem[8];
		9 : sdo <= mem[7];
		10 : sdo <= mem[6];
		11 : sdo <= mem[5];
		12 : sdo <= mem[4];
		13 : sdo <= mem[3];
		14 : sdo <= mem[2];
		15 : sdo <= mem[1];
		16 : sdo <= mem[0];
		17 : sdo <= 'bZ;
		18 : sdo <= 'bZ;
		19 : sdo <= mem[13];
		20 : sdo <= mem[12];
		21 : sdo <= mem[11];
		22 : sdo <= mem[10];
		23 : sdo <= mem[9];
		24 : sdo <= mem[8];
		25 : sdo <= mem[7];
		26 : sdo <= mem[6];
		27 : sdo <= mem[5];
		28 : sdo <= mem[4];
		29 : sdo <= mem[3];
		30 : sdo <= mem[2];
		31 : sdo <= mem[1];
		32 : sdo <= mem[0];
		33 : sdo <= 'bZ;
		34 : sdo <= 'bZ;
		default: sdo <= 'bZ;
	endcase
	end
	
endmodulemodule amp(spi_clk, reset, cs, din, dout, gain_state);

	parameter Tp = 1;
	
	input spi_clk, reset, cs, din;
	output dout;
	output [7:0] gain_state;
	
	reg [0:7] data;
	reg [7:0] gain_state;
 	
	reg temp, dout;
		
	always @(cs or reset)
	begin
		if(reset)
			gain_state <= 'bz;
		else
			gain_state <= #Tp data;
	end	
		
	always @(posedge spi_clk or posedge reset)
	begin
		if(reset)
		begin
			temp <= 1'b0;
			data <= 'b0;
		end
		else if(!cs)
		begin
			data <= #Tp  {din,data[0:6]};
			temp <= #Tp  data[7];
		end
	end

	always @(negedge spi_clk)
		dout <= #Tp data[7];

	
endmodulemodule dac(spi_clk, reset, cs, din, dout, command, dacN, dacDATA);
	
	parameter Tp = 1;

	input spi_clk, reset, cs, din;
	output [3:0]	command;
	output [3:0]	dacN;
	output [11:0] 	dacDATA;
	output dout;
		
	reg [0:31] data;
	reg dout;
	reg temp;
		
	assign command = data [0:3];
	assign dacN = data [4:7];
	assign dacDATA = data [8:19];	
		
	always @(posedge spi_clk or posedge reset)
	begin
		if(reset)
		begin
			temp <= 1'b0;
			data <= 'b0;
		end
		else if(!cs)
		begin
			data <= #Tp  {din,data[0:30]};
			temp <= #Tp  data[31];
		end
	end

	always @(negedge spi_clk)
		dout <= #Tp data[31];
	
endmodule//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_clgen.v                                                 ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
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

`include "spi_defines.v"
`include "timescale.v"

module spi_clgen (clk_in, rst, go, enable, last_clk, divider, clk_out, pos_edge, neg_edge); 

  parameter Tp = 1;
  
  input                            clk_in;   // input clock (system clock)
  input                            rst;      // reset
  input                            enable;   // clock enable
  input                            go;       // start transfer
  input                            last_clk; // last clock
  input     [`SPI_DIVIDER_LEN-1:0] divider;  // clock divider (output clock is divided by this value)
  output                           clk_out;  // output clock
  output                           pos_edge; // pulse marking positive edge of clk_out
  output                           neg_edge; // pulse marking negative edge of clk_out
                            
  reg                              clk_out;
  reg                              pos_edge;
  reg                              neg_edge;
                            
  reg       [`SPI_DIVIDER_LEN-1:0] cnt;      // clock counter 
  wire                             cnt_zero; // conter is equal to zero
  wire                             cnt_one;  // conter is equal to one
  
  
  assign cnt_zero = cnt == {`SPI_DIVIDER_LEN{1'b0}};
  assign cnt_one  = cnt == {{`SPI_DIVIDER_LEN-1{1'b0}}, 1'b1};
  
  // Counter counts half period
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      cnt <= #Tp {`SPI_DIVIDER_LEN{1'b1}};
    else
      begin
        if(!enable || cnt_zero)
          cnt <= #Tp divider;
        else
          cnt <= #Tp cnt - {{`SPI_DIVIDER_LEN-1{1'b0}}, 1'b1};
      end
  end
  
  // clk_out is asserted every other half period
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      clk_out <= #Tp 1'b0;
    else
      clk_out <= #Tp (enable && cnt_zero && (!last_clk || clk_out)) ? ~clk_out : clk_out;
  end
   
  // Pos and neg edge signals
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      begin
        pos_edge  <= #Tp 1'b0;
        neg_edge  <= #Tp 1'b0;
      end
    else
      begin
        pos_edge  <= #Tp (enable && !clk_out && cnt_one) || (!(|divider) && clk_out) || (!(|divider) && go && !enable);
        neg_edge  <= #Tp (enable && clk_out && cnt_one) || (!(|divider) && !clk_out && enable);
      end
  end
endmodule
 
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_define.v                                                ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
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

//
// Number of bits used for devider register. If used in system with
// low frequency of system clock this can be reduced.
// Use SPI_DIVIDER_LEN for fine tuning theexact number.
//
`define SPI_DIVIDER_LEN_8
//`define SPI_DIVIDER_LEN_16
//`define SPI_DIVIDER_LEN_24
//`define SPI_DIVIDER_LEN_32

`ifdef SPI_DIVIDER_LEN_8
  `define SPI_DIVIDER_LEN       5    // Can be set from 1 to 8
`endif                                                          
`ifdef SPI_DIVIDER_LEN_16                                       
  `define SPI_DIVIDER_LEN       16   // Can be set from 9 to 16
`endif                                                          
`ifdef SPI_DIVIDER_LEN_24                                       
  `define SPI_DIVIDER_LEN       24   // Can be set from 17 to 24
`endif                                                          
`ifdef SPI_DIVIDER_LEN_32                                       
  `define SPI_DIVIDER_LEN       32   // Can be set from 25 to 32 
`endif

//
// Maximum number of bits that can be send/received at once. 
// Use SPI_MAX_CHAR for fine tuning the exact number, when using
// SPI_MAX_CHAR_32, SPI_MAX_CHAR_24, SPI_MAX_CHAR_16, SPI_MAX_CHAR_8.
//
//`define SPI_MAX_CHAR_128
//`define SPI_MAX_CHAR_64
//`define SPI_MAX_CHAR_32
`define SPI_MAX_CHAR_24
//`define SPI_MAX_CHAR_16
//`define SPI_MAX_CHAR_8

`ifdef SPI_MAX_CHAR_128
  `define SPI_MAX_CHAR          128  // Can only be set to 128 
  `define SPI_CHAR_LEN_BITS     7
`endif
`ifdef SPI_MAX_CHAR_64
  `define SPI_MAX_CHAR          64   // Can only be set to 64 
  `define SPI_CHAR_LEN_BITS     6
`endif
`ifdef SPI_MAX_CHAR_32
  `define SPI_MAX_CHAR          32   // Can be set from 25 to 32 
  `define SPI_CHAR_LEN_BITS     5
`endif
`ifdef SPI_MAX_CHAR_24
  `define SPI_MAX_CHAR          24   // Can be set from 17 to 24 
  `define SPI_CHAR_LEN_BITS     5
`endif
`ifdef SPI_MAX_CHAR_16
  `define SPI_MAX_CHAR          16   // Can be set from 9 to 16 
  `define SPI_CHAR_LEN_BITS     4
`endif
`ifdef SPI_MAX_CHAR_8
  `define SPI_MAX_CHAR          8    // Can be set from 1 to 8 
  `define SPI_CHAR_LEN_BITS     3
`endif

//
// Definitions for the SPI ADC
//
`define SPI_ADC_CHAR					32
`define SPI_ADC_CHAR_LEN_BITS			5
//
// Number of device select signals. Use SPI_SS_NB for fine tuning the 
// exact number.
//
`define SPI_SS_NB_8
//`define SPI_SS_NB_16
//`define SPI_SS_NB_24
//`define SPI_SS_NB_32

`ifdef SPI_SS_NB_8
  `define SPI_SS_NB             8    // Can be set from 1 to 8
`endif
`ifdef SPI_SS_NB_16
  `define SPI_SS_NB             16   // Can be set from 9 to 16
`endif
`ifdef SPI_SS_NB_24
  `define SPI_SS_NB             24   // Can be set from 17 to 24
`endif
`ifdef SPI_SS_NB_32
  `define SPI_SS_NB             32   // Can be set from 25 to 32
`endif


//
// Register offset
//
`define SPI_RX_0                0
`define SPI_RX_1                1
`define SPI_RX_2                2
`define SPI_RX_3                3
`define SPI_TX_0                0
`define SPI_TX_1                1
`define SPI_TX_2                2
`define SPI_TX_3                3
`define SPI_CTRL                4
`define SPI_DEVIDE              5
`define SPI_SS                  6

//
// Number of bits in ctrl register
//
`define SPI_CTRL_BIT_NB         14

//
// Control register bit position
//
`define SPI_CTRL_TXC            13
`define SPI_CTRL_SAMPLE        	12
`define SPI_CTRL_LSB            11
`define SPI_CTRL_TX_NEGEDGE     10
`define SPI_CTRL_RX_NEGEDGE     9
`define SPI_CTRL_GO             8
`define SPI_CTRL_WRITE	        7
`define SPI_CTRL_CHAR_LEN       6:0

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_shift.v                                                 ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
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

`include "spi_defines.v"
`include "timescale.v"

module spi_shift_in (clk, rst, go,
                  pos_edge, neg_edge, rx_negedge, 
                  tip, last, p_out, s_clk, s_in);

 	parameter Tp = 1;

	input                          clk;          // system clock
	input                          rst;          // reset
//	input [`SPI_ADC_CHAR_LEN_BITS-1:0] len;          // data len in bits (minus one)
	input                          go;           // start stansfer
	input                          pos_edge;     // recognize posedge of sclk
	input                          neg_edge;     // recognize negedge of sclk
	input                          rx_negedge;   // s_in is sampled on negative edge 
	output                         tip;          // transfer in progress
	output                         last;         // last bit
	output     [`SPI_ADC_CHAR-1:0] p_out;        // parallel out
	input						s_clk;			// serial clk
	input                          s_in;         // serial in
                                            
	reg                            tip;
                           
	reg     [`SPI_ADC_CHAR_LEN_BITS:0] cnt;          // data bit count
	reg        [`SPI_ADC_CHAR-1:0] data;         // shift register
	wire    [`SPI_ADC_CHAR_LEN_BITS:0] rx_bit_pos;   // next bit position
	wire                           rx_clk;       // rx clock enable
	wire [`SPI_ADC_CHAR_LEN_BITS-1:0] len;          // data len in bits (minus one)

	assign len = 'h20; //Fix LEN since that won't be changing, unless you only want to sample one channel
	assign p_out = data;

	//LSB last
	assign rx_bit_pos =	(rx_negedge ? cnt : cnt - {{`SPI_ADC_CHAR_LEN_BITS{1'b0}},1'b1});

	assign last = !(|cnt);

	assign rx_clk = (rx_negedge ? neg_edge : pos_edge) && (!last || s_clk);

	// Character bit counter
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			cnt <= #Tp {`SPI_ADC_CHAR_LEN_BITS+1{1'b0}};
		else
		begin
			if(tip)
				cnt <= #Tp pos_edge ? (cnt - {{`SPI_ADC_CHAR_LEN_BITS{1'b0}}, 1'b1}) : cnt;
			else
				cnt <= #Tp !(|len) ? {1'b1, {`SPI_ADC_CHAR_LEN_BITS{1'b0}}} : {1'b0, len};
		end
	end
  
	// Transfer in progress
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			tip <= #Tp 1'b0;
		else if(go && ~tip)
			tip <= #Tp 1'b1;
		else if(tip && last && pos_edge)
			tip <= #Tp 1'b0;
	end

	// Receiving bits from the line
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			data   <= #Tp {`SPI_ADC_CHAR{1'b0}};
		else if (tip)
			data[rx_bit_pos[`SPI_ADC_CHAR_LEN_BITS-1:0]] <= #Tp rx_clk ? s_in : data[rx_bit_pos[`SPI_ADC_CHAR_LEN_BITS-1:0]];
	end

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_shift_out.v 											  ////
////				                                              ////
////  WAS: spi_shift.v                                            ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////      - William Gibb (williamgibb@gmail.com)                  ////
//// 			Modified to be TX only							  ////
////			Fixed Width of 24 Bits                            ////
////                                                              ////
////                                                              ////
////                                                              ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
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
`include "spi_defines.v"

module spi_shift_out (clk, rst, len, lsb, go, pos_edge, neg_edge, tx_negedge,
                  capture, tip, last, p_in, s_out);

	parameter Tp = 1;

	input                          clk;          // system clock
	input                          rst;          // reset
	input	  [`SPI_CHAR_LEN_BITS-1:0] len;         // data len in bits (minus one)
	input                          lsb;          // lbs first on the line
	input                          go;           // start stansfer
	input 							capture;		// 
	input                          pos_edge;     // recognize posedge of sclk
	input                          neg_edge;     // recognize negedge of sclk
	input                          tx_negedge;   // s_out is driven on negative edge
	output                         tip;          // transfer in progress
	output                         last;         // last bit
	input                   [23:0] p_in;         // parallel in
	output                         s_out;        // serial out
                                             
	reg                            s_out;        
	reg                            tip;
                           
	reg    		[`SPI_CHAR_LEN_BITS:0] cnt;          // data bit count
	reg     		[`SPI_MAX_CHAR-1:0] data;         	// shift register
	wire   		 [`SPI_CHAR_LEN_BITS:0] tx_bit_pos;   		// next bit position
	wire                           tx_clk;       	// tx clock enable
 
	assign tx_bit_pos = lsb ? {!(|len), len} - cnt : cnt - {{`SPI_CHAR_LEN_BITS{1'b0}},1'b1};

	assign last = !(|cnt);

	assign tx_clk = (tx_negedge ? neg_edge : pos_edge) && !last;

	// Character bit counter
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			cnt <= #Tp {`SPI_CHAR_LEN_BITS+1{1'b0}};
		else
		begin
        if(tip)
			cnt <= #Tp pos_edge ? (cnt - {{`SPI_CHAR_LEN_BITS{1'b0}}, 1'b1}) : cnt;
		else
			cnt <= #Tp !(|len) ? {1'b1, {`SPI_CHAR_LEN_BITS{1'b0}}} : {1'b0, len};
		end
	end
 
	// Transfer in progress
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			tip <= #Tp 1'b0;
		else if(go && ~tip)
			tip <= #Tp 1'b1;
		else if(tip && last && pos_edge)
			tip <= #Tp 1'b0;
	end
 
	 // Sending bits to the line
	 always @(posedge clk or posedge rst)
	 begin
		if (rst)
			s_out   <= #Tp 1'b0;
		else
			s_out <= #Tp (tx_clk || !tip) ? data[tx_bit_pos[`SPI_CHAR_LEN_BITS-1:0]] : s_out;
	 end
	
	 // Capture data from p_in to the 
	 always @(posedge clk or posedge rst)
	 begin
		 if (rst)
		      data   <= #Tp {24{1'b0}};
		 else if(!tip && capture)
				data <= #Tp p_in;
	 end

endmodule

`include "timescale.v"
`include "spi_defines.v"
//	spi_top tb
module spi_top_tb2();

	//
	// FOR SPI_TOP COMPLETED SUNDAY NOV 15th
	//
	
	//parameters
	parameter CLKPERIOD = 20;
	//
	// Control words
	//
	
	parameter CTRL_PREP		= 	14'h0E18; //TXC=0, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=0,| WR=0, LEN=24bits
	parameter CTRL_TXC		=	14'h2E18; //TXC=1, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=0,| WR=0, LEN=24bits 
	parameter CTRL_GOSAMPLE	=	14'h1F18; //TXC=0, SAMPLE = 1,| LSB=1, TXN=1, RXN=1, GO=1,| WR=0, LEN=24bits
	parameter CTRL_GOWRITE	=	14'h0F98; //TXC=0, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=1,| WR=1, LEN=24bits
	parameter CTRL_GOALL	=	14'h1F98; //TXC=0, SAMPLE = 1,| LSB=1, TXN=1, RXN=1, GO=1,| WR=1, LEN=24bits

	parameter DIV_VALUE		=	24'h000010; //dec 16
	
	parameter DAC_A			=	4'h0; // choose dac A
	parameter DAC_COMMAND	=	4'h3; // write to adn update dac n
	parameter FINISHTIME	=	186*1000; //17 ns per write...

	// dut inputs
	reg clk;
	reg rst;
	reg ampDAC;
	reg load_div;
	reg load_ctrl;
	reg [23:0] data_in;
	// interconnect wires
	wire spi_mosi;
	wire amp_miso;
	wire dac_miso;
	wire adc_miso;
	wire spi_clk;	
	wire [1:0] ss_o;
	wire conv;

	reg fin, fin1;
	reg [23:0] data_tbw; //data to be written
	reg [11:0] dac_data_in;
	
	//output wires
	wire [7:0] 	gain_state;
	wire [3:0] 	dac_command;
	wire [3:0] 	dac_n;
	wire [11:0] dac_data;
	wire 		go;
	wire [13:0] chanA;
	wire [13:0] chanB;
	wire 		adcValid;

	// events
	event write_command, reset, write_div, write_dac, write_amp, read_adc, rw_DSP;

	// dut outputs
	
	/*
	// dut
	/*spi_top spi_core (.clk(), .rst(), .ampDAC(), .data_in(), .chanA(), .chanB(), .adcValud(), .load_div(),
		 	.load_ctrl(), . go(), .conv, ss_pad_o(), 
			.sclk_pad_o(), .mosi_pad_o(), .miso_pad_i()); */
	spi_top spi_core (.clk(clk), 
					.rst(rst), 
					.ampDAC(ampDAC), 
					.data_in(data_in),
					.chanA(chanA),
					.chanB(chanB),
					.adcValid(adcValid),
					.load_div(load_div),
				 	.load_ctrl(load_ctrl),
				  	.go(go), 
					.conv(conv),
				 	.ss_pad_o(ss_o), 
					.sclk_pad_o(spi_clk),
					.mosi_pad_o(spi_mosi),
					.miso_pad_i(adc_miso));

	// spi models
	// dac(.spi_clk(), .reset(), .cs(), .din(), .dout(), .command(), .dacN(), .dacDATA());
	// amp(.spi_clk(), .reset(), .cs(), .din(), .dout(), .gain_state());
	// adc(.sdo(), .spi_clk(), .clk(), .rst(), .conv() );
	dac dac_test (.spi_clk(spi_clk), 
	.reset(rst), .cs(ss_o[0]), .din(spi_mosi), 
					.dout(dac_miso), 
					.command(dac_command), 
					.dacN(dac_n), 
					.dacDATA(dac_data));
	amp amp_test (.spi_clk(spi_clk), 
					.reset(rst), 
					.cs(ss_o[1]), 
					.din(spi_mosi), 
					.dout(amp_miso),
				 	.gain_state(gain_state));
	adc adc_test(.sdo(adc_miso), 
					.spi_clk(spi_clk),
				 	.clk(clk), 
					.rst(rst), 
					.conv(conv));
	// dut stimulus
	// 1 reset
	// 2 write the divider
	// 3 write the control
	// 4 write a word to the amp
	// 5 write a word to the dac
	// 6 read a word from the adc
	// 6 write a procedure for checking the words written

	//clk
	always
		#(CLKPERIOD/2) clk = ~clk;

	//initial conditions
	initial
	begin
		load_div	=0;
		load_ctrl	=0;
		clk			=1;
		ampDAC		=0;
		rst			=0;
		fin 		=0;
		fin1		=0;
		data_in		=24'b0;
		dac_data_in	='b0;
		#FINISHTIME ;
		$display ("Finishing simulation due to simulation constraint.");
		$display ("Time is - %d",$time);
		$finish;
	end
	
	// CTRL_PREP		TXC=0, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=0,| WR=0, LEN=24bits
	// CTRL_TXC			TXC=1, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=0,| WR=0, LEN=24bits 
	// CTRL_GOSAMPLE	TXC=0, SAMPLE = 1,| LSB=1, TXN=1, RXN=1, GO=1,| WR=0, LEN=24bits
	// CTRL_GOWRITE		TXC=0, SAMPLE = 0,| LSB=1, TXN=1, RXN=1, GO=1,| WR=1, LEN=24bits
	// CTRL_GOALL		TXC=0, SAMPLE = 1,| LSB=1, TXN=1, RXN=1, GO=1,| WR=1, LEN=24bits
	// events: write_command, reset, write_div, write_word;
	
	//event ordering
	initial
	begin
		$display("Starting simulation");
		#CLKPERIOD	-> reset;
		wait(fin)
		fin =0;
		
		$display("Reset finished");
		data_in=CTRL_PREP;
		#CLKPERIOD	-> write_command;
		wait(fin)
		fin =0;
		
		data_in=DIV_VALUE;
		#CLKPERIOD  -> write_div;
		wait(fin)
		fin =0;
		
		data_tbw =24'h110000; //write 0x11 to AMP
		#CLKPERIOD 	-> write_amp;
		wait(fin)
		fin =0;
		
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> write_dac;
		wait(fin)
		fin =0;
		#CLKPERIOD 	-> read_adc;
		wait(fin)
		fin =0;
		#CLKPERIOD 	-> read_adc;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> rw_DSP;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> rw_DSP;
		wait(fin)
		fin =0;
		dac_data_in=dac_data_in+1;
		data_tbw = {DAC_COMMAND, DAC_A,dac_data_in,4'b0};
		#CLKPERIOD 	-> rw_DSP;
		wait(fin)
		fin =0;
		
		#CLKPERIOD;
		#CLKPERIOD;
		$display ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		$display ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		#CLKPERIOD;
		$display("Finishing up at time %7d", $time);
		$display ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		$display ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

		$finish;
	end
	
	//event definitions
	always @(reset)
	begin
		$display ("entering reset at time %6d",$time);
		#10;
		rst=1;
		#100;
		rst=0;
		$display ("leaving event at time %6d",$time);
		fin =1;
	end
	
	always @(write_div)
	begin
		$display("writing value %3d to divider register",data_in);
		load_div=1;
		#CLKPERIOD;
		load_div=0;
		$display("leaving write_div at time %6d",$time);
		fin =1;
	end

	always @(write_command)
	begin
		$display("writing word %4h to control register",data_in);
		load_ctrl=1;
		#CLKPERIOD;
		load_ctrl=0;
		$display("leaving write_command at time %6d",$time);
		fin =1;
	end

	always @(write_amp)
	begin
		$display("writing word %4h to tx AMP at time %6d",data_tbw, $time);
		data_in = CTRL_TXC;
		$display("writing word %4h to control register",data_in);
		load_ctrl=1;
		#CLKPERIOD;
		load_ctrl=0;
		$display ("returned to write_word event at time %5d",$time);
		data_in = data_tbw;
		#CLKPERIOD;
		load_ctrl=1;
		ampDAC =0;
		data_in = CTRL_GOWRITE;
		#CLKPERIOD;
		load_ctrl=0;
		$display("waiting for go to go low...");
		wait(!go)
		$display("go went low at time %6d",$time);
		#CLKPERIOD;
		fin =1;
	end

	always @(write_dac)
	begin
		$display("writing word %4h to tx DAC at time %6d",data_tbw, $time);
		data_in = CTRL_TXC;
		$display("writing word %4h to control register",data_in);
		load_ctrl=1;
		#CLKPERIOD;
		load_ctrl=0;
		$display ("returned to write_word event at time %6d",$time);
		data_in = data_tbw;
		#CLKPERIOD;
		load_ctrl=1;
		ampDAC =1;
		data_in = CTRL_GOWRITE;
		#CLKPERIOD;
		load_ctrl=0;
		$display("waiting for go to go low...");
		wait(!go)
		$display("go went low at time %6d",$time);
		#CLKPERIOD;
		fin =1;
	end

	always @(read_adc)
	begin
		$display ("Reading from the ADC");
		#CLKPERIOD;
		load_ctrl=1;
		data_in = CTRL_GOSAMPLE;
		#CLKPERIOD;
		load_ctrl=0;
		#2;
		$display("waiting for go to go low...");
		wait(!go)
		$display("go went low at time %6d",$time);
		#CLKPERIOD;
		fin =1;
	end

	always @(rw_DSP)
	begin
		$display("writing word %4h to tx DAC and SAMPLING at time %6d",data_tbw, $time);
		data_in = CTRL_TXC;
		$display("writing word %4h to control register",data_in);
		load_ctrl=1;
		#CLKPERIOD;
		load_ctrl=0;
		$display ("returned to write_word event at time %6d",$time);
		data_in = data_tbw;
		#CLKPERIOD;
		load_ctrl=1;
		ampDAC =1;
		data_in = CTRL_GOALL;
		#CLKPERIOD;
		load_ctrl=0;
		$display("waiting for go to go low...");
		#2;
		wait(!go)
		$display("go went low at time %6d",$time);
		#CLKPERIOD;
		fin =1;	
	end
	//monitor
	//dump the activity
	initial
	begin
		$dumpfile ("waves.vcd");
		$dumpvars(0,spi_top_tb2);
	end

endmodule//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_top.v                                                   ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////      - William Gibb (williamgibb@gmail.com)                  ////
//// 			Modified to break RX and TX up					  ////
////			Fixed TX Width of 24 Bits                         ////
////            Fixed RX Width for LTC ADC on S3A/S3AN Starter Kit////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
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


`include "spi_defines.v"
`include "timescale.v"

module spi_top
(
	// Input
 clk, rst, ampDAC, data_in, load_div, load_ctrl, 
	// output 
	go, chanA, chanB, adcValid,
  // SPI signals
  ss_pad_o, sclk_pad_o, mosi_pad_o, miso_pad_i, conv 
);

	parameter Tp = 1; //assume register transactions will take some time...
	parameter MAXCOUNT = 24;
	parameter CONVCOUNT = 12;			
	

	input 			clk;		// master system clock
	input			rst;		// synchronous active high reset
	input			ampDAC;		// ampDAC chip select signal, used to select between
	 							// sending data to the preamp and DAC
	input	[23:0]	data_in;	// data input
	input			load_ctrl;	// load the ctrl register
	input			load_div;	// load the divider
	
	output 				go;			// go! signal
	output 		[13:0]	chanA;		// adc channelB
	output 		[13:0]	chanB;		// adc channelA
	output 				adcValid;	// data valid output signal
	
                                                     
  // SPI signals
	output	[1:0]	ss_pad_o;	// spi slave select
	output 			conv;		// ADC sampling signal
	output			sclk_pad_o;	// serial clock
	output			mosi_pad_o; // master out slave in
	input			miso_pad_i; // master in slave out			
                                                     
//  reg                     [27:0] dat_o;
//  reg                              wb_ack_o;

                                               
  // Internal signals
	reg       [`SPI_DIVIDER_LEN-1:0] 	divider;          // Divider register
	reg       [`SPI_CTRL_BIT_NB-1:0] 	ctrl;             // Control and status register
	reg             			[1:0]	ss;			// Slave select register
	reg 					[1:0] 		Q; 				//reg for delaying the go signal two cycles for the adc
	reg 					[5:0]		Qcount;
	reg									adcValid;			//rw data signal
	wire 	[`SPI_ADC_CHAR-1:0] 		adcData; //data_out
	wire                             	rx_negedge;       // miso is sampled on negative edge
	wire                             	tx_negedge;       // mosi is driven on negative edge
	wire    [`SPI_CHAR_LEN_BITS-1:0] 	char_len;         // char len
	wire                             	go;               // go
	wire                             	goRX;             // goRX
	wire                             	goTX;             // goTX
	wire                             	lsb;              // lsb first on line
	wire                             	tip;              // transfer in progress
	wire                             	tipRX;            // transfer in progress, exclusive RX
	wire                             	tipTX;            // transfer in progress, exclusive TX
	wire                             	pos_edge;         // recognize posedge of sclk
	wire                             	neg_edge;         // recognize negedge of sclk
	wire                             	last_bitTX;       // marks last character bit TX
	wire                             	last_bitRX;       // marks last character bit RX
	wire                             	last_bit;         // marks last character bit
	wire								amp;
	wire								dac;
	wire								tx_capture;
	reg									conv;
	wire								Write;
	wire								Sample;
	reg									stop;

	/* 
	TODO LIST
	
	ADD THE SPI RX PORTION
	DONE----INSTANTIATE SPI_SHIFT_IN
	DONE----SPLIT UP CONTROL SIGNALS THAT CONTROL THE TX FROM THE CONTROL SIGNALS
		WHICH WILL CONTROL THE RX	
	DONE----MAKE TIP BE FEED BY TWO SEPARATE TIP SIGNALS, TIPRX  TIPTX
		====THIS WILL LET SPI_CLGEN KEEP RUNNING IF TX FINISHES FIRST
	DONE----KEEP GO AS A SPI ENABLE SIGNAL, HAVE IT ENABLE THE APPROPRIATE MODULE
		BY USING THE WRITE/SAMPLE SIGNAL WITH AN AND GATE
	DONE----ADD A PULSE COUNTER, PARAMETERIZED TO GENERATE CONV PULSE
	DONE----ADD A DATA_VALID SIGNAL TO ENABLE THE READING OF THE DATA OUTPUT
	DONE----SPLIT THE OUTPUT OF THE RX INTO TWO CHANNELS	
	*/
	
	// Divider register
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			divider <= #Tp {`SPI_DIVIDER_LEN{1'b0}};
		else if (load_div && !tip)
			divider <= #Tp data_in[`SPI_DIVIDER_LEN-1:0];
	end
  
	// Ctrl register
	always @(posedge clk or posedge rst)
		begin
			if (rst)
			begin
				ctrl <= #Tp {`SPI_CTRL_BIT_NB{1'b0}};
				$display ("Reseting CTRL Register");
			end
			else if(load_ctrl && !tip)
			begin
				ctrl[`SPI_CTRL_BIT_NB-1:0] 	<= #Tp data_in[`SPI_CTRL_BIT_NB-1:0];
				$display ("Capturing data to CTRL Register");
				end
			else
			begin
				if(tip && last_bitTX && pos_edge)
					begin
					ctrl[`SPI_CTRL_WRITE] 		<= #Tp 1'b0;
					$display ("clearing WRITE on CTRL Register");
					end		
				if(tip && last_bitRX && pos_edge)
					begin
					ctrl[`SPI_CTRL_SAMPLE] 		<= #Tp 1'b0;
					$display ("clearing SAMPLE on CTRL Register");
					end		
				if(tip && last_bit && pos_edge)
				begin
					ctrl[`SPI_CTRL_GO] 			<= #Tp 1'b0;
					$display ("clearing GO on CTRL Register");
				end	
				if(tx_capture) 
				begin
					ctrl[`SPI_CTRL_TXC] 		<= #Tp 1'b0; 
					$display ("clearing TXC on CTRL Register");
				end
			end
		end

	assign rx_negedge 	= ctrl[`SPI_CTRL_RX_NEGEDGE];
	assign tx_negedge 	= ctrl[`SPI_CTRL_TX_NEGEDGE];
	assign go         	= ctrl[`SPI_CTRL_GO];
	assign char_len   	= ctrl[`SPI_CTRL_CHAR_LEN];
	assign lsb        	= ctrl[`SPI_CTRL_LSB];
  	assign Sample		= ctrl[`SPI_CTRL_SAMPLE];
	assign tx_capture	= ctrl[`SPI_CTRL_TXC];
	assign Write		= ctrl[`SPI_CTRL_WRITE];
	
	assign goTX			= go && Write;
	assign tip			= tipRX || tipTX;
	assign last_bit		= Sample ? last_bitRX : last_bitTX; 
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			Qcount <= #Tp 'b0;
		else if (!stop &&Sample && go)
			Qcount <= #Tp Qcount + 1;
		else if (tip && last_bitRX && pos_edge)
			Qcount <= #Tp 'b0;
	end
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			stop <= #Tp 0;
		else if (Qcount == MAXCOUNT)
			stop <= #Tp 1;		
		else if (tip && last_bitRX && pos_edge)
			stop <= #Tp 0;
	end

	always@(posedge clk or posedge rst)
	begin
		if(rst)
			conv <= #Tp 0;		
		else if (Qcount == CONVCOUNT)
			conv <= #Tp 1;
		else if (Qcount == MAXCOUNT)
			conv <= #Tp 0;
	end


	// RX go signal generation
	assign goRX = Q[1] && Sample;
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			Q<= #Tp 'b0;
		else if(pos_edge && Sample)
			Q<= #Tp {Q[0], go};
		else if(!Sample)
		begin
			Q<= #Tp 'b0;
		end	
	end

	assign amp= !(!ampDAC && go);
	assign dac=	!(ampDAC && go);
	//assign cs signals
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			ss <= #Tp 2'b11;
		else if(goTX && !tip && Write)
			ss <= #Tp {amp, dac}; //cs order -> amp, dac
		else if(last_bitTX )
			ss <= #Tp 2'b11;
		else
			ss <= #Tp ss;
	end

	// data out signal generation
	assign chanA = adcData[30:17];
	assign chanB = adcData[14:1];
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			adcValid<= #Tp 0;
		else if(!tip)
			adcValid<= #Tp 0;
		else if(last_bitRX && pos_edge)
			adcValid<= #Tp 1;
	end

/*	always@(posedge clk or posedge rst)
	begin
		if(rst)
			adcValid<= #Tp 0;
		else if(tip && last_bitRX && pos_edge)
			adcValid<= #Tp 0;
		else if(last_bitRX && Sample)
			adcValid<= #Tp 1;
	end*/

	assign ss_pad_o = ss;
	spi_clgen clgen (.clk_in(clk), .rst(rst), .go(go), .enable(go&&(Sample||Write)), .last_clk(last_bit),
                   .divider(divider), .clk_out(sclk_pad_o), .pos_edge(pos_edge), 
                   .neg_edge(neg_edge));

	spi_shift_out tx_shift (.clk(clk), .rst(rst), .len(char_len[`SPI_CHAR_LEN_BITS-1:0]),
                   .lsb(lsb), .go(goTX), .capture(tx_capture), .pos_edge(pos_edge), .neg_edge(neg_edge), 
                   .tx_negedge(tx_negedge), .tip(tipTX), .last(last_bitTX), .p_in(data_in),
				   .s_out(mosi_pad_o));
				
	spi_shift_in rx_shifter (.clk(clk), .rst(rst), .go(goRX),
                  .pos_edge(pos_edge), .neg_edge(neg_edge), .rx_negedge(rx_negedge),
                 .tip(tipRX), .last(last_bitRX), .p_out(adcData), .s_clk(sclk_pad_o), .s_in(miso_pad_i));			
				
endmodule
/*
module spi_shift_out (clk, rst, byte_sel, len, lsb, go,
                  pos_edge, neg_edge, tx_negedge,
                  tip, last, 
                  p_in, s_clk, s_out);

module spi_shift_in (.clk(), .rst(), .lsb(), .go,
                  pos_edge(), .neg_edge(), .rx_negedge(), .tx_negedge,
                  tip(), .last(), .p_out(), .s_clk(), .s_in());
*/
`timescale 1ns / 10ps

