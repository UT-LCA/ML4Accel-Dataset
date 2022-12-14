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

module LogCalc(clock, reset, enable, in_x, log_x);

//parameter BIT_WIDTH=32;
//parameter MANTISSA_PRECISION=10;
//parameter LOG2_BIT_WIDTH = 6;
//parameter LOG2=93032639;

input clock;
input reset;
input enable;
input [`BIT_WIDTH - 1:0] in_x;
output [`BIT_WIDTH - 1:0] log_x;


wire [`BIT_WIDTH - 1:0] mantissa;

reg [`BIT_WIDTH - 1:0] c_mantissa_val;

// deleted unsigned in these
reg [`BIT_WIDTH - 1:0] c_log_x;
reg [`LOG2_BIT_WIDTH - 1:0] c_indexFirstOne;
reg [`BIT_WIDTH - 1:0] c_temp_shift_x;
reg [`MANTISSA_PRECISION - 1:0] c_shifted_x;

reg [`LOG2_BIT_WIDTH - 1:0] r_indexFirstOne;
reg [`BIT_WIDTH - 1:0] log_x;

//Log_mantissa u1(c_shifted_x, clock, mantissa);
wire [31:0]blank;
assign blank = 32'b000000000000000000000000000000;

defparam sram_replace0.ADDR_WIDTH = `MANTISSA_PRECISION;
defparam sram_replace0.DATA_WIDTH = 32;
single_port_ram sram_replace0 (.clk (clock), .addr (c_shifted_x), .data (blank), .we (1'b0), .out (mantissa));

// priority encoder
//integer i;
//always @*
//begin
//	c_indexFirstOne = 6'b0; 
//	for(i = 0; i < `BIT_WIDTH; i = i + 1)
//	begin
//		if(in_x[i])
//			c_indexFirstOne = i;
//	end
//end

// Priority encoder, loop expanded
always @(in_x)
begin
	if (in_x[31]) begin
	c_indexFirstOne = 6'b011111;
	end
	else if (in_x[30]) begin
	c_indexFirstOne = 6'b011110;
	end
	else if (in_x[29]) begin
	c_indexFirstOne = 6'b011101;
	end
	else if (in_x[28]) begin
	c_indexFirstOne = 6'b011100;
	end
	else if (in_x[27]) begin
	c_indexFirstOne = 6'b011011;
	end
	else if (in_x[26]) begin
	c_indexFirstOne = 6'b011010;
	end
	else if (in_x[25]) begin
	c_indexFirstOne = 6'b011001;
	end
	else if (in_x[24]) begin
	c_indexFirstOne = 6'b011000;
	end
	else if (in_x[23]) begin
	c_indexFirstOne = 6'b010111;
	end
	else if (in_x[22]) begin
	c_indexFirstOne = 6'b010110;
	end
	else if (in_x[21]) begin
	c_indexFirstOne = 6'b010101;
	end
	else if (in_x[20]) begin
	c_indexFirstOne = 6'b010100;
	end
	else if (in_x[19]) begin
	c_indexFirstOne = 6'b010011;
	end
	else if (in_x[18]) begin
	c_indexFirstOne = 6'b010010;
	end
	else if (in_x[17]) begin
	c_indexFirstOne = 6'b010001;
	end
	else if (in_x[16]) begin
	c_indexFirstOne = 6'b010000;
	end
	else if (in_x[15]) begin
	c_indexFirstOne = 6'b001111;
	end
	else if (in_x[14]) begin
	c_indexFirstOne = 6'b001110;
	end
	else if (in_x[13]) begin
	c_indexFirstOne = 6'b001101;
	end
	else if (in_x[12]) begin
	c_indexFirstOne = 6'b001100;
	end
	else if (in_x[11]) begin
	c_indexFirstOne = 6'b001011;
	end
	else if (in_x[10]) begin
	c_indexFirstOne = 6'b001010;
	end
	else if (in_x[9]) begin
	c_indexFirstOne = 6'b001001;
	end
	else if (in_x[8]) begin
	c_indexFirstOne = 6'b001000;
	end
	else if (in_x[7]) begin
	c_indexFirstOne = 6'b000111;
	end
	else if (in_x[6]) begin
	c_indexFirstOne = 6'b000110;
	end
	else if (in_x[5]) begin
	c_indexFirstOne = 6'b000101;
	end
	else if (in_x[4]) begin
	c_indexFirstOne = 6'b000100;
	end
	else if (in_x[3]) begin
	c_indexFirstOne = 6'b000011;
	end
	else if (in_x[2]) begin
	c_indexFirstOne = 6'b000010;
	end
	else if (in_x[1]) begin
	c_indexFirstOne = 6'b000001;
	end
	else if (in_x[0]) begin
	c_indexFirstOne = 6'b000000;
	end
	else begin
	c_indexFirstOne = 6'b000000;
	end
