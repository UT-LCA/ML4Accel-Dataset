module ack_counter (
clock , // 156 MHz clock
reset , // active high, asynchronous Reset input
ready,
tx_start , // Active high tx_start signal for counter
max_count, //16 bit reg for the maximum count to generate the ack signal
tx_ack	// Active high signal
);

// Ports declaration
input clock;
input reset;
input ready;
input tx_start;
input [15:0] max_count;

output tx_ack;

// Wire connections
//Input
wire clock;
wire reset;
wire ready;
wire tx_start;
wire [15:0] max_count;

//Output
reg tx_ack;



//Internal wires
reg start_count;
reg start_count_del;
reg [15:0] counter;


always @ (reset or tx_start or counter or max_count)
begin 

  if (reset) begin
    start_count <= 0;
  end

  else if (tx_start) begin
    start_count <= 1;
  end

  else if ((counter == max_count) & !ready) begin  //& !ready
    start_count <= 0;
  end

end 


always @ (posedge clock or posedge reset)
begin 

  if (reset) begin
    counter <= 0;
  end
  
  else if (counter == max_count) begin
    counter <= 0;
  end

  else if (start_count) begin
    counter <= counter + 1;
  end

end 


always @ (posedge clock or posedge reset)
begin 

  if (reset) begin
    start_count_del <= 0;
    tx_ack <= 0;
  end
  else begin
    start_count_del <= start_count;
    tx_ack <= ~start_count & start_count_del;
  end

end 

endmodule // End of Module 

module byte_count_module(CLK, RESET, START, BYTE_COUNTER);

// Ports declaration
input CLK;
input RESET;
input START;



output [15:0] BYTE_COUNTER;

reg [15:0] BYTE_COUNTER;
reg [15:0] counter;

always @(posedge CLK or posedge RESET)
begin
   if (RESET == 1) begin
	   counter = 16'h0000;
   end
   // the ack is delayed which starts the counter
   else if (START == 1) begin
       counter = counter + 8;
   end
end

always @(posedge CLK)
begin
   BYTE_COUNTER = counter;
end

endmodule // End of Module 

module CRC32_D64(DATA_IN, CLK, RESET, START, CRC_OUT);

  input [63:0] DATA_IN;
  input CLK;	
  input RESET;
  input START;
  output [31:0] CRC_OUT;
  
//  reg [31:0] CRC_FB;
  reg [31:0] CRC_OUT;
  reg [31:0] CRC_REG;

reg start_int;
reg startCRC;
wire [63:0] data_del;


assign   data_del = {DATA_IN[0],DATA_IN[1],DATA_IN[2],DATA_IN[3],DATA_IN[4],DATA_IN[5],DATA_IN[6],DATA_IN[7],
              DATA_IN[8],DATA_IN[9],DATA_IN[10],DATA_IN[11],DATA_IN[12],DATA_IN[13],DATA_IN[14],DATA_IN[15],
              DATA_IN[16],DATA_IN[17],DATA_IN[18],DATA_IN[19],DATA_IN[20],DATA_IN[21],DATA_IN[22],DATA_IN[23],
              DATA_IN[24],DATA_IN[25],DATA_IN[26],DATA_IN[27],DATA_IN[28],DATA_IN[29],DATA_IN[30],DATA_IN[31],
              DATA_IN[32],DATA_IN[33],DATA_IN[34],DATA_IN[35],DATA_IN[36],DATA_IN[37],DATA_IN[38],DATA_IN[39],
              DATA_IN[40],DATA_IN[41],DATA_IN[42],DATA_IN[43],DATA_IN[44],DATA_IN[45],DATA_IN[46],DATA_IN[47],
              DATA_IN[48],DATA_IN[49],DATA_IN[50],DATA_IN[51],DATA_IN[52],DATA_IN[53],DATA_IN[54],DATA_IN[55],
              DATA_IN[56],DATA_IN[57],DATA_IN[58],DATA_IN[59],DATA_IN[60],DATA_IN[61],DATA_IN[62],DATA_IN[63]}; 

//assign   data_del = 64'h1000000000000000;

always @(START)
begin
   startCRC <= START; 
end

always @(posedge CLK or posedge RESET)
  begin
    if (RESET) begin
        CRC_OUT <= 0;
        CRC_REG <= 0;
    end
    
    else if (startCRC == 1) begin 
		    CRC_OUT <= nextCRC32_D64(data_del, CRC_OUT);
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

module CRC32_D8(DATA_IN, CLK, RESET, START, LOAD, CRC_IN, CRC_OUT);

  input [7:0] DATA_IN;
  input CLK;	
  input RESET;
  input START;
  input LOAD; 
  input [31:0] CRC_IN;
  output [31:0] CRC_OUT;

  reg [31:0] CRC_OUT;
  reg start_int;
  reg [7:0] data_int;
  
always @(posedge CLK)
begin
  start_int <= START;
  data_int <= DATA_IN;
end

always @(posedge CLK or posedge RESET)
  begin
    if (RESET) begin
        CRC_OUT = 0;
    end
    else if (start_int == 1) begin
        CRC_OUT = nextCRC32_D8(data_int, CRC_OUT);
    end 
    else if (LOAD == 1) begin
        CRC_OUT = CRC_IN;
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
    NewCRC[3] = D[7] ^ D[6] ^ D[3] ^ D[2] ^ D[1] ^ D[0] ^ C[24] ^ C[25] ^ 
                C[26] ^ C[27] ^ C[30] ^ C[31];
    NewCRC[4] = D[7] ^ D[6] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0] ^ C[24] ^ 
                C[25] ^ C[26] ^ C[27] ^ C[28] ^ C[30] ^ C[31];
    NewCRC[5] = D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0] ^ 
                C[24] ^ C[25] ^ C[26] ^ C[27] ^ C[28] ^ C[29] ^ C[30] ^ 
                C[31];
    NewCRC[6] = D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ C[25] ^ 
                C[26] ^ C[27] ^ C[28] ^ C[29] ^ C[30] ^ C[31];
    NewCRC[7] = D[7] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[0] ^ C[24] ^ C[26] ^ 
                C[27] ^ C[28] ^ C[29] ^ C[31];
    NewCRC[8] = D[5] ^ D[4] ^ D[3] ^ D[1] ^ D[0] ^ C[0] ^ C[24] ^ C[25] ^ 
                C[27] ^ C[28] ^ C[29];
    NewCRC[9] = D[6] ^ D[5] ^ D[4] ^ D[2] ^ D[1] ^ C[1] ^ C[25] ^ C[26] ^ 
                C[28] ^ C[29] ^ C[30];
    NewCRC[10] = D[7] ^ D[5] ^ D[3] ^ D[2] ^ D[0] ^ C[2] ^ C[24] ^ C[26] ^ 
                 C[27] ^ C[29] ^ C[31];
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

