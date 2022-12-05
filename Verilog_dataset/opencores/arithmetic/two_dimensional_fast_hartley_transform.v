/*******************************************************************************
*     This file is owned and controlled by Xilinx and must be used             *
*     solely for design, simulation, implementation and creation of            *
*     design files limited to Xilinx devices or technologies. Use              *
*     with non-Xilinx devices or technologies is expressly prohibited          *
*     and immediately terminates your license.                                 *
*                                                                              *
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"            *
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                  *
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION          *
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION              *
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS                *
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                  *
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE         *
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY                 *
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                  *
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR           *
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF          *
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS          *
*     FOR A PARTICULAR PURPOSE.                                                *
*                                                                              *
*     Xilinx products are not intended for use in life support                 *
*     appliances, devices, or systems. Use in such applications are            *
*     expressly prohibited.                                                    *
*                                                                              *
*     (c) Copyright 1995-2007 Xilinx, Inc.                                     *
*     All rights reserved.                                                     *
*******************************************************************************/
// The synthesis directives "translate_off/translate_on" specified below are
// supported by Xilinx, Mentor Graphics and Synplicity synthesis
// tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file dpsram_128x16.v when simulating
// the core, dpsram_128x16. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "CORE Generator Help".

`timescale 1ns/1ps

module dpsram_128x16(
	addra,
	addrb,
	clka,
	clkb,
	dina,
	dinb,
	douta,
	doutb,
	ena,
	enb,
	wea,
	web);


input [6 : 0] addra;
input [6 : 0] addrb;
input clka;
input clkb;
input [15 : 0] dina;
input [15 : 0] dinb;
output [15 : 0] douta;
output [15 : 0] doutb;
input ena;
input enb;
input wea;
input web;

// synthesis translate_off

      BLKMEMDP_V6_3 #(
		.c_addra_width(7),
		.c_addrb_width(7),
		.c_default_data("0"),
		.c_depth_a(128),
		.c_depth_b(128),
		.c_enable_rlocs(0),
		.c_has_default_data(1),
		.c_has_dina(1),
		.c_has_dinb(1),
		.c_has_douta(1),
		.c_has_doutb(1),
		.c_has_ena(1),
		.c_has_enb(1),
		.c_has_limit_data_pitch(0),
		.c_has_nda(0),
		.c_has_ndb(0),
		.c_has_rdya(0),
		.c_has_rdyb(0),
		.c_has_rfda(0),
		.c_has_rfdb(0),
		.c_has_sinita(0),
		.c_has_sinitb(0),
		.c_has_wea(1),
		.c_has_web(1),
		.c_limit_data_pitch(18),
		.c_mem_init_file("mif_file_16_1"),
		.c_pipe_stages_a(0),
		.c_pipe_stages_b(0),
		.c_reg_inputsa(0),
		.c_reg_inputsb(0),
		.c_sim_collision_check("NONE"),
		.c_sinita_value("0"),
		.c_sinitb_value("0"),
		.c_width_a(16),
		.c_width_b(16),
		.c_write_modea(2),
		.c_write_modeb(2),
		.c_ybottom_addr("0"),
		.c_yclka_is_rising(1),
		.c_yclkb_is_rising(1),
		.c_yena_is_high(0),
		.c_yenb_is_high(0),
		.c_yhierarchy("hierarchy1"),
		.c_ymake_bmm(0),
		.c_yprimitive_type("32kx1"),
		.c_ysinita_is_high(1),
		.c_ysinitb_is_high(1),
		.c_ytop_addr("1024"),
		.c_yuse_single_primitive(0),
		.c_ywea_is_high(0),
		.c_yweb_is_high(0),
		.c_yydisable_warnings(1))
	inst (
		.ADDRA(addra),
		.ADDRB(addrb),
		.CLKA(clka),
		.CLKB(clkb),
		.DINA(dina),
		.DINB(dinb),
		.DOUTA(douta),
		.DOUTB(doutb),
		.ENA(ena),
		.ENB(enb),
		.WEA(wea),
		.WEB(web),
		.NDA(),
		.NDB(),
		.RFDA(),
		.RFDB(),
		.RDYA(),
		.RDYB(),
		.SINITA(),
		.SINITB());


// synthesis translate_on

endmodule

/**********************************************************************
 * File  : fht_1d_x8.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 * Function: Fast Hartley Transform 1 Dimension for 8 Points
 * Decimation in Frequency Domain
 * 
 *     +-----------+    +-----------+    +-----------+
 *     |  Serial   |    |  1D FHT   |    | Parallel  |
 * --->|    to     |--->|           |--->|    to     |--->
 *     | Parallel  |    | 8 Points  |    |  Serial   |
 *     +-----------+    +-----------+    +-----------+
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module fht_1d_x8(
	rstn,
	sclk,

	// input data - x0,x1,x2,x3,x4,x5,x6,x7,x0,x1...
	x_valid,
	x_data,
	
	// 1D FHT output data - h0,h1,h2,h3,h4,h5,h6,h7,h0,h1...
	fht_valid,
	fht_data

);

parameter N = 8;

input			rstn;
input			sclk;

input			x_valid;
input	[N-1:0]	x_data;

output			fht_valid;
output	[N+2:0]	fht_data;
// +++---------------------------------+++\\

// +++ Data Preparation Step Start +++ \\
// +++        - Aligning -         +++ \\
reg [N-1:0] x0,x1,x2,x3,x4,x5,x6,x7;
always @(posedge sclk or negedge rstn)
if (!rstn) begin
	x0 <= #1 0;
	x1 <= #1 0;
	x2 <= #1 0;
	x3 <= #1 0;
	x4 <= #1 0;
	x5 <= #1 0;
	x6 <= #1 0;
	x7 <= #1 0;
end
else if (x_valid) begin
	x0 <= #1 x_data;
	x1 <= #1 x0;
	x2 <= #1 x1;
	x3 <= #1 x2;
	x4 <= #1 x3;
	x5 <= #1 x4;
	x6 <= #1 x5;
	x7 <= #1 x6;
end

reg x_valid_1d;
always @(posedge sclk or negedge rstn)
if	(!rstn)	x_valid_1d <= #1 0;
else		x_valid_1d <= #1 x_valid;

wire xi_ready;

reg [2:0] cnt;
always @(posedge sclk or negedge rstn)
if		(!rstn)			cnt <= #1 0;
else if (x_valid_1d)	cnt <= #1 cnt + 1;

assign xi_ready = (cnt == 7 && x_valid_1d) ? 1'b1 : 1'b0;

// at the ready time aligned and reversed
reg [N-1:0] x0_FF,x1_FF,x2_FF,x3_FF,x4_FF,x5_FF,x6_FF,x7_FF;
always @(posedge sclk or negedge rstn)
if (!rstn) begin
	x0_FF <= #1 0;
	x1_FF <= #1 0;
	x2_FF <= #1 0;
	x3_FF <= #1 0;
	x4_FF <= #1 0;
	x5_FF <= #1 0;
	x6_FF <= #1 0;
	x7_FF <= #1 0;
end
else if (xi_ready) begin
	x0_FF <= #1 x7;
	x1_FF <= #1 x6;
	x2_FF <= #1 x5;
	x3_FF <= #1 x4;
	x4_FF <= #1 x3;
	x5_FF <= #1 x2;
	x6_FF <= #1 x1;
	x7_FF <= #1 x0;
end
// +++ Data Preparation Step Finish +++ //

// delay for ... clocks to provide timing requirements
reg [13:0] xi_ready_d;
always @(posedge sclk or negedge rstn)
if (!rstn)	xi_ready_d[13:0] <= #1 0;
else		xi_ready_d[13:0] <= #1 {xi_ready_d[12:0],xi_ready};

// 1D Fast Hartley Transform - Decimation-in-Frequency Algorithm

// Butterfly Stage N1
// Data input [N-1:0] = N bits
// On the output of the 1st bfly is [N:0] = N+1 bits

// <<<--------- Butterfly Stage N1
wire [N:0] stg1_sum1;
wire [N:0] stg1_sum2;
wire [N:0] stg1_sum3;
wire [N:0] stg1_sum4;

wire [N:0] stg1_sub1;
wire [N:0] stg1_sub2;
wire [N:0] stg1_sub3;
wire [N:0] stg1_sub4;

fht_bfly_noFF #(N) u11_fht_bfly ({x0_FF},{x4_FF},stg1_sum1,stg1_sub1);
fht_bfly_noFF #(N) u12_fht_bfly ({x1_FF},{x5_FF},stg1_sum2,stg1_sub2);
fht_bfly_noFF #(N) u13_fht_bfly ({x2_FF},{x6_FF},stg1_sum3,stg1_sub3);
fht_bfly_noFF #(N) u14_fht_bfly ({x3_FF},{x7_FF},stg1_sum4,stg1_sub4);

// <<<--------- Butterfly Stage N2
wire [N+1:0] stg2_sum1;
wire [N+1:0] stg2_sum2;
wire [N+1:0] stg2_sum3;

wire [N+1:0] stg2_sub1;
wire [N+1:0] stg2_sub2;
wire [N+1:0] stg2_sub3;

fht_bfly #(N+1) u21_fht_bfly (rstn,sclk,xi_ready_d[1],stg1_sum1,stg1_sum3,stg2_sum1,stg2_sub1);
fht_bfly #(N+1) u22_fht_bfly (rstn,sclk,xi_ready_d[1],stg1_sum2,stg1_sum4,stg2_sum2,stg2_sub2);
fht_bfly #(N+1) u23_fht_bfly (rstn,sclk,xi_ready_d[1],stg1_sub1,stg1_sub3,stg2_sum3,stg2_sub3);

// Multiplier on the 2nd Stage
wire [N:0] mult_dat_1;
wire [N:0] mult_dat_2;
assign mult_dat_1 = stg1_sub2;
assign mult_dat_2 = stg1_sub4;

wire [N+1:0] mult_res1;
wire [N+1:0] mult_res2;

`ifdef USE_ASIC_MULT
	signed_mult_const_asic #(N+1) u_mult_1_fht (rstn,sclk,xi_ready_d[1],mult_dat_1,mult_res1);
	signed_mult_const_asic #(N+1) u_mult_2_fht (rstn,sclk,xi_ready_d[1],mult_dat_2,mult_res2);
