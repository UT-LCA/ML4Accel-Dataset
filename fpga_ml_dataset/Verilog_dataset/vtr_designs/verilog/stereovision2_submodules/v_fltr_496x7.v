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

module v_fltr_496x7 (tm3_clk_v0, vidin_new_data, vidin_in, vidin_out_f1, vidin_out_f2, vidin_out_f3, vidin_out_h1, vidin_out_h2, vidin_out_h3, vidin_out_h4); // PAJ var never used, vidin_out_or);

   parameter horiz_length  = 9'b111110000;
   parameter vert_length  = 3'b111; // PAJ constant for all

   input tm3_clk_v0; 
   input vidin_new_data; 
   input[7:0] vidin_in; 
   output[15:0] vidin_out_f1; 
   wire[15:0] vidin_out_f1;
   output[15:0] vidin_out_f2; 
   wire[15:0] vidin_out_f2;
   output[15:0] vidin_out_f3; 
   wire[15:0] vidin_out_f3;
   output[15:0] vidin_out_h1; 
   wire[15:0] vidin_out_h1;
   output[15:0] vidin_out_h2; 
   wire[15:0] vidin_out_h2;
   output[15:0] vidin_out_h3; 
   wire[15:0] vidin_out_h3;
   output[15:0] vidin_out_h4; 
   wire[15:0] vidin_out_h4;
//   output[7:0] vidin_out_or; 
//   reg[7:0] vidin_out_or;

   wire[7:0] buff_out0; 
   wire[7:0] buff_out1; 
   wire[7:0] buff_out2; 
   wire[7:0] buff_out3; 
   wire[7:0] buff_out4; 
   wire[7:0] buff_out5; 
   wire[7:0] buff_out6; 
   wire[7:0] buff_out7; 

 	fifo496 fifo0(tm3_clk_v0, vidin_new_data, buff_out0, buff_out1);
 	fifo496 fifo1(tm3_clk_v0, vidin_new_data, buff_out1, buff_out2);
 	fifo496 fifo2(tm3_clk_v0, vidin_new_data, buff_out2, buff_out3);
 	fifo496 fifo3(tm3_clk_v0, vidin_new_data, buff_out3, buff_out4);
 	fifo496 fifo4(tm3_clk_v0, vidin_new_data, buff_out4, buff_out5);
 	fifo496 fifo5(tm3_clk_v0, vidin_new_data, buff_out5, buff_out6);
 	fifo496 fifo6(tm3_clk_v0, vidin_new_data, buff_out6, buff_out7);

   fltr_compute_f1 inst_fltr_compute_f1 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_f1);	
   fltr_compute_f2 inst_fltr_compute_f2 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_f2);	
   fltr_compute_f3 inst_fltr_compute_f3 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_f3);	
   fltr_compute_h1 inst_fltr_compute_h1 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_h1);	
   fltr_compute_h2 inst_fltr_compute_h2 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_h2);	
   fltr_compute_h3 inst_fltr_compute_h3 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_h3);	
   fltr_compute_h4 inst_fltr_compute_h4 (tm3_clk_v0, {buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}, vidin_out_h4);	

         assign buff_out0 = vidin_in ; 
/*
   always @(posedge tm3_clk_v0)
   begin
         buff_out0 <= vidin_in ; 
         //vidin_out_or <= buff_out6; 
   end 
*/
endmodule
module fifo496 (clk, wen, din, dout);

//	parameter WIDTH = 4'b1000;

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

module fltr_compute_f1 (clk, din, dout);

    input clk; 
    input[55:0] din; 
    output[15:0] dout; 
    reg[15:0] dout;
    reg[16:0] q1; 
    reg[16:0] q2; 
    reg[16:0] q3; 
    reg[16:0] q4; 
    reg[16:0] q5; 
    reg[16:0] q6; 
    reg[16:0] q7; 
    reg[19:0] d_out_tmp; 

    always @(posedge clk)
    begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 5'b11101;
			q2 <= din[47:40] * 7'b1100101;
			q3 <= din[39:32] * 5'b10001;
			q4 <= din[31:24] * 9'b100010101;
			q5 <= din[23:16] * 5'b10001;
			q6 <= din[15:8] * 7'b1100101;
			q7 <= din[7:0] * 5'b11101;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
          dout <= d_out_tmp[18:3] ; 
    end 
 endmodule

module fltr_compute_f2 (clk, din, dout);

    input clk; 
    input[55:0] din; 
    output[15:0] dout; 
    reg[15:0] dout;
    reg[16:0] q1; 
    reg[16:0] q2; 
    reg[16:0] q3; 
    reg[16:0] q4; 
    reg[16:0] q5; 
    reg[16:0] q6; 
    reg[16:0] q7; 
    reg[19:0] d_out_tmp; 

    always @(posedge clk)
    begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 3'b100;
			q2 <= din[47:40] * 6'b101010;
			q3 <= din[39:32] * 8'b10100011;
			q4 <= din[31:24] * 8'b11111111;
			q5 <= din[23:16] * 8'b10100011;
			q6 <= din[15:8] * 6'b101010;
			q7 <= din[7:0] * 3'b100;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
          dout <= d_out_tmp[18:3] ; 
    end 
 endmodule

