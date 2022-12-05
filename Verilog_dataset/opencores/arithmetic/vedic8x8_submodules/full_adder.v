
module full_adder(input a, b, cin, output sum, cout);

	wire sum1,carry1,carry2;
	half_adder HA0(a,b,sum1,carry1);
	half_adder HA1(cin,sum1,sum,carry2);

	assign cout = carry1 | carry2;

endmodule
module half_adder(input a,b, output sum, carry);

	assign sum = a ^ b;
	assign carry = a & b;

endmodule
