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

module ScattererReflectorWrapper (
	//Inputs
	clock,
	reset,
	enable,
	//MEMORY WRAPPER

		//Inputs
		
		//Photon values
		i_uz1_pipeWrapper,
		i_hit2_pipeWrapper,
		i_ux3_pipeWrapper,
		i_uz3_pipeWrapper,
		i_layer3_pipeWrapper,
		i_hit4_pipeWrapper,
		i_hit6_pipeWrapper,
		i_hit16_pipeWrapper,
		i_layer31_pipeWrapper,
		i_uy32_pipeWrapper,
		i_uz32_pipeWrapper,
		i_hit33_pipeWrapper,
		i_ux33_pipeWrapper,
		i_uy33_pipeWrapper,
		i_hit34_pipeWrapper,
		i_ux35_pipeWrapper,
		i_uy35_pipeWrapper,
		i_uz35_pipeWrapper,
		i_layer35_pipeWrapper,
		i_hit36_pipeWrapper,
		i_ux36_pipeWrapper,
		i_uy36_pipeWrapper,
		i_uz36_pipeWrapper,
		i_layer36_pipeWrapper,
		i_dead36_pipeWrapper,


		//Memory Interface
			//Inputs
		rand2,
		rand3,
		rand5,
		sint,
		cost,
		up_rFresnel,
		down_rFresnel,
			//Outputs
		tindex,
		fresIndex,
		
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
		
		//Outputs
		ux_scatterer,
		uy_scatterer,
		uz_scatterer,
		
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
//Assign values to parameters used later in the program.
	
//parameter INTMAX_2 = 64'h3FFFFFFF00000001;
//The above parameter is never used in the ScattererReflectorWrapper module itself
	
	
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


input				clock;
input				reset;
input				enable;
input	[2:0]			i_layer31_pipeWrapper;



input	[31:0]			i_uz1_pipeWrapper;
input				i_hit2_pipeWrapper;
input	[31:0]			i_ux3_pipeWrapper;
input	[31:0]			i_uz3_pipeWrapper;
input	[2:0]			i_layer3_pipeWrapper;
input				i_hit4_pipeWrapper;
input				i_hit6_pipeWrapper;
input				i_hit16_pipeWrapper;
input	[31:0]			i_uy32_pipeWrapper;
input	[31:0]			i_uz32_pipeWrapper;
input				i_hit33_pipeWrapper;
input	[31:0]			i_ux33_pipeWrapper;
input	[31:0]			i_uy33_pipeWrapper;
input				i_hit34_pipeWrapper;
input	[31:0]			i_ux35_pipeWrapper;
input	[31:0]			i_uy35_pipeWrapper;
input	[31:0]			i_uz35_pipeWrapper;
input	[2:0]			i_layer35_pipeWrapper;
input				i_hit36_pipeWrapper;
input	[31:0]			i_ux36_pipeWrapper;
input	[31:0]			i_uy36_pipeWrapper;
input	[31:0]			i_uz36_pipeWrapper;
input	[2:0]			i_layer36_pipeWrapper;
input				i_dead36_pipeWrapper;


//Memory Interface
input	[31:0]			rand2;
input	[31:0]			rand3;
input	[31:0]			rand5;
input	[31:0]			sint;
input	[31:0]			cost;
input	[31:0]			up_rFresnel;
input	[31:0]			down_rFresnel;

output	[12:0]			tindex;
output	[9:0]			fresIndex;


//Constants
input	[31:0]			down_niOverNt_1;
input	[31:0]			down_niOverNt_2;
input	[31:0]			down_niOverNt_3;
input	[31:0]			down_niOverNt_4;
input	[31:0]			down_niOverNt_5;
input	[31:0]			up_niOverNt_1;
input	[31:0]			up_niOverNt_2;
input	[31:0]			up_niOverNt_3;
input	[31:0]			up_niOverNt_4;
input	[31:0]			up_niOverNt_5;
input	[63:0]			down_niOverNt_2_1;
input	[63:0]			down_niOverNt_2_2;
input	[63:0]			down_niOverNt_2_3;
input	[63:0]			down_niOverNt_2_4;
input	[63:0]			down_niOverNt_2_5;
input	[63:0]			up_niOverNt_2_1;
input	[63:0]			up_niOverNt_2_2;
input	[63:0]			up_niOverNt_2_3;
input	[63:0]			up_niOverNt_2_4;
input	[63:0]			up_niOverNt_2_5;
input	[31:0]			downCritAngle_0;
input	[31:0]			downCritAngle_1;
input	[31:0]			downCritAngle_2;
input	[31:0]			downCritAngle_3;
input	[31:0]			downCritAngle_4;
input	[31:0]			upCritAngle_0;
input	[31:0]			upCritAngle_1;
input	[31:0]			upCritAngle_2;
input	[31:0]			upCritAngle_3;
input	[31:0]			upCritAngle_4;


output	[31:0]			ux_scatterer;
output	[31:0]			uy_scatterer;
output	[31:0]			uz_scatterer;
output	[31:0]			ux_reflector;
output	[31:0]			uy_reflector;
output	[31:0]			uz_reflector;
output	[2:0]			layer_reflector;
output				dead_reflector;




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
wire				clock;
wire				reset;
wire				enable;

wire	[2:0]			i_layer31_pipeWrapper;

wire	[31:0]			i_uz1_pipeWrapper;
wire				i_hit2_pipeWrapper;
wire	[31:0]			i_ux3_pipeWrapper;
wire	[31:0]			i_uz3_pipeWrapper;
wire	[2:0]			i_layer3_pipeWrapper;
wire				i_hit4_pipeWrapper;
wire				i_hit6_pipeWrapper;
wire				i_hit16_pipeWrapper;
wire	[31:0]			i_uy32_pipeWrapper;
wire	[31:0]			i_uz32_pipeWrapper;
wire				i_hit33_pipeWrapper;
wire	[31:0]			i_ux33_pipeWrapper;
wire	[31:0]			i_uy33_pipeWrapper;
wire				i_hit34_pipeWrapper;
wire	[31:0]			i_ux35_pipeWrapper;
wire	[31:0]			i_uy35_pipeWrapper;
wire	[31:0]			i_uz35_pipeWrapper;
wire	[2:0]			i_layer35_pipeWrapper;
wire				i_hit36_pipeWrapper;
wire	[31:0]			i_ux36_pipeWrapper;
wire	[31:0]			i_uy36_pipeWrapper;
wire	[31:0]			i_uz36_pipeWrapper;
wire	[2:0]			i_layer36_pipeWrapper;
wire				i_dead36_pipeWrapper;

wire	[9:0]			pindex;
wire	[12:0]			tindex;
wire	[31:0]			rand2;
wire	[31:0]			rand3;
wire	[31:0]			rand5;


//Constants
wire	[31:0]			down_niOverNt_1;
wire	[31:0]			down_niOverNt_2;
wire	[31:0]			down_niOverNt_3;
wire	[31:0]			down_niOverNt_4;
wire	[31:0]			down_niOverNt_5;
wire	[31:0]			up_niOverNt_1;
wire	[31:0]			up_niOverNt_2;
wire	[31:0]			up_niOverNt_3;
wire	[31:0]			up_niOverNt_4;
wire	[31:0]			up_niOverNt_5;
wire	[63:0]			down_niOverNt_2_1;
wire	[63:0]			down_niOverNt_2_2;
wire	[63:0]			down_niOverNt_2_3;
wire	[63:0]			down_niOverNt_2_4;
wire	[63:0]			down_niOverNt_2_5;
wire	[63:0]			up_niOverNt_2_1;
wire	[63:0]			up_niOverNt_2_2;
wire	[63:0]			up_niOverNt_2_3;
wire	[63:0]			up_niOverNt_2_4;
wire	[63:0]			up_niOverNt_2_5;
wire	[31:0]			downCritAngle_0;
wire	[31:0]			downCritAngle_1;
wire	[31:0]			downCritAngle_2;
wire	[31:0]			downCritAngle_3;
wire	[31:0]			downCritAngle_4;
wire	[31:0]			upCritAngle_0;
wire	[31:0]			upCritAngle_1;
wire	[31:0]			upCritAngle_2;
wire	[31:0]			upCritAngle_3;
wire	[31:0]			upCritAngle_4;

//Scatterer, final calculated values
wire	[31:0]			ux_scatterer;
wire	[31:0]			uy_scatterer;
wire	[31:0]			uz_scatterer;
wire	[31:0]			ux_reflector;
wire	[31:0]			uy_reflector;
wire	[31:0]			uz_reflector;
wire	[2:0]			layer_reflector;
wire				dead_reflector;


//Mathematics results signals
wire	[63:0]			prod1_2;
wire	[63:0]			prod1_4;
wire	[31:0]			sqrtResult1_6;
//wire	[32:0]			sqrtRemainder; //not necessary, not used except as dummy var in sqrt.
wire	[63:0]			prod1_33;
wire	[63:0]			prod2_33;
wire	[63:0]			prod3_33;
wire	[63:0]			prod1_34;
wire	[63:0]			prod2_34;
wire	[63:0]			prod3_34;
wire	[63:0]			prod4_34;
wire	[63:0]			quot1_16;
wire	[31:0]			divRemainder;
wire	[63:0]			prod1_36;
wire	[63:0]			prod2_36;
wire	[63:0]			prod3_36;
wire	[63:0]			prod4_36;
wire	[63:0]			prod5_36;
wire	[63:0]			prod6_36;

//Scatterer Operands
wire	[31:0]			op1_2_1_scatterer;
wire	[31:0]			op1_2_2_scatterer;
wire	[31:0]			op1_4_1_scatterer;
wire	[31:0]			op1_4_2_scatterer;
wire	[63:0]			sqrtOperand1_6_scatterer;
wire	[63:0]			divNumerator1_16_scatterer;
wire	[31:0]			divDenominator1_16_scatterer;
wire	[31:0]			op1_33_1_scatterer;
wire	[31:0]			op1_33_2_scatterer;
wire	[31:0]			op2_33_1_scatterer;
wire	[31:0]			op2_33_2_scatterer;
wire	[31:0]			op3_33_1_scatterer;
wire	[31:0]			op3_33_2_scatterer;
wire	[31:0]			op1_34_1_scatterer;
wire	[31:0]			op1_34_2_scatterer;
wire	[31:0]			op2_34_1_scatterer;
wire	[31:0]			op2_34_2_scatterer;
wire	[31:0]			op3_34_1_scatterer;
wire	[31:0]			op3_34_2_scatterer;
wire	[31:0]			op4_34_1_scatterer;
wire	[31:0]			op4_34_2_scatterer;
wire	[31:0]			op1_36_1_scatterer;
wire	[31:0]			op1_36_2_scatterer;
wire	[31:0]			op2_36_1_scatterer;
wire	[31:0]			op2_36_2_scatterer;
wire	[31:0]			op3_36_1_scatterer;
wire	[31:0]			op3_36_2_scatterer;
wire	[31:0]			op4_36_1_scatterer;
wire	[31:0]			op4_36_2_scatterer;
wire	[31:0]			op5_36_1_scatterer;
wire	[31:0]			op5_36_2_scatterer;
wire	[31:0]			op6_36_1_scatterer;
wire	[31:0]			op6_36_2_scatterer;


//Reflector Operands
wire	[31:0]			op1_2_1_reflector;
wire	[31:0]			op1_2_2_reflector;
wire	[31:0]			op1_4_1_reflector;
wire	[31:0]			op1_4_2_reflector;
wire	[63:0]			sqrtOperand1_6_reflector;
wire	[31:0]			op1_36_1_reflector;
wire	[31:0]			op1_36_2_reflector;
wire	[31:0]			op2_36_1_reflector;
wire	[31:0]			op2_36_2_reflector;




//Operands entering the multipliers, divider, and sqrt
wire	[31:0]			op1_2_1;
wire	[31:0]			op1_2_2;
wire	[31:0]			op1_4_1;
wire	[31:0]			op1_4_2;
wire	[63:0]			sqrtOperand1_6;
wire	[63:0]			divNumerator1_16;
wire	[31:0]			divDenominator1_16;
wire	[31:0]			op1_33_1;
wire	[31:0]			op1_33_2;
wire	[31:0]			op2_33_1;
wire	[31:0]			op2_33_2;
wire	[31:0]			op3_33_1;
wire	[31:0]			op3_33_2;
wire	[31:0]			op1_34_1;
wire	[31:0]			op1_34_2;
wire	[31:0]			op2_34_1;
wire	[31:0]			op2_34_2;
wire	[31:0]			op3_34_1;
wire	[31:0]			op3_34_2;
wire	[31:0]			op4_34_1;
wire	[31:0]			op4_34_2;
wire	[31:0]			op1_36_1;
wire	[31:0]			op1_36_2;
wire	[31:0]			op2_36_1;
wire	[31:0]			op2_36_2;
wire	[31:0]			op3_36_1;
wire	[31:0]			op3_36_2;
wire	[31:0]			op4_36_1;
wire	[31:0]			op4_36_2;
wire	[31:0]			op5_36_1;
wire	[31:0]			op5_36_2;
wire	[31:0]			op6_36_1;
wire	[31:0]			op6_36_2;


reg	[2:0]			layerMinusOne;

wire	[31:0]			sint;
wire	[31:0]			cost;
wire	[31:0]			sinp;
wire	[31:0]			cosp;

wire	[31:0]			up_rFresnel;
wire	[31:0]			down_rFresnel;
wire	[9:0]			fresIndex;



//Need this to deal with 'unused' inputs for ODIN II
wire bigOr;
assign bigOr = i_hit16_pipeWrapper|i_hit33_pipeWrapper|i_hit34_pipeWrapper|
					rand2[31]|rand2[30]|rand2[29]|rand2[28]|rand2[27]|rand2[26]|
					rand2[25]|rand2[24]|rand2[23]|rand2[22]|rand2[21]|rand2[20]|
					rand2[19]|rand2[18]|rand2[17]|rand2[16]|rand2[15]|rand2[14]|
					rand2[13]|rand2[12]|rand2[11]|rand2[10]|
					rand3[31]|rand3[30]|rand3[29]|rand3[28]|rand3[27]|rand3[26]|
					rand3[25]|rand3[24]|rand3[23]|rand3[22]|rand3[21]|rand3[20]|
					rand3[19]|rand3[18]|rand3[17]|rand3[16]|rand3[15]|rand3[14]|
					rand3[13]|rand3[12]|rand3[11]|rand3[10]|
					rand5[31]|(1'b1);
wire reset_new;
assign reset_new = reset & bigOr;


//MUX for sending in indices for memory.
always @ (i_layer31_pipeWrapper) begin
	case (i_layer31_pipeWrapper)
		3'b001: layerMinusOne = 0;
		3'b010: layerMinusOne = 1;
		3'b011: layerMinusOne = 2;
		3'b100: layerMinusOne = 3;
		3'b101: layerMinusOne = 4;
		default: layerMinusOne = 0;
	endcase
end

assign tindex = {layerMinusOne, rand2[9:0]};
assign pindex = rand3[9:0];


//Arbitrarily decide on values of sine and cosine for now, should be memory lookups
Memory_Wrapper	memories(
					//INPUTS
					.clock(clock),
					//.reset(reset), //Unused. ODIN II complained.
					.pindex(pindex),
					//OUTPUTS
					.sinp(sinp),
					.cosp(cosp)
				);


Scatterer scatterer_0 (
			.clock(clock),
			.reset(reset_new), //so pins are used
			.enable(enable),
			//Photon values
			.i_uz1(i_uz1_pipeWrapper),
			.i_ux3(i_ux3_pipeWrapper),
			.i_uz3(i_uz3_pipeWrapper),
			.i_uy32(i_uy32_pipeWrapper),
			.i_uz32(i_uz32_pipeWrapper),
			.i_ux33(i_ux33_pipeWrapper),
			.i_uy33(i_uy33_pipeWrapper),
			.i_ux35(i_ux35_pipeWrapper),
			.i_uy35(i_uy35_pipeWrapper),
			.i_uz35(i_uz35_pipeWrapper),
			.i_uz36(i_uz36_pipeWrapper),
			//Mathematics Results
			.prod1_2(prod1_2),
			.prod1_4({prod1_4[63:63], prod1_4[61:31]}),
			.sqrtResult1_6(sqrtResult1_6),
			.prod1_33({prod1_33[63:63], prod1_33[61:31]}),
			.prod2_33({prod2_33[63:63], prod2_33[61:31]}),
			.prod3_33({prod3_33[63:63], prod3_33[61:31]}),
			.prod1_34({prod1_34[63:63], prod1_34[61:31]}),
			.prod2_34({prod2_34[63:63], prod2_34[61:31]}),
			.prod3_34({prod3_34[63:63], prod3_34[61:31]}),
			.prod4_34({prod4_34[63:63], prod4_34[61:31]}),
			.quot1_16(quot1_16[63:0]),
			.prod1_36(prod1_36[63:0]),
			.prod2_36(prod2_36[63:0]),
			.prod3_36({prod3_36[63:63], prod3_36[61:31]}),
			.prod4_36({prod4_36[63:63], prod4_36[61:31]}),
			.prod5_36({prod5_36[63:63], prod5_36[61:31]}),
			.prod6_36({prod6_36[63:63], prod6_36[61:31]}),
			//Trig from Memory
			.sint_Mem(sint),
			.cost_Mem(cost),
			.sinp_Mem(sinp),
			.cosp_Mem(cosp),
			//Operands for mathematics
			.op1_2_1(op1_2_1_scatterer),
			.op1_2_2(op1_2_2_scatterer),
			.op1_4_1(op1_4_1_scatterer),
			.op1_4_2(op1_4_2_scatterer),
			.sqrtOperand1_6(sqrtOperand1_6_scatterer),
			.divNumerator1_16(divNumerator1_16_scatterer),
			.divDenominator1_16(divDenominator1_16_scatterer),
			.op1_33_1(op1_33_1_scatterer),
			.op1_33_2(op1_33_2_scatterer),
			.op2_33_1(op2_33_1_scatterer),
			.op2_33_2(op2_33_2_scatterer),
			.op3_33_1(op3_33_1_scatterer),
			.op3_33_2(op3_33_2_scatterer),
			.op1_34_1(op1_34_1_scatterer),
			.op1_34_2(op1_34_2_scatterer),
			.op2_34_1(op2_34_1_scatterer),
			.op2_34_2(op2_34_2_scatterer),
			.op3_34_1(op3_34_1_scatterer),
			.op3_34_2(op3_34_2_scatterer),
			.op4_34_1(op4_34_1_scatterer),
			.op4_34_2(op4_34_2_scatterer),
			.op1_36_1(op1_36_1_scatterer),
			.op1_36_2(op1_36_2_scatterer),
			.op2_36_1(op2_36_1_scatterer),
			.op2_36_2(op2_36_2_scatterer),
			.op3_36_1(op3_36_1_scatterer),
			.op3_36_2(op3_36_2_scatterer),
			.op4_36_1(op4_36_1_scatterer),
			.op4_36_2(op4_36_2_scatterer),
			.op5_36_1(op5_36_1_scatterer),
			.op5_36_2(op5_36_2_scatterer),
			.op6_36_1(op6_36_1_scatterer),
			.op6_36_2(op6_36_2_scatterer),
			
			//Final calculated values
			.ux_scatterer(ux_scatterer),
			.uy_scatterer(uy_scatterer),
			.uz_scatterer(uz_scatterer)

		);
		
Reflector reflector_0 (

			//INPUTS
			.clock(clock),
			.reset(reset),
			.enable(enable),
			//Photon values
			.i_uz1(i_uz1_pipeWrapper),
			.i_uz3(i_uz3_pipeWrapper),
			.i_layer3(i_layer3_pipeWrapper),
			.i_ux35(i_ux35_pipeWrapper),
			.i_uy35(i_uy35_pipeWrapper),
			.i_uz35(i_uz35_pipeWrapper),
			.i_layer35(i_layer35_pipeWrapper),
			.i_ux36(i_ux36_pipeWrapper),
			.i_uy36(i_uy36_pipeWrapper),
			.i_uz36(i_uz36_pipeWrapper),
			.i_layer36(i_layer36_pipeWrapper),
			.i_dead36(i_dead36_pipeWrapper),

			//Constants
			.down_niOverNt_1(down_niOverNt_1),
			.down_niOverNt_2(down_niOverNt_2),
			.down_niOverNt_3(down_niOverNt_3),
			.down_niOverNt_4(down_niOverNt_4),
			.down_niOverNt_5(down_niOverNt_5),
			.up_niOverNt_1(up_niOverNt_1),
			.up_niOverNt_2(up_niOverNt_2),
			.up_niOverNt_3(up_niOverNt_3),
			.up_niOverNt_4(up_niOverNt_4),
			.up_niOverNt_5(up_niOverNt_5),
			.down_niOverNt_2_1(down_niOverNt_2_1),
			.down_niOverNt_2_2(down_niOverNt_2_2),
			.down_niOverNt_2_3(down_niOverNt_2_3),
			.down_niOverNt_2_4(down_niOverNt_2_4),
			.down_niOverNt_2_5(down_niOverNt_2_5),
			.up_niOverNt_2_1(up_niOverNt_2_1),
			.up_niOverNt_2_2(up_niOverNt_2_2),
			.up_niOverNt_2_3(up_niOverNt_2_3),
			.up_niOverNt_2_4(up_niOverNt_2_4),
			.up_niOverNt_2_5(up_niOverNt_2_5),
			.downCritAngle_0(downCritAngle_0),
			.downCritAngle_1(downCritAngle_1),
			.downCritAngle_2(downCritAngle_2),
			.downCritAngle_3(downCritAngle_3),
			.downCritAngle_4(downCritAngle_4),
			.upCritAngle_0(upCritAngle_0),
			.upCritAngle_1(upCritAngle_1),
			.upCritAngle_2(upCritAngle_2),
			.upCritAngle_3(upCritAngle_3),
			.upCritAngle_4(upCritAngle_4),

			//Fresnels inputs
			.rnd({1'b0, rand5[30:0]}),
			.up_rFresnel(up_rFresnel),
			.down_rFresnel(down_rFresnel),

			//Mathematics Results
			.prod1_2(prod1_2),
			.prod1_4(prod1_4),
			.sqrtResult1_6(sqrtResult1_6),
			.prod1_36(prod1_36),
			.prod2_36(prod2_36),

			//OUTPUTS

			//Fresnels outputs
			.fresIndex(fresIndex),

			//Mathematics Operands
			.op1_2_1(op1_2_1_reflector),
			.op1_2_2(op1_2_2_reflector),
			.op1_4_1(op1_4_1_reflector),
			.op1_4_2(op1_4_2_reflector),
			.sqrtOperand1_6(sqrtOperand1_6_reflector),
			.op1_36_1(op1_36_1_reflector),
			.op1_36_2(op1_36_2_reflector),
			.op2_36_1(op2_36_1_reflector),
			.op2_36_2(op2_36_2_reflector),


			//Final Calculated Results
			.ux_reflector(ux_reflector),
			.uy_reflector(uy_reflector),
			.uz_reflector(uz_reflector),
			.layer_reflector(layer_reflector),
			.dead_reflector(dead_reflector)

);
		



	
//Multipliers, Dividers, and Sqrts for Scatterer & Reflector

assign op1_2_1 = (i_hit2_pipeWrapper == 1'b1) ? op1_2_1_reflector		:		op1_2_1_scatterer;
assign op1_2_2 = (i_hit2_pipeWrapper == 1'b1) ? op1_2_2_reflector		:		op1_2_2_scatterer;

Mult_32b	multiplier1_2 (
				.dataa(op1_2_1),
				.datab(op1_2_2),
				.result(prod1_2)
			);
			
assign op1_4_1 = (i_hit4_pipeWrapper == 1'b1) ? op1_4_1_reflector		:		op1_4_1_scatterer;
assign op1_4_2 = (i_hit4_pipeWrapper == 1'b1) ? op1_4_2_reflector		:		op1_4_2_scatterer;

Mult_32b	multiplier1_4 (
				.dataa(op1_4_1),
				.datab(op1_4_2),
				.result(prod1_4)
			);
			


Mult_32b	multiplier1_33 (
				.dataa(op1_33_1_scatterer),
				.datab(op1_33_2_scatterer),
				.result(prod1_33)
			);

Mult_32b	multiplier2_33 (
				.dataa(op2_33_1_scatterer),
				.datab(op2_33_2_scatterer),
				.result(prod2_33)
			);

Mult_32b	multiplier3_33 (
				.dataa(op3_33_1_scatterer),
				.datab(op3_33_2_scatterer),
				.result(prod3_33)
			);


Mult_32b	multiplier1_34 (
				.dataa(op1_34_1_scatterer),
				.datab(op1_34_2_scatterer),
				.result(prod1_34)
			);


Mult_32b	multiplier2_34 (
				.dataa(op2_34_1_scatterer),
				.datab(op2_34_2_scatterer),
				.result(prod2_34)
			);


Mult_32b	multiplier3_34 (
				.dataa(op3_34_1_scatterer),
				.datab(op3_34_2_scatterer),
				.result(prod3_34)
			);

Mult_32b	multiplier4_34 (
				.dataa(op4_34_1_scatterer),
				.datab(op4_34_2_scatterer),
				.result(prod4_34)
			);

assign op1_36_1 = (i_hit36_pipeWrapper == 1'b1) ? op1_36_1_reflector	:		op1_36_1_scatterer;
assign op1_36_2 = (i_hit36_pipeWrapper == 1'b1) ? op1_36_2_reflector	:		op1_36_2_scatterer;

Mult_32b	multiplier1_36 (
				.dataa(op1_36_1),
				.datab(op1_36_2),
				.result(prod1_36)
			);

assign op2_36_1 = (i_hit36_pipeWrapper == 1'b1) ? op2_36_1_reflector	:		op2_36_1_scatterer;
assign op2_36_2 = (i_hit36_pipeWrapper == 1'b1) ? op2_36_2_reflector	:		op2_36_2_scatterer;

Mult_32b	multiplier2_36 (
				.dataa(op2_36_1),
				.datab(op2_36_2),
				.result(prod2_36)
			);
			
Mult_32b	multiplier3_36 (
				.dataa(op3_36_1_scatterer),
				.datab(op3_36_2_scatterer),
				.result(prod3_36)
			);


Mult_32b	multiplier4_36 (
				.dataa(op4_36_1_scatterer),
				.datab(op4_36_2_scatterer),
				.result(prod4_36)
			);
			

Mult_32b	multiplier5_36 (
				.dataa(op5_36_1_scatterer),
				.datab(op5_36_2_scatterer),
				.result(prod5_36)
			);


Mult_32b	multiplier6_36 (
				.dataa(op6_36_1_scatterer),
				.datab(op6_36_2_scatterer),
				.result(prod6_36)
			);
			
assign sqrtOperand1_6 = (i_hit6_pipeWrapper == 1'b1) ? sqrtOperand1_6_reflector	:		sqrtOperand1_6_scatterer;

Sqrt_64b	squareRoot1_6 (
				.clk(clock),
				.num_(sqrtOperand1_6),
				.res(sqrtResult1_6)
			);



Div_64b		divide1_16 (
				.clock(clock),
				.denom(divDenominator1_16_scatterer),
				.numer(divNumerator1_16_scatterer),
				.quotient(quot1_16),
				.remain(divRemainder)
			);
				

endmodule
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
module Sqrt_64b (clk, num_, res);
	input clk;
	input [63:0]num_;
	output [31:0]res;
	reg [31:0]res;
	
	reg [63:0]num;
	
	always @ (posedge clk)
	begin
		num <= num_;
	end
	
///////////////////////////////////////////////////Unchanged starts here
	
//	reg [63:0] one_[32:0];
//	reg [63:0] res_[32:0];
//	reg [63:0] op_[32:0];

	wire [63:0]one__0;
    reg  [63:0]one__1;
    reg  [63:0]one__2;
    reg  [63:0]one__3_d, one__3_q;
    reg  [63:0]one__4;
    reg  [63:0]one__5;
    reg  [63:0]one__6;
    reg  [63:0]one__7_d, one__7_q;
    reg  [63:0]one__8;
    reg  [63:0]one__9;
    reg  [63:0]one__10;
    reg  [63:0]one__11_d, one__11_q;
    reg  [63:0]one__12;
    reg  [63:0]one__13;
    reg  [63:0]one__14;
    reg  [63:0]one__15_d, one__15_q;
    reg  [63:0]one__16;
    reg  [63:0]one__17;
    reg  [63:0]one__18_d, one__18_q;
    reg  [63:0]one__19;
    reg  [63:0]one__20;
    reg  [63:0]one__21_d, one__21_q;
    reg  [63:0]one__22;
    reg  [63:0]one__23;
    reg  [63:0]one__24_d, one__24_q;
    reg  [63:0]one__25;
    reg  [63:0]one__26;
    reg  [63:0]one__27_d, one__27_q;
    reg  [63:0]one__28;
    reg  [63:0]one__29;
    reg  [63:0]one__30_d, one__30_q;
    reg  [63:0]one__31;
	reg  [63:0]one__32;

	wire [63:0]res__0;
    reg  [63:0]res__1;
    reg  [63:0]res__2;
    reg  [63:0]res__3_d, res__3_q;
    reg  [63:0]res__4;
    reg  [63:0]res__5;
    reg  [63:0]res__6;
    reg  [63:0]res__7_d, res__7_q;
    reg  [63:0]res__8;
    reg  [63:0]res__9;
    reg  [63:0]res__10;
    reg  [63:0]res__11_d, res__11_q;
    reg  [63:0]res__12;
    reg  [63:0]res__13;
    reg  [63:0]res__14;
    reg  [63:0]res__15_d, res__15_q;
    reg  [63:0]res__16;
    reg  [63:0]res__17;
    reg  [63:0]res__18_d, res__18_q;
    reg  [63:0]res__19;
    reg  [63:0]res__20;
    reg  [63:0]res__21_d, res__21_q;
    reg  [63:0]res__22;
    reg  [63:0]res__23;
    reg  [63:0]res__24_d, res__24_q;
    reg  [63:0]res__25;
    reg  [63:0]res__26;
    reg  [63:0]res__27_d, res__27_q;
    reg  [63:0]res__28;
    reg  [63:0]res__29;
    reg  [63:0]res__30_d, res__30_q;
    reg  [63:0]res__31;
	reg  [63:0]res__32;
    
	wire [63:0]op__0;
	reg  [63:0]op__1;
    reg  [63:0]op__2;
    reg  [63:0]op__3_d, op__3_q;
    reg  [63:0]op__4;
    reg  [63:0]op__5;
    reg  [63:0]op__6;
    reg  [63:0]op__7_d, op__7_q;
    reg  [63:0]op__8;
    reg  [63:0]op__9;
    reg  [63:0]op__10;
    reg  [63:0]op__11_d, op__11_q;
    reg  [63:0]op__12;
    reg  [63:0]op__13;
    reg  [63:0]op__14;
    reg  [63:0]op__15_d, op__15_q;
    reg  [63:0]op__16;
    reg  [63:0]op__17;
    reg  [63:0]op__18_d, op__18_q;
    reg  [63:0]op__19;
    reg  [63:0]op__20;
    reg  [63:0]op__21_d, op__21_q;
    reg  [63:0]op__22;
    reg  [63:0]op__23;
    reg  [63:0]op__24_d, op__24_q;
    reg  [63:0]op__25;
    reg  [63:0]op__26;
    reg  [63:0]op__27_d, op__27_q;
    reg  [63:0]op__28;
    reg  [63:0]op__29;
    reg  [63:0]op__30_d, op__30_q;
    reg  [63:0]op__31;
	reg  [63:0]op__32;

	
	reg [63:0]one; //This is the one that is selected in first expanded loop
	reg [31:0]one_tmp;
	
	always @ (num) begin
		
		//The first for-loop:
		//all of these will be zero no matter how 'one' is selected.
		one[1] = 0;
		one[3] = 0;
		one[5] = 0;
		one[7] = 0;
		one[9] = 0;
		one[11] = 0;
		one[13] = 0;
		one[15] = 0;
		one[17] = 0;
		one[19] = 0;
		one[21] = 0;
		one[23] = 0;
		one[25] = 0;
		one[27] = 0;
		one[29] = 0;
		one[31] = 0;
		one[33] = 0;
		one[35] = 0;
		one[37] = 0;
		one[39] = 0;
		one[41] = 0;
		one[43] = 0;
		one[45] = 0;
		one[47] = 0;
		one[49] = 0;
		one[51] = 0;
		one[53] = 0;
		one[55] = 0;
		one[57] = 0;
		one[59] = 0;
		one[61] = 0;
		one[63] = 0;
		
		one_tmp[0] = num[0]|num[1];
		one_tmp[1] = num[2]|num[3];
		one_tmp[2] = num[4]|num[5];
		one_tmp[3] = num[6]|num[7];
		one_tmp[4] = num[8]|num[9];
		one_tmp[5] = num[10]|num[11];
		one_tmp[6] = num[12]|num[13];
		one_tmp[7] = num[14]|num[15];
		one_tmp[8] = num[16]|num[17];
		one_tmp[9] = num[18]|num[19];
		one_tmp[10] = num[20]|num[21];
		one_tmp[11] = num[22]|num[23];
		one_tmp[12] = num[24]|num[25];
		one_tmp[13] = num[26]|num[27];
		one_tmp[14] = num[28]|num[29];
		one_tmp[15] = num[30]|num[31];
		one_tmp[16] = num[32]|num[33];
		one_tmp[17] = num[34]|num[35];
		one_tmp[18] = num[36]|num[37];
		one_tmp[19] = num[38]|num[39];
		one_tmp[20] = num[40]|num[41];
		one_tmp[21] = num[42]|num[43];
		one_tmp[22] = num[44]|num[45];
		one_tmp[23] = num[46]|num[47];
		one_tmp[24] = num[48]|num[49];
		one_tmp[25] = num[50]|num[51];
		one_tmp[26] = num[52]|num[53];
		one_tmp[27] = num[54]|num[55];
		one_tmp[28] = num[56]|num[57];
		one_tmp[29] = num[58]|num[59];
		one_tmp[30] = num[60]|num[61];
		one_tmp[31] = num[62]|num[63];
		
		one[0] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&~one_tmp[1]&one_tmp[0];
		one[2] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&one_tmp[1];
		one[4] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&one_tmp[2];
		one[6] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&one_tmp[3];
		one[8] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&one_tmp[4];
		one[10] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&one_tmp[5];
		one[12] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&one_tmp[6];
		one[14] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&one_tmp[7];
		one[16] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&one_tmp[8];
		one[18] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&one_tmp[9];
		one[20] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&one_tmp[10];
		one[22] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&one_tmp[11];
		one[24] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&one_tmp[12];
		one[26] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&one_tmp[13];
		one[28] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&one_tmp[14];
		one[30] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&one_tmp[15];
		one[32] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&one_tmp[16];
		one[34] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&one_tmp[17];
		one[36] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&one_tmp[18];
		one[38] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&one_tmp[19];
		one[40] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&one_tmp[20];
		one[42] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&one_tmp[21];
		one[44] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&one_tmp[22];
		one[46] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&one_tmp[23];
		one[48] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&one_tmp[24];
		one[50] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&one_tmp[25];
		one[52] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&one_tmp[26];
		one[54] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&one_tmp[27];
		one[56] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&one_tmp[28];
		one[58] = ~one_tmp[31]&~one_tmp[30]&one_tmp[29];
		one[60] = ~one_tmp[31]&one_tmp[30];
		one[62] = one_tmp[31];
	end
	
//	//2nd for-loop:
//	integer i;
//	always @* begin
//		op_[0] = num;
//		one_[0] = one;
//		res_[0] = 64'b0;
//		res = 63'b0;
//		res_assigned = 1'b0;
//	
//		for (i = 0; i <= 31; i=i+1) begin
//			if ((one_[i] == 0) & ~res_assigned) begin
//				res = res_[i];
//				res_assigned = 1'b1;
//			end
//			
//			//Define the next stage:
//			if (op_[i] >= res_[i] + one_[i]) begin
//				op_[i+1] = op_[i] - res_[i] - one_[i];
//				res_[i+1] = (res_[i]>>1) + one_[i];
//			end else begin
//				op_[i+1] = op_[i]; //this line had to be added for the verilog version.
//				res_[i+1] = (res_[i]>>1);
//			end
//			one_[i+1] = (one_[i] >> 2);
//		end
//	
//		//Add the part for really big numbers later:
//		if (~res_assigned) begin
//			res = res_[32];
//		end
//	end

	//If-statement about defining the next stage:
	assign op__0 = num;
	assign res__0 = 64'b0;
	assign one__0 = one;
	
	always @ (res__0 or op__0 or one__0) begin

       //i = 0
       if (op__0 >= res__0 + one__0) begin
           op__1 = op__0 - res__0 - one__0;
           res__1 = (res__0>>1) + one__0;
       end else begin
           op__1 = op__0;
           res__1 = (res__0>>1);
       end
       one__1 = (one__0 >> 2);

       //i = 1
       if (op__1 >= res__1 + one__1) begin
           op__2 = op__1 - res__1 - one__1;
           res__2 = (res__1>>1) + one__1;
       end else begin
           op__2 = op__1;
           res__2 = (res__1>>1);
       end
       one__2 = (one__1 >> 2);

       //i = 2
       if (op__2 >= res__2 + one__2) begin
           op__3_d = op__2 - res__2 - one__2;
           res__3_d = (res__2>>1) + one__2;
       end else begin
           op__3_d = op__2;
           res__3_d = (res__2>>1);
       end
       one__3_d = (one__2 >> 2);
	end
	
	always @ (posedge clk) begin
		op__3_q <= op__3_d;
		res__3_q <= res__3_d;
		one__3_q <= one__3_d;
	end
	
	always @ (op__3_q or res__3_q or one__3_q) begin
       //i = 3
       if (op__3_q >= res__3_q + one__3_q) begin
           op__4 = op__3_q - res__3_q - one__3_q;
           res__4 = (res__3_q>>1) + one__3_q;
       end else begin
           op__4 = op__3_q;
           res__4 = (res__3_q>>1);
       end
       one__4 = (one__3_q >> 2);

       //i = 4
       if (op__4 >= res__4 + one__4) begin
           op__5 = op__4 - res__4 - one__4;
           res__5 = (res__4>>1) + one__4;
       end else begin
           op__5 = op__4;
           res__5 = (res__4>>1);
       end
       one__5 = (one__4 >> 2);

       //i = 5
       if (op__5 >= res__5 + one__5) begin
           op__6 = op__5 - res__5 - one__5;
           res__6 = (res__5>>1) + one__5;
       end else begin
           op__6 = op__5;
           res__6 = (res__5>>1);
       end
       one__6 = (one__5 >> 2);

       //i = 6
       if (op__6 >= res__6 + one__6) begin
           op__7_d = op__6 - res__6 - one__6;
           res__7_d = (res__6>>1) + one__6;
       end else begin
           op__7_d = op__6;
           res__7_d = (res__6>>1);
       end
       one__7_d = (one__6 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__7_q <= op__7_d;
		one__7_q <= one__7_d;
		res__7_q <= res__7_d;
	end
	
	always @ (op__7_q or res__7_q or one__7_q) begin
       //i = 7
       if (op__7_q >= res__7_q + one__7_q) begin
           op__8 = op__7_q - res__7_q - one__7_q;
           res__8 = (res__7_q>>1) + one__7_q;
       end else begin
           op__8 = op__7_q;
           res__8 = (res__7_q>>1);
       end
       one__8 = (one__7_q >> 2);

       //i = 8
       if (op__8 >= res__8 + one__8) begin
           op__9 = op__8 - res__8 - one__8;
           res__9 = (res__8>>1) + one__8;
       end else begin
           op__9 = op__8;
           res__9 = (res__8>>1);
       end
       one__9 = (one__8 >> 2);

       //i = 9
       if (op__9 >= res__9 + one__9) begin
           op__10 = op__9 - res__9 - one__9;
           res__10 = (res__9>>1) + one__9;
       end else begin
           op__10 = op__9;
           res__10 = (res__9>>1);
       end
       one__10 = (one__9 >> 2);

       //i = 10
       if (op__10 >= res__10 + one__10) begin
           op__11_d = op__10 - res__10 - one__10;
           res__11_d = (res__10>>1) + one__10;
       end else begin
           op__11_d = op__10;
           res__11_d = (res__10>>1);
       end
       one__11_d = (one__10 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__11_q <= op__11_d;
		one__11_q <= one__11_d;
		res__11_q <= res__11_d;
	end
	
	always @ (op__11_q or res__11_q or one__11_q) begin	 
       //i = 11
       if (op__11_q >= res__11_q + one__11_q) begin
           op__12 = op__11_q - res__11_q - one__11_q;
           res__12 = (res__11_q>>1) + one__11_q;
       end else begin
           op__12 = op__11_q;
           res__12 = (res__11_q>>1);
       end
       one__12 = (one__11_q >> 2);

       //i = 12
       if (op__12 >= res__12 + one__12) begin
           op__13 = op__12 - res__12 - one__12;
           res__13 = (res__12>>1) + one__12;
       end else begin
           op__13 = op__12;
           res__13 = (res__12>>1);
       end
       one__13 = (one__12 >> 2);

       //i = 13
       if (op__13 >= res__13 + one__13) begin
           op__14 = op__13 - res__13 - one__13;
           res__14 = (res__13>>1) + one__13;
       end else begin
           op__14 = op__13;
           res__14 = (res__13>>1);
       end
       one__14 = (one__13 >> 2);

       //i = 14
       if (op__14 >= res__14 + one__14) begin
           op__15_d = op__14 - res__14 - one__14;
           res__15_d = (res__14>>1) + one__14;
       end else begin
           op__15_d = op__14;
           res__15_d = (res__14>>1);
       end
       one__15_d = (one__14 >> 2);
	end
	
	always @ (posedge clk) begin
		op__15_q <= op__15_d;
		one__15_q <= one__15_d;
		res__15_q <= res__15_d;
	end
	
	always @ (op__15_q or res__15_q or one__15_q) begin
       //i = 15
       if (op__15_q >= res__15_q + one__15_q) begin
           op__16 = op__15_q - res__15_q - one__15_q;
           res__16 = (res__15_q>>1) + one__15_q;
       end else begin
           op__16 = op__15_q;
           res__16 = (res__15_q>>1);
       end
       one__16 = (one__15_q >> 2);

       //i = 16
       if (op__16 >= res__16 + one__16) begin
           op__17 = op__16 - res__16 - one__16;
           res__17 = (res__16>>1) + one__16;
       end else begin
           op__17 = op__16;
           res__17 = (res__16>>1);
       end
       one__17 = (one__16 >> 2);

       //i = 17
       if (op__17 >= res__17 + one__17) begin
           op__18_d = op__17 - res__17 - one__17;
           res__18_d = (res__17>>1) + one__17;
       end else begin
           op__18_d = op__17;
           res__18_d = (res__17>>1);
       end
       one__18_d = (one__17 >> 2);
	end
	
	always @ (posedge clk) begin
		op__18_q <= op__18_d;
		one__18_q <= one__18_d;
		res__18_q <= res__18_d;
	end
	
	always @ (op__18_q or res__18_q or one__18_q) begin
       //i = 18
       if (op__18_q >= res__18_q + one__18_q) begin
           op__19 = op__18_q - res__18_q - one__18_q;
           res__19 = (res__18_q>>1) + one__18_q;
       end else begin
           op__19 = op__18_q;
           res__19 = (res__18_q>>1);
       end
       one__19 = (one__18_q >> 2);

       //i = 19
       if (op__19 >= res__19 + one__19) begin
           op__20 = op__19 - res__19 - one__19;
           res__20 = (res__19>>1) + one__19;
       end else begin
           op__20 = op__19;
           res__20 = (res__19>>1);
       end
       one__20 = (one__19 >> 2);

       //i = 20
       if (op__20 >= res__20 + one__20) begin
           op__21_d = op__20 - res__20 - one__20;
           res__21_d = (res__20>>1) + one__20;
       end else begin
           op__21_d = op__20;
           res__21_d = (res__20>>1);
       end
       one__21_d = (one__20 >> 2);
	end
	
	always @ (posedge clk) begin
		op__21_q <= op__21_d;
		one__21_q <= one__21_d;
		res__21_q <= res__21_d;
	end
		 
	always @ (op__21_q or res__21_q or one__21_q) begin 
       //i = 21
       if (op__21_q >= res__21_q + one__21_q) begin
           op__22 = op__21_q - res__21_q - one__21_q;
           res__22 = (res__21_q>>1) + one__21_q;
       end else begin
           op__22 = op__21_q;
           res__22 = (res__21_q>>1);
       end
       one__22 = (one__21_q >> 2);

       //i = 22
       if (op__22 >= res__22 + one__22) begin
           op__23 = op__22 - res__22 - one__22;
           res__23 = (res__22>>1) + one__22;
       end else begin
           op__23 = op__22;
           res__23 = (res__22>>1);
       end
       one__23 = (one__22 >> 2);

       //i = 23
       if (op__23 >= res__23 + one__23) begin
           op__24_d = op__23 - res__23 - one__23;
           res__24_d = (res__23>>1) + one__23;
       end else begin
           op__24_d = op__23;
           res__24_d = (res__23>>1);
       end
       one__24_d = (one__23 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__24_q <= op__24_d;
		one__24_q <= one__24_d;
		res__24_q <= res__24_d;
	end
		  
	always @ (op__24_q or res__24_q or one__24_q) begin
       //i = 24
       if (op__24_q >= res__24_q + one__24_q) begin
           op__25 = op__24_q - res__24_q - one__24_q;
           res__25 = (res__24_q>>1) + one__24_q;
       end else begin
           op__25 = op__24_q;
           res__25 = (res__24_q>>1);
       end
       one__25 = (one__24_q >> 2);

       //i = 25
       if (op__25 >= res__25 + one__25) begin
           op__26 = op__25 - res__25 - one__25;
           res__26 = (res__25>>1) + one__25;
       end else begin
           op__26 = op__25;
           res__26 = (res__25>>1);
       end
       one__26 = (one__25 >> 2);

       //i = 26
       if (op__26 >= res__26 + one__26) begin
           op__27_d = op__26 - res__26 - one__26;
           res__27_d = (res__26>>1) + one__26;
       end else begin
           op__27_d = op__26;
           res__27_d = (res__26>>1);
       end
       one__27_d = (one__26 >> 2);
	end

	always @ (posedge clk) begin
		op__27_q <= op__27_d;
		one__27_q <= one__27_d;
		res__27_q <= res__27_d;
	end
	
	always @ (op__27_q or res__27_q or one__27_q) begin
       //i = 27
       if (op__27_q >= res__27_q + one__27_q) begin
           op__28 = op__27_q - res__27_q - one__27_q;
           res__28 = (res__27_q>>1) + one__27_q;
       end else begin
           op__28 = op__27_q;
           res__28 = (res__27_q>>1);
       end
       one__28 = (one__27_q >> 2);

       //i = 28
       if (op__28 >= res__28 + one__28) begin
           op__29 = op__28 - res__28 - one__28;
           res__29 = (res__28>>1) + one__28;
       end else begin
           op__29 = op__28;
           res__29 = (res__28>>1);
       end
       one__29 = (one__28 >> 2);

       //i = 29
       if (op__29 >= res__29 + one__29) begin
           op__30_d = op__29 - res__29 - one__29;
           res__30_d = (res__29>>1) + one__29;
       end else begin
           op__30_d = op__29;
           res__30_d = (res__29>>1);
       end
       one__30_d = (one__29 >> 2);
	end
	
	always @ (posedge clk) begin
		op__30_q <= op__30_d;
		one__30_q <= one__30_d;
		res__30_q <= res__30_d;
	end
	
	always @* begin
       //i = 30
       if (op__30_q >= res__30_q + one__30_q) begin
           op__31 = op__30_q - res__30_q - one__30_q;
           res__31 = (res__30_q>>1) + one__30_q;
       end else begin
           op__31 = op__30_q;
           res__31 = (res__30_q>>1);
       end
       one__31 = (one__30_q >> 2);

       //i = 31
       if (op__31 >= res__31 + one__31) begin
           op__32 = op__31 - res__31 - one__31;
           res__32 = (res__31>>1) + one__31;
       end else begin
           op__32 = op__31;
           res__32 = (res__31>>1);
       end
       one__32 = (one__31 >> 2);
	end


	//If-statement about assigning res:
	always @* begin
		if(one__0 == 0) begin
			res = res__0[31:0];
         end else if (one__1 == 0) begin
             res = res__1[31:0];
         end else if (one__2 == 0) begin
             res = res__2[31:0];
         end else if (one__3_q == 0) begin
             res = res__3_q[31:0];
         end else if (one__4 == 0) begin
             res = res__4[31:0];
         end else if (one__5 == 0) begin
             res = res__5[31:0];
         end else if (one__6 == 0) begin
             res = res__6[31:0];
         end else if (one__7_q == 0) begin
             res = res__7_q[31:0];
         end else if (one__8 == 0) begin
             res = res__8[31:0];
         end else if (one__9 == 0) begin
             res = res__9[31:0];
         end else if (one__10 == 0) begin
             res = res__10[31:0];
         end else if (one__11_q == 0) begin
             res = res__11_q[31:0];
         end else if (one__12 == 0) begin
             res = res__12[31:0];
         end else if (one__13 == 0) begin
             res = res__13[31:0];
         end else if (one__14 == 0) begin
             res = res__14[31:0];
         end else if (one__15_q == 0) begin
             res = res__15_q[31:0];
         end else if (one__16 == 0) begin
             res = res__16[31:0];
         end else if (one__17 == 0) begin
             res = res__17[31:0];
         end else if (one__18_q == 0) begin
             res = res__18_q[31:0];
         end else if (one__19 == 0) begin
             res = res__19[31:0];
         end else if (one__20 == 0) begin
             res = res__20[31:0];
         end else if (one__21_q == 0) begin
             res = res__21_q[31:0];
         end else if (one__22 == 0) begin
             res = res__22[31:0];
         end else if (one__23 == 0) begin
             res = res__23[31:0];
         end else if (one__24_q == 0) begin
             res = res__24_q[31:0];
         end else if (one__25 == 0) begin
             res = res__25[31:0];
         end else if (one__26 == 0) begin
             res = res__26[31:0];
         end else if (one__27_q == 0) begin
             res = res__27_q[31:0];
         end else if (one__28 == 0) begin
             res = res__28[31:0];
         end else if (one__29 == 0) begin
             res = res__29[31:0];
         end else if (one__30_q == 0) begin
             res = res__30_q[31:0];
         end else if (one__31 == 0) begin
             res = res__31[31:0];
		end else begin
			 res = res__32[31:0];
		end
		
	end

	
endmodule 	
module Mult_32b (dataa, datab, result); //now signed version!

	input [31:0]dataa;
	input [31:0]datab;
	output [63:0]result;
	
	// assign result = dataa * datab; 
	
	wire [31:0]a;
	wire [31:0]b;
  assign a = dataa;
  assign b = datab;

	reg [63:0]c;
	assign result = c;
	
	reg is_neg_a;
	reg is_neg_b;
	reg [31:0]a_tmp;
	reg [31:0]b_tmp;
	reg [63:0]mult_tmp;
	reg [63:0]c_tmp;

always@(a or b or is_neg_a or is_neg_b or a_tmp or b_tmp or c)
begin
	if(a[31] == 1) begin
		a_tmp = -a;
		is_neg_a = 1;
	end else
	begin
		a_tmp = a;
		is_neg_a = 0;
	end

	if(b[31] == 1) begin
		b_tmp = -b;
		is_neg_b = 1;
	end else
	begin
		b_tmp = b;
		is_neg_b = 0;
	end

	mult_tmp = a_tmp * b_tmp;

	if( is_neg_a != is_neg_b) begin
		c_tmp = -mult_tmp;
	end else
	begin
		c_tmp = mult_tmp;
	end
end

always@(c_tmp)
begin
	c = c_tmp;
end

endmodule
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
module Scatterer (
	//INPUTS
	clock,
	reset,
	enable,
	//Values from Photon Pipeline
	i_uz1,
	i_ux3,
	i_uz3,
	i_uy32,
	i_uz32,
	i_ux33,
	i_uy33,
	i_ux35,
	i_uy35,
	i_uz35,
	i_uz36,

	//Mathematics Results
	prod1_2,
	prod1_4,
	sqrtResult1_6,
	prod1_33,
	prod2_33,
	prod3_33,
	prod1_34,
	prod2_34,
	prod3_34,
	prod4_34,
	quot1_16,
	prod1_36,
	prod2_36,
	prod3_36,
	prod4_36,
	prod5_36,
	prod6_36,

	//Trig from Memory
	sint_Mem,
	cost_Mem,
	sinp_Mem,
	cosp_Mem,
	
	//OUTPUTS
	op1_2_1,
	op1_2_2,
	op1_4_1,
	op1_4_2,
	sqrtOperand1_6,
	divNumerator1_16,
	divDenominator1_16,
	op1_33_1,
	op1_33_2,
	op2_33_1,
	op2_33_2,
	op3_33_1,
	op3_33_2,
	op1_34_1,
	op1_34_2,
	op2_34_1,
	op2_34_2,
	op3_34_1,
	op3_34_2,
	op4_34_1,
	op4_34_2,
	op1_36_1,
	op1_36_2,
	op2_36_1,
	op2_36_2,
	op3_36_1,
	op3_36_2,
	op4_36_1,
	op4_36_2,
	op5_36_1,
	op5_36_2,
	op6_36_1,
	op6_36_2,
	
	//Final calculated values
	ux_scatterer,
	uy_scatterer,
	uz_scatterer
	
	
	);
	
//-------------------PARAMETER DEFINITION----------------------
//
//
//
//
//
//
//Assign values to parameters used later in the program.
	
//parameter DIV = 20;
//parameter SQRT = 10;
//parameter LAT = DIV + SQRT + 7;
//parameter `INTMAX_2 = 64'h3FFFFFFF00000001;
//parameter `INTMAX = 2147483647;
//parameter `INTMIN = -2147483647;
//parameter `INTMAXMinus3 = 2147483644;
//parameter neg`INTMAXPlus3 = -2147483644;



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

input				clock;
input				reset;
input				enable;
//Values from Photon Pipeline
input	[31:0]		i_uz1;
input	[31:0]		i_ux3;
input	[31:0]		i_uz3;
input	[31:0]		i_uy32;
input	[31:0]		i_uz32;
input	[31:0]		i_ux33;
input	[31:0]		i_uy33;
input	[31:0]		i_ux35;
input	[31:0]		i_uy35;
input	[31:0]		i_uz35;
input	[31:0]		i_uz36;

//Multiplication Results
input	[63:0]		prod1_2;
input	[31:0]		prod1_4;
input	[31:0]		sqrtResult1_6;
input	[31:0]		prod1_33;
input	[31:0]		prod2_33;
input	[31:0]		prod3_33;
input	[31:0]		prod1_34;
input	[31:0]		prod2_34;
input	[31:0]		prod3_34;
input	[31:0]		prod4_34;
input	[63:0]		quot1_16;
//Need all 64-bits for these two to detect overflows
input	[63:0]		prod1_36;
input	[63:0]		prod2_36;
input	[31:0]		prod3_36;
input	[31:0]		prod4_36;
input	[31:0]		prod5_36;
input	[31:0]		prod6_36;


//Trig Values from Memory
input	[31:0]		sint_Mem;
input	[31:0]		cost_Mem;
input	[31:0]		sinp_Mem;
input	[31:0]		cosp_Mem;

output	[31:0]		op1_2_1;
output	[31:0]		op1_2_2;
output	[31:0]		op1_4_1;
output	[31:0]		op1_4_2;
output	[63:0]		sqrtOperand1_6;
output	[63:0]		divNumerator1_16;
output	[31:0]		divDenominator1_16;
output	[31:0]		op1_33_1;
output	[31:0]		op1_33_2;
output	[31:0]		op2_33_1;
output	[31:0]		op2_33_2;
output	[31:0]		op3_33_1;
output	[31:0]		op3_33_2;
output	[31:0]		op1_34_1;
output	[31:0]		op1_34_2;
output	[31:0]		op2_34_1;
output	[31:0]		op2_34_2;
output	[31:0]		op3_34_1;
output	[31:0]		op3_34_2;
output	[31:0]		op4_34_1;
output	[31:0]		op4_34_2;
output	[31:0]		op1_36_1;
output	[31:0]		op1_36_2;
output	[31:0]		op2_36_1;
output	[31:0]		op2_36_2;
output	[31:0]		op3_36_1;
output	[31:0]		op3_36_2;
output	[31:0]		op4_36_1;
output	[31:0]		op4_36_2;
output	[31:0]		op5_36_1;
output	[31:0]		op5_36_2;
output	[31:0]		op6_36_1;
output	[31:0]		op6_36_2;

//Final Calculated Results
output	[31:0]		ux_scatterer;
output	[31:0]		uy_scatterer;
output	[31:0]		uz_scatterer;


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


wire				clock;
wire				reset;
wire				enable;
//Values from Photon Pipeline
wire	[31:0]		i_uz1;
wire	[31:0]		i_ux3;
wire	[31:0]		i_uz3;
wire	[31:0]		i_uy32;
wire	[31:0]		i_uz32;
wire	[31:0]		i_ux33;
wire	[31:0]		i_uy33;
wire	[31:0]		i_ux35;
wire	[31:0]		i_uy35;
wire	[31:0]		i_uz35;
wire	[31:0]		i_uz36;

//Multiplication Results
wire	[63:0]		prod1_2;
wire	[31:0]		prod1_4;
wire	[31:0]		sqrtResult1_6;
wire	[31:0]		prod1_33;
wire	[31:0]		prod2_33;
wire	[31:0]		prod3_33;
wire	[31:0]		prod1_34;
wire	[31:0]		prod2_34;
wire	[31:0]		prod3_34;
wire	[31:0]		prod4_34;
wire	[63:0]		quot1_16;
wire	[63:0]		prod1_36;
wire	[63:0]		prod2_36;
wire	[31:0]		prod3_36;
wire	[31:0]		prod4_36;
wire	[31:0]		prod5_36;
wire	[31:0]		prod6_36;


//Trig Values from Memory
wire	[31:0]		sint_Mem;
wire	[31:0]		cost_Mem;
wire	[31:0]		sinp_Mem;
wire	[31:0]		cosp_Mem;

//Operands for shared resources
wire	[31:0]		op1_2_1;
wire	[31:0]		op1_2_2;
wire	[31:0]		op1_4_1;
wire	[31:0]		op1_4_2;
wire	[63:0]		sqrtOperand1_6;
wire	[63:0]		divNumerator1_16;
wire	[31:0]		divDenominator1_16;
wire	[31:0]		op1_33_1;
wire	[31:0]		op1_33_2;
wire	[31:0]		op2_33_1;
wire	[31:0]		op2_33_2;
wire	[31:0]		op3_33_1;
wire	[31:0]		op3_33_2;
wire	[31:0]		op1_34_1;
wire	[31:0]		op1_34_2;
wire	[31:0]		op2_34_1;
wire	[31:0]		op2_34_2;
wire	[31:0]		op3_34_1;
wire	[31:0]		op3_34_2;
wire	[31:0]		op4_34_1;
wire	[31:0]		op4_34_2;
wire	[31:0]		op1_36_1;
wire	[31:0]		op1_36_2;
wire	[31:0]		op2_36_1;
wire	[31:0]		op2_36_2;
wire	[31:0]		op3_36_1;
wire	[31:0]		op3_36_2;
wire	[31:0]		op4_36_1;
wire	[31:0]		op4_36_2;
wire	[31:0]		op5_36_1;
wire	[31:0]		op5_36_2;
wire	[31:0]		op6_36_1;
wire	[31:0]		op6_36_2;

//Final outputs
reg		[31:0]		ux_scatterer;
reg		[31:0]		uy_scatterer;
reg		[31:0]		uz_scatterer;


//Need this to deal with 'unused' inputs for ODIN II
wire [63:0]bigOr;
assign bigOr = quot1_16|prod1_36|prod2_36|({32'hFFFFFFFF,32'hFFFFFFFF});
wire reset_new;
assign reset_new = reset & bigOr[63] & bigOr[62] & bigOr[61] & bigOr[60] & bigOr[59] & bigOr[58] & bigOr[57] & bigOr[56] & bigOr[55] & bigOr[54] & bigOr[53] & bigOr[52] & bigOr[51] & bigOr[50] & bigOr[49] & bigOr[48] & bigOr[47] & bigOr[46] & bigOr[45] & bigOr[44] & bigOr[43] & bigOr[42] & bigOr[41] & bigOr[40] & bigOr[39] & bigOr[38] & bigOr[37] & bigOr[36] & bigOr[35] & bigOr[34] & bigOr[33] & bigOr[32] & bigOr[31] & bigOr[30] & bigOr[29] & bigOr[28] & bigOr[27] & bigOr[26] & bigOr[25] & bigOr[24] & bigOr[23] & bigOr[22] & bigOr[21] & bigOr[20] & bigOr[19] & bigOr[18] & bigOr[17] & bigOr[16] & bigOr[15] & bigOr[14] & bigOr[13] & bigOr[12] & bigOr[11] & bigOr[10] & bigOr[9] & bigOr[8] & bigOr[7] & bigOr[6] & bigOr[5] & bigOr[4] & bigOr[3] & bigOr[2] & bigOr[1] & bigOr[0];
 

//-----------------------------END Pin Types-------------------------



//Wires to Connect to Internal Registers
//wire		[31:0]		sint[`LAT:0];
//wire		[31:0]		cost[`LAT:0];
//wire		[31:0]		sinp[`LAT:0];
//wire		[31:0]		cosp[`LAT:0];
//wire		[31:0]		sintCosp[`LAT:0];
//wire		[31:0]		sintSinp[`LAT:0];
//wire		[63:0]		uz2[`LAT:0];
//wire		[31:0]		uxUz[`LAT:0];
//wire		[31:0]		uyUz[`LAT:0];
//wire		[31:0]		uySintSinp[`LAT:0];
//wire		[63:0]		oneMinusUz2[`LAT:0];
//wire		[31:0]		uyUzSintCosp[`LAT:0];
//wire		[31:0]		uxUzSintCosp[`LAT:0];
//wire		[31:0]		uxSintSinp[`LAT:0];
//wire		[31:0]		sqrtOneMinusUz2[`LAT:0];
//wire		[31:0]		sintCospSqrtOneMinusUz2[`LAT:0];
//wire		[31:0]		uxCost[`LAT:0];
//wire		[31:0]		uzCost[`LAT:0];
//wire		[31:0]		sqrtOneMinusUz2_inv[`LAT:0];
//wire		[31:0]		uxNumerator[`LAT:0];
//wire		[31:0]		uyNumerator[`LAT:0];
//wire		[31:0]		uyCost[`LAT:0];
//wire		[31:0]		uxQuotient[`LAT:0];
//wire		[31:0]		uyQuotient[`LAT:0];
//wire		[31:0]		sint[37:0];
wire	[32-1:0]				sint__0;
wire	[32-1:0]				sint__1;
wire	[32-1:0]				sint__2;
wire	[32-1:0]				sint__3;
wire	[32-1:0]				sint__4;
wire	[32-1:0]				sint__5;
wire	[32-1:0]				sint__6;
wire	[32-1:0]				sint__7;
wire	[32-1:0]				sint__8;
wire	[32-1:0]				sint__9;
wire	[32-1:0]				sint__10;
wire	[32-1:0]				sint__11;
wire	[32-1:0]				sint__12;
wire	[32-1:0]				sint__13;
wire	[32-1:0]				sint__14;
wire	[32-1:0]				sint__15;
wire	[32-1:0]				sint__16;
wire	[32-1:0]				sint__17;
wire	[32-1:0]				sint__18;
wire	[32-1:0]				sint__19;
wire	[32-1:0]				sint__20;
wire	[32-1:0]				sint__21;
wire	[32-1:0]				sint__22;
wire	[32-1:0]				sint__23;
wire	[32-1:0]				sint__24;
wire	[32-1:0]				sint__25;
wire	[32-1:0]				sint__26;
wire	[32-1:0]				sint__27;
wire	[32-1:0]				sint__28;
wire	[32-1:0]				sint__29;
wire	[32-1:0]				sint__30;
wire	[32-1:0]				sint__31;
wire	[32-1:0]				sint__32;
wire	[32-1:0]				sint__33;
wire	[32-1:0]				sint__34;
wire	[32-1:0]				sint__35;
wire	[32-1:0]				sint__36;
wire	[32-1:0]				sint__37;





//wire		[31:0]		cost[37:0];


wire	[32-1:0]				cost__0;
wire	[32-1:0]				cost__1;
wire	[32-1:0]				cost__2;
wire	[32-1:0]				cost__3;
wire	[32-1:0]				cost__4;
wire	[32-1:0]				cost__5;
wire	[32-1:0]				cost__6;
wire	[32-1:0]				cost__7;
wire	[32-1:0]				cost__8;
wire	[32-1:0]				cost__9;
wire	[32-1:0]				cost__10;
wire	[32-1:0]				cost__11;
wire	[32-1:0]				cost__12;
wire	[32-1:0]				cost__13;
wire	[32-1:0]				cost__14;
wire	[32-1:0]				cost__15;
wire	[32-1:0]				cost__16;
wire	[32-1:0]				cost__17;
wire	[32-1:0]				cost__18;
wire	[32-1:0]				cost__19;
wire	[32-1:0]				cost__20;
wire	[32-1:0]				cost__21;
wire	[32-1:0]				cost__22;
wire	[32-1:0]				cost__23;
wire	[32-1:0]				cost__24;
wire	[32-1:0]				cost__25;
wire	[32-1:0]				cost__26;
wire	[32-1:0]				cost__27;
wire	[32-1:0]				cost__28;
wire	[32-1:0]				cost__29;
wire	[32-1:0]				cost__30;
wire	[32-1:0]				cost__31;
wire	[32-1:0]				cost__32;
wire	[32-1:0]				cost__33;
wire	[32-1:0]				cost__34;
wire	[32-1:0]				cost__35;
wire	[32-1:0]				cost__36;
wire	[32-1:0]				cost__37;


//wire		[31:0]		sinp[37:0];


wire	[32-1:0]				sinp__0;
wire	[32-1:0]				sinp__1;
wire	[32-1:0]				sinp__2;
wire	[32-1:0]				sinp__3;
wire	[32-1:0]				sinp__4;
wire	[32-1:0]				sinp__5;
wire	[32-1:0]				sinp__6;
wire	[32-1:0]				sinp__7;
wire	[32-1:0]				sinp__8;
wire	[32-1:0]				sinp__9;
wire	[32-1:0]				sinp__10;
wire	[32-1:0]				sinp__11;
wire	[32-1:0]				sinp__12;
wire	[32-1:0]				sinp__13;
wire	[32-1:0]				sinp__14;
wire	[32-1:0]				sinp__15;
wire	[32-1:0]				sinp__16;
wire	[32-1:0]				sinp__17;
wire	[32-1:0]				sinp__18;
wire	[32-1:0]				sinp__19;
wire	[32-1:0]				sinp__20;
wire	[32-1:0]				sinp__21;
wire	[32-1:0]				sinp__22;
wire	[32-1:0]				sinp__23;
wire	[32-1:0]				sinp__24;
wire	[32-1:0]				sinp__25;
wire	[32-1:0]				sinp__26;
wire	[32-1:0]				sinp__27;
wire	[32-1:0]				sinp__28;
wire	[32-1:0]				sinp__29;
wire	[32-1:0]				sinp__30;
wire	[32-1:0]				sinp__31;
wire	[32-1:0]				sinp__32;
wire	[32-1:0]				sinp__33;
wire	[32-1:0]				sinp__34;
wire	[32-1:0]				sinp__35;
wire	[32-1:0]				sinp__36;
wire	[32-1:0]				sinp__37;


//wire		[31:0]		cosp[37:0];


wire	[32-1:0]				cosp__0;
wire	[32-1:0]				cosp__1;
wire	[32-1:0]				cosp__2;
wire	[32-1:0]				cosp__3;
wire	[32-1:0]				cosp__4;
wire	[32-1:0]				cosp__5;
wire	[32-1:0]				cosp__6;
wire	[32-1:0]				cosp__7;
wire	[32-1:0]				cosp__8;
wire	[32-1:0]				cosp__9;
wire	[32-1:0]				cosp__10;
wire	[32-1:0]				cosp__11;
wire	[32-1:0]				cosp__12;
wire	[32-1:0]				cosp__13;
wire	[32-1:0]				cosp__14;
wire	[32-1:0]				cosp__15;
wire	[32-1:0]				cosp__16;
wire	[32-1:0]				cosp__17;
wire	[32-1:0]				cosp__18;
wire	[32-1:0]				cosp__19;
wire	[32-1:0]				cosp__20;
wire	[32-1:0]				cosp__21;
wire	[32-1:0]				cosp__22;
wire	[32-1:0]				cosp__23;
wire	[32-1:0]				cosp__24;
wire	[32-1:0]				cosp__25;
wire	[32-1:0]				cosp__26;
wire	[32-1:0]				cosp__27;
wire	[32-1:0]				cosp__28;
wire	[32-1:0]				cosp__29;
wire	[32-1:0]				cosp__30;
wire	[32-1:0]				cosp__31;
wire	[32-1:0]				cosp__32;
wire	[32-1:0]				cosp__33;
wire	[32-1:0]				cosp__34;
wire	[32-1:0]				cosp__35;
wire	[32-1:0]				cosp__36;
wire	[32-1:0]				cosp__37;


//wire		[31:0]		sintCosp[37:0];

wire	[32-1:0]				sintCosp__0;
wire	[32-1:0]				sintCosp__1;
wire	[32-1:0]				sintCosp__2;
wire	[32-1:0]				sintCosp__3;
wire	[32-1:0]				sintCosp__4;
wire	[32-1:0]				sintCosp__5;
wire	[32-1:0]				sintCosp__6;
wire	[32-1:0]				sintCosp__7;
wire	[32-1:0]				sintCosp__8;
wire	[32-1:0]				sintCosp__9;
wire	[32-1:0]				sintCosp__10;
wire	[32-1:0]				sintCosp__11;
wire	[32-1:0]				sintCosp__12;
wire	[32-1:0]				sintCosp__13;
wire	[32-1:0]				sintCosp__14;
wire	[32-1:0]				sintCosp__15;
wire	[32-1:0]				sintCosp__16;
wire	[32-1:0]				sintCosp__17;
wire	[32-1:0]				sintCosp__18;
wire	[32-1:0]				sintCosp__19;
wire	[32-1:0]				sintCosp__20;
wire	[32-1:0]				sintCosp__21;
wire	[32-1:0]				sintCosp__22;
wire	[32-1:0]				sintCosp__23;
wire	[32-1:0]				sintCosp__24;
wire	[32-1:0]				sintCosp__25;
wire	[32-1:0]				sintCosp__26;
wire	[32-1:0]				sintCosp__27;
wire	[32-1:0]				sintCosp__28;
wire	[32-1:0]				sintCosp__29;
wire	[32-1:0]				sintCosp__30;
wire	[32-1:0]				sintCosp__31;
wire	[32-1:0]				sintCosp__32;
wire	[32-1:0]				sintCosp__33;
wire	[32-1:0]				sintCosp__34;
wire	[32-1:0]				sintCosp__35;
wire	[32-1:0]				sintCosp__36;
wire	[32-1:0]				sintCosp__37;


//wire		[31:0]		sintSinp[37:0];


wire	[32-1:0]				sintSinp__0;
wire	[32-1:0]				sintSinp__1;
wire	[32-1:0]				sintSinp__2;
wire	[32-1:0]				sintSinp__3;
wire	[32-1:0]				sintSinp__4;
wire	[32-1:0]				sintSinp__5;
wire	[32-1:0]				sintSinp__6;
wire	[32-1:0]				sintSinp__7;
wire	[32-1:0]				sintSinp__8;
wire	[32-1:0]				sintSinp__9;
wire	[32-1:0]				sintSinp__10;
wire	[32-1:0]				sintSinp__11;
wire	[32-1:0]				sintSinp__12;
wire	[32-1:0]				sintSinp__13;
wire	[32-1:0]				sintSinp__14;
wire	[32-1:0]				sintSinp__15;
wire	[32-1:0]				sintSinp__16;
wire	[32-1:0]				sintSinp__17;
wire	[32-1:0]				sintSinp__18;
wire	[32-1:0]				sintSinp__19;
wire	[32-1:0]				sintSinp__20;
wire	[32-1:0]				sintSinp__21;
wire	[32-1:0]				sintSinp__22;
wire	[32-1:0]				sintSinp__23;
wire	[32-1:0]				sintSinp__24;
wire	[32-1:0]				sintSinp__25;
wire	[32-1:0]				sintSinp__26;
wire	[32-1:0]				sintSinp__27;
wire	[32-1:0]				sintSinp__28;
wire	[32-1:0]				sintSinp__29;
wire	[32-1:0]				sintSinp__30;
wire	[32-1:0]				sintSinp__31;
wire	[32-1:0]				sintSinp__32;
wire	[32-1:0]				sintSinp__33;
wire	[32-1:0]				sintSinp__34;
wire	[32-1:0]				sintSinp__35;
wire	[32-1:0]				sintSinp__36;
wire	[32-1:0]				sintSinp__37;


//wire		[63:0]		uz2[37:0];


wire	[63:0]				uz2__0;
wire	[63:0]				uz2__1;
wire	[63:0]				uz2__2;
wire	[63:0]				uz2__3;
wire	[63:0]				uz2__4;
wire	[63:0]				uz2__5;
wire	[63:0]				uz2__6;
wire	[63:0]				uz2__7;
wire	[63:0]				uz2__8;
wire	[63:0]				uz2__9;
wire	[63:0]				uz2__10;
wire	[63:0]				uz2__11;
wire	[63:0]				uz2__12;
wire	[63:0]				uz2__13;
wire	[63:0]				uz2__14;
wire	[63:0]				uz2__15;
wire	[63:0]				uz2__16;
wire	[63:0]				uz2__17;
wire	[63:0]				uz2__18;
wire	[63:0]				uz2__19;
wire	[63:0]				uz2__20;
wire	[63:0]				uz2__21;
wire	[63:0]				uz2__22;
wire	[63:0]				uz2__23;
wire	[63:0]				uz2__24;
wire	[63:0]				uz2__25;
wire	[63:0]				uz2__26;
wire	[63:0]				uz2__27;
wire	[63:0]				uz2__28;
wire	[63:0]				uz2__29;
wire	[63:0]				uz2__30;
wire	[63:0]				uz2__31;
wire	[63:0]				uz2__32;
wire	[63:0]				uz2__33;
wire	[63:0]				uz2__34;
wire	[63:0]				uz2__35;
wire	[63:0]				uz2__36;
wire	[63:0]				uz2__37;


//wire		[31:0]		uxUz[37:0];

wire	[32-1:0]				uxUz__0;
wire	[32-1:0]				uxUz__1;
wire	[32-1:0]				uxUz__2;
wire	[32-1:0]				uxUz__3;
wire	[32-1:0]				uxUz__4;
wire	[32-1:0]				uxUz__5;
wire	[32-1:0]				uxUz__6;
wire	[32-1:0]				uxUz__7;
wire	[32-1:0]				uxUz__8;
wire	[32-1:0]				uxUz__9;
wire	[32-1:0]				uxUz__10;
wire	[32-1:0]				uxUz__11;
wire	[32-1:0]				uxUz__12;
wire	[32-1:0]				uxUz__13;
wire	[32-1:0]				uxUz__14;
wire	[32-1:0]				uxUz__15;
wire	[32-1:0]				uxUz__16;
wire	[32-1:0]				uxUz__17;
wire	[32-1:0]				uxUz__18;
wire	[32-1:0]				uxUz__19;
wire	[32-1:0]				uxUz__20;
wire	[32-1:0]				uxUz__21;
wire	[32-1:0]				uxUz__22;
wire	[32-1:0]				uxUz__23;
wire	[32-1:0]				uxUz__24;
wire	[32-1:0]				uxUz__25;
wire	[32-1:0]				uxUz__26;
wire	[32-1:0]				uxUz__27;
wire	[32-1:0]				uxUz__28;
wire	[32-1:0]				uxUz__29;
wire	[32-1:0]				uxUz__30;
wire	[32-1:0]				uxUz__31;
wire	[32-1:0]				uxUz__32;
wire	[32-1:0]				uxUz__33;
wire	[32-1:0]				uxUz__34;
wire	[32-1:0]				uxUz__35;
wire	[32-1:0]				uxUz__36;
wire	[32-1:0]				uxUz__37;


//wire		[31:0]		uyUz[37:0];


wire	[32-1:0]				uyUz__0;
wire	[32-1:0]				uyUz__1;
wire	[32-1:0]				uyUz__2;
wire	[32-1:0]				uyUz__3;
wire	[32-1:0]				uyUz__4;
wire	[32-1:0]				uyUz__5;
wire	[32-1:0]				uyUz__6;
wire	[32-1:0]				uyUz__7;
wire	[32-1:0]				uyUz__8;
wire	[32-1:0]				uyUz__9;
wire	[32-1:0]				uyUz__10;
wire	[32-1:0]				uyUz__11;
wire	[32-1:0]				uyUz__12;
wire	[32-1:0]				uyUz__13;
wire	[32-1:0]				uyUz__14;
wire	[32-1:0]				uyUz__15;
wire	[32-1:0]				uyUz__16;
wire	[32-1:0]				uyUz__17;
wire	[32-1:0]				uyUz__18;
wire	[32-1:0]				uyUz__19;
wire	[32-1:0]				uyUz__20;
wire	[32-1:0]				uyUz__21;
wire	[32-1:0]				uyUz__22;
wire	[32-1:0]				uyUz__23;
wire	[32-1:0]				uyUz__24;
wire	[32-1:0]				uyUz__25;
wire	[32-1:0]				uyUz__26;
wire	[32-1:0]				uyUz__27;
wire	[32-1:0]				uyUz__28;
wire	[32-1:0]				uyUz__29;
wire	[32-1:0]				uyUz__30;
wire	[32-1:0]				uyUz__31;
wire	[32-1:0]				uyUz__32;
wire	[32-1:0]				uyUz__33;
wire	[32-1:0]				uyUz__34;
wire	[32-1:0]				uyUz__35;
wire	[32-1:0]				uyUz__36;
wire	[32-1:0]				uyUz__37;

//wire		[31:0]		uySintSinp[37:0];


wire	[32-1:0]				uySintSinp__0;
wire	[32-1:0]				uySintSinp__1;
wire	[32-1:0]				uySintSinp__2;
wire	[32-1:0]				uySintSinp__3;
wire	[32-1:0]				uySintSinp__4;
wire	[32-1:0]				uySintSinp__5;
wire	[32-1:0]				uySintSinp__6;
wire	[32-1:0]				uySintSinp__7;
wire	[32-1:0]				uySintSinp__8;
wire	[32-1:0]				uySintSinp__9;
wire	[32-1:0]				uySintSinp__10;
wire	[32-1:0]				uySintSinp__11;
wire	[32-1:0]				uySintSinp__12;
wire	[32-1:0]				uySintSinp__13;
wire	[32-1:0]				uySintSinp__14;
wire	[32-1:0]				uySintSinp__15;
wire	[32-1:0]				uySintSinp__16;
wire	[32-1:0]				uySintSinp__17;
wire	[32-1:0]				uySintSinp__18;
wire	[32-1:0]				uySintSinp__19;
wire	[32-1:0]				uySintSinp__20;
wire	[32-1:0]				uySintSinp__21;
wire	[32-1:0]				uySintSinp__22;
wire	[32-1:0]				uySintSinp__23;
wire	[32-1:0]				uySintSinp__24;
wire	[32-1:0]				uySintSinp__25;
wire	[32-1:0]				uySintSinp__26;
wire	[32-1:0]				uySintSinp__27;
wire	[32-1:0]				uySintSinp__28;
wire	[32-1:0]				uySintSinp__29;
wire	[32-1:0]				uySintSinp__30;
wire	[32-1:0]				uySintSinp__31;
wire	[32-1:0]				uySintSinp__32;
wire	[32-1:0]				uySintSinp__33;
wire	[32-1:0]				uySintSinp__34;
wire	[32-1:0]				uySintSinp__35;
wire	[32-1:0]				uySintSinp__36;
wire	[32-1:0]				uySintSinp__37;


//wire		[63:0]		oneMinusUz2[37:0];


wire	[63:0]				oneMinusUz2__0;
wire	[63:0]				oneMinusUz2__1;
wire	[63:0]				oneMinusUz2__2;
wire	[63:0]				oneMinusUz2__3;
wire	[63:0]				oneMinusUz2__4;
wire	[63:0]				oneMinusUz2__5;
wire	[63:0]				oneMinusUz2__6;
wire	[63:0]				oneMinusUz2__7;
wire	[63:0]				oneMinusUz2__8;
wire	[63:0]				oneMinusUz2__9;
wire	[63:0]				oneMinusUz2__10;
wire	[63:0]				oneMinusUz2__11;
wire	[63:0]				oneMinusUz2__12;
wire	[63:0]				oneMinusUz2__13;
wire	[63:0]				oneMinusUz2__14;
wire	[63:0]				oneMinusUz2__15;
wire	[63:0]				oneMinusUz2__16;
wire	[63:0]				oneMinusUz2__17;
wire	[63:0]				oneMinusUz2__18;
wire	[63:0]				oneMinusUz2__19;
wire	[63:0]				oneMinusUz2__20;
wire	[63:0]				oneMinusUz2__21;
wire	[63:0]				oneMinusUz2__22;
wire	[63:0]				oneMinusUz2__23;
wire	[63:0]				oneMinusUz2__24;
wire	[63:0]				oneMinusUz2__25;
wire	[63:0]				oneMinusUz2__26;
wire	[63:0]				oneMinusUz2__27;
wire	[63:0]				oneMinusUz2__28;
wire	[63:0]				oneMinusUz2__29;
wire	[63:0]				oneMinusUz2__30;
wire	[63:0]				oneMinusUz2__31;
wire	[63:0]				oneMinusUz2__32;
wire	[63:0]				oneMinusUz2__33;
wire	[63:0]				oneMinusUz2__34;
wire	[63:0]				oneMinusUz2__35;
wire	[63:0]				oneMinusUz2__36;
wire	[63:0]				oneMinusUz2__37;


//wire		[31:0]		uyUzSintCosp[37:0];


wire	[32-1:0]				uyUzSintCosp__0;
wire	[32-1:0]				uyUzSintCosp__1;
wire	[32-1:0]				uyUzSintCosp__2;
wire	[32-1:0]				uyUzSintCosp__3;
wire	[32-1:0]				uyUzSintCosp__4;
wire	[32-1:0]				uyUzSintCosp__5;
wire	[32-1:0]				uyUzSintCosp__6;
wire	[32-1:0]				uyUzSintCosp__7;
wire	[32-1:0]				uyUzSintCosp__8;
wire	[32-1:0]				uyUzSintCosp__9;
wire	[32-1:0]				uyUzSintCosp__10;
wire	[32-1:0]				uyUzSintCosp__11;
wire	[32-1:0]				uyUzSintCosp__12;
wire	[32-1:0]				uyUzSintCosp__13;
wire	[32-1:0]				uyUzSintCosp__14;
wire	[32-1:0]				uyUzSintCosp__15;
wire	[32-1:0]				uyUzSintCosp__16;
wire	[32-1:0]				uyUzSintCosp__17;
wire	[32-1:0]				uyUzSintCosp__18;
wire	[32-1:0]				uyUzSintCosp__19;
wire	[32-1:0]				uyUzSintCosp__20;
wire	[32-1:0]				uyUzSintCosp__21;
wire	[32-1:0]				uyUzSintCosp__22;
wire	[32-1:0]				uyUzSintCosp__23;
wire	[32-1:0]				uyUzSintCosp__24;
wire	[32-1:0]				uyUzSintCosp__25;
wire	[32-1:0]				uyUzSintCosp__26;
wire	[32-1:0]				uyUzSintCosp__27;
wire	[32-1:0]				uyUzSintCosp__28;
wire	[32-1:0]				uyUzSintCosp__29;
wire	[32-1:0]				uyUzSintCosp__30;
wire	[32-1:0]				uyUzSintCosp__31;
wire	[32-1:0]				uyUzSintCosp__32;
wire	[32-1:0]				uyUzSintCosp__33;
wire	[32-1:0]				uyUzSintCosp__34;
wire	[32-1:0]				uyUzSintCosp__35;
wire	[32-1:0]				uyUzSintCosp__36;
wire	[32-1:0]				uyUzSintCosp__37;


//wire		[31:0]		uxUzSintCosp[37:0];


wire	[32-1:0]				uxUzSintCosp__0;
wire	[32-1:0]				uxUzSintCosp__1;
wire	[32-1:0]				uxUzSintCosp__2;
wire	[32-1:0]				uxUzSintCosp__3;
wire	[32-1:0]				uxUzSintCosp__4;
wire	[32-1:0]				uxUzSintCosp__5;
wire	[32-1:0]				uxUzSintCosp__6;
wire	[32-1:0]				uxUzSintCosp__7;
wire	[32-1:0]				uxUzSintCosp__8;
wire	[32-1:0]				uxUzSintCosp__9;
wire	[32-1:0]				uxUzSintCosp__10;
wire	[32-1:0]				uxUzSintCosp__11;
wire	[32-1:0]				uxUzSintCosp__12;
wire	[32-1:0]				uxUzSintCosp__13;
wire	[32-1:0]				uxUzSintCosp__14;
wire	[32-1:0]				uxUzSintCosp__15;
wire	[32-1:0]				uxUzSintCosp__16;
wire	[32-1:0]				uxUzSintCosp__17;
wire	[32-1:0]				uxUzSintCosp__18;
wire	[32-1:0]				uxUzSintCosp__19;
wire	[32-1:0]				uxUzSintCosp__20;
wire	[32-1:0]				uxUzSintCosp__21;
wire	[32-1:0]				uxUzSintCosp__22;
wire	[32-1:0]				uxUzSintCosp__23;
wire	[32-1:0]				uxUzSintCosp__24;
wire	[32-1:0]				uxUzSintCosp__25;
wire	[32-1:0]				uxUzSintCosp__26;
wire	[32-1:0]				uxUzSintCosp__27;
wire	[32-1:0]				uxUzSintCosp__28;
wire	[32-1:0]				uxUzSintCosp__29;
wire	[32-1:0]				uxUzSintCosp__30;
wire	[32-1:0]				uxUzSintCosp__31;
wire	[32-1:0]				uxUzSintCosp__32;
wire	[32-1:0]				uxUzSintCosp__33;
wire	[32-1:0]				uxUzSintCosp__34;
wire	[32-1:0]				uxUzSintCosp__35;
wire	[32-1:0]				uxUzSintCosp__36;
wire	[32-1:0]				uxUzSintCosp__37;


//wire		[31:0]		uxSintSinp[37:0];

wire	[32-1:0]				uxSintSinp__0;
wire	[32-1:0]				uxSintSinp__1;
wire	[32-1:0]				uxSintSinp__2;
wire	[32-1:0]				uxSintSinp__3;
wire	[32-1:0]				uxSintSinp__4;
wire	[32-1:0]				uxSintSinp__5;
wire	[32-1:0]				uxSintSinp__6;
wire	[32-1:0]				uxSintSinp__7;
wire	[32-1:0]				uxSintSinp__8;
wire	[32-1:0]				uxSintSinp__9;
wire	[32-1:0]				uxSintSinp__10;
wire	[32-1:0]				uxSintSinp__11;
wire	[32-1:0]				uxSintSinp__12;
wire	[32-1:0]				uxSintSinp__13;
wire	[32-1:0]				uxSintSinp__14;
wire	[32-1:0]				uxSintSinp__15;
wire	[32-1:0]				uxSintSinp__16;
wire	[32-1:0]				uxSintSinp__17;
wire	[32-1:0]				uxSintSinp__18;
wire	[32-1:0]				uxSintSinp__19;
wire	[32-1:0]				uxSintSinp__20;
wire	[32-1:0]				uxSintSinp__21;
wire	[32-1:0]				uxSintSinp__22;
wire	[32-1:0]				uxSintSinp__23;
wire	[32-1:0]				uxSintSinp__24;
wire	[32-1:0]				uxSintSinp__25;
wire	[32-1:0]				uxSintSinp__26;
wire	[32-1:0]				uxSintSinp__27;
wire	[32-1:0]				uxSintSinp__28;
wire	[32-1:0]				uxSintSinp__29;
wire	[32-1:0]				uxSintSinp__30;
wire	[32-1:0]				uxSintSinp__31;
wire	[32-1:0]				uxSintSinp__32;
wire	[32-1:0]				uxSintSinp__33;
wire	[32-1:0]				uxSintSinp__34;
wire	[32-1:0]				uxSintSinp__35;
wire	[32-1:0]				uxSintSinp__36;
wire	[32-1:0]				uxSintSinp__37;


//wire		[31:0]		sqrtOneMinusUz2[37:0];

wire	[32-1:0]				sqrtOneMinusUz2__0;
wire	[32-1:0]				sqrtOneMinusUz2__1;
wire	[32-1:0]				sqrtOneMinusUz2__2;
wire	[32-1:0]				sqrtOneMinusUz2__3;
wire	[32-1:0]				sqrtOneMinusUz2__4;
wire	[32-1:0]				sqrtOneMinusUz2__5;
wire	[32-1:0]				sqrtOneMinusUz2__6;
wire	[32-1:0]				sqrtOneMinusUz2__7;
wire	[32-1:0]				sqrtOneMinusUz2__8;
wire	[32-1:0]				sqrtOneMinusUz2__9;
wire	[32-1:0]				sqrtOneMinusUz2__10;
wire	[32-1:0]				sqrtOneMinusUz2__11;
wire	[32-1:0]				sqrtOneMinusUz2__12;
wire	[32-1:0]				sqrtOneMinusUz2__13;
wire	[32-1:0]				sqrtOneMinusUz2__14;
wire	[32-1:0]				sqrtOneMinusUz2__15;
wire	[32-1:0]				sqrtOneMinusUz2__16;
wire	[32-1:0]				sqrtOneMinusUz2__17;
wire	[32-1:0]				sqrtOneMinusUz2__18;
wire	[32-1:0]				sqrtOneMinusUz2__19;
wire	[32-1:0]				sqrtOneMinusUz2__20;
wire	[32-1:0]				sqrtOneMinusUz2__21;
wire	[32-1:0]				sqrtOneMinusUz2__22;
wire	[32-1:0]				sqrtOneMinusUz2__23;
wire	[32-1:0]				sqrtOneMinusUz2__24;
wire	[32-1:0]				sqrtOneMinusUz2__25;
wire	[32-1:0]				sqrtOneMinusUz2__26;
wire	[32-1:0]				sqrtOneMinusUz2__27;
wire	[32-1:0]				sqrtOneMinusUz2__28;
wire	[32-1:0]				sqrtOneMinusUz2__29;
wire	[32-1:0]				sqrtOneMinusUz2__30;
wire	[32-1:0]				sqrtOneMinusUz2__31;
wire	[32-1:0]				sqrtOneMinusUz2__32;
wire	[32-1:0]				sqrtOneMinusUz2__33;
wire	[32-1:0]				sqrtOneMinusUz2__34;
wire	[32-1:0]				sqrtOneMinusUz2__35;
wire	[32-1:0]				sqrtOneMinusUz2__36;
wire	[32-1:0]				sqrtOneMinusUz2__37;

//wire		[31:0]		sintCospSqrtOneMinusUz2[37:0];


wire	[32-1:0]				sintCospSqrtOneMinusUz2__0;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__1;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__2;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__3;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__4;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__5;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__6;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__7;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__8;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__9;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__10;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__11;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__12;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__13;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__14;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__15;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__16;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__17;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__18;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__19;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__20;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__21;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__22;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__23;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__24;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__25;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__26;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__27;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__28;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__29;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__30;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__31;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__32;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__33;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__34;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__35;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__36;
wire	[32-1:0]				sintCospSqrtOneMinusUz2__37;

//wire		[31:0]		uxCost[37:0];


wire	[32-1:0]				uxCost__0;
wire	[32-1:0]				uxCost__1;
wire	[32-1:0]				uxCost__2;
wire	[32-1:0]				uxCost__3;
wire	[32-1:0]				uxCost__4;
wire	[32-1:0]				uxCost__5;
wire	[32-1:0]				uxCost__6;
wire	[32-1:0]				uxCost__7;
wire	[32-1:0]				uxCost__8;
wire	[32-1:0]				uxCost__9;
wire	[32-1:0]				uxCost__10;
wire	[32-1:0]				uxCost__11;
wire	[32-1:0]				uxCost__12;
wire	[32-1:0]				uxCost__13;
wire	[32-1:0]				uxCost__14;
wire	[32-1:0]				uxCost__15;
wire	[32-1:0]				uxCost__16;
wire	[32-1:0]				uxCost__17;
wire	[32-1:0]				uxCost__18;
wire	[32-1:0]				uxCost__19;
wire	[32-1:0]				uxCost__20;
wire	[32-1:0]				uxCost__21;
wire	[32-1:0]				uxCost__22;
wire	[32-1:0]				uxCost__23;
wire	[32-1:0]				uxCost__24;
wire	[32-1:0]				uxCost__25;
wire	[32-1:0]				uxCost__26;
wire	[32-1:0]				uxCost__27;
wire	[32-1:0]				uxCost__28;
wire	[32-1:0]				uxCost__29;
wire	[32-1:0]				uxCost__30;
wire	[32-1:0]				uxCost__31;
wire	[32-1:0]				uxCost__32;
wire	[32-1:0]				uxCost__33;
wire	[32-1:0]				uxCost__34;
wire	[32-1:0]				uxCost__35;
wire	[32-1:0]				uxCost__36;
wire	[32-1:0]				uxCost__37;

//wire		[31:0]		uzCost[37:0];


wire	[32-1:0]				uzCost__0;
wire	[32-1:0]				uzCost__1;
wire	[32-1:0]				uzCost__2;
wire	[32-1:0]				uzCost__3;
wire	[32-1:0]				uzCost__4;
wire	[32-1:0]				uzCost__5;
wire	[32-1:0]				uzCost__6;
wire	[32-1:0]				uzCost__7;
wire	[32-1:0]				uzCost__8;
wire	[32-1:0]				uzCost__9;
wire	[32-1:0]				uzCost__10;
wire	[32-1:0]				uzCost__11;
wire	[32-1:0]				uzCost__12;
wire	[32-1:0]				uzCost__13;
wire	[32-1:0]				uzCost__14;
wire	[32-1:0]				uzCost__15;
wire	[32-1:0]				uzCost__16;
wire	[32-1:0]				uzCost__17;
wire	[32-1:0]				uzCost__18;
wire	[32-1:0]				uzCost__19;
wire	[32-1:0]				uzCost__20;
wire	[32-1:0]				uzCost__21;
wire	[32-1:0]				uzCost__22;
wire	[32-1:0]				uzCost__23;
wire	[32-1:0]				uzCost__24;
wire	[32-1:0]				uzCost__25;
wire	[32-1:0]				uzCost__26;
wire	[32-1:0]				uzCost__27;
wire	[32-1:0]				uzCost__28;
wire	[32-1:0]				uzCost__29;
wire	[32-1:0]				uzCost__30;
wire	[32-1:0]				uzCost__31;
wire	[32-1:0]				uzCost__32;
wire	[32-1:0]				uzCost__33;
wire	[32-1:0]				uzCost__34;
wire	[32-1:0]				uzCost__35;
wire	[32-1:0]				uzCost__36;
wire	[32-1:0]				uzCost__37;


//wire		[31:0]		sqrtOneMinusUz2_inv[37:0];


wire	[32-1:0]				sqrtOneMinusUz2_inv__0;
wire	[32-1:0]				sqrtOneMinusUz2_inv__1;
wire	[32-1:0]				sqrtOneMinusUz2_inv__2;
wire	[32-1:0]				sqrtOneMinusUz2_inv__3;
wire	[32-1:0]				sqrtOneMinusUz2_inv__4;
wire	[32-1:0]				sqrtOneMinusUz2_inv__5;
wire	[32-1:0]				sqrtOneMinusUz2_inv__6;
wire	[32-1:0]				sqrtOneMinusUz2_inv__7;
wire	[32-1:0]				sqrtOneMinusUz2_inv__8;
wire	[32-1:0]				sqrtOneMinusUz2_inv__9;
wire	[32-1:0]				sqrtOneMinusUz2_inv__10;
wire	[32-1:0]				sqrtOneMinusUz2_inv__11;
wire	[32-1:0]				sqrtOneMinusUz2_inv__12;
wire	[32-1:0]				sqrtOneMinusUz2_inv__13;
wire	[32-1:0]				sqrtOneMinusUz2_inv__14;
wire	[32-1:0]				sqrtOneMinusUz2_inv__15;
wire	[32-1:0]				sqrtOneMinusUz2_inv__16;
wire	[32-1:0]				sqrtOneMinusUz2_inv__17;
wire	[32-1:0]				sqrtOneMinusUz2_inv__18;
wire	[32-1:0]				sqrtOneMinusUz2_inv__19;
wire	[32-1:0]				sqrtOneMinusUz2_inv__20;
wire	[32-1:0]				sqrtOneMinusUz2_inv__21;
wire	[32-1:0]				sqrtOneMinusUz2_inv__22;
wire	[32-1:0]				sqrtOneMinusUz2_inv__23;
wire	[32-1:0]				sqrtOneMinusUz2_inv__24;
wire	[32-1:0]				sqrtOneMinusUz2_inv__25;
wire	[32-1:0]				sqrtOneMinusUz2_inv__26;
wire	[32-1:0]				sqrtOneMinusUz2_inv__27;
wire	[32-1:0]				sqrtOneMinusUz2_inv__28;
wire	[32-1:0]				sqrtOneMinusUz2_inv__29;
wire	[32-1:0]				sqrtOneMinusUz2_inv__30;
wire	[32-1:0]				sqrtOneMinusUz2_inv__31;
wire	[32-1:0]				sqrtOneMinusUz2_inv__32;
wire	[32-1:0]				sqrtOneMinusUz2_inv__33;
wire	[32-1:0]				sqrtOneMinusUz2_inv__34;
wire	[32-1:0]				sqrtOneMinusUz2_inv__35;
wire	[32-1:0]				sqrtOneMinusUz2_inv__36;
wire	[32-1:0]				sqrtOneMinusUz2_inv__37;

//wire		[31:0]		uxNumerator[37:0];


wire	[32-1:0]				uxNumerator__0;
wire	[32-1:0]				uxNumerator__1;
wire	[32-1:0]				uxNumerator__2;
wire	[32-1:0]				uxNumerator__3;
wire	[32-1:0]				uxNumerator__4;
wire	[32-1:0]				uxNumerator__5;
wire	[32-1:0]				uxNumerator__6;
wire	[32-1:0]				uxNumerator__7;
wire	[32-1:0]				uxNumerator__8;
wire	[32-1:0]				uxNumerator__9;
wire	[32-1:0]				uxNumerator__10;
wire	[32-1:0]				uxNumerator__11;
wire	[32-1:0]				uxNumerator__12;
wire	[32-1:0]				uxNumerator__13;
wire	[32-1:0]				uxNumerator__14;
wire	[32-1:0]				uxNumerator__15;
wire	[32-1:0]				uxNumerator__16;
wire	[32-1:0]				uxNumerator__17;
wire	[32-1:0]				uxNumerator__18;
wire	[32-1:0]				uxNumerator__19;
wire	[32-1:0]				uxNumerator__20;
wire	[32-1:0]				uxNumerator__21;
wire	[32-1:0]				uxNumerator__22;
wire	[32-1:0]				uxNumerator__23;
wire	[32-1:0]				uxNumerator__24;
wire	[32-1:0]				uxNumerator__25;
wire	[32-1:0]				uxNumerator__26;
wire	[32-1:0]				uxNumerator__27;
wire	[32-1:0]				uxNumerator__28;
wire	[32-1:0]				uxNumerator__29;
wire	[32-1:0]				uxNumerator__30;
wire	[32-1:0]				uxNumerator__31;
wire	[32-1:0]				uxNumerator__32;
wire	[32-1:0]				uxNumerator__33;
wire	[32-1:0]				uxNumerator__34;
wire	[32-1:0]				uxNumerator__35;
wire	[32-1:0]				uxNumerator__36;
wire	[32-1:0]				uxNumerator__37;

//wire		[31:0]		uyNumerator[37:0];


wire	[32-1:0]				uyNumerator__0;
wire	[32-1:0]				uyNumerator__1;
wire	[32-1:0]				uyNumerator__2;
wire	[32-1:0]				uyNumerator__3;
wire	[32-1:0]				uyNumerator__4;
wire	[32-1:0]				uyNumerator__5;
wire	[32-1:0]				uyNumerator__6;
wire	[32-1:0]				uyNumerator__7;
wire	[32-1:0]				uyNumerator__8;
wire	[32-1:0]				uyNumerator__9;
wire	[32-1:0]				uyNumerator__10;
wire	[32-1:0]				uyNumerator__11;
wire	[32-1:0]				uyNumerator__12;
wire	[32-1:0]				uyNumerator__13;
wire	[32-1:0]				uyNumerator__14;
wire	[32-1:0]				uyNumerator__15;
wire	[32-1:0]				uyNumerator__16;
wire	[32-1:0]				uyNumerator__17;
wire	[32-1:0]				uyNumerator__18;
wire	[32-1:0]				uyNumerator__19;
wire	[32-1:0]				uyNumerator__20;
wire	[32-1:0]				uyNumerator__21;
wire	[32-1:0]				uyNumerator__22;
wire	[32-1:0]				uyNumerator__23;
wire	[32-1:0]				uyNumerator__24;
wire	[32-1:0]				uyNumerator__25;
wire	[32-1:0]				uyNumerator__26;
wire	[32-1:0]				uyNumerator__27;
wire	[32-1:0]				uyNumerator__28;
wire	[32-1:0]				uyNumerator__29;
wire	[32-1:0]				uyNumerator__30;
wire	[32-1:0]				uyNumerator__31;
wire	[32-1:0]				uyNumerator__32;
wire	[32-1:0]				uyNumerator__33;
wire	[32-1:0]				uyNumerator__34;
wire	[32-1:0]				uyNumerator__35;
wire	[32-1:0]				uyNumerator__36;
wire	[32-1:0]				uyNumerator__37;

//wire		[31:0]		uyCost[37:0];


wire	[32-1:0]				uyCost__0;
wire	[32-1:0]				uyCost__1;
wire	[32-1:0]				uyCost__2;
wire	[32-1:0]				uyCost__3;
wire	[32-1:0]				uyCost__4;
wire	[32-1:0]				uyCost__5;
wire	[32-1:0]				uyCost__6;
wire	[32-1:0]				uyCost__7;
wire	[32-1:0]				uyCost__8;
wire	[32-1:0]				uyCost__9;
wire	[32-1:0]				uyCost__10;
wire	[32-1:0]				uyCost__11;
wire	[32-1:0]				uyCost__12;
wire	[32-1:0]				uyCost__13;
wire	[32-1:0]				uyCost__14;
wire	[32-1:0]				uyCost__15;
wire	[32-1:0]				uyCost__16;
wire	[32-1:0]				uyCost__17;
wire	[32-1:0]				uyCost__18;
wire	[32-1:0]				uyCost__19;
wire	[32-1:0]				uyCost__20;
wire	[32-1:0]				uyCost__21;
wire	[32-1:0]				uyCost__22;
wire	[32-1:0]				uyCost__23;
wire	[32-1:0]				uyCost__24;
wire	[32-1:0]				uyCost__25;
wire	[32-1:0]				uyCost__26;
wire	[32-1:0]				uyCost__27;
wire	[32-1:0]				uyCost__28;
wire	[32-1:0]				uyCost__29;
wire	[32-1:0]				uyCost__30;
wire	[32-1:0]				uyCost__31;
wire	[32-1:0]				uyCost__32;
wire	[32-1:0]				uyCost__33;
wire	[32-1:0]				uyCost__34;
wire	[32-1:0]				uyCost__35;
wire	[32-1:0]				uyCost__36;
wire	[32-1:0]				uyCost__37;

//wire		[31:0]		uxQuotient[37:0];


wire	[32-1:0]				uxQuotient__0;
wire	[32-1:0]				uxQuotient__1;
wire	[32-1:0]				uxQuotient__2;
wire	[32-1:0]				uxQuotient__3;
wire	[32-1:0]				uxQuotient__4;
wire	[32-1:0]				uxQuotient__5;
wire	[32-1:0]				uxQuotient__6;
wire	[32-1:0]				uxQuotient__7;
wire	[32-1:0]				uxQuotient__8;
wire	[32-1:0]				uxQuotient__9;
wire	[32-1:0]				uxQuotient__10;
wire	[32-1:0]				uxQuotient__11;
wire	[32-1:0]				uxQuotient__12;
wire	[32-1:0]				uxQuotient__13;
wire	[32-1:0]				uxQuotient__14;
wire	[32-1:0]				uxQuotient__15;
wire	[32-1:0]				uxQuotient__16;
wire	[32-1:0]				uxQuotient__17;
wire	[32-1:0]				uxQuotient__18;
wire	[32-1:0]				uxQuotient__19;
wire	[32-1:0]				uxQuotient__20;
wire	[32-1:0]				uxQuotient__21;
wire	[32-1:0]				uxQuotient__22;
wire	[32-1:0]				uxQuotient__23;
wire	[32-1:0]				uxQuotient__24;
wire	[32-1:0]				uxQuotient__25;
wire	[32-1:0]				uxQuotient__26;
wire	[32-1:0]				uxQuotient__27;
wire	[32-1:0]				uxQuotient__28;
wire	[32-1:0]				uxQuotient__29;
wire	[32-1:0]				uxQuotient__30;
wire	[32-1:0]				uxQuotient__31;
wire	[32-1:0]				uxQuotient__32;
wire	[32-1:0]				uxQuotient__33;
wire	[32-1:0]				uxQuotient__34;
wire	[32-1:0]				uxQuotient__35;
wire	[32-1:0]				uxQuotient__36;
wire	[32-1:0]				uxQuotient__37;

//wire		[31:0]		uyQuotient[37:0];


wire	[32-1:0]				uyQuotient__0;
wire	[32-1:0]				uyQuotient__1;
wire	[32-1:0]				uyQuotient__2;
wire	[32-1:0]				uyQuotient__3;
wire	[32-1:0]				uyQuotient__4;
wire	[32-1:0]				uyQuotient__5;
wire	[32-1:0]				uyQuotient__6;
wire	[32-1:0]				uyQuotient__7;
wire	[32-1:0]				uyQuotient__8;
wire	[32-1:0]				uyQuotient__9;
wire	[32-1:0]				uyQuotient__10;
wire	[32-1:0]				uyQuotient__11;
wire	[32-1:0]				uyQuotient__12;
wire	[32-1:0]				uyQuotient__13;
wire	[32-1:0]				uyQuotient__14;
wire	[32-1:0]				uyQuotient__15;
wire	[32-1:0]				uyQuotient__16;
wire	[32-1:0]				uyQuotient__17;
wire	[32-1:0]				uyQuotient__18;
wire	[32-1:0]				uyQuotient__19;
wire	[32-1:0]				uyQuotient__20;
wire	[32-1:0]				uyQuotient__21;
wire	[32-1:0]				uyQuotient__22;
wire	[32-1:0]				uyQuotient__23;
wire	[32-1:0]				uyQuotient__24;
wire	[32-1:0]				uyQuotient__25;
wire	[32-1:0]				uyQuotient__26;
wire	[32-1:0]				uyQuotient__27;
wire	[32-1:0]				uyQuotient__28;
wire	[32-1:0]				uyQuotient__29;
wire	[32-1:0]				uyQuotient__30;
wire	[32-1:0]				uyQuotient__31;
wire	[32-1:0]				uyQuotient__32;
wire	[32-1:0]				uyQuotient__33;
wire	[32-1:0]				uyQuotient__34;
wire	[32-1:0]				uyQuotient__35;
wire	[32-1:0]				uyQuotient__36;
wire	[32-1:0]				uyQuotient__37;

wire		[31:0]		new_sint;
wire		[31:0]		new_cost;
wire		[31:0]		new_sinp;
wire		[31:0]		new_cosp;
wire		[31:0]		new_sintCosp;
wire		[31:0]		new_sintSinp;
wire		[63:0]		new_uz2;
wire		[31:0]		new_uxUz;
wire		[31:0]		new_uyUz;
wire		[31:0]		new_uySintSinp;
wire		[63:0]		new_oneMinusUz2;
wire		[31:0]		new_uyUzSintCosp;
wire		[31:0]		new_uxUzSintCosp;
wire		[31:0]		new_uxSintSinp;
wire		[31:0]		new_sqrtOneMinusUz2;
wire		[31:0]		new_sintCospSqrtOneMinusUz2;
wire		[31:0]		new_uxCost;
wire		[31:0]		new_uzCost;
wire		[31:0]		new_sqrtOneMinusUz2_inv;
wire		[31:0]		new_uxNumerator;
wire		[31:0]		new_uyNumerator;
wire		[31:0]		new_uyCost;
reg		[31:0]		new_uxQuotient;
reg		[31:0]		new_uyQuotient;


//Wiring for calculating final values
wire				uxNumerOverflow;
wire				uyNumerOverflow;
reg					normalIncident;
wire		[31:0]		ux_add_1;
wire		[31:0]		ux_add_2;
wire					uxOverflow;
wire		[31:0]		uy_add_1;
wire		[31:0]		uy_add_2;
wire					uyOverflow;
wire		[31:0]		normalUz;
wire		[31:0]		uz_sub_1;
wire		[31:0]		uz_sub_2;
wire					uzOverflow;
	
wire		[31:0]		new_ux;
wire		[31:0]		new_uy;
wire		[31:0]		new_uz;

wire				div_overflow;
wire				toAnd1_36_1;
wire				toAnd1_36_2;
wire				overflow1_36;
wire				negOverflow1_36;
wire				toAnd2_36_1;
wire				toAnd2_36_2;
wire				overflow2_36;
wire				negOverflow2_36;



//------------------Register Pipeline-----------------
//Generation Methodology: Standard block, called InternalsBlock, is
//repeated multiple times, based on the latency of the reflector and
//scatterer.  This block contains the list of all internal variables
//that need to be registered and passed along in the pipeline.
//
//Previous values in the pipeline are passed to the next register on each
//clock tick.  The exception comes when an internal variable gets
//calculated.  Each time a new internal variable is calculated, a new
//case is added to the case statement, and instead of hooking previous
//values of that variable to next, the new, calculated values are hooked up.
//
//This method will generate many more registers than what are required, but
//it is expected that the synthesis tool will synthesize these away.
//
//
//Commenting Convention: Whenever a new value is injected into the pipe, the
//comment //Changed Value is added directly above the variable in question.
//When multiple values are calculated in a single clock cycle, multiple such
//comments are placed.  Wires connected to "Changed Values" always start with
//the prefix new_.
//
//GENERATE PIPELINE
//genvar i;
//generate
//	for(i=`LAT; i>0; i=i-1) begin: internalPipe
//		case(i)
//		
//		2:
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			//Changed Value
//			.i_uz2(new_uz2),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		3:
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			//Changed Value
//			.i_oneMinusUz2(new_oneMinusUz2),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		4:
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			//Changed Value
//			.i_uxUz(new_uxUz),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		(`SQRT+6):
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			//Changed Value
//			.i_sqrtOneMinusUz2(new_sqrtOneMinusUz2),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		
//		(`SQRT+`DIV+3):
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			//Changed Value
//			.i_sint(new_sint),
//			//Changed Value
//			.i_cost(new_cost),
//			//Changed Value
//			.i_sinp(new_sinp),
//			//Changed Value
//			.i_cosp(new_cosp),
//			//Changed Value
//			.i_sintCosp(new_sintCosp),
//			//Changed Value
//			.i_sintSinp(new_sintSinp),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			//Changed Value
//			.i_uyUz(new_uyUz),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		
//		(`SQRT+`DIV+4):
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			//Changed Value
//			.i_uySintSinp(new_uySintSinp),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			//Changed Value
//			.i_uyUzSintCosp(new_uyUzSintCosp),
//			//Changed Value
//			.i_uxUzSintCosp(new_uxUzSintCosp),
//			//Changed Value
//			.i_uxSintSinp(new_uxSintSinp),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		
//		(`SQRT+`DIV+5):
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			//Changed Value
//			.i_sqrtOneMinusUz2_inv(new_sqrtOneMinusUz2_inv),
//			//Changed Value
//			.i_uxNumerator(new_uxNumerator),
//			//Changed Value
//			.i_uyNumerator(new_uyNumerator),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		
//		(`SQRT+`DIV+6):
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			//Changed Value
//			.i_sintCospSqrtOneMinusUz2(new_sintCospSqrtOneMinusUz2),
//			//Changed Value
//			.i_uxCost(new_uxCost),
//			//Changed Value
//			.i_uzCost(new_uzCost),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			//Changed Value
//			.i_uyCost(new_uyCost),
//			//Changed Value
//			.i_uxQuotient(new_uxQuotient),
//			//Changed Value
//			.i_uyQuotient(new_uyQuotient),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		
//		default:
//		InternalsBlock pipeReg(
//			//Inputs
//			.clock(clock),
//			.reset(reset),
//			.enable(enable),
//			
//			.i_sint(sint[i-1]),
//			.i_cost(cost[i-1]),
//			.i_sinp(sinp[i-1]),
//			.i_cosp(cosp[i-1]),
//			.i_sintCosp(sintCosp[i-1]),
//			.i_sintSinp(sintSinp[i-1]),
//			.i_uz2(uz2[i-1]),
//			.i_uxUz(uxUz[i-1]),
//			.i_uyUz(uyUz[i-1]),
//			.i_uySintSinp(uySintSinp[i-1]),
//			.i_oneMinusUz2(oneMinusUz2[i-1]),
//			.i_uyUzSintCosp(uyUzSintCosp[i-1]),
//			.i_uxUzSintCosp(uxUzSintCosp[i-1]),
//			.i_uxSintSinp(uxSintSinp[i-1]),
//			.i_sqrtOneMinusUz2(sqrtOneMinusUz2[i-1]),
//			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i-1]),
//			.i_uxCost(uxCost[i-1]),
//			.i_uzCost(uzCost[i-1]),
//			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i-1]),
//			.i_uxNumerator(uxNumerator[i-1]),
//			.i_uyNumerator(uyNumerator[i-1]),
//			.i_uyCost(uyCost[i-1]),
//			.i_uxQuotient(uxQuotient[i-1]),
//			.i_uyQuotient(uyQuotient[i-1]),
//			
//			//Outputs			
//			.o_sint(sint[i]),
//			.o_cost(cost[i]),
//			.o_sinp(sinp[i]),
//			.o_cosp(cosp[i]),
//			.o_sintCosp(sintCosp[i]),
//			.o_sintSinp(sintSinp[i]),
//			.o_uz2(uz2[i]),
//			.o_uxUz(uxUz[i]),
//			.o_uyUz(uyUz[i]),
//			.o_uySintSinp(uySintSinp[i]),
//			.o_oneMinusUz2(oneMinusUz2[i]),
//			.o_uyUzSintCosp(uyUzSintCosp[i]),
//			.o_uxUzSintCosp(uxUzSintCosp[i]),
//			.o_uxSintSinp(uxSintSinp[i]),
//			.o_sqrtOneMinusUz2(sqrtOneMinusUz2[i]),
//			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2[i]),
//			.o_uxCost(uxCost[i]),
//			.o_uzCost(uzCost[i]),
//			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv[i]),
//			.o_uxNumerator(uxNumerator[i]),
//			.o_uyNumerator(uyNumerator[i]),
//			.o_uyCost(uyCost[i]),
//			.o_uxQuotient(uxQuotient[i]),
//			.o_uyQuotient(uyQuotient[i])
//		);
//		endcase
//	end
//endgenerate	

//Expanded generate loop:
//special cases first
		//forloop2
		InternalsBlock pipeReg2(
			//Inputs
			.clock(clock),
			.reset(reset),
			.enable(enable),
			
			.i_sint(sint__1),
			.i_cost(cost__1),
			.i_sinp(sinp__1),
			.i_cosp(cosp__1),
			.i_sintCosp(sintCosp__1),
			.i_sintSinp(sintSinp__1),
			//Changed Value
			.i_uz2(new_uz2),
			.i_uxUz(uxUz__1),
			.i_uyUz(uyUz__1),
			.i_uySintSinp(uySintSinp__1),
			.i_oneMinusUz2(oneMinusUz2__1),
			.i_uyUzSintCosp(uyUzSintCosp__1),
			.i_uxUzSintCosp(uxUzSintCosp__1),
			.i_uxSintSinp(uxSintSinp__1),
			.i_sqrtOneMinusUz2(sqrtOneMinusUz2__1),
			.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__1),
			.i_uxCost(uxCost__1),
			.i_uzCost(uzCost__1),
			.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__1),
			.i_uxNumerator(uxNumerator__1),
			.i_uyNumerator(uyNumerator__1),
			.i_uyCost(uyCost__1),
			.i_uxQuotient(uxQuotient__1),
			.i_uyQuotient(uyQuotient__1),
			
			//Outputs			
			.o_sint(sint__2),
			.o_cost(cost__2),
			.o_sinp(sinp__2),
			.o_cosp(cosp__2),
			.o_sintCosp(sintCosp__2),
			.o_sintSinp(sintSinp__2),
			.o_uz2(uz2__2),
			.o_uxUz(uxUz__2),
			.o_uyUz(uyUz__2),
			.o_uySintSinp(uySintSinp__2),
			.o_oneMinusUz2(oneMinusUz2__2),
			.o_uyUzSintCosp(uyUzSintCosp__2),
			.o_uxUzSintCosp(uxUzSintCosp__2),
			.o_uxSintSinp(uxSintSinp__2),
			.o_sqrtOneMinusUz2(sqrtOneMinusUz2__2),
			.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__2),
			.o_uxCost(uxCost__2),
			.o_uzCost(uzCost__2),
			.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__2),
			.o_uxNumerator(uxNumerator__2),
			.o_uyNumerator(uyNumerator__2),
			.o_uyCost(uyCost__2),
			.o_uxQuotient(uxQuotient__2),
			.o_uyQuotient(uyQuotient__2)
		);
		
		
	//	forloop3
		InternalsBlock pipeReg3(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__2),
.i_cost(cost__2),
.i_sinp(sinp__2),
.i_cosp(cosp__2),
.i_sintCosp(sintCosp__2),
.i_sintSinp(sintSinp__2),
.i_uz2(uz2__2),
.i_uxUz(uxUz__2),
.i_uyUz(uyUz__2),
.i_uySintSinp(uySintSinp__2),
//changed
.i_oneMinusUz2(new_oneMinusUz2),
.i_uyUzSintCosp(uyUzSintCosp__2),
.i_uxUzSintCosp(uxUzSintCosp__2),
.i_uxSintSinp(uxSintSinp__2),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__2),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__2),
.i_uxCost(uxCost__2),
.i_uzCost(uzCost__2),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__2),
.i_uxNumerator(uxNumerator__2),
.i_uyNumerator(uyNumerator__2),
.i_uyCost(uyCost__2),
.i_uxQuotient(uxQuotient__2),
.i_uyQuotient(uyQuotient__2),
//Outputs			 
.o_sint(sint__3),
.o_cost(cost__3),
.o_sinp(sinp__3),
.o_cosp(cosp__3),
.o_sintCosp(sintCosp__3),
.o_sintSinp(sintSinp__3),
.o_uz2(uz2__3),
.o_uxUz(uxUz__3),
.o_uyUz(uyUz__3),
.o_uySintSinp(uySintSinp__3),
.o_oneMinusUz2(oneMinusUz2__3),
.o_uyUzSintCosp(uyUzSintCosp__3),
.o_uxUzSintCosp(uxUzSintCosp__3),
.o_uxSintSinp(uxSintSinp__3),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__3),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__3),
.o_uxCost(uxCost__3),
.o_uzCost(uzCost__3),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__3),
.o_uxNumerator(uxNumerator__3),
.o_uyNumerator(uyNumerator__3),
.o_uyCost(uyCost__3),
.o_uxQuotient(uxQuotient__3),
.o_uyQuotient(uyQuotient__3)
);  

		//forloop4:
		InternalsBlock pipeReg4(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__3),
.i_cost(cost__3),
.i_sinp(sinp__3),
.i_cosp(cosp__3),
.i_sintCosp(sintCosp__3),
.i_sintSinp(sintSinp__3),
.i_uz2(uz2__3),
//changed
.i_uxUz(new_uxUz),
.i_uyUz(uyUz__3),
.i_uySintSinp(uySintSinp__3),
.i_oneMinusUz2(oneMinusUz2__3),
.i_uyUzSintCosp(uyUzSintCosp__3),
.i_uxUzSintCosp(uxUzSintCosp__3),
.i_uxSintSinp(uxSintSinp__3),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__3),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__3),
.i_uxCost(uxCost__3),
.i_uzCost(uzCost__3),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__3),
.i_uxNumerator(uxNumerator__3),
.i_uyNumerator(uyNumerator__3),
.i_uyCost(uyCost__3),
.i_uxQuotient(uxQuotient__3),
.i_uyQuotient(uyQuotient__3),
//Outputs			 
.o_sint(sint__4),
.o_cost(cost__4),
.o_sinp(sinp__4),
.o_cosp(cosp__4),
.o_sintCosp(sintCosp__4),
.o_sintSinp(sintSinp__4),
.o_uz2(uz2__4),
.o_uxUz(uxUz__4),
.o_uyUz(uyUz__4),
.o_uySintSinp(uySintSinp__4),
.o_oneMinusUz2(oneMinusUz2__4),
.o_uyUzSintCosp(uyUzSintCosp__4),
.o_uxUzSintCosp(uxUzSintCosp__4),
.o_uxSintSinp(uxSintSinp__4),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__4),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__4),
.o_uxCost(uxCost__4),
.o_uzCost(uzCost__4),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__4),
.o_uxNumerator(uxNumerator__4),
.o_uyNumerator(uyNumerator__4),
.o_uyCost(uyCost__4),
.o_uxQuotient(uxQuotient__4),
.o_uyQuotient(uyQuotient__4)
);  
		
