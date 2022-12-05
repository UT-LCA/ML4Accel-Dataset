
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