`elsif USE_FPGA_MULT
	signed_mult_const_fpga #(N+1) u_mult_1_fht (rstn,sclk,xi_ready_d[1],mult_dat_1,mult_res1);
	signed_mult_const_fpga #(N+1) u_mult_2_fht (rstn,sclk,xi_ready_d[1],mult_dat_2,mult_res2);
`endif

// <<<--------- Butterfly Stage N3
wire [N+2:0] stg3_sum1;
wire [N+2:0] stg3_sum2;
wire [N+2:0] stg3_sum3;
wire [N+2:0] stg3_sum4;

wire [N+2:0] stg3_sub1;
wire [N+2:0] stg3_sub2;
wire [N+2:0] stg3_sub3;
wire [N+2:0] stg3_sub4;

fht_bfly #(N+2) u31_fht_bfly (rstn,sclk,xi_ready_d[3],stg2_sum1,stg2_sum2,stg3_sum1,stg3_sub1);
fht_bfly #(N+2) u32_fht_bfly (rstn,sclk,xi_ready_d[3],stg2_sub1,stg2_sub2,stg3_sum2,stg3_sub2);
fht_bfly #(N+2) u33_fht_bfly (rstn,sclk,xi_ready_d[3],stg2_sum3,mult_res1,stg3_sum3,stg3_sub3);
fht_bfly #(N+2) u34_fht_bfly (rstn,sclk,xi_ready_d[3],stg2_sub3,mult_res2,stg3_sum4,stg3_sub4);

