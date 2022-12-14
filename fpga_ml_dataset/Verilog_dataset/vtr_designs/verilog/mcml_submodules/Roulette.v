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

module Roulette ( //INPUTS
                     clock, reset, enable, 
                     x_RouletteMux, y_RouletteMux, z_RouletteMux,  
                     ux_RouletteMux, uy_RouletteMux, uz_RouletteMux, 
                     sz_RouletteMux, sr_RouletteMux, 
                     sleftz_RouletteMux, sleftr_RouletteMux, 
                     layer_RouletteMux, weight_absorber, dead_RouletteMux, 
			
		     //From Random Number Generator in Skeleton.v	
		     randnumber,
                     
                     //OUTPUTS
                     x_Roulette, y_Roulette, z_Roulette,
                     ux_Roulette, uy_Roulette, uz_Roulette, 
                     sz_Roulette, sr_Roulette, 
                     sleftz_Roulette, sleftr_Roulette, 
                     layer_Roulette, weight_Roulette, dead_Roulette
                     ); 

//parameter BIT_WIDTH=32;
//parameter LAYER_WIDTH=3; 

//parameter LEFTSHIFT=3;         // 2^3=8=1/0.125 where 0.125 = CHANCE of roulette
//parameter INTCHANCE=536870912; //Based on 32 bit rand num generator
//parameter MIN_WEIGHT=200; 

input clock;        
input reset;
input enable;

input [`BIT_WIDTH-1:0] x_RouletteMux;
input [`BIT_WIDTH-1:0] y_RouletteMux;
input [`BIT_WIDTH-1:0] z_RouletteMux;
input [`BIT_WIDTH-1:0] ux_RouletteMux;
input [`BIT_WIDTH-1:0] uy_RouletteMux;
input [`BIT_WIDTH-1:0] uz_RouletteMux;
input [`BIT_WIDTH-1:0] sz_RouletteMux;
input [`BIT_WIDTH-1:0] sr_RouletteMux;
input [`BIT_WIDTH-1:0] sleftz_RouletteMux;
input [`BIT_WIDTH-1:0] sleftr_RouletteMux;
input [`LAYER_WIDTH-1:0] layer_RouletteMux;
input [`BIT_WIDTH-1:0] weight_absorber;
input [`BIT_WIDTH-1:0] randnumber;
input dead_RouletteMux;
              
output [`BIT_WIDTH-1:0] x_Roulette;
output [`BIT_WIDTH-1:0] y_Roulette;
output [`BIT_WIDTH-1:0] z_Roulette;
output [`BIT_WIDTH-1:0] ux_Roulette;
output [`BIT_WIDTH-1:0] uy_Roulette;
output [`BIT_WIDTH-1:0] uz_Roulette;
output [`BIT_WIDTH-1:0] sz_Roulette;
output [`BIT_WIDTH-1:0] sr_Roulette;
output [`BIT_WIDTH-1:0] sleftz_Roulette;
output [`BIT_WIDTH-1:0] sleftr_Roulette;
output [`LAYER_WIDTH-1:0]layer_Roulette;
output [`BIT_WIDTH-1:0] weight_Roulette;
output dead_Roulette;

//------------Local Variables------------------------
reg dead_roulette; 
reg [`BIT_WIDTH-1:0] weight_roulette; 
reg [31:0] randBits;             //Hard-coded bitwidth because rng is 32-bit

//------------REGISTERED Values------------------------
reg [`BIT_WIDTH-1:0] x_Roulette;
reg [`BIT_WIDTH-1:0] y_Roulette;
reg [`BIT_WIDTH-1:0] z_Roulette;
reg [`BIT_WIDTH-1:0] ux_Roulette;
reg [`BIT_WIDTH-1:0] uy_Roulette;
reg [`BIT_WIDTH-1:0] uz_Roulette;
reg [`BIT_WIDTH-1:0] sz_Roulette;
reg [`BIT_WIDTH-1:0] sr_Roulette;
reg [`BIT_WIDTH-1:0] sleftz_Roulette;
reg [`BIT_WIDTH-1:0] sleftr_Roulette;
reg [`LAYER_WIDTH-1:0]layer_Roulette;
reg [`BIT_WIDTH-1:0] weight_Roulette;
reg dead_Roulette;
   
always @ (reset or enable or weight_absorber or randBits or randnumber or dead_RouletteMux) begin 
  	//Default case moved inside else statements for odin
	//randBits = randnumber;   //Reading from external random num generator
	//weight_roulette=weight_absorber;	//Avoid inferring a latch
	//dead_roulette=dead_RouletteMux; 
	
	if (reset) begin 
		//Local variables
		weight_roulette=0; 
		dead_roulette=0; 
		randBits=0; 
	end

	else if (enable) begin
		//Set default case
		randBits = randnumber;
		//DO ROULETTE!!!
		if (weight_absorber < `MIN_WEIGHT && !dead_RouletteMux) begin
			//Replicate Operator (same as 32'b000000..., except more flexible)			
			if (weight_absorber== {`BIT_WIDTH{1'b0}}) begin
				dead_roulette = 1;
				weight_roulette = weight_absorber;
			end
				
			else if (randBits < `INTCHANCE) begin // survived the roulette
				dead_roulette=0;
				weight_roulette=weight_absorber << `LEFTSHIFT; //To avoid mult
			end
			
			else begin
				dead_roulette=1;
				weight_roulette = weight_absorber;
			end
		end
		
		//No Roulette
		else  begin
			weight_roulette = weight_absorber;
			dead_roulette = 0;
		end
	end
	
	else //for insurance that this is default case
	begin
		randBits = randnumber;
		weight_roulette = weight_absorber;
		dead_roulette = dead_RouletteMux;
	end
end 

always @ (posedge clock) begin
	if (reset) begin
		x_Roulette <= 0;
		y_Roulette <= 0;
		z_Roulette <= 0;
		ux_Roulette <= 0;
		uy_Roulette <= 0;
		uz_Roulette <= 0;
		sz_Roulette <= 0;
		sr_Roulette <= 0;
		sleftz_Roulette <= 0;
		sleftr_Roulette <= 0;
		layer_Roulette <= 0;
		weight_Roulette <= 0;
		dead_Roulette <= 1'b1;
	end
	
	else if (enable) begin
		//Write through values from Roulette block
		dead_Roulette <= (dead_RouletteMux | dead_roulette);   //OR operator ???
		weight_Roulette <= weight_roulette; //weight_absorber.read();

		//Write through unchanged values
		x_Roulette <= x_RouletteMux;
		y_Roulette <= y_RouletteMux;
		z_Roulette <= z_RouletteMux;

		ux_Roulette <= ux_RouletteMux;
		uy_Roulette <= uy_RouletteMux;
		uz_Roulette <= uz_RouletteMux;
		sz_Roulette <= sz_RouletteMux;
		sr_Roulette <= sr_RouletteMux;
		sleftz_Roulette <= sleftz_RouletteMux;
		sleftr_Roulette <= sleftr_RouletteMux;
		layer_Roulette <= layer_RouletteMux;
	end
end

endmodule
