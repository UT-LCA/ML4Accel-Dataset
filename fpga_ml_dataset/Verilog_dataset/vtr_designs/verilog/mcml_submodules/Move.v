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

module Move(     //INPUTS
				 clock, reset, enable,
				 x_moverMux, y_moverMux, z_moverMux,
				 ux_moverMux, uy_moverMux, uz_moverMux,
				 sz_moverMux, sr_moverMux,
				 sleftz_moverMux, sleftr_moverMux,
				 layer_moverMux, weight_moverMux, dead_moverMux,

				 log_rand_num,

				 //OUTPUTS
				 x_mover, y_mover, z_mover,
				 ux_mover, uy_mover, uz_mover,
				 sz_mover, sr_mover,
				 sleftz_mover, sleftr_mover,
				 layer_mover, weight_mover, dead_mover,

				 // CONSTANTS
				 OneOver_MutMaxrad_0, OneOver_MutMaxrad_1, OneOver_MutMaxrad_2, OneOver_MutMaxrad_3, OneOver_MutMaxrad_4, OneOver_MutMaxrad_5,
				 OneOver_MutMaxdep_0, OneOver_MutMaxdep_1, OneOver_MutMaxdep_2, OneOver_MutMaxdep_3, OneOver_MutMaxdep_4, OneOver_MutMaxdep_5,
				 OneOver_Mut_0, OneOver_Mut_1, OneOver_Mut_2, OneOver_Mut_3, OneOver_Mut_4, OneOver_Mut_5
				 );


input clock;
input reset;
input enable;

input [`BIT_WIDTH-1:0] x_moverMux;
input [`BIT_WIDTH-1:0] y_moverMux;
input [`BIT_WIDTH-1:0] z_moverMux;
input [`BIT_WIDTH-1:0] ux_moverMux;
input [`BIT_WIDTH-1:0] uy_moverMux;
input [`BIT_WIDTH-1:0] uz_moverMux;
input [`BIT_WIDTH-1:0] sz_moverMux;
input [`BIT_WIDTH-1:0] sr_moverMux;
input [`BIT_WIDTH-1:0] sleftz_moverMux;
input [`BIT_WIDTH-1:0] sleftr_moverMux;
input [`LAYER_WIDTH-1:0] layer_moverMux;
input [`BIT_WIDTH-1:0] weight_moverMux;
input	dead_moverMux;

output [`BIT_WIDTH-1:0] x_mover;
output [`BIT_WIDTH-1:0] y_mover;
output [`BIT_WIDTH-1:0] z_mover;
output [`BIT_WIDTH-1:0] ux_mover;
output [`BIT_WIDTH-1:0] uy_mover;
output [`BIT_WIDTH-1:0] uz_mover;
output [`BIT_WIDTH-1:0] sz_mover;
output [`BIT_WIDTH-1:0] sr_mover;
output [`BIT_WIDTH-1:0] sleftz_mover;
output [`BIT_WIDTH-1:0] sleftr_mover;
output [`LAYER_WIDTH-1:0]layer_mover;
output [`BIT_WIDTH-1:0] weight_mover;
output	dead_mover;


input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_0;
input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_1;
input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_2;
input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_3;
input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_4;
input [`BIT_WIDTH-1:0] OneOver_MutMaxrad_5;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_0;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_1;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_2;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_3;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_4;
input [`BIT_WIDTH-1:0] OneOver_MutMaxdep_5;
input [`BIT_WIDTH-1:0] OneOver_Mut_0;
input [`BIT_WIDTH-1:0] OneOver_Mut_1;
input [`BIT_WIDTH-1:0] OneOver_Mut_2;
input [`BIT_WIDTH-1:0] OneOver_Mut_3;
input [`BIT_WIDTH-1:0] OneOver_Mut_4;
input [`BIT_WIDTH-1:0] OneOver_Mut_5;
input [`BIT_WIDTH-1:0] log_rand_num;

//------------Local Variables------------------------
reg [`BIT_WIDTH-1:0] c_sr;
reg [`BIT_WIDTH-1:0] c_sz;
reg [2*`BIT_WIDTH-1:0] c_sr_big;
reg [2*`BIT_WIDTH-1:0] c_sz_big;
reg [`BIT_WIDTH-1:0] c_sleftr;
reg [`BIT_WIDTH-1:0] c_sleftz;

//No signed regs, unsigned unecessary
//reg unsigned [`BIT_WIDTH-1:0] c_r_op0;
//reg unsigned [`BIT_WIDTH-1:0] c_r_op1;
//reg unsigned [`BIT_WIDTH-1:0] c_z_op0;
//reg unsigned [`BIT_WIDTH-1:0] c_z_op1;

