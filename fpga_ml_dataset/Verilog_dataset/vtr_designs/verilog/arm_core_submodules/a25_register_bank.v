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

module a25_register_bank (
 
			i_clk,
			i_core_stall,
			i_mem_stall,
 
			i_mode_idec,          
                                               
			i_mode_exec,            
                                           
			i_mode_rds_exec,      
                                                  
			i_firq_not_user_mode,
			i_rm_sel,
			i_rs_sel,
			i_rn_sel,
 
			i_pc_wen,
			i_reg_bank_wen,
 
			i_pc,                
			i_reg,
 
			i_wb_read_data,
			i_wb_read_data_valid,
			i_wb_read_data_rd,
			i_wb_mode,
 
			i_status_bits_flags,
			i_status_bits_irq_mask,
			i_status_bits_firq_mask,
 
			o_rm,
			o_rs,
			o_rd,
			o_rn,
			o_pc
 
			);
 
//`include "a25/a25_localparams.v"
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
 
 
//`include "a25/a25_functions.v"

input                       i_clk;
input                       i_core_stall;
input                       i_mem_stall;
 
input       [1:0]           i_mode_idec;            // user, supervisor, irq_idec, firq_idec etc.
                                                    // Used for register writes
input       [1:0]           i_mode_exec;            // 1 periods delayed from i_mode_idec
                                                    // Used for register reads
input       [3:0]           i_mode_rds_exec;        // Use one-hot version specifically for rds, 
                                                    // includes i_user_mode_regs_store
input                       i_firq_not_user_mode;
input       [3:0]           i_rm_sel;
input       [3:0]           i_rs_sel;
input       [3:0]           i_rn_sel;
 
input                       i_pc_wen;
input       [14:0]          i_reg_bank_wen;
 
input       [23:0]          i_pc;                   // program counter [25:2]
input       [31:0]          i_reg;
 
input       [31:0]          i_wb_read_data;
input                       i_wb_read_data_valid;
input       [3:0]           i_wb_read_data_rd;
input       [1:0]           i_wb_mode;
 
input       [3:0]           i_status_bits_flags;
input                       i_status_bits_irq_mask;
input                       i_status_bits_firq_mask;
 
output      [31:0]          o_rm;
output      [31:0]          o_rs;
output      [31:0]          o_rd;
output      [31:0]          o_rn;
output      [31:0]          o_pc;

reg  	    [31:0]          o_rs;  //
reg   	    [31:0]          o_rd;  //

// User Mode Registers
reg  [31:0] r0  = 32'hdeadbeef;
reg  [31:0] r1  = 32'hdeadbeef;
reg  [31:0] r2  = 32'hdeadbeef;
reg  [31:0] r3  = 32'hdeadbeef;
reg  [31:0] r4  = 32'hdeadbeef;
reg  [31:0] r5  = 32'hdeadbeef;
reg  [31:0] r6  = 32'hdeadbeef;
reg  [31:0] r7  = 32'hdeadbeef;
reg  [31:0] r8  = 32'hdeadbeef;
reg  [31:0] r9  = 32'hdeadbeef;
reg  [31:0] r10 = 32'hdeadbeef;
reg  [31:0] r11 = 32'hdeadbeef;
reg  [31:0] r12 = 32'hdeadbeef;
reg  [31:0] r13 = 32'hdeadbeef;
reg  [31:0] r14 = 32'hdeadbeef;
reg  [23:0] r15; // see line: 4272
 
wire  [31:0] r0_out;
wire  [31:0] r1_out;
wire  [31:0] r2_out;
wire  [31:0] r3_out;
wire  [31:0] r4_out;
wire  [31:0] r5_out;
wire  [31:0] r6_out;
wire  [31:0] r7_out;
wire  [31:0] r8_out;
wire  [31:0] r9_out;
wire  [31:0] r10_out;
wire  [31:0] r11_out;
wire  [31:0] r12_out;
wire  [31:0] r13_out;
wire  [31:0] r14_out;
wire  [31:0] r15_out_rm;
wire  [31:0] r15_out_rm_nxt;
wire  [31:0] r15_out_rn;
 
