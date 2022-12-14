`define SIMULATION_MEMORY

module resulttransmit (valid01, valid10, id01a, id01b, id01c, id10a, id10b, id10c, hit01a, hit01b, hit01c, hit10a, hit10b, hit10c, u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, rgResultData, rgResultReady, rgResultSource, globalreset, clk);

    input valid01; 
    input valid10; 
    input[15:0] id01a; 
    input[15:0] id01b; 
    input[15:0] id01c; 
    input[15:0] id10a; 
    input[15:0] id10b; 
    input[15:0] id10c; 
    input hit01a; 
    input hit01b; 

    input hit01c; 
    input hit10a; 
    input hit10b; 
    input hit10c; 
    input[15:0] u01a; 
    input[15:0] u01b; 
    input[15:0] u01c; 
    input[15:0] v01a; 
    input[15:0] v01b; 
    input[15:0] v01c; 
    input[15:0] u10a; 
    input[15:0] u10b; 

    input[15:0] u10c; 
    input[15:0] v10a; 
    input[15:0] v10b; 
    input[15:0] v10c; 
    output[31:0] rgResultData; 
    reg[31:0] rgResultData;
    output rgResultReady; 
    reg rgResultReady;
    output[1:0] rgResultSource; 
    reg[1:0] rgResultSource;
    input globalreset; 
    input clk; 

    reg[3:0] state; 
    reg[3:0] next_state; 

    reg hit01al; 
    reg hit01bl; 
    reg hit01cl; 
    reg hit10al; 
    reg hit10bl; 
    reg hit10cl; 
    reg pending01; 
    reg pending10; 
    reg valid01d; 
    reg valid10d; 

reg[31:0] temp_rgResultData;
   reg temp_rgResultReady;
      reg[1:0] temp_rgResultSource;

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          pending01 <= 1'b0 ; 
          pending10 <= 1'b0 ; 
          rgResultData <= 32'b00000000000000000000000000000000 ; 
          rgResultSource <= 2'b00 ; 

          rgResultReady <= 1'b0 ; 
       end
       else
       begin
          valid01d <= valid01 ; 
          valid10d <= valid10 ; 
          if (valid01 == 1'b1)
          begin
             pending01 <= 1'b1 ; 
          end 
          if (valid01d == 1'b1)
          begin
             hit01al <= hit01a ; 
             hit01bl <= hit01b ; 
             hit01cl <= hit01c ; 
          end 
          if (valid10 == 1'b1)
          begin
             pending10 <= 1'b1 ; 
          end 
          if (valid10d == 1'b1)
          begin
             hit10al <= hit10a ; 
             hit10bl <= hit10b ; 
             hit10cl <= hit10c ; 
          end 
          state <= next_state ; 

          rgResultData <= temp_rgResultData;
          rgResultReady <= temp_rgResultReady;
          rgResultSource <= temp_rgResultSource;
       end 
    end 

    always @(state or pending01 or pending10)
    begin
       case (state)
          0 :
                   begin
                      if (pending01 == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else if (pending10 == 1'b1)
                      begin
                         next_state = 5 ; 
                      end
                      else

                      begin
                         next_state = 0 ; 
                      end 
                   end
          1 :
                   begin
                      next_state = 2 ; 
                         temp_rgResultData = {id01a, id01b} ; 
                         temp_rgResultReady = 1'b1 ; 
                         temp_rgResultSource = 2'b01 ; 
                   end
          2 :
                   begin
                      next_state = 3 ; 
                         temp_rgResultData = {13'b0000000000000, hit01al, hit01bl, hit01cl, id01c} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b01 ; 
                   end

          3 :
                   begin
                      next_state = 4 ; 
                         temp_rgResultData = {8'b00000000, u01a[15:8], u01b[15:8], u01c[15:8]} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b01 ; 
                   end
          4 :
                   begin
                      next_state = 0 ; 
                         temp_rgResultData = {8'b00000000, v01a[15:8], v01b[15:8], v01c[15:8]} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b01 ; 
                   end
          5 :
                   begin
                      next_state = 6 ; 
                         temp_rgResultData = {id10a, id10b} ; 
                         temp_rgResultReady = 1'b1 ; 
                         temp_rgResultSource = 2'b10 ; 
                   end
          6 :
                   begin
                      next_state = 7 ; 
                         temp_rgResultData = {13'b0000000000000, hit10al, hit10bl, hit10cl, id10c} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b10 ; 
                   end
          7 :
                   begin
                      next_state = 8 ; 
                         temp_rgResultData = {8'b00000000, u10a[15:8], u10b[15:8], u10c[15:8]} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b10 ; 
                   end
          8 :
                   begin
                      next_state = 0 ; 
                         temp_rgResultData = {8'b00000000, v10a[15:8], v10b[15:8], v10c[15:8]} ; 
                         temp_rgResultReady = 1'b0 ; 
                         temp_rgResultSource = 2'b10 ; 
                   end
	default:
		begin
			temp_rgResultReady = u01a || u01b || u01c || v01a || v01b || v01c || u10a || u10b || u10c || v10a || v10b || v10c;  
		end
       endcase 
    end 
 endmodule
