`define SIMULATION_MEMORY

 module raysend (as, ack, addr, dir, origx, origy, origz, rgData, rgAddr, rgWE, rgAddrValid, rgDone, globalreset, clk, statepeek);

    input as; 
    output ack; 
    reg ack;
    input[3:0] addr; 
    input[47:0] dir; 
    input[27:0] origx; 
    input[27:0] origy; 
    input[27:0] origz; 
    output[31:0] rgData; 
    reg[31:0] rgData;

    output[3:0] rgAddr; 
    reg[3:0] rgAddr;
    output[2:0] rgWE; 
    reg[2:0] rgWE;
    output rgAddrValid; 
    reg rgAddrValid;
    input rgDone; 
    input globalreset; 
    input clk; 
    output[2:0] statepeek; 
    reg[2:0] statepeek;

    reg[3:0] state; 
    reg[3:0] next_state; 



    reg[31:0] temp_rgData;
    reg[2:0] temp_rgWE; 
    reg temp_rgAddrValid;
    reg temp_ack;
    reg[3:0] temp_rgAddr; 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          ack <= 1'b0 ; 
          rgWE <= 3'b000 ; 
          rgData <= 0;
          rgAddrValid <= 1'b0 ; 
          rgAddr <= 0;
       end
       else
       begin
          state <= next_state ; 

rgData <= temp_rgData;
rgWE <= temp_rgWE;
rgAddrValid <= temp_rgAddrValid;
ack <= temp_ack;
rgAddr <= temp_rgAddr;

       end 
    end 

    always @(state or ack or as or rgDone)
    begin

       case (state)
          0 :
                   begin
                      if ((as == 1'b1) & (ack == 1'b0))
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                      statepeek = 3'b001 ; 

                         if ((as == 1'b1) & (ack == 1'b0))
                         begin
                            temp_rgData = {4'b0000, origx} ; 
                            temp_rgWE = 3'b001 ; 
                            temp_rgAddrValid = 1'b1 ; 
                            temp_rgAddr = addr ; 
                         end 
                         if (as == 1'b0 & ack == 1'b1)
                         begin
                            temp_ack = 1'b0 ; 
                         end 

                   end
          1 :
                   begin
                      if (rgDone == 1'b1)
                      begin
                         next_state = 6 ; 
                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 
                      statepeek = 3'b010 ; 

                         if (rgDone == 1'b1)
                         begin
                            temp_rgAddrValid = 1'b0 ; 
                         end 

                   end
          2 :
                   begin
                      if (rgDone == 1'b1)
                      begin
                         next_state = 7 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 
                      statepeek = 3'b011 ; 

                         if (rgDone == 1'b1)
                         begin
                            temp_rgAddrValid = 1'b0 ; 
                         end 

                   end
           3 :
                   begin
                      if (rgDone == 1'b1)
                      begin
                         next_state = 8 ; 
                      end
                      else
                      begin
                         next_state = 3 ; 
                      end 
                      statepeek = 3'b100 ; 

                         if (rgDone == 1'b1)
                         begin
                            temp_rgAddrValid = 1'b0 ; 
                         end 

                   end
         4 :
                   begin
                      if (rgDone == 1'b1)
                       begin
                         next_state = 9 ; 
                      end
                      else
                      begin
                         next_state = 4 ; 
                      end 
                      statepeek = 3'b101 ; 

                         if (rgDone == 1'b1)
                         begin
                            temp_rgAddrValid = 1'b0 ; 
                         end 
                   end

          5 :
                   begin
                      if (rgDone == 1'b1)
                      begin
                         next_state = 0 ; 
                      end
                      else
                      begin
                         next_state = 5 ; 
                      end 
                      statepeek = 3'b110 ; 

                         temp_ack = 1'b1 ; 
                         if (rgDone == 1'b1)
                         begin
                            temp_rgAddrValid = 1'b0 ; 
                         end 

                   end

          6 :
                   begin
                      next_state = 2 ; 

                         temp_rgData = {4'b0000, origy} ; 
                         temp_rgWE = 3'b010 ; 
                         temp_rgAddrValid = 1'b1 ; 

                   end
          7 :
                   begin
                      next_state = 3 ; 

                         temp_rgData = {4'b0000, origz} ; 
                         temp_rgWE = 3'b011 ; 
                         temp_rgAddrValid = 1'b1 ; 
                   end
          8 :
                   begin
                      next_state = 4 ; 

                         temp_rgData = {dir[31:16], dir[47:32]} ; 
                         temp_rgWE = 3'b100 ; 
                         temp_rgAddrValid = 1'b1 ; 
                   end
           9 :
                   begin
                      next_state = 5 ; 

                         temp_rgData = {16'b0000000000000000, dir[15:0]} ; 
                          temp_rgWE = 3'b101 ; 
                         temp_rgAddrValid = 1'b1 ; 
                   end
       endcase 
    end 
 endmodule
