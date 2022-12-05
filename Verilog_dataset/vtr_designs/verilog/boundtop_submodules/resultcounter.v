`define SIMULATION_MEMORY

 module resultcounter (resultID, newresult, done, reset, globalreset, clk);

    input[1:0] resultID; 
    input newresult; 
    output[1:0] done; 
    wire[1:0] done;
    input reset; 
    input globalreset; 
    input clk; 

	wire big_reset;

    reg[3:0] count; 
    reg[1:0] curr; 

    assign done = (count == 0) ? curr : 2'b00 ;
	assign big_reset = globalreset | reset;

    always @(posedge clk)
    begin
		if (big_reset == 1'b1)
       begin
          count <= 4'b1000 ; 
          curr <= 0;
       end
       else
       begin
          if ((resultID != 0) & (newresult == 1'b1) & (count != 0))
          begin
             count <= count - 1 ; 
             curr <= resultID ; 
          end 
       end 
    end 
 endmodule
