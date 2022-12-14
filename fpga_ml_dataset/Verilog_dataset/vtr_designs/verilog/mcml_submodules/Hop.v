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

module Hop(     //INPUTS
				 clock, reset, enable,
				 x_boundaryChecker, y_boundaryChecker, z_boundaryChecker,
				 ux_boundaryChecker, uy_boundaryChecker, uz_boundaryChecker,
				 sz_boundaryChecker, sr_boundaryChecker,
				 sleftz_boundaryChecker, sleftr_boundaryChecker,
				 layer_boundaryChecker, weight_boundaryChecker, dead_boundaryChecker,
				 hit_boundaryChecker,

				 //OUTPUTS
				 x_hop, y_hop, z_hop,
				 ux_hop, uy_hop, uz_hop,
				 sz_hop, sr_hop,
				 sleftz_hop, sleftr_hop,
				 layer_hop, weight_hop, dead_hop, hit_hop
				 );

//parameter BIT_WIDTH=32;
//parameter LAYER_WIDTH=3;
//parameter INTMAX=2147483647;
//parameter INTMIN=-2147483648;

input clock;
input reset;
input enable;

input [`BIT_WIDTH-1:0] x_boundaryChecker;
input [`BIT_WIDTH-1:0] y_boundaryChecker;
input [`BIT_WIDTH-1:0] z_boundaryChecker;
input [`BIT_WIDTH-1:0] ux_boundaryChecker;
input [`BIT_WIDTH-1:0] uy_boundaryChecker;
input [`BIT_WIDTH-1:0] uz_boundaryChecker;
input [`BIT_WIDTH-1:0] sz_boundaryChecker;
input [`BIT_WIDTH-1:0] sr_boundaryChecker;
input [`BIT_WIDTH-1:0] sleftz_boundaryChecker;
input [`BIT_WIDTH-1:0] sleftr_boundaryChecker;
input [`LAYER_WIDTH-1:0] layer_boundaryChecker;
input [`BIT_WIDTH-1:0] weight_boundaryChecker;
input	dead_boundaryChecker;
input	hit_boundaryChecker;

output [`BIT_WIDTH-1:0] x_hop;
output [`BIT_WIDTH-1:0] y_hop;
output [`BIT_WIDTH-1:0] z_hop;
output [`BIT_WIDTH-1:0] ux_hop;
output [`BIT_WIDTH-1:0] uy_hop;
output [`BIT_WIDTH-1:0] uz_hop;
output [`BIT_WIDTH-1:0] sz_hop;
output [`BIT_WIDTH-1:0] sr_hop;
output [`BIT_WIDTH-1:0] sleftz_hop;
output [`BIT_WIDTH-1:0] sleftr_hop;
output [`LAYER_WIDTH-1:0]layer_hop;
output [`BIT_WIDTH-1:0] weight_hop;
output dead_hop;
output hit_hop;

//------------Local Variables------------------------
reg [`BIT_WIDTH-1:0] c_x;
reg [`BIT_WIDTH-1:0] c_y;
reg [`BIT_WIDTH-1:0] c_z;
reg c_dead;

reg [`BIT_WIDTH:0] c_x_big;
reg [`BIT_WIDTH:0] c_y_big;
reg [`BIT_WIDTH:0] c_z_big;

