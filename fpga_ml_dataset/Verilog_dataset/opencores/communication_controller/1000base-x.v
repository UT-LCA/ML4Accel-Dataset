//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "clean_rst.v"                                     ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"

module clean_rst(
  input      clk,
  input      rsti,
  output reg rsto
);
  reg rstt;
   
   always @(posedge clk, posedge rsti)
     begin
	rstt <= (rsti) ? 1 : 0;
	rsto <= (rsti) ? 1 : rstt;
     end
     
endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "decoder_8b10b.v"                                 ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Section 36.2.4 which is available from : ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
////                                                              ////
//// and the 8B/10B coding scheme from the 1993 IBM publication   ////
//// "DC-Balanced, Partitioned-Block, 8B/10B Transmission Code"   ////
//// by A.X. Widmer and P.A. Franasze" see doc/01-581v1.pdf       ////
////                                                              ////
//// and US patent #4,486,739 "BYTE ORIENTED DC BALANCED          ////
//// (0,4) 8B/10B PARTITIONED BLOCK TRANSMISSION CODE "; see :    ////
////                                                              ////
//// doc/US4486739.pdf                                            ////
////                                                              ////
//// http://en.wikipedia.org/wiki/8b/10b_encoding                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "timescale.v"

module decoder_8b10b (
		  
   // --- Resets ---
   input reset,

   // --- Clocks ---
   input RBYTECLK,
		  
   // --- TBI (Ten Bit Interface) input bus
   input [9:0] tbi,

   // --- Control (K)
   output reg K_out,
		  
   // -- Eight bit output bus
   output reg [7:0] ebi,

   // --- 8B/10B RX coding error ---
   output reg coding_err,
		 
   // --- 8B/10B RX disparity ---
   output reg disparity,
   
   // --- 8B/10B RX disparity error ---
   output disparity_err
  
  );
   
`ifdef MODEL_TECH
   // ModelSim debugging only 
   wire [4:0] decoder_8b_X;  wire [2:0] decoder_8b_Y;
   
   assign     decoder_8b_X = ebi[4:0];
   assign     decoder_8b_Y = ebi[7:5];
`endif    
   
   wire   a,b,c,d,e,i,f,g,h,j;  // 10 Bit inputs
 
   assign {a,b,c,d,e,i,f,g,h,j} = tbi[9:0];
   
   // ******************************************************************************
   // Figure 10 - Decoder: 6b - Signals
   // ******************************************************************************
   wire 	AEQB, CEQD, P22, P13, P31;
   
   // ******************************************************************************
   // Figure 11 - Decoder: K - Signals
   // ******************************************************************************
   
   wire 	eeqi, c_d_e_i, cn_dn_en_in;
   
   wire 	P22_a_c_eeqi, P22_an_cn_eeqi;
   
   wire 	P22_b_c_eeqi, P22_bn_cn_eeqi, an_bn_en_in;
   
   wire 	a_b_e_i, P13_d_e_i, P13_in, P13_en, P31_i;

   // ******************************************************************************
   // Figure 12 - Decoder: 5B - Signals   
   // ******************************************************************************
   
   wire 	OR12_1, OR12_2, OR12_3, OR12_4, OR12_5, OR12_6, OR12_7;
   
   wire 	A, B, C, D, E;

   // ******************************************************************************
   // Figure 13 - Decoder: 3B - Signals
   // ******************************************************************************
   
   wire  	K, F, G, H, K28p, KA, KB, KC;
   
   // ******************************************************************************
   // Figure 10 - Decoder: 6b Input Function
   // ******************************************************************************

   assign 	AEQB = (a & b) | (!a & !b) ;
   assign 	CEQD = (c & d) | (!c & !d) ;
   assign 	P22 = (a & b & !c & !d) | (c & d & !a & !b) | ( !AEQB & !CEQD) ;
   assign 	P13 = ( !AEQB & !c & !d) | ( !CEQD & !a & !b) ;
   assign 	P31 = ( !AEQB & c & d) | ( !CEQD & a & b) ;
   
   // ******************************************************************************
   // Figure 11 - Decoder: K 
   // ******************************************************************************
   
   assign 	eeqi = (e == i);
   
   assign 	P22_a_c_eeqi   = P22 & a & c & eeqi;
   assign 	P22_an_cn_eeqi = P22 & !a & !c & eeqi;

   assign 	cn_dn_en_in = (!c & !d & !e & !i);
   assign 	c_d_e_i     = (c & d & e & i);
   
   assign 	KA = c_d_e_i | cn_dn_en_in;
   assign 	KB = P13 & (!e & i & g & h & j);
   assign 	KC = P31 & (e & !i & !g & !h & !j);
   
   assign 	K = KA | KB | KC;

   assign 	P22_b_c_eeqi   = P22 & b & c & eeqi;
   assign 	P22_bn_cn_eeqi = P22 & !b & !c & eeqi;
   assign 	an_bn_en_in    = !a & !b & !e & !i;
   assign 	a_b_e_i        = a & b & e & i;
   assign 	P13_d_e_i      = P13 & d & e & i;
   assign 	P13_in         = P13 & !i;
   assign 	P13_en         = P13 & !e;
   assign 	P31_i          = P31 & i;


   // ******************************************************************************
   // Figure 12 - Decoder: 5B/6B
   // ******************************************************************************

   assign 	OR12_1 = P22_an_cn_eeqi | P13_en;
   assign 	OR12_2 = a_b_e_i | cn_dn_en_in | P31_i;
   assign 	OR12_3 = P31_i | P22_b_c_eeqi | P13_d_e_i;
   assign 	OR12_4 = P22_a_c_eeqi | P13_en;
   assign 	OR12_5 = P13_en | cn_dn_en_in | an_bn_en_in;
   assign 	OR12_6 = P22_an_cn_eeqi | P13_in;
   assign 	OR12_7 = P13_d_e_i | P22_bn_cn_eeqi;
   
   assign 	A = a ^ (OR12_7 | OR12_1 | OR12_2);
   assign 	B = b ^ (OR12_2 | OR12_3 | OR12_4);
   assign 	C = c ^ (OR12_1 | OR12_3 | OR12_5);
   assign 	D = d ^ (OR12_2 | OR12_4 | OR12_7);
   assign 	E = e ^ (OR12_5 | OR12_6 | OR12_7);
   
   // ******************************************************************************
   // Figure 13 - Decoder: 3B/4B
   // ******************************************************************************
   
   // K28 with positive disp into fghi - .1, .2, .5, and .6 specal cases
   assign 	K28p = ! (c | d | e | i) ;
   
   assign 	F = (j & !f & (h | !g | K28p)) | (f & !j & (!h | g | !K28p)) | (K28p & g & h) | (!K28p & !g & !h) ;
   
   assign 	G = (j & !f & (h | !g | !K28p)) | (f & !j & (!h | g |K28p)) | (!K28p & g & h) | (K28p & !g & !h) ;
   
   assign 	H = ((j ^ h) & ! ((!f & g & !h & j & !K28p) | (!f & g & h & !j & K28p) | 
				  (f & !g & !h & j & !K28p) | (f & !g & h & !j & K28p))) | (!f & g & h & j) | (f & !g & !h & !j) ;

   // ******************************************************************************
   // Registered 8B output
   // ******************************************************************************

   always @(posedge RBYTECLK or posedge reset)
     if (reset)
       begin
	  K_out <= 0; ebi[7:0] <= 8'b0; 
       end
     else 
       begin
	  K_out <= K; ebi[7:0] <= { H, G, F, E, D, C, B, A } ;
       end
   
   // ******************************************************************************
   // Disparity 
   // ******************************************************************************

   wire heqj, fghjP13, fghjP31, fghj22;
   
   wire DISPARITY6p, DISPARITY6n, DISPARITY4p, DISPARITY4n;
   
   wire DISPARITY6b, DISPARITY6a2, DISPARITY6a0;
   
   assign 	feqg = (f & g) | (!f & !g); 
   assign 	heqj = (h & j) | (!h & !j);
   
   assign 	fghjP13 = ( !feqg & !h & !j) | ( !heqj & !f & !g) ;
   assign 	fghjP31 = ( (!feqg) & h & j) | ( !heqj & f & g) ;
   assign 	fghj22 = (f & g & !h & !j) | (!f & !g & h & j) | ( !feqg & !heqj) ;
   
   assign 	DISPARITY6p = (P31 & (e | i)) | (P22 & e & i) ;   
   assign 	DISPARITY6n = (P13 & ! (e & i)) | (P22 & !e & !i);
   
   assign 	DISPARITY4p = fghjP31 ;
   assign 	DISPARITY4n = fghjP13 ;
  
   assign 	DISPARITY6a  = P31 | (P22 & disparity); // pos disp if P22 and was pos, or P31.
   assign 	DISPARITY6a2 = P31 & disparity;         // disp is ++ after 4 bts
   assign 	DISPARITY6a0 = P13 & ! disparity;       // -- disp after 4 bts
   
   assign 	DISPARITY6b = (e & i & ! DISPARITY6a0) | (DISPARITY6a & (e | i)) | DISPARITY6a2;
   
   
   // ******************************************************************************
   // Disparity errors
   // ******************************************************************************
   
   wire 	derr1,derr2,derr3,derr4,derr5,derr6,derr7,derr8;
   
   assign derr1 = (disparity & DISPARITY6p) | (DISPARITY6n & !disparity);
   assign derr2 = (disparity & !DISPARITY6n & f & g);
   assign derr3 = (disparity & a & b & c);
   assign derr4 = (disparity & !DISPARITY6n & DISPARITY4p);
   assign derr5 = (!disparity & !DISPARITY6p & !f & !g);
   assign derr6 = (!disparity & !a & !b & !c);
   assign derr7 = (!disparity & !DISPARITY6p & DISPARITY4n);
   assign derr8 = (DISPARITY6p & DISPARITY4p) | (DISPARITY6n & DISPARITY4n);
   
   // ******************************************************************************
   // Register disparity and disparity_err output
   // ******************************************************************************

   reg derr12, derr34, derr56, derr78;

   always @(posedge RBYTECLK or posedge reset)
     if (reset)
       begin
          disparity <= 1'b0;
          derr12 <= 1;
          derr34 <= 1;
          derr56 <= 1;
          derr78 <= 1;
       end
     else
       begin
	  disparity <= fghjP31 | (DISPARITY6b & fghj22) ;

          derr12 <= derr1 | derr2;
          derr34 <= derr3 | derr4;
          derr56 <= derr5 | derr6;
          derr78 <= derr7 | derr8;
       end

   assign disparity_err = derr12|derr34|derr56|derr78;

   // ******************************************************************************
   // Coding errors as defined in patent - page 447
   // ******************************************************************************

   wire cerr1, cerr2, cerr3, cerr4, cerr5, cerr6, cerr7, cerr8, cerr9;
   
   assign cerr1 = (a &  b &  c &  d) | (!a & !b & !c & !d);
   assign cerr2 = (P13 & !e & !i);
   assign cerr3 = (P31 & e & i);
   assign cerr4 = (f & g & h & j) | (!f & !g & !h & !j);
   assign cerr5 = (e & i & f & g & h) | (!e & !i & !f & !g & !h);
   assign cerr6 = (e & !i & g & h & j) | (!e & i & !g & !h & !j);
   assign cerr7 = (((e & i & !g & !h & !j) | (!e & !i & g & h & j)) & !((c & d & e) | (!c & !d & !e)));
   assign cerr8 = (!P31 & e & !i & !g & !h & !j);
   assign cerr9 = (!P13 & !e & i & g & h & j);

   reg 	  cerr;
   
   always @(posedge RBYTECLK or posedge reset)
     if (reset)
       cerr <= 0;
     else
       cerr <= cerr1|cerr2|cerr3|cerr4|cerr5|cerr6|cerr7|cerr8|cerr9;
   
   // ******************************************************************************
   // Disparity coding errors curtosy of http://asics.chuckbenz.com/decode.v
   // ******************************************************************************
   
   wire   zerr1, zerr2, zerr3;
   
   assign zerr1 = (DISPARITY6p & DISPARITY4p) | (DISPARITY6n & DISPARITY4n);
   assign zerr2 = (f & g & !h & !j & DISPARITY6p);
   assign zerr3 = (!f & !g & h & j & DISPARITY6n);

   reg 	  zerr;
   
   always @(posedge RBYTECLK or posedge reset)
     if (reset)
       zerr <= 0;
     else
       zerr <= zerr1|zerr2|zerr3;
   
   // ******************************************************************************
   // Extra coding errors - again from http://asics.chuckbenz.com/decode.v
   // ******************************************************************************
   
   wire   xerr1, xerr2, xerr3, xerr4;

   reg 	  xerr;
   
   assign xerr1 = (a & b & c & !e & !i & ((!f & !g) | fghjP13));
   assign xerr2 =(!a & !b & !c & e & i & ((f & g) | fghjP31));
   assign xerr3 = (c & d & e & i & !f & !g & !h);
   assign xerr4 = (!c & !d & !e & !i & f & g & h);

   always @(posedge RBYTECLK or posedge reset)
     if (reset)
       xerr <= 0;
     else
       xerr <= xerr1|xerr2|xerr3|xerr4;
   
   // ******************************************************************************
   // Registered Coding error output
   // ******************************************************************************
   
   always @(posedge RBYTECLK or posedge reset)
     if (reset) 
       coding_err <= 1'b1;
     else   
       coding_err <= cerr | zerr | xerr;
   
endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "encoder_8b10b.v"                                 ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Section 36.2.4 which is available from : ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
////                                                              ////
//// and the 8B/10B coding scheme from the 1993 IBM publication   ////
//// "DC-Balanced, Partitioned-Block, 8B/10B Transmission Code"   ////
//// by A.X. Widmer and P.A. Franasze" see doc/01-581v1.pdf       ////
////                                                              ////
//// and US patent #4,486,739 "BYTE ORIENTED DC BALANCED          ////
//// (0,4) 8B/10B PARTITIONED BLOCK TRANSMISSION CODE "; see :    ////
////                                                              ////
//// doc/US4486739.pdf                                            ////
////                                                              ////
//// http://en.wikipedia.org/wiki/8b/10b_encoding                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"

module encoder_8b10b (
		  
   // --- Resets
   input reset,

   // --- Clocks
   input SBYTECLK,
		  
   // --- Control (K) input	  
   input K,
		  
   // --- Eight Bt input bus	  
   input [7:0] ebi,
		
   // --- TB (Ten Bt Interface) output bus
   output [9:0] tbi,

   output reg disparity
   );

  
   // Figure 3 - Encoder: 5B/6B classification, L functions
   wire   L40, L04, L13, L31, L22, AeqB, CeqD;

   // Figure 5 - 5B/6B Encoder: disparity classifications
   wire   PD_1S6, NDOS6, PDOS6, ND_1S6;

   // Figure 5 - 3B/4B Encoder: disparity classifications
   wire   ND_1S4, PD_1S4, NDOS4, PDOS4;

   // Figure 6 - Encoder: control of complementation
   wire   illegalk, DISPARITY6;
   reg    COMPLS6, COMPLS4;

   // Figure 7 - 5B/6B encoding 
   wire   NAO, NBO, NCO, NDO, NEO, NIO;
   
   // Figure 8: 3B/4B encoding
   wire   NFO, NGO, NHO, NJO;

   // 8B Inputs
   wire   A,B,C,D,E,F,G,H;      
 
   assign {H,G,F,E,D,C,B,A} = ebi[7:0];
 
   // 10B Outputs
   reg 	  a,b,c,d,e,i,f,g,h,j; 
  
   assign tbi[9:0] = {a,b,c,d,e,i,f,g,h,j};

   wire [9:0] tst;
   
   assign tst[9:0] = {NAO,NBO,NCO,NDO,NEO,NIO,NFO,NGO,NHO,NJO};
  
   // ******************************************************************************
   // Figures 7 & 8 - Latched 5B/6B and 3B/4B encoder outputs 
   // ******************************************************************************
   
   always @(posedge SBYTECLK, posedge reset)
     if (reset) 
       begin
	  disparity <= 1'b0; {a,b,c,d,e,i,f,g,h,j} <= 10'b0; 
       end 
     else begin
       	
	disparity <= (PDOS4 | NDOS4) ^ DISPARITY6;
	
	{a,b,c,d,e,i,f,g,h,j} <= { NAO^COMPLS6, NBO^COMPLS6, NCO^COMPLS6, 
				   NDO^COMPLS6, NEO^COMPLS6, NIO^COMPLS6,
				   NFO^COMPLS4, NGO^COMPLS4, 
				   NHO^COMPLS4, NJO^COMPLS4 };	
     end // else: !if(reset)
    
   // ******************************************************************************
   // Figure 3 - Encoder: 5B/6B classification, L functions
   // ******************************************************************************
   
   assign AeqB = (A & B) | (!A & !B);
   assign CeqD = (C & D) | (!C & !D);
   
   assign L40 =  A & B & C & D ;
   assign L04 = !A & !B & !C & !D;
   
   assign L13 = (!AeqB & !C & !D) | (!CeqD & !A & !B);
   assign L31 = (!AeqB &  C &  D) | (!CeqD &  A &  B);
   assign L22 = (A & B & !C & !D) | (C & D & !A & !B) | ( !AeqB & !CeqD) ;
   
   // ******************************************************************************
   // Figure 5 - 5B/6B Encoder: disparity classifications
   // ******************************************************************************
     
   assign PD_1S6 = (E & D & !C & !B & !A) | (!E & !L22 & !L31) ;

   //assign PD_1S6 = (L13 & D & E) | (!E & !L22 & !L31) ;
   
   assign NDOS6  = PD_1S6 ;
   assign PDOS6  = K | (E & !L22 & !L13) ;
   assign ND_1S6 = K | (E & !L22 & !L13) | (!E & !D & C & B & A) ;
  
   // ******************************************************************************
   // Figure 5 - 3B/4B Encoder: disparity classifications
   // ******************************************************************************
    
   assign ND_1S4 = F & G ;
   assign NDOS4  = (!F & !G) ;
   assign PD_1S4 = (!F & !G) | (K & ((F & !G) | (!F & G)));
   assign PDOS4  = F & G & H ;
   
   // ******************************************************************************
   // Figure 6 - Encoder: control of complementation
   // ******************************************************************************

   // not K28.0->7 & K23/27/29/30.7
   assign illegalk = K & (A | B | !C | !D | !E) & (!F | !G | !H | !E | !L31); 

   assign DISPARITY6 = disparity ^ (NDOS6 | PDOS6) ;

   always @(posedge SBYTECLK, posedge reset)
     if(reset) begin
       COMPLS4 <= 0;
       COMPLS6 <= 0;
       end
     else begin
       COMPLS4 <= (PD_1S4 & !DISPARITY6) | (ND_1S4 & DISPARITY6);
       COMPLS6 <= (PD_1S6 & !disparity) | (ND_1S6 & disparity);
       end
 
   // ******************************************************************************
   // Figure 7 - 5B/6B encoding 
   // ******************************************************************************

   reg tNAO, tNBOx, tNBOy, tNCOx, tNCOy, tNDO , tNEOx, tNEOy, tNIOw, tNIOx, tNIOy, tNIOz;

   always @(posedge SBYTECLK, posedge reset)
     if(reset) begin
       tNAO  <= 0;
       tNBOx <= 0;
       tNBOy <= 0;
       tNCOx <= 0;
       tNCOy <= 0;
       tNDO  <= 0;
       tNEOx <= 0;
       tNEOy <= 0;
       tNIOw <= 0;
       tNIOx <= 0;
       tNIOy <= 0;
       tNIOz <= 0;
       end
     else begin
       tNAO  <= A ;

       tNBOx <= B & !L40;
       tNBOy <= L04 ;

       tNCOx <= L04 | C ;
       tNCOy <= E & D & !C & !B & !A ;

       tNDO  <= D & ! (A & B & C) ;

       tNEOx <= E | L13;
       tNEOy <= !(E & D & !C & !B & !A) ;

       tNIOw <= (L22 & !E) | (E & L40) ;
       tNIOx <= E & !D & !C & !(A & B) ;
       tNIOy <= K & E & D & C & !B & !A ;
       tNIOz <= E & !D & C & !B & !A ;
       end

   assign NAO = tNAO ;
   assign NBO = tNBOx | tNBOy ;
   assign NCO = tNCOx | tNCOy ;
   assign NDO = tNDO ;
   assign NEO = tNEOx & tNEOy ;
   assign NIO = tNIOw | tNIOx | tNIOy | tNIOz;
   
   // ******************************************************************************
   // Figure 8: 3B/4B encoding
   // ******************************************************************************

   reg alt7, tNFO, tNGO, tNHO, tNJO;

   always @(posedge SBYTECLK, posedge reset)
     if(reset) begin
       alt7 <= 0;
       tNFO <= 0;
       tNGO <= 0;
       tNHO <= 0;
       tNJO <= 0;
       end
     else begin
       alt7 <= F & G & H & (K | (disparity ? (!E & D & L31) : (E & !D & L13))) ;
       tNFO <= F;
       tNGO <= G | (!F & !G & !H) ;
       tNHO <= H ;
       tNJO <= !H & (G ^ F) ;
       end

   assign NFO = tNFO & !alt7 ;
   assign NGO = tNGO ;
   assign NHO = tNHO ;
   assign NJO = tNJO | alt7 ;

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_an.v"                               ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 37" Auto-Negotiation function,    ////
//// type 1000BASE-X"; see :                                      ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause 37.                      ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


