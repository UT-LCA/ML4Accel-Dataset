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

module a25_decode(
		i_clk,
		i_fetch_instruction,
		i_core_stall,                   
		i_irq,                        
		i_firq,                        
		i_dabt,                    
		i_iabt,                         
		i_adex,                        
		i_execute_iaddress,             
	//	i_execute_daddress,             
		i_abt_status,                   
		i_execute_status_bits,      
		i_multiply_done,             
 

		o_imm32,
		o_imm_shift_amount,
		o_shift_imm_zero,
		o_condition,    
		o_decode_exclusive,      
		o_decode_iaccess,     
		o_decode_daccess,       
		o_status_bits_mode,  
		o_status_bits_irq_mask,
		o_status_bits_firq_mask,
 
		o_rm_sel,
		o_rs_sel,
		o_load_rd,                

		o_rn_sel,
		o_barrel_shift_amount_sel,
		o_barrel_shift_data_sel,
		o_barrel_shift_function,
		o_alu_function,
		o_multiply_function,
		o_interrupt_vector_sel,
		o_iaddress_sel,
		o_daddress_sel,
		o_pc_sel,
		o_byte_enable_sel,      
		o_status_bits_sel,
		o_reg_write_sel,
		o_user_mode_regs_store_nxt,
		o_firq_not_user_mode,
 
		o_write_data_wen,
		o_base_address_wen,      
                                                          
		o_pc_wen,
		o_reg_bank_wen,
		o_status_bits_flags_wen,
		o_status_bits_mode_wen,
		o_status_bits_irq_mask_wen,
		o_status_bits_firq_mask_wen,
 
		o_copro_opcode1,
		o_copro_opcode2,
		o_copro_crn,    
		o_copro_crm,
		o_copro_num,
		o_copro_operation, 
                                                    
		o_copro_write_data_wen,
		o_iabt_trigger,
		o_iabt_address,
		o_iabt_status,
		o_dabt_trigger,
		o_dabt_address,
		o_dabt_status,
		o_conflict,
		o_rn_use_read,
		o_rm_use_read,
		o_rs_use_read,
		o_rd_use_read
);

/************************* IO Declarations *********************/
input                       i_clk;
input       [31:0]          i_fetch_instruction;
input                       i_core_stall;                   // stall all stages of the Amber core at the same time
input                       i_irq;                          // interrupt request
input                       i_firq;                         // Fast interrupt request
input                       i_dabt;                         // data abort interrupt request
input                       i_iabt;                         // instruction pre-fetch abort flag
input                       i_adex;                         // Address Exception
input       [31:0]          i_execute_iaddress;             // Registered instruction address output by execute stage
//input       [31:0]          i_execute_daddress;             // Registered instruction address output by execute stage
input       [7:0]           i_abt_status;                   // Abort status
input       [31:0]          i_execute_status_bits;         // current status bits values in execute stage
input                       i_multiply_done;                // multiply unit is nearly done
 
 
// --------------------------------------------------
// Control signals to execute stage
// --------------------------------------------------
output  [31:0]          o_imm32;
output  [4:0]           o_imm_shift_amount;
output                  o_shift_imm_zero;
output  [3:0]           o_condition;             // 4'he = al
output                  o_decode_exclusive;       // exclusive access request ( swap instruction )
output                  o_decode_iaccess;        // Indicates an instruction access
output                  o_decode_daccess;         // Indicates a data access
output  [1:0]           o_status_bits_mode;     // SVC
output                  o_status_bits_irq_mask;
output                  o_status_bits_firq_mask;
 
output  [3:0]           o_rm_sel;
output  [3:0]           o_rs_sel;
output  [7:0]           o_load_rd;               // [7] load flags with PC
                                                            // [6] load status bits with PC
                                                            // [5] Write into User Mode register
                                                            // [4] zero-extend load
                                                            // [3:0] destination register, Rd
output  [3:0]           o_rn_sel;
output  [1:0]           o_barrel_shift_amount_sel;
output  [1:0]           o_barrel_shift_data_sel;
output  [1:0]           o_barrel_shift_function;
output  [8:0]           o_alu_function;
output  [1:0]           o_multiply_function;
output  [2:0]           o_interrupt_vector_sel;
output  [3:0]           o_iaddress_sel;
output  [3:0]           o_daddress_sel;
output  [2:0]           o_pc_sel;
output  [1:0]           o_byte_enable_sel;        // byte, halfword or word write
output  [2:0]           o_status_bits_sel;
output  [2:0]           o_reg_write_sel;
output                  o_user_mode_regs_store_nxt;
output                  o_firq_not_user_mode;
 
output                  o_write_data_wen;
output                  o_base_address_wen;     // save ldm base address register
                                                            // in case of data abort
output                  o_pc_wen;
output  [14:0]          o_reg_bank_wen;
output                  o_status_bits_flags_wen;
output                  o_status_bits_mode_wen;
output                  o_status_bits_irq_mask_wen;
output                  o_status_bits_firq_mask_wen;
 
// --------------------------------------------------
// Co-Processor interface
// --------------------------------------------------
output  [2:0]           o_copro_opcode1;
output  [2:0]           o_copro_opcode2;
output  [3:0]           o_copro_crn;    
output  [3:0]           o_copro_crm;
output  [3:0]           o_copro_num;
output  [1:0]           o_copro_operation; // 0 = no operation, 
                                                     // 1 = Move to Amber Core Register from Coprocessor
                                                     // 2 = Move to Coprocessor from Amber Core Register
output                  o_copro_write_data_wen;
output                  o_iabt_trigger;
output  [31:0]          o_iabt_address;
output  [7:0]           o_iabt_status;
output                  o_dabt_trigger;
output  [31:0]          o_dabt_address;
output  [7:0]           o_dabt_status;
output                  o_conflict;
output                  o_rn_use_read;
output                  o_rm_use_read;
output                  o_rs_use_read;
output                  o_rd_use_read;




/*********************** Signal Declarations *******************/

reg     [31:0]      o_imm32 = 32'd0;
reg     [4:0]       o_imm_shift_amount = 5'd0;
reg           	    o_shift_imm_zero = 1'd0;
reg     [3:0]       o_condition = 4'he;             // 4'he = al
reg                 o_decode_exclusive = 1'd0;       // exclusive access request ( swap instruction )
reg           	    o_decode_iaccess = 1'd1;        // Indicates an instruction access
reg           	    o_decode_daccess = 1'd0;         // Indicates a data access
reg     [1:0]       o_status_bits_mode = 2'b11;     // SVC
reg          	    o_status_bits_irq_mask = 1'd1;
reg           	    o_status_bits_firq_mask = 1'd1;
 
reg     [3:0]       o_rm_sel  = 4'd0;
reg     [3:0]       o_rs_sel  = 4'd0;
reg     [7:0]       o_load_rd = 8'd0;                // [7] load flags with PC
                                                            
reg     [3:0]       o_rn_sel  = 4'd0;
reg     [1:0]       o_barrel_shift_amount_sel = 2'd0;
reg     [1:0]       o_barrel_shift_data_sel = 2'd0;
reg     [1:0]       o_barrel_shift_function = 2'd0;
reg     [8:0]       o_alu_function = 9'd0;
reg     [1:0] 	    o_multiply_function = 2'd0;
reg     [2:0]       o_interrupt_vector_sel = 3'd0;
reg     [3:0]       o_iaddress_sel = 4'd2;
reg     [3:0]       o_daddress_sel = 4'd2;
reg     [2:0]       o_pc_sel = 3'd2;
reg     [1:0]       o_byte_enable_sel = 2'd0;        // byte, halfword or word write
reg     [2:0]       o_status_bits_sel = 3'd0;
reg     [2:0]       o_reg_write_sel;
reg           	    o_user_mode_regs_store_nxt;
reg           	    o_firq_not_user_mode;
 
reg           	    o_write_data_wen = 1'd0;
reg           	    o_base_address_wen = 1'd0;       // save ldm base address register
                                                            // in case of data abort
reg           	    o_pc_wen = 1'd1;
reg     [14:0]      o_reg_bank_wen = 15'd0;
reg           	    o_status_bits_flags_wen = 1'd0;
reg           	    o_status_bits_mode_wen = 1'd0;
reg           	    o_status_bits_irq_mask_wen = 1'd0;
reg           	    o_status_bits_firq_mask_wen = 1'd0;
 
// --------------------------------------------------
// Co-Processor interface
// --------------------------------------------------
reg     [2:0]       o_copro_opcode1 = 3'd0;
reg     [2:0]       o_copro_opcode2 = 3'd0;
reg     [3:0]       o_copro_crn = 4'd0;    
reg     [3:0]       o_copro_crm = 4'd0;
reg     [3:0]       o_copro_num = 4'd0;
reg     [1:0]       o_copro_operation = 2'd0; // 0 = no operation, 
                                                     // 1 = Move to Amber Core Register from Coprocessor
                                                     // 2 = Move to Coprocessor from Amber Core Register
reg           o_copro_write_data_wen = 1'd0;
reg           o_rn_use_read;
reg           o_rm_use_read;
reg           o_rs_use_read;
reg           o_rd_use_read;
 
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
 
 

 
localparam [4:0] RST_WAIT1      = 5'd0,
                 RST_WAIT2      = 5'd1,
                 INT_WAIT1      = 5'd2,
                 INT_WAIT2      = 5'd3,
                 EXECUTE        = 5'd4,
                 PRE_FETCH_EXEC = 5'd5,  // Execute the Pre-Fetched Instruction
                 MEM_WAIT1      = 5'd6,  // conditionally decode current instruction, in case
                                         // previous instruction does not execute in S2
                 MEM_WAIT2      = 5'd7,
                 PC_STALL1      = 5'd8,  // Program Counter altered
                                         // conditionally decude current instruction, in case
                                         // previous instruction does not execute in S2
                 PC_STALL2      = 5'd9,
                 MTRANS_EXEC1   = 5'd10,
                 MTRANS_EXEC2   = 5'd11,
                 MTRANS_ABORT   = 5'd12,
                 MULT_PROC1     = 5'd13,  // first cycle, save pre fetch instruction
                 MULT_PROC2     = 5'd14,  // do multiplication
                 MULT_STORE     = 5'd15,  // save RdLo
                 MULT_ACCUMU    = 5'd16,  // Accumulate add lower 32 bits
                 SWAP_WRITE     = 5'd17,
                 SWAP_WAIT1     = 5'd18,
                 SWAP_WAIT2     = 5'd19,
                 COPRO_WAIT     = 5'd20;
 
 
// ========================================================
// Internal signals
// ========================================================
wire    [31:0]         instruction;
wire    [3:0]          type;                    // regop, mem access etc.
wire                   instruction_iabt;        // abort flag, follows the instruction
wire                   instruction_adex;        // address exception flag, follows the instruction
wire    [31:0]         instruction_address;     // instruction virtual address, follows 
                                                // the instruction
wire    [7:0]          instruction_iabt_status; // abort status, follows the instruction
wire    [1:0]          instruction_sel;
wire    [3:0]          opcode;
wire    [7:0]          imm8;
wire    [31:0]         offset12;
wire    [31:0]         offset24;
wire    [4:0]          shift_imm;
 
wire                   opcode_compare;
wire                   mem_op;
wire                   load_op;
wire                   store_op;
wire                   write_pc;
wire                   current_write_pc;
reg                    load_pc_nxt;
reg                    load_pc_r = 1'd0;
wire                   immediate_shift_op;
wire                   rds_use_rs;
wire                   branch;
wire                   mem_op_pre_indexed;
wire                   mem_op_post_indexed;
 
// Flop inputs
wire    [31:0]         imm32_nxt;
wire    [4:0]          imm_shift_amount_nxt;
wire                   shift_imm_zero_nxt;
wire    [3:0]          condition_nxt;
reg                    decode_exclusive_nxt;
reg                    decode_iaccess_nxt;
reg                    decode_daccess_nxt;
 
reg     [1:0]          barrel_shift_function_nxt;
wire    [8:0]          alu_function_nxt;
reg     [1:0]          multiply_function_nxt;
reg     [1:0]          status_bits_mode_nxt;
reg                    status_bits_irq_mask_nxt;
reg                    status_bits_firq_mask_nxt;
 
wire    [3:0]          rm_sel_nxt;
wire    [3:0]          rs_sel_nxt;
 
