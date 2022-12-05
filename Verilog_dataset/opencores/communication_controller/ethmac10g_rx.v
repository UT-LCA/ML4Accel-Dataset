`include "timescale.v"
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: counter                                         ////
////                                                              ////
//// DESCRIPTION: 8bit counter                                    ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.2  2006/06/06 05:02:11  Zheng Cao
// no message
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////
module counter(clk, reset, load, en, value);
    input clk;
    input reset;
    input load;
    input en;

    parameter WIDTH = 8;
    output[WIDTH-1:0] value;

    reg [WIDTH-1:0] value;
   
    always @(posedge clk or posedge reset)
       if (reset)	 
          value <= 0;
       else begin
       if (load) 
             value <= 0;
          else if (en)
             value <= value + 1;
      end

endmodule
`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////
// File:  CRC32_D64.v                             
// Date:  Sun Nov 27 19:32:12 2005                                                      
//                                                                     
// Copyright (C) 1999-2003 Easics NV.                 
// This source file may be used and distributed without restriction    
// provided that this copyright statement is not removed from the file 
// and that any derivative work contains the original copyright notice
// and the associated disclaimer.
//
// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
// OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//
// Purpose: Verilog module containing a synthesizable CRC function
//   * polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
//   * data width: 64
//                                                                     
// Info: tools@easics.be
//       http://www.easics.com                                  
///////////////////////////////////////////////////////////////////////


module CRC32_D64(DATA_IN, CLK, RESET, START, init, CRC_OUT);

  input [63:0] DATA_IN;
  input CLK;	
  input RESET;
  input START;
  input init;
  output [31:0] CRC_OUT;

  reg [31:0] CRC_OUT;

always @(posedge CLK)
  begin
    if (RESET) begin
//	     CRC_OUT = 0;
	     CRC_OUT = 32'hffffffff;
    end
    else if (init) begin
	     CRC_OUT = 32'hffffffff;
//	     CRC_OUT = 0;
	 end
    else if (START) begin 
		  CRC_OUT = nextCRC32_D64(DATA_IN, CRC_OUT);
    end 
    	
  end
  
 


  // polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
  // data width: 64
  // convention: the first serial data bit is D[63]
   function [31:0] nextCRC32_D64;

    input [63:0] Data;
    input [31:0] CRC;

    reg [63:0] D;
    reg [31:0] C;
    reg [31:0] NewCRC;

  begin

    D = Data;
    C = CRC;

    NewCRC[0] = D[63] ^ D[61] ^ D[60] ^ D[58] ^ D[55] ^ D[54] ^ D[53] ^ 
                D[50] ^ D[48] ^ D[47] ^ D[45] ^ D[44] ^ D[37] ^ D[34] ^ 
                D[32] ^ D[31] ^ D[30] ^ D[29] ^ D[28] ^ D[26] ^ D[25] ^ 
                D[24] ^ D[16] ^ D[12] ^ D[10] ^ D[9] ^ D[6] ^ D[0] ^ 
                C[0] ^ C[2] ^ C[5] ^ C[12] ^ C[13] ^ C[15] ^ C[16] ^ 
                C[18] ^ C[21] ^ C[22] ^ C[23] ^ C[26] ^ C[28] ^ C[29] ^ 
                C[31];
    NewCRC[1] = D[63] ^ D[62] ^ D[60] ^ D[59] ^ D[58] ^ D[56] ^ D[53] ^ 
                D[51] ^ D[50] ^ D[49] ^ D[47] ^ D[46] ^ D[44] ^ D[38] ^ 
                D[37] ^ D[35] ^ D[34] ^ D[33] ^ D[28] ^ D[27] ^ D[24] ^ 
                D[17] ^ D[16] ^ D[13] ^ D[12] ^ D[11] ^ D[9] ^ D[7] ^ 
                D[6] ^ D[1] ^ D[0] ^ C[1] ^ C[2] ^ C[3] ^ C[5] ^ C[6] ^ 
                C[12] ^ C[14] ^ C[15] ^ C[17] ^ C[18] ^ C[19] ^ C[21] ^ 
                C[24] ^ C[26] ^ C[27] ^ C[28] ^ C[30] ^ C[31];
    NewCRC[2] = D[59] ^ D[58] ^ D[57] ^ D[55] ^ D[53] ^ D[52] ^ D[51] ^ 
                D[44] ^ D[39] ^ D[38] ^ D[37] ^ D[36] ^ D[35] ^ D[32] ^ 
                D[31] ^ D[30] ^ D[26] ^ D[24] ^ D[18] ^ D[17] ^ D[16] ^ 
                D[14] ^ D[13] ^ D[9] ^ D[8] ^ D[7] ^ D[6] ^ D[2] ^ 
                D[1] ^ D[0] ^ C[0] ^ C[3] ^ C[4] ^ C[5] ^ C[6] ^ C[7] ^ 
                C[12] ^ C[19] ^ C[20] ^ C[21] ^ C[23] ^ C[25] ^ C[26] ^ 
                C[27];
    NewCRC[3] = D[60] ^ D[59] ^ D[58] ^ D[56] ^ D[54] ^ D[53] ^ D[52] ^ 
                D[45] ^ D[40] ^ D[39] ^ D[38] ^ D[37] ^ D[36] ^ D[33] ^ 
                D[32] ^ D[31] ^ D[27] ^ D[25] ^ D[19] ^ D[18] ^ D[17] ^ 
                D[15] ^ D[14] ^ D[10] ^ D[9] ^ D[8] ^ D[7] ^ D[3] ^ 
                D[2] ^ D[1] ^ C[0] ^ C[1] ^ C[4] ^ C[5] ^ C[6] ^ C[7] ^ 
                C[8] ^ C[13] ^ C[20] ^ C[21] ^ C[22] ^ C[24] ^ C[26] ^ 
                C[27] ^ C[28];
    NewCRC[4] = D[63] ^ D[59] ^ D[58] ^ D[57] ^ D[50] ^ D[48] ^ D[47] ^ 
                D[46] ^ D[45] ^ D[44] ^ D[41] ^ D[40] ^ D[39] ^ D[38] ^ 
                D[33] ^ D[31] ^ D[30] ^ D[29] ^ D[25] ^ D[24] ^ D[20] ^ 
                D[19] ^ D[18] ^ D[15] ^ D[12] ^ D[11] ^ D[8] ^ D[6] ^ 
                D[4] ^ D[3] ^ D[2] ^ D[0] ^ C[1] ^ C[6] ^ C[7] ^ C[8] ^ 
                C[9] ^ C[12] ^ C[13] ^ C[14] ^ C[15] ^ C[16] ^ C[18] ^ 
                C[25] ^ C[26] ^ C[27] ^ C[31];
    NewCRC[5] = D[63] ^ D[61] ^ D[59] ^ D[55] ^ D[54] ^ D[53] ^ D[51] ^ 
                D[50] ^ D[49] ^ D[46] ^ D[44] ^ D[42] ^ D[41] ^ D[40] ^ 
                D[39] ^ D[37] ^ D[29] ^ D[28] ^ D[24] ^ D[21] ^ D[20] ^ 
                D[19] ^ D[13] ^ D[10] ^ D[7] ^ D[6] ^ D[5] ^ D[4] ^ 
                D[3] ^ D[1] ^ D[0] ^ C[5] ^ C[7] ^ C[8] ^ C[9] ^ C[10] ^ 
                C[12] ^ C[14] ^ C[17] ^ C[18] ^ C[19] ^ C[21] ^ C[22] ^ 
                C[23] ^ C[27] ^ C[29] ^ C[31];
    NewCRC[6] = D[62] ^ D[60] ^ D[56] ^ D[55] ^ D[54] ^ D[52] ^ D[51] ^ 
                D[50] ^ D[47] ^ D[45] ^ D[43] ^ D[42] ^ D[41] ^ D[40] ^ 
                D[38] ^ D[30] ^ D[29] ^ D[25] ^ D[22] ^ D[21] ^ D[20] ^ 
                D[14] ^ D[11] ^ D[8] ^ D[7] ^ D[6] ^ D[5] ^ D[4] ^ 
                D[2] ^ D[1] ^ C[6] ^ C[8] ^ C[9] ^ C[10] ^ C[11] ^ 
                C[13] ^ C[15] ^ C[18] ^ C[19] ^ C[20] ^ C[22] ^ C[23] ^ 
                C[24] ^ C[28] ^ C[30];
    NewCRC[7] = D[60] ^ D[58] ^ D[57] ^ D[56] ^ D[54] ^ D[52] ^ D[51] ^ 
                D[50] ^ D[47] ^ D[46] ^ D[45] ^ D[43] ^ D[42] ^ D[41] ^ 
                D[39] ^ D[37] ^ D[34] ^ D[32] ^ D[29] ^ D[28] ^ D[25] ^ 
                D[24] ^ D[23] ^ D[22] ^ D[21] ^ D[16] ^ D[15] ^ D[10] ^ 
                D[8] ^ D[7] ^ D[5] ^ D[3] ^ D[2] ^ D[0] ^ C[0] ^ C[2] ^ 
                C[5] ^ C[7] ^ C[9] ^ C[10] ^ C[11] ^ C[13] ^ C[14] ^ 
                C[15] ^ C[18] ^ C[19] ^ C[20] ^ C[22] ^ C[24] ^ C[25] ^ 
                C[26] ^ C[28];
    NewCRC[8] = D[63] ^ D[60] ^ D[59] ^ D[57] ^ D[54] ^ D[52] ^ D[51] ^ 
                D[50] ^ D[46] ^ D[45] ^ D[43] ^ D[42] ^ D[40] ^ D[38] ^ 
                D[37] ^ D[35] ^ D[34] ^ D[33] ^ D[32] ^ D[31] ^ D[28] ^ 
                D[23] ^ D[22] ^ D[17] ^ D[12] ^ D[11] ^ D[10] ^ D[8] ^ 
                D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[0] ^ C[1] ^ C[2] ^ C[3] ^ 
                C[5] ^ C[6] ^ C[8] ^ C[10] ^ C[11] ^ C[13] ^ C[14] ^ 
                C[18] ^ C[19] ^ C[20] ^ C[22] ^ C[25] ^ C[27] ^ C[28] ^ 
                C[31];
    NewCRC[9] = D[61] ^ D[60] ^ D[58] ^ D[55] ^ D[53] ^ D[52] ^ D[51] ^ 
                D[47] ^ D[46] ^ D[44] ^ D[43] ^ D[41] ^ D[39] ^ D[38] ^ 
                D[36] ^ D[35] ^ D[34] ^ D[33] ^ D[32] ^ D[29] ^ D[24] ^ 
                D[23] ^ D[18] ^ D[13] ^ D[12] ^ D[11] ^ D[9] ^ D[5] ^ 
                D[4] ^ D[2] ^ D[1] ^ C[0] ^ C[1] ^ C[2] ^ C[3] ^ C[4] ^ 
                C[6] ^ C[7] ^ C[9] ^ C[11] ^ C[12] ^ C[14] ^ C[15] ^ 
                C[19] ^ C[20] ^ C[21] ^ C[23] ^ C[26] ^ C[28] ^ C[29];
    NewCRC[10] = D[63] ^ D[62] ^ D[60] ^ D[59] ^ D[58] ^ D[56] ^ D[55] ^ 
                 D[52] ^ D[50] ^ D[42] ^ D[40] ^ D[39] ^ D[36] ^ D[35] ^ 
                 D[33] ^ D[32] ^ D[31] ^ D[29] ^ D[28] ^ D[26] ^ D[19] ^ 
                 D[16] ^ D[14] ^ D[13] ^ D[9] ^ D[5] ^ D[3] ^ D[2] ^ 
                 D[0] ^ C[0] ^ C[1] ^ C[3] ^ C[4] ^ C[7] ^ C[8] ^ C[10] ^ 
                 C[18] ^ C[20] ^ C[23] ^ C[24] ^ C[26] ^ C[27] ^ C[28] ^ 
                 C[30] ^ C[31];
    NewCRC[11] = D[59] ^ D[58] ^ D[57] ^ D[56] ^ D[55] ^ D[54] ^ D[51] ^ 
                 D[50] ^ D[48] ^ D[47] ^ D[45] ^ D[44] ^ D[43] ^ D[41] ^ 
                 D[40] ^ D[36] ^ D[33] ^ D[31] ^ D[28] ^ D[27] ^ D[26] ^ 
                 D[25] ^ D[24] ^ D[20] ^ D[17] ^ D[16] ^ D[15] ^ D[14] ^ 
                 D[12] ^ D[9] ^ D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[1] ^ C[4] ^ 
                 C[8] ^ C[9] ^ C[11] ^ C[12] ^ C[13] ^ C[15] ^ C[16] ^ 
                 C[18] ^ C[19] ^ C[22] ^ C[23] ^ C[24] ^ C[25] ^ C[26] ^ 
                 C[27];
    NewCRC[12] = D[63] ^ D[61] ^ D[59] ^ D[57] ^ D[56] ^ D[54] ^ D[53] ^ 
                 D[52] ^ D[51] ^ D[50] ^ D[49] ^ D[47] ^ D[46] ^ D[42] ^ 
                 D[41] ^ D[31] ^ D[30] ^ D[27] ^ D[24] ^ D[21] ^ D[18] ^ 
                 D[17] ^ D[15] ^ D[13] ^ D[12] ^ D[9] ^ D[6] ^ D[5] ^ 
                 D[4] ^ D[2] ^ D[1] ^ D[0] ^ C[9] ^ C[10] ^ C[14] ^ 
                 C[15] ^ C[17] ^ C[18] ^ C[19] ^ C[20] ^ C[21] ^ C[22] ^ 
                 C[24] ^ C[25] ^ C[27] ^ C[29] ^ C[31];
    NewCRC[13] = D[62] ^ D[60] ^ D[58] ^ D[57] ^ D[55] ^ D[54] ^ D[53] ^ 
                 D[52] ^ D[51] ^ D[50] ^ D[48] ^ D[47] ^ D[43] ^ D[42] ^ 
                 D[32] ^ D[31] ^ D[28] ^ D[25] ^ D[22] ^ D[19] ^ D[18] ^ 
                 D[16] ^ D[14] ^ D[13] ^ D[10] ^ D[7] ^ D[6] ^ D[5] ^ 
                 D[3] ^ D[2] ^ D[1] ^ C[0] ^ C[10] ^ C[11] ^ C[15] ^ 
                 C[16] ^ C[18] ^ C[19] ^ C[20] ^ C[21] ^ C[22] ^ C[23] ^ 
                 C[25] ^ C[26] ^ C[28] ^ C[30];
    NewCRC[14] = D[63] ^ D[61] ^ D[59] ^ D[58] ^ D[56] ^ D[55] ^ D[54] ^ 
                 D[53] ^ D[52] ^ D[51] ^ D[49] ^ D[48] ^ D[44] ^ D[43] ^ 
                 D[33] ^ D[32] ^ D[29] ^ D[26] ^ D[23] ^ D[20] ^ D[19] ^ 
                 D[17] ^ D[15] ^ D[14] ^ D[11] ^ D[8] ^ D[7] ^ D[6] ^ 
                 D[4] ^ D[3] ^ D[2] ^ C[0] ^ C[1] ^ C[11] ^ C[12] ^ 
                 C[16] ^ C[17] ^ C[19] ^ C[20] ^ C[21] ^ C[22] ^ C[23] ^ 
                 C[24] ^ C[26] ^ C[27] ^ C[29] ^ C[31];
    NewCRC[15] = D[62] ^ D[60] ^ D[59] ^ D[57] ^ D[56] ^ D[55] ^ D[54] ^ 
                 D[53] ^ D[52] ^ D[50] ^ D[49] ^ D[45] ^ D[44] ^ D[34] ^ 
                 D[33] ^ D[30] ^ D[27] ^ D[24] ^ D[21] ^ D[20] ^ D[18] ^ 
                 D[16] ^ D[15] ^ D[12] ^ D[9] ^ D[8] ^ D[7] ^ D[5] ^ 
                 D[4] ^ D[3] ^ C[1] ^ C[2] ^ C[12] ^ C[13] ^ C[17] ^ 
                 C[18] ^ C[20] ^ C[21] ^ C[22] ^ C[23] ^ C[24] ^ C[25] ^ 
                 C[27] ^ C[28] ^ C[30];
    NewCRC[16] = D[57] ^ D[56] ^ D[51] ^ D[48] ^ D[47] ^ D[46] ^ D[44] ^ 
                 D[37] ^ D[35] ^ D[32] ^ D[30] ^ D[29] ^ D[26] ^ D[24] ^ 
                 D[22] ^ D[21] ^ D[19] ^ D[17] ^ D[13] ^ D[12] ^ D[8] ^ 
                 D[5] ^ D[4] ^ D[0] ^ C[0] ^ C[3] ^ C[5] ^ C[12] ^ C[14] ^ 
                 C[15] ^ C[16] ^ C[19] ^ C[24] ^ C[25];
    NewCRC[17] = D[58] ^ D[57] ^ D[52] ^ D[49] ^ D[48] ^ D[47] ^ D[45] ^ 
                 D[38] ^ D[36] ^ D[33] ^ D[31] ^ D[30] ^ D[27] ^ D[25] ^ 
                 D[23] ^ D[22] ^ D[20] ^ D[18] ^ D[14] ^ D[13] ^ D[9] ^ 
                 D[6] ^ D[5] ^ D[1] ^ C[1] ^ C[4] ^ C[6] ^ C[13] ^ C[15] ^ 
                 C[16] ^ C[17] ^ C[20] ^ C[25] ^ C[26];
    NewCRC[18] = D[59] ^ D[58] ^ D[53] ^ D[50] ^ D[49] ^ D[48] ^ D[46] ^ 
                 D[39] ^ D[37] ^ D[34] ^ D[32] ^ D[31] ^ D[28] ^ D[26] ^ 
                 D[24] ^ D[23] ^ D[21] ^ D[19] ^ D[15] ^ D[14] ^ D[10] ^ 
                 D[7] ^ D[6] ^ D[2] ^ C[0] ^ C[2] ^ C[5] ^ C[7] ^ C[14] ^ 
                 C[16] ^ C[17] ^ C[18] ^ C[21] ^ C[26] ^ C[27];
    NewCRC[19] = D[60] ^ D[59] ^ D[54] ^ D[51] ^ D[50] ^ D[49] ^ D[47] ^ 
                 D[40] ^ D[38] ^ D[35] ^ D[33] ^ D[32] ^ D[29] ^ D[27] ^ 
                 D[25] ^ D[24] ^ D[22] ^ D[20] ^ D[16] ^ D[15] ^ D[11] ^ 
                 D[8] ^ D[7] ^ D[3] ^ C[0] ^ C[1] ^ C[3] ^ C[6] ^ C[8] ^ 
                 C[15] ^ C[17] ^ C[18] ^ C[19] ^ C[22] ^ C[27] ^ C[28];
    NewCRC[20] = D[61] ^ D[60] ^ D[55] ^ D[52] ^ D[51] ^ D[50] ^ D[48] ^ 
                 D[41] ^ D[39] ^ D[36] ^ D[34] ^ D[33] ^ D[30] ^ D[28] ^ 
                 D[26] ^ D[25] ^ D[23] ^ D[21] ^ D[17] ^ D[16] ^ D[12] ^ 
                 D[9] ^ D[8] ^ D[4] ^ C[1] ^ C[2] ^ C[4] ^ C[7] ^ C[9] ^ 
                 C[16] ^ C[18] ^ C[19] ^ C[20] ^ C[23] ^ C[28] ^ C[29];
    NewCRC[21] = D[62] ^ D[61] ^ D[56] ^ D[53] ^ D[52] ^ D[51] ^ D[49] ^ 
                 D[42] ^ D[40] ^ D[37] ^ D[35] ^ D[34] ^ D[31] ^ D[29] ^ 
                 D[27] ^ D[26] ^ D[24] ^ D[22] ^ D[18] ^ D[17] ^ D[13] ^ 
                 D[10] ^ D[9] ^ D[5] ^ C[2] ^ C[3] ^ C[5] ^ C[8] ^ C[10] ^ 
                 C[17] ^ C[19] ^ C[20] ^ C[21] ^ C[24] ^ C[29] ^ C[30];
    NewCRC[22] = D[62] ^ D[61] ^ D[60] ^ D[58] ^ D[57] ^ D[55] ^ D[52] ^ 
                 D[48] ^ D[47] ^ D[45] ^ D[44] ^ D[43] ^ D[41] ^ D[38] ^ 
                 D[37] ^ D[36] ^ D[35] ^ D[34] ^ D[31] ^ D[29] ^ D[27] ^ 
                 D[26] ^ D[24] ^ D[23] ^ D[19] ^ D[18] ^ D[16] ^ D[14] ^ 
                 D[12] ^ D[11] ^ D[9] ^ D[0] ^ C[2] ^ C[3] ^ C[4] ^ 
                 C[5] ^ C[6] ^ C[9] ^ C[11] ^ C[12] ^ C[13] ^ C[15] ^ 
                 C[16] ^ C[20] ^ C[23] ^ C[25] ^ C[26] ^ C[28] ^ C[29] ^ 
                 C[30];
    NewCRC[23] = D[62] ^ D[60] ^ D[59] ^ D[56] ^ D[55] ^ D[54] ^ D[50] ^ 
                 D[49] ^ D[47] ^ D[46] ^ D[42] ^ D[39] ^ D[38] ^ D[36] ^ 
                 D[35] ^ D[34] ^ D[31] ^ D[29] ^ D[27] ^ D[26] ^ D[20] ^ 
                 D[19] ^ D[17] ^ D[16] ^ D[15] ^ D[13] ^ D[9] ^ D[6] ^ 
                 D[1] ^ D[0] ^ C[2] ^ C[3] ^ C[4] ^ C[6] ^ C[7] ^ C[10] ^ 
                 C[14] ^ C[15] ^ C[17] ^ C[18] ^ C[22] ^ C[23] ^ C[24] ^ 
                 C[27] ^ C[28] ^ C[30];
    NewCRC[24] = D[63] ^ D[61] ^ D[60] ^ D[57] ^ D[56] ^ D[55] ^ D[51] ^ 
                 D[50] ^ D[48] ^ D[47] ^ D[43] ^ D[40] ^ D[39] ^ D[37] ^ 
                 D[36] ^ D[35] ^ D[32] ^ D[30] ^ D[28] ^ D[27] ^ D[21] ^ 
                 D[20] ^ D[18] ^ D[17] ^ D[16] ^ D[14] ^ D[10] ^ D[7] ^ 
                 D[2] ^ D[1] ^ C[0] ^ C[3] ^ C[4] ^ C[5] ^ C[7] ^ C[8] ^ 
                 C[11] ^ C[15] ^ C[16] ^ C[18] ^ C[19] ^ C[23] ^ C[24] ^ 
                 C[25] ^ C[28] ^ C[29] ^ C[31];
    NewCRC[25] = D[62] ^ D[61] ^ D[58] ^ D[57] ^ D[56] ^ D[52] ^ D[51] ^ 
                 D[49] ^ D[48] ^ D[44] ^ D[41] ^ D[40] ^ D[38] ^ D[37] ^ 
                 D[36] ^ D[33] ^ D[31] ^ D[29] ^ D[28] ^ D[22] ^ D[21] ^ 
                 D[19] ^ D[18] ^ D[17] ^ D[15] ^ D[11] ^ D[8] ^ D[3] ^ 
                 D[2] ^ C[1] ^ C[4] ^ C[5] ^ C[6] ^ C[8] ^ C[9] ^ C[12] ^ 
                 C[16] ^ C[17] ^ C[19] ^ C[20] ^ C[24] ^ C[25] ^ C[26] ^ 
                 C[29] ^ C[30];
    NewCRC[26] = D[62] ^ D[61] ^ D[60] ^ D[59] ^ D[57] ^ D[55] ^ D[54] ^ 
                 D[52] ^ D[49] ^ D[48] ^ D[47] ^ D[44] ^ D[42] ^ D[41] ^ 
                 D[39] ^ D[38] ^ D[31] ^ D[28] ^ D[26] ^ D[25] ^ D[24] ^ 
                 D[23] ^ D[22] ^ D[20] ^ D[19] ^ D[18] ^ D[10] ^ D[6] ^ 
                 D[4] ^ D[3] ^ D[0] ^ C[6] ^ C[7] ^ C[9] ^ C[10] ^ C[12] ^ 
                 C[15] ^ C[16] ^ C[17] ^ C[20] ^ C[22] ^ C[23] ^ C[25] ^ 
                 C[27] ^ C[28] ^ C[29] ^ C[30];
    NewCRC[27] = D[63] ^ D[62] ^ D[61] ^ D[60] ^ D[58] ^ D[56] ^ D[55] ^ 
                 D[53] ^ D[50] ^ D[49] ^ D[48] ^ D[45] ^ D[43] ^ D[42] ^ 
                 D[40] ^ D[39] ^ D[32] ^ D[29] ^ D[27] ^ D[26] ^ D[25] ^ 
                 D[24] ^ D[23] ^ D[21] ^ D[20] ^ D[19] ^ D[11] ^ D[7] ^ 
                 D[5] ^ D[4] ^ D[1] ^ C[0] ^ C[7] ^ C[8] ^ C[10] ^ C[11] ^ 
                 C[13] ^ C[16] ^ C[17] ^ C[18] ^ C[21] ^ C[23] ^ C[24] ^ 
                 C[26] ^ C[28] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[28] = D[63] ^ D[62] ^ D[61] ^ D[59] ^ D[57] ^ D[56] ^ D[54] ^ 
                 D[51] ^ D[50] ^ D[49] ^ D[46] ^ D[44] ^ D[43] ^ D[41] ^ 
                 D[40] ^ D[33] ^ D[30] ^ D[28] ^ D[27] ^ D[26] ^ D[25] ^ 
                 D[24] ^ D[22] ^ D[21] ^ D[20] ^ D[12] ^ D[8] ^ D[6] ^ 
                 D[5] ^ D[2] ^ C[1] ^ C[8] ^ C[9] ^ C[11] ^ C[12] ^ 
                 C[14] ^ C[17] ^ C[18] ^ C[19] ^ C[22] ^ C[24] ^ C[25] ^ 
                 C[27] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[29] = D[63] ^ D[62] ^ D[60] ^ D[58] ^ D[57] ^ D[55] ^ D[52] ^ 
                 D[51] ^ D[50] ^ D[47] ^ D[45] ^ D[44] ^ D[42] ^ D[41] ^ 
                 D[34] ^ D[31] ^ D[29] ^ D[28] ^ D[27] ^ D[26] ^ D[25] ^ 
                 D[23] ^ D[22] ^ D[21] ^ D[13] ^ D[9] ^ D[7] ^ D[6] ^ 
                 D[3] ^ C[2] ^ C[9] ^ C[10] ^ C[12] ^ C[13] ^ C[15] ^ 
                 C[18] ^ C[19] ^ C[20] ^ C[23] ^ C[25] ^ C[26] ^ C[28] ^ 
                 C[30] ^ C[31];
    NewCRC[30] = D[63] ^ D[61] ^ D[59] ^ D[58] ^ D[56] ^ D[53] ^ D[52] ^ 
                 D[51] ^ D[48] ^ D[46] ^ D[45] ^ D[43] ^ D[42] ^ D[35] ^ 
                 D[32] ^ D[30] ^ D[29] ^ D[28] ^ D[27] ^ D[26] ^ D[24] ^ 
                 D[23] ^ D[22] ^ D[14] ^ D[10] ^ D[8] ^ D[7] ^ D[4] ^ 
                 C[0] ^ C[3] ^ C[10] ^ C[11] ^ C[13] ^ C[14] ^ C[16] ^ 
                 C[19] ^ C[20] ^ C[21] ^ C[24] ^ C[26] ^ C[27] ^ C[29] ^ 
                 C[31];
    NewCRC[31] = D[62] ^ D[60] ^ D[59] ^ D[57] ^ D[54] ^ D[53] ^ D[52] ^ 
                 D[49] ^ D[47] ^ D[46] ^ D[44] ^ D[43] ^ D[36] ^ D[33] ^ 
                 D[31] ^ D[30] ^ D[29] ^ D[28] ^ D[27] ^ D[25] ^ D[24] ^ 
                 D[23] ^ D[15] ^ D[11] ^ D[9] ^ D[8] ^ D[5] ^ C[1] ^ 
                 C[4] ^ C[11] ^ C[12] ^ C[14] ^ C[15] ^ C[17] ^ C[20] ^ 
                 C[21] ^ C[22] ^ C[25] ^ C[27] ^ C[28] ^ C[30];

    nextCRC32_D64 = NewCRC;

  end

  endfunction
