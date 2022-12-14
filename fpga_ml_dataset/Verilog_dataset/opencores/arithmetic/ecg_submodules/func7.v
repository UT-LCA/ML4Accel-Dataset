`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define SCALAR_WIDTH (151-1) // the width for the scalar value
`define MOST 2*`M+1:2*`M

module func7(input wire [193:0] in, output wire [193:0] out);
    assign out[5:0] = in[193:188];
    assign out[23:6] = in[17:0];
    wire [1:0] w0;
    f3_add a0(in[19:18], {in[188],in[189]}, w0);
    assign out[25:24] = w0;
    wire [1:0] w1;
    f3_add a1(in[21:20], {in[190],in[191]}, w1);
    assign out[27:26] = w1;
    wire [1:0] w2;
    f3_add a2(in[23:22], {in[192],in[193]}, w2);
    assign out[29:28] = w2;
    assign out[193:30] = in[187:24];
endmodule

module f3_add(A, B, C);
    input [1:0] A, B;
    output [1:0] C;
    wire a0, a1, b0, b1, c0, c1;
    assign {a1, a0} = A;
    assign {b1, b0} = B;
    assign C = {c1, c0};
    assign c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
    assign c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
endmodule


