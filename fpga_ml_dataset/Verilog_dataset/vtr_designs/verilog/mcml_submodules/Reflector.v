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

module Reflector (
	
	//INPUTS
	clock,
	reset,
	enable,
	//Values from Photon Pipeline
	i_uz1,
	i_uz3,
	i_layer3,
	i_ux35,
	i_uy35,
	i_uz35,
	i_layer35,
	i_ux36,
	i_uy36,
	i_uz36,
	i_layer36,
	i_dead36,
	
	//Constants
	down_niOverNt_1,
	down_niOverNt_2,
	down_niOverNt_3,
	down_niOverNt_4,
	down_niOverNt_5,
	up_niOverNt_1,
	up_niOverNt_2,
	up_niOverNt_3,
	up_niOverNt_4,
	up_niOverNt_5,
	down_niOverNt_2_1,
	down_niOverNt_2_2,
	down_niOverNt_2_3,
	down_niOverNt_2_4,
	down_niOverNt_2_5,
	up_niOverNt_2_1,
	up_niOverNt_2_2,
	up_niOverNt_2_3,
	up_niOverNt_2_4,
	up_niOverNt_2_5,
	downCritAngle_0,
	downCritAngle_1,
	downCritAngle_2,
	downCritAngle_3,
	downCritAngle_4,
	upCritAngle_0,
	upCritAngle_1,
	upCritAngle_2,
	upCritAngle_3,
	upCritAngle_4,
	
	//Fresnels inputs
	rnd,
	up_rFresnel,
	down_rFresnel,
	
	//Mathematics Results
	prod1_2,
	prod1_4,
	sqrtResult1_6,
	prod1_36,
	prod2_36,
	
	
	//OUTPUTS
	
	//Fresnels outputs
	fresIndex,
	
	//Mathematics Operands
	op1_2_1,
	op1_2_2,
	op1_4_1,
	op1_4_2,
	sqrtOperand1_6,
	op1_36_1,
	op1_36_2,
	op2_36_1,
	op2_36_2,

	
	//Final Calcu`LATed Results
	ux_reflector,
	uy_reflector,
	uz_reflector,
	layer_reflector,
	dead_reflector
);

//-------------------PARAMETER DEFINITION----------------------
//
//
//
//
//
//
//Assign values to parameters used `LATer in the program.
	
//parameter `DIV = 20;
//parameter `SQRT = 10;
//parameter `LAT = `DIV + `SQRT + 7;
//parameter `INTMAX_2 = 64'h3FFFFFFFFFFFFFFF;
//parameter `INTMAX = 2147483647;
//parameter `INTMIN = -2147483647;


//-----------------------------PIN DECLARATION----------------------
//
//
//
//
//
//
//
//
//Assign appropriate types to pins (input or output).
input					clock;
input					reset;
input					enable;

//Values from Photon Pipeline
input		[31:0]			i_uz1;
input		[31:0]			i_uz3;
input		[2:0]			i_layer3;
input		[31:0]			i_ux35;
input		[31:0]			i_uy35;
input		[31:0]			i_uz35;
input		[2:0]			i_layer35;
input		[31:0]			i_ux36;
input		[31:0]			i_uy36;
input		[31:0]			i_uz36;
input		[2:0]			i_layer36;
input					i_dead36;

//Constants
input		[31:0]			down_niOverNt_1;
input		[31:0]			down_niOverNt_2;
input		[31:0]			down_niOverNt_3;
input		[31:0]			down_niOverNt_4;
input		[31:0]			down_niOverNt_5;
input		[31:0]			up_niOverNt_1;
input		[31:0]			up_niOverNt_2;
input		[31:0]			up_niOverNt_3;
input		[31:0]			up_niOverNt_4;
input		[31:0]			up_niOverNt_5;
input		[63:0]			down_niOverNt_2_1; 
input		[63:0]			down_niOverNt_2_2; 
input		[63:0]			down_niOverNt_2_3; 
input		[63:0]			down_niOverNt_2_4; 
input		[63:0]			down_niOverNt_2_5; 
input		[63:0]			up_niOverNt_2_1; 
input		[63:0]			up_niOverNt_2_2; 
input		[63:0]			up_niOverNt_2_3; 
input		[63:0]			up_niOverNt_2_4; 
input		[63:0]			up_niOverNt_2_5; 
input		[31:0]			downCritAngle_0;
input		[31:0]			downCritAngle_1;
input		[31:0]			downCritAngle_2;
input		[31:0]			downCritAngle_3;
input		[31:0]			downCritAngle_4;
input		[31:0]			upCritAngle_0;
input		[31:0]			upCritAngle_1;
input		[31:0]			upCritAngle_2;
input		[31:0]			upCritAngle_3;
input		[31:0]			upCritAngle_4;

//Fresnels inputs
input		[31:0]			rnd;
input		[31:0]			up_rFresnel;
input		[31:0]			down_rFresnel;

//Mathematics Results
input		[63:0]			prod1_2;
input		[63:0]			prod1_4;
input		[31:0]			sqrtResult1_6;
input		[63:0]			prod1_36;
input		[63:0]			prod2_36;

//OUTPUTS

//Fresnels outputs
output		[9:0]			fresIndex;

//Mathematics operands
output		[31:0]			op1_2_1;
output		[31:0]			op1_2_2;
output		[31:0]			op1_4_1;
output		[31:0]			op1_4_2;
output		[63:0]			sqrtOperand1_6;
output		[31:0]			op1_36_1;
output		[31:0]			op1_36_2;
output		[31:0]			op2_36_1;
output		[31:0]			op2_36_2;


//Final Calcu`LATed Results
output		[31:0]			ux_reflector;
output		[31:0]			uy_reflector;
output		[31:0]			uz_reflector;
output		[2:0]			layer_reflector;
output					dead_reflector;


//-----------------------------PIN TYPES-----------------------------
//
//
//
//
//
//
//
//
//Assign pins to be wires or regs.

wire					clock;
wire					reset;
wire					enable;
//Values from Photon Pipeline
wire		[31:0]			i_uz1;
wire		[31:0]			i_uz3; 
wire		[2:0]			i_layer3;
wire		[31:0]			i_ux35;
wire		[31:0]			i_uy35;
wire		[31:0]			i_uz35;
wire		[2:0]			i_layer35;
wire		[31:0]			i_ux36;
wire		[31:0]			i_uy36;
wire		[31:0]			i_uz36;
wire		[2:0]			i_layer36;
wire					i_dead36;

//Constants
wire		[31:0]			down_niOverNt_1;
wire		[31:0]			down_niOverNt_2;
wire		[31:0]			down_niOverNt_3;
wire		[31:0]			down_niOverNt_4;
wire		[31:0]			down_niOverNt_5;
wire		[31:0]			up_niOverNt_1;
wire		[31:0]			up_niOverNt_2;
wire		[31:0]			up_niOverNt_3;
wire		[31:0]			up_niOverNt_4;
wire		[31:0]			up_niOverNt_5;
wire		[63:0]			down_niOverNt_2_1;  
wire		[63:0]			down_niOverNt_2_2;  
wire		[63:0]			down_niOverNt_2_3;  
wire		[63:0]			down_niOverNt_2_4;  
wire		[63:0]			down_niOverNt_2_5;  
wire		[63:0]			up_niOverNt_2_1;  
wire		[63:0]			up_niOverNt_2_2;  
wire		[63:0]			up_niOverNt_2_3;  
wire		[63:0]			up_niOverNt_2_4;  
wire		[63:0]			up_niOverNt_2_5;  
wire		[31:0]			downCritAngle_0;
wire		[31:0]			downCritAngle_1;
wire		[31:0]			downCritAngle_2;
wire		[31:0]			downCritAngle_3;
wire		[31:0]			downCritAngle_4;
wire		[31:0]			upCritAngle_0;
wire		[31:0]			upCritAngle_1;
wire		[31:0]			upCritAngle_2;
wire		[31:0]			upCritAngle_3;
wire		[31:0]			upCritAngle_4;

//Fresnels inputs
wire		[31:0]			rnd;
wire		[31:0]			up_rFresnel;
wire		[31:0]			down_rFresnel;

//Mathematics Results
wire		[63:0]			prod1_2;
wire		[63:0]			prod1_4;
wire		[31:0]			sqrtResult1_6;
wire		[63:0]			prod1_36;
wire		[63:0]			prod2_36;

//OUTPUTS


//Fresnels outputs
reg		[9:0]			fresIndex;

//Operands for shared resources
wire		[31:0]			op1_2_1;
wire		[31:0]			op1_2_2;
reg		[31:0]			op1_4_1;
wire		[31:0]			op1_4_2;
wire		[63:0]			sqrtOperand1_6;
wire		[31:0]			op1_36_1;
reg		[31:0]			op1_36_2;
wire		[31:0]			op2_36_1;
reg		[31:0]			op2_36_2;

//Final Calcu`LATed Results
reg		[31:0]			ux_reflector;
reg		[31:0]			uy_reflector;
reg		[31:0]			uz_reflector;
reg		[2:0]			layer_reflector;
reg					dead_reflector;


