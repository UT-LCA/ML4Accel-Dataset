`define BITS 32         // Bit width of the operands
`define NumPath 34     

module pre_norm_fmul(clk, fpu_op, opa, opb, fracta, fractb, exp_out, sign,
		sign_exe, inf, exp_ovf, underflow);
input		clk;
input	[2:0]	fpu_op;
input	[31:0]	opa, opb;
output	[23:0]	fracta, fractb;
output	[7:0]	exp_out;
output		sign, sign_exe;
output		inf;
output	[1:0]	exp_ovf;
output	[2:0]	underflow;

////////////////////////////////////////////////////////////////////////
//
// Local Wires and registers
//

reg	[7:0]	exp_out;
wire		signa, signb;
reg		sign, sign_d;
reg		sign_exe;
reg		inf;
wire	[1:0]	exp_ovf_d;
reg	[1:0]	exp_ovf;
wire	[7:0]	expa, expb;
wire	[7:0]	exp_tmp1, exp_tmp2;
wire		co1, co2;
wire		expa_dn, expb_dn;
wire	[7:0]	exp_out_a;
wire		opa_00, opb_00, fracta_00, fractb_00;
wire	[7:0]	exp_tmp3, exp_tmp4, exp_tmp5;
wire	[2:0]	underflow_d;
reg	[2:0]	underflow;
wire		op_div;
wire	[7:0]	exp_out_mul, exp_out_div;

assign op_div = (fpu_op == 3'b011);
////////////////////////////////////////////////////////////////////////
//
// Aliases
//
assign  signa = opa[31];
assign  signb = opb[31];
assign   expa = opa[30:23];
assign   expb = opb[30:23];

////////////////////////////////////////////////////////////////////////
//
// Calculate Exponenet
//

assign expa_dn   = !(|expa);
assign expb_dn   = !(|expb);
assign opa_00    = !(|opa[30:0]);
assign opb_00    = !(|opb[30:0]);
assign fracta_00 = !(|opa[22:0]);
assign fractb_00 = !(|opb[22:0]);

assign fracta[22:0] = opa[22:0];
assign fractb[22:0] = opb[22:0];
assign fracta[23:23] = !expa_dn;
assign fractb[23:23] = !expb_dn;
//assign fracta = {!expa_dn,opa[22:0]};	// Recover hidden bit
//assign fractb = {!expb_dn,opb[22:0]};	// Recover hidden bit

assign {co1,exp_tmp1} = op_div ? ({1'b0,expa[7:0]} - {1'b0,expb[7:0]}) : ({1'b0,expa[7:0]} + {1'b0,expb[7:0]});
assign {co2,exp_tmp2} = op_div ? ({co1,exp_tmp1} + 9'h07f) : ({co1,exp_tmp1} - 9'h07f);
assign exp_tmp3 = exp_tmp2 + 8'h01;
assign exp_tmp4 = 8'h7f - exp_tmp1;
assign exp_tmp5 = op_div ? (exp_tmp4+8'h01) : (exp_tmp4-8'h01);


always@(posedge clk)
	exp_out <= op_div ? exp_out_div : exp_out_mul;

assign exp_out_div = (expa_dn | expb_dn) ? (co2 ? exp_tmp5 : exp_tmp3 ) : co2 ? exp_tmp4 : exp_tmp2;
assign exp_out_mul = exp_ovf_d[1] ? exp_out_a : (expa_dn | expb_dn) ? exp_tmp3 : exp_tmp2;
assign exp_out_a   = (expa_dn | expb_dn) ? exp_tmp5 : exp_tmp4;
assign exp_ovf_d[0] = op_div ? (expa[7] & !expb[7]) : (co2 & expa[7] & expb[7]);
assign exp_ovf_d[1] = op_div ? co2                  : ((!expa[7] & !expb[7] & exp_tmp2[7]) | co2);

always @(posedge clk)
	exp_ovf <=   exp_ovf_d;

assign underflow_d[0] =	(exp_tmp1 < 8'h7f) & !co1 & !(opa_00 | opb_00 | expa_dn | expb_dn);
assign underflow_d[1] =	((expa[7] | expb[7]) & !opa_00 & !opb_00) |
			 (expa_dn & !fracta_00) | (expb_dn & !fractb_00);
assign underflow_d[2] =	 !opa_00 & !opb_00 & (exp_tmp1 == 8'h7f);

always @(posedge clk)
	underflow <= underflow_d;

always @(posedge clk)
	inf <= op_div ? (expb_dn & !expa[7]) : ({co1,exp_tmp1} > 9'h17e) ;


////////////////////////////////////////////////////////////////////////
//
// Determine sign for the output
//

// sign: 0=Posetive Number; 1=Negative Number
always @(signa or signb)
   case({signa, signb})		// synopsys full_case parallel_case
	2'b00: sign_d = 0;
	2'b01: sign_d = 1;
	2'b10: sign_d = 1;
	2'b11: sign_d = 0;
   endcase

always @(posedge clk)
	sign <= sign_d;

always @(posedge clk)
	sign_exe <= signa & signb;

endmodule
