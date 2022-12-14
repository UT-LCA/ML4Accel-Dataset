`define SIMULATION_MEMORY

module resultinterface (t1b, t2b, t3b, u1b, u2b, u3b, v1b, v2b, v3b, id1b, id2b, id3b, hit1b, hit2b, hit3b, resultID, newdata, resultready, resultdata, globalreset, clk);

    output[31:0] t1b; 
    reg[31:0] t1b;
    output[31:0] t2b; 
    reg[31:0] t2b;
    output[31:0] t3b; 
    reg[31:0] t3b;
    output[15:0] u1b; 
    reg[15:0] u1b;
    output[15:0] u2b; 
    reg[15:0] u2b;

    output[15:0] u3b; 
    reg[15:0] u3b;
    output[15:0] v1b; 
    reg[15:0] v1b;
    output[15:0] v2b; 
    reg[15:0] v2b;
    output[15:0] v3b; 
    reg[15:0] v3b;
    output[15:0] id1b; 
    reg[15:0] id1b;
    output[15:0] id2b; 
    reg[15:0] id2b;

    output[15:0] id3b; 
    reg[15:0] id3b;
    output hit1b; 
    reg hit1b;
    output hit2b; 
    reg hit2b;
    output hit3b; 
    reg hit3b;
    output[1:0] resultID; 
    reg[1:0] resultID;
    output newdata; 
    reg newdata;

    reg[31:0] temp_t1b;
    reg[31:0] temp_t2b;
    reg[31:0] temp_t3b;
    reg[15:0] temp_u1b;
    reg[15:0] temp_u2b;
    reg[15:0] temp_u3b;
    reg[15:0] temp_v1b;
    reg[15:0] temp_v2b;
    reg[15:0] temp_v3b;
    reg[15:0] temp_id1b;
    reg[15:0] temp_id2b;
    reg[15:0] temp_id3b;
    reg temp_hit1b;
    reg temp_hit2b;
    reg temp_hit3b;
    reg[1:0] temp_resultID;
    reg temp_newdata;

    input resultready; 
    input[31:0] resultdata; 
    input globalreset; 
    input clk; 

    reg[3:0] state; 
    reg[3:0] next_state; 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          t1b <= 0;
          t2b <= 0;
          t3b <= 0;
          u1b <= 0;
          u2b <= 0;
          u3b <= 0;
          v1b <= 0;

          v2b <= 0;
          v3b <= 0;
          id1b <= 0;
          id2b <= 0;
          id3b <= 0;
          hit1b <= 1'b0 ; 
          hit2b <= 1'b0 ; 
          hit3b <= 1'b0 ; 
          resultID <= 0;
          newdata <= 1'b0 ; 
       end
       else
       begin
          state <= next_state ; 

						t1b <= temp_t1b;
          				newdata <= temp_newdata;
                         u1b <= temp_u1b;
                         v1b <= temp_v1b;
                         id1b <= temp_id1b;
                         hit1b <= temp_hit1b;
                         resultID <= temp_resultID;
                         t2b <= temp_t2b;
                         u2b <= temp_u2b;
                         id2b <= temp_id2b;
                         t3b <= temp_t3b;
                         u3b <= temp_u3b;
                         v3b <= temp_v3b;
                         id3b <= temp_id3b;
                         hit3b <= temp_hit3b;
                         v2b <= temp_v2b;
                         hit2b <= temp_hit2b;
       end 
    end 

    always @(state or resultready)
    begin
       case (state)
          0 :
                   begin

                      if (resultready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
   				temp_newdata = 1'b0 ; 
                         if (resultready == 1'b1)
                         begin
                            temp_t1b = resultdata ; 
                         end 

                   end
          1 :
                   begin
                      next_state = 2 ; 
          				temp_newdata = 1'b0 ; 
                         temp_u1b = resultdata[31:16] ; 
                         temp_v1b = resultdata[15:0] ; 
                   end
          2 :
                   begin
                      next_state = 3 ; 
          				temp_newdata = 1'b0 ; 
                         temp_id1b = resultdata[15:0] ; 
                         temp_hit1b = resultdata[16] ; 
                         temp_resultID = resultdata[18:17] ; 
                   end
          3 :
                   begin

                      next_state = 4 ; 
          				temp_newdata = 1'b0 ; 
                         temp_t2b = resultdata ; 
                   end
          4 :
                   begin
                      next_state = 5 ; 
          				temp_newdata = 1'b0 ; 
                         temp_u2b = resultdata[31:16] ; 
                         temp_v2b = resultdata[15:0] ; 
                   end
          5 :
                   begin
                      next_state = 6 ; 
          				temp_newdata = 1'b0 ; 
                         temp_id2b = resultdata[15:0] ; 
                         temp_hit2b = resultdata[16] ; 
                   end
          6 :
                   begin

                      next_state = 7 ; 
          				temp_newdata = 1'b0 ; 
                         temp_t3b = resultdata ; 
                   end
          7 :
                   begin
                      next_state = 8 ; 
          				temp_newdata = 1'b0 ; 
                         temp_u3b = resultdata[31:16] ; 
                         temp_v3b = resultdata[15:0] ; 
                   end
          8 :
                   begin
                      next_state = 0 ; 
                         temp_id3b = resultdata[15:0] ; 
                         temp_hit3b = resultdata[16] ; 
                         temp_newdata = 1'b1 ; 
                   end
       endcase 
    end 

 endmodule
