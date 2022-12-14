`define ADDR_WIDTH_21_8 8
`define DATA_WIDTH_21_8 21
`define ADDR_WIDTH_128_8 8
`define DATA_WIDTH_128_8 128
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
//`define A25_DECOMPILE
//`define A25_COPRO15_DEBUG
//`define A25_CACHE_DEBUG
//    `define A25_DECOMPILE_FILE    "amber.dis"

module a25_shifter_quick 
(
 
i_in,
i_carry_in,
i_shift_amount,    
i_shift_imm_zero,   
i_function,
 
o_out,
o_carry_out
 
);

input       [31:0]          i_in;
input                       i_carry_in;
input       [7:0]           i_shift_amount;     // uses 8 LSBs of Rs, or a 5 bit immediate constant
input                       i_shift_imm_zero;   // high when immediate shift value of zero selected
input       [1:0]           i_function;
 
output      [31:0]          o_out;
output                      o_carry_out;

//////////////////////////////////////////////////////////////////
//                                                              //
//  Parameters file for Amber 25 Core                           //
//                                                              //
//  This file is part of the Amber project                      //
//  http://www.opencores.org/project,amber                      //
//                                                              //
//  Description                                                 //
//  Holds general parameters that are used is several core      //
//  modules                                                     //
//                                                              //
//  Author(s):                                                  //
//      - Conor Santifort, csantifort.amber@gmail.com           //
//                                                              //
//////////////////////////////////////////////////////////////////
//                                                              //
// Copyright (C) 2011 Authors and OPENCORES.ORG                 //
//                                                              //
// This source file may be used and distributed without         //
// restriction provided that this copyright statement is not    //
// removed from the file and that any derivative work contains  //
// the original copyright notice and the associated disclaimer. //
//                                                              //
// This source file is free software; you can redistribute it   //
// and/or modify it under the terms of the GNU Lesser General   //
// Public License as published by the Free Software Foundation; //
// either version 2.1 of the License, or (at your option) any   //
// later version.                                               //
//                                                              //
// This source is distributed in the hope that it will be       //
// useful, but WITHOUT ANY WARRANTY; without even the implied   //
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      //
// PURPOSE.  See the GNU Lesser General Public License for more //
// details.                                                     //
//                                                              //
// You should have received a copy of the GNU Lesser General    //
// Public License along with this source; if not, download it   //
// from http://www.opencores.org/lgpl.shtml                     //
//                                                              //
//////////////////////////////////////////////////////////////////
 
 
// Instruction Types
localparam [3:0]    REGOP       = 4'h0, // Data processing
                    MULT        = 4'h1, // Multiply
                    SWAP        = 4'h2, // Single Data Swap
                    TRANS       = 4'h3, // Single data transfer
                    MTRANS      = 4'h4, // Multi-word data transfer
                    BRANCH      = 4'h5, // Branch
                    CODTRANS    = 4'h6, // Co-processor data transfer
                    COREGOP     = 4'h7, // Co-processor data operation
                    CORTRANS    = 4'h8, // Co-processor register transfer
                    SWI         = 4'h9; // software interrupt
 
 
// Opcodes
localparam [3:0] AND = 4'h0,        // Logical AND
                 EOR = 4'h1,        // Logical Exclusive OR
                 SUB = 4'h2,        // Subtract
                 RSB = 4'h3,        // Reverse Subtract
                 ADD = 4'h4,        // Add
                 ADC = 4'h5,        // Add with Carry
                 SBC = 4'h6,        // Subtract with Carry
                 RSC = 4'h7,        // Reverse Subtract with Carry
                 TST = 4'h8,        // Test  (using AND operator)
                 TEQ = 4'h9,        // Test Equivalence (using EOR operator)
                 CMP = 4'ha,       // Compare (using Subtract operator)
                 CMN = 4'hb,       // Compare Negated
                 ORR = 4'hc,       // Logical OR
                 MOV = 4'hd,       // Move
                 BIC = 4'he,       // Bit Clear (using AND & NOT operators)
                 MVN = 4'hf;       // Move NOT
 
