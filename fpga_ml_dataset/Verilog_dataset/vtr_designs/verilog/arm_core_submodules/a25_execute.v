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

module a25_execute (
 
i_clk,
i_core_stall,               
i_mem_stall,              
o_exec_stall,        
 
i_wb_read_data,            
i_wb_read_data_valid,   
i_wb_load_rd,              
 
i_copro_read_data,                                
i_decode_iaccess,          
i_decode_daccess,          
i_decode_load_rd,         
 
o_copro_write_data,
o_write_data,
o_iaddress,
o_iaddress_nxt,            
                                                       
o_iaddress_valid,     
o_daddress,         
o_daddress_nxt,         
                                                  
o_daddress_valid,    
o_adex,              
o_priviledged,      
o_exclusive,          
o_write_enable,
o_byte_enable,
o_exec_load_rd,      
o_status_bits,            
o_multiply_done,
 
i_status_bits_mode,
i_status_bits_irq_mask,
i_status_bits_firq_mask,
i_imm32,
i_imm_shift_amount,
i_shift_imm_zero,
i_condition,
i_decode_exclusive,    
 
i_rm_sel,
i_rs_sel,
i_rn_sel,
i_barrel_shift_amount_sel,
i_barrel_shift_data_sel,
i_barrel_shift_function,
i_alu_function,
i_multiply_function,
i_interrupt_vector_sel,
i_iaddress_sel,
i_daddress_sel,
i_pc_sel,
i_byte_enable_sel,
i_status_bits_sel,
i_reg_write_sel,
i_user_mode_regs_store_nxt,
i_firq_not_user_mode,
 
i_write_data_wen,
i_base_address_wen,   
i_pc_wen,
i_reg_bank_wen,
i_status_bits_flags_wen,
i_status_bits_mode_wen,
i_status_bits_irq_mask_wen,
i_status_bits_firq_mask_wen,
i_copro_write_data_wen,
i_conflict,
i_rn_use_read,
i_rm_use_read,
i_rs_use_read,
i_rd_use_read
);


//`include "a25/a25_localparams.v"

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
localparam [5:0] OH_USR  = 6'b0,	//0
                 OH_IRQ  = 6'b1,	//1
                 OH_FIRQ = 6'b10,	//2
                 OH_SVC  = 6'b11;	//3
 
 
//`include "a25/a25_functions.v"

input                       i_clk;
input                       i_core_stall;               // stall all stages of the Amber core at the same time
input                       i_mem_stall;                // data memory access stalls
output                      o_exec_stall;               // stall the core pipeline
 
input       [31:0]          i_wb_read_data;             // data reads
input                       i_wb_read_data_valid;       // read data is valid
input       [10:0]          i_wb_load_rd;               // Rd for data reads
 
input       [31:0]          i_copro_read_data;          // From Co-Processor, to either Register 
                                                        // or Memory
input                       i_decode_iaccess;           // Indicates an instruction access
input                       i_decode_daccess;           // Indicates a data access
input       [7:0]           i_decode_load_rd;           // The destination register for a load instruction
 
output      [31:0]          o_copro_write_data;
output      [31:0]          o_write_data;
output      [31:0]          o_iaddress;
output      [31:0]          o_iaddress_nxt;             // un-registered version of address to the 
                                                        // cache rams address ports
output                      o_iaddress_valid;     // High when instruction address is valid
output      [31:0]          o_daddress;         // Address to data cache
output      [31:0]          o_daddress_nxt;             // un-registered version of address to the 
                                                        // cache rams address ports
output                      o_daddress_valid;    // High when data address is valid
output                      o_adex;               // Address Exception
output                      o_priviledged;        // Priviledged access
output                      o_exclusive;          // swap access
output                      o_write_enable;
output      [3:0]           o_byte_enable;
output      [8:0]           o_exec_load_rd;       // The destination register for a load instruction
output      [31:0]          o_status_bits;              // Full PC will all status bits, but PC part zero'ed out
output                      o_multiply_done;
 
 
// --------------------------------------------------
// Control signals from Instruction Decode stage
// --------------------------------------------------
input      [1:0]            i_status_bits_mode;
input                       i_status_bits_irq_mask;
input                       i_status_bits_firq_mask;
input      [31:0]           i_imm32;
input      [4:0]            i_imm_shift_amount;
input                       i_shift_imm_zero;
input      [3:0]            i_condition;
input                       i_decode_exclusive;       // swap access
 
input      [3:0]            i_rm_sel;
input      [3:0]            i_rs_sel;
input      [3:0]            i_rn_sel;
input      [1:0]            i_barrel_shift_amount_sel;
input      [1:0]            i_barrel_shift_data_sel;
input      [1:0]            i_barrel_shift_function;
input      [8:0]            i_alu_function;
input      [1:0]            i_multiply_function;
input      [2:0]            i_interrupt_vector_sel;
input      [3:0]            i_iaddress_sel;
input      [3:0]            i_daddress_sel;
input      [2:0]            i_pc_sel;
input      [1:0]            i_byte_enable_sel;
input      [2:0]            i_status_bits_sel;
input      [2:0]            i_reg_write_sel;
input                       i_user_mode_regs_store_nxt;
input                       i_firq_not_user_mode;
 
input                       i_write_data_wen;
input                       i_base_address_wen;     // save LDM base address register, 
                                                    // in case of data abort
input                       i_pc_wen;
input      [14:0]           i_reg_bank_wen;
input                       i_status_bits_flags_wen;
input                       i_status_bits_mode_wen;
input                       i_status_bits_irq_mask_wen;
input                       i_status_bits_firq_mask_wen;
input                       i_copro_write_data_wen;
input                       i_conflict;
input                       i_rn_use_read;
input                       i_rm_use_read;
input                       i_rs_use_read;
input                       i_rd_use_read;



reg    [31:0]        o_copro_write_data = 32'd0;
reg    [31:0]        o_write_data = 32'd0;
reg    [31:0]        o_iaddress = 32'hdeaddead;

reg           	     o_iaddress_valid = 1'd0;     // High when instruction address is valid
reg    [31:0]        o_daddress = 32'h0;         // Address to data cache

reg   	             o_daddress_valid = 1'd0;     // High when data address is valid
reg            	     o_adex = 1'd0;               // Address Exception
reg            	     o_priviledged = 1'd0;        // Priviledged access
reg                  o_exclusive = 1'd0;          // swap access
reg                  o_write_enable = 1'd0;
reg    [3:0]         o_byte_enable = 4'd0;
reg    [8:0]         o_exec_load_rd = 9'd0;       // The destination register for a load instruction

 
// ========================================================
// Internal signals
// ========================================================
wire [31:0]         write_data_nxt;
wire [3:0]          byte_enable_nxt;
wire [31:0]         pc_plus4;
wire [31:0]         pc_minus4;
wire [31:0]         daddress_plus4;
wire [31:0]         alu_plus4;
wire [31:0]         rn_plus4;
wire [31:0]         alu_out;
wire [3:0]          alu_flags;
wire [31:0]         rm;
wire [31:0]         rs;
wire [31:0]         rd;
wire [31:0]         rn;
wire [31:0]         reg_bank_rn;
wire [31:0]         reg_bank_rm;
wire [31:0]         reg_bank_rs;
wire [31:0]         reg_bank_rd;
wire [31:0]         pc;
wire [31:0]         pc_nxt;
wire [31:0]         interrupt_vector;
wire [7:0]          shift_amount;
wire [31:0]         barrel_shift_in;
wire [31:0]         barrel_shift_out;
wire                barrel_shift_carry;
wire                barrel_shift_stall;
 
