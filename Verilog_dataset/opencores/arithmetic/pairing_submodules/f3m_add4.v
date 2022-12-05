`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define ZERO {(2*`M){1'b0}}
`define TWO {(2*`M-2){1'b0}},2'b10
`define MOST 2*`M+1:2*`M

module f3m_add4(a0, a1, a2, a3, c);
    input [`WIDTH:0] a0,a1,a2,a3;
    output [`WIDTH:0] c;
    wire [`WIDTH:0] v1,v2;
    f3m_add
        ins1 (a0,a1,v1), // v1 == a0+a1
        ins2 (a2,a3,v2), // v2 == a2+a3
        ins3 (v1,v2,c);  // c == v1+v2 == a0+a1+a2+a3
endmodule
module f3m_add(A, B, C);
    input [`WIDTH : 0] A, B;
    output [`WIDTH : 0] C;
    genvar i;
    generate
        for(i=0; i<`M; i=i+1) begin: aa
            f3_add aa(A[(2*i+1) : 2*i], B[(2*i+1) : 2*i], C[(2*i+1) : 2*i]);
        end
    endgenerate
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