wire  [31:0] r8_rds;
wire  [31:0] r9_rds;
wire  [31:0] r10_rds;
wire  [31:0] r11_rds;
wire  [31:0] r12_rds;
wire  [31:0] r13_rds;
wire  [31:0] r14_rds;
 
// Supervisor Mode Registers
reg  [31:0] r13_svc = 32'hdeadbeef;
reg  [31:0] r14_svc = 32'hdeadbeef;
 
// Interrupt Mode Registers
reg  [31:0] r13_irq = 32'hdeadbeef;
reg  [31:0] r14_irq = 32'hdeadbeef;
 
// Fast Interrupt Mode Registers
reg  [31:0] r8_firq  = 32'hdeadbeef;
reg  [31:0] r9_firq  = 32'hdeadbeef;
reg  [31:0] r10_firq = 32'hdeadbeef;
reg  [31:0] r11_firq = 32'hdeadbeef;
reg  [31:0] r12_firq = 32'hdeadbeef;
reg  [31:0] r13_firq = 32'hdeadbeef;
reg  [31:0] r14_firq = 32'hdeadbeef;
 
wire        usr_exec;
wire        svc_exec;
wire        irq_exec;
wire        firq_exec;
 
wire        usr_idec;
wire        svc_idec;
wire        irq_idec;
wire        firq_idec;
wire [14:0] read_data_wen;
wire [14:0] reg_bank_wen_c;
wire        pc_wen_c;
wire        pc_dmem_wen;

reg [14:0] decode;  //jingjing
 
 
    // Write Enables from execute stage
assign usr_idec  = i_mode_idec == USR;
assign svc_idec  = i_mode_idec == SVC;
assign irq_idec  = i_mode_idec == IRQ;
 
// pre-encoded in decode stage to speed up long path
assign firq_idec = i_firq_not_user_mode;
 
    // Read Enables from stage 1 (fetch)
assign usr_exec  = i_mode_exec == USR;
assign svc_exec  = i_mode_exec == SVC;
assign irq_exec  = i_mode_exec == IRQ;
assign firq_exec = i_mode_exec == FIRQ;

always @*
case(i_wb_read_data_rd)
	4'h0  : decode = 15'h0001  ;
	4'h1  : decode = 15'h0002  ;
	4'h2  : decode = 15'h0004  ;
	4'h3  : decode = 15'h0008  ;
	4'h4  : decode = 15'h0010  ;
	4'h5  : decode = 15'h0020  ;
	4'h6  : decode = 15'h0040  ;
	4'h7  : decode = 15'h0080  ;
	4'h8  : decode = 15'h0100  ;
	4'h9  : decode = 15'h0200  ;
	4'ha  : decode = 15'h0400  ;
	4'hb  : decode = 15'h0800  ;
	4'hc  : decode = 15'h1000  ;
	4'hd  : decode = 15'h2000  ;
	4'he  : decode = 15'h4000  ;
	default: decode = 15'h0000  ;
endcase


/* i_wb_read_data_rd == 4'h0  ? 15'h0001  :
		 i_wb_read_data_rd == 4'h1  ? 15'h0002  :
		 i_wb_read_data_rd == 4'h2  ? 15'h0004  :
		 i_wb_read_data_rd == 4'h3  ? 15'h0008  :
		 i_wb_read_data_rd == 4'h4  ? 15'h0010  :
		 i_wb_read_data_rd == 4'h5  ? 15'h0020  :

		 i_wb_read_data_rd == 4'h6  ? 15'h0040  :
		 i_wb_read_data_rd == 4'h7  ? 15'h0080  :
		 i_wb_read_data_rd == 4'h8  ? 15'h0100  :
		 i_wb_read_data_rd == 4'h9  ? 15'h0200  :
		 i_wb_read_data_rd == 4'ha  ? 15'h0400  :
		 i_wb_read_data_rd == 4'hb  ? 15'h0800  :
		 i_wb_read_data_rd == 4'hc  ? 15'h1000  :
		 i_wb_read_data_rd == 4'hd  ? 15'h2000  :
		 i_wb_read_data_rd == 4'he  ? 15'h4000  :
			         default:     15'h0000  ;
*/
//& decode (i_wb_read_data_rd); 
assign read_data_wen = {15{i_wb_read_data_valid & ~i_mem_stall}} 
			& decode;


				
