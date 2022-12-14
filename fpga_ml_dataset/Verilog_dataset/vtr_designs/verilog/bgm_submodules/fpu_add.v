`define BITS 32         // Bit width of the operands
`define NumPath 34     

module fpu_add( clk, 
//rmode, 
opa, opb, out,
control 
//inf, snan, qnan, ine, overflow, underflow, zero, div_by_zero
);
	input		clk;
	//input	[1:0]	rmode;
	//input	[2:0]	fpu_op;
	input	[31:0]	opa, opb;
	output	[31:0]	out;
	/*
	output		inf, snan, qnan;
	output		ine;
	output		overflow, underflow;
	output		zero;
	output		div_by_zero;
	*/
	output [7:0] control;
	/*
	parameter	INF  = 31'h7f800000;
	parameter	QNAN = 31'h7fc00001;
	parameter	 SNAN = 31'h7f800001;

	*/

	wire [30:0]	INF;
	assign INF = 31'h7f800000;
	wire [30:0]	QNAN; 
	assign QNAN = 31'h7fc00001;
	wire [30:0] SNAN;
	assign SNAN = 31'h7f800001;

	////////////////////////////////////////////////////////////////////////
	//
	// Local Wires
	//
	reg	[2:0]	fpu_op;
	reg		zero;
	reg	[31:0]	opa_r, opb_r;		// Input operand registers
	reg	[31:0]	out;			// Output register
	reg		div_by_zero;		// Divide by zero output register
	// wire		signa, signb;		// alias to opX sign
	wire		sign_fasu;		// sign output
	wire	[26:0]	fracta, fractb;		// Fraction Outputs from EQU block
	wire	[7:0]	exp_fasu;		// Exponent output from EQU block
	reg	[7:0]	exp_r;			// Exponent output (registerd)
	wire	[26:0]	fract_out_d;		// fraction output
	// wire		co;			// carry output
	reg	[27:0]	fract_out_q;		// fraction output (registerd)
	wire	[30:0]	out_d;			// Intermediate final result output
	wire		overflow_d, underflow_d;// Overflow/Underflow Indicators
	reg		overflow, underflow;	// Output registers for Overflow & Underflow
	reg		inf, snan, qnan;	// Output Registers for INF, SNAN and QNAN
	reg		ine;			// Output Registers for INE
	reg	[1:0]	rmode_r1, rmode_r2, 	// Pipeline registers for rounding mode
			rmode_r3;
	reg	[2:0]	fpu_op_r1, fpu_op_r2,	// Pipeline registers for fp opration
			fpu_op_r3;
	// wire		mul_inf, div_inf;
	// wire		mul_00, div_00;


	// start output_reg
	reg	[31:0]	out_o1;
	reg		inf_o1, snan_o1, qnan_o1;
	reg		ine_o1;
	reg		overflow_o1, underflow_o1;
	reg		zero_o1;
	reg		div_by_zero_o1;
	// end output_reg
	wire [7:0] contorl;
	assign control = {inf, snan, qnan, ine, overflow, underflow, zero, div_by_zero};
	wire	[1:0]	rmode;
	assign rmode= 2'b00;


	always@(posedge clk)
	begin
	 fpu_op[2:0] <= 3'b000;
	end
	////////////////////////////////////////////////////////////////////////
	//
	// Input Registers
	//

	always @(posedge clk)
		opa_r <=  opa;

	always @(posedge clk)
		opb_r <=  opb;

	always @(posedge clk)
		rmode_r1 <=  rmode;

	always @(posedge clk)
		rmode_r2 <=  rmode_r1;

	always @(posedge clk)
		rmode_r3 <=  rmode_r2;

	always @(posedge clk)
		fpu_op_r1 <=  fpu_op;

	always @(posedge clk)
		fpu_op_r2 <=  fpu_op_r1;

	always @(posedge clk)
		fpu_op_r3 <=  fpu_op_r2;

	////////////////////////////////////////////////////////////////////////
	//
	// Exceptions block
	//
	wire		inf_d, ind_d, qnan_d, snan_d, opa_nan, opb_nan;
	wire		opa_00, opb_00;
	wire		opa_inf, opb_inf;
	wire		opa_dn, opb_dn;

	except u0(	.clk(clk),
			.opa(opa_r), .opb(opb_r),
			.inf(inf_d), .ind(ind_d),
			.qnan(qnan_d), .snan(snan_d),
			.opa_nan(opa_nan), .opb_nan(opb_nan),
			.opa_00(opa_00), .opb_00(opb_00),
			.opa_inf(opa_inf), .opb_inf(opb_inf),
			.opa_dn(opa_dn), .opb_dn(opb_dn)
			);

	////////////////////////////////////////////////////////////////////////
	//
	// Pre-Normalize block
	// - Adjusts the numbers to equal exponents and sorts them
	// - determine result sign
	// - determine actual operation to perform (add or sub)
	//

	wire		nan_sign_d, result_zero_sign_d;
	reg		sign_fasu_r;
	wire fasu_op;

	wire add_input;
	assign add_input=!fpu_op_r1[0];
	pre_norm u1(.clk(clk),				// System Clock
		.rmode(rmode_r2),			// Roundin Mode
	//	.add(!fpu_op_r1[0]),			// Add/Sub Input
		.add(add_input),
		.opa(opa_r),  .opb(opb_r),		// Registered OP Inputs
		.opa_nan(opa_nan),			// OpA is a NAN indicator
		.opb_nan(opb_nan),			// OpB is a NAN indicator
		.fracta_out(fracta),			// Equalized and sorted fraction
		.fractb_out(fractb),			// outputs (Registered)
		.exp_dn_out(exp_fasu),			// Selected exponent output (registered);
		.sign(sign_fasu),			// Encoded output Sign (registered)
		.nan_sign(nan_sign_d),			// Output Sign for NANs (registered)
		.result_zero_sign(result_zero_sign_d),	// Output Sign for zero result (registered)
		.fasu_op(fasu_op)			// Actual fasu operation output (registered)
		);

	always @(posedge clk)
		sign_fasu_r <=   sign_fasu;

	wire co_d;
	////////////////////////////////////////////////////////////////////////
	//
	// Add/Sub
	//

	add_sub27 u3(
		.add(fasu_op),			// Add/Sub
		.opa(fracta),			// Fraction A input
		.opb(fractb),			// Fraction B Input
		.sum(fract_out_d),		// SUM output
		.co(co_d) );			// Carry Output

	always @(posedge clk)
		fract_out_q <=   {co_d, fract_out_d};


	////////////////////////////////////////////////////////////////////////
	//
	// Normalize Result
	//
	wire		ine_d;
	//reg	[47:0]	fract_denorm;
	wire	[47:0]	fract_denorm;

	wire		sign_d;
	reg		sign;
	reg	[30:0]	opa_r1;
	reg	[47:0]	fract_i2f;
	reg		opas_r1, opas_r2;
	wire		f2i_out_sign;

	always @(posedge clk)			// Exponent must be once cycle delayed
		  exp_r <=   exp_fasu;


	always @(posedge clk)
		opa_r1 <=   opa_r[30:0];

	//always @(fpu_op_r3 or fract_out_q)
	assign   fract_denorm = {fract_out_q, 20'h0};


	always @(posedge clk)
		opas_r1 <=   opa_r[31];

	always @(posedge clk)
		opas_r2 <=   opas_r1;

	assign sign_d = sign_fasu;

	always @(posedge clk)
		sign <=   (rmode_r2==2'h3) ? !sign_d : sign_d;

	post_norm u4(
	//.clk(clk),			// System Clock
		.fpu_op(fpu_op_r3),		// Floating Point Operation
		.opas(opas_r2),			// OPA Sign
		.sign(sign),			// Sign of the result
		.rmode(rmode_r3),		// Rounding mode
		.fract_in(fract_denorm),	// Fraction Input
		.exp_in(exp_r),			// Exponent Input
		.exp_ovf(2'b00),		// Exponent Overflow
		.opa_dn(opa_dn),		// Operand A Denormalized
		.opb_dn(opb_dn),		// Operand A Denormalized
		.rem_00(1'b0),		// Diveide Remainder is zero
		.div_opa_ldz(5'b00000),	// Divide opa leading zeros count
		.output_zero(1'b0),	// Force output to Zero
		.out(out_d),			// Normalized output (un-registered)
		.ine(ine_d),			// Result Inexact output (un-registered)
		.overflow(overflow_d),		// Overflow output (un-registered)
		.underflow(underflow_d),	// Underflow output (un-registered)
		.f2i_out_sign(f2i_out_sign)	// F2I Output Sign
		);

	////////////////////////////////////////////////////////////////////////
	//
	// FPU Outputs
	//
	reg		fasu_op_r1, fasu_op_r2;
	wire	[30:0]	out_fixed;
	wire		output_zero_fasu;
	wire		overflow_fasu;
	wire		out_d_00;
	wire		ine_fasu;
	wire		underflow_fasu;
	reg		opa_nan_r;


	always @(posedge clk)
		fasu_op_r1 <=   fasu_op;

	always @(posedge clk)
		fasu_op_r2 <=   fasu_op_r1;


	// Force pre-set values for non numerical output

	assign out_fixed = (	(qnan_d | snan_d) |
				(ind_d & !fasu_op_r2) )  ? QNAN : INF;

	always @(posedge clk)
		out_o1[30:0] <=   (inf_d | snan_d | qnan_d) ? out_fixed : out_d;
	  

	assign out_d_00 = !(|out_d);

	always @(posedge clk)
		out_o1[31] <=  	(snan_d | qnan_d | ind_d) ?			nan_sign_d :
						output_zero_fasu ?	result_zero_sign_d :
						sign_fasu_r;

	assign ine_fasu = (ine_d | overflow_d | underflow_d) & !(snan_d | qnan_d | inf_d);

	always @(posedge  clk)
		ine_o1 <=    ine_fasu ;


	assign overflow_fasu = overflow_d & !(snan_d | qnan_d | inf_d);

	always @(posedge clk)
		overflow_o1 <=  	  overflow_fasu ;

	assign underflow_fasu = underflow_d & !(inf_d | snan_d | qnan_d);

	always @(posedge clk)
		underflow_o1 <=    underflow_fasu ;

	always @(posedge clk)
		snan_o1 <=   snan_d;



	// Status Outputs
	always @(posedge clk)
		qnan_o1 <=  	( snan_d | qnan_d | (ind_d & !fasu_op_r2) );

	always @(posedge clk)
		inf_o1 <=   (!(qnan_d | snan_d) & (( (&out_d[30:23]) & !(|out_d[22:0] ) ) |  (inf_d & !(ind_d & !fasu_op_r2) & !fpu_op_r3[1]) ));

	assign output_zero_fasu = out_d_00 & !(inf_d | snan_d | qnan_d);

	always @(posedge clk)
		zero_o1 <=  	output_zero_fasu ;

	always @(posedge clk)
		opa_nan_r <=   !opa_nan & fpu_op_r2==3'b011;

	always @(posedge clk)
		div_by_zero_o1 <=   1'b0;

	// output register
	always @(posedge clk)
	begin
		qnan <=   qnan_o1;
		out <=   out_o1;
		inf <=   inf_o1; 
		snan <=   snan_o1;
		//qnan <=   qnan_o1;
		ine <=   ine_o1;
		overflow <=   overflow_o1;
		underflow <=   underflow_o1;
		zero <=   zero_o1;
		div_by_zero <=   div_by_zero_o1;
	end

endmodule
module post_norm( fpu_op, opas, sign, rmode, fract_in, exp_in, exp_ovf,
		opa_dn, opb_dn, rem_00, div_opa_ldz, output_zero, out,
		ine, overflow, underflow, f2i_out_sign);
	input	[2:0]	fpu_op;
	input		opas;
	input		sign;
	input	[1:0]	rmode;
	input	[47:0]	fract_in;
	input	[7:0]	exp_in;
	input	[1:0]	exp_ovf;
	input		opa_dn, opb_dn;
	input		rem_00;
	input	[4:0]	div_opa_ldz;
	input		output_zero;
	output	[30:0]	out;
	output		ine;
	output		overflow, underflow;
	output		f2i_out_sign;

	////////////////////////////////////////////////////////////////////////
	//
	// Local Wires and registers
	//

	wire	[22:0]	fract_out;
	wire	[7:0]	exp_out;
	wire	[30:0]	out;
	wire		exp_out1_co, overflow, underflow;
	wire	[22:0]	fract_out_final;
	reg	[22:0]	fract_out_rnd;
	wire	[8:0]	exp_next_mi;
	wire		dn;
	wire		exp_rnd_adj;
	wire	[7:0]	exp_out_final;
	reg	[7:0]	exp_out_rnd;
	wire		op_dn;

	wire		op_mul;
	wire		op_div;
	wire		op_i2f;
	wire		op_f2i;


	//reg	[5:0]	fi_ldz;
	wire	[5:0]	fi_ldz;

	wire		g, r, s;
	wire		round, round2, round2a, round2_fasu, round2_fmul;
	wire	[7:0]	exp_out_rnd0, exp_out_rnd1, exp_out_rnd2, exp_out_rnd2a;
	wire	[22:0]	fract_out_rnd0, fract_out_rnd1, fract_out_rnd2, fract_out_rnd2a;
	wire		exp_rnd_adj0, exp_rnd_adj2a;
	wire		r_sign;
	wire		ovf0, ovf1;
	wire	[23:0]	fract_out_pl1;
	wire	[7:0]	exp_out_pl1, exp_out_mi1;
	wire		exp_out_00, exp_out_fe, exp_out_ff, exp_in_00, exp_in_ff;
	wire		exp_out_final_ff, fract_out_7fffff;
	wire	[24:0]	fract_trunc;
	wire	[7:0]	exp_out1;
	wire		grs_sel;
	wire		fract_out_00, fract_in_00;
	wire		shft_co;
	wire	[8:0]	exp_in_pl1, exp_in_mi1;
	wire	[47:0]	fract_in_shftr;
	wire	[47:0]	fract_in_shftl;

	// for block shifter
	wire	[47:0]	fract_in_shftr_1;
	wire	[47:0]	fract_in_shftl_1;
	// end for block shifter

	wire	[7:0]	exp_div;
	wire	[7:0]	shft2;
	wire	[7:0]	exp_out1_mi1;
	wire		div_dn;
	wire		div_nr;
	wire		grs_sel_div;

	wire		div_inf;
	wire	[6:0]	fi_ldz_2a;
	wire	[7:0]	fi_ldz_2;
	wire	[7:0]	div_shft1, div_shft2, div_shft3, div_shft4;
	wire		div_shft1_co;
	wire	[8:0]	div_exp1;
	wire	[7:0]	div_exp2, div_exp3;
	wire		left_right, lr_mul, lr_div;
	wire	[7:0]	shift_right, shftr_mul, shftr_div;
	wire	[7:0]	shift_left,  shftl_mul, shftl_div;
	wire	[7:0]	fasu_shift;
	wire	[7:0]	exp_fix_div;

	wire	[7:0]	exp_fix_diva, exp_fix_divb;
	wire	[5:0]	fi_ldz_mi1;
	wire	[5:0]	fi_ldz_mi22;
	wire		exp_zero;
	wire	[6:0]	ldz_all;
	wire	[7:0]	ldz_dif;

	wire	[8:0]	div_scht1a;
	wire	[7:0]	f2i_shft;
	wire	[55:0]	exp_f2i_1;
	wire		f2i_zero, f2i_max;
	wire	[7:0]	f2i_emin;
	wire	[7:0]	conv_shft;
	wire	[7:0]	exp_i2f, exp_f2i, conv_exp;
	wire		round2_f2i;


	assign		op_mul = fpu_op[2:0]==3'b010;
	assign		op_div = fpu_op[2:0]==3'b011;
	assign		op_i2f = fpu_op[2:0]==3'b100;
	assign		op_f2i = fpu_op[2:0]==3'b101;
	assign		op_dn = opa_dn | opb_dn;

	pri_encoder u6(
		.fract_in (fract_in),
		.fi_ldz (fi_ldz)
	);

	// ---------------------------------------------------------------------
	// Normalize

	wire		exp_in_80;
	wire		rmode_00, rmode_01, rmode_10, rmode_11;

	// Misc common signals
	assign exp_in_ff        = &exp_in;
	assign exp_in_00        = !(|exp_in);
	assign exp_in_80	= exp_in[7] & !(|exp_in[6:0]);
	assign exp_out_ff       = &exp_out;
	assign exp_out_00       = !(|exp_out);
	assign exp_out_fe       = &exp_out[7:1] & !exp_out[0];
	assign exp_out_final_ff = &exp_out_final;

	assign fract_out_7fffff = &fract_out;
	assign fract_out_00     = !(|fract_out);
	assign fract_in_00      = !(|fract_in);

	assign rmode_00 = (rmode==2'b00);
	assign rmode_01 = (rmode==2'b01);
	assign rmode_10 = (rmode==2'b10);
	assign rmode_11 = (rmode==2'b11);

	// Fasu Output will be denormalized ...
	assign dn = !op_mul & !op_div & (exp_in_00 | (exp_next_mi[8] & !fract_in[47]) );

	// ---------------------------------------------------------------------
	// Fraction Normalization
	wire[7:0] f2i_emax;
	assign f2i_emax = 8'h9d;
	//parameter	f2i_emax = 8'h9d;

	// Incremented fraction for rounding
	assign fract_out_pl1 = {1'b0, fract_out} + 24'h000001;

	// Special Signals for f2i
	assign f2i_emin = rmode_00 ? 8'h7e : 8'h7f;
	assign f2i_zero = (!opas & (exp_in<f2i_emin)) | (opas & (exp_in>f2i_emax)) | (opas & (exp_in<f2i_emin) & (fract_in_00 | !rmode_11));
	assign f2i_max = (!opas & (exp_in>f2i_emax)) | (opas & (exp_in<f2i_emin) & !fract_in_00 & rmode_11);

	// Calculate various shifting options

	assign {shft_co,shftr_mul} = (!exp_ovf[1] & exp_in_00) ? {1'b0, exp_out} : exp_in_mi1 ;
	assign {div_shft1_co, div_shft1} = exp_in_00 ? {1'b0, div_opa_ldz} : div_scht1a;
	assign div_scht1a = {1'b0, exp_in}-{4'b0, div_opa_ldz}; // 9 bits - includes carry out
	assign div_shft2  = exp_in+8'h02;
	assign div_shft3  = {3'b0, div_opa_ldz}+exp_in;
	assign div_shft4  = {3'b0, div_opa_ldz}-exp_in;

	assign div_dn    = op_dn & div_shft1_co;
	assign div_nr    = op_dn & exp_ovf[1]  & !(|fract_in[46:23]) & (div_shft3>8'h16);

	assign f2i_shft  = exp_in-8'h7d;

	// Select shifting direction
	assign left_right = op_div ? lr_div : op_mul ? lr_mul :1'b1;

	assign lr_div = 	(op_dn & !exp_ovf[1] & exp_ovf[0])     ? 1'b1 :
				(op_dn & exp_ovf[1])                   ? 1'b0 :
				(op_dn & div_shft1_co)                 ? 1'b0 :
				(op_dn & exp_out_00)                   ? 1'b1 :
				(!op_dn & exp_out_00 & !exp_ovf[1])    ? 1'b1 :
				exp_ovf[1]                             ? 1'b0 :
					                                 1'b1;
	assign lr_mul = 	(shft_co | (!exp_ovf[1] & exp_in_00) |
				(!exp_ovf[1] & !exp_in_00 & (exp_out1_co | exp_out_00) )) ? 	1'b1 :
				( exp_ovf[1] | exp_in_00 ) ?					1'b0 :
												1'b1;

	// Select Left and Right shift value
	assign fasu_shift  = (dn | exp_out_00) ? (exp_in_00 ? 8'h02 : exp_in_pl1[7:0]) : {2'h0, fi_ldz};
	assign shift_right = op_div ? shftr_div : shftr_mul;

	assign conv_shft = op_f2i ? f2i_shft : {2'h0, fi_ldz};

	assign shift_left  = op_div ? shftl_div : op_mul ? shftl_mul : (op_f2i | op_i2f) ? conv_shft : fasu_shift;

	assign shftl_mul = 	(shft_co |
				(!exp_ovf[1] & exp_in_00) |
				(!exp_ovf[1] & !exp_in_00 & (exp_out1_co | exp_out_00))) ? exp_in_pl1[7:0] : {2'h0, fi_ldz};

	assign shftl_div = 	( op_dn & exp_out_00 & !(!exp_ovf[1] & exp_ovf[0]))	? div_shft1[7:0] :
				(!op_dn & exp_out_00 & !exp_ovf[1])    			? exp_in[7:0] :
					                                		 {2'h0, fi_ldz};
	assign shftr_div = 	(op_dn & exp_ovf[1])                   ? div_shft3 :
				(op_dn & div_shft1_co)                 ? div_shft4 : div_shft2;
	// Do the actual shifting
	//assign fract_in_shftr   = (|shift_right[7:6])                      ? 0 : fract_in>>shift_right[5:0];
	//assign fract_in_shftl   = (|shift_left[7:6] | (f2i_zero & op_f2i)) ? 0 : fract_in<<shift_left[5:0];

	b_right_shifter u1(
		.shift_in (fract_in),
		.shift_value (shift_right[5:0]),
		.shift_out (fract_in_shftr_1)
	);

	assign fract_in_shftr   = (|shift_right[7:6]) ? 48'b0 : fract_in_shftr_1; // fract_in>>shift_right[5:0];


	b_left_shifter u7(
		.shift_in (fract_in),
		.shift_value (shift_left[5:0]),
		.shift_out (fract_in_shftl_1)
	);

	assign fract_in_shftl   = (|shift_left[7:6] | (f2i_zero & op_f2i)) ? 48'b0 : fract_in_shftl_1; // fract_in<<shift_left[5:0];


	// Chose final fraction output
	assign {fract_out,fract_trunc} = left_right ? fract_in_shftl : fract_in_shftr;

	// ---------------------------------------------------------------------
	// Exponent Normalization

	assign fi_ldz_mi1    = fi_ldz - 6'h01;
	assign fi_ldz_mi22   = fi_ldz - 6'd22;
	assign exp_out_pl1   = exp_out + 8'h01;
	assign exp_out_mi1   = exp_out - 8'h01;
	assign exp_in_pl1    = {1'b0, exp_in}  + 9'd1;	// 9 bits - includes carry out
	assign exp_in_mi1    = {1'b0, exp_in}  - 9'd1;	// 9 bits - includes carry out
	assign exp_out1_mi1  = exp_out1 - 8'h01;

	assign exp_next_mi  = exp_in_pl1 - {3'b0, fi_ldz_mi1};	// 9 bits - includes carry out

	assign exp_fix_diva = exp_in - {2'b0, fi_ldz_mi22};
	assign exp_fix_divb = exp_in - {2'b0, fi_ldz_mi1};

	//assign exp_zero  = (exp_ovf[1] & !exp_ovf[0] & op_mul & (!exp_rnd_adj2a | !rmode[1])) | (op_mul & exp_out1_co);
	assign exp_zero  = (exp_ovf[1] & !exp_ovf[0] & op_mul ) | (op_mul & exp_out1_co);

	assign {exp_out1_co, exp_out1} = fract_in[47] ? exp_in_pl1 : exp_next_mi;

	assign f2i_out_sign =  !opas ? ((exp_in<f2i_emin) ? 1'b0 : (exp_in>f2i_emax) ? 1'b0 : opas) :
				       ((exp_in<f2i_emin) ? 1'b0 : (exp_in>f2i_emax) ? 1'b1 : opas);

	assign exp_i2f   = fract_in_00 ? (opas ? 8'h9e : 8'h00) : (8'h9e-{2'b0, fi_ldz});

	//assign exp_f2i_1 = {{8{fract_in[47]}}, fract_in }<<f2i_shft;
	b_left_shifter_new u3(
		.shift_in ({{8{fract_in[47]}}, fract_in }),
		.shift_value (f2i_shft[5:0]),
		.shift_out (exp_f2i_1)
	);

	assign exp_f2i   = f2i_zero ? 8'h00 : f2i_max ? 8'hff : exp_f2i_1[55:48];
	assign conv_exp  = op_f2i ? exp_f2i : exp_i2f;

	assign exp_out = op_div ? exp_div : (op_f2i | op_i2f) ? conv_exp : exp_zero ? 8'h0 : dn ? {6'h0, fract_in[47:46]} : exp_out1;

	assign ldz_all   = {2'b0, div_opa_ldz} + {1'b0, fi_ldz};
	assign ldz_dif   = fi_ldz_2 - {3'b0, div_opa_ldz};
	assign fi_ldz_2a = 7'd23 - {1'b0,fi_ldz};
	assign fi_ldz_2  = {fi_ldz_2a[6], fi_ldz_2a[6:0]};

	assign div_exp1  = exp_in_mi1 + {1'b0, fi_ldz_2};	// 9 bits - includes carry out

	assign div_exp2  = exp_in_pl1[7:0] - {1'b0, ldz_all};
	assign div_exp3  = exp_in + ldz_dif;

	assign exp_div =(opa_dn & opb_dn)? div_exp3 : opb_dn? div_exp1[7:0] :
			(opa_dn & !( (exp_in[4:0]<div_opa_ldz) | (div_exp2>8'hfe) ))	? div_exp2 :
			(opa_dn | (exp_in_00 & !exp_ovf[1]) )			? 8'h00 :
										  exp_out1_mi1;

	assign div_inf = opb_dn & !opa_dn & (div_exp1[7:0] < 8'h7f);

	// ---------------------------------------------------------------------
	// Round

	// Extract rounding (GRS) bits
	assign grs_sel_div = op_div & (exp_ovf[1] | div_dn | exp_out1_co | exp_out_00);

	assign g = grs_sel_div ? fract_out[0]                   : fract_out[0];
	assign r = grs_sel_div ? (fract_trunc[24] & !div_nr)    : fract_trunc[24];
	assign s = grs_sel_div ? |fract_trunc[24:0]             : (|fract_trunc[23:0] | (fract_trunc[24] & op_div));

	// Round to nearest even
	assign round = (g & r) | (r & s) ;
	assign {exp_rnd_adj0, fract_out_rnd0} = round ? fract_out_pl1 : {1'b0, fract_out};
	assign exp_out_rnd0 =  exp_rnd_adj0 ? exp_out_pl1 : exp_out;
	assign ovf0 = exp_out_final_ff & !rmode_01 & !op_f2i;

	// round to zero
	assign fract_out_rnd1 = (exp_out_ff & !op_div & !dn & !op_f2i) ? 23'h7fffff : fract_out;
	assign exp_fix_div    = (fi_ldz>6'd22) ? exp_fix_diva : exp_fix_divb;
	assign exp_out_rnd1   = (g & r & s & exp_in_ff) ? (op_div ? exp_fix_div : exp_next_mi[7:0]) : (exp_out_ff & !op_f2i) ? exp_in : exp_out;
	assign ovf1 = exp_out_ff & !dn;

	// round to +inf (UP) and -inf (DOWN)
	assign r_sign = sign;

	assign round2a = !exp_out_fe | !fract_out_7fffff | (exp_out_fe & fract_out_7fffff);
	assign round2_fasu = ((r | s) & !r_sign) & (!exp_out[7] | (exp_out[7] & round2a));

	assign round2_fmul = !r_sign & 
			(
				(exp_ovf[1] & !fract_in_00 &
					( ((!exp_out1_co | op_dn) & (r | s | (!rem_00 & op_div) )) | fract_out_00 | (!op_dn & !op_div))
				 ) |
				(
					(r | s | (!rem_00 & op_div)) & (
							(!exp_ovf[1] & (exp_in_80 | !exp_ovf[0])) | op_div |
							( exp_ovf[1] & !exp_ovf[0] & exp_out1_co)
						)
				)
			);

	//assign round2_f2i = rmode_10 & (( |fract_in[23:0] & !opas & (exp_in<8'h80 )) | (|fract_trunc));
	wire temp_fract_in;
	assign temp_fract_in = |fract_in[23:0];
	assign round2_f2i = rmode_10 & (( temp_fract_in & !opas & (exp_in<8'h80 )) | (|fract_trunc));

	assign round2 = (op_mul | op_div) ? round2_fmul : op_f2i ? round2_f2i : round2_fasu;

	assign {exp_rnd_adj2a, fract_out_rnd2a} = round2 ? fract_out_pl1 : {1'b0, fract_out};
	assign exp_out_rnd2a  = exp_rnd_adj2a ? ((exp_ovf[1] & op_mul) ? exp_out_mi1 : exp_out_pl1) : exp_out;

	assign fract_out_rnd2 = (r_sign & exp_out_ff & !op_div & !dn & !op_f2i) ? 23'h7fffff : fract_out_rnd2a;
	assign exp_out_rnd2   = (r_sign & exp_out_ff & !op_f2i) ? 8'hfe      : exp_out_rnd2a;


	// Choose rounding mode

	always @(rmode or exp_out_rnd0 or exp_out_rnd1 or exp_out_rnd2)
		case(rmode)	// synopsys full_case parallel_case
		   2'b00: exp_out_rnd = exp_out_rnd0;
		   2'b01: exp_out_rnd = exp_out_rnd1;
		2'b10: exp_out_rnd = exp_out_rnd2;
		2'b11: exp_out_rnd = exp_out_rnd2;
		endcase

	always @(rmode or fract_out_rnd0 or fract_out_rnd1 or fract_out_rnd2)
		case (rmode)	// synopsys full_case parallel_case
			2'b00: fract_out_rnd = fract_out_rnd0;
			2'b01: fract_out_rnd = fract_out_rnd1;
			2'b10: fract_out_rnd = fract_out_rnd2;
			2'b11: fract_out_rnd = fract_out_rnd2;
		endcase

	// ---------------------------------------------------------------------
	// Final Output Mux
	// Fix Output for denormalized and special numbers
	wire	max_num, inf_out;

	assign	max_num =  ( !rmode_00 & (op_mul | op_div ) & (
								  ( exp_ovf[1] &  exp_ovf[0]) |
								  (!exp_ovf[1] & !exp_ovf[0] & exp_in_ff & (fi_ldz_2<8'd24) & (exp_out!=8'hfe) )
								  )
			   ) |

			   ( op_div & (
					   ( rmode_01 & ( div_inf |
								 (exp_out_ff & !exp_ovf[1] ) |
								 (exp_ovf[1] &  exp_ovf[0] )
							)
					   ) |
		
					   ( rmode[1] & !exp_ovf[1] & (
									   ( exp_ovf[0] & exp_in_ff & r_sign & fract_in[47]
									   ) |
						
									   (  r_sign & (
											(fract_in[47] & div_inf) |
											(exp_in[7] & !exp_out_rnd[7] & !exp_in_80 & exp_out!=8'h7f ) |
											(exp_in[7] &  exp_out_rnd[7] & r_sign & exp_out_ff & op_dn &
												 div_exp1>9'h0fe )
											)
									   ) |

									   ( exp_in_00 & r_sign & (
													div_inf |
													(r_sign & exp_out_ff & fi_ldz_2<8'h18)
												  )
									   )
								       )
					  )
				    )
			   );


	assign inf_out = (rmode[1] & (op_mul | op_div) & !r_sign & (	(exp_in_ff & !op_div) |
									(exp_ovf[1] & exp_ovf[0] & (exp_in_00 | exp_in[7]) ) 
								   )
			) | (div_inf & op_div & (
					 rmode_00 |
					(rmode[1] & !exp_in_ff & !exp_ovf[1] & !exp_ovf[0] & !r_sign ) |
					(rmode[1] & !exp_ovf[1] & exp_ovf[0] & exp_in_00 & !r_sign)
					)
			) | (op_div & rmode[1] & exp_in_ff & op_dn & !r_sign & (fi_ldz_2 < 8'd24)  & (exp_out_rnd!=8'hfe) );

	assign fract_out_final =	(inf_out | ovf0 | output_zero ) ? 23'h000000 :
					(max_num | (f2i_max & op_f2i) ) ? 23'h7fffff :
					fract_out_rnd;

	assign exp_out_final =	((op_div & exp_ovf[1] & !exp_ovf[0]) | output_zero ) ? 8'h00 :
				((op_div & exp_ovf[1] &  exp_ovf[0] & rmode_00) | inf_out | (f2i_max & op_f2i) ) ? 8'hff :
				max_num ? 8'hfe :
				exp_out_rnd;


	// ---------------------------------------------------------------------
	// Pack Result

	assign out = {exp_out_final, fract_out_final};

	// ---------------------------------------------------------------------
	// Exceptions
	wire		underflow_fmul;
	wire		overflow_fdiv;
	wire		undeflow_div;

	wire		z;
	assign		z =	shft_co | ( exp_ovf[1] |  exp_in_00) |
				(!exp_ovf[1] & !exp_in_00 & (exp_out1_co | exp_out_00));

	assign underflow_fmul = ( (|fract_trunc) & z & !exp_in_ff ) |
				(fract_out_00 & !fract_in_00 & exp_ovf[1]);


	assign undeflow_div =	!(exp_ovf[1] &  exp_ovf[0] & rmode_00) & !inf_out & !max_num & exp_out_final!=8'hff & (

				((|fract_trunc) & !opb_dn & (
								( op_dn & !exp_ovf[1] & exp_ovf[0])	|
								( op_dn &  exp_ovf[1])			|
								( op_dn &  div_shft1_co)		| 
								  exp_out_00				|
								  exp_ovf[1]
							  )

				) |

				( exp_ovf[1] & !exp_ovf[0] & (
								(  op_dn & exp_in>8'h16 & fi_ldz<6'd23) |
								(  op_dn & exp_in<8'd23 & fi_ldz<6'd23 & !rem_00) |
								( !op_dn & (exp_in[7]==exp_div[7]) & !rem_00) |
								( !op_dn & exp_in_00 & (exp_div[7:1]==7'h7f) ) |
								( !op_dn & exp_in<8'h7f & exp_in>8'h20 )
								)
				) |

				(!exp_ovf[1] & !exp_ovf[0] & (
								( op_dn & fi_ldz<6'd23 & exp_out_00) |
								( exp_in_00 & !rem_00) |
								( !op_dn & ldz_all<7'd23 & exp_in==8'h01 & exp_out_00 & !rem_00)
								)
				)

				);

	assign underflow = op_div ? undeflow_div : op_mul ? underflow_fmul : (!fract_in[47] & exp_out1_co) & !dn;

	assign overflow_fdiv =	inf_out |
				(!rmode_00 & max_num) |
				(exp_in[7] & op_dn & exp_out_ff) |
				(exp_ovf[0] & (exp_ovf[1] | exp_out_ff) );

	assign overflow  = op_div ? overflow_fdiv : (ovf0 | ovf1);

	wire		f2i_ine;
	assign f2i_ine =	(f2i_zero & !fract_in_00 & !opas) |
				(|fract_trunc) |
				(f2i_zero & (exp_in<8'h80) & opas & !fract_in_00) |
				(f2i_max & rmode_11 & (exp_in<8'h80));



	assign ine =	op_f2i ? f2i_ine :
			op_i2f ? (|fract_trunc) :
			((r & !dn) | (s & !dn) | max_num | (op_div & !rem_00));
endmodule
module b_left_shifter_new (
	shift_in,
	shift_value,
	shift_out
);

input [55:0] shift_in;
input [5:0] shift_value;
output [55:0] shift_out;
reg [55:0] shift_out;

always @(shift_value)
begin
	case (shift_value)	
		6'b000000: shift_out = shift_in;
		6'b000001: shift_out = shift_in << 1;
		6'b000010: shift_out = shift_in << 2;
		6'b000011: shift_out = shift_in << 3;
		6'b000100: shift_out = shift_in << 4;
		6'b000101: shift_out = shift_in << 5;
		6'b000110: shift_out = shift_in << 6;
		6'b000111: shift_out = shift_in << 7;		
		6'b001000: shift_out = shift_in << 8;
		6'b001001: shift_out = shift_in << 9;
		6'b001010: shift_out = shift_in << 10;
		6'b001011: shift_out = shift_in << 11;
		6'b001100: shift_out = shift_in << 12;
		6'b001101: shift_out = shift_in << 13;
		6'b001110: shift_out = shift_in << 14;
		6'b001111: shift_out = shift_in << 15;		
		6'b010000: shift_out = shift_in << 16;
		6'b010001: shift_out = shift_in << 17;
		6'b010010: shift_out = shift_in << 18;
		6'b010011: shift_out = shift_in << 19;
		6'b010100: shift_out = shift_in << 20;
		6'b010101: shift_out = shift_in << 21;
		6'b010110: shift_out = shift_in << 22;
		6'b010111: shift_out = shift_in << 23;		
		6'b011000: shift_out = shift_in << 24;
		6'b011001: shift_out = shift_in << 25;
		6'b011010: shift_out = shift_in << 26;
		6'b011011: shift_out = shift_in << 27;
		6'b011100: shift_out = shift_in << 28;
		6'b011101: shift_out = shift_in << 29;
		6'b011110: shift_out = shift_in << 30;
		6'b011111: shift_out = shift_in << 31;		
		6'b100000: shift_out = shift_in << 32;
		6'b100001: shift_out = shift_in << 33;
		6'b100010: shift_out = shift_in << 34;
		6'b100011: shift_out = shift_in << 35;
		6'b100100: shift_out = shift_in << 36;
		6'b100101: shift_out = shift_in << 37;
		6'b100110: shift_out = shift_in << 38;
		6'b100111: shift_out = shift_in << 39;		
		6'b101000: shift_out = shift_in << 40;
		6'b101001: shift_out = shift_in << 41;
		6'b101010: shift_out = shift_in << 42;
		6'b101011: shift_out = shift_in << 43;
		6'b101100: shift_out = shift_in << 44;
		6'b101101: shift_out = shift_in << 45;
		6'b101110: shift_out = shift_in << 46;
		6'b101111: shift_out = shift_in << 47;	
		6'b110000: shift_out = shift_in << 48;
		6'b110001: shift_out = shift_in << 49;	
		6'b110010: shift_out = shift_in << 50;	
		6'b110011: shift_out = shift_in << 51;	
		6'b110100: shift_out = shift_in << 52;	
		6'b110101: shift_out = shift_in << 53;	
		6'b110110: shift_out = shift_in << 54;	
		6'b110111: shift_out = shift_in << 55;	
		6'b111000: shift_out = shift_in << 56;			
	endcase
end

endmodule 
module b_left_shifter (
	shift_in,
	shift_value,
	shift_out
);

input [47:0] shift_in;
input [5:0] shift_value;
output [47:0] shift_out;
reg [47:0] shift_out;

always @(shift_value)
begin
	case (shift_value)	
		6'b000000: shift_out = shift_in;
		6'b000001: shift_out = shift_in << 1;
		6'b000010: shift_out = shift_in << 2;
		6'b000011: shift_out = shift_in << 3;
		6'b000100: shift_out = shift_in << 4;
		6'b000101: shift_out = shift_in << 5;
		6'b000110: shift_out = shift_in << 6;
		6'b000111: shift_out = shift_in << 7;		
		6'b001000: shift_out = shift_in << 8;
		6'b001001: shift_out = shift_in << 9;
		6'b001010: shift_out = shift_in << 10;
		6'b001011: shift_out = shift_in << 11;
		6'b001100: shift_out = shift_in << 12;
		6'b001101: shift_out = shift_in << 13;
		6'b001110: shift_out = shift_in << 14;
		6'b001111: shift_out = shift_in << 15;		
		6'b010000: shift_out = shift_in << 16;
		6'b010001: shift_out = shift_in << 17;
		6'b010010: shift_out = shift_in << 18;
		6'b010011: shift_out = shift_in << 19;
		6'b010100: shift_out = shift_in << 20;
		6'b010101: shift_out = shift_in << 21;
		6'b010110: shift_out = shift_in << 22;
		6'b010111: shift_out = shift_in << 23;		
		6'b011000: shift_out = shift_in << 24;
		6'b011001: shift_out = shift_in << 25;
		6'b011010: shift_out = shift_in << 26;
		6'b011011: shift_out = shift_in << 27;
		6'b011100: shift_out = shift_in << 28;
		6'b011101: shift_out = shift_in << 29;
		6'b011110: shift_out = shift_in << 30;
		6'b011111: shift_out = shift_in << 31;		
		6'b100000: shift_out = shift_in << 32;
		6'b100001: shift_out = shift_in << 33;
		6'b100010: shift_out = shift_in << 34;
		6'b100011: shift_out = shift_in << 35;
		6'b100100: shift_out = shift_in << 36;
		6'b100101: shift_out = shift_in << 37;
		6'b100110: shift_out = shift_in << 38;
		6'b100111: shift_out = shift_in << 39;		
		6'b101000: shift_out = shift_in << 40;
		6'b101001: shift_out = shift_in << 41;
		6'b101010: shift_out = shift_in << 42;
		6'b101011: shift_out = shift_in << 43;
		6'b101100: shift_out = shift_in << 44;
		6'b101101: shift_out = shift_in << 45;
		6'b101110: shift_out = shift_in << 46;
		6'b101111: shift_out = shift_in << 47;	
		6'b110000: shift_out = shift_in << 48;
		
	endcase
end

endmodule 
module b_right_shifter (
	shift_in,
	shift_value,
	shift_out
);

input [47:0] shift_in;
input [5:0] shift_value;
output [47:0] shift_out;
reg [47:0] shift_out; 

always @(shift_value)
begin
	case (shift_value)	
		6'b000000: shift_out = shift_in;
		6'b000001: shift_out = shift_in >> 1;
		6'b000010: shift_out = shift_in >> 2;
		6'b000011: shift_out = shift_in >> 3;
		6'b000100: shift_out = shift_in >> 4;
		6'b000101: shift_out = shift_in >> 5;
		6'b000110: shift_out = shift_in >> 6;
		6'b000111: shift_out = shift_in >> 7;		
		6'b001000: shift_out = shift_in >> 8;
		6'b001001: shift_out = shift_in >> 9;
		6'b001010: shift_out = shift_in >> 10;
		6'b001011: shift_out = shift_in >> 11;
		6'b001100: shift_out = shift_in >> 12;
		6'b001101: shift_out = shift_in >> 13;
		6'b001110: shift_out = shift_in >> 14;
		6'b001111: shift_out = shift_in >> 15;		
		6'b010000: shift_out = shift_in >> 16;
		6'b010001: shift_out = shift_in >> 17;
		6'b010010: shift_out = shift_in >> 18;
		6'b010011: shift_out = shift_in >> 19;
		6'b010100: shift_out = shift_in >> 20;
		6'b010101: shift_out = shift_in >> 21;
		6'b010110: shift_out = shift_in >> 22;
		6'b010111: shift_out = shift_in >> 23;		
		6'b011000: shift_out = shift_in >> 24;
		6'b011001: shift_out = shift_in >> 25;
		6'b011010: shift_out = shift_in >> 26;
		6'b011011: shift_out = shift_in >> 27;
		6'b011100: shift_out = shift_in >> 28;
		6'b011101: shift_out = shift_in >> 29;
		6'b011110: shift_out = shift_in >> 30;
		6'b011111: shift_out = shift_in >> 31;		
		6'b100000: shift_out = shift_in >> 32;
		6'b100001: shift_out = shift_in >> 33;
		6'b100010: shift_out = shift_in >> 34;
		6'b100011: shift_out = shift_in >> 35;
		6'b100100: shift_out = shift_in >> 36;
		6'b100101: shift_out = shift_in >> 37;
		6'b100110: shift_out = shift_in >> 38;
		6'b100111: shift_out = shift_in >> 39;		
		6'b101000: shift_out = shift_in >> 40;
		6'b101001: shift_out = shift_in >> 41;
		6'b101010: shift_out = shift_in >> 42;
		6'b101011: shift_out = shift_in >> 43;
		6'b101100: shift_out = shift_in >> 44;
		6'b101101: shift_out = shift_in >> 45;
		6'b101110: shift_out = shift_in >> 46;
		6'b101111: shift_out = shift_in >> 47;	
		6'b110000: shift_out = shift_in >> 48;
		
	endcase
end

//assign shift_out = shift_in >> shift_value;

endmodule 
module pri_encoder ( fract_in, fi_ldz );

input [47:0] fract_in;
output [5:0] fi_ldz;
reg [5:0] fi_ldz_r0;

assign fi_ldz = fi_ldz_r0;

always @(fract_in)
begin
	if (fract_in[47:47] == 1'b1) 
		 fi_ldz_r0 = 6'd1;
	else if (fract_in[47:46] == 2'b01) 
		 fi_ldz_r0 = 6'd2;
	else if (fract_in[47:45] == 3'b001) 
		 fi_ldz_r0 = 6'd3;
	else if (fract_in[47:44] == 4'b0001) 
		 fi_ldz_r0 = 6'd4;
	else if (fract_in[47:43] == 5'b00001) 
		 fi_ldz_r0 = 6'd5;
	else if (fract_in[47:42] == 6'b000001) 
		 fi_ldz_r0 = 6'd6;
	else if (fract_in[47:41] == 7'b0000001) 
		 fi_ldz_r0 = 6'd7;
	else if (fract_in[47:40] == 8'b00000001) 
		 fi_ldz_r0 = 6'd8;
	else if (fract_in[47:39] == 9'b000000001) 
		 fi_ldz_r0 = 6'd9;
	else if (fract_in[47:38] == 10'b0000000001) 
		 fi_ldz_r0 = 6'd10;
	else if (fract_in[47:37] == 11'b00000000001) 
		 fi_ldz_r0 = 6'd11;
	else if (fract_in[47:36] == 12'b000000000001) 
		 fi_ldz_r0 = 6'd12;
	else if (fract_in[47:35] == 13'b0000000000001) 
		 fi_ldz_r0 = 6'd13;
	else if (fract_in[47:34] == 14'b00000000000001) 
		 fi_ldz_r0 = 6'd14;
	else if (fract_in[47:33] == 15'b000000000000001) 
		 fi_ldz_r0 = 6'd15;
	else if (fract_in[47:32] == 16'b0000000000000001) 
		 fi_ldz_r0 = 6'd16;
	else if (fract_in[47:31] == 17'b00000000000000001) 
		 fi_ldz_r0 = 6'd17;
	else if (fract_in[47:30] == 18'b000000000000000001) 
		 fi_ldz_r0 = 6'd18;
	else if (fract_in[47:29] == 19'b0000000000000000001) 
		 fi_ldz_r0 = 6'd19;
	else if (fract_in[47:28] == 20'b00000000000000000001) 
		 fi_ldz_r0 = 6'd20;
	else if (fract_in[47:27] == 21'b000000000000000000001) 
		 fi_ldz_r0 = 6'd21;
	else if (fract_in[47:26] == 22'b0000000000000000000001) 
		 fi_ldz_r0 = 6'd22;
	else if (fract_in[47:25] == 23'b00000000000000000000001) 
		 fi_ldz_r0 = 6'd23;
	else if (fract_in[47:24] == 24'b000000000000000000000001) 
		 fi_ldz_r0 = 6'd24;
	else if (fract_in[47:23] == 25'b0000000000000000000000001) 
		 fi_ldz_r0 = 6'd25;
	else if (fract_in[47:22] == 26'b00000000000000000000000001) 
		 fi_ldz_r0 = 6'd26;
	else if (fract_in[47:21] == 27'b000000000000000000000000001) 
		 fi_ldz_r0 = 6'd27;
	else if (fract_in[47:20] == 28'b0000000000000000000000000001) 
		 fi_ldz_r0 = 6'd28;
	else if (fract_in[47:19] == 29'b00000000000000000000000000001) 
		 fi_ldz_r0 = 6'd29;
	else if (fract_in[47:18] == 30'b000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd30;
	else if (fract_in[47:17] == 31'b0000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd31;
	else if (fract_in[47:16] == 32'b00000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd32;
	else if (fract_in[47:15] == 33'b000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd33;
	else if (fract_in[47:14] == 34'b0000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd34;
	else if (fract_in[47:13] == 35'b00000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd35;
	else if (fract_in[47:12] == 36'b000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd36;
	else if (fract_in[47:11] == 37'b0000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd37;
	else if (fract_in[47:10] == 38'b00000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd38;
	else if (fract_in[47:9]  == 39'b000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd39;
	else if (fract_in[47:8]  == 40'b0000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd40;
	else if (fract_in[47:7]  == 41'b00000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd41;
	else if (fract_in[47:6]  == 42'b000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd42;
	else if (fract_in[47:5]  == 43'b0000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd43;
	else if (fract_in[47:4]  == 44'b00000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd44;
	else if (fract_in[47:3]  == 45'b000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd45;
	else if (fract_in[47:2]  == 46'b0000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd46;
	else if (fract_in[47:1]  == 47'b00000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd47;
	else if (fract_in[47:0]  == 48'b000000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd48;
	else if (fract_in[47:0]  == 48'b000000000000000000000000000000000000000000000000) 
		 fi_ldz_r0 = 6'd48;
end

endmodule
module add_sub27(add, opa, opb, sum, co);
input		add;
input	[26:0]	opa, opb;
output	[26:0]	sum;
output		co;



assign {co, sum} = add ? ({1'b0, opa} + {1'b0, opb}) : ({1'b0, opa} - {1'b0, opb});

endmodule
module pre_norm(clk, rmode, add, opa, opb, opa_nan, opb_nan, fracta_out,
		fractb_out, exp_dn_out, sign, nan_sign, result_zero_sign,
		fasu_op);
input		clk;
input	[1:0]	rmode;
input		add;
input	[31:0]	opa, opb;
input		opa_nan, opb_nan;
output	[26:0]	fracta_out, fractb_out;
output	[7:0]	exp_dn_out;
output		sign;
output		nan_sign, result_zero_sign;
output		fasu_op;			// Operation Output

////////////////////////////////////////////////////////////////////////
//
// Local Wires and registers
//

wire		signa, signb;		// alias to opX sign
wire	[7:0]	expa, expb;		// alias to opX exponent
wire	[22:0]	fracta, fractb;		// alias to opX fraction
wire		expa_lt_expb;		// expa is larger than expb indicator
wire		fractb_lt_fracta;	// fractb is larger than fracta indicator
reg	[7:0]	exp_dn_out;		// de normalized exponent output
wire	[7:0]	exp_small, exp_large;
wire	[7:0]	exp_diff;		// Numeric difference of the two exponents
wire	[22:0]	adj_op;			// Fraction adjustment: input
wire	[26:0]	adj_op_tmp;
wire	[26:0]	adj_op_out;		// Fraction adjustment: output
wire	[26:0]	fracta_n, fractb_n;	// Fraction selection after normalizing
wire	[26:0]	fracta_s, fractb_s;	// Fraction Sorting out
reg	[26:0]	fracta_out, fractb_out;	// Fraction Output
reg		sign, sign_d;		// Sign Output
reg		add_d;			// operation (add/sub)
reg		fasu_op;		// operation (add/sub) register
wire		expa_dn, expb_dn;
reg		sticky;
reg		result_zero_sign;
reg		add_r, signa_r, signb_r;
wire	[4:0]	exp_diff_sft;
wire		exp_lt_27;
wire		op_dn;
wire	[26:0]	adj_op_out_sft;
reg		fracta_lt_fractb, fracta_eq_fractb;
wire		nan_sign1;
reg		nan_sign;

////////////////////////////////////////////////////////////////////////
//
// Aliases
//

assign  signa = opa[31];
assign  signb = opb[31];
assign   expa = opa[30:23];
assign   expb = opb[30:23];
assign fracta = opa[22:0];
assign fractb = opb[22:0];

////////////////////////////////////////////////////////////////////////
//
// Pre-Normalize exponents (and fractions)
//

assign expa_lt_expb = expa > expb;		// expa is larger than expb

// ---------------------------------------------------------------------
// Normalize

assign expa_dn = !(|expa);			// opa denormalized
assign expb_dn = !(|expb);			// opb denormalized

// ---------------------------------------------------------------------
// Calculate the difference between the smaller and larger exponent

wire	[7:0]	exp_diff1, exp_diff1a, exp_diff2;

assign exp_small  = expa_lt_expb ? expb : expa;
assign exp_large  = expa_lt_expb ? expa : expb;
assign exp_diff1  = exp_large - exp_small;
assign exp_diff1a = exp_diff1-8'h01;
assign exp_diff2  = (expa_dn | expb_dn) ? exp_diff1a : exp_diff1;
assign  exp_diff  = (expa_dn & expb_dn) ? 8'h0 : exp_diff2;

always @(posedge clk)	// If numbers are equal we should return zero
	exp_dn_out <=   (!add_d & expa==expb & fracta==fractb) ? 8'h0 : exp_large;

// ---------------------------------------------------------------------
// Adjust the smaller fraction


assign op_dn	  = expa_lt_expb ? expb_dn : expa_dn;
assign adj_op     = expa_lt_expb ? fractb : fracta;
wire temp1;
assign temp1 = ~op_dn;
//assign adj_op_tmp[26:0] = {~op_dn, adj_op, 3'b000};	// recover hidden bit (op_dn) 
assign adj_op_tmp[26:0] = {temp1, adj_op, 3'b000};	// recover hidden bit (op_dn) 

// adj_op_out is 27 bits wide, so can only be shifted 27 bits to the right
assign exp_lt_27	= exp_diff  > 8'd27;
assign exp_diff_sft	= exp_lt_27 ? 5'd27 : exp_diff[4:0];

//assign adj_op_out_sft	= adj_op_tmp >> exp_diff_sft;
b_right_shifter_new u7(
	.shift_in(adj_op_tmp),
	.shift_value(exp_diff_sft),
	.shift_out(adj_op_out_sft)
);

wire temp2;
assign temp2 = adj_op_out_sft[0] | sticky;
//assign adj_op_out[26:0]	= {adj_op_out_sft[26:1], adj_op_out_sft[0] | sticky };
assign adj_op_out[26:0]	= {adj_op_out_sft[26:1], temp2 };


// ---------------------------------------------------------------------
// Get truncated portion (sticky bit)

always @(exp_diff_sft or adj_op_tmp)
   case(exp_diff_sft)		// synopsys full_case parallel_case
	5'd00: sticky = 1'h0;
	5'd01: sticky =  adj_op_tmp[0]; 
	5'd02: sticky = |adj_op_tmp[01:0];
	5'd03: sticky = |adj_op_tmp[02:0];
	5'd04: sticky = |adj_op_tmp[03:0];
	5'd05: sticky = |adj_op_tmp[04:0];
	5'd06: sticky = |adj_op_tmp[05:0];
	5'd07: sticky = |adj_op_tmp[06:0];
	5'd08: sticky = |adj_op_tmp[07:0];
	5'd09: sticky = |adj_op_tmp[08:0];
	5'd10: sticky = |adj_op_tmp[09:0];
	5'd11: sticky = |adj_op_tmp[10:0];
	5'd12: sticky = |adj_op_tmp[11:0];
	5'd13: sticky = |adj_op_tmp[12:0];
	5'd14: sticky = |adj_op_tmp[13:0];
	5'd15: sticky = |adj_op_tmp[14:0];
	5'd16: sticky = |adj_op_tmp[15:0];
	5'd17: sticky = |adj_op_tmp[16:0];
	5'd18: sticky = |adj_op_tmp[17:0];
	5'd19: sticky = |adj_op_tmp[18:0];
	5'd20: sticky = |adj_op_tmp[19:0];
	5'd21: sticky = |adj_op_tmp[20:0];
	5'd22: sticky = |adj_op_tmp[21:0];
	5'd23: sticky = |adj_op_tmp[22:0];
	5'd24: sticky = |adj_op_tmp[23:0];
	5'd25: sticky = |adj_op_tmp[24:0];
	5'd26: sticky = |adj_op_tmp[25:0];
	5'd27: sticky = |adj_op_tmp[26:0];
   endcase

// ---------------------------------------------------------------------
// Select operands for add/sub (recover hidden bit)

assign fracta_n = expa_lt_expb ? {~expa_dn, fracta, 3'b0} : adj_op_out;
assign fractb_n = expa_lt_expb ? adj_op_out : {~expb_dn, fractb, 3'b0};

// ---------------------------------------------------------------------
// Sort operands (for sub only)

assign fractb_lt_fracta = fractb_n > fracta_n;	// fractb is larger than fracta
assign fracta_s = fractb_lt_fracta ? fractb_n : fracta_n;
assign fractb_s = fractb_lt_fracta ? fracta_n : fractb_n;

always @(posedge clk)
	fracta_out <=   fracta_s;

always @(posedge clk)
	fractb_out <=   fractb_s;

// ---------------------------------------------------------------------
// Determine sign for the output

// sign: 0=Positive Number; 1=Negative Number
always @(signa or signb or add or fractb_lt_fracta)
   case({signa, signb, add})		// synopsys full_case parallel_case

   	// Add
	3'b001: sign_d = 0;
	3'b011: sign_d = fractb_lt_fracta;
	3'b101: sign_d = !fractb_lt_fracta;
	3'b111: sign_d = 1;

	// Sub
	3'b000: sign_d = fractb_lt_fracta;
	3'b010: sign_d = 0;
	3'b100: sign_d = 1;
	3'b110: sign_d = !fractb_lt_fracta;
   endcase

always @(posedge clk)
	sign <=   sign_d;

// Fix sign for ZERO result
always @(posedge clk)
	signa_r <=   signa;

always @(posedge clk)
	signb_r <=   signb;

always @(posedge clk)
	add_r <=   add;

always @(posedge clk)
	result_zero_sign <=  	( add_r &  signa_r &  signb_r) |
				(!add_r &  signa_r & !signb_r) |
				( add_r & (signa_r |  signb_r) & (rmode==3)) |
				(!add_r & (signa_r == signb_r) & (rmode==3));

// Fix sign for NAN result
always @(posedge clk)
	fracta_lt_fractb <=   fracta < fractb;

always @(posedge clk)
	fracta_eq_fractb <=   fracta == fractb;

assign nan_sign1 = fracta_eq_fractb ? (signa_r & signb_r) : fracta_lt_fractb ? signb_r : signa_r;

always @(posedge clk)
	nan_sign <=   (opa_nan & opb_nan) ? nan_sign1 : opb_nan ? signb_r : signa_r;

////////////////////////////////////////////////////////////////////////
//
// Decode Add/Sub operation
//

// add: 1=Add; 0=Subtract
always @(signa or signb or add)
   case({signa, signb, add})		// synopsys full_case parallel_case
   
   	// Add
	3'b001: add_d = 1;
	3'b011: add_d = 0;
	3'b101: add_d = 0;
	3'b111: add_d = 1;
	
	// Sub
	3'b000: add_d = 0;
	3'b010: add_d = 1;
	3'b100: add_d = 1;
	3'b110: add_d = 0;
   endcase

always @(posedge clk)
	fasu_op <=   add_d;

endmodule
module b_right_shifter_new (
	shift_in,
	shift_value,
	shift_out
);

input [26:0] shift_in;
input [4:0] shift_value;
output [26:0] shift_out;
reg [26:0] shift_out;

always @(shift_value)
begin
	case (shift_value)	
		5'b00000: shift_out = shift_in;
		5'b00001: shift_out = shift_in >> 1;
		5'b00010: shift_out = shift_in >> 2;
		5'b00011: shift_out = shift_in >> 3;
		5'b00100: shift_out = shift_in >> 4;
		5'b00101: shift_out = shift_in >> 5;
		5'b00110: shift_out = shift_in >> 6;
		5'b00111: shift_out = shift_in >> 7;		
		5'b01000: shift_out = shift_in >> 8;
		5'b01001: shift_out = shift_in >> 9;
		5'b01010: shift_out = shift_in >> 10;
		5'b01011: shift_out = shift_in >> 11;
		5'b01100: shift_out = shift_in >> 12;
		5'b01101: shift_out = shift_in >> 13;
		5'b01110: shift_out = shift_in >> 14;
		5'b01111: shift_out = shift_in >> 15;		
		5'b10000: shift_out = shift_in >> 16;
		5'b10001: shift_out = shift_in >> 17;
		5'b10010: shift_out = shift_in >> 18;
		5'b10011: shift_out = shift_in >> 19;
		5'b10100: shift_out = shift_in >> 20;
		5'b10101: shift_out = shift_in >> 21;
		5'b10110: shift_out = shift_in >> 22;
		5'b10111: shift_out = shift_in >> 23;		
		5'b11000: shift_out = shift_in >> 24;
		5'b11001: shift_out = shift_in >> 25;
		5'b11010: shift_out = shift_in >> 26;
		5'b11011: shift_out = shift_in >> 27;
	endcase
end


endmodule 
module except(	clk, opa, opb, inf, ind, qnan, snan, opa_nan, opb_nan,
		opa_00, opb_00, opa_inf, opb_inf, opa_dn, opb_dn);
input		clk;
input	[30:0]	opa, opb;
output		inf, ind, qnan, snan, opa_nan, opb_nan;
output		opa_00, opb_00;
output		opa_inf, opb_inf;
output		opa_dn;
output		opb_dn;

////////////////////////////////////////////////////////////////////////
//
// Local Wires and registers
//

wire	[7:0]	expa, expb;		// alias to opX exponent
wire	[22:0]	fracta, fractb;		// alias to opX fraction
reg		expa_ff, infa_f_r, qnan_r_a, snan_r_a;
reg		expb_ff, infb_f_r, qnan_r_b, snan_r_b;
reg		inf, ind, qnan, snan;	// Output registers
reg		opa_nan, opb_nan;
reg		expa_00, expb_00, fracta_00, fractb_00;
reg		opa_00, opb_00;
reg		opa_inf, opb_inf;
reg		opa_dn, opb_dn;

////////////////////////////////////////////////////////////////////////
//
// Aliases
//

assign   expa = opa[30:23];
assign   expb = opb[30:23];
assign fracta = opa[22:0];
assign fractb = opb[22:0];

////////////////////////////////////////////////////////////////////////
//
// Determine if any of the input operators is a INF or NAN or any other special number
//

always @(posedge clk)
	expa_ff <=  &expa;

always @(posedge clk)
	expb_ff <=  &expb;
	
always @(posedge clk)
	infa_f_r <=  !(|fracta);

always @(posedge clk)
	infb_f_r <=  !(|fractb);

always @(posedge clk)
	qnan_r_a <=   fracta[22];

always @(posedge clk)
	snan_r_a <=  !fracta[22] & |fracta[21:0];
	
always @(posedge clk)
	qnan_r_b <=   fractb[22];

always @(posedge clk)
	snan_r_b <=  !fractb[22] & |fractb[21:0];

always @(posedge clk)
	ind  <=  (expa_ff & infa_f_r) & (expb_ff & infb_f_r);

always @(posedge clk)
	inf  <=  (expa_ff & infa_f_r) | (expb_ff & infb_f_r);

always @(posedge clk)
	qnan <=  (expa_ff & qnan_r_a) | (expb_ff & qnan_r_b);

always @(posedge clk)
	snan <=  (expa_ff & snan_r_a) | (expb_ff & snan_r_b);

always @(posedge clk)
	opa_nan <=  &expa & (|fracta[22:0]);

always @(posedge clk)
	opb_nan <=  &expb & (|fractb[22:0]);

always @(posedge clk)
	opa_inf <=  (expa_ff & infa_f_r);

always @(posedge clk)
	opb_inf <=  (expb_ff & infb_f_r);

always @(posedge clk)
	expa_00 <=  !(|expa);

always @(posedge clk)
	expb_00 <=  !(|expb);

always @(posedge clk)
	fracta_00 <=  !(|fracta);

always @(posedge clk)
	fractb_00 <=  !(|fractb);

always @(posedge clk)
	opa_00 <=  expa_00 & fracta_00;

always @(posedge clk)
	opb_00 <=  expb_00 & fractb_00;

always @(posedge clk)
	opa_dn <=  expa_00;

always @(posedge clk)
	opb_dn <=  expb_00;

endmodule
