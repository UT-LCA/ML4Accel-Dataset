
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
