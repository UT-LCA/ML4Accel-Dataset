	`define WIDTH_4B 4'b1000
`define COEF0_b  29
	`define COEF1_b  101
//	`define COEF2_b  -15
//	`define COEF3_b  -235
//	`define COEF4_b  -15
	`define COEF2_b  15
	`define COEF3_b  235
	`define COEF4_b  15
	`define COEF5_b  101
	`define COEF6_b  29
	`define WIDTH_5B 5'b10000
	`define COEF0_c  4
	`define COEF1_c  42
	`define COEF2_c  163
	`define COEF3_c  255
	`define COEF4_c  163
	`define COEF5_c  42
	`define COEF6_c  4
//	`define COEF0_d  -12
//	`define COEF1_d  -77
//	`define COEF2_d  -148
	`define COEF0_d  12
	`define COEF1_d  77
	`define COEF2_d  148
	`define COEF3_d  0
	`define COEF4_d  148
	`define COEF5_d  77
	`define COEF6_d  12
	`define COEF0_1  15
//`define COEF0_1  -15
	`define COEF1_1  25
	`define COEF2_1  193
	`define COEF3_1  0
//	`define COEF4_1  -193
//	`define COEF5_1  -25
	`define COEF4_1  193
	`define COEF5_1  25
	`define COEF6_1  15
	`define COEF0_2  4
	`define COEF1_2  42
	`define COEF2_2  163
	`define COEF3_2  255
	`define COEF4_2  163
	`define COEF5_2  42
	`define COEF6_2  4
