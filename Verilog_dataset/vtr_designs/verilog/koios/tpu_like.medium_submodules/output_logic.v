`define DWIDTH 8
`define DESIGN_SIZE 32
`define LOG2_DESIGN_SIZE 5
`define MAT_MUL_SIZE 32
`define MASK_WIDTH 32
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
`define final_mat_mul_size 32
`define SIMULATION
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
matrixC0_16,
matrixC0_17,
matrixC0_18,
matrixC0_19,
matrixC0_20,
matrixC0_21,
matrixC0_22,
matrixC0_23,
matrixC0_24,
matrixC0_25,
matrixC0_26,
matrixC0_27,
matrixC0_28,
matrixC0_29,
matrixC0_30,
matrixC0_31,
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
matrixC1_16,
matrixC1_17,
matrixC1_18,
matrixC1_19,
matrixC1_20,
matrixC1_21,
matrixC1_22,
matrixC1_23,
matrixC1_24,
matrixC1_25,
matrixC1_26,
matrixC1_27,
matrixC1_28,
matrixC1_29,
matrixC1_30,
matrixC1_31,
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
matrixC2_16,
matrixC2_17,
matrixC2_18,
matrixC2_19,
matrixC2_20,
matrixC2_21,
matrixC2_22,
matrixC2_23,
matrixC2_24,
matrixC2_25,
matrixC2_26,
matrixC2_27,
matrixC2_28,
matrixC2_29,
matrixC2_30,
matrixC2_31,
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
matrixC3_16,
matrixC3_17,
matrixC3_18,
matrixC3_19,
matrixC3_20,
matrixC3_21,
matrixC3_22,
matrixC3_23,
matrixC3_24,
matrixC3_25,
matrixC3_26,
matrixC3_27,
matrixC3_28,
matrixC3_29,
matrixC3_30,
matrixC3_31,
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
matrixC4_16,
matrixC4_17,
matrixC4_18,
matrixC4_19,
matrixC4_20,
matrixC4_21,
matrixC4_22,
matrixC4_23,
matrixC4_24,
matrixC4_25,
matrixC4_26,
matrixC4_27,
matrixC4_28,
matrixC4_29,
matrixC4_30,
matrixC4_31,
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
matrixC5_16,
matrixC5_17,
matrixC5_18,
matrixC5_19,
matrixC5_20,
matrixC5_21,
matrixC5_22,
matrixC5_23,
matrixC5_24,
matrixC5_25,
matrixC5_26,
matrixC5_27,
matrixC5_28,
matrixC5_29,
matrixC5_30,
matrixC5_31,
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
matrixC6_16,
matrixC6_17,
matrixC6_18,
matrixC6_19,
matrixC6_20,
matrixC6_21,
matrixC6_22,
matrixC6_23,
matrixC6_24,
matrixC6_25,
matrixC6_26,
matrixC6_27,
matrixC6_28,
matrixC6_29,
matrixC6_30,
matrixC6_31,
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
matrixC7_16,
matrixC7_17,
matrixC7_18,
matrixC7_19,
matrixC7_20,
matrixC7_21,
matrixC7_22,
matrixC7_23,
matrixC7_24,
matrixC7_25,
matrixC7_26,
matrixC7_27,
matrixC7_28,
matrixC7_29,
matrixC7_30,
matrixC7_31,
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
matrixC8_16,
matrixC8_17,
matrixC8_18,
matrixC8_19,
matrixC8_20,
matrixC8_21,
matrixC8_22,
matrixC8_23,
matrixC8_24,
matrixC8_25,
matrixC8_26,
matrixC8_27,
matrixC8_28,
matrixC8_29,
matrixC8_30,
matrixC8_31,
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
matrixC9_16,
matrixC9_17,
matrixC9_18,
matrixC9_19,
matrixC9_20,
matrixC9_21,
matrixC9_22,
matrixC9_23,
matrixC9_24,
matrixC9_25,
matrixC9_26,
matrixC9_27,
matrixC9_28,
matrixC9_29,
matrixC9_30,
matrixC9_31,
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
matrixC10_16,
matrixC10_17,
matrixC10_18,
matrixC10_19,
matrixC10_20,
matrixC10_21,
matrixC10_22,
matrixC10_23,
matrixC10_24,
matrixC10_25,
matrixC10_26,
matrixC10_27,
matrixC10_28,
matrixC10_29,
matrixC10_30,
matrixC10_31,
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
matrixC11_16,
matrixC11_17,
matrixC11_18,
matrixC11_19,
matrixC11_20,
matrixC11_21,
matrixC11_22,
matrixC11_23,
matrixC11_24,
matrixC11_25,
matrixC11_26,
matrixC11_27,
matrixC11_28,
matrixC11_29,
matrixC11_30,
matrixC11_31,
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
matrixC12_16,
matrixC12_17,
matrixC12_18,
matrixC12_19,
matrixC12_20,
matrixC12_21,
matrixC12_22,
matrixC12_23,
matrixC12_24,
matrixC12_25,
matrixC12_26,
matrixC12_27,
matrixC12_28,
matrixC12_29,
matrixC12_30,
matrixC12_31,
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
matrixC13_16,
matrixC13_17,
matrixC13_18,
matrixC13_19,
matrixC13_20,
matrixC13_21,
matrixC13_22,
matrixC13_23,
matrixC13_24,
matrixC13_25,
matrixC13_26,
matrixC13_27,
matrixC13_28,
matrixC13_29,
matrixC13_30,
matrixC13_31,
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
matrixC14_16,
matrixC14_17,
matrixC14_18,
matrixC14_19,
matrixC14_20,
matrixC14_21,
matrixC14_22,
matrixC14_23,
matrixC14_24,
matrixC14_25,
matrixC14_26,
matrixC14_27,
matrixC14_28,
matrixC14_29,
matrixC14_30,
matrixC14_31,
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
matrixC15_16,
matrixC15_17,
matrixC15_18,
matrixC15_19,
matrixC15_20,
matrixC15_21,
matrixC15_22,
matrixC15_23,
matrixC15_24,
matrixC15_25,
matrixC15_26,
matrixC15_27,
matrixC15_28,
matrixC15_29,
matrixC15_30,
matrixC15_31,
matrixC16_0,
matrixC16_1,
matrixC16_2,
matrixC16_3,
matrixC16_4,
matrixC16_5,
matrixC16_6,
matrixC16_7,
matrixC16_8,
matrixC16_9,
matrixC16_10,
matrixC16_11,
matrixC16_12,
matrixC16_13,
matrixC16_14,
matrixC16_15,
matrixC16_16,
matrixC16_17,
matrixC16_18,
matrixC16_19,
matrixC16_20,
matrixC16_21,
matrixC16_22,
matrixC16_23,
matrixC16_24,
matrixC16_25,
matrixC16_26,
matrixC16_27,
matrixC16_28,
matrixC16_29,
matrixC16_30,
matrixC16_31,
matrixC17_0,
matrixC17_1,
matrixC17_2,
matrixC17_3,
matrixC17_4,
matrixC17_5,
matrixC17_6,
matrixC17_7,
matrixC17_8,
matrixC17_9,
matrixC17_10,
matrixC17_11,
matrixC17_12,
matrixC17_13,
matrixC17_14,
matrixC17_15,
matrixC17_16,
matrixC17_17,
matrixC17_18,
matrixC17_19,
matrixC17_20,
matrixC17_21,
matrixC17_22,
matrixC17_23,
matrixC17_24,
matrixC17_25,
matrixC17_26,
matrixC17_27,
matrixC17_28,
matrixC17_29,
matrixC17_30,
matrixC17_31,
matrixC18_0,
matrixC18_1,
matrixC18_2,
matrixC18_3,
matrixC18_4,
matrixC18_5,
matrixC18_6,
matrixC18_7,
matrixC18_8,
matrixC18_9,
matrixC18_10,
matrixC18_11,
matrixC18_12,
matrixC18_13,
matrixC18_14,
matrixC18_15,
matrixC18_16,
matrixC18_17,
matrixC18_18,
matrixC18_19,
matrixC18_20,
matrixC18_21,
matrixC18_22,
matrixC18_23,
matrixC18_24,
matrixC18_25,
matrixC18_26,
matrixC18_27,
matrixC18_28,
matrixC18_29,
matrixC18_30,
matrixC18_31,
matrixC19_0,
matrixC19_1,
matrixC19_2,
matrixC19_3,
matrixC19_4,
matrixC19_5,
matrixC19_6,
matrixC19_7,
matrixC19_8,
matrixC19_9,
matrixC19_10,
matrixC19_11,
matrixC19_12,
matrixC19_13,
matrixC19_14,
matrixC19_15,
matrixC19_16,
matrixC19_17,
matrixC19_18,
matrixC19_19,
matrixC19_20,
matrixC19_21,
matrixC19_22,
matrixC19_23,
matrixC19_24,
matrixC19_25,
matrixC19_26,
matrixC19_27,
matrixC19_28,
matrixC19_29,
matrixC19_30,
matrixC19_31,
matrixC20_0,
matrixC20_1,
matrixC20_2,
matrixC20_3,
matrixC20_4,
matrixC20_5,
matrixC20_6,
matrixC20_7,
matrixC20_8,
matrixC20_9,
matrixC20_10,
matrixC20_11,
matrixC20_12,
matrixC20_13,
matrixC20_14,
matrixC20_15,
matrixC20_16,
matrixC20_17,
matrixC20_18,
matrixC20_19,
matrixC20_20,
matrixC20_21,
matrixC20_22,
matrixC20_23,
matrixC20_24,
matrixC20_25,
matrixC20_26,
matrixC20_27,
matrixC20_28,
matrixC20_29,
matrixC20_30,
matrixC20_31,
matrixC21_0,
matrixC21_1,
matrixC21_2,
matrixC21_3,
matrixC21_4,
matrixC21_5,
matrixC21_6,
matrixC21_7,
matrixC21_8,
matrixC21_9,
matrixC21_10,
matrixC21_11,
matrixC21_12,
matrixC21_13,
matrixC21_14,
matrixC21_15,
matrixC21_16,
matrixC21_17,
matrixC21_18,
matrixC21_19,
matrixC21_20,
matrixC21_21,
matrixC21_22,
matrixC21_23,
matrixC21_24,
matrixC21_25,
matrixC21_26,
matrixC21_27,
matrixC21_28,
matrixC21_29,
matrixC21_30,
matrixC21_31,
matrixC22_0,
matrixC22_1,
matrixC22_2,
matrixC22_3,
matrixC22_4,
matrixC22_5,
matrixC22_6,
matrixC22_7,
matrixC22_8,
matrixC22_9,
matrixC22_10,
matrixC22_11,
matrixC22_12,
matrixC22_13,
matrixC22_14,
matrixC22_15,
matrixC22_16,
matrixC22_17,
matrixC22_18,
matrixC22_19,
matrixC22_20,
matrixC22_21,
matrixC22_22,
matrixC22_23,
matrixC22_24,
matrixC22_25,
matrixC22_26,
matrixC22_27,
matrixC22_28,
matrixC22_29,
matrixC22_30,
matrixC22_31,
matrixC23_0,
matrixC23_1,
matrixC23_2,
matrixC23_3,
matrixC23_4,
matrixC23_5,
matrixC23_6,
matrixC23_7,
matrixC23_8,
matrixC23_9,
matrixC23_10,
matrixC23_11,
matrixC23_12,
matrixC23_13,
matrixC23_14,
matrixC23_15,
matrixC23_16,
matrixC23_17,
matrixC23_18,
matrixC23_19,
matrixC23_20,
matrixC23_21,
matrixC23_22,
matrixC23_23,
matrixC23_24,
matrixC23_25,
matrixC23_26,
matrixC23_27,
matrixC23_28,
matrixC23_29,
matrixC23_30,
matrixC23_31,
matrixC24_0,
matrixC24_1,
matrixC24_2,
matrixC24_3,
matrixC24_4,
matrixC24_5,
matrixC24_6,
matrixC24_7,
matrixC24_8,
matrixC24_9,
matrixC24_10,
matrixC24_11,
matrixC24_12,
matrixC24_13,
matrixC24_14,
matrixC24_15,
matrixC24_16,
matrixC24_17,
matrixC24_18,
matrixC24_19,
matrixC24_20,
matrixC24_21,
matrixC24_22,
matrixC24_23,
matrixC24_24,
matrixC24_25,
matrixC24_26,
matrixC24_27,
matrixC24_28,
matrixC24_29,
matrixC24_30,
matrixC24_31,
matrixC25_0,
matrixC25_1,
matrixC25_2,
matrixC25_3,
matrixC25_4,
matrixC25_5,
matrixC25_6,
matrixC25_7,
matrixC25_8,
matrixC25_9,
matrixC25_10,
matrixC25_11,
matrixC25_12,
matrixC25_13,
matrixC25_14,
matrixC25_15,
matrixC25_16,
matrixC25_17,
matrixC25_18,
matrixC25_19,
matrixC25_20,
matrixC25_21,
matrixC25_22,
matrixC25_23,
matrixC25_24,
matrixC25_25,
matrixC25_26,
matrixC25_27,
matrixC25_28,
matrixC25_29,
matrixC25_30,
matrixC25_31,
matrixC26_0,
matrixC26_1,
matrixC26_2,
matrixC26_3,
matrixC26_4,
matrixC26_5,
matrixC26_6,
matrixC26_7,
matrixC26_8,
matrixC26_9,
matrixC26_10,
matrixC26_11,
matrixC26_12,
matrixC26_13,
matrixC26_14,
matrixC26_15,
matrixC26_16,
matrixC26_17,
matrixC26_18,
matrixC26_19,
matrixC26_20,
matrixC26_21,
matrixC26_22,
matrixC26_23,
matrixC26_24,
matrixC26_25,
matrixC26_26,
matrixC26_27,
matrixC26_28,
matrixC26_29,
matrixC26_30,
matrixC26_31,
matrixC27_0,
matrixC27_1,
matrixC27_2,
matrixC27_3,
matrixC27_4,
matrixC27_5,
matrixC27_6,
matrixC27_7,
matrixC27_8,
matrixC27_9,
matrixC27_10,
matrixC27_11,
matrixC27_12,
matrixC27_13,
matrixC27_14,
matrixC27_15,
matrixC27_16,
matrixC27_17,
matrixC27_18,
matrixC27_19,
matrixC27_20,
matrixC27_21,
matrixC27_22,
matrixC27_23,
matrixC27_24,
matrixC27_25,
matrixC27_26,
matrixC27_27,
matrixC27_28,
matrixC27_29,
matrixC27_30,
matrixC27_31,
matrixC28_0,
matrixC28_1,
matrixC28_2,
matrixC28_3,
matrixC28_4,
matrixC28_5,
matrixC28_6,
matrixC28_7,
matrixC28_8,
matrixC28_9,
matrixC28_10,
matrixC28_11,
matrixC28_12,
matrixC28_13,
matrixC28_14,
matrixC28_15,
matrixC28_16,
matrixC28_17,
matrixC28_18,
matrixC28_19,
matrixC28_20,
matrixC28_21,
matrixC28_22,
matrixC28_23,
matrixC28_24,
matrixC28_25,
matrixC28_26,
matrixC28_27,
matrixC28_28,
matrixC28_29,
matrixC28_30,
matrixC28_31,
matrixC29_0,
matrixC29_1,
matrixC29_2,
matrixC29_3,
matrixC29_4,
matrixC29_5,
matrixC29_6,
matrixC29_7,
matrixC29_8,
matrixC29_9,
matrixC29_10,
matrixC29_11,
matrixC29_12,
matrixC29_13,
matrixC29_14,
matrixC29_15,
matrixC29_16,
matrixC29_17,
matrixC29_18,
matrixC29_19,
matrixC29_20,
matrixC29_21,
matrixC29_22,
matrixC29_23,
matrixC29_24,
matrixC29_25,
matrixC29_26,
matrixC29_27,
matrixC29_28,
matrixC29_29,
matrixC29_30,
matrixC29_31,
matrixC30_0,
matrixC30_1,
matrixC30_2,
matrixC30_3,
matrixC30_4,
matrixC30_5,
matrixC30_6,
matrixC30_7,
matrixC30_8,
matrixC30_9,
matrixC30_10,
matrixC30_11,
matrixC30_12,
matrixC30_13,
matrixC30_14,
matrixC30_15,
matrixC30_16,
matrixC30_17,
matrixC30_18,
matrixC30_19,
matrixC30_20,
matrixC30_21,
matrixC30_22,
matrixC30_23,
matrixC30_24,
matrixC30_25,
matrixC30_26,
matrixC30_27,
matrixC30_28,
matrixC30_29,
matrixC30_30,
matrixC30_31,
matrixC31_0,
matrixC31_1,
matrixC31_2,
matrixC31_3,
matrixC31_4,
matrixC31_5,
matrixC31_6,
matrixC31_7,
matrixC31_8,
matrixC31_9,
matrixC31_10,
matrixC31_11,
matrixC31_12,
matrixC31_13,
matrixC31_14,
matrixC31_15,
matrixC31_16,
matrixC31_17,
matrixC31_18,
matrixC31_19,
matrixC31_20,
matrixC31_21,
matrixC31_22,
matrixC31_23,
matrixC31_24,
matrixC31_25,
matrixC31_26,
matrixC31_27,
matrixC31_28,
matrixC31_29,
matrixC31_30,
matrixC31_31,

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
input [`DWIDTH-1:0] matrixC0_16;
input [`DWIDTH-1:0] matrixC0_17;
input [`DWIDTH-1:0] matrixC0_18;
input [`DWIDTH-1:0] matrixC0_19;
input [`DWIDTH-1:0] matrixC0_20;
input [`DWIDTH-1:0] matrixC0_21;
input [`DWIDTH-1:0] matrixC0_22;
input [`DWIDTH-1:0] matrixC0_23;
input [`DWIDTH-1:0] matrixC0_24;
input [`DWIDTH-1:0] matrixC0_25;
input [`DWIDTH-1:0] matrixC0_26;
input [`DWIDTH-1:0] matrixC0_27;
input [`DWIDTH-1:0] matrixC0_28;
input [`DWIDTH-1:0] matrixC0_29;
input [`DWIDTH-1:0] matrixC0_30;
input [`DWIDTH-1:0] matrixC0_31;
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
input [`DWIDTH-1:0] matrixC1_16;
input [`DWIDTH-1:0] matrixC1_17;
input [`DWIDTH-1:0] matrixC1_18;
input [`DWIDTH-1:0] matrixC1_19;
input [`DWIDTH-1:0] matrixC1_20;
input [`DWIDTH-1:0] matrixC1_21;
input [`DWIDTH-1:0] matrixC1_22;
input [`DWIDTH-1:0] matrixC1_23;
input [`DWIDTH-1:0] matrixC1_24;
input [`DWIDTH-1:0] matrixC1_25;
input [`DWIDTH-1:0] matrixC1_26;
input [`DWIDTH-1:0] matrixC1_27;
input [`DWIDTH-1:0] matrixC1_28;
input [`DWIDTH-1:0] matrixC1_29;
input [`DWIDTH-1:0] matrixC1_30;
input [`DWIDTH-1:0] matrixC1_31;
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
input [`DWIDTH-1:0] matrixC2_16;
input [`DWIDTH-1:0] matrixC2_17;
input [`DWIDTH-1:0] matrixC2_18;
input [`DWIDTH-1:0] matrixC2_19;
input [`DWIDTH-1:0] matrixC2_20;
input [`DWIDTH-1:0] matrixC2_21;
input [`DWIDTH-1:0] matrixC2_22;
input [`DWIDTH-1:0] matrixC2_23;
input [`DWIDTH-1:0] matrixC2_24;
input [`DWIDTH-1:0] matrixC2_25;
input [`DWIDTH-1:0] matrixC2_26;
input [`DWIDTH-1:0] matrixC2_27;
input [`DWIDTH-1:0] matrixC2_28;
input [`DWIDTH-1:0] matrixC2_29;
input [`DWIDTH-1:0] matrixC2_30;
input [`DWIDTH-1:0] matrixC2_31;
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
input [`DWIDTH-1:0] matrixC3_16;
input [`DWIDTH-1:0] matrixC3_17;
input [`DWIDTH-1:0] matrixC3_18;
input [`DWIDTH-1:0] matrixC3_19;
input [`DWIDTH-1:0] matrixC3_20;
input [`DWIDTH-1:0] matrixC3_21;
input [`DWIDTH-1:0] matrixC3_22;
input [`DWIDTH-1:0] matrixC3_23;
input [`DWIDTH-1:0] matrixC3_24;
input [`DWIDTH-1:0] matrixC3_25;
input [`DWIDTH-1:0] matrixC3_26;
input [`DWIDTH-1:0] matrixC3_27;
input [`DWIDTH-1:0] matrixC3_28;
input [`DWIDTH-1:0] matrixC3_29;
input [`DWIDTH-1:0] matrixC3_30;
input [`DWIDTH-1:0] matrixC3_31;
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
input [`DWIDTH-1:0] matrixC4_16;
input [`DWIDTH-1:0] matrixC4_17;
input [`DWIDTH-1:0] matrixC4_18;
input [`DWIDTH-1:0] matrixC4_19;
input [`DWIDTH-1:0] matrixC4_20;
input [`DWIDTH-1:0] matrixC4_21;
input [`DWIDTH-1:0] matrixC4_22;
input [`DWIDTH-1:0] matrixC4_23;
input [`DWIDTH-1:0] matrixC4_24;
input [`DWIDTH-1:0] matrixC4_25;
input [`DWIDTH-1:0] matrixC4_26;
input [`DWIDTH-1:0] matrixC4_27;
input [`DWIDTH-1:0] matrixC4_28;
input [`DWIDTH-1:0] matrixC4_29;
input [`DWIDTH-1:0] matrixC4_30;
input [`DWIDTH-1:0] matrixC4_31;
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
input [`DWIDTH-1:0] matrixC5_16;
input [`DWIDTH-1:0] matrixC5_17;
input [`DWIDTH-1:0] matrixC5_18;
input [`DWIDTH-1:0] matrixC5_19;
input [`DWIDTH-1:0] matrixC5_20;
input [`DWIDTH-1:0] matrixC5_21;
input [`DWIDTH-1:0] matrixC5_22;
input [`DWIDTH-1:0] matrixC5_23;
input [`DWIDTH-1:0] matrixC5_24;
input [`DWIDTH-1:0] matrixC5_25;
input [`DWIDTH-1:0] matrixC5_26;
input [`DWIDTH-1:0] matrixC5_27;
input [`DWIDTH-1:0] matrixC5_28;
input [`DWIDTH-1:0] matrixC5_29;
input [`DWIDTH-1:0] matrixC5_30;
input [`DWIDTH-1:0] matrixC5_31;
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
input [`DWIDTH-1:0] matrixC6_16;
input [`DWIDTH-1:0] matrixC6_17;
input [`DWIDTH-1:0] matrixC6_18;
input [`DWIDTH-1:0] matrixC6_19;
input [`DWIDTH-1:0] matrixC6_20;
input [`DWIDTH-1:0] matrixC6_21;
input [`DWIDTH-1:0] matrixC6_22;
input [`DWIDTH-1:0] matrixC6_23;
input [`DWIDTH-1:0] matrixC6_24;
input [`DWIDTH-1:0] matrixC6_25;
input [`DWIDTH-1:0] matrixC6_26;
input [`DWIDTH-1:0] matrixC6_27;
input [`DWIDTH-1:0] matrixC6_28;
input [`DWIDTH-1:0] matrixC6_29;
input [`DWIDTH-1:0] matrixC6_30;
input [`DWIDTH-1:0] matrixC6_31;
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
input [`DWIDTH-1:0] matrixC7_16;
input [`DWIDTH-1:0] matrixC7_17;
input [`DWIDTH-1:0] matrixC7_18;
input [`DWIDTH-1:0] matrixC7_19;
input [`DWIDTH-1:0] matrixC7_20;
input [`DWIDTH-1:0] matrixC7_21;
input [`DWIDTH-1:0] matrixC7_22;
input [`DWIDTH-1:0] matrixC7_23;
input [`DWIDTH-1:0] matrixC7_24;
input [`DWIDTH-1:0] matrixC7_25;
input [`DWIDTH-1:0] matrixC7_26;
input [`DWIDTH-1:0] matrixC7_27;
input [`DWIDTH-1:0] matrixC7_28;
input [`DWIDTH-1:0] matrixC7_29;
input [`DWIDTH-1:0] matrixC7_30;
input [`DWIDTH-1:0] matrixC7_31;
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
input [`DWIDTH-1:0] matrixC8_16;
input [`DWIDTH-1:0] matrixC8_17;
input [`DWIDTH-1:0] matrixC8_18;
input [`DWIDTH-1:0] matrixC8_19;
input [`DWIDTH-1:0] matrixC8_20;
input [`DWIDTH-1:0] matrixC8_21;
input [`DWIDTH-1:0] matrixC8_22;
input [`DWIDTH-1:0] matrixC8_23;
input [`DWIDTH-1:0] matrixC8_24;
input [`DWIDTH-1:0] matrixC8_25;
input [`DWIDTH-1:0] matrixC8_26;
input [`DWIDTH-1:0] matrixC8_27;
input [`DWIDTH-1:0] matrixC8_28;
input [`DWIDTH-1:0] matrixC8_29;
input [`DWIDTH-1:0] matrixC8_30;
input [`DWIDTH-1:0] matrixC8_31;
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
input [`DWIDTH-1:0] matrixC9_16;
input [`DWIDTH-1:0] matrixC9_17;
input [`DWIDTH-1:0] matrixC9_18;
input [`DWIDTH-1:0] matrixC9_19;
input [`DWIDTH-1:0] matrixC9_20;
input [`DWIDTH-1:0] matrixC9_21;
input [`DWIDTH-1:0] matrixC9_22;
input [`DWIDTH-1:0] matrixC9_23;
input [`DWIDTH-1:0] matrixC9_24;
input [`DWIDTH-1:0] matrixC9_25;
input [`DWIDTH-1:0] matrixC9_26;
input [`DWIDTH-1:0] matrixC9_27;
input [`DWIDTH-1:0] matrixC9_28;
input [`DWIDTH-1:0] matrixC9_29;
input [`DWIDTH-1:0] matrixC9_30;
input [`DWIDTH-1:0] matrixC9_31;
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
input [`DWIDTH-1:0] matrixC10_16;
input [`DWIDTH-1:0] matrixC10_17;
input [`DWIDTH-1:0] matrixC10_18;
input [`DWIDTH-1:0] matrixC10_19;
input [`DWIDTH-1:0] matrixC10_20;
input [`DWIDTH-1:0] matrixC10_21;
input [`DWIDTH-1:0] matrixC10_22;
input [`DWIDTH-1:0] matrixC10_23;
input [`DWIDTH-1:0] matrixC10_24;
input [`DWIDTH-1:0] matrixC10_25;
input [`DWIDTH-1:0] matrixC10_26;
input [`DWIDTH-1:0] matrixC10_27;
input [`DWIDTH-1:0] matrixC10_28;
input [`DWIDTH-1:0] matrixC10_29;
input [`DWIDTH-1:0] matrixC10_30;
input [`DWIDTH-1:0] matrixC10_31;
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
input [`DWIDTH-1:0] matrixC11_16;
input [`DWIDTH-1:0] matrixC11_17;
input [`DWIDTH-1:0] matrixC11_18;
input [`DWIDTH-1:0] matrixC11_19;
input [`DWIDTH-1:0] matrixC11_20;
input [`DWIDTH-1:0] matrixC11_21;
input [`DWIDTH-1:0] matrixC11_22;
input [`DWIDTH-1:0] matrixC11_23;
input [`DWIDTH-1:0] matrixC11_24;
input [`DWIDTH-1:0] matrixC11_25;
input [`DWIDTH-1:0] matrixC11_26;
input [`DWIDTH-1:0] matrixC11_27;
input [`DWIDTH-1:0] matrixC11_28;
input [`DWIDTH-1:0] matrixC11_29;
input [`DWIDTH-1:0] matrixC11_30;
input [`DWIDTH-1:0] matrixC11_31;
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
input [`DWIDTH-1:0] matrixC12_16;
input [`DWIDTH-1:0] matrixC12_17;
input [`DWIDTH-1:0] matrixC12_18;
input [`DWIDTH-1:0] matrixC12_19;
input [`DWIDTH-1:0] matrixC12_20;
input [`DWIDTH-1:0] matrixC12_21;
input [`DWIDTH-1:0] matrixC12_22;
input [`DWIDTH-1:0] matrixC12_23;
input [`DWIDTH-1:0] matrixC12_24;
input [`DWIDTH-1:0] matrixC12_25;
input [`DWIDTH-1:0] matrixC12_26;
input [`DWIDTH-1:0] matrixC12_27;
input [`DWIDTH-1:0] matrixC12_28;
input [`DWIDTH-1:0] matrixC12_29;
input [`DWIDTH-1:0] matrixC12_30;
input [`DWIDTH-1:0] matrixC12_31;
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
input [`DWIDTH-1:0] matrixC13_16;
input [`DWIDTH-1:0] matrixC13_17;
input [`DWIDTH-1:0] matrixC13_18;
input [`DWIDTH-1:0] matrixC13_19;
input [`DWIDTH-1:0] matrixC13_20;
input [`DWIDTH-1:0] matrixC13_21;
input [`DWIDTH-1:0] matrixC13_22;
input [`DWIDTH-1:0] matrixC13_23;
input [`DWIDTH-1:0] matrixC13_24;
input [`DWIDTH-1:0] matrixC13_25;
input [`DWIDTH-1:0] matrixC13_26;
input [`DWIDTH-1:0] matrixC13_27;
input [`DWIDTH-1:0] matrixC13_28;
input [`DWIDTH-1:0] matrixC13_29;
input [`DWIDTH-1:0] matrixC13_30;
input [`DWIDTH-1:0] matrixC13_31;
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
input [`DWIDTH-1:0] matrixC14_16;
input [`DWIDTH-1:0] matrixC14_17;
input [`DWIDTH-1:0] matrixC14_18;
input [`DWIDTH-1:0] matrixC14_19;
input [`DWIDTH-1:0] matrixC14_20;
input [`DWIDTH-1:0] matrixC14_21;
input [`DWIDTH-1:0] matrixC14_22;
input [`DWIDTH-1:0] matrixC14_23;
input [`DWIDTH-1:0] matrixC14_24;
input [`DWIDTH-1:0] matrixC14_25;
input [`DWIDTH-1:0] matrixC14_26;
input [`DWIDTH-1:0] matrixC14_27;
input [`DWIDTH-1:0] matrixC14_28;
input [`DWIDTH-1:0] matrixC14_29;
input [`DWIDTH-1:0] matrixC14_30;
input [`DWIDTH-1:0] matrixC14_31;
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
input [`DWIDTH-1:0] matrixC15_16;
input [`DWIDTH-1:0] matrixC15_17;
input [`DWIDTH-1:0] matrixC15_18;
input [`DWIDTH-1:0] matrixC15_19;
input [`DWIDTH-1:0] matrixC15_20;
input [`DWIDTH-1:0] matrixC15_21;
input [`DWIDTH-1:0] matrixC15_22;
input [`DWIDTH-1:0] matrixC15_23;
input [`DWIDTH-1:0] matrixC15_24;
input [`DWIDTH-1:0] matrixC15_25;
input [`DWIDTH-1:0] matrixC15_26;
input [`DWIDTH-1:0] matrixC15_27;
input [`DWIDTH-1:0] matrixC15_28;
input [`DWIDTH-1:0] matrixC15_29;
input [`DWIDTH-1:0] matrixC15_30;
input [`DWIDTH-1:0] matrixC15_31;
input [`DWIDTH-1:0] matrixC16_0;
input [`DWIDTH-1:0] matrixC16_1;
input [`DWIDTH-1:0] matrixC16_2;
input [`DWIDTH-1:0] matrixC16_3;
input [`DWIDTH-1:0] matrixC16_4;
input [`DWIDTH-1:0] matrixC16_5;
input [`DWIDTH-1:0] matrixC16_6;
input [`DWIDTH-1:0] matrixC16_7;
input [`DWIDTH-1:0] matrixC16_8;
input [`DWIDTH-1:0] matrixC16_9;
input [`DWIDTH-1:0] matrixC16_10;
input [`DWIDTH-1:0] matrixC16_11;
input [`DWIDTH-1:0] matrixC16_12;
input [`DWIDTH-1:0] matrixC16_13;
input [`DWIDTH-1:0] matrixC16_14;
input [`DWIDTH-1:0] matrixC16_15;
input [`DWIDTH-1:0] matrixC16_16;
input [`DWIDTH-1:0] matrixC16_17;
input [`DWIDTH-1:0] matrixC16_18;
input [`DWIDTH-1:0] matrixC16_19;
input [`DWIDTH-1:0] matrixC16_20;
input [`DWIDTH-1:0] matrixC16_21;
input [`DWIDTH-1:0] matrixC16_22;
input [`DWIDTH-1:0] matrixC16_23;
input [`DWIDTH-1:0] matrixC16_24;
input [`DWIDTH-1:0] matrixC16_25;
input [`DWIDTH-1:0] matrixC16_26;
input [`DWIDTH-1:0] matrixC16_27;
input [`DWIDTH-1:0] matrixC16_28;
input [`DWIDTH-1:0] matrixC16_29;
input [`DWIDTH-1:0] matrixC16_30;
input [`DWIDTH-1:0] matrixC16_31;
input [`DWIDTH-1:0] matrixC17_0;
input [`DWIDTH-1:0] matrixC17_1;
input [`DWIDTH-1:0] matrixC17_2;
input [`DWIDTH-1:0] matrixC17_3;
input [`DWIDTH-1:0] matrixC17_4;
input [`DWIDTH-1:0] matrixC17_5;
input [`DWIDTH-1:0] matrixC17_6;
input [`DWIDTH-1:0] matrixC17_7;
input [`DWIDTH-1:0] matrixC17_8;
input [`DWIDTH-1:0] matrixC17_9;
input [`DWIDTH-1:0] matrixC17_10;
input [`DWIDTH-1:0] matrixC17_11;
input [`DWIDTH-1:0] matrixC17_12;
input [`DWIDTH-1:0] matrixC17_13;
input [`DWIDTH-1:0] matrixC17_14;
input [`DWIDTH-1:0] matrixC17_15;
input [`DWIDTH-1:0] matrixC17_16;
input [`DWIDTH-1:0] matrixC17_17;
input [`DWIDTH-1:0] matrixC17_18;
input [`DWIDTH-1:0] matrixC17_19;
input [`DWIDTH-1:0] matrixC17_20;
input [`DWIDTH-1:0] matrixC17_21;
input [`DWIDTH-1:0] matrixC17_22;
input [`DWIDTH-1:0] matrixC17_23;
input [`DWIDTH-1:0] matrixC17_24;
input [`DWIDTH-1:0] matrixC17_25;
input [`DWIDTH-1:0] matrixC17_26;
input [`DWIDTH-1:0] matrixC17_27;
input [`DWIDTH-1:0] matrixC17_28;
input [`DWIDTH-1:0] matrixC17_29;
input [`DWIDTH-1:0] matrixC17_30;
input [`DWIDTH-1:0] matrixC17_31;
input [`DWIDTH-1:0] matrixC18_0;
input [`DWIDTH-1:0] matrixC18_1;
input [`DWIDTH-1:0] matrixC18_2;
input [`DWIDTH-1:0] matrixC18_3;
input [`DWIDTH-1:0] matrixC18_4;
input [`DWIDTH-1:0] matrixC18_5;
input [`DWIDTH-1:0] matrixC18_6;
input [`DWIDTH-1:0] matrixC18_7;
input [`DWIDTH-1:0] matrixC18_8;
input [`DWIDTH-1:0] matrixC18_9;
input [`DWIDTH-1:0] matrixC18_10;
input [`DWIDTH-1:0] matrixC18_11;
input [`DWIDTH-1:0] matrixC18_12;
input [`DWIDTH-1:0] matrixC18_13;
input [`DWIDTH-1:0] matrixC18_14;
input [`DWIDTH-1:0] matrixC18_15;
input [`DWIDTH-1:0] matrixC18_16;
input [`DWIDTH-1:0] matrixC18_17;
input [`DWIDTH-1:0] matrixC18_18;
input [`DWIDTH-1:0] matrixC18_19;
input [`DWIDTH-1:0] matrixC18_20;
input [`DWIDTH-1:0] matrixC18_21;
input [`DWIDTH-1:0] matrixC18_22;
input [`DWIDTH-1:0] matrixC18_23;
input [`DWIDTH-1:0] matrixC18_24;
input [`DWIDTH-1:0] matrixC18_25;
input [`DWIDTH-1:0] matrixC18_26;
input [`DWIDTH-1:0] matrixC18_27;
input [`DWIDTH-1:0] matrixC18_28;
input [`DWIDTH-1:0] matrixC18_29;
input [`DWIDTH-1:0] matrixC18_30;
input [`DWIDTH-1:0] matrixC18_31;
input [`DWIDTH-1:0] matrixC19_0;
input [`DWIDTH-1:0] matrixC19_1;
input [`DWIDTH-1:0] matrixC19_2;
input [`DWIDTH-1:0] matrixC19_3;
input [`DWIDTH-1:0] matrixC19_4;
input [`DWIDTH-1:0] matrixC19_5;
input [`DWIDTH-1:0] matrixC19_6;
input [`DWIDTH-1:0] matrixC19_7;
input [`DWIDTH-1:0] matrixC19_8;
input [`DWIDTH-1:0] matrixC19_9;
input [`DWIDTH-1:0] matrixC19_10;
input [`DWIDTH-1:0] matrixC19_11;
input [`DWIDTH-1:0] matrixC19_12;
input [`DWIDTH-1:0] matrixC19_13;
input [`DWIDTH-1:0] matrixC19_14;
input [`DWIDTH-1:0] matrixC19_15;
input [`DWIDTH-1:0] matrixC19_16;
input [`DWIDTH-1:0] matrixC19_17;
input [`DWIDTH-1:0] matrixC19_18;
input [`DWIDTH-1:0] matrixC19_19;
input [`DWIDTH-1:0] matrixC19_20;
input [`DWIDTH-1:0] matrixC19_21;
input [`DWIDTH-1:0] matrixC19_22;
input [`DWIDTH-1:0] matrixC19_23;
input [`DWIDTH-1:0] matrixC19_24;
input [`DWIDTH-1:0] matrixC19_25;
input [`DWIDTH-1:0] matrixC19_26;
input [`DWIDTH-1:0] matrixC19_27;
input [`DWIDTH-1:0] matrixC19_28;
input [`DWIDTH-1:0] matrixC19_29;
input [`DWIDTH-1:0] matrixC19_30;
input [`DWIDTH-1:0] matrixC19_31;
input [`DWIDTH-1:0] matrixC20_0;
input [`DWIDTH-1:0] matrixC20_1;
input [`DWIDTH-1:0] matrixC20_2;
input [`DWIDTH-1:0] matrixC20_3;
input [`DWIDTH-1:0] matrixC20_4;
input [`DWIDTH-1:0] matrixC20_5;
input [`DWIDTH-1:0] matrixC20_6;
input [`DWIDTH-1:0] matrixC20_7;
input [`DWIDTH-1:0] matrixC20_8;
input [`DWIDTH-1:0] matrixC20_9;
input [`DWIDTH-1:0] matrixC20_10;
input [`DWIDTH-1:0] matrixC20_11;
input [`DWIDTH-1:0] matrixC20_12;
input [`DWIDTH-1:0] matrixC20_13;
input [`DWIDTH-1:0] matrixC20_14;
input [`DWIDTH-1:0] matrixC20_15;
input [`DWIDTH-1:0] matrixC20_16;
input [`DWIDTH-1:0] matrixC20_17;
input [`DWIDTH-1:0] matrixC20_18;
input [`DWIDTH-1:0] matrixC20_19;
input [`DWIDTH-1:0] matrixC20_20;
input [`DWIDTH-1:0] matrixC20_21;
input [`DWIDTH-1:0] matrixC20_22;
input [`DWIDTH-1:0] matrixC20_23;
input [`DWIDTH-1:0] matrixC20_24;
input [`DWIDTH-1:0] matrixC20_25;
input [`DWIDTH-1:0] matrixC20_26;
input [`DWIDTH-1:0] matrixC20_27;
input [`DWIDTH-1:0] matrixC20_28;
input [`DWIDTH-1:0] matrixC20_29;
input [`DWIDTH-1:0] matrixC20_30;
input [`DWIDTH-1:0] matrixC20_31;
input [`DWIDTH-1:0] matrixC21_0;
input [`DWIDTH-1:0] matrixC21_1;
input [`DWIDTH-1:0] matrixC21_2;
input [`DWIDTH-1:0] matrixC21_3;
input [`DWIDTH-1:0] matrixC21_4;
input [`DWIDTH-1:0] matrixC21_5;
input [`DWIDTH-1:0] matrixC21_6;
input [`DWIDTH-1:0] matrixC21_7;
input [`DWIDTH-1:0] matrixC21_8;
input [`DWIDTH-1:0] matrixC21_9;
input [`DWIDTH-1:0] matrixC21_10;
input [`DWIDTH-1:0] matrixC21_11;
input [`DWIDTH-1:0] matrixC21_12;
input [`DWIDTH-1:0] matrixC21_13;
input [`DWIDTH-1:0] matrixC21_14;
input [`DWIDTH-1:0] matrixC21_15;
input [`DWIDTH-1:0] matrixC21_16;
input [`DWIDTH-1:0] matrixC21_17;
input [`DWIDTH-1:0] matrixC21_18;
input [`DWIDTH-1:0] matrixC21_19;
input [`DWIDTH-1:0] matrixC21_20;
input [`DWIDTH-1:0] matrixC21_21;
input [`DWIDTH-1:0] matrixC21_22;
input [`DWIDTH-1:0] matrixC21_23;
input [`DWIDTH-1:0] matrixC21_24;
input [`DWIDTH-1:0] matrixC21_25;
input [`DWIDTH-1:0] matrixC21_26;
input [`DWIDTH-1:0] matrixC21_27;
input [`DWIDTH-1:0] matrixC21_28;
input [`DWIDTH-1:0] matrixC21_29;
input [`DWIDTH-1:0] matrixC21_30;
input [`DWIDTH-1:0] matrixC21_31;
input [`DWIDTH-1:0] matrixC22_0;
input [`DWIDTH-1:0] matrixC22_1;
input [`DWIDTH-1:0] matrixC22_2;
input [`DWIDTH-1:0] matrixC22_3;
input [`DWIDTH-1:0] matrixC22_4;
input [`DWIDTH-1:0] matrixC22_5;
input [`DWIDTH-1:0] matrixC22_6;
input [`DWIDTH-1:0] matrixC22_7;
input [`DWIDTH-1:0] matrixC22_8;
input [`DWIDTH-1:0] matrixC22_9;
input [`DWIDTH-1:0] matrixC22_10;
input [`DWIDTH-1:0] matrixC22_11;
input [`DWIDTH-1:0] matrixC22_12;
input [`DWIDTH-1:0] matrixC22_13;
input [`DWIDTH-1:0] matrixC22_14;
input [`DWIDTH-1:0] matrixC22_15;
input [`DWIDTH-1:0] matrixC22_16;
input [`DWIDTH-1:0] matrixC22_17;
input [`DWIDTH-1:0] matrixC22_18;
input [`DWIDTH-1:0] matrixC22_19;
input [`DWIDTH-1:0] matrixC22_20;
input [`DWIDTH-1:0] matrixC22_21;
input [`DWIDTH-1:0] matrixC22_22;
input [`DWIDTH-1:0] matrixC22_23;
input [`DWIDTH-1:0] matrixC22_24;
input [`DWIDTH-1:0] matrixC22_25;
input [`DWIDTH-1:0] matrixC22_26;
input [`DWIDTH-1:0] matrixC22_27;
input [`DWIDTH-1:0] matrixC22_28;
input [`DWIDTH-1:0] matrixC22_29;
input [`DWIDTH-1:0] matrixC22_30;
input [`DWIDTH-1:0] matrixC22_31;
input [`DWIDTH-1:0] matrixC23_0;
input [`DWIDTH-1:0] matrixC23_1;
input [`DWIDTH-1:0] matrixC23_2;
input [`DWIDTH-1:0] matrixC23_3;
input [`DWIDTH-1:0] matrixC23_4;
input [`DWIDTH-1:0] matrixC23_5;
input [`DWIDTH-1:0] matrixC23_6;
input [`DWIDTH-1:0] matrixC23_7;
input [`DWIDTH-1:0] matrixC23_8;
input [`DWIDTH-1:0] matrixC23_9;
input [`DWIDTH-1:0] matrixC23_10;
input [`DWIDTH-1:0] matrixC23_11;
input [`DWIDTH-1:0] matrixC23_12;
input [`DWIDTH-1:0] matrixC23_13;
input [`DWIDTH-1:0] matrixC23_14;
input [`DWIDTH-1:0] matrixC23_15;
input [`DWIDTH-1:0] matrixC23_16;
input [`DWIDTH-1:0] matrixC23_17;
input [`DWIDTH-1:0] matrixC23_18;
input [`DWIDTH-1:0] matrixC23_19;
input [`DWIDTH-1:0] matrixC23_20;
input [`DWIDTH-1:0] matrixC23_21;
input [`DWIDTH-1:0] matrixC23_22;
input [`DWIDTH-1:0] matrixC23_23;
input [`DWIDTH-1:0] matrixC23_24;
input [`DWIDTH-1:0] matrixC23_25;
input [`DWIDTH-1:0] matrixC23_26;
input [`DWIDTH-1:0] matrixC23_27;
input [`DWIDTH-1:0] matrixC23_28;
input [`DWIDTH-1:0] matrixC23_29;
input [`DWIDTH-1:0] matrixC23_30;
input [`DWIDTH-1:0] matrixC23_31;
input [`DWIDTH-1:0] matrixC24_0;
input [`DWIDTH-1:0] matrixC24_1;
input [`DWIDTH-1:0] matrixC24_2;
input [`DWIDTH-1:0] matrixC24_3;
input [`DWIDTH-1:0] matrixC24_4;
input [`DWIDTH-1:0] matrixC24_5;
input [`DWIDTH-1:0] matrixC24_6;
input [`DWIDTH-1:0] matrixC24_7;
input [`DWIDTH-1:0] matrixC24_8;
input [`DWIDTH-1:0] matrixC24_9;
input [`DWIDTH-1:0] matrixC24_10;
input [`DWIDTH-1:0] matrixC24_11;
input [`DWIDTH-1:0] matrixC24_12;
input [`DWIDTH-1:0] matrixC24_13;
input [`DWIDTH-1:0] matrixC24_14;
input [`DWIDTH-1:0] matrixC24_15;
input [`DWIDTH-1:0] matrixC24_16;
input [`DWIDTH-1:0] matrixC24_17;
input [`DWIDTH-1:0] matrixC24_18;
input [`DWIDTH-1:0] matrixC24_19;
input [`DWIDTH-1:0] matrixC24_20;
input [`DWIDTH-1:0] matrixC24_21;
input [`DWIDTH-1:0] matrixC24_22;
input [`DWIDTH-1:0] matrixC24_23;
input [`DWIDTH-1:0] matrixC24_24;
input [`DWIDTH-1:0] matrixC24_25;
input [`DWIDTH-1:0] matrixC24_26;
input [`DWIDTH-1:0] matrixC24_27;
input [`DWIDTH-1:0] matrixC24_28;
input [`DWIDTH-1:0] matrixC24_29;
input [`DWIDTH-1:0] matrixC24_30;
input [`DWIDTH-1:0] matrixC24_31;
input [`DWIDTH-1:0] matrixC25_0;
input [`DWIDTH-1:0] matrixC25_1;
input [`DWIDTH-1:0] matrixC25_2;
input [`DWIDTH-1:0] matrixC25_3;
input [`DWIDTH-1:0] matrixC25_4;
input [`DWIDTH-1:0] matrixC25_5;
input [`DWIDTH-1:0] matrixC25_6;
input [`DWIDTH-1:0] matrixC25_7;
input [`DWIDTH-1:0] matrixC25_8;
input [`DWIDTH-1:0] matrixC25_9;
input [`DWIDTH-1:0] matrixC25_10;
input [`DWIDTH-1:0] matrixC25_11;
input [`DWIDTH-1:0] matrixC25_12;
input [`DWIDTH-1:0] matrixC25_13;
input [`DWIDTH-1:0] matrixC25_14;
input [`DWIDTH-1:0] matrixC25_15;
input [`DWIDTH-1:0] matrixC25_16;
input [`DWIDTH-1:0] matrixC25_17;
input [`DWIDTH-1:0] matrixC25_18;
input [`DWIDTH-1:0] matrixC25_19;
input [`DWIDTH-1:0] matrixC25_20;
input [`DWIDTH-1:0] matrixC25_21;
input [`DWIDTH-1:0] matrixC25_22;
input [`DWIDTH-1:0] matrixC25_23;
input [`DWIDTH-1:0] matrixC25_24;
input [`DWIDTH-1:0] matrixC25_25;
input [`DWIDTH-1:0] matrixC25_26;
input [`DWIDTH-1:0] matrixC25_27;
input [`DWIDTH-1:0] matrixC25_28;
input [`DWIDTH-1:0] matrixC25_29;
input [`DWIDTH-1:0] matrixC25_30;
input [`DWIDTH-1:0] matrixC25_31;
input [`DWIDTH-1:0] matrixC26_0;
input [`DWIDTH-1:0] matrixC26_1;
input [`DWIDTH-1:0] matrixC26_2;
input [`DWIDTH-1:0] matrixC26_3;
input [`DWIDTH-1:0] matrixC26_4;
input [`DWIDTH-1:0] matrixC26_5;
input [`DWIDTH-1:0] matrixC26_6;
input [`DWIDTH-1:0] matrixC26_7;
input [`DWIDTH-1:0] matrixC26_8;
input [`DWIDTH-1:0] matrixC26_9;
input [`DWIDTH-1:0] matrixC26_10;
input [`DWIDTH-1:0] matrixC26_11;
input [`DWIDTH-1:0] matrixC26_12;
input [`DWIDTH-1:0] matrixC26_13;
input [`DWIDTH-1:0] matrixC26_14;
input [`DWIDTH-1:0] matrixC26_15;
input [`DWIDTH-1:0] matrixC26_16;
input [`DWIDTH-1:0] matrixC26_17;
input [`DWIDTH-1:0] matrixC26_18;
input [`DWIDTH-1:0] matrixC26_19;
input [`DWIDTH-1:0] matrixC26_20;
input [`DWIDTH-1:0] matrixC26_21;
input [`DWIDTH-1:0] matrixC26_22;
input [`DWIDTH-1:0] matrixC26_23;
input [`DWIDTH-1:0] matrixC26_24;
input [`DWIDTH-1:0] matrixC26_25;
input [`DWIDTH-1:0] matrixC26_26;
input [`DWIDTH-1:0] matrixC26_27;
input [`DWIDTH-1:0] matrixC26_28;
input [`DWIDTH-1:0] matrixC26_29;
input [`DWIDTH-1:0] matrixC26_30;
input [`DWIDTH-1:0] matrixC26_31;
input [`DWIDTH-1:0] matrixC27_0;
input [`DWIDTH-1:0] matrixC27_1;
input [`DWIDTH-1:0] matrixC27_2;
input [`DWIDTH-1:0] matrixC27_3;
input [`DWIDTH-1:0] matrixC27_4;
input [`DWIDTH-1:0] matrixC27_5;
input [`DWIDTH-1:0] matrixC27_6;
input [`DWIDTH-1:0] matrixC27_7;
input [`DWIDTH-1:0] matrixC27_8;
input [`DWIDTH-1:0] matrixC27_9;
input [`DWIDTH-1:0] matrixC27_10;
input [`DWIDTH-1:0] matrixC27_11;
input [`DWIDTH-1:0] matrixC27_12;
input [`DWIDTH-1:0] matrixC27_13;
input [`DWIDTH-1:0] matrixC27_14;
input [`DWIDTH-1:0] matrixC27_15;
input [`DWIDTH-1:0] matrixC27_16;
input [`DWIDTH-1:0] matrixC27_17;
input [`DWIDTH-1:0] matrixC27_18;
input [`DWIDTH-1:0] matrixC27_19;
input [`DWIDTH-1:0] matrixC27_20;
input [`DWIDTH-1:0] matrixC27_21;
input [`DWIDTH-1:0] matrixC27_22;
input [`DWIDTH-1:0] matrixC27_23;
input [`DWIDTH-1:0] matrixC27_24;
input [`DWIDTH-1:0] matrixC27_25;
input [`DWIDTH-1:0] matrixC27_26;
input [`DWIDTH-1:0] matrixC27_27;
input [`DWIDTH-1:0] matrixC27_28;
input [`DWIDTH-1:0] matrixC27_29;
input [`DWIDTH-1:0] matrixC27_30;
input [`DWIDTH-1:0] matrixC27_31;
input [`DWIDTH-1:0] matrixC28_0;
input [`DWIDTH-1:0] matrixC28_1;
input [`DWIDTH-1:0] matrixC28_2;
input [`DWIDTH-1:0] matrixC28_3;
input [`DWIDTH-1:0] matrixC28_4;
input [`DWIDTH-1:0] matrixC28_5;
input [`DWIDTH-1:0] matrixC28_6;
input [`DWIDTH-1:0] matrixC28_7;
input [`DWIDTH-1:0] matrixC28_8;
input [`DWIDTH-1:0] matrixC28_9;
input [`DWIDTH-1:0] matrixC28_10;
input [`DWIDTH-1:0] matrixC28_11;
input [`DWIDTH-1:0] matrixC28_12;
input [`DWIDTH-1:0] matrixC28_13;
input [`DWIDTH-1:0] matrixC28_14;
input [`DWIDTH-1:0] matrixC28_15;
input [`DWIDTH-1:0] matrixC28_16;
input [`DWIDTH-1:0] matrixC28_17;
input [`DWIDTH-1:0] matrixC28_18;
input [`DWIDTH-1:0] matrixC28_19;
input [`DWIDTH-1:0] matrixC28_20;
input [`DWIDTH-1:0] matrixC28_21;
input [`DWIDTH-1:0] matrixC28_22;
input [`DWIDTH-1:0] matrixC28_23;
input [`DWIDTH-1:0] matrixC28_24;
input [`DWIDTH-1:0] matrixC28_25;
input [`DWIDTH-1:0] matrixC28_26;
input [`DWIDTH-1:0] matrixC28_27;
input [`DWIDTH-1:0] matrixC28_28;
input [`DWIDTH-1:0] matrixC28_29;
input [`DWIDTH-1:0] matrixC28_30;
input [`DWIDTH-1:0] matrixC28_31;
input [`DWIDTH-1:0] matrixC29_0;
input [`DWIDTH-1:0] matrixC29_1;
input [`DWIDTH-1:0] matrixC29_2;
input [`DWIDTH-1:0] matrixC29_3;
input [`DWIDTH-1:0] matrixC29_4;
input [`DWIDTH-1:0] matrixC29_5;
input [`DWIDTH-1:0] matrixC29_6;
input [`DWIDTH-1:0] matrixC29_7;
input [`DWIDTH-1:0] matrixC29_8;
input [`DWIDTH-1:0] matrixC29_9;
input [`DWIDTH-1:0] matrixC29_10;
input [`DWIDTH-1:0] matrixC29_11;
input [`DWIDTH-1:0] matrixC29_12;
input [`DWIDTH-1:0] matrixC29_13;
input [`DWIDTH-1:0] matrixC29_14;
input [`DWIDTH-1:0] matrixC29_15;
input [`DWIDTH-1:0] matrixC29_16;
input [`DWIDTH-1:0] matrixC29_17;
input [`DWIDTH-1:0] matrixC29_18;
input [`DWIDTH-1:0] matrixC29_19;
input [`DWIDTH-1:0] matrixC29_20;
input [`DWIDTH-1:0] matrixC29_21;
input [`DWIDTH-1:0] matrixC29_22;
input [`DWIDTH-1:0] matrixC29_23;
input [`DWIDTH-1:0] matrixC29_24;
input [`DWIDTH-1:0] matrixC29_25;
input [`DWIDTH-1:0] matrixC29_26;
input [`DWIDTH-1:0] matrixC29_27;
input [`DWIDTH-1:0] matrixC29_28;
input [`DWIDTH-1:0] matrixC29_29;
input [`DWIDTH-1:0] matrixC29_30;
input [`DWIDTH-1:0] matrixC29_31;
input [`DWIDTH-1:0] matrixC30_0;
input [`DWIDTH-1:0] matrixC30_1;
input [`DWIDTH-1:0] matrixC30_2;
input [`DWIDTH-1:0] matrixC30_3;
input [`DWIDTH-1:0] matrixC30_4;
input [`DWIDTH-1:0] matrixC30_5;
input [`DWIDTH-1:0] matrixC30_6;
input [`DWIDTH-1:0] matrixC30_7;
input [`DWIDTH-1:0] matrixC30_8;
input [`DWIDTH-1:0] matrixC30_9;
input [`DWIDTH-1:0] matrixC30_10;
input [`DWIDTH-1:0] matrixC30_11;
input [`DWIDTH-1:0] matrixC30_12;
input [`DWIDTH-1:0] matrixC30_13;
input [`DWIDTH-1:0] matrixC30_14;
input [`DWIDTH-1:0] matrixC30_15;
input [`DWIDTH-1:0] matrixC30_16;
input [`DWIDTH-1:0] matrixC30_17;
input [`DWIDTH-1:0] matrixC30_18;
input [`DWIDTH-1:0] matrixC30_19;
input [`DWIDTH-1:0] matrixC30_20;
input [`DWIDTH-1:0] matrixC30_21;
input [`DWIDTH-1:0] matrixC30_22;
input [`DWIDTH-1:0] matrixC30_23;
input [`DWIDTH-1:0] matrixC30_24;
input [`DWIDTH-1:0] matrixC30_25;
input [`DWIDTH-1:0] matrixC30_26;
input [`DWIDTH-1:0] matrixC30_27;
input [`DWIDTH-1:0] matrixC30_28;
input [`DWIDTH-1:0] matrixC30_29;
input [`DWIDTH-1:0] matrixC30_30;
input [`DWIDTH-1:0] matrixC30_31;
input [`DWIDTH-1:0] matrixC31_0;
input [`DWIDTH-1:0] matrixC31_1;
input [`DWIDTH-1:0] matrixC31_2;
input [`DWIDTH-1:0] matrixC31_3;
input [`DWIDTH-1:0] matrixC31_4;
input [`DWIDTH-1:0] matrixC31_5;
input [`DWIDTH-1:0] matrixC31_6;
input [`DWIDTH-1:0] matrixC31_7;
input [`DWIDTH-1:0] matrixC31_8;
input [`DWIDTH-1:0] matrixC31_9;
input [`DWIDTH-1:0] matrixC31_10;
input [`DWIDTH-1:0] matrixC31_11;
input [`DWIDTH-1:0] matrixC31_12;
input [`DWIDTH-1:0] matrixC31_13;
input [`DWIDTH-1:0] matrixC31_14;
input [`DWIDTH-1:0] matrixC31_15;
input [`DWIDTH-1:0] matrixC31_16;
input [`DWIDTH-1:0] matrixC31_17;
input [`DWIDTH-1:0] matrixC31_18;
input [`DWIDTH-1:0] matrixC31_19;
input [`DWIDTH-1:0] matrixC31_20;
input [`DWIDTH-1:0] matrixC31_21;
input [`DWIDTH-1:0] matrixC31_22;
input [`DWIDTH-1:0] matrixC31_23;
input [`DWIDTH-1:0] matrixC31_24;
input [`DWIDTH-1:0] matrixC31_25;
input [`DWIDTH-1:0] matrixC31_26;
input [`DWIDTH-1:0] matrixC31_27;
input [`DWIDTH-1:0] matrixC31_28;
input [`DWIDTH-1:0] matrixC31_29;
input [`DWIDTH-1:0] matrixC31_30;
input [`DWIDTH-1:0] matrixC31_31;
wire row_latch_en;


//////////////////////////////////////////////////////////////////////////
// Logic to capture matrix C data from the PEs and shift it out
//////////////////////////////////////////////////////////////////////////
//assign row_latch_en = (clk_cnt==(`MAT_MUL_SIZE + (a_loc+b_loc) * `BB_MAT_MUL_SIZE + 10 +  `NUM_CYCLES_IN_MAC - 1));
//Writing the line above to avoid multiplication:
//assign row_latch_en = (clk_cnt==(`MAT_MUL_SIZE + ((a_loc+b_loc) << `LOG2_MAT_MUL_SIZE) + 10 +  `NUM_CYCLES_IN_MAC - 1));

