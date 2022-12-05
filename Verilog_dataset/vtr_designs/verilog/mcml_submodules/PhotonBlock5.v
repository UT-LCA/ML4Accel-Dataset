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

module PhotonBlock5(
	//Inputs
	clock,
	reset,
	enable,
	
	i_x,
	i_y,
	i_z,
	i_ux,
	i_uy,
	i_uz,
	i_sz,
	i_sr,
	i_sleftz,
	i_sleftr,
	i_weight,
	i_layer,
	i_dead,
	i_hit,
	//Outputs
	o_x,
	o_y,
	o_z,
	o_ux,
	o_uy,
	o_uz,
	o_sz,
	o_sr,
	o_sleftz,
	o_sleftr,
	o_weight,
	o_layer,
	o_dead,
	o_hit
	);

//parameter BIT_WIDTH=32;
//parameter LAYER_WIDTH=3;

input				clock;
input				reset;
input				enable;

input	[`BIT_WIDTH-1:0]			i_x;
input	[`BIT_WIDTH-1:0]			i_y;
input	[`BIT_WIDTH-1:0]			i_z;
input	[`BIT_WIDTH-1:0]			i_ux;
input	[`BIT_WIDTH-1:0]			i_uy;
input	[`BIT_WIDTH-1:0]			i_uz;
input	[`BIT_WIDTH-1:0]			i_sz;
input	[`BIT_WIDTH-1:0]			i_sr;
input	[`BIT_WIDTH-1:0]			i_sleftz;
input	[`BIT_WIDTH-1:0]			i_sleftr;
input	[`BIT_WIDTH-1:0]			i_weight;
input	[`LAYER_WIDTH-1:0]			i_layer;
input				i_dead;
input				i_hit;


output	[`BIT_WIDTH-1:0]			o_x;
output	[`BIT_WIDTH-1:0]			o_y;
output	[`BIT_WIDTH-1:0]			o_z;
output	[`BIT_WIDTH-1:0]			o_ux;
output	[`BIT_WIDTH-1:0]			o_uy;
output	[`BIT_WIDTH-1:0]			o_uz;
output	[`BIT_WIDTH-1:0]			o_sz;
output	[`BIT_WIDTH-1:0]			o_sr;
output	[`BIT_WIDTH-1:0]			o_sleftz;
output	[`BIT_WIDTH-1:0]			o_sleftr;
output	[`BIT_WIDTH-1:0]			o_weight;
output	[`LAYER_WIDTH-1:0]			o_layer;
output				o_dead;
output				o_hit;


wire				clock;
wire				reset;
wire				enable;

wire	[`BIT_WIDTH-1:0]			i_x;
wire	[`BIT_WIDTH-1:0]			i_y;
wire	[`BIT_WIDTH-1:0]			i_z;
wire	[`BIT_WIDTH-1:0]			i_ux;
wire	[`BIT_WIDTH-1:0]			i_uy;
wire	[`BIT_WIDTH-1:0]			i_uz;
wire	[`BIT_WIDTH-1:0]			i_sz;
wire	[`BIT_WIDTH-1:0]			i_sr;
wire	[`BIT_WIDTH-1:0]			i_sleftz;
wire	[`BIT_WIDTH-1:0]			i_sleftr;
wire	[`BIT_WIDTH-1:0]			i_weight;
wire	[`LAYER_WIDTH-1:0]			i_layer;
wire				i_dead;
wire				i_hit;


reg	[`BIT_WIDTH-1:0]			o_x;
reg	[`BIT_WIDTH-1:0]			o_y;
reg	[`BIT_WIDTH-1:0]			o_z;
reg	[`BIT_WIDTH-1:0]			o_ux;
reg	[`BIT_WIDTH-1:0]			o_uy;
reg	[`BIT_WIDTH-1:0]			o_uz;
reg	[`BIT_WIDTH-1:0]			o_sz;
reg	[`BIT_WIDTH-1:0]			o_sr;
reg	[`BIT_WIDTH-1:0]			o_sleftz;
reg	[`BIT_WIDTH-1:0]			o_sleftr;
reg	[`BIT_WIDTH-1:0]			o_weight;
reg	[`LAYER_WIDTH-1:0]			o_layer;
reg				o_dead;
reg				o_hit;


always @ (posedge clock)
	if(reset) begin
		o_x		<=	{`BIT_WIDTH{1'b0}};
		o_y		<=	{`BIT_WIDTH{1'b0}};
		o_z		<=	{`BIT_WIDTH{1'b0}};
		o_ux		<=	{`BIT_WIDTH{1'b0}};
		o_uy		<=	{`BIT_WIDTH{1'b0}};
		o_uz		<=	{`BIT_WIDTH{1'b0}};
		o_sz		<=	{`BIT_WIDTH{1'b0}};
		o_sr		<=	{`BIT_WIDTH{1'b0}};
		o_sleftz	<=	{`BIT_WIDTH{1'b0}};
		o_sleftr	<=	{`BIT_WIDTH{1'b0}};
		o_weight	<=	{`BIT_WIDTH{1'b0}};
		o_layer		<=	{`LAYER_WIDTH{1'b0}};
		o_dead		<=	1'b1;
		o_hit		<=	1'b0;
	end else if(enable) begin
		o_x		<=	i_x;
		o_y		<=	i_y;
		o_z		<=	i_z;
		o_ux		<=	i_ux;
		o_uy		<=	i_uy;
		o_uz		<=	i_uz;
		o_sz		<=	i_sz;
		o_sr		<=	i_sr;
		o_sleftz	<=	i_sleftz;
		o_sleftr	<=	i_sleftr;
		o_weight	<=	i_weight;
		o_layer		<=	i_layer;
		o_dead		<=	i_dead;
		o_hit		<=	i_hit;
	end
endmodule