module fltr_compute_f3 (clk, din, dout);

    input clk; 
    input[55:0] din; 
    output[15:0] dout; 
    reg[15:0] dout;
    reg[16:0] q1; 
    reg[16:0] q2; 
    reg[16:0] q3; 
    reg[16:0] q4; 
    reg[16:0] q5; 
    reg[16:0] q6; 
    reg[16:0] q7; 
    reg[19:0] d_out_tmp; 

    always @(posedge clk)
    begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 5'b10100;
			q2 <= din[47:40] * 8'b10110011;
			q3 <= din[39:32] * 9'b101101100;
			q4 <= din[31:24] * 16'b0000000000000000;
			q5 <= din[23:16] * 9'b101101100;
			q6 <= din[15:8] * 8'b10110011;
			q7 <= din[7:0] * 5'b10100;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
          dout <= d_out_tmp[18:3] ; 
    end 

 endmodule

module fltr_compute_h1 (clk, din, dout);

    input clk; 
    input[55:0] din; 
    output[15:0] dout; 
    reg[15:0] dout;
    reg[16:0] q1; 
    reg[16:0] q2; 
    reg[16:0] q3; 
    reg[16:0] q4; 
    reg[16:0] q5; 
    reg[16:0] q6; 
    reg[16:0] q7; 
    reg[19:0] d_out_tmp; 

    always @(posedge clk)
    begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 5'b10001;
			q2 <= din[47:40] * 5'b11001;
			q3 <= din[39:32] * 8'b11000001;
			q4 <= din[31:24] * 16'b0000000000000000;
			q5 <= din[23:16] * 8'b11000001;
			q6 <= din[15:8] * 5'b11001;
			q7 <= din[7:0] * 5'b10001;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
          dout <= d_out_tmp[18:3] ; 
    end 
 endmodule

module fltr_compute_h2 (clk, din, dout);

   input clk; 
   input[55:0] din; 
   output[15:0] dout; 
   reg[15:0] dout;

   reg[16:0] q1; 
   reg[16:0] q2; 
   reg[16:0] q3; 
   reg[16:0] q4; 
   reg[16:0] q5; 
   reg[16:0] q6; 
   reg[16:0] q7; 
   reg[19:0] d_out_tmp; 

   always @(posedge clk)
   begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 3'b100;
			q2 <= din[47:40] * 6'b101010;
			q3 <= din[39:32] * 8'b10100011;
			q4 <= din[31:24] * 8'b11111111;
			q5 <= din[23:16] * 8'b10100011;
			q6 <= din[15:8] * 6'b101010;
			q7 <= din[7:0] * 3'b100;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
         dout <= d_out_tmp[18:3] ; 
   end 
endmodule

module fltr_compute_h3 (clk, din, dout);

   input clk; 
   input[55:0] din; 
   output[15:0] dout; 
   reg[15:0] dout;

   reg[16:0] q1; 
   reg[16:0] q2; 
   reg[16:0] q3; 
   reg[16:0] q4; 
   reg[16:0] q5; 
   reg[16:0] q6; 
   reg[16:0] q7; 
   reg[19:0] d_out_tmp; 

   always @(posedge clk)
   begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 5'b10111;
			q2 <= din[47:40] * 7'b1001000;
			q3 <= din[39:32] * 8'b10010011;
			q4 <= din[31:24] * 16'b0000000000000000;
			q5 <= din[23:16] * 8'b10010011;
			q6 <= din[15:8] * 7'b1001000;
			q7 <= din[7:0] * 5'b10111;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
         dout <= d_out_tmp[18:3] ; 
   end 
endmodule

module fltr_compute_h4 (clk, din, dout);

   input clk; 
   input[55:0] din; 
   output[15:0] dout; 
   reg[15:0] dout;

   reg[16:0] q1; 
   reg[16:0] q2; 
   reg[16:0] q3; 
   reg[16:0] q4; 
   reg[16:0] q5; 
   reg[16:0] q6; 
   reg[16:0] q7; 
   reg[19:0] d_out_tmp; 

   always @(posedge clk)
   begin
			// PAJ - grabbed these from the mult_const declarations
			q1 <= din[55:48] * 4'b1110;
			q2 <= din[47:40] * 6'b101011;
			q3 <= din[39:32] * 7'b1010000;
			q4 <= din[31:24] * 9'b101000100;
			q5 <= din[23:16] * 7'b1010000;
			q6 <= din[15:8] * 6'b101011;
			q7 <= din[7:0] * 4'b1110;

          d_out_tmp <= ({q1[16], q1[16], q1[16], q1}) + ({q2[16], q2[16], q2[16], q2}) + ({q3[16], q3[16], q3[16], q3}) + ({q4[16], q4[16], q4[16], q4}) + ({q5[16], q5[16], q5[16], q5}) + ({q6[16], q6[16], q6[16], q6}) + ({q7[16], q7[16], q7[16], q7});
         dout <= d_out_tmp[18:3] ; 
   end 
endmodule





















