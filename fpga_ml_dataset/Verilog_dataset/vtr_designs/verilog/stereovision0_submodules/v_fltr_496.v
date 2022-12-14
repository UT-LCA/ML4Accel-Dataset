
module v_fltr_496 (tm3_clk_v0, vidin_new_data, vidin_in, vidin_out);


   input tm3_clk_v0; 
   input vidin_new_data; 
   input[7:0] vidin_in; 
   output[7:0] vidin_out; 
   wire[7:0] vidin_out;

   wire[7:0] buff_out0; 
   wire[7:0] buff_out1; 
   wire[7:0] buff_out2; 
   wire[7:0] buff_out3; 
   wire[7:0] buff_out4; 
   wire[7:0] buff_out5; 
   wire[7:0] buff_out6; 
   wire[7:0] buff_out7; 
   wire[7:0] buff_out8; 
   wire[7:0] buff_out9; 
   wire[7:0] buff_out10; 
   wire[7:0] buff_out11; 

   assign buff_out0 = vidin_in ;

	my_fifo_496 fifo0(tm3_clk_v0, buff_out0, buff_out1, vidin_new_data);
	my_fifo_496 fifo1(tm3_clk_v0, buff_out1, buff_out2, vidin_new_data);
	my_fifo_496 fifo2(tm3_clk_v0, buff_out2, buff_out3, vidin_new_data);
	my_fifo_496 fifo3(tm3_clk_v0, buff_out3, buff_out4, vidin_new_data);
	my_fifo_496 fifo4(tm3_clk_v0, buff_out4, buff_out5, vidin_new_data);
	my_fifo_496 fifo5(tm3_clk_v0, buff_out5, buff_out6, vidin_new_data);
	my_fifo_496 fifo6(tm3_clk_v0, buff_out6, buff_out7, vidin_new_data);
	my_fifo_496 fifo7(tm3_clk_v0, buff_out7, buff_out8, vidin_new_data);
	my_fifo_496 fifo8(tm3_clk_v0, buff_out8, buff_out9, vidin_new_data);
	my_fifo_496 fifo9(tm3_clk_v0, buff_out9, buff_out10, vidin_new_data);
	my_fifo_496 fifo10(tm3_clk_v0, buff_out10, buff_out11, vidin_new_data);

   my_fifo_496 more_inst (tm3_clk_v0, buff_out11, vidin_out, vidin_new_data); 
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
