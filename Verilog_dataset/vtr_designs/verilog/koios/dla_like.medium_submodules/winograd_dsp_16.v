`define SIMULATION_MEMORY

module winograd_dsp_16 (
	input clk,
	input ena,
	input aclr,
	input [15:0] ay,
	input [15:0] by,
	input [2:0] coefsela,
	input [2:0] coefselb,
	output [15:0] resulta,
	output [15:0] resultb
);

reg [15:0] coefa, coefb, ay_reg, by_reg, resa_reg, resb_reg;
assign resulta = resa_reg;
assign resultb = resb_reg;

always @ (posedge clk) begin
	if (aclr) begin
		coefa <= 0;
		coefb <= 0;
		ay_reg <= 0;
		by_reg <= 0;
		resa_reg <= 0;
		resb_reg <= 0;
	end else begin
		ay_reg <= ay;
		by_reg <= by;
		if (coefsela == 0) begin
			coefa <= 5;
		end else if (coefsela == 1) begin
			coefa <= -5;
		end else if (coefsela == 2) begin
			coefa <= 10;
		end else if (coefsela == 3) begin
			coefa <= -10;
		end else if (coefsela == 4) begin
			coefa <= 20;
		end else if (coefsela == 5) begin
			coefa <= -20;
		end else if (coefsela == 6) begin
			coefa <= 25;
		end else if (coefsela == 7) begin
			coefa <= -25;
		end else begin
			coefa <= 0;
		end
		if (coefselb == 0) begin
			coefb <= 5;
		end else if (coefselb == 1) begin
			coefb <= -5;
		end else if (coefselb == 2) begin
			coefb <= 10;
		end else if (coefselb == 3) begin
			coefb <= -10;
		end else if (coefselb == 4) begin
			coefb <= 20;
		end else if (coefselb == 5) begin
			coefb <= -20;
		end else if (coefselb == 6) begin
			coefb <= 25;
		end else if (coefselb == 7) begin
			coefb <= -25;
		end else begin
			coefb <= 0;
		end
		resa_reg <= ay_reg * coefa;
		resb_reg <= by_reg * coefb;
	end
end

endmodule
