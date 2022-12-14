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

module steer_fltr (clk, new_data, f1, f2, f3, h1, h2, h3, h4, re_z, im_z, re_p, im_p, re_n, im_n);

   input clk; 
   input new_data; 
   input[27:0] f1; 
   input[27:0] f2; 
   input[27:0] f3; 
   input[27:0] h1; 
   input[27:0] h2; 
   input[27:0] h3; 
   input[27:0] h4; 
   output[15:0] re_z; 
   reg[15:0] re_z;
   output[15:0] im_z; 
   reg[15:0] im_z;
   output[15:0] re_p; 
   reg[15:0] re_p;
   output[15:0] im_p; 
   reg[15:0] im_p;
   output[15:0] re_n; 
   reg[15:0] re_n;
   output[15:0] im_n; 
   reg[15:0] im_n;

   reg[27:0] f1_reg; 
   reg[27:0] f2_reg; 
   reg[27:0] f3_reg; 
   reg[27:0] h1_reg; 
   reg[27:0] h2_reg; 
   reg[27:0] h3_reg; 
   reg[27:0] h4_reg; 
   reg[28:0] re_z_tmp_1; 
   reg[28:0] im_z_tmp_1; 
   reg[28:0] re_p_tmp_1; 
   reg[28:0] re_p_tmp_2; 
   reg[28:0] re_p_tmp_3; 
   reg[28:0] im_p_tmp_1; 
   reg[28:0] im_p_tmp_2; 
   reg[28:0] im_p_tmp_3; 
   reg[28:0] im_p_tmp_4; 
   reg[30:0] re_z_tmp; 
   reg[30:0] im_z_tmp; 
   reg[30:0] re_p_tmp; 
   reg[30:0] im_p_tmp; 
   reg[30:0] re_n_tmp; 
   reg[30:0] im_n_tmp; 

   always @(posedge clk)
   begin
         if (new_data == 1'b1)
         begin
            f1_reg <= f1 ; 
            f2_reg <= f2 ; 
            f3_reg <= f3 ; 
            h1_reg <= h1 ; 
            h2_reg <= h2 ; 
            h3_reg <= h3 ; 
            h4_reg <= h4 ; 
         end 
   end 

   always @(posedge clk)
   begin
         re_z_tmp_1 <= {f1_reg[27], f1_reg} ; 
         im_z_tmp_1 <= {h1_reg[27], h1_reg} ; 
         re_p_tmp_1 <= {f1_reg[27], f1_reg[27], f1_reg[27:1]} ; 
         re_p_tmp_2 <= {f3_reg[27], f3_reg[27:0]} ; 
         re_p_tmp_3 <= {f2_reg[27], f2_reg[27], f2_reg[27:1]} ; 
         im_p_tmp_1 <= ({h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27:2]}) + ({h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27:3]}) ; 
         im_p_tmp_2 <= ({h4_reg[27], h4_reg}) + ({h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27:4]}) ; 
         im_p_tmp_3 <= ({h3_reg[27], h3_reg}) + ({h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27:4]}) ; 
         im_p_tmp_4 <= ({h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27:2]}) + ({h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27:3]}) ; 
         re_z_tmp <= {re_z_tmp_1[28], re_z_tmp_1[28], re_z_tmp_1} ; 
         im_z_tmp <= {im_z_tmp_1[28], im_z_tmp_1[28], im_z_tmp_1} ; 
         re_p_tmp <= ({re_p_tmp_1[28], re_p_tmp_1[28], re_p_tmp_1}) - ({re_p_tmp_2[28], re_p_tmp_2[28], re_p_tmp_2}) + ({re_p_tmp_3[28], re_p_tmp_3[28], re_p_tmp_3}) ; 
         im_p_tmp <= ({im_p_tmp_1[28], im_p_tmp_1[28], im_p_tmp_1}) - ({im_p_tmp_2[28], im_p_tmp_2[28], im_p_tmp_2}) + ({im_p_tmp_3[28], im_p_tmp_3[28], im_p_tmp_3}) - ({im_p_tmp_4[28], im_p_tmp_4[28], im_p_tmp_4}) ; 
         re_n_tmp <= ({re_p_tmp_1[28], re_p_tmp_1[28], re_p_tmp_1}) + ({re_p_tmp_2[28], re_p_tmp_2[28], re_p_tmp_2}) + ({re_p_tmp_3[28], re_p_tmp_3[28], re_p_tmp_3}) ; 
         im_n_tmp <= ({im_p_tmp_1[28], im_p_tmp_1[28], im_p_tmp_1}) + ({im_p_tmp_2[28], im_p_tmp_2[28], im_p_tmp_2}) + ({im_p_tmp_3[28], im_p_tmp_3[28], im_p_tmp_3}) + ({im_p_tmp_4[28], im_p_tmp_4[28], im_p_tmp_4}) ; 
         re_z <= re_z_tmp[30:15] ; 
         im_z <= im_z_tmp[30:15] ; 
         re_p <= re_p_tmp[30:15] ; 
         im_p <= im_p_tmp[30:15] ; 
         re_n <= re_n_tmp[30:15] ; 
         im_n <= im_n_tmp[30:15] ; 
   end 
endmodule
