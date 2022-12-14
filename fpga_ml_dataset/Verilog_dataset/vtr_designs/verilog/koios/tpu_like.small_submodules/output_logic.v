`define SIMULATION
`define DWIDTH 8
`define DESIGN_SIZE 16
`define LOG2_DESIGN_SIZE 5
`define MAT_MUL_SIZE 16
`define MASK_WIDTH 16
`define LOG2_MAT_MUL_SIZE 5
`define AWIDTH 10
`define NUM_CYCLES_IN_MAC 3
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ADDR_STRIDE_WIDTH 16
`define MAX_BITS_POOL 3
`define REG_ENABLES_ADDR 32'h0
`define REG_STDN_TPU_ADDR 32'h4
`define REG_MEAN_ADDR 32'h8
`define REG_INV_VAR_ADDR 32'hA
`define REG_MATRIX_A_ADDR 32'he
`define REG_MATRIX_B_ADDR 32'h12
`define REG_MATRIX_C_ADDR 32'h16
`define REG_ACCUM_ACTIONS_ADDR 32'h24
`define REG_MATRIX_A_STRIDE_ADDR 32'h28
`define REG_MATRIX_B_STRIDE_ADDR 32'h32
`define REG_MATRIX_C_STRIDE_ADDR 32'h36
`define REG_ACTIVATION_CSR_ADDR 32'h3A
`define REG_POOL_WINDOW_ADDR 32'h3E
`define REG_CONV_PARAMS_1_ADDR 32'h40
`define REG_CONV_PARAMS_2_ADDR 32'h44
`define REG_CONV_PARAMS_3_ADDR 32'h48
`define REG_CONV_PARAMS_4_ADDR 32'h4C
`define REG_BATCH_SIZE_ADDR 32'h50
`define REG_VALID_MASK_A_ROWS_ADDR 32'h20
`define REG_VALID_MASK_A_COLS_ADDR 32'h54
`define REG_VALID_MASK_B_ROWS_ADDR 32'h5c
`define REG_VALID_MASK_B_COLS_ADDR 32'h58
//This used to be a normal signal, but changing it to a `define.
`define final_mat_mul_size 16
`define IDLE     2'b00
`define W_ENABLE  2'b01
`define R_ENABLE  2'b10
`define STATE_INIT         4'b0000
`define STATE_MATMUL       4'b0001
`define STATE_NORM         4'b0010
`define STATE_POOL         4'b0011
`define STATE_ACTIVATION   4'b0100
`define STATE_DONE         4'b0101