`include "ge_1000baseX_constants.v"
`include "timescale.v"

module ge_1000baseX_an (
		  
   // --- clocks and reset ---
   input               ck, 
   input               reset,

   // --- Startup interface. ---
   input               startup_enable,
  
   // --- Auto-negotiation ctrl parameter ---
   output reg [2:0]    xmit,
   output reg [15:0]   tx_config,
   input      [15:0]   rx_config,
   input               rx_config_set,
   input               ability_match,
   input               acknowledge_match,
   input               consistency_match,
   input               idle_match,
		    
   // --- RX_UNITDATA.indicate messages from RX state machine ---
   input      [2:0]    rudi,
		    
       
   // --- Synchronisation Status ---
   input               sync_status,
   input               signal_detect,
		    
   // --- GMII Register 0 - AN Basic Control register ---
   input               mr_main_reset,
   input               mr_loopback,
   input               mr_restart_an,
   input               mr_an_enable,

   // --- GMII Register 1 - AN Basic Status register ---		    
   output reg          mr_an_complete,

   // --- GMII register 4 - AN Advertisement		    
   input [15:0]         mr_adv_ability,

   // --- GMII register 5 - AN Link Partner Ability
   output reg [15:0]	mr_lp_adv_ability,
	
   // --- GMII register 6 - AN Expansion
   output reg           mr_np_abl,
   output reg           mr_page_rx,    	   

   // --- GMII register 7 - AN Next Page
   input [15:0]         mr_np_tx,
		
   // --- GMII register 8 - AN Link Partner Next Page
   output reg [15:0]    mr_lp_np_rx	    
 );
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////

   reg 			mr_np_loaded;
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
   
`ifdef MODEL_TECH
  enum logic [3:0] {
`else
  localparam
`endif
		    S_PCS_AN_STARTUP_RUN          = 0,
		    S_PCS_AN_ENABLE               = 1,
		    S_PCS_AN_RESTART              = 2,
		    S_PCS_AN_DISABLE_LINK_OK      = 3,
		    S_PCS_AN_ABILITY_DETECT       = 4,
		    S_PCS_AN_ACKNOWLEDGE_DETECT   = 5,
		    S_PCS_AN_COMPLETE_ACKNOWLEDGE = 6,
		    S_PCS_AN_IDLE_DETECT          = 7,
		    S_PCS_AN_LINK_OK              = 8,
		    S_PCS_AN_NEXT_PAGE_WAIT       = 9
`ifdef MODEL_TECH
  } pcs_an_present, pcs_an_next;
