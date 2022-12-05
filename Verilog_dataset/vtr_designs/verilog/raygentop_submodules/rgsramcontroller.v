`define SIMULATION_MEMORY

module rgsramcontroller (want_addr, addr_ready, addrin, want_data, data_ready, datain, want_read, read_ready, dataout, dirReady, wantDir, sramdatal, addr, wantwriteback, writebackack, writebackdata, writebackaddr, fbdata, fbnextscanline, fbdatavalid, fbpage, shadedata, triID, wantshadedata, shadedataready, texeladdr, texel, wanttexel, texelready, tm3_sram_data_in, tm3_sram_data_out, tm3_sram_addr, tm3_sram_we, tm3_sram_oe, tm3_sram_adsp, globalreset, clk);

    output want_addr; 
    reg want_addr;
    input addr_ready; 
    input[17:0] addrin; 
    output want_data; 
    reg want_data;
    input data_ready; 
    input[63:0] datain; 
    input want_read; 
    output read_ready; 

    reg read_ready;
    output[63:0] dataout; 
    wire[63:0] dataout;
    output dirReady; 
    reg dirReady;
    input wantDir; 
    output[47:0] sramdatal; 
    reg[47:0] sramdatal;
    output[14:0] addr; 
    wire[14:0] addr;
    input wantwriteback; 
    output writebackack; 

    reg writebackack;
    input[63:0] writebackdata; 
    input[17:0] writebackaddr; 
    output[63:0] fbdata; 
    reg[63:0] fbdata;
    input fbnextscanline; 
    output fbdatavalid; 
    reg fbdatavalid;
    input fbpage; 
    output[63:0] shadedata; 
    wire[63:0] shadedata;
    input[15:0] triID; 

    input wantshadedata; 
    output shadedataready; 
    reg shadedataready;
    input[17:0] texeladdr; 
    output[63:0] texel; 
    wire[63:0] texel;
    input wanttexel; 
    output texelready; 
    reg texelready;
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

    reg[3:0] state; 
    reg[3:0] next_state; 
    reg[17:0] waddress; 
    reg[14:0] faddress; 
    reg[6:0] fcount; 
    reg fbdatavalidl; 

    reg[17:0] temp_waddress; 
    reg[14:0] temp_faddress; 
    reg[6:0] temp_fcount; 
    reg temp_fbdatavalidl; 
    reg temp_texelready;
    reg temp_shadedataready;

    assign tm3_sram_data_out = tm3_sram_data_xhdl0;

    assign dataout = tm3_sram_data_in ;
    assign addr = tm3_sram_data_in[62:48] ;
    assign shadedata = tm3_sram_data_in ;
    assign texel = tm3_sram_data_in ;

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin

          state <= 0 ; 
          waddress <= 0;
          faddress <= 0;
          fcount <= 7'b1101011 ; 
          fbdatavalid <= 1'b0 ; 
          fbdatavalidl <= 1'b0 ; 
          shadedataready <= 1'b0 ; 
          texelready <= 1'b0 ; 
          sramdatal <= 0;
          fbdata <= 0;
       end
       else

       begin
          state <= next_state ; 
          sramdatal <= tm3_sram_data_in[47:0] ; 
          fbdata <= tm3_sram_data_in ; 
          fbdatavalid <= fbdatavalidl ; 

fbdatavalidl <= temp_fbdatavalidl;
texelready <= temp_texelready;
shadedataready <= temp_shadedataready;
fcount <= temp_fcount;
faddress <= temp_faddress;
waddress <= temp_waddress;

       end 
    end 

    always @(state or addr_ready or data_ready or waddress or datain or wantDir or 
             want_read or wantwriteback or writebackdata or writebackaddr or 
             fcount or fbpage or faddress or fbnextscanline or triID or wantshadedata or 
             wanttexel or texeladdr)

    begin
       case (state)

          0 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end
                      else if (want_read == 1'b1)
                      begin
                         next_state = 2 ; 
                      end
                      else if (data_ready == 1'b1)
                      begin

                         next_state = 3 ; 
                      end
                      else if (wantDir == 1'b1)
                      begin
                         next_state = 5 ; 
                      end
                      else if (wantwriteback == 1'b1)
                      begin
                         next_state = 6 ; 
                      end
                      else if (wantshadedata == 1'b1)
                      begin

                         next_state = 9 ; 
                      end
                      else if (wanttexel == 1'b1)
                      begin
                         next_state = 10 ; 
                      end
                      else if (fcount != 0)
                      begin
                         next_state = 7 ; 
                      end
                      else if (fbnextscanline == 1'b1)
                      begin

                         next_state = 8 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         if (addr_ready == 1'b1)

                         begin
                            temp_waddress = addrin ; 
                         end 

                   end
          1 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      want_addr = 1'b0 ; 
                      if (addr_ready == 1'b0)
                      begin
                         next_state = 0 ; 

                      end
                      else
                      begin
                         next_state = 1 ; 
                      end 
                   end
          2 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 

                      read_ready = 1'b0 ; 
                      if (want_read == 1'b0)
                      begin
                         next_state = 0 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 

				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         if (want_read == 1'b0)
                         begin

                            temp_waddress = waddress + 1 ; 
                         end 

                   end
          3 :
                   begin
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      tm3_sram_data_xhdl0 = datain ; 
                      tm3_sram_we = 8'b00000000 ; 


                   tm3_sram_oe = 2'b11 ; 
                      tm3_sram_adsp = 1'b0 ; 
                      want_data = 1'b0 ; 
                      next_state = 4 ; 

				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         temp_waddress = waddress + 1 ; 

                   end
          4 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      if (data_ready == 1'b0)
                      begin

                         next_state = 0 ; 
                      end
                      else
                      begin
                         next_state = 4 ; 
                      end 
                      want_data = 1'b0 ; 
                   end

          5 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       writebackack = 1'b0 ; 

                     dirReady = 1'b1 ; 
                      if (wantDir == 1'b0)
                      begin
                         next_state = 0 ; 

                      end
                      else
                      begin
                         next_state = 5 ; 
                      end 

				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         if (wantDir == 1'b0)
                         begin
                            temp_waddress = waddress + 1 ; 
                         end 

                   end
          6 :
                   begin
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 

                      tm3_sram_data_xhdl0 = writebackdata ; 
                      tm3_sram_we = 8'b00000000 ; 
                      tm3_sram_oe = 2'b11 ; 
                      tm3_sram_adsp = 1'b0 ; 
                      tm3_sram_addr = {1'b0, writebackaddr} ; 
                      writebackack = 1'b1 ; 
                      next_state = 0 ; 
                   end

          7 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      tm3_sram_addr = {3'b011, fbpage, faddress} ; 
                      if ((fcount == 1) | (addr_ready == 1'b1) | (want_read == 1'b1) | (data_ready == 1'b1) | (wantDir == 1'b1) | (wantwriteback == 1'b1))
                      begin
                         next_state = 0 ; 

                      end
                      else
                      begin
                         next_state = 7 ; 
                      end 


				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         temp_fbdatavalidl = 1'b1 ; 
                         if (fcount != 0)
                         begin
                            temp_faddress = faddress + 1 ; 
                            temp_fcount = fcount - 1 ; 
                         end 

                   end
          8 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       tm3_sram_addr = {1'b0, waddress} ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      next_state = 7 ; 

				   				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         temp_fcount = 7'b1101011 ; 
                         if (faddress == 25680)
                         begin
                            temp_faddress = 0;
                         end 
                   end
          9 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      tm3_sram_addr = {3'b010, triID} ; 
                      next_state = 0 ; 

				          temp_fbdatavalidl = 1'b0 ; 
				          temp_texelready = 1'b0 ; 
                         temp_shadedataready = 1'b1 ; 
                   end

          10 :
                   begin
				       tm3_sram_we = 8'b11111111 ; 
				       tm3_sram_oe = 2'b01 ; 
				       tm3_sram_adsp = 1'b0 ; 
				       tm3_sram_data_xhdl0 = 0;
				       want_addr = 1'b1 ; 
				       want_data = 1'b1 ; 
				       read_ready = 1'b1 ; 
				       dirReady = 1'b0 ; 
				       writebackack = 1'b0 ; 
                      tm3_sram_addr = {1'b0, texeladdr} ; 
                      next_state = 0 ; 

				          temp_fbdatavalidl = 1'b0 ; 
				          temp_shadedataready = 1'b0 ; 
                         temp_texelready = 1'b1 ; 
                   end
       endcase 
    end 
 endmodule
