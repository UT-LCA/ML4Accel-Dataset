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

module rng(clk, en, resetn,loadseed_i,seed_i,number_o);
input clk;
input resetn;
input en; 
input loadseed_i;
input [31:0] seed_i;
output [31:0] number_o;

wire [31:0] number_o;

reg [31:0] c_b1, c_b2, c_b3;
reg [31:0] c_s1, c_s2, c_s3;

reg [31:0] r_s1, r_s2, r_s3;

assign number_o = r_s1 ^ r_s2 ^ r_s3;

always @(loadseed_i or seed_i or r_s1 or r_s2 or r_s3)
begin
	if(loadseed_i)
	begin
		c_b1 = 32'b0;
		c_s1 = seed_i;
		c_b2 = 32'b0;
		c_s2 = {seed_i[5:0], seed_i[17], seed_i[18], seed_i[19], seed_i[20], seed_i[25:21], seed_i[31:26], seed_i[16:6]} ^ 32'd1493609598;
		c_b3 = 32'b0;
		c_s3 = {seed_i[23:16], seed_i[5], seed_i[6], seed_i[7], seed_i[15:8], seed_i[4:0], seed_i[31:24]} ^ 32'd3447127471;
	end
	else
	begin
		c_b1 = (((r_s1 << 13) ^ r_s1) >> 19);
		c_s1 = (((r_s1 & 32'd4294967294) << 12) ^ c_b1);
		c_b2 = (((r_s2 << 2) ^ r_s2) >> 25);
		c_s2 = (((r_s2 & 32'd4294967288) << 4) ^ c_b2);
		c_b3 = (((r_s3 << 3) ^ r_s3) >> 11);
		c_s3 = (((r_s3 & 32'd4294967280) << 17) ^ c_b3);
	end
end


//combinate:
always @(posedge clk or negedge resetn)
   begin
   if (!resetn )
      begin
      r_s1 <= 32'b0;
	  r_s2 <= 32'b0;
	  r_s3 <= 32'b0;
      end
   else if (en)   //Originally else only
      begin
		  r_s1 <= c_s1;
		  r_s2 <= c_s2;
		  r_s3 <= c_s3;
	  end
   end

endmodule
