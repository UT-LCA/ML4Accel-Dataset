`define SIMULATION_MEMORY

module counter_63_3 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 0;
	end else if (ena) begin
		if((count + 3) <= 63) begin
			count <= count + 3;
		end else begin
			count <= 14'd0;
		end
	end
end

endmodule
