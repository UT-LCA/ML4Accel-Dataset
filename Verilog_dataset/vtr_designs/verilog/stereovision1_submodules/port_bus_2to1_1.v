
module port_bus_2to1_1 (clk, vidin_addr_reg, svid_comp_switch, vidin_new_data_scld_1_2to3_left, 
						vidin_data_reg_scld_1_2to3_left_rp, vidin_data_reg_scld_1_2to3_left_ip, 
						vidin_data_reg_scld_1_2to3_left_rn, vidin_data_reg_scld_1_2to3_left_in, 
						vidin_new_data_scld_2_2to3_left, vidin_data_reg_scld_2_2to3_left_rp, 
						vidin_data_reg_scld_2_2to3_left_ip, vidin_data_reg_scld_2_2to3_left_rn, 
						vidin_data_reg_scld_2_2to3_left_in, vidin_new_data_scld_4_2to3_left, 
						vidin_data_reg_scld_4_2to3_left_rp, vidin_data_reg_scld_4_2to3_left_ip, 
						vidin_data_reg_scld_4_2to3_left_rn, vidin_data_reg_scld_4_2to3_left_in, 
						vidin_new_data_scld_1_2to3_right, vidin_data_reg_scld_1_2to3_right_rp, 
						vidin_data_reg_scld_1_2to3_right_ip, vidin_data_reg_scld_1_2to3_right_rn, 
						vidin_data_reg_scld_1_2to3_right_in, vidin_new_data_scld_2_2to3_right, 
						vidin_data_reg_scld_2_2to3_right_rp, vidin_data_reg_scld_2_2to3_right_ip, 
						vidin_data_reg_scld_2_2to3_right_rn, vidin_data_reg_scld_2_2to3_right_in, 
						vidin_new_data_scld_4_2to3_right, vidin_data_reg_scld_4_2to3_right_rp, 
						vidin_data_reg_scld_4_2to3_right_ip, vidin_data_reg_scld_4_2to3_right_rn, 
						vidin_data_reg_scld_4_2to3_right_in, bus_word_3, bus_word_4, bus_word_5, 
						bus_word_6, counter_out, rst); 
   input clk; 
   input rst; 
   output[18:0] vidin_addr_reg; 
   reg[18:0] vidin_addr_reg;
   output svid_comp_switch; 
   reg svid_comp_switch;
   output vidin_new_data_scld_1_2to3_left; 
   reg vidin_new_data_scld_1_2to3_left;
   output[15:0] vidin_data_reg_scld_1_2to3_left_rp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_rp;
   output[15:0] vidin_data_reg_scld_1_2to3_left_ip; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_ip;
   output[15:0] vidin_data_reg_scld_1_2to3_left_rn; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_rn;
   output[15:0] vidin_data_reg_scld_1_2to3_left_in; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_in;
   output vidin_new_data_scld_2_2to3_left; 
   reg vidin_new_data_scld_2_2to3_left;
   output[15:0] vidin_data_reg_scld_2_2to3_left_rp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rp;
   output[15:0] vidin_data_reg_scld_2_2to3_left_ip; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_ip;
   output[15:0] vidin_data_reg_scld_2_2to3_left_rn; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rn;
   output[15:0] vidin_data_reg_scld_2_2to3_left_in; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_in;
   output vidin_new_data_scld_4_2to3_left; 
   reg vidin_new_data_scld_4_2to3_left;
   output[15:0] vidin_data_reg_scld_4_2to3_left_rp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rp;
   output[15:0] vidin_data_reg_scld_4_2to3_left_ip; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_ip;
   output[15:0] vidin_data_reg_scld_4_2to3_left_rn; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rn;
   output[15:0] vidin_data_reg_scld_4_2to3_left_in; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_in;
   output vidin_new_data_scld_1_2to3_right; 
   reg vidin_new_data_scld_1_2to3_right;
   output[15:0] vidin_data_reg_scld_1_2to3_right_rp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rp;
   output[15:0] vidin_data_reg_scld_1_2to3_right_ip; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_ip;
   output[15:0] vidin_data_reg_scld_1_2to3_right_rn; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rn;
   output[15:0] vidin_data_reg_scld_1_2to3_right_in; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_in;
   output vidin_new_data_scld_2_2to3_right; 
   reg vidin_new_data_scld_2_2to3_right;
   output[15:0] vidin_data_reg_scld_2_2to3_right_rp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rp;
   output[15:0] vidin_data_reg_scld_2_2to3_right_ip; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_ip;
   output[15:0] vidin_data_reg_scld_2_2to3_right_rn; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rn;
   output[15:0] vidin_data_reg_scld_2_2to3_right_in; 

   reg[15:0] vidin_data_reg_scld_2_2to3_right_in;
   output vidin_new_data_scld_4_2to3_right; 
   reg vidin_new_data_scld_4_2to3_right;
   output[15:0] vidin_data_reg_scld_4_2to3_right_rp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rp;
   output[15:0] vidin_data_reg_scld_4_2to3_right_ip; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_ip;
   output[15:0] vidin_data_reg_scld_4_2to3_right_rn; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rn;
   output[15:0] vidin_data_reg_scld_4_2to3_right_in; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_in;
   input[15:0] bus_word_3; 
   input[15:0] bus_word_4; 
   input[15:0] bus_word_5; 
   input[15:0] bus_word_6; 
   input[2:0] counter_out; 

   reg[15:0] bus_word_3_tmp; 
   reg[15:0] bus_word_4_tmp; 
   reg[15:0] bus_word_5_tmp; 
   reg[15:0] bus_word_6_tmp; 
   reg[18:0] vidin_addr_reg_tmp; 
   reg svid_comp_switch_tmp; 