endmodule
`timescale 1ns / 1ps
module CRC32_D8(DATA_IN, CLK, RESET, START, LOAD, CRC_IN, CRC_OUT);

  input [7:0] DATA_IN;
  input CLK;	
  input RESET;
  input START;
  input LOAD; 
  input [31:0] CRC_IN;
  output [31:0] CRC_OUT;

  reg [31:0] CRC_OUT;
//  reg start_int;
//  reg [7:0] data_int;
  
//always @(posedge CLK)
//begin
//  start_int <= START;
//  data_int <= DATA_IN;
//end

always @(posedge CLK or posedge RESET)
  begin
    if (RESET) begin
        CRC_OUT <= 0;
    end
    else if (START) begin
        CRC_OUT <= nextCRC32_D8(DATA_IN, CRC_OUT);
    end 
    else if (LOAD) begin
        CRC_OUT <= CRC_IN;
    end   
    

    	
  end


///////////////////////////////////////////////////////////////////////
// File:  CRC32_D64.v                             
// Date:  Sun Nov 27 19:32:12 2005                                                      
//                                                                     
// Copyright (C) 1999-2003 Easics NV.                 
// This source file may be used and distributed without restriction    
// provided that this copyright statement is not removed from the file 
// and that any derivative work contains the original copyright notice
// and the associated disclaimer.
//
// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
// OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//
// Purpose: Verilog module containing a synthesizable CRC function
//   * polynomial: (0 1 2 4 5 7 8 10 11 12 16 22 23 26 32)
//   * data width: 64
//                                                                     
// Info: tools@easics.be
//       http://www.easics.com                                  
///////////////////////////////////////////////////////////////////////

  // polynomial: (0 1 2 3 4 5 7 8 10 11 12 16 22 23 26 32)
  // data width: 8
  // convention: the first serial data bit is D[7]
  function [31:0] nextCRC32_D8;

    input [7:0] Data;
    input [31:0] CRC;

    reg [7:0] D;
    reg [31:0] C;
    reg [31:0] NewCRC;

  begin

    D = Data;
    C = CRC;

   
    NewCRC[0] = D[6] ^ D[0] ^ C[24] ^ C[30];
    NewCRC[1] = D[7] ^ D[6] ^ D[1] ^ D[0] ^ C[24] ^ C[25] ^ C[30] ^ 
                C[31];
    NewCRC[2] = D[7] ^ D[6] ^ D[2] ^ D[1] ^ D[0] ^ C[24] ^ C[25] ^ 
                C[26] ^ C[30] ^ C[31];
    NewCRC[3] = D[7] ^ D[3] ^ D[2] ^ D[1] ^ C[25] ^ C[26] ^ C[27] ^ 
                C[31];
    NewCRC[4] = D[6] ^ D[4] ^ D[3] ^ D[2] ^ D[0] ^ C[24] ^ C[26] ^ 
                C[27] ^ C[28] ^ C[30];
    NewCRC[5] = D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[24] ^ 
                C[25] ^ C[27] ^ C[28] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[6] = D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[2] ^ D[1] ^ C[25] ^ C[26] ^ 
                C[28] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[7] = D[7] ^ D[5] ^ D[3] ^ D[2] ^ D[0] ^ C[24] ^ C[26] ^ 
                C[27] ^ C[29] ^ C[31];
    NewCRC[8] = D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[0] ^ C[24] ^ C[25] ^ 
                C[27] ^ C[28];
    NewCRC[9] = D[5] ^ D[4] ^ D[2] ^ D[1] ^ C[1] ^ C[25] ^ C[26] ^ 
                C[28] ^ C[29];
    NewCRC[10] = D[5] ^ D[3] ^ D[2] ^ D[0] ^ C[2] ^ C[24] ^ C[26] ^ 
                 C[27] ^ C[29];
    NewCRC[11] = D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[3] ^ C[24] ^ C[25] ^ 
                 C[27] ^ C[28];
    NewCRC[12] = D[6] ^ D[5] ^ D[4] ^ D[2] ^ D[1] ^ D[0] ^ C[4] ^ C[24] ^ 
                 C[25] ^ C[26] ^ C[28] ^ C[29] ^ C[30];
    NewCRC[13] = D[7] ^ D[6] ^ D[5] ^ D[3] ^ D[2] ^ D[1] ^ C[5] ^ C[25] ^ 
                 C[26] ^ C[27] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[14] = D[7] ^ D[6] ^ D[4] ^ D[3] ^ D[2] ^ C[6] ^ C[26] ^ C[27] ^ 
                 C[28] ^ C[30] ^ C[31];
    NewCRC[15] = D[7] ^ D[5] ^ D[4] ^ D[3] ^ C[7] ^ C[27] ^ C[28] ^ 
                 C[29] ^ C[31];
    NewCRC[16] = D[5] ^ D[4] ^ D[0] ^ C[8] ^ C[24] ^ C[28] ^ C[29];
    NewCRC[17] = D[6] ^ D[5] ^ D[1] ^ C[9] ^ C[25] ^ C[29] ^ C[30];
    NewCRC[18] = D[7] ^ D[6] ^ D[2] ^ C[10] ^ C[26] ^ C[30] ^ C[31];
    NewCRC[19] = D[7] ^ D[3] ^ C[11] ^ C[27] ^ C[31];
    NewCRC[20] = D[4] ^ C[12] ^ C[28];
    NewCRC[21] = D[5] ^ C[13] ^ C[29];
    NewCRC[22] = D[0] ^ C[14] ^ C[24];
    NewCRC[23] = D[6] ^ D[1] ^ D[0] ^ C[15] ^ C[24] ^ C[25] ^ C[30];
    NewCRC[24] = D[7] ^ D[2] ^ D[1] ^ C[16] ^ C[25] ^ C[26] ^ C[31];
    NewCRC[25] = D[3] ^ D[2] ^ C[17] ^ C[26] ^ C[27];
    NewCRC[26] = D[6] ^ D[4] ^ D[3] ^ D[0] ^ C[18] ^ C[24] ^ C[27] ^ 
                 C[28] ^ C[30];
    NewCRC[27] = D[7] ^ D[5] ^ D[4] ^ D[1] ^ C[19] ^ C[25] ^ C[28] ^ 
                 C[29] ^ C[31];
    NewCRC[28] = D[6] ^ D[5] ^ D[2] ^ C[20] ^ C[26] ^ C[29] ^ C[30];
    NewCRC[29] = D[7] ^ D[6] ^ D[3] ^ C[21] ^ C[27] ^ C[30] ^ C[31];
    NewCRC[30] = D[7] ^ D[4] ^ C[22] ^ C[28] ^ C[31];
    NewCRC[31] = D[5] ^ C[23] ^ C[29];

    nextCRC32_D8 = NewCRC;

  end

  endfunction

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rx clk generator                                ////
////                                                              ////
//// DESCRIPTION: Clk generator for Receive engine of 10 Gigabit  ////
////     Ethernet MAC.                                            ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.2  2006/06/16 06:36:28  fisher5090
// no message
//
// Revision 1.1.1.1  2006/05/31 05:59:41  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxClkgen(rxclk_in, reset, rxclk, rxclk_180, locked);
    input rxclk_in;
    input reset;
    output rxclk;
    output rxclk_180;
    output locked;
    // 2x clock should be provided with dcm
    wire rxclk;
    wire rxclk_180;
  //  wire rxclk_2x;
    /*dcm0 rx_dcm(.CLKIN_IN(rxclk_in), 
                .RST_IN(reset), 
                .CLKIN_IBUFG_OUT(), 
                .CLK0_OUT(rxclk), 
                .CLK180_OUT(rxclk_180),	
                .LOCKED_OUT(locked)
               );*/
    assign rxclk = rxclk_in;
    assign rxclk_180 = ~rxclk;
    assign locked = ~reset;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxCRC                                           ////
////                                                              ////
//// DESCRIPTION: CRC Checker, by using magic word c704dd7b.      ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:41  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxCRC(rxclk, reset, receiving, receiving_d1, CRC_DATA, get_terminator,
 get_terminator_d1, wait_crc_check,crc_check_invalid, crc_check_valid, terminator_location,get_error_code);
    input rxclk;
    input reset;
    input get_terminator;
    input [63:0] CRC_DATA;
    input receiving;
    input receiving_d1;
    input [2:0] terminator_location;
    input wait_crc_check;

    output crc_check_invalid;
    output crc_check_valid;
    output get_terminator_d1;
    input get_error_code;

    parameter TP = 1;

   ///////////////////////////////////////////////////
   // Input registers
   ///////////////////////////////////////////////////

   reg get_terminator_d1, get_terminator_d2,get_terminator_d3;
   always@(posedge rxclk or posedge reset) begin
        if(reset)begin
          get_terminator_d1 <=#TP 0;
          get_terminator_d2 <=#TP 0;
          get_terminator_d3 <=#TP 0;
        end   
        else begin
          get_terminator_d1 <=#TP get_terminator;
          get_terminator_d2 <=#TP get_terminator_d1;
          get_terminator_d3 <=#TP get_terminator_d2;
        end   
   end

   reg[2:0] bytes_cnt;
   reg crc_8_en;//enable 8bit CRC
   always@(posedge rxclk or posedge reset) begin
        if (reset)
           bytes_cnt <=#TP 0;
        else if (get_terminator)
           bytes_cnt <=#TP terminator_location;
        else if (crc_8_en)
           bytes_cnt <=#TP bytes_cnt-1;
   end

   reg[63:0] terminator_data;
   always@(posedge rxclk or posedge reset) begin  
        if(reset)
           terminator_data <=#TP 0;
        else if (get_terminator_d2)
           terminator_data <=#TP CRC_DATA;
        else
           terminator_data <=#TP terminator_data<<8;
   end

   /////////////////////////////////////////////////////////////////////////////////////////////
   // 64bits CRC 
   // start: crc_valid = 8'hff and receiving_frame = 1
   // end  : crc_valid != 8'hff or receiving_frame = 0
   // if bits_more is 0, then CRC check will happen when end happens.
   // else 8bits CRC should begin
   /////////////////////////////////////////////////////////////////////////////////////////////

   wire [31:0] crc_from_64;

   reg crc_64_en; // 64bit CRC Enable
   always@(posedge rxclk or posedge reset) begin
        if(reset)
          crc_64_en <= #TP 1'b0;
        else if(get_error_code) //if error, stop crc checking
          crc_64_en <= #TP 1'b0;
        else if(receiving_d1 & receiving) 
          crc_64_en <= #TP 1'b1;
        else
          crc_64_en <= #TP 1'b0;
   end

   CRC32_D64 crc64(.DATA_IN(CRC_DATA), .CLK(rxclk), .RESET(reset), .START(crc_64_en), .CRC_OUT(crc_from_64), .init(get_terminator_d3|get_error_code));
     
   /////////////////////////////////////////////////////////////////////////////////////////////
   // 8bits CRC
   /////////////////////////////////////////////////////////////////////////////////////////////
   
   reg[7:0] CRC_DATA_TMP;
   always@(posedge rxclk or posedge reset) begin
        if(reset)
          CRC_DATA_TMP <=#TP 0;
        else 
          CRC_DATA_TMP <=#TP terminator_data[63:56];
        end
    
   always@(posedge rxclk or posedge reset) begin
        if(reset)
          crc_8_en <=#TP 0;
        else if (get_terminator_d3)
          crc_8_en <=#TP 1'b1;
        else if(bytes_cnt==1)
           crc_8_en <=#TP 1'b0;
   end  
 
   reg do_crc_check;
   always@(posedge rxclk or posedge reset) begin
        if (reset)
          do_crc_check <=#TP 0;
        else if(terminator_location == 0)
          do_crc_check <=#TP get_terminator_d2;
        else 
          do_crc_check <=#TP wait_crc_check & (bytes_cnt==1);
   end
 
   wire[31:0] crc_from_8;
   CRC32_D8  crc8(.DATA_IN(CRC_DATA_TMP), .CLK(rxclk), .RESET(reset), .START(crc_8_en), .LOAD(~crc_8_en), .CRC_IN(crc_from_64), .CRC_OUT(crc_from_8)); 

   ////////////////////////////////////////////////////////////////////////////////////////////
   // CRC check
   ////////////////////////////////////////////////////////////////////////////////////////////
   wire crc_check_valid, crc_check_invalid;

   assign crc_check_valid  = wait_crc_check & do_crc_check & (crc_from_8==32'hc704dd7b);
   assign crc_check_invalid = wait_crc_check & do_crc_check  & (crc_from_8!=32'hc704dd7b);

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: Destination Address Check                       ////
////                                                              ////
//// DESCRIPTION: Destination Address Checker of  10 Gigabit      ////
////              Ethernet MAC.                                   ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:41  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxDAchecker(rxclk,reset,local_invalid, broad_valid, multi_valid, MAC_Addr, da_addr);
   input  rxclk;
   input  reset;

   output local_invalid;
   output broad_valid;
   output multi_valid;

   input [47:0] MAC_Addr;
   input [47:0] da_addr;
 
   parameter TP = 1;
    
   reg multi_valid;
   reg broad_valid;
   reg local_valid;
   always @(posedge rxclk or posedge reset) begin
         if (reset) begin
           multi_valid <=#TP 0;
           broad_valid <=#TP 0;
           local_valid <=#TP 0;
         end
         else begin
           multi_valid <=#TP (da_addr==`MULTICAST);
           broad_valid <=#TP (da_addr==`BROADCAST);
           local_valid <=#TP (da_addr==MAC_Addr);
         end
  end

  assign local_invalid = 1'b0;//~local_valid & ~multi_valid & ~broad_valid;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: Data Path of Receive Module                     ////
