`define SIMULATION_MEMORY

module inverse_winograd_adder_30_3 (
	input clock,
	input [29:0] data0x,
	input [29:0] data1x,
	input [29:0] data2x,
	input [29:0] data3x,
	input [29:0] data4x,
	input [29:0] data5x,
	output [29:0] result
);

reg [32:0] pipeline_0_0;
reg [32:0] pipeline_0_1;
reg [32:0] pipeline_0_2;
reg [32:0] pipeline_1_0;
reg [32:0] pipeline_1_1;
reg [32:0] pipeline_2_0;

always @ (posedge clock) begin
	pipeline_0_0 <= data0x + data1x;
	pipeline_0_1 <= data2x + data3x;
	pipeline_0_2 <= data4x + data5x;
	pipeline_1_0 <= pipeline_0_0 + pipeline_0_1;
	pipeline_1_1 <= pipeline_0_2;
	pipeline_2_0 <= pipeline_1_0 + pipeline_1_1;
end

assign result = pipeline_2_0;

endmodule