wire [3:0]          status_bits_flags_nxt;
reg  [3:0]          status_bits_flags = 4'd0;
wire [1:0]          status_bits_mode_nxt;
reg  [1:0]          status_bits_mode = 2'b11;    //SVC  =  2'b11
                    // one-hot encoded rs select
wire [3:0]          status_bits_mode_rds_oh_nxt;

//reg  [3:0]          status_bits_mode_rds_oh = 1'd1 << OH_SVC;
reg  [3:0]          status_bits_mode_rds_oh = 4'b1000;
wire                status_bits_mode_rds_oh_update;
wire                status_bits_irq_mask_nxt;
reg                 status_bits_irq_mask = 1'd1;
wire                status_bits_firq_mask_nxt;
reg                 status_bits_firq_mask = 1'd1;
wire [8:0]          exec_load_rd_nxt;
 
wire                execute;                    // high when condition execution is true
wire [31:0]         reg_write_nxt;
wire                pc_wen;
wire [14:0]         reg_bank_wen;
wire [31:0]         multiply_out;
wire [1:0]          multiply_flags;
reg  [31:0]         base_address = 32'd0;             // Saves base address during LDM instruction in 
                                                    // case of data abort
wire [31:0]         read_data_filtered1;
wire [31:0]         read_data_filtered;
wire [31:0]         read_data_filtered_c;
reg  [31:0]         read_data_filtered_r = 32'd0;
reg  [3:0]          load_rd_r = 4'd0;
wire [3:0]          load_rd_c;
 
wire                write_enable_nxt;
wire                daddress_valid_nxt;
wire                iaddress_valid_nxt;
wire                priviledged_nxt;      
wire                priviledged_update;
wire                iaddress_update;
wire                daddress_update;
wire                base_address_update;
wire                write_data_update;
wire                copro_write_data_update;
wire                byte_enable_update;
wire                exec_load_rd_update;
wire                write_enable_update;
wire                exclusive_update;
wire                status_bits_flags_update;
wire                status_bits_mode_update;
wire                status_bits_irq_mask_update;
wire                status_bits_firq_mask_update;
 
wire [31:0]         alu_out_pc_filtered;
wire                adex_nxt;
wire [31:0]         save_int_pc;
wire [31:0]         save_int_pc_m4;
wire                ldm_flags;
wire                ldm_status_bits;
 

// ========================================================
// Status Bits in PC register
// ========================================================
wire [1:0] status_bits_mode_out;
wire  [3:0] pc_dmem_wen;  //jing


