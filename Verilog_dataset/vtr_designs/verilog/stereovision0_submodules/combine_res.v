
module combine_res (clk, wen, din_1, din_2, din_3, dout);

    input clk; 
    input wen; 
    input[7:0] din_1; 
    input[8:0] din_2; 
    input[8:0] din_3; 
    output[10:0] dout; 
    reg[10:0] dout;
    reg[8:0] din_1_reg; 
    reg[8:0] din_2_reg; 
    reg[8:0] din_3_reg; 
    reg[10:0] add_tmp; 
    reg[10:0] dout_reg; 

    always @(posedge clk)
    begin
          if (wen == 1'b1)
          begin
             din_1_reg <= {din_1[7], din_1} ; 
             din_2_reg <= din_2 ; 
             din_3_reg <= din_3 ; 
             dout <= dout_reg ; 
          end 
          add_tmp <= ({din_1_reg[8], din_1_reg[8], din_1_reg}) + ({din_2_reg[8], din_2_reg[8], din_2_reg}) ; 
          dout_reg <= add_tmp + ({din_3_reg[8], din_3_reg[8], din_3_reg}) ; 
       end 
 endmodule