InternalsBlock pipeReg16(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__15),
.i_cost(cost__15),
.i_sinp(sinp__15),
.i_cosp(cosp__15),
.i_sintCosp(sintCosp__15),
.i_sintSinp(sintSinp__15),
.i_uz2(uz2__15),
.i_uxUz(uxUz__15),
.i_uyUz(uyUz__15),
.i_uySintSinp(uySintSinp__15),
.i_oneMinusUz2(oneMinusUz2__15),
.i_uyUzSintCosp(uyUzSintCosp__15),
.i_uxUzSintCosp(uxUzSintCosp__15),
.i_uxSintSinp(uxSintSinp__15),
//changed
.i_sqrtOneMinusUz2(new_sqrtOneMinusUz2),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__15),
.i_uxCost(uxCost__15),
.i_uzCost(uzCost__15),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__15),
.i_uxNumerator(uxNumerator__15),
.i_uyNumerator(uyNumerator__15),
.i_uyCost(uyCost__15),
.i_uxQuotient(uxQuotient__15),
.i_uyQuotient(uyQuotient__15),
//Outputs			 
.o_sint(sint__16),
.o_cost(cost__16),
.o_sinp(sinp__16),
.o_cosp(cosp__16),
.o_sintCosp(sintCosp__16),
.o_sintSinp(sintSinp__16),
.o_uz2(uz2__16),
.o_uxUz(uxUz__16),
.o_uyUz(uyUz__16),
.o_uySintSinp(uySintSinp__16),
.o_oneMinusUz2(oneMinusUz2__16),
.o_uyUzSintCosp(uyUzSintCosp__16),
.o_uxUzSintCosp(uxUzSintCosp__16),
.o_uxSintSinp(uxSintSinp__16),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__16),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__16),
.o_uxCost(uxCost__16),
.o_uzCost(uzCost__16),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__16),
.o_uxNumerator(uxNumerator__16),
.o_uyNumerator(uyNumerator__16),
.o_uyCost(uyCost__16),
.o_uxQuotient(uxQuotient__16),
.o_uyQuotient(uyQuotient__16)
);  
		
		//forloop 33 (10+20+3):
		
