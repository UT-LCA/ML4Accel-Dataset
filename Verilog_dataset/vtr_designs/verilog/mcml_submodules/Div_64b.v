`define TRIG_WIDTH 5'b01010 //10;
`define PIPELINE_DEPTH_UPPER_LIMIT 10'b0100000000 //256;
`define ABSORB_ADDR_WIDTH 6'b010000 //16;
`define ABSORB_WORD_WIDTH 7'b01000000 //64;
`define WSCALE 22'b0111010100101111111111 //1919999;
//`define BIT_WIDTH 7'b0100000
//`define LAYER_WIDTH 6'b000011 
`define LEFTSHIFT 6'b000011         // 2^3=8=1/0.125 where 0.125 = CHANCE of roulette
`define INTCHANCE 32'b00100000000000000000000000000000 //Based on 32 bit rand num generator
`define MIN_WEIGHT 9'b011001000 
`define BIT_WIDTH 7'b0100000
`define LAYER_WIDTH 6'b000011
`define INTMAX 32'b01111111111111111111111111111111
`define INTMIN 32'b10000000000000000000000000000000
`define DIVIDER_LATENCY 6'b011110
`define FINAL_LATENCY 6'b011100
`define MULT_LATENCY 1'b1
`define ASPECT_RATIO 6'b000111
`define TOTAL_LATENCY 7'b0111100
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
`define LOGSCALEFACTOR 6'b000101
`define MAXLOG 32'b10110001011100100001011111110111		//Based on 32 bit unsigned rand num generator
`define CONST_MOVE_AMOUNT 15'b110000110101000  //Used for testing purposes only
`define MUTMAX_BITS 6'b001111
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
//`define INTMAX 32'b01111111111111111111111111111111
//`define INTMIN 32'b10000000000000000000000000000000
//`define BIT_WIDTH 7'b0100000
`define MANTISSA_PRECISION 6'b001010
`define LOG2_BIT_WIDTH 6'b000110
`define LOG2 28'b0101100010111001000010111111
`define NR 10'b0100000000             
`define NZ 10'b0100000000              
`define NR_EXP 5'b01000              //meaning `NR=2^`NR_exp or 2^8=256
`define RGRID_SCLAE_EXP 6'b010101    //2^21 = RGRID_SCALE
`define ZGRID_SCLAE_EXP 6'b010101    //2^21 = ZGRID_SCALE
//`define BIT_WIDTH 7'b0100000
`define BIT_WIDTH_2 8'b01000000
`define WORD_WIDTH 8'b01000000
`define ADDR_WIDTH 6'b010000          //256x256=2^8*2^8=2^16
`define DIV 6'b010100//20;
`define SQRT 5'b01010 //10;
`define LAT 7'b0100101 //DIV + SQRT + 7;
`define INTMAX_2 {32'h3FFFFFFF,32'h00000001}
//`define INTMAX 32'b01111111111111111111111111111111//2147483647;
//`define INTMIN 32'b10000000000000000000000000000001//-2147483647;
`define INTMAXMinus3 32'b01111111111111111111111111111100//2147483644;
`define negINTMAXPlus3 32'b10000000000000000000000000000100//-2147483644;
`define INTMAX_2_ref {32'h3FFFFFFF,32'hFFFFFFFF}
`define SIMULATION_MEMORY

module Div_64b (clock, denom, numer, quotient, remain);
	input clock;
	input [63:0]numer;
	input [31:0]denom;
	output [63:0]quotient;
	reg [63:0]quotient;
	output [31:0]remain;
	reg [31:0]remain;
	
	wire [63:0]quotient_temp;
	wire [31:0]remain_temp;
	Div_64b_unsigned div_temp(.clock(clock), .denom_(denom), .numer_(numer), .quotient(quotient_temp), .remain(remain_temp));
	
	always @ (numer or denom or quotient_temp or remain_temp) begin
		if ( numer[63]^denom[31] ) begin // only one is negative
			quotient = -quotient_temp;
			remain = -remain_temp;
		end else begin
			quotient = quotient_temp;
			remain = remain_temp;
		end
	end 
	
endmodule
module Div_64b_unsigned (clock, denom_, numer_, quotient, remain);
	input clock;
	input [63:0]numer_;
	input [31:0]denom_;
	output [63:0]quotient;
	output [31:0]remain;

	reg [63:0]numer;
	reg [31:0]denom0;
	
	always @ (posedge clock) 
	begin
		numer <= numer_;
		denom0 <= denom_;
	end

