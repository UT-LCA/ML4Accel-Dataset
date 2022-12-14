`define BITS 32         // Bit width of the operands
`define NumPath 34     

module add_sub27(add, opa, opb, sum, co);
input		add;
input	[26:0]	opa, opb;
output	[26:0]	sum;
output		co;



assign {co, sum} = add ? ({1'b0, opa} + {1'b0, opb}) : ({1'b0, opa} - {1'b0, opb});

endmodule