assign status_bits_mode_out = (i_status_bits_mode_wen && i_status_bits_sel == 3'd1 && !ldm_status_bits) ? 
                                    alu_out[1:0] : status_bits_mode ;
 
assign o_status_bits = {   status_bits_flags,           // 31:28
                           status_bits_irq_mask,        // 7   27
                           status_bits_firq_mask,       // 6   26
                           24'd0,			//     25:2
                           status_bits_mode_out };      // 1:0 = mode
 

// ========================================================
// Status Bits Select
// ========================================================
assign ldm_flags                 = i_wb_read_data_valid & ~i_mem_stall & i_wb_load_rd[8];
assign ldm_status_bits           = i_wb_read_data_valid & ~i_mem_stall & i_wb_load_rd[7];
 
 
assign status_bits_flags_nxt     = ldm_flags                 ? read_data_filtered[31:28]           :
                                   i_status_bits_sel == 3'd0 ? alu_flags                           :
                                   i_status_bits_sel == 3'd1 ? alu_out          [31:28]            :
                                   i_status_bits_sel == 3'd3 ? i_copro_read_data[31:28]            :
                                   // 4 = update status_bits_flags after a multiply operation
                                                        { multiply_flags, status_bits_flags[1:0] } ;
 
assign status_bits_mode_nxt      = ldm_status_bits           ? read_data_filtered [1:0] :
                                   i_status_bits_sel == 3'd0 ? i_status_bits_mode       :
                                   i_status_bits_sel == 3'd1 ? alu_out            [1:0] :
                                                               i_copro_read_data  [1:0] ;
 
 
// Used for the Rds output of register_bank - this special version of
// status_bits_mode speeds up the critical path from status_bits_mode through the
// register_bank, barrel_shifter and alu. It moves a mux needed for the
// i_user_mode_regs_store_nxt signal back into the previous stage -
// so its really part of the decode stage even though the logic is right here
// In addition the signal is one-hot encoded to further speed up the logic
 
//assign status_bits_mode_rds_oh_nxt    = i_user_mode_regs_store_nxt ? 1'd1 << OH_USR                            :
//                                       status_bits_mode_update    ? oh_status_bits_mode(status_bits_mode_nxt) :
//                                                                     oh_status_bits_mode(status_bits_mode)     ;


assign status_bits_mode_rds_oh_nxt    = i_user_mode_regs_store_nxt ? 4'b0001                            :  //1'd1 << OH_USR 
                                        status_bits_mode_update    ?   (  status_bits_mode_nxt == SVC  ? 4'b1000  : //1'd1 << OH_SVC
							                  status_bits_mode_nxt == IRQ  ? 4'b0010  : //1'd1 << OH_IRQ
             							          status_bits_mode_nxt == FIRQ ? 4'b0100 : //1'd1 << OH_FIRQ
							            		                         4'b0001  ): //1'd1 << OH_USR
								
                                            	                      (   status_bits_mode == SVC  ? 4'b1000  : //1'd1 << OH_SVC
							                  status_bits_mode == IRQ  ? 4'b0010  : //1'd1 << OH_IRQ
             							          status_bits_mode == FIRQ ? 4'b0100 : //1'd1 << OH_FIRQ
												     4'b0001  ); //1'd1 << OH_USR
 									 
assign status_bits_irq_mask_nxt  = ldm_status_bits           ? read_data_filtered     [27] :
                                   i_status_bits_sel == 3'd0 ? i_status_bits_irq_mask      :
                                   i_status_bits_sel == 3'd1 ? alu_out                [27] :
                                                               i_copro_read_data      [27] ;
 
assign status_bits_firq_mask_nxt = ldm_status_bits           ? read_data_filtered     [26] :
                                   i_status_bits_sel == 3'd0 ? i_status_bits_firq_mask     :
                                   i_status_bits_sel == 3'd1 ? alu_out                [26] :
                                                               i_copro_read_data      [26] ;
// ========================================================
// Adders
// ========================================================
assign pc_plus4       = pc         + 32'd4;
assign pc_minus4      = pc         - 32'd4;
assign daddress_plus4 = o_daddress + 32'd4;
assign alu_plus4      = alu_out    + 32'd4;
assign rn_plus4       = rn         + 32'd4;
 
// ========================================================
// Barrel Shift Amount Select
// ========================================================
// An immediate shift value of 0 is translated into 32
assign shift_amount = i_barrel_shift_amount_sel == 2'd0 ? 8'd0                         :
                      i_barrel_shift_amount_sel == 2'd1 ? rs[7:0]                      :
                                                          {3'd0, i_imm_shift_amount  } ;
 
 
// ========================================================
// Barrel Shift Data Select
// ========================================================
assign barrel_shift_in = i_barrel_shift_data_sel == 2'd0 ? i_imm32 : rm ;
 
 
// ========================================================
// Interrupt vector Select
// ========================================================
 
assign interrupt_vector = // Reset vector
                          (i_interrupt_vector_sel == 3'd0) ? 32'h00000000 :  
                          // Data abort interrupt vector                 
                          (i_interrupt_vector_sel == 3'd1) ? 32'h00000010 :
                          // Fast interrupt vector  
                          (i_interrupt_vector_sel == 3'd2) ? 32'h0000001c :
                          // Regular interrupt vector
                          (i_interrupt_vector_sel == 3'd3) ? 32'h00000018 :
                          // Prefetch abort interrupt vector
                          (i_interrupt_vector_sel == 3'd5) ? 32'h0000000c :
                          // Undefined instruction interrupt vector
                          (i_interrupt_vector_sel == 3'd6) ? 32'h00000004 :
                          // Software (SWI) interrupt vector
                          (i_interrupt_vector_sel == 3'd7) ? 32'h00000008 :
                          // Default is the address exception interrupt
                                                             32'h00000014 ;
 
 
// ========================================================
// Address Select
// ========================================================

assign pc_dmem_wen    = i_wb_read_data_valid & ~i_mem_stall & i_wb_load_rd[3:0] == 4'd15;
//always @( posedge i_clk )
//	pc_dmem_wen    = i_wb_read_data_valid & ~i_mem_stall & i_wb_load_rd[3:0] == 4'd15;
 
// If rd is the pc, then seperate the address bits from the status bits for
// generating the next address to fetch
//assign alu_out_pc_filtered = pc_wen && i_pc_sel == 3'd1 ? pcf(alu_out) : alu_out;

assign alu_out_pc_filtered = pc_wen && i_pc_sel == 3'd1 ? {6'd0, alu_out[25:2], 2'd0} : alu_out;
 
// if current instruction does not execute because it does not meet the condition
// then address advances to next instruction
assign o_iaddress_nxt = (pc_dmem_wen)            ? {6'd0, read_data_filtered[25:2], 2'd0} :
                        (!execute)               ? pc_plus4                : 
                        (i_iaddress_sel == 4'd0) ? pc_plus4                :
                        (i_iaddress_sel == 4'd1) ? alu_out_pc_filtered     :
                        (i_iaddress_sel == 4'd2) ? interrupt_vector        :
                                                   pc                      ;
  
// if current instruction does not execute because it does not meet the condition
// then address advances to next instruction
assign o_daddress_nxt = (i_daddress_sel == 4'd1) ? alu_out_pc_filtered   :
                        (i_daddress_sel == 4'd2) ? interrupt_vector      :
                        (i_daddress_sel == 4'd4) ? rn                    :
                        (i_daddress_sel == 4'd5) ? daddress_plus4        :  // MTRANS address incrementer
                        (i_daddress_sel == 4'd6) ? alu_plus4             :  // MTRANS decrement after
                                                   rn_plus4              ;  // MTRANS increment before
 
// Data accesses use 32-bit address space, but instruction
// accesses are restricted to 26 bit space
assign adex_nxt      = |o_iaddress_nxt[31:26] && i_decode_iaccess;
 
 
// ========================================================
// Filter Read Data
// ========================================================
// mem_load_rd[10:9]-> shift ROR bytes
// mem_load_rd[8]   -> load flags with PC
// mem_load_rd[7]   -> load status bits with PC
// mem_load_rd[6:5] -> Write into this Mode registers
// mem_load_rd[4]   -> zero_extend byte
// mem_load_rd[3:0] -> Destination Register 
assign read_data_filtered1 = i_wb_load_rd[10:9] == 2'd0 ? i_wb_read_data                                :
                             i_wb_load_rd[10:9] == 2'd1 ? {i_wb_read_data[7:0],  i_wb_read_data[31:8]}  :
                             i_wb_load_rd[10:9] == 2'd2 ? {i_wb_read_data[15:0], i_wb_read_data[31:16]} :
                                                          {i_wb_read_data[23:0], i_wb_read_data[31:24]} ;
 
assign read_data_filtered  = i_wb_load_rd[4] ? {24'd0, read_data_filtered1[7:0]} : read_data_filtered1 ; 
 
 
// ========================================================
// Program Counter Select
// ========================================================
// If current instruction does not execute because it does not meet the condition
// then PC advances to next instruction
assign pc_nxt = (!execute)       ? pc_plus4                :
                i_pc_sel == 3'd0 ? pc_plus4                :
                i_pc_sel == 3'd1 ? alu_out                 :
                i_pc_sel == 3'd2 ? interrupt_vector        :
                i_pc_sel == 3'd3 ? {6'd0, read_data_filtered[25:2], 2'd0} :
                                   pc_minus4               ;
 
 
// ========================================================
// Register Write Select
// ========================================================
 
assign save_int_pc    = { status_bits_flags, 
                          status_bits_irq_mask, 
                          status_bits_firq_mask, 
                          pc[25:2], 
                          status_bits_mode      };
 
 
assign save_int_pc_m4 = { status_bits_flags, 
                          status_bits_irq_mask, 
                          status_bits_firq_mask, 
                          pc_minus4[25:2], 
                          status_bits_mode      };
 
 
assign reg_write_nxt = i_reg_write_sel == 3'd0 ? alu_out               :
                       // save pc to lr on an interrupt                    
                       i_reg_write_sel == 3'd1 ? save_int_pc_m4        :
                       // to update Rd at the end of Multiplication
                       i_reg_write_sel == 3'd2 ? multiply_out          :
                       i_reg_write_sel == 3'd3 ? o_status_bits         :
                       i_reg_write_sel == 3'd5 ? i_copro_read_data     :  // mrc
                       i_reg_write_sel == 3'd6 ? base_address          :
                                                 save_int_pc           ;  
 
 
// ========================================================
// Byte Enable Select
// ========================================================
assign byte_enable_nxt = i_byte_enable_sel == 2'd0   ? 4'b1111 :  // word write
                         i_byte_enable_sel == 2'd2   ?            // halfword write
                         ( o_daddress_nxt[1] == 1'd0 ? 4'b0011 : 
                                                       4'b1100  ) :
 
                         o_daddress_nxt[1:0] == 2'd0 ? 4'b0001 :  // byte write
                         o_daddress_nxt[1:0] == 2'd1 ? 4'b0010 :
                         o_daddress_nxt[1:0] == 2'd2 ? 4'b0100 :
                                                       4'b1000 ;
 
 
// ========================================================
// Write Data Select
// ========================================================
assign write_data_nxt = i_byte_enable_sel == 2'd0 ? rd            :
                                                    {rd[7:0],rd[7:0],rd[7:0],rd[7:0]} ;
 
 
// ========================================================
// Conditional Execution
// ========================================================
//assign execute = conditional_execute ( i_condition, status_bits_flags );

assign execute = ( i_condition == AL                                        ) ||
                 ( i_condition == EQ  &&  status_bits_flags[2]                          ) ||
                 ( i_condition == NE  && !status_bits_flags[2]                          ) ||
                 ( i_condition == CS  &&  status_bits_flags[1]                          ) ||
                 ( i_condition == CC  && !status_bits_flags[1]                          ) ||
                 ( i_condition == MI  &&  status_bits_flags[3]                          ) ||
                 ( i_condition == PL  && !status_bits_flags[3]                          ) ||
                 ( i_condition == VS  &&  status_bits_flags[0]                          ) ||
                 ( i_condition == VC  && !status_bits_flags[0]                          ) ||
                 ( i_condition == HI  &&    status_bits_flags[1] && !status_bits_flags[2]           ) ||
                 ( i_condition == LS  &&  (!status_bits_flags[1] ||  status_bits_flags[2])          ) ||
                 ( i_condition == GE  &&  status_bits_flags[3] == status_bits_flags[0]              ) ||
                 ( i_condition == LT  &&  status_bits_flags[3] != status_bits_flags[0]              ) ||
                 ( i_condition == GT  &&  !status_bits_flags[2] && status_bits_flags[3] == status_bits_flags[0] ) ||
                 ( i_condition == LE  &&  (status_bits_flags[2] || status_bits_flags[3] != status_bits_flags[0])) ;
 
 
// allow the PC to increment to the next instruction when current
// instruction does not execute
assign pc_wen       = (i_pc_wen || !execute) && !i_conflict;
 
// only update register bank if current instruction executes
//assign reg_bank_wen = {{15{execute}} & i_reg_bank_wen};
 assign reg_bank_wen = (execute == 1'd1) ? {15'b111111111111111 & i_reg_bank_wen}   :
					{15'b0 & i_reg_bank_wen};
 
// ========================================================
// Priviledged output flag
// ========================================================
// Need to look at status_bits_mode_nxt so switch to priviledged mode
// at the same time as assert interrupt vector address

assign priviledged_nxt  = ( i_status_bits_mode_wen ? status_bits_mode_nxt : status_bits_mode ) != USR ;
 
 
// ========================================================
// Write Enable
// ========================================================
// This must be de-asserted when execute is fault

assign write_enable_nxt = execute && i_write_data_wen;
 
 
// ========================================================
// Address Valid
// ========================================================
assign daddress_valid_nxt = execute && i_decode_daccess && !i_core_stall;
 
// For some multi-cycle instructions, the stream of instrution
// reads can be paused. However if the instruction does not execute
// then the read stream must not be interrupted.
assign iaddress_valid_nxt = i_decode_iaccess || !execute;
 
// ========================================================
// Use read value from data memory instead of from register
// ========================================================
assign rn = i_rn_use_read && i_rn_sel == load_rd_c ? read_data_filtered_c : reg_bank_rn;
assign rm = i_rm_use_read && i_rm_sel == load_rd_c ? read_data_filtered_c : reg_bank_rm;
assign rs = i_rs_use_read && i_rs_sel == load_rd_c ? read_data_filtered_c : reg_bank_rs;
assign rd = i_rd_use_read && i_rs_sel == load_rd_c ? read_data_filtered_c : reg_bank_rd;
 
 
always@( posedge i_clk )
    if ( i_wb_read_data_valid )
        begin
        read_data_filtered_r <= read_data_filtered;
        load_rd_r            <= i_wb_load_rd[3:0];
        end
 
assign read_data_filtered_c = i_wb_read_data_valid ? read_data_filtered : read_data_filtered_r;
assign load_rd_c            = i_wb_read_data_valid ? i_wb_load_rd[3:0]  : load_rd_r;
 
 
// ========================================================
// Set mode for the destination registers of a mem read
// ========================================================
// The mode is either user mode, or the current mode
assign  exec_load_rd_nxt   = { i_decode_load_rd[7:6], 
                               i_decode_load_rd[5] ? USR : status_bits_mode,  // 1 bit -> 2 bits
                               i_decode_load_rd[4:0] };
 
 
// ========================================================
// Register Update
// ========================================================
assign o_exec_stall                    = barrel_shift_stall;
 
assign daddress_update                 = !i_core_stall;
assign exec_load_rd_update             = !i_core_stall && execute;
assign priviledged_update              = !i_core_stall;       
assign exclusive_update                = !i_core_stall && execute;
assign write_enable_update             = !i_core_stall;
assign write_data_update               = !i_core_stall && execute && i_write_data_wen;
assign byte_enable_update              = !i_core_stall && execute && i_write_data_wen;
 
assign iaddress_update                 = pc_dmem_wen || (!i_core_stall && !i_conflict);
assign copro_write_data_update         = !i_core_stall && execute && i_copro_write_data_wen;
 
assign base_address_update             = !i_core_stall && execute && i_base_address_wen; 
assign status_bits_flags_update        = ldm_flags       || (!i_core_stall && execute && i_status_bits_flags_wen);
assign status_bits_mode_update         = ldm_status_bits || (!i_core_stall && execute && i_status_bits_mode_wen);
assign status_bits_mode_rds_oh_update  = !i_core_stall;
assign status_bits_irq_mask_update     = ldm_status_bits || (!i_core_stall && execute && i_status_bits_irq_mask_wen);
assign status_bits_firq_mask_update    = ldm_status_bits || (!i_core_stall && execute && i_status_bits_firq_mask_wen);
 
 
always @( posedge i_clk )
    begin                                                                                                             
    o_daddress              <= daddress_update                ? o_daddress_nxt               : o_daddress;    
    o_daddress_valid        <= daddress_update                ? daddress_valid_nxt           : o_daddress_valid;
    o_exec_load_rd          <= exec_load_rd_update            ? exec_load_rd_nxt             : o_exec_load_rd;
    o_priviledged           <= priviledged_update             ? priviledged_nxt              : o_priviledged;
    o_exclusive             <= exclusive_update               ? i_decode_exclusive           : o_exclusive;
    o_write_enable          <= write_enable_update            ? write_enable_nxt             : o_write_enable;
    o_write_data            <= write_data_update              ? write_data_nxt               : o_write_data; 
    o_byte_enable           <= byte_enable_update             ? byte_enable_nxt              : o_byte_enable;
    o_iaddress              <= iaddress_update                ? o_iaddress_nxt               : o_iaddress;    
    o_iaddress_valid        <= iaddress_update                ? iaddress_valid_nxt           : o_iaddress_valid;
    o_adex                  <= iaddress_update                ? adex_nxt                     : o_adex;    
    o_copro_write_data      <= copro_write_data_update        ? write_data_nxt               : o_copro_write_data; 
 
    base_address            <= base_address_update            ? rn                           : base_address;    
 
    status_bits_flags       <= status_bits_flags_update       ? status_bits_flags_nxt        : status_bits_flags;
    status_bits_mode        <= status_bits_mode_update        ? status_bits_mode_nxt         : status_bits_mode;
    status_bits_mode_rds_oh <= status_bits_mode_rds_oh_update ? status_bits_mode_rds_oh_nxt  : status_bits_mode_rds_oh;
    status_bits_irq_mask    <= status_bits_irq_mask_update    ? status_bits_irq_mask_nxt     : status_bits_irq_mask;
    status_bits_firq_mask   <= status_bits_firq_mask_update   ? status_bits_firq_mask_nxt    : status_bits_firq_mask;
    end
 
 
// ========================================================
// Instantiate Barrel Shift
// ========================================================
a25_barrel_shift u_barrel_shift  (
    .i_clk            ( i_clk                     ),
    .i_in             ( barrel_shift_in           ),
    .i_carry_in       ( status_bits_flags[1]      ),
    .i_shift_amount   ( shift_amount              ),
    .i_shift_imm_zero ( i_shift_imm_zero          ),
    .i_function       ( i_barrel_shift_function   ),
 
    .o_out            ( barrel_shift_out          ),
    .o_carry_out      ( barrel_shift_carry        ),
    .o_stall          ( barrel_shift_stall        )
);
 
 
// ========================================================
// Instantiate ALU
// ========================================================
a25_alu u_alu (
    .i_a_in                 ( rn                    ),
    .i_b_in                 ( barrel_shift_out      ),
    .i_barrel_shift_carry   ( barrel_shift_carry    ),
    .i_status_bits_carry    ( status_bits_flags[1]  ),
    .i_function             ( i_alu_function        ),
 
    .o_out                  ( alu_out               ),
    .o_flags                ( alu_flags             )
);
 
 
// ========================================================
// Instantiate Booth 64-bit Multiplier-Accumulator
// ========================================================
a25_multiply u_multiply (
    .i_clk          ( i_clk                 ),
    .i_core_stall   ( i_core_stall          ),
    .i_a_in         ( rs                    ),
    .i_b_in         ( rm                    ),
    .i_function     ( i_multiply_function   ),
    .i_execute      ( execute               ),
    .o_out          ( multiply_out          ),
    .o_flags        ( multiply_flags        ),  // [1] = N, [0] = Z
    .o_done         ( o_multiply_done       )     
);
 
 
// ========================================================
// Instantiate Register Bank
// ========================================================
a25_register_bank u_register_bank(
    .i_clk                   ( i_clk                     ),
    .i_core_stall            ( i_core_stall              ),
    .i_mem_stall             ( i_mem_stall               ),
    .i_mode_idec             ( i_status_bits_mode        ),
    .i_mode_exec             ( status_bits_mode          ),
    .i_mode_rds_exec         ( status_bits_mode_rds_oh   ),  

    // pre-encoded in decode stage to speed up long path
    .i_firq_not_user_mode    ( i_firq_not_user_mode      ),
    .i_rm_sel                ( i_rm_sel                  ),
    .i_rs_sel                ( i_rs_sel                  ),
    .i_rn_sel                ( i_rn_sel                  ),
    .i_pc_wen                ( pc_wen                    ),
    .i_reg_bank_wen          ( reg_bank_wen              ),
    .i_pc                    ( pc_nxt[25:2]              ),
    .i_reg                   ( reg_write_nxt             ),


 
    .i_wb_read_data          ( read_data_filtered        ),
    .i_wb_read_data_valid    ( i_wb_read_data_valid      ),
    .i_wb_read_data_rd       ( i_wb_load_rd[3:0]         ),
    .i_wb_mode               ( i_wb_load_rd[6:5]         ),
 
    .i_status_bits_flags     ( status_bits_flags         ),
    .i_status_bits_irq_mask  ( status_bits_irq_mask      ),
    .i_status_bits_firq_mask ( status_bits_firq_mask     ),
 

 
    // use one-hot version for speed, combine with i_user_mode_regs_store

 
    .o_rm                    ( reg_bank_rm               ),
    .o_rs                    ( reg_bank_rs               ),
    .o_rd                    ( reg_bank_rd               ),
    .o_rn                    ( reg_bank_rn               ),
    .o_pc                    ( pc                        )
);
 
 
 
// ========================================================
// Debug - non-synthesizable code
// ========================================================
//synopsys translate_off
 
wire    [(2*8)-1:0]    xCONDITION;
wire    [(4*8)-1:0]    xMODE;
 
assign  xCONDITION           = i_condition == EQ ? "EQ"  :
                               i_condition == NE ? "NE"  :
                               i_condition == CS ? "CS"  :
                               i_condition == CC ? "CC"  :
                               i_condition == MI ? "MI"  :
                               i_condition == PL ? "PL"  :
                               i_condition == VS ? "VS"  :
                               i_condition == VC ? "VC"  :
                               i_condition == HI ? "HI"  :
                               i_condition == LS ? "LS"  :
                               i_condition == GE ? "GE"  :
                               i_condition == LT ? "LT"  :
                               i_condition == GT ? "GT"  :
                               i_condition == LE ? "LE"  :
                               i_condition == AL ? "AL"  :
                                                   "NV " ;
 
assign  xMODE  =  status_bits_mode == SVC  ? "SVC"  :
                  status_bits_mode == IRQ  ? "IRQ"  :
                  status_bits_mode == FIRQ ? "FIRQ" :
                  			     "USR"  ;
 
 
//synopsys translate_on
 
endmodule
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
module a25_multiply (
			i_clk,
			i_core_stall,
 
			i_a_in,        
			i_b_in,       
			i_function,
			i_execute,
 
			o_out,
			o_flags,        
			o_done                                  
		);
 
input                       i_clk;
input                       i_core_stall;
 
input       [31:0]          i_a_in;         // Rds
input       [31:0]          i_b_in;         // Rm
input       [1:0]           i_function;
input                       i_execute;
 
output      [31:0]          o_out;
output      [1:0]           o_flags;        // [1] = N, [0] = Z
output                      o_done;   // goes high 2 cycles before completion    
 
reg         o_done = 1'd0;
wire	    enable;
wire        accumulate;
wire [33:0] multiplier;
wire [33:0] multiplier_bar;
wire [33:0] sum;
wire [33:0] sum34_b;
 
reg  [5:0]  count = 6'd0;
reg  [5:0]  count_nxt;
reg  [67:0] product = 68'd0;
reg  [67:0] product_nxt;
reg  [1:0]  flags_nxt;
wire [32:0] sum_acc1;           // the MSB is the carry out for the upper 32 bit addition
 
 
assign enable         = i_function[0];
assign accumulate     = i_function[1];
 
assign multiplier     =  { 2'd0, i_a_in} ;
assign multiplier_bar = ~{ 2'd0, i_a_in} + 34'd1 ;
 
assign sum34_b        =  product[1:0] == 2'b01 ? multiplier     :
                         product[1:0] == 2'b10 ? multiplier_bar :
                                                 34'd0          ;
 

    // -----------------------------------
    // 34-bit adder - booth multiplication
    // -----------------------------------
    assign sum =  product[67:34] + sum34_b;
 
    // ------------------------------------
    // 33-bit adder - accumulate operations
    // ------------------------------------
    assign sum_acc1 = {1'd0, product[32:1]} + {1'd0, i_a_in};

  //  assign count_nxt = count;
  
always @*
    begin

 
    // update Negative and Zero flags
    // Use registered value of product so this adds an extra cycle
    // but this avoids having the 64-bit zero comparator on the
    // main adder path
    flags_nxt   = { product[32], product[32:1] == 32'd0 }; 
 
 
    if ( count == 6'd0 )
        product_nxt = {33'd0, 1'd0, i_b_in, 1'd0 } ;
    else if ( count <= 6'd33 )
        product_nxt = { sum[33], sum, product[33:1]} ;
    else if ( count == 6'd34 && accumulate )
        begin
        // Note that bit 0 is not part of the product. It is used during the booth
        // multiplication algorithm
        product_nxt         = { product[64:33], sum_acc1[31:0], 1'd0}; // Accumulate
        end
    else
        product_nxt         = product;

 
    // Multiplication state counter
    if (count == 6'd0)  // start
        count_nxt   = enable ? 6'd1 : 6'd0;
    else if ((count == 6'd34 && !accumulate) ||  // MUL
             (count == 6'd35 &&  accumulate)  )  // MLA
        count_nxt   = 6'd0;
    else
        count_nxt   = count + 1'd1;
    end
 
 
always @ ( posedge i_clk )
    if ( !i_core_stall )
        begin
        count           <= i_execute ? count_nxt          : count;           
        product         <= i_execute ? product_nxt        : product;        
        o_done          <= i_execute ? count == 6'd31     : o_done;          
        end
 
// Outputs
assign o_out   = product[32:1]; 
assign o_flags = flags_nxt;
 
endmodule
module a25_alu (
 
		i_a_in,
		i_b_in,
		i_barrel_shift_carry,
		i_status_bits_carry,
		i_function, 
		o_out,
		o_flags
);

/************************* IO Declarations *********************/
input       [31:0]          i_a_in;
input       [31:0]          i_b_in;
input                       i_barrel_shift_carry;
input                       i_status_bits_carry;
input       [8:0]           i_function;
 
output      [31:0]          o_out;
output      [3:0]           o_flags;
 
/*********************** Signal Declarations *******************/
wire     [31:0]         a;
wire     [31:0]         b;
wire     [31:0]         b_not;
wire     [31:0]         and_out;
wire     [31:0]         or_out;
wire     [31:0]         xor_out;
wire     [31:0]         sign_ex8_out;
wire     [31:0]         sign_ex_16_out;
wire     [31:0]         zero_ex8_out;
wire     [31:0]         zero_ex_16_out;
wire     [32:0]         fadder_out;
wire                    swap_sel;
wire                    not_sel;
wire     [1:0]          cin_sel;
wire                    cout_sel;
wire     [3:0]          out_sel;
wire                    carry_in;
wire                    carry_out;
wire                    overflow_out;
wire                    fadder_carry_out;
 
assign  { swap_sel, not_sel, cin_sel, cout_sel, out_sel } = i_function;
 

assign a     = (swap_sel ) ? i_b_in : i_a_in ;
 
// ========================================================
// B Select
// ========================================================
assign b     = (swap_sel ) ? i_a_in : i_b_in ;
 
// ========================================================
// Not Select
// ========================================================
assign b_not     = (not_sel ) ? ~b : b ;
 
// ========================================================
// Cin Select
// ========================================================
assign carry_in  = (cin_sel==2'd0 ) ? 1'd0                   :
                   (cin_sel==2'd1 ) ? 1'd1                   :
                                      i_status_bits_carry    ;  // add with carry
 
// ========================================================
// Cout Select
// ========================================================
assign carry_out = (cout_sel==1'd0 ) ? fadder_carry_out     :
                                       i_barrel_shift_carry ;
 
// For non-addition/subtractions that incorporate a shift 
// operation, C is set to the last bit
// shifted out of the value by the shifter.
 
 
// ========================================================
// Overflow out
// ========================================================
// Only assert the overflow flag when using the adder
assign  overflow_out    = out_sel == 4'd1 &&
                            // overflow if adding two positive numbers and get a negative number
                          ( (!a[31] && !b_not[31] && fadder_out[31]) ||
                            // or adding two negative numbers and get a positive number
                            (a[31] && b_not[31] && !fadder_out[31])     );
 
 
// ========================================================
// ALU Operations
// ========================================================
 

assign fadder_out       = { 1'd0,a} + {1'd0,b_not} + {32'd0,carry_in};
                                              
 
assign fadder_carry_out = fadder_out[32];
assign and_out          = a & b_not;
assign or_out           = a | b_not;
assign xor_out          = a ^ b_not;
assign zero_ex8_out     = {24'd0,  b_not[7:0]};
assign zero_ex_16_out   = {16'd0,  b_not[15:0]};
assign sign_ex8_out     = {{24{b_not[7]}},  b_not[7:0]};
assign sign_ex_16_out   = {{16{b_not[15]}}, b_not[15:0]};
 
// ========================================================
// Out Select
// ========================================================
assign o_out = out_sel == 4'd0 ? b_not            : 
               out_sel == 4'd1 ? fadder_out[31:0] : 
               out_sel == 4'd2 ? zero_ex_16_out   :
               out_sel == 4'd3 ? zero_ex8_out     :
               out_sel == 4'd4 ? sign_ex_16_out   :
               out_sel == 4'd5 ? sign_ex8_out     :
               out_sel == 4'd6 ? xor_out          :
               out_sel == 4'd7 ? or_out           :
                                 and_out          ;
 
assign o_flags       = {  o_out[31],      // negative
                         |o_out == 1'd0,  // zero
                         carry_out,       // carry
                         overflow_out     // overflow
                         };
 

endmodule
module a25_barrel_shift (
 
			i_clk,
			i_in,
			i_carry_in,
			i_shift_amount,     
			i_shift_imm_zero,  
			i_function,
 
			o_out,
			o_carry_out,
			o_stall
 
);

/************************* IO Declarations *********************/ 
input                       i_clk;
input       [31:0]          i_in;
input                       i_carry_in;
input       [7:0]           i_shift_amount;    // uses 8 LSBs of Rs, or a 5 bit immediate constant
input                       i_shift_imm_zero;   // high when immediate shift value of zero selected
input       [1:0]           i_function;
 
output      [31:0]          o_out;
output                      o_carry_out;
output                      o_stall;

/************************* IO Declarations *********************/ 
wire [31:0] quick_out;
wire        quick_carry_out;
wire [31:0] full_out;
wire        full_carry_out;
reg  [31:0] full_out_r       = 32'd0;
reg         full_carry_out_r = 1'd0;
reg         use_quick_r      = 1'd1;
 
 
assign o_stall      = (|i_shift_amount[7:2]) & use_quick_r;
assign o_out        = use_quick_r ? quick_out : full_out_r;
assign o_carry_out  = use_quick_r ? quick_carry_out : full_carry_out_r;
 
 
// Capture the result from the full barrel shifter in case the
// quick shifter gives the wrong value
always @(posedge i_clk)
    begin
    full_out_r       <= full_out;
    full_carry_out_r <= full_carry_out;
    use_quick_r      <= !o_stall;
    end
 
// Full barrel shifter
a25_shifter_full u_shifter_full (
    .i_in               ( i_in             ),
    .i_carry_in         ( i_carry_in       ),
    .i_shift_amount     ( i_shift_amount   ),   
    .i_shift_imm_zero   ( i_shift_imm_zero ), 
    .i_function         ( i_function       ),
    .o_out              ( full_out         ),
    .o_carry_out        ( full_carry_out   )
);
 
 
 
// Quick barrel shifter
a25_shifter_quick u_shifter_quick (
    .i_in               ( i_in             ),
    .i_carry_in         ( i_carry_in       ),
    .i_shift_amount     ( i_shift_amount   ),   
    .i_shift_imm_zero   ( i_shift_imm_zero ), 
    .i_function         ( i_function       ),
    .o_out              ( quick_out        ),
    .o_carry_out        ( quick_carry_out  )
);

endmodule
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
module a25_shifter_full 
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
 
    assign lsl_out = i_shift_imm_zero         ? {i_carry_in, i_in              } :  // fall through case 
 
                     i_shift_amount == 8'd0  ? {i_carry_in, i_in              } :  // fall through case
                     i_shift_amount == 8'd1  ? {i_in[31],   i_in[30: 0],  1'd0} :
                     i_shift_amount == 8'd2  ? {i_in[30],   i_in[29: 0],  2'd0} :
                     i_shift_amount == 8'd3  ? {i_in[29],   i_in[28: 0],  3'd0} :
                     i_shift_amount == 8'd4  ? {i_in[28],   i_in[27: 0],  4'd0} :
                     i_shift_amount == 8'd5  ? {i_in[27],   i_in[26: 0],  5'd0} :
                     i_shift_amount == 8'd6  ? {i_in[26],   i_in[25: 0],  6'd0} :
                     i_shift_amount == 8'd7  ? {i_in[25],   i_in[24: 0],  7'd0} :
                     i_shift_amount == 8'd8  ? {i_in[24],   i_in[23: 0],  8'd0} :
                     i_shift_amount == 8'd9  ? {i_in[23],   i_in[22: 0],  9'd0} :
                     i_shift_amount == 8'd10  ? {i_in[22],   i_in[21: 0], 10'd0} :
                     i_shift_amount == 8'd11  ? {i_in[21],   i_in[20: 0], 11'd0} :
 
                     i_shift_amount == 8'd12  ? {i_in[20],   i_in[19: 0], 12'd0} :
                     i_shift_amount == 8'd13  ? {i_in[19],   i_in[18: 0], 13'd0} :
                     i_shift_amount == 8'd14  ? {i_in[18],   i_in[17: 0], 14'd0} :
                     i_shift_amount == 8'd15  ? {i_in[17],   i_in[16: 0], 15'd0} :
                     i_shift_amount == 8'd16  ? {i_in[16],   i_in[15: 0], 16'd0} :
                     i_shift_amount == 8'd17  ? {i_in[15],   i_in[14: 0], 17'd0} :
                     i_shift_amount == 8'd18  ? {i_in[14],   i_in[13: 0], 18'd0} :
                     i_shift_amount == 8'd19  ? {i_in[13],   i_in[12: 0], 19'd0} :
                     i_shift_amount == 8'd20  ? {i_in[12],   i_in[11: 0], 20'd0} :
                     i_shift_amount == 8'd21  ? {i_in[11],   i_in[10: 0], 21'd0} :
 
                     i_shift_amount == 8'd22  ? {i_in[10],   i_in[ 9: 0], 22'd0} :
                     i_shift_amount == 8'd23  ? {i_in[ 9],   i_in[ 8: 0], 23'd0} :
                     i_shift_amount == 8'd24  ? {i_in[ 8],   i_in[ 7: 0], 24'd0} :
                     i_shift_amount == 8'd25  ? {i_in[ 7],   i_in[ 6: 0], 25'd0} :
                     i_shift_amount == 8'd26  ? {i_in[ 6],   i_in[ 5: 0], 26'd0} :
                     i_shift_amount == 8'd27  ? {i_in[ 5],   i_in[ 4: 0], 27'd0} :
                     i_shift_amount == 8'd28  ? {i_in[ 4],   i_in[ 3: 0], 28'd0} :
                     i_shift_amount == 8'd29  ? {i_in[ 3],   i_in[ 2: 0], 29'd0} :
                     i_shift_amount == 8'd30  ? {i_in[ 2],   i_in[ 1: 0], 30'd0} :
                     i_shift_amount == 8'd31  ? {i_in[ 1],   i_in[ 0: 0], 31'd0} :
                     i_shift_amount == 8'd32  ? {i_in[ 0],   32'd0             } :  // 32
                                                {1'd0,       32'd0             } ;  // > 32
 

// The form of the shift field which might be expected to correspond to LSR #0 is used
// to encode LSR #32, which has a zero result with bit 31 of Rm as the carry output. 
 
                                               // carry out, < -------- out ---------->
    assign lsr_out = i_shift_imm_zero         ? {i_in[31], 32'd0             } :
                     i_shift_amount == 8'd0  ? {i_carry_in, i_in            } :  // fall through case
                     i_shift_amount == 8'd1  ? {i_in[ 0],  1'd0, i_in[31: 1]} :
                     i_shift_amount == 8'd2  ? {i_in[ 1],  2'd0, i_in[31: 2]} :
                     i_shift_amount == 8'd3  ? {i_in[ 2],  3'd0, i_in[31: 3]} :
                     i_shift_amount == 8'd4  ? {i_in[ 3],  4'd0, i_in[31: 4]} :
                     i_shift_amount == 8'd5  ? {i_in[ 4],  5'd0, i_in[31: 5]} :
                     i_shift_amount == 8'd6  ? {i_in[ 5],  6'd0, i_in[31: 6]} :
                     i_shift_amount == 8'd7  ? {i_in[ 6],  7'd0, i_in[31: 7]} :
                     i_shift_amount == 8'd8  ? {i_in[ 7],  8'd0, i_in[31: 8]} :
                     i_shift_amount == 8'd9  ? {i_in[ 8],  9'd0, i_in[31: 9]} :
 
                     i_shift_amount == 8'd10  ? {i_in[ 9], 10'd0, i_in[31:10]} :
                     i_shift_amount == 8'd11  ? {i_in[10], 11'd0, i_in[31:11]} :
                     i_shift_amount == 8'd12  ? {i_in[11], 12'd0, i_in[31:12]} :
                     i_shift_amount == 8'd13  ? {i_in[12], 13'd0, i_in[31:13]} :
                     i_shift_amount == 8'd14  ? {i_in[13], 14'd0, i_in[31:14]} :
                     i_shift_amount == 8'd15  ? {i_in[14], 15'd0, i_in[31:15]} :
                     i_shift_amount == 8'd16  ? {i_in[15], 16'd0, i_in[31:16]} :
                     i_shift_amount == 8'd17  ? {i_in[16], 17'd0, i_in[31:17]} :
                     i_shift_amount == 8'd18  ? {i_in[17], 18'd0, i_in[31:18]} :
                     i_shift_amount == 8'd19  ? {i_in[18], 19'd0, i_in[31:19]} :
 
                     i_shift_amount == 8'd20  ? {i_in[19], 20'd0, i_in[31:20]} :
                     i_shift_amount == 8'd21  ? {i_in[20], 21'd0, i_in[31:21]} :
                     i_shift_amount == 8'd22  ? {i_in[21], 22'd0, i_in[31:22]} :
                     i_shift_amount == 8'd23  ? {i_in[22], 23'd0, i_in[31:23]} :
                     i_shift_amount == 8'd24  ? {i_in[23], 24'd0, i_in[31:24]} :
                     i_shift_amount == 8'd25  ? {i_in[24], 25'd0, i_in[31:25]} :
                     i_shift_amount == 8'd26  ? {i_in[25], 26'd0, i_in[31:26]} :
                     i_shift_amount == 8'd27  ? {i_in[26], 27'd0, i_in[31:27]} :
                     i_shift_amount == 8'd28  ? {i_in[27], 28'd0, i_in[31:28]} :
                     i_shift_amount == 8'd29  ? {i_in[28], 29'd0, i_in[31:29]} :
 
                     i_shift_amount == 8'd30  ? {i_in[29], 30'd0, i_in[31:30]} :
                     i_shift_amount == 8'd31  ? {i_in[30], 31'd0, i_in[31   ]} :
                     i_shift_amount == 8'd32  ? {i_in[31], 32'd0             } :
                                                {1'd0,     32'd0             } ;  // > 32
 