// <<<--------- FHT Result
reg [N+2:0] h0_FF,h1_FF,h2_FF,h3_FF,h4_FF,h5_FF,h6_FF,h7_FF;
always @(posedge sclk or negedge rstn)
if (!rstn) begin
	h0_FF <= #1 0;
	h4_FF <= #1 0;
	h2_FF <= #1 0;
	h6_FF <= #1 0;
	h1_FF <= #1 0;
	h5_FF <= #1 0;
	h3_FF <= #1 0;
	h7_FF <= #1 0;
end
else if (xi_ready_d[5]) begin
	h0_FF <= #1 stg3_sum1;
	h4_FF <= #1 stg3_sub1;
	h2_FF <= #1 stg3_sum2;
	h6_FF <= #1 stg3_sub2;
	h1_FF <= #1 stg3_sum3;
	h5_FF <= #1 stg3_sub3;
	h3_FF <= #1 stg3_sum4;
	h7_FF <= #1 stg3_sub4;
end

assign h0_valid = xi_ready_d[6];
assign h1_valid = xi_ready_d[7];
assign h2_valid = xi_ready_d[8];
assign h3_valid = xi_ready_d[9];
assign h4_valid = xi_ready_d[10];
assign h5_valid = xi_ready_d[11];
assign h6_valid = xi_ready_d[12];
assign h7_valid = xi_ready_d[13];

