`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define ZERO {(2*`M){1'b0}}
`define TWO {(2*`M-2){1'b0}},2'b10
`define MOST 2*`M+1:2*`M

module f3_add1(a, c);
    input [1:0] a;
    output [1:0] c;
    assign c[0] = (~a[0]) & (~a[1]);
    assign c[1] = a[0] & (~a[1]);
endmodule