//Need this to deal with 'unused' inputs for ODIN II
wire [63:0]bigOr;
assign bigOr = i_uz3|down_niOverNt_2_1|down_niOverNt_2_2|down_niOverNt_2_3|down_niOverNt_2_3|down_niOverNt_2_4|down_niOverNt_2_5|up_niOverNt_2_1|up_niOverNt_2_2|up_niOverNt_2_3|up_niOverNt_2_3|up_niOverNt_2_4|up_niOverNt_2_5|prod1_36|prod2_36|({32'hFFFFFFFF,32'hFFFFFFFF});
wire reset_new;
assign reset_new = reset & bigOr[63] & bigOr[62] & bigOr[61] & bigOr[60] & bigOr[59] & bigOr[58] & bigOr[57] & bigOr[56] & bigOr[55] & bigOr[54] & bigOr[53] & bigOr[52] & bigOr[51] & bigOr[50] & bigOr[49] & bigOr[48] & bigOr[47] & bigOr[46] & bigOr[45] & bigOr[44] & bigOr[43] & bigOr[42] & bigOr[41] & bigOr[40] & bigOr[39] & bigOr[38] & bigOr[37] & bigOr[36] & bigOr[35] & bigOr[34] & bigOr[33] & bigOr[32] & bigOr[31] & bigOr[30] & bigOr[29] & bigOr[28] & bigOr[27] & bigOr[26] & bigOr[25] & bigOr[24] & bigOr[23] & bigOr[22] & bigOr[21] & bigOr[20] & bigOr[19] & bigOr[18] & bigOr[17] & bigOr[16] & bigOr[15] & bigOr[14] & bigOr[13] & bigOr[12] & bigOr[11] & bigOr[10] & bigOr[9] & bigOr[8] & bigOr[7] & bigOr[6] & bigOr[5] & bigOr[4] & bigOr[3] & bigOr[2] & bigOr[1] & bigOr[0];



//-----------------------------END Pin Types-------------------------

//Overflow Wiring
wire					overflow1_4;
wire					toAnd1_36_1;
wire					toAnd1_36_2;
wire					overflow1_36;
wire					negOverflow1_36;
wire					toAnd2_36_1;
wire					toAnd2_36_2;
wire					overflow2_36;
wire					negOverflow2_36;
	
//Wiring for calcu`LATing final Results
reg		[31:0]			new_ux;
reg		[31:0]			new_uy;
reg		[31:0]			new_uz;
reg		[2:0]			new_layer;
reg					new_dead;
reg		[31:0]			downCritAngle;
reg		[31:0]			upCritAngle;
reg		[31:0]			negUz;



//Wires to Connect to Internal Registers
//wire		[63:0]			uz_2[`LAT:0];
//wire		[31:0]			uz2[`LAT:0];
//wire		[63:0]			oneMinusUz_2[`LAT:0];
//wire		[63:0]			sa2_2[`LAT:0];
//wire		[63:0]			uz2_2[`LAT:0];
//wire		[31:0]			ux_transmitted[`LAT:0];
//wire		[31:0]			uy_transmitted[`LAT:0];

wire	[63:0]				uz_2__0;
wire	[63:0]				uz_2__1;
wire	[63:0]				uz_2__2;
wire	[63:0]				uz_2__3;
wire	[63:0]				uz_2__4;
wire	[63:0]				uz_2__5;
wire	[63:0]				uz_2__6;
wire	[63:0]				uz_2__7;
wire	[63:0]				uz_2__8;
wire	[63:0]				uz_2__9;
wire	[63:0]				uz_2__10;
wire	[63:0]				uz_2__11;
wire	[63:0]				uz_2__12;
wire	[63:0]				uz_2__13;
wire	[63:0]				uz_2__14;
wire	[63:0]				uz_2__15;
wire	[63:0]				uz_2__16;
wire	[63:0]				uz_2__17;
wire	[63:0]				uz_2__18;
wire	[63:0]				uz_2__19;
wire	[63:0]				uz_2__20;
wire	[63:0]				uz_2__21;
wire	[63:0]				uz_2__22;
wire	[63:0]				uz_2__23;
wire	[63:0]				uz_2__24;
wire	[63:0]				uz_2__25;
wire	[63:0]				uz_2__26;
wire	[63:0]				uz_2__27;
wire	[63:0]				uz_2__28;
wire	[63:0]				uz_2__29;
wire	[63:0]				uz_2__30;
wire	[63:0]				uz_2__31;
wire	[63:0]				uz_2__32;
wire	[63:0]				uz_2__33;
wire	[63:0]				uz_2__34;
wire	[63:0]				uz_2__35;
wire	[63:0]				uz_2__36;
wire	[63:0]				uz_2__37;



//wire		[31:0]			uz2[37:0];
wire	[32-1:0]				uz2__0;
wire	[32-1:0]				uz2__1;
wire	[32-1:0]				uz2__2;
wire	[32-1:0]				uz2__3;
wire	[32-1:0]				uz2__4;
wire	[32-1:0]				uz2__5;
wire	[32-1:0]				uz2__6;
wire	[32-1:0]				uz2__7;
wire	[32-1:0]				uz2__8;
wire	[32-1:0]				uz2__9;
wire	[32-1:0]				uz2__10;
wire	[32-1:0]				uz2__11;
wire	[32-1:0]				uz2__12;
wire	[32-1:0]				uz2__13;
wire	[32-1:0]				uz2__14;
wire	[32-1:0]				uz2__15;
wire	[32-1:0]				uz2__16;
wire	[32-1:0]				uz2__17;
wire	[32-1:0]				uz2__18;
wire	[32-1:0]				uz2__19;
wire	[32-1:0]				uz2__20;
wire	[32-1:0]				uz2__21;
wire	[32-1:0]				uz2__22;
wire	[32-1:0]				uz2__23;
wire	[32-1:0]				uz2__24;
wire	[32-1:0]				uz2__25;
wire	[32-1:0]				uz2__26;
wire	[32-1:0]				uz2__27;
wire	[32-1:0]				uz2__28;
wire	[32-1:0]				uz2__29;
wire	[32-1:0]				uz2__30;
wire	[32-1:0]				uz2__31;
wire	[32-1:0]				uz2__32;
wire	[32-1:0]				uz2__33;
wire	[32-1:0]				uz2__34;
wire	[32-1:0]				uz2__35;
wire	[32-1:0]				uz2__36;
wire	[32-1:0]				uz2__37;


//wire		[63:0]			oneMinusUz_2[37:0];

wire	[63:0]				oneMinusUz_2__0;
wire	[63:0]				oneMinusUz_2__1;
wire	[63:0]				oneMinusUz_2__2;
wire	[63:0]				oneMinusUz_2__3;
wire	[63:0]				oneMinusUz_2__4;
wire	[63:0]				oneMinusUz_2__5;
wire	[63:0]				oneMinusUz_2__6;
wire	[63:0]				oneMinusUz_2__7;
wire	[63:0]				oneMinusUz_2__8;
wire	[63:0]				oneMinusUz_2__9;
wire	[63:0]				oneMinusUz_2__10;
wire	[63:0]				oneMinusUz_2__11;
wire	[63:0]				oneMinusUz_2__12;
wire	[63:0]				oneMinusUz_2__13;
wire	[63:0]				oneMinusUz_2__14;
wire	[63:0]				oneMinusUz_2__15;
wire	[63:0]				oneMinusUz_2__16;
wire	[63:0]				oneMinusUz_2__17;
wire	[63:0]				oneMinusUz_2__18;
wire	[63:0]				oneMinusUz_2__19;
wire	[63:0]				oneMinusUz_2__20;
wire	[63:0]				oneMinusUz_2__21;
wire	[63:0]				oneMinusUz_2__22;
wire	[63:0]				oneMinusUz_2__23;
wire	[63:0]				oneMinusUz_2__24;
wire	[63:0]				oneMinusUz_2__25;
wire	[63:0]				oneMinusUz_2__26;
wire	[63:0]				oneMinusUz_2__27;
wire	[63:0]				oneMinusUz_2__28;
wire	[63:0]				oneMinusUz_2__29;
wire	[63:0]				oneMinusUz_2__30;
wire	[63:0]				oneMinusUz_2__31;
wire	[63:0]				oneMinusUz_2__32;
wire	[63:0]				oneMinusUz_2__33;
wire	[63:0]				oneMinusUz_2__34;
wire	[63:0]				oneMinusUz_2__35;
wire	[63:0]				oneMinusUz_2__36;
wire	[63:0]				oneMinusUz_2__37;


//wire		[63:0]			sa2_2[37:0];
wire	[63:0]				sa2_2__0;
wire	[63:0]				sa2_2__1;
wire	[63:0]				sa2_2__2;
wire	[63:0]				sa2_2__3;
wire	[63:0]				sa2_2__4;
wire	[63:0]				sa2_2__5;
wire	[63:0]				sa2_2__6;
wire	[63:0]				sa2_2__7;
wire	[63:0]				sa2_2__8;
wire	[63:0]				sa2_2__9;
wire	[63:0]				sa2_2__10;
wire	[63:0]				sa2_2__11;
wire	[63:0]				sa2_2__12;
wire	[63:0]				sa2_2__13;
wire	[63:0]				sa2_2__14;
wire	[63:0]				sa2_2__15;
wire	[63:0]				sa2_2__16;
wire	[63:0]				sa2_2__17;
wire	[63:0]				sa2_2__18;
wire	[63:0]				sa2_2__19;
wire	[63:0]				sa2_2__20;
wire	[63:0]				sa2_2__21;
wire	[63:0]				sa2_2__22;
wire	[63:0]				sa2_2__23;
wire	[63:0]				sa2_2__24;
wire	[63:0]				sa2_2__25;
wire	[63:0]				sa2_2__26;
wire	[63:0]				sa2_2__27;
wire	[63:0]				sa2_2__28;
wire	[63:0]				sa2_2__29;
wire	[63:0]				sa2_2__30;
wire	[63:0]				sa2_2__31;
wire	[63:0]				sa2_2__32;
wire	[63:0]				sa2_2__33;
wire	[63:0]				sa2_2__34;
wire	[63:0]				sa2_2__35;
wire	[63:0]				sa2_2__36;
wire	[63:0]				sa2_2__37;