InternalsBlock pipeReg33(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
//changed
.i_sint(new_sint),
//changed
.i_cost(new_cost),
//changed
.i_sinp(new_sinp),
//changed
.i_cosp(new_cosp),
//changed
.i_sintCosp(new_sintCosp),
//changed
.i_sintSinp(new_sintSinp),
.i_uz2(uz2__32),
.i_uxUz(uxUz__32),
//changed
.i_uyUz(new_uyUz),
.i_uySintSinp(uySintSinp__32),
.i_oneMinusUz2(oneMinusUz2__32),
.i_uyUzSintCosp(uyUzSintCosp__32),
.i_uxUzSintCosp(uxUzSintCosp__32),
.i_uxSintSinp(uxSintSinp__32),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__32),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__32),
.i_uxCost(uxCost__32),
.i_uzCost(uzCost__32),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__32),
.i_uxNumerator(uxNumerator__32),
.i_uyNumerator(uyNumerator__32),
.i_uyCost(uyCost__32),
.i_uxQuotient(uxQuotient__32),
.i_uyQuotient(uyQuotient__32),
//Outputs			 
.o_sint(sint__33),
.o_cost(cost__33),
.o_sinp(sinp__33),
.o_cosp(cosp__33),
.o_sintCosp(sintCosp__33),
.o_sintSinp(sintSinp__33),
.o_uz2(uz2__33),
.o_uxUz(uxUz__33),
.o_uyUz(uyUz__33),
.o_uySintSinp(uySintSinp__33),
.o_oneMinusUz2(oneMinusUz2__33),
.o_uyUzSintCosp(uyUzSintCosp__33),
.o_uxUzSintCosp(uxUzSintCosp__33),
.o_uxSintSinp(uxSintSinp__33),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__33),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__33),
.o_uxCost(uxCost__33),
.o_uzCost(uzCost__33),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__33),
.o_uxNumerator(uxNumerator__33),
.o_uyNumerator(uyNumerator__33),
.o_uyCost(uyCost__33),
.o_uxQuotient(uxQuotient__33),
.o_uyQuotient(uyQuotient__33)
);  
		
		//forloop34 (10+20+4):
		
