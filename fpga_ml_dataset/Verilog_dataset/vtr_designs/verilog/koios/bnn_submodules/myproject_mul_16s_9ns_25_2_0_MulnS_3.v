
module myproject_mul_16s_9ns_25_2_0_MulnS_3(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [9 - 1 : 0] b;
output[25 - 1 : 0] p;
reg  [25 - 1 : 0] p;
wire  [25 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule
