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

module h_fltr (tm3_clk_v0, vidin_new_data, vidin_in_f1, vidin_in_f2, vidin_in_f3, vidin_in_h1, vidin_in_h2, vidin_in_h3, vidin_in_h4, real_z_reg, imag_z_reg, real_p_reg, imag_p_reg, real_n_reg, imag_n_reg);

   input tm3_clk_v0; 
   input vidin_new_data; 
   input[15:0] vidin_in_f1; 
   input[15:0] vidin_in_f2; 
   input[15:0] vidin_in_f3; 
   input[15:0] vidin_in_h1; 
   input[15:0] vidin_in_h2; 
   input[15:0] vidin_in_h3; 
   input[15:0] vidin_in_h4; 
   output[15:0] real_z_reg; 
   reg[15:0] real_z_reg;
   output[15:0] imag_z_reg; 
   reg[15:0] imag_z_reg;
   output[15:0] real_p_reg; 
   reg[15:0] real_p_reg;
   output[15:0] imag_p_reg; 
   reg[15:0] imag_p_reg;
   output[15:0] real_n_reg; 
   reg[15:0] real_n_reg;
   output[15:0] imag_n_reg; 
   reg[15:0] imag_n_reg;

   wire[27:0] vidin_out_temp_f1; 
   reg[27:0] vidin_out_reg_f1; 
   wire my_fir_rdy_f1; 
   wire[27:0] vidin_out_temp_f2; 
   reg[27:0] vidin_out_reg_f2; 
   wire my_fir_rdy_f2; 
   wire[27:0] vidin_out_temp_f3; 
   reg[27:0] vidin_out_reg_f3; 
   wire my_fir_rdy_f3; 
   wire[27:0] vidin_out_temp_h1; 
   reg[27:0] vidin_out_reg_h1; 
   wire my_fir_rdy_h1; 
   wire[27:0] vidin_out_temp_h2; 
   reg[27:0] vidin_out_reg_h2; 
   wire my_fir_rdy_h2; 
   wire[27:0] vidin_out_temp_h3; 
   reg[27:0] vidin_out_reg_h3; 
   wire my_fir_rdy_h3; 
   wire[27:0] vidin_out_temp_h4; 
   reg[27:0] vidin_out_reg_h4; 
   wire my_fir_rdy_h4; 
   wire[28:0] sum_tmp_1; 
   wire[28:0] sum_tmp_2; 

   wire[28:0] sum_tmp_3; 
   wire[28:0] sum_tmp_4; 
   wire[30:0] sum_tmp_5; 
   wire[15:0] real_p; 
   wire[15:0] imag_p; 
   wire[15:0] real_z; 
   wire[15:0] imag_z; 
   wire[15:0] real_n; 
   wire[15:0] imag_n; 
   wire[16:0] tmp; 

   my_fir_f1 your_instance_name_f1 (tm3_clk_v0, vidin_new_data, my_fir_rdy_f1, vidin_in_f2, vidin_out_temp_f1); 
   my_fir_f2 your_instance_name_f2 (tm3_clk_v0, vidin_new_data, my_fir_rdy_f2, vidin_in_f1, vidin_out_temp_f2); 
   my_fir_f3 your_instance_name_f3 (tm3_clk_v0, vidin_new_data, my_fir_rdy_f3, vidin_in_f3, vidin_out_temp_f3); 
   my_fir_h1 your_instance_name_h1 (tm3_clk_v0, vidin_new_data, my_fir_rdy_h1, vidin_in_h2, vidin_out_temp_h1); 
   my_fir_h2 your_instance_name_h2 (tm3_clk_v0, vidin_new_data, my_fir_rdy_h2, vidin_in_h1, vidin_out_temp_h2); 
   my_fir_h3 your_instance_name_h3 (tm3_clk_v0, vidin_new_data, my_fir_rdy_h3, vidin_in_h4, vidin_out_temp_h3); 
   my_fir_h4 your_instance_name_h4 (tm3_clk_v0, vidin_new_data, my_fir_rdy_h4, vidin_in_h3, vidin_out_temp_h4); 
   steer_fltr my_steer_fltr_inst (tm3_clk_v0, vidin_new_data, vidin_out_reg_f1, vidin_out_reg_f2, vidin_out_reg_f3, vidin_out_reg_h1, vidin_out_reg_h2, vidin_out_reg_h3, vidin_out_reg_h4, real_z, imag_z, real_p, imag_p, real_n, imag_n); 

   always @(posedge tm3_clk_v0)
   begin
         if (my_fir_rdy_f1 == 1'b1)
         begin
            vidin_out_reg_f1 <= vidin_out_temp_f1 ; 
         end 
         if (my_fir_rdy_f2 == 1'b1)
         begin
            vidin_out_reg_f2 <= vidin_out_temp_f2 ; 
         end 
         if (my_fir_rdy_f3 == 1'b1)
         begin
            vidin_out_reg_f3 <= vidin_out_temp_f3 ; 
         end 
         if (my_fir_rdy_h1 == 1'b1)
         begin
            vidin_out_reg_h1 <= vidin_out_temp_h1 ; 
         end 
         if (my_fir_rdy_h2 == 1'b1)
         begin
            vidin_out_reg_h2 <= vidin_out_temp_h2 ; 
         end 
         if (my_fir_rdy_h3 == 1'b1)
         begin
            vidin_out_reg_h3 <= vidin_out_temp_h3 ; 

         end 
         if (my_fir_rdy_h4 == 1'b1)
         begin
            vidin_out_reg_h4 <= vidin_out_temp_h4 ; 
         end 
   end 

   always @(posedge tm3_clk_v0)
   begin
         real_z_reg <= real_z ; 
         imag_z_reg <= imag_z ; 
         real_p_reg <= real_p ; 
         imag_p_reg <= imag_p ; 
         real_n_reg <= real_n ; 
         imag_n_reg <= imag_n ; 
   end 
endmodule
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
module my_fir_h4 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=-9,-56,-109,0,109,56,9;
	//	parameter WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_4) + 
				(n_delay_reg1 * `COEF1_4) + 
				(n_delay_reg2 * `COEF2_4) + 
				(n_delay_reg4 * `COEF4_4) + 
				(n_delay_reg5 * `COEF5_4) + 
				(n_delay_reg6 * `COEF6_4);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_h3 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=-9,-56,-109,0,109,56,9;
//	parameter WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_3) + 
				(n_delay_reg1 * `COEF1_3) + 
				(n_delay_reg2 * `COEF2_3) + 
				(n_delay_reg4 * `COEF4_3) + 
				(n_delay_reg5 * `COEF5_3) + 
				(n_delay_reg6 * `COEF6_3);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_h2 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=4,42,163,255,163,42,4;

//	parameter `WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_2) + 
				(n_delay_reg1 * `COEF1_2) + 
				(n_delay_reg2 * `COEF2_2) + 
				(n_delay_reg3 * `COEF3_2) + 
				(n_delay_reg4 * `COEF4_2) + 
				(n_delay_reg5 * `COEF5_2) + 
				(n_delay_reg6 * `COEF6_2);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_h1 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=-15,25,193,0,-193,-25,15;


//	parameter `WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_1) + 
				(n_delay_reg1 * `COEF1_1) + 
				(n_delay_reg2 * `COEF2_1) + 
				(n_delay_reg4 * `COEF4_1) + 
				(n_delay_reg5 * `COEF5_1) + 
				(n_delay_reg6 * `COEF6_1);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_f3 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=-12,-77,-148,0,148,77,12;

//	parameter `WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_d) + 
				(n_delay_reg1 * `COEF1_d) + 
				(n_delay_reg2 * `COEF2_d) + 
				(n_delay_reg4 * `COEF4_d) + 
				(n_delay_reg5 * `COEF5_d) + 
				(n_delay_reg6 * `COEF6_d);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_f2 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=4,42,163,255,163,42,4;


//	parameter WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_c) + 
				(n_delay_reg1 * `COEF1_c) + 
				(n_delay_reg2 * `COEF2_c) + 
				(n_delay_reg3 * `COEF3_c) + 
				(n_delay_reg4 * `COEF4_c) + 
				(n_delay_reg5 * `COEF5_c) + 
				(n_delay_reg6 * `COEF6_c);

		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
module my_fir_f1 (clk, new_data_rdy, output_data_ready, din, dout);

//coefdata=29,101,-15,-235,-15,101,29;

	//parameter `WIDTH = 5'b10000;

    input clk; 
    input[`WIDTH_5B - 1:0] din; 
    output[28 - 1:0] dout; 
    reg[28 - 1:0] dout;
	input new_data_rdy;
	output output_data_ready;
	reg output_data_ready;

    reg[`WIDTH_5B - 1:0]n_delay_reg1;
    reg[`WIDTH_5B - 1:0]n_delay_reg2;
    reg[`WIDTH_5B - 1:0]n_delay_reg3;
    reg[`WIDTH_5B - 1:0]n_delay_reg4;
    reg[`WIDTH_5B - 1:0]n_delay_reg5;
    reg[`WIDTH_5B - 1:0]n_delay_reg6;

    always @(posedge clk)
    begin
		if (new_data_rdy == 1'b1)
		begin
			n_delay_reg1 <= din;
			n_delay_reg2 <= n_delay_reg1;
			n_delay_reg3 <= n_delay_reg2;
			n_delay_reg4 <= n_delay_reg3;
			n_delay_reg5 <= n_delay_reg4;
			n_delay_reg6 <= n_delay_reg5;
		
			output_data_ready <= 1'b1;
			dout <= (din * `COEF0_b) + 
				(n_delay_reg1 * `COEF1_b) + 
				(n_delay_reg2 * `COEF2_b) + 
				(n_delay_reg3 * `COEF3_b) + 
				(n_delay_reg4 * `COEF4_b) + 
				(n_delay_reg5 * `COEF5_b) + 
				(n_delay_reg6 * `COEF6_b);
		end
		else
		begin
			output_data_ready <= 1'b0;
		end
	end
endmodule
