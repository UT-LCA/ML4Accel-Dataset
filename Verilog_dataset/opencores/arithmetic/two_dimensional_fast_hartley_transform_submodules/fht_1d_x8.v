//`define USE_ASIC_MULT
//`define USE_FPGA_MULT
//`define USE_FPGA_SPSRAM
//`define USE_ASIC_SPSRAM

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
