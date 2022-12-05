`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module vecmat_add_h #(parameter uarraysize=1024,parameter vectwidth=64)
 (
 input clk,reset,
 input [uarraysize-1:0] mulout,
 output reg [15:0] data_out
 );
           
 wire [15:0] tmp0, tmp1 ,tmp2 ,tmp3 ,tmp4 ,tmp5 ,tmp6 ,tmp7 ,tmp8 ,tmp9 ,tmp10 ,tmp11 ,tmp12 ,tmp13 ,tmp14 ,tmp15 ,tmp16 ,tmp17 ,tmp18 ,tmp19 ,tmp20 ,tmp21 ,tmp22 ,tmp23 ,tmp24 ,tmp25 ,tmp26 ,tmp27 ,tmp28 ,tmp29 ,tmp30 ,tmp31 ,tmp32 ,tmp33 ,tmp34 ,tmp35 ,tmp36 ,tmp37 ,tmp38 ,tmp39 ,tmp40 ,tmp41 ,tmp42 ,tmp43 ,tmp44 ,tmp45 ,tmp46 ,tmp47 ,tmp48 ,tmp49 ,tmp50,tmp51 ,tmp52 ,tmp53,tmp54 ,tmp55 ,tmp56 ,tmp57 ,tmp58, tmp59 ,tmp60 ,tmp61,tmp62; 
 reg[31:0] i;
 reg [15:0] ff1,ff3,ff5,ff7,ff9,ff11,ff13,ff15,ff17,ff19,ff21,ff23,ff25,ff27,ff29,ff31;

 always @(posedge clk) begin
	if(~reset) begin
		data_out <= tmp61;

		//adding a flop pipeline stage
		ff1 <= tmp1;
		ff3 <= tmp3;
		ff5 <= tmp5;
		ff7 <= tmp7;
		ff9 <= tmp9;
		ff11 <= tmp11;
		ff13 <= tmp13;
		ff15 <= tmp15;
		ff17 <= tmp17;
		ff19 <= tmp19;
		ff21 <= tmp21;
		ff23 <= tmp23;
		ff25 <= tmp25;
		ff27 <= tmp27;
		ff29 <= tmp29;
		ff31 <= tmp31;
	end   
 end     
                                                        
           // fixed point addition  
        	qadd2 Add_u0(.a(mulout[16*0+:16]),.b(mulout[16*1+:16]),.c(tmp0));
		qadd2 Add_u2(.a(mulout[16*2+:16]),.b(mulout[16*3+:16]),.c(tmp2));
		qadd2 Add_u4(.a(mulout[16*4+:16]),.b(mulout[16*5+:16]),.c(tmp4));
		qadd2 Add_u6(.a(mulout[16*6+:16]),.b(mulout[16*7+:16]),.c(tmp6));
		qadd2 Add_u8(.a(mulout[16*8+:16]),.b(mulout[16*9+:16]),.c(tmp8));
		qadd2 Add_u10(.a(mulout[16*10+:16]),.b(mulout[16*11+:16]),.c(tmp10));
		qadd2 Add_u12(.a(mulout[16*12+:16]),.b(mulout[16*13+:16]),.c(tmp12));
		qadd2 Add_u14(.a(mulout[16*14+:16]),.b(mulout[16*15+:16]),.c(tmp14));
		qadd2 Add_u16(.a(mulout[16*16+:16]),.b(mulout[16*17+:16]),.c(tmp16));
		qadd2 Add_u18(.a(mulout[16*18+:16]),.b(mulout[16*19+:16]),.c(tmp18));
		qadd2 Add_u20(.a(mulout[16*20+:16]),.b(mulout[16*21+:16]),.c(tmp20));
		qadd2 Add_u22(.a(mulout[16*22+:16]),.b(mulout[16*23+:16]),.c(tmp22));
		qadd2 Add_u24(.a(mulout[16*24+:16]),.b(mulout[16*25+:16]),.c(tmp24));
		qadd2 Add_u26(.a(mulout[16*26+:16]),.b(mulout[16*27+:16]),.c(tmp26));
		qadd2 Add_u28(.a(mulout[16*28+:16]),.b(mulout[16*29+:16]),.c(tmp28));
		qadd2 Add_u30(.a(mulout[16*30+:16]),.b(mulout[16*31+:16]),.c(tmp30));
		qadd2 Add_u32(.a(mulout[16*32+:16]),.b(mulout[16*33+:16]),.c(tmp32));
		qadd2 Add_u34(.a(mulout[16*34+:16]),.b(mulout[16*35+:16]),.c(tmp34));
		qadd2 Add_u36(.a(mulout[16*36+:16]),.b(mulout[16*37+:16]),.c(tmp36));
		qadd2 Add_u38(.a(mulout[16*38+:16]),.b(mulout[16*39+:16]),.c(tmp38));
		qadd2 Add_u40(.a(mulout[16*40+:16]),.b(mulout[16*41+:16]),.c(tmp40));
		qadd2 Add_u42(.a(mulout[16*42+:16]),.b(mulout[16*43+:16]),.c(tmp42));
		qadd2 Add_u44(.a(mulout[16*44+:16]),.b(mulout[16*45+:16]),.c(tmp44));
		qadd2 Add_u46(.a(mulout[16*46+:16]),.b(mulout[16*47+:16]),.c(tmp46));
		qadd2 Add_u48(.a(mulout[16*48+:16]),.b(mulout[16*49+:16]),.c(tmp48));
		qadd2 Add_u50(.a(mulout[16*50+:16]),.b(mulout[16*51+:16]),.c(tmp50));
		qadd2 Add_u52(.a(mulout[16*52+:16]),.b(mulout[16*53+:16]),.c(tmp52));
		qadd2 Add_u54(.a(mulout[16*54+:16]),.b(mulout[16*55+:16]),.c(tmp54));
		qadd2 Add_u56(.a(mulout[16*56+:16]),.b(mulout[16*57+:16]),.c(tmp56));
		qadd2 Add_u58(.a(mulout[16*58+:16]),.b(mulout[16*59+:16]),.c(tmp58));
		qadd2 Add_u60(.a(mulout[16*60+:16]),.b(mulout[16*61+:16]),.c(tmp60));
		qadd2 Add_u62(.a(mulout[16*62+:16]),.b(mulout[16*63+:16]),.c(tmp62));
            
			qadd2 Add_u1(.a(tmp0),.b(tmp2),.c(tmp1));
			qadd2 Add_u3(.a(tmp4),.b(tmp6),.c(tmp3));
			qadd2 Add_u5(.a(tmp8),.b(tmp10),.c(tmp5));
			qadd2 Add_u7(.a(tmp12),.b(tmp14),.c(tmp7));
			qadd2 Add_u9(.a(tmp16),.b(tmp18),.c(tmp9));
			qadd2 Add_u11(.a(tmp20),.b(tmp22),.c(tmp11));
			qadd2 Add_u13(.a(tmp24),.b(tmp26),.c(tmp13));
			qadd2 Add_u15(.a(tmp28),.b(tmp30),.c(tmp15));
			qadd2 Add_u17(.a(tmp32),.b(tmp34),.c(tmp17));
			qadd2 Add_u19(.a(tmp36),.b(tmp38),.c(tmp19));
			qadd2 Add_u21(.a(tmp40),.b(tmp42),.c(tmp21));
			qadd2 Add_u23(.a(tmp44),.b(tmp46),.c(tmp23));
			qadd2 Add_u25(.a(tmp48),.b(tmp50),.c(tmp25));
			qadd2 Add_u27(.a(tmp52),.b(tmp54),.c(tmp27));
			qadd2 Add_u29(.a(tmp56),.b(tmp58),.c(tmp29));
			qadd2 Add_u31(.a(tmp60),.b(tmp62),.c(tmp31));

			qadd2 Add_u33(.a(ff1),.b(ff3),.c(tmp33));
			qadd2 Add_u35(.a(ff5),.b(ff7),.c(tmp35));
			qadd2 Add_u37(.a(ff9),.b(ff11),.c(tmp37));
			qadd2 Add_u39(.a(ff13),.b(ff15),.c(tmp39));
			qadd2 Add_u41(.a(ff17),.b(ff19),.c(tmp41));
			qadd2 Add_u43(.a(ff21),.b(ff23),.c(tmp43));
			qadd2 Add_u45(.a(ff25),.b(ff27),.c(tmp45));
			qadd2 Add_u47(.a(ff29),.b(ff31),.c(tmp47));

			qadd2 Add_u49(.a(tmp33),.b(tmp35),.c(tmp49));
			qadd2 Add_u51(.a(tmp37),.b(tmp39),.c(tmp51));
			qadd2 Add_u53(.a(tmp41),.b(tmp43),.c(tmp53));
			qadd2 Add_u55(.a(tmp45),.b(tmp47),.c(tmp55));

			qadd2 Add_u57(.a(tmp49),.b(tmp51),.c(tmp57));
			qadd2 Add_u59(.a(tmp53),.b(tmp55),.c(tmp59));

			qadd2 Add_u61(.a(tmp57),.b(tmp59),.c(tmp61));
			
			 /*qadd #(12,16) Add_u1(.a(tmp0),.b(tmp2),.c(tmp1));
			 qadd #(12,16) Add_u3(.a(tmp4),.b(tmp6),.c(tmp3));
			// qadd #(12,16) Add_u5(.a(tmp8),.b(tmp1),.c(tmp5));
 			 qadd #(12,16) Add_u7(.a(tmp1),.b(tmp3),.c(tmp7));*/
									
  
endmodule

module qadd2(
 input [15:0] a,
 input [15:0] b,
 output [15:0] c
    );
    
assign c = a + b;


endmodule