wire    [3:0]          rn_sel_nxt;
reg     [1:0]          barrel_shift_amount_sel_nxt;
reg     [1:0]          barrel_shift_data_sel_nxt;
reg     [3:0]          iaddress_sel_nxt;
reg     [3:0]          daddress_sel_nxt;
reg     [2:0]          pc_sel_nxt;
reg     [1:0]          byte_enable_sel_nxt;
reg     [2:0]          status_bits_sel_nxt;
reg     [2:0]          reg_write_sel_nxt;
wire                   firq_not_user_mode_nxt;
 
// ALU Function signals
reg                    alu_swap_sel_nxt;
reg                    alu_not_sel_nxt;
reg     [1:0]          alu_cin_sel_nxt;
reg                    alu_cout_sel_nxt;
reg     [3:0]          alu_out_sel_nxt;
 
reg                    write_data_wen_nxt;
reg                    copro_write_data_wen_nxt;
reg                    base_address_wen_nxt;
reg                    pc_wen_nxt;
reg     [14:0]         reg_bank_wen_nxt;
reg                    status_bits_flags_wen_nxt;
reg                    status_bits_mode_wen_nxt;
reg                    status_bits_irq_mask_wen_nxt;
reg                    status_bits_firq_mask_wen_nxt;
 
reg                    saved_current_instruction_wen;   // saved load instruction
reg                    pre_fetch_instruction_wen;       // pre-fetch instruction
 
reg     [4:0]          control_state = 5'd0;   //RST_WAIT1
reg     [4:0]          control_state_nxt;
 
 
wire                   dabt;
reg                    dabt_reg = 1'd0;
reg                    dabt_reg_d1;
reg                    iabt_reg = 1'd0;
reg                    adex_reg = 1'd0;
reg     [31:0]         fetch_address_r = 32'd0;
reg     [7:0]          abt_status_reg = 8'd0;
reg     [31:0]         fetch_instruction_r = 32'd0;
reg     [3:0]          fetch_instruction_type_r = 4'd0;
reg     [31:0]         saved_current_instruction = 32'd0;
reg     [3:0]          saved_current_instruction_type = 4'd0;
reg                    saved_current_instruction_iabt = 1'd0;          // access abort flag
reg                    saved_current_instruction_adex = 1'd0;          // address exception
reg     [31:0]         saved_current_instruction_address = 32'd0;       // virtual address of abort instruction
reg     [7:0]          saved_current_instruction_iabt_status = 8'd0;   // status of abort instruction
reg     [31:0]         pre_fetch_instruction = 32'd0;
reg     [3:0]          pre_fetch_instruction_type = 4'd0;
reg                    pre_fetch_instruction_iabt = 1'd0;              // access abort flag
reg                    pre_fetch_instruction_adex = 1'd0;              // address exception
reg     [31:0]         pre_fetch_instruction_address = 32'd0;           // virtual address of abort instruction
reg     [7:0]          pre_fetch_instruction_iabt_status = 8'd0;       // status of abort instruction
reg     [31:0]         hold_instruction = 32'd0;
reg     [3:0]          hold_instruction_type = 4'd0;
reg                    hold_instruction_iabt = 1'd0;                   // access abort flag
reg                    hold_instruction_adex = 1'd0;                   // address exception
reg     [31:0]         hold_instruction_address = 32'd0;                // virtual address of abort instruction
reg     [7:0]          hold_instruction_iabt_status = 8'd0;            // status of abort instruction
 
wire                   instruction_valid;
wire                   instruction_execute;
reg                    instruction_execute_r = 1'd0;
 
reg     [3:0]          mtrans_reg1;             // the current register being accessed as part of stm/ldm
reg     [3:0]          mtrans_reg2;             // the next register being accessed as part of stm/ldm
reg     [31:0]         mtrans_instruction_nxt;
wire    [15:0]         mtrans_reg2_mask;
 
wire   [31:0]          mtrans_base_reg_change;
wire   [4:0]           mtrans_num_registers;
wire                   use_saved_current_instruction;
wire                   use_hold_instruction;
wire                   use_pre_fetch_instruction;
wire                   interrupt;
wire                   interrupt_or_conflict;
wire   [1:0]           interrupt_mode;
wire   [2:0]           next_interrupt;
reg                    irq = 1'd0;
reg                    firq = 1'd0;
wire		       firq_request;
wire                   irq_request;
wire                   swi_request;
wire                   und_request;
wire                   dabt_request;
reg    [1:0]           copro_operation_nxt;
reg                    restore_base_address = 1'd0;
reg                    restore_base_address_nxt;
 
wire                   regop_set_flags;
 
wire    [7:0]          load_rd_nxt;
wire                   load_rd_byte;
wire                   ldm_user_mode;
wire                   ldm_status_bits; 
wire                   ldm_flags; 
wire    [6:0]          load_rd_d1_nxt;
reg     [6:0]          load_rd_d1 = 7'd0;  // MSB is the valid bit
 
wire                   rn_valid;
wire                   rm_valid;
wire                   rs_valid;
wire                   rd_valid;
wire                   stm_valid;
wire                   rn_conflict1;
wire                   rn_conflict2;
wire                   rm_conflict1;
wire                   rm_conflict2;
wire                   rs_conflict1;
wire                   rs_conflict2;
wire                   rd_conflict1;
wire                   rd_conflict2;
wire                   stm_conflict1a;
wire                   stm_conflict1b;
wire                   stm_conflict2a;
wire                   stm_conflict2b;
wire                   conflict1;          // Register conflict1 with ldr operation
wire                   conflict2;          // Register conflict1 with ldr operation
wire                   conflict;           // Register conflict1 with ldr operation
reg                    conflict_r = 1'd0;
reg                    rn_conflict1_r = 1'd0;
reg                    rm_conflict1_r = 1'd0;
reg                    rs_conflict1_r = 1'd0;
reg                    rd_conflict1_r = 1'd0;
wire	[11:0]	       i_fetch; 
 
// ========================================================
// Instruction Abort and Data Abort outputs
// ========================================================


assign o_iabt_trigger     = instruction_iabt && o_status_bits_mode == SVC && control_state == INT_WAIT1;
assign o_iabt_address     = instruction_address;
assign o_iabt_status      = instruction_iabt_status;
 
assign o_dabt_trigger     = dabt_reg && !dabt_reg_d1;
assign o_dabt_address     = fetch_address_r;
assign o_dabt_status      = abt_status_reg;
 
 
// ========================================================
// Instruction Decode
// ========================================================
 
// for instructions that take more than one cycle
// the instruction is saved in the 'saved_mem_instruction'
// register and then that register is used for the rest of
// the execution of the instruction.
// But if the instruction does not execute because of the
// condition, then need to select the next instruction to
// decode
assign use_saved_current_instruction = instruction_execute &&
                          ( control_state == MEM_WAIT1     ||
                            control_state == MEM_WAIT2     ||
                            control_state == MTRANS_EXEC1  ||
                            control_state == MTRANS_EXEC2  || 
                            control_state == MTRANS_ABORT  ||
                            control_state == MULT_PROC1    ||
                            control_state == MULT_PROC2    ||
                            control_state == MULT_ACCUMU   ||
                            control_state == MULT_STORE    ||
                            control_state == INT_WAIT1     ||
                            control_state == INT_WAIT2     ||
                            control_state == SWAP_WRITE    ||
                            control_state == SWAP_WAIT1    ||
                            control_state == SWAP_WAIT2    ||
                            control_state == COPRO_WAIT     );
 
assign use_hold_instruction = conflict_r;
 
assign use_pre_fetch_instruction = control_state == PRE_FETCH_EXEC;
 
 
assign instruction_sel  =         use_hold_instruction           ? 2'd3 :  // hold_instruction
                                  use_saved_current_instruction  ? 2'd1 :  // saved_current_instruction 
                                  use_pre_fetch_instruction      ? 2'd2 :  // pre_fetch_instruction     
                                                                   2'd0 ;  // fetch_instruction_r               
 
assign instruction      =         instruction_sel == 2'd0 ? fetch_instruction_r       :
                                  instruction_sel == 2'd1 ? saved_current_instruction :
                                  instruction_sel == 2'd3 ? hold_instruction          :
                                                            pre_fetch_instruction     ;
 
assign type             =         instruction_sel == 2'd0 ? fetch_instruction_type_r       :
                                  instruction_sel == 2'd1 ? saved_current_instruction_type :
                                  instruction_sel == 2'd3 ? hold_instruction_type          :
                                                            pre_fetch_instruction_type     ;                                                       
 
// abort flag
assign instruction_iabt =         instruction_sel == 2'd0 ? iabt_reg                       :
                                  instruction_sel == 2'd1 ? saved_current_instruction_iabt :
                                  instruction_sel == 2'd3 ? hold_instruction_iabt          :
                                                            pre_fetch_instruction_iabt     ;
 
assign instruction_address =      instruction_sel == 2'd0 ? fetch_address_r                   :
                                  instruction_sel == 2'd1 ? saved_current_instruction_address :
                                  instruction_sel == 2'd3 ? hold_instruction_address          :
                                                            pre_fetch_instruction_address     ;
 
assign instruction_iabt_status =  instruction_sel == 2'd0 ? abt_status_reg                        :
                                  instruction_sel == 2'd1 ? saved_current_instruction_iabt_status :
                                  instruction_sel == 2'd3 ? hold_instruction_iabt_status          :
                                                            pre_fetch_instruction_iabt_status     ;
 
// instruction address exception
assign instruction_adex =         instruction_sel == 2'd0 ? adex_reg                       :
                                  instruction_sel == 2'd1 ? saved_current_instruction_adex :
                                  instruction_sel == 2'd3 ? hold_instruction_adex          :
                                                            pre_fetch_instruction_adex     ;
 
 
// ========================================================
// Fixed fields within the instruction
// ========================================================
 
assign opcode               = instruction[24:21];
assign condition_nxt        = instruction[31:28];
 
assign rm_sel_nxt           = instruction[3:0];
assign rn_sel_nxt           = branch ? 4'd15 : instruction[19:16]; // Use PC to calculate branch destination
assign rs_sel_nxt           = control_state == SWAP_WRITE  ? instruction[3:0]   : // Rm gets written out to memory
                              type == MTRANS               ? mtrans_reg1         :
                              branch                       ? 4'd15              : // Update the PC
                              rds_use_rs                   ? instruction[11:8]  : 
                                                             instruction[15:12] ;
 
// Load from memory into registers
assign ldm_user_mode        = type == MTRANS && {instruction[22:20],instruction[15]} == 4'b1010;
assign ldm_flags            = type == MTRANS && rs_sel_nxt == 4'd15 && instruction[20] && instruction[22];
assign ldm_status_bits      = type == MTRANS && rs_sel_nxt == 4'd15 && instruction[20] && instruction[22] && i_execute_status_bits[1:0] != USR;
assign load_rd_byte         = (type == TRANS || type == SWAP) && instruction[22];
assign load_rd_nxt          = {ldm_flags, ldm_status_bits, ldm_user_mode, load_rd_byte, rs_sel_nxt};
 
 
                            // MSB indicates valid dirty target register