module output_logic(
start_mat_mul,
done_mat_mul,
address_mat_c,
address_stride_c,
c_data_in,
c_data_out, //Data values going out to next matmul - systolic shifting
c_addr,
c_data_available,
clk_cnt,
row_latch_en,

final_mat_mul_size,
  matrixC0_0,
matrixC0_1,
matrixC0_2,
matrixC0_3,
matrixC0_4,
matrixC0_5,
matrixC0_6,
matrixC0_7,
matrixC0_8,
matrixC0_9,
matrixC0_10,
matrixC0_11,
matrixC0_12,
matrixC0_13,
matrixC0_14,
matrixC0_15,
matrixC1_0,
matrixC1_1,
matrixC1_2,
matrixC1_3,
matrixC1_4,
matrixC1_5,
matrixC1_6,
matrixC1_7,
matrixC1_8,
matrixC1_9,
matrixC1_10,
matrixC1_11,
matrixC1_12,
matrixC1_13,
matrixC1_14,
matrixC1_15,
matrixC2_0,
matrixC2_1,
matrixC2_2,
matrixC2_3,
matrixC2_4,
matrixC2_5,
matrixC2_6,
matrixC2_7,
matrixC2_8,
matrixC2_9,
matrixC2_10,
matrixC2_11,
matrixC2_12,
matrixC2_13,
matrixC2_14,
matrixC2_15,
matrixC3_0,
matrixC3_1,
matrixC3_2,
matrixC3_3,
matrixC3_4,
matrixC3_5,
matrixC3_6,
matrixC3_7,
matrixC3_8,
matrixC3_9,
matrixC3_10,
matrixC3_11,
matrixC3_12,
matrixC3_13,
matrixC3_14,
matrixC3_15,
matrixC4_0,
matrixC4_1,
matrixC4_2,
matrixC4_3,
matrixC4_4,
matrixC4_5,
matrixC4_6,
matrixC4_7,
matrixC4_8,
matrixC4_9,
matrixC4_10,
matrixC4_11,
matrixC4_12,
matrixC4_13,
matrixC4_14,
matrixC4_15,
matrixC5_0,
matrixC5_1,
matrixC5_2,
matrixC5_3,
matrixC5_4,
matrixC5_5,
matrixC5_6,
matrixC5_7,
matrixC5_8,
matrixC5_9,
matrixC5_10,
matrixC5_11,
matrixC5_12,
matrixC5_13,
matrixC5_14,
matrixC5_15,
matrixC6_0,
matrixC6_1,
matrixC6_2,
matrixC6_3,
matrixC6_4,
matrixC6_5,
matrixC6_6,
matrixC6_7,
matrixC6_8,
matrixC6_9,
matrixC6_10,
matrixC6_11,
matrixC6_12,
matrixC6_13,
matrixC6_14,
matrixC6_15,
matrixC7_0,
matrixC7_1,
matrixC7_2,
matrixC7_3,
matrixC7_4,
matrixC7_5,
matrixC7_6,
matrixC7_7,
matrixC7_8,
matrixC7_9,
matrixC7_10,
matrixC7_11,
matrixC7_12,
matrixC7_13,
matrixC7_14,
matrixC7_15,
matrixC8_0,
matrixC8_1,
matrixC8_2,
matrixC8_3,
matrixC8_4,
matrixC8_5,
matrixC8_6,
matrixC8_7,
matrixC8_8,
matrixC8_9,
matrixC8_10,
matrixC8_11,
matrixC8_12,
matrixC8_13,
matrixC8_14,
matrixC8_15,
matrixC9_0,
matrixC9_1,
matrixC9_2,
matrixC9_3,
matrixC9_4,
matrixC9_5,
matrixC9_6,
matrixC9_7,
matrixC9_8,
matrixC9_9,
matrixC9_10,
matrixC9_11,
matrixC9_12,
matrixC9_13,
matrixC9_14,
matrixC9_15,
matrixC10_0,
matrixC10_1,
matrixC10_2,
matrixC10_3,
matrixC10_4,
matrixC10_5,
matrixC10_6,
matrixC10_7,
matrixC10_8,
matrixC10_9,
matrixC10_10,
matrixC10_11,
matrixC10_12,
matrixC10_13,
matrixC10_14,
matrixC10_15,
matrixC11_0,
matrixC11_1,
matrixC11_2,
matrixC11_3,
matrixC11_4,
matrixC11_5,
matrixC11_6,
matrixC11_7,
matrixC11_8,
matrixC11_9,
matrixC11_10,
matrixC11_11,
matrixC11_12,
matrixC11_13,
matrixC11_14,
matrixC11_15,
matrixC12_0,
matrixC12_1,
matrixC12_2,
matrixC12_3,
matrixC12_4,
matrixC12_5,
matrixC12_6,
matrixC12_7,
matrixC12_8,
matrixC12_9,
matrixC12_10,
matrixC12_11,
matrixC12_12,
matrixC12_13,
matrixC12_14,
matrixC12_15,
matrixC13_0,
matrixC13_1,
matrixC13_2,
matrixC13_3,
matrixC13_4,
matrixC13_5,
matrixC13_6,
matrixC13_7,
matrixC13_8,
matrixC13_9,
matrixC13_10,
matrixC13_11,
matrixC13_12,
matrixC13_13,
matrixC13_14,
matrixC13_15,
matrixC14_0,
matrixC14_1,
matrixC14_2,
matrixC14_3,
matrixC14_4,
matrixC14_5,
matrixC14_6,
matrixC14_7,
matrixC14_8,
matrixC14_9,
matrixC14_10,
matrixC14_11,
matrixC14_12,
matrixC14_13,
matrixC14_14,
matrixC14_15,
matrixC15_0,
matrixC15_1,
matrixC15_2,
matrixC15_3,
matrixC15_4,
matrixC15_5,
matrixC15_6,
matrixC15_7,
matrixC15_8,
matrixC15_9,
matrixC15_10,
matrixC15_11,
matrixC15_12,
matrixC15_13,
matrixC15_14,
matrixC15_15,

clk,
reset
);