reg [`BIT_WIDTH-1:0] c_r_op0;
reg [`BIT_WIDTH-1:0] c_r_op1;
reg [`BIT_WIDTH-1:0] c_z_op0;
reg [`BIT_WIDTH-1:0] c_z_op1;

// grab multiplexed constant
reg [`BIT_WIDTH-1:0] OneOver_MutMaxrad;
reg [`BIT_WIDTH-1:0] OneOver_MutMaxdep;
reg [`BIT_WIDTH-1:0] OneOver_Mut;

//------------REGISTERED Values------------------------
reg [`BIT_WIDTH-1:0] x_mover;
reg [`BIT_WIDTH-1:0] y_mover;
reg [`BIT_WIDTH-1:0] z_mover;
reg [`BIT_WIDTH-1:0] ux_mover;
reg [`BIT_WIDTH-1:0] uy_mover;
reg [`BIT_WIDTH-1:0] uz_mover;
reg [`BIT_WIDTH-1:0] sz_mover;
reg [`BIT_WIDTH-1:0] sr_mover;
reg [`BIT_WIDTH-1:0] sleftz_mover;
reg [`BIT_WIDTH-1:0] sleftr_mover;
reg [`LAYER_WIDTH-1:0]layer_mover;
reg [`BIT_WIDTH-1:0] weight_mover;
reg	dead_mover;


//Need this to deal with 'unused' inputs for ODIN II
wire bigOr;
assign bigOr = sr_moverMux[0] | sr_moverMux[1] | sr_moverMux[2] | sr_moverMux[3] | sr_moverMux[4] | sr_moverMux[5] | 
					sr_moverMux[6] | sr_moverMux[7] | sr_moverMux[8] | sr_moverMux[9] | sr_moverMux[10] | sr_moverMux[11] | 
					sr_moverMux[12] | sr_moverMux[13] | sr_moverMux[14] | sr_moverMux[15] | sr_moverMux[16] | sr_moverMux[17] | 
					sr_moverMux[18] | sr_moverMux[19] | sr_moverMux[20] | sr_moverMux[21] | sr_moverMux[22] | sr_moverMux[23] | 
					sr_moverMux[24] | sr_moverMux[25] | sr_moverMux[26] | sr_moverMux[27] | sr_moverMux[28] | sr_moverMux[29] | 
					sr_moverMux[30] | sr_moverMux[31] | 
					sz_moverMux[0] | sz_moverMux[1] | sz_moverMux[2] | sz_moverMux[3] | sz_moverMux[4] | sz_moverMux[5] | 
					sz_moverMux[6] | sz_moverMux[7] | sz_moverMux[8] | sz_moverMux[9] | sz_moverMux[10] | sz_moverMux[11] | 
					sz_moverMux[12] | sz_moverMux[13] | sz_moverMux[14] | sz_moverMux[15] | sz_moverMux[16] | sz_moverMux[17] | 
					sz_moverMux[18] | sz_moverMux[19] | sz_moverMux[20] | sz_moverMux[21] | sz_moverMux[22] | sz_moverMux[23] | 
					sz_moverMux[24] | sz_moverMux[25] | sz_moverMux[26] | sz_moverMux[27] | sz_moverMux[28] | sz_moverMux[29] | 
					sz_moverMux[30] | sz_moverMux[31] | 
					1'b1;
wire reset_new;
assign reset_new = reset & bigOr;

// multiplex constants
always @(layer_moverMux or OneOver_MutMaxrad_0 or OneOver_MutMaxdep_0 or OneOver_Mut_0 or
						OneOver_MutMaxrad_1 or OneOver_MutMaxdep_1 or OneOver_Mut_1 or
						OneOver_MutMaxrad_2 or OneOver_MutMaxdep_2 or OneOver_Mut_2 or
						OneOver_MutMaxrad_3 or OneOver_MutMaxdep_3 or OneOver_Mut_3 or
						OneOver_MutMaxrad_4 or OneOver_MutMaxdep_4 or OneOver_Mut_4 or
						OneOver_MutMaxrad_5 or OneOver_MutMaxdep_5 or OneOver_Mut_5)
begin
case(layer_moverMux)
	3'b000:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_0;
		OneOver_MutMaxdep = OneOver_MutMaxdep_0;
		OneOver_Mut = OneOver_Mut_0;
	end
	3'b001:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_1;
		OneOver_MutMaxdep = OneOver_MutMaxdep_1;
		OneOver_Mut = OneOver_Mut_1;
	end
	3'b010:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_2;
		OneOver_MutMaxdep = OneOver_MutMaxdep_2;
		OneOver_Mut = OneOver_Mut_2;
	end
	3'b011:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_3;
		OneOver_MutMaxdep = OneOver_MutMaxdep_3;
		OneOver_Mut = OneOver_Mut_3;
	end
	3'b100:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_4;
		OneOver_MutMaxdep = OneOver_MutMaxdep_4;
		OneOver_Mut = OneOver_Mut_4;
	end
	3'b101:
	begin
		OneOver_MutMaxrad = OneOver_MutMaxrad_5;
		OneOver_MutMaxdep = OneOver_MutMaxdep_5;
		OneOver_Mut = OneOver_Mut_5;
	end
	default:
	begin
		OneOver_MutMaxrad = 0;
		OneOver_MutMaxdep = 0;
		OneOver_Mut = 0;
	end
endcase
end

// Determine move value
always @(sleftz_moverMux or log_rand_num or OneOver_MutMaxrad or OneOver_MutMaxdep or sleftr_moverMux or
		OneOver_Mut)
begin
	// Resource sharing for multipliers
	if(sleftz_moverMux == 32'b0)
	begin
		c_r_op0 = `MAXLOG - log_rand_num;
		c_r_op1 = OneOver_MutMaxrad;
		c_z_op0 = `MAXLOG - log_rand_num;
		c_z_op1 = OneOver_MutMaxdep;
	end
	else
	begin
		c_r_op0 = sleftr_moverMux;
		c_r_op1 = OneOver_Mut;
		c_z_op0 = sleftz_moverMux;
		c_z_op1 = OneOver_Mut;
	end
end

// Determine move value
always @(sleftz_moverMux or c_r_op0 or c_r_op1 or c_z_op0 or c_z_op1 or sleftr_moverMux)
begin
	c_sr_big = c_r_op0 * c_r_op1;
	c_sz_big = c_z_op0 * c_z_op1;
	if(sleftz_moverMux == 32'b0)
	begin
		c_sr = c_sr_big[2*`BIT_WIDTH - `LOGSCALEFACTOR - 1:`BIT_WIDTH - `LOGSCALEFACTOR];
		c_sz = c_sz_big[2*`BIT_WIDTH - `LOGSCALEFACTOR - 1:`BIT_WIDTH - `LOGSCALEFACTOR];

		c_sleftr = sleftr_moverMux;
		c_sleftz = 0;

		//c_sr = `CONST_MOVE_AMOUNT;
		//c_sz = `CONST_MOVE_AMOUNT;
	end
	else
	begin
		c_sr = c_sr_big[2*`BIT_WIDTH - `MUTMAX_BITS - 1 - 1:`BIT_WIDTH - `MUTMAX_BITS - 1];
		c_sz = c_sz_big[2*`BIT_WIDTH - `MUTMAX_BITS - 1 - 1:`BIT_WIDTH - `MUTMAX_BITS - 1];

		c_sleftz = 0;
		c_sleftr = 0;
	end
end

// latch values
always @ (posedge clock)
begin
	if (reset_new)
	begin
		// Photon variables
		x_mover <= 0;
		y_mover <= 0;
		z_mover <= 0;
		ux_mover <= 0;
		uy_mover <= 0;
		uz_mover <= 0;
		sz_mover <= 0;
		sr_mover <= 0;
		sleftz_mover <= 0;
		sleftr_mover <= 0;
		layer_mover <= 0;
		weight_mover <= 0;
		dead_mover <= 1'b1;
	end
	else
	begin
		if(enable)
		begin
			// Photon variables
			x_mover <= x_moverMux;
			y_mover <= y_moverMux;
			z_mover <= z_moverMux;
			ux_mover <= ux_moverMux;
			uy_mover <= uy_moverMux;
			uz_mover <= uz_moverMux;
			layer_mover <= layer_moverMux;
			weight_mover <= weight_moverMux;
			dead_mover <= dead_moverMux;

			sz_mover <= c_sz;
			sr_mover <= c_sr;
			sleftz_mover <= c_sleftz;
			sleftr_mover <= c_sleftr;
		end
	end
end

endmodule
