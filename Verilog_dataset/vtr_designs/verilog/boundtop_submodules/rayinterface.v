`define SIMULATION_MEMORY

 module rayinterface (raygroup, raygroupwe, raygroupid, enablenear, rgData, rgAddr, rgWE, rgAddrValid, rgDone, raydata, rayaddr, raywe, globalreset, clk);

    input[1:0] raygroup; 
    input raygroupwe; 
    input[1:0] raygroupid; 
    input enablenear; 
    input[31:0] rgData; 
    input[3:0] rgAddr; 
    input[2:0] rgWE; 

    input rgAddrValid; 
    output rgDone; 
    reg rgDone;
    output[31:0] raydata; 
    reg[31:0] raydata;
    output[3:0] rayaddr; 
    reg[3:0] rayaddr;
    output[2:0] raywe; 
    reg[2:0] raywe;
    input globalreset; 
    input clk; 


    reg[31:0] rgDatal; 
    reg[3:0] rgAddrl; 
    reg[2:0] rgWEl; 
    reg rgAddrValidl; 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          raydata <= 0;
          rayaddr <= 0;
          raywe <= 0;

          rgDone <= 1'b0 ; 
          rgDatal <= 0;
          rgAddrl <= 0;
          rgWEl <= 0;
          rgAddrValidl <= 1'b0 ; 
       end
       else
       begin
          rgDatal <= rgData ; // Latch interchip signals
          rgAddrl <= rgAddr ; // To Meet Timing
          rgWEl <= rgWE ; 

          rgAddrValidl <= rgAddrValid ; 
 
          if (raygroupwe == 1'b1)
          begin
             raydata[0] <= enablenear ; 
             raydata[31:1] <= 0;
             raywe <= 3'b111 ; 
             rayaddr <= {raygroupid, raygroup} ; 
             if (rgAddrValidl == 1'b0)
              	rgDone <= 1'b0 ;
          end
          else if (rgAddrValidl == 1'b1 & rgDone == 1'b0)
          begin
             raydata <= rgDatal ; 
             raywe <= rgWEl ; 
             rayaddr <= rgAddrl ; 
             rgDone <= 1'b1 ; 
          end 
	  else
	  begin
             raywe <= 0;
	  end
       end 
    end 
 endmodule