//	`define COEF0_3  -9
//	`define COEF1_3  -56
//	`define COEF2_3  -109
	`define COEF0_3  9
	`define COEF1_3  56
	`define COEF2_3  109
	`define COEF3_3  0
	`define COEF4_3  109
	`define COEF5_3  56
	`define COEF6_3  9
//	`define COEF0_4  -9
//	`define COEF1_4  -56
//	`define COEF2_4  -109
	`define COEF0_4  9
	`define COEF1_4  56
	`define COEF2_4  109
	`define COEF3_4  0
	`define COEF4_4  109
	`define COEF5_4  56
	`define COEF6_4  9

module port_bus_2to1 (clk, vidin_addr_reg, svid_comp_switch, vidin_new_data_scld_1_2to3_left, 
					vidin_data_reg_scld_1_2to3_left_rp, vidin_data_reg_scld_1_2to3_left_ip, 
					vidin_data_reg_scld_1_2to3_left_rn, vidin_data_reg_scld_1_2to3_left_in, 
					vidin_data_reg_scld_2_2to3_left_rp, vidin_data_reg_scld_2_2to3_left_ip, 
					vidin_data_reg_scld_2_2to3_left_rn, vidin_data_reg_scld_2_2to3_left_in, 
					vidin_data_reg_scld_4_2to3_left_rp, vidin_data_reg_scld_4_2to3_left_ip, 
					vidin_data_reg_scld_4_2to3_left_rn, vidin_data_reg_scld_4_2to3_left_in, 
					vidin_data_reg_scld_1_2to3_right_rp, vidin_data_reg_scld_1_2to3_right_ip, 
					vidin_data_reg_scld_1_2to3_right_rn, vidin_data_reg_scld_1_2to3_right_in, 
					vidin_data_reg_scld_2_2to3_right_rp, vidin_data_reg_scld_2_2to3_right_ip, 
					vidin_data_reg_scld_2_2to3_right_rn, vidin_data_reg_scld_2_2to3_right_in, 
					vidin_data_reg_scld_4_2to3_right_rp, vidin_data_reg_scld_4_2to3_right_ip, 
					vidin_data_reg_scld_4_2to3_right_rn, vidin_data_reg_scld_4_2to3_right_in, 
					bus_word_3, bus_word_4, bus_word_5, bus_word_6, counter_out); 
   input clk; 
   input[18:0] vidin_addr_reg; 
   input svid_comp_switch; 
   input vidin_new_data_scld_1_2to3_left; 
   input[15:0] vidin_data_reg_scld_1_2to3_left_rp; 
   input[15:0] vidin_data_reg_scld_1_2to3_left_ip; 
   input[15:0] vidin_data_reg_scld_1_2to3_left_rn; 
   input[15:0] vidin_data_reg_scld_1_2to3_left_in; 
   input[15:0] vidin_data_reg_scld_2_2to3_left_rp; 
   input[15:0] vidin_data_reg_scld_2_2to3_left_ip; 
   input[15:0] vidin_data_reg_scld_2_2to3_left_rn; 
   input[15:0] vidin_data_reg_scld_2_2to3_left_in; 
   input[15:0] vidin_data_reg_scld_4_2to3_left_rp; 
   input[15:0] vidin_data_reg_scld_4_2to3_left_ip; 
   input[15:0] vidin_data_reg_scld_4_2to3_left_rn; 
   input[15:0] vidin_data_reg_scld_4_2to3_left_in; 
   input[15:0] vidin_data_reg_scld_1_2to3_right_rp; 
   input[15:0] vidin_data_reg_scld_1_2to3_right_ip; 
   input[15:0] vidin_data_reg_scld_1_2to3_right_rn; 
   input[15:0] vidin_data_reg_scld_1_2to3_right_in; 
   input[15:0] vidin_data_reg_scld_2_2to3_right_rp; 
   input[15:0] vidin_data_reg_scld_2_2to3_right_ip; 
   input[15:0] vidin_data_reg_scld_2_2to3_right_rn; 
   input[15:0] vidin_data_reg_scld_2_2to3_right_in; 
   input[15:0] vidin_data_reg_scld_4_2to3_right_rp; 
   input[15:0] vidin_data_reg_scld_4_2to3_right_ip; 
   input[15:0] vidin_data_reg_scld_4_2to3_right_rn; 
   input[15:0] vidin_data_reg_scld_4_2to3_right_in; 
   output[15:0] bus_word_3; 
   reg[15:0] bus_word_3;
   output[15:0] bus_word_4; 
   reg[15:0] bus_word_4;
   output[15:0] bus_word_5; 
   reg[15:0] bus_word_5;
   output[15:0] bus_word_6; 
   reg[15:0] bus_word_6;
   output[2:0] counter_out; 
   reg[2:0] counter_out;

   reg[15:0] bus_word_3_tmp; 
   reg[15:0] bus_word_4_tmp; 
   reg[15:0] bus_word_5_tmp; 
   reg[15:0] bus_word_6_tmp; 
   reg[18:0] vidin_addr_reg_tmp; 
   reg svid_comp_switch_tmp; 
   wire vidin_new_data_scld_1_2to3_left_tmp; 
   wire vidin_new_data_scld_2_2to3_left_tmp; 
   wire vidin_new_data_scld_4_2to3_left_tmp; 
   wire vidin_new_data_scld_1_2to3_right_tmp; 
   wire vidin_new_data_scld_2_2to3_right_tmp; 
   wire vidin_new_data_scld_4_2to3_right_tmp; 
   reg[3:0] counter; 
   reg[2:0] counter_out_tmp; 

   reg[15:0] vidin_data_reg_scld_1_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_in_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_in_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_in_tmp; 

   always @(posedge clk)
   begin
         if (vidin_new_data_scld_1_2to3_left == 1'b1)
         begin
            counter <= 4'b0001 ; 
         end
         else
         begin
            case (counter)
               4'b0000 :
                        begin
                           counter <= 4'b1000 ; 
                        end
               4'b0001 :
                        begin
                           counter <= 4'b0010 ; 
                        end
               4'b0010 :
                        begin
                           counter <= 4'b0011 ; 
                        end
               4'b0011 :
                        begin
                           counter <= 4'b0100 ; 
                        end
               4'b0100 :
                        begin
                           counter <= 4'b0101 ; 
                        end
               4'b0101 :
                        begin
                           counter <= 4'b0110 ; 
                        end
               4'b0110 :
                        begin
                           counter <= 4'b0111 ; 
                        end
               4'b0111 :
                        begin
                           counter <= 4'b1000 ; 
                        end
               4'b1000 :
                        begin
                           counter <= 4'b1000 ; 
                        end
               default :
                        begin
                           counter <= 4'b1000 ; 
                        end
            endcase 
         end 
   end 

   always @(posedge clk)
   begin
         case (counter[2:0])
            3'b000 :
                     begin
                        counter_out_tmp <= 3'b000 ; 
                        bus_word_3_tmp <= 16'b0000000000000000 ; 
                        bus_word_4_tmp <= 16'b0000000000000000 ; 
                        bus_word_5_tmp <= 16'b0000000000000000 ; 
                        bus_word_6_tmp <= 16'b0000000000000000 ; 
                     end
            3'b001 :
                     begin
                        counter_out_tmp <= 3'b001 ; 
                        bus_word_3_tmp <= vidin_addr_reg_tmp[15:0] ; 
                        bus_word_4_tmp <= {vidin_addr_reg_tmp[18:16], svid_comp_switch_tmp, 12'b000000000000} ; 
                        bus_word_5_tmp <= 16'b0000000000000000 ; 
                        bus_word_6_tmp <= 16'b0000000000000000 ; 
                     end
            3'b010 :
                     begin
                        counter_out_tmp <= 3'b010 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_1_2to3_left_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_1_2to3_left_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_1_2to3_left_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_1_2to3_left_in_tmp ; 
                     end
            3'b011 :
                     begin
                        counter_out_tmp <= 3'b011 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_1_2to3_right_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_1_2to3_right_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_1_2to3_right_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_1_2to3_right_in_tmp ; 
                     end
            3'b100 :
                     begin
                        counter_out_tmp <= 3'b100 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_2_2to3_left_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_2_2to3_left_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_2_2to3_left_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_2_2to3_left_in_tmp ; 
                     end
            3'b101 :
                     begin
                        counter_out_tmp <= 3'b101 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_2_2to3_right_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_2_2to3_right_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_2_2to3_right_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_2_2to3_right_in_tmp ; 
                     end

            3'b110 :
                     begin
                        counter_out_tmp <= 3'b110 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_4_2to3_left_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_4_2to3_left_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_4_2to3_left_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_4_2to3_left_in_tmp ; 
                     end
            3'b111 :
                     begin
                        counter_out_tmp <= 3'b111 ; 
                        bus_word_3_tmp <= vidin_data_reg_scld_4_2to3_right_rp_tmp ; 
                        bus_word_4_tmp <= vidin_data_reg_scld_4_2to3_right_ip_tmp ; 
                        bus_word_5_tmp <= vidin_data_reg_scld_4_2to3_right_rn_tmp ; 
                        bus_word_6_tmp <= vidin_data_reg_scld_4_2to3_right_in_tmp ; 
                     end
         endcase 
   end 

   always @(posedge clk)
   begin
         counter_out <= counter_out_tmp ; 
         bus_word_3 <= bus_word_3_tmp ; 
         bus_word_4 <= bus_word_4_tmp ; 
         bus_word_5 <= bus_word_5_tmp ; 
         bus_word_6 <= bus_word_6_tmp ; 
         if (vidin_new_data_scld_1_2to3_left == 1'b1)
         begin
            vidin_addr_reg_tmp <= vidin_addr_reg ; 
            svid_comp_switch_tmp <= svid_comp_switch ; 
            vidin_data_reg_scld_1_2to3_left_rp_tmp <= vidin_data_reg_scld_1_2to3_left_rp ; 
            vidin_data_reg_scld_2_2to3_left_rp_tmp <= vidin_data_reg_scld_2_2to3_left_rp ; 
            vidin_data_reg_scld_4_2to3_left_rp_tmp <= vidin_data_reg_scld_4_2to3_left_rp ; 
            vidin_data_reg_scld_1_2to3_right_rp_tmp <= vidin_data_reg_scld_1_2to3_right_rp ; 
            vidin_data_reg_scld_2_2to3_right_rp_tmp <= vidin_data_reg_scld_2_2to3_right_rp ; 
            vidin_data_reg_scld_4_2to3_right_rp_tmp <= vidin_data_reg_scld_4_2to3_right_rp ; 
            vidin_data_reg_scld_1_2to3_left_ip_tmp <= vidin_data_reg_scld_1_2to3_left_ip ; 
            vidin_data_reg_scld_2_2to3_left_ip_tmp <= vidin_data_reg_scld_2_2to3_left_ip ; 
            vidin_data_reg_scld_4_2to3_left_ip_tmp <= vidin_data_reg_scld_4_2to3_left_ip ; 
            vidin_data_reg_scld_1_2to3_right_ip_tmp <= vidin_data_reg_scld_1_2to3_right_ip ; 
            vidin_data_reg_scld_2_2to3_right_ip_tmp <= vidin_data_reg_scld_2_2to3_right_ip ; 
            vidin_data_reg_scld_4_2to3_right_ip_tmp <= vidin_data_reg_scld_4_2to3_right_ip ; 
            vidin_data_reg_scld_1_2to3_left_rn_tmp <= vidin_data_reg_scld_1_2to3_left_rn ; 
            vidin_data_reg_scld_2_2to3_left_rn_tmp <= vidin_data_reg_scld_2_2to3_left_rn ; 
            vidin_data_reg_scld_4_2to3_left_rn_tmp <= vidin_data_reg_scld_4_2to3_left_rn ; 
            vidin_data_reg_scld_1_2to3_right_rn_tmp <= vidin_data_reg_scld_1_2to3_right_rn ; 
            vidin_data_reg_scld_2_2to3_right_rn_tmp <= vidin_data_reg_scld_2_2to3_right_rn ; 
            vidin_data_reg_scld_4_2to3_right_rn_tmp <= vidin_data_reg_scld_4_2to3_right_rn ; 
            vidin_data_reg_scld_1_2to3_left_in_tmp <= vidin_data_reg_scld_1_2to3_left_in ; 
            vidin_data_reg_scld_2_2to3_left_in_tmp <= vidin_data_reg_scld_2_2to3_left_in ; 
            vidin_data_reg_scld_4_2to3_left_in_tmp <= vidin_data_reg_scld_4_2to3_left_in ; 
            vidin_data_reg_scld_1_2to3_right_in_tmp <= vidin_data_reg_scld_1_2to3_right_in ; 
            vidin_data_reg_scld_2_2to3_right_in_tmp <= vidin_data_reg_scld_2_2to3_right_in ; 
            vidin_data_reg_scld_4_2to3_right_in_tmp <= vidin_data_reg_scld_4_2to3_right_in ; 
         end 
   end 
endmodule
