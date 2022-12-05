`define BITS 32         // Bit width of the operands
`define NumPath 34     

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
