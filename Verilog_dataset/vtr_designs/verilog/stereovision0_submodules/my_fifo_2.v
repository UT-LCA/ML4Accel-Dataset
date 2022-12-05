
module my_fifo_2 (clk, din, dout, rdy);


    input clk; 
    input[9 - 1:0] din; 
    output[9 - 1:0] dout; 
    reg[9 - 1:0] dout;
	input rdy;

    reg[9-1:0]buff1;
    reg[9-1:0]buff2;


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
