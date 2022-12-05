	`define WIDTH_4B 4'b1000
`define COEF0_b  29
	`define COEF1_b  101
//	`define COEF2_b  -15
//	`define COEF3_b  -235
//	`define COEF4_b  -15
	`define COEF2_b  15
	`define COEF3_b  235
	`define COEF4_b  15
	`define COEF5_b  101
	`define COEF6_b  29
	`define WIDTH_5B 5'b10000
	`define COEF0_c  4
	`define COEF1_c  42
	`define COEF2_c  163
	`define COEF3_c  255
	`define COEF4_c  163
	`define COEF5_c  42
	`define COEF6_c  4
//	`define COEF0_d  -12
//	`define COEF1_d  -77
//	`define COEF2_d  -148
	`define COEF0_d  12
	`define COEF1_d  77
	`define COEF2_d  148
	`define COEF3_d  0
	`define COEF4_d  148
	`define COEF5_d  77
	`define COEF6_d  12
	`define COEF0_1  15
//`define COEF0_1  -15
	`define COEF1_1  25
	`define COEF2_1  193
	`define COEF3_1  0
//	`define COEF4_1  -193
//	`define COEF5_1  -25
	`define COEF4_1  193
	`define COEF5_1  25
	`define COEF6_1  15
	`define COEF0_2  4
	`define COEF1_2  42
	`define COEF2_2  163
	`define COEF3_2  255
	`define COEF4_2  163
	`define COEF5_2  42
	`define COEF6_2  4
//	`define COEF0_3  -9
//	`define COEF1_3  -56
//	`define COEF2_3  -109
	`define COEF0_3  9
	`define COEF1_3  56
	`define COEF2_3  109
	`define COEF3_3  0
	`define COEF4_3  109
	`define COEF5_3  56
	`define COEF6_3  9
//	`define COEF0_4  -9
//	`define COEF1_4  -56
//	`define COEF2_4  -109
	`define COEF0_4  9
	`define COEF1_4  56
	`define COEF2_4  109
	`define COEF3_4  0
	`define COEF4_4  109
	`define COEF5_4  56
	`define COEF6_4  9

module fifo226 (clk, wen, din, dout);

//	parameter `WIDTH = 4'b1000;

    input clk; 
    input wen; 
    input[`WIDTH_4B - 1:0] din; 
    output[`WIDTH_4B - 1:0] dout; 
    reg[`WIDTH_4B - 1:0] dout;

    reg[`WIDTH_4B-1:0]buff1; 
    reg[`WIDTH_4B-1:0]buff2; 

    always @(posedge clk)
    begin
		if (wen == 1'b1)
		begin
			buff1 <= din;
			buff2 <= buff1;
			dout <= buff2;
		end
	end
endmodule
