
module port_bus_1to0 (clk, vidin_addr_reg, svid_comp_switch, vidin_new_data_scld_1_2to3_left, v_corr_05_00, v_corr_05_01, v_corr_05_02, v_corr_05_03, v_corr_05_04, v_corr_05_05, v_corr_10_00, v_corr_10_01, v_corr_10_02, v_corr_10_03, v_corr_10_04, v_corr_10_05, v_corr_10_06, v_corr_10_07, v_corr_10_08, v_corr_10_09, v_corr_10_10, v_corr_20_00, v_corr_20_01, v_corr_20_02, v_corr_20_03, v_corr_20_04, v_corr_20_05, v_corr_20_06, v_corr_20_07, v_corr_20_08, v_corr_20_09, v_corr_20_10, v_corr_20_11, v_corr_20_12, v_corr_20_13, v_corr_20_14, v_corr_20_15, v_corr_20_16, v_corr_20_17, v_corr_20_18, v_corr_20_19, v_corr_20_20, bus_word_1, bus_word_2, bus_word_3, bus_word_4, bus_word_5, bus_word_6, counter_out, rst);

   parameter corr_res_w  = 4'b1000;
   input rst; 
   input clk; 
   input[18:0] vidin_addr_reg; 
   input svid_comp_switch; 
   input vidin_new_data_scld_1_2to3_left; 
   input[corr_res_w - 1:0] v_corr_05_00; 
   input[corr_res_w - 1:0] v_corr_05_01; 
   input[corr_res_w - 1:0] v_corr_05_02; 
   input[corr_res_w - 1:0] v_corr_05_03; 
   input[corr_res_w - 1:0] v_corr_05_04; 
   input[corr_res_w - 1:0] v_corr_05_05; 
   input[corr_res_w - 1:0] v_corr_10_00; 
   input[corr_res_w - 1:0] v_corr_10_01; 
   input[corr_res_w - 1:0] v_corr_10_02; 
   input[corr_res_w - 1:0] v_corr_10_03; 
   input[corr_res_w - 1:0] v_corr_10_04; 
   input[corr_res_w - 1:0] v_corr_10_05; 
   input[corr_res_w - 1:0] v_corr_10_06; 
   input[corr_res_w - 1:0] v_corr_10_07; 
   input[corr_res_w - 1:0] v_corr_10_08; 
   input[corr_res_w - 1:0] v_corr_10_09; 
   input[corr_res_w - 1:0] v_corr_10_10; 
   input[corr_res_w - 1:0] v_corr_20_00; 
   input[corr_res_w - 1:0] v_corr_20_01; 
   input[corr_res_w - 1:0] v_corr_20_02; 
   input[corr_res_w - 1:0] v_corr_20_03; 
   input[corr_res_w - 1:0] v_corr_20_04; 
   input[corr_res_w - 1:0] v_corr_20_05; 
   input[corr_res_w - 1:0] v_corr_20_06; 
   input[corr_res_w - 1:0] v_corr_20_07; 
   input[corr_res_w - 1:0] v_corr_20_08; 
   input[corr_res_w - 1:0] v_corr_20_09; 
   input[corr_res_w - 1:0] v_corr_20_10; 
   input[corr_res_w - 1:0] v_corr_20_11; 
   input[corr_res_w - 1:0] v_corr_20_12; 
   input[corr_res_w - 1:0] v_corr_20_13; 
   input[corr_res_w - 1:0] v_corr_20_14; 
   input[corr_res_w - 1:0] v_corr_20_15; 
   input[corr_res_w - 1:0] v_corr_20_16; 
   input[corr_res_w - 1:0] v_corr_20_17; 
   input[corr_res_w - 1:0] v_corr_20_18; 
   input[corr_res_w - 1:0] v_corr_20_19; 
   input[corr_res_w - 1:0] v_corr_20_20; 
   output[7:0] bus_word_1; 
   reg[7:0] bus_word_1;
   output[7:0] bus_word_2; 
   reg[7:0] bus_word_2;
   output[7:0] bus_word_3; 
   reg[7:0] bus_word_3;
   output[7:0] bus_word_4; 
   reg[7:0] bus_word_4;
   output[7:0] bus_word_5; 
   reg[7:0] bus_word_5;
   output[7:0] bus_word_6; 
   reg[7:0] bus_word_6;
   output[2:0] counter_out; 
   reg[2:0] counter_out;

   reg[7:0] bus_word_1_tmp; 
   reg[7:0] bus_word_2_tmp; 
   reg[7:0] bus_word_3_tmp; 
   reg[7:0] bus_word_4_tmp; 
   reg[7:0] bus_word_5_tmp; 
   reg[7:0] bus_word_6_tmp; 
   reg[18:0] vidin_addr_reg_tmp; 
   reg svid_comp_switch_tmp; 
   wire vidin_new_data_scld_1_2to3_left_tmp; 
   reg[3:0] counter; 
   reg[2:0] counter_out_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_00_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_01_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_02_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_03_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_04_tmp; 
   reg[corr_res_w - 1:0] v_corr_05_05_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_00_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_01_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_02_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_03_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_04_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_05_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_06_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_07_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_08_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_09_tmp; 
   reg[corr_res_w - 1:0] v_corr_10_10_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_00_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_01_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_02_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_03_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_04_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_05_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_06_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_07_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_08_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_09_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_10_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_11_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_12_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_13_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_14_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_15_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_16_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_17_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_18_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_19_tmp; 
   reg[corr_res_w - 1:0] v_corr_20_20_tmp; 

   always @(posedge clk)
   begin
	if (rst) 
	begin 
		counter <= 0; 
		counter_out_tmp <= 3'b000 ; 
		bus_word_1_tmp <= 8'b00000000 ; 
		bus_word_2_tmp <= 8'b00000000 ; 
		bus_word_3_tmp <= 8'b00000000 ; 
		bus_word_4_tmp <= 8'b00000000 ; 
		bus_word_5_tmp <= 8'b00000000 ; 
		bus_word_6_tmp <= 8'b00000000 ; 
	end 
	else 
	begin 
         if (vidin_new_data_scld_1_2to3_left == 1'b1)
         begin
            counter <= 4'b0001 ; 
         end
         else
         begin
            if (counter == 4'b1000)
            begin
               counter <= 4'b1000 ; 
            end
            else
            begin
               counter <= counter + 1 ; 
            end 
         end 
         case (counter[2:0])
            3'b000 :
                     begin
                        counter_out_tmp <= 3'b000 ; 
                        bus_word_1_tmp <= 8'b00000000 ; 
                        bus_word_2_tmp <= 8'b00000000 ; 
                        bus_word_3_tmp <= 8'b00000000 ; 
                        bus_word_4_tmp <= 8'b00000000 ; 
                        bus_word_5_tmp <= 8'b00000000 ; 
                        bus_word_6_tmp <= 8'b00000000 ; 
                     end
            3'b001 :
                     begin
                        counter_out_tmp <= 3'b001 ; 
                        bus_word_1_tmp <= vidin_addr_reg_tmp[7:0] ; 
                        bus_word_2_tmp <= vidin_addr_reg_tmp[15:8] ; 
                        bus_word_3_tmp <= {vidin_addr_reg_tmp[18:16], svid_comp_switch_tmp, 4'b0000} ; 
                        bus_word_4_tmp <= v_corr_05_00_tmp ; 
                        bus_word_5_tmp <= v_corr_05_01_tmp ; 
                        bus_word_6_tmp <= v_corr_05_02_tmp ; 
                     end
            3'b010 :
                     begin
                        counter_out_tmp <= 3'b010 ; 
                        bus_word_1_tmp <= v_corr_05_03_tmp ; 
                        bus_word_2_tmp <= v_corr_05_04_tmp ; 
                        bus_word_3_tmp <= v_corr_05_05_tmp ; 
                        bus_word_4_tmp <= v_corr_10_00_tmp ; 
                        bus_word_5_tmp <= v_corr_10_01_tmp ; 
                        bus_word_6_tmp <= v_corr_10_02_tmp ; 
                     end
            3'b011 :
                     begin
                        counter_out_tmp <= 3'b011 ; 
                        bus_word_1_tmp <= v_corr_10_03_tmp ; 
                        bus_word_2_tmp <= v_corr_10_04_tmp ; 
                        bus_word_3_tmp <= v_corr_10_05_tmp ; 
                        bus_word_4_tmp <= v_corr_10_06_tmp ; 
                        bus_word_5_tmp <= v_corr_10_07_tmp ; 
                        bus_word_6_tmp <= v_corr_10_08_tmp ; 
                     end
            3'b100 :
                     begin
                        counter_out_tmp <= 3'b100 ; 
                        bus_word_1_tmp <= v_corr_10_09_tmp ; 
                        bus_word_2_tmp <= v_corr_10_10_tmp ; 
                        bus_word_3_tmp <= v_corr_20_00_tmp ; 
                        bus_word_4_tmp <= v_corr_20_01_tmp ; 
                        bus_word_5_tmp <= v_corr_20_02_tmp ; 
                        bus_word_6_tmp <= v_corr_20_03_tmp ; 
                     end
            3'b101 :

                     begin
                        counter_out_tmp <= 3'b101 ; 
                        bus_word_1_tmp <= v_corr_20_04_tmp ; 
                        bus_word_2_tmp <= v_corr_20_05_tmp ; 
                        bus_word_3_tmp <= v_corr_20_06_tmp ; 
                        bus_word_4_tmp <= v_corr_20_07_tmp ; 
                        bus_word_5_tmp <= v_corr_20_08_tmp ; 
                        bus_word_6_tmp <= v_corr_20_09_tmp ; 
                     end
            3'b110 :
                     begin
                        counter_out_tmp <= 3'b110 ; 
                        bus_word_1_tmp <= v_corr_20_10_tmp ; 
                        bus_word_2_tmp <= v_corr_20_11_tmp ; 
                        bus_word_3_tmp <= v_corr_20_12_tmp ; 
                        bus_word_4_tmp <= v_corr_20_13_tmp ; 
                        bus_word_5_tmp <= v_corr_20_14_tmp ; 
                        bus_word_6_tmp <= v_corr_20_15_tmp ; 
                     end
            3'b111 :
                     begin
                        counter_out_tmp <= 3'b111 ; 
                        bus_word_1_tmp <= v_corr_20_16_tmp ; 
                        bus_word_2_tmp <= v_corr_20_17_tmp ; 
                        bus_word_3_tmp <= v_corr_20_18_tmp ; 
                        bus_word_4_tmp <= v_corr_20_19_tmp ; 
                        bus_word_5_tmp <= v_corr_20_20_tmp ; 
                        bus_word_6_tmp <= 8'b00000000 ; 
                     end
            default :
                     begin
                        counter_out_tmp <= 3'b111 ; 
                        bus_word_1_tmp <= v_corr_20_16_tmp ; 
                        bus_word_2_tmp <= v_corr_20_17_tmp ; 
                        bus_word_3_tmp <= v_corr_20_18_tmp ; 
                        bus_word_4_tmp <= v_corr_20_19_tmp ; 
                        bus_word_5_tmp <= v_corr_20_20_tmp ; 
                        bus_word_6_tmp <= 8'b00000000 ; 
                     end
         endcase 
	end 
   end 

   always @(posedge clk)
   begin
	if (rst) 
	begin 
         counter_out <= 0; 
         bus_word_1 <= 0; 
         bus_word_2 <= 0; 
         bus_word_3 <= 0; 
         bus_word_4 <= 0; 
         bus_word_5 <= 0; 
         bus_word_6 <= 0; 
	end 
	else 
	begin 
		 counter_out <= counter_out_tmp ; 
		 bus_word_1 <= bus_word_1_tmp ; 
		 bus_word_2 <= bus_word_2_tmp ; 
		 bus_word_3 <= bus_word_3_tmp ; 
		 bus_word_4 <= bus_word_4_tmp ; 
		 bus_word_5 <= bus_word_5_tmp ; 
		 bus_word_6 <= bus_word_6_tmp ; 
	end 
	

	if (rst)
	begin 
            vidin_addr_reg_tmp <= 0; 
            svid_comp_switch_tmp <= 0; 
            v_corr_05_00_tmp <= 0 ; 
            v_corr_05_01_tmp <= 0 ; 
            v_corr_05_02_tmp <= 0 ; 
            v_corr_05_03_tmp <= 0; 
            v_corr_05_04_tmp <= 0 ; 
            v_corr_05_05_tmp <= 0 ; 
            v_corr_10_00_tmp <= 0 ; 
            v_corr_10_01_tmp <= 0 ; 
            v_corr_10_02_tmp <= 0 ; 
            v_corr_10_03_tmp <= 0 ; 
            v_corr_10_04_tmp <= 0 ; 
            v_corr_10_05_tmp <= 0 ; 
            v_corr_10_06_tmp <= 0 ; 
            v_corr_10_07_tmp <= 0; 
            v_corr_10_08_tmp <= 0; 
            v_corr_10_09_tmp <= 0; 
            v_corr_10_10_tmp <= 0; 
            v_corr_20_00_tmp <= 0; 
            v_corr_20_01_tmp <= 0; 
            v_corr_20_02_tmp <= 0; 
            v_corr_20_03_tmp <= 0; 
            v_corr_20_04_tmp <= 0; 
            v_corr_20_05_tmp <= 0; 
            v_corr_20_06_tmp <= 0; 
            v_corr_20_07_tmp <= 0; 
            v_corr_20_08_tmp <= 0; 
            v_corr_20_09_tmp <= 0; 
            v_corr_20_10_tmp <= 0; 
            v_corr_20_11_tmp <= 0; 
            v_corr_20_12_tmp <= 0; 
            v_corr_20_13_tmp <= 0; 
            v_corr_20_14_tmp <= 0; 
            v_corr_20_15_tmp <= 0; 
            v_corr_20_16_tmp <= 0; 
            v_corr_20_17_tmp <= 0; 
            v_corr_20_18_tmp <= 0; 
            v_corr_20_19_tmp <= 0; 
            v_corr_20_20_tmp <= 0; 		
	end 
	else if (vidin_new_data_scld_1_2to3_left == 1'b1)
         begin
            vidin_addr_reg_tmp <= vidin_addr_reg ; 
            svid_comp_switch_tmp <= svid_comp_switch ; 
            v_corr_05_00_tmp <= v_corr_05_00 ; 
            v_corr_05_01_tmp <= v_corr_05_01 ; 
            v_corr_05_02_tmp <= v_corr_05_02 ; 
            v_corr_05_03_tmp <= v_corr_05_03 ; 
            v_corr_05_04_tmp <= v_corr_05_04 ; 
            v_corr_05_05_tmp <= v_corr_05_05 ; 
            v_corr_10_00_tmp <= v_corr_10_00 ; 
            v_corr_10_01_tmp <= v_corr_10_01 ; 
            v_corr_10_02_tmp <= v_corr_10_02 ; 
           v_corr_10_03_tmp <= v_corr_10_03 ; 
            v_corr_10_04_tmp <= v_corr_10_04 ; 
            v_corr_10_05_tmp <= v_corr_10_05 ; 
            v_corr_10_06_tmp <= v_corr_10_06 ; 
            v_corr_10_07_tmp <= v_corr_10_07 ; 
            v_corr_10_08_tmp <= v_corr_10_08 ; 
            v_corr_10_09_tmp <= v_corr_10_09 ; 
            v_corr_10_10_tmp <= v_corr_10_10 ; 
            v_corr_20_00_tmp <= v_corr_20_00 ; 
            v_corr_20_01_tmp <= v_corr_20_01 ; 
            v_corr_20_02_tmp <= v_corr_20_02 ; 
            v_corr_20_03_tmp <= v_corr_20_03 ; 
            v_corr_20_04_tmp <= v_corr_20_04 ; 
            v_corr_20_05_tmp <= v_corr_20_05 ; 
            v_corr_20_06_tmp <= v_corr_20_06 ; 
            v_corr_20_07_tmp <= v_corr_20_07 ; 
            v_corr_20_08_tmp <= v_corr_20_08 ; 
            v_corr_20_09_tmp <= v_corr_20_09 ; 
            v_corr_20_10_tmp <= v_corr_20_10 ; 
            v_corr_20_11_tmp <= v_corr_20_11 ; 
            v_corr_20_12_tmp <= v_corr_20_12 ; 
            v_corr_20_13_tmp <= v_corr_20_13 ; 
            v_corr_20_14_tmp <= v_corr_20_14 ; 
            v_corr_20_15_tmp <= v_corr_20_15 ; 
            v_corr_20_16_tmp <= v_corr_20_16 ; 
            v_corr_20_17_tmp <= v_corr_20_17 ; 
            v_corr_20_18_tmp <= v_corr_20_18 ; 
            v_corr_20_19_tmp <= v_corr_20_19 ; 
            v_corr_20_20_tmp <= v_corr_20_20 ; 
         end 
         else
         begin
            vidin_addr_reg_tmp <= vidin_addr_reg_tmp ; 
            svid_comp_switch_tmp <= svid_comp_switch_tmp ; 
            v_corr_05_00_tmp <= v_corr_05_00_tmp ; 
            v_corr_05_01_tmp <= v_corr_05_01_tmp ; 
            v_corr_05_02_tmp <= v_corr_05_02_tmp ; 
            v_corr_05_03_tmp <= v_corr_05_03_tmp ; 
            v_corr_05_04_tmp <= v_corr_05_04_tmp ; 
            v_corr_05_05_tmp <= v_corr_05_05_tmp ; 
            v_corr_10_00_tmp <= v_corr_10_00_tmp ; 
            v_corr_10_01_tmp <= v_corr_10_01_tmp ; 
            v_corr_10_02_tmp <= v_corr_10_02_tmp ; 
           v_corr_10_03_tmp <= v_corr_10_03_tmp ; 
            v_corr_10_04_tmp <= v_corr_10_04_tmp ; 
            v_corr_10_05_tmp <= v_corr_10_05_tmp ; 
            v_corr_10_06_tmp <= v_corr_10_06_tmp ; 
            v_corr_10_07_tmp <= v_corr_10_07_tmp ; 
            v_corr_10_08_tmp <= v_corr_10_08_tmp ; 
            v_corr_10_09_tmp <= v_corr_10_09_tmp ; 
            v_corr_10_10_tmp <= v_corr_10_10_tmp ; 
            v_corr_20_00_tmp <= v_corr_20_00_tmp ; 
            v_corr_20_01_tmp <= v_corr_20_01_tmp ; 
            v_corr_20_02_tmp <= v_corr_20_02_tmp ; 
            v_corr_20_03_tmp <= v_corr_20_03_tmp ; 
            v_corr_20_04_tmp <= v_corr_20_04_tmp ; 
            v_corr_20_05_tmp <= v_corr_20_05_tmp ; 
            v_corr_20_06_tmp <= v_corr_20_06_tmp ; 
            v_corr_20_07_tmp <= v_corr_20_07_tmp ; 
            v_corr_20_08_tmp <= v_corr_20_08_tmp ; 
            v_corr_20_09_tmp <= v_corr_20_09_tmp ; 
            v_corr_20_10_tmp <= v_corr_20_10_tmp ; 
            v_corr_20_11_tmp <= v_corr_20_11_tmp ; 
            v_corr_20_12_tmp <= v_corr_20_12_tmp ; 
            v_corr_20_13_tmp <= v_corr_20_13_tmp ; 
            v_corr_20_14_tmp <= v_corr_20_14_tmp ; 
            v_corr_20_15_tmp <= v_corr_20_15_tmp ; 
            v_corr_20_16_tmp <= v_corr_20_16_tmp ; 
            v_corr_20_17_tmp <= v_corr_20_17_tmp ; 
            v_corr_20_18_tmp <= v_corr_20_18_tmp ; 
            v_corr_20_19_tmp <= v_corr_20_19_tmp ; 
            v_corr_20_20_tmp <= v_corr_20_20_tmp ; 
         end 
   end 
endmodule