wire	fht_valid_or;
assign	fht_valid_or =	h0_valid |
						h1_valid |
						h2_valid |
						h3_valid |
						h4_valid |
						h5_valid |
						h6_valid |
						h7_valid ;

wire [N+2:0] h_or_data;
assign h_or_data =	
				(h0_FF & {N+3{h0_valid}}) |
				(h1_FF & {N+3{h1_valid}}) |
				(h2_FF & {N+3{h2_valid}}) |
				(h3_FF & {N+3{h3_valid}}) |
				(h4_FF & {N+3{h4_valid}}) |
				(h5_FF & {N+3{h5_valid}}) |
				(h6_FF & {N+3{h6_valid}}) |
				(h7_FF & {N+3{h7_valid}}) ;

reg	[N+2:0]	fht_data;
reg			fht_valid;

always @(posedge sclk or negedge rstn)
if (!rstn)	fht_valid <= #1 0;
else		fht_valid <= #1 fht_valid_or;

always @(posedge sclk or negedge rstn)
if (!rstn)	fht_data <= #1 0;
else		fht_data <= #1 h_or_data;

endmodule
/**********************************************************************
 * File  : fht_8x8_core.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 * Compilation Notes:
 *  1).Input Data
 *     - no min.negative value
 *  2).Memory
 *     - if you use Xilinx FPGA for prototyping 
 *       compile this code along with 
 *       USE_FPGA_SPSRAM definition and
 *       XilinxCoreLib library,
 *     - otherwise compile this code
 *       along with USE_ASIC_SPSRAM
 *     - max. bitwidth is 16bits
 *  3).Multiplier
 *     - if you use Xilinx FPGA for prototyping 
 *       compile this code along with 
 *       USE_FPGA_MULT definition
 *     - otherwise compile this code
 *       along with USE_ASIC_MULT
 *
 * TOP Level
 * 2D FHT 64 points -> ... clk delay
 * 
 *     +-------------------------+
 *     |                         |
 * --->|    2D FHT/8x8 Points    |---> 
 *     |                         |
 *     +-------------------------+
 *     |<---- ... clk delay ---->|
 *
 * Input Data  : [N-1:0] signed
 * Output Data : [N+5:0] signed
 *
 * Data is coming from somewhere (e.g. memory) with sclk one by one.
 * 1st step 1D FHT by rows:
 *			- Shift Register for 8 points -> ... clk delay
 *			- Alligner
 * 			- Calculate 1D FHT for 8 points. -> ... clk delay
 *				- FF is used on the each input of the butterfly
 *				- FF is used on the input of the multiplier
 * 2nd Step:
 * Matrix Transpose -> 64+1 clk delay
 * 			- Collecting data until 1st buffer is full as 64 points.
 *			- Read 64 points right away after 1st buffer is full.
 *			- At the same time 2nd buffer is ready to receive data.
 * 			- Collecting data until 2nd buffer is full as 64 points.
 *			- Read 64 points right away after 2nd buffer is full.
 *			- At the same time 1st buffer is ready to receive data once again.
 *			- ...
 * 3rd Step 1D FHT by columns.
 * 			- Combine data to make 8 points in parallel. -> ... clk delay
 * 			- Calculate 1D FHT for 8 points. -> ... clk delay
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

// ----->>> Define Multiplier Type
//`define USE_ASIC_MULT
//`define USE_FPGA_MULT

// ----->>>  Define Memory Type
//`define USE_FPGA_SPSRAM
//`define USE_ASIC_SPSRAM

module fht_8x8_core (
	rstn,
	sclk,

	x_valid,
	x_data,

	fht_2d_valid,
	fht_2d_data
);
// Number of input bits
parameter N = 8;

input	rstn;
input	sclk;

input			x_valid;
input	[N-1:0] x_data;

output			fht_2d_valid;
output	[N+5:0]	fht_2d_data;

// +++--->>> One-Dimensional Fast Hartley Transform - 1st Stage
// Data input [N-1:0] = N bits
// 
wire			fht_1d_valid;
wire	[N+2:0]	fht_1d_data;

fht_1d_x8 #(N) u1_fht_1d_x8_1st(
	.rstn	(rstn),
	.sclk	(sclk),

	// input data
	.x_valid	(x_valid),
	.x_data		(x_data),
	
	// output data
	.fht_valid	(fht_1d_valid),
	.fht_data	(fht_1d_data)
);

// +++--->>> Matrix Transposition <<<---+++ \\
wire			mem_valid;
wire	[N+2:0]	mem_data;

mtx_trps_8x8_dpsram #(N+3) u2_mtx_ts (
	.rstn		(rstn),
	.sclk		(sclk),
	
	.inp_valid	(fht_1d_valid),
	.inp_data	(fht_1d_data),

	.mem_data	(mem_data),
	.mem_valid	(mem_valid)
);

// +++--->>> One-Dimensional Fast Hartley Transform - 2nd Stage
fht_1d_x8 #(N+3) u3_fht_1d_x8_2nd(
	.rstn	(rstn),
	.sclk	(sclk),

	// input data
	.x_valid	(mem_valid),
	.x_data		(mem_data),
	
	// output data
	.fht_valid	(fht_2d_valid),
	.fht_data	(fht_2d_data)
);

endmodule
/**********************************************************************
 * File  : fht_8x8_core.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 * Function: Fast Hartley Transform ButterFly Unit without input FF
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module fht_bfly_noFF(
	a,
	b,
	c,
	d
);

parameter N = 8;

input	[N-1:0]	a; // input
input	[N-1:0]	b; // input

output	[N  :0]	c; // additive output
output	[N  :0]	d; // subtractive output

assign c = rca_N(a,b);
assign d = rca_N(a,twos_complement(b));

// +--------------------------------------------------+ \\
// +----------- Function's Description Part ----------+ \\
// +--------------------------------------------------+ \\
// Full Adder
	function [1:0] full_adder;
	input a, b, ci;
	reg co, s;
	begin
		s  = (a ^ b ^ ci);
		co = (a & b) | (ci & (a ^ b));
		full_adder = {co,s};
	end
	endfunction

// Half Adder, i.e. without carry in
	function [1:0] half_adder;
	input a, b;
	reg co, s;
	begin
		s  = (a ^ b);
		co = (a & b);
		half_adder = {co,s};
	end
	endfunction

// Ripple Carry Adder - rca
// Input  vector = N     bits
// Output vector = N + 1 bits
	function [N:0] rca_N;

//	parameter N = 8;
	input [N-1:0] a;
	input [N-1:0] b;
	
	reg [N-1:0] co,sum;
		
		begin : RCA // RIPPLE CARRY ADDER
        	integer i;
        	//for (i = 0; i <= N; i = i + 1)
        	for (i = 0; i < N; i = i + 1)
            	if (i == 0)
					{co[i],sum[i]} = half_adder(a[i],b[i]);
				else
					{co[i],sum[i]} = full_adder(a[i],b[i],co[i-1]);

		rca_N[N-1:0] = sum;
		// MSB is a sign bit
		rca_N[N] = (a[N-1]==b[N-1]) ? co[N-1] : sum[N-1];
		end
	endfunction


	function [N-1:0] twos_complement;
	input [N-1:0] a;
  	reg [N-1:0] ainv;
  	reg [N:0] plus1;
	begin
		ainv  = ~a;
		plus1 = rca_N(ainv,{{N-1{1'b0}},1'b1});
	
		// pragma coverage block = off
		// synopsys translate_off
		// The only problem is absolute minumum negative value
		if (a == {1'b1, {N-1{1'b0}}})
			$display("--->>> 2's complement ERROR - absolute minimum negative value: %0b\n\t %m",a);
		// synopsys translate_on
		// pragma coverage block = on
		
		twos_complement = plus1[N-1:0];
	end
	endfunction

endmodule

// Update Log:
// 27 Jul. 2011
// added pragmas for coverage
/**********************************************************************
 * File  : fht_8x8_core.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 * Function: Fast Hartley Transform ButterFly Unit
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module fht_bfly(
	rstn,
	clk,
	valid,
	a,
	b,
	c,
	d
);

parameter N = 8;

input			rstn;
input			clk;

input			valid;

input	[N-1:0]	a; // input
input	[N-1:0]	b; // input

output	[N  :0]	c; // additive output
output	[N  :0]	d; // subtractive output

reg [N-1:0] a_FF;
always @(posedge clk)
if		(!rstn)	a_FF <= #1 0;
else if (valid)	a_FF <= #1 a;

reg [N-1:0] b_FF;
always @(posedge clk)
if		(!rstn) b_FF <= #1 0;
else if (valid)	b_FF <= #1 b;

assign c = rca_N(a_FF,b_FF);
assign d = rca_N(a_FF,twos_complement(b_FF));

// +--------------------------------------------------+ \\
// +----------- Function's Description Part ----------+ \\
// +--------------------------------------------------+ \\
// Full Adder
	function [1:0] full_adder;
	input a, b, ci;
	reg co, s;
	begin
		s  = (a ^ b ^ ci);
		co = (a & b) | (ci & (a ^ b));
		full_adder = {co,s};
	end
	endfunction

// Half Adder, i.e. without carry in
	function [1:0] half_adder;
	input a, b;
	reg co, s;
	begin
		s  = (a ^ b);
		co = (a & b);
		half_adder = {co,s};
	end
	endfunction

// Ripple Carry Adder - rca
// Input  vector = N     bits
// Output vector = N + 1 bits
	function [N:0] rca_N;

//	parameter N = 8;
	input [N-1:0] a;
	input [N-1:0] b;
	
	reg [N-1:0] co,sum;
		
		begin : RCA // RIPPLE_CARRY_ADDER
        	integer i;
        	//for (i = 0; i <= N; i = i + 1)
        	for (i = 0; i < N; i = i + 1)
            	if (i == 0)
					{co[i],sum[i]} = half_adder(a[i],b[i]);
				else
					{co[i],sum[i]} = full_adder(a[i],b[i],co[i-1]);

		rca_N[N-1:0] = sum;
		// MSB is a sign bit
		rca_N[N] = (a[N-1]==b[N-1]) ? co[N-1] : sum[N-1];
		end
	endfunction


	function [N-1:0] twos_complement;
	input [N-1:0] a;
  	reg [N-1:0] ainv;
  	reg [N:0] plus1;
	begin
		ainv  = ~a;
		plus1 = rca_N(ainv,{{N-1{1'b0}},1'b1});
	
		// pragma coverage block = off
		// synopsys translate_off
		// The only problem is absolute minumum negative value
		if (a == {1'b1, {N-1{1'b0}}})
			$display("--->>> 2's complement ERROR - absolute minimum negative value: %0b\n\t %m",a);
		// synopsys translate_on
		// pragma coverage block = on
		
		twos_complement = plus1[N-1:0];
	end
	endfunction

endmodule

// Update Log:
// 27 Jul. 2011
// added pragmas for coverage
/**********************************************************************
 * File  : mtx_trps_8x8_dpsram.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 *
 * Matrix Transpose 8x8
 * DPSRAM-based Double Buffer
 * Buffer size is 64*2 words, each word is 16 bits
 *
 * Matrix Transpose -> 64 clk delay
 *			- Double Buffer Solution:
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module mtx_trps_8x8_dpsram (
	rstn,
	sclk,
	
	// Input
	inp_valid,
	inp_data,
	
	// Output
	mem_data,
	mem_valid
);
parameter N = 8;

input			rstn;
input			sclk;

input			inp_valid;
input	[N-1:0]	inp_data;
	
output	[N-1:0]	mem_data;
output			mem_valid;

reg [6:0]	cnt128d_wr;				// Write Mode Counter
wire		indicator;				// 64 words written - Indication(pos. or neg. edge)
reg			indicator_1d;			// Indication 1 clock delay
wire		indicator_pos_edge;		// positive edge
wire		indicator_neg_edge;		// negative edge
reg	[6:0]	cnt128d_rd;				// Read Counter
wire		cnt128d_rd_valid_start;	// Counter start increment
wire		cnt128d_rd_valid_stop;	// Counter stop increment
reg			cnt128d_rd_valid;		// valid time for cnt128d_rd counter
reg			mem_valid;				// 1 clock delay after reading

// DPSRAM Memory Signal Description
wire [15:0] wr_DATA;
wire [ 6:0] wr_ADDR;
wire		wr_CSN;
wire		wr_WEN;

wire [ 6:0] rd_ADDR;
wire		rd_CSN;

`ifdef USE_FPGA_SPSRAM
	wire [15:0] rd_DATA;
	dpsram_128x16 u_dpsram(
		.addra	(wr_ADDR),
		.addrb	(rd_ADDR),
		.clka	(sclk),
		.clkb	(sclk),
		.dina	(wr_DATA),
		.dinb	({16{1'b0}}),
		.douta	(/* OPEN */),
		.doutb	(rd_DATA),
		.ena	(wr_CSN),
		.enb	(rd_CSN),
		.wea	(wr_WEN),
		.web	(1'b1)
	);
