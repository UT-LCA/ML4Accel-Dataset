
module quadintr_5_20 (clk, new_data,
   din0,
   din1,
   din2,
   din3,
   din4,
   din5,
   dout0,
   dout1,
   dout2,
   dout3,
   dout4,
   dout5,
   dout6,
   dout7,
   dout8,
   dout9,
   dout10,
   dout11,
   dout12,
   dout13,
   dout14,
   dout15,
   dout16,
   dout17,
   dout18,
   dout19,
   dout20); 

   input clk; 
   input new_data; 
   input[7:0] din0; 
   input[7:0] din1; 
   input[7:0] din2; 
   input[7:0] din3; 
   input[7:0] din4; 
   input[7:0] din5; 
   reg[7:0] dinr0; 
   reg[7:0] dinr1; 
   reg[7:0] dinr2; 
   reg[7:0] dinr3; 
   reg[7:0] dinr4; 
   reg[7:0] dinr5; 
   output[15:0] dout0; 
   output[15:0] dout1; 
   output[15:0] dout2; 
   output[15:0] dout3; 
   output[15:0] dout4; 
   output[15:0] dout5; 
   output[15:0] dout6; 
   output[15:0] dout7; 
   output[15:0] dout8; 
   output[15:0] dout9; 
   output[15:0] dout10; 
   output[15:0] dout11; 
   output[15:0] dout12; 
   output[15:0] dout13; 
   output[15:0] dout14; 
   output[15:0] dout15; 
   output[15:0] dout16; 
   output[15:0] dout17; 
   output[15:0] dout18; 
   output[15:0] dout19; 
   output[15:0] dout20; 
   reg[15:0] dout0; 
   reg[15:0] dout1; 
   reg[15:0] dout2; 
   reg[15:0] dout3; 
   reg[15:0] dout4; 
   reg[15:0] dout5; 
   reg[15:0] dout6; 
   reg[15:0] dout7; 
   reg[15:0] dout8; 
   reg[15:0] dout9; 
   reg[15:0] dout10; 
   reg[15:0] dout11; 
   reg[15:0] dout12; 
   reg[15:0] dout13; 
   reg[15:0] dout14; 
   reg[15:0] dout15; 
   reg[15:0] dout16; 
   reg[15:0] dout17; 
   reg[15:0] dout18; 
   reg[15:0] dout19; 
   reg[15:0] dout20; 

   reg[7:0] tmp_10; 
   reg[7:0] tmp_11; 
   reg[7:0] tmp_12; 
   reg[7:0] tmp_13; 
   reg[7:0] tmp_14; 
   reg[7:0] tmp_15; 
   reg[7:0] tmp_16; 
   reg[7:0] tmp_17; 
   reg[7:0] tmp_18; 
   reg[7:0] tmp_19; 
   reg[7:0] tmp_110; 
   reg[7:0] tmp_20; 
   reg[7:0] tmp_21; 
   reg[7:0] tmp_22; 
   reg[7:0] tmp_23; 
   reg[7:0] tmp_24; 
   reg[7:0] tmp_25; 
   reg[7:0] tmp_26; 
   reg[7:0] tmp_27; 
   reg[7:0] tmp_28; 
   reg[7:0] tmp_29; 
   reg[7:0] tmp_210; 
   reg[7:0] tmp_30; 
   reg[7:0] tmp_31; 
   reg[7:0] tmp_32; 
   reg[7:0] tmp_33; 
   reg[7:0] tmp_34; 
   reg[7:0] tmp_35; 
   reg[7:0] tmp_36; 
   reg[7:0] tmp_37; 
   reg[7:0] tmp_38; 
   reg[7:0] tmp_39; 
   reg[7:0] tmp_310; 
   reg[8:0] add_tmp0; 
   reg[8:0] add_tmp1; 
   reg[8:0] add_tmp2; 
   reg[8:0] add_tmp3; 
   reg[8:0] add_tmp4; 
   reg[8:0] add_tmp5; 
   reg[8:0] add_tmp6; 
   reg[8:0] add_tmp7; 
   reg[8:0] add_tmp8; 
   reg[8:0] add_tmp9; 
   reg[8:0] add_tmp10; 
   reg[8:0] doutr0; 
   reg[8:0] doutr1; 
   reg[8:0] doutr2; 
   reg[8:0] doutr3; 
   reg[8:0] doutr4; 
   reg[8:0] doutr5; 
   reg[8:0] doutr6; 
   reg[8:0] doutr7; 
   reg[8:0] doutr8; 
   reg[8:0] doutr9; 
   reg[8:0] doutr10; 
   reg[8:0] doutr11; 
   reg[8:0] doutr12; 
   reg[8:0] doutr13; 
   reg[8:0] doutr14; 
   reg[8:0] doutr15; 
   reg[8:0] doutr16; 
   reg[8:0] doutr17; 
   reg[8:0] doutr18; 
   reg[8:0] doutr19; 
   reg[8:0] doutr20; 


   reg[8:0] tmp_1_100; 
   reg[8:0] tmp_1_101; 
   reg[8:0] tmp_1_102; 
   reg[8:0] tmp_1_103; 
   reg[8:0] tmp_1_104; 
   reg[8:0] tmp_1_105; 
   reg[8:0] tmp_1_106; 
   reg[8:0] tmp_1_107; 
   reg[8:0] tmp_1_108; 
   reg[8:0] tmp_1_109; 
   reg[8:0] tmp_1_1010; 
   reg[8:0] tmp_1_1011; 
   reg[8:0] tmp_1_1012; 
   reg[8:0] tmp_1_1013; 
   reg[8:0] tmp_1_1014; 
   reg[8:0] tmp_1_1015; 
   reg[8:0] tmp_1_1016; 
   reg[8:0] tmp_1_1017; 
   reg[8:0] tmp_1_1018; 
   reg[8:0] tmp_1_1019; 
   reg[8:0] tmp_1_1020; 
   reg[8:0] tmp_2_100; 
   reg[8:0] tmp_2_101; 
   reg[8:0] tmp_2_102; 
   reg[8:0] tmp_2_103; 
   reg[8:0] tmp_2_104; 
   reg[8:0] tmp_2_105; 
   reg[8:0] tmp_2_106; 
   reg[8:0] tmp_2_107; 
   reg[8:0] tmp_2_108; 
   reg[8:0] tmp_2_109; 
   reg[8:0] tmp_2_1010; 
   reg[8:0] tmp_2_1011; 
   reg[8:0] tmp_2_1012; 
   reg[8:0] tmp_2_1013; 
   reg[8:0] tmp_2_1014; 
   reg[8:0] tmp_2_1015; 
   reg[8:0] tmp_2_1016; 
   reg[8:0] tmp_2_1017; 
   reg[8:0] tmp_2_1018; 
   reg[8:0] tmp_2_1019; 
   reg[8:0] tmp_2_1020; 
   reg[8:0] tmp_3_100; 
   reg[8:0] tmp_3_101; 
   reg[8:0] tmp_3_102; 
   reg[8:0] tmp_3_103; 
   reg[8:0] tmp_3_104; 
   reg[8:0] tmp_3_105; 
   reg[8:0] tmp_3_106; 
   reg[8:0] tmp_3_107; 
   reg[8:0] tmp_3_108; 
   reg[8:0] tmp_3_109; 
   reg[8:0] tmp_3_1010; 
   reg[8:0] tmp_3_1011; 
   reg[8:0] tmp_3_1012; 
   reg[8:0] tmp_3_1013; 
   reg[8:0] tmp_3_1014; 
   reg[8:0] tmp_3_1015; 
   reg[8:0] tmp_3_1016; 
   reg[8:0] tmp_3_1017; 
   reg[8:0] tmp_3_1018; 
   reg[8:0] tmp_3_1019; 
   reg[8:0] tmp_3_1020; 
   reg[8:0] add_tmp_100; 
   reg[8:0] add_tmp_101; 
   reg[8:0] add_tmp_102; 
   reg[8:0] add_tmp_103; 
   reg[8:0] add_tmp_104; 
   reg[8:0] add_tmp_105; 
   reg[8:0] add_tmp_106; 
   reg[8:0] add_tmp_107; 
   reg[8:0] add_tmp_108; 
   reg[8:0] add_tmp_109; 
   reg[8:0] add_tmp_1010; 
   reg[8:0] add_tmp_1011; 
   reg[8:0] add_tmp_1012; 
   reg[8:0] add_tmp_1013; 
   reg[8:0] add_tmp_1014; 
   reg[8:0] add_tmp_1015; 
   reg[8:0] add_tmp_1016; 
   reg[8:0] add_tmp_1017; 
   reg[8:0] add_tmp_1018; 
   reg[8:0] add_tmp_1019; 
   reg[8:0] add_tmp_1020; 

   reg[8:0] doutr_100; 
   reg[8:0] doutr_101; 
   reg[8:0] doutr_102; 
   reg[8:0] doutr_103; 
   reg[8:0] doutr_104; 
   reg[8:0] doutr_105; 
   reg[8:0] doutr_106; 
   reg[8:0] doutr_107; 
   reg[8:0] doutr_108; 
   reg[8:0] doutr_109; 
   reg[8:0] doutr_1010; 

   always @(posedge clk)
   begin
         if (new_data == 1'b1)
         begin
			dinr0 <= din0;
			dinr1 <= din1;
			dinr2 <= din2;
			dinr3 <= din3;
			dinr4 <= din4;
			dinr5 <= din5;

			dout0[15:9] <= {doutr0[8],doutr0[8],doutr0[8],doutr0[8],doutr0[8],doutr0[8],doutr0[8]};
			dout1[15:9] <= {doutr1[8],doutr1[8],doutr1[8],doutr1[8],doutr1[8],doutr1[8],doutr1[8]};
			dout2[15:9] <= {doutr2[8],doutr2[8],doutr2[8],doutr2[8],doutr2[8],doutr2[8],doutr2[8]};
			dout3[15:9] <= {doutr3[8],doutr3[8],doutr3[8],doutr3[8],doutr3[8],doutr3[8],doutr3[8]};
			dout4[15:9] <= {doutr4[8],doutr4[8],doutr4[8],doutr4[8],doutr4[8],doutr4[8],doutr4[8]};
			dout5[15:9] <= {doutr5[8],doutr5[8],doutr5[8],doutr5[8],doutr5[8],doutr5[8],doutr5[8]};
			dout6[15:9] <= {doutr6[8],doutr6[8],doutr6[8],doutr6[8],doutr6[8],doutr6[8],doutr6[8]};
			dout7[15:9] <= {doutr7[8],doutr7[8],doutr7[8],doutr7[8],doutr7[8],doutr7[8],doutr7[8]};
			dout8[15:9] <= {doutr8[8],doutr8[8],doutr8[8],doutr8[8],doutr8[8],doutr8[8],doutr8[8]};
			dout9[15:9] <= {doutr9[8],doutr9[8],doutr9[8],doutr9[8],doutr9[8],doutr9[8],doutr9[8]};
			dout10[15:9] <= {doutr10[8],doutr10[8],doutr10[8],doutr10[8],doutr10[8],doutr10[8],doutr10[8]};
			dout11[15:9] <= {doutr11[8],doutr11[8],doutr11[8],doutr11[8],doutr11[8],doutr11[8],doutr11[8]};
			dout12[15:9] <= {doutr12[8],doutr12[8],doutr12[8],doutr12[8],doutr12[8],doutr12[8],doutr12[8]};
			dout13[15:9] <= {doutr13[8],doutr13[8],doutr13[8],doutr13[8],doutr13[8],doutr13[8],doutr13[8]};
			dout14[15:9] <= {doutr14[8],doutr14[8],doutr14[8],doutr14[8],doutr14[8],doutr14[8],doutr14[8]};
			dout15[15:9] <= {doutr15[8],doutr15[8],doutr15[8],doutr15[8],doutr15[8],doutr15[8],doutr15[8]};
			dout16[15:9] <= {doutr16[8],doutr16[8],doutr16[8],doutr16[8],doutr16[8],doutr16[8],doutr16[8]};
			dout17[15:9] <= {doutr17[8],doutr17[8],doutr17[8],doutr17[8],doutr17[8],doutr17[8],doutr17[8]};
			dout18[15:9] <= {doutr18[8],doutr18[8],doutr18[8],doutr18[8],doutr18[8],doutr18[8],doutr18[8]};
			dout19[15:9] <= {doutr19[8],doutr19[8],doutr19[8],doutr19[8],doutr19[8],doutr19[8],doutr19[8]};
			dout20[15:9] <= {doutr20[8],doutr20[8],doutr20[8],doutr20[8],doutr20[8],doutr20[8],doutr20[8]};
			dout0[8:0] <= doutr0;
			dout1[8:0] <= doutr1;
			dout2[8:0] <= doutr2;
			dout3[8:0] <= doutr3;
			dout4[8:0] <= doutr4;
			dout5[8:0] <= doutr5;
			dout6[8:0] <= doutr6;
			dout7[8:0] <= doutr7;
			dout8[8:0] <= doutr8;
			dout9[8:0] <= doutr9;
			dout10[8:0] <= doutr10;
			dout11[8:0] <= doutr11;
			dout12[8:0] <= doutr12;
			dout13[8:0] <= doutr13;
			dout14[8:0] <= doutr14;
			dout15[8:0] <= doutr15;
			dout16[8:0] <= doutr16;
			dout17[8:0] <= doutr17;
			dout18[8:0] <= doutr18;
			dout19[8:0] <= doutr19;
			dout20[8:0] <= doutr20;
		end

				doutr_100 <= {dinr0[8-1], dinr0};
				doutr_102 <= {dinr1[8-1], dinr1};
				doutr_104 <= {dinr2[8-1], dinr2};
				doutr_106 <= {dinr3[8-1], dinr3};

				tmp_11 <= {dinr0[8-1], dinr0[8-1], dinr0[8-1:2]} + {dinr0[8-1], dinr0[8-1], dinr0[8-1], dinr0[8-1:3]};
				tmp_13 <= {dinr1[8-1], dinr1[8-1], dinr1[8-1:2]} + {dinr1[8-1], dinr1[8-1], dinr1[8-1], dinr1[8-1:3]};
				tmp_15 <= {dinr2[8-1], dinr2[8-1], dinr2[8-1:2]} + {dinr2[8-1], dinr2[8-1], dinr2[8-1], dinr2[8-1:3]};
				tmp_17 <= {dinr3[8-1], dinr3[8-1], dinr3[8-1:2]} + {dinr3[8-1], dinr3[8-1], dinr3[8-1], dinr3[8-1:3]};
				
				tmp_21 <= {dinr1[8-1], dinr1[8-1:1]} + {dinr1[8-1], dinr1[8-1], dinr1[8-1:2]};
				tmp_23 <= {dinr2[8-1], dinr2[8-1:1]} + {dinr2[8-1], dinr2[8-1], dinr2[8-1:2]};
				tmp_25 <= {dinr3[8-1], dinr3[8-1:1]} + {dinr3[8-1], dinr3[8-1], dinr3[8-1:2]};
				tmp_27 <= {dinr4[8-1], dinr4[8-1:1]} + {dinr4[8-1], dinr4[8-1], dinr4[8-1:2]};
				
				tmp_31 <= {dinr2[8-1], dinr2[8-1], dinr2[8-1], dinr2[8-1:3]};
				tmp_33 <= {dinr3[8-1], dinr3[8-1], dinr3[8-1], dinr3[8-1:3]};
				tmp_35 <= {dinr4[8-1], dinr4[8-1], dinr4[8-1], dinr4[8-1:3]};
				tmp_37 <= {dinr5[8-1], dinr5[8-1], dinr5[8-1], dinr5[8-1:3]};

				add_tmp1 <= {tmp_11[8-1], tmp_11} + {tmp_21[8-1], tmp_21};
				add_tmp3 <= {tmp_13[8-1], tmp_13} + {tmp_23[8-1], tmp_23};
				add_tmp5 <= {tmp_15[8-1], tmp_15} + {tmp_25[8-1], tmp_25};
				add_tmp7 <= {tmp_17[8-1], tmp_17} + {tmp_27[8-1], tmp_27};

				doutr_101 <= add_tmp1 - {tmp_31[8-1], tmp_31};
				doutr_103 <= add_tmp3 - {tmp_33[8-1], tmp_33};
				doutr_105 <= add_tmp5 - {tmp_35[8-1], tmp_35};
				doutr_107 <= add_tmp7 - {tmp_37[8-1], tmp_37};

		doutr_108 <= {dinr4[8-1] , dinr4};

		tmp_19 <= {dinr3[8-1], dinr3[8-1] , dinr3[8-1] , dinr3[8-1:3]};

		tmp_29 <= {dinr4[8-1], dinr4[8-1:1]} +
				{dinr4[8-1], dinr4[8-1] , dinr4[8-1:2]};

		tmp_39 <= {dinr5[8-1] , dinr5[8-1] , dinr5[8-1:2]} +
			{dinr5[8-1] , dinr5[8-1] , dinr5[8-1] , dinr5[8-1:3]};

		add_tmp9 <= {tmp_29[8-1] , tmp_29} + 
						  {tmp_39[8-1] , tmp_39};

		doutr_109 <= add_tmp9 - {tmp_19[8-1] , tmp_19};

		doutr_1010 <= {dinr5[8-1] , dinr5};

			doutr0 <= doutr_100;
			doutr2 <= doutr_101;
			doutr4 <= doutr_102;
			doutr6 <= doutr_103;
			doutr8 <= doutr_104;
			doutr10 <= doutr_105;
			doutr12 <= doutr_106;
			doutr14 <= doutr_107;
			doutr16 <= doutr_108;

			tmp_1_101 <= {doutr_100[8] , doutr_100[8] , doutr_100[8:2]} + {doutr_100[8] , doutr_100[8] , doutr_100[8] , doutr_100[8:3]};
			tmp_1_103 <= {doutr_101[8] , doutr_101[8] , doutr_101[8:2]} + {doutr_101[8] , doutr_101[8] , doutr_101[8] , doutr_101[8:3]};
			tmp_1_105 <= {doutr_102[8] , doutr_102[8] , doutr_102[8:2]} + {doutr_102[8] , doutr_102[8] , doutr_102[8] , doutr_102[8:3]};
			tmp_1_107 <= {doutr_103[8] , doutr_103[8] , doutr_103[8:2]} + {doutr_103[8] , doutr_103[8] , doutr_103[8] , doutr_103[8:3]};
			tmp_1_109 <= {doutr_104[8] , doutr_104[8] , doutr_104[8:2]} + {doutr_104[8] , doutr_104[8] , doutr_104[8] , doutr_104[8:3]};
			tmp_1_1011 <= {doutr_105[8] , doutr_105[8] , doutr_105[8:2]} + {doutr_105[8] , doutr_105[8] , doutr_105[8] , doutr_105[8:3]};
			tmp_1_1013 <= {doutr_106[8] , doutr_106[8] , doutr_106[8:2]} + {doutr_106[8] , doutr_106[8] , doutr_106[8] , doutr_106[8:3]};
			tmp_1_1015 <= {doutr_107[8] , doutr_107[8] , doutr_107[8:2]} + {doutr_107[8] , doutr_107[8] , doutr_107[8] , doutr_107[8:3]};
			tmp_1_1017 <= {doutr_108[8] , doutr_108[8] , doutr_108[8:2]} + {doutr_108[8] , doutr_108[8] , doutr_108[8] , doutr_108[8:3]};
				
			tmp_2_101 <= {doutr_101[8], doutr_101[8:1]} + {doutr_101[8], doutr_101[8] , doutr_101[8:2]};
			tmp_2_103 <= {doutr_102[8], doutr_102[8:1]} + {doutr_102[8], doutr_102[8] , doutr_102[8:2]};
			tmp_2_105 <= {doutr_103[8], doutr_103[8:1]} + {doutr_103[8], doutr_103[8] , doutr_103[8:2]};
			tmp_2_107 <= {doutr_104[8], doutr_104[8:1]} + {doutr_104[8], doutr_104[8] , doutr_104[8:2]};
			tmp_2_109 <= {doutr_105[8], doutr_105[8:1]} + {doutr_105[8], doutr_105[8] , doutr_105[8:2]};
			tmp_2_1011 <= {doutr_106[8], doutr_106[8:1]} + {doutr_106[8], doutr_106[8] , doutr_106[8:2]};
			tmp_2_1013 <= {doutr_107[8], doutr_107[8:1]} + {doutr_107[8], doutr_107[8] , doutr_107[8:2]};
			tmp_2_1015 <= {doutr_108[8], doutr_108[8:1]} + {doutr_108[8], doutr_108[8] , doutr_108[8:2]};
			tmp_2_1017 <= {doutr_109[8], doutr_109[8:1]} + {doutr_109[8], doutr_109[8] , doutr_109[8:2]};
			
			tmp_3_101 <= {doutr_102[8], doutr_102[8] , doutr_102[8] , doutr_102[8:3]};
			tmp_3_103 <= {doutr_103[8], doutr_103[8] , doutr_103[8] , doutr_103[8:3]};
			tmp_3_105 <= {doutr_104[8], doutr_104[8] , doutr_104[8] , doutr_104[8:3]};
			tmp_3_107 <= {doutr_105[8], doutr_105[8] , doutr_105[8] , doutr_105[8:3]};
			tmp_3_109 <= {doutr_106[8], doutr_106[8] , doutr_106[8] , doutr_106[8:3]};
			tmp_3_1011 <= {doutr_107[8], doutr_107[8] , doutr_107[8] , doutr_107[8:3]};
			tmp_3_1013 <= {doutr_108[8], doutr_108[8] , doutr_108[8] , doutr_108[8:3]};
			tmp_3_1015 <= {doutr_109[8], doutr_109[8] , doutr_109[8] , doutr_109[8:3]};
			tmp_3_1017 <= {doutr_1010[8], doutr_1010[8] , doutr_1010[8] , doutr_1010[8:3]};

			add_tmp_101 <= tmp_1_101 + tmp_2_101;
			add_tmp_103 <= tmp_1_103 + tmp_2_103;
			add_tmp_105 <= tmp_1_105 + tmp_2_105;
			add_tmp_107 <= tmp_1_107 + tmp_2_107;
			add_tmp_109 <= tmp_1_109 + tmp_2_109;
			add_tmp_1011 <= tmp_1_1011 + tmp_2_1011;
			add_tmp_1013 <= tmp_1_1013 + tmp_2_1013;
			add_tmp_1015 <= tmp_1_1015 + tmp_2_1015;
			add_tmp_1017 <= tmp_1_1017 + tmp_2_1017;

			doutr1 <= add_tmp_101 - tmp_3_101;
			doutr3 <= add_tmp_103 - tmp_3_103;
			doutr5 <= add_tmp_105 - tmp_3_105;
			doutr7 <= add_tmp_107 - tmp_3_107;
			doutr9 <= add_tmp_109 - tmp_3_109;
			doutr11 <= add_tmp_1011 - tmp_3_1011;
			doutr13 <= add_tmp_1013 - tmp_3_1013;
			doutr15 <= add_tmp_1015 - tmp_3_1015;
			doutr17 <= add_tmp_1017 - tmp_3_1017;

		doutr18 <= doutr_109;

		tmp_1_1019 <= {doutr_108[8], doutr_108[8] , doutr_108[8] , doutr_108[8:3]};

		tmp_2_1019 <= {doutr_109[8], doutr_109[8:1]} +
				{doutr_109[8], doutr_109[8] , doutr_109[8:2]};
				
		tmp_3_1019 <= {doutr_1010[8] , doutr_1010[8] , doutr_1010[8:2]} +
			{doutr_1010[8] , doutr_1010[8] , doutr_1010[8] , doutr_1010[8:3]};

		add_tmp_1019 <= tmp_2_1019 + tmp_3_1019;

		doutr19 <= add_tmp_1019 - tmp_1_1019;

		doutr20 <= doutr_1010;
   end 
endmodule