assign reg_bank_wen_c = {15{~i_core_stall}} & i_reg_bank_wen;
assign pc_wen_c       = ~i_core_stall & i_pc_wen;
assign pc_dmem_wen    = i_wb_read_data_valid & ~i_mem_stall & i_wb_read_data_rd == 4'd15;
 
 
// ========================================================
// Register Update
// ========================================================


always @ ( posedge i_clk )
    begin
    // these registers are used in all modes
    r0       <= reg_bank_wen_c[0 ]               ? i_reg : read_data_wen[0 ]                      ? i_wb_read_data       : r0;  
    r1       <= reg_bank_wen_c[1 ]               ? i_reg : read_data_wen[1 ]                      ? i_wb_read_data       : r1;  
    r2       <= reg_bank_wen_c[2 ]               ? i_reg : read_data_wen[2 ]                      ? i_wb_read_data       : r2;  
    r3       <= reg_bank_wen_c[3 ]               ? i_reg : read_data_wen[3 ]                      ? i_wb_read_data       : r3;  
    r4       <= reg_bank_wen_c[4 ]               ? i_reg : read_data_wen[4 ]                      ? i_wb_read_data       : r4;  
    r5       <= reg_bank_wen_c[5 ]               ? i_reg : read_data_wen[5 ]                      ? i_wb_read_data       : r5;  
    r6       <= reg_bank_wen_c[6 ]               ? i_reg : read_data_wen[6 ]                      ? i_wb_read_data       : r6;  
    r7       <= reg_bank_wen_c[7 ]               ? i_reg : read_data_wen[7 ]                      ? i_wb_read_data       : r7;  
 
    // these registers are used in all modes, except fast irq
    r8       <= reg_bank_wen_c[8 ] && !firq_idec ? i_reg : read_data_wen[8 ] && i_wb_mode != FIRQ ? i_wb_read_data       : r8;  
    r9       <= reg_bank_wen_c[9 ] && !firq_idec ? i_reg : read_data_wen[9 ] && i_wb_mode != FIRQ ? i_wb_read_data       : r9;  
    r10      <= reg_bank_wen_c[10] && !firq_idec ? i_reg : read_data_wen[10] && i_wb_mode != FIRQ ? i_wb_read_data       : r10; 
    r11      <= reg_bank_wen_c[11] && !firq_idec ? i_reg : read_data_wen[11] && i_wb_mode != FIRQ ? i_wb_read_data       : r11; 
    r12      <= reg_bank_wen_c[12] && !firq_idec ? i_reg : read_data_wen[12] && i_wb_mode != FIRQ ? i_wb_read_data       : r12; 
 
    // these registers are used in fast irq mode
    r8_firq  <= reg_bank_wen_c[8 ] &&  firq_idec ? i_reg : read_data_wen[8 ] && i_wb_mode == FIRQ ? i_wb_read_data       : r8_firq;
    r9_firq  <= reg_bank_wen_c[9 ] &&  firq_idec ? i_reg : read_data_wen[9 ] && i_wb_mode == FIRQ ? i_wb_read_data       : r9_firq;
    r10_firq <= reg_bank_wen_c[10] &&  firq_idec ? i_reg : read_data_wen[10] && i_wb_mode == FIRQ ? i_wb_read_data       : r10_firq;
    r11_firq <= reg_bank_wen_c[11] &&  firq_idec ? i_reg : read_data_wen[11] && i_wb_mode == FIRQ ? i_wb_read_data       : r11_firq;
    r12_firq <= reg_bank_wen_c[12] &&  firq_idec ? i_reg : read_data_wen[12] && i_wb_mode == FIRQ ? i_wb_read_data       : r12_firq;
 
    // these registers are used in user mode
    r13      <= reg_bank_wen_c[13] &&  usr_idec  ? i_reg : read_data_wen[13] && i_wb_mode == USR ? i_wb_read_data        : r13;         
    r14      <= reg_bank_wen_c[14] &&  usr_idec  ? i_reg : read_data_wen[14] && i_wb_mode == USR ? i_wb_read_data        : r14;         
 
    // these registers are used in supervisor mode
    r13_svc  <= reg_bank_wen_c[13] &&  svc_idec  ? i_reg : read_data_wen[13] && i_wb_mode == SVC  ? i_wb_read_data       : r13_svc;     
    r14_svc  <= reg_bank_wen_c[14] &&  svc_idec  ? i_reg : read_data_wen[14] && i_wb_mode == SVC  ? i_wb_read_data       : r14_svc;     
 
    // these registers are used in irq mode
    r13_irq  <= reg_bank_wen_c[13] &&  irq_idec  ? i_reg : read_data_wen[13] && i_wb_mode == IRQ  ? i_wb_read_data       : r13_irq; 
    r14_irq  <= (reg_bank_wen_c[14] && irq_idec) ? i_reg : read_data_wen[14] && i_wb_mode == IRQ  ? i_wb_read_data       : r14_irq;      
 
    // these registers are used in fast irq mode
    r13_firq <= reg_bank_wen_c[13] &&  firq_idec ? i_reg : read_data_wen[13] && i_wb_mode == FIRQ ? i_wb_read_data       : r13_firq;
    r14_firq <= reg_bank_wen_c[14] &&  firq_idec ? i_reg : read_data_wen[14] && i_wb_mode == FIRQ ? i_wb_read_data       : r14_firq;  
 
    // these registers are used in all modes
    r15      <= pc_wen_c                         ?  i_pc : pc_dmem_wen                            ? i_wb_read_data[25:2] : r15;

    end
 
 