// The form of the shift field which might be expected to give ASR #0 is used to encode
// ASR #32. Bit 31 of Rm is again used as the carry output, and each bit of operand 2 is
// also equal to bit 31 of Rm. The result is therefore all ones or all zeros, according to
// the value of bit 31 of Rm.
  
                                              // carry out, < -------- out ---------->
    assign asr_out = i_shift_imm_zero         ? {i_in[31], {32{i_in[31]}}             } :
                     i_shift_amount == 8'd0  ? {i_carry_in, i_in                     } :  // fall through case
                     i_shift_amount == 8'd1  ? {i_in[ 0], { 2{i_in[31]}}, i_in[30: 1]} :
                     i_shift_amount == 8'd2  ? {i_in[ 1], { 3{i_in[31]}}, i_in[30: 2]} :
                     i_shift_amount == 8'd3  ? {i_in[ 2], { 4{i_in[31]}}, i_in[30: 3]} :
                     i_shift_amount == 8'd4  ? {i_in[ 3], { 5{i_in[31]}}, i_in[30: 4]} :
                     i_shift_amount == 8'd5  ? {i_in[ 4], { 6{i_in[31]}}, i_in[30: 5]} :
                     i_shift_amount == 8'd6  ? {i_in[ 5], { 7{i_in[31]}}, i_in[30: 6]} :
                     i_shift_amount == 8'd7  ? {i_in[ 6], { 8{i_in[31]}}, i_in[30: 7]} :
                     i_shift_amount == 8'd8  ? {i_in[ 7], { 9{i_in[31]}}, i_in[30: 8]} :
                     i_shift_amount == 8'd9  ? {i_in[ 8], {10{i_in[31]}}, i_in[30: 9]} :
 
                     i_shift_amount == 8'd10  ? {i_in[ 9], {11{i_in[31]}}, i_in[30:10]} :
                     i_shift_amount == 8'd11  ? {i_in[10], {12{i_in[31]}}, i_in[30:11]} :
                     i_shift_amount == 8'd12  ? {i_in[11], {13{i_in[31]}}, i_in[30:12]} :
                     i_shift_amount == 8'd13  ? {i_in[12], {14{i_in[31]}}, i_in[30:13]} :
                     i_shift_amount == 8'd14  ? {i_in[13], {15{i_in[31]}}, i_in[30:14]} :
                     i_shift_amount == 8'd15  ? {i_in[14], {16{i_in[31]}}, i_in[30:15]} :
                     i_shift_amount == 8'd16  ? {i_in[15], {17{i_in[31]}}, i_in[30:16]} :
                     i_shift_amount == 8'd17  ? {i_in[16], {18{i_in[31]}}, i_in[30:17]} :
                     i_shift_amount == 8'd18  ? {i_in[17], {19{i_in[31]}}, i_in[30:18]} :
                     i_shift_amount == 8'd19  ? {i_in[18], {20{i_in[31]}}, i_in[30:19]} :
 
                     i_shift_amount == 8'd20  ? {i_in[19], {21{i_in[31]}}, i_in[30:20]} :
                     i_shift_amount == 8'd21  ? {i_in[20], {22{i_in[31]}}, i_in[30:21]} :
                     i_shift_amount == 8'd22  ? {i_in[21], {23{i_in[31]}}, i_in[30:22]} :
                     i_shift_amount == 8'd23  ? {i_in[22], {24{i_in[31]}}, i_in[30:23]} :
                     i_shift_amount == 8'd24  ? {i_in[23], {25{i_in[31]}}, i_in[30:24]} :
                     i_shift_amount == 8'd25  ? {i_in[24], {26{i_in[31]}}, i_in[30:25]} :
                     i_shift_amount == 8'd26  ? {i_in[25], {27{i_in[31]}}, i_in[30:26]} :
                     i_shift_amount == 8'd27  ? {i_in[26], {28{i_in[31]}}, i_in[30:27]} :
                     i_shift_amount == 8'd28  ? {i_in[27], {29{i_in[31]}}, i_in[30:28]} :
                     i_shift_amount == 8'd29  ? {i_in[28], {30{i_in[31]}}, i_in[30:29]} :
                     i_shift_amount == 8'd30  ? {i_in[29], {31{i_in[31]}}, i_in[30   ]} :
                     i_shift_amount == 8'd31  ? {i_in[30], {32{i_in[31]}}             } :
                                                {i_in[31], {32{i_in[31]}}             } ; // >= 32
  
 
                                                  // carry out, < ------- out --------->
    assign ror_out = i_shift_imm_zero              ? {i_in[ 0], i_carry_in,  i_in[31: 1]} :  // RXR, (ROR w/ imm 0)
 
                     i_shift_amount[7:0] == 8'd0  ? {i_carry_in, i_in                  } :  // fall through case
 
                     i_shift_amount[4:0] == 5'd0  ? {i_in[31], i_in                    } :  // Rs > 31
                     i_shift_amount[4:0] == 5'd1  ? {i_in[ 0], i_in[    0], i_in[31: 1]} :
                     i_shift_amount[4:0] == 5'd2  ? {i_in[ 1], i_in[ 1: 0], i_in[31: 2]} :
                     i_shift_amount[4:0] == 5'd3  ? {i_in[ 2], i_in[ 2: 0], i_in[31: 3]} :
                     i_shift_amount[4:0] == 5'd4  ? {i_in[ 3], i_in[ 3: 0], i_in[31: 4]} :
                     i_shift_amount[4:0] == 5'd5  ? {i_in[ 4], i_in[ 4: 0], i_in[31: 5]} :
                     i_shift_amount[4:0] == 5'd6  ? {i_in[ 5], i_in[ 5: 0], i_in[31: 6]} :
                     i_shift_amount[4:0] == 5'd7  ? {i_in[ 6], i_in[ 6: 0], i_in[31: 7]} :
                     i_shift_amount[4:0] == 5'd8  ? {i_in[ 7], i_in[ 7: 0], i_in[31: 8]} :
                     i_shift_amount[4:0] == 5'd9  ? {i_in[ 8], i_in[ 8: 0], i_in[31: 9]} :
 
                     i_shift_amount[4:0] == 5'd10  ? {i_in[ 9], i_in[ 9: 0], i_in[31:10]} :
                     i_shift_amount[4:0] == 5'd11  ? {i_in[10], i_in[10: 0], i_in[31:11]} :
                     i_shift_amount[4:0] == 5'd12  ? {i_in[11], i_in[11: 0], i_in[31:12]} :
                     i_shift_amount[4:0] == 5'd13  ? {i_in[12], i_in[12: 0], i_in[31:13]} :
                     i_shift_amount[4:0] == 5'd14  ? {i_in[13], i_in[13: 0], i_in[31:14]} :
                     i_shift_amount[4:0] == 5'd15  ? {i_in[14], i_in[14: 0], i_in[31:15]} :
                     i_shift_amount[4:0] == 5'd16  ? {i_in[15], i_in[15: 0], i_in[31:16]} :
                     i_shift_amount[4:0] == 5'd17  ? {i_in[16], i_in[16: 0], i_in[31:17]} :
                     i_shift_amount[4:0] == 5'd18  ? {i_in[17], i_in[17: 0], i_in[31:18]} :
                     i_shift_amount[4:0] == 5'd19  ? {i_in[18], i_in[18: 0], i_in[31:19]} :
 
                     i_shift_amount[4:0] == 5'd20  ? {i_in[19], i_in[19: 0], i_in[31:20]} :
                     i_shift_amount[4:0] == 5'd21  ? {i_in[20], i_in[20: 0], i_in[31:21]} :
                     i_shift_amount[4:0] == 5'd22  ? {i_in[21], i_in[21: 0], i_in[31:22]} :
                     i_shift_amount[4:0] == 5'd23  ? {i_in[22], i_in[22: 0], i_in[31:23]} :
                     i_shift_amount[4:0] == 5'd24  ? {i_in[23], i_in[23: 0], i_in[31:24]} :
                     i_shift_amount[4:0] == 5'd25  ? {i_in[24], i_in[24: 0], i_in[31:25]} :
                     i_shift_amount[4:0] == 5'd26  ? {i_in[25], i_in[25: 0], i_in[31:26]} :
                     i_shift_amount[4:0] == 5'd27  ? {i_in[26], i_in[26: 0], i_in[31:27]} :
                     i_shift_amount[4:0] == 5'd28  ? {i_in[27], i_in[27: 0], i_in[31:28]} :
                     i_shift_amount[4:0] == 5'd29  ? {i_in[28], i_in[28: 0], i_in[31:29]} :
 
                     i_shift_amount[4:0] == 5'd30  ? {i_in[29], i_in[29: 0], i_in[31:30]} :
                                                     {i_in[30], i_in[30: 0], i_in[31:31]} ;
  
assign {o_carry_out, o_out} = i_function == LSL ? lsl_out :
                              i_function == LSR ? lsr_out :
                              i_function == ASR ? asr_out :
                                                  ror_out ;
 
endmodule