InternalsBlock pipeReg34(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__33),
.i_cost(cost__33),
.i_sinp(sinp__33),
.i_cosp(cosp__33),
.i_sintCosp(sintCosp__33),
.i_sintSinp(sintSinp__33),
.i_uz2(uz2__33),
.i_uxUz(uxUz__33),
.i_uyUz(uyUz__33),
//changed
.i_uySintSinp(new_uySintSinp),
.i_oneMinusUz2(oneMinusUz2__33),
//changed
.i_uyUzSintCosp(new_uyUzSintCosp),
//changed
.i_uxUzSintCosp(new_uxUzSintCosp),
//changed
.i_uxSintSinp(new_uxSintSinp),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__33),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__33),
.i_uxCost(uxCost__33),
.i_uzCost(uzCost__33),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__33),
.i_uxNumerator(uxNumerator__33),
.i_uyNumerator(uyNumerator__33),
.i_uyCost(uyCost__33),
.i_uxQuotient(uxQuotient__33),
.i_uyQuotient(uyQuotient__33),
//Outputs			 
.o_sint(sint__34),
.o_cost(cost__34),
.o_sinp(sinp__34),
.o_cosp(cosp__34),
.o_sintCosp(sintCosp__34),
.o_sintSinp(sintSinp__34),
.o_uz2(uz2__34),
.o_uxUz(uxUz__34),
.o_uyUz(uyUz__34),
.o_uySintSinp(uySintSinp__34),
.o_oneMinusUz2(oneMinusUz2__34),
.o_uyUzSintCosp(uyUzSintCosp__34),
.o_uxUzSintCosp(uxUzSintCosp__34),
.o_uxSintSinp(uxSintSinp__34),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__34),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__34),
.o_uxCost(uxCost__34),
.o_uzCost(uzCost__34),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__34),
.o_uxNumerator(uxNumerator__34),
.o_uyNumerator(uyNumerator__34),
.o_uyCost(uyCost__34),
.o_uxQuotient(uxQuotient__34),
.o_uyQuotient(uyQuotient__34)
);  
		
		//forloop35(10+20+5):
		InternalsBlock pipeReg35(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__34),
