
module lp_fltr (clk, din, dout, ce);

   input clk; 
   input[8 - 1:0] din; 
   output[8 - 1:0] dout; 
   reg[8 - 1:0] dout;
   input ce; 

   reg[8 - 1:0] din_tmp_1; 
   reg[8 - 1:0] din_tmp_2; 
   reg[8 - 1:0] din_tmp_3; 
   reg[(8 + 2) - 1:0] sum_tmp_1; 
   reg[(8 + 2) - 1:0] sum_tmp_2; 
   reg[(8 + 2) - 1:0] sum_tmp_3; 
   reg[(8 + 2) - 1:0] add_tmp_1; 
   reg[(8 + 2) - 1:0] add_tmp_2; 

   always @(posedge clk)
   begin
         if (ce == 1'b1)
         begin
            din_tmp_1 <= din ; 
            din_tmp_2 <= din_tmp_1 ; 
            din_tmp_3 <= din_tmp_2 ; 
            dout <= add_tmp_2[(8 + 2) - 1:2] ; 
         end 
         sum_tmp_1 <= {din_tmp_1[8 - 1], din_tmp_1[8 - 1], din_tmp_1} ; 
         sum_tmp_2 <= {din_tmp_2[8 - 1], din_tmp_2, 1'b0} ; 
         sum_tmp_3 <= {din_tmp_3[8 - 1], din_tmp_3[8 - 1], din_tmp_3} ; 
         add_tmp_1 <= sum_tmp_1 + sum_tmp_2 ; 
         add_tmp_2 <= add_tmp_1 + sum_tmp_3 ; 
   end 
endmodule
