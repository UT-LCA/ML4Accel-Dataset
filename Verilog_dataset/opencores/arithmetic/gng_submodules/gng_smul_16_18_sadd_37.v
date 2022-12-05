
module gng_smul_16_18_sadd_37 (
    // System signals
    input clk,                  // system clock

    // Data interface
    input [15:0] a,             // multiplicand
    input [17:0] b,             // multiplicator
    input [36:0] c,             // adder
    output [37:0] p             // result
);

// Behavioral model
reg signed [15:0] a_reg;
reg signed [17:0] b_reg;
reg signed [36:0] c_reg;
reg signed [33:0] prod;
wire signed [37:0] sum;
reg [37:0] result;

always @ (posedge clk) begin
    a_reg <= a;
    b_reg <= b;
    c_reg <= c;
end

always @ (posedge clk) begin
    prod <= a_reg * b_reg;
end

assign sum = c_reg + prod;

always @ (posedge clk) begin
    result <= sum;
end

assign p = result;


endmodule
