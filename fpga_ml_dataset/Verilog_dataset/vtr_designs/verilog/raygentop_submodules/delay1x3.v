`define SIMULATION_MEMORY

module delay1x3 (datain, dataout, clk);

    input datain; 
    output dataout; 
    wire dataout;
    input clk; 

    reg buff0; 
    reg buff1; 
    reg buff2; 

    assign dataout = buff2 ;

    always @(posedge clk)
    begin
/* PAJ expanded for loop to hard definition the size of `depth */
       buff0 <= datain ; 
		buff1 <= buff0;
		buff2 <= buff1;
    end 
 endmodule