.i_cost(cost__34),
.i_sinp(sinp__34),
.i_cosp(cosp__34),
.i_sintCosp(sintCosp__34),
.i_sintSinp(sintSinp__34),
.i_uz2(uz2__34),
.i_uxUz(uxUz__34),
.i_uyUz(uyUz__34),
.i_uySintSinp(uySintSinp__34),
.i_oneMinusUz2(oneMinusUz2__34),
.i_uyUzSintCosp(uyUzSintCosp__34),
.i_uxUzSintCosp(uxUzSintCosp__34),
.i_uxSintSinp(uxSintSinp__34),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__34),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__34),
.i_uxCost(uxCost__34),
.i_uzCost(uzCost__34),
//changedval
.i_sqrtOneMinusUz2_inv(new_sqrtOneMinusUz2_inv),
//changed
.i_uxNumerator(new_uxNumerator),
//changed
.i_uyNumerator(new_uyNumerator),
.i_uyCost(uyCost__34),
.i_uxQuotient(uxQuotient__34),
.i_uyQuotient(uyQuotient__34),
//Outputs			 
.o_sint(sint__35),
.o_cost(cost__35),
.o_sinp(sinp__35),
.o_cosp(cosp__35),
.o_sintCosp(sintCosp__35),
.o_sintSinp(sintSinp__35),
.o_uz2(uz2__35),
.o_uxUz(uxUz__35),
.o_uyUz(uyUz__35),
.o_uySintSinp(uySintSinp__35),
.o_oneMinusUz2(oneMinusUz2__35),
.o_uyUzSintCosp(uyUzSintCosp__35),
.o_uxUzSintCosp(uxUzSintCosp__35),
.o_uxSintSinp(uxSintSinp__35),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__35),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__35),
.o_uxCost(uxCost__35),
.o_uzCost(uzCost__35),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__35),
.o_uxNumerator(uxNumerator__35),
.o_uyNumerator(uyNumerator__35),
.o_uyCost(uyCost__35),
.o_uxQuotient(uxQuotient__35),
.o_uyQuotient(uyQuotient__35)
);  

		
	//forloop36	(10+20+6):
		
InternalsBlock pipeReg36(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__35),
.i_cost(cost__35),
.i_sinp(sinp__35),
.i_cosp(cosp__35),
.i_sintCosp(sintCosp__35),
.i_sintSinp(sintSinp__35),
.i_uz2(uz2__35),
.i_uxUz(uxUz__35),
.i_uyUz(uyUz__35),
.i_uySintSinp(uySintSinp__35),
.i_oneMinusUz2(oneMinusUz2__35),
.i_uyUzSintCosp(uyUzSintCosp__35),
.i_uxUzSintCosp(uxUzSintCosp__35),
.i_uxSintSinp(uxSintSinp__35),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__35),
//changed
.i_sintCospSqrtOneMinusUz2(new_sintCospSqrtOneMinusUz2),
//changed
.i_uxCost(new_uxCost),
//changed
.i_uzCost(new_uzCost),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__35),
.i_uxNumerator(uxNumerator__35),
.i_uyNumerator(uyNumerator__35),
//changed
.i_uyCost(new_uyCost),
//changed),
.i_uxQuotient(new_uxQuotient),
//cahgned
.i_uyQuotient(new_uyQuotient),
//Outputs			 
.o_sint(sint__36),
.o_cost(cost__36),
.o_sinp(sinp__36),
.o_cosp(cosp__36),
.o_sintCosp(sintCosp__36),
.o_sintSinp(sintSinp__36),
.o_uz2(uz2__36),
.o_uxUz(uxUz__36),
.o_uyUz(uyUz__36),
.o_uySintSinp(uySintSinp__36),
.o_oneMinusUz2(oneMinusUz2__36),
.o_uyUzSintCosp(uyUzSintCosp__36),
.o_uxUzSintCosp(uxUzSintCosp__36),
.o_uxSintSinp(uxSintSinp__36),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__36),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__36),
.o_uxCost(uxCost__36),
.o_uzCost(uzCost__36),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__36),
.o_uxNumerator(uxNumerator__36),
.o_uyNumerator(uyNumerator__36),
.o_uyCost(uyCost__36),
.o_uxQuotient(uxQuotient__36),
.o_uyQuotient(uyQuotient__36)
);  

InternalsBlock pipeReg37(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__36),
.i_cost(cost__36),
.i_sinp(sinp__36),
.i_cosp(cosp__36),
.i_sintCosp(sintCosp__36),
.i_sintSinp(sintSinp__36),
.i_uz2(uz2__36),
.i_uxUz(uxUz__36),
.i_uyUz(uyUz__36),
.i_uySintSinp(uySintSinp__36),
.i_oneMinusUz2(oneMinusUz2__36),
.i_uyUzSintCosp(uyUzSintCosp__36),
.i_uxUzSintCosp(uxUzSintCosp__36),
.i_uxSintSinp(uxSintSinp__36),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__36),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__36),
.i_uxCost(uxCost__36),
.i_uzCost(uzCost__36),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__36),
.i_uxNumerator(uxNumerator__36),
.i_uyNumerator(uyNumerator__36),
.i_uyCost(uyCost__36),
.i_uxQuotient(uxQuotient__36),
.i_uyQuotient(uyQuotient__36),
//Outputs			 
.o_sint(sint__37),
.o_cost(cost__37),
.o_sinp(sinp__37),
.o_cosp(cosp__37),
.o_sintCosp(sintCosp__37),
.o_sintSinp(sintSinp__37),
.o_uz2(uz2__37),
.o_uxUz(uxUz__37),
.o_uyUz(uyUz__37),
.o_uySintSinp(uySintSinp__37),
.o_oneMinusUz2(oneMinusUz2__37),
.o_uyUzSintCosp(uyUzSintCosp__37),
.o_uxUzSintCosp(uxUzSintCosp__37),
.o_uxSintSinp(uxSintSinp__37),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__37),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__37),
.o_uxCost(uxCost__37),
.o_uzCost(uzCost__37),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__37),
.o_uxNumerator(uxNumerator__37),
.o_uyNumerator(uyNumerator__37),
.o_uyCost(uyCost__37),
.o_uxQuotient(uxQuotient__37),
.o_uyQuotient(uyQuotient__37)
);  



