
module port_bus_1to0_1 (clk, vidin_addr_reg, svid_comp_switch, vidin_new_data_scld_1_1to0,
   v_corr_200, 
   v_corr_201, 
   v_corr_202, 
   v_corr_203, 
   v_corr_204, 
   v_corr_205, 
   v_corr_206, 
   v_corr_207, 
   v_corr_208, 
   v_corr_209, 
   v_corr_2010, 
   v_corr_2011, 
   v_corr_2012, 
   v_corr_2013, 
   v_corr_2014, 
   v_corr_2015, 
   v_corr_2016, 
   v_corr_2017, 
   v_corr_2018, 
   v_corr_2019, 
   v_corr_2020, 
vidin_new_data_scld_2_1to0,
   v_corr_100, 
   v_corr_101, 
   v_corr_102, 
   v_corr_103, 
   v_corr_104, 
   v_corr_105, 
   v_corr_106, 
   v_corr_107, 
   v_corr_108, 
   v_corr_109, 
   v_corr_1010, 
vidin_new_data_scld_4_1to0, 
   v_corr_50, 
   v_corr_51, 
   v_corr_52, 
   v_corr_53, 
   v_corr_54, 
   v_corr_55, 
bus_word_1, bus_word_2, bus_word_3, bus_word_4, bus_word_5, bus_word_6, counter_out);


   input clk; 
   output[18:0] vidin_addr_reg; 
   reg[18:0] vidin_addr_reg;
   output svid_comp_switch; 
   reg svid_comp_switch;
   output vidin_new_data_scld_1_1to0; 
   reg vidin_new_data_scld_1_1to0;
   output[7:0] v_corr_200; 
   output[7:0] v_corr_201; 
   output[7:0] v_corr_202; 
   output[7:0] v_corr_203; 
   output[7:0] v_corr_204; 
   output[7:0] v_corr_205; 
   output[7:0] v_corr_206; 
   output[7:0] v_corr_207; 
   output[7:0] v_corr_208; 
   output[7:0] v_corr_209; 
   output[7:0] v_corr_2010; 
   output[7:0] v_corr_2011; 
   output[7:0] v_corr_2012; 
   output[7:0] v_corr_2013; 
   output[7:0] v_corr_2014; 
   output[7:0] v_corr_2015; 
   output[7:0] v_corr_2016; 
   output[7:0] v_corr_2017; 
   output[7:0] v_corr_2018; 
   output[7:0] v_corr_2019; 
   output[7:0] v_corr_2020; 
   reg[7:0] v_corr_200; 
   reg[7:0] v_corr_201; 
   reg[7:0] v_corr_202; 
   reg[7:0] v_corr_203; 
   reg[7:0] v_corr_204; 
   reg[7:0] v_corr_205; 
   reg[7:0] v_corr_206; 
   reg[7:0] v_corr_207; 
   reg[7:0] v_corr_208; 
   reg[7:0] v_corr_209; 
   reg[7:0] v_corr_2010; 
   reg[7:0] v_corr_2011; 
   reg[7:0] v_corr_2012; 
   reg[7:0] v_corr_2013; 
   reg[7:0] v_corr_2014; 
   reg[7:0] v_corr_2015; 
   reg[7:0] v_corr_2016; 
   reg[7:0] v_corr_2017; 
   reg[7:0] v_corr_2018; 
   reg[7:0] v_corr_2019; 
   reg[7:0] v_corr_2020; 
   output vidin_new_data_scld_2_1to0; 
   reg vidin_new_data_scld_2_1to0;
   output[7:0] v_corr_100; 
   output[7:0] v_corr_101; 
   output[7:0] v_corr_102; 
   output[7:0] v_corr_103; 
   output[7:0] v_corr_104; 
   output[7:0] v_corr_105; 
   output[7:0] v_corr_106; 
   output[7:0] v_corr_107; 
   output[7:0] v_corr_108; 
   output[7:0] v_corr_109; 
   output[7:0] v_corr_1010; 
   reg[7:0] v_corr_100; 
   reg[7:0] v_corr_101; 
   reg[7:0] v_corr_102; 
   reg[7:0] v_corr_103; 
   reg[7:0] v_corr_104; 
   reg[7:0] v_corr_105; 
   reg[7:0] v_corr_106; 
   reg[7:0] v_corr_107; 
   reg[7:0] v_corr_108; 
   reg[7:0] v_corr_109; 
   reg[7:0] v_corr_1010; 
   output vidin_new_data_scld_4_1to0; 
   reg vidin_new_data_scld_4_1to0;
   output[7:0] v_corr_50; 
   output[7:0] v_corr_51; 
   output[7:0] v_corr_52; 
   output[7:0] v_corr_53; 
   output[7:0] v_corr_54; 
   output[7:0] v_corr_55; 
   reg[7:0] v_corr_50; 
   reg[7:0] v_corr_51; 
   reg[7:0] v_corr_52; 
   reg[7:0] v_corr_53; 
   reg[7:0] v_corr_54; 
   reg[7:0] v_corr_55; 
   input[7:0] bus_word_1; 
   input[7:0] bus_word_2; 
   input[7:0] bus_word_3; 
   input[7:0] bus_word_4; 
   input[7:0] bus_word_5; 
   input[7:0] bus_word_6; 
   input[2:0] counter_out; 

   reg[7:0] bus_word_1_tmp; 
   reg[7:0] bus_word_2_tmp; 
   reg[7:0] bus_word_3_tmp; 
   reg[7:0] bus_word_4_tmp; 
   reg[7:0] bus_word_5_tmp; 
   reg[7:0] bus_word_6_tmp; 
   reg[18:0] vidin_addr_reg_tmp; 
   reg svid_comp_switch_tmp; 
   wire vidin_new_data_scld_1_1to0_tmp; 
   wire vidin_new_data_scld_2_1to0_tmp; 
   wire vidin_new_data_scld_4_1to0_tmp; 
   reg[2:0] counter_out_tmp; 
   reg[7:0] v_corr_20_tmp0; 
   reg[7:0] v_corr_20_tmp1; 
   reg[7:0] v_corr_20_tmp2; 
   reg[7:0] v_corr_20_tmp3; 
   reg[7:0] v_corr_20_tmp4; 
   reg[7:0] v_corr_20_tmp5; 
   reg[7:0] v_corr_20_tmp6; 
   reg[7:0] v_corr_20_tmp7; 
   reg[7:0] v_corr_20_tmp8; 
   reg[7:0] v_corr_20_tmp9; 
   reg[7:0] v_corr_20_tmp10; 
   reg[7:0] v_corr_20_tmp11; 
   reg[7:0] v_corr_20_tmp12; 
   reg[7:0] v_corr_20_tmp13; 
   reg[7:0] v_corr_20_tmp14; 
   reg[7:0] v_corr_20_tmp15; 
   reg[7:0] v_corr_20_tmp16; 
   reg[7:0] v_corr_20_tmp17; 
   reg[7:0] v_corr_20_tmp18; 
   reg[7:0] v_corr_20_tmp19; 
   reg[7:0] v_corr_20_tmp20; 
   reg[7:0] v_corr_10_tmp0; 
   reg[7:0] v_corr_10_tmp1; 
   reg[7:0] v_corr_10_tmp2; 
   reg[7:0] v_corr_10_tmp3; 
   reg[7:0] v_corr_10_tmp4; 
   reg[7:0] v_corr_10_tmp5; 
   reg[7:0] v_corr_10_tmp6; 
   reg[7:0] v_corr_10_tmp7; 
   reg[7:0] v_corr_10_tmp8; 
   reg[7:0] v_corr_10_tmp9; 
   reg[7:0] v_corr_10_tmp10; 
   reg[7:0] v_corr_5_tmp0; 
   reg[7:0] v_corr_5_tmp1; 
   reg[7:0] v_corr_5_tmp2; 
   reg[7:0] v_corr_5_tmp3; 
   reg[7:0] v_corr_5_tmp4; 
   reg[7:0] v_corr_5_tmp5; 

   always @(posedge clk)
   begin
         case (counter_out_tmp[2:0])
            3'b001 :
                     begin
                        vidin_addr_reg_tmp[7:0] <= bus_word_1_tmp ; 
                        vidin_addr_reg_tmp[15:8] <= bus_word_2_tmp ; 
                       vidin_addr_reg_tmp[18:16] <= bus_word_3_tmp[7:5] ; 
                        svid_comp_switch_tmp <= bus_word_3_tmp[4] ; 
                        v_corr_5_tmp0 <= bus_word_4_tmp ; 
                        v_corr_5_tmp1 <= bus_word_5_tmp ; 
                        v_corr_5_tmp2 <= bus_word_6_tmp ; 
                     end
            3'b010 :
                     begin
                        v_corr_5_tmp3 <= bus_word_1_tmp ; 
                        v_corr_5_tmp4 <= bus_word_2_tmp ; 
                        v_corr_5_tmp5 <= bus_word_3_tmp ; 
                        v_corr_10_tmp0 <= bus_word_4_tmp ; 
                        v_corr_10_tmp1 <= bus_word_5_tmp ; 
                        v_corr_10_tmp2 <= bus_word_6_tmp ; 
                     end
            3'b011 :
                     begin
                        v_corr_10_tmp3 <= bus_word_1_tmp ; 
                        v_corr_10_tmp4 <= bus_word_2_tmp ; 
                        v_corr_10_tmp5 <= bus_word_3_tmp ; 
                        v_corr_10_tmp6 <= bus_word_4_tmp ; 
                        v_corr_10_tmp7 <= bus_word_5_tmp ; 
                        v_corr_10_tmp8 <= bus_word_6_tmp ; 
                     end
            3'b100 :
                     begin
                        v_corr_10_tmp9 <= bus_word_1_tmp ; 
                        v_corr_10_tmp10 <= bus_word_2_tmp ; 
                        v_corr_20_tmp0 <= bus_word_3_tmp ; 
                        v_corr_20_tmp1 <= bus_word_4_tmp ; 
                        v_corr_20_tmp2 <= bus_word_5_tmp ; 
                        v_corr_20_tmp3 <= bus_word_6_tmp ; 
                     end
            3'b101 :
                     begin
                        v_corr_20_tmp4 <= bus_word_1_tmp ; 
                        v_corr_20_tmp5 <= bus_word_2_tmp ; 
                        v_corr_20_tmp6 <= bus_word_3_tmp ; 
                        v_corr_20_tmp7 <= bus_word_4_tmp ; 
                        v_corr_20_tmp8 <= bus_word_5_tmp ; 
                        v_corr_20_tmp9 <= bus_word_6_tmp ; 
                     end
            3'b110 :
                     begin
                        v_corr_20_tmp10 <= bus_word_1_tmp ; 
                        v_corr_20_tmp11 <= bus_word_2_tmp ; 
                        v_corr_20_tmp12 <= bus_word_3_tmp ; 
                        v_corr_20_tmp13 <= bus_word_4_tmp ; 
                        v_corr_20_tmp14 <= bus_word_5_tmp ; 
                        v_corr_20_tmp15 <= bus_word_6_tmp ; 
                     end
            3'b111 :
                     begin
                        v_corr_20_tmp16 <= bus_word_1_tmp ; 
                        v_corr_20_tmp17 <= bus_word_2_tmp ; 
                        v_corr_20_tmp18 <= bus_word_3_tmp ; 
                        v_corr_20_tmp19 <= bus_word_4_tmp ; 
                        v_corr_20_tmp20 <= bus_word_5_tmp ; 
                     end
            default :
                     begin
                        v_corr_20_tmp16 <= bus_word_1_tmp ; 
                        v_corr_20_tmp17 <= bus_word_2_tmp ; 
                        v_corr_20_tmp18 <= bus_word_3_tmp ; 
                        v_corr_20_tmp19 <= bus_word_4_tmp ; 
                        v_corr_20_tmp20 <= bus_word_5_tmp ; 
                     end
         endcase 
   end 

   always @(posedge clk)
   begin
         counter_out_tmp <= counter_out ; 
         bus_word_1_tmp <= bus_word_1 ; 
         bus_word_2_tmp <= bus_word_2 ; 
         bus_word_3_tmp <= bus_word_3 ; 
         bus_word_4_tmp <= bus_word_4 ; 
         bus_word_5_tmp <= bus_word_5 ; 
         bus_word_6_tmp <= bus_word_6 ; 
   end 

   always @(posedge clk)
   begin
         if (counter_out_tmp == 3'b001)
         begin
            vidin_addr_reg <= vidin_addr_reg_tmp ; 
            svid_comp_switch <= svid_comp_switch_tmp ; 
            if (vidin_addr_reg_tmp[8:0] != 9'b000000000)
            begin
               vidin_new_data_scld_1_1to0 <= 1'b1 ; 
               if ((vidin_addr_reg_tmp[0]) == 1'b0 & (vidin_addr_reg_tmp[9]) == 1'b0)
               begin
                  vidin_new_data_scld_2_1to0 <= 1'b1 ; 
                  if ((vidin_addr_reg_tmp[1]) == 1'b0 & (vidin_addr_reg_tmp[10]) == 1'b0)
                  begin
                     vidin_new_data_scld_4_1to0 <= 1'b1 ; 
                  end
                  else
                  begin
                     vidin_new_data_scld_4_1to0 <= 1'b0 ; 
                  end 
               end
               else
               begin
                  vidin_new_data_scld_2_1to0 <= 1'b0 ; 
                  vidin_new_data_scld_4_1to0 <= 1'b0 ; 
               end 
            end
            else
            begin
               vidin_new_data_scld_1_1to0 <= 1'b0 ; 
               vidin_new_data_scld_4_1to0 <= 1'b0 ; 
               vidin_new_data_scld_2_1to0 <= 1'b0 ; 
            end 
            v_corr_50 <= v_corr_5_tmp0 ; 
            v_corr_51 <= v_corr_5_tmp1 ; 
            v_corr_52 <= v_corr_5_tmp2 ; 
            v_corr_53 <= v_corr_5_tmp3 ; 
            v_corr_54 <= v_corr_5_tmp4 ; 
            v_corr_55 <= v_corr_5_tmp5 ; 
            v_corr_100 <= v_corr_10_tmp0 ; 
            v_corr_101 <= v_corr_10_tmp1 ; 
            v_corr_102 <= v_corr_10_tmp2 ; 
            v_corr_103 <= v_corr_10_tmp3 ; 
            v_corr_104 <= v_corr_10_tmp4 ; 
            v_corr_105 <= v_corr_10_tmp5 ; 
            v_corr_106 <= v_corr_10_tmp6 ; 
            v_corr_107 <= v_corr_10_tmp7 ; 
            v_corr_108 <= v_corr_10_tmp8 ; 
            v_corr_109 <= v_corr_10_tmp9 ; 
            v_corr_1010 <= v_corr_10_tmp10 ; 
            v_corr_200 <= v_corr_20_tmp0 ; 
            v_corr_201 <= v_corr_20_tmp1 ; 
            v_corr_202 <= v_corr_20_tmp2 ; 
            v_corr_203 <= v_corr_20_tmp3 ; 
            v_corr_204 <= v_corr_20_tmp4 ; 
            v_corr_205 <= v_corr_20_tmp5 ; 
            v_corr_206 <= v_corr_20_tmp6 ; 
            v_corr_207 <= v_corr_20_tmp7 ; 
            v_corr_208 <= v_corr_20_tmp8 ; 
            v_corr_209 <= v_corr_20_tmp9 ; 
            v_corr_2010 <= v_corr_20_tmp10 ; 
            v_corr_2011 <= v_corr_20_tmp11 ; 
            v_corr_2012 <= v_corr_20_tmp12 ; 
            v_corr_2013 <= v_corr_20_tmp13 ; 
            v_corr_2014 <= v_corr_20_tmp14 ; 
            v_corr_2015 <= v_corr_20_tmp15 ; 
            v_corr_2016 <= v_corr_20_tmp16 ; 
            v_corr_2017 <= v_corr_20_tmp17 ; 
            v_corr_2018 <= v_corr_20_tmp18 ; 
            v_corr_2019 <= v_corr_20_tmp19 ; 
            v_corr_2020 <= v_corr_20_tmp20 ; 
         end
         else
         begin
            vidin_new_data_scld_1_1to0 <= 1'b0 ; 
            vidin_new_data_scld_2_1to0 <= 1'b0 ; 
            vidin_new_data_scld_4_1to0 <= 1'b0 ; 
         end 
   end 
endmodule