//wire		[63:0]			uz2_2[37:0];

wire	[63:0]				uz2_2__0;
wire	[63:0]				uz2_2__1;
wire	[63:0]				uz2_2__2;
wire	[63:0]				uz2_2__3;
wire	[63:0]				uz2_2__4;
wire	[63:0]				uz2_2__5;
wire	[63:0]				uz2_2__6;
wire	[63:0]				uz2_2__7;
wire	[63:0]				uz2_2__8;
wire	[63:0]				uz2_2__9;
wire	[63:0]				uz2_2__10;
wire	[63:0]				uz2_2__11;
wire	[63:0]				uz2_2__12;
wire	[63:0]				uz2_2__13;
wire	[63:0]				uz2_2__14;
wire	[63:0]				uz2_2__15;
wire	[63:0]				uz2_2__16;
wire	[63:0]				uz2_2__17;
wire	[63:0]				uz2_2__18;
wire	[63:0]				uz2_2__19;
wire	[63:0]				uz2_2__20;
wire	[63:0]				uz2_2__21;
wire	[63:0]				uz2_2__22;
wire	[63:0]				uz2_2__23;
wire	[63:0]				uz2_2__24;
wire	[63:0]				uz2_2__25;
wire	[63:0]				uz2_2__26;
wire	[63:0]				uz2_2__27;
wire	[63:0]				uz2_2__28;
wire	[63:0]				uz2_2__29;
wire	[63:0]				uz2_2__30;
wire	[63:0]				uz2_2__31;
wire	[63:0]				uz2_2__32;
wire	[63:0]				uz2_2__33;
wire	[63:0]				uz2_2__34;
wire	[63:0]				uz2_2__35;
wire	[63:0]				uz2_2__36;
wire	[63:0]				uz2_2__37;

//wire		[31:0]			ux_transmitted[37:0];

wire	[32-1:0]				ux_transmitted__0;
wire	[32-1:0]				ux_transmitted__1;
wire	[32-1:0]				ux_transmitted__2;
wire	[32-1:0]				ux_transmitted__3;
wire	[32-1:0]				ux_transmitted__4;
wire	[32-1:0]				ux_transmitted__5;
wire	[32-1:0]				ux_transmitted__6;
wire	[32-1:0]				ux_transmitted__7;
wire	[32-1:0]				ux_transmitted__8;
wire	[32-1:0]				ux_transmitted__9;
wire	[32-1:0]				ux_transmitted__10;
wire	[32-1:0]				ux_transmitted__11;
wire	[32-1:0]				ux_transmitted__12;
wire	[32-1:0]				ux_transmitted__13;
wire	[32-1:0]				ux_transmitted__14;
wire	[32-1:0]				ux_transmitted__15;
wire	[32-1:0]				ux_transmitted__16;
wire	[32-1:0]				ux_transmitted__17;
wire	[32-1:0]				ux_transmitted__18;
wire	[32-1:0]				ux_transmitted__19;
wire	[32-1:0]				ux_transmitted__20;
wire	[32-1:0]				ux_transmitted__21;
wire	[32-1:0]				ux_transmitted__22;
wire	[32-1:0]				ux_transmitted__23;
wire	[32-1:0]				ux_transmitted__24;
wire	[32-1:0]				ux_transmitted__25;
wire	[32-1:0]				ux_transmitted__26;
wire	[32-1:0]				ux_transmitted__27;
wire	[32-1:0]				ux_transmitted__28;
wire	[32-1:0]				ux_transmitted__29;
wire	[32-1:0]				ux_transmitted__30;
wire	[32-1:0]				ux_transmitted__31;
wire	[32-1:0]				ux_transmitted__32;
wire	[32-1:0]				ux_transmitted__33;
wire	[32-1:0]				ux_transmitted__34;
wire	[32-1:0]				ux_transmitted__35;
wire	[32-1:0]				ux_transmitted__36;
wire	[32-1:0]				ux_transmitted__37;

//wire		[31:0]			uy_transmitted[37:0];

wire	[32-1:0]				uy_transmitted__0;
wire	[32-1:0]				uy_transmitted__1;
wire	[32-1:0]				uy_transmitted__2;
wire	[32-1:0]				uy_transmitted__3;
wire	[32-1:0]				uy_transmitted__4;
wire	[32-1:0]				uy_transmitted__5;
wire	[32-1:0]				uy_transmitted__6;
wire	[32-1:0]				uy_transmitted__7;
wire	[32-1:0]				uy_transmitted__8;
wire	[32-1:0]				uy_transmitted__9;
wire	[32-1:0]				uy_transmitted__10;
wire	[32-1:0]				uy_transmitted__11;
wire	[32-1:0]				uy_transmitted__12;
wire	[32-1:0]				uy_transmitted__13;
wire	[32-1:0]				uy_transmitted__14;
wire	[32-1:0]				uy_transmitted__15;
wire	[32-1:0]				uy_transmitted__16;
wire	[32-1:0]				uy_transmitted__17;
wire	[32-1:0]				uy_transmitted__18;
wire	[32-1:0]				uy_transmitted__19;
wire	[32-1:0]				uy_transmitted__20;
wire	[32-1:0]				uy_transmitted__21;
wire	[32-1:0]				uy_transmitted__22;
wire	[32-1:0]				uy_transmitted__23;
wire	[32-1:0]				uy_transmitted__24;
wire	[32-1:0]				uy_transmitted__25;
wire	[32-1:0]				uy_transmitted__26;
wire	[32-1:0]				uy_transmitted__27;
wire	[32-1:0]				uy_transmitted__28;
wire	[32-1:0]				uy_transmitted__29;
wire	[32-1:0]				uy_transmitted__30;
wire	[32-1:0]				uy_transmitted__31;
wire	[32-1:0]				uy_transmitted__32;
wire	[32-1:0]				uy_transmitted__33;
wire	[32-1:0]				uy_transmitted__34;
wire	[32-1:0]				uy_transmitted__35;
wire	[32-1:0]				uy_transmitted__36;
wire	[32-1:0]				uy_transmitted__37;

wire		[63:0]			new_uz_2;
wire		[31:0]			new_uz2;
wire		[63:0]			new_oneMinusUz_2;
wire		[63:0]			new_sa2_2;
wire		[63:0]			new_uz2_2;
reg		[31:0]			new_ux_transmitted;
reg		[31:0]			new_uy_transmitted;



//------------------Register Pipeline-----------------
//Generation Methodology: Standard block, called InternalsBlock_Reflector,
//is repeated multiple times, based on the `LATency of the reflector and
//scatterer.  This block contains the list of all internal variables
//that need to be registered and passed along in the pipeline.
//
//Previous values in the pipeline are passed to the next register on each
//clock tick.  The exception comes when an internal variable gets
//calcu`LATed.  Each time a new internal variable is calcu`LATed, a new
//case is added to the case statement, and instead of hooking previous
//values of that variable to next, the new, calcu`LATed values are hooked up.
//
//This method will generate many more registers than what are required, but
//it is expected that the synthesis tool will synthesize these away.
//
//
//Commenting Convention: Whenever a new value is injected into the pipe, the
//comment //Changed Value is added directly above the variable in question.
//When multiple values are calcu`LATed in a single clock cycle, multiple such
//comments are placed.  Wires connected to "Changed Values" always start with
//the prefix new_.
//
//GENERATE PIPELINE

//genvar i;
//generate
//	for(i=`LAT; i>0; i=i-1) begin: internalPipe_Reflector
//		case(i)
//		
//		2:
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			Changed Value
//			.i_uz_2(new_uz_2),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		
//		3:
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//		//	Changed Value
//			.i_oneMinusUz_2(new_oneMinusUz_2), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		4:
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			Changed Value
//			.i_sa2_2(new_sa2_2),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		
//		5:
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			Changed Value
//			.i_uz2_2(new_uz2_2),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		
//		(`SQRT+6):
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			Changed Value
//			.i_uz2(new_uz2),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		
//		(`SQRT+`DIV+6):
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			Changed Value
//			.i_ux_transmitted(new_ux_transmitted),	//New value for ux, if photon moves to next layer
//			Changed Value
//			.i_uy_transmitted(new_uy_transmitted),	//New value for uy, if photon moves to next layer
//
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		default:
//		InternalsBlock_Reflector pipeReg(
//			Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//		
//			.i_uz_2(uz_2[i-1]),			//uz^2
//			.i_uz2(uz2[i-1]),			//new uz, should the photon transmit to new layer
//			.i_oneMinusUz_2(oneMinusUz_2[i-1]), 	//(1-uz)^2
//			.i_sa2_2(sa2_2[i-1]),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
//			.i_uz2_2(uz2_2[i-1]),			//(uz2)^2, new uz squared.
//			.i_ux_transmitted(ux_transmitted[i-1]), //New value for ux, if photon moves to next layer
//			.i_uy_transmitted(uy_transmitted[i-1]),	//New value for uy, if photon moves to next layer
//			
//			Outputs
//			.o_uz_2(uz_2[i]),
//			.o_uz2(uz2[i]),
//			.o_oneMinusUz_2(oneMinusUz_2[i]),
//			.o_sa2_2(sa2_2[i]),
//			.o_uz2_2(uz2_2[i]),
//			.o_ux_transmitted(ux_transmitted[i]),
//			.o_uy_transmitted(uy_transmitted[i])
//		);
//		endcase
//	end
//endgenerate	



