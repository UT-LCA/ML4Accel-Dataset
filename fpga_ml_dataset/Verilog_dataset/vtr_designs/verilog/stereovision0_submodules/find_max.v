
module find_max (clk, wen, 
    d_in0, 
    d_in1, 
    d_in2, 
    d_in3, 
    d_in4, 
    d_in5, 
    d_in6, 
    d_in7, 
    d_in8, 
    d_in9, 
    d_in10, 
    d_in11, 
    d_in12, 
    d_in13, 
    d_in14, 
    d_in15, 
    d_in16, 
    d_in17, 
    d_in18, 
    d_in19, 
    d_in20, 
d_out, indx_out);

    input clk; 
    input wen; 
    input[10:0] d_in0; 
    input[10:0] d_in1; 
    input[10:0] d_in2; 
    input[10:0] d_in3; 
    input[10:0] d_in4; 
    input[10:0] d_in5; 
    input[10:0] d_in6; 
    input[10:0] d_in7; 
    input[10:0] d_in8; 
    input[10:0] d_in9; 
    input[10:0] d_in10; 
    input[10:0] d_in11; 
    input[10:0] d_in12; 
    input[10:0] d_in13; 
    input[10:0] d_in14; 
    input[10:0] d_in15; 
    input[10:0] d_in16; 
    input[10:0] d_in17; 
    input[10:0] d_in18; 
    input[10:0] d_in19; 
    input[10:0] d_in20; 
    reg[10:0] d_in_tmp0; 
    reg[10:0] d_in_tmp1; 
    reg[10:0] d_in_tmp2; 
    reg[10:0] d_in_tmp3; 
    reg[10:0] d_in_tmp4; 
    reg[10:0] d_in_tmp5; 
    reg[10:0] d_in_tmp6; 
    reg[10:0] d_in_tmp7; 
    reg[10:0] d_in_tmp8; 
    reg[10:0] d_in_tmp9; 
    reg[10:0] d_in_tmp10; 
    reg[10:0] d_in_tmp11; 
    reg[10:0] d_in_tmp12; 
    reg[10:0] d_in_tmp13; 
    reg[10:0] d_in_tmp14; 
    reg[10:0] d_in_tmp15; 
    reg[10:0] d_in_tmp16; 
    reg[10:0] d_in_tmp17; 
    reg[10:0] d_in_tmp18; 
    reg[10:0] d_in_tmp19; 
    reg[10:0] d_in_tmp20; 
    output[7:0] d_out; 
    reg[7:0] d_out;
    output[4:0] indx_out; 
    reg[4:0] indx_out;
    reg[10:0] res_1_1; 
    reg[10:0] res_1_2; 
    reg[10:0] res_1_3; 
    reg[10:0] res_1_4; 
    reg[10:0] res_1_5; 
    reg[10:0] res_1_6; 
    reg[10:0] res_1_7; 
    reg[10:0] res_1_8; 
    reg[10:0] res_1_9; 
    reg[10:0] res_1_10; 
    reg[10:0] res_1_11; 
    reg[10:0] res_2_1; 
    reg[10:0] res_2_2; 
    reg[10:0] res_2_3; 
    reg[10:0] res_2_4; 
    reg[10:0] res_2_5; 
    reg[10:0] res_2_6; 
    reg[10:0] res_3_1; 
    reg[10:0] res_3_2; 
    reg[10:0] res_3_3; 
    reg[10:0] res_4_1; 
    reg[10:0] res_4_2; 
    reg[10:0] res_5_1; 
    reg[4:0] indx_1_1; 
    reg[4:0] indx_1_2; 
    reg[4:0] indx_1_3; 
    reg[4:0] indx_1_4; 
    reg[4:0] indx_1_5; 
    reg[4:0] indx_1_6; 
    reg[4:0] indx_1_7; 
    reg[4:0] indx_1_8; 
    reg[4:0] indx_1_9; 
    reg[4:0] indx_1_10; 
    reg[4:0] indx_1_11; 
    reg[4:0] indx_2_1; 
    reg[4:0] indx_2_2; 
    reg[4:0] indx_2_3; 
    reg[4:0] indx_2_4; 
    reg[4:0] indx_2_5; 
    reg[4:0] indx_2_6; 
    reg[4:0] indx_3_1; 
    reg[4:0] indx_3_2; 
    reg[4:0] indx_3_3; 
    reg[4:0] indx_4_1; 
    reg[4:0] indx_4_2; 
    reg[4:0] indx_5_1; 

    always @(posedge clk)
    begin
          if (wen == 1'b1)
          begin
            d_in_tmp0 <= d_in0 ; 
            d_in_tmp1 <= d_in1 ; 
            d_in_tmp2 <= d_in2 ; 
            d_in_tmp3 <= d_in3 ; 
            d_in_tmp4 <= d_in4 ; 
            d_in_tmp5<= d_in5 ; 
            d_in_tmp6 <= d_in6 ; 
            d_in_tmp7 <= d_in7 ; 
            d_in_tmp8 <= d_in8 ; 
            d_in_tmp9 <= d_in9 ; 
            d_in_tmp10 <= d_in10 ; 
            d_in_tmp11 <= d_in11 ; 
            d_in_tmp12 <= d_in12 ; 
            d_in_tmp13 <= d_in13 ; 
            d_in_tmp14 <= d_in14 ; 
            d_in_tmp15 <= d_in15; 
            d_in_tmp16 <= d_in16 ; 
            d_in_tmp17 <= d_in17 ; 
            d_in_tmp18 <= d_in18 ; 
            d_in_tmp19 <= d_in19 ; 
            d_in_tmp20 <= d_in20 ; 
             d_out <= res_5_1[10:3] ; 
             indx_out <= indx_5_1 ; 
          end 

          if (d_in0 > d_in1)
          begin
             res_1_1 <= d_in0 ; 
             indx_1_1 <= 5'b00000 ; 
          end
          else
          begin
             res_1_1 <= d_in1 ; 
             indx_1_1 <= 5'b00001 ; 
          end 
          if (d_in2 > d_in3)
          begin
             res_1_2 <= d_in2 ; 
             indx_1_2 <= 5'b00010 ; 
          end
          else
          begin
             res_1_2 <= d_in3 ; 
             indx_1_2 <= 5'b00011 ; 
          end 
          if (d_in4 > d_in5)
          begin
             res_1_3 <= d_in4 ; 
             indx_1_3 <= 5'b00100 ; 
          end
          else
          begin
             res_1_3 <= d_in5 ; 
             indx_1_3 <= 5'b00101 ; 
          end 
          if (d_in6 > d_in7)
          begin

             res_1_4 <= d_in6 ; 
             indx_1_4 <= 5'b00110 ; 
          end
          else
          begin
             res_1_4 <= d_in7 ; 
             indx_1_4 <= 5'b00111 ; 
          end 
          if (d_in8 > d_in9)
          begin
             res_1_5 <= d_in8 ; 
             indx_1_5 <= 5'b01000 ; 
          end
          else
          begin
             res_1_5 <= d_in9 ; 
             indx_1_5 <= 5'b01001 ; 
          end 
          if (d_in10 > d_in11)
       begin
             res_1_6 <= d_in10 ; 
             indx_1_6 <= 5'b01010 ; 
          end
          else
          begin
             res_1_6 <= d_in11 ; 
             indx_1_6 <= 5'b01011 ; 
          end 
          if (d_in12 > d_in13)
          begin
             res_1_7 <= d_in12 ; 
             indx_1_7 <= 5'b01100 ; 
          end
          else
          begin
             res_1_7 <= d_in13 ; 
             indx_1_7 <= 5'b01101 ; 
          end 
          if (d_in14 > d_in15)
          begin
             res_1_8 <= d_in14 ; 
             indx_1_8 <= 5'b01110 ; 
          end
          else
          begin
             res_1_8 <= d_in15 ; 
             indx_1_8 <= 5'b01111 ; 
          end 
          if (d_in16 > d_in17)
          begin
             res_1_9 <= d_in16 ; 
             indx_1_9 <= 5'b10000 ; 
          end
          else
          begin
             res_1_9 <= d_in17 ; 
             indx_1_9 <= 5'b10001 ; 
          end 
          if (d_in18 > d_in19)
          begin
             res_1_10 <= d_in18 ; 
             indx_1_10 <= 5'b10010 ; 
          end
          else
          begin
             res_1_10 <= d_in19 ; 
             indx_1_10 <= 5'b10011 ; 
          end 
          res_1_11 <= d_in20 ; 
          indx_1_11 <= 5'b10100 ; 
          if (res_1_1 > res_1_2)
          begin
             res_2_1 <= res_1_1 ; 
             indx_2_1 <= indx_1_1 ; 
          end
          else
          begin
             res_2_1 <= res_1_2 ; 
             indx_2_1 <= indx_1_2 ; 
          end 
          if (res_1_3 > res_1_4)
          begin
             res_2_2 <= res_1_3 ; 
             indx_2_2 <= indx_1_3 ; 
          end
          else
          begin
             res_2_2 <= res_1_4 ; 
             indx_2_2 <= indx_1_4 ; 
          end 
          if (res_1_5 > res_1_6)
          begin
             res_2_3 <= res_1_5 ; 
             indx_2_3 <= indx_1_5 ; 
          end
          else
          begin
             res_2_3 <= res_1_6 ; 
             indx_2_3 <= indx_1_6 ; 
          end 
          if (res_1_7 > res_1_8)
          begin
             res_2_4 <= res_1_7 ; 
             indx_2_4 <= indx_1_7 ; 
          end
          else
          begin
             res_2_4 <= res_1_8 ; 
             indx_2_4 <= indx_1_8 ; 
          end 
          if (res_1_9 > res_1_10)
          begin
             res_2_5 <= res_1_9 ; 
             indx_2_5 <= indx_1_9 ; 
          end
          else
          begin
             res_2_5 <= res_1_10 ; 
             indx_2_5 <= indx_1_10 ; 
          end 
          res_2_6 <= res_1_11 ; 
          indx_2_6 <= indx_1_11 ; 
          if (res_2_1 > res_2_2)
          begin
             res_3_1 <= res_2_1 ; 
             indx_3_1 <= indx_2_1 ; 
          end
          else
          begin
             res_3_1 <= res_2_2 ; 
             indx_3_1 <= indx_2_2 ; 
          end 
          if (res_2_3 > res_2_4)
          begin
             res_3_2 <= res_2_3 ; 
             indx_3_2 <= indx_2_3 ; 
          end
          else
          begin
             res_3_2 <= res_2_4 ; 
             indx_3_2 <= indx_2_4 ; 
          end 
          if (res_2_5 > res_2_6)
          begin
             res_3_3 <= res_2_5 ; 
             indx_3_3 <= indx_2_5 ; 
          end
          else
          begin
             res_3_3 <= res_2_6 ; 
             indx_3_3 <= indx_2_6 ; 
          end 
          if (res_3_1 > res_3_2)
          begin
             res_4_1 <= res_3_1 ; 
             indx_4_1 <= indx_3_1 ; 
          end
          else
          begin
             res_4_1 <= res_3_2 ; 
             indx_4_1 <= indx_3_2 ; 
          end 
          res_4_2 <= res_3_3 ; 
          indx_4_2 <= indx_3_3 ; 
          if (res_4_1 > res_4_2)
          begin
             res_5_1 <= res_4_1 ; 
             indx_5_1 <= indx_4_1 ; 
          end
          else
          begin
             res_5_1 <= res_4_2 ; 
             indx_5_1 <= indx_4_2 ; 
          end 
    end 
 endmodule
