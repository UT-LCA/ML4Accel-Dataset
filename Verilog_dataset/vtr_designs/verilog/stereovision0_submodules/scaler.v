
module scaler (
    tm3_clk_v0, 
    vidin_new_data, 
    vidin_rgb_reg, 
    vidin_addr_reg, 
    vidin_new_data_scld_1, 
    vidin_new_data_scld_2, 
    vidin_new_data_scld_4, 
    vidin_gray_scld_1, 
    vidin_gray_scld_2, 
    vidin_gray_scld_4
);
   input tm3_clk_v0; 
   input vidin_new_data; 
   input[7:0] vidin_rgb_reg; 
   input[3:0] vidin_addr_reg; 
   output vidin_new_data_scld_1; 
   reg vidin_new_data_scld_1;
   output vidin_new_data_scld_2; 
   reg vidin_new_data_scld_2;
   output vidin_new_data_scld_4; 
   reg vidin_new_data_scld_4;
   output[7:0] vidin_gray_scld_1; 
   reg[7:0] vidin_gray_scld_1;
   output[7:0] vidin_gray_scld_2; 
   reg[7:0] vidin_gray_scld_2;
   output[7:0] vidin_gray_scld_4; 
   reg[7:0] vidin_gray_scld_4;

   wire[7:0] v_fltr_sc_1; 
   wire[7:0] v_fltr_sc_2; 
   wire[7:0] v_fltr_sc_4; 
   wire[7:0] h_fltr_sc_1; 
   wire[7:0] h_fltr_sc_2; 
   wire[7:0] h_fltr_sc_4; 

   scl_v_fltr scl_v_fltr_inst (tm3_clk_v0, vidin_new_data, vidin_rgb_reg, v_fltr_sc_1, v_fltr_sc_2, v_fltr_sc_4); 
   scl_h_fltr scl_h_fltr_inst (tm3_clk_v0, vidin_new_data, v_fltr_sc_1, v_fltr_sc_2, v_fltr_sc_4, h_fltr_sc_1, h_fltr_sc_2, h_fltr_sc_4); 

   always @(posedge tm3_clk_v0)
   begin
         vidin_new_data_scld_1 <= vidin_new_data ;          
         if (vidin_new_data == 1'b1)
         begin
            vidin_gray_scld_1 <= h_fltr_sc_1 ; 
            if ((vidin_addr_reg[0]) == 1'b0 & (vidin_addr_reg[2]) == 1'b0)
            begin
               vidin_gray_scld_2 <= h_fltr_sc_2 ; 
               vidin_new_data_scld_2 <= 1'b1 ; 
               if ((vidin_addr_reg[1]) == 1'b0 & (vidin_addr_reg[3]) == 1'b0)
               begin
                    vidin_gray_scld_4 <= h_fltr_sc_4 ; 
                    vidin_new_data_scld_4 <= 1'b1 ; 
               end 
               else 
               begin
                   vidin_new_data_scld_4 <= 1'b0 ; 
               end
            end 
            else 
            begin                
                vidin_new_data_scld_2 <= 1'b0;
                vidin_new_data_scld_4 <= 1'b0; 
            end 
         end 
         else 
         begin 
            vidin_new_data_scld_2 <= 1'b0;
            vidin_new_data_scld_4 <= 1'b0 ;
         end
   end 
endmodule
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
module scl_v_fltr (clk, nd, d_in, d_out_1, d_out_2, d_out_4);

   // <<X-HDL>> : Warning - included file work/basic_type does not exist - this may affect translation

   input clk; 
   input nd; 
   input[7:0] d_in; 
   output[7:0] d_out_1; 
   reg[7:0] d_out_1;
   output[7:0] d_out_2; 
   reg[7:0] d_out_2;
   output[7:0] d_out_4; 
   reg[7:0] d_out_4;

   wire[7:0] buff_out0; 
   wire[7:0] buff_out1; 
   wire[7:0] buff_out2; 
   wire[7:0] buff_out3; 
   wire[7:0] buff_out4; 
   wire[7:0] buff_out5; 
   wire[7:0] buff_out6; 
   wire[7:0] buff_out7; 
   reg[7:0] buff_out_reg0; 
   reg[7:0] buff_out_reg1; 
   reg[7:0] buff_out_reg2; 
   reg[7:0] buff_out_reg3; 
   reg[7:0] buff_out_reg4; 
   reg[7:0] buff_out_reg5; 
   reg[7:0] buff_out_reg6; 
   reg[7:0] buff_out_reg7; 
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
   // <<X-HDL>> Unsupported Construct - attribute  (source line 33)
   // <<X-HDL>> Unsupported Construct - attribute  (source line 34))

   assign buff_out0 = d_in ;

   my_fifo_496 ints_fifo_gen_0 (clk, buff_out0, buff_out1, nd);
   my_fifo_496 ints_fifo_gen_1 (clk, buff_out1, buff_out2, nd);
   my_fifo_496 ints_fifo_gen_2 (clk, buff_out2, buff_out3, nd);
   my_fifo_496 ints_fifo_gen_3 (clk, buff_out3, buff_out4, nd);
   my_fifo_496 ints_fifo_gen_4 (clk, buff_out4, buff_out5, nd);
   my_fifo_496 ints_fifo_gen_5 (clk, buff_out5, buff_out6, nd);
   my_fifo_496 ints_fifo_gen_6 (clk, buff_out6, buff_out7, nd);

   always @(posedge clk)
   begin
         if (nd == 1'b1)
         begin
            buff_out_reg1 <= buff_out1 ; 
            buff_out_reg2 <= buff_out2 ; 
            buff_out_reg3 <= buff_out3 ; 
            buff_out_reg4 <= buff_out4 ; 
            buff_out_reg5 <= buff_out5 ; 
            buff_out_reg6 <= buff_out6 ; 
            buff_out_reg7 <= buff_out7 ; 
            d_out_1 <= buff_out_reg1 ; 
            d_out_2 <= add_2_tmp[9:2] ; 
            d_out_4 <= add_4_tmp[11:4] ; 
         end 
         add_2_tmp_1 <= ({2'b00, buff_out_reg1}) + ({2'b00, buff_out_reg3}) ; 
         add_2_tmp_2 <= {1'b0, buff_out_reg2, 1'b0} ; 
         add_2_tmp <= add_2_tmp_1 + add_2_tmp_2 ; 
         add_4_tmp_1 <= ({4'b0000, buff_out_reg1}) + ({4'b0000, buff_out_reg7}) ; 
         add_4_tmp_2 <= ({3'b000, buff_out_reg2, 1'b0}) + ({3'b000, buff_out_reg6, 1'b0}) ; 
         add_4_tmp_3 <= ({3'b000, buff_out_reg3, 1'b0}) + ({3'b000, buff_out_reg5, 1'b0}) ; 
         add_4_tmp_4 <= ({4'b0000, buff_out_reg3}) + ({4'b0000, buff_out_reg5}) ; 
         add_4_tmp_5 <= ({2'b00, buff_out_reg4, 2'b00}) ; 
         add_4_tmp_6 <= add_4_tmp_1 + add_4_tmp_2 ; 
         add_4_tmp_7 <= add_4_tmp_3 + add_4_tmp_4 ; 
         add_4_tmp_8 <= add_4_tmp_5 + add_4_tmp_6 ; 
         add_4_tmp <= add_4_tmp_7 + add_4_tmp_8 ; 
   end 
endmodule

module my_fifo_496 (clk, din, dout, rdy);

    input clk; 
    input[8 - 1:0] din; 
    output[8 - 1:0] dout; 
    reg[8 - 1:0] dout;
	input rdy;

    reg[8-1:0]buff1;
    reg[8-1:0]buff2;

	// Fifo size log(FIFO_SIZE)/log2

    always @(posedge clk)
    begin
		if (rdy == 1'b1)
		begin
			buff1 <= din;
			dout <= buff2;
			buff2 <= buff1;

		end
	end
endmodule