/////////////////////////////////////////////////////////////////////////////
//
//		Name of module 
//              23/1/06 - So far Mentor Precision indicates the current system runs as 101 MHz.
//
/////////////////////////////////////////////////////////////////////////////
module TRANSMIT_TOP(
TX_DATA, 
TX_DATA_VALID, 
TX_CLK, 
RESET, 
TX_START, 
TX_ACK, 
TX_UNDERRUN, 
TX_IFG_DELAY,
RXTXLINKFAULT, 
LOCALLINKFAULT,
TX_STATS_VALID,
TXSTATREGPLUS,
TXD, 
TXC, 
FC_TRANS_PAUSEDATA, 
FC_TRANS_PAUSEVAL, 
FC_TX_PAUSEDATA,
FC_TX_PAUSEVALID,
TX_CFG_REG_VALUE,
TX_CFG_REG_VALID
);


/////////////////////////////////////////////////////////////////////////////
//
//		Input and output ports definitions
//
/////////////////////////////////////////////////////////////////////////////

//Input from user logic
input [63:0] TX_DATA;
input [7:0] TX_DATA_VALID; // To accept the data valid to be available
input TX_CLK;
input RESET;
input TX_START; // This signify the first frame of data
input TX_UNDERRUN; // this will cause an error to be injected into the data
input [7:0] TX_IFG_DELAY; // this will cause a delay in the ack signal

//input to transmit fault signals
input RXTXLINKFAULT;
input LOCALLINKFAULT;

input [31:0] TX_CFG_REG_VALUE;
input TX_CFG_REG_VALID;

//output to stat register
output TX_STATS_VALID;
output [24:0] TXSTATREGPLUS; // a pulse for each reg for stats

//output to user logic
output TX_ACK; //Generated by a counter

//output to XGMII
output [63:0] TXD;
output [7:0] TXC;

//output [15:0] BYTE_COUNTER_OUT;

//Pause inputs
//Transmit pause frames
input [15:0] FC_TRANS_PAUSEDATA; //pause frame data
input FC_TRANS_PAUSEVAL; //pulse signal to indicate a pause frame to be sent

//apply pause timing
input [15:0] FC_TX_PAUSEDATA;
input FC_TX_PAUSEVALID;



/////////////////////////////////////////////////////////////////////////////
//
//		Definitions and parameters
//
/////////////////////////////////////////////////////////////////////////////

//possibility to put this in a package.

//opcode definitions
parameter PAUSE_OPCODE = 16'b1000100000001000; //8808
parameter  VLAN_OPCODE = 16'b1000000100000000; //8100

//frame size definitions
parameter VLAN_FRAME_SIZE = 16'b0000010111110010;//1522 bytes
parameter JUMBO_FRAME_SIZE = 16'b0010001100101000;//9000 bytes
parameter NORMAL_FRAME_SIZE = 16'b0000010111101110;//1518 bytes
parameter MIN_FRAME_SIZE = 16'b0000000000111100; //60 bytes


//Frame definition
parameter IDLE_FRAME = 8'b00000111; //only six preambles as the first preamble is converted into a start flag
parameter IDLE_FRAME_8BYTES = 64'b0000011100000111000001110000011100000111000001110000011100000111;
parameter START_SEQ = 64'b1010101110101010101010101010101010101010101010101010101011111011;
parameter LOCAL_FAULT_SEQ = 64'b0000000100000000000000000000000000000001000000000000000000000000;
parameter REMOTE_FAULT_SEQ = 64'b0000001000000000000000000000000000000010000000000000000000000000;
parameter START_FRAME = 8'b11111011; //only valid in frame 0
parameter TERMINATE_FRAME = 8'b11111101;
parameter SFD_FRAME = 8'b10101011;
parameter PREAMBLE_FRAME = 8'b10101010;
parameter ERROR_FRAME = 8'b11111110;


parameter SOURCE_ADDR = 48'h010101010101;
parameter DEST_ADDR = 48'h101010101010;

parameter PAUSE_FRAME_LENGTH = 8'h02;


//need a parameter for min frame gap.

//Link fault signalling
// send lane 0


/////////////////////////////////////////////////////////////////////////////
//
//		Registers and wires
//
/////////////////////////////////////////////////////////////////////////////




wire  TX_ACK;

reg  [24:0] TXSTATREGPLUS;

reg  TX_STATS_VALID;

reg FRAME_START;

wire reset_int;

reg [15:0] DELAY_ACK;

reg [7:0] TX_DATA_VALID_REG;
reg [7:0] TX_DATA_VALID_DEL1;
reg [7:0] TX_DATA_VALID_DEL2;
reg [7:0] TX_DATA_VALID_DEL3;
reg [7:0] TX_DATA_VALID_DEL4;
reg [7:0] TX_DATA_VALID_DEL5;
reg [7:0] TX_DATA_VALID_DEL6;
reg [7:0] TX_DATA_VALID_DEL7;
reg [7:0] TX_DATA_VALID_DEL8;
reg [7:0] TX_DATA_VALID_DEL9;
reg [7:0] TX_DATA_VALID_DEL10;
reg [7:0] TX_DATA_VALID_DEL11;
reg [7:0] TX_DATA_VALID_DEL12;
reg [7:0] TX_DATA_VALID_DEL13;
reg [7:0] TX_DATA_VALID_DEL14;
reg [7:0] TX_DATA_VALID_DEL15;

reg [63:0] TX_DATA_DEL1;
reg [63:0] TX_DATA_DEL2;
reg [63:0] TX_DATA_DEL3;
reg [63:0] TX_DATA_DEL4;
reg [63:0] TX_DATA_DEL5;
reg [63:0] TX_DATA_DEL6;
reg [63:0] TX_DATA_DEL7;
reg [63:0] TX_DATA_DEL8;
reg [63:0] TX_DATA_DEL9;
reg [63:0] TX_DATA_DEL10;
reg [63:0] TX_DATA_DEL11;
reg [63:0] TX_DATA_DEL12;
reg [63:0] TX_DATA_DEL13;
reg [63:0] TX_DATA_DEL14;
reg [63:0] TX_DATA_DEL15;

reg [7:0] OVERFLOW_VALID;
reg [63:0] OVERFLOW_DATA;

reg [63:0] TXD;
reg [7:0] TXC;

reg [63:0] TX_DATA_REG, TX_DATA_VALID_DELAY;

wire [31:0] CRC_32_64;

wire [15:0] BYTE_COUNTER;