InternalsBlock pipeReg32(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__31),
.i_cost(cost__31),
.i_sinp(sinp__31),
.i_cosp(cosp__31),
.i_sintCosp(sintCosp__31),
.i_sintSinp(sintSinp__31),
.i_uz2(uz2__31),
.i_uxUz(uxUz__31),
.i_uyUz(uyUz__31),
.i_uySintSinp(uySintSinp__31),
.i_oneMinusUz2(oneMinusUz2__31),
.i_uyUzSintCosp(uyUzSintCosp__31),
.i_uxUzSintCosp(uxUzSintCosp__31),
.i_uxSintSinp(uxSintSinp__31),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__31),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__31),
.i_uxCost(uxCost__31),
.i_uzCost(uzCost__31),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__31),
.i_uxNumerator(uxNumerator__31),
.i_uyNumerator(uyNumerator__31),
.i_uyCost(uyCost__31),
.i_uxQuotient(uxQuotient__31),
.i_uyQuotient(uyQuotient__31),
//Outputs			 
.o_sint(sint__32),
.o_cost(cost__32),
.o_sinp(sinp__32),
.o_cosp(cosp__32),
.o_sintCosp(sintCosp__32),
.o_sintSinp(sintSinp__32),
.o_uz2(uz2__32),
.o_uxUz(uxUz__32),
.o_uyUz(uyUz__32),
.o_uySintSinp(uySintSinp__32),
.o_oneMinusUz2(oneMinusUz2__32),
.o_uyUzSintCosp(uyUzSintCosp__32),
.o_uxUzSintCosp(uxUzSintCosp__32),
.o_uxSintSinp(uxSintSinp__32),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__32),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__32),
.o_uxCost(uxCost__32),
.o_uzCost(uzCost__32),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__32),
.o_uxNumerator(uxNumerator__32),
.o_uyNumerator(uyNumerator__32),
.o_uyCost(uyCost__32),
.o_uxQuotient(uxQuotient__32),
.o_uyQuotient(uyQuotient__32)
);  

InternalsBlock pipeReg31(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__30),
.i_cost(cost__30),
.i_sinp(sinp__30),
.i_cosp(cosp__30),
.i_sintCosp(sintCosp__30),
.i_sintSinp(sintSinp__30),
.i_uz2(uz2__30),
.i_uxUz(uxUz__30),
.i_uyUz(uyUz__30),
.i_uySintSinp(uySintSinp__30),
.i_oneMinusUz2(oneMinusUz2__30),
.i_uyUzSintCosp(uyUzSintCosp__30),
.i_uxUzSintCosp(uxUzSintCosp__30),
.i_uxSintSinp(uxSintSinp__30),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__30),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__30),
.i_uxCost(uxCost__30),
.i_uzCost(uzCost__30),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__30),
.i_uxNumerator(uxNumerator__30),
.i_uyNumerator(uyNumerator__30),
.i_uyCost(uyCost__30),
.i_uxQuotient(uxQuotient__30),
.i_uyQuotient(uyQuotient__30),
//Outputs			 
.o_sint(sint__31),
.o_cost(cost__31),
.o_sinp(sinp__31),
.o_cosp(cosp__31),
.o_sintCosp(sintCosp__31),
.o_sintSinp(sintSinp__31),
.o_uz2(uz2__31),
.o_uxUz(uxUz__31),
.o_uyUz(uyUz__31),
.o_uySintSinp(uySintSinp__31),
.o_oneMinusUz2(oneMinusUz2__31),
.o_uyUzSintCosp(uyUzSintCosp__31),
.o_uxUzSintCosp(uxUzSintCosp__31),
.o_uxSintSinp(uxSintSinp__31),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__31),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__31),
.o_uxCost(uxCost__31),
.o_uzCost(uzCost__31),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__31),
.o_uxNumerator(uxNumerator__31),
.o_uyNumerator(uyNumerator__31),
.o_uyCost(uyCost__31),
.o_uxQuotient(uxQuotient__31),
.o_uyQuotient(uyQuotient__31)
);  

InternalsBlock pipeReg30(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__29),
.i_cost(cost__29),
.i_sinp(sinp__29),
.i_cosp(cosp__29),
.i_sintCosp(sintCosp__29),
.i_sintSinp(sintSinp__29),
.i_uz2(uz2__29),
.i_uxUz(uxUz__29),
.i_uyUz(uyUz__29),
.i_uySintSinp(uySintSinp__29),
.i_oneMinusUz2(oneMinusUz2__29),
.i_uyUzSintCosp(uyUzSintCosp__29),
.i_uxUzSintCosp(uxUzSintCosp__29),
.i_uxSintSinp(uxSintSinp__29),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__29),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__29),
.i_uxCost(uxCost__29),
.i_uzCost(uzCost__29),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__29),
.i_uxNumerator(uxNumerator__29),
.i_uyNumerator(uyNumerator__29),
.i_uyCost(uyCost__29),
.i_uxQuotient(uxQuotient__29),
.i_uyQuotient(uyQuotient__29),
//Outputs			 
.o_sint(sint__30),
.o_cost(cost__30),
.o_sinp(sinp__30),
.o_cosp(cosp__30),
.o_sintCosp(sintCosp__30),
.o_sintSinp(sintSinp__30),
.o_uz2(uz2__30),
.o_uxUz(uxUz__30),
.o_uyUz(uyUz__30),
.o_uySintSinp(uySintSinp__30),
.o_oneMinusUz2(oneMinusUz2__30),
.o_uyUzSintCosp(uyUzSintCosp__30),
.o_uxUzSintCosp(uxUzSintCosp__30),
.o_uxSintSinp(uxSintSinp__30),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__30),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__30),
.o_uxCost(uxCost__30),
.o_uzCost(uzCost__30),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__30),
.o_uxNumerator(uxNumerator__30),
.o_uyNumerator(uyNumerator__30),
.o_uyCost(uyCost__30),
.o_uxQuotient(uxQuotient__30),
.o_uyQuotient(uyQuotient__30)
);  

InternalsBlock pipeReg29(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__28),
.i_cost(cost__28),
.i_sinp(sinp__28),
.i_cosp(cosp__28),
.i_sintCosp(sintCosp__28),
.i_sintSinp(sintSinp__28),
.i_uz2(uz2__28),
.i_uxUz(uxUz__28),
.i_uyUz(uyUz__28),
.i_uySintSinp(uySintSinp__28),
.i_oneMinusUz2(oneMinusUz2__28),
.i_uyUzSintCosp(uyUzSintCosp__28),
.i_uxUzSintCosp(uxUzSintCosp__28),
.i_uxSintSinp(uxSintSinp__28),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__28),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__28),
.i_uxCost(uxCost__28),
.i_uzCost(uzCost__28),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__28),
.i_uxNumerator(uxNumerator__28),
.i_uyNumerator(uyNumerator__28),
.i_uyCost(uyCost__28),
.i_uxQuotient(uxQuotient__28),
.i_uyQuotient(uyQuotient__28),
//Outputs			 
.o_sint(sint__29),
.o_cost(cost__29),
.o_sinp(sinp__29),
.o_cosp(cosp__29),
.o_sintCosp(sintCosp__29),
.o_sintSinp(sintSinp__29),
.o_uz2(uz2__29),
.o_uxUz(uxUz__29),
.o_uyUz(uyUz__29),
.o_uySintSinp(uySintSinp__29),
.o_oneMinusUz2(oneMinusUz2__29),
.o_uyUzSintCosp(uyUzSintCosp__29),
.o_uxUzSintCosp(uxUzSintCosp__29),
.o_uxSintSinp(uxSintSinp__29),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__29),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__29),
.o_uxCost(uxCost__29),
.o_uzCost(uzCost__29),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__29),
.o_uxNumerator(uxNumerator__29),
.o_uyNumerator(uyNumerator__29),
.o_uyCost(uyCost__29),
.o_uxQuotient(uxQuotient__29),
.o_uyQuotient(uyQuotient__29)
);  

InternalsBlock pipeReg28(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__27),
.i_cost(cost__27),
.i_sinp(sinp__27),
.i_cosp(cosp__27),
.i_sintCosp(sintCosp__27),
.i_sintSinp(sintSinp__27),
.i_uz2(uz2__27),
.i_uxUz(uxUz__27),
.i_uyUz(uyUz__27),
.i_uySintSinp(uySintSinp__27),
.i_oneMinusUz2(oneMinusUz2__27),
.i_uyUzSintCosp(uyUzSintCosp__27),
.i_uxUzSintCosp(uxUzSintCosp__27),
.i_uxSintSinp(uxSintSinp__27),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__27),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__27),
.i_uxCost(uxCost__27),
.i_uzCost(uzCost__27),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__27),
.i_uxNumerator(uxNumerator__27),
.i_uyNumerator(uyNumerator__27),
.i_uyCost(uyCost__27),
.i_uxQuotient(uxQuotient__27),
.i_uyQuotient(uyQuotient__27),
//Outputs			 
.o_sint(sint__28),
.o_cost(cost__28),
.o_sinp(sinp__28),
.o_cosp(cosp__28),
.o_sintCosp(sintCosp__28),
.o_sintSinp(sintSinp__28),
.o_uz2(uz2__28),
.o_uxUz(uxUz__28),
.o_uyUz(uyUz__28),
.o_uySintSinp(uySintSinp__28),
.o_oneMinusUz2(oneMinusUz2__28),
.o_uyUzSintCosp(uyUzSintCosp__28),
.o_uxUzSintCosp(uxUzSintCosp__28),
.o_uxSintSinp(uxSintSinp__28),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__28),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__28),
.o_uxCost(uxCost__28),
.o_uzCost(uzCost__28),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__28),
.o_uxNumerator(uxNumerator__28),
.o_uyNumerator(uyNumerator__28),
.o_uyCost(uyCost__28),
.o_uxQuotient(uxQuotient__28),
.o_uyQuotient(uyQuotient__28)
);  

InternalsBlock pipeReg27(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__26),
.i_cost(cost__26),
.i_sinp(sinp__26),
.i_cosp(cosp__26),
.i_sintCosp(sintCosp__26),
.i_sintSinp(sintSinp__26),
.i_uz2(uz2__26),
.i_uxUz(uxUz__26),
.i_uyUz(uyUz__26),
.i_uySintSinp(uySintSinp__26),
.i_oneMinusUz2(oneMinusUz2__26),
.i_uyUzSintCosp(uyUzSintCosp__26),
.i_uxUzSintCosp(uxUzSintCosp__26),
.i_uxSintSinp(uxSintSinp__26),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__26),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__26),
.i_uxCost(uxCost__26),
.i_uzCost(uzCost__26),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__26),
.i_uxNumerator(uxNumerator__26),
.i_uyNumerator(uyNumerator__26),
.i_uyCost(uyCost__26),
.i_uxQuotient(uxQuotient__26),
.i_uyQuotient(uyQuotient__26),
//Outputs			 
.o_sint(sint__27),
.o_cost(cost__27),
.o_sinp(sinp__27),
.o_cosp(cosp__27),
.o_sintCosp(sintCosp__27),
.o_sintSinp(sintSinp__27),
.o_uz2(uz2__27),
.o_uxUz(uxUz__27),
.o_uyUz(uyUz__27),
.o_uySintSinp(uySintSinp__27),
.o_oneMinusUz2(oneMinusUz2__27),
.o_uyUzSintCosp(uyUzSintCosp__27),
.o_uxUzSintCosp(uxUzSintCosp__27),
.o_uxSintSinp(uxSintSinp__27),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__27),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__27),
.o_uxCost(uxCost__27),
.o_uzCost(uzCost__27),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__27),
.o_uxNumerator(uxNumerator__27),
.o_uyNumerator(uyNumerator__27),
.o_uyCost(uyCost__27),
.o_uxQuotient(uxQuotient__27),
.o_uyQuotient(uyQuotient__27)
);  

InternalsBlock pipeReg26(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__25),
.i_cost(cost__25),
.i_sinp(sinp__25),
.i_cosp(cosp__25),
.i_sintCosp(sintCosp__25),
.i_sintSinp(sintSinp__25),
.i_uz2(uz2__25),
.i_uxUz(uxUz__25),
.i_uyUz(uyUz__25),
.i_uySintSinp(uySintSinp__25),
.i_oneMinusUz2(oneMinusUz2__25),
.i_uyUzSintCosp(uyUzSintCosp__25),
.i_uxUzSintCosp(uxUzSintCosp__25),
.i_uxSintSinp(uxSintSinp__25),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__25),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__25),
.i_uxCost(uxCost__25),
.i_uzCost(uzCost__25),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__25),
.i_uxNumerator(uxNumerator__25),
.i_uyNumerator(uyNumerator__25),
.i_uyCost(uyCost__25),
.i_uxQuotient(uxQuotient__25),
.i_uyQuotient(uyQuotient__25),
//Outputs			 
.o_sint(sint__26),
.o_cost(cost__26),
.o_sinp(sinp__26),
.o_cosp(cosp__26),
.o_sintCosp(sintCosp__26),
.o_sintSinp(sintSinp__26),
.o_uz2(uz2__26),
.o_uxUz(uxUz__26),
.o_uyUz(uyUz__26),
.o_uySintSinp(uySintSinp__26),
.o_oneMinusUz2(oneMinusUz2__26),
.o_uyUzSintCosp(uyUzSintCosp__26),
.o_uxUzSintCosp(uxUzSintCosp__26),
.o_uxSintSinp(uxSintSinp__26),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__26),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__26),
.o_uxCost(uxCost__26),
.o_uzCost(uzCost__26),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__26),
.o_uxNumerator(uxNumerator__26),
.o_uyNumerator(uyNumerator__26),
.o_uyCost(uyCost__26),
.o_uxQuotient(uxQuotient__26),
.o_uyQuotient(uyQuotient__26)
);  

InternalsBlock pipeReg25(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__24),
.i_cost(cost__24),
.i_sinp(sinp__24),
.i_cosp(cosp__24),
.i_sintCosp(sintCosp__24),
.i_sintSinp(sintSinp__24),
.i_uz2(uz2__24),
.i_uxUz(uxUz__24),
.i_uyUz(uyUz__24),
.i_uySintSinp(uySintSinp__24),
.i_oneMinusUz2(oneMinusUz2__24),
.i_uyUzSintCosp(uyUzSintCosp__24),
.i_uxUzSintCosp(uxUzSintCosp__24),
.i_uxSintSinp(uxSintSinp__24),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__24),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__24),
.i_uxCost(uxCost__24),
.i_uzCost(uzCost__24),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__24),
.i_uxNumerator(uxNumerator__24),
.i_uyNumerator(uyNumerator__24),
.i_uyCost(uyCost__24),
.i_uxQuotient(uxQuotient__24),
.i_uyQuotient(uyQuotient__24),
//Outputs			 
.o_sint(sint__25),
.o_cost(cost__25),
.o_sinp(sinp__25),
.o_cosp(cosp__25),
.o_sintCosp(sintCosp__25),
.o_sintSinp(sintSinp__25),
.o_uz2(uz2__25),
.o_uxUz(uxUz__25),
.o_uyUz(uyUz__25),
.o_uySintSinp(uySintSinp__25),
.o_oneMinusUz2(oneMinusUz2__25),
.o_uyUzSintCosp(uyUzSintCosp__25),
.o_uxUzSintCosp(uxUzSintCosp__25),
.o_uxSintSinp(uxSintSinp__25),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__25),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__25),
.o_uxCost(uxCost__25),
.o_uzCost(uzCost__25),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__25),
.o_uxNumerator(uxNumerator__25),
.o_uyNumerator(uyNumerator__25),
.o_uyCost(uyCost__25),
.o_uxQuotient(uxQuotient__25),
.o_uyQuotient(uyQuotient__25)
);  

InternalsBlock pipeReg24(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__23),
.i_cost(cost__23),
.i_sinp(sinp__23),
.i_cosp(cosp__23),
.i_sintCosp(sintCosp__23),
.i_sintSinp(sintSinp__23),
.i_uz2(uz2__23),
.i_uxUz(uxUz__23),
.i_uyUz(uyUz__23),
.i_uySintSinp(uySintSinp__23),
.i_oneMinusUz2(oneMinusUz2__23),
.i_uyUzSintCosp(uyUzSintCosp__23),
.i_uxUzSintCosp(uxUzSintCosp__23),
.i_uxSintSinp(uxSintSinp__23),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__23),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__23),
.i_uxCost(uxCost__23),
.i_uzCost(uzCost__23),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__23),
.i_uxNumerator(uxNumerator__23),
.i_uyNumerator(uyNumerator__23),
.i_uyCost(uyCost__23),
.i_uxQuotient(uxQuotient__23),
.i_uyQuotient(uyQuotient__23),
//Outputs			 
.o_sint(sint__24),
.o_cost(cost__24),
.o_sinp(sinp__24),
.o_cosp(cosp__24),
.o_sintCosp(sintCosp__24),
.o_sintSinp(sintSinp__24),
.o_uz2(uz2__24),
.o_uxUz(uxUz__24),
.o_uyUz(uyUz__24),
.o_uySintSinp(uySintSinp__24),
.o_oneMinusUz2(oneMinusUz2__24),
.o_uyUzSintCosp(uyUzSintCosp__24),
.o_uxUzSintCosp(uxUzSintCosp__24),
.o_uxSintSinp(uxSintSinp__24),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__24),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__24),
.o_uxCost(uxCost__24),
.o_uzCost(uzCost__24),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__24),
.o_uxNumerator(uxNumerator__24),
.o_uyNumerator(uyNumerator__24),
.o_uyCost(uyCost__24),
.o_uxQuotient(uxQuotient__24),
.o_uyQuotient(uyQuotient__24)
);  

InternalsBlock pipeReg23(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__22),
.i_cost(cost__22),
.i_sinp(sinp__22),
.i_cosp(cosp__22),
.i_sintCosp(sintCosp__22),
.i_sintSinp(sintSinp__22),
.i_uz2(uz2__22),
.i_uxUz(uxUz__22),
.i_uyUz(uyUz__22),
.i_uySintSinp(uySintSinp__22),
.i_oneMinusUz2(oneMinusUz2__22),
.i_uyUzSintCosp(uyUzSintCosp__22),
.i_uxUzSintCosp(uxUzSintCosp__22),
.i_uxSintSinp(uxSintSinp__22),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__22),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__22),
.i_uxCost(uxCost__22),
.i_uzCost(uzCost__22),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__22),
.i_uxNumerator(uxNumerator__22),
.i_uyNumerator(uyNumerator__22),
.i_uyCost(uyCost__22),
.i_uxQuotient(uxQuotient__22),
.i_uyQuotient(uyQuotient__22),
//Outputs			 
.o_sint(sint__23),
.o_cost(cost__23),
.o_sinp(sinp__23),
.o_cosp(cosp__23),
.o_sintCosp(sintCosp__23),
.o_sintSinp(sintSinp__23),
.o_uz2(uz2__23),
.o_uxUz(uxUz__23),
.o_uyUz(uyUz__23),
.o_uySintSinp(uySintSinp__23),
.o_oneMinusUz2(oneMinusUz2__23),
.o_uyUzSintCosp(uyUzSintCosp__23),
.o_uxUzSintCosp(uxUzSintCosp__23),
.o_uxSintSinp(uxSintSinp__23),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__23),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__23),
.o_uxCost(uxCost__23),
.o_uzCost(uzCost__23),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__23),
.o_uxNumerator(uxNumerator__23),
.o_uyNumerator(uyNumerator__23),
.o_uyCost(uyCost__23),
.o_uxQuotient(uxQuotient__23),
.o_uyQuotient(uyQuotient__23)
);  

InternalsBlock pipeReg22(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__21),
.i_cost(cost__21),
.i_sinp(sinp__21),
.i_cosp(cosp__21),
.i_sintCosp(sintCosp__21),
.i_sintSinp(sintSinp__21),
.i_uz2(uz2__21),
.i_uxUz(uxUz__21),
.i_uyUz(uyUz__21),
.i_uySintSinp(uySintSinp__21),
.i_oneMinusUz2(oneMinusUz2__21),
.i_uyUzSintCosp(uyUzSintCosp__21),
.i_uxUzSintCosp(uxUzSintCosp__21),
.i_uxSintSinp(uxSintSinp__21),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__21),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__21),
.i_uxCost(uxCost__21),
.i_uzCost(uzCost__21),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__21),
.i_uxNumerator(uxNumerator__21),
.i_uyNumerator(uyNumerator__21),
.i_uyCost(uyCost__21),
.i_uxQuotient(uxQuotient__21),
.i_uyQuotient(uyQuotient__21),
//Outputs			 
.o_sint(sint__22),
.o_cost(cost__22),
.o_sinp(sinp__22),
.o_cosp(cosp__22),
.o_sintCosp(sintCosp__22),
.o_sintSinp(sintSinp__22),
.o_uz2(uz2__22),
.o_uxUz(uxUz__22),
.o_uyUz(uyUz__22),
.o_uySintSinp(uySintSinp__22),
.o_oneMinusUz2(oneMinusUz2__22),
.o_uyUzSintCosp(uyUzSintCosp__22),
.o_uxUzSintCosp(uxUzSintCosp__22),
.o_uxSintSinp(uxSintSinp__22),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__22),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__22),
.o_uxCost(uxCost__22),
.o_uzCost(uzCost__22),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__22),
.o_uxNumerator(uxNumerator__22),
.o_uyNumerator(uyNumerator__22),
.o_uyCost(uyCost__22),
.o_uxQuotient(uxQuotient__22),
.o_uyQuotient(uyQuotient__22)
);  

InternalsBlock pipeReg21(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__20),
.i_cost(cost__20),
.i_sinp(sinp__20),
.i_cosp(cosp__20),
.i_sintCosp(sintCosp__20),
.i_sintSinp(sintSinp__20),
.i_uz2(uz2__20),
.i_uxUz(uxUz__20),
.i_uyUz(uyUz__20),
.i_uySintSinp(uySintSinp__20),
.i_oneMinusUz2(oneMinusUz2__20),
.i_uyUzSintCosp(uyUzSintCosp__20),
.i_uxUzSintCosp(uxUzSintCosp__20),
.i_uxSintSinp(uxSintSinp__20),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__20),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__20),
.i_uxCost(uxCost__20),
.i_uzCost(uzCost__20),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__20),
.i_uxNumerator(uxNumerator__20),
.i_uyNumerator(uyNumerator__20),
.i_uyCost(uyCost__20),
.i_uxQuotient(uxQuotient__20),
.i_uyQuotient(uyQuotient__20),
//Outputs			 
.o_sint(sint__21),
.o_cost(cost__21),
.o_sinp(sinp__21),
.o_cosp(cosp__21),
.o_sintCosp(sintCosp__21),
.o_sintSinp(sintSinp__21),
.o_uz2(uz2__21),
.o_uxUz(uxUz__21),
.o_uyUz(uyUz__21),
.o_uySintSinp(uySintSinp__21),
.o_oneMinusUz2(oneMinusUz2__21),
.o_uyUzSintCosp(uyUzSintCosp__21),
.o_uxUzSintCosp(uxUzSintCosp__21),
.o_uxSintSinp(uxSintSinp__21),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__21),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__21),
.o_uxCost(uxCost__21),
.o_uzCost(uzCost__21),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__21),
.o_uxNumerator(uxNumerator__21),
.o_uyNumerator(uyNumerator__21),
.o_uyCost(uyCost__21),
.o_uxQuotient(uxQuotient__21),
.o_uyQuotient(uyQuotient__21)
);  

InternalsBlock pipeReg20(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__19),
.i_cost(cost__19),
.i_sinp(sinp__19),
.i_cosp(cosp__19),
.i_sintCosp(sintCosp__19),
.i_sintSinp(sintSinp__19),
.i_uz2(uz2__19),
.i_uxUz(uxUz__19),
.i_uyUz(uyUz__19),
.i_uySintSinp(uySintSinp__19),
.i_oneMinusUz2(oneMinusUz2__19),
.i_uyUzSintCosp(uyUzSintCosp__19),
.i_uxUzSintCosp(uxUzSintCosp__19),
.i_uxSintSinp(uxSintSinp__19),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__19),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__19),
.i_uxCost(uxCost__19),
.i_uzCost(uzCost__19),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__19),
.i_uxNumerator(uxNumerator__19),
.i_uyNumerator(uyNumerator__19),
.i_uyCost(uyCost__19),
.i_uxQuotient(uxQuotient__19),
.i_uyQuotient(uyQuotient__19),
//Outputs			 
.o_sint(sint__20),
.o_cost(cost__20),
.o_sinp(sinp__20),
.o_cosp(cosp__20),
.o_sintCosp(sintCosp__20),
.o_sintSinp(sintSinp__20),
.o_uz2(uz2__20),
.o_uxUz(uxUz__20),
.o_uyUz(uyUz__20),
.o_uySintSinp(uySintSinp__20),
.o_oneMinusUz2(oneMinusUz2__20),
.o_uyUzSintCosp(uyUzSintCosp__20),
.o_uxUzSintCosp(uxUzSintCosp__20),
.o_uxSintSinp(uxSintSinp__20),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__20),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__20),
.o_uxCost(uxCost__20),
.o_uzCost(uzCost__20),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__20),
.o_uxNumerator(uxNumerator__20),
.o_uyNumerator(uyNumerator__20),
.o_uyCost(uyCost__20),
.o_uxQuotient(uxQuotient__20),
.o_uyQuotient(uyQuotient__20)
);  

InternalsBlock pipeReg19(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__18),
.i_cost(cost__18),
.i_sinp(sinp__18),
.i_cosp(cosp__18),
.i_sintCosp(sintCosp__18),
.i_sintSinp(sintSinp__18),
.i_uz2(uz2__18),
.i_uxUz(uxUz__18),
.i_uyUz(uyUz__18),
.i_uySintSinp(uySintSinp__18),
.i_oneMinusUz2(oneMinusUz2__18),
.i_uyUzSintCosp(uyUzSintCosp__18),
.i_uxUzSintCosp(uxUzSintCosp__18),
.i_uxSintSinp(uxSintSinp__18),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__18),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__18),
.i_uxCost(uxCost__18),
.i_uzCost(uzCost__18),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__18),
.i_uxNumerator(uxNumerator__18),
.i_uyNumerator(uyNumerator__18),
.i_uyCost(uyCost__18),
.i_uxQuotient(uxQuotient__18),
.i_uyQuotient(uyQuotient__18),
//Outputs			 
.o_sint(sint__19),
.o_cost(cost__19),
.o_sinp(sinp__19),
.o_cosp(cosp__19),
.o_sintCosp(sintCosp__19),
.o_sintSinp(sintSinp__19),
.o_uz2(uz2__19),
.o_uxUz(uxUz__19),
.o_uyUz(uyUz__19),
.o_uySintSinp(uySintSinp__19),
.o_oneMinusUz2(oneMinusUz2__19),
.o_uyUzSintCosp(uyUzSintCosp__19),
.o_uxUzSintCosp(uxUzSintCosp__19),
.o_uxSintSinp(uxSintSinp__19),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__19),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__19),
.o_uxCost(uxCost__19),
.o_uzCost(uzCost__19),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__19),
.o_uxNumerator(uxNumerator__19),
.o_uyNumerator(uyNumerator__19),
.o_uyCost(uyCost__19),
.o_uxQuotient(uxQuotient__19),
.o_uyQuotient(uyQuotient__19)
);  

InternalsBlock pipeReg18(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__17),
.i_cost(cost__17),
.i_sinp(sinp__17),
.i_cosp(cosp__17),
.i_sintCosp(sintCosp__17),
.i_sintSinp(sintSinp__17),
.i_uz2(uz2__17),
.i_uxUz(uxUz__17),
.i_uyUz(uyUz__17),
.i_uySintSinp(uySintSinp__17),
.i_oneMinusUz2(oneMinusUz2__17),
.i_uyUzSintCosp(uyUzSintCosp__17),
.i_uxUzSintCosp(uxUzSintCosp__17),
.i_uxSintSinp(uxSintSinp__17),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__17),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__17),
.i_uxCost(uxCost__17),
.i_uzCost(uzCost__17),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__17),
.i_uxNumerator(uxNumerator__17),
.i_uyNumerator(uyNumerator__17),
.i_uyCost(uyCost__17),
.i_uxQuotient(uxQuotient__17),
.i_uyQuotient(uyQuotient__17),
//Outputs			 
.o_sint(sint__18),
.o_cost(cost__18),
.o_sinp(sinp__18),
.o_cosp(cosp__18),
.o_sintCosp(sintCosp__18),
.o_sintSinp(sintSinp__18),
.o_uz2(uz2__18),
.o_uxUz(uxUz__18),
.o_uyUz(uyUz__18),
.o_uySintSinp(uySintSinp__18),
.o_oneMinusUz2(oneMinusUz2__18),
.o_uyUzSintCosp(uyUzSintCosp__18),
.o_uxUzSintCosp(uxUzSintCosp__18),
.o_uxSintSinp(uxSintSinp__18),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__18),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__18),
.o_uxCost(uxCost__18),
.o_uzCost(uzCost__18),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__18),
.o_uxNumerator(uxNumerator__18),
.o_uyNumerator(uyNumerator__18),
.o_uyCost(uyCost__18),
.o_uxQuotient(uxQuotient__18),
.o_uyQuotient(uyQuotient__18)
);  

InternalsBlock pipeReg17(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__16),
.i_cost(cost__16),
.i_sinp(sinp__16),
.i_cosp(cosp__16),
.i_sintCosp(sintCosp__16),
.i_sintSinp(sintSinp__16),
.i_uz2(uz2__16),
.i_uxUz(uxUz__16),
.i_uyUz(uyUz__16),
.i_uySintSinp(uySintSinp__16),
.i_oneMinusUz2(oneMinusUz2__16),
.i_uyUzSintCosp(uyUzSintCosp__16),
.i_uxUzSintCosp(uxUzSintCosp__16),
.i_uxSintSinp(uxSintSinp__16),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__16),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__16),
.i_uxCost(uxCost__16),
.i_uzCost(uzCost__16),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__16),
.i_uxNumerator(uxNumerator__16),
.i_uyNumerator(uyNumerator__16),
.i_uyCost(uyCost__16),
.i_uxQuotient(uxQuotient__16),
.i_uyQuotient(uyQuotient__16),
//Outputs			 
.o_sint(sint__17),
.o_cost(cost__17),
.o_sinp(sinp__17),
.o_cosp(cosp__17),
.o_sintCosp(sintCosp__17),
.o_sintSinp(sintSinp__17),
.o_uz2(uz2__17),
.o_uxUz(uxUz__17),
.o_uyUz(uyUz__17),
.o_uySintSinp(uySintSinp__17),
.o_oneMinusUz2(oneMinusUz2__17),
.o_uyUzSintCosp(uyUzSintCosp__17),
.o_uxUzSintCosp(uxUzSintCosp__17),
.o_uxSintSinp(uxSintSinp__17),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__17),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__17),
.o_uxCost(uxCost__17),
.o_uzCost(uzCost__17),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__17),
.o_uxNumerator(uxNumerator__17),
.o_uyNumerator(uyNumerator__17),
.o_uyCost(uyCost__17),
.o_uxQuotient(uxQuotient__17),
.o_uyQuotient(uyQuotient__17)
);  


InternalsBlock pipeReg15(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__14),
.i_cost(cost__14),
.i_sinp(sinp__14),
.i_cosp(cosp__14),
.i_sintCosp(sintCosp__14),
.i_sintSinp(sintSinp__14),
.i_uz2(uz2__14),
.i_uxUz(uxUz__14),
.i_uyUz(uyUz__14),
.i_uySintSinp(uySintSinp__14),
.i_oneMinusUz2(oneMinusUz2__14),
.i_uyUzSintCosp(uyUzSintCosp__14),
.i_uxUzSintCosp(uxUzSintCosp__14),
.i_uxSintSinp(uxSintSinp__14),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__14),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__14),
.i_uxCost(uxCost__14),
.i_uzCost(uzCost__14),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__14),
.i_uxNumerator(uxNumerator__14),
.i_uyNumerator(uyNumerator__14),
.i_uyCost(uyCost__14),
.i_uxQuotient(uxQuotient__14),
.i_uyQuotient(uyQuotient__14),
//Outputs			 
.o_sint(sint__15),
.o_cost(cost__15),
.o_sinp(sinp__15),
.o_cosp(cosp__15),
.o_sintCosp(sintCosp__15),
.o_sintSinp(sintSinp__15),
.o_uz2(uz2__15),
.o_uxUz(uxUz__15),
.o_uyUz(uyUz__15),
.o_uySintSinp(uySintSinp__15),
.o_oneMinusUz2(oneMinusUz2__15),
.o_uyUzSintCosp(uyUzSintCosp__15),
.o_uxUzSintCosp(uxUzSintCosp__15),
.o_uxSintSinp(uxSintSinp__15),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__15),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__15),
.o_uxCost(uxCost__15),
.o_uzCost(uzCost__15),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__15),
.o_uxNumerator(uxNumerator__15),
.o_uyNumerator(uyNumerator__15),
.o_uyCost(uyCost__15),
.o_uxQuotient(uxQuotient__15),
.o_uyQuotient(uyQuotient__15)
);  

InternalsBlock pipeReg14(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__13),
.i_cost(cost__13),
.i_sinp(sinp__13),
.i_cosp(cosp__13),
.i_sintCosp(sintCosp__13),
.i_sintSinp(sintSinp__13),
.i_uz2(uz2__13),
.i_uxUz(uxUz__13),
.i_uyUz(uyUz__13),
.i_uySintSinp(uySintSinp__13),
.i_oneMinusUz2(oneMinusUz2__13),
.i_uyUzSintCosp(uyUzSintCosp__13),
.i_uxUzSintCosp(uxUzSintCosp__13),
.i_uxSintSinp(uxSintSinp__13),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__13),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__13),
.i_uxCost(uxCost__13),
.i_uzCost(uzCost__13),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__13),
.i_uxNumerator(uxNumerator__13),
.i_uyNumerator(uyNumerator__13),
.i_uyCost(uyCost__13),
.i_uxQuotient(uxQuotient__13),
.i_uyQuotient(uyQuotient__13),
//Outputs			 
.o_sint(sint__14),
.o_cost(cost__14),
.o_sinp(sinp__14),
.o_cosp(cosp__14),
.o_sintCosp(sintCosp__14),
.o_sintSinp(sintSinp__14),
.o_uz2(uz2__14),
.o_uxUz(uxUz__14),
.o_uyUz(uyUz__14),
.o_uySintSinp(uySintSinp__14),
.o_oneMinusUz2(oneMinusUz2__14),
.o_uyUzSintCosp(uyUzSintCosp__14),
.o_uxUzSintCosp(uxUzSintCosp__14),
.o_uxSintSinp(uxSintSinp__14),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__14),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__14),
.o_uxCost(uxCost__14),
.o_uzCost(uzCost__14),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__14),
.o_uxNumerator(uxNumerator__14),
.o_uyNumerator(uyNumerator__14),
.o_uyCost(uyCost__14),
.o_uxQuotient(uxQuotient__14),
.o_uyQuotient(uyQuotient__14)
);  

InternalsBlock pipeReg13(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__12),
.i_cost(cost__12),
.i_sinp(sinp__12),
.i_cosp(cosp__12),
.i_sintCosp(sintCosp__12),
.i_sintSinp(sintSinp__12),
.i_uz2(uz2__12),
.i_uxUz(uxUz__12),
.i_uyUz(uyUz__12),
.i_uySintSinp(uySintSinp__12),
.i_oneMinusUz2(oneMinusUz2__12),
.i_uyUzSintCosp(uyUzSintCosp__12),
.i_uxUzSintCosp(uxUzSintCosp__12),
.i_uxSintSinp(uxSintSinp__12),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__12),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__12),
.i_uxCost(uxCost__12),
.i_uzCost(uzCost__12),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__12),
.i_uxNumerator(uxNumerator__12),
.i_uyNumerator(uyNumerator__12),
.i_uyCost(uyCost__12),
.i_uxQuotient(uxQuotient__12),
.i_uyQuotient(uyQuotient__12),
//Outputs			 
.o_sint(sint__13),
.o_cost(cost__13),
.o_sinp(sinp__13),
.o_cosp(cosp__13),
.o_sintCosp(sintCosp__13),
.o_sintSinp(sintSinp__13),
.o_uz2(uz2__13),
.o_uxUz(uxUz__13),
.o_uyUz(uyUz__13),
.o_uySintSinp(uySintSinp__13),
.o_oneMinusUz2(oneMinusUz2__13),
.o_uyUzSintCosp(uyUzSintCosp__13),
.o_uxUzSintCosp(uxUzSintCosp__13),
.o_uxSintSinp(uxSintSinp__13),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__13),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__13),
.o_uxCost(uxCost__13),
.o_uzCost(uzCost__13),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__13),
.o_uxNumerator(uxNumerator__13),
.o_uyNumerator(uyNumerator__13),
.o_uyCost(uyCost__13),
.o_uxQuotient(uxQuotient__13),
.o_uyQuotient(uyQuotient__13)
);  

InternalsBlock pipeReg12(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__11),
.i_cost(cost__11),
.i_sinp(sinp__11),
.i_cosp(cosp__11),
.i_sintCosp(sintCosp__11),
.i_sintSinp(sintSinp__11),
.i_uz2(uz2__11),
.i_uxUz(uxUz__11),
.i_uyUz(uyUz__11),
.i_uySintSinp(uySintSinp__11),
.i_oneMinusUz2(oneMinusUz2__11),
.i_uyUzSintCosp(uyUzSintCosp__11),
.i_uxUzSintCosp(uxUzSintCosp__11),
.i_uxSintSinp(uxSintSinp__11),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__11),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__11),
.i_uxCost(uxCost__11),
.i_uzCost(uzCost__11),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__11),
.i_uxNumerator(uxNumerator__11),
.i_uyNumerator(uyNumerator__11),
.i_uyCost(uyCost__11),
.i_uxQuotient(uxQuotient__11),
.i_uyQuotient(uyQuotient__11),
//Outputs			 
.o_sint(sint__12),
.o_cost(cost__12),
.o_sinp(sinp__12),
.o_cosp(cosp__12),
.o_sintCosp(sintCosp__12),
.o_sintSinp(sintSinp__12),
.o_uz2(uz2__12),
.o_uxUz(uxUz__12),
.o_uyUz(uyUz__12),
.o_uySintSinp(uySintSinp__12),
.o_oneMinusUz2(oneMinusUz2__12),
.o_uyUzSintCosp(uyUzSintCosp__12),
.o_uxUzSintCosp(uxUzSintCosp__12),
.o_uxSintSinp(uxSintSinp__12),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__12),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__12),
.o_uxCost(uxCost__12),
.o_uzCost(uzCost__12),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__12),
.o_uxNumerator(uxNumerator__12),
.o_uyNumerator(uyNumerator__12),
.o_uyCost(uyCost__12),
.o_uxQuotient(uxQuotient__12),
.o_uyQuotient(uyQuotient__12)
);  

InternalsBlock pipeReg11(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__10),
.i_cost(cost__10),
.i_sinp(sinp__10),
.i_cosp(cosp__10),
.i_sintCosp(sintCosp__10),
.i_sintSinp(sintSinp__10),
.i_uz2(uz2__10),
.i_uxUz(uxUz__10),
.i_uyUz(uyUz__10),
.i_uySintSinp(uySintSinp__10),
.i_oneMinusUz2(oneMinusUz2__10),
.i_uyUzSintCosp(uyUzSintCosp__10),
.i_uxUzSintCosp(uxUzSintCosp__10),
.i_uxSintSinp(uxSintSinp__10),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__10),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__10),
.i_uxCost(uxCost__10),
.i_uzCost(uzCost__10),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__10),
.i_uxNumerator(uxNumerator__10),
.i_uyNumerator(uyNumerator__10),
.i_uyCost(uyCost__10),
.i_uxQuotient(uxQuotient__10),
.i_uyQuotient(uyQuotient__10),
//Outputs			 
.o_sint(sint__11),
.o_cost(cost__11),
.o_sinp(sinp__11),
.o_cosp(cosp__11),
.o_sintCosp(sintCosp__11),
.o_sintSinp(sintSinp__11),
.o_uz2(uz2__11),
.o_uxUz(uxUz__11),
.o_uyUz(uyUz__11),
.o_uySintSinp(uySintSinp__11),
.o_oneMinusUz2(oneMinusUz2__11),
.o_uyUzSintCosp(uyUzSintCosp__11),
.o_uxUzSintCosp(uxUzSintCosp__11),
.o_uxSintSinp(uxSintSinp__11),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__11),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__11),
.o_uxCost(uxCost__11),
.o_uzCost(uzCost__11),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__11),
.o_uxNumerator(uxNumerator__11),
.o_uyNumerator(uyNumerator__11),
.o_uyCost(uyCost__11),
.o_uxQuotient(uxQuotient__11),
.o_uyQuotient(uyQuotient__11)
);  

InternalsBlock pipeReg10(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__9),
.i_cost(cost__9),
.i_sinp(sinp__9),
.i_cosp(cosp__9),
.i_sintCosp(sintCosp__9),
.i_sintSinp(sintSinp__9),
.i_uz2(uz2__9),
.i_uxUz(uxUz__9),
.i_uyUz(uyUz__9),
.i_uySintSinp(uySintSinp__9),
.i_oneMinusUz2(oneMinusUz2__9),
.i_uyUzSintCosp(uyUzSintCosp__9),
.i_uxUzSintCosp(uxUzSintCosp__9),
.i_uxSintSinp(uxSintSinp__9),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__9),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__9),
.i_uxCost(uxCost__9),
.i_uzCost(uzCost__9),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__9),
.i_uxNumerator(uxNumerator__9),
.i_uyNumerator(uyNumerator__9),
.i_uyCost(uyCost__9),
.i_uxQuotient(uxQuotient__9),
.i_uyQuotient(uyQuotient__9),
//Outputs			 
.o_sint(sint__10),
.o_cost(cost__10),
.o_sinp(sinp__10),
.o_cosp(cosp__10),
.o_sintCosp(sintCosp__10),
.o_sintSinp(sintSinp__10),
.o_uz2(uz2__10),
.o_uxUz(uxUz__10),
.o_uyUz(uyUz__10),
.o_uySintSinp(uySintSinp__10),
.o_oneMinusUz2(oneMinusUz2__10),
.o_uyUzSintCosp(uyUzSintCosp__10),
.o_uxUzSintCosp(uxUzSintCosp__10),
.o_uxSintSinp(uxSintSinp__10),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__10),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__10),
.o_uxCost(uxCost__10),
.o_uzCost(uzCost__10),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__10),
.o_uxNumerator(uxNumerator__10),
.o_uyNumerator(uyNumerator__10),
.o_uyCost(uyCost__10),
.o_uxQuotient(uxQuotient__10),
.o_uyQuotient(uyQuotient__10)
);  

InternalsBlock pipeReg9(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__8),
.i_cost(cost__8),
.i_sinp(sinp__8),
.i_cosp(cosp__8),
.i_sintCosp(sintCosp__8),
.i_sintSinp(sintSinp__8),
.i_uz2(uz2__8),
.i_uxUz(uxUz__8),
.i_uyUz(uyUz__8),
.i_uySintSinp(uySintSinp__8),
.i_oneMinusUz2(oneMinusUz2__8),
.i_uyUzSintCosp(uyUzSintCosp__8),
.i_uxUzSintCosp(uxUzSintCosp__8),
.i_uxSintSinp(uxSintSinp__8),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__8),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__8),
.i_uxCost(uxCost__8),
.i_uzCost(uzCost__8),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__8),
.i_uxNumerator(uxNumerator__8),
.i_uyNumerator(uyNumerator__8),
.i_uyCost(uyCost__8),
.i_uxQuotient(uxQuotient__8),
.i_uyQuotient(uyQuotient__8),
//Outputs			 
.o_sint(sint__9),
.o_cost(cost__9),
.o_sinp(sinp__9),
.o_cosp(cosp__9),
.o_sintCosp(sintCosp__9),
.o_sintSinp(sintSinp__9),
.o_uz2(uz2__9),
.o_uxUz(uxUz__9),
.o_uyUz(uyUz__9),
.o_uySintSinp(uySintSinp__9),
.o_oneMinusUz2(oneMinusUz2__9),
.o_uyUzSintCosp(uyUzSintCosp__9),
.o_uxUzSintCosp(uxUzSintCosp__9),
.o_uxSintSinp(uxSintSinp__9),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__9),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__9),
.o_uxCost(uxCost__9),
.o_uzCost(uzCost__9),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__9),
.o_uxNumerator(uxNumerator__9),
.o_uyNumerator(uyNumerator__9),
.o_uyCost(uyCost__9),
.o_uxQuotient(uxQuotient__9),
.o_uyQuotient(uyQuotient__9)
);  

InternalsBlock pipeReg8(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__7),
.i_cost(cost__7),
.i_sinp(sinp__7),
.i_cosp(cosp__7),
.i_sintCosp(sintCosp__7),
.i_sintSinp(sintSinp__7),
.i_uz2(uz2__7),
.i_uxUz(uxUz__7),
.i_uyUz(uyUz__7),
.i_uySintSinp(uySintSinp__7),
.i_oneMinusUz2(oneMinusUz2__7),
.i_uyUzSintCosp(uyUzSintCosp__7),
.i_uxUzSintCosp(uxUzSintCosp__7),
.i_uxSintSinp(uxSintSinp__7),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__7),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__7),
.i_uxCost(uxCost__7),
.i_uzCost(uzCost__7),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__7),
.i_uxNumerator(uxNumerator__7),
.i_uyNumerator(uyNumerator__7),
.i_uyCost(uyCost__7),
.i_uxQuotient(uxQuotient__7),
.i_uyQuotient(uyQuotient__7),
//Outputs			 
.o_sint(sint__8),
.o_cost(cost__8),
.o_sinp(sinp__8),
.o_cosp(cosp__8),
.o_sintCosp(sintCosp__8),
.o_sintSinp(sintSinp__8),
.o_uz2(uz2__8),
.o_uxUz(uxUz__8),
.o_uyUz(uyUz__8),
.o_uySintSinp(uySintSinp__8),
.o_oneMinusUz2(oneMinusUz2__8),
.o_uyUzSintCosp(uyUzSintCosp__8),
.o_uxUzSintCosp(uxUzSintCosp__8),
.o_uxSintSinp(uxSintSinp__8),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__8),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__8),
.o_uxCost(uxCost__8),
.o_uzCost(uzCost__8),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__8),
.o_uxNumerator(uxNumerator__8),
.o_uyNumerator(uyNumerator__8),
.o_uyCost(uyCost__8),
.o_uxQuotient(uxQuotient__8),
.o_uyQuotient(uyQuotient__8)
);  

InternalsBlock pipeReg7(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__6),
.i_cost(cost__6),
.i_sinp(sinp__6),
.i_cosp(cosp__6),
.i_sintCosp(sintCosp__6),
.i_sintSinp(sintSinp__6),
.i_uz2(uz2__6),
.i_uxUz(uxUz__6),
.i_uyUz(uyUz__6),
.i_uySintSinp(uySintSinp__6),
.i_oneMinusUz2(oneMinusUz2__6),
.i_uyUzSintCosp(uyUzSintCosp__6),
.i_uxUzSintCosp(uxUzSintCosp__6),
.i_uxSintSinp(uxSintSinp__6),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__6),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__6),
.i_uxCost(uxCost__6),
.i_uzCost(uzCost__6),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__6),
.i_uxNumerator(uxNumerator__6),
.i_uyNumerator(uyNumerator__6),
.i_uyCost(uyCost__6),
.i_uxQuotient(uxQuotient__6),
.i_uyQuotient(uyQuotient__6),
//Outputs			 
.o_sint(sint__7),
.o_cost(cost__7),
.o_sinp(sinp__7),
.o_cosp(cosp__7),
.o_sintCosp(sintCosp__7),
.o_sintSinp(sintSinp__7),
.o_uz2(uz2__7),
.o_uxUz(uxUz__7),
.o_uyUz(uyUz__7),
.o_uySintSinp(uySintSinp__7),
.o_oneMinusUz2(oneMinusUz2__7),
.o_uyUzSintCosp(uyUzSintCosp__7),
.o_uxUzSintCosp(uxUzSintCosp__7),
.o_uxSintSinp(uxSintSinp__7),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__7),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__7),
.o_uxCost(uxCost__7),
.o_uzCost(uzCost__7),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__7),
.o_uxNumerator(uxNumerator__7),
.o_uyNumerator(uyNumerator__7),
.o_uyCost(uyCost__7),
.o_uxQuotient(uxQuotient__7),
.o_uyQuotient(uyQuotient__7)
);  

InternalsBlock pipeReg6(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__5),
.i_cost(cost__5),
.i_sinp(sinp__5),
.i_cosp(cosp__5),
.i_sintCosp(sintCosp__5),
.i_sintSinp(sintSinp__5),
.i_uz2(uz2__5),
.i_uxUz(uxUz__5),
.i_uyUz(uyUz__5),
.i_uySintSinp(uySintSinp__5),
.i_oneMinusUz2(oneMinusUz2__5),
.i_uyUzSintCosp(uyUzSintCosp__5),
.i_uxUzSintCosp(uxUzSintCosp__5),
.i_uxSintSinp(uxSintSinp__5),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__5),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__5),
.i_uxCost(uxCost__5),
.i_uzCost(uzCost__5),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__5),
.i_uxNumerator(uxNumerator__5),
.i_uyNumerator(uyNumerator__5),
.i_uyCost(uyCost__5),
.i_uxQuotient(uxQuotient__5),
.i_uyQuotient(uyQuotient__5),
//Outputs			 
.o_sint(sint__6),
.o_cost(cost__6),
.o_sinp(sinp__6),
.o_cosp(cosp__6),
.o_sintCosp(sintCosp__6),
.o_sintSinp(sintSinp__6),
.o_uz2(uz2__6),
.o_uxUz(uxUz__6),
.o_uyUz(uyUz__6),
.o_uySintSinp(uySintSinp__6),
.o_oneMinusUz2(oneMinusUz2__6),
.o_uyUzSintCosp(uyUzSintCosp__6),
.o_uxUzSintCosp(uxUzSintCosp__6),
.o_uxSintSinp(uxSintSinp__6),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__6),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__6),
.o_uxCost(uxCost__6),
.o_uzCost(uzCost__6),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__6),
.o_uxNumerator(uxNumerator__6),
.o_uyNumerator(uyNumerator__6),
.o_uyCost(uyCost__6),
.o_uxQuotient(uxQuotient__6),
.o_uyQuotient(uyQuotient__6)
);  

InternalsBlock pipeReg5(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__4),
.i_cost(cost__4),
.i_sinp(sinp__4),
.i_cosp(cosp__4),
.i_sintCosp(sintCosp__4),
.i_sintSinp(sintSinp__4),
.i_uz2(uz2__4),
.i_uxUz(uxUz__4),
.i_uyUz(uyUz__4),
.i_uySintSinp(uySintSinp__4),
.i_oneMinusUz2(oneMinusUz2__4),
.i_uyUzSintCosp(uyUzSintCosp__4),
.i_uxUzSintCosp(uxUzSintCosp__4),
.i_uxSintSinp(uxSintSinp__4),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__4),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__4),
.i_uxCost(uxCost__4),
.i_uzCost(uzCost__4),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__4),
.i_uxNumerator(uxNumerator__4),
.i_uyNumerator(uyNumerator__4),
.i_uyCost(uyCost__4),
.i_uxQuotient(uxQuotient__4),
.i_uyQuotient(uyQuotient__4),
//Outputs			 
.o_sint(sint__5),
.o_cost(cost__5),
.o_sinp(sinp__5),
.o_cosp(cosp__5),
.o_sintCosp(sintCosp__5),
.o_sintSinp(sintSinp__5),
.o_uz2(uz2__5),
.o_uxUz(uxUz__5),
.o_uyUz(uyUz__5),
.o_uySintSinp(uySintSinp__5),
.o_oneMinusUz2(oneMinusUz2__5),
.o_uyUzSintCosp(uyUzSintCosp__5),
.o_uxUzSintCosp(uxUzSintCosp__5),
.o_uxSintSinp(uxSintSinp__5),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__5),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__5),
.o_uxCost(uxCost__5),
.o_uzCost(uzCost__5),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__5),
.o_uxNumerator(uxNumerator__5),
.o_uyNumerator(uyNumerator__5),
.o_uyCost(uyCost__5),
.o_uxQuotient(uxQuotient__5),
.o_uyQuotient(uyQuotient__5)
);  


//since these will be replaced later


 assign 	sint__0						= 32'b00000000000000000000000000000000;
 assign		cost__0						= 32'b00000000000000000000000000000000;
 assign		sinp__0						= 32'b00000000000000000000000000000000;
 assign		cosp__0						= 32'b00000000000000000000000000000000;
 assign		sintCosp__0					= 32'b00000000000000000000000000000000;
 assign		sintSinp__0					= 32'b00000000000000000000000000000000;
 assign		uz2__0						= 0;
 assign		uxUz__0						= 32'b00000000000000000000000000000000;
 assign		uyUz__0						= 32'b00000000000000000000000000000000;
 assign		uySintSinp__0				= 32'b00000000000000000000000000000000;
 assign		oneMinusUz2__0				= 0;
 assign		uyUzSintCosp__0				= 32'b00000000000000000000000000000000;
 assign		uxUzSintCosp__0				= 32'b00000000000000000000000000000000;
 assign		uxSintSinp__0				= 32'b00000000000000000000000000000000;
 assign		sqrtOneMinusUz2__0			= 32'b00000000000000000000000000000000;
 assign		sintCospSqrtOneMinusUz2__0	= 32'b00000000000000000000000000000000;
 assign		uxCost__0					= 32'b00000000000000000000000000000000;
 assign		uzCost__0					= 32'b00000000000000000000000000000000;
 assign		sqrtOneMinusUz2_inv__0		= 32'b00000000000000000000000000000000;
 assign		uxNumerator__0				= 32'b00000000000000000000000000000000;
 assign		uyNumerator__0				= 32'b00000000000000000000000000000000;
 assign		uyCost__0					= 32'b00000000000000000000000000000000;
 assign		uxQuotient__0				= 32'b00000000000000000000000000000000;
 assign		uyQuotient__0				= 32'b00000000000000000000000000000000;

