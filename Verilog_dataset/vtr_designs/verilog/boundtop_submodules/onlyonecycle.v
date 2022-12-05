`define SIMULATION_MEMORY

 module onlyonecycle (trigger, output_xhdl0, globalreset, clk);

    input trigger; 
    output output_xhdl0; 
    reg output_xhdl0;
    input globalreset; 
    input clk; 

    reg[1:0] state; 
    reg[1:0] next_state; 
    reg[0:0] count; 
    reg[0:0] temp_count; 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          count <= 0 ; 

       end
       else
       begin
          state <= next_state ; 
		count <= temp_count;
       end 
    end 

    always @(state or trigger or count)
    begin
       case (state)
          0 :
                   begin
       				  output_xhdl0 = 1'b0 ; 
                      if (trigger == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                         temp_count = 1 - 1 ; 
                   end
          1 :
                   begin
                      output_xhdl0 = 1'b1 ; 
                      if (count == 0)
                      begin
                         next_state = 2 ; 
                      end
                      else

                      begin

                         next_state = 1 ; 
                      end 
                         temp_count = count - 1 ; 
                   end
          2 :
                   begin
       				  output_xhdl0 = 1'b0 ; 
                      if (trigger == 1'b0)
                      begin
                         next_state = 0 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 

                      end 
                   end
       endcase 
    end 
 endmodule
