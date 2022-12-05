`define SIMULATION_MEMORY

module boundcontroller (raygroupout, raygroupwe, raygroupid, enablenear, raygroup, validraygroup, busy, triIDvalid, triID, wanttriID, l0reset, baseaddress, newdata, boundNodeIDout, resultID, hitmask, ldataready, lempty, llevel, lboundNodeID, lack, lhreset, addrind, addrindvalid, dataind, dataindvalid, tladdr, tladdrvalid, tldata, tldatavalid, t1in, t2in, t3in, u1in, u2in, u3in, v1in, v2in, v3in, id1in, id2in, id3in, hit1in, hit2in, hit3in, t1, t2, t3, u1, u2, u3, v1, v2, v3, id1, id2, id3, hit1, hit2, hit3, bcvalid, done, resetcnt, passCTSout, passCTSin, globalreset, clk, statepeek, debugsubcount, debugcount);

	output[1:0] raygroupout; 
	wire[1:0] raygroupout;
	output raygroupwe; 
	reg raygroupwe;
	output[1:0] raygroupid; 
	reg[1:0] raygroupid;
	output enablenear; 
	reg enablenear;
	input[1:0] raygroup; 
	input validraygroup; 
	output busy; 
	reg busy;
	reg temp_busy;
	output triIDvalid; 
	reg triIDvalid;
	output[15:0] triID; 
	reg[15:0] triID;
	input wanttriID; 
	output l0reset; 
	reg l0reset;
	output[1:0] baseaddress; 
	reg[1:0] baseaddress;
	input newdata; 
	output[9:0] boundNodeIDout; 
	reg[9:0] boundNodeIDout;
	input[1:0] resultID; 
	output[2:0] hitmask; 
	reg[2:0] hitmask;
	input ldataready; 
	input lempty; 
	input[1:0] llevel; 
	input[9:0] lboundNodeID; 
	output lack; 
	reg lack;
	output lhreset; 
	reg lhreset;
	output[9:0] addrind; 
	reg[9:0] addrind;
	output addrindvalid; 
	reg addrindvalid;
	input[31:0] dataind; 
	input dataindvalid; 
	output[17:0] tladdr; 
	reg[17:0] tladdr;
	output tladdrvalid; 
	reg tladdrvalid;
	input[63:0] tldata; 
	input tldatavalid; 
	input[31:0] t1in; 
	input[31:0] t2in; 
	input[31:0] t3in; 
	input[15:0] u1in; 
	input[15:0] u2in; 
	input[15:0] u3in; 
	input[15:0] v1in; 
	input[15:0] v2in; 
	input[15:0] v3in; 
	input[15:0] id1in; 
	input[15:0] id2in; 
	input[15:0] id3in; 
	input hit1in; 
	input hit2in; 
	input hit3in; 
	output[31:0] t1; 
	reg[31:0] t1;
	output[31:0] t2; 
	reg[31:0] t2;
	output[31:0] t3; 
	reg[31:0] t3;
	output[15:0] u1; 
	reg[15:0] u1;
	output[15:0] u2; 
	reg[15:0] u2;
	output[15:0] u3; 
	reg[15:0] u3;
	output[15:0] v1; 
	reg[15:0] v1;
	output[15:0] v2; 
	reg[15:0] v2;
	output[15:0] v3; 
	reg[15:0] v3;
	output[15:0] id1; 
	reg[15:0] id1;
	output[15:0] id2; 
	reg[15:0] id2;
	output[15:0] id3; 
	reg[15:0] id3;
	output hit1; 
	reg hit1;
	output hit2; 
	reg hit2;
	output hit3; 
	reg hit3;
	output bcvalid; 
	reg bcvalid;
	input[1:0] done; 
	output resetcnt; 
	reg resetcnt;
	output passCTSout; 
	reg passCTSout;
	input passCTSin; 
	input globalreset; 
	input clk; 
	output[4:0] statepeek; 
	reg[4:0] statepeek;
	output[1:0] debugsubcount; 
	wire[1:0] debugsubcount;
	output[13:0] debugcount; 
	wire[13:0] debugcount;

	reg[4:0] state; 
	reg[4:0] next_state; 
	reg cts; 
	reg[11:0] addr; 
	reg[11:0] startAddr; 
	reg[2:0] resetcount; 
	reg[1:0] raygroupoutl; 
	// Leaf Node Signals
	reg[13:0] count; 
	reg[63:0] triDatalatch; 
	reg[1:0] subcount; 
	reg[1:0] maskcount; 

	reg[4:0] temp_statepeek;
	reg [1:0]temp_raygroupoutl ;
	reg temp_cts ;
	reg temp_passCTSout ;
	reg [2:0]temp_resetcount ;
	reg temp_l0reset ;
	reg [11:0]temp_addr ;
	reg [11:0]temp_startAddr ;
	reg [9:0]temp_boundNodeIDout ;
	reg [1:0]temp_baseaddress ;
	reg [2:0]temp_hitmask ;
	reg temp_hit1 ;
	reg temp_hit2 ;
	reg temp_hit3 ;
	reg temp_triIDvalid ;
	reg [15:0]temp_triID ;
	reg temp_lack ;
	reg [9:0]temp_addrind ;
	reg temp_addrindvalid ;
	reg temp_tladdrvalid ;
	reg [17:0]temp_tladdr ;
	reg [13:0]temp_count ;
	reg [1:0]temp_subcount ;
	reg [1:0]temp_maskcount ;
	reg [63:0]temp_triDatalatch ;
	reg [31:0]temp_t1 ;
	reg [15:0]temp_u1 ;
	reg [15:0]temp_v1 ;
	reg [15:0]temp_id1 ;
	reg [31:0]temp_t2 ;
	reg [15:0]temp_u2 ;
	reg [15:0]temp_v2 ;
	reg [15:0]temp_id2 ;
	reg [31:0]temp_t3 ;
	reg [15:0]temp_u3 ;
	reg [15:0]temp_v3 ;
	reg [15:0]temp_id3 ;

	assign debugsubcount = subcount ;
	assign debugcount = count ;
	assign raygroupout = (cts == 1'b1 & state != 8 & state != 19 & state != 1) ? raygroupoutl : 2'b00 ;

	always @(posedge clk)
	begin
		if (globalreset == 1'b1)
		begin
			state <= 0 ; 
			raygroupoutl <= 0;
			cts <= 1'b0 ; 
			passCTSout <= 1'b0 ; 
			addr <= 0;
			startAddr <= 0;
			boundNodeIDout <= 0;
			resetcount <= 0;
			hitmask <= 1;
			lack <= 1'b0 ; 
			baseaddress <= 0;
			l0reset <= 1'b0 ; 
			resetcnt <= 1'b0 ; 
			triIDvalid <= 1'b0 ; 
			triID <= 0;
			addrind <= 0;
			addrindvalid <= 1'b0 ; 
			tladdrvalid <= 1'b0 ; 
			tladdr <= 0;
			triDatalatch <= 0;
			maskcount <= 0;
			subcount <= 0;
			count <= 0;
			hit1 <= 1'b0 ; 
			hit2 <= 1'b0 ; 
			hit3 <= 1'b0 ; 
			t1 <= 0;
			t2 <= 0;
			t3 <= 0;
			u1 <= 0;
			u2 <= 0;
			u3 <= 0;
			v1 <= 0;
			v2 <= 0;
			v3 <= 0;
			id1 <= 0;
			id2 <= 0;
			id3 <= 0;
			busy <= 1'b0 ; 
		end
		else
		begin
			state <= next_state ; 
			busy <= temp_busy;
			if ((done == 2'b00) | (state == 15 & newdata == 1'b1 & resultID == 2'b00))
			begin
				resetcnt <= 1'b1 ; 
			end
			else
			begin
				resetcnt <= 1'b0 ; 
			end 

			statepeek <= temp_statepeek;
			raygroupoutl <= temp_raygroupoutl ;
			cts <= temp_cts ;
			passCTSout <= temp_passCTSout ;
			resetcount <= temp_resetcount ;
			l0reset <= temp_l0reset ;
			addr <= temp_addr ;
			startAddr <= temp_startAddr ;
			boundNodeIDout <= temp_boundNodeIDout ;
			baseaddress <= temp_baseaddress ;
			hitmask <= temp_hitmask ;
			hit1 <= temp_hit1 ;
			hit2 <= temp_hit2 ;
			hit3 <= temp_hit3 ;
			triIDvalid <= temp_triIDvalid ;
			triID <= temp_triID ;
			lack <= temp_lack ;
			addrind <= temp_addrind ;
			addrindvalid <= temp_addrindvalid ;
			tladdr <= temp_tladdr ;
			tladdrvalid <= temp_tladdrvalid ;
			count <= temp_count ;
			subcount <= temp_subcount ;
			maskcount <= temp_maskcount ;
			triDatalatch <= temp_triDatalatch ;
			t1 <= temp_t1 ;
			u1 <= temp_u1 ;
			v1 <= temp_v1 ;
			id1 <= temp_id1 ;
			t2 <= temp_t2 ;
			u2 <= temp_u2 ;
			v2 <= temp_v2 ;
			id2 <= temp_id2 ;
			t3 <= temp_t3 ;
			u3 <= temp_u3 ;
			v3 <= temp_v3 ;
			id3 <= temp_id3 ;
		end
	end



	always @*
	begin
		case (state)
		0 :
		begin
			raygroupid = 0;
			enablenear = 1'b0 ; 
			raygroupwe = 1'b0 ; 
			bcvalid = 1'b0 ; 

			lhreset = 1'b1 ; 
			if (validraygroup == 1'b1 & cts == 1'b1)
			begin
				next_state = 2 ; 
				temp_busy = 1'b1 ; 
			end
			else if (validraygroup == 1'b1 & cts == 1'b0)
			begin
				next_state = 1 ; 
				temp_busy = 1'b0 ; 
			end
			else if (validraygroup == 1'b0 & passCTSin == 1'b1 & cts == 1'b1)
			begin
				next_state = 1 ; 
				temp_busy = 1'b0 ; 
			end
			else
			begin
				next_state = 0 ; 
				temp_busy = 1'b0 ; 
			end 

			temp_statepeek = 5'b00001 ; 
			//
			temp_raygroupoutl = raygroup ; 
			if (validraygroup == 1'b1 & cts == 1'b0)
			begin
				temp_cts = 1'b1 ; 
				temp_passCTSout = 1'b1 ; 
			end
			else if (validraygroup == 1'b0 & cts == 1'b1 & passCTSin == 1'b1)
			begin
				temp_cts = 1'b0 ; 
				temp_passCTSout = 1'b1 ; 
			end 

		end
		1 :
		begin
			if ((passCTSin == cts) & (cts == 1'b1))
			begin
				next_state = 2 ; 
				temp_busy = 1'b1 ; 
			end
			else if (passCTSin == cts)
			begin
				next_state = 0 ; 
				temp_busy = 1'b0 ; 
			end
			else
			begin
				next_state = 1 ; 
				temp_busy = 1'b0 ; 
			end 

			temp_statepeek = 5'b00010 ; 
			//
			if (passCTSin == cts)
			begin
				temp_passCTSout = 1'b0 ; 
			end 

		end
		2 :
		begin
			if (wanttriID == 1'b1)
			begin
				next_state = 3 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 2 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b00011 ; 
			//
			temp_resetcount = 3'b100 ; 
			temp_l0reset = 1'b1 ; 
			temp_addr = 0;
			temp_startAddr = 0;
			temp_boundNodeIDout = 0;
			temp_baseaddress = 0;
			temp_hitmask = 1;
			temp_hit1 = 1'b0 ; 
			temp_hit2 = 1'b0 ; 
			temp_hit3 = 1'b0 ; 
		end
		3 :
		begin
			if ((addr - startAddr >= 1) & (addr - startAddr != 49))
			begin
				raygroupid = 2'b00 ; 
			end 
				next_state = 4 ; 
				temp_busy = 1'b1 ; 
			if (resetcount == 5)
			begin
				raygroupwe = 1'b1 ;                                                         
			end 
			enablenear = 1'b1 ; 
			temp_statepeek = 5'b00100 ; 
			//
			if ((addr - startAddr != 48) & (addr - startAddr != 49))
			begin
				temp_triIDvalid = 1'b1 ; 
			end 
			temp_triID = {4'b0000, addr} ; 
		end
		4 :
		begin
			if (addr - startAddr == 49)
			begin
				next_state = 6 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 5 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b00101 ;
		end
		5 :
		begin
			next_state = 3 ; 
			temp_busy = 1'b1 ; 

			temp_statepeek = 5'b00111 ;
			//
			temp_addr = addr + 1 ; 
			if (resetcount == 5)
			begin
				temp_resetcount = 3'b000 ; 
			end
			else
			begin
				temp_resetcount = resetcount + 1 ; 
			end 

		end
		6 :
		begin
			if (passCTSin == 1'b1 & cts == 1'b1)
			begin             
				next_state = 7;
				temp_busy = 1'b1 ; 
			end
			else if (done == 2'b00 & cts == 1'b0)
			begin
				next_state = 8;
				temp_busy = 1'b1 ; 
			end
			else if (done == 2'b00 & cts == 1'b1)
			begin
				next_state = 9;
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 6;
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01001 ;
			//
			if (passCTSin == 1'b1 & cts == 1'b1)
			begin
				temp_cts = 1'b0 ; 
				temp_passCTSout = 1'b1 ; 
			end
			else if (done == 2'b00 & cts == 1'b0)
			begin
				temp_cts = 1'b1 ; 
				temp_passCTSout = 1'b1 ; 
			end 

		end
		7 :
		begin
			if (passCTSin == 0)
			begin
				next_state = 6;
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 7;
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01001 ;
			//
			if (passCTSin == 1'b0)
			begin
				temp_passCTSout = 1'b0 ; 
			end 

		end
		8 :
		begin
			if (passCTSin == 1)
			begin
				next_state = 9;
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 8 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01010 ;
			//
			if (passCTSin == 1'b1)
			begin
				temp_passCTSout = 1'b0 ; 
			end 
		end
		9 :
		begin
			if (lempty == 1'b1)
			begin
				next_state = 0 ; 
				temp_busy = 1'b0 ; 
				bcvalid = 1'b1 ; 
			end
			else if (ldataready == 1'b1 & llevel == 2'b10)
			begin
				next_state = 10 ; 
				temp_busy = 1'b1 ; 
			end
			else if (ldataready == 1'b1 & wanttriID == 1'b1)
			begin
				next_state = 3 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 9 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01011 ;
			//
			temp_resetcount = 3'b100 ; 
			temp_baseaddress = llevel + 1 ; 
			// boundNodeIDout = (lBoundNodeID+1)(6 downto 0) & "000";
			//boundNodeIDout = {(lboundNodeID + 1)[6:0], 3'b000} ; 
			temp_boundNodeIDout = {lboundNodeID[6:0], 3'b000} ; 
			//          temp_addr = (((lBoundNodeID+1)(7 downto 0) & "0000")+
			//                   ((lBoundNodeID+1)(6 downto 0) & "00000")) (11 downto 0);
			//temp_addr = (({(lboundNodeID + 1)[7:0], 4'b0000}) + ({(lboundNodeID + 1)[6:1], 5'b00000}))[11:0] ; 
			temp_addr = (({lboundNodeID[7:0], 4'b0000}) + ({lboundNodeID[6:1], 5'b00000})); 
			//          startaddr = (((lBoundNodeID+1)(7 downto 0) & "0000")+
			//                        ((lBoundNodeID+1)(6 downto 0) & "00000")) (11 downto 0);
			//startAddr = (({(lboundNodeID + 1), 4'b0000}) + ({(lboundNodeID + 1), 5'b00000})) ; 
			temp_startAddr = (({lboundNodeID, 4'b0000}) + ({lboundNodeID, 5'b00000})) ; 
			if (ldataready == 1'b1 & (wanttriID == 1'b1 | llevel == 2'b10))
			begin
				temp_lack = 1'b1 ; 
				temp_l0reset = 1'b1 ; 
			end 
			
			if (ldataready == 1'b1 & llevel == 2'b10)
			begin
				temp_addrind = lboundNodeID - 72 ; 
				temp_addrindvalid = 1'b1 ; 
			end 
		end
		10 :
		begin
			if (dataindvalid == 1'b1)
			begin
				next_state = 11 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 10 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01100 ;
			//

			temp_tladdr = dataind[17:0] ; 
			temp_count = dataind[31:18] ; 
			if (dataindvalid == 1'b1)
			begin
				temp_addrindvalid = 1'b0 ; 
				temp_tladdrvalid = 1'b1 ; 
			end 

		end
		11 :
		begin
			if (count == 0 | count == 1)
			begin
				next_state = 9 ; 
				temp_busy = 1'b1 ; 
			end
			else if (wanttriID == 1'b1 & tldatavalid == 1'b1)
			begin
				next_state = 12 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 11 ; 
				temp_busy = 1'b1 ; 
			end 

			temp_statepeek = 5'b01101 ;
			//

			temp_triDatalatch = tldata ; 
			temp_subcount = 2'b10 ; 
			temp_maskcount = 2'b00 ; 
			if ((wanttriID == 1'b1 & tldatavalid == 1'b1) | (count == 0 | count == 1))
			begin
				temp_tladdr = tladdr + 1 ; 
				temp_tladdrvalid = 1'b0 ; 
			end 

		end
		12 :
		begin
			if (count != 0)
			begin
				next_state = 13 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 15 ; 
				temp_busy = 1'b1 ; 
			end 
			if (subcount == 2'b01)
			begin
				raygroupid = 2'b00 ; 
			end
			else
			begin
				raygroupid = 2'b00 ; 
			end 
			enablenear = 1'b0 ; 
			if (subcount == 2'b01 | count == 0)
			begin
				raygroupwe = 1'b1 ; 
			end 

			temp_statepeek = 5'b01110 ; 
			//

			if (maskcount == 2'b11)
			begin
			//            triID = triDataLatch(15 downto 0);
				temp_triID = triDatalatch[15:0] ; 
			end
			else if (maskcount == 2'b10)
			begin
			//            triID = triDataLatch(31 downto 16);
				temp_triID = triDatalatch[31:16] ; 
			end
			else if (maskcount == 2'b01)
			begin
			//            triID = triDataLatch(47 downto 32);
				temp_triID = triDatalatch[47:32] ; 
			end
			else
			begin
			//            triID = triDataLatch(63 downto 48);
				temp_triID = triDatalatch[63:48] ; 
			end 
			if (count != 0)
			begin
				temp_count = count - 1 ; 
				if (count != 1)
				begin
					temp_triIDvalid = 1'b1 ; 
				end 

				if (maskcount == 2'b01)
				begin                        
					temp_tladdrvalid = 1'b1 ;      
				end         
			end             

		end
		13 :
		begin
			next_state = 14 ; 
			temp_busy = 1'b1 ; 

			temp_statepeek = 5'b01111 ; 
		end
		14 :
		begin
			next_state = 12 ; 
			temp_busy = 1'b1 ; 
			temp_statepeek = 5'b10000 ; 
			//

			if (subcount != 0)
			begin           
				temp_subcount = subcount - 1 ;
			end 
			if (maskcount == 2'b11)
			begin
				temp_tladdr = tladdr + 1 ; 
				temp_tladdrvalid = 1'b0 ; 
				temp_triDatalatch = tldata ; 
			end 
			temp_maskcount = maskcount + 1 ; 

		end
		15 :
		begin
			if ((newdata == 1'b0 | resultID != 2'b00) & cts == 1'b1 & passCTSin == 1'b1)
			begin
				next_state = 16 ; 
				temp_busy = 1'b1 ; 
			end
			else if (newdata == 1'b1 & resultID == 2'b00)
			begin
				next_state = 18 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 15 ; 
				temp_busy = 1'b1 ; 
			end 
			temp_statepeek = 5'b10001 ; 
			//
			temp_tladdr = 0;
			temp_tladdrvalid = 0;
			if ((newdata == 0) | (resultID < 2'b00) & (passCTSin == 1))
			begin
				temp_cts = 0;
				temp_passCTSout = 1;
			end 

		end
		16 :
		begin
			if (newdata == 1'b1 & resultID == 2'b00)
			begin
				next_state = 17 ; 
				temp_busy = 1'b1 ; 
			end
			else if (passCTSin == 1'b0)
			begin
				next_state = 15 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 16 ; 
				temp_busy = 1'b1 ; 
			end 
			temp_statepeek = 5'b10010 ; 
			//
			if ((passCTSin == 0) & ((newdata == 0) | (resultID == 1)))
			begin
				temp_passCTSout = 0;
			end 

		end
		17 :
		begin
			if (passCTSin == 1'b0)
			begin
				next_state = 18 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 17 ; 
				temp_busy = 1'b1 ; 
			end 
			temp_statepeek = 5'b10011 ; 
			//
			if (passCTSin == 0)
			begin
				temp_passCTSout = 0;
			end 


		end
		18 :
		begin
			if (cts == 1'b0 & (((hitmask[0]) == 1'b1 & hit1in == 1'b0) | ((hitmask[1]) == 1'b1 & hit2in == 1'b0) | ((hitmask[2]) == 1'b1 & hit3in == 1'b0)))
			begin
				next_state = 19 ; 
				temp_busy = 1'b1 ; 
			end
			else if (cts == 1'b1 & (((hitmask[0]) == 1'b1 & hit1in == 1'b0) | ((hitmask[1]) == 1'b1 & hit2in == 1'b0) | ((hitmask[2]) == 1'b1 & hit3in == 1'b0)))
			begin
				next_state = 9 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 0 ; 
				temp_busy = 1'b0 ; 
				bcvalid = 1'b1 ; 
			end 
			temp_statepeek = 5'b10100 ; 
			//



			if (hit1in == 1'b1 & (hitmask[0]) == 1'b1)
			begin
				temp_t1 = t1in;
				temp_u1 = u1in;
				temp_v1 = v1in;
				temp_id1 = id1in;
				temp_hit1 = 1'b1;
				temp_hitmask[0] = 1'b0 ; 
			end 
			if (hit2in == 1'b1 & (hitmask[1]) == 1'b1)
			begin
				temp_t2 = t2in ; 
				temp_u2 = u2in ; 
				temp_v2 = v2in ; 
				temp_id2 = id2in ; 
				temp_hit2 = 1'b1 ; 
				temp_hitmask[1] = 1'b0 ; 
			end 
			if (hit3in == 1'b1 & (hitmask[2]) == 1'b1)
			begin
				temp_t3 = t3in ; 
				temp_u3 = u3in ; 
				temp_v3 = v3in ; 
				temp_id3 = id3in ; 
				temp_hit3 = 1'b1 ; 
				temp_hitmask[2] = 1'b0 ; 
			end 
			if (cts == 1'b0 & (((hitmask[0]) == 1'b1 & hit1in == 1'b0) | ((hitmask[1]) == 1'b1 & hit2in == 1'b0) | ((hitmask[2]) == 1'b1 & hit3in == 1'b0)))
			begin
				temp_passCTSout = 1'b1 ; 
				temp_cts = 1'b1 ; 
			end 

		end
		19 :
		begin
			if (passCTSin == 1'b0)
			begin
				next_state = 19 ; 
				temp_busy = 1'b1 ; 
			end
			else
			begin
				next_state = 9 ; 
				temp_busy = 1'b1 ; 
			end 
			temp_statepeek = 5'b10101 ; 
			//
			if (passCTSin == 1'b1)
			begin
				temp_passCTSout = 1'b0 ; 
			end 

		end
		endcase 
	end 
endmodule