// special cases first
	
	//	forloop2
		InternalsBlock_Reflector pipeReg2(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),
			
			//Changed Value
			.i_uz_2(new_uz_2),			//uz^2
			.i_uz2(uz2__1),			//new uz, should the photon transmit to new layer
			.i_oneMinusUz_2(oneMinusUz_2__1), 	//(1-uz)^2
			.i_sa2_2(sa2_2__1),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			.i_uz2_2(uz2_2__1),			//(uz2)^2, new uz squared.
			.i_ux_transmitted(ux_transmitted__1), //New value for ux, if photon moves to next layer
			.i_uy_transmitted(uy_transmitted__1),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__2),
			.o_uz2(uz2__2),
			.o_oneMinusUz_2(oneMinusUz_2__2),
			.o_sa2_2(sa2_2__2),
			.o_uz2_2(uz2_2__2),
			.o_ux_transmitted(ux_transmitted__2),
			.o_uy_transmitted(uy_transmitted__2)
		);
		
		// for loop3:
		InternalsBlock_Reflector pipeReg3(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),

			.i_uz_2(uz_2__2),			//uz^2
			.i_uz2(uz2__2),			//new uz, should the photon transmit to new layer
			//Changed Value
			.i_oneMinusUz_2(new_oneMinusUz_2), 	//(1-uz)^2
			.i_sa2_2(sa2_2__2),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			.i_uz2_2(uz2_2__2),			//(uz2)^2, new uz squared.
			.i_ux_transmitted(ux_transmitted__2), //New value for ux, if photon moves to next layer
			.i_uy_transmitted(uy_transmitted__2),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__3),
			.o_uz2(uz2__3),
			.o_oneMinusUz_2(oneMinusUz_2__3),
			.o_sa2_2(sa2_2__3),
			.o_uz2_2(uz2_2__3),
			.o_ux_transmitted(ux_transmitted__3),
			.o_uy_transmitted(uy_transmitted__3)
		);
		
		// for loop4
		InternalsBlock_Reflector pipeReg4(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),

			.i_uz_2(uz_2__3),			//uz^2
			.i_uz2(uz2__3),			//new uz, should the photon transmit to new layer
			.i_oneMinusUz_2(oneMinusUz_2__3), 	//(1-uz)^2
			//Changed Value
			.i_sa2_2(new_sa2_2),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			.i_uz2_2(uz2_2__3),			//(uz2)^2, new uz squared.
			.i_ux_transmitted(ux_transmitted__3), //New value for ux, if photon moves to next layer
			.i_uy_transmitted(uy_transmitted__3),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__4),
			.o_uz2(uz2__4),
			.o_oneMinusUz_2(oneMinusUz_2__4),
			.o_sa2_2(sa2_2__4),
			.o_uz2_2(uz2_2__4),
			.o_ux_transmitted(ux_transmitted__4),
			.o_uy_transmitted(uy_transmitted__4)
		);
		
		//for loop5
		InternalsBlock_Reflector pipeReg5(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),

			.i_uz_2(uz_2__4),			//uz^2
			.i_uz2(uz2__4),			//new uz, should the photon transmit to new layer
			.i_oneMinusUz_2(oneMinusUz_2__4), 	//(1-uz)^2
			.i_sa2_2(sa2_2__4),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			//Changed Value
			.i_uz2_2(new_uz2_2),			//(uz2)^2, new uz squared.
			.i_ux_transmitted(ux_transmitted__4), //New value for ux, if photon moves to next layer
			.i_uy_transmitted(uy_transmitted__4),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__5),
			.o_uz2(uz2__5),
			.o_oneMinusUz_2(oneMinusUz_2__5),
			.o_sa2_2(sa2_2__5),
			.o_uz2_2(uz2_2__5),
			.o_ux_transmitted(ux_transmitted__5),
			.o_uy_transmitted(uy_transmitted__5)
		);
		
		//for loop(10+6):
		InternalsBlock_Reflector pipeReg16(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),

			.i_uz_2(uz_2__15),			//uz^2
			//Changed Value
			.i_uz2(new_uz2),			//new uz, should the photon transmit to new layer
			.i_oneMinusUz_2(oneMinusUz_2__15), 	//(1-uz)^2
			.i_sa2_2(sa2_2__15),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			.i_uz2_2(uz2_2__15),			//(uz2)^2, new uz squared.
			.i_ux_transmitted(ux_transmitted__15), //New value for ux, if photon moves to next layer
			.i_uy_transmitted(uy_transmitted__15),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__16),
			.o_uz2(uz2__16),
			.o_oneMinusUz_2(oneMinusUz_2__16),
			.o_sa2_2(sa2_2__16),
			.o_uz2_2(uz2_2__16),
			.o_ux_transmitted(ux_transmitted__16),
			.o_uy_transmitted(uy_transmitted__16)
		);
		
		//for loop (10+20+6):
		InternalsBlock_Reflector pipeReg36(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),

			.i_uz_2(uz_2__35),			//uz^2
			.i_uz2(uz2__35),			//new uz, should the photon transmit to new layer
			.i_oneMinusUz_2(oneMinusUz_2__35), 	//(1-uz)^2
			.i_sa2_2(sa2_2__35),			//(sine of angle 2)^2 (uz2 = cosine of angle 2).
			.i_uz2_2(uz2_2__35),			//(uz2)^2, new uz squared.
			//Changed Value
			.i_ux_transmitted(new_ux_transmitted),	//New value for ux, if photon moves to next layer
			//Changed Value
			.i_uy_transmitted(new_uy_transmitted),	//New value for uy, if photon moves to next layer

			//Outputs
			.o_uz_2(uz_2__36),
			.o_uz2(uz2__36),
			.o_oneMinusUz_2(oneMinusUz_2__36),
			.o_sa2_2(sa2_2__36),
			.o_uz2_2(uz2_2__36),
			.o_ux_transmitted(ux_transmitted__36),
			.o_uy_transmitted(uy_transmitted__36)
		);

		
		//rest of loop
		
InternalsBlock_Reflector pipeReg37(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__36),
.i_uz2(uz2__36),
.i_oneMinusUz_2(oneMinusUz_2__36),
.i_sa2_2(sa2_2__36),
.i_uz2_2(uz2_2__36),
.i_ux_transmitted(ux_transmitted__36),
.i_uy_transmitted(uy_transmitted__36),

 //outputs

.o_uz_2(uz_2__37),
.o_uz2(uz2__37),
.o_oneMinusUz_2(oneMinusUz_2__37),
.o_sa2_2(sa2_2__37),
.o_uz2_2(uz2_2__37),
.o_ux_transmitted(ux_transmitted__37),
.o_uy_transmitted(uy_transmitted__37)
);

//removed 36
InternalsBlock_Reflector pipeReg35(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__34),
.i_uz2(uz2__34),
.i_oneMinusUz_2(oneMinusUz_2__34),
.i_sa2_2(sa2_2__34),
.i_uz2_2(uz2_2__34),
.i_ux_transmitted(ux_transmitted__34),
.i_uy_transmitted(uy_transmitted__34),

 //outputs

.o_uz_2(uz_2__35),
.o_uz2(uz2__35),
.o_oneMinusUz_2(oneMinusUz_2__35),
.o_sa2_2(sa2_2__35),
.o_uz2_2(uz2_2__35),
.o_ux_transmitted(ux_transmitted__35),
.o_uy_transmitted(uy_transmitted__35)
);

InternalsBlock_Reflector pipeReg34(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__33),
.i_uz2(uz2__33),
.i_oneMinusUz_2(oneMinusUz_2__33),
.i_sa2_2(sa2_2__33),
.i_uz2_2(uz2_2__33),
.i_ux_transmitted(ux_transmitted__33),
.i_uy_transmitted(uy_transmitted__33),

 //outputs

.o_uz_2(uz_2__34),
.o_uz2(uz2__34),
.o_oneMinusUz_2(oneMinusUz_2__34),
.o_sa2_2(sa2_2__34),
.o_uz2_2(uz2_2__34),
.o_ux_transmitted(ux_transmitted__34),
.o_uy_transmitted(uy_transmitted__34)
);

InternalsBlock_Reflector pipeReg33(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__32),
.i_uz2(uz2__32),
.i_oneMinusUz_2(oneMinusUz_2__32),
.i_sa2_2(sa2_2__32),
.i_uz2_2(uz2_2__32),
.i_ux_transmitted(ux_transmitted__32),
.i_uy_transmitted(uy_transmitted__32),

 //outputs

.o_uz_2(uz_2__33),
.o_uz2(uz2__33),
.o_oneMinusUz_2(oneMinusUz_2__33),
.o_sa2_2(sa2_2__33),
.o_uz2_2(uz2_2__33),
.o_ux_transmitted(ux_transmitted__33),
.o_uy_transmitted(uy_transmitted__33)
);

InternalsBlock_Reflector pipeReg32(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__31),
.i_uz2(uz2__31),
.i_oneMinusUz_2(oneMinusUz_2__31),
.i_sa2_2(sa2_2__31),
.i_uz2_2(uz2_2__31),
.i_ux_transmitted(ux_transmitted__31),
.i_uy_transmitted(uy_transmitted__31),

 //outputs

.o_uz_2(uz_2__32),
.o_uz2(uz2__32),
.o_oneMinusUz_2(oneMinusUz_2__32),
.o_sa2_2(sa2_2__32),
.o_uz2_2(uz2_2__32),
.o_ux_transmitted(ux_transmitted__32),
.o_uy_transmitted(uy_transmitted__32)
);