////                                                              ////
//// DESCRIPTION: Data path of Receive Engine of 10 Gigabit       ////
////     Ethernet MAC. Used to recognize every field of a         ////
////     frame, including SOF, EOF, Length, Destination Addr      ////
////     , Source Addr and Data field.                            ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
//// http://www.opencores.org/projects/ethmac10g/                 ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.6  2006/06/16 06:36:28  fisher5090
// no message
//
// Revision 1.5  2006/06/12 18:58:36  Zheng Cao
// no message
//
// Revision 1.4  2006/06/12 18:53:02  Zheng Cao
// remove pad function added, using xilinx vp20 -6 as target FPGA, passes post place and route simulation
// 
// Revision 1.3  2006/06/12 04:11:19  Zheng Cao
// both inband fcs and no inband fcs are OK, no remove PAD function
// 
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxDataPath(rxclk, reset, rxd64, rxc8, inband_fcs, receiving, start_da, start_lt, wait_crc_check, get_sfd, 
                  get_terminator, get_error_code, tagged_frame, pause_frame, da_addr, terminator_location, CRC_DATA, 
                  rx_data_valid, rx_data,get_terminator_d1, bad_frame_get, good_frame_get,check_reset,rx_good_frame,rx_bad_frame);
//                fcTxPauseData);
    input rxclk;
    input reset;
    input [63:0] rxd64;
    input [7:0] rxc8;
    input inband_fcs;
    input receiving;
    input start_da;
    input start_lt;
    input wait_crc_check;	 
    input get_terminator_d1;
    input bad_frame_get;
    input good_frame_get;
 
    output get_sfd;
    output get_terminator; //get T indicator
    output get_error_code; //get Error indicator
    output tagged_frame;
    output pause_frame;
    output[47:0] da_addr;
    output[2:0] terminator_location;
    output[63:0] CRC_DATA;
    output[7:0] rx_data_valid;
    output[63:0] rx_data;
    output check_reset;
    output rx_good_frame;
    output rx_bad_frame;
