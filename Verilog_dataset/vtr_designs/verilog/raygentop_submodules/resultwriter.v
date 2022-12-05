`define SIMULATION_MEMORY

 module resultwriter (valid01, valid10, id01a, id01b, id01c, id10a, id10b, id10c, hit01a, hit01b, hit01c, hit10a, hit10b, hit10c, u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, addr, as01, as10, bkcolour, shadedata, triID, wantshadedata, shadedataready, texinfo, texaddr, texeladdr, texel, wanttexel, texelready, dataout, addrout, write, ack, globalreset, clk);

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
    input[7:0] u01a; 
    input[7:0] u01b; 
    input[7:0] u01c; 
    input[7:0] v01a; 
    input[7:0] v01b; 
    input[7:0] v01c; 

    input[7:0] u10a; 
    input[7:0] u10b; 
    input[7:0] u10c; 
    input[7:0] v10a; 
    input[7:0] v10b; 
    input[7:0] v10c; 
    input[17:0] addr; 
    input as01; 
    input as10; 
    input[20:0] bkcolour; 
    input[63:0] shadedata; 
    output[15:0] triID; 

    reg[15:0] triID;
    output wantshadedata; 
    reg wantshadedata;
    input shadedataready; 
    input[20:0] texinfo; 
    output[3:0] texaddr; 
    wire[3:0] texaddr;
    output[17:0] texeladdr; 
    wire[17:0] texeladdr;
    input[63:0] texel; 
    output wanttexel; 
    reg wanttexel;

    input texelready; 
    output[63:0] dataout; 
    // PAJ see lower note wire[63:0] dataout;
    reg[63:0] dataout;
    output[17:0] addrout; 
    wire[17:0] addrout;
    output write; 
    wire write;
    reg temp_write;
    input ack; 
    input globalreset; 
    input clk; 

    reg[3:0] state; 
    reg[3:0] next_state; 
    reg pending01; 
    reg pending10; 
    reg process01; 
    wire[17:0] addrout01; 
    wire[17:0] addrout10; 
    wire shiften01; 
    wire shiften10; 
    reg temp_shiften01; 
    reg temp_shiften10; 
    reg[20:0] shadedataa; 
    reg[20:0] shadedatab; 
    reg[20:0] shadedatac; 
    wire hita; 
    wire hitb; 
    wire hitc; 

    reg[2:0] selectuv; 
    wire[6:0] blr; 
    wire[6:0] blg; 
    wire[6:0] blb; 
    reg texmap; 
    reg lmenable; 
    wire[1:0] texelselect; 
    wire[6:0] texelr; 
    wire[6:0] texelg; 
    wire[6:0] texelb; 
    reg[20:0] texinfol; 

    reg temp_pending01; 
    reg temp_pending10; 
    reg temp_process01; 
    reg temp_texmap; 
    reg[20:0] temp_texinfol; 
    reg[20:0] temp_shadedataa; 
    reg[20:0] temp_shadedatab; 
    reg[20:0] temp_shadedatac; 

    col16to21 col16to21inst (texel, texelselect, texelr, texelg, texelb); 
    linearmap linearmapinst (blb, blg, texinfol[17:0], texeladdr, texelselect, texinfol[20:18], lmenable, clk); 
    bilinearintrp bilinearimp (u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, selectuv, shadedata[41:35], shadedata[62:56], shadedata[20:14], shadedata[34:28], shadedata[55:49], shadedata[13:7], shadedata[27:21], shadedata[48:42], shadedata[6:0], blr, blg, blb, clk); 
    fifo3 fifo3insta (addr, as01, addrout01, shiften01, globalreset, clk); 
    fifo3 fifo3instb (addr, as10, addrout10, shiften10, globalreset, clk); 
    assign hita = (hit01a & process01) | (hit10a & ~process01) ;
    assign hitb = (hit01b & process01) | (hit10b & ~process01) ;
    assign hitc = (hit01c & process01) | (hit10c & ~process01) ;
    assign texaddr = shadedata[59:56] ;
    assign shiften01 = temp_shiften01;
    assign shiften10 = temp_shiften10;
    assign write = temp_write;


    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          pending01 <= 1'b0 ; 
          pending10 <= 1'b0 ; 
          shadedataa <= 0;
          shadedatab <= 0;
          shadedatac <= 0;
          process01 <= 1'b0 ; 
          texmap <= 1'b0 ; 

          texinfol <= 0;
       end
       else
       begin
          state <= next_state ; 

process01 <= temp_process01;
pending01 <= temp_pending01;
pending10 <= temp_pending10;
texmap <= temp_texmap;
texinfol <= temp_texinfol;
shadedataa <= temp_shadedataa;
shadedatab <= temp_shadedatab;
shadedatac <= temp_shadedatac;

    dataout <= {1'b0, 
					shadedataa[20],
					shadedataa[19],
					shadedataa[18],
					shadedataa[17],
					shadedataa[16],
					shadedataa[15],
					shadedataa[14],
					shadedataa[13],
					shadedataa[12],
					shadedataa[11],
					shadedataa[10],
					shadedataa[9],
					shadedataa[8],
					shadedataa[7],
					shadedataa[6],
					shadedataa[5],
					shadedataa[4],
					shadedataa[3],
					shadedataa[2],
					shadedataa[1],
					shadedataa[0],
					shadedatab[20],
					shadedatab[19],
					shadedatab[18],
					shadedatab[17],
					shadedatab[16],
					shadedatab[15],
					shadedatab[14],
					shadedatab[13],
					shadedatab[12],
					shadedatab[11],
					shadedatab[10],
					shadedatab[9],
					shadedatab[8],
					shadedatab[7],
					shadedatab[6],
					shadedatab[5],
					shadedatab[4],
					shadedatab[3],
					shadedatab[2],
					shadedatab[1],
					shadedatab[0],
					shadedatac[20],
					shadedatac[19],
					shadedatac[18],
					shadedatac[17],
					shadedatac[16],
					shadedatac[15],
					shadedatac[14],
					shadedatac[13],
					shadedatac[12],
					shadedatac[11],
					shadedatac[10],
					shadedatac[9],
					shadedatac[8],
					shadedatac[7],
					shadedatac[6],
					shadedatac[5],
					shadedatac[4],
					shadedatac[3],
					shadedatac[2],
					shadedatac[1],
					shadedatac[0]} ;
       end 
//    end 
// PAJ used to be assign, but weird error, so added as register   assign dataout = {1'b0, 
    end 
    assign addrout = (process01 == 1'b1) ? addrout01 : addrout10 ;

    always @(state or process01 or pending10 or ack or shadedataready or id01a or 
             id01b or id01c or id10a or id10b or id10c or selectuv or hita or 
             hitb or hitc or shadedata or pending01 or texmap or texelready)
    begin
       case (state)
          0 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       selectuv = 0;
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      if (pending01 == 1'b1 | pending10 == 1'b1)
                      begin
                         next_state = 2 ; 
                      end
                      else

                      begin
                         next_state = 0 ; 
                      end 
	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_process01 = pending01 ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          2 :
                   begin
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      wantshadedata = 1'b1 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b00 ; 
                      if (process01 == 1'b1)
                      begin
                         triID = id01a ; 

                      end
                      else
                      begin
                         triID = id10a ; 
                      end 
                      if (shadedataready == 1'b1)
                      begin
                         if (hita == 1'b1 & ((shadedata[63]) == 1'b1 | shadedata[63:62] == 2'b01))
                         begin
                            next_state = 3 ; 
                         end
                         else

                         begin
                            next_state = 4 ; 
                         end 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         if (hita == 1'b1)
                         begin
                            temp_shadedataa = shadedata[20:0] ; 
                            temp_texmap = (~shadedata[63]) & shadedata[62] ; 
                         end
                         else
                         begin
                            temp_shadedataa = bkcolour ; 
                         end 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          3 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 

                      selectuv[1:0] = 2'b00 ; 
                      next_state = 8 ; 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_texinfol = texinfo ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;

                   end
          8 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b00 ; 
                      lmenable = 1'b1 ; 
                      if (texmap == 1'b1)
                      begin

                         next_state = 11 ; 
                      end
                      else
                      begin
                         next_state = 4 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_shadedataa[6:0] = blb ; 
                         temp_shadedataa[13:7] = blg ; 
                         temp_shadedataa[20:14] = blr ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          11 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       selectuv = 0;
				       lmenable = 1'b0 ; 

                      wanttexel = 1'b1 ; 
                      if (texelready == 1'b1)
                      begin
                         next_state = 4 ; 
                      end
                      else
                      begin
                         next_state = 11 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         temp_shadedataa[6:0] = texelb ; 
                         temp_shadedataa[13:7] = texelg ; 
                         temp_shadedataa[20:14] = texelr ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          12 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       selectuv = 0;
				       lmenable = 1'b0 ; 

                      wanttexel = 1'b1 ; 
                      if (texelready == 1'b1)
                      begin
                         next_state = 5 ; 
                      end
                      else
                      begin
                         next_state = 12 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_shadedatab[6:0] = texelb ; 
                         temp_shadedatab[13:7] = texelg ; 
                         temp_shadedatab[20:14] = texelr ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          13 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       selectuv = 0;
				       lmenable = 1'b0 ; 

                      wanttexel = 1'b1 ; 
                      if (texelready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else
                      begin
                         next_state = 13 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         temp_shadedatac[6:0] = texelb ; 
                         temp_shadedatac[13:7] = texelg ; 
                         temp_shadedatac[20:14] = texelr ; 

                   end
          6 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 

                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b01 ; 
                      next_state = 9 ; 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_texinfol = texinfo ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          9 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b01 ; 
                      lmenable = 1'b1 ; 
                      if (texmap == 1'b1)
                      begin
                         next_state = 12 ; 

                      end
                      else
                      begin
                         next_state = 5 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         temp_shadedatab[6:0] = blb ; 
                         temp_shadedatab[13:7] = blg ; 
                         temp_shadedatab[20:14] = blr ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          7 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b10 ; 
                      next_state = 10 ; 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_texinfol = texinfo ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end

          10 :
                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b10 ; 
                      if (texmap == 1'b1)
                      begin
                         next_state = 13 ; 
                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 

                      lmenable = 1'b1 ; 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 
                         temp_shadedatac[6:0] = blb ; 
                         temp_shadedatac[13:7] = blg ; 
                         temp_shadedatac[20:14] = blr ; 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          4 :
                   begin
				       wantshadedata = 1'b0 ; 
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b01 ; 
                      if (process01 == 1'b1)
                      begin
                         triID = id01b ; 
                      end
                      else
                      begin

                         triID = id10b ; 
                      end 
                      if (shadedataready == 1'b1)
                      begin
                         if (hitb == 1'b1 & ((shadedata[63]) == 1'b1 | shadedata[63:62] == 2'b01))
                         begin
                            next_state = 6 ; 
                         end
                         else
                         begin
                            next_state = 5 ; 
                         end 

                      end
                      else
                      begin
                         next_state = 4 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         if (hitb == 1'b1)
                         begin
                            temp_shadedatab = shadedata[20:0] ; 
                            temp_texmap = (~shadedata[63]) & shadedata[62] ; 
                         end
                         else
                         begin
                            temp_shadedatab = bkcolour ; 
                         end 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          5 :
                   begin
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      wantshadedata = 1'b1 ; 
                      selectuv[2] = ~process01 ; 
                      selectuv[1:0] = 2'b10 ; 
                      if (process01 == 1'b1)

                      begin
                         triID = id01c ; 
                      end
                      else
                      begin
                         triID = id10c ; 
                      end 
                      if (shadedataready == 1'b1)
                      begin
                         if (hitc == 1'b1 & ((shadedata[63]) == 1'b1 | shadedata[63:62] == 2'b01))
                         begin
                            next_state = 7 ; 

                         end
                         else
                         begin
                            next_state = 1 ; 
                         end 
                      end
                      else
                      begin
                         next_state = 5 ; 
                      end 

	          if (valid01 == 1'b1)
				          begin
				             temp_pending01 = 1'b1 ; 
				          end 
				          if (valid10 == 1'b1)
				          begin
				             temp_pending10 = 1'b1 ; 
				          end 

                         if (hitc == 1'b1)
                          begin
                            temp_shadedatac = shadedata[20:0] ; 
                            temp_texmap = (~shadedata[63]) & shadedata[62] ; 
                         end
                         else
                         begin
                            temp_shadedatac = bkcolour ; 
                         end 

							temp_shiften01 = 1'b0;
							temp_shiften10 = 1'b0;
					    	temp_write = 1'b0;
                   end
          1 :

                   begin
				       wantshadedata = 1'b0 ; 
   				       triID = 0;
				       selectuv = 0;
				       lmenable = 1'b0 ; 
				       wanttexel = 1'b0 ; 
                      if (ack == 1'b1)
                      begin
                         next_state = 0 ; 
                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 

                         if (ack == 1'b1 & process01 == 1'b1)
                         begin
                            temp_pending01 = 1'b0 ; 
                         end

                          else if (ack == 1'b1 & process01 == 1'b0)
                         begin
                            temp_pending10 = 1'b0 ; 
                         end 

    				if (process01 == 1'b1 &  ack == 1'b1)
						begin
							temp_shiften01 = 1'b1;
							temp_shiften10 = 1'b1;
						end
					    temp_write = 1'b1;
                   end
       endcase 
    end 
 endmodule
module fifo3 (datain, writeen, dataout, shiften, globalreset, clk);

    input[18 - 1:0] datain; 
    input writeen; 
    output[18 - 1:0] dataout; 
    wire[18 - 1:0] dataout;
    input shiften; 
    input globalreset; 
    input clk; 

    reg[18 - 1:0] data0; 
    reg[18 - 1:0] data1; 
    reg[18 - 1:0] data2; 

    reg[1:0] pos; 

    assign dataout = data0 ;

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          pos <= 2'b00 ; 
          data0 <= 0 ; 
          data1 <= 0 ; 
          data2 <= 0 ; 
       end
       else
       begin
          if (writeen == 1'b1 & shiften == 1'b1)
          begin
             case (pos)
                2'b00 :
                         begin
                            data0 <= 0 ; 
                            data1 <= 0 ; 
                            data2 <= 0 ; 
                         end

                2'b01 :
                         begin
                            data0 <= datain ; 
                            data1 <= 0 ; 
                            data2 <= 0 ; 
                         end
                2'b10 :
                         begin
                            data0 <= data1 ; 
                            data1 <= datain ; 
                            data2 <= 0 ; 
                         end

                2'b11 :
                         begin
                            data0 <= data1 ; 
                            data1 <= data2 ; 
                            data2 <= datain ; 
                         end
             endcase 
          end
          else if (shiften == 1'b1)
          begin
             data0 <= data1 ; 
             data1 <= data2 ; 
             pos <= pos - 1 ; 
          end
          else if (writeen == 1'b1)
          begin
             case (pos)
                2'b00 :
                         begin
                            data0 <= datain ; 
                         end
                2'b01 :
    					begin
                            data1 <= datain ; 
                         end
                2'b10 :
                         begin
                            data2 <= datain ; 
                         end
             endcase 
             pos <= pos + 1 ; 
          end 
       end 
    end 
 endmodule
     module bilinearintrp (u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, selectuv, ru, rv, rw, gu, gv, gw, bu, bv, bw, r, g, b, clk);

        input[7:0] u01a; 
        input[7:0] u01b; 
        input[7:0] u01c; 
        input[7:0] v01a; 
        input[7:0] v01b; 
        input[7:0] v01c; 
        input[7:0] u10a; 
        input[7:0] u10b; 
        input[7:0] u10c; 
        input[7:0] v10a; 
        input[7:0] v10b; 
        input[7:0] v10c; 
        input[2:0] selectuv; 
        input[6:0] ru; 
        input[6:0] rv; 
        input[6:0] rw; 
        input[6:0] gu; 
        input[6:0] gv; 
        input[6:0] gw; 
        input[6:0] bu; 
        input[6:0] bv; 
        input[6:0] bw; 
        output[6:0] r; 
        wire[6:0] r;
        output[6:0] g; 
        wire[6:0] g;
        output[6:0] b; 
        wire[6:0] b;
        input clk; 

        reg[7:0] u; 
        reg[7:0] v; 
        reg[7:0] ul; 
        reg[7:0] vl; 
        reg[7:0] wl; 
        reg[14:0] i1b; 
        reg[14:0] i2b; 
        reg[14:0] i3b; 
        reg[14:0] i1g; 
        reg[14:0] i2g; 
        reg[14:0] i3g; 
        reg[14:0] i1r; 
        reg[14:0] i2r; 
        reg[14:0] i3r; 
        reg[6:0] rul; 
        reg[6:0] rvl; 
        reg[6:0] rwl; 
        reg[6:0] gul; 
        reg[6:0] gvl; 
        reg[6:0] gwl; 
        reg[6:0] bul; 
        reg[6:0] bvl; 
        reg[6:0] bwl; 

        always @(selectuv or u01a or u01b or u01c or v01a or v01b or v01c or u10a or 
                 u10b or u10c or v10a or v10b or v10c)
        begin
           case (selectuv)
              3'b000 :
                       begin
                          u = u01a ; 
                          v = v01a ; 
                       end
              3'b001 :
                       begin
                          u = u01b ; 
						 v = v01b ; 
                       end
              3'b010 :
                       begin
                          u = u01c ; 
                          v = v01c ; 
                       end
              3'b100 :
                       begin
                          u = u10a ; 
                          v = v10a ; 
                       end
              3'b101 :
                       begin
                          u = u10b ; 
                          v = v10b ; 
                       end
              3'b110 :
                       begin
                          u = u10c ; 
                          v = v10c ; 
                       end
              default :
                       begin
                          u = 0;
                          v = 0;
                       end
           endcase 
        end 

        always @(posedge clk)
        begin
           wl <= 8'b11111111 - u - v ; 
           ul <= u ; 
           vl <= v ; 
           rul <= ru ; 
           rvl <= rv ; 
           rwl <= rw ; 
           gul <= gu ; 
           gvl <= gv ; 
           gwl <= gw ; 
           bul <= bu ; 
           bvl <= bv ; 
           bwl <= bw ; 
           i1r <= ul * rul ; 
           i2r <= vl * rvl ; 
           i3r <= wl * rwl ; 
           i1g <= ul * gul ; 
           i2g <= vl * gvl ; 
           i3g <= wl * gwl ; 
           i1b <= ul * bul ; 
           i2b <= vl * bvl ; 
           i3b <= wl * bwl ;  
        end 
        assign r = (i1r + i2r + i3r) ;
        assign g = (i1g + i2g + i3g) ;
        assign b = (i1b + i2b + i3b) ;
     endmodule
 module linearmap (u, v, start, addr, texelselect, factor, enable, clk);

    input[6:0] u; 
    input[6:0] v; 
    input[17:0] start; 
    output[17:0] addr; 
    reg[17:0] addr;
    output[1:0] texelselect; 
    wire[1:0] texelselect;

    input[2:0] factor; 
    input enable; 
    input clk; 

    reg[6:0] ul; 
    reg[6:0] vl; 

    assign texelselect = ul[1:0] ;

    always @(posedge clk)
    begin
       if (enable == 1'b1)
       begin
          ul <= u ; 
          vl <= v ; 
       end 
       else
       begin
          ul <= ul ; 
          vl <= vl ; 
       end 
       case (factor)
          3'b000 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({11'b00000000000, vl}) ; 
                   end
          3'b001 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({10'b0000000000, vl, 1'b0}) ; 

                   end
          3'b010 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({9'b000000000, vl, 2'b00}) ; 
                   end
          3'b011 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({8'b00000000, vl, 3'b000}) ; 
                   end
          3'b100 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({7'b0000000, vl, 4'b0000}) ; 

                   end
          3'b101 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({6'b000000, vl, 5'b00000}) ; 
                   end
          3'b110 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({5'b00000, vl, 6'b000000}) ; 
                   end
          3'b111 :
                   begin
                      addr <= start + ({13'b0000000000000, ul[6:2]}) + ({4'b0000, vl, 7'b0000000}) ; 

                   end
       endcase  
    end 
 endmodule
 module col16to21 (dataline, texelselect, r, g, b);

    input[63:0] dataline; 
    input[1:0] texelselect; 
    output[6:0] r; 
    wire[6:0] r;
    output[6:0] g; 
    wire[6:0] g;
    output[6:0] b; 
    wire[6:0] b;

    reg[15:0] col16; 

    always @(dataline or texelselect)
    begin
       case (texelselect)
          2'b00 :
                   begin
                      col16 = dataline[15:0] ; 
                   end
          2'b01 :
                   begin
                      col16 = dataline[31:16] ; 
                   end
          2'b10 :
                   begin
                      col16 = dataline[47:32] ; 
                   end
          2'b11 :
                   begin
                      col16 = dataline[63:48] ; 
                   end
       endcase 
    end 
    assign r = {col16[15:10], 1'b0} ;
    assign g = {col16[9:5], 2'b00} ;
    assign b = {col16[4:0], 2'b00} ;
 endmodule
