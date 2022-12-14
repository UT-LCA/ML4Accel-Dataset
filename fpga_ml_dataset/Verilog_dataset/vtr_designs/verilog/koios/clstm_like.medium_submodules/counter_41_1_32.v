`define SIMULATION_MEMORY

module counter_41_1_32 (
	input clk,
	input reset,
	input ena,
	output reg [13:0] count
);

always @ (posedge clk) begin 
	if (reset) begin
		count <= 32;
	end else if (ena) begin
		if((count + 1) <= 41) begin
			count <= count + 1;
		end else begin
			count <= 14'd0;
		end
	end
end

endmodule