reg frame_start_del;

reg transmit_pause_frame_del, transmit_pause_frame_del2, transmit_pause_frame, append_start_pause, append_start_pause_del , transmit_pause_frame_valid, reset_err_pause, load_CRC8, transmit_pause_frame_del3;

reg [7:0] tx_data_int;
reg start_CRC8, START_CRC8_DEL;
reg append_end_frame;


reg insert_error;

reg [7:0] store_tx_data_valid;
reg [63:0] store_tx_data;
reg [31:0] store_CRC64;
reg [7:0] store_valid;
reg load_final_CRC;

reg [15:0] final_byte_count, byte_count_reg;

wire [31:0] CRC_OUT;

reg [9:0] append_reg;


reg [15:0] length_register;

reg tx_undderrun_int;

reg [15:0] MAX_FRAME_SIZE;

reg vlan_enabled_int;
reg jumbo_enabled_int;
reg tx_enabled_int;
reg fcs_enabled_int;
reg reset_tx_int;
reg read_ifg_int;

reg apply_pause_delay;
reg [15:0] store_pause_frame;

reg [63:0] TXD_PAUSE_DEL0;
reg [63:0] TXD_PAUSE_DEL1;
reg [63:0] TXD_PAUSE_DEL2;

reg [7:0] TXC_PAUSE_DEL0;
reg [7:0] TXC_PAUSE_DEL1;
reg [7:0] TXC_PAUSE_DEL2;

reg PAUSEVAL_DEL;
reg PAUSEVAL_DEL1;
reg PAUSEVAL_DEL2;
wire RESET_ERR_PAUSE;

reg set_pause_stats;
reg [15:0] store_transmit_pause_value;
reg [3:0] pause_frame_counter;
reg [63:0] shift_pause_data;

reg [7:0] shift_pause_valid;
reg [7:0] shift_pause_valid_del;

reg [14:0] byte_count_stat;

reg [24:0] txstatplus_int;


/////////////////////////////////////////////////////////////////////////////
//
//		Start of code
//
/////////////////////////////////////////////////////////////////////////////




//TODO

//RX side. need to be able to receive data and calculate the CRC switching between 64 and 8 bit datapath.
//Therefore, the data need to be counted correctly.
//ERROR checking module or process will be needed. This will check if frame is correct length.
//Need to be able to remove redundant frames or columns and also padding. The error module will
//also check the tx_underrun signal as well.

//need to be able to cut-off bytes. 

//Need to add the link fault signalling and config registers.


//TX side. need to be able to insert the CRC with the data.
//need to define the first column of txd which is START 6 PRE and SFD.
//need to be able invert data_valid for txc.
//need to be able to transmit IDLEs.


//Format of output
//IDLE 07, START FB TERMINATE FD SFD 10101011 PREAMBLE 10101010  ERROR FE.

//IDLE START PREAMBLE SFD DA SA L/T DATA TERMINATE IDLE








/////////////////////////////////////////////////////////////////////////////
//
//		Ack counter
//
/////////////////////////////////////////////////////////////////////////////


//Ack counter. need to be able to load the frame length, pause frame inter frame delay into the ack counter
// as this will delay the ack signal. The ack signal will initiate the rest of the data transmission from the
// user logic.

//need to stop the ack signal from transmitting when a PAUSE frame is transmitting

// Connect DUT to test bench 
ack_counter U_ACK_CNT(
.clock(TX_CLK),
.reset(reset_int | reset_tx_int),	
.ready(FRAME_START | transmit_pause_frame),
.tx_start(TX_START),
.max_count(DELAY_ACK),
.tx_ack(TX_ACK)
);

//CRC for 64 bit data
//This seem to be one of the culprit for the timing violation
CRC32_D64 U_CRC64(
.DATA_IN(TX_DATA_REG), //need to swap between pause data
.CLK(TX_CLK),	
.RESET(reset_int | TX_ACK | append_start_pause),
.START(frame_start_del | transmit_pause_frame_valid),
.CRC_OUT(CRC_32_64) //need to switch to output some how for a pause frame
);


//CRC for 8 bit data
CRC32_D8 U_CRC8(
.DATA_IN(tx_data_int), //8bit data
.CLK(TX_CLK),
.RESET(reset_int),
.START(start_CRC8),  //this signal will be use to start
.LOAD(load_CRC8), //use this to load first
.CRC_IN(CRC_32_64),
.CRC_OUT(CRC_OUT)
);


//The start signal need to be high for the count
//This seem to be one of the culprit for the timing violation
byte_count_module U_byte_count_module(
.CLK(TX_CLK),
.RESET(reset_int | TX_ACK),
.START(frame_start_del & FRAME_START),
.BYTE_COUNTER(BYTE_COUNTER)
);



/////////////////////////////////////////////////////////////////////////////
//
//	PAUSE FRAME
//
/////////////////////////////////////////////////////////////////////////////

always @(posedge TX_CLK)
begin
  PAUSEVAL_DEL <= FC_TRANS_PAUSEVAL;
  PAUSEVAL_DEL1 <= PAUSEVAL_DEL;
  PAUSEVAL_DEL2 <= PAUSEVAL_DEL1;
end

always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    transmit_pause_frame <= 0;
  end
  else if (PAUSEVAL_DEL2) begin
    transmit_pause_frame <= 1;
  end 
  else if (pause_frame_counter == 8) begin
    transmit_pause_frame <= 0;
  end 
end

always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    set_pause_stats <= 0;
  end
  else if (PAUSEVAL_DEL2) begin
    set_pause_stats <= 1;
  end
  else if (append_end_frame) begin
    set_pause_stats <= 0;
  end
end

always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    TXD_PAUSE_DEL0 <= 0;
    TXD_PAUSE_DEL1 <= 0;
    TXD_PAUSE_DEL2 <= 0;
    
    TXC_PAUSE_DEL0 <= 0;
    TXC_PAUSE_DEL1 <= 0;
    TXC_PAUSE_DEL2 <= 0;
    

    store_transmit_pause_value <= 0;
  end
  else if (FC_TRANS_PAUSEVAL) begin
    store_transmit_pause_value <= FC_TRANS_PAUSEDATA;
    TXD_PAUSE_DEL1 <= {DEST_ADDR, SOURCE_ADDR[47:32]};
    TXD_PAUSE_DEL2 <= {SOURCE_ADDR[31:0], PAUSE_FRAME_LENGTH, PAUSE_OPCODE, FC_TRANS_PAUSEDATA};

    TXC_PAUSE_DEL1 <= 8'hff;
    TXC_PAUSE_DEL2 <= 8'hff;
    
  end 
