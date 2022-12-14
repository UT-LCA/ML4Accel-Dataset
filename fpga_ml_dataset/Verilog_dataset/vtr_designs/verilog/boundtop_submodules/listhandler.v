`define SIMULATION_MEMORY

module listhandler (dataarrayin, commit, hitmask, ack, boundnodeID, level, empty, dataready, reset, globalreset, clk, peekoffset0, peekoffset1, peekoffset2, peekhit, peekstate);

    input[8 * 13 - 1:0] dataarrayin; 
    input commit; 
    input[2:0] hitmask; 
    input ack; 
    output[9:0] boundnodeID; 
    wire[9:0] boundnodeID;
    output[1:0] level; 
    wire[1:0] level;

    output empty; 
    wire empty;
    output dataready; 
    wire dataready;
    input reset; 
    input globalreset; 
    input clk; 
    output[2:0] peekoffset0; 
    wire[2:0] peekoffset0;
    output[2:0] peekoffset1; 
    wire[2:0] peekoffset1;
    output[2:0] peekoffset2; 

    wire[2:0] peekoffset2;
    output peekhit; 
    wire peekhit;
    output[1:0] peekstate; 
    reg[1:0] peekstate;
    reg[1:0] temp_peekstate;

    reg[1:0] next_state; 
    reg[1:0] state; 
    reg[1:0] readlevel; 

    reg[1:0] writelevel; 
    reg[2:0] offset0; 
    reg[2:0] offset1; 
    reg[2:0] offset2; 
    reg[4:0] address; 
    reg we; 
    reg[12:0] datain; 
    wire[12:0] dataout; 
    reg[2:0] lvempty; 
    reg busy; 
    reg temp_busy; 
    reg[2:0] temp_lvempty; 
    reg[1:0] temp_readlevel; 
    reg[1:0] temp_writelevel; 
    reg[2:0] temp_offset0; 
    reg[2:0] temp_offset1; 
    reg[2:0] temp_offset2; 

    // Debug Stuff

    assign peekoffset0 = offset0 ;
    assign peekoffset1 = offset1 ;
    assign peekoffset2 = offset2 ;
    assign peekhit = ((datain[10]) == 1'b1 | (datain[11]) == 1'b1 | (datain[12]) == 1'b1) ? 1'b1 : 1'b0 ;

    // Real Code

    spram  ram(we, dataout, datain, clk); 

    assign level = readlevel ;
    assign boundnodeID = dataout[9:0] ;

    assign empty = (lvempty == 3'b111 & busy == 1'b0) ? 1'b1 : 1'b0 ;
    assign dataready = ((((dataout[10]) == 1'b1 & (hitmask[0]) == 1'b1) | ((dataout[11]) == 1'b1 & (hitmask[1]) == 1'b1) | ((dataout[12]) == 1'b1 & (hitmask[2]) == 1'b1)) & (empty == 1'b0) & (busy == 1'b0)) ? 1'b1 : 1'b0 ;

    always @(offset0 or offset1 or offset2 or address)
    begin
	    address[4:3] = readlevel ;

       if (address[4:3] == 2'b00)
       begin
          address[2:0] = offset0 ; 
       end
       else if (address[4:3] == 2'b01)
       begin

          address[2:0] = offset1 ; 
       end
       else if (address[4:3] == 2'b10)
       begin
          address[2:0] = offset2 ; 
       end
       else
       begin
          address[2:0] = 0;
       end 
    end 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          lvempty <= 1;
          busy <= 1'b0 ; 
          readlevel <= 2'b00 ; 
          writelevel <= 2'b00 ; 
          offset0 <= 3'b000 ; 
          offset1 <= 3'b000 ; 
          offset2 <= 3'b000 ; 

       end
       else
       begin
          state <= next_state ; 
          peekstate <= temp_peekstate ; 
		busy <= temp_busy;
        lvempty <= temp_lvempty;
       readlevel <= temp_readlevel;
       writelevel <= temp_writelevel;
       offset0 <= temp_offset0;
       offset1 <= temp_offset1;
       offset2 <= temp_offset2;

       end 
    end 

    always @(state or commit or ack or address or dataarrayin or reset or dataready or 
             empty)
    begin

       case (state)
          2'b00 :
                   begin
				       we = 1'b0 ; 
				       datain = 0;
                      if (reset == 1'b1)
                      begin
                         next_state = 0 ; 
                      end
                      else if (commit == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else if ((ack == 1'b1) | (dataready == 1'b0 & empty == 1'b0))

                      begin
                         next_state = 2 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
                      temp_peekstate = 2'b01 ; 

                         if (reset == 1'b1)
                         begin
                            temp_busy = 1'b0 ; 
                            temp_lvempty = 1;
                            temp_readlevel = 2'b00 ; 

                            temp_writelevel = 2'b00 ; 
                            temp_offset0 = 3'b000 ; 
                            temp_offset1 = 3'b000 ; 
                            temp_offset2 = 3'b000 ; 
                         end
                         else if (commit == 1'b1)
                         begin
                            temp_busy = 1'b1 ; 
                            if (writelevel == 2'b00)
                            begin
                               temp_offset0 = 3'b000 ; 
                            end

                            else if (writelevel == 2'b01)
                            begin
                               temp_offset1 = 3'b000 ; 
                            end
							else if (writelevel == 2'b10)
                            begin
                               temp_offset2 = 3'b000 ; 
                            end 
                            temp_readlevel = writelevel ; 
                         end

                         else if (ack == 1'b1)
                         begin
                            temp_writelevel = readlevel + 1 ; 
                            temp_busy = 1'b1 ; // This will ensure that align skips one
                         end 

                   end
          2'b01 :
                   begin
/* PAJ -- Unrolled loop */
						if (address[2:0] == 0)
						begin
   	                     datain = dataarrayin[(1) * 13 - 1:0 * 13] ; 
						end
						else if ( address[2:0] == 1)
						begin
   	                     datain = dataarrayin[(2) * 13 - 1:1 * 13] ; 
						end
						else if ( address[2:0] ==2)
						begin
   	                     datain = dataarrayin[(3) * 13 - 1:2 * 13] ; 
						end
						else if ( address[2:0] ==3)
						begin
   	                     datain = dataarrayin[(4) * 13 - 1:3 * 13] ; 
						end
						else if ( address[2:0] ==4)
						begin
   	                     datain = dataarrayin[(5) * 13 - 1:4 * 13] ; 
						end
						else if ( address[2:0] ==5)
						begin
   	                     datain = dataarrayin[(6) * 13 - 1:5 * 13] ; 
						end
						else if ( address[2:0] ==6)
						begin
   	                     datain = dataarrayin[(7) * 13 - 1:6 * 13] ; 
						end
						else if ( address[2:0] ==7)
						begin
   	                     datain = dataarrayin[(8) * 13 - 1:7 * 13] ; 
						end


                      we = 1'b1 ; 
                      if (address[2:0] == 3'b111)
                      begin
                         next_state = 2 ; 

                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 
                      temp_peekstate = 2'b10 ; 

                         if (readlevel == 2'b00)
                         begin
                            temp_offset0 = offset0 + 1 ; 
                         end

                         else if (readlevel == 2'b01)
                         begin
                            temp_offset1 = offset1 + 1 ; 
                         end
                         else if (readlevel == 2'b10)
                         begin
                            temp_offset2 = offset2 + 1 ; 
                         end 
                         if (address[2:0] == 3'b111)
                         begin
                            temp_busy = 1'b0 ; 
                         end 

                         if ((datain[10]) == 1'b1 | (datain[11]) == 1'b1 | (datain[12]) == 1'b1)
                         begin
                            if (readlevel == 2'b00)
                            begin
                               temp_lvempty[0] = 1'b0 ; 
                            end
                            else if (readlevel == 2'b01)
                            begin
                               temp_lvempty[1] = 1'b0 ; 
                            end
                            else if (readlevel == 2'b10)
                            begin

                               temp_lvempty[2] = 1'b0 ; 
                            end 
                         end 

                   end
          2'b10 :
	begin
		if (empty == 1'b0 & dataready == 1'b0)
		begin
			next_state = 2 ; 
		end
		else
			next_state = 0 ; 
		
		temp_peekstate = 2'b11 ; 
		temp_busy = 1'b0 ; 
		if (empty == 1'b0 & dataready == 1'b0)
		begin
			if (readlevel == 2'b00)
			begin
				if (offset0 == 3'b111)
				begin
					temp_lvempty[0] = 1'b1 ; 
				end
				else
				begin
					temp_offset0 = offset0 + 1 ; 
				end 
			end
			else if (readlevel == 2'b01)
			begin
				if (offset1 == 3'b111)
				begin
					temp_lvempty[1] = 1'b1 ; 
					temp_readlevel = 2'b00 ; 
				end
				else
				begin
					temp_offset1 = offset1 + 1 ; 
				end 
			end
			else if (readlevel == 2'b10)
			begin
				if (offset2 == 3'b111)
				begin
					temp_lvempty[2] = 1'b1 ; 
					if ((lvempty[1]) == 1'b1)
					begin
						temp_readlevel = 2'b00 ; 
					end
					else
					begin
						temp_readlevel = 2'b01 ; 
					end
				end
				else
				begin
					temp_offset2 = offset2 + 1 ; 
				end 
			end
		end
	end
	endcase
end
endmodule
 module spram (we, dataout, datain, clk);

    input we; 
    output[13 - 1:0] dataout; 
    wire[13 - 1:0] dataout;
    input[13 - 1:0] datain; 
    input clk; 
    reg[13 - 1:0] temp_reg; 

    reg[13 - 1:0] mem1; 
    reg[13 - 1:0] mem2; 

    assign dataout = mem2 ;

    always @(posedge clk)
    begin
		temp_reg <= 0;
       if (we == 1'b1)
       begin
          mem1 <= datain + temp_reg; 
          mem2 <= mem1;
       end  
    end 
 endmodule