/*
   reg vidin_new_data_scld_1_2to3_left_tmp; 
   reg vidin_new_data_scld_2_2to3_left_tmp; 
   reg vidin_new_data_scld_4_2to3_left_tmp; 
   reg vidin_new_data_scld_1_2to3_right_tmp; 
   reg vidin_new_data_scld_2_2to3_right_tmp; 
   reg vidin_new_data_scld_4_2to3_right_tmp; 
*/
   reg[2:0] counter_out_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_left_in_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_1_2to3_right_in_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_2_2to3_right_in_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rp_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_ip_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_rn_tmp; 
   reg[15:0] vidin_data_reg_scld_4_2to3_right_in_tmp; 

   always @(posedge clk)
   begin
         case (counter_out_tmp[2:0])
// took out noop case 3'b000
            3'b001 :
                     begin
                        vidin_addr_reg_tmp[15:0] <= bus_word_3_tmp ; 
                        vidin_addr_reg_tmp[18:16] <= bus_word_4_tmp[15:13] ; 

                       svid_comp_switch_tmp <= bus_word_4_tmp[12] ; 
/*
                        vidin_new_data_scld_1_2to3_left_tmp <= bus_word_4_tmp[11] ; 
                        vidin_new_data_scld_2_2to3_left_tmp <= bus_word_4_tmp[10] ; 
                        vidin_new_data_scld_4_2to3_left_tmp <= bus_word_4_tmp[9] ; 
                        vidin_new_data_scld_1_2to3_right_tmp <= bus_word_4_tmp[8] ; 
                        vidin_new_data_scld_2_2to3_right_tmp <= bus_word_4_tmp[7] ; 
                        vidin_new_data_scld_4_2to3_right_tmp <= bus_word_4_tmp[6] ; 
*/
                     end
            3'b010 :
                     begin
                        vidin_data_reg_scld_1_2to3_left_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_1_2to3_left_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_1_2to3_left_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_1_2to3_left_in_tmp <= bus_word_6_tmp ; 
                     end
            3'b011 :
                     begin
                        vidin_data_reg_scld_1_2to3_right_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_1_2to3_right_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_1_2to3_right_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_1_2to3_right_in_tmp <= bus_word_6_tmp ; 
                     end
            3'b100 :
                     begin
                        vidin_data_reg_scld_2_2to3_left_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_2_2to3_left_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_2_2to3_left_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_2_2to3_left_in_tmp <= bus_word_6_tmp ; 
                     end
            3'b101 :
                     begin
                        vidin_data_reg_scld_2_2to3_right_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_2_2to3_right_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_2_2to3_right_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_2_2to3_right_in_tmp <= bus_word_6_tmp ; 
                     end
            3'b110 :
                     begin
                        vidin_data_reg_scld_4_2to3_left_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_4_2to3_left_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_4_2to3_left_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_4_2to3_left_in_tmp <= bus_word_6_tmp ; 
                     end
            3'b111 :
                     begin
                        vidin_data_reg_scld_4_2to3_right_rp_tmp <= bus_word_3_tmp ; 
                        vidin_data_reg_scld_4_2to3_right_ip_tmp <= bus_word_4_tmp ; 
                        vidin_data_reg_scld_4_2to3_right_rn_tmp <= bus_word_5_tmp ; 
                        vidin_data_reg_scld_4_2to3_right_in_tmp <= bus_word_6_tmp ; 
                     end
	default: 
		begin 
			vidin_data_reg_scld_4_2to3_right_rp_tmp <= 0; 
                        vidin_data_reg_scld_4_2to3_right_ip_tmp <= 0; 
                        vidin_data_reg_scld_4_2to3_right_rn_tmp <= 0; 
                        vidin_data_reg_scld_4_2to3_right_in_tmp <= 0; 
			vidin_addr_reg_tmp <= 0; 
			svid_comp_switch_tmp <=0;
		end 
         endcase 
   end 

   always @(posedge clk)
    begin
	if (rst) 
	begin 
         counter_out_tmp <= 0; 
         bus_word_3_tmp  <= 0; 
         bus_word_4_tmp  <= 0; 
         bus_word_5_tmp  <= 0; 
         bus_word_6_tmp  <= 0; 
	end 
	else 
	begin 
         counter_out_tmp <= counter_out ; 
         bus_word_3_tmp <= bus_word_3 ; 
         bus_word_4_tmp <= bus_word_4 ; 
         bus_word_5_tmp <= bus_word_5 ; 
         bus_word_6_tmp <= bus_word_6 ; 
	end 
   end 

   always @(posedge clk)
   begin
	if (counter_out_tmp == 3'b001)
	begin
		vidin_addr_reg <= vidin_addr_reg_tmp ; 
		svid_comp_switch <= svid_comp_switch_tmp ; 
		vidin_new_data_scld_1_2to3_left <= 1'b1 ; 
		if (((vidin_addr_reg_tmp[0]) == 1'b0) && ((vidin_addr_reg_tmp[9]) == 1'b0))
		begin
			vidin_new_data_scld_2_2to3_left <= 1'b1 ; 
			if (((vidin_addr_reg_tmp[1]) == 1'b0) && ((vidin_addr_reg_tmp[10]) == 1'b0))
			begin
				vidin_new_data_scld_4_2to3_left <= 1'b1 ; 
			end 
			else
			begin
				vidin_new_data_scld_4_2to3_left <= vidin_new_data_scld_4_2to3_left;
			end
		end 
		else
		begin
			vidin_new_data_scld_2_2to3_left <= vidin_new_data_scld_4_2to3_left ; 
			vidin_new_data_scld_4_2to3_left <= vidin_new_data_scld_4_2to3_left;
		end
		vidin_new_data_scld_1_2to3_right <= 1'b1 ; 
		vidin_new_data_scld_2_2to3_right <= 1'b1 ; 
		vidin_new_data_scld_4_2to3_right <= 1'b1 ; 
		vidin_data_reg_scld_1_2to3_left_rp <= vidin_data_reg_scld_1_2to3_left_rp_tmp ; 
		vidin_data_reg_scld_1_2to3_left_ip <= vidin_data_reg_scld_1_2to3_left_ip_tmp ; 
		vidin_data_reg_scld_1_2to3_left_rn <= vidin_data_reg_scld_1_2to3_left_rn_tmp ; 
		vidin_data_reg_scld_1_2to3_left_in <= vidin_data_reg_scld_1_2to3_left_in_tmp ; 
		vidin_data_reg_scld_2_2to3_left_rp <= vidin_data_reg_scld_2_2to3_left_rp_tmp ; 
		vidin_data_reg_scld_2_2to3_left_ip <= vidin_data_reg_scld_2_2to3_left_ip_tmp ; 
		vidin_data_reg_scld_2_2to3_left_rn <= vidin_data_reg_scld_2_2to3_left_rn_tmp ; 
		vidin_data_reg_scld_2_2to3_left_in <= vidin_data_reg_scld_2_2to3_left_in_tmp ; 
		vidin_data_reg_scld_4_2to3_left_rp <= vidin_data_reg_scld_4_2to3_left_rp_tmp ; 
		vidin_data_reg_scld_4_2to3_left_ip <= vidin_data_reg_scld_4_2to3_left_ip_tmp ; 
		vidin_data_reg_scld_4_2to3_left_rn <= vidin_data_reg_scld_4_2to3_left_rn_tmp ; 
		vidin_data_reg_scld_4_2to3_left_in <= vidin_data_reg_scld_4_2to3_left_in_tmp ; 
		vidin_data_reg_scld_1_2to3_right_rp <= vidin_data_reg_scld_1_2to3_right_rp_tmp ; 
		vidin_data_reg_scld_1_2to3_right_ip <= vidin_data_reg_scld_1_2to3_right_ip_tmp ; 
		vidin_data_reg_scld_1_2to3_right_rn <= vidin_data_reg_scld_1_2to3_right_rn_tmp ; 
		vidin_data_reg_scld_1_2to3_right_in <= vidin_data_reg_scld_1_2to3_right_in_tmp ; 
		vidin_data_reg_scld_2_2to3_right_rp <= vidin_data_reg_scld_2_2to3_right_rp_tmp ; 
		vidin_data_reg_scld_2_2to3_right_ip <= vidin_data_reg_scld_2_2to3_right_ip_tmp ; 
		vidin_data_reg_scld_2_2to3_right_rn <= vidin_data_reg_scld_2_2to3_right_rn_tmp ; 
		vidin_data_reg_scld_2_2to3_right_in <= vidin_data_reg_scld_2_2to3_right_in_tmp ; 
		vidin_data_reg_scld_4_2to3_right_rp <= vidin_data_reg_scld_4_2to3_right_rp_tmp ; 
		vidin_data_reg_scld_4_2to3_right_ip <= vidin_data_reg_scld_4_2to3_right_ip_tmp ; 
		vidin_data_reg_scld_4_2to3_right_rn <= vidin_data_reg_scld_4_2to3_right_rn_tmp ; 
		vidin_data_reg_scld_4_2to3_right_in <= vidin_data_reg_scld_4_2to3_right_in_tmp ; 
	end
	else
	begin
		vidin_new_data_scld_1_2to3_left <= 1'b0 ; 
		vidin_new_data_scld_2_2to3_left <= 1'b0 ; 
		vidin_new_data_scld_4_2to3_left <= 1'b0 ; 
		vidin_new_data_scld_1_2to3_right <= 1'b0 ; 
		vidin_new_data_scld_2_2to3_right <= 1'b0 ; 
		vidin_new_data_scld_4_2to3_right <= 1'b0 ; 
		vidin_addr_reg <= vidin_addr_reg; 
		svid_comp_switch <= svid_comp_switch; 
		vidin_data_reg_scld_1_2to3_left_rp <= vidin_data_reg_scld_1_2to3_left_rp; 
		vidin_data_reg_scld_1_2to3_left_ip <= vidin_data_reg_scld_1_2to3_left_ip; 
		vidin_data_reg_scld_1_2to3_left_rn <= vidin_data_reg_scld_1_2to3_left_rn; 
		vidin_data_reg_scld_1_2to3_left_in <= vidin_data_reg_scld_1_2to3_left_in; 
		vidin_data_reg_scld_2_2to3_left_rp <= vidin_data_reg_scld_2_2to3_left_rp; 
		vidin_data_reg_scld_2_2to3_left_ip <= vidin_data_reg_scld_2_2to3_left_ip; 
		vidin_data_reg_scld_2_2to3_left_rn <= vidin_data_reg_scld_2_2to3_left_rn; 
		vidin_data_reg_scld_2_2to3_left_in <= vidin_data_reg_scld_2_2to3_left_in; 
		vidin_data_reg_scld_4_2to3_left_rp <= vidin_data_reg_scld_4_2to3_left_rp; 
		vidin_data_reg_scld_4_2to3_left_ip <= vidin_data_reg_scld_4_2to3_left_ip; 
		vidin_data_reg_scld_4_2to3_left_rn <= vidin_data_reg_scld_4_2to3_left_rn; 
		vidin_data_reg_scld_4_2to3_left_in <= vidin_data_reg_scld_4_2to3_left_in; 
		vidin_data_reg_scld_1_2to3_right_rp <= vidin_data_reg_scld_1_2to3_right_rp; 
		vidin_data_reg_scld_1_2to3_right_ip <= vidin_data_reg_scld_1_2to3_right_ip; 
		vidin_data_reg_scld_1_2to3_right_rn <= vidin_data_reg_scld_1_2to3_right_rn; 
		vidin_data_reg_scld_1_2to3_right_in <= vidin_data_reg_scld_1_2to3_right_in; 
		vidin_data_reg_scld_2_2to3_right_rp <= vidin_data_reg_scld_2_2to3_right_rp; 
		vidin_data_reg_scld_2_2to3_right_ip <= vidin_data_reg_scld_2_2to3_right_ip; 
		vidin_data_reg_scld_2_2to3_right_rn <= vidin_data_reg_scld_2_2to3_right_rn; 
		vidin_data_reg_scld_2_2to3_right_in <= vidin_data_reg_scld_2_2to3_right_in; 
		vidin_data_reg_scld_4_2to3_right_rp <= vidin_data_reg_scld_4_2to3_right_rp; 
		vidin_data_reg_scld_4_2to3_right_ip <= vidin_data_reg_scld_4_2to3_right_ip; 
		vidin_data_reg_scld_4_2to3_right_rn <= vidin_data_reg_scld_4_2to3_right_rn; 
		vidin_data_reg_scld_4_2to3_right_in <= vidin_data_reg_scld_4_2to3_right_in; 
	end 
   end 
endmodule
