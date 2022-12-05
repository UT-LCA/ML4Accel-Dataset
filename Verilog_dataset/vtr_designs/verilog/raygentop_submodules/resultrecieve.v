`define SIMULATION_MEMORY

 module resultrecieve (valid01, valid10, id01a, id01b, id01c, id10a, id10b, id10c, hit01a, hit01b, hit01c, hit10a, hit10b, hit10c, u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, rgResultData, rgResultReady, rgResultSource, globalreset, clk);

    output valid01; 
    reg valid01;
    output valid10; 
    reg valid10;
    output[15:0] id01a; 
    reg[15:0] id01a;
    output[15:0] id01b; 
    reg[15:0] id01b;
    output[15:0] id01c; 
    reg[15:0] id01c;

    output[15:0] id10a; 
    reg[15:0] id10a;
    output[15:0] id10b; 
    reg[15:0] id10b;
    output[15:0] id10c; 
    reg[15:0] id10c;
    output hit01a; 
    reg hit01a;
    output hit01b; 
    reg hit01b;
    output hit01c; 
    reg hit01c;

    output hit10a; 
    reg hit10a;
    output hit10b; 
    reg hit10b;
    output hit10c; 
    reg hit10c;
    output[7:0] u01a; 
    reg[7:0] u01a;
    output[7:0] u01b; 
    reg[7:0] u01b;
    output[7:0] u01c; 
    reg[7:0] u01c;

    output[7:0] v01a; 
    reg[7:0] v01a;
    output[7:0] v01b; 
    reg[7:0] v01b;
    output[7:0] v01c; 
    reg[7:0] v01c;
    output[7:0] u10a; 
    reg[7:0] u10a;
    output[7:0] u10b; 
    reg[7:0] u10b;
    output[7:0] u10c; 
    reg[7:0] u10c;

    output[7:0] v10a; 
    reg[7:0] v10a;
    output[7:0] v10b; 
    reg[7:0] v10b;
    output[7:0] v10c; 
    reg[7:0] v10c;
    input[31:0] rgResultData; 
    input rgResultReady; 
    input[1:0] rgResultSource; 
    input globalreset; 
    input clk; 

    reg temp_valid01;
    reg temp_valid10;
    reg[15:0] temp_id01a;
    reg[15:0] temp_id01b;
    reg[15:0] temp_id01c;
    reg[15:0] temp_id10a;
    reg[15:0] temp_id10b;
    reg[15:0] temp_id10c;
    reg temp_hit01a;
    reg temp_hit01b;
    reg temp_hit01c;
    reg temp_hit10a;
    reg temp_hit10b;
    reg temp_hit10c;
    reg[7:0] temp_u01a;
    reg[7:0] temp_u01b;
    reg[7:0] temp_u01c;
    reg[7:0] temp_v01a;
    reg[7:0] temp_v01b;
    reg[7:0] temp_v01c;
    reg[7:0] temp_u10a;
    reg[7:0] temp_u10b;
    reg[7:0] temp_u10c;
    reg[7:0] temp_v10a;
    reg[7:0] temp_v10b;
    reg[7:0] temp_v10c;


    reg[2:0] state; 
    reg[2:0] next_state; 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          valid01 <= 1'b0 ; 
          valid10 <= 1'b0 ; 
          hit01a <= 1'b0 ; 
          hit01b <= 1'b0 ; 
          hit01c <= 1'b0 ; 
          hit10a <= 1'b0 ; 
          hit10b <= 1'b0 ; 
          hit10c <= 1'b0 ; 
          id01a <= 0;

          id01b <= 0;
          id01c <= 0;
          id10a <= 0;
          id10b <= 0;
          id10c <= 0;
          u01a <= 0;
          u01b <= 0;
          u01c <= 0;
          v01a <= 0;
          v01b <= 0;
          v01c <= 0;
          u10a <= 0;

          u10b <= 0;
          u10c <= 0;
          v10a <= 0;
          v10b <= 0;
          v10c <= 0;
       end
       else
       begin
          state <= next_state ; 

valid01 <= temp_valid01;
valid10 <= temp_valid10;
id01a <= temp_id01a;
id01b <= temp_id01b;
id01c <= temp_id01c;
hit01a <= temp_hit01a;
hit01b <= temp_hit01b;
hit01c <= temp_hit01c;
u01a <= temp_u01a;
u01b <= temp_u01b;
u01c <= temp_u01c;
u10a <= temp_u10a;
u10b <= temp_u10b;
u10c <= temp_u10c;
v01a <= temp_v01a;
v01b <= temp_v01b;
v01c <= temp_v01c;
v10a <= temp_v10a;
v10b <= temp_v10b;
v10c <= temp_v10c;
hit10a <= temp_hit10a;
hit10b <= temp_hit10b;
hit10c <= temp_hit10c;
       end 
    end 


    always @(state or rgResultReady or rgResultSource)
    begin
       case (state)
          0 :
                   begin
                      if (rgResultReady == 1'b1 & rgResultSource == 2'b01)
                      begin
                         next_state = 1 ; 
                      end
                      else if (rgResultReady == 1'b1 & rgResultSource == 2'b10)
                      begin

                         next_state = 4 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 


			temp_valid01 = 1'b0 ; 
				          temp_valid10 = 1'b0 ; 
                         if (rgResultReady == 1'b1 & rgResultSource == 2'b01)
                         begin
                            temp_id01a = rgResultData[31:16] ; 
                            temp_id01b = rgResultData[15:0] ; 
                         end
                         else if (rgResultReady == 1'b1 & rgResultSource == 2'b10)
                         begin
                            temp_id10a = rgResultData[31:16] ; 
                            temp_id10b = rgResultData[15:0] ; 
                         end 

                   end

          1 :
                   begin
                      next_state = 2 ; 

			temp_valid01 = 1'b0 ; 
				          temp_valid10 = 1'b0 ; 
                         temp_id01c = rgResultData[15:0] ; 
                         temp_hit01a = rgResultData[18] ; 
                         temp_hit01b = rgResultData[17] ; 
                         temp_hit01c = rgResultData[16] ; 

                   end
          2 :

                   begin
                      next_state = 3 ; 

			temp_valid01 = 1'b0 ; 
				          temp_valid10 = 1'b0 ; 
                         temp_u01a = rgResultData[23:16] ; 
                         temp_u01b = rgResultData[15:8] ; 
                         temp_u01c = rgResultData[7:0] ; 

                   end
          3 :
                   begin
                      next_state = 0 ; 

				          temp_valid10 = 1'b0 ; 
                         temp_v01a = rgResultData[23:16] ; 
                         temp_v01b = rgResultData[15:8] ; 
                         temp_v01c = rgResultData[7:0] ; 
                         temp_valid01 = 1'b1 ; 

                   end
          4 :
                   begin
                      next_state = 5 ; 

          				temp_valid01 = 1'b0 ; 
				          temp_valid10 = 1'b0 ; 
                         temp_id10c = rgResultData[15:0] ; 

                         temp_hit10a = rgResultData[18] ; 
                         temp_hit10b = rgResultData[17] ; 
                         temp_hit10c = rgResultData[16] ; 

                   end
          5 :

                   begin
                      next_state = 6 ; 

          				temp_valid01 = 1'b0 ; 
				          temp_valid10 = 1'b0 ; 
                         temp_u10a = rgResultData[23:16] ; 
                         temp_u10b = rgResultData[15:8] ; 
                         temp_u10c = rgResultData[7:0] ; 

                   end
          6 :
                   begin
                      next_state = 0 ; 

      				temp_valid01 = 1'b0 ; 
                         temp_v10a = rgResultData[23:16] ; 
                         temp_v10b = rgResultData[15:8] ; 
                         temp_v10c = rgResultData[7:0] ; 
                         temp_valid10 = 1'b1 ; 

                   end
       endcase 
    end 
 endmodule