input clk;
input reset;
input start_mat_mul;
input done_mat_mul;
input [`AWIDTH-1:0] address_mat_c;
input [`ADDR_STRIDE_WIDTH-1:0] address_stride_c;
input [`MAT_MUL_SIZE*`DWIDTH-1:0] c_data_in;
output [`MAT_MUL_SIZE*`DWIDTH-1:0] c_data_out;
output [`AWIDTH-1:0] c_addr;
output c_data_available;
input [7:0] clk_cnt;
output row_latch_en;

input [7:0] final_mat_mul_size;
  input [`DWIDTH-1:0] matrixC0_0;
input [`DWIDTH-1:0] matrixC0_1;
input [`DWIDTH-1:0] matrixC0_2;
input [`DWIDTH-1:0] matrixC0_3;
input [`DWIDTH-1:0] matrixC0_4;
input [`DWIDTH-1:0] matrixC0_5;
input [`DWIDTH-1:0] matrixC0_6;
input [`DWIDTH-1:0] matrixC0_7;
input [`DWIDTH-1:0] matrixC0_8;
input [`DWIDTH-1:0] matrixC0_9;
input [`DWIDTH-1:0] matrixC0_10;
input [`DWIDTH-1:0] matrixC0_11;
input [`DWIDTH-1:0] matrixC0_12;
input [`DWIDTH-1:0] matrixC0_13;
input [`DWIDTH-1:0] matrixC0_14;
input [`DWIDTH-1:0] matrixC0_15;
input [`DWIDTH-1:0] matrixC1_0;
input [`DWIDTH-1:0] matrixC1_1;
input [`DWIDTH-1:0] matrixC1_2;
input [`DWIDTH-1:0] matrixC1_3;
input [`DWIDTH-1:0] matrixC1_4;
input [`DWIDTH-1:0] matrixC1_5;
input [`DWIDTH-1:0] matrixC1_6;
input [`DWIDTH-1:0] matrixC1_7;
input [`DWIDTH-1:0] matrixC1_8;
input [`DWIDTH-1:0] matrixC1_9;
input [`DWIDTH-1:0] matrixC1_10;
input [`DWIDTH-1:0] matrixC1_11;
input [`DWIDTH-1:0] matrixC1_12;
input [`DWIDTH-1:0] matrixC1_13;
input [`DWIDTH-1:0] matrixC1_14;
input [`DWIDTH-1:0] matrixC1_15;
input [`DWIDTH-1:0] matrixC2_0;
input [`DWIDTH-1:0] matrixC2_1;
input [`DWIDTH-1:0] matrixC2_2;
input [`DWIDTH-1:0] matrixC2_3;
input [`DWIDTH-1:0] matrixC2_4;
input [`DWIDTH-1:0] matrixC2_5;
input [`DWIDTH-1:0] matrixC2_6;
input [`DWIDTH-1:0] matrixC2_7;
input [`DWIDTH-1:0] matrixC2_8;
input [`DWIDTH-1:0] matrixC2_9;
input [`DWIDTH-1:0] matrixC2_10;
input [`DWIDTH-1:0] matrixC2_11;
input [`DWIDTH-1:0] matrixC2_12;
input [`DWIDTH-1:0] matrixC2_13;
input [`DWIDTH-1:0] matrixC2_14;
input [`DWIDTH-1:0] matrixC2_15;
input [`DWIDTH-1:0] matrixC3_0;
input [`DWIDTH-1:0] matrixC3_1;
input [`DWIDTH-1:0] matrixC3_2;
input [`DWIDTH-1:0] matrixC3_3;
input [`DWIDTH-1:0] matrixC3_4;
input [`DWIDTH-1:0] matrixC3_5;
input [`DWIDTH-1:0] matrixC3_6;
input [`DWIDTH-1:0] matrixC3_7;
input [`DWIDTH-1:0] matrixC3_8;
input [`DWIDTH-1:0] matrixC3_9;
input [`DWIDTH-1:0] matrixC3_10;
input [`DWIDTH-1:0] matrixC3_11;
input [`DWIDTH-1:0] matrixC3_12;
input [`DWIDTH-1:0] matrixC3_13;
input [`DWIDTH-1:0] matrixC3_14;
input [`DWIDTH-1:0] matrixC3_15;
input [`DWIDTH-1:0] matrixC4_0;
input [`DWIDTH-1:0] matrixC4_1;
input [`DWIDTH-1:0] matrixC4_2;
input [`DWIDTH-1:0] matrixC4_3;
input [`DWIDTH-1:0] matrixC4_4;
input [`DWIDTH-1:0] matrixC4_5;
input [`DWIDTH-1:0] matrixC4_6;
input [`DWIDTH-1:0] matrixC4_7;
input [`DWIDTH-1:0] matrixC4_8;
input [`DWIDTH-1:0] matrixC4_9;
input [`DWIDTH-1:0] matrixC4_10;
input [`DWIDTH-1:0] matrixC4_11;
input [`DWIDTH-1:0] matrixC4_12;
input [`DWIDTH-1:0] matrixC4_13;
input [`DWIDTH-1:0] matrixC4_14;
input [`DWIDTH-1:0] matrixC4_15;
input [`DWIDTH-1:0] matrixC5_0;
input [`DWIDTH-1:0] matrixC5_1;
input [`DWIDTH-1:0] matrixC5_2;
input [`DWIDTH-1:0] matrixC5_3;
input [`DWIDTH-1:0] matrixC5_4;
input [`DWIDTH-1:0] matrixC5_5;
input [`DWIDTH-1:0] matrixC5_6;
input [`DWIDTH-1:0] matrixC5_7;
input [`DWIDTH-1:0] matrixC5_8;
input [`DWIDTH-1:0] matrixC5_9;
input [`DWIDTH-1:0] matrixC5_10;
input [`DWIDTH-1:0] matrixC5_11;
input [`DWIDTH-1:0] matrixC5_12;
input [`DWIDTH-1:0] matrixC5_13;
input [`DWIDTH-1:0] matrixC5_14;
input [`DWIDTH-1:0] matrixC5_15;
input [`DWIDTH-1:0] matrixC6_0;
input [`DWIDTH-1:0] matrixC6_1;
input [`DWIDTH-1:0] matrixC6_2;
input [`DWIDTH-1:0] matrixC6_3;
input [`DWIDTH-1:0] matrixC6_4;
input [`DWIDTH-1:0] matrixC6_5;
input [`DWIDTH-1:0] matrixC6_6;
input [`DWIDTH-1:0] matrixC6_7;
input [`DWIDTH-1:0] matrixC6_8;
input [`DWIDTH-1:0] matrixC6_9;
input [`DWIDTH-1:0] matrixC6_10;
input [`DWIDTH-1:0] matrixC6_11;
input [`DWIDTH-1:0] matrixC6_12;
input [`DWIDTH-1:0] matrixC6_13;
input [`DWIDTH-1:0] matrixC6_14;
input [`DWIDTH-1:0] matrixC6_15;
input [`DWIDTH-1:0] matrixC7_0;
input [`DWIDTH-1:0] matrixC7_1;
input [`DWIDTH-1:0] matrixC7_2;
input [`DWIDTH-1:0] matrixC7_3;
input [`DWIDTH-1:0] matrixC7_4;
input [`DWIDTH-1:0] matrixC7_5;
input [`DWIDTH-1:0] matrixC7_6;
input [`DWIDTH-1:0] matrixC7_7;
input [`DWIDTH-1:0] matrixC7_8;
input [`DWIDTH-1:0] matrixC7_9;
input [`DWIDTH-1:0] matrixC7_10;
input [`DWIDTH-1:0] matrixC7_11;
input [`DWIDTH-1:0] matrixC7_12;
input [`DWIDTH-1:0] matrixC7_13;
input [`DWIDTH-1:0] matrixC7_14;
input [`DWIDTH-1:0] matrixC7_15;
input [`DWIDTH-1:0] matrixC8_0;
input [`DWIDTH-1:0] matrixC8_1;
input [`DWIDTH-1:0] matrixC8_2;
input [`DWIDTH-1:0] matrixC8_3;
input [`DWIDTH-1:0] matrixC8_4;
input [`DWIDTH-1:0] matrixC8_5;
input [`DWIDTH-1:0] matrixC8_6;
input [`DWIDTH-1:0] matrixC8_7;
input [`DWIDTH-1:0] matrixC8_8;
input [`DWIDTH-1:0] matrixC8_9;
input [`DWIDTH-1:0] matrixC8_10;
input [`DWIDTH-1:0] matrixC8_11;
input [`DWIDTH-1:0] matrixC8_12;
input [`DWIDTH-1:0] matrixC8_13;
input [`DWIDTH-1:0] matrixC8_14;
input [`DWIDTH-1:0] matrixC8_15;
input [`DWIDTH-1:0] matrixC9_0;
input [`DWIDTH-1:0] matrixC9_1;
input [`DWIDTH-1:0] matrixC9_2;
input [`DWIDTH-1:0] matrixC9_3;
input [`DWIDTH-1:0] matrixC9_4;
input [`DWIDTH-1:0] matrixC9_5;
input [`DWIDTH-1:0] matrixC9_6;
input [`DWIDTH-1:0] matrixC9_7;
input [`DWIDTH-1:0] matrixC9_8;
input [`DWIDTH-1:0] matrixC9_9;
input [`DWIDTH-1:0] matrixC9_10;
input [`DWIDTH-1:0] matrixC9_11;
input [`DWIDTH-1:0] matrixC9_12;
input [`DWIDTH-1:0] matrixC9_13;
input [`DWIDTH-1:0] matrixC9_14;
input [`DWIDTH-1:0] matrixC9_15;
input [`DWIDTH-1:0] matrixC10_0;
input [`DWIDTH-1:0] matrixC10_1;
input [`DWIDTH-1:0] matrixC10_2;
input [`DWIDTH-1:0] matrixC10_3;
input [`DWIDTH-1:0] matrixC10_4;
input [`DWIDTH-1:0] matrixC10_5;
input [`DWIDTH-1:0] matrixC10_6;
input [`DWIDTH-1:0] matrixC10_7;
input [`DWIDTH-1:0] matrixC10_8;
input [`DWIDTH-1:0] matrixC10_9;
input [`DWIDTH-1:0] matrixC10_10;
input [`DWIDTH-1:0] matrixC10_11;
input [`DWIDTH-1:0] matrixC10_12;
input [`DWIDTH-1:0] matrixC10_13;
input [`DWIDTH-1:0] matrixC10_14;
input [`DWIDTH-1:0] matrixC10_15;
input [`DWIDTH-1:0] matrixC11_0;
input [`DWIDTH-1:0] matrixC11_1;
input [`DWIDTH-1:0] matrixC11_2;
input [`DWIDTH-1:0] matrixC11_3;
input [`DWIDTH-1:0] matrixC11_4;
input [`DWIDTH-1:0] matrixC11_5;
input [`DWIDTH-1:0] matrixC11_6;
input [`DWIDTH-1:0] matrixC11_7;
input [`DWIDTH-1:0] matrixC11_8;
input [`DWIDTH-1:0] matrixC11_9;
input [`DWIDTH-1:0] matrixC11_10;
input [`DWIDTH-1:0] matrixC11_11;
input [`DWIDTH-1:0] matrixC11_12;
input [`DWIDTH-1:0] matrixC11_13;
input [`DWIDTH-1:0] matrixC11_14;
input [`DWIDTH-1:0] matrixC11_15;
input [`DWIDTH-1:0] matrixC12_0;
input [`DWIDTH-1:0] matrixC12_1;
input [`DWIDTH-1:0] matrixC12_2;
input [`DWIDTH-1:0] matrixC12_3;
input [`DWIDTH-1:0] matrixC12_4;
input [`DWIDTH-1:0] matrixC12_5;
input [`DWIDTH-1:0] matrixC12_6;
input [`DWIDTH-1:0] matrixC12_7;
input [`DWIDTH-1:0] matrixC12_8;
input [`DWIDTH-1:0] matrixC12_9;
input [`DWIDTH-1:0] matrixC12_10;
input [`DWIDTH-1:0] matrixC12_11;
input [`DWIDTH-1:0] matrixC12_12;
input [`DWIDTH-1:0] matrixC12_13;
input [`DWIDTH-1:0] matrixC12_14;
input [`DWIDTH-1:0] matrixC12_15;
input [`DWIDTH-1:0] matrixC13_0;
input [`DWIDTH-1:0] matrixC13_1;
input [`DWIDTH-1:0] matrixC13_2;
input [`DWIDTH-1:0] matrixC13_3;
input [`DWIDTH-1:0] matrixC13_4;
input [`DWIDTH-1:0] matrixC13_5;
input [`DWIDTH-1:0] matrixC13_6;
input [`DWIDTH-1:0] matrixC13_7;
input [`DWIDTH-1:0] matrixC13_8;
input [`DWIDTH-1:0] matrixC13_9;
input [`DWIDTH-1:0] matrixC13_10;
input [`DWIDTH-1:0] matrixC13_11;
input [`DWIDTH-1:0] matrixC13_12;
input [`DWIDTH-1:0] matrixC13_13;
input [`DWIDTH-1:0] matrixC13_14;
input [`DWIDTH-1:0] matrixC13_15;
input [`DWIDTH-1:0] matrixC14_0;
input [`DWIDTH-1:0] matrixC14_1;
input [`DWIDTH-1:0] matrixC14_2;
input [`DWIDTH-1:0] matrixC14_3;
input [`DWIDTH-1:0] matrixC14_4;
input [`DWIDTH-1:0] matrixC14_5;
input [`DWIDTH-1:0] matrixC14_6;
input [`DWIDTH-1:0] matrixC14_7;
input [`DWIDTH-1:0] matrixC14_8;
input [`DWIDTH-1:0] matrixC14_9;
input [`DWIDTH-1:0] matrixC14_10;
input [`DWIDTH-1:0] matrixC14_11;
input [`DWIDTH-1:0] matrixC14_12;
input [`DWIDTH-1:0] matrixC14_13;
input [`DWIDTH-1:0] matrixC14_14;
input [`DWIDTH-1:0] matrixC14_15;
input [`DWIDTH-1:0] matrixC15_0;
input [`DWIDTH-1:0] matrixC15_1;
input [`DWIDTH-1:0] matrixC15_2;
input [`DWIDTH-1:0] matrixC15_3;
input [`DWIDTH-1:0] matrixC15_4;
input [`DWIDTH-1:0] matrixC15_5;
input [`DWIDTH-1:0] matrixC15_6;
input [`DWIDTH-1:0] matrixC15_7;
input [`DWIDTH-1:0] matrixC15_8;
input [`DWIDTH-1:0] matrixC15_9;
input [`DWIDTH-1:0] matrixC15_10;
input [`DWIDTH-1:0] matrixC15_11;
input [`DWIDTH-1:0] matrixC15_12;
input [`DWIDTH-1:0] matrixC15_13;
input [`DWIDTH-1:0] matrixC15_14;
input [`DWIDTH-1:0] matrixC15_15;
wire row_latch_en;


//////////////////////////////////////////////////////////////////////////
// Logic to capture matrix C data from the PEs and shift it out
//////////////////////////////////////////////////////////////////////////
//assign row_latch_en = (clk_cnt==(`MAT_MUL_SIZE + (a_loc+b_loc) * `BB_MAT_MUL_SIZE + 10 +  `NUM_CYCLES_IN_MAC - 1));
//Writing the line above to avoid multiplication:
//assign row_latch_en = (clk_cnt==(`MAT_MUL_SIZE + ((a_loc+b_loc) << `LOG2_MAT_MUL_SIZE) + 10 +  `NUM_CYCLES_IN_MAC - 1));

