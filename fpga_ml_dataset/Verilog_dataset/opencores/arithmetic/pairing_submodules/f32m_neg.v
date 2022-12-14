`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define ZERO {(2*`M){1'b0}}
`define TWO {(2*`M-2){1'b0}},2'b10
`define MOST 2*`M+1:2*`M

module f32m_neg(a, c);
    input [`W2:0] a;
    output [`W2:0] c;
    f3m_neg
        n1 (a[`W2:`WIDTH+1], c[`W2:`WIDTH+1]),
        n2 (a[`WIDTH:0], c[`WIDTH:0]);
endmodule

module f3m_neg(a, c);
    input [`WIDTH:0] a;
    output [`WIDTH:0] c;
    genvar i;
    generate
        for(i=0;i<=`WIDTH;i=i+2)
          begin:label
            assign c[i+1:i] = {a[i],a[i+1]};
          end
    endgenerate
endmodule