InternalsBlock pipeReg1(
//Inputs
.clock(clock),
.reset(reset),
.enable(enable),
.i_sint(sint__0),
.i_cost(cost__0),
.i_sinp(sinp__0),
.i_cosp(cosp__0),
.i_sintCosp(sintCosp__0),
.i_sintSinp(sintSinp__0),
.i_uz2(uz2__0),
.i_uxUz(uxUz__0),
.i_uyUz(uyUz__0),
.i_uySintSinp(uySintSinp__0),
.i_oneMinusUz2(oneMinusUz2__0),
.i_uyUzSintCosp(uyUzSintCosp__0),
.i_uxUzSintCosp(uxUzSintCosp__0),
.i_uxSintSinp(uxSintSinp__0),
.i_sqrtOneMinusUz2(sqrtOneMinusUz2__0),
.i_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__0),
.i_uxCost(uxCost__0),
.i_uzCost(uzCost__0),
.i_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__0),
.i_uxNumerator(uxNumerator__0),
.i_uyNumerator(uyNumerator__0),
.i_uyCost(uyCost__0),
.i_uxQuotient(uxQuotient__0),
.i_uyQuotient(uyQuotient__0),
//Outputs			 
.o_sint(sint__1),
.o_cost(cost__1),
.o_sinp(sinp__1),
.o_cosp(cosp__1),
.o_sintCosp(sintCosp__1),
.o_sintSinp(sintSinp__1),
.o_uz2(uz2__1),
.o_uxUz(uxUz__1),
.o_uyUz(uyUz__1),
.o_uySintSinp(uySintSinp__1),
.o_oneMinusUz2(oneMinusUz2__1),
.o_uyUzSintCosp(uyUzSintCosp__1),
.o_uxUzSintCosp(uxUzSintCosp__1),
.o_uxSintSinp(uxSintSinp__1),
.o_sqrtOneMinusUz2(sqrtOneMinusUz2__1),
.o_sintCospSqrtOneMinusUz2(sintCospSqrtOneMinusUz2__1),
.o_uxCost(uxCost__1),
.o_uzCost(uzCost__1),
.o_sqrtOneMinusUz2_inv(sqrtOneMinusUz2_inv__1),
.o_uxNumerator(uxNumerator__1),
.o_uyNumerator(uyNumerator__1),
.o_uyCost(uyCost__1),
.o_uxQuotient(uxQuotient__1),
.o_uyQuotient(uyQuotient__1)
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
//synchronous logic.  On the clock event, the outputs calculated from
//this block are put on the output pins for reading (registered
//outputs, as per the convention).




//Assign outputs from block on positive clock edge.
always @ (posedge clock) begin
	if(reset_new) begin
		//Reset internal non-pipelined registers here.
		ux_scatterer	<= 32'h00000000;
		uy_scatterer	<= 32'h00000000;
		uz_scatterer	<= 32'h7FFFFFFF;
	end else if (enable) begin
		ux_scatterer <= new_ux;
		uy_scatterer <= new_uy;
		uz_scatterer <= new_uz;
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
//divide unit, and square root unit.  Also, products brought in
//from the wrapper are placed on the appropriate wires for placement
//in the pipeline.




//-------------OPERAND SETUP----------------------


//NAMING CONVENTION:
//opX_Y_Z, op stands for operand, X stands for the multiplication number for
//that clock cycle, Y stands for the clock cycle, Z is either 1 or 2 for the
//first or second operand for this multiply
//
//COMMENTING CONVENTIONS:
//CC X means that the values being calculated will be ready for the Xth register
//location, where 0 is the register prior to any calculations being done, 1 is
//after the 1st clock cycle of calculation, etc.

//CC 2
assign	op1_2_1						=	i_uz1;
assign	op1_2_2						=	i_uz1;
	
//CC 3
//SUBTRACTION, see math results
	
//CC 4
assign	op1_4_1						=	i_ux3;
assign	op1_4_2						=	i_uz3;

//CC 5 -- NOOP, line up with reflector
	
//CC `SQRT+5 -- Started in CC 6
assign	sqrtOperand1_6				=	oneMinusUz2__5;

//CC `SQRT+`DIV+6 -- Started in CC `SQRT+5
assign	divNumerator1_16			=	`INTMAX_2;
//assign	divDenominator1_16			=	sqrtOneMinusUz2[`SQRT+5];
assign	divDenominator1_16			=	new_sqrtOneMinusUz2;

//CC `SQRT+`DIV+3
assign op1_33_1						=	sint_Mem;
assign op1_33_2						=	cosp_Mem;

assign op2_33_1						=	sint_Mem;
assign op2_33_2						=	sinp_Mem;

assign op3_33_1						=	i_uy32;
assign op3_33_2						=	i_uz32;

//CC `SQRT+`DIV+4
assign op1_34_1						=	i_ux33;
assign op1_34_2						=	sintSinp__33;

assign op2_34_1						=	i_uy33;
assign op2_34_2						=	sintSinp__33;

assign op3_34_1						=	uxUz__33;
assign op3_34_2						=	sintCosp__33;

assign op4_34_1						=	uyUz__33;
assign op4_34_2						=	sintCosp__33;

//CC `SQRT+`DIV+5
//2 SUBS (see math results)
//`DIVISION COMPLETE (see math results)

//CC `SQRT+`DIV+6 -- Division is now complete and can be read.
assign op1_36_1						=	uxNumerator__35;
assign op1_36_2						=	new_sqrtOneMinusUz2_inv;


assign op2_36_1						=	uyNumerator__35;
assign op2_36_2						=	new_sqrtOneMinusUz2_inv;

assign op3_36_1						=	sintCosp__35;
assign op3_36_2						=	sqrtOneMinusUz2__35;

assign op4_36_1						=	i_ux35;
assign op4_36_2						=	cost__35;

assign op5_36_1						=	i_uy35;
assign op5_36_2						=	cost__35;

assign op6_36_1						=	i_uz35;
assign op6_36_2						=	cost__35;


//-------------MATH RESULTS----------------------


//NAMING CONVENTION:
//new_VAR means that the variable named VAR will be stored into the register
//pipeline at the clock cycle indicated by the comments above it.
//
//prod stands for product, quot stands for quotient, sqrt stands for square root
//prodX_Y means the Xth product which started calculation at the Yth clock cycle
//Similarly for quot and sqrtResult.
//
//
//COMMENTING CONVENTIONS:
//CC X means that the values being calculated will be ready for the Xth register
//location, where 0 is the register prior to any calculations being done, 1 is
//after the 1st clock cycle of calculation, etc.


//Used to determine whether or not the divide operation overflowed.
//or U1(div_overflow, quot1_16[62], quot1_16[61], quot1_16[60], quot1_16[59], quot1_16[58], quot1_16[57], quot1_16[56], quot1_16[55], quot1_16[54], quot1_16[53], quot1_16[52], quot1_16[51], quot1_16[50], quot1_16[49], quot1_16[48], quot1_16[47]);
assign div_overflow = quot1_16[62]| quot1_16[61]| quot1_16[60]| quot1_16[59]| quot1_16[58]| quot1_16[57]| quot1_16[56]| quot1_16[55]| quot1_16[54]| quot1_16[53]| quot1_16[52]| quot1_16[51]| quot1_16[50]| quot1_16[49]| quot1_16[48]| quot1_16[47];

//Used to determine whether or not the multiply operation overflowed.
//or U2(toAnd1_36_1, prod1_36[62], prod1_36[61], prod1_36[60], prod1_36[59], prod1_36[58], prod1_36[57], prod1_36[56], prod1_36[55], prod1_36[54], prod1_36[53], prod1_36[52], prod1_36[51], prod1_36[50], prod1_36[49], prod1_36[48], prod1_36[47], prod1_36[46]);
assign toAnd1_36_1 = prod1_36[62]| prod1_36[61]| prod1_36[60]| prod1_36[59]| prod1_36[58]| prod1_36[57]| prod1_36[56]| prod1_36[55]| prod1_36[54]| prod1_36[53]| prod1_36[52]| prod1_36[51]| prod1_36[50]| prod1_36[49]| prod1_36[48]| prod1_36[47]| prod1_36[46];
//Used to determine whether or not the multiply operation overflowed in the negative direction.
//or U3(toAnd1_36_2, ~prod1_36[62], ~prod1_36[61], ~prod1_36[60], ~prod1_36[59], ~prod1_36[58], ~prod1_36[57], ~prod1_36[56], ~prod1_36[55], ~prod1_36[54], ~prod1_36[53], ~prod1_36[52], ~prod1_36[51], ~prod1_36[50], ~prod1_36[49], ~prod1_36[48], ~prod1_36[47], ~prod1_36[46]);
assign toAnd1_36_2 = ~prod1_36[62]| ~prod1_36[61]| ~prod1_36[60]| ~prod1_36[59]| ~prod1_36[58]| ~prod1_36[57]| ~prod1_36[56]| ~prod1_36[55]| ~prod1_36[54]| ~prod1_36[53]| ~prod1_36[52]| ~prod1_36[51]| ~prod1_36[50]| ~prod1_36[49]| ~prod1_36[48]| ~prod1_36[47]| ~prod1_36[46];

//and U4(overflow1_36, ~prod1_36[63], toAnd1_36_1);
assign overflow1_36 = ~prod1_36[63]| toAnd1_36_1;
//and U5(negOverflow1_36, prod1_36[63], toAnd1_36_2);
assign negOverflow1_36 = prod1_36[63]| toAnd1_36_2;


//Used to determine whether or not the multiply operation overflowed.
//or U6(toAnd2_36_1, prod2_36[62], prod2_36[61], prod2_36[60], prod2_36[59], prod2_36[58], prod2_36[57], prod2_36[56], prod2_36[55], prod2_36[54], prod2_36[53], prod2_36[52], prod2_36[51], prod2_36[50], prod2_36[49], prod2_36[48], prod2_36[47], prod2_36[46]);
assign toAnd2_36_1 = prod2_36[62]| prod2_36[61]| prod2_36[60]| prod2_36[59]| prod2_36[58]| prod2_36[57]| prod2_36[56]| prod2_36[55]| prod2_36[54]| prod2_36[53]| prod2_36[52]| prod2_36[51]| prod2_36[50]| prod2_36[49]| prod2_36[48]| prod2_36[47]| prod2_36[46];
//Used to determine whether or not the multiply operation overflowed in the negative direction.
//or U7(toAnd2_36_2, ~prod2_36[62], ~prod2_36[61], ~prod2_36[60], ~prod2_36[59], ~prod2_36[58], ~prod2_36[57], ~prod2_36[56], ~prod2_36[55], ~prod2_36[54], ~prod2_36[53], ~prod2_36[52], ~prod2_36[51], ~prod2_36[50], ~prod2_36[49], ~prod2_36[48], ~prod2_36[47], ~prod2_36[46]);
assign toAnd2_36_2 = ~prod2_36[62]| ~prod2_36[61]| ~prod2_36[60]| ~prod2_36[59]| ~prod2_36[58]| ~prod2_36[57]| ~prod2_36[56]| ~prod2_36[55]| ~prod2_36[54]| ~prod2_36[53]| ~prod2_36[52]| ~prod2_36[51]| ~prod2_36[50]| ~prod2_36[49]| ~prod2_36[48]| ~prod2_36[47]| ~prod2_36[46];

//and U8(overflow2_36, ~prod2_36[63], toAnd2_36_1);
assign overflow2_36 = ~prod2_36[63]|toAnd2_36_1;
//and U9(negOverflow2_36, prod2_36[63], toAnd2_36_2);
assign negOverflow2_36 = prod2_36[63]|toAnd2_36_2;



//CC 2
assign new_uz2						= prod1_2;
//CC 3
sub_64b		oneMinusUz2_sub(
				.dataa(`INTMAX_2),
				.datab(uz2__2),
				.result(new_oneMinusUz2)
		);

//CC 4
assign new_uxUz						= prod1_4;
//CC `SQRT+5
assign new_sqrtOneMinusUz2			= sqrtResult1_6;
//CC `SQRT+`DIV+3
assign new_sintCosp					= prod1_33;
assign new_sintSinp					= prod2_33;
assign new_uyUz						= prod3_33;
//CC `SQRT+`DIV+4
assign new_sint						= sint_Mem;
assign new_cost						= cost_Mem;
assign new_sinp						= sinp_Mem;
assign new_cosp						= cosp_Mem;
assign new_uxSintSinp				= prod1_34;
assign new_uySintSinp				= prod2_34;
assign new_uxUzSintCosp				= prod3_34;
assign new_uyUzSintCosp				= prod4_34;
//CC `SQRT+`DIV+5
sub_32b		uxNumer_sub(
				.dataa(uxUzSintCosp__34),
				.datab(uySintSinp__34),
				.overflow(uxNumerOverflow),
				.result(new_uxNumerator)
			);

add_32b		uyNumer_add(
				.dataa(uyUzSintCosp__34),
				.datab(uxSintSinp__34),
				.overflow(uyNumerOverflow),
				.result(new_uyNumerator)
			);


//Possibility for division overflow (whereby the inverse is too large).  Data storage for this
//value is 15 bits left of the decimal, and 16 bits to the right.
assign new_sqrtOneMinusUz2_inv			=  (div_overflow) ? `INTMAX		:	{quot1_16[63:63], quot1_16[46:16]};

//CC `SQRT+`DIV+6
always @ (overflow1_36 or negOverflow1_36 or prod1_36 or overflow2_36 or negOverflow2_36 or prod2_36) begin
	case ({overflow1_36, negOverflow1_36})
	0:	new_uxQuotient = {prod1_36[63:63], prod1_36[45:15]};
	1:	new_uxQuotient = `INTMIN;
	2:	new_uxQuotient = `INTMAX;
	//Should never occur
	3:	new_uxQuotient = {prod1_36[63:63], prod1_36[45:15]};
	endcase
	
	case ({overflow2_36, negOverflow2_36})
	
	0:	new_uyQuotient = {prod2_36[63:63], prod2_36[45:15]};
	1:	new_uyQuotient = `INTMIN;
	2:	new_uyQuotient = `INTMAX;
		//Should never occur
	3:	new_uyQuotient = {prod2_36[63:63], prod2_36[45:15]};
	endcase
end

//always @* begin
//	new_uxQuotient = {prod1_36[63:63], prod1_36[47:16]};
//	new_uyQuotient = {prod2_36[63:63], prod2_36[47:16]};
//end

assign new_sintCospSqrtOneMinusUz2	= prod3_36;
assign new_uxCost					= prod4_36;
assign new_uyCost					= prod5_36;
assign new_uzCost					= prod6_36;



//-----------------------FINAL RESULT CALCULATIONS--------------
//
//
//
//
//
//
//
//At this point, all calculations have been completed, save the
//final results.  This part of the code decides whether or not the
//current calculation involved a normal (orthogonal) incident or not,
//and uses this information to determine how to calculate the
//final results.  Final results are put on wires new_ux, new_uy, and
//new_uz, where they are output to registers ux_scatterer,
//uy_scatterer, and uz_scatterer on the clock event for synchronization
//(registered outputs, as per the convention).



//Determine whether or not the photon calculation was done on a photon that
//was normal (orthogonal) to the plane of interest.  This is to avoid divide
//by zero errors
always @ (i_uz36) begin
	//If uz >= `INTMAX-3 || uz <= -`INTMAX+3, normal incident
	if(i_uz36 == 32'h7FFFFFFF || i_uz36 == 32'h7FFFFFFE || i_uz36 == 32'h7FFFFFFD || i_uz36 == 32'h7FFFFFFC || i_uz36 == 32'h80000000 || i_uz36 == 32'h80000001 || i_uz36 == 32'h80000002 || i_uz36 == 32'h80000003 || i_uz36 == 32'h80000004) begin
		normalIncident = 1'b1;
	end else begin
		normalIncident = 1'b0;
	end
end



//Assign calculation values for final ux result
assign ux_add_1 = (normalIncident) ? sintCosp__36	:	uxQuotient__36;
assign ux_add_2 = (normalIncident) ? 32'b0		:	uxCost__36;

add_32b		ux_add(
				.dataa(ux_add_1),
				.datab(ux_add_2),
				.overflow(uxOverflow),
				.result(new_ux)
			);

//Assign calculation values for final uy result
assign uy_add_1 = (normalIncident)	? sintSinp__36	:	uyQuotient__36;
assign uy_add_2 = (normalIncident)	? 32'b0		:	uyCost__36;

add_32b		uy_add(
				.dataa(uy_add_1),
				.datab(uy_add_2),
				.overflow(uyOverflow),
				.result(new_uy)
			);




//Assign calculation values for final uz result.
//First MUX implements SIGN(uz) function.
assign normalUz = (i_uz36 >=0)		? cost__36		:	-cost__36;
assign uz_sub_1 = (normalIncident)	? normalUz			:	uzCost__36;
assign uz_sub_2 = (normalIncident)	? 32'b0		:	sintCospSqrtOneMinusUz2__36;

sub_32b		uz_sub(
				.dataa(uz_sub_1),
				.datab(uz_sub_2),
				.overflow(uzOverflow),
				.result(new_uz)
			);
			
				

endmodule
module sub_32b (dataa, datab, overflow, result); 

	input [31:0] dataa;
	input [31:0] datab;
	output overflow;
	output [31:0] result;

	wire [32:0]computation; //one extra bit to account for overflow
	
	assign computation = dataa - datab;
	assign overflow = computation[32];
	assign result = computation[31:0];

endmodule 
module add_32b (dataa, datab, overflow, result);

	input [31:0] dataa;
	input [31:0] datab;
	output overflow;
	output [31:0] result;

	wire [32:0]computation; //one extra bit to account for overflow
	
	assign computation = dataa + datab;
	assign overflow = computation[32];
	assign result = computation[31:0];

endmodule 
module InternalsBlock(
	//Inputs
	clock,
	reset,
	enable,
	
	i_sint,
	i_cost,
	i_sinp,
	i_cosp,
	i_sintCosp,
	i_sintSinp,
	i_uz2,
	i_uxUz,
	i_uyUz,
	i_uySintSinp,
	i_oneMinusUz2,
	i_uyUzSintCosp,
	i_uxUzSintCosp,
	i_uxSintSinp,
	i_sqrtOneMinusUz2,
	i_sintCospSqrtOneMinusUz2,
	i_uxCost,
	i_uzCost,
	i_sqrtOneMinusUz2_inv,
	i_uxNumerator,
	i_uyNumerator,
	i_uyCost,
	i_uxQuotient,
	i_uyQuotient,
	//Outputs
	o_sint,
	o_cost,
	o_sinp,
	o_cosp,
	o_sintCosp,
	o_sintSinp,
	o_uz2,
	o_uxUz,
	o_uyUz,
	o_uySintSinp,
	o_oneMinusUz2,
	o_uyUzSintCosp,
	o_uxUzSintCosp,
	o_uxSintSinp,
	o_sqrtOneMinusUz2,
	o_sintCospSqrtOneMinusUz2,
	o_uxCost,
	o_uzCost,
	o_sqrtOneMinusUz2_inv,
	o_uxNumerator,
	o_uyNumerator,
	o_uyCost,
	o_uxQuotient,
	o_uyQuotient
	);

input					clock;
input					reset;
input					enable;

input		[31:0]		i_sint;
input		[31:0]		i_cost;
input		[31:0]		i_sinp;
input		[31:0]		i_cosp;
input		[31:0]		i_sintCosp;
input		[31:0]		i_sintSinp;
input		[63:0]		i_uz2;
input		[31:0]		i_uxUz;
input		[31:0]		i_uyUz;
input		[31:0]		i_uySintSinp;
input		[63:0]		i_oneMinusUz2;
input		[31:0]		i_uyUzSintCosp;
input		[31:0]		i_uxUzSintCosp;
input		[31:0]		i_uxSintSinp;
input		[31:0]		i_sqrtOneMinusUz2;
input		[31:0]		i_sintCospSqrtOneMinusUz2;
input		[31:0]		i_uxCost;
input		[31:0]		i_uzCost;
input		[31:0]		i_sqrtOneMinusUz2_inv;
input		[31:0]		i_uxNumerator;
input		[31:0]		i_uyNumerator;
input		[31:0]		i_uyCost;
input		[31:0]		i_uxQuotient;
input		[31:0]		i_uyQuotient;


output		[31:0]		o_sint;
output		[31:0]		o_cost;
output		[31:0]		o_sinp;
output		[31:0]		o_cosp;
output		[31:0]		o_sintCosp;
output		[31:0]		o_sintSinp;
output		[63:0]		o_uz2;
output		[31:0]		o_uxUz;
output		[31:0]		o_uyUz;
output		[31:0]		o_uySintSinp;
output		[63:0]		o_oneMinusUz2;
output		[31:0]		o_uyUzSintCosp;
output		[31:0]		o_uxUzSintCosp;
output		[31:0]		o_uxSintSinp;
output		[31:0]		o_sqrtOneMinusUz2;
output		[31:0]		o_sintCospSqrtOneMinusUz2;
output		[31:0]		o_uxCost;
output		[31:0]		o_uzCost;
output		[31:0]		o_sqrtOneMinusUz2_inv;
output		[31:0]		o_uxNumerator;
output		[31:0]		o_uyNumerator;
output		[31:0]		o_uyCost;
output		[31:0]		o_uxQuotient;
output		[31:0]		o_uyQuotient;


wire					clock;
wire					reset;
wire					enable;

wire		[31:0]		i_sint;
wire		[31:0]		i_cost;
wire		[31:0]		i_sinp;
wire		[31:0]		i_cosp;
wire		[31:0]		i_sintCosp;
wire		[31:0]		i_sintSinp;
wire		[63:0]		i_uz2;
wire		[31:0]		i_uxUz;
wire		[31:0]		i_uyUz;
wire		[31:0]		i_uySintSinp;
wire		[63:0]		i_oneMinusUz2;
wire		[31:0]		i_uyUzSintCosp;
wire		[31:0]		i_uxUzSintCosp;
wire		[31:0]		i_uxSintSinp;
wire		[31:0]		i_sqrtOneMinusUz2;
wire		[31:0]		i_sintCospSqrtOneMinusUz2;
wire		[31:0]		i_uxCost;
wire		[31:0]		i_uzCost;
wire		[31:0]		i_sqrtOneMinusUz2_inv;
wire		[31:0]		i_uxNumerator;
wire		[31:0]		i_uyNumerator;
wire		[31:0]		i_uyCost;
wire		[31:0]		i_uxQuotient;
wire		[31:0]		i_uyQuotient;


reg			[31:0]		o_sint;
reg			[31:0]		o_cost;
reg			[31:0]		o_sinp;
reg			[31:0]		o_cosp;
reg			[31:0]		o_sintCosp;
reg			[31:0]		o_sintSinp;
reg			[63:0]		o_uz2;
reg			[31:0]		o_uxUz;
reg			[31:0]		o_uyUz;
reg			[31:0]		o_uySintSinp;
reg			[63:0]		o_oneMinusUz2;
reg			[31:0]		o_uyUzSintCosp;
reg			[31:0]		o_uxUzSintCosp;
reg			[31:0]		o_uxSintSinp;
reg			[31:0]		o_sqrtOneMinusUz2;
reg			[31:0]		o_sintCospSqrtOneMinusUz2;
reg			[31:0]		o_uxCost;
reg			[31:0]		o_uzCost;
reg			[31:0]		o_sqrtOneMinusUz2_inv;
reg			[31:0]		o_uxNumerator;
reg			[31:0]		o_uyNumerator;
reg			[31:0]		o_uyCost;
reg			[31:0]		o_uxQuotient;
reg			[31:0]		o_uyQuotient;




always @ (posedge clock)
	if(reset) begin
		o_sint						<= 32'h00000000;
		o_cost						<= 32'h00000000;
		o_sinp						<= 32'h00000000;
		o_cosp						<= 32'h00000000;
		o_sintCosp					<= 32'h00000000;
		o_sintSinp					<= 32'h00000000;
		o_uz2						<= 64'h0000000000000000;
		o_uxUz						<= 32'h00000000;
		o_uyUz						<= 32'h00000000;
		o_uySintSinp				<= 32'h00000000;
		o_oneMinusUz2				<= 64'h0000000000000000;
		o_uyUzSintCosp				<= 32'h00000000;
		o_uxUzSintCosp				<= 32'h00000000;
		o_uxSintSinp				<= 32'h00000000;
		o_sqrtOneMinusUz2			<= 32'h00000000;
		o_sintCospSqrtOneMinusUz2	<= 32'h00000000;
		o_uxCost					<= 32'h00000000;
		o_uzCost					<= 32'h00000000;
		o_sqrtOneMinusUz2_inv		<= 32'h00000000;
		o_uxNumerator				<= 32'h00000000;
		o_uyNumerator				<= 32'h00000000;
		o_uyCost					<= 32'h00000000;
		o_uxQuotient				<= 32'h00000000;
		o_uyQuotient				<= 32'h00000000;
	end else if(enable) begin
		o_sint						<= i_sint;
		o_cost						<= i_cost;
		o_sinp						<= i_sinp;
		o_cosp						<= i_cosp;
		o_sintCosp					<= i_sintCosp;
		o_sintSinp					<= i_sintSinp;
		o_uz2						<= i_uz2;
		o_uxUz						<= i_uxUz;
		o_uyUz						<= i_uyUz;
		o_uySintSinp				<= i_uySintSinp;
		o_oneMinusUz2				<= i_oneMinusUz2;
		o_uyUzSintCosp				<= i_uyUzSintCosp;
		o_uxUzSintCosp				<= i_uxUzSintCosp;
		o_uxSintSinp				<= i_uxSintSinp;
		o_sqrtOneMinusUz2			<= i_sqrtOneMinusUz2;
		o_sintCospSqrtOneMinusUz2	<= i_sintCospSqrtOneMinusUz2;
		o_uxCost					<= i_uxCost;
		o_uzCost					<= i_uzCost;
		o_sqrtOneMinusUz2_inv		<= i_sqrtOneMinusUz2_inv;
		o_uxNumerator				<= i_uxNumerator;
		o_uyNumerator				<= i_uyNumerator;
		o_uyCost					<= i_uyCost;
		o_uxQuotient				<= i_uxQuotient;
		o_uyQuotient				<= i_uyQuotient;
	end
endmodule
module Memory_Wrapper (
	//Inputs
	clock,
//	reset, //This is unused in the module. ODIN II complains.
	pindex,
	//Outputs
	sinp,
	cosp
	);


input					clock;
//input					reset;
input	[9:0]			pindex;


output	[31:0]			sinp;
output	[31:0]			cosp;

//sinp_ROM sinp_MEM (.address(pindex), .clock(clock), .q(sinp));
//cosp_ROM cosp_MEM (.address(pindex), .clock(clock), .q(cosp));

//Instantiate a single port ram for odin
wire [31:0]blank;
assign blank = 32'b000000000000000000000000000000;
defparam sinp_replace.ADDR_WIDTH = 10;
defparam sinp_replace.DATA_WIDTH = 32;
single_port_ram sinp_replace(.clk (clock), .addr (pindex), .data (blank), .we (1'b0), .out (sinp));

defparam cosp_replace.ADDR_WIDTH = 10;
defparam cosp_replace.DATA_WIDTH = 32;
single_port_ram cosp_replace(.clk (clock), .addr (pindex), .data (blank), .we (1'b0), .out (cosp));

			
endmodule
module single_port_ram(
clk,
addr,
data,
we,
out
);

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
input clk;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;
input we;
output reg [DATA_WIDTH-1:0] out;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we) begin
    ram[addr] <= data;
  end
  else begin
    out <= ram[addr];
  end
end

endmodule