InternalsBlock_Reflector pipeReg31(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__30),
.i_uz2(uz2__30),
.i_oneMinusUz_2(oneMinusUz_2__30),
.i_sa2_2(sa2_2__30),
.i_uz2_2(uz2_2__30),
.i_ux_transmitted(ux_transmitted__30),
.i_uy_transmitted(uy_transmitted__30),

 //outputs

.o_uz_2(uz_2__31),
.o_uz2(uz2__31),
.o_oneMinusUz_2(oneMinusUz_2__31),
.o_sa2_2(sa2_2__31),
.o_uz2_2(uz2_2__31),
.o_ux_transmitted(ux_transmitted__31),
.o_uy_transmitted(uy_transmitted__31)
);

InternalsBlock_Reflector pipeReg30(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__29),
.i_uz2(uz2__29),
.i_oneMinusUz_2(oneMinusUz_2__29),
.i_sa2_2(sa2_2__29),
.i_uz2_2(uz2_2__29),
.i_ux_transmitted(ux_transmitted__29),
.i_uy_transmitted(uy_transmitted__29),

 //outputs

.o_uz_2(uz_2__30),
.o_uz2(uz2__30),
.o_oneMinusUz_2(oneMinusUz_2__30),
.o_sa2_2(sa2_2__30),
.o_uz2_2(uz2_2__30),
.o_ux_transmitted(ux_transmitted__30),
.o_uy_transmitted(uy_transmitted__30)
);

InternalsBlock_Reflector pipeReg29(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__28),
.i_uz2(uz2__28),
.i_oneMinusUz_2(oneMinusUz_2__28),
.i_sa2_2(sa2_2__28),
.i_uz2_2(uz2_2__28),
.i_ux_transmitted(ux_transmitted__28),
.i_uy_transmitted(uy_transmitted__28),

 //outputs

.o_uz_2(uz_2__29),
.o_uz2(uz2__29),
.o_oneMinusUz_2(oneMinusUz_2__29),
.o_sa2_2(sa2_2__29),
.o_uz2_2(uz2_2__29),
.o_ux_transmitted(ux_transmitted__29),
.o_uy_transmitted(uy_transmitted__29)
);

InternalsBlock_Reflector pipeReg28(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__27),
.i_uz2(uz2__27),
.i_oneMinusUz_2(oneMinusUz_2__27),
.i_sa2_2(sa2_2__27),
.i_uz2_2(uz2_2__27),
.i_ux_transmitted(ux_transmitted__27),
.i_uy_transmitted(uy_transmitted__27),

 //outputs

.o_uz_2(uz_2__28),
.o_uz2(uz2__28),
.o_oneMinusUz_2(oneMinusUz_2__28),
.o_sa2_2(sa2_2__28),
.o_uz2_2(uz2_2__28),
.o_ux_transmitted(ux_transmitted__28),
.o_uy_transmitted(uy_transmitted__28)
);

InternalsBlock_Reflector pipeReg27(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__26),
.i_uz2(uz2__26),
.i_oneMinusUz_2(oneMinusUz_2__26),
.i_sa2_2(sa2_2__26),
.i_uz2_2(uz2_2__26),
.i_ux_transmitted(ux_transmitted__26),
.i_uy_transmitted(uy_transmitted__26),

 //outputs

.o_uz_2(uz_2__27),
.o_uz2(uz2__27),
.o_oneMinusUz_2(oneMinusUz_2__27),
.o_sa2_2(sa2_2__27),
.o_uz2_2(uz2_2__27),
.o_ux_transmitted(ux_transmitted__27),
.o_uy_transmitted(uy_transmitted__27)
);

InternalsBlock_Reflector pipeReg26(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__25),
.i_uz2(uz2__25),
.i_oneMinusUz_2(oneMinusUz_2__25),
.i_sa2_2(sa2_2__25),
.i_uz2_2(uz2_2__25),
.i_ux_transmitted(ux_transmitted__25),
.i_uy_transmitted(uy_transmitted__25),

 //outputs

.o_uz_2(uz_2__26),
.o_uz2(uz2__26),
.o_oneMinusUz_2(oneMinusUz_2__26),
.o_sa2_2(sa2_2__26),
.o_uz2_2(uz2_2__26),
.o_ux_transmitted(ux_transmitted__26),
.o_uy_transmitted(uy_transmitted__26)
);

InternalsBlock_Reflector pipeReg25(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__24),
.i_uz2(uz2__24),
.i_oneMinusUz_2(oneMinusUz_2__24),
.i_sa2_2(sa2_2__24),
.i_uz2_2(uz2_2__24),
.i_ux_transmitted(ux_transmitted__24),
.i_uy_transmitted(uy_transmitted__24),

 //outputs

.o_uz_2(uz_2__25),
.o_uz2(uz2__25),
.o_oneMinusUz_2(oneMinusUz_2__25),
.o_sa2_2(sa2_2__25),
.o_uz2_2(uz2_2__25),
.o_ux_transmitted(ux_transmitted__25),
.o_uy_transmitted(uy_transmitted__25)
);

InternalsBlock_Reflector pipeReg24(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__23),
.i_uz2(uz2__23),
.i_oneMinusUz_2(oneMinusUz_2__23),
.i_sa2_2(sa2_2__23),
.i_uz2_2(uz2_2__23),
.i_ux_transmitted(ux_transmitted__23),
.i_uy_transmitted(uy_transmitted__23),

 //outputs

.o_uz_2(uz_2__24),
.o_uz2(uz2__24),
.o_oneMinusUz_2(oneMinusUz_2__24),
.o_sa2_2(sa2_2__24),
.o_uz2_2(uz2_2__24),
.o_ux_transmitted(ux_transmitted__24),
.o_uy_transmitted(uy_transmitted__24)
);

InternalsBlock_Reflector pipeReg23(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__22),
.i_uz2(uz2__22),
.i_oneMinusUz_2(oneMinusUz_2__22),
.i_sa2_2(sa2_2__22),
.i_uz2_2(uz2_2__22),
.i_ux_transmitted(ux_transmitted__22),
.i_uy_transmitted(uy_transmitted__22),

 //outputs

.o_uz_2(uz_2__23),
.o_uz2(uz2__23),
.o_oneMinusUz_2(oneMinusUz_2__23),
.o_sa2_2(sa2_2__23),
.o_uz2_2(uz2_2__23),
.o_ux_transmitted(ux_transmitted__23),
.o_uy_transmitted(uy_transmitted__23)
);

InternalsBlock_Reflector pipeReg22(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__21),
.i_uz2(uz2__21),
.i_oneMinusUz_2(oneMinusUz_2__21),
.i_sa2_2(sa2_2__21),
.i_uz2_2(uz2_2__21),
.i_ux_transmitted(ux_transmitted__21),
.i_uy_transmitted(uy_transmitted__21),

 //outputs

.o_uz_2(uz_2__22),
.o_uz2(uz2__22),
.o_oneMinusUz_2(oneMinusUz_2__22),
.o_sa2_2(sa2_2__22),
.o_uz2_2(uz2_2__22),
.o_ux_transmitted(ux_transmitted__22),
.o_uy_transmitted(uy_transmitted__22)
);

InternalsBlock_Reflector pipeReg21(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__20),
.i_uz2(uz2__20),
.i_oneMinusUz_2(oneMinusUz_2__20),
.i_sa2_2(sa2_2__20),
.i_uz2_2(uz2_2__20),
.i_ux_transmitted(ux_transmitted__20),
.i_uy_transmitted(uy_transmitted__20),

 //outputs

.o_uz_2(uz_2__21),
.o_uz2(uz2__21),
.o_oneMinusUz_2(oneMinusUz_2__21),
.o_sa2_2(sa2_2__21),
.o_uz2_2(uz2_2__21),
.o_ux_transmitted(ux_transmitted__21),
.o_uy_transmitted(uy_transmitted__21)
);

InternalsBlock_Reflector pipeReg20(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__19),
.i_uz2(uz2__19),
.i_oneMinusUz_2(oneMinusUz_2__19),
.i_sa2_2(sa2_2__19),
.i_uz2_2(uz2_2__19),
.i_ux_transmitted(ux_transmitted__19),
.i_uy_transmitted(uy_transmitted__19),

 //outputs

.o_uz_2(uz_2__20),
.o_uz2(uz2__20),
.o_oneMinusUz_2(oneMinusUz_2__20),
.o_sa2_2(sa2_2__20),
.o_uz2_2(uz2_2__20),
.o_ux_transmitted(ux_transmitted__20),
.o_uy_transmitted(uy_transmitted__20)
);

InternalsBlock_Reflector pipeReg19(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__18),
.i_uz2(uz2__18),
.i_oneMinusUz_2(oneMinusUz_2__18),
.i_sa2_2(sa2_2__18),
.i_uz2_2(uz2_2__18),
.i_ux_transmitted(ux_transmitted__18),
.i_uy_transmitted(uy_transmitted__18),

 //outputs

.o_uz_2(uz_2__19),
.o_uz2(uz2__19),
.o_oneMinusUz_2(oneMinusUz_2__19),
.o_sa2_2(sa2_2__19),
.o_uz2_2(uz2_2__19),
.o_ux_transmitted(ux_transmitted__19),
.o_uy_transmitted(uy_transmitted__19)
);

