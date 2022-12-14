`define SIMULATION_MEMORY

 module vblockramcontroller (want_addr, addr_ready, addrin, want_data, data_ready, datain, addr, addrvalid, data, datavalid, globalreset, clk);


    output want_addr; 
    reg want_addr;
    input addr_ready; 
    input[10 - 1:0] addrin; 
    output want_data; 
    reg want_data;
    input data_ready; 
    input[32 - 1:0] datain; 

    input[10 - 1:0] addr; 
    input addrvalid; 
    output[32 - 1:0] data; 
    reg[32 - 1:0] data;
    output datavalid; 
    reg datavalid;
    input globalreset; 
    input clk; 

    reg[2:0] state; 
    reg[2:0] next_state; 
    reg[10 - 1:0] waddr; 
    wire[10 - 1:0] saddr; 
    wire[32 - 1:0] dataout; 
    reg we; 
reg		[32 - 1:0]temp_data; 
reg     [10 - 1:0]temp_waddr ; 
reg     temp_datavalid;

    assign saddr = (state != 0) ? waddr : addr ;

    spramblock ramblock(we, saddr, datain, dataout, clk); 

    always @(posedge clk)
    begin
       if (globalreset == 1'b1)
       begin
          state <= 0 ; 
          waddr <= 0;
          data <= 0;
          datavalid <= 1'b0 ; 
       end
       else

       begin
          state <= next_state ; 
		data <= temp_data; 
       waddr <= temp_waddr ; 
       datavalid <= temp_datavalid;
       end 
    end 

    always @(state or addr_ready or data_ready or addrvalid or datavalid)

    begin
       case (state)
          0 :
                   begin
				       we = 1'b0 ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b0 ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 1 ; 
                      end

                      else if (addrvalid == 1'b1 & datavalid == 1'b0)
                      begin
                         next_state = 5 ; 
                      end
                      else
                      begin
                         next_state = 0 ; 
                      end 
          if (addr_ready == 1'b1)
                         begin
                            temp_waddr = addrin ; 
                         end 
                         if (addrvalid == 1'b0)
                         begin
                            temp_datavalid = 1'b0 ; 

                         end 

                   end
          5 :
                   begin
				       we = 1'b0 ; 
				       want_addr = 1'b1 ; 
				       want_data = 1'b0 ; 
                      next_state = 0 ; 

					temp_data = dataout ; 

                         temp_datavalid = 1'b1 ; 

                   end
          1 :
                   begin
				       we = 1'b0 ; 
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
                   end
          2 :
                   begin
				       want_addr = 1'b1 ; 
                      want_data = 1'b1 ; 
                      if (addr_ready == 1'b1)
                      begin
                         next_state = 4 ; 
                      end
                      else if (data_ready == 1'b1)
                      begin
                         we = 1'b1 ; 

                         next_state = 3 ; 
                      end
                      else
                      begin
                         next_state = 2 ; 
                      end 
                         if (data_ready == 1'b1)
                         begin
                            temp_waddr = waddr + 1 ; 
                         end 

                   end
          3 :
                   begin
				       we = 1'b0 ; 
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
                   end
          4 :
                   begin
				       we = 1'b0 ; 
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
                   end
       endcase 
    end 
 endmodule
 module spramblock (we, addr, datain, dataout, clk);

    input we; 
    input[10 - 1:0] addr; 
    input[32 - 1:0] datain; 
    output[32 - 1:0] dataout; 
    wire[32 - 1:0] dataout;
    input clk; 



defparam new_ram.ADDR_WIDTH = 10;
defparam new_ram.DATA_WIDTH = 32;
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
