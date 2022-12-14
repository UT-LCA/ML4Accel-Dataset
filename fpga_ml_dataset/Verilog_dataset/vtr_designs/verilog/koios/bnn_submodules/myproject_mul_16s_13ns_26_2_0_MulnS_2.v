
module myproject_mul_16s_13ns_26_2_0_MulnS_2(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [13 - 1 : 0] b;
output[26 - 1 : 0] p;
reg  [26 - 1 : 0] p;
wire  [26 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule
