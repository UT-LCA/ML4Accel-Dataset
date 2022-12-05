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