InternalsBlock_Reflector pipeReg18(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__17),
.i_uz2(uz2__17),
.i_oneMinusUz_2(oneMinusUz_2__17),
.i_sa2_2(sa2_2__17),
.i_uz2_2(uz2_2__17),
.i_ux_transmitted(ux_transmitted__17),
.i_uy_transmitted(uy_transmitted__17),

 //outputs

.o_uz_2(uz_2__18),
.o_uz2(uz2__18),
.o_oneMinusUz_2(oneMinusUz_2__18),
.o_sa2_2(sa2_2__18),
.o_uz2_2(uz2_2__18),
.o_ux_transmitted(ux_transmitted__18),
.o_uy_transmitted(uy_transmitted__18)
);

InternalsBlock_Reflector pipeReg17(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__16),
.i_uz2(uz2__16),
.i_oneMinusUz_2(oneMinusUz_2__16),
.i_sa2_2(sa2_2__16),
.i_uz2_2(uz2_2__16),
.i_ux_transmitted(ux_transmitted__16),
.i_uy_transmitted(uy_transmitted__16),

 //outputs

.o_uz_2(uz_2__17),
.o_uz2(uz2__17),
.o_oneMinusUz_2(oneMinusUz_2__17),
.o_sa2_2(sa2_2__17),
.o_uz2_2(uz2_2__17),
.o_ux_transmitted(ux_transmitted__17),
.o_uy_transmitted(uy_transmitted__17)
);
//removed 16

InternalsBlock_Reflector pipeReg15(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__14),
.i_uz2(uz2__14),
.i_oneMinusUz_2(oneMinusUz_2__14),
.i_sa2_2(sa2_2__14),
.i_uz2_2(uz2_2__14),
.i_ux_transmitted(ux_transmitted__14),
.i_uy_transmitted(uy_transmitted__14),

 //outputs

.o_uz_2(uz_2__15),
.o_uz2(uz2__15),
.o_oneMinusUz_2(oneMinusUz_2__15),
.o_sa2_2(sa2_2__15),
.o_uz2_2(uz2_2__15),
.o_ux_transmitted(ux_transmitted__15),
.o_uy_transmitted(uy_transmitted__15)
);

InternalsBlock_Reflector pipeReg14(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__13),
.i_uz2(uz2__13),
.i_oneMinusUz_2(oneMinusUz_2__13),
.i_sa2_2(sa2_2__13),
.i_uz2_2(uz2_2__13),
.i_ux_transmitted(ux_transmitted__13),
.i_uy_transmitted(uy_transmitted__13),

 //outputs

.o_uz_2(uz_2__14),
.o_uz2(uz2__14),
.o_oneMinusUz_2(oneMinusUz_2__14),
.o_sa2_2(sa2_2__14),
.o_uz2_2(uz2_2__14),
.o_ux_transmitted(ux_transmitted__14),
.o_uy_transmitted(uy_transmitted__14)
);

InternalsBlock_Reflector pipeReg13(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__12),
.i_uz2(uz2__12),
.i_oneMinusUz_2(oneMinusUz_2__12),
.i_sa2_2(sa2_2__12),
.i_uz2_2(uz2_2__12),
.i_ux_transmitted(ux_transmitted__12),
.i_uy_transmitted(uy_transmitted__12),

 //outputs

.o_uz_2(uz_2__13),
.o_uz2(uz2__13),
.o_oneMinusUz_2(oneMinusUz_2__13),
.o_sa2_2(sa2_2__13),
.o_uz2_2(uz2_2__13),
.o_ux_transmitted(ux_transmitted__13),
.o_uy_transmitted(uy_transmitted__13)
);

InternalsBlock_Reflector pipeReg12(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__11),
.i_uz2(uz2__11),
.i_oneMinusUz_2(oneMinusUz_2__11),
.i_sa2_2(sa2_2__11),
.i_uz2_2(uz2_2__11),
.i_ux_transmitted(ux_transmitted__11),
.i_uy_transmitted(uy_transmitted__11),

 //outputs

.o_uz_2(uz_2__12),
.o_uz2(uz2__12),
.o_oneMinusUz_2(oneMinusUz_2__12),
.o_sa2_2(sa2_2__12),
.o_uz2_2(uz2_2__12),
.o_ux_transmitted(ux_transmitted__12),
.o_uy_transmitted(uy_transmitted__12)
);

InternalsBlock_Reflector pipeReg11(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__10),
.i_uz2(uz2__10),
.i_oneMinusUz_2(oneMinusUz_2__10),
.i_sa2_2(sa2_2__10),
.i_uz2_2(uz2_2__10),
.i_ux_transmitted(ux_transmitted__10),
.i_uy_transmitted(uy_transmitted__10),

 //outputs

.o_uz_2(uz_2__11),
.o_uz2(uz2__11),
.o_oneMinusUz_2(oneMinusUz_2__11),
.o_sa2_2(sa2_2__11),
.o_uz2_2(uz2_2__11),
.o_ux_transmitted(ux_transmitted__11),
.o_uy_transmitted(uy_transmitted__11)
);

InternalsBlock_Reflector pipeReg10(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__9),
.i_uz2(uz2__9),
.i_oneMinusUz_2(oneMinusUz_2__9),
.i_sa2_2(sa2_2__9),
.i_uz2_2(uz2_2__9),
.i_ux_transmitted(ux_transmitted__9),
.i_uy_transmitted(uy_transmitted__9),

 //outputs

.o_uz_2(uz_2__10),
.o_uz2(uz2__10),
.o_oneMinusUz_2(oneMinusUz_2__10),
.o_sa2_2(sa2_2__10),
.o_uz2_2(uz2_2__10),
.o_ux_transmitted(ux_transmitted__10),
.o_uy_transmitted(uy_transmitted__10)
);

InternalsBlock_Reflector pipeReg9(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__8),
.i_uz2(uz2__8),
.i_oneMinusUz_2(oneMinusUz_2__8),
.i_sa2_2(sa2_2__8),
.i_uz2_2(uz2_2__8),
.i_ux_transmitted(ux_transmitted__8),
.i_uy_transmitted(uy_transmitted__8),

 //outputs

.o_uz_2(uz_2__9),
.o_uz2(uz2__9),
.o_oneMinusUz_2(oneMinusUz_2__9),
.o_sa2_2(sa2_2__9),
.o_uz2_2(uz2_2__9),
.o_ux_transmitted(ux_transmitted__9),
.o_uy_transmitted(uy_transmitted__9)
);

InternalsBlock_Reflector pipeReg8(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__7),
.i_uz2(uz2__7),
.i_oneMinusUz_2(oneMinusUz_2__7),
.i_sa2_2(sa2_2__7),
.i_uz2_2(uz2_2__7),
.i_ux_transmitted(ux_transmitted__7),
.i_uy_transmitted(uy_transmitted__7),

 //outputs

.o_uz_2(uz_2__8),
.o_uz2(uz2__8),
.o_oneMinusUz_2(oneMinusUz_2__8),
.o_sa2_2(sa2_2__8),
.o_uz2_2(uz2_2__8),
.o_ux_transmitted(ux_transmitted__8),
.o_uy_transmitted(uy_transmitted__8)
);

InternalsBlock_Reflector pipeReg7(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__6),
.i_uz2(uz2__6),
.i_oneMinusUz_2(oneMinusUz_2__6),
.i_sa2_2(sa2_2__6),
.i_uz2_2(uz2_2__6),
.i_ux_transmitted(ux_transmitted__6),
.i_uy_transmitted(uy_transmitted__6),

 //outputs

.o_uz_2(uz_2__7),
.o_uz2(uz2__7),
.o_oneMinusUz_2(oneMinusUz_2__7),
.o_sa2_2(sa2_2__7),
.o_uz2_2(uz2_2__7),
.o_ux_transmitted(ux_transmitted__7),
.o_uy_transmitted(uy_transmitted__7)
);

InternalsBlock_Reflector pipeReg6(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__5),
.i_uz2(uz2__5),
.i_oneMinusUz_2(oneMinusUz_2__5),
.i_sa2_2(sa2_2__5),
.i_uz2_2(uz2_2__5),
.i_ux_transmitted(ux_transmitted__5),
.i_uy_transmitted(uy_transmitted__5),

 //outputs

.o_uz_2(uz_2__6),
.o_uz2(uz2__6),
.o_oneMinusUz_2(oneMinusUz_2__6),
.o_sa2_2(sa2_2__6),
.o_uz2_2(uz2_2__6),
.o_ux_transmitted(ux_transmitted__6),
.o_uy_transmitted(uy_transmitted__6)
);


//removed 2,3,4,5


//peter m
//  no driver
assign uz_2__0 = 64'b0;
assign uz2__0 = 32'b0;
assign oneMinusUz_2__0 = 0;
assign sa2_2__0 = 0;
assign uz2_2__0 = 64'b0;
assign ux_transmitted__0 = 32'b00000000000000000000000000000000;
assign uy_transmitted__0 = 32'b00000000000000000000000000000000;


InternalsBlock_Reflector pipeReg1(
//Inputs

.clock(clock),
.reset(reset),
.enable(enable),
.i_uz_2(uz_2__0),
.i_uz2(uz2__0),
.i_oneMinusUz_2(oneMinusUz_2__0),
.i_sa2_2(sa2_2__0),
.i_uz2_2(uz2_2__0),
.i_ux_transmitted(ux_transmitted__0),
.i_uy_transmitted(uy_transmitted__0),

 //outputs

.o_uz_2(uz_2__1),
.o_uz2(uz2__1),
.o_oneMinusUz_2(oneMinusUz_2__1),
.o_sa2_2(sa2_2__1),
.o_uz2_2(uz2_2__1),
.o_ux_transmitted(ux_transmitted__1),
.o_uy_transmitted(uy_transmitted__1)
);




