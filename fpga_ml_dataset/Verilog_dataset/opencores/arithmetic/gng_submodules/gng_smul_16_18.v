
module gng_smul_16_18 (
    // System signals
    input clk,                  // system clock

    // Data interface
    input [15:0] a,             // multiplicand
    input [17:0] b,             // multiplicator
    output [33:0] p             // result
);

// Behavioral model
reg signed [15:0] a_reg;
reg signed [17:0] b_reg;
reg signed [33:0] prod;

always @ (posedge clk) begin
    a_reg <= a;
    b_reg <= b;
end

always @ (posedge clk) begin
    prod <= a_reg * b_reg;
end

assign p = prod;


endmodule
