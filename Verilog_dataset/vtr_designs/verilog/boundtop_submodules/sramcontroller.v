`define SIMULATION_MEMORY

 module sramcontroller (want_addr, addr_ready, addrin, want_data, data_ready, datain, addr, addrvalid, data, datavalid, tm3_sram_data_in, tm3_sram_data_out, tm3_sram_addr, tm3_sram_we, tm3_sram_oe, tm3_sram_adsp, globalreset, clk, statepeek);

    output want_addr; 
    reg want_addr;
    input addr_ready; 
    input[17:0] addrin; 
    output want_data; 
    reg want_data;
    input data_ready; 
    input[63:0] datain; 
    input[17:0] addr; 
    input addrvalid; 

    output[63:0] data; 
    reg[63:0] data;
    reg[63:0] temp_data;
    output datavalid; 
    reg datavalid;
    reg temp_datavalid;
    input[63:0] tm3_sram_data_in; 
    wire[63:0] tm3_sram_data_in;
    output[63:0] tm3_sram_data_out; 
    wire[63:0] tm3_sram_data_out;
    reg[63:0] tm3_sram_data_xhdl0;
    output[18:0] tm3_sram_addr; 
    reg[18:0] tm3_sram_addr;
    output[7:0] tm3_sram_we; 
    reg[7:0] tm3_sram_we;
    output[1:0] tm3_sram_oe; 

    reg[1:0] tm3_sram_oe;
    output tm3_sram_adsp; 
    reg tm3_sram_adsp;
    input globalreset; 
    input clk; 
    output[2:0] statepeek; 
    reg[2:0] statepeek;
    reg[2:0] temp_statepeek;

    reg[2:0] state; 
    reg[2:0] next_state; 
    reg[17:0] waddress; 
    reg[17:0] temp_waddress; 

    assign tm3_sram_data_out = tm3_sram_data_xhdl0;

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)

       begin
          state <= 0 ; 
          waddress <= 0;
          data <= 0;
          datavalid <= 1'b0 ; 
       end
       else
       begin
          state <= next_state ; 
			statepeek <= temp_statepeek;
		data <=temp_data;
        datavalid <=temp_datavalid;
           waddress <= temp_waddress;
       end 
    end 

    always @(state or addr_ready or data_ready or waddress or datain or addrvalid or 
             datavalid or addr)
    begin
       case (state)
          0 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_data_xhdl0 = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b0 ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else if (addrvalid == 1'b1 & datavalid == 1'b0)
                      begin
                         next_state = 5 ; 

                         tm3_sram_addr = {1'b0, addr} ; 
                         tm3_sram_adsp = 1'b0 ; 
                         tm3_sram_oe = 2'b01 ; 
                      end

                      else
                      begin
                         next_state = 0 ; 
                      end 

                      temp_statepeek = 3'b001 ; 
                         if (addr_ready == 1'b1)
                         begin
                            temp_waddress = addrin ; 
                         end 
                         if (addrvalid == 1'b0)
                         begin
                            temp_datavalid = 1'b0 ; 
                         end 

                   end
          1 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b11 ; 
				       tm3_sram_adsp = 1'b1 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = 0;
                      want_addr = 1'b0 ; 
                      want_data = 1'b1 ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 

                      temp_statepeek = 3'b010 ; 
                   end
          2 :
                   begin
				       tm3_sram_oe = 2'b11 ; 
				       want_addr = 1'b1 ; 
                      want_data = 1'b1 ; 
                      tm3_sram_addr = {1'b0, waddress} ; 
                      tm3_sram_data_xhdl0 = datain ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 4 ; 
                      end
                      else if (data_ready == 1'b1)
                      begin

                         tm3_sram_we = 8'b00000000 ; 
                         tm3_sram_adsp = 1'b0 ; 
                         next_state = 3 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 
                      temp_statepeek = 3'b011 ; 
   if (data_ready == 1'b1)

                         begin
                            temp_waddress = waddress + 1 ; 
                         end 

                   end
          3 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b11 ; 
				       tm3_sram_adsp = 1'b1 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b0 ; 
                      if (data_ready == 1'b1)

                      begin
                         next_state = 3 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 
                      temp_statepeek = 3'b100 ; 
                   end
          4 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b11 ; 
				       tm3_sram_adsp = 1'b1 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = 0;
				       want_data = 1'b0 ; 
                      want_addr = 1'b0 ; 
                      if (addr_ready == 1'b1)

                      begin
                         next_state = 4 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                      temp_statepeek = 3'b101 ; 
                   end
          5 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b11 ; 
				       tm3_sram_adsp = 1'b1 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b0 ; 
                      next_state = 0 ; 
                      temp_statepeek = 3'b110 ; 
					   temp_data = tm3_sram_data_in ; 
                         temp_datavalid = 1'b1 ; 

                   end


       endcase 
    end 
 endmodule