assign load_rd_d1_nxt       = {o_decode_daccess && !o_write_data_wen, o_load_rd[3:0]};
assign shift_imm            = instruction[11:7];
assign offset12             = { 20'h0, instruction[11:0]};
assign offset24             = {{6{instruction[23]}}, instruction[23:0], 2'd0 }; // sign extend
assign imm8                 = instruction[7:0];
 
assign immediate_shift_op   = instruction[25];
assign rds_use_rs           = (type == REGOP && !instruction[25] && instruction[4]) ||
                              (type == MULT && 
                               (control_state == MULT_PROC1  || 
                                control_state == MULT_PROC2  ||
//                                instruction_valid && !interrupt )) ;
// remove the '!conflict' term from the interrupt logic used here
// to break a combinational loop
                                (instruction_valid && !interrupt_or_conflict))) ;
 
 
assign branch               = type == BRANCH;
assign opcode_compare       = opcode == CMP || opcode == CMN || opcode == TEQ || opcode == TST ;
assign mem_op               = type == TRANS;
assign load_op              = mem_op && instruction[20];
assign store_op             = mem_op && !instruction[20];
assign write_pc             = (pc_wen_nxt && pc_sel_nxt != 3'd0) || load_pc_r || load_pc_nxt;
assign current_write_pc     = (pc_wen_nxt && pc_sel_nxt != 3'd0) || load_pc_nxt;
assign regop_set_flags      = type == REGOP && instruction[20]; 
 
assign mem_op_pre_indexed   =  instruction[24] && instruction[21];
assign mem_op_post_indexed  = !instruction[24];
 
assign imm32_nxt            =  // add 0 to Rm
                               type == MULT               ? {  32'd0                      } :   //MULT        = 4'h1, 
 
                               // 4 x number of registers
                               type == MTRANS             ? {  mtrans_base_reg_change     } :   //MTRANS      = 4'h4
                               type == BRANCH             ? {  offset24                   } :   //BRANCH      = 4'h5
                               type == TRANS              ? {  offset12                   } :   //TRANS       = 4'h3
                               instruction[11:8] == 4'h0  ? {            24'd0, imm8[7:0] } :
                               instruction[11:8] == 4'h1  ? { imm8[1:0], 24'd0, imm8[7:2] } :
                               instruction[11:8] == 4'h2  ? { imm8[3:0], 24'd0, imm8[7:4] } :
                               instruction[11:8] == 4'h3  ? { imm8[5:0], 24'd0, imm8[7:6] } :
                               instruction[11:8] == 4'h4  ? { imm8[7:0], 24'd0            } :
                               instruction[11:8] == 4'h5  ? { 2'd0,  imm8[7:0], 22'd0     } :
                               instruction[11:8] == 4'h6  ? { 4'd0,  imm8[7:0], 20'd0     } :
                               instruction[11:8] == 4'h7  ? { 6'd0,  imm8[7:0], 18'd0     } :
                               instruction[11:8] == 4'h8  ? { 8'd0,  imm8[7:0], 16'd0     } :
                               instruction[11:8] == 4'h9  ? { 10'd0, imm8[7:0], 14'd0     } :
                               instruction[11:8] == 4'ha  ? { 12'd0, imm8[7:0], 12'd0     } :
                               instruction[11:8] == 4'hb  ? { 14'd0, imm8[7:0], 10'd0     } :
                               instruction[11:8] == 4'hc  ? { 16'd0, imm8[7:0], 8'd0      } :
                               instruction[11:8] == 4'hd  ? { 18'd0, imm8[7:0], 6'd0      } :
                               instruction[11:8] == 4'he  ? { 20'd0, imm8[7:0], 4'd0      } :
                                                            { 22'd0, imm8[7:0],2'd0      } ;
 
 
assign imm_shift_amount_nxt = shift_imm ;
 
       // This signal is encoded in the decode stage because 
       // it is on the critical path in the execute stage
assign shift_imm_zero_nxt   = imm_shift_amount_nxt == 5'd0 &&       // immediate amount = 0
                              barrel_shift_amount_sel_nxt == 2'd2;  // shift immediate amount
 
assign alu_function_nxt     = { alu_swap_sel_nxt, 
                                alu_not_sel_nxt, 
                                alu_cin_sel_nxt,
                                alu_cout_sel_nxt, 
                                alu_out_sel_nxt  };
 
// ========================================================
// Register Conflict Detection
// ========================================================
assign rn_valid       = type == REGOP || type == MULT || type == SWAP || type == TRANS || type == MTRANS || type == CODTRANS;
assign rm_valid       = type == REGOP || type == MULT || type == SWAP || (type == TRANS && immediate_shift_op);
assign rs_valid       = rds_use_rs;
assign rd_valid       = (type == TRANS  && store_op) || (type == REGOP || type == SWAP);
assign stm_valid      = type == MTRANS && !instruction[20];   // stm instruction
 
 
assign rn_conflict1   = instruction_execute   && rn_valid  && ( load_rd_d1_nxt[4] && rn_sel_nxt         == load_rd_d1_nxt[3:0] );
assign rn_conflict2   = instruction_execute_r && rn_valid  && ( load_rd_d1    [4] && rn_sel_nxt         == load_rd_d1    [3:0] );
assign rm_conflict1   = instruction_execute   && rm_valid  && ( load_rd_d1_nxt[4] && rm_sel_nxt         == load_rd_d1_nxt[3:0] );
assign rm_conflict2   = instruction_execute_r && rm_valid  && ( load_rd_d1    [4] && rm_sel_nxt         == load_rd_d1    [3:0] );
assign rs_conflict1   = instruction_execute   && rs_valid  && ( load_rd_d1_nxt[4] && rs_sel_nxt         == load_rd_d1_nxt[3:0] );
assign rs_conflict2   = instruction_execute_r && rs_valid  && ( load_rd_d1    [4] && rs_sel_nxt         == load_rd_d1    [3:0] );
assign rd_conflict1   = instruction_execute   && rd_valid  && ( load_rd_d1_nxt[4] && instruction[15:12] == load_rd_d1_nxt[3:0] );
assign rd_conflict2   = instruction_execute_r && rd_valid  && ( load_rd_d1    [4] && instruction[15:12] == load_rd_d1    [3:0] );
 
assign stm_conflict1a = instruction_execute   && stm_valid && ( load_rd_d1_nxt[4] && mtrans_reg1        == load_rd_d1_nxt[3:0] ); 
assign stm_conflict1b = instruction_execute   && stm_valid && ( load_rd_d1_nxt[4] && mtrans_reg2        == load_rd_d1_nxt[3:0] ); 
assign stm_conflict2a = instruction_execute_r && stm_valid && ( load_rd_d1    [4] && mtrans_reg1        == load_rd_d1    [3:0] );
assign stm_conflict2b = instruction_execute_r && stm_valid && ( load_rd_d1    [4] && mtrans_reg2        == load_rd_d1    [3:0] );
 
assign conflict1      = instruction_valid &&
                        (rn_conflict1 || rm_conflict1 || rs_conflict1 || rd_conflict1 || 
                         stm_conflict1a || stm_conflict1b);
 
assign conflict2      = instruction_valid && (stm_conflict2a || stm_conflict2b);
 
assign conflict       = conflict1 || conflict2;
 
 
always @( posedge i_clk )
    if ( !i_core_stall )
        begin
        conflict_r              <= conflict;
        instruction_execute_r   <= instruction_execute;
        rn_conflict1_r          <= rn_conflict1 && instruction_execute;
        rm_conflict1_r          <= rm_conflict1 && instruction_execute;
        rs_conflict1_r          <= rs_conflict1 && instruction_execute;
        rd_conflict1_r          <= rd_conflict1 && instruction_execute;
        o_rn_use_read           <= instruction_valid && ( rn_conflict1_r || rn_conflict2 );
        o_rm_use_read           <= instruction_valid && ( rm_conflict1_r || rm_conflict2 );
        o_rs_use_read           <= instruction_valid && ( rs_conflict1_r || rs_conflict2 );
        o_rd_use_read           <= instruction_valid && ( rd_conflict1_r || rd_conflict2 );
        end
 
assign o_conflict = conflict;
 
 
// ========================================================
// MTRANS Operations
// ========================================================
 
   // Bit 15 = r15
   // Bit 0  = r0
   // In ldm and stm instructions r0 is loaded or stored first 
