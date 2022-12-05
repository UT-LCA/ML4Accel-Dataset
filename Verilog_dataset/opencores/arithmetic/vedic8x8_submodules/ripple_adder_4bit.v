
module ripple_adder_4bit(input [3:0] a,b, input cin, output [3:0] sum, output cout);

	wire carry1, carry2, carry3;
	full_adder FA0(a[0],b[0],cin,sum[0],carry1);
	full_adder FA1(a[1],b[1],carry1,sum[1],carry2);
	full_adder FA2(a[2],b[2],carry2,sum[2],carry3);
	full_adder FA3(a[3],b[3],carry3,sum[3],cout);

endmodule

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


