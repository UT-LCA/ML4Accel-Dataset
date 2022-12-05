
module vedic2x2(input [1:0] a,b, output [3:0] prod);

	wire a1b1 = a[1] & b[1];
	wire a0b1 = a[0] & b[1];
	wire a1b0 = a[1] & b[0];
	wire a0b0 = a[0] & b[0];
	wire carry;
	
	assign prod[0] = a0b0;

	half_adder HA0(a0b1,a1b0,prod[1],carry);
	half_adder HA1(a1b1,carry,prod[2],prod[3]);

endmodule

module half_adder(input a,b, output sum, carry);

	assign sum = a ^ b;
	assign carry = a & b;

endmodule