always @*

	if	(instruction[0] == 1'b1)			 mtrans_reg1 = 4'h0;
	else if (instruction[1:0] == 2'b10)			 mtrans_reg1 = 4'h1;
	else if (instruction[2:0] == 3'b100)			 mtrans_reg1 = 4'h2;
	else if (instruction[3:0] == 4'b1000)			 mtrans_reg1 = 4'h3;
	else if (instruction[4:0] == 5'b10000)			 mtrans_reg1 = 4'h4;
	else if (instruction[5:0] == 6'b100000)			 mtrans_reg1 = 4'h5;
	else if (instruction[6:0] == 7'b1000000)		 mtrans_reg1 = 4'h6;
	else if (instruction[7:0] == 8'b10000000)	 	 mtrans_reg1 = 4'h7;
	else if (instruction[8:0] == 9'b100000000)	 	 mtrans_reg1 = 4'h8;
	else if (instruction[9:0] == 10'b1000000000)		 mtrans_reg1 = 4'h9;
	else if (instruction[10:0] == 11'b10000000000)	 	 mtrans_reg1 = 4'ha;
	else if (instruction[11:0] == 12'b100000000000)		 mtrans_reg1 = 4'hb;
	else if (instruction[12:0] == 13'b1000000000000)	 mtrans_reg1 = 4'hc;
	else if (instruction[13:0] == 14'b10000000000000)	 mtrans_reg1 = 4'hd;
	else if (instruction[14:0] == 15'b100000000000000)	 mtrans_reg1 = 4'he;
	else 							 mtrans_reg1 = 4'hf;

//    casez ( instruction[15:0] )
//    16'b???????????????1 : mtrans_reg1 = 4'h0 ;
//    16'b??????????????10 : mtrans_reg1 = 4'h1 ;
//    16'b?????????????100 : mtrans_reg1 = 4'h2 ;
//    16'b????????????1000 : mtrans_reg1 = 4'h3 ;
//    16'b???????????10000 : mtrans_reg1 = 4'h4 ;
//    16'b??????????100000 : mtrans_reg1 = 4'h5 ;
//    16'b?????????1000000 : mtrans_reg1 = 4'h6 ;
//    16'b????????10000000 : mtrans_reg1 = 4'h7 ;
//    16'b???????100000000 : mtrans_reg1 = 4'h8 ;
//    16'b??????1000000000 : mtrans_reg1 = 4'h9 ;
//    16'b?????10000000000 : mtrans_reg1 = 4'ha ;
//    16'b????100000000000 : mtrans_reg1 = 4'hb ;
//    16'b???1000000000000 : mtrans_reg1 = 4'hc ;
//    16'b??10000000000000 : mtrans_reg1 = 4'hd ;
//    16'b?100000000000000 : mtrans_reg1 = 4'he ;
//    default              : mtrans_reg1 = 4'hf ;
//    endcase
 
 

//assign mtrans_reg2_mask = 1'd1<<mtrans_reg1;  //1'd1<<mtrans_reg1
assign mtrans_reg2_mask = mtrans_reg1 == 4'h0 ?  16'b1 :
					 4'h1 ?  16'b10 :
					 4'h2 ?  16'b100 :
					 4'h3 ?  16'b1000 :
					 4'h4 ?  16'b10000 :
					 4'h5 ?  16'b100000 :
					 4'h6 ?  16'b1000000 :
					 4'h7 ?  16'b10000000 :
					 4'h8 ?  16'b100000000 :
					 4'h9 ?  16'b1000000000 :
					 4'ha ?  16'b10000000000 :
					 4'hb ?  16'b100000000000 :
					 4'hc ?  16'b1000000000000 :
					 4'hd ?  16'b10000000000000 :
					 4'he ?  16'b100000000000000 :
					         16'b1000000000000000;



 
always @*
/*    casez ( instruction[15:0] & ~mtrans_reg2_mask )
    16'b???????????????1 : mtrans_reg2 = 4'h0 ;
    16'b??????????????10 : mtrans_reg2 = 4'h1 ;
    16'b?????????????100 : mtrans_reg2 = 4'h2 ;
    16'b????????????1000 : mtrans_reg2 = 4'h3 ;
    16'b???????????10000 : mtrans_reg2 = 4'h4 ;
    16'b??????????100000 : mtrans_reg2 = 4'h5 ;
    16'b?????????1000000 : mtrans_reg2 = 4'h6 ;
    16'b????????10000000 : mtrans_reg2 = 4'h7 ;
    16'b???????100000000 : mtrans_reg2 = 4'h8 ;
    16'b??????1000000000 : mtrans_reg2 = 4'h9 ;
    16'b?????10000000000 : mtrans_reg2 = 4'ha ;
    16'b????100000000000 : mtrans_reg2 = 4'hb ;
    16'b???1000000000000 : mtrans_reg2 = 4'hc ;
    16'b??10000000000000 : mtrans_reg2 = 4'hd ;
    16'b?100000000000000 : mtrans_reg2 = 4'he ;
    default              : mtrans_reg2 = 4'hf ;
   endcase
*/
	if	(~mtrans_reg2_mask & instruction[0] == 1'b1)				 mtrans_reg2 = 4'h0 ;
	else if (~mtrans_reg2_mask & instruction[1:0] == 2'b10)				 mtrans_reg2 = 4'h1 ;
	else if (~mtrans_reg2_mask & instruction[2:0] == 3'b100)			 mtrans_reg2 = 4'h2 ;
	else if (~mtrans_reg2_mask & instruction[3:0] == 4'b1000)			 mtrans_reg2 = 4'h3 ;
	else if (~mtrans_reg2_mask & instruction[4:0] == 5'b10000)			 mtrans_reg2 = 4'h4 ;
	else if (~mtrans_reg2_mask & instruction[5:0] == 6'b100000)			 mtrans_reg2 = 4'h5 ;
	else if (~mtrans_reg2_mask & instruction[6:0] == 7'b1000000)			 mtrans_reg2 = 4'h6 ;
	else if (~mtrans_reg2_mask & instruction[7:0] == 8'b10000000)	 		 mtrans_reg2 = 4'h7 ;
	else if (~mtrans_reg2_mask & instruction[8:0] == 9'b100000000)	 		 mtrans_reg2 = 4'h8 ;
	else if (~mtrans_reg2_mask & instruction[9:0] == 10'b1000000000)		 mtrans_reg2 = 4'h9 ;
	else if (~mtrans_reg2_mask & instruction[10:0] == 11'b10000000000)	 	 mtrans_reg2 = 4'ha ;
	else if (~mtrans_reg2_mask & instruction[11:0] == 12'b100000000000)		 mtrans_reg2 = 4'hb ;
	else if (~mtrans_reg2_mask & instruction[12:0] == 13'b1000000000000)		 mtrans_reg2 = 4'hc ;
	else if (~mtrans_reg2_mask & instruction[13:0] == 14'b10000000000000)		 mtrans_reg2 = 4'hd ;
	else if (~mtrans_reg2_mask & instruction[14:0] == 15'b100000000000000)		 mtrans_reg2 = 4'he ;
	else 										 mtrans_reg2 = 4'hf ;

 
always @( * )
//    casez (instruction[15:0])
//    16'b???????????????1 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 1],  1'd0};
//    16'b??????????????10 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 2],  2'd0}; 
//    16'b?????????????100 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 3],  3'd0}; 
//    16'b????????????1000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 4],  4'd0}; 
//    16'b???????????10000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 5],  5'd0}; 
//    16'b??????????100000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 6],  6'd0}; 
//    16'b?????????1000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 7],  7'd0}; 
//    16'b????????10000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 8],  8'd0}; 
//    16'b???????100000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 9],  9'd0}; 
//    16'b??????1000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:10], 10'd0}; 
//    16'b?????10000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:11], 11'd0}; 
//    16'b????100000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:12], 12'd0}; 
//    16'b???1000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:13], 13'd0}; 
//    16'b??10000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:14], 14'd0}; 
//    16'b?100000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15   ], 15'd0}; 
//   default              : mtrans_instruction_nxt = {instruction[31:16],                     16'd0}; 
//    endcase


	if	(instruction[0] == 1'b1)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 1],  1'd0};
	else if (instruction[1:0] == 2'b10)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 2],  2'd0}; 
	else if (instruction[2:0] == 3'b100)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 3],  3'd0}; 
	else if (instruction[3:0] == 4'b1000)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 4],  4'd0}; 
	else if (instruction[4:0] == 5'b10000)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 5],  5'd0}; 
	else if (instruction[5:0] == 6'b100000)			 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 6],  6'd0}; 
	else if (instruction[6:0] == 7'b1000000)		 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 7],  7'd0}; 
	else if (instruction[7:0] == 8'b10000000)	 	 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 8],  8'd0}; 
	else if (instruction[8:0] == 9'b100000000)	 	 mtrans_instruction_nxt = {instruction[31:16], instruction[15: 9],  9'd0}; 
	else if (instruction[9:0] == 10'b1000000000)		 mtrans_instruction_nxt = {instruction[31:16], instruction[15:10], 10'd0}; 
	else if (instruction[10:0] == 11'b10000000000)	 	 mtrans_instruction_nxt = {instruction[31:16], instruction[15:11], 11'd0}; 
	else if (instruction[11:0] == 12'b100000000000)		 mtrans_instruction_nxt = {instruction[31:16], instruction[15:12], 12'd0}; 
	else if (instruction[12:0] == 13'b1000000000000)	 mtrans_instruction_nxt = {instruction[31:16], instruction[15:13], 13'd0}; 
	else if (instruction[13:0] == 14'b10000000000000)	 mtrans_instruction_nxt = {instruction[31:16], instruction[15:14], 14'd0}; 
	else if (instruction[14:0] == 15'b100000000000000)	 mtrans_instruction_nxt = {instruction[31:16], instruction[  15 ], 15'd0}; 
	else 							 mtrans_instruction_nxt = {instruction[31:16], 16'd0};
 
 
// number of registers to be stored
assign mtrans_num_registers =   {4'd0, instruction[15]} + 
                                {4'd0, instruction[14]} + 
                                {4'd0, instruction[13]} + 
                                {4'd0, instruction[12]} +
                                {4'd0, instruction[11]} +
                                {4'd0, instruction[10]} +
                                {4'd0, instruction[ 9]} +
                                {4'd0, instruction[ 8]} +
                                {4'd0, instruction[ 7]} +
                                {4'd0, instruction[ 6]} +
                                {4'd0, instruction[ 5]} +
                                {4'd0, instruction[ 4]} +
                                {4'd0, instruction[ 3]} +
                                {4'd0, instruction[ 2]} +
                                {4'd0, instruction[ 1]} +
                                {4'd0, instruction[ 0]} ;
 
// 4 x number of registers to be stored
assign mtrans_base_reg_change = {25'd0, mtrans_num_registers, 2'd0};
 
// ========================================================
// Interrupts
// ========================================================
 
assign firq_request = firq && !i_execute_status_bits[26];
assign irq_request  = irq  && !i_execute_status_bits[27];
assign swi_request  = type == SWI;
assign dabt_request = dabt_reg;
 
// copro15 and copro13 only supports reg trans opcodes
// all other opcodes involving co-processors cause an 
// undefined instrution interrupt
assign und_request  =   type == CODTRANS || 
                        type == COREGOP  || 
                      ( type == CORTRANS && instruction[11:8] != 4'd15 );
 
 
  // in order of priority !!                 
  // Highest 
  // 1 Reset
  // 2 Data Abort (including data TLB miss)
  // 3 FIRQ
  // 4 IRQ
  // 5 Prefetch Abort (including prefetch TLB miss)
  // 6 Undefined instruction, SWI
  // Lowest                        
assign next_interrupt = dabt_request     ? 3'd1 :  // Data Abort
                        firq_request     ? 3'd2 :  // FIRQ
                        irq_request      ? 3'd3 :  // IRQ
                        instruction_adex ? 3'd4 :  // Address Exception 
                        instruction_iabt ? 3'd5 :  // PreFetch Abort, only triggered 
                                                   // if the instruction is used
                        und_request      ? 3'd6 :  // Undefined Instruction
                        swi_request      ? 3'd7 :  // SWI
                                           3'd0 ;  // none             
 
 
// SWI and undefined instructions do not cause an interrupt in the decode
// stage. They only trigger interrupts if they arfe executed, so the
// interrupt is triggered if the execute condition is met in the execute stage
assign interrupt      = next_interrupt != 3'd0 && 
                        next_interrupt != 3'd7 &&  // SWI
                        next_interrupt != 3'd6 &&  // undefined interrupt
                        !conflict               ;  // Wait for conflicts to resolve before
                                                   // triggering int
 
 
// Added to use in rds_use_rs logic to break a combinational loop invloving
// the conflict signal
assign interrupt_or_conflict 
                     =  next_interrupt != 3'd0 && 
                        next_interrupt != 3'd7 &&  // SWI
                        next_interrupt != 3'd6  ;  // undefined interrupt
 
assign interrupt_mode = next_interrupt == 3'd2 ? FIRQ :
                        next_interrupt == 3'd3 ? IRQ  :
                        next_interrupt == 3'd4 ? SVC  :
                        next_interrupt == 3'd5 ? SVC  :
                        next_interrupt == 3'd6 ? SVC  :
                        next_interrupt == 3'd7 ? SVC  :
                        next_interrupt == 3'd1 ? SVC  :
                                                 USR  ;
 
always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == SWI || und_request )
				status_bits_mode_nxt          = interrupt_mode;
			else 
				status_bits_mode_nxt            = i_execute_status_bits[1:0];
		end
 
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
			status_bits_mode_nxt            = interrupt_mode;

		else if ( control_state == INT_WAIT1 ) 
        		status_bits_mode_nxt            = o_status_bits_mode;   // Supervisor mode

		else 
			status_bits_mode_nxt            = i_execute_status_bits[1:0];
	end



always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == SWI || und_request )
				status_bits_irq_mask_nxt        = 1'd1;
			else
				status_bits_irq_mask_nxt        = o_status_bits_irq_mask;
		end

		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
			status_bits_irq_mask_nxt        = 1'd1;

		else 
			status_bits_irq_mask_nxt        = o_status_bits_irq_mask;

	end


always @*
	begin
		if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 && next_interrupt == 3'd2)
			status_bits_firq_mask_nxt        = 1'd1;
			
		else
			status_bits_firq_mask_nxt       = o_status_bits_firq_mask;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict &&(type == SWAP))		
			decode_exclusive_nxt            = 1'd1;
		else
			decode_exclusive_nxt            = 1'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op )
				decode_daccess_nxt              = 1'd1;
			else if ( type == MTRANS )
				decode_daccess_nxt              = 1'd1; 
			else if ( type == SWAP )
				decode_daccess_nxt              = 1'd1;
			else
				decode_daccess_nxt              = 1'd0;
		end
		else if ( control_state == MTRANS_EXEC1 && !conflict &&instruction_execute)		 
			decode_daccess_nxt          = 1'd1;

		else if ( control_state == MTRANS_EXEC2 )
			decode_daccess_nxt          = 1'd1;

		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			decode_daccess_nxt          = 1'd1;
		else
			decode_daccess_nxt             = 1'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == SWAP)
			decode_iaccess_nxt              = 1'd0;

		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute &&( mtrans_num_registers > 4'd2 ))
			decode_iaccess_nxt      = 1'd0;  
		
		else if ( control_state == MTRANS_EXEC2 && ( mtrans_num_registers > 4'd2 ))	
			decode_iaccess_nxt      = 1'd0;  

		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			decode_iaccess_nxt              = 1'd0;

		else 	
			decode_iaccess_nxt              = 1'd1;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == CORTRANS && !und_request )
			begin
				if ( instruction[20] )
					copro_operation_nxt         = 2'd1; 
				else
					copro_operation_nxt      = 2'd0;
			end
			else 
				copro_operation_nxt             = 2'd0;
		end
			
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && !instruction[20])
			copro_operation_nxt      = 2'd2; 

		else
			copro_operation_nxt             = 2'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op && (load_op && instruction[15:12]  == 4'd15))
				saved_current_instruction_wen   = 1'd1; 
			else if ( type == MTRANS )
				saved_current_instruction_wen   = 1'd1;
			else if ( type == MULT )
				saved_current_instruction_wen   = 1'd1;
			else if ( type == SWAP )
				saved_current_instruction_wen   = 1'd1;
			else  if ( type == CORTRANS && !und_request )
				saved_current_instruction_wen   = 1'd1;
			else
				saved_current_instruction_wen   = 1'd0;
		end
		
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
			saved_current_instruction_wen   = 1'd1; 
		
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute &&( instruction[20] && mtrans_reg1 == 4'd15 ))
			saved_current_instruction_wen   = 1'd1; 
		
		else if ( control_state == MTRANS_EXEC2 && ( instruction[20] && mtrans_reg1 == 4'd15 ))
			saved_current_instruction_wen   = 1'd1;		
		
		else
			saved_current_instruction_wen   = 1'd0;
	end

always @*
	begin
		if ( control_state == MEM_WAIT1 && !conflict )
			pre_fetch_instruction_wen   = 1'd1;
		else if ( control_state == MTRANS_EXEC1 && !conflict )
		        pre_fetch_instruction_wen   = 1'd1;
		else if ( control_state == MULT_PROC1 && instruction_execute && !conflict )
			pre_fetch_instruction_wen   = 1'd1;
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			pre_fetch_instruction_wen   = 1'd1;
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict )
			pre_fetch_instruction_wen   = 1'd1;
		else
			pre_fetch_instruction_wen   = 1'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == MTRANS)
		//     restore_base_address_nxt        <= instruction[20] && 
       		//                                         (instruction[15:0] & (1'd1 << instruction[19:16]));
			restore_base_address_nxt        = instruction[20] && 
                                                		(instruction[15:0] & (
								instruction[19:16] == 4'h1 ? 16'b10:
								instruction[19:16] == 4'h2 ? 16'b100:
								instruction[19:16] == 4'h3 ? 16'b1000:
								instruction[19:16] == 4'h4 ? 16'b10000:
								instruction[19:16] == 4'h5 ? 16'b100000:
								instruction[19:16] == 4'h6 ? 16'b1000000:
								instruction[19:16] == 4'h7 ? 16'b10000000:
								instruction[19:16] == 4'h8 ? 16'b100000000:
								instruction[19:16] == 4'h9 ? 16'b1000000000:
								instruction[19:16] == 4'ha ? 16'b10000000000:
								instruction[19:16] == 4'hb ? 16'b100000000000:
								instruction[19:16] == 4'hc ? 16'b1000000000000:
								instruction[19:16] == 4'hd ? 16'b10000000000000:
								instruction[19:16] == 4'he ? 16'b100000000000000:
								instruction[19:16] == 4'hf ? 16'b1000000000000000:
											     16'b1));
		else
			restore_base_address_nxt        = restore_base_address;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == REGOP )
			begin
				if ( !immediate_shift_op && instruction[4] )
					barrel_shift_amount_sel_nxt = 2'd1;
				else if ( !immediate_shift_op && !instruction[4] ) 
                			barrel_shift_amount_sel_nxt = 2'd2; 	
				else
					barrel_shift_amount_sel_nxt = 2'd0; 
			end
			else if ( mem_op && ( type == TRANS && instruction[25] && shift_imm != 5'd0 ) )
				barrel_shift_amount_sel_nxt = 2'd2;
			else
				barrel_shift_amount_sel_nxt = 2'd0; 
		end
		else
			barrel_shift_amount_sel_nxt = 2'd0; 
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if(type == REGOP &&  !immediate_shift_op)
				barrel_shift_data_sel_nxt = 2'd2;
			
			else if (mem_op && instruction[25] && type ==  TRANS)
				barrel_shift_data_sel_nxt = 2'd2;
			else if ( type == SWAP )
				barrel_shift_data_sel_nxt = 2'd2;
			else
				barrel_shift_data_sel_nxt = 2'd0;
		end
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			barrel_shift_data_sel_nxt       = 2'd2;
		else
			barrel_shift_data_sel_nxt       = 2'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )	
		begin
			if ( type == REGOP && !immediate_shift_op)
				barrel_shift_function_nxt  = instruction[6:5];
			else if ( mem_op && type == TRANS && instruction[25] && shift_imm != 5'd0 )
				barrel_shift_function_nxt   = instruction[6:5];
			else 
				barrel_shift_function_nxt       = 2'd0;
		end
		else
			barrel_shift_function_nxt       = 2'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == MULT)
		begin	
			multiply_function_nxt[0]        = 1'd1;
			if( instruction[21] )
				multiply_function_nxt[1]    = 1'd1;
			else
				multiply_function_nxt[1]    = 1'd0;
		end
		else if ( control_state == MULT_PROC1 && instruction_execute && !conflict )
			multiply_function_nxt       = o_multiply_function;
		else if ( control_state == MULT_PROC2 )
			multiply_function_nxt   = o_multiply_function;
		else if ( control_state == MULT_STORE )
			multiply_function_nxt = o_multiply_function;
		else if ( control_state == MULT_ACCUMU )
			multiply_function_nxt = o_multiply_function;
		else
			multiply_function_nxt           = 2'd0;
	end



always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if( type == REGOP && !opcode_compare && instruction[15:12]  == 4'd15)
				iaddress_sel_nxt      = 4'd1;
			else if ( type == BRANCH )
				iaddress_sel_nxt      = 4'd1; 
			else if ( type == MTRANS && mtrans_num_registers > 4'd1)
				iaddress_sel_nxt      = 4'd3;
			else if ( type == CORTRANS && !und_request )
				iaddress_sel_nxt      = 4'd3;
			else if ( type == SWI || und_request )
				iaddress_sel_nxt      = 4'd2;
			else
				iaddress_sel_nxt      = 4'd0;

		end
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
			iaddress_sel_nxt                = 4'd2; 
			 
		else if ( control_state == MEM_WAIT1 && !conflict &&instruction_execute)
			iaddress_sel_nxt            = 4'd3;
		
		else if ( control_state == MEM_WAIT2 && !dabt  && (( type == TRANS && instruction[15:12]  == 4'd15 ) || 
               						 ( type == MTRANS && instruction[20] && mtrans_reg1 == 4'd15 )))

			iaddress_sel_nxt = 4'd3;

		else  if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute && mtrans_num_registers != 4'd1)
			
			iaddress_sel_nxt        = 4'd3; 
		
		else if ( control_state == MTRANS_EXEC2  && mtrans_num_registers > 4'd1)		
			iaddress_sel_nxt        = 4'd3; 
		else if ( control_state == MULT_PROC2 )
			iaddress_sel_nxt        = 4'd3;
		else if ( control_state == MULT_ACCUMU )
			iaddress_sel_nxt        = 4'd3;
		else if ( control_state == SWAP_WAIT1  && instruction_execute) 
			iaddress_sel_nxt            = 4'd3;
		else if ( control_state == SWAP_WAIT1  && !dabt && instruction[15:12]  == 4'd15)
			iaddress_sel_nxt = 4'd3; 
		else 
		 	iaddress_sel_nxt = 4'd0;
	end 


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op )
			begin
				if ( mem_op_post_indexed )
					daddress_sel_nxt = 4'd4; // Rn
            			else   
               				daddress_sel_nxt = 4'd1; // alu out
			end	
			else if ( type == MTRANS )	
				if ( instruction[23] )
				begin
					if ( instruction[24] )    // increment before
                    				daddress_sel_nxt = 4'd7; // Rn + 4
               				 else    
                    				daddress_sel_nxt = 4'd4; // Rn
                		end
				else
				begin
					if ( !instruction[24] )    // decrement after
                    				daddress_sel_nxt  = 4'd6; // alu out + 4
                			else
                    				daddress_sel_nxt  = 4'd1; // alu out
                		end
			else if	( type == SWAP )
				daddress_sel_nxt                = 4'd4; 
			else
				daddress_sel_nxt                = 4'd0;
		end
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute )
			daddress_sel_nxt            = 4'd5;
		else if ( control_state == MTRANS_EXEC2 )
			daddress_sel_nxt            = 4'd5;	
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			daddress_sel_nxt            = 4'd4;
		else
			daddress_sel_nxt            = 4'd0;	
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == REGOP && !opcode_compare && instruction[15:12]  == 4'd15 )	
				pc_sel_nxt       = 3'd1;
			else if ( mem_op && (mem_op_pre_indexed || mem_op_post_indexed) && rn_sel_nxt  == 4'd15 )	
				pc_sel_nxt       = 3'd1; 
			else if ( type == BRANCH )
				pc_sel_nxt       = 3'd1; 
			else if ( type == SWI || und_request )
				pc_sel_nxt       = 3'd2; 
			else
				pc_sel_nxt       = 3'd0; 
		end
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
			pc_sel_nxt                      = 3'd2; 
		else if ( control_state == MEM_WAIT2  && !dabt &&  (( type == TRANS && instruction[15:12]  == 4'd15 ) || 
                					( type == MTRANS && instruction[20] && mtrans_reg1 == 4'd15 )))
			pc_sel_nxt       = 3'd3;
		
		else if ( control_state == SWAP_WAIT1 && !dabt && instruction[15:12]  == 4'd15 ) 
			
			pc_sel_nxt       = 3'd3;
		else
			pc_sel_nxt       = 3'd0;
	end

		
always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op && ( load_op && instruction[15:12]  == 4'd15 ))
				load_pc_nxt                     = 1'd1;
			else if ( type == MTRANS && ( instruction[20] && mtrans_reg1 == 4'd15 ))
				load_pc_nxt                     = 1'd1;
			else
				load_pc_nxt                     = 1'd0;
		end
		else if ( control_state == MEM_WAIT1 && !conflict && instruction_execute)
			load_pc_nxt                 = load_pc_r;
		else if ( control_state == MEM_WAIT2 && !dabt && (( type == TRANS && instruction[15:12]  == 4'd15 ) || 
               							 ( type == MTRANS && instruction[20] && mtrans_reg1 == 4'd15 )))
			load_pc_nxt      = load_pc_r;
		
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute && ( instruction[20] && mtrans_reg1 == 4'd15 ))
			load_pc_nxt                     = 1'd1;
		else if ( control_state == MTRANS_EXEC2 && ( instruction[20] && mtrans_reg1 == 4'd15 ))
			load_pc_nxt                     = 1'd1;
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			load_pc_nxt                     = load_pc_r;
		else if ( control_state == SWAP_WAIT1 && !dabt && instruction[15:12]  == 4'd15 )
 			load_pc_nxt      = load_pc_r;
		else
			load_pc_nxt                     = 1'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op && store_op	&& type == TRANS && instruction[22] )
				 byte_enable_sel_nxt = 2'd1; 
			else
				 byte_enable_sel_nxt = 2'd0;
		end
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict && instruction[22])
			byte_enable_sel_nxt = 2'd1; 
		else
			byte_enable_sel_nxt = 2'd0;
	end 

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && regop_set_flags && instruction[15:12] == 4'd15)
			status_bits_sel_nxt       = 3'd1; 				
		else if ( control_state == MULT_STORE && instruction[20])
			status_bits_sel_nxt       = 3'd4;
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20] && instruction[15:12]  == 4'd15 )
			status_bits_sel_nxt       = 3'd3;
		else
			status_bits_sel_nxt       = 3'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == BRANCH && instruction[24] )
				reg_write_sel_nxt 	= 3'd1;
			else if ( type == SWI || und_request )
				reg_write_sel_nxt       = 3'd1; 
			else
				reg_write_sel_nxt       = 3'd0;

		end
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
		begin
			if ( next_interrupt == 3'd4 )
          			reg_write_sel_nxt               = 3'd7;   
       			 else
           		 	reg_write_sel_nxt               = 3'd1;    
		end
		else if ( control_state == MTRANS_ABORT && restore_base_address )
			reg_write_sel_nxt     = 3'd6;             
		else if ( control_state == MULT_STORE )
			reg_write_sel_nxt     = 3'd2;
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20])	
 			reg_write_sel_nxt     = 3'd5;  
		else
			reg_write_sel_nxt     = 3'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == MTRANS && instruction[22:20] == 3'b100 )
			o_user_mode_regs_store_nxt = 1'd1;
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute && instruction[22:20] == 3'b100 )
			o_user_mode_regs_store_nxt = 1'd1;
		else if ( control_state == MTRANS_EXEC2 && instruction[22:20] == 3'b100 )
			o_user_mode_regs_store_nxt = 1'd1;
		else
			o_user_mode_regs_store_nxt = 1'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == REGOP )
		begin
			if ( opcode == RSB )
				alu_swap_sel_nxt = 1'd1;
			else if ( opcode == RSC )
				alu_swap_sel_nxt = 1'd1;
			else
				alu_swap_sel_nxt = 1'd0;
		end
		else
			alu_swap_sel_nxt = 1'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if( type == REGOP )
			begin
				if ( opcode == SUB || opcode == CMP ) 
					alu_not_sel_nxt  = 1'd1;
				else if ( opcode == SBC )
					alu_not_sel_nxt  = 1'd1;
				else if ( opcode == RSB )
					alu_not_sel_nxt  = 1'd1;
				else if ( opcode == RSC )
					alu_not_sel_nxt  = 1'd1;
				else if ( opcode == BIC )
					alu_not_sel_nxt  = 1'd1;
				else if ( opcode == MVN )
					alu_not_sel_nxt  = 1'd1;
				else 
					alu_not_sel_nxt  = 1'd0;
			end
			else if ( mem_op &&  !instruction[23])
				alu_not_sel_nxt  = 1'd1;
			else if ( type == MTRANS && !instruction[23])
				alu_not_sel_nxt  = 1'd1;
			else
				alu_not_sel_nxt  = 1'd0;
		end
		else
			alu_not_sel_nxt  = 1'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if( type == REGOP )
			begin
				if ( opcode == ADC ) 
					alu_cin_sel_nxt  = 2'd2;
				else if ( opcode == SUB || opcode == CMP ) 
					alu_cin_sel_nxt  = 2'd1; 
				else if ( opcode == SBC )
					alu_cin_sel_nxt  = 2'd2;
				else if ( opcode == RSB )
					alu_cin_sel_nxt  = 2'd1; 
				else if ( opcode == RSC )
					alu_cin_sel_nxt  = 2'd2; 
				else
					alu_cin_sel_nxt  = 2'd0;
			end
			else if ( mem_op && !instruction[23])
				alu_cin_sel_nxt  = 2'd1; 
			else if ( type == MTRANS && !instruction[23])
				alu_cin_sel_nxt  = 2'd1;
			else
				alu_cin_sel_nxt  = 2'd0;
		end
		else
			alu_cin_sel_nxt  = 2'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && type == REGOP )
		begin			
			if ( opcode == AND || opcode == TST )
				alu_cout_sel_nxt = 1'd1;
			else if ( opcode == EOR || opcode == TEQ )
				alu_cout_sel_nxt = 1'd1;
			else if ( opcode == ORR )
				alu_cout_sel_nxt = 1'd1; 
			else if ( opcode == BIC )
				alu_cout_sel_nxt = 1'd1; 
			else if ( opcode == MOV )
				alu_cout_sel_nxt = 1'd1; 
			else if ( opcode == MVN )
				alu_cout_sel_nxt = 1'd1;			
			else	
				alu_cout_sel_nxt = 1'd0;
		end
		else 
			alu_cout_sel_nxt = 1'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if( type == REGOP )
			begin
				if ( opcode == ADD || opcode == CMN )
					alu_out_sel_nxt  = 4'd1; 
				else if ( opcode == ADC )
					alu_out_sel_nxt  = 4'd1;
				else if ( opcode == SUB || opcode == CMP )
					alu_out_sel_nxt  = 4'd1; 
				else if ( opcode == SBC ) 
					alu_out_sel_nxt  = 4'd1;
				else if ( opcode == RSB )
					alu_out_sel_nxt  = 4'd1;
				else if ( opcode == RSC )
					alu_out_sel_nxt  = 4'd1; 
				else if ( opcode == AND || opcode == TST )
					alu_out_sel_nxt  = 4'd8;
				else if ( opcode == EOR || opcode == TEQ ) 
					alu_out_sel_nxt  = 4'd6;
				else if ( opcode == ORR )
					alu_out_sel_nxt  = 4'd7;
				else if ( opcode == BIC )
					alu_out_sel_nxt  = 4'd8;	
				else
					alu_out_sel_nxt  = 4'd0;
			end
			else if ( mem_op )
				alu_out_sel_nxt          = 4'd1;
			else if ( type == BRANCH )
				alu_out_sel_nxt          = 4'd1;
			else if ( type == MTRANS )
				alu_out_sel_nxt          = 4'd1;
			else
				alu_out_sel_nxt          = 4'd0;
		end
		else
			alu_out_sel_nxt          = 4'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op && store_op )
				write_data_wen_nxt = 1'd1;
			else if ( type == MTRANS && !instruction[20] )
				write_data_wen_nxt = 1'd1; 
			else
				write_data_wen_nxt = 1'd0;
		end
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute && !instruction[20] )
			write_data_wen_nxt = 1'd1;
		else if ( control_state == MTRANS_EXEC2 && !instruction[20] )
			write_data_wen_nxt = 1'd1;
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict )
			write_data_wen_nxt = 1'd1;
		else
			write_data_wen_nxt = 1'd0;
	end

always @*
	begin		
		if(instruction_valid && !interrupt && !conflict && (type == CORTRANS && !und_request) && ! instruction[20])
			copro_write_data_wen_nxt = 1'd1;
		else
			copro_write_data_wen_nxt = 1'd0;
	end

always @*
	begin		
		if(instruction_valid && !interrupt && !conflict && type == MTRANS)
			base_address_wen_nxt            = 1'd1;			
		else
			base_address_wen_nxt            = 1'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( mem_op &&(load_op && instruction[15:12]  == 4'd15) )
				pc_wen_nxt        = 1'd0;
			else if ( type == MTRANS )
			begin
				if ( mtrans_num_registers > 4'd1 )
					pc_wen_nxt              = 1'd0;
				else if ( instruction[20] && mtrans_reg1 == 4'd15 ) 
					pc_wen_nxt                = 1'd0;
				else 
					pc_wen_nxt                = 1'd1;
			end
			else if ( type == MULT )
				pc_wen_nxt                      = 1'd0;
			else if ( type == SWAP )
				pc_wen_nxt                      = 1'd0;
			else if ( type == CORTRANS && !und_request )
				pc_wen_nxt                      = 1'd0;
			else
				pc_wen_nxt                      = 1'd1;
		end
		else if ( control_state == MEM_WAIT1 && !conflict && instruction_execute)
			 pc_wen_nxt                  = 1'd0;
		else if ( control_state == MEM_WAIT2 && !dabt)
			pc_wen_nxt                  = 1'd0; 
		else if ( control_state == MTRANS_EXEC1 && !conflict && instruction_execute )
		begin
			if ( mtrans_num_registers != 4'd1 )
				pc_wen_nxt              = 1'd0;
			else if ( instruction[20] && mtrans_reg1 == 4'd15 ) 
				pc_wen_nxt                      = 1'd0;
			else 
				pc_wen_nxt                      = 1'd1;	
		end
		else if ( control_state == MTRANS_EXEC2 )
		begin
			if ( mtrans_num_registers > 4'd1 )
				pc_wen_nxt              = 1'd0;
			else if ( instruction[20] && mtrans_reg1 == 4'd15 )
				pc_wen_nxt                      = 1'd0;
			else 
				pc_wen_nxt                      = 1'd1;	
		end
		else if ( control_state == MULT_PROC1 && instruction_execute && !conflict )
			pc_wen_nxt              = 1'd0;
		else if ( control_state == MULT_PROC2 )	 
			pc_wen_nxt              = 1'd0;
		else  if ( control_state == MULT_ACCUMU )
			pc_wen_nxt              = 1'd0;
		else if ( control_state == SWAP_WRITE && instruction_execute && !conflict  &&  instruction_execute)
			pc_wen_nxt              = 1'd0;
		else if ( control_state == SWAP_WAIT1 &&instruction_execute )
			pc_wen_nxt              = 1'd0; 
		else 
			pc_wen_nxt              = 1'd1;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict )
		begin
			if ( type == REGOP && !opcode_compare && instruction[15:12]  != 4'd15)
				 //reg_bank_wen_nxt = decode (instruction[15:12]);	
				   reg_bank_wen_nxt =   instruction[15:12] == 4'h0 ? 15'h0001:
							instruction[15:12] == 4'h1 ? 15'h0002:
							instruction[15:12] == 4'h2 ? 15'h0004:
							instruction[15:12] == 4'h3 ? 15'h0008:
							instruction[15:12] == 4'h4 ? 15'h0010:
							instruction[15:12] == 4'h5 ? 15'h0020:
							instruction[15:12] == 4'h6 ? 15'h0040:
							instruction[15:12] == 4'h7 ? 15'h0080:
							instruction[15:12] == 4'h8 ? 15'h0100:
							instruction[15:12] == 4'h9 ? 15'h0200:
							instruction[15:12] == 4'ha ? 15'h0400:
							instruction[15:12] == 4'hb ? 15'h0800:
							instruction[15:12] == 4'hc ? 15'h1000:
							instruction[15:12] == 4'hd ? 15'h2000:
							instruction[15:12] == 4'he ? 15'h4000:
									    	     15'h0000;
			else if ( mem_op && ( mem_op_pre_indexed || mem_op_post_indexed ) && rn_sel_nxt  != 4'd15)
			//	reg_bank_wen_nxt = decode ( rn_sel_nxt );
			 	 reg_bank_wen_nxt =    	rn_sel_nxt == 4'h0 ? 15'h0001:
							rn_sel_nxt == 4'h1 ? 15'h0002:
							rn_sel_nxt == 4'h2 ? 15'h0004:
							rn_sel_nxt == 4'h3 ? 15'h0008:
							rn_sel_nxt == 4'h4 ? 15'h0010:
							rn_sel_nxt == 4'h5 ? 15'h0020:
							rn_sel_nxt == 4'h6 ? 15'h0040:
							rn_sel_nxt == 4'h7 ? 15'h0080:
							rn_sel_nxt == 4'h8 ? 15'h0100:
							rn_sel_nxt == 4'h9 ? 15'h0200:
							rn_sel_nxt == 4'ha ? 15'h0400:
							rn_sel_nxt == 4'hb ? 15'h0800:
							rn_sel_nxt == 4'hc ? 15'h1000:
							rn_sel_nxt == 4'hd ? 15'h2000:
							rn_sel_nxt == 4'he ? 15'h4000:
									     15'h0000;
			else if ( type == BRANCH && instruction[24])
				//reg_bank_wen_nxt  = decode (4'd14);
				reg_bank_wen_nxt  = 15'h4000;
			else if ( type == MTRANS && instruction[21] )
				//reg_bank_wen_nxt  = decode (rn_sel_nxt);
				  reg_bank_wen_nxt =  	rn_sel_nxt == 4'h0 ? 15'h0001:
							rn_sel_nxt == 4'h1 ? 15'h0002:
							rn_sel_nxt == 4'h2 ? 15'h0004:
							rn_sel_nxt == 4'h3 ? 15'h0008:
							rn_sel_nxt == 4'h4 ? 15'h0010:
							rn_sel_nxt == 4'h5 ? 15'h0020:
							rn_sel_nxt == 4'h6 ? 15'h0040:
							rn_sel_nxt == 4'h7 ? 15'h0080:
							rn_sel_nxt == 4'h8 ? 15'h0100:
							rn_sel_nxt == 4'h9 ? 15'h0200:
							rn_sel_nxt == 4'ha ? 15'h0400:
							rn_sel_nxt == 4'hb ? 15'h0800:
							rn_sel_nxt == 4'hc ? 15'h1000:
							rn_sel_nxt == 4'hd ? 15'h2000:
							rn_sel_nxt == 4'he ? 15'h4000:
									     15'h0000;
			else if ( type == SWI || und_request )
				//reg_bank_wen_nxt   = decode (4'd14);	
				reg_bank_wen_nxt  = 15'h4000;
		 	else
				reg_bank_wen_nxt  = 15'h0;
		end
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 ) 
				//reg_bank_wen_nxt   = decode (4'd14);	
				reg_bank_wen_nxt  = 15'h4000;
		else if ( control_state == MTRANS_ABORT && restore_base_address)
				//reg_bank_wen_nxt  = decode ( instruction[19:16] );
				  reg_bank_wen_nxt  = 	 instruction[19:16] == 4'h0 ? 15'h0001:
							 instruction[19:16] == 4'h1 ? 15'h0002:
							 instruction[19:16] == 4'h2 ? 15'h0004:
							 instruction[19:16] == 4'h3 ? 15'h0008:
							 instruction[19:16] == 4'h4 ? 15'h0010:
							 instruction[19:16] == 4'h5 ? 15'h0020:
							 instruction[19:16] == 4'h6 ? 15'h0040:
						 	 instruction[19:16] == 4'h7 ? 15'h0080:
						 	 instruction[19:16] == 4'h8 ? 15'h0100:
							 instruction[19:16] == 4'h9 ? 15'h0200:
							 instruction[19:16] == 4'ha ? 15'h0400:
							 instruction[19:16] == 4'hb ? 15'h0800:
						 	 instruction[19:16] == 4'hc ? 15'h1000:
							 instruction[19:16] == 4'hd ? 15'h2000:
							 instruction[19:16] == 4'he ? 15'h4000:
									    	      15'h0000;
		else if ( control_state == MULT_STORE )
		begin
			if ( type == MULT )
				//reg_bank_wen_nxt  = decode ( instruction[19:16] );
				  reg_bank_wen_nxt  = 	 instruction[19:16] == 4'h0 ? 15'h0001:
							 instruction[19:16] == 4'h1 ? 15'h0002:
							 instruction[19:16] == 4'h2 ? 15'h0004:
							 instruction[19:16] == 4'h3 ? 15'h0008:
							 instruction[19:16] == 4'h4 ? 15'h0010:
							 instruction[19:16] == 4'h5 ? 15'h0020:
							 instruction[19:16] == 4'h6 ? 15'h0040:
						 	 instruction[19:16] == 4'h7 ? 15'h0080:
						 	 instruction[19:16] == 4'h8 ? 15'h0100:
							 instruction[19:16] == 4'h9 ? 15'h0200:
							 instruction[19:16] == 4'ha ? 15'h0400:
							 instruction[19:16] == 4'hb ? 15'h0800:
						 	 instruction[19:16] == 4'hc ? 15'h1000:
							 instruction[19:16] == 4'hd ? 15'h2000:
							 instruction[19:16] == 4'he ? 15'h4000:
									    	      15'h0000;
			else
				 //reg_bank_wen_nxt = decode (instruction[15:12]);	
				   reg_bank_wen_nxt =   instruction[15:12] == 4'h0 ? 15'h0001:
							instruction[15:12] == 4'h1 ? 15'h0002:
							instruction[15:12] == 4'h2 ? 15'h0004:
							instruction[15:12] == 4'h3 ? 15'h0008:
							instruction[15:12] == 4'h4 ? 15'h0010:
							instruction[15:12] == 4'h5 ? 15'h0020:
							instruction[15:12] == 4'h6 ? 15'h0040:
							instruction[15:12] == 4'h7 ? 15'h0080:
							instruction[15:12] == 4'h8 ? 15'h0100:
							instruction[15:12] == 4'h9 ? 15'h0200:
							instruction[15:12] == 4'ha ? 15'h0400:
							instruction[15:12] == 4'hb ? 15'h0800:
							instruction[15:12] == 4'hc ? 15'h1000:
							instruction[15:12] == 4'hd ? 15'h2000:
							instruction[15:12] == 4'he ? 15'h4000:
									    	     15'h0000;
		end
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20] && instruction[15:12] != 4'd15)
				 //reg_bank_wen_nxt = decode (instruction[15:12]);	
				   reg_bank_wen_nxt =   instruction[15:12] == 4'h0 ? 15'h0001:
							instruction[15:12] == 4'h1 ? 15'h0002:
							instruction[15:12] == 4'h2 ? 15'h0004:
							instruction[15:12] == 4'h3 ? 15'h0008:
							instruction[15:12] == 4'h4 ? 15'h0010:
							instruction[15:12] == 4'h5 ? 15'h0020:
							instruction[15:12] == 4'h6 ? 15'h0040:
							instruction[15:12] == 4'h7 ? 15'h0080:
							instruction[15:12] == 4'h8 ? 15'h0100:
							instruction[15:12] == 4'h9 ? 15'h0200:
							instruction[15:12] == 4'ha ? 15'h0400:
							instruction[15:12] == 4'hb ? 15'h0800:
							instruction[15:12] == 4'hc ? 15'h1000:
							instruction[15:12] == 4'hd ? 15'h2000:
							instruction[15:12] == 4'he ? 15'h4000:
									    	     15'h0000;
		else
			reg_bank_wen_nxt                = 15'd0;
	end

always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && regop_set_flags)
			status_bits_flags_wen_nxt = 1'd1;
		else if ( control_state == MULT_STORE && instruction[20])
			status_bits_flags_wen_nxt = 1'd1;
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20] && instruction[15:12]  == 4'd15)
			status_bits_flags_wen_nxt = 1'd1;
		else
			status_bits_flags_wen_nxt = 1'd0;
	end


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict)
		begin
			if ( type == SWI || und_request )
			begin
				status_bits_mode_wen_nxt      = 1'd1;
				status_bits_irq_mask_wen_nxt  = 1'd1;
			end
			else if ( regop_set_flags && instruction[15:12] == 4'd15 && (i_execute_status_bits[1:0] != USR) )
			begin
				status_bits_mode_wen_nxt      = 1'd1;
				status_bits_irq_mask_wen_nxt  = 1'd1;
			end
			else
			begin
				status_bits_mode_wen_nxt      = 1'd0;
				status_bits_irq_mask_wen_nxt  = 1'd0;
			end
		end
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 )
		begin
			 status_bits_mode_wen_nxt        = 1'd1;
			 status_bits_irq_mask_wen_nxt    = 1'd1;
		end
		
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20] 
				&& instruction[15:12]  == 4'd15 &&  i_execute_status_bits[1:0] != USR)
		begin		
			status_bits_mode_wen_nxt         = 1'd1;
			status_bits_irq_mask_wen_nxt     = 1'd1;
		end
		else
		begin
			status_bits_mode_wen_nxt         = 1'd0;
			status_bits_irq_mask_wen_nxt     = 1'd0;
		end
	end	


always @*
	begin
		if ( instruction_valid && !interrupt && !conflict && regop_set_flags 
			&& instruction[15:12] == 4'd15 && i_execute_status_bits[1:0] != USR)
			status_bits_firq_mask_wen_nxt = 1'd1;
		else if ( instruction_valid && interrupt &&  next_interrupt != 3'd6 && next_interrupt == 3'd2 )
			status_bits_firq_mask_wen_nxt = 1'd1;
		else if ( control_state == COPRO_WAIT && instruction_execute && !conflict && instruction[20] 
			&& instruction[15:12]  == 4'd15 && i_execute_status_bits[1:0] != USR)
			status_bits_firq_mask_wen_nxt = 1'd1;
		else
			status_bits_firq_mask_wen_nxt = 1'd0;
	end		

 

// Speed up the long path from u_decode/fetch_instruction_r to u_register_bank/r8_firq
// This pre-encodes the firq_s3 signal thats used in u_register_bank
// assign firq_not_user_mode_nxt = !user_mode_regs_load_nxt && status_bits_mode_nxt == FIRQ;

assign firq_not_user_mode_nxt = status_bits_mode_nxt == FIRQ;
 
 
// ========================================================
// Next State Logic
// ========================================================
 
// this replicates the current value of the execute signal in the execute stage
//assign instruction_execute = conditional_execute ( o_condition, i_execute_status_bits[31:28] );
assign instruction_execute = ( o_condition == AL                                       			 ) ||
 		             ( o_condition == EQ  &&  i_execute_status_bits[30]       			 ) ||
		             ( o_condition == NE  && !i_execute_status_bits[30]     			 ) ||
  		             ( o_condition == CS  &&  i_execute_status_bits[29]                          ) ||
               		     ( o_condition == CC  && !i_execute_status_bits[29]                          ) ||
          		     ( o_condition == MI  &&  i_execute_status_bits[31]                          ) ||
  		             ( o_condition == PL  && !i_execute_status_bits[31]                          ) ||
     		             ( o_condition == VS  &&  i_execute_status_bits[28]                          ) ||
      		             ( o_condition == VC  && !i_execute_status_bits[28]   			 ) ||		
     		             ( o_condition == HI  &&  i_execute_status_bits[29] && !i_execute_status_bits[30] 		 ) ||
     		             ( o_condition == LS  &&  (!i_execute_status_bits[29] || i_execute_status_bits[30])          ) ||
 
      		             ( o_condition == GE  &&  i_execute_status_bits[31] == i_execute_status_bits[28]              ) ||
      		             ( o_condition == LT  &&  i_execute_status_bits[31] != i_execute_status_bits[28]              ) ||
 
       		             ( o_condition == GT  &&  !i_execute_status_bits[30] && i_execute_status_bits[31] == i_execute_status_bits[28] ) ||
        	             ( o_condition == LE  &&  (i_execute_status_bits[30] || i_execute_status_bits[31] != i_execute_status_bits[28]) ) ;
 
 
// First state of executing a new instruction
// Its complex because of conditional execution of multi-cycle instructions
assign instruction_valid = ((control_state == EXECUTE || control_state == PRE_FETCH_EXEC) ||
                              // when last instruction was multi-cycle instruction but did not execute
                              // because condition was false then act like you're in the execute state
                             (!instruction_execute && (control_state == PC_STALL1    || 
                                                       control_state == MEM_WAIT1    ||
                                                       control_state == COPRO_WAIT   ||
                                                       control_state == SWAP_WRITE   ||
                                                       control_state == MULT_PROC1   ||
                                                       control_state == MTRANS_EXEC1  ) ));
 
 
 
always @*
    begin
    // default is to hold the current state
//    control_state_nxt <= control_state;
 
    // Note: The order is important here
	
   if ( instruction_valid )
        begin
 
	if ( interrupt && !conflict )        
	    control_state_nxt = INT_WAIT1;
	else
	begin
		if ( type == MTRANS && instruction[20] && mtrans_reg1 == 4'd15 ) // Write to PC
             		control_state_nxt = MEM_WAIT1;
 
		else if ( type == MTRANS && !conflict && mtrans_num_registers != 5'd0 && mtrans_num_registers != 5'd1 )
            		control_state_nxt = MTRANS_EXEC1;
 
        	else if ( type == MULT && !conflict )
               		 control_state_nxt = MULT_PROC1;
 
        	else if ( type == SWAP && !conflict )        
                	control_state_nxt = SWAP_WRITE;
 
        	else if ( type == CORTRANS && !und_request && !conflict )        
                	control_state_nxt = COPRO_WAIT;
		else
		begin
			if ( load_op && instruction[15:12]  == 4'd15 )
				control_state_nxt = MEM_WAIT1;
			else
			begin
				if( current_write_pc )
					control_state_nxt = PC_STALL1;
				else
					control_state_nxt = EXECUTE;
			end
		end
	end		

    end

   else
   begin
    if ( control_state == RST_WAIT1 )     	control_state_nxt = RST_WAIT2;
    else if ( control_state == RST_WAIT2 )    	control_state_nxt = EXECUTE;
    else if ( control_state == INT_WAIT1 )      control_state_nxt = INT_WAIT2;
    else if ( control_state == INT_WAIT2 )      control_state_nxt = EXECUTE;
    else if ( control_state == COPRO_WAIT )     control_state_nxt = PRE_FETCH_EXEC;
    else if ( control_state == PC_STALL1 )      control_state_nxt = PC_STALL2;
    else if ( control_state == PC_STALL2 )      control_state_nxt = EXECUTE; 
    else if ( control_state == SWAP_WRITE )     control_state_nxt = SWAP_WAIT1; 
    else if ( control_state == SWAP_WAIT1 )     control_state_nxt = SWAP_WAIT2; 
    else if ( control_state == MULT_STORE )     control_state_nxt = PRE_FETCH_EXEC;  
    else if ( control_state == MTRANS_ABORT )   control_state_nxt = PRE_FETCH_EXEC;
 
    else if ( control_state == MEM_WAIT1 )	control_state_nxt = MEM_WAIT2;
 
    else if ( control_state == MEM_WAIT2   || control_state == SWAP_WAIT2    )
        begin
        if ( write_pc ) // writing to the PC!! 
            control_state_nxt = PC_STALL1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
        end
 
    else if ( control_state == MTRANS_EXEC1 )  
        begin 
        if ( mtrans_instruction_nxt[15:0] != 16'd0 )
            control_state_nxt = MTRANS_EXEC2;
        else   // if the register list holds a single register 
            begin
            if ( dabt ) // data abort
                control_state_nxt = MTRANS_ABORT;
            else if ( write_pc ) // writing to the PC!! 
                control_state_nxt = MEM_WAIT1;
            else
                control_state_nxt = PRE_FETCH_EXEC;
            end

        end
 
        // Stay in State MTRANS_EXEC2 until the full list of registers to
        // load or store has been processed

    else if ( control_state == MTRANS_EXEC2 && mtrans_num_registers == 5'd1 )
        begin
        if ( dabt ) // data abort
            control_state_nxt = MTRANS_ABORT;
        else if ( write_pc ) // writing to the PC!! 
            control_state_nxt = MEM_WAIT1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
        end
 
 
    else if ( control_state == MULT_PROC1 )
        begin
        if (!instruction_execute)
            control_state_nxt = PRE_FETCH_EXEC;
        else
            control_state_nxt = MULT_PROC2;
        end
 
    else if ( control_state == MULT_PROC2 )
        begin
        if ( i_multiply_done )
	begin
            if      ( o_multiply_function[1] )  // Accumulate ?
                control_state_nxt = MULT_ACCUMU;
            else    
                control_state_nxt = MULT_STORE;
	end
	else
		control_state_nxt = control_state;
        end
 
 
    else if ( control_state == MULT_ACCUMU )
        begin
        control_state_nxt = MULT_STORE;
        end
 
 
    else   //jing
	control_state_nxt = control_state;
     end
 
    end
 
 
assign 	 i_fetch = {i_fetch_instruction[27:20], i_fetch_instruction[7:4]};  //jing
// ========================================================
// Register Update
// ========================================================
always @ ( posedge i_clk )
    if ( !i_core_stall ) 
        begin        
        if (!conflict)
            begin                                                                                                  
            fetch_instruction_r         <= i_fetch_instruction;
//            fetch_instruction_type_r    <= instruction_type(i_fetch_instruction);
	
	     fetch_instruction_type_r    <= 
					(
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]}[11:6] == 12'b00010?001001 ? SWAP:
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} =        12'b000000??1001 ? MULT:
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]}[11:10] = 12'b00?????????? ? REGOP:
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} = 	12'b01?????????? ? TRANS:   
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} =	12'b100????????? ? MTRANS:  
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} =	12'b101????????? ? BRANCH: 
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} = 	12'b110????????? ? CODTRANS:
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} = 	12'b1110???????0 ? COREGOP:       
//					{i_fetch_instruction[27:20], i_fetch_instruction[7:4]} = 	12'b1110???????1 ? CORTRANS:
//														    SWI     

					(i_fetch[11:7]  == 5'b00010  && i_fetch[5:0] == 6'b001001)? SWAP:
					(i_fetch[11:6]  == 6'b000000 && i_fetch[3:0] == 4'b1001  )? MULT:
					 i_fetch[11:10] == 2'b00 ? REGOP:
					 i_fetch[11:10] == 2'b01 ? TRANS:
					 i_fetch[11:9]  == 3'b100 ? MTRANS:
					 i_fetch[11:9]  == 3'b101 ? BRANCH:
					 i_fetch[11:9]  == 3'b110 ? CODTRANS:
					(i_fetch[11:8]  == 4'b1110 && i_fetch[0] == 1'b0  )? COREGOP:
					(i_fetch[11:8]  == 4'b1110 && i_fetch[0] == 1'b1  )? CORTRANS:
												SWI);

            fetch_address_r             <= i_execute_iaddress;
            iabt_reg                    <= i_iabt;
            adex_reg                    <= i_adex;
            abt_status_reg              <= i_abt_status;
            end
 
        o_status_bits_mode          <= status_bits_mode_nxt;
        o_status_bits_irq_mask      <= status_bits_irq_mask_nxt;
        o_status_bits_firq_mask     <= status_bits_firq_mask_nxt;
        o_imm32                     <= imm32_nxt;
        o_imm_shift_amount          <= imm_shift_amount_nxt;
        o_shift_imm_zero            <= shift_imm_zero_nxt;
 
                                        // when have an interrupt, execute the interrupt operation
                                        // unconditionally in the execute stage
                                        // ensures that status_bits register gets updated correctly
                                        // Likewise when in middle of multi-cycle instructions
                                        // execute them unconditionally
        o_condition                 <= instruction_valid && !interrupt ? condition_nxt : AL;
        o_decode_exclusive          <= decode_exclusive_nxt;
        o_decode_iaccess            <= decode_iaccess_nxt;
        o_decode_daccess            <= decode_daccess_nxt;
 
        o_rm_sel                    <= rm_sel_nxt;
        o_rs_sel                    <= rs_sel_nxt;
        o_load_rd                   <= load_rd_nxt;
        load_rd_d1                  <= load_rd_d1_nxt; 
        load_pc_r                   <= load_pc_nxt;
        o_rn_sel                    <= rn_sel_nxt;
        o_barrel_shift_amount_sel   <= barrel_shift_amount_sel_nxt;
        o_barrel_shift_data_sel     <= barrel_shift_data_sel_nxt;
        o_barrel_shift_function     <= barrel_shift_function_nxt;
        o_alu_function              <= alu_function_nxt;
        o_multiply_function         <= multiply_function_nxt;
        o_interrupt_vector_sel      <= next_interrupt;
        o_iaddress_sel              <= iaddress_sel_nxt;
        o_daddress_sel              <= daddress_sel_nxt;
        o_pc_sel                    <= pc_sel_nxt;
        o_byte_enable_sel           <= byte_enable_sel_nxt;
        o_status_bits_sel           <= status_bits_sel_nxt;
        o_reg_write_sel             <= reg_write_sel_nxt;
        o_firq_not_user_mode        <= firq_not_user_mode_nxt;
        o_write_data_wen            <= write_data_wen_nxt;
        o_base_address_wen          <= base_address_wen_nxt;
        o_pc_wen                    <= pc_wen_nxt;
        o_reg_bank_wen              <= reg_bank_wen_nxt;
        o_status_bits_flags_wen     <= status_bits_flags_wen_nxt;
        o_status_bits_mode_wen      <= status_bits_mode_wen_nxt;
        o_status_bits_irq_mask_wen  <= status_bits_irq_mask_wen_nxt;
        o_status_bits_firq_mask_wen <= status_bits_firq_mask_wen_nxt;
 
        o_copro_opcode1             <= instruction[23:21];
        o_copro_opcode2             <= instruction[7:5];
        o_copro_crn                 <= instruction[19:16];
        o_copro_crm                 <= instruction[3:0];
        o_copro_num                 <= instruction[11:8];
        o_copro_operation           <= copro_operation_nxt;
        o_copro_write_data_wen      <= copro_write_data_wen_nxt;
        restore_base_address        <= restore_base_address_nxt;
        control_state               <= control_state_nxt;
        end
 
 
 
always @ ( posedge i_clk )
    if ( !i_core_stall )
        begin
        // sometimes this is a pre-fetch instruction
        // e.g. two ldr instructions in a row. The second ldr will be saved
        // to the pre-fetch instruction register
        // then when its decoded, a copy is saved to the saved_current_instruction
        // register
        if      ( type == MTRANS )
            begin           
            saved_current_instruction              <= mtrans_instruction_nxt;
            saved_current_instruction_type         <= type;
            saved_current_instruction_iabt         <= instruction_iabt;
            saved_current_instruction_adex         <= instruction_adex;
            saved_current_instruction_address      <= instruction_address;
            saved_current_instruction_iabt_status  <= instruction_iabt_status;
            end
        else if ( saved_current_instruction_wen ) 
            begin           
            saved_current_instruction              <= instruction;
            saved_current_instruction_type         <= type;
            saved_current_instruction_iabt         <= instruction_iabt;
            saved_current_instruction_adex         <= instruction_adex;
            saved_current_instruction_address      <= instruction_address;
            saved_current_instruction_iabt_status  <= instruction_iabt_status;
            end
 
        if      ( pre_fetch_instruction_wen )     
            begin
            pre_fetch_instruction                  <= fetch_instruction_r;      
            pre_fetch_instruction_type             <= fetch_instruction_type_r;      
            pre_fetch_instruction_iabt             <= iabt_reg; 
            pre_fetch_instruction_adex             <= adex_reg; 
            pre_fetch_instruction_address          <= fetch_address_r; 
            pre_fetch_instruction_iabt_status      <= abt_status_reg; 
            end
 
 
        // TODO possible to use saved_current_instruction instead and save some regs?          
        hold_instruction              <= instruction;
        hold_instruction_type         <= type;
        hold_instruction_iabt         <= instruction_iabt;
        hold_instruction_adex         <= instruction_adex;
        hold_instruction_address      <= instruction_address;
        hold_instruction_iabt_status  <= instruction_iabt_status;
        end
 
 
 
always @ ( posedge i_clk )
    if ( !i_core_stall )
        begin
        irq   <= i_irq;  
        firq  <= i_firq; 
 
        if ( control_state == INT_WAIT1 && o_status_bits_mode == SVC )
            begin
            dabt_reg  <= 1'd0;
            end
        else
            begin
            dabt_reg  <= dabt_reg || i_dabt;  
            end
 
        dabt_reg_d1  <= dabt_reg;   
        end  
 
assign dabt = dabt_reg || i_dabt;
 
 
// ========================================================
// Decompiler for debugging core - not synthesizable
// ========================================================
//synopsys translate_off
 
//`include "a25/debug_functions.v"
 
/*a25_decompile  u_decompile (
    .i_clk                      ( i_clk                            ),
    .i_core_stall               ( i_core_stall                     ),
    .i_instruction              ( instruction                      ),
    .i_instruction_valid        ( instruction_valid &&!conflict    ),
    .i_instruction_execute      ( instruction_execute              ),
    .i_instruction_address      ( instruction_address              ),
    .i_interrupt                ( {3{interrupt}} & next_interrupt  ),
    .i_interrupt_state          ( control_state == INT_WAIT2       ),
    .i_instruction_undefined    ( und_request                      ),
    .i_pc_sel                   ( o_pc_sel                         ),
    .i_pc_wen                   ( o_pc_wen                         )
);
*/ 
 
wire    [(15*8)-1:0]    xCONTROL_STATE;
wire    [(15*8)-1:0]    xMODE;
wire    [( 8*8)-1:0]    xTYPE;
 
assign xCONTROL_STATE        = 
                               control_state == RST_WAIT1      ? "RST_WAIT1"      :
                               control_state == RST_WAIT2      ? "RST_WAIT2"      :
 
 
                               control_state == INT_WAIT1      ? "INT_WAIT1"      :
                               control_state == INT_WAIT2      ? "INT_WAIT2"      :
                               control_state == EXECUTE        ? "EXECUTE"        :
                               control_state == PRE_FETCH_EXEC ? "PRE_FETCH_EXEC" :
                               control_state == MEM_WAIT1      ? "MEM_WAIT1"      :
                               control_state == MEM_WAIT2      ? "MEM_WAIT2"      :
                               control_state == PC_STALL1      ? "PC_STALL1"      :
                               control_state == PC_STALL2      ? "PC_STALL2"      :
                               control_state == MTRANS_EXEC1   ? "MTRANS_EXEC1"   :
                               control_state == MTRANS_EXEC2   ? "MTRANS_EXEC2"   :
                               control_state == MTRANS_ABORT   ? "MTRANS_ABORT"   :
                               control_state == MULT_PROC1     ? "MULT_PROC1"     :
                               control_state == MULT_PROC2     ? "MULT_PROC2"     :
                               control_state == MULT_STORE     ? "MULT_STORE"     :
                               control_state == MULT_ACCUMU    ? "MULT_ACCUMU"    :
                               control_state == SWAP_WRITE     ? "SWAP_WRITE"     :
                               control_state == SWAP_WAIT1     ? "SWAP_WAIT1"     :
                               control_state == SWAP_WAIT2     ? "SWAP_WAIT2"     :
								 "COPRO_WAIT"     ;
 
//assign xMODE  = mode_name ( o_status_bits_mode );

//assign xMODE  = o_status_bits_mode == USR  ? "User          " :
//                o_status_bits_mode == SVC  ? "Supervisor    " :
//                o_status_bits_mode == IRQ  ? "Interrupt     " :
//				 	       "Fast_Interrupt" ;

assign xTYPE  =  
                               type == REGOP    ? "REGOP"    :
                               type == MULT     ? "MULT"     :
                               type == SWAP     ? "SWAP"     :
                               type == TRANS    ? "TRANS"    :
                               type == MTRANS   ? "MTRANS"   :
                               type == BRANCH   ? "BRANCH"   :
                               type == CODTRANS ? "CODTRANS" :
                               type == COREGOP  ? "COREGOP"  :
                               type == CORTRANS ? "CORTRANS" :
						  "SWI"      ;
  
 
/*always @( posedge i_clk )
    if (control_state == EXECUTE && ((instruction[0] === 1'bx) || (instruction[31] === 1'bx)))
        begin
        `TB_ERROR_MESSAGE
        $display("Instruction with x's =%08h", instruction);
        end
*/
//synopsys translate_on
 
endmodule