end


always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    pause_frame_counter <= 0;
  end
  else if (transmit_pause_frame & !FRAME_START) begin
    pause_frame_counter <= pause_frame_counter + 1;
  end 
end


always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    shift_pause_data <= 0;
    shift_pause_valid_del <= 0;
    shift_pause_valid <= 0;
  end
  else if (transmit_pause_frame & !FRAME_START) begin
    if (pause_frame_counter == 0) begin
      shift_pause_data <= TXD_PAUSE_DEL1;
    end
    else if (pause_frame_counter == 1) begin
      shift_pause_data <= TXD_PAUSE_DEL2;
    end
    else begin
      shift_pause_data <= 0;
    end 
    
    if (pause_frame_counter == 7) begin
      shift_pause_valid <= 8'h0f;
    end
    else if (pause_frame_counter < 7) begin
      shift_pause_valid <= 8'hff;
    end
    else begin
      shift_pause_valid <= 0;
    end 
    shift_pause_valid_del <= shift_pause_valid;
  end
  else begin
    shift_pause_data <= 0;
    shift_pause_valid <= 0;
    shift_pause_valid_del <= shift_pause_valid;
  end 
end




always @(posedge reset_int or posedge TX_CLK)
begin
  if (reset_int) begin
    FRAME_START <= 0;
  end
  else if (TX_ACK) begin
    FRAME_START <= 1;
  end
  else if ((TX_DATA_VALID_REG != 8'hff) & (BYTE_COUNTER != 0)) begin
    FRAME_START <= 0;
  end
end




assign reset_int = RESET;


//TXSTATREGPLUS[24:0]
//24 pause_frame transmitted - count when pause flag is set
//23 to 20 bytes valid
//19 vlan frame - asserted if previous frame was a VLAN - just check if VLAN been set
//18 to 5 last frame length count in bytes stick to 16383 when jumbo frame is greater than value - just load the byte count
//4 if last frame has control type code 88-08 in the length type field - pause frame - check if pause flag is set
//3 underrun frame - check if underrun is set
//2 multicast frame - 01-80-C2-00-00-01 use for pause frame
//1 broadcast frame - al ones  
//0 sucessful frame - check if error occurred -use insert error flag


//TX_STATS_VALID - need to be driving after a frame transmission - use load_overflow signal


always @(posedge TX_CLK or posedge reset_int)
begin 
  if (reset_int) begin
    txstatplus_int <= 0;
  end
  else if (load_final_CRC) begin
    if (insert_error) begin
      txstatplus_int[3] <= 1;
    end
    if (set_pause_stats) begin
      txstatplus_int[24] <= 1;
      txstatplus_int[4] <= 1;
      txstatplus_int[2] <= 1;
      txstatplus_int[1] <= 1;
      txstatplus_int[18:5] <= 512;
    end
    if (vlan_enabled_int) begin
      txstatplus_int[19] <= 1;
    end
    else begin
      if (final_byte_count[15] == 1) begin
        txstatplus_int[18:5] <= 16383;
      end
      else begin
        txstatplus_int[18:5] <= byte_count_stat;
      end
    end
  end
  else begin
    txstatplus_int <= 0;
  end
end

always @(posedge TX_CLK)
begin 
  TXSTATREGPLUS <= txstatplus_int;
  TX_STATS_VALID <= append_end_frame;
end


//input [31:0] TX_CFG_REG_VALUE;
//24:0 reserved
//25 default to 0 - min frame  - 1 adjust frame delay by reading inter-frame gap delay reg - DELAY_ACK signal
//26 WAN - not used
//27 VLAN enable default to 0, 1 enabled
//28 default to 1 - transmitter enbaled, 0 - transmitter disabled - possibly used to reset
//29 default to 0 FCS enabled, 1 FCS disabled
//30 default to 0,  1 - Jumbo frame enabled
//31 deafult to 0, 1 - reset transmitter

//input TX_CFG_REG_VALID;

always @(posedge TX_CLK or posedge reset_int)
begin 
  if (reset_int) begin
    vlan_enabled_int <= 0;
    jumbo_enabled_int <= 0;
    tx_enabled_int <= 0;
    fcs_enabled_int <= 1;
    reset_tx_int <= 0;
    read_ifg_int <= 0;
  end
  else if (TX_CFG_REG_VALID) begin
    vlan_enabled_int <= TX_CFG_REG_VALUE[27];
    jumbo_enabled_int <= TX_CFG_REG_VALUE[30];
    tx_enabled_int <= TX_CFG_REG_VALUE[28]; // Stop ack from generated, hold reset
    fcs_enabled_int <= TX_CFG_REG_VALUE[29];
    reset_tx_int <= TX_CFG_REG_VALUE[31]; 
    read_ifg_int <= TX_CFG_REG_VALUE[25];
  end
end


//Load the delay value for the acknowledge signal
always @(posedge TX_CLK or posedge reset_int)
begin
   if (reset_int) begin
     DELAY_ACK <= 16'h0001;
   end
   else if (apply_pause_delay) begin
     DELAY_ACK <= store_pause_frame;
   end
   else if (read_ifg_int) begin
     DELAY_ACK <= TX_IFG_DELAY;
   end
 end


//Need to expand to be setup by the config register
//1514 with out FCS added, 1518 when FCS is added
//1518 without FCS added, 1522 when FCS is added
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    MAX_FRAME_SIZE <= 1514;
  end
  else begin
    if (vlan_enabled_int) begin
      if (fcs_enabled_int) begin
        MAX_FRAME_SIZE <= 1522;
      end
      else begin
        MAX_FRAME_SIZE <= 1518;
      end
    end
    else if (jumbo_enabled_int) begin
     if (fcs_enabled_int) begin
        MAX_FRAME_SIZE <= 1518;
      end
      else begin
        MAX_FRAME_SIZE <= 1514;
      end
    end
    else begin
      if (fcs_enabled_int) begin
        MAX_FRAME_SIZE <= 1518;
      end
      else begin
        MAX_FRAME_SIZE <= 1514;
      end
    end
  end
end




always @(posedge TX_CLK)
begin
  if (reset_int) begin
    tx_undderrun_int <= 0;
  end
  else if (append_end_frame)begin
    tx_undderrun_int <= 0;
  end
  else if (TX_UNDERRUN) begin
    tx_undderrun_int <= 1;
  end
end

//Indicate an error
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
     insert_error <= 0;
  end
  else if (append_end_frame | reset_err_pause) begin
     insert_error <= 0;
  end
  else if (load_CRC8) begin
 	if (tx_undderrun_int == 1) begin
	  insert_error <= 1;	
	end
	else begin
	  if (length_register == final_byte_count) begin
	    if (final_byte_count <= MAX_FRAME_SIZE) begin
     	      insert_error <= 0;
          end
          else begin
            insert_error <= 1;
          end
        end
        else if (length_register < MIN_FRAME_SIZE) begin
          if (final_byte_count == 64) begin
            insert_error <= 0;
          end
          else begin
            insert_error <= 1;
          end
        end
        else begin
          insert_error <= 1;
        end
     end
  end
end


//use for delaying the ack signal when pause is required
always @(posedge TX_CLK or posedge reset_int)
begin
   if (reset_int) begin
     apply_pause_delay <= 0;
     store_pause_frame <= 0;
   end
   else if (TX_ACK) begin
     apply_pause_delay <= 0;
     store_pause_frame <= 0;
   end
   else if (FC_TX_PAUSEVALID) begin
     apply_pause_delay <= 1;
     store_pause_frame <= FC_TX_PAUSEDATA;
   end
end




always @(posedge TX_CLK)
begin
  if (TX_START) begin
    TX_DATA_VALID_DELAY <= IDLE_FRAME_8BYTES;
  end
  else begin
    TX_DATA_VALID_DELAY <= TX_DATA;
  end
end



//Shift valid into the system and also ensuring min frame is achieved
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin   
   TX_DATA_VALID_REG <= 0;
  end
  else if (FRAME_START) begin
   if (BYTE_COUNTER < 48) begin
     TX_DATA_VALID_REG <= 8'b11111111;
   end
   else if (BYTE_COUNTER == 48) begin
     if (TX_START) begin
       TX_DATA_VALID_REG <= 8'b00001111;  
     end   
     else begin
       TX_DATA_VALID_REG <= 8'b00001111 | TX_DATA_VALID; 
     end
   end
   else begin
     if (TX_START) begin
       TX_DATA_VALID_REG <= 0;
     end
     else begin
	 TX_DATA_VALID_REG <= TX_DATA_VALID;
     end
   end
  end
  else if (transmit_pause_frame_del) begin
     TX_DATA_VALID_REG <= shift_pause_valid_del;
  end
  else begin
   TX_DATA_VALID_REG <= 0;
  end
end


//Shifting data to the system. Also ensuring min frame is achieved
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
     TX_DATA_REG <= IDLE_FRAME_8BYTES;
  end
  else if (FRAME_START) begin
     if (BYTE_COUNTER < 56) begin
        case (TX_DATA_VALID_REG)
      	8'b00000000 : begin
                      TX_DATA_REG <= TX_DATA_VALID_DELAY;
                    end
        8'b00000001 : begin
                      TX_DATA_REG <= {56'h00000000000000, TX_DATA_VALID_DELAY[7:0]};
                    end
        8'b00000011 : begin
                      TX_DATA_REG <= {48'h000000000000, TX_DATA_VALID_DELAY[15:0]};
                    end                                                   
      	8'b00000111 : begin
                      TX_DATA_REG <= {40'h0000000000, TX_DATA_VALID_DELAY[23:0]};
                    end
        8'b00001111 : begin
                      TX_DATA_REG <= {32'h00000000, TX_DATA_VALID_DELAY[31:0]};
                    end
        8'b00011111 : begin
                      TX_DATA_REG <= {24'h000000, TX_DATA_VALID_DELAY[39:0]};
                    end    
      	8'b00111111 : begin
                      TX_DATA_REG <= {16'h0000, TX_DATA_VALID_DELAY[47:0]};
                    end
        8'b01111111 : begin
                      TX_DATA_REG <= {8'h00, TX_DATA_VALID_DELAY[55:0]};
                    end
        8'b11111111 : begin
                      TX_DATA_REG <= TX_DATA_VALID_DELAY;
                    end                    
        endcase                          
     end
     else begin
        TX_DATA_REG <= TX_DATA_VALID_DELAY;
     end
  end
  else if (transmit_pause_frame_valid) begin
     TX_DATA_REG <= shift_pause_data;
  end  
  else begin
     if (TX_ACK | append_start_pause) begin
       TX_DATA_REG <= START_SEQ;
     end
     else begin
       TX_DATA_REG <= IDLE_FRAME_8BYTES;
     end
  end

end







//Use for shifting data to CRC and loading start value for CRC
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    frame_start_del <= 0;
    transmit_pause_frame_del <= 0;
    transmit_pause_frame_del2 <= 0;
    transmit_pause_frame_del3 <= 0;
    append_start_pause <= 0;
    append_start_pause_del <= 0;
    transmit_pause_frame_valid <= 0;
    reset_err_pause <= 0;
    load_CRC8 <= 0;
  end
  else begin
    frame_start_del <= FRAME_START;
    transmit_pause_frame_del <= transmit_pause_frame;
    transmit_pause_frame_del2 <= transmit_pause_frame_del;
    transmit_pause_frame_del3 <= transmit_pause_frame_del2;
    append_start_pause <= (!transmit_pause_frame_del & transmit_pause_frame);
    append_start_pause_del <= append_start_pause;
    transmit_pause_frame_valid <= (transmit_pause_frame_del & transmit_pause_frame);
    reset_err_pause <= (transmit_pause_frame_del & !transmit_pause_frame);
    load_CRC8 <= (frame_start_del & !FRAME_START) | (transmit_pause_frame_del3 & !transmit_pause_frame_del2);
  end
end



always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    TX_DATA_VALID_DEL1 <= 0;
    TX_DATA_VALID_DEL2 <= 0;
    TX_DATA_VALID_DEL3 <= 0;
    TX_DATA_VALID_DEL4 <= 0;
    TX_DATA_VALID_DEL5 <= 0;
    TX_DATA_VALID_DEL6 <= 0;
    TX_DATA_VALID_DEL7 <= 0;
    TX_DATA_VALID_DEL8 <= 0;
    TX_DATA_VALID_DEL9 <= 0;
    TX_DATA_VALID_DEL10 <= 0;
    TX_DATA_VALID_DEL11 <= 0;
    TX_DATA_VALID_DEL12 <= 0;
    TX_DATA_VALID_DEL13 <= 0;
    TX_DATA_VALID_DEL14 <= 0;
    TX_DATA_VALID_DEL15 <= 0;
    OVERFLOW_VALID <= 0;
  end
  else begin
    TX_DATA_VALID_DEL1 <= TX_DATA_VALID_REG;
    TX_DATA_VALID_DEL2 <= TX_DATA_VALID_DEL1;
    TX_DATA_VALID_DEL3 <= TX_DATA_VALID_DEL2;
    TX_DATA_VALID_DEL4 <= TX_DATA_VALID_DEL3;
    TX_DATA_VALID_DEL5 <= TX_DATA_VALID_DEL4;
    TX_DATA_VALID_DEL6 <= TX_DATA_VALID_DEL5;
    TX_DATA_VALID_DEL7 <= TX_DATA_VALID_DEL6;
    TX_DATA_VALID_DEL8 <= TX_DATA_VALID_DEL7;
    TX_DATA_VALID_DEL9 <= TX_DATA_VALID_DEL8;
    TX_DATA_VALID_DEL10 <= TX_DATA_VALID_DEL9;
    TX_DATA_VALID_DEL11 <= TX_DATA_VALID_DEL10;
    TX_DATA_VALID_DEL12 <= TX_DATA_VALID_DEL11;
    TX_DATA_VALID_DEL13 <= TX_DATA_VALID_DEL12;
    TX_DATA_VALID_DEL14 <= TX_DATA_VALID_DEL13;

    if (load_final_CRC) begin
    	case (TX_DATA_VALID_DEL13)  
      	8'b00000000 : begin
			    if (fcs_enabled_int) begin
                        TX_DATA_VALID_DEL14 <= 8'b00001111;
                      end
                      else begin
                        TX_DATA_VALID_DEL14 <= 8'b00001111;
                      end
                      OVERFLOW_VALID <= 8'b00000000;     
                    end
      	8'b00000001 : begin
                      if (fcs_enabled_int) begin
    		            TX_DATA_VALID_DEL14 <= 8'b00011111;
                      end
                      
                      OVERFLOW_VALID <= 8'b00000000;		      
                    end
      	8'b00000011 : begin
			    if (fcs_enabled_int) begin
                        TX_DATA_VALID_DEL14 <= 8'b00111111;
                      end		          
                      OVERFLOW_VALID <= 8'b00000000;                
                    end
      	8'b00000111 : begin
                      if (fcs_enabled_int) begin
                        TX_DATA_VALID_DEL14 <= 8'b01111111;
                      end
		          
                      OVERFLOW_VALID <= 8'b00000000;
 			                        
                    end
      	8'b00001111 : begin
			    if (fcs_enabled_int) begin
   	                  TX_DATA_VALID_DEL14 <= 8'b11111111;
                      end

                      OVERFLOW_VALID <= 8'b00000000;
                      
                    end
      	8'b00011111 : begin
                      if (fcs_enabled_int) begin
                        TX_DATA_VALID_DEL14 <= 8'b11111111;
                        OVERFLOW_VALID <= 8'b00000001;
	                end
                      else begin
                        OVERFLOW_VALID <= 8'b00000000;
                      end  
                                          
                    end
      	8'b00111111 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_VALID_DEL14 <= 8'b11111111;
                        OVERFLOW_VALID <= 8'b00000011;		            
                      end
                      else begin
                        OVERFLOW_VALID <= 8'b00000000;                       
                      end  
                    end
      	8'b01111111 : begin
                      if (fcs_enabled_int) begin
                        TX_DATA_VALID_DEL14 <= 8'b11111111;
                        OVERFLOW_VALID <= 8'b00000111;
                      end
                      else begin
                        OVERFLOW_VALID <= 8'b00000000;
			    end  
                   end
      	endcase
    
    end

    else if (append_end_frame) begin
	TX_DATA_VALID_DEL14 <= OVERFLOW_VALID; 
    end
    
    TX_DATA_VALID_DEL15 <= TX_DATA_VALID_DEL14;
    TXC <= TX_DATA_VALID_DEL15;
  end
end

always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    TX_DATA_DEL1 <= 0;
    TX_DATA_DEL2 <= 0;
    TX_DATA_DEL3 <= 0;
    TX_DATA_DEL4 <= 0;
    TX_DATA_DEL5 <= 0;
    TX_DATA_DEL6 <= 0;
    TX_DATA_DEL7 <= 0;
    TX_DATA_DEL8 <= 0;
    TX_DATA_DEL9 <= 0;
    TX_DATA_DEL10 <= 0;
    TX_DATA_DEL11 <= 0;
    TX_DATA_DEL12 <= 0;
    TX_DATA_DEL13 <= 0;
    TX_DATA_DEL14 <= 0;
    TX_DATA_DEL15 <= 0;
    OVERFLOW_DATA <= IDLE_FRAME_8BYTES; 
  end
  else begin
    TX_DATA_DEL1 <= TX_DATA_REG;
    TX_DATA_DEL2 <= TX_DATA_DEL1;
    TX_DATA_DEL3 <= TX_DATA_DEL2;
    TX_DATA_DEL4 <= TX_DATA_DEL3;
    TX_DATA_DEL5 <= TX_DATA_DEL4;
    TX_DATA_DEL6 <= TX_DATA_DEL5;
    TX_DATA_DEL7 <= TX_DATA_DEL6;
    TX_DATA_DEL8 <= TX_DATA_DEL7;
    TX_DATA_DEL9 <= TX_DATA_DEL8;
    TX_DATA_DEL10 <= TX_DATA_DEL9;
    TX_DATA_DEL11 <= TX_DATA_DEL10;
    TX_DATA_DEL12 <= TX_DATA_DEL11;
    TX_DATA_DEL13 <= TX_DATA_DEL12;
    TX_DATA_DEL14 <= TX_DATA_DEL13;
    
    if (load_final_CRC) begin
    	case (TX_DATA_VALID_DEL13)  
      	8'b00000000 : begin
			    if (fcs_enabled_int) begin
                      
                        TX_DATA_DEL14[31:0] <= CRC_OUT[31:0];
                        if (insert_error) begin
                          TX_DATA_DEL14[39:32] <= ERROR_FRAME;
                          TX_DATA_DEL14[47:40] <= TERMINATE_FRAME;
                        end 
                        else begin
			  	  TX_DATA_DEL14[39:32] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[47:40] <= IDLE_FRAME;
                        end
                      
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end
                      else begin
                        if (insert_error) begin
                          TX_DATA_DEL14[7:0] <= ERROR_FRAME;
                          TX_DATA_DEL14[15:8] <= TERMINATE_FRAME;
                        end 
                        else begin
			  	  TX_DATA_DEL14[7:0] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[15:8] <= IDLE_FRAME;
                        end

                        TX_DATA_DEL14[23:16] <= IDLE_FRAME;
                        TX_DATA_DEL14[31:24] <= IDLE_FRAME; 
                        TX_DATA_DEL14[39:32] <= IDLE_FRAME;
                        TX_DATA_DEL14[47:40] <= IDLE_FRAME;                     
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end
                      OVERFLOW_DATA <= IDLE_FRAME_8BYTES;                      
                    end
      	8'b00000001 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[7:0] <= TX_DATA_DEL13[7:0];
                        TX_DATA_DEL14[39:8] <= CRC_OUT[31:0];
                        if (insert_error) begin
                          TX_DATA_DEL14[47:40] <= ERROR_FRAME;
                          TX_DATA_DEL14[55:48] <= TERMINATE_FRAME;
                        end 
                        else begin
                          TX_DATA_DEL14[47:40] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        end
                        
                        
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                        TX_DATA_DEL14 <= TX_DATA_DEL13;

                      end
                      else begin
                        TX_DATA_DEL14[7:0] <= TX_DATA_DEL13[7:0];

                        if (insert_error) begin
                          TX_DATA_DEL14[15:8] <= ERROR_FRAME;
                          TX_DATA_DEL14[23:16] <= TERMINATE_FRAME;
                        end 
                        else begin
                          TX_DATA_DEL14[15:8] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[23:16] <= IDLE_FRAME;
                        end
				TX_DATA_DEL14[31:24] <= IDLE_FRAME;
                        TX_DATA_DEL14[39:32] <= IDLE_FRAME;
                        TX_DATA_DEL14[47:40] <= IDLE_FRAME;
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                        TX_DATA_DEL14 <= TX_DATA_DEL13;
    		      
                      end  

                      OVERFLOW_DATA <= IDLE_FRAME_8BYTES;    		      
                    end
      	8'b00000011 : begin
			    if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[15:0] <= TX_DATA_DEL13[15:0];
                        TX_DATA_DEL14[47:16] <= CRC_OUT[31:0];
                        if (insert_error) begin
                          TX_DATA_DEL14[55:48] <= ERROR_FRAME;
                          TX_DATA_DEL14[63:56] <= TERMINATE_FRAME;
                        end 
                        else begin
                          TX_DATA_DEL14[55:48] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                        end
                      end
                      else begin
   		            TX_DATA_DEL14[15:0] <= TX_DATA_DEL13[15:0];
                        
                        if (insert_error) begin
                          TX_DATA_DEL14[23:16] <= ERROR_FRAME;
                          TX_DATA_DEL14[31:24] <= TERMINATE_FRAME;
                        end 
                        else begin
                          TX_DATA_DEL14[23:16] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[31:24] <= IDLE_FRAME;
                          
                        end
                        TX_DATA_DEL14[39:32] <= IDLE_FRAME;
                        TX_DATA_DEL14[47:40] <= IDLE_FRAME;
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end  

                      OVERFLOW_DATA <= IDLE_FRAME_8BYTES; 	                
                    end
      	8'b00000111 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[23:0] <= TX_DATA_DEL13[23:0];
                        TX_DATA_DEL14[55:24] <= CRC_OUT[31:0];
			      OVERFLOW_DATA <= IDLE_FRAME_8BYTES;
                        if (insert_error) begin
		  		  TX_DATA_DEL14[63:56] <= ERROR_FRAME;
				  OVERFLOW_DATA[7:0] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14[63:56] <= TERMINATE_FRAME;
                        end
                      end
                      else begin
                        TX_DATA_DEL14[23:0] <= TX_DATA_DEL13[23:0];
                        TX_DATA_DEL14[55:24] <= CRC_OUT[31:0];
			      OVERFLOW_DATA <= IDLE_FRAME_8BYTES;
                        if (insert_error) begin
		  		  TX_DATA_DEL14[31:24] <= ERROR_FRAME;
				  TX_DATA_DEL14[39:32] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14[31:24] <= TERMINATE_FRAME;
                          TX_DATA_DEL14[39:32] <= IDLE_FRAME;
                        end
                        TX_DATA_DEL14[47:40] <= IDLE_FRAME;
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end  
                     
                    end
      	8'b00001111 : begin
			    if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[31:0] <= TX_DATA_DEL13[31:0];
		            TX_DATA_DEL14[63:32]<= CRC_OUT[31:0];

                        if (insert_error) begin
				  OVERFLOW_DATA [7:0] <= ERROR_FRAME;
				  OVERFLOW_DATA[15:8] <= TERMINATE_FRAME;
                        end 
                        else begin
				  OVERFLOW_DATA [7:0]<= TERMINATE_FRAME; 
                          OVERFLOW_DATA [15:8]<= IDLE_FRAME; 
                        end
                        OVERFLOW_DATA [23:16]<= IDLE_FRAME; 
                        OVERFLOW_DATA [31:24]<= IDLE_FRAME; 
                        OVERFLOW_DATA [39:32]<= IDLE_FRAME; 
                        OVERFLOW_DATA [47:40]<= IDLE_FRAME; 
                        OVERFLOW_DATA [55:48]<= IDLE_FRAME; 
                        OVERFLOW_DATA [63:56]<= IDLE_FRAME; 
                      end
                      else begin
                        TX_DATA_DEL14[31:0] <= TX_DATA_DEL13[31:0];
				OVERFLOW_DATA <= IDLE_FRAME_8BYTES;
                        if (insert_error) begin
				  TX_DATA_DEL14 [39:32] <= ERROR_FRAME;
				  TX_DATA_DEL14[47:40] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14 [39:32]<= TERMINATE_FRAME; 
                          TX_DATA_DEL14 [47:40]<= IDLE_FRAME; 
                        end
                        TX_DATA_DEL14[55:48] <= IDLE_FRAME;
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end  
                    end
      	8'b00011111 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[39:0] <= TX_DATA_DEL13[39:0];
                        TX_DATA_DEL14[63:40] <= CRC_OUT[23:0];
		            OVERFLOW_DATA [7:0]<= CRC_OUT[31:24];
                        if (insert_error) begin
				  OVERFLOW_DATA [15:8]<= ERROR_FRAME; 
                          OVERFLOW_DATA [23:16]<= TERMINATE_FRAME;
                        end 
                        else begin
				  OVERFLOW_DATA [15:8]<= TERMINATE_FRAME; 
                          OVERFLOW_DATA [23:16]<= IDLE_FRAME;
                        end
                        OVERFLOW_DATA [31:24]<= IDLE_FRAME; 
                        OVERFLOW_DATA [39:32]<= IDLE_FRAME; 
                        OVERFLOW_DATA [47:40]<= IDLE_FRAME; 
                        OVERFLOW_DATA [55:48]<= IDLE_FRAME; 
                        OVERFLOW_DATA [63:56]<= IDLE_FRAME; 
                      end
                      else begin
                        TX_DATA_DEL14[39:0] <= TX_DATA_DEL13[39:0];
				OVERFLOW_DATA <= IDLE_FRAME_8BYTES;
                        if (insert_error) begin
				  TX_DATA_DEL14 [47:40] <= ERROR_FRAME;
				  TX_DATA_DEL14[55:48] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14 [47:40]<= TERMINATE_FRAME; 
                          TX_DATA_DEL14 [55:48]<= IDLE_FRAME; 
                        end
                        TX_DATA_DEL14[63:56] <= IDLE_FRAME;
                      end  
                    
                    end
      	8'b00111111 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[47:0] <= TX_DATA_DEL13[47:0];
                        TX_DATA_DEL14[63:48] <= CRC_OUT[15:0];
		            OVERFLOW_DATA [15:0]<= CRC_OUT[31:16];  
                        if (insert_error) begin
				  OVERFLOW_DATA [23:16]<= ERROR_FRAME; 
                          OVERFLOW_DATA [31:24]<= TERMINATE_FRAME;  
                        end 
                        else begin
				  OVERFLOW_DATA [23:16]<= TERMINATE_FRAME; 
                          OVERFLOW_DATA [31:24]<= IDLE_FRAME; 
                        end     
                        OVERFLOW_DATA [39:32]<= IDLE_FRAME; 
                        OVERFLOW_DATA [47:40]<= IDLE_FRAME; 
                        OVERFLOW_DATA [55:48]<= IDLE_FRAME; 
                        OVERFLOW_DATA [63:56]<= IDLE_FRAME; 
                      end
                      else begin
                        TX_DATA_DEL14[47:0] <= TX_DATA_DEL13[47:0];
                        if (insert_error) begin
				  TX_DATA_DEL14 [55:48] <= ERROR_FRAME;
				  TX_DATA_DEL14[63:56] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14 [55:48]<= TERMINATE_FRAME; 
                          TX_DATA_DEL14 [63:56]<= IDLE_FRAME; 
                        end
                       
                      end  
                    end
      	8'b01111111 : begin
                      if (fcs_enabled_int) begin
   		            TX_DATA_DEL14[55:0] <= TX_DATA_DEL13[55:0];
                        TX_DATA_DEL14[63:56] <= CRC_OUT[7:0];
		            OVERFLOW_DATA [23:0]<= CRC_OUT[31:8];  
                        if (insert_error) begin
				  OVERFLOW_DATA [31:24]<= ERROR_FRAME; 
                          OVERFLOW_DATA [39:32]<= TERMINATE_FRAME;
                        end 
                        else begin
				  OVERFLOW_DATA [31:24]<= TERMINATE_FRAME; 
                          OVERFLOW_DATA [39:32]<= IDLE_FRAME;
                        end     
                        OVERFLOW_DATA [47:40]<= IDLE_FRAME; 
                        OVERFLOW_DATA [55:48]<= IDLE_FRAME; 
                        OVERFLOW_DATA [63:56]<= IDLE_FRAME; 
                      end
                      else begin
                        TX_DATA_DEL14[55:0] <= TX_DATA_DEL13[55:0];
				OVERFLOW_DATA <= IDLE_FRAME_8BYTES;
                        if (insert_error) begin
				  TX_DATA_DEL14 [63:56] <= ERROR_FRAME;
				  OVERFLOW_DATA[7:0] <= TERMINATE_FRAME;
                        end 
                        else begin
				  TX_DATA_DEL14 [63:56]<= TERMINATE_FRAME; 
                          OVERFLOW_DATA [7:0]<= IDLE_FRAME; 
                        end
                      end  
               
                    end

      	endcase
    end
    else if (append_end_frame) begin
      TX_DATA_DEL14 <= OVERFLOW_DATA;    
    end

    TX_DATA_DEL15 <= TX_DATA_DEL14;

    TXD <= TX_DATA_DEL15;   
  end
end




always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    store_tx_data_valid <= 0;
    store_tx_data <= 0;
    store_CRC64 <= 0;
    tx_data_int <= 0;
  end
  else if (load_CRC8) begin
    store_tx_data_valid <= TX_DATA_VALID_DEL2;
    store_tx_data <= TX_DATA_DEL2;
    store_CRC64 <= CRC_32_64;
  end
  else begin
    store_tx_data_valid[6:0] <= store_tx_data_valid[7:1];
    tx_data_int <= store_tx_data[7:0];
    store_tx_data[55:0] <= store_tx_data[63:8];
  end
end

//Start CRC8 and load CRC8
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    start_CRC8 <= 0;
    START_CRC8_DEL <= 0;
  end
  else begin
    start_CRC8 <= store_tx_data_valid[0];
    START_CRC8_DEL <= start_CRC8;
  end
end


always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
     byte_count_reg <= 0;
  end
  else begin
     byte_count_reg <= BYTE_COUNTER;
  end
end

//Use for determining the number of bytes in the data
always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
     final_byte_count <= 0;
  end
  else if (load_CRC8) begin
     if (BYTE_COUNTER == 64) begin
        final_byte_count <= 60;
     end
     else begin
        final_byte_count <= byte_count_reg;
     end
  end
  else if (start_CRC8) begin
     final_byte_count <= final_byte_count + 1;
  end
end

always @(posedge TX_CLK)
begin
  if (transmit_pause_frame) begin
    byte_count_stat = 512;
  end
  else begin
    byte_count_stat = final_byte_count;
  end
end


always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
     append_reg <= 0;
     load_final_CRC  <= 0;
     append_end_frame <= 0;
  end
  else begin
     append_reg[0] <= load_CRC8;
     append_reg[9:1] <= append_reg[8:0];
     load_final_CRC <= append_reg[9];
     append_end_frame <= load_final_CRC;
  end
end

//
//always @(posedge TX_CLK or posedge reset_int)
//begin
//  if (reset_int) begin
//    vlan_enabled_int <= 0;
//  end
//end

// VLAN field - 8100 at second 64 bit data at 32:47 and V1 V2 is at 48:63
// length field at third 64 bit data at 0:15

always @(posedge TX_CLK or posedge reset_int)
begin
   if (reset_int) begin
      length_register <= 0;
   end
   else if (vlan_enabled_int & BYTE_COUNTER == 16) begin 
       length_register <= TX_DATA_REG[15:0];
   end
   else begin
      if (BYTE_COUNTER == 8) begin
        length_register <= TX_DATA_REG[47:32];
      end
   end
   
end


always @(posedge TX_CLK or posedge reset_int)
begin
  if (reset_int) begin
    set_pause_stats <= 0;
  end
  else if (PAUSEVAL_DEL2) begin
    set_pause_stats <= 1;
  end
  else if (append_end_frame) begin
    set_pause_stats <= 0;
  end
end


endmodule

