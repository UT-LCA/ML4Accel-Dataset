`define SIMULATION_MEMORY

 module raygencont (go, initcount, busyout, cycles, nextaddr, nas0, nas1, page, dirReady, wantDir, dirIn, addrIn, as, addr, ack, dir, raygroup0, raygroupvalid0, busy0, raygroup1, raygroupvalid1, busy1, globalreset, clk, statepeek);

    input go; 
    input[14:0] initcount; 
    output busyout; 
    wire busyout;
    reg temp_busyout;
    output[30:0] cycles; 
    reg[30:0] cycles;
    output[17:0] nextaddr; 
    wire[17:0] nextaddr;
    output nas0; 

    wire nas0;
    reg temp_nas0;
    output nas1; 
    wire nas1;
    reg temp_nas1;
    input page; 
    input dirReady; 
    output wantDir; 
    reg wantDir;
    input[47:0] dirIn; 
    input[14:0] addrIn; 
    output as; 
    reg as;
    output[3:0] addr; 

    reg[3:0] addr;
    input ack; 
    output[47:0] dir; 
    reg[47:0] dir;
    output[1:0] raygroup0; 
    wire[1:0] raygroup0;
    output raygroupvalid0; 
    reg raygroupvalid0;
    input busy0; 
    output[1:0] raygroup1; 
    wire[1:0] raygroup1;
    output raygroupvalid1; 

    reg raygroupvalid1;
    input busy1; 
    input globalreset; 
    input clk; 
    output[2:0] statepeek; 
    reg[2:0] statepeek;


    reg[2:0] state; 
    reg[2:0] next_state; 
    reg[14:0] count; 
    reg first; 
    reg[17:0] destaddr; 
    wire[1:0] busy; 
    reg[1:0] loaded; 
    reg[1:0] groupID; 
    reg active; 

    reg[47:0] temp_dir;
    reg[30:0] temp_cycles;
    reg[1:0] temp_addr;
    reg[1:0] temp_loaded; 
    reg[1:0] temp_groupID; 
    reg[14:0] temp_count; 
    reg temp_active; 
    reg temp_raygroupvalid1;
    reg temp_raygroupvalid0;

    assign busy = {busy1, busy0} ;

    always @(posedge clk)
    begin

       if (globalreset == 1'b1)

       begin
          state <= 0 ; 
          cycles <= 0;
          dir <= 0;
          addr[1:0] <= 2'b00 ; 
          groupID <= 2'b00 ; 
          count <= 0;
          first <= 1'b0 ; 
          destaddr <= 0;
          raygroupvalid0 <= 1'b0 ; 
          raygroupvalid1 <= 1'b0 ; 
          loaded <= 2'b00 ; 

          active <= 1'b0 ; 
       end
       else
       begin
    	addr[3:2] <= (active == 1'b0) ? {1'b0, groupID[0]} : {1'b1, groupID[1]} ;
	addr[1:0] <= temp_addr[1:0];
        state <= next_state ; 

	dir <= temp_dir;
	cycles <= temp_cycles;
	loaded <= temp_loaded;	
	groupID <= temp_groupID;
	count <= temp_count;
	active <= temp_active;
	raygroupvalid0 <= temp_raygroupvalid0;
	raygroupvalid1 <= temp_raygroupvalid1;

       end 
    end 

    assign raygroup0 = {1'b0, groupID[0]} ;
    assign raygroup1 = {1'b1, groupID[1]} ;
    assign nextaddr = {2'b11, page, addrIn} ;
    assign busyout = temp_busyout;
    assign nas0 = temp_nas0;
    assign nas1 = temp_nas1;

    always @(state or go or ack or busy or dirReady or addr or count or loaded)
    begin
       case (state)
          0 :
                   begin
       				as = 1'b0 ; 
       				wantDir = 1'b0 ; 
                      if (go == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                      statepeek = 3'b001 ; 
						temp_busyout = 1'b0;
						temp_nas0 = 1'b0;
						temp_nas1 = 1'b0;


                         if (go == 1'b1)
                         begin
                            temp_cycles = 0;
                         end 
                         temp_addr[1:0] = 2'b00 ; 
                         temp_loaded = 2'b00 ; 
                         temp_groupID = 2'b00 ; 
                         temp_count = initcount ; 
                         temp_active = 1'b0 ; 

                   end
          1 :
                   begin
                      as = dirReady ; 
                      wantDir = 1'b1 ; 
                      if (dirReady == 1'b1)
                      begin
                         next_state = 2 ; 
                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 
                     statepeek = 3'b010 ; 
						temp_busyout = 1'b1;
    				if (addr[1:0] == 2'b00 & dirReady == 1'b1 & active == 1'b0) 
					begin
						 temp_nas0 = 1'b1;
						 temp_nas1 = 1'b1;
					end

                         temp_dir = dirIn ; 
                         if (dirReady == 1'b1 & addr[1:0] == 2'b10)
                         begin
                            if (active == 1'b0)
                            begin
                               temp_loaded[0] = 1'b1 ; 
                            end
                            else
                            begin
                               temp_loaded[1] = 1'b1 ; 
                            end 
                         end 
             temp_cycles = cycles + 1 ; 


                   end
          2 :
                   begin
                      wantDir = 1'b0 ; 
                      as = 1'b1 ; 
                      if ((ack == 1'b1) & (addr[1:0] != 2'b10))
                      begin
                         next_state = 1 ; 
                      end
                      else if (ack == 1'b1)
                      begin
                         if ((loaded[0]) == 1'b1 & (busy[0]) == 1'b0)
                         begin
                            next_state = 3 ; 
                         end
                         else if ((loaded[1]) == 1'b1 & (busy[1]) == 1'b0)
                         begin
                            next_state = 4 ; 
                         end
                         else if (loaded != 2'b11)
                         begin

                            next_state = 1 ; 
                         end
                         else
                         begin
                            next_state = 2 ; 
                         end 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 
                      statepeek = 3'b011 ; 
						temp_busyout = 1'b1;
						temp_nas0 = 1'b0;
						temp_nas1 = 1'b0;

                         if ((ack == 1'b1) & (addr[1:0] != 2'b10))
                         begin
                            temp_addr[1:0] = addr[1:0] + 2'b01 ; 
                         end 
                         else if ((ack == 1'b1) & addr[1:0] == 2'b10)
                         begin
                            if ((loaded[0]) == 1'b1 & (busy[0]) == 1'b0)
                            begin
                               temp_raygroupvalid0 = 1'b1 ; 
                            end
                            else if ((loaded[1]) == 1'b1 & (busy[1]) == 1'b0)
                            begin

                               temp_raygroupvalid1 = 1'b1 ; 
                            end
                            else if ((loaded[0]) == 1'b0)
                            begin
                               temp_active = 1'b0 ; 
                               temp_addr[1:0] = 2'b00 ; 
                            end
                            else if ((loaded[1]) == 1'b0)
                            begin
                               temp_active = 1'b1 ; 
                               temp_addr[1:0] = 2'b00 ; 
                            end 
                         end 

             temp_cycles = cycles + 1 ; 
                   end
          4 :
                   begin
                      if ((busy[1]) == 1'b0)
                      begin
                         next_state = 4 ; 
                      end
                      else if ((loaded[0]) == 1'b1 & (busy[0]) == 1'b0)
                      begin
                         next_state = 3 ; 
                      end
                      else if (count > 0)
                      begin

                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                      statepeek = 3'b101 ; 
						temp_busyout = 1'b1;
						temp_nas0 = 1'b0;
						temp_nas1 = 1'b0;

                     if ((busy[1]) == 1'b1)
                         begin
                            temp_groupID[1] = ~groupID[1] ; 
                            temp_raygroupvalid1 = 1'b0 ; 
                            temp_count = count - 1 ; 
                            if ((loaded[0]) == 1'b1 & (busy[0]) == 1'b0)
                            begin
                               temp_raygroupvalid0 = 1'b1 ; 
                            end

                            else if ((loaded[0]) == 1'b0)
                            begin
                               temp_active = 1'b0 ; 
                            end
                            else
                            begin
                               temp_active = 1'b1 ; 
                            end 
                         end 
                         temp_loaded[1] = 1'b0 ; 
                         temp_addr[1:0] = 2'b00 ; 

             temp_cycles = cycles + 1 ; 
                   end
          3 :
                   begin
                      if ((busy[0]) == 1'b0)
                      begin
                         next_state = 3 ; 

                      end
                      else if ((loaded[1]) == 1'b1 & (busy[1]) == 1'b0)
                      begin
                         next_state = 4 ; 
                      end
                      else if (count > 0)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 

                      end 
                      statepeek = 3'b100 ; 
						temp_busyout = 1'b1;
						temp_nas0 = 1'b0;
						temp_nas1 = 1'b0;

                         if ((busy[0]) == 1'b1)
                         begin
                            temp_groupID[0] = ~groupID[0] ; 
                            temp_raygroupvalid0 = 1'b0 ; 
                            temp_count = count - 1 ; 
                            if ((loaded[1]) == 1'b1 & (busy[1]) == 1'b0)
                            begin
                               temp_raygroupvalid1 = 1'b1 ; 

                            end
                            else if ((loaded[1]) == 1'b0)
                            begin
                               temp_active = 1'b1 ; 
                            end
                            else
                            begin
                               temp_active = 1'b0 ; 
                            end 
                         end 
                         temp_loaded[0] = 1'b0 ; 
                         temp_addr[1:0] = 2'b00 ; 


             temp_cycles = cycles + 1 ; 
                   end
       endcase 
    end 
 endmodule
