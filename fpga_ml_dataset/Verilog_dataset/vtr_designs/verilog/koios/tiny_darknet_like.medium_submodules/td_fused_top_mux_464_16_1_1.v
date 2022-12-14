`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module td_fused_top_mux_464_16_1_1 #(
parameter
    ID                = 0,
    NUM_STAGE         = 1,
    din0_WIDTH       = 32,
    din1_WIDTH       = 32,
    din2_WIDTH       = 32,
    din3_WIDTH       = 32,
    din4_WIDTH         = 32,
    dout_WIDTH            = 32
)(
    input  [15 : 0]     din0,
    input  [15 : 0]     din1,
    input  [15 : 0]     din2,
    input  [15 : 0]     din3,
    input  [63 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [63 : 0]     sel;
// level 1 signals
wire [15 : 0]         mux_1_0;
wire [15 : 0]         mux_1_1;
// level 2 signals
wire [15 : 0]         mux_2_0;
// level 3 signals
wire [15 : 0]         mux_3_0;
// level 4 signals
wire [15 : 0]         mux_4_0;
// level 5 signals
wire [15 : 0]         mux_5_0;
// level 6 signals
wire [15 : 0]         mux_6_0;
// level 7 signals
wire [15 : 0]         mux_7_0;
// level 8 signals
wire [15 : 0]         mux_8_0;
// level 9 signals
wire [15 : 0]         mux_9_0;
// level 10 signals
wire [15 : 0]         mux_10_0;
// level 11 signals
wire [15 : 0]         mux_11_0;
// level 12 signals
wire [15 : 0]         mux_12_0;
// level 13 signals
wire [15 : 0]         mux_13_0;
// level 14 signals
wire [15 : 0]         mux_14_0;
// level 15 signals
wire [15 : 0]         mux_15_0;
// level 16 signals
wire [15 : 0]         mux_16_0;
// level 17 signals
wire [15 : 0]         mux_17_0;
// level 18 signals
wire [15 : 0]         mux_18_0;
// level 19 signals
wire [15 : 0]         mux_19_0;
// level 20 signals
wire [15 : 0]         mux_20_0;
// level 21 signals
wire [15 : 0]         mux_21_0;
// level 22 signals
wire [15 : 0]         mux_22_0;
// level 23 signals
wire [15 : 0]         mux_23_0;
// level 24 signals
wire [15 : 0]         mux_24_0;
// level 25 signals
wire [15 : 0]         mux_25_0;
// level 26 signals
wire [15 : 0]         mux_26_0;
// level 27 signals
wire [15 : 0]         mux_27_0;
// level 28 signals
wire [15 : 0]         mux_28_0;
// level 29 signals
wire [15 : 0]         mux_29_0;
// level 30 signals
wire [15 : 0]         mux_30_0;
// level 31 signals
wire [15 : 0]         mux_31_0;
// level 32 signals
wire [15 : 0]         mux_32_0;
// level 33 signals
wire [15 : 0]         mux_33_0;
// level 34 signals
wire [15 : 0]         mux_34_0;
// level 35 signals
wire [15 : 0]         mux_35_0;
// level 36 signals
wire [15 : 0]         mux_36_0;
// level 37 signals
wire [15 : 0]         mux_37_0;
// level 38 signals
wire [15 : 0]         mux_38_0;
// level 39 signals
wire [15 : 0]         mux_39_0;
// level 40 signals
wire [15 : 0]         mux_40_0;
// level 41 signals
wire [15 : 0]         mux_41_0;
// level 42 signals
wire [15 : 0]         mux_42_0;
// level 43 signals
wire [15 : 0]         mux_43_0;
// level 44 signals
wire [15 : 0]         mux_44_0;
// level 45 signals
wire [15 : 0]         mux_45_0;
// level 46 signals
wire [15 : 0]         mux_46_0;
// level 47 signals
wire [15 : 0]         mux_47_0;
// level 48 signals
wire [15 : 0]         mux_48_0;
// level 49 signals
wire [15 : 0]         mux_49_0;
// level 50 signals
wire [15 : 0]         mux_50_0;
// level 51 signals
wire [15 : 0]         mux_51_0;
// level 52 signals
wire [15 : 0]         mux_52_0;
// level 53 signals
wire [15 : 0]         mux_53_0;
// level 54 signals
wire [15 : 0]         mux_54_0;
// level 55 signals
wire [15 : 0]         mux_55_0;
// level 56 signals
wire [15 : 0]         mux_56_0;
// level 57 signals
wire [15 : 0]         mux_57_0;
// level 58 signals
wire [15 : 0]         mux_58_0;
// level 59 signals
wire [15 : 0]         mux_59_0;
// level 60 signals
wire [15 : 0]         mux_60_0;
// level 61 signals
wire [15 : 0]         mux_61_0;
// level 62 signals
wire [15 : 0]         mux_62_0;
// level 63 signals
wire [15 : 0]         mux_63_0;
// level 64 signals
wire [15 : 0]         mux_64_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// Generate level 3 logic
assign mux_3_0 = mux_2_0;

// Generate level 4 logic
assign mux_4_0 = mux_3_0;

// Generate level 5 logic
assign mux_5_0 = mux_4_0;

// Generate level 6 logic
assign mux_6_0 = mux_5_0;

// Generate level 7 logic
assign mux_7_0 = mux_6_0;

// Generate level 8 logic
assign mux_8_0 = mux_7_0;

// Generate level 9 logic
assign mux_9_0 = mux_8_0;

// Generate level 10 logic
assign mux_10_0 = mux_9_0;

// Generate level 11 logic
assign mux_11_0 = mux_10_0;

// Generate level 12 logic
assign mux_12_0 = mux_11_0;

// Generate level 13 logic
assign mux_13_0 = mux_12_0;

// Generate level 14 logic
assign mux_14_0 = mux_13_0;

// Generate level 15 logic
assign mux_15_0 = mux_14_0;

// Generate level 16 logic
assign mux_16_0 = mux_15_0;

// Generate level 17 logic
assign mux_17_0 = mux_16_0;

// Generate level 18 logic
assign mux_18_0 = mux_17_0;

// Generate level 19 logic
assign mux_19_0 = mux_18_0;

// Generate level 20 logic
assign mux_20_0 = mux_19_0;

// Generate level 21 logic
assign mux_21_0 = mux_20_0;

// Generate level 22 logic
assign mux_22_0 = mux_21_0;

// Generate level 23 logic
assign mux_23_0 = mux_22_0;

// Generate level 24 logic
assign mux_24_0 = mux_23_0;

// Generate level 25 logic
assign mux_25_0 = mux_24_0;

// Generate level 26 logic
assign mux_26_0 = mux_25_0;

// Generate level 27 logic
assign mux_27_0 = mux_26_0;

// Generate level 28 logic
assign mux_28_0 = mux_27_0;

// Generate level 29 logic
assign mux_29_0 = mux_28_0;

// Generate level 30 logic
assign mux_30_0 = mux_29_0;

// Generate level 31 logic
assign mux_31_0 = mux_30_0;

// Generate level 32 logic
assign mux_32_0 = mux_31_0;

// Generate level 33 logic
assign mux_33_0 = mux_32_0;

// Generate level 34 logic
assign mux_34_0 = mux_33_0;

// Generate level 35 logic
assign mux_35_0 = mux_34_0;

// Generate level 36 logic
assign mux_36_0 = mux_35_0;

// Generate level 37 logic
assign mux_37_0 = mux_36_0;

// Generate level 38 logic
assign mux_38_0 = mux_37_0;

// Generate level 39 logic
assign mux_39_0 = mux_38_0;

// Generate level 40 logic
assign mux_40_0 = mux_39_0;

// Generate level 41 logic
assign mux_41_0 = mux_40_0;

// Generate level 42 logic
assign mux_42_0 = mux_41_0;

// Generate level 43 logic
assign mux_43_0 = mux_42_0;

// Generate level 44 logic
assign mux_44_0 = mux_43_0;

// Generate level 45 logic
assign mux_45_0 = mux_44_0;

// Generate level 46 logic
assign mux_46_0 = mux_45_0;

// Generate level 47 logic
assign mux_47_0 = mux_46_0;

// Generate level 48 logic
assign mux_48_0 = mux_47_0;

// Generate level 49 logic
assign mux_49_0 = mux_48_0;

// Generate level 50 logic
assign mux_50_0 = mux_49_0;

// Generate level 51 logic
assign mux_51_0 = mux_50_0;

// Generate level 52 logic
assign mux_52_0 = mux_51_0;

// Generate level 53 logic
assign mux_53_0 = mux_52_0;

// Generate level 54 logic
assign mux_54_0 = mux_53_0;

// Generate level 55 logic
assign mux_55_0 = mux_54_0;

// Generate level 56 logic
assign mux_56_0 = mux_55_0;

// Generate level 57 logic
assign mux_57_0 = mux_56_0;

// Generate level 58 logic
assign mux_58_0 = mux_57_0;

// Generate level 59 logic
assign mux_59_0 = mux_58_0;

// Generate level 60 logic
assign mux_60_0 = mux_59_0;

// Generate level 61 logic
assign mux_61_0 = mux_60_0;

// Generate level 62 logic
assign mux_62_0 = mux_61_0;

// Generate level 63 logic
assign mux_63_0 = mux_62_0;

// Generate level 64 logic
assign mux_64_0 = mux_63_0;

// output logic
assign dout = mux_64_0;

endmodule
