`define SIMULATION_MEMORY

module winograd_adder_16_20_4 (
	input clken,
	input clock,
	input [15:0] data0x,
	input [15:0] data1x,
	input [15:0] data2x,
	input [15:0] data3x,
	input [15:0] data4x,
	input [15:0] data5x,
	input [15:0] data6x,
	input [15:0] data7x,
	input [15:0] data8x,
	input [15:0] data9x,
	input [15:0] data10x,
	input [15:0] data11x,
	input [15:0] data12x,
	input [15:0] data13x,
	input [15:0] data14x,
	input [15:0] data15x,
	output [19:0] result
);

reg [19:0] pipeline_0_0;
reg [19:0] pipeline_0_1;
reg [19:0] pipeline_0_2;
reg [19:0] pipeline_0_3;
reg [19:0] pipeline_0_4;
reg [19:0] pipeline_0_5;
reg [19:0] pipeline_0_6;
reg [19:0] pipeline_0_7;
reg [19:0] pipeline_1_0;
reg [19:0] pipeline_1_1;
reg [19:0] pipeline_1_2;
reg [19:0] pipeline_1_3;
reg [19:0] pipeline_2_0;
reg [19:0] pipeline_2_1;
reg [19:0] pipeline_3_0;

always @ (posedge clock) begin
	pipeline_0_0 <= data0x + data1x;
	pipeline_0_1 <= data2x + data3x;
	pipeline_0_2 <= data4x + data5x;
	pipeline_0_3 <= data6x + data7x;
	pipeline_0_4 <= data8x + data9x;
	pipeline_0_5 <= data10x + data11x;
	pipeline_0_6 <= data12x + data13x;
	pipeline_0_7 <= data14x + data15x;
	pipeline_1_0 <= pipeline_0_0 + pipeline_0_1;
	pipeline_1_1 <= pipeline_0_2 + pipeline_0_3;
	pipeline_1_2 <= pipeline_0_4 + pipeline_0_5;
	pipeline_1_3 <= pipeline_0_6 + pipeline_0_7;
	pipeline_2_0 <= pipeline_1_0 + pipeline_1_1;
	pipeline_2_1 <= pipeline_1_2 + pipeline_1_3;
	pipeline_3_0 <= pipeline_2_0 + pipeline_2_1;
end

assign result = pipeline_3_0;

endmodule
