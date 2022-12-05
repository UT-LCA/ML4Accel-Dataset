
module lp_fltr_v1 (clk, din, dout_1, dout_2, nd);

   input clk; 
   input[8 - 1:0] din; 
   output[8 - 1:0] dout_1; 
   reg[8 - 1:0] dout_1;
   output[8 - 1:0] dout_2; 
   reg[8 - 1:0] dout_2;
   input nd; 

   reg[8 - 1:0] din_1_reg; 
   wire[8 - 1:0] buff_out_1; 
   wire[8 - 1:0] buff_out_2; 
   reg[8 - 1:0] din_2_reg; 
   reg[8 - 1:0] din_3_reg; 
   reg[8 + 1:0] add_tmp_1; 
   reg[8 + 1:0] add_tmp_2; 

   my_fifo_359 ints_fifo_1 (clk, din, buff_out_1, nd); 
   my_fifo_359 ints_fifo_2 (clk, buff_out_1, buff_out_2, nd); 

   always @(posedge clk)
   begin
         if (nd == 1'b1)
         begin
            din_1_reg <= din ; 
            din_2_reg <= buff_out_1 ; 
            din_3_reg <= buff_out_2 ; 
            dout_1 <= din ; 
            dout_2 <= add_tmp_2[8 + 1:2] ; 
         end 
         add_tmp_1 <= ({din_3_reg[8 - 1], din_3_reg[8 - 1], din_3_reg}) + ({din_1_reg[8 - 1], din_1_reg[8 - 1], din_1_reg}) ; 
         add_tmp_2 <= add_tmp_1 + ({din_2_reg[8 - 1], din_2_reg, 1'b0}) ; 
   end 
endmodule
module my_fifo_359 (clk, din, dout, rdy);


    input clk; 
    input[8 - 1:0] din; 
    output[8 - 1:0] dout; 
    reg[8 - 1:0] dout;
	input rdy;

    reg[8-1:0]buff1;
    reg[8-1:0]buff2;


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