//-------------SYNCHRONOUS LOGIC----------------------
//
//
//
//
//
//
//
//
//
//
//
//
//This is the end of the generate statement, and the beginning of the
//synchronous logic.  On the clock event, the outputs calcu`LATed from
//this block are put on the output pins for reading (registered
//outputs, as per the convention).

//Assign outputs from block on positive clock edge.
always @ (posedge clock) begin
	if(reset_new) begin
		//Reset internal non-pipelined registers here.
		ux_reflector	<= 32'h00000000;
		uy_reflector	<= 32'h00000000;
		uz_reflector	<= 32'h7FFFFFFF;
		layer_reflector	<= 3'b001;
		dead_reflector	<= 1'b1;
	end else if (enable) begin
		ux_reflector	<= new_ux;
		uy_reflector	<= new_uy;
		uz_reflector	<= new_uz;
		layer_reflector <= new_layer;
		dead_reflector	<= new_dead;
	end	
end


//-------------ASYNCHRONOUS LOGIC----------------------
//
//
//
//
//
//
//
//
//
//
//
//
//This is where the asynchronous logic takes place.  Things that
//occur here include setting up wiring to send to the multipliers,
//and square root unit.  Also, products brought in from the wrapper 
//are placed on the appropriate wires for placement in the pipeline.

//-------------MUXES for SYNCHRONOUS LOGIC--------
always @ (i_layer36 or downCritAngle_0 or upCritAngle_0 or
						downCritAngle_1 or upCritAngle_1 or
						downCritAngle_2 or upCritAngle_2 or
						downCritAngle_3 or upCritAngle_3 or
						downCritAngle_4 or upCritAngle_4) begin
	case (i_layer36)
	1:begin
		downCritAngle		=	downCritAngle_0;
		upCritAngle		=	upCritAngle_0;
	end
	2:begin
		downCritAngle		=	downCritAngle_1;
		upCritAngle		=	upCritAngle_1;
	end
	3:begin
		downCritAngle		=	downCritAngle_2;
		upCritAngle		=	upCritAngle_2;
	end
	4:begin
		downCritAngle		=	downCritAngle_3;
		upCritAngle		=	upCritAngle_3;
	end
	5:begin
		downCritAngle		=	downCritAngle_4;
		upCritAngle		=	upCritAngle_4;
	end
	//Should never occur
	default:begin
		downCritAngle		=	downCritAngle_0;
		upCritAngle		=	upCritAngle_0;
	end
	endcase
end

