
module sh_reg_1 (clk, wen, din_1, dout_1);

   input clk; 
   input wen; 
   input[8 - 1:0] din_1; 
   output[8 - 1:0] dout_1; 
   reg[8 - 1:0] dout_1;

   always @(posedge clk)
   begin
         if (wen == 1'b1)
         begin
            dout_1 <= din_1 ; 
         end 
   end 
endmodule
