
module wrapper_qs_intr_10_20 (clk, 
   din0, 
   din1, 
   din2, 
   din3, 
   din4, 
   din5, 
   din6, 
   din7, 
   din8, 
   din9, 
   din10, 
wen_4, addrin, 
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
   dout20, 
rdy);

   input clk; 
   input[7:0] din0; 
   input[7:0] din1; 
   input[7:0] din2; 
   input[7:0] din3; 
   input[7:0] din4; 
   input[7:0] din5; 
   input[7:0] din6; 
   input[7:0] din7; 
   input[7:0] din8; 
   input[7:0] din9; 
   input[7:0] din10; 
   input wen_4; 
   input[18:0] addrin; 
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
   wire[15:0] dout0; 
   wire[15:0] dout1; 
   wire[15:0] dout2; 
   wire[15:0] dout3; 
   wire[15:0] dout4; 
   wire[15:0] dout5; 
   wire[15:0] dout6; 
   wire[15:0] dout7; 
   wire[15:0] dout8; 
   wire[15:0] dout9; 
   wire[15:0] dout10; 
   wire[15:0] dout11; 
   wire[15:0] dout12; 
   wire[15:0] dout13; 
   wire[15:0] dout14; 
   wire[15:0] dout15; 
   wire[15:0] dout16; 
   wire[15:0] dout17; 
   wire[15:0] dout18; 
   wire[15:0] dout19; 
   wire[15:0] dout20; 
   output rdy; 
   wire rdy;
   wire[15:0] dout_tmp0; 
   wire[15:0] dout_tmp1; 
   wire[15:0] dout_tmp2; 
   wire[15:0] dout_tmp3; 
   wire[15:0] dout_tmp4; 
   wire[15:0] dout_tmp5; 
   wire[15:0] dout_tmp6; 
   wire[15:0] dout_tmp7; 
   wire[15:0] dout_tmp8; 
   wire[15:0] dout_tmp9; 
   wire[15:0] dout_tmp10; 
   wire[15:0] dout_tmp11; 
   wire[15:0] dout_tmp12; 
   wire[15:0] dout_tmp13; 
   wire[15:0] dout_tmp14; 
   wire[15:0] dout_tmp15; 
   wire[15:0] dout_tmp16; 
   wire[15:0] dout_tmp17; 
   wire[15:0] dout_tmp18; 
   wire[15:0] dout_tmp19; 
   wire[15:0] dout_tmp20; 
   wire[7:0] addr_tmp; 
   wire[15:0] dout_tt; 

	reg [15:0]tmy_ram0;
	reg [15:0]tmy_ram1;
	reg [15:0]tmy_ram2;
	reg [15:0]tmy_ram3;
	reg [15:0]tmy_ram4;
	reg [15:0]tmy_ram5;
	reg [15:0]tmy_ram6;
	reg [15:0]tmy_ram7;
	reg [15:0]tmy_ram8;
	reg [15:0]tmy_ram9;
	reg [15:0]tmy_ram10;
	reg [15:0]tmy_ram11;
	reg [15:0]tmy_ram12;
	reg [15:0]tmy_ram13;
	reg [15:0]tmy_ram14;
	reg [15:0]tmy_ram15;
	reg [15:0]tmy_ram16;
	reg [15:0]tmy_ram17;
	reg [15:0]tmy_ram18;
	reg [15:0]tmy_ram19;
	reg [15:0]tmy_ram20;
	reg [15:0]my_ram0;
	reg [15:0]my_ram1;
	reg [15:0]my_ram2;
	reg [15:0]my_ram3;
	reg [15:0]my_ram4;
	reg [15:0]my_ram5;
	reg [15:0]my_ram6;
	reg [15:0]my_ram7;
	reg [15:0]my_ram8;
	reg [15:0]my_ram9;
	reg [15:0]my_ram10;
	reg [15:0]my_ram11;
	reg [15:0]my_ram12;
	reg [15:0]my_ram13;
	reg [15:0]my_ram14;
	reg [15:0]my_ram15;
	reg [15:0]my_ram16;
	reg [15:0]my_ram17;
	reg [15:0]my_ram18;
	reg [15:0]my_ram19;
	reg [15:0]my_ram20;

	assign rdy = 1'b1;
	assign dout0 = my_ram0;
	assign dout1 = my_ram1;
	assign dout2 = my_ram2;
	assign dout3 = my_ram3;
	assign dout4 = my_ram4;
	assign dout5 = my_ram5;
	assign dout6 = my_ram6;
	assign dout7 = my_ram7;
	assign dout8 = my_ram8;
	assign dout9 = my_ram9;
	assign dout10 = my_ram10;
	assign dout11 = my_ram11;
	assign dout12 = my_ram12;
	assign dout13 = my_ram13;
	assign dout14 = my_ram14;
	assign dout15 = my_ram15;
	assign dout16 = my_ram16;
	assign dout17 = my_ram17;
	assign dout18 = my_ram18;
	assign dout19 = my_ram19;
	assign dout20 = my_ram20;
	always @(posedge clk)
	begin
		if (wen_4 == 1'b1)	
		begin
			tmy_ram0 <= dout_tmp0;
			tmy_ram1 <= dout_tmp1;
			tmy_ram2 <= dout_tmp2;
			tmy_ram3 <= dout_tmp3;
			tmy_ram4 <= dout_tmp4;
			tmy_ram5 <= dout_tmp5;
			tmy_ram6 <= dout_tmp6;
			tmy_ram7 <= dout_tmp7;
			tmy_ram8 <= dout_tmp8;
			tmy_ram9 <= dout_tmp9;
			tmy_ram10 <= dout_tmp10;
			tmy_ram11 <= dout_tmp11;
			tmy_ram12 <= dout_tmp12;
			tmy_ram13 <= dout_tmp13;
			tmy_ram14 <= dout_tmp14;
			tmy_ram15 <= dout_tmp15;
			tmy_ram16 <= dout_tmp16;
			tmy_ram17 <= dout_tmp17;
			tmy_ram18 <= dout_tmp18;
			tmy_ram19 <= dout_tmp19;
			tmy_ram20 <= dout_tmp20;
			my_ram0 <= tmy_ram0;
			my_ram1 <= tmy_ram1;
			my_ram2 <= tmy_ram2;
			my_ram3 <= tmy_ram3;
			my_ram4 <= tmy_ram4;
			my_ram5 <= tmy_ram5;
			my_ram6 <= tmy_ram6;
			my_ram7 <= tmy_ram7;
			my_ram8 <= tmy_ram8;
			my_ram9 <= tmy_ram9;
			my_ram10 <= tmy_ram10;
			my_ram11 <= tmy_ram11;
			my_ram12 <= tmy_ram12;
			my_ram13 <= tmy_ram13;
			my_ram14 <= tmy_ram14;
			my_ram15 <= tmy_ram15;
			my_ram16 <= tmy_ram16;
			my_ram17 <= tmy_ram17;
			my_ram18 <= tmy_ram18;
			my_ram19 <= tmy_ram19;
			my_ram20 <= tmy_ram20;
		end
	end

   assign addr_tmp = addrin;

   quadintr_10_20  my_inst_quadintr(clk, wen_4,
   din0, 
   din1, 
   din2, 
   din3, 
   din4, 
   din5, 
   din6, 
   din7, 
   din8, 
   din9, 
   din10, 
   dout_tmp0, 
   dout_tmp1, 
   dout_tmp2, 
   dout_tmp3, 
   dout_tmp4, 
   dout_tmp5, 
   dout_tmp6, 
   dout_tmp7, 
   dout_tmp8, 
   dout_tmp9, 
   dout_tmp10, 
   dout_tmp11, 
   dout_tmp12, 
   dout_tmp13, 
   dout_tmp14, 
   dout_tmp15, 
   dout_tmp16, 
   dout_tmp17, 
   dout_tmp18, 
   dout_tmp19, 
   dout_tmp20);

endmodule
module quadintr_10_20 (clk, new_data,
   din0, 
   din1, 
   din2, 
   din3, 
   din4, 
   din5, 
   din6, 
   din7, 
   din8, 
   din9, 
   din10, 
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
   input[7:0] din6; 
   input[7:0] din7; 
   input[7:0] din8; 
   input[7:0] din9; 
   input[7:0] din10; 
   reg[7:0] dinr0; 
   reg[7:0] dinr1; 
   reg[7:0] dinr2; 
   reg[7:0] dinr3; 
   reg[7:0] dinr4; 
   reg[7:0] dinr5; 
   reg[7:0] dinr6; 
   reg[7:0] dinr7; 
   reg[7:0] dinr8; 
   reg[7:0] dinr9; 
   reg[7:0] dinr10; 

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
   reg[7:0] tmp_111; 
   reg[7:0] tmp_112; 
   reg[7:0] tmp_113; 
   reg[7:0] tmp_114; 
   reg[7:0] tmp_115; 
   reg[7:0] tmp_116; 
   reg[7:0] tmp_117; 
   reg[7:0] tmp_118; 
   reg[7:0] tmp_119; 
   reg[7:0] tmp_120; 
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
   reg[7:0] tmp_211; 
   reg[7:0] tmp_212; 
   reg[7:0] tmp_213; 
   reg[7:0] tmp_214; 
   reg[7:0] tmp_215; 
   reg[7:0] tmp_216; 
   reg[7:0] tmp_217; 
   reg[7:0] tmp_218; 
   reg[7:0] tmp_219; 
   reg[7:0] tmp_220; 
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
   reg[7:0] tmp_311; 
   reg[7:0] tmp_312; 
   reg[7:0] tmp_313; 
   reg[7:0] tmp_314; 
   reg[7:0] tmp_315; 
   reg[7:0] tmp_316; 
   reg[7:0] tmp_317; 
   reg[7:0] tmp_318; 
   reg[7:0] tmp_319; 
   reg[7:0] tmp_320; 
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
   reg[8:0] add_tmp11; 
   reg[8:0] add_tmp12; 
   reg[8:0] add_tmp13; 
   reg[8:0] add_tmp14; 
   reg[8:0] add_tmp15; 
   reg[8:0] add_tmp16; 
   reg[8:0] add_tmp17; 
   reg[8:0] add_tmp18; 
   reg[8:0] add_tmp19; 
   reg[8:0] add_tmp20; 
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
			dinr6 <= din6;
			dinr7 <= din7;
			dinr8 <= din8;
			dinr9 <= din9;
			dinr10 <= din10;

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
				doutr0 <= {dinr0[8-1], dinr0};
				doutr2 <= {dinr1[8-1], dinr1};
				doutr4 <= {dinr2[8-1], dinr2};
				doutr6 <= {dinr3[8-1], dinr3};
				doutr8 <= {dinr4[8-1], dinr4};
				doutr10 <= {dinr5[8-1], dinr5};
				doutr12 <= {dinr6[8-1], dinr6};
				doutr14 <= {dinr7[8-1], dinr7};
				doutr16 <= {dinr8[8-1], dinr8};

				tmp_11 <= {dinr0[8-1], dinr0[8-1], dinr0[8-1:2]} + {dinr0[8-1], dinr0[8-1], dinr0[8-1], dinr0[8-1:3]};
				tmp_13 <= {dinr1[8-1], dinr1[8-1], dinr1[8-1:2]} + {dinr1[8-1], dinr1[8-1], dinr1[8-1], dinr1[8-1:3]};
				tmp_15 <= {dinr2[8-1], dinr2[8-1], dinr2[8-1:2]} + {dinr2[8-1], dinr2[8-1], dinr2[8-1], dinr2[8-1:3]};
				tmp_17 <= {dinr3[8-1], dinr3[8-1], dinr3[8-1:2]} + {dinr3[8-1], dinr3[8-1], dinr3[8-1], dinr3[8-1:3]};
				tmp_19 <= {dinr4[8-1], dinr4[8-1], dinr4[8-1:2]} + {dinr4[8-1], dinr4[8-1], dinr4[8-1], dinr4[8-1:3]};
				tmp_111 <= {dinr5[8-1], dinr5[8-1], dinr5[8-1:2]} + {dinr5[8-1], dinr5[8-1], dinr5[8-1], dinr5[8-1:3]};
				tmp_113 <= {dinr6[8-1], dinr6[8-1], dinr6[8-1:2]} + {dinr6[8-1], dinr6[8-1], dinr6[8-1], dinr6[8-1:3]};
				tmp_115 <= {dinr7[8-1], dinr7[8-1], dinr7[8-1:2]} + {dinr7[8-1], dinr7[8-1], dinr7[8-1], dinr7[8-1:3]};
				tmp_117 <= {dinr8[8-1], dinr8[8-1], dinr8[8-1:2]} + {dinr8[8-1], dinr8[8-1], dinr8[8-1], dinr8[8-1:3]};
				
				tmp_21 <= {dinr1[8-1], dinr1[8-1:1]} + {dinr1[8-1], dinr1[8-1], dinr1[8-1:2]};
				tmp_23 <= {dinr2[8-1], dinr2[8-1:1]} + {dinr2[8-1], dinr2[8-1], dinr2[8-1:2]};
				tmp_25 <= {dinr3[8-1], dinr3[8-1:1]} + {dinr3[8-1], dinr3[8-1], dinr3[8-1:2]};
				tmp_27 <= {dinr4[8-1], dinr4[8-1:1]} + {dinr4[8-1], dinr4[8-1], dinr4[8-1:2]};
				tmp_29 <= {dinr5[8-1], dinr5[8-1:1]} + {dinr5[8-1], dinr5[8-1], dinr5[8-1:2]};
				tmp_211 <= {dinr6[8-1], dinr6[8-1:1]} + {dinr6[8-1], dinr6[8-1], dinr6[8-1:2]};
				tmp_213 <= {dinr7[8-1], dinr7[8-1:1]} + {dinr7[8-1], dinr7[8-1], dinr7[8-1:2]};
				tmp_215 <= {dinr8[8-1], dinr8[8-1:1]} + {dinr8[8-1], dinr8[8-1], dinr8[8-1:2]};
				tmp_217 <= {dinr9[8-1], dinr9[8-1:1]} + {dinr9[8-1], dinr9[8-1], dinr9[8-1:2]};
				
				tmp_31 <= {dinr2[8-1], dinr2[8-1], dinr2[8-1], dinr2[8-1:3]};
				tmp_33 <= {dinr3[8-1], dinr3[8-1], dinr3[8-1], dinr3[8-1:3]};
				tmp_35 <= {dinr4[8-1], dinr4[8-1], dinr4[8-1], dinr4[8-1:3]};
				tmp_37 <= {dinr5[8-1], dinr5[8-1], dinr5[8-1], dinr5[8-1:3]};
				tmp_39 <= {dinr6[8-1], dinr6[8-1], dinr6[8-1], dinr6[8-1:3]};
				tmp_311 <= {dinr7[8-1], dinr7[8-1], dinr7[8-1], dinr7[8-1:3]};
				tmp_313 <= {dinr8[8-1], dinr8[8-1], dinr8[8-1], dinr8[8-1:3]};
				tmp_315 <= {dinr9[8-1], dinr9[8-1], dinr9[8-1], dinr9[8-1:3]};
				tmp_317 <= {dinr10[8-1], dinr10[8-1], dinr10[8-1], dinr10[8-1:3]};

				add_tmp1 <= {tmp_11[8-1], tmp_11} + {tmp_21[8-1], tmp_21};
				add_tmp3 <= {tmp_13[8-1], tmp_13} + {tmp_23[8-1], tmp_23};
				add_tmp5 <= {tmp_15[8-1], tmp_15} + {tmp_25[8-1], tmp_25};
				add_tmp7 <= {tmp_17[8-1], tmp_17} + {tmp_27[8-1], tmp_27};
				add_tmp9 <= {tmp_19[8-1], tmp_19} + {tmp_29[8-1], tmp_29};
				add_tmp11 <= {tmp_111[8-1], tmp_111} + {tmp_211[8-1], tmp_211};
				add_tmp13 <= {tmp_113[8-1], tmp_113} + {tmp_213[8-1], tmp_213};
				add_tmp15 <= {tmp_115[8-1], tmp_115} + {tmp_215[8-1], tmp_215};
				add_tmp17 <= {tmp_117[8-1], tmp_117} + {tmp_217[8-1], tmp_217};

				doutr1 <= add_tmp1 - {tmp_31[8-1], tmp_31};
				doutr3 <= add_tmp3 - {tmp_33[8-1], tmp_33};
				doutr5 <= add_tmp5 - {tmp_35[8-1], tmp_35};
				doutr7 <= add_tmp7 - {tmp_37[8-1], tmp_37};
				doutr9 <= add_tmp9 - {tmp_39[8-1], tmp_39};
				doutr11 <= add_tmp11 - {tmp_311[8-1], tmp_311};
				doutr13 <= add_tmp13 - {tmp_313[8-1], tmp_313};
				doutr15 <= add_tmp15 - {tmp_315[8-1], tmp_315};
				doutr17 <= add_tmp17 - {tmp_317[8-1], tmp_317};

		doutr18 <= {dinr9[8-1] , dinr9};

		tmp_119 <= {dinr8[8-1], dinr8[8-1] , dinr8[8-1] , dinr8[8-1 : 3]};

		tmp_219 <= {dinr9[8-1], dinr9[8-1 : 1]} + {dinr9[8-1], dinr9[8-1] , dinr9[8-1 : 2]};
				
		tmp_319 <= {dinr10[8-1] , dinr10[8-1] , dinr10[8-1 : 2]} + {dinr10[8-1] , dinr10[8-1] , dinr10[8-1] , dinr10[8-1 : 3]};

		add_tmp19 <= {tmp_219[8-1] , tmp_219} + {tmp_319[8-1] , tmp_319};

		doutr19 <= add_tmp19 - {tmp_119[8-1] , tmp_119};

		doutr20 <= {dinr10[8-1] , dinr10};
   end 
endmodule