`else
   ; reg [3:0] pcs_an_present, pcs_an_next;
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   // rx configuration
   //////////////////////////////////////////////////////////////////////////////
     
   wire rx_config_clr = ~rx_config_set;
   
   //////////////////////////////////////////////////////////////////////////////
   //  Link timer
   //////////////////////////////////////////////////////////////////////////////  
 
`ifdef MODEL_TECH
`define LINK_TIMER_DONE 1250
`else
`define LINK_TIMER_DONE 1250000
`endif
   
   reg [20:0] link_timer_cnt;
   reg 	      link_timer_m_start, link_timer_m_inc;
   wire       link_timer_done;

   always @(posedge ck, posedge reset)
    if (reset)
      begin
         link_timer_cnt <= 0;
      end
    else
      begin
	 if      (link_timer_m_start) link_timer_cnt <= 0;
	 else if (link_timer_m_inc) link_timer_cnt <= link_timer_cnt + 1;
      end

      assign link_timer_done = (link_timer_cnt >= `LINK_TIMER_DONE);
   
   //////////////////////////////////////////////////////////////////////////////
   // xmit -  set to tell TX state machine state of AN
   //////////////////////////////////////////////////////////////////////////////
   
   reg 	    xmit_CONFIGURATION_m_set, xmit_DATA_m_set, xmit_IDLE_m_set;
   
   always @(posedge ck, posedge reset)
     if (reset)
       xmit <= `XMIT_IDLE;
     else
       begin  
	  if      (~mr_an_enable & rudi != `RUDI_INVALID) xmit <= `XMIT_DATA;         
	  else if (xmit_CONFIGURATION_m_set)              xmit <= `XMIT_CONFIGURATION; 
	  else if (xmit_DATA_m_set)                       xmit <= `XMIT_DATA;
	  else if (xmit_IDLE_m_set)                       xmit <= `XMIT_IDLE;
       end

   //////////////////////////////////////////////////////////////////////////////
   //  mr_lp_adv_ability - variable to store Link partner capabilities
   //////////////////////////////////////////////////////////////////////////////
   
   reg 	    mr_lp_adv_ability_set, mr_lp_adv_ability_clr;
   
     always @(posedge ck, posedge reset)
       if (reset)
	 mr_lp_adv_ability <= 16'h0;
       else
	 begin
	    if      (mr_lp_adv_ability_set) mr_lp_adv_ability <= rx_config;
	    else if (mr_lp_adv_ability_clr) mr_lp_adv_ability <= 16'h00;
	 end
 
   //////////////////////////////////////////////////////////////////////////////
   //  mr_np_loaded - variable to indicate if the next page has been loaded
   //////////////////////////////////////////////////////////////////////////////   
 
   reg      mr_np_loaded_m_set, mr_np_loaded_m_clr;
  
    always @(posedge ck, posedge reset)
     if (reset)
       mr_np_loaded <= 0;
     else
       begin
	  if       (mr_np_loaded_m_set) mr_np_loaded <= 1;
	  else if  (mr_np_loaded_m_clr) mr_np_loaded <= 0;
       end
    
   //////////////////////////////////////////////////////////////////////////////
   // mr_page_rx_m_clr 
   //////////////////////////////////////////////////////////////////////////////  
 
   reg 	    mr_page_rx_m_set, mr_page_rx_m_clr; 	    
   
   always @(posedge ck, posedge reset)
    if (reset)
      mr_page_rx <= 0;
    else 
      begin
	 if       (mr_page_rx_m_set) mr_page_rx <= 1;
  	 else if  (mr_page_rx_m_clr) mr_page_rx <= 0;
      end
 
   //////////////////////////////////////////////////////////////////////////////
   //  mr_an_complete
   //////////////////////////////////////////////////////////////////////////////
 
   reg       mr_an_complete_m_set, mr_an_complete_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
	mr_an_complete <= 0;
     else
       begin
	  if      (mr_an_complete_m_set) mr_an_complete <= 1;
	  else if (mr_an_complete_m_clr) mr_an_complete <= 0;
       end
   
   //////////////////////////////////////////////////////////////////////////////
   // toggle_tx
   //////////////////////////////////////////////////////////////////////////////
   
   reg toggle_tx, toggle_tx_adv_m_set, toggle_tx_toggle_m_set;

   always @(posedge ck, posedge reset)
     if (reset)
       toggle_tx <= 0;
     else
       begin
	  if      (toggle_tx_adv_m_set)    toggle_tx <= mr_adv_ability[12];
	  else if (toggle_tx_toggle_m_set) toggle_tx <= ~toggle_tx;
       end
   
   //////////////////////////////////////////////////////////////////////////////
   // toggle_rx
   //////////////////////////////////////////////////////////////////////////////   
 
   reg toggle_rx, toggle_rx_m_set;
   
   always @(posedge ck, posedge reset)
     if (reset)
       toggle_rx <= 0;
     else
       begin
	  if (toggle_rx_m_set) toggle_rx <= rx_config[11];
       end
   
   //////////////////////////////////////////////////////////////////////////////
   // tx_config register ctrl
   //////////////////////////////////////////////////////////////////////////////  
   
   reg 	    tx_config_m_clr, tx_config_ABILITY_m_set, tx_config_ACK_m_set, tx_config_NP_m_set;

   always @(posedge ck, posedge reset)
     if (reset)
       tx_config <= 0;
     else
       begin
	  if      (tx_config_m_clr)         tx_config     <= 0;
	  else if (tx_config_ACK_m_set)     tx_config[14] <= 1;
	  else if (tx_config_ABILITY_m_set) tx_config     <= { mr_adv_ability[15],1'b0, mr_adv_ability[13:0]                          };
   	  else if (tx_config_NP_m_set)      tx_config     <= { mr_np_tx[15],      1'b0, mr_np_tx[13:12],     toggle_tx,mr_np_tx[10:0] };
       end

   //////////////////////////////////////////////////////////////////////////////
   // np_rx
   //////////////////////////////////////////////////////////////////////////////
  
   reg  np_rx, np_rx_m_set;
   
    always @(posedge ck, posedge reset)
      if (reset)
	np_rx <= 0;
      else
	begin
	   if (np_rx_m_set) np_rx <= rx_config[15];
	end 
   
   //////////////////////////////////////////////////////////////////////////////
   //  mr_lp_np_rx
   //////////////////////////////////////////////////////////////////////////////   
  
   reg  mr_lp_np_rx_m_set;
   
    always @(posedge ck, posedge reset)
      if (reset)
	mr_lp_np_rx <= 0;
      else
	begin
	   if (mr_lp_np_rx_m_set) mr_lp_np_rx <= rx_config[15];
	end 
   
   //////////////////////////////////////////////////////////////////////////////
   // np_page_rx
   //////////////////////////////////////////////////////////////////////////////
 
   reg        np_page_rx, np_page_rx_m_set;

   always @(posedge ck, posedge reset)
     if (reset)
       np_page_rx <= 0;
     else
       begin
	  if (np_page_rx_m_set) np_page_rx <= 1;
       end 
   
   //////////////////////////////////////////////////////////////////////////////
   // resolve_priority
   //////////////////////////////////////////////////////////////////////////////
  
   reg        resolve_priority, resolve_priority_m_set;
   
   always @(posedge ck, posedge reset)
     if (reset)
       resolve_priority <= 0;
     else
       begin
	  if (resolve_priority_m_set) resolve_priority <= 1;
       end 

   //////////////////////////////////////////////////////////////////////////////
   // autonegotiation state machine registered part
   //////////////////////////////////////////////////////////////////////////////    
   
   always @(posedge ck, posedge reset)
     
     pcs_an_present <= (reset) ? S_PCS_AN_STARTUP_RUN :  pcs_an_next;
   
   //////////////////////////////////////////////////////////////////////////////
   // autonegotiation state machine - IEEE 802.3-2008 Clause 36
   //////////////////////////////////////////////////////////////////////////////
  
   always @*
     begin
	pcs_an_next = pcs_an_present;

	xmit_CONFIGURATION_m_set = 0; xmit_DATA_m_set = 0; xmit_IDLE_m_set = 0;
	
	mr_np_loaded_m_set = 0; mr_np_loaded_m_clr = 0;
	
	mr_page_rx_m_set = 0;  mr_page_rx_m_clr = 0;
	
	mr_an_complete_m_set = 0;  mr_an_complete_m_clr = 0;
	
	mr_lp_adv_ability_set = 0;  mr_lp_adv_ability_clr = 0;
	
	tx_config_m_clr = 0; tx_config_ABILITY_m_set = 0;tx_config_ACK_m_set = 0;tx_config_NP_m_set = 0;
	
	link_timer_m_start = 0; link_timer_m_inc = 0;
	
	toggle_tx_adv_m_set = 0; toggle_tx_toggle_m_set = 0;
	
	toggle_rx_m_set = 0; mr_lp_np_rx_m_set = 0; np_rx_m_set = 0; np_page_rx_m_set = 0;
	
	resolve_priority_m_set = 0;
        
	case (pcs_an_present)

	  S_PCS_AN_STARTUP_RUN:
	    begin
	       pcs_an_next = startup_enable ? S_PCS_AN_ENABLE: S_PCS_AN_STARTUP_RUN;
	    end

	
	  S_PCS_AN_ENABLE:
	    begin
	       mr_page_rx_m_clr = 1;  mr_lp_adv_ability_clr = 1; mr_an_complete_m_clr = 1;
	       
	       if (mr_an_enable)  
		 begin
		    xmit_CONFIGURATION_m_set = 1; tx_config_m_clr = 1;  
		 end
	       else xmit_IDLE_m_set = 1;
	       
	       pcs_an_next = (mr_an_enable) ? S_PCS_AN_RESTART  : S_PCS_AN_DISABLE_LINK_OK; 
	    
	       link_timer_m_start = mr_an_enable;
	    end

	  S_PCS_AN_RESTART:
	    begin
	       mr_np_loaded_m_clr = 1; tx_config_m_clr = 1; xmit_CONFIGURATION_m_set = 1;
	       
	       pcs_an_next = (link_timer_done) ? S_PCS_AN_ABILITY_DETECT : S_PCS_AN_RESTART;
	       
	       link_timer_m_inc = ~link_timer_done;
	    end
	  
	  S_PCS_AN_DISABLE_LINK_OK:
	    begin
	       xmit_DATA_m_set = 1;
	       
               pcs_an_next = S_PCS_AN_DISABLE_LINK_OK;
             end

	  S_PCS_AN_ABILITY_DETECT:
	    begin
	       toggle_tx_adv_m_set = 1; tx_config_ABILITY_m_set = 1;

	       pcs_an_next = (ability_match & rx_config_set) ? S_PCS_AN_ACKNOWLEDGE_DETECT : S_PCS_AN_ABILITY_DETECT;

	       mr_lp_adv_ability_set = (ability_match & rx_config_set);

	    end

	  S_PCS_AN_ACKNOWLEDGE_DETECT:
	    begin
	       tx_config_ACK_m_set = 1;

	       pcs_an_next = (acknowledge_match & consistency_match)  ? S_PCS_AN_COMPLETE_ACKNOWLEDGE : 
			     (acknowledge_match & ~consistency_match) ? S_PCS_AN_ENABLE               :
			     (ability_match & rx_config_clr)          ? S_PCS_AN_ENABLE               : S_PCS_AN_ACKNOWLEDGE_DETECT;
	       
	       link_timer_m_start = (acknowledge_match & consistency_match);
	    end

	  S_PCS_AN_COMPLETE_ACKNOWLEDGE:
	    begin
	       toggle_tx_toggle_m_set = 1; toggle_rx_m_set = 1; np_rx_m_set = 1; mr_page_rx_m_set = 1;

	       if (ability_match & rx_config_clr)  pcs_an_next = S_PCS_AN_ENABLE;

	       else if (link_timer_done & (~ability_match | rx_config_set)) 
		 begin
		    link_timer_m_start = 1;  pcs_an_next = S_PCS_AN_IDLE_DETECT;
		 end
	       
	       else link_timer_m_inc = ~link_timer_done;
	    end

	  S_PCS_AN_IDLE_DETECT:
	    begin
	       xmit_IDLE_m_set = 1; resolve_priority_m_set = 1;
	       
	       pcs_an_next = (ability_match & rx_config_clr) ? S_PCS_AN_ENABLE : 
			     (idle_match & link_timer_done)  ? S_PCS_AN_LINK_OK : S_PCS_AN_IDLE_DETECT;
	       
	       link_timer_m_inc = ~link_timer_done;
	    end
	  
	  S_PCS_AN_LINK_OK:
	    begin
	       xmit_DATA_m_set = 1; mr_an_complete_m_set = 1; resolve_priority_m_set = 1;
	       
	       pcs_an_next = (ability_match | mr_restart_an) ? S_PCS_AN_ENABLE : S_PCS_AN_LINK_OK;	       
	    end
	endcase 
	     
	if      (~sync_status)          pcs_an_next = S_PCS_AN_ENABLE;
	else if (mr_main_reset)         pcs_an_next = S_PCS_AN_ENABLE;
        else if (mr_restart_an)   	pcs_an_next = S_PCS_AN_ENABLE;
        else if (rudi == `RUDI_INVALID) pcs_an_next = S_PCS_AN_ENABLE;
     end
     
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_constants.v"                        ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

// XMIT Autonegotiation parameter - ctrl for the PCS TX state machine   
`define XMIT_IDLE           0
`define XMIT_CONFIGURATION  1
`define XMIT_DATA           2
   
`define RUDI_INVALID 0
`define RUDI_IDLE    1
`define RUDI_CONF    2
   
// Special K code-groups - K codes
`define K28_0_symbol 8'h1c
`define K28_1_symbol 8'h3c
`define K28_2_symbol 8'h5c
`define K28_3_symbol 8'h7c
`define K28_4_symbol 8'h9c
`define K28_5_symbol 8'hbc
`define K28_6_symbol 8'hdc
`define K28_7_symbol 8'hfc
`define K23_7_symbol 8'hf7
`define K27_7_symbol 8'hfb
`define K29_7_symbol 8'hfd
`define K30_7_symbol 8'hfe

// Special D code-groups - D codes   
`define D21_5_symbol  8'hb5
`define D2_2_symbol   8'h42
`define D5_6_symbol   8'hc5
`define D16_2_symbol  8'h50
`define D0_0_symbol   8'h00

`define D21_2_symbol  8'h55
`define D21_6_symbol  8'hd5

`define D6_6_symbol   8'hc6
`define D10_1_symbol  8'h2a
`define D3_3_symbol   8'h63
`define D27_7_symbol  8'hfb
`define D3_0_symbol   8'h03

`define D30_2_symbol  8'h5e
`define D12_4_symbol  8'h8c
`define D8_6_symbol   8'hc8
`define D13_7_symbol  8'hed

// Code group ordered_sets
`define I_CODE  4'b0001
`define I1_CODE 4'b0010
`define I2_CODE 4'b0011
`define C_CODE  4'b0100
`define C1_CODE 4'b0101
`define C2_CODE 4'b0110
`define R_CODE  4'b0111
`define S_CODE  4'b1000
`define T_CODE  4'b1001
`define V_CODE  4'b1010

// -ve and +ve 10b symbols 
`define pK28_5_10b_symbol 10'b1100000101 // 0x305
`define nK28_5_10b_symbol 10'b0011111010 // 0x0fa

`define pD5_6_10b_symbol  10'b1010010110 // 0x296
`define nD5_6_10b_symbol  10'b1010010110 // 0x296
   
`define pD16_2_10b_symbol 10'b1001000101 // 0x245
`define nD16_2_10b_symbol 10'b0110110101 // 0x1b5

`define pD0_0_10b_symbol  10'b0110001011 // 0x18b
`define nD0_0_10b_symbol  10'b1001110100 // 0x274 

`define pK27_7_10b_symbol 10'b0010010111  // 0x097
`define nK27_7_10b_symbol 10'b1101101000  // 0x368


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_mdio.v"                             ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 22 "Reconcilliation Sublayer (RS) ////
//// Media Independent Interface (MII)"; see                      ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section2.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "ge_1000baseX_constants.v"

`include "timescale.v"

module ge_1000baseX_mdio #(
  parameter PHY_ADDR = 5'b00000		   
) (

   //  reset 
   input              reset, 
   //  clock 
   input              mdc,
			 
   input              mdio,
   output             mdio_out,
   output             mdio_oe,

   output     [4:0]   data_addr,    
   input     [15:0]   data_rd,
   output    [15:0]   data_wr,
   output reg         strobe_wr
   );

  
`ifdef MODEL_TECH
  enum logic [3:0] {
`else
  localparam
`endif
		    S_PREAMBLE  = 0,
		    S_ST        = 1,
		    S_OP_CODE   = 2,
		    S_PHY_ADDR  = 3,
		    S_REG_ADDR  = 4,
		    S_TA        = 5,
		    S_WR_DATA   = 6,
		    S_RD_DATA   = 7,
		    S_WR_COMMIT = 8
`ifdef MODEL_TECH
  } present, next;
`else
  ; reg [3:0] present, next;
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////   
   
   reg [5:0] preamble_cnt;
   
   assign preamble_match = (preamble_cnt == 31);
   
   always @(posedge mdc or posedge reset)
     if (reset)
       preamble_cnt = 0;
     else
       preamble_cnt <= (mdio & ~preamble_match) ? preamble_cnt + 1 : 
		       (mdio & preamble_match)  ? preamble_cnt : 0;
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
    
   reg pos_cnt_inc; reg [4:0] pos_cnt;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       pos_cnt <= 0;
     else 
	pos_cnt <= (pos_cnt_inc) ? pos_cnt + 1 : 0;
    
   assign op_code_done   = (pos_cnt == 1);
   assign phy_addr_done  = (pos_cnt == 6);
   assign reg_addr_done  = (pos_cnt == 11);
   assign ta0_done       = (pos_cnt == 12);
   assign ta1_done       = (pos_cnt == 13);
   assign data_done      = (pos_cnt == 29);
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
        
   reg st; reg st_latch;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       st <= 0;
     else
       if (st_latch) st <= mdio;

   assign st_match = ~st & mdio;
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////  
 
   reg [1:0] op_code; reg op_code_shift;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       op_code <= 0;
     else
       if (op_code_shift) op_code <= { op_code[0], mdio};
      
   assign op_is_rd = (op_code == 2'b10); assign op_is_wr = (op_code == 2'b01);

   assign op_is_invalid = ~op_is_rd & ~op_is_wr;
    
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////  
 
   reg [4:0] phy_addr; reg phy_addr_shift;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       phy_addr <= 0;
     else
       if (phy_addr_shift) phy_addr <= { phy_addr[3:0], mdio};

   assign phy_addr_match = (phy_addr == PHY_ADDR);
    
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////  
  
   reg [4:0] reg_addr; reg reg_addr_shift;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       reg_addr <= 0;
     else
       if (reg_addr_shift) reg_addr <= { reg_addr[3:0], mdio};

   assign data_addr = reg_addr;
     
   //////////////////////////////////////////////////////////////////////////////
   //
   ////////////////////////////////////////////////////////////////////////////// 
  
   reg [15:0] data_in; reg data_in_shift;
   
   always @(posedge mdc or posedge reset)
     if (reset) 
       data_in <= 0;
     else
       if (data_in_shift) data_in <= { data_in[14:0], mdio};

   assign data_wr = data_in;
      
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
 
   reg [15:0] data_out; reg data_out_load, data_out_shift;
   
   always @(posedge mdc or posedge reset)
     if (reset)
       data_out <= 0;
     else
       if      (data_out_load)  data_out <= data_rd;
       else if (data_out_shift) data_out <= { data_out[14:0], 1'b0 };
      
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////

   assign mdio_oe = (ta1_done & op_is_rd) | data_out_shift;
   
   assign mdio_out = (ta1_done & op_is_rd) ? 1'b1 : data_out[15];
  
   //////////////////////////////////////////////////////////////////////////////
   // mdio/mdc state machine registered part.
   //////////////////////////////////////////////////////////////////////////////
   
   always @(posedge mdc or posedge reset)

     present <= (reset) ? S_PREAMBLE : next;
      
   //////////////////////////////////////////////////////////////////////////////
   // IEEE Std 802.3-2008 Clause 22 "Reconcilliation Sublayer (RS) and
   // Media Independent Interface (MII)IEEE 802.3-2005 Clause 22 
   //////////////////////////////////////////////////////////////////////////////
  
   always @*
     begin	
	next = present;

	pos_cnt_inc = 0;  st_latch = 0; 
	
	op_code_shift = 0; phy_addr_shift = 0; reg_addr_shift = 0; 
	
	data_in_shift = 0; data_out_load = 0; data_out_shift = 0;

	strobe_wr = 0;
	
	case (present)
	  
	  S_PREAMBLE:
	    begin
	       next = (preamble_match & ~mdio) ? S_ST : S_PREAMBLE;
	    end

	  S_ST:
	    begin
	       next = (mdio) ? S_OP_CODE: S_PREAMBLE;
	    end
	  	  
	  S_OP_CODE:
	    begin
	       pos_cnt_inc = 1; op_code_shift = 1;
	       
	       next = (op_code_done) ? S_PHY_ADDR : S_OP_CODE;
	    end

	  S_PHY_ADDR:
	    begin
	       pos_cnt_inc = 1; phy_addr_shift = 1;
	       
	       next = (phy_addr_done) ? S_REG_ADDR : S_PHY_ADDR;
	    end

	  S_REG_ADDR:
	    begin
	       if (phy_addr_match) begin
		  
		  pos_cnt_inc = 1; reg_addr_shift = 1;
		  
		  next = (reg_addr_done) ? S_TA : S_REG_ADDR;
	       end
	       else  
		 next = S_PREAMBLE;  
	    end

	  S_TA:
	    begin
	       pos_cnt_inc = 1;
	      
	       if (ta1_done) begin
		  
		  data_out_load = op_is_rd;
		  
		  next = (op_is_rd) ? S_RD_DATA : 
			 (op_is_wr) ? S_WR_DATA : S_PREAMBLE;
	       end
	    end
	  
	  S_WR_DATA:
	    begin 
	       pos_cnt_inc = 1; data_in_shift = 1;
	       
	       next = (data_done) ? S_WR_COMMIT : S_WR_DATA;
	    end

	  S_RD_DATA:
	    begin
	       pos_cnt_inc = 1; data_out_shift = 1;
	       
	       next = (data_done) ? S_PREAMBLE : S_RD_DATA;
	    end


	  S_WR_COMMIT:
	    begin
	       strobe_wr = 1; next = S_PREAMBLE;
	    end
	endcase 	
     end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_regs.v"                             ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`define GMII_BASIC_CTRL   'd00
`define GMII_BASIC_STATUS 'd02
`define GMII_PHY_ID1      'd04
`define GMII_PHY_ID2      'd06
`define GMII_AN_ADV       'd08
`define GMII_AN_LP_ADV    'd10
`define GMII_AN_EXPANSION 'd12
`define GMII_AN_NP        'd14
`define GMII_AN_LP_NP     'd16
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_rx.v"                               ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"

`include "ge_1000baseX_regs.v"
`include "ge_1000baseX_constants.v"

module ge_1000baseX_rx(
		       
   // Receive clock and reset 
   input               ck,
   input               reset,
		      
   // Receive 8B bus from 8b10 decoder 
   input [7:0] 	       ebi_rxd,	  
 
   input               ebi_K,
   input               rx_even,
   input               carrier_detect,
		   
   // Receive sync status 
   input              sync_status, 
   input              signal_detect,

   // Frame receive pulse	
   output              rx_frame_pulse,
	   
   // Receive GMII bus 
   output reg  [7:0]   gmii_rxd,
   output reg          gmii_rx_dv,  
   output reg          gmii_rx_er,
  
   output reg          receiving,

   // Auto-negotiation ctrl 
   input      [2:0]    xmit,
   output reg [15:0]   rx_config,
   output reg          rx_config_set,		   
   input               mr_main_reset,
   output reg [2:0]    rudi,

   output reg          ability_match,
   output reg          acknowledge_match,
		   
   output              consistency_match,
   output              idle_match
);
   
   //////////////////////////////////////////////////////////////////////////////
   //  Diagnostics registers
   //////////////////////////////////////////////////////////////////////////////
   
`define RX_FRAME_CNT            16'h0000
`define RX_DATA_CNT             16'h0001         
`define EARLY_END_CNT           16'h0002          
`define CHECK_END_T_R_K28_5_CNT 16'h0003
`define CHECK_END_R_R_K28_5_CNT 16'h0004
`define CHECK_END_T_R_R_CNT     16'h0005    
`define CHECK_END_R_R_R_CNT     16'h0006     
`define CHECK_END_R_R_S_CNT     16'h0007
`define RESET                   16'hffff 
   
   reg [7:0] 	       ge_x_pcs_rx_stats_inc;

   reg [15:0] 	       rx_frame_cnt;
   reg [15:0] 	       rx_data_cnt;
   reg [15:0] 	       early_end_cnt;
   reg [15:0] 	       check_end_T_R_K28_5_cnt;
   reg [15:0] 	       check_end_R_R_K28_5_cnt;
   reg [15:0] 	       check_end_T_R_R_cnt;
   reg [15:0] 	       check_end_R_R_R_cnt;
   reg [15:0] 	       check_end_R_R_S_cnt;
   
   always @(posedge ck, posedge reset)
     
     if (reset) 
       begin
	  rx_frame_cnt            <= 0; rx_data_cnt             <= 0;
	  early_end_cnt           <= 0; check_end_T_R_K28_5_cnt <= 0;
	  check_end_R_R_K28_5_cnt <= 0; check_end_T_R_R_cnt     <= 0;
	  check_end_R_R_R_cnt     <= 0; check_end_R_R_S_cnt     <= 0;
       end 
     else
       begin
	  if      (ge_x_pcs_rx_stats_inc[0]) rx_frame_cnt            <= rx_frame_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[1]) rx_data_cnt             <= rx_data_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[2]) early_end_cnt           <= early_end_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[3]) check_end_T_R_K28_5_cnt <= check_end_T_R_K28_5_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[4]) check_end_R_R_K28_5_cnt <= check_end_R_R_K28_5_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[5]) check_end_T_R_R_cnt     <= check_end_T_R_R_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[6]) check_end_R_R_R_cnt     <= check_end_R_R_R_cnt + 1;
	  else if (ge_x_pcs_rx_stats_inc[7]) check_end_R_R_S_cnt     <= check_end_R_R_S_cnt + 1;
       end

   //////////////////////////////////////////////////////////////////////////////
   //
   ////////////////////////////////////////////////////////////////////////////// 
   
   assign 	     rx_frame_pulse = ge_x_pcs_rx_stats_inc[0];
   
   //////////////////////////////////////////////////////////////////////////////
   // Soft reset
   //////////////////////////////////////////////////////////////////////////////  

   reg 		     soft_reset;
   
   always @(posedge ck, posedge reset)
     if (reset)
       soft_reset <= 0;
     else
       soft_reset <= mr_main_reset;

   //////////////////////////////////////////////////////////////////////////////
   // When Decoding EPDs (End_Of_Packet Delimiter) the RX state machine needs
   // to compare the current code-group to the two code-groups that follow it.
   //////////////////////////////////////////////////////////////////////////////   
  
   reg [7:0] 	       ebi_rxd_d1;
   reg [7:0] 	       ebi_rxd_d2;
   reg [7:0] 	       ebi_rxd_d3;
   
   reg 		       ebi_K_d1,          ebi_K_d2,          ebi_K_d3;  
   reg 		       rx_even_d1,        rx_even_d2,        rx_even_d3;
   reg 		       sync_status_d1,    sync_status_d2,    sync_status_d3; 		       
   reg 		       carrier_detect_d1, carrier_detect_d2, carrier_detect_d3;

   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  ebi_K_d1          <= 0; ebi_K_d2          <= 0; ebi_K_d3          <= 0; 
	  rx_even_d1        <= 0; rx_even_d2        <= 0; rx_even_d3        <= 0;
	  ebi_rxd_d1        <= 0; ebi_rxd_d2        <= 0; ebi_rxd_d3        <= 0;
	  sync_status_d1    <= 0; sync_status_d2    <= 0; sync_status_d3    <= 0;
	  carrier_detect_d1 <= 0; carrier_detect_d2 <= 0; carrier_detect_d3 <= 0;
       end
     else
       begin 	  
	  ebi_K_d3          <= ebi_K_d2;           ebi_K_d2          <= ebi_K_d1;          ebi_K_d1          <= ebi_K; 
	  rx_even_d3        <= rx_even_d2;         rx_even_d2        <= rx_even_d1;        rx_even_d1        <= rx_even;
	  ebi_rxd_d3        <= ebi_rxd_d2;         ebi_rxd_d2        <= ebi_rxd_d1;        ebi_rxd_d1        <= ebi_rxd;
	  sync_status_d3    <= sync_status_d2;     sync_status_d2    <= sync_status_d1;    sync_status_d1    <= sync_status;
	  carrier_detect_d3 <= carrier_detect_d2;  carrier_detect_d2 <= carrier_detect_d1; carrier_detect_d1 <= carrier_detect;
       end
   

`ifdef MODEL_TECH
   wire [4:0] ebi_rxd_d1_X;  wire [2:0] ebi_rxd_d1_Y;
   wire [4:0] ebi_rxd_d2_X;  wire [2:0] ebi_rxd_d2_Y;
   wire [4:0] ebi_rxd_d3_X;  wire [2:0] ebi_rxd_d3_Y;

   assign {ebi_rxd_d1_Y, ebi_rxd_d1_X} = ebi_rxd_d1;
   assign {ebi_rxd_d2_Y, ebi_rxd_d2_X} = ebi_rxd_d2;
   assign {ebi_rxd_d3_Y, ebi_rxd_d3_X} = ebi_rxd_d3;
`endif    
   
   //////////////////////////////////////////////////////////////////////////////
   // Decode EARLY_END EPD code sequence
   //////////////////////////////////////////////////////////////////////////////   
  
   wire       early_end_idle;
   
   // Received code-group sequence K28.5/D/K28.5  
   assign     early_end_idle =  (ebi_K_d2  & ebi_rxd_d2 == `K28_5_symbol) & 
			       ~(ebi_K_d1) & 
			        (ebi_K     & ebi_rxd    == `K28_5_symbol);

   wire       early_end_config;
   
   // Received code-group sequence K28.5/(D21.5 | D2.2)/D0.0
   assign     early_end_config  = (( ebi_K_d2 &  ebi_rxd_d2  == `K28_5_symbol) & 
				   (~ebi_K_d1 & (ebi_rxd_d1  == `D21_5_symbol | ebi_rxd_d1 == `D2_2_symbol)) & 
				   (~ebi_K    &  ebi_rxd     == `D0_0_symbol));
   
   // EARLY_END state in 802.3-2008 Clause 36 Figure 36-7b
   reg 	      early_end;

   always @(posedge ck, posedge reset)
     if (reset)
       early_end <= 0;
     else
       early_end <= (early_end_idle | early_end_config) & rx_even;
   
   //////////////////////////////////////////////////////////////////////////////
   //  Decode /T/R/K28_5/ EPD code sequence
   //////////////////////////////////////////////////////////////////////////////   
 
   reg 	      check_end_T_R_K28_5;

   always @(posedge ck, posedge reset)
     if (reset)
       check_end_T_R_K28_5 <= 0;
     else 
       check_end_T_R_K28_5 <= ((ebi_K_d2 & ebi_rxd_d2  == `K29_7_symbol)  &
			       (ebi_K_d1 & ebi_rxd_d1  == `K23_7_symbol)  &
			       (ebi_K    & ebi_rxd     == `K28_5_symbol)  & rx_even);
   
   //////////////////////////////////////////////////////////////////////////////
   // Decode /T/R/R/ EPD code sequence
   //////////////////////////////////////////////////////////////////////////////  
  
   reg 	      check_end_T_R_R;
   
   always @(posedge ck, posedge reset)
     if (reset)
       check_end_T_R_R <= 0;
     else 
       check_end_T_R_R <= ((ebi_K_d2 & ebi_rxd_d2  == `K29_7_symbol) &
			   (ebi_K_d1 & ebi_rxd_d1  == `K23_7_symbol)  &
			   (ebi_K    & ebi_rxd     == `K23_7_symbol));
   
   //////////////////////////////////////////////////////////////////////////////
   // Decode /R/R/R EPD code sequence
   //////////////////////////////////////////////////////////////////////////////
   
   reg 	      check_end_R_R_R;
   
   always @(posedge ck, posedge reset)
     if (reset)
       check_end_R_R_R <= 0;
     else
       check_end_R_R_R <= ((ebi_K_d2 & ebi_rxd_d2 == `K23_7_symbol) &
			   (ebi_K_d1 & ebi_rxd_d1 == `K23_7_symbol) &
			   (ebi_K    & ebi_rxd    == `K23_7_symbol));
   
   //////////////////////////////////////////////////////////////////////////////
   // Decode /R/R/28_5 EPD code sequence
   //////////////////////////////////////////////////////////////////////////////
   
   reg 	      check_end_R_R_K28_5;
   
   always @(posedge ck, posedge reset)
     if (reset)
       check_end_R_R_K28_5 <= 0;
     else  
       check_end_R_R_K28_5 <= ((ebi_K_d2 & ebi_rxd_d2 == `K23_7_symbol) &
			       (ebi_K_d1 & ebi_rxd_d1 == `K23_7_symbol) &
			       (ebi_K    & ebi_rxd    == `K28_5_symbol) & rx_even);
   
   //////////////////////////////////////////////////////////////////////////////
   // Decode /R/R/S EPD code sequence
   ////////////////////////////////////////////////////////////////////////////// 
   
   reg   check_end_R_R_S;
   
   always @(posedge ck, posedge reset)
     if (reset)
       check_end_R_R_S <= 0;
     else
       check_end_R_R_S <= ((ebi_K_d2 & ebi_rxd_d2 == `K23_7_symbol) &
			   (ebi_K_d1 & ebi_rxd_d1 == `K23_7_symbol) &
			   (ebi_K & ebi_rxd == `K27_7_symbol));
   
   //////////////////////////////////////////////////////////////////////////////
   //  Dx.y and Kx.y symbol decoding 
   ////////////////////////////////////////////////////////////////////////////// 
   
   reg 	 K28_5_match, D2_2_match, D21_5_match, D5_6_match, D16_2_match;
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  K28_5_match <= 0;
	  D2_2_match  <= 0;
	  D21_5_match <= 0;
	  D5_6_match  <= 0;
	  D16_2_match <= 0;
       end
     else begin
	K28_5_match <= (ebi_K_d2 &  ebi_rxd_d2 == `K28_5_symbol);
	D2_2_match  <= ~ebi_K_d2 & (ebi_rxd_d2 == `D2_2_symbol);
	D21_5_match <= ~ebi_K_d2 & (ebi_rxd_d2 == `D21_5_symbol);
	D5_6_match  <= ~ebi_K_d2 & (ebi_rxd_d2 == `D5_6_symbol);
	D16_2_match <= ~ebi_K_d2 & (ebi_rxd_d2 == `D16_2_symbol);
     end
  
   //////////////////////////////////////////////////////////////////////////////
   // Start of packet (/S/), End of Packet (/T/) and Carrier Extend 
   // (/R/) symbol matching
   //////////////////////////////////////////////////////////////////////////////    
   
   reg     CE_match, SPD_match, EPD_match;
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
         CE_match   <= 0;
         SPD_match  <= 0;
         EPD_match  <= 0;
       end
     else
       begin
         CE_match   <= ebi_K_d2 & (ebi_rxd_d2 == `K23_7_symbol);
         SPD_match  <= ebi_K_d2 & (ebi_rxd_d2 == `K27_7_symbol);
         EPD_match  <= ebi_K_d2 & (ebi_rxd_d2 == `K29_7_symbol);
       end

   //////////////////////////////////////////////////////////////////////////////
   //
   ////////////////////////////////////////////////////////////////////////////// 
 
`ifdef MODEL_TECH
   
   wire [4:0] ebi_rxd_X;  wire [2:0] ebi_rxd_Y;
   
   assign     ebi_rxd_X = ebi_rxd[4:0];
   assign     ebi_rxd_Y = ebi_rxd[7:5];
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   // rx_Config_reg
   //////////////////////////////////////////////////////////////////////////////  
 
   reg [15:0] rx_config_d1; reg [15:0] rx_config_d2;  reg [7:0] rx_config_lo;  
   
   reg 	      rx_config_lo_read, rx_config_hi_read;
   
   wire [15:0] rx_config_tmp = { ebi_rxd_d3, rx_config_lo };
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  rx_config <= 0; rx_config_set <= 0; rx_config_lo <= 0; rx_config_d1 <= 0; rx_config_d2 <= 0;
       end
     else
       begin
	  if (rx_config_lo_read) 
	    begin 
	       rx_config_d2  <= rx_config_d1; 
	       rx_config_d1  <= rx_config;
	       rx_config_lo  <= ebi_rxd_d3;
	    end
	  else if (rx_config_hi_read) begin
	     
	     rx_config  <= rx_config_tmp;
	     
	     rx_config_set <= |rx_config_tmp;
	  end
       end

   //////////////////////////////////////////////////////////////////////////////
   // rx_config_cnt
   ////////////////////////////////////////////////////////////////////////////// 
   
   reg [2:0] rx_config_cnt;
   reg 	     rx_config_cnt_m_inc, rx_config_cnt_m_rst;

   always @(posedge ck, posedge reset)
     if (reset)
       rx_config_cnt <= 0;
     else
       begin
   	  if      (rx_config_cnt_m_inc) rx_config_cnt <= rx_config_cnt + 1;
   	  else if (rx_config_cnt_m_rst) rx_config_cnt <= 0;
       end

   wire rx_config_cnt_done;

   assign rx_config_cnt_done = (rx_config_cnt == 3);
   
   //////////////////////////////////////////////////////////////////////////////
   // receive ability matching
   //////////////////////////////////////////////////////////////////////////////    
   
   wire [6:0] ability; wire [6:0] ability_d1; wire [6:0] ability_d2;
   
   assign      ability    = { rx_config[15],    rx_config[13:12],    rx_config[8:5]   };  
   assign      ability_d1 = { rx_config_d1[15], rx_config_d1[13:12], rx_config_d1[8:5]}; 
   assign      ability_d2 = { rx_config_d2[15], rx_config_d2[13:12], rx_config_d2[8:5]};     

   assign ability_matched1 = ~| (ability ^ ability_d1);
   assign ability_matched2 = ~| (ability ^ ability_d2);
   
   assign ability_matched = rx_config_cnt_done & ability_matched1 & ability_matched2;
   
     reg [6:0] ability_matched_reg;

   always @(posedge ck, posedge reset)
     if (reset)
       ability_matched_reg <= 0;
     else begin

	ability_match <= ability_matched;
	
	if (ability_matched) ability_matched_reg <= ability;
     end
 
   //////////////////////////////////////////////////////////////////////////////
   // receive config matching
   //////////////////////////////////////////////////////////////////////////////   
   
   assign rx_config_match1 = ability_matched1 & ~(rx_config[14] ^ rx_config_d1[14]);
   assign rx_config_match2 = ability_matched2 & ~(rx_config[14] ^ rx_config_d2[14]);
   
   assign  rx_config_match = rx_config_match1 & rx_config_match2;
   
   //////////////////////////////////////////////////////////////////////////////
   // receive acknowledge matching
   //////////////////////////////////////////////////////////////////////////////    
  
   always @(posedge ck, posedge reset)
     
     acknowledge_match <= (reset) ? 0 : ( rx_config_match & rx_config_d2[14] );

   //////////////////////////////////////////////////////////////////////////////
   // receive consistency matching
   ////////////////////////////////////////////////////////////////////////////// 

   assign        consistency_match = ability_match & ~|(ability_matched_reg ^ ability);
 
   //////////////////////////////////////////////////////////////////////////////
   // receive idle counter/matching
   ////////////////////////////////////////////////////////////////////////////// 
   
   reg [1:0]   idle_cnt;
   
   reg 	       idle_cnt_m_inc, idle_cnt_m_clr;
   
   always @(posedge ck, posedge reset)

      if (reset)
	   idle_cnt <= 0;
      else
	begin
	   if      (idle_cnt_m_clr) idle_cnt <= 0;
	   else if (idle_cnt_m_inc) idle_cnt <= idle_cnt + 1;
	end

   assign idle_match = (idle_cnt == 3);
   
   //////////////////////////////////////////////////////////////////////////////
   // RX_UNITDATA.indicate - Signal from PCS RX -> PCS AutoNeg process
   ////////////////////////////////////////////////////////////////////////////// 
  
   reg 	  rudi_INVALID_m_set; reg  rudi_IDLE_m_set; reg rudi_CONF_m_set;
   
   always @(posedge ck, posedge reset)
     if (reset)
       rudi <= `RUDI_INVALID;
     else
       begin
	  if      (rudi_INVALID_m_set)  rudi <= `RUDI_INVALID; 
	  else if (rudi_IDLE_m_set)     rudi <= `RUDI_IDLE;
	  else if (rudi_CONF_m_set)     rudi <= `RUDI_CONF;
       end

   //////////////////////////////////////////////////////////////////////////////
   // GMII output 
   ////////////////////////////////////////////////////////////////////////////// 
 
   reg gmii_rxd_false_carrier_m_set, gmii_rxd_preamble_m_set, gmii_rxd_ext_err_m_set;
   
   reg gmii_rxd_packet_burst_m_set, gmii_rxd_trr_extend_m_set, gmii_rxd_m_set;
   
   always @(posedge ck, posedge reset)
     
     if (reset)
       gmii_rxd <= 0;
     else
       begin
	  gmii_rxd <= (gmii_rxd_m_set)               ? ebi_rxd_d3  :
		      (gmii_rxd_false_carrier_m_set) ? 8'b00001110 :
		      (gmii_rxd_preamble_m_set)      ? 8'b01010101 :
		      (gmii_rxd_ext_err_m_set)       ? 8'b00011111 :
		      (gmii_rxd_trr_extend_m_set)    ? 8'b00001111 :
		      (gmii_rxd_packet_burst_m_set)  ? 8'b00001111 : 0;
       end 

   //////////////////////////////////////////////////////////////////////////////
   // Current receive state
   ////////////////////////////////////////////////////////////////////////////// 
  
   reg 	receiving_m_set, receiving_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
       receiving <= 0;
     else
       begin
	  if      (receiving_m_set) receiving <= 1;
	  else if (receiving_m_clr) receiving <= 0;
       end
     	 

`ifdef MODEL_TECH
  enum logic [4:0] {
`else
  localparam
`endif
		    S_PCS_RX_START            = 0,
		    S_PCS_RX_LINK_FAILED      = 1,
		    S_PCS_RX_WAIT_K           = 2,
		    S_PCS_RX_K                = 3,
		    S_PCS_RX_CONFIG_CB        = 4,
		    S_PCS_RX_CONFIG_CC        = 5,
		    S_PCS_RX_CONFIG_CD        = 6,
		    S_PCS_RX_INVALID          = 7,
		    S_PCS_RX_IDLE_D           = 8,
		    S_PCS_RX_FALSE_CARRIER    = 9,
		    S_PCS_RX_START_OF_PACKET  = 10,
		    S_PCS_RX_RECEIVE          = 11,
		    S_PCS_RX_EARLY_END        = 12,
		    S_PCS_RX_TRI_RRI          = 13,
		    S_PCS_RX_TRR_EXTEND       = 14,
		    S_PCS_RX_EPD2_CHECK_END   = 15,
		    S_PCS_RX_PACKET_BURST_RRS = 16,
		    S_PCS_RX_EXTEND_ERR       = 17,
		    S_PCS_RX_EARLY_END_EXT    = 18,
		    S_PCS_RX_DATA_ERROR       = 19,
		    S_PCS_RX_DATA             = 20
`ifdef MODEL_TECH
  } pcs_rx_present, pcs_rx_next;
`else
   ; reg [4:0] pcs_rx_present, pcs_rx_next;
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   // gmii_rx_er ctrl
   //////////////////////////////////////////////////////////////////////////////

   reg gmii_rx_er_m_set, gmii_rx_er_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
       gmii_rx_er <= 0;
     else
       begin
	  if      (gmii_rx_er_m_set) gmii_rx_er <= 1;
	  else if (gmii_rx_er_m_clr) gmii_rx_er <= 0;
       end
   
   //////////////////////////////////////////////////////////////////////////////
   // gmii_rx_dv ctrl
   ////////////////////////////////////////////////////////////////////////////// 
   
   reg gmii_rx_dv_m_set, gmii_rx_dv_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
       gmii_rx_dv <= 0;
     else
       begin
	  if      (gmii_rx_dv_m_set) gmii_rx_dv <= 1;
	  else if (gmii_rx_dv_m_clr) gmii_rx_dv <= 0;
       end   

   //////////////////////////////////////////////////////////////////////////////
   // 
   ////////////////////////////////////////////////////////////////////////////// 
   
   wire  xmit_DATA, xmit_nDATA, xmit_DATA_CD, xmit_DATA_nCD;
   
   assign xmit_DATA = (xmit == `XMIT_DATA);
   
   assign xmit_nDATA = (xmit != `XMIT_DATA);
   
   assign xmit_DATA_CD = (xmit_DATA & carrier_detect_d3);
   
   assign xmit_DATA_nCD = (xmit_DATA & ~carrier_detect_d3);
 
   wire   xmit_DATA_CD_SPD, xmit_DATA_CD_nSPD, xmit_DATA_CD_nSPD_nK28_5;
   
   assign xmit_DATA_CD_SPD = xmit_DATA_CD & SPD_match;
   
   assign xmit_DATA_CD_nSPD = xmit_DATA_CD & ~SPD_match;
   
   assign xmit_DATA_CD_nSPD_nK28_5 = xmit_DATA_CD_nSPD & ~K28_5_match;


   //////////////////////////////////////////////////////////////////////////////
   // receive state machine registered part.
   //////////////////////////////////////////////////////////////////////////////    
     
   always @(posedge ck, posedge reset)
     
     pcs_rx_present <= (reset) ? S_PCS_RX_START :  pcs_rx_next;
    
   //////////////////////////////////////////////////////////////////////////////
   // receive state machine - IEEE 802.3-2008 Clause 36  Figure 36-7a, 36-7b
   ////////////////////////////////////////////////////////////////////////////// 

   always @*
     begin	
	pcs_rx_next = pcs_rx_present;

	rx_config_lo_read = 0; rx_config_hi_read = 0;
 	
	receiving_m_set = 0; receiving_m_clr = 0;
		
	gmii_rxd_false_carrier_m_set = 0; gmii_rxd_preamble_m_set = 0; gmii_rxd_ext_err_m_set = 0; 
	
	gmii_rxd_packet_burst_m_set = 0; gmii_rxd_trr_extend_m_set = 0; gmii_rxd_m_set = 0;
	
	idle_cnt_m_clr = 0; idle_cnt_m_inc = 0;
	
	gmii_rx_er_m_set = 0; gmii_rx_er_m_clr = 0;
	
	gmii_rx_dv_m_set = 0; gmii_rx_dv_m_clr = 0;
	
	rudi_INVALID_m_set = 0; rudi_IDLE_m_set = 0; rudi_CONF_m_set = 0;

	rx_config_cnt_m_inc = 0; rx_config_cnt_m_rst = 0;

	ge_x_pcs_rx_stats_inc = 16'h0000;
		
	case (pcs_rx_present)

	  S_PCS_RX_START:
	    begin
	       pcs_rx_next = S_PCS_RX_LINK_FAILED; 
	    end
	  
	  S_PCS_RX_LINK_FAILED:
	    begin
	       rudi_INVALID_m_set = (xmit_nDATA);
	       
	       if (receiving) begin receiving_m_clr = 1;  gmii_rx_er_m_set = 1; end
	       else           begin gmii_rx_dv_m_clr = 1; gmii_rx_er_m_clr = 1; end
	       
	       pcs_rx_next = S_PCS_RX_WAIT_K;
	    end
	  
	  S_PCS_RX_WAIT_K:
	    begin
	       rx_config_cnt_m_rst = 1;
	       
	       receiving_m_clr = 1; gmii_rx_dv_m_clr = 1; gmii_rx_er_m_clr = 1;

	       pcs_rx_next = (K28_5_match & rx_even_d3) ? S_PCS_RX_K : S_PCS_RX_WAIT_K;
	    end


	  S_PCS_RX_K:
	    begin
	       receiving_m_clr = 1; gmii_rx_dv_m_clr = 1; gmii_rx_er_m_clr = 1;

	       rudi_IDLE_m_set = (xmit_nDATA & ~ebi_K_d3 & ~D21_5_match & ~D2_2_match) |
				 (xmit_DATA & ~D21_5_match & ~D2_2_match);
              	       
	       pcs_rx_next = (D21_5_match | D2_2_match)                              ? S_PCS_RX_CONFIG_CB   :	 
			     ((xmit_nDATA) & ~ebi_K_d3 & ~D21_5_match & ~D2_2_match) ? S_PCS_RX_IDLE_D      :
			     ((xmit_DATA) & ~D21_5_match & ~D2_2_match)              ? S_PCS_RX_IDLE_D      :
                             ((xmit_nDATA) & ebi_K_d3)                               ? S_PCS_RX_INVALID     : S_PCS_RX_INVALID;
	    end
	  
	  S_PCS_RX_CONFIG_CB:
	    begin
	       // Keep a count of the number of consecutive /C/ streams 
	       rx_config_cnt_m_inc = ~rx_config_cnt_done;
	       
	       rx_config_lo_read = ~ebi_K_d3; 
	       
	       receiving_m_clr = 1; gmii_rx_dv_m_clr = 1; gmii_rx_er_m_clr = 1;
	       
	       pcs_rx_next = (ebi_K_d3) ? S_PCS_RX_INVALID : S_PCS_RX_CONFIG_CC;	     
	    end

	  
	  S_PCS_RX_CONFIG_CC:
	    begin
	       rx_config_hi_read = ~ebi_K_d3;  idle_cnt_m_clr = 1;
	       
	       // Signal from RX -> ANEG indicating /C/ ordered set received
	       rudi_CONF_m_set = ~ebi_K_d3; 

	       pcs_rx_next = (ebi_K_d3) ? S_PCS_RX_INVALID : S_PCS_RX_CONFIG_CD;
	    end

	  S_PCS_RX_CONFIG_CD:
	    begin
	       pcs_rx_next = (K28_5_match & rx_even_d3) ? S_PCS_RX_K : S_PCS_RX_INVALID;
	    end
	  
	  
	  S_PCS_RX_INVALID:
	    begin
	       // Signal from RX -> ANEG indicating INVALID
	       rudi_INVALID_m_set = (xmit == `XMIT_CONFIGURATION);
	       
	       receiving_m_set = (xmit_DATA);
	       
	       pcs_rx_next = (K28_5_match & rx_even_d3)  ? S_PCS_RX_K       :
			     (~K28_5_match & rx_even_d3) ? S_PCS_RX_WAIT_K  : S_PCS_RX_INVALID;
	    end

	  
	  S_PCS_RX_IDLE_D:
	    begin
	       // Must be receiving a IDLE so reset config cnt and idle_matcher logic
	       rx_config_cnt_m_rst = 1;  idle_cnt_m_inc = ~idle_match; 

	       // Signal from RX -> ANEG indicating /I/ ordered set received
	       rudi_IDLE_m_set = 1;
	       
	       // Generate rx_dv only if we've detected a START_OF_PACKET
	       if (xmit_DATA_CD_SPD)         gmii_rx_dv_m_set = 1; else gmii_rx_dv_m_clr = 1;

	       // Generate rx_er if we've detected a FALSE_CARRIER
	       if (xmit_DATA_CD_nSPD_nK28_5) gmii_rx_er_m_set = 1; else gmii_rx_er_m_clr = 1;
	       
	       if (xmit_DATA_CD) 
		 begin
		    if (~K28_5_match) 
		      begin 
			 receiving_m_set = 1;
			 if (SPD_match) gmii_rxd_preamble_m_set = 1; else gmii_rxd_false_carrier_m_set = 1;
		      end
		 end
	       else receiving_m_clr = 1; 

	       pcs_rx_next = (~K28_5_match & ~xmit_DATA    )  ? S_PCS_RX_INVALID       :
			     ( xmit_DATA_CD_SPD            )  ? S_PCS_RX_RECEIVE       : 
			     ( xmit_DATA_nCD | K28_5_match )  ? S_PCS_RX_K             :
			     ( xmit_DATA_CD_nSPD           )  ? S_PCS_RX_FALSE_CARRIER :  S_PCS_RX_IDLE_D;

	       ge_x_pcs_rx_stats_inc[0] = xmit_DATA_CD_SPD;
    
	    end 
	  
	  
	  S_PCS_RX_FALSE_CARRIER:
	    begin
	       gmii_rx_er_m_set = 1; gmii_rxd_false_carrier_m_set = 1;
	       
	       pcs_rx_next = (K28_5_match & rx_even_d3) ? S_PCS_RX_K : S_PCS_RX_FALSE_CARRIER;
	    end

	  //----------------------------------------------------------------------------
	  // IEEE 802.3-2008 Clause 36  Figure 36-7b

	  S_PCS_RX_START_OF_PACKET:
	    begin
	       gmii_rx_dv_m_set = 1; gmii_rx_er_m_clr = 1; gmii_rxd_preamble_m_set = 1;
	       
	       pcs_rx_next = S_PCS_RX_RECEIVE;
	    end
	  
	  S_PCS_RX_RECEIVE:
	    begin
	       
	       if (early_end)  // EARLY_END
		 begin
		    ge_x_pcs_rx_stats_inc[2] = 1;
		    
		    gmii_rx_er_m_set = 1; pcs_rx_next = S_PCS_RX_EARLY_END;
		 end

	       else if (check_end_T_R_K28_5) // TRI+RRI
		 begin
		    
		    ge_x_pcs_rx_stats_inc[3] = 1;
		    
		    receiving_m_clr = 1; gmii_rx_dv_m_clr  = 1;  gmii_rx_er_m_clr = 1;
		    
		    pcs_rx_next = S_PCS_RX_TRI_RRI;  
		 end

	       else if (check_end_T_R_R) // TRR+EXTEND
		 begin
		    
		    ge_x_pcs_rx_stats_inc[5] = 1;
   	    
		    gmii_rx_dv_m_clr  = 1;  gmii_rx_er_m_set = 1; gmii_rxd_trr_extend_m_set = 1;
		    
		    pcs_rx_next = S_PCS_RX_EPD2_CHECK_END; 
		 end
	       
	       else if (check_end_R_R_R) // EARLY_END_EXT
		 begin
		    
		    ge_x_pcs_rx_stats_inc[6] = 1;
		    
		    gmii_rx_er_m_set = 1;  pcs_rx_next = S_PCS_RX_EPD2_CHECK_END; 
		 end
	       
	       else if (~ebi_K_d3) // RX_DATA
		 begin
		    ge_x_pcs_rx_stats_inc[1] = 1;
		    
		    gmii_rx_er_m_clr = 1; gmii_rxd_m_set = 1;
		 end
	       
	       else  // RX_DATA_ERROR
		 gmii_rx_er_m_set = 1;
	    end

	  
	  S_PCS_RX_EARLY_END:
	    begin
	       pcs_rx_next =  (D21_5_match | D2_2_match) ? S_PCS_RX_CONFIG_CB : S_PCS_RX_IDLE_D;
	    end
	  
	  S_PCS_RX_TRI_RRI:
	    begin
	       pcs_rx_next = (K28_5_match) ? S_PCS_RX_K : S_PCS_RX_TRI_RRI;         
	    end
	    
	  S_PCS_RX_TRR_EXTEND:
	    begin
	       gmii_rx_dv_m_clr = 1; gmii_rx_er_m_set = 1; gmii_rxd_trr_extend_m_set = 1;
	       
	       pcs_rx_next = S_PCS_RX_EPD2_CHECK_END; 
	    end

	  
	  S_PCS_RX_EPD2_CHECK_END:
	    begin

	       if (check_end_R_R_R)
		 begin
		     
		    gmii_rx_dv_m_clr  = 1;  gmii_rx_er_m_set = 1; gmii_rxd_trr_extend_m_set = 1;
		 end

	       else if (check_end_R_R_K28_5)
		 begin
		    
		    ge_x_pcs_rx_stats_inc[4] = 1;
		    
		    receiving_m_clr = 1; gmii_rx_dv_m_clr = 1; gmii_rx_er_m_clr = 1;

		 end

	       else if (check_end_R_R_S)
		 begin
		    ge_x_pcs_rx_stats_inc[7] = 1;
		 end

	       pcs_rx_next = (check_end_R_R_R)     ? S_PCS_RX_TRR_EXTEND       :     
			     (check_end_R_R_K28_5) ? S_PCS_RX_TRI_RRI          :              
			     (check_end_R_R_S)     ? S_PCS_RX_PACKET_BURST_RRS : S_PCS_RX_EXTEND_ERR;       
	    end
	  
	  S_PCS_RX_PACKET_BURST_RRS:
	    begin
	       gmii_rx_dv_m_clr = 1; gmii_rxd_packet_burst_m_set = 1;
	       
	       pcs_rx_next = (SPD_match) ? S_PCS_RX_START_OF_PACKET : S_PCS_RX_PACKET_BURST_RRS;
	    end
	  
	   S_PCS_RX_EXTEND_ERR:
	     begin
		gmii_rx_dv_m_clr  = 1;  gmii_rxd_ext_err_m_set = 1;
		
		pcs_rx_next = (SPD_match)                              ? S_PCS_RX_START_OF_PACKET :
			      (K28_5_match & rx_even_d3)               ? S_PCS_RX_K           :          
			      (~SPD_match & ~K28_5_match & rx_even_d3) ? S_PCS_RX_EPD2_CHECK_END  : S_PCS_RX_EXTEND_ERR;
	     end
	  
	  S_PCS_RX_EARLY_END_EXT:
	    begin
	       gmii_rx_er_m_set = 1;
	         
	       pcs_rx_next = S_PCS_RX_EPD2_CHECK_END;  
	    end
	  
	  S_PCS_RX_DATA_ERROR:
	    begin 
	       gmii_rx_er_m_set = 1;
	       
	       pcs_rx_next = S_PCS_RX_RECEIVE;
	    end
	  
	  S_PCS_RX_DATA:
	    begin
	       gmii_rx_er_m_clr = 1; gmii_rxd_m_set = 1;
	       
	       pcs_rx_next = S_PCS_RX_RECEIVE;
	    end
	endcase

	if      (~signal_detect)  pcs_rx_next = S_PCS_RX_LINK_FAILED;
	else if (~sync_status_d3) pcs_rx_next = S_PCS_RX_LINK_FAILED;    
	else if (soft_reset)      pcs_rx_next = S_PCS_RX_WAIT_K;
	  
     end 
   
endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_sync.v"                             ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "ge_1000baseX_constants.v"

`include "timescale.v"

module ge_1000baseX_sync(

   //  clocks and reset 
   input               ck,
   input               reset,
   
   //  Startup interface. 
   input               startup_enable,

   //  Signal detect from FO transceiver 	     
   input               signal_detect,
		     
   //  Receive EBI bus from 8b10 decode 
   input [7:0] 	       ebi_rxd,
   input               ebi_K,

   output reg [7:0]    ebi_rxd_out,
   output reg          ebi_K_out,
		     
   //  8B/10B disparity and coding errors 
   input               decoder_disparity_err,
   input               decoder_coding_err,		     
		     
   //  RX sync status 
   output reg          sync_status,
		     
   output reg          rx_even,

   input               loopback
   );
   
   //////////////////////////////////////////////////////////////////////////////
   //  Running Disparity
   //////////////////////////////////////////////////////////////////////////////  
   
   reg 		       running_disparity;
   reg 		       running_disparity_positive_m_set;
   reg 		       running_disparity_negative_m_set;

   always @(posedge ck, posedge reset)

     // Assume negative (0) disparity at startup
     if (reset) running_disparity <= 0;

     else
       begin
	  if      (running_disparity_positive_m_set) running_disparity <= 1;
	  else if (running_disparity_negative_m_set) running_disparity <= 0;
       end

   //////////////////////////////////////////////////////////////////////////////
   // sync_status ctrl
   //////////////////////////////////////////////////////////////////////////////

   reg 		       sync_m_acquired, sync_m_lost;
   
   always @(posedge ck, posedge reset)
     if (reset) 
       sync_status <= 0;
     else
       begin
	  if      (sync_m_acquired) begin sync_status <= 1; end
	  else if (sync_m_lost)     begin sync_status <= 0; end
       end

   //////////////////////////////////////////////////////////////////////////////
   // rx_even reg
   //////////////////////////////////////////////////////////////////////////////   
   
   reg 	  rx_even_m_init, rx_even_m_set, rx_even_m_clr, rx_even_m_toggle;
   
   always @(posedge ck, posedge reset)
     if (reset)
       rx_even <= 1;
     else
	begin
	   if      (rx_even_m_init)   rx_even <= 1;
	   else if (rx_even_m_set)    rx_even <= 1;
	   else if (rx_even_m_clr)    rx_even <= 0;
	   else if (rx_even_m_toggle) rx_even <= ~rx_even;
	end
   
   //////////////////////////////////////////////////////////////////////////////
   //  COMMAs can be K28.1, K28.5 or K28.7 - see table 36-2 pg 45
   //////////////////////////////////////////////////////////////////////////////   
      
   reg [7:0]    ebi_rxd_d1;  reg          ebi_K_d1;
   				 
   always @(posedge ck, posedge reset)
     if (reset)
       begin ebi_rxd_d1 <= 0; ebi_K_d1 <= 0; end
     else
       begin ebi_rxd_d1 <= ebi_rxd; ebi_K_d1 <= ebi_K; end
   
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin ebi_rxd_out <= 0; ebi_K_out <=0; end
     else
       begin ebi_rxd_out <= ebi_rxd_d1; ebi_K_out <= ebi_K_d1; end
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////   
   
   assign   K28_1_RX  = (ebi_rxd_d1 == `K28_1_symbol);
   assign   K28_5_RX  = (ebi_rxd_d1 == `K28_5_symbol);
   assign   K28_7_RX  = (ebi_rxd_d1 == `K28_7_symbol);
   
   assign   COMMA_RX = K28_1_RX | K28_5_RX | K28_7_RX;
  
   assign   COMMA_match  = COMMA_RX & ebi_K_d1;

`ifdef MODEL_TECH
   wire [4:0] ebi_rxd_X;  wire [2:0] ebi_rxd_Y;
   
   assign     ebi_rxd_X = ebi_rxd[4:0];
   assign     ebi_rxd_Y = ebi_rxd[7:5];
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   //  Definition of /INVLAID/ as per section 36.2.4.6
   //////////////////////////////////////////////////////////////////////////////   
   reg 	      INVALID;
   
   always @(posedge ck, posedge reset)
     
     INVALID <= (reset) ? 0 : decoder_disparity_err | decoder_coding_err;
   
   assign VALID = ~INVALID;
   
   //////////////////////////////////////////////////////////////////////////////
   //  good_cgs ctrl
   //////////////////////////////////////////////////////////////////////////////   
      
   reg [2:0] 	       good_cgs;
   reg 		       good_cgs_m_init, good_cgs_m_inc, good_cgs_m_cnt;
   	       
   always @(posedge ck, posedge reset)
     if (reset)
       good_cgs <= 0;
     else
       begin
	  if      (good_cgs_m_init)  good_cgs <= 0;
	  else if (good_cgs_m_cnt)   good_cgs <= 1;
	  else if (good_cgs_m_inc)   good_cgs <= good_cgs + 1 ;
	  
       end
   
   assign good_cgs_done = (good_cgs == 3);

   assign cgbad = INVALID | (COMMA_match & rx_even);
   
   assign cggood = ~cgbad;
   
   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
    
`ifdef MODEL_TECH
  enum logic [3:0] {
`else
  localparam
`endif
		    S_PCS_SYNC_RUN            = 0,
		    S_PCS_SYNC_LOSS_OF_SYNC   = 1,
		    S_PCS_SYNC_COMMA_DETECT_1 = 2,
		    S_PCS_SYNC_ACQUIRE_SYNC_1 = 3,
		    S_PCS_SYNC_COMMA_DETECT_2 = 4,
		    S_PCS_SYNC_ACQUIRE_SYNC_2 = 5,
		    S_PCS_SYNC_COMMA_DETECT_3 = 6,
		    S_PCS_SYNC_ACQUIRED_1     = 7,
		    S_PCS_SYNC_ACQUIRED_2     = 8,
		    S_PCS_SYNC_ACQUIRED_3     = 9,
		    S_PCS_SYNC_ACQUIRED_4     = 10,
		    S_PCS_SYNC_ACQUIRED_2A    = 11,
		    S_PCS_SYNC_ACQUIRED_3A    = 12,
		    S_PCS_SYNC_ACQUIRED_4A    = 13
`ifdef MODEL_TECH
  } pcs_sync_present, pcs_sync_next;
`else
   ; reg [3:0] pcs_sync_present, pcs_sync_next;
`endif
 
   //////////////////////////////////////////////////////////////////////////////
   // sync state machine registered part.
   //////////////////////////////////////////////////////////////////////////////   
   
   always @(posedge ck or posedge reset)

     pcs_sync_present <= (reset) ? S_PCS_SYNC_RUN : pcs_sync_next;
   
   //////////////////////////////////////////////////////////////////////////////
   //  sync state machine  - IEEE 802.3-2008 Clause 36  Figure 36-9
   //////////////////////////////////////////////////////////////////////////////      
   
   always @*
     begin	
	pcs_sync_next = pcs_sync_present;
	
	good_cgs_m_init = 0; good_cgs_m_inc = 0; good_cgs_m_cnt = 0;
	
	sync_m_acquired = 0; sync_m_lost = 0;
	
	rx_even_m_init = 0; rx_even_m_set = 0; rx_even_m_clr = 0; rx_even_m_toggle = 0;
	
	running_disparity_negative_m_set = 0; running_disparity_positive_m_set = 0;
	
	case (pcs_sync_present)
	  
	  S_PCS_SYNC_RUN:
	    begin
	       if (startup_enable) pcs_sync_next = S_PCS_SYNC_LOSS_OF_SYNC;
	    end
  
	  S_PCS_SYNC_LOSS_OF_SYNC :
	    begin

	       sync_m_lost = sync_status; 
	       
	       if ((signal_detect | loopback) & COMMA_match)
		 begin
		    rx_even_m_set = 1; pcs_sync_next = S_PCS_SYNC_COMMA_DETECT_1;
		 end
	       else    
		 rx_even_m_toggle = 1;
	    end
	  
	  S_PCS_SYNC_COMMA_DETECT_1 :
	    begin
	       rx_even_m_toggle = 1;
	       
	       pcs_sync_next = (~ebi_K_d1 & ~cgbad) ? S_PCS_SYNC_ACQUIRE_SYNC_1 : S_PCS_SYNC_LOSS_OF_SYNC;
	    end
	  
	  S_PCS_SYNC_ACQUIRE_SYNC_1:
	    begin
	       if (~rx_even & COMMA_match) 
		 begin 
		    rx_even_m_set = 1; pcs_sync_next = S_PCS_SYNC_COMMA_DETECT_2;
		 end
	       else
		 begin
		    rx_even_m_toggle = 1;
	    
		    pcs_sync_next = (~COMMA_match & ~INVALID) ? S_PCS_SYNC_ACQUIRE_SYNC_1 : S_PCS_SYNC_LOSS_OF_SYNC;	       
		 end
	    end
	       
	  S_PCS_SYNC_COMMA_DETECT_2:
	    begin
	       rx_even_m_toggle = 1;
	     
	       pcs_sync_next = (~ebi_K_d1 & ~cgbad) ? S_PCS_SYNC_ACQUIRE_SYNC_2 : S_PCS_SYNC_LOSS_OF_SYNC;
	    end
	  
	  S_PCS_SYNC_ACQUIRE_SYNC_2:
	    begin
	       if (~rx_even & COMMA_match)
		 begin
		    rx_even_m_set = 1; pcs_sync_next = S_PCS_SYNC_COMMA_DETECT_3;
		 end
	       else
		 begin
		    rx_even_m_toggle = 1;
		    
		    pcs_sync_next = (~COMMA_match & ~INVALID) ? S_PCS_SYNC_ACQUIRE_SYNC_2 : S_PCS_SYNC_LOSS_OF_SYNC;
		 end
	    end
	  
	  S_PCS_SYNC_COMMA_DETECT_3:
	    begin
	       rx_even_m_toggle = 1;
	       
	       pcs_sync_next = (~ebi_K_d1 & ~cgbad) ? S_PCS_SYNC_ACQUIRED_1 : S_PCS_SYNC_LOSS_OF_SYNC;
	       
	       sync_m_acquired = ~ebi_K_d1;
	    end 
	  
	  S_PCS_SYNC_ACQUIRED_1:
	    begin
	       rx_even_m_toggle = 1;

	       pcs_sync_next = cggood ? S_PCS_SYNC_ACQUIRED_1 : S_PCS_SYNC_ACQUIRED_2;
	    end
	  
	  S_PCS_SYNC_ACQUIRED_2:
	    begin
	       rx_even_m_toggle = 1;
	       
	       if (cggood) good_cgs_m_cnt = 1; else good_cgs_m_init = 1;
	       
	       pcs_sync_next = cggood ? S_PCS_SYNC_ACQUIRED_2A : S_PCS_SYNC_ACQUIRED_3;
	    end 
	  
	  S_PCS_SYNC_ACQUIRED_3:
	    begin
	   
	       rx_even_m_toggle = 1; 
	   
	       if (cggood) good_cgs_m_cnt = 1; else good_cgs_m_init = 1;
	       
	       pcs_sync_next = cggood ? S_PCS_SYNC_ACQUIRED_3A: S_PCS_SYNC_ACQUIRED_4;
	    end
	  
	  S_PCS_SYNC_ACQUIRED_4:
	    begin
	    
	       rx_even_m_toggle = 1; 
	       
	       if (cggood) good_cgs_m_cnt = 1; else good_cgs_m_init = 1;
	       
	       pcs_sync_next = cggood ? S_PCS_SYNC_ACQUIRED_4A: S_PCS_SYNC_LOSS_OF_SYNC;
	    end
   
	  S_PCS_SYNC_ACQUIRED_2A:
	    begin
	       rx_even_m_toggle = 1; good_cgs_m_inc = 1;

	       pcs_sync_next = (cgbad)         ? S_PCS_SYNC_ACQUIRED_3 :
			       (good_cgs_done) ? S_PCS_SYNC_ACQUIRED_1 : S_PCS_SYNC_ACQUIRED_2A; 
	    end
	  
	  S_PCS_SYNC_ACQUIRED_3A:
	    begin
	       rx_even_m_toggle = 1; good_cgs_m_inc = 1;

	        pcs_sync_next = (cgbad)         ? S_PCS_SYNC_ACQUIRED_4 :
			        (good_cgs_done) ? S_PCS_SYNC_ACQUIRED_2 : S_PCS_SYNC_ACQUIRED_3A; 
	    end
  
	  S_PCS_SYNC_ACQUIRED_4A:
	    begin
	       rx_even_m_toggle = 1; good_cgs_m_inc = 1;
	       
	       pcs_sync_next = (cgbad)         ? S_PCS_SYNC_LOSS_OF_SYNC :
			       (good_cgs_done) ? S_PCS_SYNC_ACQUIRED_3   : S_PCS_SYNC_ACQUIRED_4A; 
	    end 
	  
	endcase 
	
	if (~signal_detect) pcs_sync_next = S_PCS_SYNC_LOSS_OF_SYNC;	
     end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_test.v"                            ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"

module ge_1000baseX_test
(
  // --- Resets ---
  input            reset_pin,

  // --- GE 125MHz reference clock ---
  input             GE_125MHz_ref_ckpin,
 
  // --- FO TBI 125MHz Rx clk --- 
  input             tbi_rx_ckpin,
 
  // --- Fibre-Optic (fo) GE TBI Interface ---
  input       [9:0] tbi_rxd,
  output      [9:0] tbi_txd,

 // --- GMII interface ---
  output      [7:0] gmii_rxd,
  output            gmii_rx_dv, 
  output            gmii_rx_er, 
  output            gmii_col, 
  output            gmii_cs,
 
  input       [7:0] gmii_txd,
  input             gmii_tx_en, 
  input             gmii_tx_er,
 
 //  --- Fibre-Optic (fo) ctrl signals ---
  output            sync_en,
  output            loop_en,
  output            prbs_en,
 
  input             signal_detect,
  input             sync,
  
 // --- MDIO interface
  inout             mdio,
  input             mdio_ckpin
 );
   
   assign   sync_en = 1'b0;
   assign   loop_en = 1'b0;
   assign   prbs_en = 1'b0;

   
   //----------------------------------------------------------------------------
   // MDIO/MDC clock buffering
   //----------------------------------------------------------------------------
   
   IBUFG mdio_ckpin_bufi(.I(mdio_ckpin), .O(mdio_ckpin_buf));

   BUFG mdio_ck_bufi(.I(mdio_ckpin_buf), .O(mdc));
   
   //----------------------------------------------------------------------------
   // GE 125MHz reference clock
   //----------------------------------------------------------------------------
   
   IBUFG GE_125MHz_ref_ckpin_bufi(.I(GE_125MHz_ref_ckpin), .O(GE_125MHz_ref_ckpin_buf));

   wire GE_125MHz_ref_ck_locked;
   
   DCM #(
    .CLKIN_PERIOD(8.0),         // Specify period of input clock in ns
    .CLKFX_MULTIPLY(5),
    .CLKFX_DIVIDE(8)            
   ) GE_125MHz_ref_ck_DCMi(
    .CLK0(GE_125MHz_ref_ck_unbuf),			   
    .CLK180(),
    .CLK270(),
    .CLK2X(),
    .CLK2X180(),
    .CLK90(),
    .CLKDV(),
    .CLKFX(),
    .CLKFX180(),
    .LOCKED(GE_125MHz_ref_ck_locked),
    .PSDONE(),
    .STATUS(),
    .CLKFB(GE_125MHz_ref_ck),			   
    .CLKIN(GE_125MHz_ref_ckpin_buf),
    .DSSEN(1'b0),
    .PSCLK(1'b0),
    .PSEN(1'b0),
    .PSINCDEC(1'b0),
    .RST(reset_pin)
  );

   //----------------------------------------------------------------------------
   // 125MHz refence clock
   //----------------------------------------------------------------------------
`ifdef MODEL_TECH  
    BUFG GE_125MHz_ref_ck_bufi(.I(GE_125MHz_ref_ck_unbuf), .O(GE_125MHz_ref_ck));
`else
    BUFGMUX GE_125MHz_ref_ck_bufi(.I1(GE_125MHz_ref_ck_unbuf), .O(GE_125MHz_ref_ck), .S(1'b1));
`endif
     
   //----------------------------------------------------------------------------
   // Fibre-Optic (FO) TBI RX clock.
   //----------------------------------------------------------------------------
   
   IBUFG tbi_rx_ckpin_bufi(.I(tbi_rx_ckpin), .O(tbi_rx_ckpin_buf));
   
   DCM #(
    .CLKIN_PERIOD(8.0)         
   ) tbi_rx_ck_DCMi(
    .CLK0(tbi_rx_ck_unbuf),	       
    .CLK180(),
    .CLK270(),
    .CLK2X(),
    .CLK2X180(),
    .CLK90(),
    .CLKDV(),		       
    .CLKFX(),
    .CLKFX180(),
    .LOCKED(tbi_rx_ck_locked),
    .PSDONE(),
    .STATUS(),
    .CLKFB(tbi_rx_ck),		       
    .CLKIN(tbi_rx_ckpin_buf),
    .DSSEN(1'b0),
    .PSCLK(1'b0),
    .PSEN(1'b0),
    .PSINCDEC(1'b0),
    .RST(reset_pin)
  );	
   
   // FO TBI 125MHz rx clock
   BUFG tbi_rx_ck_bufi( .I(tbi_rx_ck_unbuf), .O(tbi_rx_ck));		   
	        
   //----------------------------------------------------------------------------
   // Reset Cleaners
   //----------------------------------------------------------------------------
   
   wire  main_clocks_locked =  GE_125MHz_ref_ck_locked;
   
   wire  tbi_rxck_reset_in  = reset_pin | ~main_clocks_locked;
   wire  GE_125MHz_reset_in = reset_pin | ~main_clocks_locked;
   wire  mdc_reset_in       = reset_pin | ~main_clocks_locked;
   
   wire  GE_125MHz_reset, tbi_rx_reset;

   clean_rst GE_125MHz_reset_cleaneri(.clk(GE_125MHz_ref_ck), .rsti(GE_125MHz_reset_in), .rsto(GE_125MHz_reset));
   clean_rst tbi_rx_reset_cleaneri(   .clk(tbi_rx_ck),        .rsti(tbi_rxck_reset_in),  .rsto(tbi_rx_reset));
   clean_rst mdc_reset_cleaneri(      .clk(mdc),              .rsti(mdc_reset_in),       .rsto(mdc_reset));
 
   //-------------------------------------------------------------------------------
   // --- IEEE 802.3-2008 1000baseX PCS ---
   //-------------------------------------------------------------------------------

   ge_1000baseX ge_1000baseX_i(
    
      // --- Clocks ---
      .rx_ck(tbi_rx_ck), .tx_ck(GE_125MHz_ref_ck), 
    		   
      // --- resets --- 
      .tx_reset(GE_125MHz_reset), .rx_reset(tbi_rx_reset), 	       
			  
      // --- Startup interface. ---
      .startup_enable(~GE_125MHz_reset),

       // --- Signal detect from FO transceiver 
      .signal_detect(signal_detect),
			
      // --- Receive GMII bus --- 
      .gmii_rxd(gmii_rxd),
      .gmii_rx_dv(gmii_rx_dv),
      .gmii_rx_er(gmii_rx_er),   		      
      .gmii_col(gmii_col),
      .gmii_cs(gmii_cs),	    
       // --- Transmit GMII bus ---		     
      .gmii_tx_en(gmii_tx_en),
      .gmii_tx_er(gmii_tx_er),
      .gmii_txd(gmii_txd),
  
      // --- Receive 8B10B bus ---
      .tbi_rxd(tbi_rxd),		      
      // --- Transmit 8B10B bus ---		     
      .tbi_txd(tbi_txd),
      
      // --- Mode of operation ---
      .repeater_mode(1'b0),
		      
      // --- MDIO interface ---
      .mdc_reset(mdc_reset), 	      
      .mdc(mdc),
      .mdio(mdio)/* synthesis xc_pullup = 1 */
   );
   
   
endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX_tx.v"                               ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "ge_1000baseX_constants.v"
`include "ge_1000baseX_regs.v"

module ge_1000baseX_tx (
		    	   
   //  transmit clock and reset 		  
   input ck,
   input reset,

   // SERDES transmit 10B bus 
   output   [9:0]    tbi_txd,

   // Transmit GMII bus 
   input             gmii_tx_en_in,
   input             gmii_tx_er_in,
   input   [7:0]     gmii_txd_in,

   output reg        gmii_col,

   input             receiving,		    
   output reg        transmitting,

   input             signal_detect,
		    
   // Frame transmit pulse	
   output            tx_frame_pulse,
		    
   // Auto-negotiation ctrl 
   input [2:0]       xmit,
   input [15:0]      tx_config,
   input             mr_main_reset
			
   );
           
   //////////////////////////////////////////////////////////////////////////////
   // Diagnostics registers
   //////////////////////////////////////////////////////////////////////////////

`define TX_FRAME_CNT             16'h0000    
`define TX_DATA_CNT              16'h0001
`define TX_ERROR_CNT             16'h0002
`define END_OF_PACKET_NOEXT_CNT  16'h0003
`define END_OF_PACKET_EXT_CNT    16'h0004
`define EXTEND_BY_1_CNT          16'h0005
`define CARRIER_EXTEND_CNT       16'h0006
`define EPD2_NOEXT_CNT           16'h0007
`define EPD3_CNT                 16'h0008
`define RESET                    16'hffff
   
   reg [8:0] 	       ge_x_pcs_tx_stats_inc;
   
   reg [15:0] 	       tx_frame_cnt; 
   reg [15:0] 	       tx_error_cnt;
   reg [15:0] 	       tx_data_cnt;
   reg [15:0] 	       end_of_packet_noext_cnt;
   reg [15:0] 	       end_of_packet_ext_cnt;
   reg [15:0] 	       extend_by_1_cnt;
   reg [15:0] 	       carrier_extend_cnt;
   reg [15:0] 	       epd2_noext_cnt;
   reg [15:0] 	       epd3_cnt;
   
   always @(posedge ck, posedge reset)
     
     if (reset)
       begin
	  tx_frame_cnt            <= 'd0; tx_data_cnt             <= 'd0;  
	  tx_error_cnt            <= 'd0; end_of_packet_noext_cnt <= 'd0;
	  end_of_packet_ext_cnt   <= 'd0; extend_by_1_cnt         <= 'd0;
	  carrier_extend_cnt      <= 'd0; epd2_noext_cnt          <= 'd0;
	  epd3_cnt                <= 'd0;
       end
     else
       begin
	  if      (ge_x_pcs_tx_stats_inc[0])  tx_frame_cnt            <= tx_frame_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[1])  tx_data_cnt             <= tx_data_cnt + 1;  
	  else if (ge_x_pcs_tx_stats_inc[2])  tx_error_cnt            <= tx_error_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[3])  end_of_packet_noext_cnt <= end_of_packet_noext_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[4])  end_of_packet_ext_cnt   <= end_of_packet_ext_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[5])  extend_by_1_cnt         <= extend_by_1_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[6])  carrier_extend_cnt      <= carrier_extend_cnt + 1; 
	  else if (ge_x_pcs_tx_stats_inc[7])  epd2_noext_cnt          <= epd2_noext_cnt + 1;
	  else if (ge_x_pcs_tx_stats_inc[8])  epd3_cnt                <= epd3_cnt + 1;
       end 

   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
   
   assign 	     tx_frame_pulse = ge_x_pcs_tx_stats_inc[0];
   
   //////////////////////////////////////////////////////////////////////////////
   // Soft reset
   //////////////////////////////////////////////////////////////////////////////
   reg 		     soft_reset;
   
   always @(posedge ck, posedge reset)
     if (reset)
       soft_reset <= 0;
     else
       soft_reset <= mr_main_reset;

   //////////////////////////////////////////////////////////////////////////////
   // Running disparity
   //////////////////////////////////////////////////////////////////////////////
   
   wire	  encoder_disparity; // 0 - Negative Running Disparity, 1 - Positive Running Disparity

   //////////////////////////////////////////////////////////////////////////////
   //
   //////////////////////////////////////////////////////////////////////////////
   
   reg 	  gmii_tx_en_pipe, gmii_tx_er_pipe; reg [7:0]  gmii_txd_pipe;

   reg 	  gmii_d1, gmii_d1_m_set, gmii_d1_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  gmii_d1 <= 0;
	  gmii_tx_en_pipe <= 0; gmii_tx_er_pipe <= 0; gmii_txd_pipe <= 0;
       end
     else
       begin
	  gmii_tx_en_pipe <= gmii_tx_en_in;
	  gmii_tx_er_pipe <= gmii_tx_er_in;
	  gmii_txd_pipe   <= gmii_txd_in;
	  
	  if      (gmii_d1_m_set) gmii_d1 <= 1;
	  else if (gmii_d1_m_clr) gmii_d1 <= 0;
	  
       end
   
   wire       gmii_tx_en = (gmii_d1) ? gmii_tx_en_pipe : gmii_tx_en_in;
   wire       gmii_tx_er = (gmii_d1) ? gmii_tx_er_pipe : gmii_tx_er_in;
   wire [7:0] gmii_txd   = (gmii_d1) ? gmii_txd_pipe   : gmii_txd_in;
   
   //////////////////////////////////////////////////////////////////////////////
   // gmii_col
   //////////////////////////////////////////////////////////////////////////////  

   reg  gmii_col_m_set, gmii_col_m_clr;


    always @(posedge ck, posedge reset)
      if (reset)
	begin
	   gmii_col <= 0;
	end
      else
	begin
	   if      (gmii_col_m_set) begin gmii_col <= 1; end
	   else if (gmii_col_m_clr) begin gmii_col <= 0; end
	end
   
   //////////////////////////////////////////////////////////////////////////////
   // Current transmit state
   //////////////////////////////////////////////////////////////////////////////     
   
   reg 	transmitting_m_set, transmitting_m_clr;
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  transmitting <= 0;
       end
     else
       begin
	  if      (transmitting_m_set) begin transmitting <= 1; end
	  else if (transmitting_m_clr) begin transmitting <= 0; end
       end

   //////////////////////////////////////////////////////////////////////////////
   // Configuration Counter and decode logic
   //////////////////////////////////////////////////////////////////////////////    

   reg [3:0] config_cnt;
   
   reg 	     config_cnt_clr, config_cnt_inc;
   
   always @(posedge ck, posedge reset)
     if (reset)
       config_cnt <= 0;
     else
       begin
	  if      (config_cnt_clr) config_cnt <= 0;
	  else if (config_cnt_inc) config_cnt <= config_cnt + 1; 
       end

   assign config_C1_done = (config_cnt == 3);
   assign config_C2_done = (config_cnt == 7);
   		  
   assign config_cnt_K28_5     = (config_cnt == 0 | config_cnt == 4);
   assign config_cnt_D21_5     = (config_cnt == 1);
   assign config_cnt_D2_2      = (config_cnt == 5);
   assign config_cnt_config_lo = (config_cnt == 2 | config_cnt == 6);
   assign config_cnt_config_hi = (config_cnt == 3 | config_cnt == 7);

   //////////////////////////////////////////////////////////////////////////////
   // Idle counter and decode logic
   //////////////////////////////////////////////////////////////////////////////    
   
   reg idle_cnt; 
   
   reg 	     idle_cnt_m_clr, idle_cnt_m_inc;
   
   always @(posedge ck, posedge reset)
     if (reset)
       idle_cnt <= 0;
     else
       begin
	  if      (idle_cnt_m_clr) idle_cnt <= 0;
	  else if (idle_cnt_m_inc) idle_cnt <= idle_cnt + 1; 

       end
   
   wire   idle_cnt_done, idle_cnt_is_clr, idle_cnt_is_set;
   
   assign idle_cnt_done   = idle_cnt;  
   assign idle_cnt_is_clr = ~idle_cnt; 
   assign idle_cnt_is_set = idle_cnt;  
   
   //////////////////////////////////////////////////////////////////////////////
   // PCS Transmit - IEEE 802.3-2005 Clause 36, Figure 36-6 page 58
   //////////////////////////////////////////////////////////////////////////////   
   //  
   reg [7:0] encoder_8b_rxd; 
   
   reg 	     encoder_K;
   
   reg 	     encoder_8b_rxd_gmii_txd_m_set, encoder_8b_rxd_config_lo_m_set, encoder_8b_rxd_config_hi_m_set;
   
   reg 	     encoder_8b_rxd_K30_7_m_set, encoder_8b_rxd_K29_7_m_set, encoder_8b_rxd_K28_1_m_set, encoder_8b_rxd_K28_5_m_set, encoder_8b_rxd_K27_7_m_set, encoder_8b_rxd_K23_7_m_set;
   
   reg 	     encoder_8b_rxd_D21_5_m_set, encoder_8b_rxd_D2_2_m_set, encoder_8b_rxd_D5_6_m_set, encoder_8b_rxd_D16_2_m_set;
   
   reg 	     encoder_tx_even;
   
   wire      encoder_tx_even_set = (encoder_8b_rxd_K28_5_m_set| encoder_8b_rxd_config_lo_m_set);
   
   wire      encoder_tx_even_clr = (encoder_8b_rxd_D21_5_m_set|encoder_8b_rxd_D21_5_m_set|encoder_8b_rxd_D5_6_m_set|encoder_8b_rxd_D16_2_m_set|encoder_8b_rxd_config_hi_m_set);
   
   wire      encoder_tx_even_toggle = (encoder_8b_rxd_gmii_txd_m_set|encoder_8b_rxd_K30_7_m_set|encoder_8b_rxd_K27_7_m_set|encoder_8b_rxd_K29_7_m_set|encoder_8b_rxd_K23_7_m_set);
   
   always @(posedge ck, posedge reset)
     if (reset)
       begin
	  encoder_K <= 0; encoder_8b_rxd <= 0; encoder_tx_even <= 0;
       end
     else
       begin
	  // Input 8b10b encode K ctrl strobe 
	  encoder_K <= encoder_8b_rxd_K30_7_m_set|encoder_8b_rxd_K29_7_m_set|encoder_8b_rxd_K28_5_m_set|encoder_8b_rxd_K27_7_m_set|encoder_8b_rxd_K23_7_m_set;

	  // Input to 8b10b encode EBI (Eight Bit Interface) bus.
	  encoder_8b_rxd <=  
		      // Drive special K codes onto 8b10_enc encoder_8b_rxd - K strobe high
		      encoder_8b_rxd_K30_7_m_set      ? `K30_7_symbol   :
		      encoder_8b_rxd_K29_7_m_set      ? `K29_7_symbol   :			     
		      encoder_8b_rxd_K28_5_m_set      ? `K28_5_symbol   :
		      encoder_8b_rxd_K28_1_m_set      ? `K28_1_symbol   :
		      encoder_8b_rxd_K27_7_m_set      ? `K27_7_symbol   :
		      encoder_8b_rxd_K23_7_m_set      ? `K23_7_symbol   :
		      // Drive Special Data Codes onto 8b10 enc encoder_8b_rxd - K strobe low
		      encoder_8b_rxd_D21_5_m_set      ? `D21_5_symbol   :
		      encoder_8b_rxd_D2_2_m_set       ? `D2_2_symbol    :  
		      encoder_8b_rxd_D5_6_m_set       ? `D5_6_symbol    :
		      encoder_8b_rxd_D16_2_m_set      ? `D16_2_symbol   :
		      // Drive Tx Config register onto 8b10 enc encoder_8b_rxd - K strobe low
		      encoder_8b_rxd_config_lo_m_set  ? tx_config[7:0]  : 
		      encoder_8b_rxd_config_hi_m_set  ? tx_config[15:8] : 

		      // Drive GMII txd onto 8b10 enc encoder_8b_rxd - K strobe low
		      encoder_8b_rxd_gmii_txd_m_set   ? gmii_txd : 0;

	  // Keep track of even/odd TX status
	  encoder_tx_even <= encoder_tx_even_set    ? 1            : 
			     encoder_tx_even_clr    ? 0            : 
			     encoder_tx_even_toggle ? ~encoder_tx_even : encoder_tx_even;
       end
   

 

   //////////////////////////////////////////////////////////////////////////////
   //  VOID - see IEEE 802.3-2005 Section 36 (PCS) page 55 
   //////////////////////////////////////////////////////////////////////////////    

   assign VOID = (~gmii_tx_en & gmii_tx_er & gmii_txd != 8'b00001111) | (gmii_tx_en & gmii_tx_er);

   //////////////////////////////////////////////////////////////////////////////
   // Instantiate 8b10 Encode  module
   //////////////////////////////////////////////////////////////////////////////   
   //   
   encoder_8b10b encoder_8b10bi(
		       
      //  Clocks 
      .SBYTECLK(ck),
		       
      //  Reset 
      .reset(reset),
    
      //  eight bit interface (ebi) input  
      .ebi(encoder_8b_rxd),

      //  ten bit interface (tbi) output to TBI bus 
      .tbi(tbi_txd),

      //  Data/special code-group ctrl  	       
      .K(encoder_K),

      // Running Disparity
      .disparity(encoder_disparity)
   );


`ifdef MODEL_TECH

   wire [4:0] encoder_8b_X;  wire [2:0] encoder_8b_Y;
   
   assign     encoder_8b_X = encoder_8b_rxd[4:0];
   assign     encoder_8b_Y = encoder_8b_rxd[7:5];
`endif    
   
`ifdef MODEL_TECH
  enum logic [4:0] {
`else
  localparam
`endif
		    S_PCS_TX_TEST_XMIT            = 0,
		    S_PCS_TX_XMIT_DATA            = 1,      
		    S_PCS_TX_ALIGN_ERR_START      = 2,
		    S_PCS_TX_START_ERROR          = 3,
		    S_PCS_TX_DATA_ERROR           = 4,
		    S_PCS_TX_START_OF_PACKET      = 5,
		    S_PCS_TX_PACKET               = 6,
		    S_PCS_TX_END_OF_PACKET_NOEXT  = 7,
		    S_PCS_TX_END_OF_PACKET_EXT    = 8,
		    S_PCS_TX_EXTEND_BY_1          = 9,
		    S_PCS_TX_CARRIER_EXTEND       = 10,   
		    S_PCS_TX_EPD2_NOEXT           = 11,
		    S_PCS_TX_EPD3                 = 12,
		    S_PCS_TX_CONFIGURATION        = 13,
		    S_PCS_TX_IDLE                 = 14
`ifdef MODEL_TECH
  } pcs_tx_present, pcs_tx_next;
`else
   ; reg [4:0] pcs_tx_present, pcs_tx_next;
`endif

    
   //////////////////////////////////////////////////////////////////////////////
   // xmit ctrl
   //////////////////////////////////////////////////////////////////////////////

   wire      xmit_idle,  xmit_configuration, xmit_data;
   
   assign    xmit_configuration = (xmit == `XMIT_CONFIGURATION);
   
   assign    xmit_idle = (xmit == `XMIT_IDLE) | (xmit == `XMIT_DATA & (gmii_tx_en | gmii_tx_er));
   
   assign    xmit_data = (xmit == `XMIT_DATA  & ~gmii_tx_en & ~gmii_tx_er);

   reg [2:0] xmit_saved; wire xmitCHANGE;
   
   always @(posedge ck, posedge reset)

     xmit_saved <= (reset) ? `XMIT_IDLE : xmit;
   
   assign xmitCHANGE = (xmit != xmit_saved);

   //////////////////////////////////////////////////////////////////////////////
   // transmit state machine registered part.
   //////////////////////////////////////////////////////////////////////////////
   
   always @(posedge ck, posedge reset)

     pcs_tx_present <= (reset) ? S_PCS_TX_TEST_XMIT :  pcs_tx_next;
   
   //////////////////////////////////////////////////////////////////////////////
   // transmit state machine - IEEE 802.3-2008 Clause 36
   //////////////////////////////////////////////////////////////////////////////
   
   always @*
     begin
	pcs_tx_next = pcs_tx_present;
	
	encoder_8b_rxd_gmii_txd_m_set = 0;

	encoder_8b_rxd_K30_7_m_set = 0; 
	encoder_8b_rxd_K29_7_m_set = 0; 
	encoder_8b_rxd_K28_5_m_set = 0;
	encoder_8b_rxd_K28_1_m_set = 0;
	encoder_8b_rxd_K27_7_m_set = 0; 
	encoder_8b_rxd_K23_7_m_set = 0;
	
	encoder_8b_rxd_D21_5_m_set = 0; 
	encoder_8b_rxd_D2_2_m_set = 0; 
	encoder_8b_rxd_D5_6_m_set = 0; 
	encoder_8b_rxd_D16_2_m_set = 0;
	
	encoder_8b_rxd_config_lo_m_set = 0; 
	encoder_8b_rxd_config_hi_m_set = 0;
	
	transmitting_m_set = 0; transmitting_m_clr = 0;
	
	gmii_col_m_set = 0; gmii_col_m_clr = 0;
	
	config_cnt_clr = 0; config_cnt_inc = 0;
	
	idle_cnt_m_clr = 0; idle_cnt_m_inc = 0;
	
	gmii_d1_m_set = 0; gmii_d1_m_clr = 0;

	ge_x_pcs_tx_stats_inc = 'd0;
	
	case (pcs_tx_present)
	 
	  S_PCS_TX_TEST_XMIT:
	    begin
 	       transmitting_m_clr = 1; gmii_col_m_clr = 1; gmii_d1_m_clr = 1;
	       
	       pcs_tx_next =  xmit_configuration  ? S_PCS_TX_CONFIGURATION    :
			      xmit_idle           ? S_PCS_TX_IDLE      :  
			      xmit_data           ? S_PCS_TX_XMIT_DATA : S_PCS_TX_TEST_XMIT;
	       
	       idle_cnt_m_clr = xmit_idle; config_cnt_clr = xmit_configuration; 
	    end
        
	  S_PCS_TX_XMIT_DATA:
	    begin
	       
	       idle_cnt_m_inc = idle_cnt_is_clr; idle_cnt_m_clr = ~idle_cnt_is_clr;

	       encoder_8b_rxd_D5_6_m_set  = (~idle_cnt_is_clr & encoder_disparity);
	       encoder_8b_rxd_D16_2_m_set = (~idle_cnt_is_clr & ~encoder_disparity);
	       encoder_8b_rxd_K28_5_m_set = (idle_cnt_is_clr & ~gmii_tx_en);
	       
	       encoder_8b_rxd_K27_7_m_set = (idle_cnt_is_clr & gmii_tx_en);
	       
	       gmii_d1_m_set    = ~idle_cnt_is_clr & gmii_tx_en ;
	       
	       transmitting_m_set = (idle_cnt_is_clr & gmii_tx_en);
	       
	       if (idle_cnt_is_clr & gmii_tx_en & receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
	       
	       if (idle_cnt_is_clr)
		 begin
		    pcs_tx_next = (xmit != `XMIT_DATA)  ? S_PCS_TX_TEST_XMIT  :
				  (~gmii_tx_en)         ? S_PCS_TX_XMIT_DATA  :
				  (gmii_tx_er)          ? S_PCS_TX_DATA_ERROR : S_PCS_TX_PACKET;

		    // Keep count of good frames
		    ge_x_pcs_tx_stats_inc[0] = gmii_tx_en & ~gmii_tx_er;
		    
		    // Keep count of errored frames
		    ge_x_pcs_tx_stats_inc[2] = gmii_tx_en & gmii_tx_er;
		    
		 end
	    end

	  
	  S_PCS_TX_START_ERROR:
	    begin
	       transmitting_m_set = 1;
	      
	       if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;

	       encoder_8b_rxd_K27_7_m_set = 1;

	       pcs_tx_next = S_PCS_TX_DATA_ERROR;
	    end

	  
	  S_PCS_TX_DATA_ERROR:
	    begin
	       if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
	       
	       encoder_8b_rxd_K30_7_m_set = 1;
	       
	       pcs_tx_next = S_PCS_TX_PACKET;
	    end
	  
	  
	  S_PCS_TX_START_OF_PACKET:
	    begin
	       transmitting_m_set = 1; encoder_8b_rxd_K27_7_m_set = 1;
	       
	       if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
	       
	       pcs_tx_next = S_PCS_TX_PACKET;
	    end
	  
	  S_PCS_TX_PACKET:
	    begin
	       idle_cnt_m_clr = 1;
	       
	       // END_OF_PACKET_NOEXT
	       if (~gmii_tx_en & ~gmii_tx_er)
		 begin
		    if (~encoder_tx_even) transmitting_m_clr = 1;
		    
		    gmii_col_m_clr = 1; encoder_8b_rxd_K29_7_m_set = 1;
		    
		    pcs_tx_next = S_PCS_TX_EPD2_NOEXT;
		 end
	       
	       // END_OF_PACKET_EXT
	       else if (~gmii_tx_en & gmii_tx_er)
		 begin
		    if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
		    
		    if (VOID) encoder_8b_rxd_K30_7_m_set = 1; else encoder_8b_rxd_K29_7_m_set = 1;
		    
		    pcs_tx_next = (gmii_tx_er) ? S_PCS_TX_CARRIER_EXTEND : S_PCS_TX_EXTEND_BY_1;
		 end
	       
	       else // TX_DATA
		 begin
		    // Keep count of number of TX bytes
		    ge_x_pcs_tx_stats_inc[1] = 1;
		    
		    if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
		    
		    if (VOID) encoder_8b_rxd_K30_7_m_set = 1; else encoder_8b_rxd_gmii_txd_m_set = 1;
		 end
	    end

	  S_PCS_TX_END_OF_PACKET_NOEXT:
	    begin

	       ge_x_pcs_tx_stats_inc[3] = 1;
	       
	       if (~encoder_tx_even) transmitting_m_clr = 1;
	       
	       gmii_col_m_clr = 1; encoder_8b_rxd_K29_7_m_set = 1;
	       
	       pcs_tx_next = S_PCS_TX_EPD2_NOEXT;
	    end
	  
	  
	  S_PCS_TX_END_OF_PACKET_EXT:
	    begin

	       ge_x_pcs_tx_stats_inc[4] = 1;
	       
	       if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
	       
	       if (VOID) encoder_8b_rxd_K30_7_m_set = 1; else encoder_8b_rxd_K29_7_m_set = 1;

	       pcs_tx_next = (gmii_tx_er) ? S_PCS_TX_CARRIER_EXTEND : S_PCS_TX_EXTEND_BY_1;
	    end
	  
	  S_PCS_TX_EXTEND_BY_1:
	    begin
	       ge_x_pcs_tx_stats_inc[5] = 1;
	       
	       if (~encoder_tx_even) transmitting_m_clr = 1;
	       
	       gmii_col_m_clr = 1; encoder_8b_rxd_K23_7_m_set = 1;
	    
	       pcs_tx_next = S_PCS_TX_EPD2_NOEXT;
	    end

	  
	  S_PCS_TX_CARRIER_EXTEND:
	    begin

	       ge_x_pcs_tx_stats_inc[6] = 1;
	       
	       if (receiving) gmii_col_m_set = 1; else gmii_col_m_clr = 1;
	       
	       if (VOID) encoder_8b_rxd_K30_7_m_set = 1; else encoder_8b_rxd_K23_7_m_set = 1;

	       pcs_tx_next = (~gmii_tx_en & ~gmii_tx_er) ? S_PCS_TX_EXTEND_BY_1 :
			     (gmii_tx_en  &  gmii_tx_er) ? S_PCS_TX_START_ERROR :
			     (gmii_tx_en  & ~gmii_tx_er) ? S_PCS_TX_START_OF_PACKET : 
     		             S_PCS_TX_CARRIER_EXTEND;   
	    end

	  S_PCS_TX_EPD2_NOEXT:
	    begin
	       
	       ge_x_pcs_tx_stats_inc[7] = 1;
	       
	       gmii_d1_m_clr = 1; transmitting_m_clr = 1; encoder_8b_rxd_K23_7_m_set = 1;

	       pcs_tx_next = (encoder_tx_even) ? S_PCS_TX_XMIT_DATA : S_PCS_TX_EPD3;
	    end

	  
	  S_PCS_TX_EPD3:
	    begin
	       ge_x_pcs_tx_stats_inc[8] = 1;
	       
	       encoder_8b_rxd_K23_7_m_set = 1;

	       pcs_tx_next = S_PCS_TX_XMIT_DATA;
	    end
	  
	  //////////////////////////////////////////////////////////////////////////////
	  // IEEE 802.3-2005 Clause 36  Figure 36-6
	    
	  S_PCS_TX_CONFIGURATION:
	    begin
	       encoder_8b_rxd_K28_5_m_set     = config_cnt_K28_5;
	       encoder_8b_rxd_D21_5_m_set     = config_cnt_D21_5;
	       encoder_8b_rxd_D2_2_m_set      = config_cnt_D2_2;
	       encoder_8b_rxd_config_lo_m_set = config_cnt_config_lo;

	       encoder_8b_rxd_config_hi_m_set = config_cnt_config_hi;

	       if ((config_C1_done | config_C2_done))
		 begin
		    pcs_tx_next = (xmit_idle) ? S_PCS_TX_IDLE      :  
				  (xmit_data) ? S_PCS_TX_XMIT_DATA : S_PCS_TX_CONFIGURATION; 
		    
		    idle_cnt_m_clr = xmit_idle;
		 end
	       
	       if (config_C2_done | (config_C1_done & (xmit != `XMIT_CONFIGURATION))) config_cnt_clr = 1; 
	       else                                                                   config_cnt_inc = 1; 
	    end

	  
	  S_PCS_TX_IDLE:
	    begin
	       encoder_8b_rxd_K28_5_m_set =  idle_cnt_is_clr;
	       encoder_8b_rxd_D5_6_m_set  = (idle_cnt_is_set & encoder_disparity);
	       encoder_8b_rxd_D16_2_m_set = (idle_cnt_is_set & ~encoder_disparity);

	       pcs_tx_next = (idle_cnt_done & xmit_data)          ? S_PCS_TX_XMIT_DATA     :
			     (idle_cnt_done & xmit_configuration) ? S_PCS_TX_CONFIGURATION : S_PCS_TX_IDLE;
	       
	       idle_cnt_m_clr = idle_cnt_done; idle_cnt_m_inc = ~idle_cnt_done;
	       
	       config_cnt_clr = (idle_cnt_done & xmit_configuration);
	    end 
	endcase
       
	if (mr_main_reset)      pcs_tx_next = S_PCS_TX_TEST_XMIT;
	 	
     end
       
   
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "ge_1000baseX.v"                                  ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// This module is based on the coding method described in       ////
//// IEEE Std 802.3-2008 Clause 36 "Physical Coding Sublayer(PCS) ////
//// and Physical Medium Attachment (PMA) sublayer, type          ////
//// 1000BASE-X"; see :                                           ////
////                                                              ////
//// http://standards.ieee.org/about/get/802/802.3.html           ////
//// and                                                          ////
//// doc/802.3-2008_section3.pdf, Clause/Section 36.              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "timescale.v"

`include "ge_1000baseX_regs.v"
`include "ge_1000baseX_constants.v"


module ge_1000baseX #(
  parameter PHY_ADDR = 5'b00000		   
)(		  
   // Clocks 
   input             rx_ck,
   input             tx_ck,
		     
   // Resets		 
   input             rx_reset,
   input             tx_reset,
		 
   // Startup interface
   input             startup_enable,
		 
   // Signal detect from FO transceiver 	     
   input             signal_detect,
		 	      
   //  RLK1221 receive TBI bus 
   input   [9:0]     tbi_rxd,
		 
   //  TLK1221 transmit TBI bus 
   output   [9:0]    tbi_txd,
		 
   //  Receive GMII bus 
   output      [7:0] gmii_rxd,
   output            gmii_rx_dv,  
   output            gmii_rx_er,
   output            gmii_col,
   output reg        gmii_cs,
 	       
 
   //  Transmit GMII bus  
   input   [7:0]     gmii_txd,
   input             gmii_tx_en,
   input             gmii_tx_er,
  
   input             repeater_mode,
		 
   //  MDIO interface   
   input             mdc_reset,
   inout             mdio,
   input             mdc
	  		            
  );
   
   //////////////////////////////////////////////////////////////////////////////
   // IEEE Std 802.3-2008 Clause 22 "Reconcilliation Sublayer (RS) and 
   // Media Independent Interface (MII)IEEE 802.3-2005 Clause 22 
   //////////////////////////////////////////////////////////////////////////////
   
   wire 	     mdio_in, mdio_out, mdio_oe;
   
   wire [15:0] 	     gmii_reg_wr;
   wire [15:0] 	     gmii_reg_rd;
   wire [4:0] 	     gmii_reg_addr;
   wire 	     gmii_reg_wr_strobe;
   
   ge_1000baseX_mdio #(
    .PHY_ADDR(PHY_ADDR)
   ) gmii_mdioi(
    .reset(mdc_reset),		
    .mdc(mdc), 
    .mdio(mdio_in), 
    .mdio_out(mdio_out),
    .mdio_oe(mdio_oe),

    .data_addr(gmii_reg_addr),
    .data_rd(gmii_reg_rd),
    .data_wr(gmii_reg_wr),
    .strobe_wr(gmii_reg_wr_strobe)
   );

   // MDIO tristate drivers.
   assign mdio = (mdio_oe) ? mdio_out : 1'bz;

   assign mdio_in = mdio;
   
   //////////////////////////////////////////////////////////////////////////////
   // IEEE 802.3-2008 1000BASE-X PCS OUI and version Number
   //////////////////////////////////////////////////////////////////////////////
   
   wire [23:0] 	     IEEE_OUI =  24'ha1b2c3;
   
   wire [7:0] 	     version = { 4'b0000, 4'b0001 };
   
   //////////////////////////////////////////////////////////////////////////////
   //  Aneg configuration registers
   //////////////////////////////////////////////////////////////////////////////
   
   wire [15:0] 	 tx_config_reg; wire [15:0] rx_config_reg; wire rx_config_reg_set;
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII  register 0 - Basic Control - IEEE 802.3-8 1000BASE-X clause 37 page 35 
   //////////////////////////////////////////////////////////////////////////////

   reg [15:0] 	 gmii_reg_0;
   
   wire 	 mr_main_reset, mr_loopback, mr_restart_an, mr_an_enable;
     
   assign 	 mr_main_reset = gmii_reg_0[15];
   assign 	 mr_loopback   = gmii_reg_0[14];
   assign        mr_an_enable  = gmii_reg_0[12];
   assign 	 mr_restart_an = gmii_reg_0[9];
   
`ifdef MODEL_TECH
   // Register 0 bit 11 (normally power-down) used in simulation
   // to simulate fibre being inserted and removed
   //
   wire 	 signal_detect_int = (gmii_reg_0[11] & signal_detect);
`else
   wire 	 signal_detect_int = signal_detect;
`endif    
   
   //////////////////////////////////////////////////////////////////////////////
   // Safe versions of various signals in the RX clock domain
   //////////////////////////////////////////////////////////////////////////////

   reg [1:0] 	 mr_main_reset_rxc, mr_loopback_rxc,  mr_restart_an_rxc;
   reg [1:0] 	 signal_detect_rxc, mr_an_enable_rxc, startup_enable_rxc;
   
   always @(posedge rx_ck, posedge rx_reset)
    if (rx_reset) begin
       mr_main_reset_rxc <= 2'b00; mr_loopback_rxc    <= 2'b00; 
       mr_restart_an_rxc <= 2'b00; mr_an_enable_rxc   <= 2'b00;
       signal_detect_rxc <= 2'b00; startup_enable_rxc <= 2'b00;
    end
    else begin
       mr_main_reset_rxc  <= {  mr_main_reset_rxc[0], mr_main_reset     };
       mr_loopback_rxc    <= {    mr_loopback_rxc[0], mr_loopback       };
       mr_restart_an_rxc  <= {  mr_restart_an_rxc[0], mr_restart_an     };
       mr_an_enable_rxc   <= {   mr_an_enable_rxc[0], mr_an_enable      };
       signal_detect_rxc  <= {  signal_detect_rxc[0], signal_detect_int };
       startup_enable_rxc <= { startup_enable_rxc[0], startup_enable    };
    end
   
   // Speed select - when AN disabled
   wire [1:0] 	     speed_select =  {gmii_reg_0[6], gmii_reg_0[13]};


`ifdef MODEL_TECH
 `define GMII_REG_0_RESET {8'h19, 8'h40}
`else
 `define GMII_REG_0_RESET {8'h11, h40}
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 1 - Basic Status - IEEE 802.3-5 1000baseLX clause 37 page 36 
   //////////////////////////////////////////////////////////////////////////////
   
   wire 	     mr_an_complete, sync_status;
   
`ifdef MODEL_TECH
   // For simulation - sync_status is on gmii_reg 1 bit 7 - currently unused
   wire [15:0] 	     gmii_reg_1 = { 1'b0,        1'b0,                 1'b0,           1'b0, 
				    1'b0,        1'b0,                 1'b0,           1'b0, 
				    sync_status, 1'b1,                 mr_an_complete, 1'b0,
				    1'b1,        signal_detect_rxc[1], 1'b0,           1'b0};
`else   
   wire [15:0] 	     gmii_reg_1 = { 1'b0,        1'b0,                 1'b0,           1'b0, 
				    1'b0,        1'b0,                 1'b0,           1'b0, 
				    1'b0,        1'b1,                 mr_an_complete, 1'b0,
				    1'b1,        signal_detect_rxc[1], 1'b0,           1'b0};
`endif
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 2 - PHY Identifier 1 - IEEE 802.3-5 1000baseX 
   // clause 37 page 36 
   //////////////////////////////////////////////////////////////////////////////
   
   wire [15:0] 	     gmii_reg_2 = { IEEE_OUI[15:8], IEEE_OUI[23:16]};

   //////////////////////////////////////////////////////////////////////////////
   // --- GMII register 3 - PHY Identifier 2 - IEEE 802.3-5 1000baseX 
   // clause 37 page 36
   //////////////////////////////////////////////////////////////////////////////
   
   wire [15:0] 	     gmii_reg_3 = { version, IEEE_OUI[7:0] };
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 4 - Auto-Negotiation Advertisement - IEEE 802.3-5 1000baseX 
   // clause 37 page 37 
   //////////////////////////////////////////////////////////////////////////////
   
   reg  [15:0] 	     gmii_reg_4;

   wire [15:0] 	     mr_adv_ability;
   
   // See IEEE 802.3-5 1000baseLX clause 37 page 82 - Table 37-1 for these
   
   assign 	     mr_adv_ability = gmii_reg_4;
   
`define GMII_REG_4_RESET 16'b0000000000100000
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 5 - Auto-Negotiation Link Partner Ability - IEEE 802.3-5 
   // 1000baseX clause 37 page 37
   //////////////////////////////////////////////////////////////////////////////
  
   wire [15:0] 	     mr_lp_adv_ability;  
   
   wire [15:0] 	     gmii_reg_5 = mr_lp_adv_ability;
	           
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 6 - Auto-Negotiation Expansion - IEEE 802.3-5 1000baseX 
   // clause 37 page 38
   //////////////////////////////////////////////////////////////////////////////

   wire [15:0] 	     gmii_reg_6;
   
   wire		     mr_np_abl, mr_page_rx;

   assign 	     gmii_reg_6 = { 1'b0,      1'b0, 1'b0,      1'b0,
				    1'b0,      1'b0, 1'b0,      1'b0,
				    1'b0,      1'b0, 1'b0,      1'b0,
				    mr_np_abl, 1'b0, mr_page_rx,1'b0};
   
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 7 - Auto-Negotiation Link Partner Next Page - IEEE 802.3-5 
   // 1000baseX clause 37 page 38 
   //////////////////////////////////////////////////////////////////////////////
   
   reg [15:0] 	     gmii_reg_7;
   
   wire[15:0] 	     mr_np_tx;
   
   assign 	     mr_np_tx = gmii_reg_7;

`define GMII_REG_7_RESET 16'b0000000000000000
    
   //////////////////////////////////////////////////////////////////////////////
   // GMII register 8 - Auto-Negotiation Link Partner Next Page - IEEE 802.3-5 
   // 1000baseX clause 37 page 38
   //////////////////////////////////////////////////////////////////////////////
   
   wire [15:0] 	     gmii_reg_8;
   
   wire [15:0] 	     mr_lp_np_rx;
   
   assign 	     gmii_reg_8 = mr_lp_np_rx;
   
   //////////////////////////////////////////////////////////////////////////////
   // IEEE Std 802.3-2008 Clause 22 "Reconcilliation Sublayer (RS) and 
   // Media Independent Interface (MII)IEEE 802.3-2005 Clause 22 
   //////////////////////////////////////////////////////////////////////////////
   
   // Read operations
   assign gmii_reg_rd = (gmii_reg_addr == `GMII_BASIC_CTRL)       ? gmii_reg_0  :
			(gmii_reg_addr == `GMII_BASIC_STATUS)     ? gmii_reg_1  :
			(gmii_reg_addr == `GMII_PHY_ID1)          ? gmii_reg_2  :
			(gmii_reg_addr == `GMII_PHY_ID2)          ? gmii_reg_3  :
			(gmii_reg_addr == `GMII_AN_ADV)           ? gmii_reg_4  :
			(gmii_reg_addr == `GMII_AN_LP_ADV)        ? gmii_reg_5  :
			(gmii_reg_addr == `GMII_AN_EXPANSION)     ? gmii_reg_6  :
			(gmii_reg_addr == `GMII_AN_NP)            ? gmii_reg_7  :       
			(gmii_reg_addr == `GMII_AN_LP_NP)         ? gmii_reg_8  : 5'b00000;
   
   // Write operations
   always @(posedge mdc or posedge mdc_reset)
     if (mdc_reset)
       begin
	  gmii_reg_0  <= `GMII_REG_0_RESET;
	  gmii_reg_4  <= `GMII_REG_4_RESET;
	  gmii_reg_7  <= `GMII_REG_7_RESET;
       end
     else
       if (gmii_reg_wr_strobe)
	 begin
	    case (gmii_reg_addr)
	      
	      `GMII_BASIC_CTRL       : gmii_reg_0  <= gmii_reg_wr;
	      `GMII_AN_ADV           : gmii_reg_4  <= gmii_reg_wr;
	      `GMII_AN_NP            : gmii_reg_7  <= gmii_reg_wr; 
	    endcase 
	 end
       else
	 begin
	    // mr_an_restart is self clearing
	    if (gmii_reg_0[9]) gmii_reg_0[9] <= 1'b0;
	    
	    // mr_main_reset) is self clearing
	    else if (gmii_reg_0[15]) gmii_reg_0[15] <= 1'b0;
	 end 

     
   //////////////////////////////////////////////////////////////////////////////
   // Status
   //////////////////////////////////////////////////////////////////////////////
  
   wire [2:0] 	     xmit;

   wire 	     carrier_detect;
   
   wire 	     transmitting, receiving;
      
   //////////////////////////////////////////////////////////////////////////////
   //  Generate GMII Carrier Sense - IEEE 802.3-2008 Clause 36 - 26.2.5.2.5
   //////////////////////////////////////////////////////////////////////////////
   
   always @(posedge rx_ck, posedge rx_reset)
     if (rx_reset)
       gmii_cs <= 1'b0;
     else
       if      ((~repeater_mode & transmitting) | receiving)  begin gmii_cs <= 1'b1; end
   
       else if ((repeater_mode | ~transmitting) & ~receiving) begin gmii_cs <= 1'b0; end

   
   //////////////////////////////////////////////////////////////////////////////
   // delayed versions of 10b interface 
   //////////////////////////////////////////////////////////////////////////////	  
   
   reg [9:0] 	       tbi_rxd_d1, tbi_rxd_d2, tbi_rxd_d3, tbi_rxd_d4;
   
   always @(posedge rx_ck, posedge rx_reset)
     begin
	tbi_rxd_d1 <= (rx_reset) ? 0 : tbi_rxd;
	tbi_rxd_d2 <= (rx_reset) ? 0 : tbi_rxd_d1;
	tbi_rxd_d3 <= (rx_reset) ? 0 : tbi_rxd_d2;
	tbi_rxd_d4 <= (rx_reset) ? 0 : tbi_rxd_d3;
     end
    
   //////////////////////////////////////////////////////////////////////////////
   /// 8b10 decoder module
   //////////////////////////////////////////////////////////////////////////////
  
   wire 	       decoder_K, decoder_disparity_err, decoder_coding_err;
   
   wire [7:0] 	       decoder_8b_rxd;

	    
   decoder_8b10b decoder_8b10bi(
		       
      .RBYTECLK(rx_ck),
		
      .reset(rx_reset),

      // 10B input
      .tbi(tbi_rxd_d1),   
      
      // Data/special code-group ctrl 		       
      .K_out(decoder_K),

      // 8B output   
      .ebi(decoder_8b_rxd),
		       
      // Disparity error 
      .disparity_err(decoder_disparity_err),

      // Disparity output  
      .disparity(decoder_disparity_out),
      				
      // Coding error 
      .coding_err(decoder_coding_err)
   );
   
`ifdef MODEL_TECH
   wire [4:0] 	       decoder_8b_rxd_X;  
   wire [2:0] 	       decoder_8b_rxd_Y;
   
   assign {decoder_8b_rxd_Y, decoder_8b_rxd_X} = decoder_8b_rxd;
   
`endif
  
   //////////////////////////////////////////////////////////////////////////////
   // Instantiate 802.3-2005 PCS sync module - 802.3-2008 Clause 36
   //////////////////////////////////////////////////////////////////////////////  
  
   wire 	       sync_K, sync_rx_even;
   wire [7:0] 	       sync_8b_rxd;
   
`ifdef MODEL_TECH
   wire [4:0] 	       sync_8b_rxd_X = sync_8b_rxd[4:0];
   wire [2:0] 	       sync_8b_rxd_Y = sync_8b_rxd[7:5];
`endif
   
   ge_1000baseX_sync ge_1000baseX_sync_i(
			      
      .ck(rx_ck), .reset(rx_reset),

      .startup_enable(startup_enable_rxc[1]),
				
      // Signal detect from FO transceiver 	     
      .signal_detect(signal_detect_rxc[1]),
				
      // 8B input from 8b10 decoder 
      .ebi_rxd(decoder_8b_rxd),
      .ebi_K(decoder_K),	

      // 8B output from sync
      .ebi_rxd_out(sync_8b_rxd),
      .ebi_K_out(sync_K),	

       // Synchronisation status
      .sync_status(sync_status),
      
      .rx_even(sync_rx_even),	
	
      .decoder_disparity_err(decoder_disparity_err),
					 
      .decoder_coding_err(decoder_coding_err),		

      .loopback(mr_loopback_rxc[1])
   );

   //////////////////////////////////////////////////////////////////////////////
   // Carrier Detect - IEEE 802.3-2008 Section 36.2.5.1.4
   //////////////////////////////////////////////////////////////////////////////
   
   wire [5:0] 	       sb; wire [3:0] fb;

   wire 	       RDn_cd_fail_match1, RDn_cd_fail_match2, RDn_cd_fail_match;

   wire 	       RDp_cd_fail_match1, RDp_cd_fail_match2, 	RDp_cd_fail_match;      
	
   assign 	       sb[5:0] = tbi_rxd_d4[9:4];  
   
   assign 	       fb[3:0] = tbi_rxd_d4[3:0];
   
   assign 	       RDn_cd_fail_match1 = ((sb == 6'b110000) & ((fb == 4'b0101) | (fb == 4'b0100) | (fb == 4'b0111) | (fb == 4'b0001) | (fb==4'b1101)));
   
   assign 	       RDn_cd_fail_match2 = ((fb == 4'b0101) & ((sb==6'b110001) |(sb==6'b110010) | (sb==6'b110100) | (sb==6'b111000) | (sb==6'b100000) | (sb==6'b010000)));
   
   assign 	       RDn_cd_fail_match = RDn_cd_fail_match1 | RDn_cd_fail_match2;

   
   assign 	       RDp_cd_fail_match1 = ((sb == 6'b001111) & ((fb==4'b1010)|(fb==4'b1011)|(fb==4'b1000)|(fb==4'b1110)|(fb==4'b0010)));

   assign 	       RDp_cd_fail_match2 = ((fb == 4'b1010) & ((sb==6'b001110)|(sb==6'b001101)|(sb==6'b001011)|(sb==6'b000111)|(sb==6'b011111)|(sb==6'b101111)));
          
   assign 	       RDp_cd_fail_match = RDp_cd_fail_match1 | RDp_cd_fail_match2;

   assign 	       carrier_detect = sync_rx_even &  ~RDn_cd_fail_match & ~RDp_cd_fail_match;

   //////////////////////////////////////////////////////////////////////////////
   // 802.3-2008 1000baseX PCS autonegotiation (AN) module - 802.3-2008 Clause 37
   //////////////////////////////////////////////////////////////////////////////
  
   wire [2:0] 	       rudi; // RX_UNITDATA.indicate messages
   
   ge_1000baseX_an ge_1000baseX_an_i(
      
       .ck(rx_ck),.reset(rx_reset),

       .startup_enable(startup_enable_rxc[1]),			       
	
       //  Auto-negotiation ctrl 
       .xmit(xmit),
       .rx_config(rx_config_reg),
       .rx_config_set(rx_config_reg_set),			     
       .tx_config(tx_config_reg),

       // RX_UNITDATA.indicate messages		       
       .rudi(rudi),

       // Auto-negotiation /C/ and /I/ matching 		       
       .ability_match(ability_match),
       .acknowledge_match(acknowledge_match),
       .consistency_match(consistency_match),	
       .idle_match(idle_match),
			       
       // Synchronisation Status 
       .sync_status(sync_status),
       .signal_detect(signal_detect_rxc[1]),
			     
       // GMII Register 0 - AN Basic Control
       .mr_main_reset(mr_main_reset_rxc[1]),
       .mr_loopback(mr_loopback_rxc[1]),
       .mr_restart_an(mr_restart_an_rxc[1]),
       .mr_an_enable(mr_an_enable_rxc[1]),

       // GMII Register 1 - AN Basic Status		     
       .mr_an_complete(mr_an_complete),		     

       // GMII register 4 - AN Advertisement	     
       .mr_adv_ability(mr_adv_ability),
		
       // GMII register 5 - AN Link Partner Ability
       .mr_lp_adv_ability(mr_lp_adv_ability),

       // GMII register 6 - AN Expansion
       .mr_np_abl(mr_np_abl),
       .mr_page_rx(mr_page_rx),
			     
       // GMII register 7 - AN Next Page
       .mr_np_tx(mr_np_tx),
			     
       // GMII register 8 - AN Link Partner Next Page 	
       .mr_lp_np_rx(mr_lp_np_rx)
   );

   wire 	       tx_frame_pulse, frame_rx_pulse;
   
   //////////////////////////////////////////////////////////////////////////////
   // 802.3-2008 1000baseX PCS receive module - 802.3-2008 Clause 36
   //////////////////////////////////////////////////////////////////////////////
  
   ge_1000baseX_rx ge_1000base_rxi(
     			    		      
      .ck(rx_ck), .reset(rx_reset),
  
      // Receive 8B bus from sync module 
      .ebi_rxd(sync_8b_rxd),
      .ebi_K(sync_K),
			    
      .rx_even(sync_rx_even),
      .carrier_detect(carrier_detect),
      .sync_status(sync_status),
			    
      // Signal detect from FO transceiver 	     
      .signal_detect(signal_detect_rxc[1]),
      
       // Receive frame pulse	
      .rx_frame_pulse(rx_frame_pulse),
    
       // Receive GMII bus 
      .gmii_rxd(gmii_rxd),
      .gmii_rx_dv(gmii_rx_dv),
      .gmii_rx_er(gmii_rx_er),
    		      
       // Auto-negotiation ctrl 
       .xmit(xmit),  
       .mr_main_reset(mr_main_reset_rxc[1]),
       .rx_config(rx_config_reg),
       .rx_config_set(rx_config_reg_set),		    
       .rudi(rudi),
			      
       // Auto-negotiation /C/ and /I/ matching 		      
       .ability_match(ability_match),
       .acknowledge_match(acknowledge_match),
       .consistency_match(consistency_match),	
       .idle_match(idle_match),
	
       .receiving(receiving)	      
   );
     
   //////////////////////////////////////////////////////////////////////////////
   //  Safe versions of various signals in the TX clock domain
   //////////////////////////////////////////////////////////////////////////////
   
   reg [1:0] mr_main_reset_txc, receiving_txc, signal_detect_txc, startup_enable_txc;
     
   always @(posedge tx_ck, posedge tx_reset)
     if (tx_reset) begin
	
	mr_main_reset_txc <= 2'b00; receiving_txc      <= 2'b00; 
	signal_detect_txc <= 2'b00; startup_enable_txc <= 2'b00;
     end
     else
       begin
	  mr_main_reset_txc  <= {  mr_main_reset_txc[0], mr_main_reset  };
	  receiving_txc      <= {      receiving_txc[0], receiving      };
	  signal_detect_txc  <= {  signal_detect_txc[0], signal_detect  };
	  startup_enable_txc <= { startup_enable_txc[0], startup_enable };
       end
   
   reg [2:0] xmit_txc, xmit_txc0;
   
   always @(posedge tx_ck, posedge tx_reset)
     begin
	xmit_txc <= (tx_reset) ? `XMIT_IDLE :  xmit_txc0;
	
	xmit_txc0 <= (tx_reset) ? `XMIT_IDLE : xmit;
     end
   
   //////////////////////////////////////////////////////////////////////////////
   // 802.3-2008 1000baseX PCS transmit module  802.3-2008 Clause 36
   //////////////////////////////////////////////////////////////////////////////
   
   ge_1000baseX_tx ge_1000baseX_txi(
			        			    
      // --- TX clock and reset ---	      
      .ck(tx_ck),
      .reset(tx_reset),

       // --- RLK1221 transmit TBI bus ---		       
      .tbi_txd(tbi_txd),
			    
      .signal_detect(signal_detect_txc[1]),
 			    
       // Transmit frame pulse	
      .tx_frame_pulse(tx_frame_pulse),
			    
       // --- Transmit GMII bus - 
      .gmii_tx_en_in(gmii_tx_en),
      .gmii_tx_er_in(gmii_tx_er),
      .gmii_txd_in(gmii_txd),
      
      .gmii_col(gmii_col),
			    
      .receiving(receiving_txc[1]),	        
      .transmitting(transmitting),
			    		    
       // --- Auto-negotiation ctrl ---
      .xmit(xmit_txc),
      .tx_config(tx_config_reg),		
      .mr_main_reset(mr_main_reset_txc[1])
   );

   //////////////////////////////////////////////////////////////////////////////
   // Frame transmit LED pulse
   //////////////////////////////////////////////////////////////////////////////
   
   reg [23:0] 	       tx_led_counter;
   reg 		       tx_frame_pulse_latch, tx_frame_activity;
   
   always @(posedge tx_ck, posedge tx_reset)

     if (tx_reset)
       begin
	  tx_led_counter <= 0; tx_frame_activity <= 0;  tx_frame_pulse_latch <= 1;
       end
     else
       begin
	  tx_led_counter <= tx_led_counter + 1;
	  
	  if (tx_frame_activity)
	    begin
	       if (~tx_led_counter[23]) begin tx_frame_pulse_latch <= 0;tx_frame_activity <= 0; end
	    end
	  else if (tx_led_counter[23] & tx_frame_pulse_latch) tx_frame_activity <= 1;
	  
	  else if (tx_frame_pulse) tx_frame_pulse_latch <= 1;
       end 

   //////////////////////////////////////////////////////////////////////////////
   // Frame receive LED pulse
   //////////////////////////////////////////////////////////////////////////////
   
   reg [23:0] 	       rx_led_counter;
   reg 		       rx_frame_pulse_latch, rx_frame_activity;
   
   always @(posedge rx_ck, posedge rx_reset)

     if (rx_reset)
       begin
	  rx_led_counter <= 0; rx_frame_activity <= 0;  rx_frame_pulse_latch <= 1;
       end
     else
       begin
	  rx_led_counter <= rx_led_counter + 1;
	  
	  if (rx_frame_activity)
	    begin
	       if (~rx_led_counter[23]) begin rx_frame_pulse_latch <= 0;rx_frame_activity <= 0; end
	    end
	  else if (rx_led_counter[23] & rx_frame_pulse_latch) rx_frame_activity <= 1;
	  
	  else if (rx_frame_pulse) rx_frame_pulse_latch <= 1;
       end 

   
   wire fo_activity = rx_frame_activity | tx_frame_activity;
   
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  File name "timescale.v"                                     ////
////                                                              ////
////  This file is part of the :                                  ////
////                                                              ////
//// "1000BASE-X IEEE 802.3-2008 Clause 36 - PCS project"         ////
////                                                              ////
////  http://opencores.org/project,1000base-x                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - D.W.Pegler Cambridge Broadband Networks Ltd           ////
////                                                              ////
////      { peglerd@gmail.com, dwp@cambridgebroadand.com }        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 AUTHORS. All rights reserved.             ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

