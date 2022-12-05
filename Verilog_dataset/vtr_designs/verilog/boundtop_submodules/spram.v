`define SIMULATION_MEMORY

 module spram (we, dataout, datain, clk);

    input we; 
    output[13 - 1:0] dataout; 
    wire[13 - 1:0] dataout;
    input[13 - 1:0] datain; 
    input clk; 
    reg[13 - 1:0] temp_reg; 

    reg[13 - 1:0] mem1; 
    reg[13 - 1:0] mem2; 

    assign dataout = mem2 ;

    always @(posedge clk)
    begin
		temp_reg <= 0;
       if (we == 1'b1)
       begin
          mem1 <= datain + temp_reg; 
          mem2 <= mem1;
       end  
    end 
 endmodule
