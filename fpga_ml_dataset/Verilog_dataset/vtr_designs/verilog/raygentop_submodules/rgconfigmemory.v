`define SIMULATION_MEMORY

module rgconfigmemory (CfgAddr, CfgData, CfgData_Ready, want_CfgData, origx, origy, origz, m11, m12, m13, m21, m22, m23, m31, m32, m33, bkcolour, texinfo, globalreset, clk);


    input[3:0] CfgAddr; 
    input[27:0] CfgData; 
    input CfgData_Ready; 
    output want_CfgData; 
    reg want_CfgData;
    output[27:0] origx; 
    reg[27:0] origx;
    output[27:0] origy; 
    reg[27:0] origy;
    output[27:0] origz; 
    reg[27:0] origz;
    output[15:0] m11; 
    reg[15:0] m11;
    output[15:0] m12; 
    reg[15:0] m12;
    output[15:0] m13; 
    reg[15:0] m13;
    output[15:0] m21; 
    reg[15:0] m21;
    output[15:0] m22; 
    reg[15:0] m22;
    output[15:0] m23; 
    reg[15:0] m23;
    output[15:0] m31; 
    reg[15:0] m31;
    output[15:0] m32; 
    reg[15:0] m32;
    output[15:0] m33; 
    reg[15:0] m33;
    output[20:0] bkcolour; 
    reg[20:0] bkcolour;
    output[20:0] texinfo; 

    wire[20:0] texinfo;
    input globalreset; 
    input clk; 

    reg state; 
    reg next_state; 
    wire we; 

    reg[27:0] temp_origx;
    reg[27:0] temp_origy;
    reg[27:0] temp_origz;
    reg[15:0] temp_m11;
    reg[15:0] temp_m12;
    reg[15:0] temp_m13;
    reg[15:0] temp_m21;
    reg[15:0] temp_m22;
    reg[15:0] temp_m23;
    reg[15:0] temp_m31;
    reg[15:0] temp_m32;
    reg[15:0] temp_m33;
    reg[20:0] temp_bkcolour;

    // <<X-HDL>> Can't find translated component 'spram'. Module name may not match
    spram21x4 spraminst(we, texinfo, CfgData[20:0], clk); 
    assign we = ((CfgData_Ready == 1'b1) & (CfgAddr == 4'b1110)) ? 1'b1 : 1'b0 ;

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          origx <= 0;
          origy <= 0;

          origz <= 0;
          m11 <= 1;
          m12 <= 0;
          m13 <= 0;
          m21 <= 0;
          m22 <= 1;
          m23 <= 0;
          m31 <= 0;
          m32 <= 0;
         m33 <= 1;
          bkcolour <= 0;
       end
       else
       begin
          state <= next_state ; 
          origx <= temp_origx;
          origy <= temp_origy;
          origz <= temp_origz;
          m11 <= temp_m11;
          m12 <= temp_m12;
          m13 <= temp_m13;
          m21 <= temp_m21;
          m22 <= temp_m22;
          m23 <= temp_m23;
          m31 <= temp_m31;
          m32 <= temp_m32;
         m33 <= temp_m33;
          bkcolour <= bkcolour;
       end 
    end 

    always @(state or CfgData_Ready)
    begin
       case (state)
          0 :
                   begin
                      want_CfgData = 1'b1 ; 
                      if (CfgData_Ready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end

                      else
                      begin
                         next_state = 0 ; 
                      end 

              if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0001))
                        begin
											temp_origx = CfgData ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0010))
                        begin
                                           temp_origy = CfgData ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0011))
                        begin
                                           temp_origz = CfgData ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0100))
                        begin
                                           temp_m11 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0101))
                        begin
                                           temp_m12 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0110))
                        begin
                                           temp_m13 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b0111))
                        begin
                                           temp_m21 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1000))
                        begin
                                           temp_m22 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1001))
                        begin
                                           temp_m23 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1010))
                        begin
                                           temp_m31 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1011))
                        begin
                                           temp_m32 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1100))
                        begin
                                           temp_m33 = CfgData[15:0] ; 
						end
                        else if ((CfgData_Ready == 1'b1) && (CfgAddr == 4'b1101))
                        begin
                                           temp_bkcolour = CfgData[20:0] ; 
						end
                   end
          1 :
                   begin
                      want_CfgData = 1'b0 ; 
                      if (CfgData_Ready == 1'b0)
                      begin
                         next_state = 0 ; 
                      end

                      else
                      begin
                         next_state = 1 ; 
                      end 
                   end
       endcase 
    end 
 endmodule
 module spram21x4 (we, dataout, datain, clk);

    input we; 
    output[21 - 1:0] dataout; 
    wire[21 - 1:0] dataout;
    input[21 - 1:0] datain; 
    input clk; 

	reg [7:0] addr;
	
	always @ (posedge clk)
	begin
	 addr[0] <= we;
	 addr [1] <= addr[0];
	 addr [2] <= addr[1];
	 addr [3] <= addr[2];
	 addr [4] <= addr[3];
	 addr [5] <= addr[4];
	 addr [6] <= addr[5];
	 addr [7] <= addr[6];
	 end
//changed to odin 2 ram specifications

defparam new_ram.ADDR_WIDTH = 8;
defparam new_ram.DATA_WIDTH = 21;
single_port_ram new_ram(
  .clk (clk),
  .we(we),
  .data(datain),
  .out(dataout),
  .addr(addr)
  );
  
  
 endmodule
module single_port_ram(
clk,
addr,
data,
we,
out
);

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
input clk;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;
input we;
output reg [DATA_WIDTH-1:0] out;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we) begin
    ram[addr] <= data;
  end
  else begin
    out <= ram[addr];
  end
end

endmodule
