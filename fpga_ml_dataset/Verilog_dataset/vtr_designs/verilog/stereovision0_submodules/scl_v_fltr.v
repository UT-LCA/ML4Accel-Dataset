
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