end
	
// shift operation based on priority encoder results

//Need constant shift
wire [5:0]shifted;
assign shifted = c_indexFirstOne - `MANTISSA_PRECISION + 1;

always@(c_indexFirstOne or in_x or shifted)
begin
//	c_temp_shift_x = in_x >> (c_indexFirstOne - `MANTISSA_PRECISION + 1);
	if(c_indexFirstOne >= `MANTISSA_PRECISION)
	begin
		if(shifted == 22) begin
			c_temp_shift_x = in_x >> 22;
		end
		else if(shifted == 21) begin
			c_temp_shift_x = in_x >> 21;
		end
		else if(shifted == 20) begin
			c_temp_shift_x = in_x >> 20;
		end
		else if(shifted == 19) begin
			c_temp_shift_x = in_x >> 19;
		end
		else if(shifted == 18) begin
			c_temp_shift_x = in_x >> 18;
		end
		else if(shifted == 17) begin
			c_temp_shift_x = in_x >> 17;
		end
		else if(shifted == 16) begin
			c_temp_shift_x = in_x >> 16;
		end
		else if(shifted == 15) begin
			c_temp_shift_x = in_x >> 15;
		end
		else if(shifted == 14) begin
			c_temp_shift_x = in_x >> 14;
		end
		else if(shifted == 13) begin
			c_temp_shift_x = in_x >> 13;
		end
		else if(shifted == 12) begin
			c_temp_shift_x = in_x >> 12;
		end
		else if(shifted == 11) begin
			c_temp_shift_x = in_x >> 11;
		end
		else if(shifted == 10) begin
			c_temp_shift_x = in_x >> 10;
		end
		else if(shifted == 9) begin
			c_temp_shift_x = in_x >> 9;
		end
		else if(shifted == 8) begin
			c_temp_shift_x = in_x >> 8;
		end
		else if(shifted == 7) begin
			c_temp_shift_x = in_x >> 7;
		end
		else if(shifted == 6) begin
			c_temp_shift_x = in_x >> 6;
		end
		else if(shifted == 5) begin
			c_temp_shift_x = in_x >> 5;
		end
		else if(shifted == 4) begin
			c_temp_shift_x = in_x >> 4;
		end
		else if(shifted == 3) begin
			c_temp_shift_x = in_x >> 3;
		end
		else if(shifted == 2) begin
			c_temp_shift_x = in_x >> 2;
		end
		else if(shifted == 1) begin
			c_temp_shift_x = in_x >> 1;
		end
		else begin
			c_temp_shift_x = in_x >> 0;
		end
		//Store needed bits of shifted value
		c_shifted_x = c_temp_shift_x[`MANTISSA_PRECISION - 1:0];
	end
	else begin
		c_shifted_x = in_x[`MANTISSA_PRECISION - 1:0];
		c_temp_shift_x = 32'b0;
	end
end

// calculate log
always@(r_indexFirstOne or mantissa)
begin
	if(r_indexFirstOne >= `MANTISSA_PRECISION)
	begin
		c_log_x =  mantissa - ((`MANTISSA_PRECISION - 1) * `LOG2) + (r_indexFirstOne * `LOG2);
	end
	else
	begin
		c_log_x = mantissa;
	end
end

// latch values
always @(posedge clock)
begin
	if(reset)
		begin
			log_x <= 0;
			r_indexFirstOne <= 0;
		end
	else
		begin
			if(enable)
			begin
				r_indexFirstOne <= c_indexFirstOne;
				log_x <= c_log_x;
			end
		end
end 

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