//  output [31:0]fcTxPauseData;
 
    parameter TP = 1;
    parameter IDLE = 0, READ = 2, WAIT_TMP = 3, WAIT = 1;
 
    //////////////////////////////////////////////
    // Pipe Line Stage
    //////////////////////////////////////////////
    reg [63:0] rxd64_d1,rxd64_d2,rxd64_d3,CRC_DATA;
    reg [7:0] rxc8_d1, rxc8_d2, rxc8_d3;
    reg receiving_d1, receiving_d2;
    reg wait_crc_check_d1;
 
 // assign fcTxPauseData = rxd64_d1[31:0];
 // Data pipeline
    always@(posedge rxclk or posedge reset) begin
         if (reset) begin
            rxd64_d1<=#TP 0;
            rxd64_d2<=#TP 0;
            rxd64_d3<=#TP 0;
            CRC_DATA<=0;
         end
         else begin
            rxd64_d1<=#TP rxd64;
            rxd64_d2<=#TP rxd64_d1;
            rxd64_d3<=#TP rxd64_d2;
            CRC_DATA <={rxd64_d2[0],rxd64_d2[1],rxd64_d2[2],rxd64_d2[3],rxd64_d2[4],rxd64_d2[5],rxd64_d2[6],rxd64_d2[7],
                        rxd64_d2[8],rxd64_d2[9],rxd64_d2[10],rxd64_d2[11],rxd64_d2[12],rxd64_d2[13],rxd64_d2[14],rxd64_d2[15],
                        rxd64_d2[16],rxd64_d2[17],rxd64_d2[18],rxd64_d2[19],rxd64_d2[20],rxd64_d2[21],rxd64_d2[22],rxd64_d2[23],
                        rxd64_d2[24],rxd64_d2[25],rxd64_d2[26],rxd64_d2[27],rxd64_d2[28],rxd64_d2[29],rxd64_d2[30],rxd64_d2[31],
                        rxd64_d2[32],rxd64_d2[33],rxd64_d2[34],rxd64_d2[35],rxd64_d2[36],rxd64_d2[37],rxd64_d2[38],rxd64_d2[39],
                        rxd64_d2[40],rxd64_d2[41],rxd64_d2[42],rxd64_d2[43],rxd64_d2[44],rxd64_d2[45],rxd64_d2[46],rxd64_d2[47],
                        rxd64_d2[48],rxd64_d2[49],rxd64_d2[50],rxd64_d2[51],rxd64_d2[52],rxd64_d2[53],rxd64_d2[54],rxd64_d2[55],
                        rxd64_d2[56],rxd64_d2[57],rxd64_d2[58],rxd64_d2[59],rxd64_d2[60],rxd64_d2[61],rxd64_d2[62],rxd64_d2[63]};
         end
    end
    //control pipeline
    always@(posedge rxclk or posedge reset)begin
         if (reset)	begin		
            rxc8_d1<=#TP 0;
            rxc8_d2<=#TP 0;
            rxc8_d3<=#TP 0;      
         end
         else begin
            rxc8_d1<=#TP rxc8;
            rxc8_d2<=#TP rxc8_d1;
            rxc8_d3<=#TP rxc8_d2;
         end
    end

    always @(posedge rxclk or posedge reset)begin
         if (reset) begin
            receiving_d1 <=#TP 0;
            receiving_d2 <=#TP 0;
            wait_crc_check_d1 <=#TP 0;
         end
         else	begin
            receiving_d1 <=#TP receiving;
            receiving_d2 <=#TP receiving_d1;
            wait_crc_check_d1 <=#TP wait_crc_check;
         end
    end
 
    ////////////////////////////////////////////
    // Frame analysis
    ////////////////////////////////////////////
    reg get_sfd; //get sfd indicator
    reg get_terminator; //get T indicator
    reg get_error_code; //get Error indicator
    reg[7:0] get_e_chk;
    reg[7:0] rxc_end_data; //seperate DATA with FCS
    reg [2:0]terminator_location; //for n*8bits(n<8), get n
    reg[47:0] da_addr; //get Desetination Address
    reg tagged_frame;  //Tagged frame indicator(type interpret)
    reg pause_frame;   //Pause frame indicator(type interpret)
 
    //1. SFD 
    always@(posedge rxclk or posedge reset) begin
         if (reset) 
           get_sfd <=#TP 0; 
         else
           get_sfd <=#TP (rxd64[7:0] ==`START) & (rxd64[63:56]== `SFD) & (rxc8 == 8'h01);
    end

    //2. EFD
    reg this_cycle; 
    // -----------------------------------------------
    //|  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  | 
    // -----------------------------------------------
    //|<-------- EFD -------->|<-------- EFD -------->|
    //|<-- this_cycle = '1' ->|<-- this_cycle = '0' ->|
 
    always@(posedge rxclk or posedge reset) begin
         if (reset) begin
            get_terminator <=#TP 0;
            terminator_location <=#TP 0; 
            this_cycle <=#TP 1'b0;
            rxc_end_data <=#TP 0;
         end
         else begin
            if (rxc8[0] & (rxd64[7:0]  ==`TERMINATE)) begin
               get_terminator <=#TP 1'b1;
               terminator_location <=#TP 0; 
               this_cycle <=#TP 1'b1;
               rxc_end_data <=#TP 8'b00001111;
            end   
            else if (rxc8[1] & (rxd64[15:8] ==`TERMINATE)) begin
               get_terminator <=#TP 1'b1;
               terminator_location <=#TP 1;
               this_cycle <=#TP 1'b1;
               rxc_end_data <=#TP 8'b00011111;
            end
            else if (rxc8[2] & (rxd64[23:16]==`TERMINATE)) begin
               get_terminator <=#TP 1'b1;	
               terminator_location <=#TP 2;
               this_cycle <=#TP 1'b1; 
               rxc_end_data <=#TP 8'b00111111;
            end
            else if (rxc8[3] & (rxd64[31:24]==`TERMINATE)) begin
               get_terminator <=#TP 1'b1;
               terminator_location <=#TP 3;
               this_cycle <=#TP 1'b1;
               rxc_end_data <=#TP 8'b01111111;
            end
            else if (rxc8[4] & (rxd64[39:32]==`TERMINATE)) begin
               get_terminator <=#TP 1'b1; 
               terminator_location <=#TP 4;	
               this_cycle <=#TP 1'b1;
               rxc_end_data <=#TP 8'b11111111;
            end
            else if (rxc8[5] & (rxd64[47:40]==`TERMINATE)) begin
               get_terminator <=#TP 1'b1; 
               terminator_location <=#TP 5;
               this_cycle <=#TP 1'b0;
               rxc_end_data <=#TP 8'b00000001;
            end
            else if (rxc8[6] & (rxd64[55:48]==`TERMINATE)) begin
               get_terminator <=#TP 1'b1;
               terminator_location <=#TP 6; 
               this_cycle <=#TP 1'b0;
               rxc_end_data <=#TP 8'b00000011;
            end
            else if (rxc8[7] & (rxd64[63:56]==`TERMINATE))begin
               get_terminator <=#TP 1'b1;
               terminator_location <=#TP 7;
               this_cycle <=#TP 1'b0;
               rxc_end_data <=#TP 8'b00000111;
            end
            else begin
               get_terminator <=#TP 1'b0;
               terminator_location <=#TP terminator_location; 
               this_cycle <=#TP this_cycle;
               rxc_end_data <=#TP rxc_end_data;
            end
        end
    end
 
    //3. Error Character
    always@(posedge rxclk or posedge reset) begin
          if (reset)
             get_e_chk <=#TP 0;
          else begin
             get_e_chk[0] <=#TP rxc8[0] & (rxd64[7:0]  ==`ERROR); 
             get_e_chk[1] <=#TP rxc8[1] & (rxd64[15:8] ==`ERROR);
             get_e_chk[2] <=#TP rxc8[2] & (rxd64[23:16]==`ERROR);
             get_e_chk[3] <=#TP rxc8[3] & (rxd64[31:24]==`ERROR);
             get_e_chk[4] <=#TP rxc8[4] & (rxd64[39:32]==`ERROR);
             get_e_chk[5] <=#TP rxc8[5] & (rxd64[47:40]==`ERROR);
             get_e_chk[6] <=#TP rxc8[6] & (rxd64[55:48]==`ERROR);
             get_e_chk[7] <=#TP rxc8[7] & (rxd64[63:56]==`ERROR);
          end
    end
 
    always@(posedge rxclk or posedge reset) begin
          if (reset) 
            get_error_code <=#TP 0;
          else
            get_error_code <=#TP receiving & (| get_e_chk);
    end
    
    //////////////////////////////////////
    // Get Destination Address
    //////////////////////////////////////
 
    always@(posedge rxclk or posedge reset)begin
         if (reset) 
           da_addr <=#TP 0;
         else if (start_da) 
           da_addr <=#TP rxd64_d1[47:0];
         else
           da_addr <=#TP da_addr;
    end

    //////////////////////////////////////
    // Get Length/Type Field
    //////////////////////////////////////

    reg[15:0] lt_data; 
    always@(posedge rxclk or posedge reset)begin
         if (reset) 
           lt_data <=#TP 0;
         else if (start_lt) 
           lt_data <=#TP {rxd64_d1[39:32], rxd64_d1[47:40]};
         else
           lt_data <=#TP lt_data;
    end
 
    reg[5:0] pad_integer;
    reg[5:0] pad_remain;
    always@(posedge rxclk or posedge reset) begin
         if (reset) begin
           pad_integer <=#TP 0;
           pad_remain <=#TP 0;
         end
         else begin
           pad_integer <=#TP (lt_data[5:0] - 2)>>3;
           pad_remain <=#TP lt_data[5:0] - 2;
         end
    end
    //Remove PAD counter
    reg[2:0] pad_cnt;
    always@(posedge rxclk or posedge reset) begin
         if (reset)
           pad_cnt <=#TP 0;
         else if(lt_data[5:0] == 1)
           pad_cnt <=#TP 1;
         else 
           pad_cnt <=#TP pad_integer[2:0] + 2;
    end

    reg [7:0] pad_last_rxc;   
    always@(posedge rxclk or posedge reset) begin
         if (reset)
           pad_last_rxc <=#TP 0;
         else if(lt_data[5:0] == 1)
           pad_last_rxc <=#TP 8'h7f;
         else begin
             case (pad_remain[2:0])
                0: pad_last_rxc <=#TP 8'h00;
                1: pad_last_rxc <=#TP 8'h01;
                2: pad_last_rxc <=#TP 8'h03;
                3: pad_last_rxc <=#TP 8'h07;
                4: pad_last_rxc <=#TP 8'h0f;
                5: pad_last_rxc <=#TP 8'h1f;
                6: pad_last_rxc <=#TP 8'h3f;
                7: pad_last_rxc <=#TP 8'h7f;
             endcase
       end
    end 
    
    reg pad_frame;
    always@(posedge rxclk or posedge reset) begin
          if (reset)
            pad_frame <=#TP 0;
          else if(~(lt_data[0]|lt_data[1]|lt_data[2]|lt_data[3]|lt_data[4]|lt_data[5]))
            pad_frame <=#TP 1'b0;
          else if(lt_data<46)
            pad_frame <=#TP 1'b1;
          else
            pad_frame <=#TP 1'b0;
    end 
 
    //tagged frame indicator
    always@(posedge rxclk or posedge reset) begin
          if (reset)
            tagged_frame <=#TP 1'b0;
          else if (start_lt)
            tagged_frame <=#TP (rxd64[63:32] == `TAG_SIGN); 
          else
            tagged_frame <=#TP tagged_frame;
    end
    //pause frame indicator
    always@(posedge rxclk or posedge reset) begin
          if (reset)
            pause_frame <=#TP 1'b0;
          else if (start_lt)
            pause_frame <=#TP (rxd64[47:32] == `PAUSE_SIGN); 
          else 
            pause_frame <=#TP 1'b0;
    end

    /////////////////////////////////////////////
    // Generate proper rxc to FIFO						
    /////////////////////////////////////////////

    reg [7:0]rxc_final;
    wire [7:0]rxc_fifo; //rxc send to fifo
    
    always@(posedge rxclk or posedge reset) begin
         if (reset)
           rxc_final <=#TP 0;
         else if (get_terminator & this_cycle)
           rxc_final <=#TP rxc_end_data;
         else if (get_terminator_d1 & ~this_cycle)
           rxc_final <=#TP rxc_end_data;
         else if (get_error_code)
           rxc_final <=#TP 0; 
         else if (receiving)
             rxc_final <=#TP `ALLONES8;
         else
             rxc_final <=#TP 0; 
    end 

    assign rxc_fifo = inband_fcs? ~rxc8_d3:rxc_final;
  
    ////////////////////////////////////////////////////////////////
    // FIFO management, to generate rx_good_frame/rx_bad_frame
    // after a frame has been totally received.
    ////////////////////////////////////////////////////////////////
    wire rxfifo_full;
    wire rxfifo_empty;
    wire fifo_wr_en;
    wire [63:0] rx_data_tmp;
    wire [7:0] rx_data_valid_tmp;  
 
    reg fifo_rd_en;
    reg[1:0] fifo_state;
    wire rx_good_frame;
    wire rx_bad_frame;
    reg check_reset;
    always@(posedge rxclk or posedge reset) begin
         if(reset) begin
           fifo_rd_en <=#TP 1'b0;
           fifo_state <=#TP IDLE;
           check_reset <=#TP 1'b0;
         end
         else
             case (fifo_state) 
                 IDLE: begin
                      check_reset <=#TP 1'b0;
                      fifo_state <=#TP IDLE;
                      fifo_rd_en <=#TP 1'b0;
                      if(~rxfifo_empty) begin  
                         fifo_rd_en <=#TP 1'b1;
                         fifo_state <=#TP WAIT_TMP;
                      end  
                 end
                 READ: begin
                      check_reset <=#TP 1'b0;
                      fifo_rd_en <=#TP 1'b1;
                      fifo_state <=#TP READ;
                      if(rx_data_valid_tmp!=8'hff) begin
                         fifo_state <=#TP WAIT;
                         fifo_rd_en <=#TP 1'b0;
                      end
                 end  
                 WAIT_TMP: begin
                      if(rx_data_valid_tmp == 8'hff)
                         fifo_state <=#TP READ;
                      else 
                         fifo_state <=#TP WAIT_TMP;
                 end  
                 WAIT: begin
                      fifo_state <=#TP WAIT;
                      check_reset <=#TP 1'b0;
                      fifo_rd_en <=#TP 1'b0;
                      if(bad_frame_get | good_frame_get)begin
                         fifo_state <=#TP IDLE;
                         check_reset <=#TP 1'b1;
                      end  
                 end
             endcase
    end
 
    reg[2:0] pad_cnt_reg;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           pad_cnt_reg <=#TP 0;
         else if((fifo_state == WAIT_TMP)& pad_frame & ~rxfifo_empty)
           pad_cnt_reg <=#TP pad_cnt;
         else if(pad_cnt_reg ==0)
           pad_cnt_reg <=#TP 0;
         else if(fifo_state[1])
           pad_cnt_reg <=#TP pad_cnt_reg-1;
         else
           pad_cnt_reg <=#TP 0;
    end
 
    reg[7:0] pad_rxc_reg;
    always@(posedge rxclk or posedge reset)begin
         if(reset)
           pad_rxc_reg <=#TP 0;
         else if((fifo_state == WAIT_TMP)& pad_frame & ~rxfifo_empty)
           pad_rxc_reg <=#TP pad_last_rxc;
         else
           pad_rxc_reg <=#TP pad_rxc_reg;
    end
 
    reg pad_frame_d1;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           pad_frame_d1<=#TP 1'b0;
         else if((fifo_state == WAIT_TMP)& pad_frame & ~rxfifo_empty)
           pad_frame_d1<=#TP 1'b1;
         else if(fifo_state == WAIT) 
           pad_frame_d1 <=#TP 1'b0;
         else
           pad_frame_d1 <=#TP pad_frame_d1; 
    end 
    
    assign rx_good_frame = good_frame_get & (fifo_state == WAIT);
    assign rx_bad_frame = bad_frame_get & (fifo_state == WAIT);
    
    assign fifo_wr_en = receiving_d2;
    
    defparam rxdatain.pWordWidth = 64;
    defparam rxdatain.pDepthWidth = 7;

    SwitchSyncFIFO rxdatain(
	.nReset(!reset),
	.iClk(rxclk),
	.iWEn(fifo_wr_en),
	.ivDataIn(rxd64_d3),
	.iREn(fifo_rd_en),
	.ovDataOut(rx_data_tmp),
	.qEmpty(rxfifo_empty),
	.qFull(rxfifo_full),
	.qvCount()
    );
    defparam rxcntrlin.pWordWidth = 8;
    defparam rxcntrlin.pDepthWidth = 7;

    SwitchSyncFIFO rxcntrlin(
	.nReset(!reset),
	.iClk(rxclk),
	.iWEn(fifo_wr_en),
	.ivDataIn(rxc_fifo),
	.iREn(fifo_rd_en),
	.ovDataOut(rx_data_valid_tmp),
	.qEmpty(),
	.qFull(),
	.qvCount()
    );
    reg [63:0] rx_data;
    always@(posedge rxclk or posedge reset) begin
         if (reset) begin
            rx_data <=#TP 0;
         end
         else begin
            rx_data <=#TP rx_data_tmp;
         end
    end
 
    reg [7:0] rx_data_valid;
    always@(posedge rxclk or posedge reset) begin
         if (reset)
            rx_data_valid <=#TP 0;
         else if(fifo_state[1] & pad_frame_d1)
            if(pad_cnt_reg==1)
               rx_data_valid <=#TP pad_rxc_reg;
            else if(pad_cnt_reg==0)
               rx_data_valid <=#TP 0;
            else
               rx_data_valid <=#TP rx_data_valid_tmp;  
         else if(fifo_state[1] & ~pad_frame_d1) 
            rx_data_valid <=#TP rx_data_valid_tmp;  
         else
            rx_data_valid <=#TP 0;
    end
 
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: Frame Length Checker                            ////
////                                                              ////
//// DESCRIPTION: Frame Length Checker of  10 Gigabit             ////
////     Ethernet MAC. Many statistics are implemented            ////
////     here.                                                    ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:42  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxLenTypChecker(rxclk, reset, get_terminator, terminator_location, jumbo_enable, tagged_frame, 
       frame_cnt, vlan_enable,length_error,large_error, small_error, padded_frame, length_65_127, 
       length_128_255, length_256_511, length_512_1023, length_1024_max,jumbo_frame);
     
    input  rxclk;
    input  reset;
    input  jumbo_enable; //Enable jumbo frame recieving
    input  vlan_enable;  //VLAN mode enable bit
    input  tagged_frame;	 //number of 64bits DATA field of tagged frame contains
    input  get_terminator;
    input[`COUNTER_WIDTH-1:0] frame_cnt; 
    input[2:0] terminator_location;

    output length_error;
    output large_error;
    output small_error;
    output padded_frame;
    output length_65_127;
    output length_128_255;
    output length_256_511;
    output length_512_1023;
    output length_1024_max;
    output jumbo_frame;
 
    parameter TP =1 ;

    reg [2:0]location_reg;
    always@(posedge rxclk or posedge reset)begin
         if (reset) 
           location_reg <=#TP 0;
         else if(get_terminator)
           location_reg <=#TP terminator_location;
         else 
           location_reg <=#TP location_reg;
         end

    reg large_error;
    always@(posedge rxclk or posedge reset)begin
         if(reset) 
           large_error <=#TP 1'b0;
         else if(tagged_frame & vlan_enable) begin
             if ((frame_cnt == `MAX_TAG_LENGTH) & (location_reg > `MAX_TAG_BITS_MORE))
                large_error <=#TP 1'b1;
             else if ((frame_cnt > `MAX_TAG_LENGTH) & ~jumbo_enable)
                large_error <=#TP 1'b1;
             else if(frame_cnt > `MAX_JUMBO_LENGTH)
                large_error <=#TP 1'b1;
             else
                large_error <=#TP 1'b0;
         end
         else begin
             if ((frame_cnt == `MAX_VALID_LENGTH) & (location_reg > `MAX_VALID_BITS_MORE))
               large_error <=#TP 1'b1;
             else if((frame_cnt > `MAX_VALID_LENGTH) & ~jumbo_enable) 
               large_error <=#TP 1'b1;
             else if(frame_cnt > `MAX_JUMBO_LENGTH)
               large_error <=#TP 1'b1;
             else
               large_error <=#TP 1'b0;
         end
    end

    reg small_error;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           small_error <=#TP 0;
    else 
           small_error <=#TP get_terminator & (frame_cnt< `MIN_VALID_LENGTH);
    end

    wire length_error;
    assign length_error = small_error | large_error;
     
    /////////////////////////////////////////////////
    // Statistic signals
    /////////////////////////////////////////////////    
 
    ///////////////////////////////////
    // 64byte frame received OK
    ///////////////////////////////////

    reg padded_frame;
    always@(posedge rxclk or posedge reset) begin
          if(reset)
            padded_frame <=#TP 0;
          else
            padded_frame <=#TP get_terminator & (frame_cnt==`MIN_VALID_LENGTH);
    end

    ///////////////////////////////////
    // 65-127 byte Frame Received OK
    ///////////////////////////////////

    reg length_65_127;
    always@(posedge rxclk or posedge reset) begin
          if(reset)
            length_65_127 <=#TP 0;
          else
            length_65_127 <=#TP get_terminator & (frame_cnt>`MIN_VALID_LENGTH) & (frame_cnt <=127);
    end

    ///////////////////////////////////
    // 128-255 byte Frame Received OK
    ///////////////////////////////////

    reg length_128_255;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           length_128_255 <=#TP 0;
         else
           length_128_255 <=#TP get_terminator & (frame_cnt>128) & (frame_cnt <=255);
    end

    ///////////////////////////////////
    // 256-511 byte Frame Received OK
    ///////////////////////////////////

    reg length_256_511;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           length_256_511 <=#TP 0;
         else
           length_256_511 <=#TP get_terminator & (frame_cnt>256) & (frame_cnt <=511);
    end

    ///////////////////////////////////
    // 512-1023 byte Frame Received OK
    ///////////////////////////////////

    reg length_512_1023;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           length_512_1023 <=#TP 0;
         else
           length_512_1023 <=#TP get_terminator & (frame_cnt>512) & (frame_cnt <=1023);
    end

    ///////////////////////////////////
    // 1024-max byte Frame Received OK
    ///////////////////////////////////

    reg length_1024_max;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           length_1024_max <=#TP 0;
         else
           length_1024_max <=#TP get_terminator & (frame_cnt>1024) & (frame_cnt <=`MAX_VALID_LENGTH);
    end

    //////////////////////////////////////////////
    // Count for Control Frames Received OK
    //////////////////////////////////////////////
    //how to indicate a control frame(not clearly specificated in 802.3

    ///////////////////////////////////////////////
    // Count for Oversize Frames Received OK
    ///////////////////////////////////////////////
 
    reg jumbo_frame;
    always@(posedge rxclk or posedge reset) begin
         if(reset)
           jumbo_frame <=#TP 0;
         else
           jumbo_frame <=#TP get_terminator & jumbo_enable & (frame_cnt > `MAX_VALID_LENGTH) & (frame_cnt < `MAX_JUMBO_LENGTH);
    end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME:  rxLinkFaultState                               ////