always @ (i_uz35 or i_layer35) begin
	negUz = -i_uz35;
	case (i_uz35[31])
	0: begin
		case (i_layer35)
			1:	fresIndex		=	{3'b000, i_uz35[30:24]};
			2:	fresIndex		=	{3'b001, i_uz35[30:24]};
			3:	fresIndex		=	{3'b010, i_uz35[30:24]};
			4:	fresIndex		=	{3'b011, i_uz35[30:24]};
			5:	fresIndex		=	{3'b100, i_uz35[30:24]};
			//Should never occur
			default: fresIndex		=	{3'b000, i_uz35[30:24]};
		endcase
	end
	1: begin
		case (i_layer35)
			1:	fresIndex		=	{3'b000, negUz[30:24]};
			2:	fresIndex		=	{3'b001, negUz[30:24]};
			3:	fresIndex		=	{3'b010, negUz[30:24]};
			4:	fresIndex		=	{3'b011, negUz[30:24]};
			5:	fresIndex		=	{3'b100, negUz[30:24]};
			//Should never occur
			default: fresIndex		=	{3'b000, negUz[30:24]};
		endcase
	end
	endcase
		
end


//-------------OPERAND SETUP----------------------


//NAMING CONVENTION:
//opX_Y_Z, op stands for operand, X stands for the multiplication number for
//that clock cycle, Y stands for the clock cycle, Z is either 1 or 2 for the
//first or second operand for this multiply
//
//COMMENTING CONVENTIONS:
//CC X means that the values being calcu`LATed will be ready for the Xth register
//location, where 0 is the register prior to any calcu`LATions being done, 1 is
//after the 1st clock cycle of calcu`LATion, etc.

//CC 2
assign	op1_2_1						=	i_uz1;
assign	op1_2_2						=	i_uz1;

//CC 3
//SUBTRACTION, see math results

//CC 4
always @ (i_uz3 or i_layer3 or down_niOverNt_2_1 or up_niOverNt_2_1 or
								down_niOverNt_2_2 or up_niOverNt_2_2 or
								down_niOverNt_2_3 or up_niOverNt_2_3 or
								down_niOverNt_2_4 or up_niOverNt_2_4 or
								down_niOverNt_2_5 or up_niOverNt_2_5) begin
	case (i_uz3[31])
	//uz >= 0
	0:begin
		case (i_layer3)
			1: op1_4_1			=	{down_niOverNt_2_1[63], down_niOverNt_2_1[61:31]};
			2: op1_4_1			=	{down_niOverNt_2_2[63], down_niOverNt_2_2[61:31]};
			3: op1_4_1			=	{down_niOverNt_2_3[63], down_niOverNt_2_3[61:31]};
			4: op1_4_1			=	{down_niOverNt_2_4[63], down_niOverNt_2_4[61:31]};
			5: op1_4_1			=	{down_niOverNt_2_5[63], down_niOverNt_2_5[61:31]};
			default: op1_4_1		=	{down_niOverNt_2_1[63], down_niOverNt_2_1[61:31]};
		endcase
	end
	//uz < 0
	1:begin
		case (i_layer3)
			1: op1_4_1			=	{up_niOverNt_2_1[63], up_niOverNt_2_1[61:31]};
			2: op1_4_1			=	{up_niOverNt_2_2[63], up_niOverNt_2_2[61:31]};
			3: op1_4_1			=	{up_niOverNt_2_3[63], up_niOverNt_2_3[61:31]};
			4: op1_4_1			=	{up_niOverNt_2_4[63], up_niOverNt_2_4[61:31]};
			5: op1_4_1			=	{up_niOverNt_2_5[63], up_niOverNt_2_5[61:31]};
			default: op1_4_1		=	{up_niOverNt_2_1[63], up_niOverNt_2_1[61:31]};
		endcase
	end
	endcase
end

assign	op1_4_2						=	{oneMinusUz_2__3[63], oneMinusUz_2__3[61:31]};

//CC 5
//SUBTRACTION, see math results

//CC `SQRT+5 -- Started in CC 6
assign	sqrtOperand1_6					=	uz2_2__5;

//CC `SQRT+`DIV+6 -- Line up with Scatterer.
assign	op1_36_1					=	i_ux35;

always @ (i_uz35 or i_layer35 or down_niOverNt_1 or up_niOverNt_1 or
								down_niOverNt_2 or up_niOverNt_2 or
								down_niOverNt_3 or up_niOverNt_3 or
								down_niOverNt_4 or up_niOverNt_4 or
								down_niOverNt_5 or up_niOverNt_5) begin
	case (i_uz35[31])
	0: begin//uz >= 0
		case (i_layer35)
			1:begin	
				op1_36_2		=	down_niOverNt_1;
				op2_36_2		=	down_niOverNt_1;
			end
			2:begin	
				op1_36_2		=	down_niOverNt_2;
				op2_36_2		=	down_niOverNt_2;
			end
			3:begin	
				op1_36_2		=	down_niOverNt_3;
				op2_36_2		=	down_niOverNt_3;
			end
			4:begin	
				op1_36_2		=	down_niOverNt_4;
				op2_36_2		=	down_niOverNt_4;
			end
			5:begin	
				op1_36_2		=	down_niOverNt_5;
				op2_36_2		=	down_niOverNt_5;
			end
			default:begin
				op1_36_2		=	down_niOverNt_1;
				op2_36_2		=	down_niOverNt_1;
			end
		endcase
	end
	1: begin//uz < 0
		case (i_layer35)
			1:begin
				op1_36_2		=	up_niOverNt_1;
				op2_36_2		=	up_niOverNt_1;
			end
			2:begin
				op1_36_2		=	up_niOverNt_2;
				op2_36_2		=	up_niOverNt_2;
			end
			3:begin
				op1_36_2		=	up_niOverNt_3;
				op2_36_2		=	up_niOverNt_3;
			end
			4:begin
				op1_36_2		=	up_niOverNt_4;
				op2_36_2		=	up_niOverNt_4;
			end
			5:begin
				op1_36_2		=	up_niOverNt_5;
				op2_36_2		=	up_niOverNt_5;
			end
			default:begin
				op1_36_2		=	up_niOverNt_1;
				op2_36_2		=	up_niOverNt_1;
			end
		endcase
	end
	endcase
end

assign	op2_36_1					=	i_uy35;





//-------------MATH RESULTS----------------------


//NAMING CONVENTION:
//new_VAR means that the variable named VAR will be stored into the register
//pipeline at the clock cycle indicated by the comments above it.
//
//prod stands for product, quot stands for quotient, `SQRT stands for square root
//prodX_Y means the Xth product which started calcu`LATion at the Yth clock cycle
//Similarly for quot and `SQRTResult.
//
//
//COMMENTING CONVENTIONS:
//CC X means that the values being calcu`LATed will be ready for the Xth register
//location, where 0 is the register prior to any calcu`LATions being done, 1 is
//after the 1st clock cycle of calcu`LATion, etc.


//CC 2
assign new_uz_2						=	prod1_2;

//CC 3
sub_64b		oneMinusUz2_sub(
			.dataa(`INTMAX_2_ref),
			.datab(uz_2__2),
			.result(new_oneMinusUz_2)
		);

//CC 4
//Used to determine whether or not the multiply operation overflowed.
//or U1(overflow1_4, prod1_4[62], prod1_4[61], prod1_4[60], prod1_4[59], prod1_4[58]);
assign overflow1_4 = prod1_4[62]|prod1_4[61]|prod1_4[60]|prod1_4[59]|prod1_4[58];

//Cannot take `SQRT of negative number, that is why prod1_4[58] must be 0.

													//sign		//data		//padding
assign	new_sa2_2					=	(overflow1_4 == 1)? `INTMAX_2_ref	:	{prod1_4[63], prod1_4[58:0], 4'h0};

//5th CC
sub_64b		uz2_2_sub(
			.dataa(`INTMAX_2_ref),
			.datab(sa2_2__4),
			.result(new_uz2_2)
		);

//CC `SQRT+5
assign new_uz2						= sqrtResult1_6;

//CC `SQRT+`DIV+6 -- Line up with Scatterer.


//Used to determine whether or not the multiply operation overflowed.
//or U2(toAnd1_36_1, prod1_36[62], prod1_36[61], prod1_36[60]);
assign toAnd1_36_1 = prod1_36[62]|prod1_36[61]|prod1_36[60];
//Used to determine whether or not the multiply operation overflowed in the negative direction.
//or U3(toAnd1_36_2, ~prod1_36[62], ~prod1_36[61], ~prod1_36[60]);
assign toAnd1_36_2 = ~prod1_36[62]|~prod1_36[61]|~prod1_36[60];

//and U4(overflow1_36, ~prod1_36[63], toAnd1_36_1);
assign overflow1_36 = ~prod1_36[63] & toAnd1_36_1;
//and U5(negOverflow1_36, prod1_36[63], toAnd1_36_2);
assign negOverflow1_36 = prod1_36[63] & toAnd1_36_2;


//Used to determine whether or not the multiply operation overflowed.
//or U6(toAnd2_36_1, prod2_36[62], prod2_36[61], prod2_36[60]);
assign toAnd2_36_1 = prod2_36[62]|prod2_36[61]|prod2_36[60];
//Used to determine whether or not the multiply operation overflowed in the negative direction.
//or U7(toAnd2_36_2, ~prod2_36[62], ~prod2_36[61], ~prod2_36[60]);
assign toAnd2_36_2 = ~prod2_36[62]|~prod2_36[61]|~prod2_36[60];


//and U8(overflow2_36, ~prod2_36[63], toAnd2_36_1);
assign overflow2_36 = ~prod2_36[63] & toAnd2_36_1;
//and U9(negOverflow2_36, prod2_36[63], toAnd2_36_2);
assign negOverflow2_36 = prod2_36[63] & toAnd2_36_2;

always @ (overflow1_36 or negOverflow1_36 or prod1_36 or
		  overflow2_36 or negOverflow2_36 or prod2_36) begin
	case ({overflow1_36, negOverflow1_36})
	0:	new_ux_transmitted = {prod1_36[63:63], prod1_36[59:29]};
	1:	new_ux_transmitted = `INTMIN;
	2:	new_ux_transmitted = `INTMAX;
	//Should never occur
	3:	new_ux_transmitted = {prod1_36[63:63], prod1_36[59:29]};
	endcase
	
	case ({overflow2_36, negOverflow2_36})
	
	0:	new_uy_transmitted = {prod2_36[63:63], prod2_36[59:29]};
	1:	new_uy_transmitted = `INTMIN;
	2:	new_uy_transmitted = `INTMAX;
	//Should never occur
	3:	new_uy_transmitted = {prod2_36[63:63], prod2_36[59:29]};
	endcase
end


//-------------FINAL CALCU`LATED VALUES----------------------
//
//
//
//
//
//
//
//
//
//
//
//
//
//
always @ (i_uz36 or downCritAngle or upCritAngle or down_rFresnel or i_ux36 or
			i_uy36 or i_layer36 or i_dead36 or rnd or up_rFresnel or ux_transmitted__37 or 
			uy_transmitted__37 or uz2__37) begin
	//REFLECTED -- Due to total internal reflection while moving down
	if (~i_uz36[31] && i_uz36 <= downCritAngle) begin
		new_ux		= i_ux36;
		new_uy		= i_uy36;
		new_uz		= -i_uz36;
		new_layer	= i_layer36;
		new_dead	= i_dead36;
	//REFLECTED -- Due to total internal reflection while moving up
	end else if (i_uz36[31] && -i_uz36 <= upCritAngle) begin
		new_ux		= i_ux36;
		new_uy		= i_uy36;
		new_uz		= -i_uz36;
		new_layer	= i_layer36;
		new_dead	= i_dead36;
	//REFLECTED -- Due to random number being too small while moving down
	end else if (~i_uz36[31] && rnd <= down_rFresnel) begin
		new_ux		= i_ux36;
		new_uy		= i_uy36;
		new_uz		= -i_uz36;
		new_layer	= i_layer36;
		new_dead	= i_dead36;
	//REFLECTED -- Due to random number being too small while moving up
	end else if (i_uz36[31] && rnd <= up_rFresnel) begin
		new_ux		= i_ux36;
		new_uy		= i_uy36;
		new_uz		= -i_uz36;
		new_layer	= i_layer36;
		new_dead	= i_dead36;
	//TRANSMITTED
	end else begin
		new_ux		= ux_transmitted__37;
		new_uy		= uy_transmitted__37;
		case (i_uz36[31])
		0:begin//uz >= 0
			if (i_layer36 == 5) begin
				new_layer	= 3'h5;
				new_dead	= 1'b1;
			end else begin
				new_layer	= i_layer36+3'h1;
				new_dead	= i_dead36;
			end
			new_uz			= uz2__37;
		end
		1:begin//uz < 0
			if (i_layer36 == 1) begin
				new_layer	= 3'h1;
				new_dead	= 1'b1;
			end else begin
				new_layer	= i_layer36-3'h1;
				new_dead	= i_dead36;
			end
			new_uz			= -uz2__37;
		end
		endcase
	
	end
end

endmodule
module sub_64b (dataa, datab, result);

	input [63:0] dataa;
	input [63:0] datab;
	output [63:0] result;

	assign result = dataa - datab;

endmodule
module InternalsBlock_Reflector(
	//Inputs
	clock,
	reset,
	enable,

	i_uz_2,			//uz^2
	i_uz2,			//new uz, should the photon transmit to new layer
	i_oneMinusUz_2, 	//(1-uz)^2
	i_sa2_2,		//(sine of angle 2)^2 (uz2 = cosine of angle 2).
	i_uz2_2,		//(uz2)^2, new uz squared.
	i_ux_transmitted,	//new value for ux, if the photon transmits to the next layer
	i_uy_transmitted,	//new value for uy, if the photon transmits to the next layer
	
	//Outputs
	o_uz_2,
	o_uz2,
	o_oneMinusUz_2,
	o_sa2_2,
	o_uz2_2,
	o_ux_transmitted,
	o_uy_transmitted
	);

input					clock;
input					reset;
input					enable;

input		[63:0]		i_uz_2;
input		[31:0]		i_uz2;
input		[63:0]		i_oneMinusUz_2;
input		[63:0]		i_sa2_2;
input		[63:0]		i_uz2_2;
input		[31:0]		i_ux_transmitted;
input		[31:0]		i_uy_transmitted;

output		[63:0]		o_uz_2;
output		[31:0]		o_uz2;
output		[63:0]		o_oneMinusUz_2;
output		[63:0]		o_sa2_2;
output		[63:0]		o_uz2_2;
output		[31:0]		o_ux_transmitted;
output		[31:0]		o_uy_transmitted;


wire					clock;
wire					reset;
wire					enable;

wire		[63:0]		i_uz_2;
wire		[31:0]		i_uz2;
wire		[63:0]		i_oneMinusUz_2;
wire		[63:0]		i_sa2_2;
wire		[63:0]		i_uz2_2;
wire		[31:0]		i_ux_transmitted;
wire		[31:0]		i_uy_transmitted;


reg		[63:0]		o_uz_2;
reg		[31:0]		o_uz2;
reg		[63:0]		o_oneMinusUz_2;
reg		[63:0]		o_sa2_2;
reg		[63:0]		o_uz2_2;
reg		[31:0]		o_ux_transmitted;
reg		[31:0]		o_uy_transmitted;



always @ (posedge clock)
	if(reset) begin
		o_uz_2					<= 64'h3FFFFFFFFFFFFFFF;
		o_uz2					<= 32'h7FFFFFFF;
		o_oneMinusUz_2				<= 64'h0000000000000000;
		o_sa2_2					<= 64'h0000000000000000;
		o_uz2_2					<= 64'h3FFFFFFFFFFFFFFF;
		o_ux_transmitted			<= 32'h00000000;
		o_uy_transmitted			<= 32'h00000000;
	end else if(enable) begin
		o_uz_2					<= i_uz_2;
		o_uz2					<= i_uz2;
		o_oneMinusUz_2				<= i_oneMinusUz_2;
		o_sa2_2					<= i_sa2_2;
		o_uz2_2					<= i_uz2_2;
		o_ux_transmitted			<= i_ux_transmitted;
		o_uy_transmitted			<= i_uy_transmitted;
	end
endmodule