// Condition Encoding
localparam [3:0] EQ  = 4'h0,        // Equal            / Z set
                 NE  = 4'h1,        // Not equal        / Z clear
                 CS  = 4'h2,        // Carry set        / C set
                 CC  = 4'h3,        // Carry clear      / C clear
                 MI  = 4'h4,        // Minus            / N set
                 PL  = 4'h5,        // Plus             / N clear
                 VS  = 4'h6,        // Overflow         / V set
                 VC  = 4'h7,        // No overflow      / V clear
                 HI  = 4'h8,        // Unsigned higher  / C set and Z clear
                 LS  = 4'h9,        // Unsigned lower
                                    // or same          / C clear or Z set
                 GE  = 4'ha,        // Signed greater 
                                    // than or equal    / N == V
                 LT  = 4'hb,        // Signed less than / N != V
                 GT  = 4'hc,        // Signed greater
                                    // than             / Z == 0, N == V
                 LE  = 4'hd,        // Signed less than
                                    // or equal         / Z == 1, N != V
                 AL  = 4'he,        // Always
                 NV  = 4'hf;        // Never
 
// Any instruction with a condition field of 0b1111 is UNPREDICTABLE.                
 
// Shift Types
localparam [1:0] LSL = 2'h0,
                 LSR = 2'h1,
                 ASR = 2'h2,
                 RRX = 2'h3,
                 ROR = 2'h3; 
 
// Modes
localparam [1:0] SVC  =  2'b11,  // Supervisor
                 IRQ  =  2'b10,  // Interrupt
                 FIRQ =  2'b01,  // Fast Interrupt
                 USR  =  2'b00;  // User
 
// One-Hot Mode encodings
localparam [5:0] OH_USR  = 0,
                 OH_IRQ  = 1,
                 OH_FIRQ = 2,
                 OH_SVC  = 3;
 
 
 
  // MSB is carry out
wire [32:0] lsl_out;
wire [32:0] lsr_out;
wire [32:0] asr_out;
wire [32:0] ror_out;
 
 
// Logical shift right zero is redundant as it is the same as logical shift left zero, so
// the assembler will convert LSR #0 (and ASR #0 and ROR #0) into LSL #0, and allow
// lsr #32 to be specified.
 
// lsl #0 is a special case, where the shifter carry out is the old value of the status flags
// C flag. The contents of Rm are used directly as the second operand.
  
    // only gives the correct result if the shift value is < 4
    assign lsl_out = i_shift_imm_zero        ? {i_carry_in, i_in              } : // fall through case 
                     i_shift_amount == 2'd0  ? {i_carry_in, i_in              } : // fall through case
                     i_shift_amount == 2'd1  ? {i_in[31],   i_in[30: 0],  1'd0} :
                     i_shift_amount == 2'd2  ? {i_in[30],   i_in[29: 0],  2'd0} :
                                               {i_in[29],   i_in[28: 0],  3'd0} ; // 3
 
// The form of the shift field which might be expected to correspond to LSR #0 is used
// to encode LSR #32, which has a zero result with bit 31 of Rm as the carry output. 

    // only gives the correct result if the shift value is < 4
    assign lsr_out = i_shift_imm_zero             ? {i_in[31], 32'd0             } :
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in            } :  // fall through case
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0],  1'd0, i_in[31: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1],  2'd0, i_in[31: 2]} :
                                                    {i_in[ 2],  3'd0, i_in[31: 3]} ; // 3
 
// The form of the shift field which might be expected to give ASR #0 is used to encode
// ASR #32. Bit 31 of Rm is again used as the carry output, and each bit of operand 2 is
// also equal to bit 31 of Rm. The result is therefore all ones or all zeros, according to
// the value of bit 31 of Rm. 
 
    // only gives the correct result if the shift value is < 4
    assign asr_out = i_shift_imm_zero             ? {i_in[31], {32{i_in[31]}}             } :
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in                     } :  // fall through case
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0], { 2{i_in[31]}}, i_in[30: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1], { 3{i_in[31]}}, i_in[30: 2]} :
                                                    {i_in[ 2], { 4{i_in[31]}}, i_in[30: 3]} ; // 3
 
    // only gives the correct result if the shift value is < 4
    assign ror_out = i_shift_imm_zero             ? {i_in[ 0], i_carry_in,  i_in[31: 1]} :  // RXR, (ROR w/ imm 0)
                     i_shift_amount[1:0] == 2'd0  ? {i_carry_in, i_in                  } :  // fall through case
                     i_shift_amount[1:0] == 2'd1  ? {i_in[ 0], i_in[    0], i_in[31: 1]} :
                     i_shift_amount[1:0] == 2'd2  ? {i_in[ 1], i_in[ 1: 0], i_in[31: 2]} :
                                                    {i_in[ 2], i_in[ 2: 0], i_in[31: 3]} ; // 3
 
assign {o_carry_out, o_out} = i_function == LSL ? lsl_out :
                              i_function == LSR ? lsr_out :
                              i_function == ASR ? asr_out :
                                                  ror_out ;
 
endmodule
