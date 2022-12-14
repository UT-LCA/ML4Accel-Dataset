
module fpu_round( clk, rst, enable, round_mode, sign_term, 
mantissa_term, exponent_term, round_out, exponent_final);
input		clk;
input		rst;
input		enable;
input	[1:0]	round_mode;
input		sign_term;
input	[55:0]	mantissa_term;
input	[11:0]	exponent_term;
output	[63:0]	round_out;
output	[11:0]	exponent_final;

wire	[55:0] rounding_amount = { 53'b0, 1'b1, 2'b0};
wire	round_nearest = (round_mode == 2'b00);
wire	round_to_zero = (round_mode == 2'b01);
wire	round_to_pos_inf = (round_mode == 2'b10);
wire	round_to_neg_inf = (round_mode == 2'b11);
wire 	round_nearest_trigger = round_nearest &  mantissa_term[1]; 
wire	round_to_pos_inf_trigger = !sign_term & |mantissa_term[1:0]; 
wire	round_to_neg_inf_trigger = sign_term & |mantissa_term[1:0];
wire 	round_trigger = ( round_nearest & round_nearest_trigger)
						| (round_to_pos_inf & round_to_pos_inf_trigger) 
						| (round_to_neg_inf & round_to_neg_inf_trigger);


reg	  [55:0] sum_round;
wire	sum_round_overflow = sum_round[55]; 
	// will be 0 if no carry, 1 if overflow from the rounding unit
	// overflow from rounding is extremely rare, but possible
reg	  [55:0] sum_round_2;
reg   [11:0] exponent_round;
reg	  [55:0] sum_final; 
reg   [11:0] exponent_final;
reg   [63:0] round_out;

always @(posedge clk) 
	begin
		if (rst) begin
			sum_round <= 0;
			sum_round_2 <= 0;
			exponent_round <= 0;
			sum_final <= 0; 
			exponent_final <= 0;
			round_out <= 0;
		end
		else begin
			sum_round <= rounding_amount + mantissa_term;
			sum_round_2 <= sum_round_overflow ? sum_round >> 1 : sum_round;
			exponent_round <= sum_round_overflow ? (exponent_term + 1) : exponent_term;
			sum_final <= round_trigger ? sum_round_2 : mantissa_term; 
			exponent_final <= round_trigger ? exponent_round : exponent_term;
			round_out <= { sign_term, exponent_final[10:0], sum_final[53:2] };
			end
	end
endmodule	/////////////////////////////////////////////////////////////////////
