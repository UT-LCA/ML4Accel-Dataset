
module scl_h_fltr (clk, nd, d_in_1, d_in_2, d_in_4, d_out_1, d_out_2, d_out_4);

   input clk; 
   input nd; 
   input[7:0] d_in_1; 
   input[7:0] d_in_2; 
   input[7:0] d_in_4; 
   output[7:0] d_out_1; 
   reg[7:0] d_out_1;
   output[7:0] d_out_2; 
   reg[7:0] d_out_2;
   output[7:0] d_out_4; 
   reg[7:0] d_out_4;

   wire[7:0] buff_out_20; 
   wire[7:0] buff_out_21; 
   wire[7:0] buff_out_22; 
   wire[7:0] buff_out_23; 
   reg[7:0] buff_out_reg_21; 
   reg[7:0] buff_out_reg_22; 
   reg[7:0] buff_out_reg_23; 
   wire[7:0] buff_out_40; 
   wire[7:0] buff_out_41; 
   wire[7:0] buff_out_42; 
   wire[7:0] buff_out_43; 
   wire[7:0] buff_out_44; 
   wire[7:0] buff_out_45; 
   wire[7:0] buff_out_46; 
   wire[7:0] buff_out_47; 
   reg[7:0] buff_out_reg_41; 
   reg[7:0] buff_out_reg_42; 
   reg[7:0] buff_out_reg_43; 
   reg[7:0] buff_out_reg_44; 
   reg[7:0] buff_out_reg_45; 
   reg[7:0] buff_out_reg_46; 
   reg[7:0] buff_out_reg_47; 
   reg[9:0] add_2_tmp_1; 
   reg[9:0] add_2_tmp_2; 
   reg[9:0] add_2_tmp; 
   reg[11:0] add_4_tmp_1; 
   reg[11:0] add_4_tmp_2; 
   reg[11:0] add_4_tmp_3; 
   reg[11:0] add_4_tmp_4; 
   reg[11:0] add_4_tmp_5; 
   reg[11:0] add_4_tmp_6; 
   reg[11:0] add_4_tmp_7; 
   reg[11:0] add_4_tmp_8; 
   reg[11:0] add_4_tmp; 

   assign buff_out_20 = d_in_2 ;
   assign buff_out_40 = d_in_4 ;

   sh_reg_1  ints_sh_reg_2_0(clk, nd, buff_out_20, buff_out_21); 
   sh_reg_1  ints_sh_reg_2_1(clk, nd, buff_out_21, buff_out_22); 
   sh_reg_1  ints_sh_reg_2_2(clk, nd, buff_out_22, buff_out_23); 
   sh_reg_1  ints_sh_reg_4_0(clk, nd, buff_out_40, buff_out_41); 
   sh_reg_1  ints_sh_reg_4_1(clk, nd, buff_out_41, buff_out_42); 
   sh_reg_1  ints_sh_reg_4_2(clk, nd, buff_out_42, buff_out_43); 
   sh_reg_1  ints_sh_reg_4_3(clk, nd, buff_out_43, buff_out_44); 
   sh_reg_1  ints_sh_reg_4_4(clk, nd, buff_out_44, buff_out_45); 
   sh_reg_1  ints_sh_reg_4_5(clk, nd, buff_out_45, buff_out_46); 
   sh_reg_1  ints_sh_reg_4_6(clk, nd, buff_out_46, buff_out_47); 

   always @(posedge clk)
   begin
         if (nd == 1'b1)
         begin
            buff_out_reg_41 <= buff_out_41 ; 
            buff_out_reg_42 <= buff_out_42 ; 
            buff_out_reg_43 <= buff_out_43 ; 
            buff_out_reg_44 <= buff_out_44 ; 
            buff_out_reg_45 <= buff_out_45 ; 
            buff_out_reg_46 <= buff_out_46 ; 
            buff_out_reg_47 <= buff_out_47 ; 
            buff_out_reg_21 <= buff_out_21 ; 
            buff_out_reg_22 <= buff_out_22 ; 
            buff_out_reg_23 <= buff_out_23 ; 
            d_out_1 <= d_in_1 ; 
            d_out_2 <= add_2_tmp[9:2] ; 
            d_out_4 <= add_4_tmp[11:4] ; 
         end 
         add_2_tmp_1 <= ({2'b00, buff_out_reg_21}) + ({2'b00, buff_out_reg_23}) ; 
         add_2_tmp_2 <= {1'b0, buff_out_reg_22, 1'b0} ; 
         add_2_tmp <= add_2_tmp_1 + add_2_tmp_2 ; 
         add_4_tmp_1 <= ({4'b0000, buff_out_reg_41}) + ({4'b0000, buff_out_reg_47}) ; 
         add_4_tmp_2 <= ({3'b000, buff_out_reg_42, 1'b0}) + ({3'b000, buff_out_reg_46, 1'b0}) ; 
         add_4_tmp_3 <= ({3'b000, buff_out_reg_43, 1'b0}) + ({3'b000, buff_out_reg_45, 1'b0}) ; 
         add_4_tmp_4 <= ({4'b0000, buff_out_reg_43}) + ({4'b0000, buff_out_reg_45}) ; 
         add_4_tmp_5 <= ({2'b00, buff_out_reg_44, 2'b00}) ; 
         add_4_tmp_6 <= add_4_tmp_1 + add_4_tmp_2 ; 
         add_4_tmp_7 <= add_4_tmp_3 + add_4_tmp_4 ; 
         add_4_tmp_8 <= add_4_tmp_5 + add_4_tmp_6 ; 
         add_4_tmp <= add_4_tmp_7 + add_4_tmp_8 ; 
   end 
endmodule
module sh_reg_1 (clk, wen, din_1, dout_1);

   input clk; 
   input wen; 
   input[8 - 1:0] din_1; 
   output[8 - 1:0] dout_1; 
   reg[8 - 1:0] dout_1;

   always @(posedge clk)
   begin
         if (wen == 1'b1)
         begin
            dout_1 <= din_1 ; 
         end 
   end 
endmodule