wire [2*`BIT_WIDTH-1:0] c_xmult_big;
wire [2*`BIT_WIDTH-1:0] c_ymult_big;
wire [2*`BIT_WIDTH-1:0] c_zmult_big;

//------------REGISTERED Values------------------------
reg [`BIT_WIDTH-1:0] x_hop;
reg [`BIT_WIDTH-1:0] y_hop;
reg [`BIT_WIDTH-1:0] z_hop;
reg [`BIT_WIDTH-1:0] ux_hop;
reg [`BIT_WIDTH-1:0] uy_hop;
reg [`BIT_WIDTH-1:0] uz_hop;
reg [`BIT_WIDTH-1:0] sz_hop;
reg [`BIT_WIDTH-1:0] sr_hop;
reg [`BIT_WIDTH-1:0] sleftz_hop;
reg [`BIT_WIDTH-1:0] sleftr_hop;
reg [`LAYER_WIDTH-1:0]layer_hop;
reg [`BIT_WIDTH-1:0] weight_hop;
reg	dead_hop;
reg	hit_hop;

mult_signed_32 u1(sr_boundaryChecker, ux_boundaryChecker, c_xmult_big);
mult_signed_32 u2(sr_boundaryChecker, uy_boundaryChecker, c_ymult_big);
mult_signed_32 u3(sz_boundaryChecker, uz_boundaryChecker, c_zmult_big);

// Determine new (x,y,z) coordinates
always @(c_dead or 
		c_x_big or c_y_big or c_z_big or 
		c_x or c_y or c_z or
		x_boundaryChecker or y_boundaryChecker or z_boundaryChecker or
		c_xmult_big or c_ymult_big or c_zmult_big 
		or hit_boundaryChecker or dead_boundaryChecker)
begin
		
	c_x_big = x_boundaryChecker + c_xmult_big[2*`BIT_WIDTH-2:31];
	c_y_big = y_boundaryChecker + c_ymult_big[2*`BIT_WIDTH-2:31];
	c_z_big = z_boundaryChecker + c_zmult_big[2*`BIT_WIDTH-2:31];


	// Calculate x position, photon dies if outside grid
	if(c_x_big[`BIT_WIDTH] != c_x_big[`BIT_WIDTH-1] && x_boundaryChecker[`BIT_WIDTH-1] == c_xmult_big[2*`BIT_WIDTH-2])
	begin
		if(c_x_big[`BIT_WIDTH] == 1'b0)
		begin
		//	c_dead = 1'b1;
			c_x = `INTMAX;
		end
		else
		begin
		//	c_dead = 1'b1;
			c_x = `INTMIN;
		end
	end 
	else
	begin
		c_x = c_x_big[`BIT_WIDTH-1:0];
	end

	
	// Calculate y position, photon dies if outside grid
	if(c_y_big[`BIT_WIDTH] != c_y_big[`BIT_WIDTH-1] && y_boundaryChecker[`BIT_WIDTH-1] == c_ymult_big[2*`BIT_WIDTH-2])
	begin
		if(c_y_big[`BIT_WIDTH] == 1'b0)
		begin
		//	c_dead = 1'b1;
			c_y = `INTMAX;
		end
		else
		begin
		//	c_dead = 1'b1;
			c_y = `INTMIN;
		end
	end
	else
	begin
		c_y = c_y_big[`BIT_WIDTH-1:0];
	end
	
	// Calculate z position, photon dies if outside grid
	if(hit_boundaryChecker) 
	begin
		c_z = z_boundaryChecker;
	end
	else if(c_z_big[`BIT_WIDTH] != c_z_big[`BIT_WIDTH-1] && z_boundaryChecker[`BIT_WIDTH-1] == c_zmult_big[2*`BIT_WIDTH-2])
	begin
	//	c_dead = 1'b1;
		c_z = `INTMAX;
	end
	else if (c_z_big[`BIT_WIDTH-1] == 1'b1)
	begin
	//	c_dead = 1'b1;
		c_z = 0;
	end 
	else
	begin
		c_z = c_z_big[`BIT_WIDTH-1:0];
	end
	
	// Calculate c_dead (necessary because odin does not support block statements).
	if( (c_x_big[`BIT_WIDTH] != c_x_big[`BIT_WIDTH-1] && x_boundaryChecker[`BIT_WIDTH-1] == c_xmult_big[2*`BIT_WIDTH-2])
	   |(c_y_big[`BIT_WIDTH] != c_y_big[`BIT_WIDTH-1] && y_boundaryChecker[`BIT_WIDTH-1] == c_ymult_big[2*`BIT_WIDTH-2])
	   |(c_z_big[`BIT_WIDTH] != c_z_big[`BIT_WIDTH-1] && z_boundaryChecker[`BIT_WIDTH-1] == c_zmult_big[2*`BIT_WIDTH-2]) )
	begin
		c_dead = 1'b1;
	end
	else
	begin
		c_dead = dead_boundaryChecker;
	end

end

// latch values
always @ (posedge clock)
begin
	if (reset)
	begin
		// Photon variables
		x_hop <= 0;
		y_hop <= 0;
		z_hop <= 0;
		ux_hop <= 0;
		uy_hop <= 0;
		uz_hop <= 0;
		sz_hop <= 0;
		sr_hop <= 0;
		sleftz_hop <= 0;
		sleftr_hop <= 0;
		layer_hop <= 0;
		weight_hop <= 0;
		dead_hop <= 1'b1;
		hit_hop <= 1'b0;
	end
	else
	begin
		if(enable)
		begin
			// Photon variables
			ux_hop <= ux_boundaryChecker;
			uy_hop <= uy_boundaryChecker;
			uz_hop <= uz_boundaryChecker;
			sz_hop <= sz_boundaryChecker;
			sr_hop <= sr_boundaryChecker;
			sleftz_hop <= sleftz_boundaryChecker;
			sleftr_hop <= sleftr_boundaryChecker;
			layer_hop <= layer_boundaryChecker;
			weight_hop <= weight_boundaryChecker;
			hit_hop <= hit_boundaryChecker;

			x_hop <= c_x;
			y_hop <= c_y;
			z_hop <= c_z;
			dead_hop <= c_dead;
		end			
	end
end

endmodule
module mult_signed_32(a, b, c);
	input [31:0]a;
	input [31:0]b;
	output [63:0]c;
	reg [63:0]c;
	
	reg is_neg_a;
	reg is_neg_b;
	reg [31:0]a_tmp;
	reg [31:0]b_tmp;
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

	if( is_neg_a != is_neg_b) begin
		c_tmp = -(a_tmp * b_tmp);
	end else
	begin
		c_tmp = (a_tmp * b_tmp);
	end
end

always@(c_tmp)
begin
	c = c_tmp;
end

endmodule
