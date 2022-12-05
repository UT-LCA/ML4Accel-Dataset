
module wrapper_norm_corr_5_seq (clk, wen, d_l_1, d_l_2, d_r_1, d_r_2, corr_out_0, corr_out_1, corr_out_2, corr_out_3, corr_out_4, corr_out_5);

   parameter sh_reg_w  = 4'b1000;
   input clk; 
   input wen; 
   input[15:0] d_l_1; 
   input[15:0] d_l_2; 
   input[15:0] d_r_1; 
   input[15:0] d_r_2; 
   output[2 * sh_reg_w - 1:0] corr_out_0; 
   wire[2 * sh_reg_w - 1:0] corr_out_0;
   output[2 * sh_reg_w - 1:0] corr_out_1; 
   wire[2 * sh_reg_w - 1:0] corr_out_1;
   output[2 * sh_reg_w - 1:0] corr_out_2; 
   wire[2 * sh_reg_w - 1:0] corr_out_2;
   output[2 * sh_reg_w - 1:0] corr_out_3; 
   wire[2 * sh_reg_w - 1:0] corr_out_3;
   output[2 * sh_reg_w - 1:0] corr_out_4; 
   wire[2 * sh_reg_w - 1:0] corr_out_4;
   output[2 * sh_reg_w - 1:0] corr_out_5; 
   wire[2 * sh_reg_w - 1:0] corr_out_5;

   wire[sh_reg_w - 1:0] d_l_1_nrm; 
   wire[sh_reg_w - 1:0] d_l_2_nrm; 
   wire[sh_reg_w - 1:0] d_r_1_nrm; 
   wire[sh_reg_w - 1:0] d_r_2_nrm; 

   wrapper_norm_seq  norm_inst_left(.clk(clk), .nd(wen), .din_1(d_l_1), .din_2(d_l_2), .dout_1(d_l_1_nrm), .dout_2(d_l_2_nrm)); 
   wrapper_norm_seq  norm_inst_right(.clk(clk), .nd(wen), .din_1(d_r_1), .din_2(d_r_2), .dout_1(d_r_1_nrm), .dout_2(d_r_2_nrm)); 
   wrapper_corr_5_seq corr_5_inst (.tm3_clk_v0(clk), .wen(wen), .d_l_1(d_l_1_nrm), .d_l_2(d_l_2_nrm), .d_r_1(d_r_1_nrm), .d_r_2(d_r_2_nrm), .corr_out_0(corr_out_0), .corr_out_1(corr_out_1), .corr_out_2(corr_out_2), .corr_out_3(corr_out_3), .corr_out_4(corr_out_4), .corr_out_5(corr_out_5));