////                                                              ////
//// DESCRIPTION: State machine for Link Fault Signalling.        ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:42  fisher5090
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxLinkFaultState(rxclk, reset, local_fault, remote_fault, link_fault);
    input rxclk;
    input reset;
    input local_fault;
    input remote_fault;
    output[1:0] link_fault;
 
    parameter TP =1;
    parameter IDLE = 0, LinkFaultDetect = 1, NewFaultType = 2, GetFault = 3; 

    //------------------------------------------------
    // Link	Fault Signalling Statemachine
    //------------------------------------------------
    wire  fault_type;
    wire  get_one_fault;
    wire  no_new_type;

    reg[2:0] linkstate, linkstate_next;
    reg[5:0] col_cnt;
    reg      seq_cnt;
    reg[1:0] seq_type;
    reg[1:0] last_seq_type;
    reg[1:0] link_fault;
    reg      reset_col_cnt;
    wire     seq_cnt_3;
    wire     col_cnt_64;

    assign fault_type = {local_fault, remote_fault};
    assign get_one_fault = local_fault | remote_fault;
    assign no_new_type = (seq_type == last_seq_type);
    assign col_cnt_64 = & col_cnt;
 
    always@(posedge rxclk or posedge reset)begin
         if (reset) begin
           seq_type <=#TP 0;
           seq_cnt <=#TP 0;
           last_seq_type <=#TP 0;
           reset_col_cnt<= #TP 1;
           link_fault <=#TP 2'b00;
           linkstate<= #TP IDLE;
         end
         else begin	 
           seq_type <= #TP fault_type;	
           last_seq_type <=#TP seq_type;
           case (linkstate)
               IDLE: begin
                   linkstate <=#TP IDLE;
                   reset_col_cnt <= #TP 1;
                   seq_cnt <= #TP 0;
                   link_fault <= #TP 2'b00;	
                   if (get_one_fault)
                      linkstate<=#TP LinkFaultDetect;
               end
 
               LinkFaultDetect: begin
                   linkstate <=#TP LinkFaultDetect;
                   reset_col_cnt <=#TP 1;
                   if (get_one_fault & no_new_type) begin
                     if (seq_cnt) begin 
                        linkstate <=#TP IDLE;
                        link_fault <=#TP seq_type;  //final fault indeed(equals to GetFault status)
                     end
                     else
                        seq_cnt <=#TP seq_cnt + 1;
                   end
                   else if(~get_one_fault) begin
                        reset_col_cnt <=#TP 0; 
                        if (col_cnt_64)
                           linkstate <=#TP IDLE;
                   end
                   else if(get_one_fault & ~no_new_type)
                        linkstate <=#TP NewFaultType;
                   end

                NewFaultType: begin
                    seq_cnt <=#TP 0;  
                    linkstate <=#TP LinkFaultDetect;
                    reset_col_cnt<=#TP 1;
                end

//              GetFault: begin
//                  linkstate <=#TP IDLE;
//                  reset_col_cnt <=#TP 1;
//                  link_fault <=#TP seq_type;
//                  if (get_one_fault & no_new_type) 
//                    link_fault <=#TP seq_type;	
//                  else if (~get_one_fault)	begin
//                    reset_col_cnt<=#TP 0;
//                    if(col_cnt_128)
//                      linkstate <=#TP IDLE;
//                  end
//                  else if (get_one_fault &	~no_new_type)
//                    linkstate <=#TP NewFaultType;
//              end
           endcase
       end
    end

    always@(posedge rxclk or posedge reset) begin
          if (reset) 
            col_cnt <=#TP 0;
          else if (reset_col_cnt) 
            col_cnt <=#TP 0;
          else
            col_cnt <=#TP col_cnt + 1;
    end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxNumCounter                                    ////