// ========================================================
// Register Read based on Mode
// ========================================================
assign r0_out = r0;
assign r1_out = r1;
assign r2_out = r2;
assign r3_out = r3;
assign r4_out = r4;
assign r5_out = r5;
assign r6_out = r6;
assign r7_out = r7;
 
assign r8_out  = firq_exec ? r8_firq  : r8;
assign r9_out  = firq_exec ? r9_firq  : r9;
assign r10_out = firq_exec ? r10_firq : r10;
assign r11_out = firq_exec ? r11_firq : r11;
assign r12_out = firq_exec ? r12_firq : r12;
 
assign r13_out = usr_exec ? r13      :
                 svc_exec ? r13_svc  :
                 irq_exec ? r13_irq  :
                          r13_firq ;
 
assign r14_out = usr_exec ? r14      :
                 svc_exec ? r14_svc  :
                 irq_exec ? r14_irq  :
                          r14_firq ;
 
 
assign r15_out_rm     = { i_status_bits_flags, 
                          i_status_bits_irq_mask, 
                          i_status_bits_firq_mask, 
                          r15, 
                          i_mode_exec};
 
assign r15_out_rm_nxt = { i_status_bits_flags, 
                          i_status_bits_irq_mask, 
                          i_status_bits_firq_mask, 
                          i_pc, 
                          i_mode_exec};

// if r15 is initialized => Yosys+ABC:A CI/CO pair share the name (u_execute.u_register_bank.r15[1]) but do not link directly
assign r15_out_rn     = {6'd0, r15, 2'd0};
 
 
// rds outputs
assign r8_rds  = i_mode_rds_exec[OH_FIRQ] ? r8_firq  : r8;
assign r9_rds  = i_mode_rds_exec[OH_FIRQ] ? r9_firq  : r9;
assign r10_rds = i_mode_rds_exec[OH_FIRQ] ? r10_firq : r10;
assign r11_rds = i_mode_rds_exec[OH_FIRQ] ? r11_firq : r11;
assign r12_rds = i_mode_rds_exec[OH_FIRQ] ? r12_firq : r12;
 
assign r13_rds = i_mode_rds_exec[OH_USR]  ? r13      :
                 i_mode_rds_exec[OH_SVC]  ? r13_svc  :
                 i_mode_rds_exec[OH_IRQ]  ? r13_irq  :
                                            r13_firq ;
 
assign r14_rds = i_mode_rds_exec[OH_USR]  ? r14      :
                 i_mode_rds_exec[OH_SVC]  ? r14_svc  :
                 i_mode_rds_exec[OH_IRQ]  ? r14_irq  :
                                            r14_firq ;
 
 