assign row_latch_en =  
                       ((clk_cnt == ((`final_mat_mul_size<<2) - `final_mat_mul_size - 1 +`NUM_CYCLES_IN_MAC)));
    
reg c_data_available;
reg [`AWIDTH-1:0] c_addr;
reg start_capturing_c_data;
reg [31:0] counter;
reg [32*`DWIDTH-1:0] c_data_out;
reg [32*`DWIDTH-1:0] c_data_out_1;
reg [32*`DWIDTH-1:0] c_data_out_2;
reg [32*`DWIDTH-1:0] c_data_out_3;
reg [32*`DWIDTH-1:0] c_data_out_4;
reg [32*`DWIDTH-1:0] c_data_out_5;
reg [32*`DWIDTH-1:0] c_data_out_6;
reg [32*`DWIDTH-1:0] c_data_out_7;
reg [32*`DWIDTH-1:0] c_data_out_8;
reg [32*`DWIDTH-1:0] c_data_out_9;
reg [32*`DWIDTH-1:0] c_data_out_10;
reg [32*`DWIDTH-1:0] c_data_out_11;
reg [32*`DWIDTH-1:0] c_data_out_12;
reg [32*`DWIDTH-1:0] c_data_out_13;
reg [32*`DWIDTH-1:0] c_data_out_14;
reg [32*`DWIDTH-1:0] c_data_out_15;
reg [32*`DWIDTH-1:0] c_data_out_16;
reg [32*`DWIDTH-1:0] c_data_out_17;
reg [32*`DWIDTH-1:0] c_data_out_18;
reg [32*`DWIDTH-1:0] c_data_out_19;
reg [32*`DWIDTH-1:0] c_data_out_20;
reg [32*`DWIDTH-1:0] c_data_out_21;
reg [32*`DWIDTH-1:0] c_data_out_22;
reg [32*`DWIDTH-1:0] c_data_out_23;
reg [32*`DWIDTH-1:0] c_data_out_24;
reg [32*`DWIDTH-1:0] c_data_out_25;
reg [32*`DWIDTH-1:0] c_data_out_26;
reg [32*`DWIDTH-1:0] c_data_out_27;
reg [32*`DWIDTH-1:0] c_data_out_28;
reg [32*`DWIDTH-1:0] c_data_out_29;
reg [32*`DWIDTH-1:0] c_data_out_30;
reg [32*`DWIDTH-1:0] c_data_out_31;
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
    c_data_out_16 <= 0;
    c_data_out_17 <= 0;
    c_data_out_18 <= 0;
    c_data_out_19 <= 0;
    c_data_out_20 <= 0;
    c_data_out_21 <= 0;
    c_data_out_22 <= 0;
    c_data_out_23 <= 0;
    c_data_out_24 <= 0;
    c_data_out_25 <= 0;
    c_data_out_26 <= 0;
    c_data_out_27 <= 0;
    c_data_out_28 <= 0;
    c_data_out_29 <= 0;
    c_data_out_30 <= 0;
    c_data_out_31 <= 0;
  end else if (condition_to_start_shifting_output) begin
    start_capturing_c_data <= 1'b1;
    c_data_available <= 1'b1;
    c_addr <= c_addr - address_stride_c;
    c_data_out <= {matrixC31_31, matrixC30_31, matrixC29_31, matrixC28_31, matrixC27_31, matrixC26_31, matrixC25_31, matrixC24_31, matrixC23_31, matrixC22_31, matrixC21_31, matrixC20_31, matrixC19_31, matrixC18_31, matrixC17_31, matrixC16_31, matrixC15_31, matrixC14_31, matrixC13_31, matrixC12_31, matrixC11_31, matrixC10_31, matrixC9_31, matrixC8_31, matrixC7_31, matrixC6_31, matrixC5_31, matrixC4_31, matrixC3_31, matrixC2_31, matrixC1_31, matrixC0_31};
      c_data_out_1 <= {matrixC31_30, matrixC30_30, matrixC29_30, matrixC28_30, matrixC27_30, matrixC26_30, matrixC25_30, matrixC24_30, matrixC23_30, matrixC22_30, matrixC21_30, matrixC20_30, matrixC19_30, matrixC18_30, matrixC17_30, matrixC16_30, matrixC15_30, matrixC14_30, matrixC13_30, matrixC12_30, matrixC11_30, matrixC10_30, matrixC9_30, matrixC8_30, matrixC7_30, matrixC6_30, matrixC5_30, matrixC4_30, matrixC3_30, matrixC2_30, matrixC1_30, matrixC0_30};
      c_data_out_2 <= {matrixC31_29, matrixC30_29, matrixC29_29, matrixC28_29, matrixC27_29, matrixC26_29, matrixC25_29, matrixC24_29, matrixC23_29, matrixC22_29, matrixC21_29, matrixC20_29, matrixC19_29, matrixC18_29, matrixC17_29, matrixC16_29, matrixC15_29, matrixC14_29, matrixC13_29, matrixC12_29, matrixC11_29, matrixC10_29, matrixC9_29, matrixC8_29, matrixC7_29, matrixC6_29, matrixC5_29, matrixC4_29, matrixC3_29, matrixC2_29, matrixC1_29, matrixC0_29};
      c_data_out_3 <= {matrixC31_28, matrixC30_28, matrixC29_28, matrixC28_28, matrixC27_28, matrixC26_28, matrixC25_28, matrixC24_28, matrixC23_28, matrixC22_28, matrixC21_28, matrixC20_28, matrixC19_28, matrixC18_28, matrixC17_28, matrixC16_28, matrixC15_28, matrixC14_28, matrixC13_28, matrixC12_28, matrixC11_28, matrixC10_28, matrixC9_28, matrixC8_28, matrixC7_28, matrixC6_28, matrixC5_28, matrixC4_28, matrixC3_28, matrixC2_28, matrixC1_28, matrixC0_28};
      c_data_out_4 <= {matrixC31_27, matrixC30_27, matrixC29_27, matrixC28_27, matrixC27_27, matrixC26_27, matrixC25_27, matrixC24_27, matrixC23_27, matrixC22_27, matrixC21_27, matrixC20_27, matrixC19_27, matrixC18_27, matrixC17_27, matrixC16_27, matrixC15_27, matrixC14_27, matrixC13_27, matrixC12_27, matrixC11_27, matrixC10_27, matrixC9_27, matrixC8_27, matrixC7_27, matrixC6_27, matrixC5_27, matrixC4_27, matrixC3_27, matrixC2_27, matrixC1_27, matrixC0_27};
      c_data_out_5 <= {matrixC31_26, matrixC30_26, matrixC29_26, matrixC28_26, matrixC27_26, matrixC26_26, matrixC25_26, matrixC24_26, matrixC23_26, matrixC22_26, matrixC21_26, matrixC20_26, matrixC19_26, matrixC18_26, matrixC17_26, matrixC16_26, matrixC15_26, matrixC14_26, matrixC13_26, matrixC12_26, matrixC11_26, matrixC10_26, matrixC9_26, matrixC8_26, matrixC7_26, matrixC6_26, matrixC5_26, matrixC4_26, matrixC3_26, matrixC2_26, matrixC1_26, matrixC0_26};
      c_data_out_6 <= {matrixC31_25, matrixC30_25, matrixC29_25, matrixC28_25, matrixC27_25, matrixC26_25, matrixC25_25, matrixC24_25, matrixC23_25, matrixC22_25, matrixC21_25, matrixC20_25, matrixC19_25, matrixC18_25, matrixC17_25, matrixC16_25, matrixC15_25, matrixC14_25, matrixC13_25, matrixC12_25, matrixC11_25, matrixC10_25, matrixC9_25, matrixC8_25, matrixC7_25, matrixC6_25, matrixC5_25, matrixC4_25, matrixC3_25, matrixC2_25, matrixC1_25, matrixC0_25};
      c_data_out_7 <= {matrixC31_24, matrixC30_24, matrixC29_24, matrixC28_24, matrixC27_24, matrixC26_24, matrixC25_24, matrixC24_24, matrixC23_24, matrixC22_24, matrixC21_24, matrixC20_24, matrixC19_24, matrixC18_24, matrixC17_24, matrixC16_24, matrixC15_24, matrixC14_24, matrixC13_24, matrixC12_24, matrixC11_24, matrixC10_24, matrixC9_24, matrixC8_24, matrixC7_24, matrixC6_24, matrixC5_24, matrixC4_24, matrixC3_24, matrixC2_24, matrixC1_24, matrixC0_24};
      c_data_out_8 <= {matrixC31_23, matrixC30_23, matrixC29_23, matrixC28_23, matrixC27_23, matrixC26_23, matrixC25_23, matrixC24_23, matrixC23_23, matrixC22_23, matrixC21_23, matrixC20_23, matrixC19_23, matrixC18_23, matrixC17_23, matrixC16_23, matrixC15_23, matrixC14_23, matrixC13_23, matrixC12_23, matrixC11_23, matrixC10_23, matrixC9_23, matrixC8_23, matrixC7_23, matrixC6_23, matrixC5_23, matrixC4_23, matrixC3_23, matrixC2_23, matrixC1_23, matrixC0_23};
      c_data_out_9 <= {matrixC31_22, matrixC30_22, matrixC29_22, matrixC28_22, matrixC27_22, matrixC26_22, matrixC25_22, matrixC24_22, matrixC23_22, matrixC22_22, matrixC21_22, matrixC20_22, matrixC19_22, matrixC18_22, matrixC17_22, matrixC16_22, matrixC15_22, matrixC14_22, matrixC13_22, matrixC12_22, matrixC11_22, matrixC10_22, matrixC9_22, matrixC8_22, matrixC7_22, matrixC6_22, matrixC5_22, matrixC4_22, matrixC3_22, matrixC2_22, matrixC1_22, matrixC0_22};
      c_data_out_10 <= {matrixC31_21, matrixC30_21, matrixC29_21, matrixC28_21, matrixC27_21, matrixC26_21, matrixC25_21, matrixC24_21, matrixC23_21, matrixC22_21, matrixC21_21, matrixC20_21, matrixC19_21, matrixC18_21, matrixC17_21, matrixC16_21, matrixC15_21, matrixC14_21, matrixC13_21, matrixC12_21, matrixC11_21, matrixC10_21, matrixC9_21, matrixC8_21, matrixC7_21, matrixC6_21, matrixC5_21, matrixC4_21, matrixC3_21, matrixC2_21, matrixC1_21, matrixC0_21};
      c_data_out_11 <= {matrixC31_20, matrixC30_20, matrixC29_20, matrixC28_20, matrixC27_20, matrixC26_20, matrixC25_20, matrixC24_20, matrixC23_20, matrixC22_20, matrixC21_20, matrixC20_20, matrixC19_20, matrixC18_20, matrixC17_20, matrixC16_20, matrixC15_20, matrixC14_20, matrixC13_20, matrixC12_20, matrixC11_20, matrixC10_20, matrixC9_20, matrixC8_20, matrixC7_20, matrixC6_20, matrixC5_20, matrixC4_20, matrixC3_20, matrixC2_20, matrixC1_20, matrixC0_20};
      c_data_out_12 <= {matrixC31_19, matrixC30_19, matrixC29_19, matrixC28_19, matrixC27_19, matrixC26_19, matrixC25_19, matrixC24_19, matrixC23_19, matrixC22_19, matrixC21_19, matrixC20_19, matrixC19_19, matrixC18_19, matrixC17_19, matrixC16_19, matrixC15_19, matrixC14_19, matrixC13_19, matrixC12_19, matrixC11_19, matrixC10_19, matrixC9_19, matrixC8_19, matrixC7_19, matrixC6_19, matrixC5_19, matrixC4_19, matrixC3_19, matrixC2_19, matrixC1_19, matrixC0_19};
      c_data_out_13 <= {matrixC31_18, matrixC30_18, matrixC29_18, matrixC28_18, matrixC27_18, matrixC26_18, matrixC25_18, matrixC24_18, matrixC23_18, matrixC22_18, matrixC21_18, matrixC20_18, matrixC19_18, matrixC18_18, matrixC17_18, matrixC16_18, matrixC15_18, matrixC14_18, matrixC13_18, matrixC12_18, matrixC11_18, matrixC10_18, matrixC9_18, matrixC8_18, matrixC7_18, matrixC6_18, matrixC5_18, matrixC4_18, matrixC3_18, matrixC2_18, matrixC1_18, matrixC0_18};
      c_data_out_14 <= {matrixC31_17, matrixC30_17, matrixC29_17, matrixC28_17, matrixC27_17, matrixC26_17, matrixC25_17, matrixC24_17, matrixC23_17, matrixC22_17, matrixC21_17, matrixC20_17, matrixC19_17, matrixC18_17, matrixC17_17, matrixC16_17, matrixC15_17, matrixC14_17, matrixC13_17, matrixC12_17, matrixC11_17, matrixC10_17, matrixC9_17, matrixC8_17, matrixC7_17, matrixC6_17, matrixC5_17, matrixC4_17, matrixC3_17, matrixC2_17, matrixC1_17, matrixC0_17};
      c_data_out_15 <= {matrixC31_16, matrixC30_16, matrixC29_16, matrixC28_16, matrixC27_16, matrixC26_16, matrixC25_16, matrixC24_16, matrixC23_16, matrixC22_16, matrixC21_16, matrixC20_16, matrixC19_16, matrixC18_16, matrixC17_16, matrixC16_16, matrixC15_16, matrixC14_16, matrixC13_16, matrixC12_16, matrixC11_16, matrixC10_16, matrixC9_16, matrixC8_16, matrixC7_16, matrixC6_16, matrixC5_16, matrixC4_16, matrixC3_16, matrixC2_16, matrixC1_16, matrixC0_16};
      c_data_out_16 <= {matrixC31_15, matrixC30_15, matrixC29_15, matrixC28_15, matrixC27_15, matrixC26_15, matrixC25_15, matrixC24_15, matrixC23_15, matrixC22_15, matrixC21_15, matrixC20_15, matrixC19_15, matrixC18_15, matrixC17_15, matrixC16_15, matrixC15_15, matrixC14_15, matrixC13_15, matrixC12_15, matrixC11_15, matrixC10_15, matrixC9_15, matrixC8_15, matrixC7_15, matrixC6_15, matrixC5_15, matrixC4_15, matrixC3_15, matrixC2_15, matrixC1_15, matrixC0_15};
      c_data_out_17 <= {matrixC31_14, matrixC30_14, matrixC29_14, matrixC28_14, matrixC27_14, matrixC26_14, matrixC25_14, matrixC24_14, matrixC23_14, matrixC22_14, matrixC21_14, matrixC20_14, matrixC19_14, matrixC18_14, matrixC17_14, matrixC16_14, matrixC15_14, matrixC14_14, matrixC13_14, matrixC12_14, matrixC11_14, matrixC10_14, matrixC9_14, matrixC8_14, matrixC7_14, matrixC6_14, matrixC5_14, matrixC4_14, matrixC3_14, matrixC2_14, matrixC1_14, matrixC0_14};
      c_data_out_18 <= {matrixC31_13, matrixC30_13, matrixC29_13, matrixC28_13, matrixC27_13, matrixC26_13, matrixC25_13, matrixC24_13, matrixC23_13, matrixC22_13, matrixC21_13, matrixC20_13, matrixC19_13, matrixC18_13, matrixC17_13, matrixC16_13, matrixC15_13, matrixC14_13, matrixC13_13, matrixC12_13, matrixC11_13, matrixC10_13, matrixC9_13, matrixC8_13, matrixC7_13, matrixC6_13, matrixC5_13, matrixC4_13, matrixC3_13, matrixC2_13, matrixC1_13, matrixC0_13};
      c_data_out_19 <= {matrixC31_12, matrixC30_12, matrixC29_12, matrixC28_12, matrixC27_12, matrixC26_12, matrixC25_12, matrixC24_12, matrixC23_12, matrixC22_12, matrixC21_12, matrixC20_12, matrixC19_12, matrixC18_12, matrixC17_12, matrixC16_12, matrixC15_12, matrixC14_12, matrixC13_12, matrixC12_12, matrixC11_12, matrixC10_12, matrixC9_12, matrixC8_12, matrixC7_12, matrixC6_12, matrixC5_12, matrixC4_12, matrixC3_12, matrixC2_12, matrixC1_12, matrixC0_12};
      c_data_out_20 <= {matrixC31_11, matrixC30_11, matrixC29_11, matrixC28_11, matrixC27_11, matrixC26_11, matrixC25_11, matrixC24_11, matrixC23_11, matrixC22_11, matrixC21_11, matrixC20_11, matrixC19_11, matrixC18_11, matrixC17_11, matrixC16_11, matrixC15_11, matrixC14_11, matrixC13_11, matrixC12_11, matrixC11_11, matrixC10_11, matrixC9_11, matrixC8_11, matrixC7_11, matrixC6_11, matrixC5_11, matrixC4_11, matrixC3_11, matrixC2_11, matrixC1_11, matrixC0_11};
      c_data_out_21 <= {matrixC31_10, matrixC30_10, matrixC29_10, matrixC28_10, matrixC27_10, matrixC26_10, matrixC25_10, matrixC24_10, matrixC23_10, matrixC22_10, matrixC21_10, matrixC20_10, matrixC19_10, matrixC18_10, matrixC17_10, matrixC16_10, matrixC15_10, matrixC14_10, matrixC13_10, matrixC12_10, matrixC11_10, matrixC10_10, matrixC9_10, matrixC8_10, matrixC7_10, matrixC6_10, matrixC5_10, matrixC4_10, matrixC3_10, matrixC2_10, matrixC1_10, matrixC0_10};
      c_data_out_22 <= {matrixC31_9, matrixC30_9, matrixC29_9, matrixC28_9, matrixC27_9, matrixC26_9, matrixC25_9, matrixC24_9, matrixC23_9, matrixC22_9, matrixC21_9, matrixC20_9, matrixC19_9, matrixC18_9, matrixC17_9, matrixC16_9, matrixC15_9, matrixC14_9, matrixC13_9, matrixC12_9, matrixC11_9, matrixC10_9, matrixC9_9, matrixC8_9, matrixC7_9, matrixC6_9, matrixC5_9, matrixC4_9, matrixC3_9, matrixC2_9, matrixC1_9, matrixC0_9};
      c_data_out_23 <= {matrixC31_8, matrixC30_8, matrixC29_8, matrixC28_8, matrixC27_8, matrixC26_8, matrixC25_8, matrixC24_8, matrixC23_8, matrixC22_8, matrixC21_8, matrixC20_8, matrixC19_8, matrixC18_8, matrixC17_8, matrixC16_8, matrixC15_8, matrixC14_8, matrixC13_8, matrixC12_8, matrixC11_8, matrixC10_8, matrixC9_8, matrixC8_8, matrixC7_8, matrixC6_8, matrixC5_8, matrixC4_8, matrixC3_8, matrixC2_8, matrixC1_8, matrixC0_8};
      c_data_out_24 <= {matrixC31_7, matrixC30_7, matrixC29_7, matrixC28_7, matrixC27_7, matrixC26_7, matrixC25_7, matrixC24_7, matrixC23_7, matrixC22_7, matrixC21_7, matrixC20_7, matrixC19_7, matrixC18_7, matrixC17_7, matrixC16_7, matrixC15_7, matrixC14_7, matrixC13_7, matrixC12_7, matrixC11_7, matrixC10_7, matrixC9_7, matrixC8_7, matrixC7_7, matrixC6_7, matrixC5_7, matrixC4_7, matrixC3_7, matrixC2_7, matrixC1_7, matrixC0_7};
      c_data_out_25 <= {matrixC31_6, matrixC30_6, matrixC29_6, matrixC28_6, matrixC27_6, matrixC26_6, matrixC25_6, matrixC24_6, matrixC23_6, matrixC22_6, matrixC21_6, matrixC20_6, matrixC19_6, matrixC18_6, matrixC17_6, matrixC16_6, matrixC15_6, matrixC14_6, matrixC13_6, matrixC12_6, matrixC11_6, matrixC10_6, matrixC9_6, matrixC8_6, matrixC7_6, matrixC6_6, matrixC5_6, matrixC4_6, matrixC3_6, matrixC2_6, matrixC1_6, matrixC0_6};
      c_data_out_26 <= {matrixC31_5, matrixC30_5, matrixC29_5, matrixC28_5, matrixC27_5, matrixC26_5, matrixC25_5, matrixC24_5, matrixC23_5, matrixC22_5, matrixC21_5, matrixC20_5, matrixC19_5, matrixC18_5, matrixC17_5, matrixC16_5, matrixC15_5, matrixC14_5, matrixC13_5, matrixC12_5, matrixC11_5, matrixC10_5, matrixC9_5, matrixC8_5, matrixC7_5, matrixC6_5, matrixC5_5, matrixC4_5, matrixC3_5, matrixC2_5, matrixC1_5, matrixC0_5};
      c_data_out_27 <= {matrixC31_4, matrixC30_4, matrixC29_4, matrixC28_4, matrixC27_4, matrixC26_4, matrixC25_4, matrixC24_4, matrixC23_4, matrixC22_4, matrixC21_4, matrixC20_4, matrixC19_4, matrixC18_4, matrixC17_4, matrixC16_4, matrixC15_4, matrixC14_4, matrixC13_4, matrixC12_4, matrixC11_4, matrixC10_4, matrixC9_4, matrixC8_4, matrixC7_4, matrixC6_4, matrixC5_4, matrixC4_4, matrixC3_4, matrixC2_4, matrixC1_4, matrixC0_4};
      c_data_out_28 <= {matrixC31_3, matrixC30_3, matrixC29_3, matrixC28_3, matrixC27_3, matrixC26_3, matrixC25_3, matrixC24_3, matrixC23_3, matrixC22_3, matrixC21_3, matrixC20_3, matrixC19_3, matrixC18_3, matrixC17_3, matrixC16_3, matrixC15_3, matrixC14_3, matrixC13_3, matrixC12_3, matrixC11_3, matrixC10_3, matrixC9_3, matrixC8_3, matrixC7_3, matrixC6_3, matrixC5_3, matrixC4_3, matrixC3_3, matrixC2_3, matrixC1_3, matrixC0_3};
      c_data_out_29 <= {matrixC31_2, matrixC30_2, matrixC29_2, matrixC28_2, matrixC27_2, matrixC26_2, matrixC25_2, matrixC24_2, matrixC23_2, matrixC22_2, matrixC21_2, matrixC20_2, matrixC19_2, matrixC18_2, matrixC17_2, matrixC16_2, matrixC15_2, matrixC14_2, matrixC13_2, matrixC12_2, matrixC11_2, matrixC10_2, matrixC9_2, matrixC8_2, matrixC7_2, matrixC6_2, matrixC5_2, matrixC4_2, matrixC3_2, matrixC2_2, matrixC1_2, matrixC0_2};
      c_data_out_30 <= {matrixC31_1, matrixC30_1, matrixC29_1, matrixC28_1, matrixC27_1, matrixC26_1, matrixC25_1, matrixC24_1, matrixC23_1, matrixC22_1, matrixC21_1, matrixC20_1, matrixC19_1, matrixC18_1, matrixC17_1, matrixC16_1, matrixC15_1, matrixC14_1, matrixC13_1, matrixC12_1, matrixC11_1, matrixC10_1, matrixC9_1, matrixC8_1, matrixC7_1, matrixC6_1, matrixC5_1, matrixC4_1, matrixC3_1, matrixC2_1, matrixC1_1, matrixC0_1};
      c_data_out_31 <= {matrixC31_0, matrixC30_0, matrixC29_0, matrixC28_0, matrixC27_0, matrixC26_0, matrixC25_0, matrixC24_0, matrixC23_0, matrixC22_0, matrixC21_0, matrixC20_0, matrixC19_0, matrixC18_0, matrixC17_0, matrixC16_0, matrixC15_0, matrixC14_0, matrixC13_0, matrixC12_0, matrixC11_0, matrixC10_0, matrixC9_0, matrixC8_0, matrixC7_0, matrixC6_0, matrixC5_0, matrixC4_0, matrixC3_0, matrixC2_0, matrixC1_0, matrixC0_0};

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
    c_data_out_16 <= 0;
    c_data_out_17 <= 0;
    c_data_out_18 <= 0;
    c_data_out_19 <= 0;
    c_data_out_20 <= 0;
    c_data_out_21 <= 0;
    c_data_out_22 <= 0;
    c_data_out_23 <= 0;
    c_data_out_24 <= 0;
    c_data_out_25 <= 0;
    c_data_out_26 <= 0;
    c_data_out_27 <= 0;
    c_data_out_28 <= 0;
    c_data_out_29 <= 0;
    c_data_out_30 <= 0;
    c_data_out_31 <= 0;
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
    c_data_out_15 <= c_data_out_16;
    c_data_out_16 <= c_data_out_17;
    c_data_out_17 <= c_data_out_18;
    c_data_out_18 <= c_data_out_19;
    c_data_out_19 <= c_data_out_20;
    c_data_out_20 <= c_data_out_21;
    c_data_out_21 <= c_data_out_22;
    c_data_out_22 <= c_data_out_23;
    c_data_out_23 <= c_data_out_24;
    c_data_out_24 <= c_data_out_25;
    c_data_out_25 <= c_data_out_26;
    c_data_out_26 <= c_data_out_27;
    c_data_out_27 <= c_data_out_28;
    c_data_out_28 <= c_data_out_29;
    c_data_out_29 <= c_data_out_30;
    c_data_out_30 <= c_data_out_31;
    c_data_out_31 <= c_data_in;
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
    c_data_out_15 <= c_data_out_16;
    c_data_out_16 <= c_data_out_17;
    c_data_out_17 <= c_data_out_18;
    c_data_out_18 <= c_data_out_19;
    c_data_out_19 <= c_data_out_20;
    c_data_out_20 <= c_data_out_21;
    c_data_out_21 <= c_data_out_22;
    c_data_out_22 <= c_data_out_23;
    c_data_out_23 <= c_data_out_24;
    c_data_out_24 <= c_data_out_25;
    c_data_out_25 <= c_data_out_26;
    c_data_out_26 <= c_data_out_27;
    c_data_out_27 <= c_data_out_28;
    c_data_out_28 <= c_data_out_29;
    c_data_out_29 <= c_data_out_30;
    c_data_out_30 <= c_data_out_31;
    c_data_out_31 <= c_data_in;
  end
end

endmodule