////                                                              ////
//// DESCRIPTION: To count bytes have been received.              ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:42  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxNumCounter(rxclk, reset, receiving, frame_cnt);
    
    input rxclk;            //receive clk	 
    input reset; //globe reset

    input receiving; //start to count	data field

    output[`COUNTER_WIDTH-1:0] frame_cnt;

    parameter TP =1;

    // Data counter
    // used in rxReceiveData field, 
    // this counter is used for frames whose length is larger than 64
    // Of course it also count actual bytes of frames whose length is shorter than 64.
    counter data_counter(.clk(rxclk), .reset(reset), .load(~receiving), .en(receiving), .value(frame_cnt));
    defparam data_counter.WIDTH = `COUNTER_WIDTH;

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: receive engine                                  ////
////                                                              ////
//// DESCRIPTION: Receive Engine Top Level for the 10 Gigabit     ////
////     Ethernet MAC.                                            ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.6  2006/06/16 06:39:59  fisher5090
// no message
//
// Revision 1.5  2006/06/16 06:36:28  Zheng Cao
// no message
//
// Revision 1.4  2006/06/12 10:02:19  Zheng Cao
// change rxd_in, rxc_in and rxclk_in signals'name to xgmii_rxd, xgmii_rxc and xgmii_rxclk
//
// Revision 1.3  2006/06/11 12:15:11  Zheng Cao
// no message
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// No flow control included
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxReceiveEngine(xgmii_rxclk, rxclk_2x, reset_in, xgmii_rxd, xgmii_rxc, rxStatRegPlus,
                       cfgRxRegData_in, rx_data, rx_data_valid, rx_good_frame, rxclk_out,
                       rx_bad_frame, rxCfgofRS, rxTxLinkFault);//, fcTxPauseData, fcTxPauseValid);
    input xgmii_rxclk; //Input clock of receive engine
    input rxclk_2x;
    input reset_in; //Globle reset of receive engine
    input [31:0] xgmii_rxd; //XGMII RXD
    input [3:0] xgmii_rxc;  //XGMII RXC
    output [17:0] rxStatRegPlus; //Signals for statistics	
    input [64:0] cfgRxRegData_in; //Signals for configuration
    output [63:0] rx_data; //Received data sent to upper layer
    output [7:0] rx_data_valid; //Receive data valid indicator
    output rx_good_frame; //Indicate that a good frame has been received
    output rx_bad_frame; //Indicate that a bad frame has been received
    output[2:0] rxCfgofRS; //
    output [1:0] rxTxLinkFault;
    output rxclk_out;
//  output [31:0] fcTxPauseData;
//  output fcTxPauseValid;

    parameter TP =1;

    wire rxclk;
    wire rxclk_180;
    wire locked;
    wire reset_dcm;
    wire reset;

    reg [47:0]MAC_Addr;	//MAC Address used in receiving control frame.
    reg      vlan_enable; //VLAN Enable
    reg      recv_enable; //Receiver Enable
    reg      inband_fcs;	//In-band FCS Enable, when this bit is '1', the MAC will pass FCS up to client
    reg      jumbo_enable;//Jumbo Frame Enable
    reg      recv_rst;		//Receiver reset

    wire start_da, start_lt;
    wire tagged_frame;
    wire pause_frame;
    wire [47:0] da_addr;
//  wire [15:0] lt_data;
    wire [`COUNTER_WIDTH-1:0] frame_cnt;
    wire [2:0]  terminator_location;
    wire get_sfd,get_error_code,get_terminator, get_terminator_d1;
    wire receiving;
    wire receiving_d1,receiving_d2;

 
    wire length_error;
    wire large_error;
    wire small_error;
    wire padded_frame;
    wire length_65_127;
    wire length_128_255;
    wire length_256_511;
    wire length_512_1023;
    wire length_1024_max;
    wire jumbo_frame;

    wire local_invalid;
    wire broad_valid;
    wire multi_valid;

    wire good_frame_get, bad_frame_get;
    wire wait_crc_check;

    wire crc_check_valid;
    wire crc_check_invalid;
    wire check_reset;

    wire [1:0]link_fault;

    //////////////////////////////////////////
    // Input Registers
    //////////////////////////////////////////
 
    wire [63:0] rxd64;
    wire [63:0] CRC_DATA;
    wire [7:0] rxc8;

    assign rxTxLinkFault = link_fault;
    // assign fcTxPauseValid = pause_frame;
 
 
    //////////////////////////////////////////
    // Read Receiver Configuration Word
    //////////////////////////////////////////
 
    reg[52:0] cfgRxRegData;
    always@(posedge rxclk or posedge reset)begin
          if(reset) 
            cfgRxRegData <=#TP 0;
          else
            cfgRxRegData<=#TP cfgRxRegData_in;
    end
 
    always@(posedge rxclk or posedge reset)begin
          if(reset) begin
            MAC_Addr <= 0;
            vlan_enable <= 0;
            recv_enable <= 0;
            inband_fcs  <= 0;
            jumbo_enable <= 0;
            recv_rst <= 0;
          end
          else begin
            MAC_Addr <= cfgRxRegData[47:0];
            vlan_enable <= cfgRxRegData[48];
            recv_enable <= cfgRxRegData[49];
            inband_fcs  <= cfgRxRegData[50];
            jumbo_enable <= cfgRxRegData[51];
            recv_rst <= cfgRxRegData[52];
          end
    end 
    //////////////////////////////////////////////////
    // Used to count number of received frames(G&B)
    //////////////////////////////////////////////////
    reg[7:0] cnt;
    reg cnt_en;
    always@(posedge rxclk or posedge reset) begin
         if (reset) 
           cnt_en <=0;
         else if(get_sfd)			 
           cnt_en <=1;
         else if(rx_bad_frame|rx_good_frame)
           cnt_en <=0;
         else
           cnt_en <=cnt_en;
    end

    always@(posedge rxclk or posedge reset) begin
          if (reset)
             cnt <=0;
          else if(cnt_en)
             cnt<=cnt + 1;
          else 
             cnt <=0;
    end 
   
   /////////////////////////////////////////
   // Reset signals
   /////////////////////////////////////////
   assign  reset_dcm = reset_in | recv_rst;
   assign  reset = ~locked;
  
   /////////////////////////////////////////
   // Write Configuration Words	of RS 
   /////////////////////////////////////////

   assign rxCfgofRS[0] = ~link_fault[0] & link_fault[1]; //get local fault
   assign rxCfgofRS[1] = link_fault[0] & link_fault[1];  //get remote fault
   assign rxCfgofRS[2] = locked;  //Receive DCM locked
   
   ////////////////////////////////////////
   // Signals for Pause Operation
   ////////////////////////////////////////
   assign fcTxPauseValid = pause_frame;
// assign fcTxPauseData = {16{1'b0},rxd64[15:0]};

   ////////////////////////////////////////
   // Receive Clock Generator
   //////////////////////////////////////// 
   assign rxclk_out = rxclk;
   rxClkgen rxclk_gen(.rxclk_in(xgmii_rxclk),
                .reset(reset_dcm),
                .rxclk(rxclk),    // system clock
                .rxclk_180(rxclk_180), //reversed clock
                .locked(locked)
                 );
 
   //////////////////////////////////////
   // Rx Engine DataPath
   //////////////////////////////////////
   rxDataPath datapath_main(.rxclk(rxclk), .reset(reset), .rxd64(rxd64), .rxc8(rxc8), .inband_fcs(inband_fcs), .receiving(receiving), 
                            .start_da(start_da), .start_lt(start_lt), .wait_crc_check(wait_crc_check), .get_sfd(get_sfd), 
                             .get_terminator(get_terminator), .get_error_code(get_error_code), .tagged_frame(tagged_frame), .pause_frame(pause_frame),
                    .da_addr(da_addr), .terminator_location(terminator_location), .CRC_DATA(CRC_DATA), .rx_data_valid(rx_data_valid), 
                    .rx_data(rx_data), .get_terminator_d1(get_terminator_d1),.bad_frame_get(bad_frame_get),.good_frame_get(good_frame_get),
                    .check_reset(check_reset),.rx_good_frame(rx_good_frame),.rx_bad_frame(rx_bad_frame));//,.fcTxPauseData(fcTxPauseData));
 
   //////////////////////////////////////
   // Destination Address Checker
   //////////////////////////////////////

   rxDAchecker  dachecker(.rxclk(rxclk), .reset(reset), .local_invalid(local_invalid), .broad_valid(broad_valid), .multi_valid(multi_valid), .MAC_Addr(MAC_Addr),
                          .da_addr(da_addr));

   /////////////////////////////////////
   // Length/Type field checker
   /////////////////////////////////////

   rxLenTypChecker lenchecker(.rxclk(rxclk), .reset(reset), .get_terminator(get_terminator), .terminator_location(terminator_location), 
                     .jumbo_enable(jumbo_enable), .tagged_frame(tagged_frame), .frame_cnt(frame_cnt), .vlan_enable(vlan_enable),
                     .length_error(length_error), .large_error(large_error),.small_error(small_error), .padded_frame(padded_frame),
                     .length_65_127(length_65_127), .length_128_255(length_128_255), .length_256_511(length_256_511), .length_512_1023(length_512_1023), 
                          .length_1024_max(length_1024_max), .jumbo_frame(jumbo_frame)
 ); 

   /////////////////////////////////////
   // Counters used in Receive Engine
   /////////////////////////////////////

    rxNumCounter counters(.rxclk(rxclk), .reset(reset), .receiving(receiving), .frame_cnt(frame_cnt));
 
   /////////////////////////////////////
   // State Machine in Receive Process
   /////////////////////////////////////

    rxStateMachine statemachine(.rxclk(rxclk), .reset(reset), .recv_enable(recv_enable), .get_sfd(get_sfd), .local_invalid(local_invalid), 
                                .length_error(length_error), .crc_check_valid(crc_check_valid), .crc_check_invalid(crc_check_invalid), 
                               .start_da(start_da), .start_lt(start_lt), .receiving(receiving),.good_frame_get(good_frame_get),
                               .bad_frame_get(bad_frame_get), .get_error_code(get_error_code), .wait_crc_check(wait_crc_check), .get_terminator(get_terminator),
                               .receiving_d1(receiving_d1),.check_reset(check_reset));

   /////////////////////////////////////
   // CRC Check module
   /////////////////////////////////////
   rxCRC crcmodule(.rxclk(rxclk), .reset(reset), .CRC_DATA(CRC_DATA), .get_terminator(get_terminator), .terminator_location(terminator_location),
                   .crc_check_invalid(crc_check_invalid), .crc_check_valid(crc_check_valid),.receiving(receiving),.receiving_d1(receiving_d1),
                   .get_terminator_d1(get_terminator_d1), .wait_crc_check(wait_crc_check),.get_error_code(get_error_code));
   /////////////////////////////////////
   // RS Layer
   /////////////////////////////////////
    rxRSLayer rx_rs(.rxclk(rxclk), .rxclk_180(rxclk_180), .rxclk_2x(rxclk_2x), .reset(reset), .link_fault(link_fault), .rxd64(rxd64), .rxc8(rxc8), .rxd_in(xgmii_rxd), .rxc_in(xgmii_rxc));
    
   /////////////////////////////////////
   // Statistic module
   /////////////////////////////////////
   rxStatModule rx_stat(.rxclk(rxclk),.reset(reset),.good_frame_get(good_frame_get), .large_error(large_error),.small_error(small_error), .crc_check_invalid(crc_check_invalid),
                 .receiving(receiving), .padded_frame(padded_frame), .pause_frame(pause_frame), .broad_valid(broad_valid), .multi_valid(multi_valid),
                 .length_65_127(length_65_127), .length_128_255(length_128_255), .length_256_511(length_256_511), .length_512_1023(length_512_1023), 
                 .length_1024_max(length_1024_max), .jumbo_frame(jumbo_frame),.get_error_code(get_error_code), .rxStatRegPlus(rxStatRegPlus));				   
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxRSIO                                          ////
////                                                              ////
//// DESCRIPTION: Datapath of Reconciliation Sublayer.            ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.2  2006/06/16 06:36:28  fisher5090
// no message
//
// Revision 1.1.1.1  2006/05/31 05:59:43  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxRSIO(rxclk, rxclk_180, rxclk_2x, reset, rxd_in, rxc_in, rxd64, rxc8, local_fault, remote_fault);
    input rxclk;
    input rxclk_180;
    input rxclk_2x;
    input reset;
    input [31:0] rxd_in;
    input [3:0] rxc_in;
    output [63:0] rxd64;
    output [7:0] rxc8;
    output local_fault;
    output remote_fault;

    parameter TP =1;

    reg local_fault, remote_fault;
//  wire get_align, get_seq;
      
    always@(posedge rxclk or posedge reset) begin
          if(reset) begin
            local_fault <=#TP 0;
            remote_fault <=#TP 0;
          end
          else begin
            local_fault <=#TP (rxd_in[7:0] == `SEQUENCE) & (rxd_in[29:8] == 0) & (rxc_in[3:0]== 4'h8) & ~rxd_in[30] & rxd_in[31]; 
            remote_fault<=#TP (rxd_in[7:0] == `SEQUENCE) & (rxd_in[29:8] == 0) & (rxc_in[3:0]== 4'h8) & rxd_in[30] & rxd_in[31];   
          end
    end 
//    assign get_align = ((rxd_in[7:0]==`START) & rxc_in[0]);
//  assign get_seq = (rxd_in[7:0] == `SEQUENCE) & (rxd_in[29:8] == 0) & (rxc_in[3:0]== 4'h8) & rxd_in[31];
//  assign local_fault = get_seq & ~rxd_in[30];
//  assign remote_fault = get_seq & rxd_in[30];
 
    reg[7:0] rxc8_in_tmp;
    reg[63:0]rxd64_in_tmp;
    reg[3:0] rxc4_in_tmp;
    reg[31:0]rxd32_in_tmp;
    reg[31:0]rxd32_in_tmp_d1;
    reg[3:0] rxc4_in_tmp_d1;
    
    always@(posedge rxclk_2x or posedge reset) begin
         if (reset) begin
           rxc4_in_tmp  <= #TP 0;
           rxd32_in_tmp <= #TP 0;
           rxc4_in_tmp_d1  <= #TP 0;
           rxd32_in_tmp_d1 <= #TP 0;
         end
         else begin
           rxc4_in_tmp  <= #TP rxc_in;
           rxd32_in_tmp <= #TP rxd_in;
           rxc4_in_tmp_d1  <= #TP rxc4_in_tmp;
           rxd32_in_tmp_d1 <= #TP rxd32_in_tmp;
         end
    end
    
    reg get_align_reg;
    always@(posedge rxclk_2x or posedge reset) begin
         if (reset)
           get_align_reg <=#TP 0;
         else if((rxd32_in_tmp[7:0]==`START) & rxc4_in_tmp[0])      
           get_align_reg <=#TP 1'b1;
         else if((&rxc4_in_tmp)&(rxd32_in_tmp==32'h07070707))
           get_align_reg <=#TP 1'b0;
    end
    
    reg [1:0] qvWriteCntrl;
    always@(posedge rxclk_2x or posedge reset) begin
         if (reset)
            qvWriteCntrl <= 2'b01;
         else if(get_align_reg) begin
            qvWriteCntrl[1] <= qvWriteCntrl[0];
            qvWriteCntrl[0] <= qvWriteCntrl[1];
         end
         else
            qvWriteCntrl <= 2'b01;
    end
    
    always@(posedge rxclk_2x or posedge reset) begin
         if (reset)begin
           rxd64_in_tmp <= #TP 0;
           rxc8_in_tmp  <= #TP 0;
         end
         else if(qvWriteCntrl[1]) begin
           rxd64_in_tmp[63:32] <= #TP rxd32_in_tmp_d1;
           rxc8_in_tmp[7:4] <= #TP rxc4_in_tmp_d1;      
         end 
         else begin
           rxd64_in_tmp[31:0] <= #TP rxd32_in_tmp_d1;
           rxc8_in_tmp[3:0] <= #TP rxc4_in_tmp_d1;
         end
    end
  
  wire [71:0] rxdata;
  
  assign rxd64 = rxdata[63:0];
  assign rxc8  = rxdata[71:64]; 
  
  defparam RealignInst.pDepthWidth = 5;
  defparam RealignInst.pWordWidth = 72;
  SwitchAsyncFIFO RealignInst(
                  .inReset(!reset),
                  .iWClk(rxclk_2x),
                  .iWEn(qvWriteCntrl[0]),
                  .ivDataIn({rxc8_in_tmp,rxd64_in_tmp}),
                  .qWFull(),
                  .qvWCount(),
                  .iRClk(rxclk),
                  .iREn(1'b1),
                  .ovDataOut(rxdata),
                  .qREmpty(),
                  .qvRNumberLeft()
  );
           
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxRSLayer                                       ////
////                                                              ////
//// DESCRIPTION: Reconciliation SubLayer of 10 Gigabit Ethernet. ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.2  2006/06/16 06:36:28  fisher5090
// no message
//
// Revision 1.1.1.1  2006/05/31 05:59:43  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxRSLayer(rxclk, rxclk_180, rxclk_2x, reset, link_fault, rxd64, rxc8, rxd_in, rxc_in);
    input rxclk;
    input rxclk_180;
    input rxclk_2x;
    input reset;     
    input [31:0] rxd_in;
    input [3:0] rxc_in;
    output [1:0] link_fault;
    output [63:0] rxd64;
    output [7:0] rxc8;

    wire  local_fault;
    wire  remote_fault;
    wire[1:0]  link_fault;

    rxRSIO datapath(.rxclk(rxclk), 
                    .rxclk_180(rxclk_180),
                    .rxclk_2x(rxclk_2x),
                    .reset(reset), 
                    .rxd_in(rxd_in), 
                    .rxc_in(rxc_in), 
                    .rxd64(rxd64), 
                    .rxc8(rxc8), 
                    .local_fault(local_fault), 
                    .remote_fault(remote_fault)
                   );
 
    rxLinkFaultState statemachine(.rxclk(rxclk_180),
                                  .reset(reset),
                                  .local_fault(local_fault), 
                                  .remote_fault(remote_fault), 
                                  .link_fault(link_fault)
                   );

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxStateMachine                                  ////
////                                                              ////
//// DESCRIPTION: State Machine of Receive Engine.                ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:43  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`include "timescale.v"
`include "xgiga_define.v"

module rxStateMachine(rxclk, reset, recv_enable, get_sfd, local_invalid, length_error, crc_check_valid, crc_check_invalid, 
       start_da, start_lt, receiving, receiving_d1, good_frame_get, bad_frame_get, get_error_code, wait_crc_check,
       get_terminator,check_reset);
   
    input rxclk;
    input reset;
   
    input recv_enable;
 
    //PRE & SFD
    input get_sfd; // SFD has been received;
 
    //DA field 
    input local_invalid;// The Frame's DA field is not Local MAC;
 
    //Length/Type field
    input length_error;//
 
    //FCS field
   input get_terminator;//Indicate end of receiving FCS field;
   input crc_check_valid;//Indicate the frame passed CRC Check;
   input crc_check_invalid;//Indicate the frame failed in CRC Check;
   input get_error_code;
   
   input check_reset;
 
   //DA field
   output start_da;// Start to receive Destination Address;
   
   //Length/Type field
   output start_lt;// Start to receive Length/Type field;
 
    //Receive process control
   output receiving; //Rx Engine is working, not in IDLE state and Check state.
   output receiving_d1;
   output good_frame_get;// A good frame has been received;
   output bad_frame_get; // A bad frame has been received; 
   output wait_crc_check;// 
 
   parameter IDLE = 0, rxReceiveDA = 1, rxReceiveLT = 2, rxReceiveData = 4;
   parameter rxGetError = 8,	rxIFGWait = 16;
   parameter TP =1;

   wire    start_da;
   wire    start_lt;
   wire    receiving;
   reg     good_frame_get;
   reg     bad_frame_get;
   
   reg[4:0] rxstate, rxstate_next;

   always@(rxstate, get_sfd, local_invalid, recv_enable,
           get_error_code, length_error, get_terminator, reset)begin
         if (reset) begin
            rxstate_next <=#TP IDLE;
         end
         else begin	 
             case (rxstate)
                 IDLE: begin //5'b00000;
                     if (get_sfd && recv_enable)
                       rxstate_next <=#TP rxReceiveDA;
                     else
                       rxstate_next <=#TP IDLE;
                 end
                 rxReceiveDA: begin //5'b00001  
                     rxstate_next <=#TP rxReceiveLT;
                 end
                 rxReceiveLT: begin //5'b00010
                     rxstate_next <=#TP rxReceiveData;
                 end
                 rxReceiveData: begin //5'b00100
                     if (local_invalid |length_error| get_error_code) 
                       rxstate_next <=#TP rxGetError;
                     else if (get_terminator)
                       rxstate_next <=#TP rxIFGWait;
                     else
                       rxstate_next <=#TP rxReceiveData;
                 end
                 rxGetError: begin //5'b01000
                     if (get_sfd && recv_enable)
                       rxstate_next <=#TP rxReceiveDA;
                     else
                       rxstate_next <=#TP IDLE;
                 end
                 rxIFGWait : begin //5'b10000;
                     if (get_sfd && recv_enable)
                       rxstate_next <=#TP rxReceiveDA;
                     else
                       rxstate_next <=#TP IDLE;
                 end
             endcase
         end
    end

    always@(posedge rxclk or posedge reset) begin
         if (reset)
           rxstate <=#TP IDLE;
         else
           rxstate <=#TP rxstate_next;
    end

    assign start_da = rxstate[0];
    assign start_lt = rxstate[1];
    assign receiving = rxstate[2] | rxstate[1] | rxstate[0]; // in DA,LT,DATA status
 
    reg receiving_d1;
    always@(posedge rxclk or posedge reset) begin
         if (reset) begin
           receiving_d1<=#TP 0;
         end
         else begin
           receiving_d1<=#TP receiving;
         end
    end
 
    reg  wait_crc_check; 
    always@(posedge rxclk or posedge reset) begin
         if (reset)
           wait_crc_check <=#TP 0;
         else if (rxstate[4])
           wait_crc_check <=#TP 1'b1;
         else if (crc_check_valid || crc_check_invalid||length_error)
           wait_crc_check <=#TP 1'b0;
         else
           wait_crc_check <=#TP wait_crc_check;
    end

    always@(posedge rxclk or posedge reset)begin
         if (reset)	begin
           bad_frame_get <=#TP 0;
           good_frame_get <=#TP 0;
         end
         else if(rxstate[3] || crc_check_invalid || length_error)begin
           bad_frame_get <=#TP 1'b1;
           good_frame_get <=#TP 1'b0;
         end
         else if (crc_check_valid)begin 
           good_frame_get <=#TP 1'b1;
           bad_frame_get <=#TP 1'b0;
         end 
         else if (check_reset)begin
           good_frame_get <=#TP 1'b0;
           bad_frame_get <=#TP 1'b0;
         end 
    end
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: rxStatModule                                    ////
////                                                              ////
//// DESCRIPTION: Generate signals for statistics. These signals  ////
////            will be used in Management Module.                ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.3  2006/06/11 12:15:23  Zheng Cao
// no message
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////


`include "timescale.v"
`include "xgiga_define.v"

module rxStatModule(rxclk, reset, good_frame_get,crc_check_invalid, large_error, small_error,
                    receiving, padded_frame, pause_frame, broad_valid, multi_valid,
                    length_65_127, length_128_255, length_256_511, length_512_1023, length_1024_max,
                    jumbo_frame, get_error_code, rxStatRegPlus);

   input rxclk;
   input reset;
   input good_frame_get; 
   input large_error;
   input small_error;
   input crc_check_invalid;
   input receiving;
   input padded_frame;
   input pause_frame;
   input broad_valid;
   input multi_valid;
   input length_65_127;
   input length_128_255;
   input length_256_511;
   input length_512_1023;
   input length_1024_max;
   input jumbo_frame;
   input get_error_code;
   output [17:0] rxStatRegPlus;

   parameter TP =1;

   wire[17:0] rxStatRegPlus_tmp;

   ////////////////////////////////////////////
   // Count for Frames Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[0] = good_frame_get;

   ////////////////////////////////////////////
   // Count for FCS check error
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[1] = crc_check_invalid;

   ////////////////////////////////////////////
   // Count for BroadCast Frame Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[2] = broad_valid & good_frame_get;

   /////////////////////////////////////////////
   // Count for Multicast Frame Received OK
   /////////////////////////////////////////////
   assign rxStatRegPlus_tmp[3] = multi_valid & good_frame_get;

   ////////////////////////////////////////////
   // Count for 64 byte Frame Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[4] = padded_frame & good_frame_get;

   ////////////////////////////////////////////
   // Count for 65-127 byte Frames Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[5] = length_65_127 & good_frame_get;

   ////////////////////////////////////////////
   // Count for 128-255 byte Frames Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[6] = length_128_255 & good_frame_get;

   ////////////////////////////////////////////
   // Count for 256-511 byte Frames Received OK
   ////////////////////////////////////////////
   assign rxStatRegPlus_tmp[7] = length_256_511 & good_frame_get;

   //////////////////////////////////////////////
   // Count for 512-1023 byte Frames Received OK
   //////////////////////////////////////////////
   assign rxStatRegPlus_tmp[8] = length_512_1023 & good_frame_get;

   //////////////////////////////////////////////
   // Count for 1024-1518 byte Frames Received OK
   //////////////////////////////////////////////
   assign rxStatRegPlus_tmp[9] = length_1024_max & good_frame_get;

   //////////////////////////////////////////////
   // Count for Control Frames Received OK
   //////////////////////////////////////////////
   assign rxStatRegPlus_tmp[10] = pause_frame & good_frame_get;

   //////////////////////////////////////////////
   // Count for Length/Type Out of Range
   //////////////////////////////////////////////
   assign rxStatRegPlus_tmp[11] = large_error;

   //////////////////////////////////////////////
   // Count for Pause Frames Received OK
   //////////////////////////////////////////////
   assign rxStatRegPlus_tmp[12] = pause_frame & good_frame_get;

   /////////////////////////////////////////////////////////////
   // Count for Control Frames Received with Unsupported Opcode.
   /////////////////////////////////////////////////////////////
    assign rxStatRegPlus_tmp[13] = 0;//pause_frame & good_frame_get;

   ///////////////////////////////////////////////
   // Count for Oversize Frames Received OK
   ///////////////////////////////////////////////
   assign rxStatRegPlus_tmp[14] = jumbo_frame & good_frame_get;

   ///////////////////////////////////////////////
   // Count for Undersized Frames Received
   ///////////////////////////////////////////////
   assign rxStatRegPlus_tmp[15] = small_error;

   ///////////////////////////////////////////////
   // Count for Fragment Frames Received
   ///////////////////////////////////////////////
   assign rxStatRegPlus_tmp[16] = receiving & get_error_code;

   ///////////////////////////////////////////////
   // Count for Number of Bytes Received
   ///////////////////////////////////////////////
   assign rxStatRegPlus_tmp[17] = receiving;

   reg[17:0] rxStatRegPlus;
   always@(posedge rxclk or posedge reset) begin
         if(reset)
           rxStatRegPlus <=#TP 0;
         else
           rxStatRegPlus <=#TP rxStatRegPlus_tmp;
   end

endmodule
//
// Module SwitchAsyncFIFO
//
// the differences between this FIFO and the general one are listed below
//    1. because there is no any write and read acknowledgements, the user should take advantage of the status flags to generate the write and read requests.
//    2. after the qWFull flag has been asserted, the word can not be written into the FIFO.
//    3. after the qREmpty flag has been asserted, the data can not be read out from the FIFO.
//    4. 2 flip-flops are used to re-synchronize the addresses of the different clock domains.
//    5. to decrease 1 clock, the negedge of the clock is utilized by the 1st flip-flop.
//    6. to provide guaranteed free space information, the qRNumberLeft has been subtracted 4.
//
// Created:
//          by - Xinchun Liu
//          at - 2006-09-27
//
// revised:
//          by - Xinchun Liu
//          at - 2007-05-15
//    1. to decrease the clock to output time, a output register has been added.
//    2. 1 cycle latency has been added to the output data and empty flag.
//
`resetall
`timescale 1ns/10ps

module SwitchAsyncFIFO
(
   inReset,
   iWClk,
   iWEn,
   ivDataIn,
   qWFull,
   qvWCount,
   iRClk,
   iREn,
   ovDataOut,
   qREmpty,
   qvRNumberLeft
);

// Default address and data width
parameter   pDepthWidth = 5 ;
parameter   pWordWidth = 16 ;

input   inReset ;
input   iWClk ;
input iWEn ;
input [pWordWidth-1:0]   ivDataIn ;
output   qWFull ;
output   [pDepthWidth:0]   qvWCount ;
input   iRClk ;
input   iREn ;
output   [pWordWidth-1:0]   ovDataOut ;
output   qREmpty ;
output   [pDepthWidth:0]   qvRNumberLeft ;

wire   inReset ;
wire   iWClk ;
wire   iWEn ;
wire  [pWordWidth-1:0]   ivDataIn ;
wire   qWFull ;
wire  [pDepthWidth:0]   qvWCount ;
wire   iRClk ;
wire   iREn ;
wire  [pWordWidth-1:0]   ovDataOut ;
wire   qREmpty ;
wire  [pDepthWidth:0]   qvRNumberLeft ;

wire  MemWEn;
wire  [pDepthWidth-1:0] vWriteAddr ;
wire  [pDepthWidth-1:0] vReadAddr ;
wire   [pWordWidth-1:0] MemDataOut ;

DualPortRAM_ASYN #( pDepthWidth, pWordWidth ) Fifo_Storage
   (
      // Generic synchronous two-port RAM interface
      .WriteClock    ( iWClk ),
      .MemWEn        ( MemWEn ),
      .MemWAddr      ( vWriteAddr ),
      .MemDataIn     ( ivDataIn ),
      .ReadClock     ( iRClk ),
      .MemRAddr      ( vReadAddr ),
      .MemDataOut    ( MemDataOut )
    );

FifoControl_ASYN #( pDepthWidth, pWordWidth ) Fifo_Controller
   (
      .inReset       ( inReset ) ,
      .WriteClock    ( iWClk ) ,
      .iWEn          ( iWEn ) ,
      .MemWEn        ( MemWEn ) ,
      .vWAddr        ( vWriteAddr ) ,
      .qWFull        ( qWFull ) , 
      .qvWCount      ( qvWCount ) ,
      .ReadClock     ( iRClk ) ,
      .iREn          ( iREn ) ,
      .vRAddr        ( vReadAddr ) ,
      .qREmpty       ( qREmpty ) , 
      .MemDataOut    ( MemDataOut ),
      .qvDataOut     ( ovDataOut ),
      .qvRNumberLeft ( qvRNumberLeft )
   ) ;

endmodule

module FifoControl_ASYN
(
   inReset ,
   WriteClock ,
   iWEn ,
   MemWEn ,
   vWAddr ,
   qWFull , 
   qvWCount ,
   ReadClock ,
   iREn ,
   vRAddr ,
   qREmpty , 
   MemDataOut , 
   qvDataOut , 
   qvRNumberLeft
);

// Default address and data width
parameter   pDepthWidth = 5 ;
parameter   pWordWidth = 16 ;

input  inReset ;
input  WriteClock ;
input  iWEn ;
output  MemWEn ;
output  [pDepthWidth-1:0] vWAddr ;
output  qWFull ;
output  [pDepthWidth:0] qvWCount ;
input   ReadClock ;
input   iREn ;
output  [pDepthWidth-1:0] vRAddr ;
output  qREmpty ; 
input   [pWordWidth-1:0]  MemDataOut ;
output  [pWordWidth-1:0]  qvDataOut ;
output  [pDepthWidth:0]   qvRNumberLeft ;

wire  inReset ;
wire  WriteClock ;
wire  iWEn ;
wire  MemWEn ;
wire  [pDepthWidth-1:0] vWAddr ;
reg   qWFull ;
reg   [pDepthWidth:0]   qvWCount ;
wire  ReadClock ;
wire  iREn ;
wire  [pDepthWidth-1:0] vRAddr ;
reg   qREmpty ; 
wire  [pWordWidth-1:0]  MemDataOut ;
reg   [pWordWidth-1:0]  qvDataOut ;
reg   [pDepthWidth:0]   qvRNumberLeft ;

// internal variables
   // write clock domain
reg  [pDepthWidth:0] qvWAddr ;
reg  [pDepthWidth:0] qvNextWAddr ;
reg  [pDepthWidth:0] qvPreWGrayAddr ;
reg  [pDepthWidth:0] qvWGrayAddr ;
reg  [pDepthWidth:0] qvRGrayAddr_WSync1 ;
reg  [pDepthWidth:0] qvRGrayAddr_WSync2 ;
reg  [pDepthWidth:0] qvRAddr_WSync2 ;
   // read clock domain
reg  [pDepthWidth:0] qvRAddr ;
reg  [pDepthWidth:0] qvNextRAddr ;
reg  [pDepthWidth:0] qvRGrayAddr ;
reg  [pDepthWidth:0] qvPreWGrayAddr_RSync1 ;
reg  [pDepthWidth:0] qvPreWGrayAddr_RSync2 ;
reg  [pDepthWidth:0] qvPreWAddr_RSync2 ;
reg  [pDepthWidth:0] qvWGrayAddr_RSync1 ;
reg  [pDepthWidth:0] qvWGrayAddr_RSync2 ;
reg  [pDepthWidth:0] qvPointerForNumLeft ;
reg  [pDepthWidth:0] qvNextPointerForNumLeft ;

reg   qREmpty_int ;
wire  MemREn ;

assign MemREn = !qREmpty_int && ( qREmpty || iREn ) ;
assign MemWEn = iWEn && ( !qWFull ) ;
assign vWAddr = qvWAddr[pDepthWidth-1:0] ;
assign vRAddr = MemREn ? qvNextRAddr[pDepthWidth-1:0] : qvRAddr[pDepthWidth-1:0] ;

// logic
integer i;

// write clock domain
   // write address
always @ ( negedge inReset or posedge WriteClock )
begin
   if( !inReset ) begin
      qvWAddr <= 1 ;
      qvNextWAddr <= 2 ;
      qvPreWGrayAddr <= 0 ;
      qvWGrayAddr <= 1 ;
   end
   else  if( MemWEn )   begin
      qvWAddr <= qvNextWAddr ;
      qvNextWAddr <= qvNextWAddr + 1'b1 ;
      qvPreWGrayAddr <= qvWGrayAddr ;
      qvWGrayAddr <= ( qvNextWAddr >> 1 ) ^ qvNextWAddr ;
//      qvPreWGrayAddr <= ( qvWAddr >> 1 ) ^ qvWAddr ;
   end
end
   // re-synchronize the read addresses within write clock domain
      // the 1st synchronizing cycle
always @ ( negedge inReset or posedge WriteClock )  begin
   if( !inReset ) begin
      qvRGrayAddr_WSync1 <= 1 ;
   end
   else  begin
      qvRGrayAddr_WSync1 <= qvRGrayAddr ;
   end
end
      // the 2nd synchronizing cycle
always @ ( negedge inReset or posedge WriteClock )  begin
   if( !inReset ) begin   
      qvRGrayAddr_WSync2 <= 1 ;
   end
   else  begin
      qvRGrayAddr_WSync2 <= qvRGrayAddr_WSync1 ;
   end
end

   //   to calculate the read address in write clock domain
always @ ( negedge inReset or posedge WriteClock )  begin   // 1 cycle delay will be added
   if( !inReset ) begin   
      qvRAddr_WSync2 <= 1 ;
   end
   else  begin
      for( i=0; i<=pDepthWidth; i=i+1 )
         qvRAddr_WSync2[i] <= ^( qvRGrayAddr_WSync2 >>i ) ;   // Gray To Binary Conversion
   end
end

//always @ ( qvRGrayAddr_WSync2 )   // Gray To Binary Conversion
//   for( i=0; i<=pDepthWidth; i=i+1 )
//      qvRAddr_WSync2[i] = ^( qvRGrayAddr_WSync2 >>i ) ;

   // calculates qvWCount 
always @ ( negedge inReset or posedge WriteClock )  begin
   if( !inReset ) begin   
      qvWCount <= 0 ;
   end
   else  begin
      if( MemWEn )
         qvWCount <= qvNextWAddr - qvRAddr_WSync2 ;
      else
         qvWCount <= qvWAddr - qvRAddr_WSync2 ; 
   end            
end

   // generates qWFull
always @ ( qvWCount[pDepthWidth] )
   qWFull <= qvWCount[pDepthWidth] ;

// read clock domain
   // read address
always @ ( negedge inReset or posedge ReadClock )
begin
   if( !inReset ) begin
      qvRAddr <= 1 ;
      qvNextRAddr <= 2 ;
      qvRGrayAddr <= 1 ;
      qvPointerForNumLeft <= { 1'b1, {pDepthWidth{1'b0}} } ;
      qvNextPointerForNumLeft <= { 1'b1, {(pDepthWidth-1){1'b0}}, 1'b1 } ;
   end
   else  if( MemREn )   begin
      qvRAddr <= qvNextRAddr ;
      qvNextRAddr <= qvNextRAddr + 1'b1 ;
      qvRGrayAddr <= ( qvNextRAddr >> 1 ) ^ qvNextRAddr ;
      qvNextPointerForNumLeft <= qvNextPointerForNumLeft + 1'b1 ;
      qvPointerForNumLeft <= qvNextPointerForNumLeft ;
//      qvPointerForNumLeft <= qvPointerForNumLeft + 1'b1 ;
    end
end
   // re-synchronize the write addresses within read clock domain
      // the 1st synchronizing cycle
always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qvPreWGrayAddr_RSync1 <= 0 ;
      qvWGrayAddr_RSync1 <= 1 ;
   end
   else  begin
      qvPreWGrayAddr_RSync1 <= qvPreWGrayAddr ;
      qvWGrayAddr_RSync1 <= qvWGrayAddr ;
   end
end
      // the 2nd synchronizing cycle
always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qvPreWGrayAddr_RSync2 <= 0 ;
      qvWGrayAddr_RSync2 <= 1 ;
   end
   else  begin
      qvPreWGrayAddr_RSync2 <= qvPreWGrayAddr_RSync1 ;
      qvWGrayAddr_RSync2 <= qvWGrayAddr_RSync1 ;
   end
end

   //   to calculate the write address in read clock domain
always @ ( negedge inReset or posedge ReadClock )  begin   // 1 cycle delay will be added
   if( !inReset ) begin   
      qvPreWAddr_RSync2 <= 0 ;
   end
   else  begin
      for( i=0; i<=pDepthWidth; i=i+1 )
         qvPreWAddr_RSync2[i] <= ^( qvPreWGrayAddr_RSync2 >>i ) ;   // Gray To Binary Conversion
   end
end
//always @ ( qvPreWGrayAddr_RSync2 )   // Gray To Binary Conversion
//   for( i=0; i<=pDepthWidth; i=i+1 )
//      qvWAddr_RSync2[i] <= ^( qvPreWGrayAddr_RSync2 >>i ) ;   // Gray To Binary Conversion

   // calculates qvRNumberLeft
reg  [pDepthWidth:0] qvRNumberLeft_int ;
always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qvRNumberLeft_int <= { 1'b1, {pDepthWidth{1'b0}} } ;
   end
   else  begin
      if( MemREn )
         qvRNumberLeft_int <= qvNextPointerForNumLeft - qvPreWAddr_RSync2 ;
      else
         qvRNumberLeft_int <= qvPointerForNumLeft - qvPreWAddr_RSync2 ; 
   end            
end

always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qvRNumberLeft <= { 1'b1, {pDepthWidth{1'b0}} } ;
   end
   else  begin
      if( qvRNumberLeft_int >= 4 )  qvRNumberLeft <= qvRNumberLeft_int - 4 ; 
      else  qvRNumberLeft <= 0 ; 
   end            
end

   // generates qREmpty_int
always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qREmpty_int <= 1 ;
   end
   else  begin
      if( ~qREmpty_int ) begin
         if( MemREn && ( qvRGrayAddr == qvPreWGrayAddr_RSync2 ) )
            qREmpty_int <= 1 ;
      end
       else  begin
          if( qvRGrayAddr != qvWGrayAddr_RSync2 )
             qREmpty_int <= 0 ; 
      end
   end            
end

//always @ ( qvRNumberLeft_int[pDepthWidth] )
//   qREmpty_int <= qvRNumberLeft_int[pDepthWidth] ;

always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qREmpty <= 1'b1 ;
   end
   else  begin
      if( qREmpty )  begin
         if( !qREmpty_int )   qREmpty <= 1'b0 ; 
      end 
      else
         if( qREmpty_int && iREn )   qREmpty <= 1'b1 ; 
   end            
end

always @ ( negedge inReset or posedge ReadClock )  begin
   if( !inReset ) begin   
      qvDataOut <= {pWordWidth{1'b0}} ;
   end
   else  begin
      if( MemREn )  begin
         qvDataOut <= MemDataOut ;
      end 
   end            
end

endmodule
 

module DualPortRAM_ASYN
   (
      // Generic synchronous two-port RAM interface
   WriteClock ,
   MemWEn ,
   MemWAddr ,
   MemDataIn ,
   ReadClock ,
   MemRAddr ,
   MemDataOut 
    );

// Default address and data width
parameter   pDepthWidth = 5 ;                      
parameter   pWordWidth = 16 ;                      

// Generic synchronous two-port RAM interface
input WriteClock ;
input MemWEn ;
input MemWAddr ;
input MemDataIn ;
input ReadClock ;
input  [pDepthWidth-1:0] MemRAddr ;
output  [pWordWidth-1:0] MemDataOut ;

wire  WriteClock ;
wire  MemWEn ;
wire  [pDepthWidth-1:0] MemWAddr ;
wire  [pWordWidth-1:0] MemDataIn ;
wire  ReadClock ;
wire  [pDepthWidth-1:0] MemRAddr ;
wire  [pWordWidth-1:0] MemDataOut ;

reg   [pWordWidth-1:0]  mem [(1<<pDepthWidth)-1:0] /*synthesis syn_ramstyle="no_rw_check"*/; 

// RAM read and write
// a port for write
always @ ( posedge WriteClock )
   if( MemWEn )
      mem[MemWAddr] <= MemDataIn ;

// RAM read and write
//b for read

/* registered address */
reg   [pDepthWidth-1:0] qvRAddr ;
always @ ( posedge ReadClock )
   qvRAddr <= MemRAddr ;   

assign MemDataOut = mem[qvRAddr] ;

endmodule 
//
// Module SwitchSyncFIFO
//
// the differences between this FIFO and the general one are listed below
//    1. because there is no any write and read acknowledgements, the user should take advantage of the status flags to generate the write and read requests.
//    2. after the full flag has been asserted, the word can not be written into the FIFO even if the reacd request is being asserted at the same cycle.
//
// Created:
//          by - Xinchun Liu
//          at - 2006-09-25
// History: 
//			2007-1-31 9:50		change iReset to nReset  Revised  By Wang Dawei wangdawei@ncic.ac.cn
//
`resetall
`timescale 1ns/10ps

module SwitchSyncFIFO (
	nReset,
	iClk,
	iWEn,
	ivDataIn,
	iREn,
	ovDataOut,
	qEmpty,
	qFull,
	qvCount
);

// Default address and data width
parameter   pDepthWidth = 5 ;                      
parameter   pWordWidth = 16 ;                      

input	nReset ;
input	iClk ;
input iWEn ;
input [pWordWidth-1:0]	ivDataIn ;
input	iREn ;
output   [pWordWidth-1:0]	ovDataOut ;
output   qEmpty ;
output	qFull ;
output   [pDepthWidth:0]	qvCount ;

wire	nReset ;
wire	iClk ;
wire	iWEn ;
wire  [pWordWidth-1:0]	ivDataIn ;
wire	iREn ;
wire  [pWordWidth-1:0]	ovDataOut_i ;
wire	qEmpty ;
wire	qFull ;
wire  [pDepthWidth:0]	qvCount ;

wire  MemWEn;
wire  MemREn;
wire  [pDepthWidth-1:0] vWriteAddr ;
wire  [pDepthWidth-1:0] vReadAddr ;

DualPortRAM #( pDepthWidth, pWordWidth )   Fifo_Storage                 	// Generic synchronous two-port RAM interface
   (
      .clock   ( iClk ) ,
      .MemWEn   ( MemWEn ) ,
      .qvWAddr   ( vWriteAddr ) ,
      .vDataIn		( ivDataIn ) ,
      .qvRAddr		( vReadAddr ) ,
      .vDataOut		( ovDataOut_i	)
   );


reg  [pWordWidth-1:0]	ovDataOut ;

always @ ( posedge iClk )
   if ( MemREn )
       ovDataOut <= ovDataOut_i ;
   else
       ovDataOut <= 0;
       
FifoControl #( pDepthWidth ) Fifo_Ctrl
   (
      .Reset   ( nReset ) ,
      .clock   ( iClk ) ,
      .iWEn   ( iWEn ) ,
      .MemWEn   ( MemWEn ) ,
      .MemREn   (MemREn),
      .qvWAddr   ( vWriteAddr ) ,
      .iREn		( iREn ) ,
      .qvRAddr   ( vReadAddr ) ,
      .qEmpty  ( qEmpty ) , 
      .qFull   ( qFull ) , 
      .qvCount ( qvCount )
   ) ;

endmodule
 
module FifoControl(
      Reset ,
      clock ,
      iWEn ,
      MemWEn ,
      MemREn,
      qvWAddr ,
      iREn ,
      qvRAddr ,
      qEmpty , 
      qFull , 
      qvCount
   ) ;

parameter   pDepthWidth = 5;		

input  Reset ;
input  clock ;
input  iWEn ;
output  MemWEn ;
output  MemREn ;
output  [pDepthWidth-1:0] qvWAddr ;
input  iREn ;
output  [pDepthWidth-1:0] qvRAddr ;
output  qEmpty ; 
output  qFull ;
output  [pDepthWidth:0] qvCount ;

wire  Reset ;
wire  clock ;
wire  iWEn ;
wire  MemWEn ;
reg  [pDepthWidth-1:0] qvWAddr ;
wire  iREn ;
reg  [pDepthWidth-1:0] qvRAddr ;
reg  qEmpty ; 
reg  qFull ;
reg  [pDepthWidth:0] qvCount ;

wire  MemREn ;

// write allow wire - writes are allowed when fifo is not full
// read  allow wire - reads  are allowed when fifo is not empty
assign MemWEn = iWEn && ( ~qFull ) ;
assign MemREn = iREn && ( ~qEmpty ) ;

// write address module
always @ ( posedge clock or negedge Reset) begin 
   if( ~Reset ) begin
  	 	qvWAddr <= 0 ;
	end
   else  begin
		if( MemWEn )   qvWAddr <= qvWAddr + 1'b1 ;
	end
end

// read address module
always @ ( posedge clock or negedge Reset) begin 
   if( ~Reset ) begin
  	 	qvRAddr <= 0 ;
	end
   else  begin
		if( MemREn )   qvRAddr <= qvRAddr + 1'b1 ;
	end
end

// flags module
always @ ( posedge clock or negedge Reset) begin 
   if( ~Reset ) begin
		qFull  <= 0 ;
		qEmpty   <= 1 ; 
		qvCount   <= 0 ; 
	end
   else  begin
		if( MemWEn )   begin
			if( qEmpty )   qEmpty <= 0 ;
			if ( ~MemREn ) begin
			   qvCount <= qvCount + 1'b1 ;
			   if( qvCount[pDepthWidth-1:0] == { pDepthWidth{1'b1} } )
			      qFull <= 1 ;
			end
		end
		else  begin
		   if( MemREn ) begin
		      qvCount <= qvCount - 1'b1 ;
				if( qvCount == 1'b1 )  qEmpty <= 1;
				if( qFull ) qFull <= 0;
			end
		end
	end
end

endmodule

//=============================================================================================================
 
module DualPortRAM
   (
      clock ,
      MemWEn ,
      qvWAddr ,
      vDataIn ,
      qvRAddr ,
      vDataOut
	);

// Default address and data width
parameter   pDepthWidth = 5 ;                      
parameter   pWordWidth = 16 ;                      

// Generic synchronous two-port RAM interface
input clock ;		// clock
input MemWEn ;	// write enable input
input [pDepthWidth-1:0] qvWAddr ;	// write address bus
input [pWordWidth-1:0]  vDataIn ;	// input data bus
input [pDepthWidth-1:0] qvRAddr ;	// read address bus
output   [pWordWidth-1:0]  vDataOut ;	// output data bus


// Generic two-port synchronous RAM model

// Generic RAM's registers and wires
reg   [pWordWidth-1:0]  mem[(1<<pDepthWidth)-1:0] /*synthesis syn_ramstyle="no_rw_check"*/; 

always @ ( posedge clock )
   if ( MemWEn )
		mem[qvWAddr] <= vDataIn ;

assign vDataOut = mem[qvRAddr] ;

endmodule 


///**********************************************************************
//						 FIFO						
///**********************************************************************//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: timescale.v                                     ////
////                                                              ////
//// DESCRIPTION:                                                 ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.1.1.1  2006/05/31 05:59:43  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////
`timescale 100ps / 10ps
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// MODULE NAME: definition of parameters                        ////
////                                                              ////
//// DESCRIPTION:                                                 ////
////                                                              ////
////                                                              ////
//// This file is part of the 10 Gigabit Ethernet IP core project ////
////  http://www.opencores.org/projects/ethmac10g/                ////
////                                                              ////
//// AUTHOR(S):                                                   ////
//// Zheng Cao                                                    ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (c) 2005 AUTHORS.  All rights reserved.            ////
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
// CVS REVISION HISTORY:
//
// $Log: not supported by cvs2svn $
// Revision 1.2  2006/06/16 06:36:28  fisher5090
// no message
//
// Revision 1.1.1.1  2006/05/31 05:59:44  Zheng Cao
// first version
//
// Revision 1.1  2005/12/25 16:43:10  Zheng Cao
// 
// 
//
//////////////////////////////////////////////////////////////////////

`define ALLONES 64'hffffffffffffffff
`define ALLONES8 8'hff
`define ALLZEROS   8'h00

///////////////////////////////////////////////
// Length parameters
///////////////////////////////////////////////
`define MAX_VALID_LENGTH 12'h0be
`define MAX_VALID_BITS_MORE 3'h6
`define MAX_TAG_LENGTH 12'h0bf
`define MAX_TAG_BITS_MORE 3'h2
`define MAX_JUMBO_LENGTH 12'h466
`define MIN_VALID_LENGTH 8'h08
///////////////////////////////////////////////
// Frame field parameters
///////////////////////////////////////////////
`define PREAMBLE 8'h55
`define START      8'hfb
`define TERMINATE  8'hfd 	
`define SFD        8'hd5
`define SEQUENCE   8'h9a
`define ERROR      8'hfe
`define IDLE       8'h07
`define TAG_SIGN   16'h0081//8100
`define PAUSE_SIGN 32'h01000888//8808

`define MULTICAST  48'h0180C2000001
`define BROADCAST  48'hffffffffffff
////////////////////////////////////////////////
// Frame bytes counter parameter
//////////////////////////////////////////////// 
`define COUNTER_WIDTH 12