assign row_latch_en =  
                       ((clk_cnt == ((final_mat_mul_size<<2) - final_mat_mul_size - 1 +`NUM_CYCLES_IN_MAC)));
    
reg c_data_available;
reg [`AWIDTH-1:0] c_addr;
reg start_capturing_c_data;
integer counter;
reg [16*`DWIDTH-1:0] c_data_out;
reg [16*`DWIDTH-1:0] c_data_out_1;
reg [16*`DWIDTH-1:0] c_data_out_2;
reg [16*`DWIDTH-1:0] c_data_out_3;
reg [16*`DWIDTH-1:0] c_data_out_4;
reg [16*`DWIDTH-1:0] c_data_out_5;
reg [16*`DWIDTH-1:0] c_data_out_6;
reg [16*`DWIDTH-1:0] c_data_out_7;
reg [16*`DWIDTH-1:0] c_data_out_8;
reg [16*`DWIDTH-1:0] c_data_out_9;
reg [16*`DWIDTH-1:0] c_data_out_10;
reg [16*`DWIDTH-1:0] c_data_out_11;
reg [16*`DWIDTH-1:0] c_data_out_12;
reg [16*`DWIDTH-1:0] c_data_out_13;
reg [16*`DWIDTH-1:0] c_data_out_14;
reg [16*`DWIDTH-1:0] c_data_out_15;
wire condition_to_start_shifting_output;
assign condition_to_start_shifting_output = 
                          row_latch_en ;  

  
//For larger matmuls, this logic will have more entries in the case statement
always @(posedge clk) begin
  if (reset | ~start_mat_mul) begin
    start_capturing_c_data <= 1'b0;
    c_data_available <= 1'b0;
    c_addr <= address_mat_c + address_stride_c;
    c_data_out <= 0;
    counter <= 0;

    c_data_out_1 <= 0;
    c_data_out_2 <= 0;
    c_data_out_3 <= 0;
    c_data_out_4 <= 0;
    c_data_out_5 <= 0;
    c_data_out_6 <= 0;
    c_data_out_7 <= 0;
    c_data_out_8 <= 0;
    c_data_out_9 <= 0;
    c_data_out_10 <= 0;
    c_data_out_11 <= 0;
    c_data_out_12 <= 0;
    c_data_out_13 <= 0;
    c_data_out_14 <= 0;
    c_data_out_15 <= 0;
  end else if (condition_to_start_shifting_output) begin
    start_capturing_c_data <= 1'b1;
    c_data_available <= 1'b1;
    c_addr <= c_addr - address_stride_c;
    c_data_out <= {matrixC15_15, matrixC14_15, matrixC13_15, matrixC12_15, matrixC11_15, matrixC10_15, matrixC9_15, matrixC8_15, matrixC7_15, matrixC6_15, matrixC5_15, matrixC4_15, matrixC3_15, matrixC2_15, matrixC1_15, matrixC0_15};
      c_data_out_1 <= {matrixC15_14, matrixC14_14, matrixC13_14, matrixC12_14, matrixC11_14, matrixC10_14, matrixC9_14, matrixC8_14, matrixC7_14, matrixC6_14, matrixC5_14, matrixC4_14, matrixC3_14, matrixC2_14, matrixC1_14, matrixC0_14};
      c_data_out_2 <= {matrixC15_13, matrixC14_13, matrixC13_13, matrixC12_13, matrixC11_13, matrixC10_13, matrixC9_13, matrixC8_13, matrixC7_13, matrixC6_13, matrixC5_13, matrixC4_13, matrixC3_13, matrixC2_13, matrixC1_13, matrixC0_13};
      c_data_out_3 <= {matrixC15_12, matrixC14_12, matrixC13_12, matrixC12_12, matrixC11_12, matrixC10_12, matrixC9_12, matrixC8_12, matrixC7_12, matrixC6_12, matrixC5_12, matrixC4_12, matrixC3_12, matrixC2_12, matrixC1_12, matrixC0_12};
      c_data_out_4 <= {matrixC15_11, matrixC14_11, matrixC13_11, matrixC12_11, matrixC11_11, matrixC10_11, matrixC9_11, matrixC8_11, matrixC7_11, matrixC6_11, matrixC5_11, matrixC4_11, matrixC3_11, matrixC2_11, matrixC1_11, matrixC0_11};
      c_data_out_5 <= {matrixC15_10, matrixC14_10, matrixC13_10, matrixC12_10, matrixC11_10, matrixC10_10, matrixC9_10, matrixC8_10, matrixC7_10, matrixC6_10, matrixC5_10, matrixC4_10, matrixC3_10, matrixC2_10, matrixC1_10, matrixC0_10};
      c_data_out_6 <= {matrixC15_9, matrixC14_9, matrixC13_9, matrixC12_9, matrixC11_9, matrixC10_9, matrixC9_9, matrixC8_9, matrixC7_9, matrixC6_9, matrixC5_9, matrixC4_9, matrixC3_9, matrixC2_9, matrixC1_9, matrixC0_9};
      c_data_out_7 <= {matrixC15_8, matrixC14_8, matrixC13_8, matrixC12_8, matrixC11_8, matrixC10_8, matrixC9_8, matrixC8_8, matrixC7_8, matrixC6_8, matrixC5_8, matrixC4_8, matrixC3_8, matrixC2_8, matrixC1_8, matrixC0_8};
      c_data_out_8 <= {matrixC15_7, matrixC14_7, matrixC13_7, matrixC12_7, matrixC11_7, matrixC10_7, matrixC9_7, matrixC8_7, matrixC7_7, matrixC6_7, matrixC5_7, matrixC4_7, matrixC3_7, matrixC2_7, matrixC1_7, matrixC0_7};
      c_data_out_9 <= {matrixC15_6, matrixC14_6, matrixC13_6, matrixC12_6, matrixC11_6, matrixC10_6, matrixC9_6, matrixC8_6, matrixC7_6, matrixC6_6, matrixC5_6, matrixC4_6, matrixC3_6, matrixC2_6, matrixC1_6, matrixC0_6};
      c_data_out_10 <= {matrixC15_5, matrixC14_5, matrixC13_5, matrixC12_5, matrixC11_5, matrixC10_5, matrixC9_5, matrixC8_5, matrixC7_5, matrixC6_5, matrixC5_5, matrixC4_5, matrixC3_5, matrixC2_5, matrixC1_5, matrixC0_5};
      c_data_out_11 <= {matrixC15_4, matrixC14_4, matrixC13_4, matrixC12_4, matrixC11_4, matrixC10_4, matrixC9_4, matrixC8_4, matrixC7_4, matrixC6_4, matrixC5_4, matrixC4_4, matrixC3_4, matrixC2_4, matrixC1_4, matrixC0_4};
      c_data_out_12 <= {matrixC15_3, matrixC14_3, matrixC13_3, matrixC12_3, matrixC11_3, matrixC10_3, matrixC9_3, matrixC8_3, matrixC7_3, matrixC6_3, matrixC5_3, matrixC4_3, matrixC3_3, matrixC2_3, matrixC1_3, matrixC0_3};
      c_data_out_13 <= {matrixC15_2, matrixC14_2, matrixC13_2, matrixC12_2, matrixC11_2, matrixC10_2, matrixC9_2, matrixC8_2, matrixC7_2, matrixC6_2, matrixC5_2, matrixC4_2, matrixC3_2, matrixC2_2, matrixC1_2, matrixC0_2};
      c_data_out_14 <= {matrixC15_1, matrixC14_1, matrixC13_1, matrixC12_1, matrixC11_1, matrixC10_1, matrixC9_1, matrixC8_1, matrixC7_1, matrixC6_1, matrixC5_1, matrixC4_1, matrixC3_1, matrixC2_1, matrixC1_1, matrixC0_1};
      c_data_out_15 <= {matrixC15_0, matrixC14_0, matrixC13_0, matrixC12_0, matrixC11_0, matrixC10_0, matrixC9_0, matrixC8_0, matrixC7_0, matrixC6_0, matrixC5_0, matrixC4_0, matrixC3_0, matrixC2_0, matrixC1_0, matrixC0_0};

    counter <= counter + 1;
  end else if (done_mat_mul) begin
    start_capturing_c_data <= 1'b0;
    c_data_available <= 1'b0;
    c_addr <= address_mat_c + address_stride_c;
    c_data_out <= 0;

    c_data_out_1 <= 0;
    c_data_out_2 <= 0;
    c_data_out_3 <= 0;
    c_data_out_4 <= 0;
    c_data_out_5 <= 0;
    c_data_out_6 <= 0;
    c_data_out_7 <= 0;
    c_data_out_8 <= 0;
    c_data_out_9 <= 0;
    c_data_out_10 <= 0;
    c_data_out_11 <= 0;
    c_data_out_12 <= 0;
    c_data_out_13 <= 0;
    c_data_out_14 <= 0;
    c_data_out_15 <= 0;
  end 
  else if (counter >= `MAT_MUL_SIZE) begin
    c_data_out <= c_data_out_1;
    c_addr <= c_addr - address_stride_c; 

    c_data_out_1 <= c_data_out_2;
    c_data_out_2 <= c_data_out_3;
    c_data_out_3 <= c_data_out_4;
    c_data_out_4 <= c_data_out_5;
    c_data_out_5 <= c_data_out_6;
    c_data_out_6 <= c_data_out_7;
    c_data_out_7 <= c_data_out_8;
    c_data_out_8 <= c_data_out_9;
    c_data_out_9 <= c_data_out_10;
    c_data_out_10 <= c_data_out_11;
    c_data_out_11 <= c_data_out_12;
    c_data_out_12 <= c_data_out_13;
    c_data_out_13 <= c_data_out_14;
    c_data_out_14 <= c_data_out_15;
    c_data_out_15 <= c_data_in;
  end
  else if (start_capturing_c_data) begin
    c_data_available <= 1'b1;
    c_addr <= c_addr - address_stride_c; 
    counter <= counter + 1;
    c_data_out <= c_data_out_1;

    c_data_out_1 <= c_data_out_2;
    c_data_out_2 <= c_data_out_3;
    c_data_out_3 <= c_data_out_4;
    c_data_out_4 <= c_data_out_5;
    c_data_out_5 <= c_data_out_6;
    c_data_out_6 <= c_data_out_7;
    c_data_out_7 <= c_data_out_8;
    c_data_out_8 <= c_data_out_9;
    c_data_out_9 <= c_data_out_10;
    c_data_out_10 <= c_data_out_11;
    c_data_out_11 <= c_data_out_12;
    c_data_out_12 <= c_data_out_13;
    c_data_out_13 <= c_data_out_14;
    c_data_out_14 <= c_data_out_15;
    c_data_out_15 <= c_data_in;
  end
end

endmodule
