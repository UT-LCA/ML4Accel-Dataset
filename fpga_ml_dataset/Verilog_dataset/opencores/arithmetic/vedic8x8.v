module vedic8x8(input [7:0] a,b, output [15:0] prod);

	wire [7:0] mult0, mult1, mult2, mult3;
	wire [7:0] sum0;
	wire [11:0] sum1, sum2;
	wire carry0, carry2, carry3;

	vedic4x4 VD0(a[3:0],b[3:0],mult0);
	vedic4x4 VD1(a[3:0],b[7:4],mult1);
	vedic4x4 VD2(a[7:4],b[3:0],mult2);
	vedic4x4 VD3(a[7:4],b[7:4],mult3);

	ripple_adder_8bit RA0({4'b0,mult0[7:4]},mult2,1'b0,sum0,carry0);
	ripple_adder_12bit RA1({4'b0,mult1},{mult3,4'b0},1'b0,sum1,carry1);
	ripple_adder_12bit RA2({4'b0,sum0},sum1,1'b0,sum2,carry2);

	assign prod = {sum2,mult0[3:0]};

endmodule

module vedic4x4(input [3:0] a,b, output [7:0] prod);

	wire [3:0] mult0, mult1, mult2, mult3;
	wire [3:0] sum0;
	wire [5:0] sum1, sum2;
	wire carry0, carry1, carry2;

	vedic2x2 VD0(a[1:0],b[1:0],mult0);
	vedic2x2 VD1(a[1:0],b[3:2],mult1);
	vedic2x2 VD2(a[3:2],b[1:0],mult2);
	vedic2x2 VD3(a[3:2],b[3:2],mult3);

	ripple_adder_4bit RA0({2'b0,mult0[3:2]},mult2,1'b0,sum0,carry0);
	ripple_adder_6bit RA1({2'b0,mult1},{mult3,2'b0},1'b0,sum1,carry1);
	ripple_adder_6bit RA2({2'b0,sum0},sum1,1'b0,sum2,carry2);
	
	assign prod = {sum2,mult0[1:0]};

endmodule

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

module ripple_adder_12bit(input [11:0] a,b, input cin, output [11:0] sum, output cout);

	wire carry;

	ripple_adder_6bit RA0(a[5:0],b[5:0],cin,sum[5:0],carry);
	ripple_adder_6bit RA1(a[11:6],b[11:6],carry,sum[11:6],cout);

endmodule

module ripple_adder_8bit(input [7:0] a,b, input cin, output [7:0] sum, output cout);

	wire carry;

	ripple_adder_4bit RA0(a[3:0],b[3:0],cin,sum[3:0],carry);
	ripple_adder_4bit RA1(a[7:4],b[7:4],carry,sum[7:4],cout);

endmodule

module ripple_adder_6bit(input [5:0] a,b, input cin, output [5:0] sum, output cout);

	wire carry1, carry2, carry3, carry4, carry5;

	full_adder FA0(a[0],b[0],cin,sum[0],carry1);
	full_adder FA1(a[1],b[1],carry1,sum[1],carry2);
	full_adder FA2(a[2],b[2],carry2,sum[2],carry3);
	full_adder FA3(a[3],b[3],carry3,sum[3],carry4);
	full_adder FA4(a[4],b[4],carry4,sum[4],carry5);
	full_adder FA5(a[5],b[5],carry5,sum[5],cout);

endmodule

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