`endif

`ifdef USE_ASIC_SPSRAM
	reg [15:0] rd_DATA = 16'd0;
	reg	[15:0] sram[0:127];
	always @(posedge sclk)
		if (~wr_WEN && ~wr_CSN) sram[wr_ADDR] <= wr_DATA;	// Write
	always @(posedge sclk)
		if (  1'b1  && ~rd_CSN) rd_DATA <= sram[rd_ADDR];	// Read
`endif

always @(posedge sclk or negedge rstn)
if		(!rstn)		cnt128d_wr <= #1 0;
else if (inp_valid)	cnt128d_wr <= #1 cnt128d_wr + 1;

assign wr_DATA = {{16-N{1'b0}},inp_data};
assign wr_ADDR = cnt128d_wr;
assign wr_CSN  = ~inp_valid;
assign wr_WEN  = ~inp_valid;

// Start Reading After fisrt 64 words had been written
assign indicator = cnt128d_wr[6];
always @(posedge sclk or negedge rstn)
if	(!rstn)	indicator_1d <= #1 1'b0;
else		indicator_1d <= #1 indicator;

assign indicator_pos_edge =  indicator & ~indicator_1d;
assign indicator_neg_edge = ~indicator &  indicator_1d;

assign cnt128d_rd_valid_start = indicator_pos_edge | indicator_neg_edge;
assign cnt128d_rd_valid_stop  = (cnt128d_rd[5:0] == 63) ? 1'b1 : 1'b0;

always @(posedge sclk or negedge rstn)
if		(!rstn)					cnt128d_rd_valid <= #1 1'b0;
else if (cnt128d_rd_valid_start)cnt128d_rd_valid <= #1 1'b1;
else if (cnt128d_rd_valid_stop)	cnt128d_rd_valid <= #1 1'b0;

// Read Mode Counter
always @(posedge sclk or negedge rstn)
if		(!rstn)				cnt128d_rd <= #1 1'b0;
else if (cnt128d_rd_valid)	cnt128d_rd <= #1 cnt128d_rd + 1;

assign rd_ADDR = {cnt128d_rd[6],cnt128d_rd[2:0],cnt128d_rd[5:3]};
assign rd_CSN  = ~cnt128d_rd_valid;

// Output
always @(posedge sclk or negedge rstn)
if	(!rstn)	mem_valid <= #1 1'b0;
else		mem_valid <= #1 cnt128d_rd_valid;

assign #1 mem_data = rd_DATA[N-1:0];

// synopsys translate_off
// <<<------------- DUMP Section
/*
// 2D FHT OUTPUT DUMP DATA 
parameter MEM_TRPS_DPSRAM_FILE = "./result/mem_trps_dpsram.txt";
integer mem_trps_dpsram_dump;
initial mem_trps_dpsram_dump = $fopen(MEM_TRPS_DPSRAM_FILE);

always @(posedge sclk)
if (mem_valid) $fdisplay(mem_trps_dpsram_dump,"%h",mem_data);
*/
// synopsys translate_on
endmodule
/**********************************************************************
 * File  : signed_mult_const_asic.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 *
 * Function: Signed Multiplier - constant sqrt(2) = 1.41421
 * 1.41421*a = (256*1.41421)*a/256 = 362.03776*a/256 = 362*a/256
 * product = 362*a/2^8
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module signed_mult_const_asic (
	rstn,
	clk,
	valid,
	a,
	p
);

parameter		N = 8;
input			rstn;
input			clk;
input			valid;
input  [N-1:0] a; // variable - positive/negative
output [N  :0] p; // product output

// FHT constant
//wire [8:0] mult_constant; // always positive
//assign mult_constant = 9'd362;
parameter mult_constant = 9'd362;

reg [N-1:0] a_FF;
always @(posedge clk)
if		(!rstn) a_FF <= #1 0;
else if (valid)	a_FF <= #1 a;

// Convert into 2's complement if (a_FF) is negative
wire [N-1:0] b;
assign b = a_FF[N-1] ? {~a_FF[N-1:0] + {{N-1{1'b0}},1'b1} } : a_FF[N-1:0];

// Multiply 2 positive numbers 
// b[N-2:0] * mult_constant[8:0]
// output result mult_wo_sign
// N-2+1 - number of (b) bits
// 8+1   - number of mult_constant bits
// N-2+1+8+1 - number of bits on the output
// = N+8 = [N+7:0]
wire [N+7:0] mult_wo_sign; // mult without sign
assign mult_wo_sign = b[N-2:0]*mult_constant;

// Divided by 256 - [N+7-8:0] = [N-1:0]
wire [N-1:0] div256; // divided 256
assign div256 = mult_wo_sign >> 8;

assign p = a_FF[N-1] ? 
					{1'b1,{~div256[N-1:0] + {{N-1{1'b0}},1'b1}} } : 
					{1'b0,  div256[N-1:0]}
					;
endmodule

// Update Log:
// 27 Jul. 2011
// wire [8:0] mult_constant replaced by parameter
/**********************************************************************
 * File  : signed_mult_const_fpga.v
 * Author: Ivan Rezki
 * email : irezki@gmail.com
 * Topic : RTL Core
 * 		  2-Dimensional Fast Hartley Transform
 *
 *
 * Function: Signed Multiplier - constant sqrt(2) = 1.41421
 *
 * 8 bit accuracy:
 * 1.41421*a = (256*1.41421)*a/256 = 362.03776*a/256 = 362*a/256
 * product = 362*a/2^8
 * wire [8:0] mult_constant = 9'd362;
 *
 * 15 bit accuracy:
 * 1.41421*a = (32768*1.41421)*a/32768 = 46340.95*a/32768
 * product = 46341*a/2^15
 * wire [15:0] mult_constant = 16'd46341;
 *
 * 16 bit accuracy:
 * 1.41421*a = (65536*1.41421)*a/65536 = 92681*a/65536
 * product = 92681*a/2^16
 * wire [16:0] mult_constant = 17'd92681;
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 **********************************************************************/

module signed_mult_const_fpga (
	rstn,
	clk,
	valid,
	a,
	p
);

parameter		N = 8;
input			rstn;
input			clk;
input			valid;
input  signed [N-1:0] a; // variable - positive/negative
output signed [N  :0] p; // product output

// FHT constant
// wire [8:0] mult_constant; // always positive
// assign mult_constant = 9'd362;

//wire signed [17:0] mult_constant; // always positive
//assign mult_constant = {1'b0, 17'd92681};
parameter mult_constant = {1'b0, 17'd92681};

reg signed [N-1:0] a_FF;
always @(posedge clk)
if		(!rstn) a_FF <= #1 0;
else if (valid)	a_FF <= #1 a;

wire signed [(16+1)+N-1:0] p_tmp = $signed(a_FF) * $signed(mult_constant);

//assign p = p_tmp[(16+1)+N-1:16];// >> 16;
assign p = p_tmp >> 16;

endmodule

// Update Log:
// 27 Jul. 2011
// wire [17:0] mult_constant replaced by parameter
