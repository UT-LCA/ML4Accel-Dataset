//`define USE_ASIC_MULT
//`define USE_FPGA_MULT
//`define USE_FPGA_SPSRAM
//`define USE_ASIC_SPSRAM

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