endmodule
module wrapper_corr_5_seq (tm3_clk_v0, wen, d_l_1, d_l_2, d_r_1, d_r_2, corr_out_0, corr_out_1, corr_out_2, corr_out_3, corr_out_4, corr_out_5);

   parameter sh_reg_w = 4'b1000; 

   input tm3_clk_v0; 
   input wen; 
   input[7:0] d_l_1; 
   input[7:0] d_l_2; 
   input[7:0] d_r_1; 
   input[7:0] d_r_2; 
   output[15:0] corr_out_0; 
   reg[15:0] corr_out_0;
   output[15:0] corr_out_1; 
   reg[15:0] corr_out_1;
   output[15:0] corr_out_2; 
   reg[15:0] corr_out_2;
   output[15:0] corr_out_3; 
   reg[15:0] corr_out_3;
   output[15:0] corr_out_4; 
   reg[15:0] corr_out_4;
   output[15:0] corr_out_5; 
   reg[15:0] corr_out_5;

   wire[sh_reg_w - 1:0] out_r1; 
   wire[sh_reg_w - 1:0] out_01; 
   wire[sh_reg_w - 1:0] out_11; 
   wire[sh_reg_w - 1:0] out_21; 
   wire[sh_reg_w - 1:0] out_31; 
   wire[sh_reg_w - 1:0] out_41; 
   wire[sh_reg_w - 1:0] out_51; 
   wire[sh_reg_w - 1:0] out_r2; 
   wire[sh_reg_w - 1:0] out_02; 
   wire[sh_reg_w - 1:0] out_12; 
   wire[sh_reg_w - 1:0] out_22; 
   wire[sh_reg_w - 1:0] out_32; 
   wire[sh_reg_w - 1:0] out_42; 
   wire[sh_reg_w - 1:0] out_52; 
   wire[2 * sh_reg_w - 1:0] corr_out_0_tmp; 
   wire[2 * sh_reg_w - 1:0] corr_out_1_tmp; 
   wire[2 * sh_reg_w - 1:0] corr_out_2_tmp; 
   wire[2 * sh_reg_w - 1:0] corr_out_3_tmp; 
   wire[2 * sh_reg_w - 1:0] corr_out_4_tmp; 
   wire[2 * sh_reg_w - 1:0] corr_out_5_tmp; 

   sh_reg  inst_sh_reg_r_1(tm3_clk_v0, wen, d_r_1, d_r_2, out_r1, out_r2); 
   sh_reg  inst_sh_reg_0(tm3_clk_v0, wen, d_l_1, d_l_2, out_01, out_02); 
   sh_reg  inst_sh_reg_1(tm3_clk_v0, wen, out_01, out_02, out_11, out_12); 
   sh_reg  inst_sh_reg_2(tm3_clk_v0, wen, out_11, out_12, out_21, out_22); 
   sh_reg  inst_sh_reg_3(tm3_clk_v0, wen, out_21, out_22, out_31, out_32); 
   sh_reg  inst_sh_reg_4(tm3_clk_v0, wen, out_31, out_32, out_41, out_42); 
   sh_reg  inst_sh_reg_5(tm3_clk_v0, wen, out_41, out_42, out_51, out_52); 
   corr_seq  inst_corr_0(tm3_clk_v0, wen, out_01, out_02, out_r1, out_r2, corr_out_0_tmp); 
   corr_seq  inst_corr_1(tm3_clk_v0, wen, out_11, out_12, out_r1, out_r2, corr_out_1_tmp); 
   corr_seq  inst_corr_2(tm3_clk_v0, wen, out_21, out_22, out_r1, out_r2, corr_out_2_tmp); 
   corr_seq  inst_corr_3(tm3_clk_v0, wen, out_31, out_32, out_r1, out_r2, corr_out_3_tmp); 
   corr_seq  inst_corr_4(tm3_clk_v0, wen, out_41, out_42, out_r1, out_r2, corr_out_4_tmp); 
   corr_seq  inst_corr_5(tm3_clk_v0, wen, out_51, out_52, out_r1, out_r2, corr_out_5_tmp); 

   always @(posedge tm3_clk_v0)
   begin
      if (wen == 1'b1)
         begin
            corr_out_0 <= corr_out_0_tmp ; 
            corr_out_1 <= corr_out_1_tmp ; 
            corr_out_2 <= corr_out_2_tmp ; 
            corr_out_3 <= corr_out_3_tmp ; 
            corr_out_4 <= corr_out_4_tmp ; 
            corr_out_5 <= corr_out_5_tmp ; 
         end 
         else
         begin
            corr_out_0 <= corr_out_0; 
            corr_out_1 <= corr_out_1; 
            corr_out_2 <= corr_out_2; 
            corr_out_3 <= corr_out_3; 
            corr_out_4 <= corr_out_4; 
            corr_out_5 <= corr_out_5; 
         end 
   end 
endmodule
module corr_seq (clk, new_data, in_l_re, in_l_im, in_r_re, in_r_im, corr_out);

    parameter sh_reg_w  = 4'b1000;
    input clk; 
    input new_data; 
    input[sh_reg_w - 1:0] in_l_re; 
    input[sh_reg_w - 1:0] in_l_im; 
    input[sh_reg_w - 1:0] in_r_re; 
    input[sh_reg_w - 1:0] in_r_im; 
    output[2 * sh_reg_w - 1:0] corr_out; 
    reg[2 * sh_reg_w - 1:0] corr_out;
    reg[sh_reg_w - 1:0] in_l_re_reg; 
    reg[sh_reg_w - 1:0] in_l_im_reg; 
    reg[sh_reg_w - 1:0] in_r_re_reg; 
    reg[sh_reg_w - 1:0] in_r_im_reg; 
    reg[2 * sh_reg_w - 1:0] lrexrre_reg; 
    reg[2 * sh_reg_w - 1:0] limxrim_reg; 
    reg[2 * sh_reg_w - 1:0] corr_out_tmp; 

    always @(posedge clk)
    begin
          if (new_data == 1'b1)
          begin
             in_l_re_reg <= in_l_re ; 
             in_l_im_reg <= in_l_im ; 
             in_r_re_reg <= in_r_re ; 
             in_r_im_reg <= in_r_im ; 
             corr_out <= corr_out_tmp ; 
          end 
          else
          begin
             in_l_re_reg <= in_l_re_reg ; 
             in_l_im_reg <= in_l_im_reg ; 
             in_r_re_reg <= in_r_re_reg ; 
             in_r_im_reg <= in_r_im_reg ; 
             corr_out <= corr_out; 
          end 
			// PAJ - replaced by me, but called mult_slow
             lrexrre_reg <= in_l_re_reg*in_r_re_reg ; 
             limxrim_reg <= in_l_im_reg*in_r_im_reg ; 
          corr_out_tmp <= lrexrre_reg + limxrim_reg ; 
    end 
 endmodule
module sh_reg (clk, wen, din_1, din_2, dout_1, dout_2);

   parameter sh_reg_w  = 4'b1000;
   input clk; 
   input wen; 
   input[sh_reg_w - 1:0] din_1; 
   input[sh_reg_w - 1:0] din_2; 
   output[sh_reg_w - 1:0] dout_1; 
   reg[sh_reg_w - 1:0] dout_1;
   output[sh_reg_w - 1:0] dout_2; 
   reg[sh_reg_w - 1:0] dout_2;

   always @(posedge clk)
   begin
         if (wen == 1'b1)
         begin
            dout_1 <= din_1 ; 
            dout_2 <= din_2 ; 
         end 
		else
		begin
            dout_1 <= dout_1 ; 
            dout_2 <= dout_2 ; 
		end
   end 
endmodule
module wrapper_norm_seq (clk, nd, din_1, din_2, dout_1, dout_2);

   parameter sh_reg_w  = 4'b1000;
   input clk; 
   input nd; 
   input[15:0] din_1; 
   input[15:0] din_2; 
   output[sh_reg_w - 1:0] dout_1; 
   wire[sh_reg_w - 1:0] dout_1;
   output[sh_reg_w - 1:0] dout_2; 
   wire[sh_reg_w - 1:0] dout_2;

   reg[15:0] din_1_reg; 
   reg[15:0] din_2_reg; 
   reg[15:0] din_1_tmp1; 
   reg[15:0] din_2_tmp1; 
   reg[15:0] din_1_tmp2; 
   reg[15:0] din_2_tmp2; 
   reg[15:0] addin_1; 
   reg[15:0] addin_2; 
   reg[16:0] add_out; 

   my_wrapper_divider my_div_inst_1 (nd, clk, din_1_tmp2, add_out, dout_1); 
   my_wrapper_divider my_div_inst_2 (nd, clk, din_2_tmp2, add_out, dout_2); 

   always @(posedge clk)
   begin
         if (nd == 1'b1)
         begin
            din_1_reg <= din_1 ; 
            din_2_reg <= din_2 ; 
         end 
         else
         begin
            din_1_reg <= din_1_reg ; 
            din_2_reg <= din_2_reg ; 
         end
 
         din_1_tmp1 <= din_1_reg ; 
         din_1_tmp2 <= din_1_tmp1 ; 
         din_2_tmp1 <= din_2_reg ; 
         din_2_tmp2 <= din_2_tmp1 ; 

         if ((din_1_reg[15]) == 1'b0)
         begin
            addin_1 <= din_1_reg ; 
         end
         else
         begin
            addin_1 <= 16'b0000000000000000 - din_1_reg ; 
         end 

         if ((din_2_reg[15]) == 1'b0)
         begin
            addin_2 <= din_2_reg + 16'b0000000000000001 ; 
         end
         else
         begin
            addin_2 <= 16'b0000000000000001 - din_2_reg ; 
         end 

         add_out <= ({addin_1[15], addin_1}) + ({addin_2[15], addin_2}) ; 
   end 
endmodule
module my_wrapper_divider(rst, clk, data_in_a, data_in_b, data_out);
	parameter INPUT_WIDTH_A = 5'b10000;
	parameter INPUT_WIDTH_B = 5'b10001;
	parameter OUTPUT_WIDTH = 4'b1000;

	parameter S1 = 2'b00;
	parameter S2 = 2'b01;
	parameter S3 = 2'b10;
	parameter S4 = 2'b11;

	input rst;
	input clk;
	input [INPUT_WIDTH_A-1:0]data_in_a;
	input [INPUT_WIDTH_B-1:0]data_in_b;
	output [OUTPUT_WIDTH-1:0]data_out;
	wire [OUTPUT_WIDTH-1:0]data_out;

	wire [OUTPUT_WIDTH-1:0]Remainder;

	reg start, LA, EB;
	wire Done;
	reg[1:0] y, Y;

	my_divider my_divider_inst(clk, rst, start, LA, EB, data_in_a, data_in_b, Remainder, data_out, Done);

	always @(posedge clk)
	begin
		if (rst == 0)
			y <= S1;
		else
			y <= Y;
	end

	always @(y)
	begin
		case (y)
			S1 :
			begin	
				LA = 0;
				EB = 0;
				start = 0;
				Y = S2;
			end
			S2 : 
			begin
				LA = 1;
				EB = 1;
				start = 0;
				Y = S3;
			end
			S3 : 
			begin
				LA = 0;
				EB = 0;
				start = 1;
				Y = S4;
			end
			S4 : 
			begin
				LA = 0;
				EB = 0;
				start = 0;
				if (Done == 1'b1)
				begin
					Y = S1;
				end
				else
				begin
					Y = S4;
				end
			end
		endcase
	end
endmodule
module my_divider(clk, rst, start, LA, EB, data_in_a, data_in_b, Remainder, data_out, Done);

	parameter INPUT_WIDTH_A = 5'b10000;
	parameter INPUT_WIDTH_B = 5'b10001;
	parameter OUTPUT_WIDTH = 4'b1000;
	parameter LOGN = 3'b100;

	parameter S1 = 2'b00;
	parameter S2 = 2'b01;
	parameter S3 = 2'b10;

	input clk;
	input [INPUT_WIDTH_A-1:0]data_in_a;
	input [INPUT_WIDTH_B-1:0]data_in_b;
	input rst;
	input start;
	input LA;
	input EB;
	output [OUTPUT_WIDTH-1:0]data_out;
	wire [OUTPUT_WIDTH-1:0]data_out;
	output [OUTPUT_WIDTH-1:0]Remainder;
	reg [OUTPUT_WIDTH-1:0]Remainder;
	output Done;
	reg Done;

	wire Cout, zero;
	wire [INPUT_WIDTH_A-1:0] Sum;
	reg [1:0] y, Y;
	reg [LOGN-1:0] Count;
	reg EA, Rsel, LR, ER, ER0, LC, EC;
	reg [INPUT_WIDTH_B-1:0] RegB;
	reg [INPUT_WIDTH_A-1:0] DataA;
	reg ff0;

	always @(start or y or zero)
	begin
		case(y)
			S1:
			begin
				if (start == 0)
					Y = S1;
				else
					Y = S2;
			end
			S2:
			begin
				if (zero == 0)
					Y = S2;
				else
					Y = S3;
			end
			S3:
			begin
				if (start == 1)
					Y = S3;
				else
					Y = S1;
			end
			default:
			begin
				Y = 2'b00;
			end
		endcase
	end

	always @(posedge clk)
	begin
		if (rst == 0)
			y <= S1;
		else
			y <= Y;
	end

	always @(y or start or Cout or zero)
	begin
		case (y)
			S1:
			begin
				LC = 1;
				ER = 1;
				EC = 0;
				Rsel = 0;
				Done = 0;
				if (start == 0)
				begin
					LR = 1;
					ER0 = 1;
					EA = 0;
				end	
				else
				begin
					LR = 0; 
					EA = 1;
					ER0 = 1;
				end
			end
			S2:
			begin
				LC = 0;
				ER = 1;
				Rsel = 1;	
				Done = 0;
				ER0 = 1;
				EA = 1;
				if (Cout)
					LR = 1;
				else
					LR = 0;
				if (zero == 0)
					EC = 1;
				else
					EC = 0;
			end
			S3:
			begin
				Done = 1;
				LR = 0;
				LC = 0;
				ER = 0;
				EC = 0;
				Rsel = 0;
				ER0 = 0;
				EA = 0;
			end
			default:
			begin
				Done = 0;
				LR = 0;
				LC = 0;
				ER = 0;
				EC = 0;
				Rsel = 0;
				ER0 = 0;
				EA = 0;
			end
		endcase
	end	

	always @(posedge clk)
	begin
		if (rst == 1)
		begin
			RegB <= 0;
			Remainder <= 0;
			DataA <= 0;
			ff0 <= 0;
			Count <= 0;
		end	
		else
		begin
			if (EB == 1)
			begin
				RegB <= data_in_b;
			end
			else
			begin
				RegB <= RegB;
			end

			if (LR == 1)
			begin
				Remainder <= Rsel ? Sum : 0;
			end
			else if (ER == 1)
			begin
				Remainder <= (Remainder << 1) | ff0;
			end
			else
			begin
				Remainder <= Remainder;
			end

			if (LA == 1)
			begin
				DataA <= data_in_a;
			end
			else if (EA == 1)
			begin
				DataA <= (DataA << 1) | Cout;
			end
			else
			begin
				DataA <= DataA;
			end

			if (ER0 == 1)
			begin
				ff0 <=  DataA[INPUT_WIDTH_A-1];
			end
			else
			begin
				ff0 <= 0;
			end

			if (LC == 1)
			begin
				Count <= 0;
			end
			else if (EC == 1)
			begin
				Count <= Count + 1;
			end
			else
			begin
				Count <= Count;
			end
		end
	end	

	assign zero = (Count == 0);
	assign Sum = {Remainder, ff0} + (~RegB + 1);
	assign Cout = Sum[INPUT_WIDTH_A-1:0];
	assign data_out = DataA; 

endmodule
