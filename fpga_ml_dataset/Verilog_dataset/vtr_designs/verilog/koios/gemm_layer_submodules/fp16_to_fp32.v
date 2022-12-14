`define BFLOAT16 
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define AWIDTH 8
`define MEM_SIZE 256
`define MAT_MUL_SIZE 20
`define MASK_WIDTH 20
`define LOG2_MAT_MUL_SIZE 4 
`define BB_MAT_MUL_SIZE `MAT_MUL_SIZE
`define NUM_CYCLES_IN_MAC 3
`define MEM_ACCESS_LATENCY 1
`define ADDR_STRIDE_WIDTH 8

module fp16_to_fp32 (input [15:0] a , output [31:0] b);

reg [31:0]b_temp;
reg [3:0] j;
reg [3:0] k;
reg [3:0] k_temp;
always @ (*) begin

if ( a [14: 0] == 15'b0 ) begin //signed zero
	b_temp [31] = a[15]; //sign bit
	b_temp[30:0] = 31'b0;
end

else begin

	if ( a[14 : 10] == 5'b0 ) begin //denormalized (covert to normalized)
		
		for (j=0; j<=9; j=j+1) begin
			if (a[j] == 1'b1) begin 
			    k_temp = j;	
			end
		end
	k = 9 - k_temp;

	b_temp [22:0] = ( (a [9:0] << (k+1'b1)) & 10'h3FF ) << 13;
	b_temp [30:23] =  7'd127 - 4'd15 - k;
	b_temp [31] = a[15];
	end

	else if ( a[14 : 10] == 5'b11111 ) begin //Infinity/ NAN
	b_temp [22:0] = a [9:0] << 13;
	b_temp [30:23] = 8'hFF;
	b_temp [31] = a[15];
	end

	else begin //Normalized Number
	b_temp [22:0] = a [9:0] << 13;
	b_temp [30:23] =  7'd127 - 4'd15 + a[14:10];
	b_temp [31] = a[15];
	end
end
end

assign b = b_temp;


endmodule