///////////////////////////////////////////////////Unchanged starts here	
	reg [94:0]numer_temp_63; //need to add bits
	reg [94:0]numer_temp_62;
	reg [94:0]numer_temp_61;
	reg [94:0]numer_temp_60_d, numer_temp_60_q;
	reg [94:0]numer_temp_59;
	reg [94:0]numer_temp_58;
	reg [94:0]numer_temp_57_d, numer_temp_57_q;
	reg [94:0]numer_temp_56;
	reg [94:0]numer_temp_55;
	reg [94:0]numer_temp_54_d, numer_temp_54_q;
	reg [94:0]numer_temp_53;
	reg [94:0]numer_temp_52;
	reg [94:0]numer_temp_51_d, numer_temp_51_q;
	reg [94:0]numer_temp_50;
	reg [94:0]numer_temp_49;
	reg [94:0]numer_temp_48_d, numer_temp_48_q;
	reg [94:0]numer_temp_47;
	reg [94:0]numer_temp_46;
	reg [94:0]numer_temp_45_d, numer_temp_45_q;
	reg [94:0]numer_temp_44;
	reg [94:0]numer_temp_43;
	reg [94:0]numer_temp_42_d, numer_temp_42_q;
	reg [94:0]numer_temp_41;
	reg [94:0]numer_temp_40;
	reg [94:0]numer_temp_39_d, numer_temp_39_q;
	reg [94:0]numer_temp_38;
	reg [94:0]numer_temp_37;
	reg [94:0]numer_temp_36_d, numer_temp_36_q;
	reg [94:0]numer_temp_35;
	reg [94:0]numer_temp_34;
	reg [94:0]numer_temp_33_d, numer_temp_33_q;
	reg [94:0]numer_temp_32;
	reg [94:0]numer_temp_31;
	reg [94:0]numer_temp_30_d, numer_temp_30_q;
	reg [94:0]numer_temp_29;
	reg [94:0]numer_temp_28;
	reg [94:0]numer_temp_27_d, numer_temp_27_q;
	reg [94:0]numer_temp_26;
	reg [94:0]numer_temp_25;
	reg [94:0]numer_temp_24;
	reg [94:0]numer_temp_23_d, numer_temp_23_q;
	reg [94:0]numer_temp_22;
	reg [94:0]numer_temp_21;
	reg [94:0]numer_temp_20;
	reg [94:0]numer_temp_19_d, numer_temp_19_q;
	reg [94:0]numer_temp_18;
	reg [94:0]numer_temp_17;
	reg [94:0]numer_temp_16;
	reg [94:0]numer_temp_15_d, numer_temp_15_q;
	reg [94:0]numer_temp_14;
	reg [94:0]numer_temp_13;
	reg [94:0]numer_temp_12;
	reg [94:0]numer_temp_11_d, numer_temp_11_q;
	reg [94:0]numer_temp_10;
	reg [94:0]numer_temp_9;
	reg [94:0]numer_temp_8;
	reg [94:0]numer_temp_7_d, numer_temp_7_q;
	reg [94:0]numer_temp_6;
	reg [94:0]numer_temp_5;
	reg [94:0]numer_temp_4;
	reg [94:0]numer_temp_3_d, numer_temp_3_q;
	reg [94:0]numer_temp_2;
	reg [94:0]numer_temp_1_d, numer_temp_1_q;
	reg [94:0]numer_temp_0;
	reg [94:0]numer_temp;

		//The dummy pipeline (20 clock cycles)
	reg [63:0]quo0_d;
	reg [63:0]quo1_d;
	reg [63:0]quo2_d;
	reg [63:0]quo3_d;
	reg [63:0]quo4_d;
	reg [63:0]quo5_d;
	reg [63:0]quo6_d;
	reg [63:0]quo7_d;
	reg [63:0]quo8_d;
	reg [63:0]quo9_d;
	reg [63:0]quo10_d;
	reg [63:0]quo11_d;
	reg [63:0]quo12_d;
	reg [63:0]quo13_d;
	reg [63:0]quo14_d;
	reg [63:0]quo15_d;
	reg [63:0]quo16_d;
	reg [63:0]quo17_d;
	reg [63:0]quo18_d;
	reg [63:0]quo19_d;
	
	reg [63:0]quo0_q;
	reg [63:0]quo1_q;
	reg [63:0]quo2_q;
	reg [63:0]quo3_q;
	reg [63:0]quo4_q;
	reg [63:0]quo5_q;
	reg [63:0]quo6_q;
	reg [63:0]quo7_q;
	reg [63:0]quo8_q;
	reg [63:0]quo9_q;
	reg [63:0]quo10_q;
	reg [63:0]quo11_q;
	reg [63:0]quo12_q;
	reg [63:0]quo13_q;
	reg [63:0]quo14_q;
	reg [63:0]quo15_q;
	reg [63:0]quo16_q;
	reg [63:0]quo17_q;
	reg [63:0]quo18_q;
	
	reg [31:0]denom1;
	reg [31:0]denom2;
	reg [31:0]denom3;	
	reg [31:0]denom4;
	reg [31:0]denom5;	
	reg [31:0]denom6;
	reg [31:0]denom7;	
	reg [31:0]denom8;
	reg [31:0]denom9;	
	reg [31:0]denom10;
	reg [31:0]denom11;	
	reg [31:0]denom12;
	reg [31:0]denom13;	
	reg [31:0]denom14;
	reg [31:0]denom15;	
	reg [31:0]denom16;
	reg [31:0]denom17;	
	reg [31:0]denom18;
	reg [31:0]denom19;
	
	
	always @(numer or denom0) begin
		numer_temp_63 = {31'b0, numer};
		
		//quo0[63]
		if (numer_temp_63[94:63] >= denom0 ) begin
			quo0_d[63] = 1'b1;
			numer_temp_62 = {numer_temp_63[94:63] - denom0, numer_temp_63[62:0]};
		end else begin
			quo0_d[63] = 1'b0;
			numer_temp_62 = numer_temp_63;
		end
		
		//quo0[62]
		if (numer_temp_62[94:62] >= denom0 ) begin
			quo0_d[62] = 1'b1;
			numer_temp_61 = {numer_temp_62[94:62] - denom0, numer_temp_62[61:0]};
		end else begin
			quo0_d[62] = 1'b0;
           numer_temp_61 = numer_temp_62;
		end
		//quo0[61]
		if (numer_temp_61[94:61] >= denom0 ) begin
			quo0_d[61] = 1'b1;
			numer_temp_60_d = {numer_temp_61[94:61] - denom0, numer_temp_61[60:0]};
		end else begin
			quo0_d[61] = 1'b0;
           numer_temp_60_d = numer_temp_61;
		end
		quo0_d[60:0] = 61'b0;
	end
	
	always @ (posedge clock) begin
		quo0_q <= quo0_d;
		numer_temp_60_q <= numer_temp_60_d;
		denom1 <= denom0;
	end
		
	always @(numer_temp_60_q or denom1 or quo0_q) begin
		quo1_d[63:61] = quo0_q[63:61];
	
		//quo1_d[60]
		if (numer_temp_60_q[94:60] >= denom1 ) begin
			quo1_d[60] = 1'b1;
			numer_temp_59 = {numer_temp_60_q[94:60] - denom1, numer_temp_60_q[59:0]};
		end else begin
			quo1_d[60] = 1'b0;
           numer_temp_59 = numer_temp_60_q;
		end
		//quo1_d[59]
		if (numer_temp_59[94:59] >= denom1 ) begin
			quo1_d[59] = 1'b1;
			numer_temp_58 = {numer_temp_59[94:59] - denom1, numer_temp_59[58:0]};
		end else begin
			quo1_d[59] = 1'b0;
           numer_temp_58 = numer_temp_59;
		end
		//quo1_d[58]
		if (numer_temp_58[94:58] >= denom1 ) begin
			quo1_d[58] = 1'b1;
			numer_temp_57_d = {numer_temp_58[94:58] - denom1, numer_temp_58[57:0]};
		end else begin
			quo1_d[58] = 1'b0;
           numer_temp_57_d = numer_temp_58;
		end
		quo1_d[57:0] = 58'b0;
	end

	always @ (posedge clock) begin
		quo1_q <= quo1_d;
		numer_temp_57_q <= numer_temp_57_d;
		denom2 <= denom1;
	end
		
	always @ (numer_temp_57_q or denom2 or quo1_q) begin
		quo2_d[63:58] = quo1_q[63:58];
	
		//quo2_d[57]
		if (numer_temp_57_q[94:57] >= denom2 ) begin
			quo2_d[57] = 1'b1;
			numer_temp_56 = {numer_temp_57_q[94:57] - denom2, numer_temp_57_q[56:0]};
		end else begin
			quo2_d[57] = 1'b0;
           numer_temp_56 = numer_temp_57_q;
		end
		//quo2_d[56]
		if (numer_temp_56[94:56] >= denom2 ) begin
			quo2_d[56] = 1'b1;
			numer_temp_55 = {numer_temp_56[94:56] - denom2, numer_temp_56[55:0]};
		end else begin
			quo2_d[56] = 1'b0;
           numer_temp_55 = numer_temp_56;
		end
		//quo2_d[55]
		if (numer_temp_55[94:55] >= denom2 ) begin
			quo2_d[55] = 1'b1;
			numer_temp_54_d = {numer_temp_55[94:55] - denom2, numer_temp_55[54:0]};
		end else begin
			quo2_d[55] = 1'b0;
           numer_temp_54_d = numer_temp_55;
		end
		quo2_d[54:0] = 55'b0;
	end
	
	
	always @ (posedge clock) begin
		quo2_q <= quo2_d;
		numer_temp_54_q <= numer_temp_54_d;
		denom3 <= denom2;
	end
	
	always @ (numer_temp_54_q or denom3 or quo2_q) begin
		quo3_d[63:55] = quo2_q[63:55];
	
		//quo3_d[54]
		if (numer_temp_54_q[94:54] >= denom3 ) begin
			quo3_d[54] = 1'b1;
			numer_temp_53 = {numer_temp_54_q[94:54] - denom3, numer_temp_54_q[53:0]};
		end else begin
			quo3_d[54] = 1'b0;
           numer_temp_53 = numer_temp_54_q;
		end
		//quo3_d[53]
		if (numer_temp_53[94:53] >= denom3 ) begin
			quo3_d[53] = 1'b1;
			numer_temp_52 = {numer_temp_53[94:53] - denom3, numer_temp_53[52:0]};
		end else begin
			quo3_d[53] = 1'b0;
           numer_temp_52 = numer_temp_53;
		end
		//quo3_d[52]
		if (numer_temp_52[94:52] >= denom3 ) begin
			quo3_d[52] = 1'b1;
			numer_temp_51_d = {numer_temp_52[94:52] - denom3, numer_temp_52[51:0]};
		end else begin
			quo3_d[52] = 1'b0;
           numer_temp_51_d = numer_temp_52;
		end
		quo3_d[51:0] = 52'b0;
	end
		
	always @ (posedge clock) begin
		quo3_q <= quo3_d;
		numer_temp_51_q <= numer_temp_51_d;
		denom4 <= denom3;
	end
		
	always @ (numer_temp_51_q or denom4 or quo3_q) begin
		quo4_d[63:52] = quo3_q[63:52];
	
		//quo4[51]
		if (numer_temp_51_q[94:51] >= denom4 ) begin
			quo4_d[51] = 1'b1;
			numer_temp_50 = {numer_temp_51_q[94:51] - denom4, numer_temp_51_q[50:0]};
		end else begin
			quo4_d[51] = 1'b0;
           numer_temp_50 = numer_temp_51_q;
		end
		//quo4_d[50]
		if (numer_temp_50[94:50] >= denom4 ) begin
			quo4_d[50] = 1'b1;
			numer_temp_49 = {numer_temp_50[94:50] - denom4, numer_temp_50[49:0]};
		end else begin
			quo4_d[50] = 1'b0;
           numer_temp_49 = numer_temp_50;
		end
		//quo4_d[49]
		if (numer_temp_49[94:49] >= denom4 ) begin
			quo4_d[49] = 1'b1;
			numer_temp_48_d = {numer_temp_49[94:49] - denom4, numer_temp_49[48:0]};
		end else begin
			quo4_d[49] = 1'b0;
           numer_temp_48_d = numer_temp_49;
		end
		quo4_d[48:0] = 49'b0;
	end
		
	always @ (posedge clock) begin
		quo4_q <= quo4_d;
		numer_temp_48_q <= numer_temp_48_d;
		denom5 <= denom4;
	end
		
	always @ (numer_temp_48_q or denom5 or quo4_q) begin
		quo5_d[63:49] = quo4_q[63:49];

	//quo5_d[48]
		if (numer_temp_48_q[94:48] >= denom5 ) begin
			quo5_d[48] = 1'b1;
			numer_temp_47 = {numer_temp_48_q[94:48] - denom5, numer_temp_48_q[47:0]};
		end else begin
			quo5_d[48] = 1'b0;
           numer_temp_47 = numer_temp_48_q;
		end
		//quo5_d[47]
		if (numer_temp_47[94:47] >= denom5 ) begin
			quo5_d[47] = 1'b1;
			numer_temp_46 = {numer_temp_47[94:47] - denom5, numer_temp_47[46:0]};
		end else begin
			quo5_d[47] = 1'b0;
           numer_temp_46 = numer_temp_47;
		end
		//quo5_d[46]
		if (numer_temp_46[94:46] >= denom5 ) begin
			quo5_d[46] = 1'b1;
			numer_temp_45_d = {numer_temp_46[94:46] - denom5, numer_temp_46[45:0]};
		end else begin
			quo5_d[46] = 1'b0;
           numer_temp_45_d = numer_temp_46;
		end
		quo5_d[45:0] = 46'b0;
	end
		
	always @ (posedge clock) begin
		quo5_q <= quo5_d;
		numer_temp_45_q <= numer_temp_45_d;
		denom6 <= denom5;
	end
		
	always @ (numer_temp_45_q or denom6 or quo5_q) begin
		quo6_d[63:46] = quo5_q[63:46];
	
		//quo6_d[45]
		if (numer_temp_45_q[94:45] >= denom6 ) begin
			quo6_d[45] = 1'b1;
			numer_temp_44 = {numer_temp_45_q[94:45] - denom6, numer_temp_45_q[44:0]};
		end else begin
			quo6_d[45] = 1'b0;
           numer_temp_44 = numer_temp_45_q;
		end
		//quo6_d[44]
		if (numer_temp_44[94:44] >= denom6 ) begin
			quo6_d[44] = 1'b1;
			numer_temp_43 = {numer_temp_44[94:44] - denom6, numer_temp_44[43:0]};
		end else begin
			quo6_d[44] = 1'b0;
           numer_temp_43 = numer_temp_44;
		end
		//quo6_d[43]
		if (numer_temp_43[94:43] >= denom6 ) begin
			quo6_d[43] = 1'b1;
			numer_temp_42_d = {numer_temp_43[94:43] - denom6, numer_temp_43[42:0]};
		end else begin
			quo6_d[43] = 1'b0;
           numer_temp_42_d = numer_temp_43;
		end
		quo6_d[42:0] = 43'b0;
	end
	
	always @ (posedge clock) begin
		quo6_q<= quo6_d;
		numer_temp_42_q <= numer_temp_42_d;
		denom7 <= denom6;
	end
	
	always @ (numer_temp_42_q or denom7 or quo6_q) begin
		quo7_d[63:43] = quo6_q[63:43];
	
		//quo7_d[42]
		if (numer_temp_42_q[94:42] >= denom7 ) begin
			quo7_d[42] = 1'b1;
			numer_temp_41 = {numer_temp_42_q[94:42] - denom7, numer_temp_42_q[41:0]};
		end else begin
			quo7_d[42] = 1'b0;
           numer_temp_41 = numer_temp_42_q;
		end
		//quo7_d[41]
		if (numer_temp_41[94:41] >= denom7 ) begin
			quo7_d[41] = 1'b1;
			numer_temp_40 = {numer_temp_41[94:41] - denom7, numer_temp_41[40:0]};
		end else begin
			quo7_d[41] = 1'b0;
           numer_temp_40 = numer_temp_41;
		end
		//quo7_d[40]
		if (numer_temp_40[94:40] >= denom7 ) begin
			quo7_d[40] = 1'b1;
			numer_temp_39_d = {numer_temp_40[94:40] - denom7, numer_temp_40[39:0]};
		end else begin
			quo7_d[40] = 1'b0;
           numer_temp_39_d = numer_temp_40;
		end
		quo7_d[39:0] = 40'b0;
	end
		
	always @ (posedge clock) begin
		quo7_q <= quo7_d;
		numer_temp_39_q <= numer_temp_39_d;
		denom8 <= denom7;
	end
		
	always @ (numer_temp_39_q or denom8 or quo7_q) begin
		quo8_d[63:40] = quo7_q[63:40];
	
		//quo8[39]
		if (numer_temp_39_q[94:39] >= denom8 ) begin
			quo8_d[39] = 1'b1;
			numer_temp_38 = {numer_temp_39_q[94:39] - denom8, numer_temp_39_q[38:0]};
		end else begin
			quo8_d[39] = 1'b0;
           numer_temp_38 = numer_temp_39_q;
		end
		//quo8_d[38]
		if (numer_temp_38[94:38] >= denom8 ) begin
			quo8_d[38] = 1'b1;
			numer_temp_37 = {numer_temp_38[94:38] - denom8, numer_temp_38[37:0]};
		end else begin
			quo8_d[38] = 1'b0;
           numer_temp_37 = numer_temp_38;
		end
		//quo8_d[37]
		if (numer_temp_37[94:37] >= denom8 ) begin
			quo8_d[37] = 1'b1;
			numer_temp_36_d = {numer_temp_37[94:37] - denom8, numer_temp_37[36:0]};
		end else begin
			quo8_d[37] = 1'b0;
           numer_temp_36_d = numer_temp_37;
		end
		quo8_d[36:0] = 37'b0;
	end
		
	always @ (posedge clock) begin
		quo8_q <= quo8_d;
		numer_temp_36_q <= numer_temp_36_d;
		denom9 <= denom8;
	end
		
	always @ (numer_temp_36_q or denom9 or quo8_q) begin
		quo9_d[63:37] = quo8_q[63:37];
	
		//quo9[36]
		if (numer_temp_36_q[94:36] >= denom9 ) begin
			quo9_d[36] = 1'b1;
			numer_temp_35 = {numer_temp_36_q[94:36] - denom9, numer_temp_36_q[35:0]};
		end else begin
			quo9_d[36] = 1'b0;
           numer_temp_35 = numer_temp_36_q;
		end
		//quo9_d[35]
		if (numer_temp_35[94:35] >= denom9 ) begin
			quo9_d[35] = 1'b1;
			numer_temp_34 = {numer_temp_35[94:35] - denom9, numer_temp_35[34:0]};
		end else begin
			quo9_d[35] = 1'b0;
           numer_temp_34 = numer_temp_35;
		end
		//quo9_d[34]
		if (numer_temp_34[94:34] >= denom9 ) begin
			quo9_d[34] = 1'b1;
			numer_temp_33_d = {numer_temp_34[94:34] - denom9, numer_temp_34[33:0]};
		end else begin
			quo9_d[34] = 1'b0;
           numer_temp_33_d = numer_temp_34;
		end
		quo9_d[33:0] = 34'b0;
	end
		
	always @ (posedge clock) begin
		quo9_q <= quo9_d;
		numer_temp_33_q <= numer_temp_33_d;
		denom10 <= denom9;
	end
		
	always @ (numer_temp_33_q or denom10 or quo9_q) begin
		quo10_d[63:34] = quo9_q[63:34];
	
		//quo10_d[33]
		if (numer_temp_33_q[94:33] >= denom10 ) begin
			quo10_d[33] = 1'b1;
			numer_temp_32 = {numer_temp_33_q[94:33] - denom10, numer_temp_33_q[32:0]};
		end else begin
			quo10_d[33] = 1'b0;
           numer_temp_32 = numer_temp_33_q;
		end
		//quo10_d[32]
		if (numer_temp_32[94:32] >= denom10 ) begin
			quo10_d[32] = 1'b1;
			numer_temp_31 = {numer_temp_32[94:32] - denom10, numer_temp_32[31:0]};
		end else begin
			quo10_d[32] = 1'b0;
           numer_temp_31 = numer_temp_32;
		end
		//quo10_d[31]
		if (numer_temp_31[94:31] >= denom10 ) begin
			quo10_d[31] = 1'b1;
			numer_temp_30_d = {numer_temp_31[94:31] - denom10, numer_temp_31[30:0]};
		end else begin
			quo10_d[31] = 1'b0;
           numer_temp_30_d = numer_temp_31;
		end
		quo10_d[30:0] = 31'b0;
	end
	
	always @ (posedge clock) begin
		quo10_q <= quo10_d;
		numer_temp_30_q <= numer_temp_30_d;
		denom11 <= denom10;
	end
		
	always @ (numer_temp_30_q or denom11 or quo10_q) begin 
		quo11_d[63:31] = quo10_q[63:31];
	
		//quo11[30]
		if (numer_temp_30_q[94:30] >= denom11 ) begin
			quo11_d[30] = 1'b1;
			numer_temp_29 = {numer_temp_30_q[94:30] - denom11, numer_temp_30_q[29:0]};
		end else begin
			quo11_d[30] = 1'b0;
           numer_temp_29 = numer_temp_30_q;
		end
		//quo11_d[29]
		if (numer_temp_29[94:29] >= denom11 ) begin
			quo11_d[29] = 1'b1;
			numer_temp_28 = {numer_temp_29[94:29] - denom11, numer_temp_29[28:0]};
		end else begin
			quo11_d[29] = 1'b0;
           numer_temp_28 = numer_temp_29;
		end
		//quo11_d[28]
		if (numer_temp_28[94:28] >= denom11 ) begin
			quo11_d[28] = 1'b1;
			numer_temp_27_d = {numer_temp_28[94:28] - denom11, numer_temp_28[27:0]};
		end else begin
			quo11_d[28] = 1'b0;
           numer_temp_27_d = numer_temp_28;
		end
		quo11_d[27:0] = 28'b0;
	end
		
	always @ (posedge clock) begin
		quo11_q <= quo11_d;
		numer_temp_27_q <= numer_temp_27_d;
		denom12 <= denom11;
	end
	
	always @ (numer_temp_27_q or denom12 or quo11_q) begin
		quo12_d[63:28] = quo11_q[63:28];
	
		//quo12[27]
		if (numer_temp_27_q[94:27] >= denom12 ) begin
			quo12_d[27] = 1'b1;
			numer_temp_26 = {numer_temp_27_q[94:27] - denom12, numer_temp_27_q[26:0]};
		end else begin
			quo12_d[27] = 1'b0;
           numer_temp_26 = numer_temp_27_q;
		end
		//quo12_d[26]
		if (numer_temp_26[94:26] >= denom12 ) begin
			quo12_d[26] = 1'b1;
			numer_temp_25 = {numer_temp_26[94:26] - denom12, numer_temp_26[25:0]};
		end else begin
			quo12_d[26] = 1'b0;
           numer_temp_25 = numer_temp_26;
		end
		//quo12_d[25]
		if (numer_temp_25[94:25] >= denom12 ) begin
			quo12_d[25] = 1'b1;
			numer_temp_24 = {numer_temp_25[94:25] - denom12, numer_temp_25[24:0]};
		end else begin
			quo12_d[25] = 1'b0;
           numer_temp_24 = numer_temp_25;
		end
		//quo12_d[24]
		if (numer_temp_24[94:24] >= denom12 ) begin
			quo12_d[24] = 1'b1;
			numer_temp_23_d = {numer_temp_24[94:24] - denom12, numer_temp_24[23:0]};
		end else begin
			quo12_d[24] = 1'b0;
           numer_temp_23_d = numer_temp_24;
		end
		quo12_d[23:0] = 24'b0;
	end
		
	always @ (posedge clock) begin
		quo12_q <= quo12_d;
		numer_temp_23_q <= numer_temp_23_d;
		denom13 <= denom12;
	end
	
	always @ (numer_temp_23_q or denom13 or quo12_q) begin
		quo13_d[63:24] = quo12_q[63:24];
	
		//quo13_d[23]
		if (numer_temp_23_q[94:23] >= denom13 ) begin
			quo13_d[23] = 1'b1;
			numer_temp_22 = {numer_temp_23_q[94:23] - denom13, numer_temp_23_q[22:0]};
		end else begin
			quo13_d[23] = 1'b0;
           numer_temp_22 = numer_temp_23_q;
		end
		//quo13_d[22]
		if (numer_temp_22[94:22] >= denom13 ) begin
			quo13_d[22] = 1'b1;
			numer_temp_21 = {numer_temp_22[94:22] - denom13, numer_temp_22[21:0]};
		end else begin
			quo13_d[22] = 1'b0;
           numer_temp_21 = numer_temp_22;
		end
		//quo13_d[21]
		if (numer_temp_21[94:21] >= denom13 ) begin
			quo13_d[21] = 1'b1;
			numer_temp_20 = {numer_temp_21[94:21] - denom13, numer_temp_21[20:0]};
		end else begin
			quo13_d[21] = 1'b0;
           numer_temp_20 = numer_temp_21;
		end
		//quo13_d[20]
		if (numer_temp_20[94:20] >= denom13 ) begin
			quo13_d[20] = 1'b1;
			numer_temp_19_d = {numer_temp_20[94:20] - denom13, numer_temp_20[19:0]};
		end else begin
			quo13_d[20] = 1'b0;
           numer_temp_19_d = numer_temp_20;
		end
		quo13_d[19:0] = 20'b0;
	end
	
	always @ (posedge clock) begin
		quo13_q <= quo13_d;
		numer_temp_19_q <= numer_temp_19_d;
		denom14 <= denom13;
	end
		
	always @ (numer_temp_19_q or denom14 or quo13_q) begin
		quo14_d[63:20] = quo13_q[63:20];
	
		//quo14_d[19]
		if (numer_temp_19_q[94:19] >= denom14 ) begin
			quo14_d[19] = 1'b1;
			numer_temp_18 = {numer_temp_19_q[94:19] - denom14, numer_temp_19_q[18:0]};
		end else begin
			quo14_d[19] = 1'b0;
           numer_temp_18 = numer_temp_19_q;
		end
		//quo14_d[18]
		if (numer_temp_18[94:18] >= denom14 ) begin
			quo14_d[18] = 1'b1;
			numer_temp_17 = {numer_temp_18[94:18] - denom14, numer_temp_18[17:0]};
		end else begin
			quo14_d[18] = 1'b0;
           numer_temp_17 = numer_temp_18;
		end
		//quo14_d[17]
		if (numer_temp_17[94:17] >= denom14 ) begin
			quo14_d[17] = 1'b1;
			numer_temp_16 = {numer_temp_17[94:17] - denom14, numer_temp_17[16:0]};
		end else begin
			quo14_d[17] = 1'b0;
           numer_temp_16 = numer_temp_17;
		end
		//quo14_d[16]
		if (numer_temp_16[94:16] >= denom14 ) begin
			quo14_d[16] = 1'b1;
			numer_temp_15_d = {numer_temp_16[94:16] - denom14, numer_temp_16[15:0]};
		end else begin
			quo14_d[16] = 1'b0;
           numer_temp_15_d = numer_temp_16;
		end
		quo14_d[15:0] = 16'b0;
	end
		
	always @ (posedge clock) begin
		quo14_q <= quo14_d;
		numer_temp_15_q <= numer_temp_15_d;
		denom15 <= denom14;
	end
		
	always @ (numer_temp_15_q or denom15 or quo14_q) begin
		quo15_d[63:16] = quo14_q[63:16];
	
		//quo15_d[15]
		if (numer_temp_15_q[94:15] >= denom15 ) begin
			quo15_d[15] = 1'b1;
			numer_temp_14 = {numer_temp_15_q[94:15] - denom15, numer_temp_15_q[14:0]};
		end else begin
			quo15_d[15] = 1'b0;
           numer_temp_14 = numer_temp_15_q;
		end
		//quo15_d[14]
		if (numer_temp_14[94:14] >= denom15 ) begin
			quo15_d[14] = 1'b1;
			numer_temp_13 = {numer_temp_14[94:14] - denom15, numer_temp_14[13:0]};
		end else begin
			quo15_d[14] = 1'b0;
           numer_temp_13 = numer_temp_14;
		end
		//quo15_d[13]
		if (numer_temp_13[94:13] >= denom15 ) begin
			quo15_d[13] = 1'b1;
			numer_temp_12 = {numer_temp_13[94:13] - denom15, numer_temp_13[12:0]};
		end else begin
			quo15_d[13] = 1'b0;
           numer_temp_12 = numer_temp_13;
		end
		//quo15_d[12]
		if (numer_temp_12[94:12] >= denom15 ) begin
			quo15_d[12] = 1'b1;
			numer_temp_11_d = {numer_temp_12[94:12] - denom15, numer_temp_12[11:0]};
		end else begin
			quo15_d[12] = 1'b0;
           numer_temp_11_d = numer_temp_12;
		end
		quo15_d[11:0] = 12'b0;
	end
		
	always @ (posedge clock) begin
		quo15_q <= quo15_d;
		numer_temp_11_q <= numer_temp_11_d;
		denom16 <= denom15;
	end
		
	always @ (numer_temp_11_q or denom16 or quo15_q) begin
		quo16_d[63:12] = quo15_q[63:12];
	
		//quo16_d[11]
		if (numer_temp_11_q[94:11] >= denom16 ) begin
			quo16_d[11] = 1'b1;
			numer_temp_10 = {numer_temp_11_q[94:11] - denom16, numer_temp_11_q[10:0]};
		end else begin
			quo16_d[11] = 1'b0;
           numer_temp_10 = numer_temp_11_q;
		end
		//quo16_d[10]
		if (numer_temp_10[94:10] >= denom16 ) begin
			quo16_d[10] = 1'b1;
			numer_temp_9 = {numer_temp_10[94:10] - denom16, numer_temp_10[9:0]};
		end else begin
			quo16_d[10] = 1'b0;
           numer_temp_9 = numer_temp_10;
		end
		//quo16_d[9]
		if (numer_temp_9[94:9] >= denom16 ) begin
			quo16_d[9] = 1'b1;
			numer_temp_8 = {numer_temp_9[94:9] - denom16, numer_temp_9[8:0]};
		end else begin
			quo16_d[9] = 1'b0;
           numer_temp_8 = numer_temp_9;
		end
		//quo16_d[8]
		if (numer_temp_8[94:8] >= denom16 ) begin
			quo16_d[8] = 1'b1;
			numer_temp_7_d = {numer_temp_8[94:8] - denom16, numer_temp_8[7:0]};
		end else begin
			quo16_d[8] = 1'b0;
           numer_temp_7_d = numer_temp_8;
		end
		quo16_d[7:0] = 8'b0;
	end
	
	always @ (posedge clock) begin
		quo16_q <= quo16_d;
		numer_temp_7_q <= numer_temp_7_d;
		denom17 <= denom16;
	end
		
	always @ (numer_temp_7_q or denom17 or quo16_q) begin
		quo17_d[63:8] = quo16_q[63:8];
	
		//quo17_d[7]
		if (numer_temp_7_q[94:7] >= denom17 ) begin
			quo17_d[7] = 1'b1;
			numer_temp_6 = {numer_temp_7_q[94:7] - denom17, numer_temp_7_q[6:0]};
		end else begin
			quo17_d[7] = 1'b0;
           numer_temp_6 = numer_temp_7_q;
		end
		//quo17_d[6]
		if (numer_temp_6[94:6] >= denom17 ) begin
			quo17_d[6] = 1'b1;
			numer_temp_5 = {numer_temp_6[94:6] - denom17, numer_temp_6[5:0]};
		end else begin
			quo17_d[6] = 1'b0;
           numer_temp_5 = numer_temp_6;
		end
		//quo17_d[5]
		if (numer_temp_5[94:5] >= denom17 ) begin
			quo17_d[5] = 1'b1;
			numer_temp_4 = {numer_temp_5[94:5] - denom17, numer_temp_5[4:0]};
		end else begin
			quo17_d[5] = 1'b0;
           numer_temp_4 = numer_temp_5;
		end
		//quo17_d[4]
		if (numer_temp_4[94:4] >= denom17 ) begin
			quo17_d[4] = 1'b1;
			numer_temp_3_d = {numer_temp_4[94:4] - denom17, numer_temp_4[3:0]};
		end else begin
			quo17_d[4] = 1'b0;
           numer_temp_3_d = numer_temp_4;
		end
		quo17_d[3:0] = 4'b0;
	end
	
	always @ (posedge clock) begin
		quo17_q <= quo17_d;
		numer_temp_3_q <= numer_temp_3_d;
		denom18 <= denom17;
	end
		
	always @ (numer_temp_3_q or denom18 or quo17_q) begin
		quo18_d[63:4] = quo17_q[63:4];
		
		//quo18_d[3]
		if (numer_temp_3_q[94:3] >= denom18 ) begin
			quo18_d[3] = 1'b1;
			numer_temp_2 = {numer_temp_3_q[94:3] - denom18, numer_temp_3_q[2:0]};
		end else begin
			quo18_d[3] = 1'b0;
           numer_temp_2 = numer_temp_3_q;
		end
		//quo18_d[2]
		if (numer_temp_2[94:2] >= denom18 ) begin
			quo18_d[2] = 1'b1;
			numer_temp_1_d = {numer_temp_2[94:2] - denom18, numer_temp_2[1:0]};
		end else begin
			quo18_d[2] = 1'b0;
           numer_temp_1_d = numer_temp_2;
		end
		quo18_d[1:0] = 2'b0;
	end
		
	always @ (posedge clock) begin 
		quo18_q <= quo18_d;
		numer_temp_1_q <= numer_temp_1_d;
		denom19 <= denom18;
	end
		
	always @ (numer_temp_1_q or denom19 or quo18_q) begin
		quo19_d[63:2] = quo18_q[63:2];
		//quo19_d[1]
		if (numer_temp_1_q[94:1] >= denom19 ) begin
			quo19_d[1] = 1'b1;
			numer_temp_0 = {numer_temp_1_q[94:1] - denom19, numer_temp_1_q[0:0]};
		end else begin
			quo19_d[1] = 1'b0;
           numer_temp_0 = numer_temp_1_q;
	
		end
		//quo19_d[0]
		if (numer_temp_0[94:0] >= denom19 ) begin
			quo19_d[0] = 1'b1;
			numer_temp = numer_temp_0[94:0] - denom19;
		end else begin
			quo19_d[0] = 1'b0;
           numer_temp = numer_temp_0;
		end	
	end
	
	assign quotient = quo19_d;
	assign remain = numer_temp[31:0];

	
	
endmodule 