// ========================================================
// Program Counter out
// ========================================================
assign o_pc = r15_out_rn;
 
// ========================================================
// Rm Selector
// ========================================================
assign o_rm = i_rm_sel == 4'd0  ? r0_out  :
              i_rm_sel == 4'd1  ? r1_out  : 
              i_rm_sel == 4'd2  ? r2_out  : 
              i_rm_sel == 4'd3  ? r3_out  : 
              i_rm_sel == 4'd4  ? r4_out  : 
              i_rm_sel == 4'd5  ? r5_out  : 
              i_rm_sel == 4'd6  ? r6_out  : 
              i_rm_sel == 4'd7  ? r7_out  : 
              i_rm_sel == 4'd8  ? r8_out  : 
              i_rm_sel == 4'd9  ? r9_out  : 
              i_rm_sel == 4'd10 ? r10_out : 
              i_rm_sel == 4'd11 ? r11_out : 
              i_rm_sel == 4'd12 ? r12_out : 
              i_rm_sel == 4'd13 ? r13_out : 
              i_rm_sel == 4'd14 ? r14_out : 
               			  r15_out_rm ; 
 
 
// ========================================================
// Rds Selector
// ========================================================
always @*
    case ( i_rs_sel )
       4'd0  :  o_rs = r0_out  ;
       4'd1  :  o_rs = r1_out  ; 
       4'd2  :  o_rs = r2_out  ; 
       4'd3  :  o_rs = r3_out  ; 
       4'd4  :  o_rs = r4_out  ; 
       4'd5  :  o_rs = r5_out  ; 
       4'd6  :  o_rs = r6_out  ; 
       4'd7  :  o_rs = r7_out  ; 
       4'd8  :  o_rs = r8_rds  ; 
       4'd9  :  o_rs = r9_rds  ; 
       4'd10 :  o_rs = r10_rds ; 
       4'd11 :  o_rs = r11_rds ; 
       4'd12 :  o_rs = r12_rds ; 
       4'd13 :  o_rs = r13_rds ; 
       4'd14 :  o_rs = r14_rds ; 
      default:  o_rs = r15_out_rn ; 
    endcase


 
// ========================================================
// Rd Selector
// ========================================================

always @*
    case ( i_rs_sel )
       4'd0  :  o_rd = r0_out  ;
       4'd1  :  o_rd = r1_out  ; 
       4'd2  :  o_rd = r2_out  ; 
       4'd3  :  o_rd = r3_out  ; 
       4'd4  :  o_rd = r4_out  ; 
       4'd5  :  o_rd = r5_out  ; 
       4'd6  :  o_rd = r6_out  ; 
       4'd7  :  o_rd = r7_out  ; 
       4'd8  :  o_rd = r8_rds  ; 
       4'd9  :  o_rd = r9_rds  ; 
       4'd10 :  o_rd = r10_rds ; 
       4'd11 :  o_rd = r11_rds ; 
       4'd12 :  o_rd = r12_rds ; 
       4'd13 :  o_rd = r13_rds ; 
       4'd14 :  o_rd = r14_rds ; 
       default: o_rd = r15_out_rm_nxt ; 
    endcase
 
 
// ========================================================
// Rn Selector
// ========================================================
assign o_rn = i_rn_sel == 4'd0  ? r0_out  :
              i_rn_sel == 4'd1  ? r1_out  : 
              i_rn_sel == 4'd2  ? r2_out  : 
              i_rn_sel == 4'd3  ? r3_out  : 
              i_rn_sel == 4'd4  ? r4_out  : 
              i_rn_sel == 4'd5  ? r5_out  : 
              i_rn_sel == 4'd6  ? r6_out  : 
              i_rn_sel == 4'd7  ? r7_out  : 
              i_rn_sel == 4'd8  ? r8_out  : 
              i_rn_sel == 4'd9  ? r9_out  : 
              i_rn_sel == 4'd10 ? r10_out : 
              i_rn_sel == 4'd11 ? r11_out : 
              i_rn_sel == 4'd12 ? r12_out : 
              i_rn_sel == 4'd13 ? r13_out : 
              i_rn_sel == 4'd14 ? r14_out : 
              			  r15_out_rn ; 
 
 
endmodule
