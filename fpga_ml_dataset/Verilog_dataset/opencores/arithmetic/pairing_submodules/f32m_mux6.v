`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define ZERO {(2*`M){1'b0}}
`define TWO {(2*`M-2){1'b0}},2'b10
`define MOST 2*`M+1:2*`M

module f32m_mux6(v0, v1, v2, v3, v4, v5, l0, l1, l2, l3, l4, l5, out);
    input l0, l1, l2, l3, l4, l5;
    input [`W2:0] v0, v1, v2, v3, v4, v5;
    output [`W2:0] out;
    f3m_mux6
        ins1 (v0[`WIDTH:0], v1[`WIDTH:0], v2[`WIDTH:0], 
              v3[`WIDTH:0], v4[`WIDTH:0], v5[`WIDTH:0], 
              l0, l1, l2, l3, l4, l5,
              out[`WIDTH:0]),
        ins2 (v0[`W2:`WIDTH+1], v1[`W2:`WIDTH+1], v2[`W2:`WIDTH+1], 
              v3[`W2:`WIDTH+1], v4[`W2:`WIDTH+1], v5[`W2:`WIDTH+1], 
              l0, l1, l2, l3, l4, l5,
              out[`W2:`WIDTH+1]);
endmodule

module f3m_mux6(v0, v1, v2, v3, v4, v5, l0, l1, l2, l3, l4, l5, out);
    input l0, l1, l2, l3, l4, l5;
    input [`WIDTH:0] v0, v1, v2, v3, v4, v5;
    output [`WIDTH:0] out;
    genvar i;
    generate
        for(i=0;i<=`WIDTH;i=i+1)
          begin : label
            assign out[i] = (v0[i]&l0)|(v1[i]&l1)|(v2[i]&l2)|(v3[i]&l3)|(v4[i]&l4)|(v5[i]&l5);
          end 
    endgenerate
endmodule


