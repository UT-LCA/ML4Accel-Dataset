`define DEBUG

module common_network
#(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] x2_y1,
    input [DATA_WIDTH-1:0] x2_y0,
    input [DATA_WIDTH-1:0] x2_ym1,
    input [DATA_WIDTH-1:0] x1_y1,
    input [DATA_WIDTH-1:0] x1_y0,
    input [DATA_WIDTH-1:0] x1_ym1,
    input [DATA_WIDTH-1:0] x0_y1,
    input [DATA_WIDTH-1:0] x0_y0,
    input [DATA_WIDTH-1:0] x0_ym1,
    input [DATA_WIDTH-1:0] xm1_y1,
    input [DATA_WIDTH-1:0] xm1_y0,
    input [DATA_WIDTH-1:0] xm1_ym1,

    output [DATA_WIDTH-1:0] c3l,
    output [DATA_WIDTH-1:0] c3h,
    output [DATA_WIDTH-1:0] c3m,
    output [DATA_WIDTH-1:0] c2l,
    output [DATA_WIDTH-1:0] c2h,
    output [DATA_WIDTH-1:0] c2m,
    output [DATA_WIDTH-1:0] c1l,
    output [DATA_WIDTH-1:0] c1h,
    output [DATA_WIDTH-1:0] c1m,
    output [DATA_WIDTH-1:0] c0h,
    output [DATA_WIDTH-1:0] c0m,
    output [DATA_WIDTH-1:0] c0l
);

    // Connection signals
    wire [DATA_WIDTH-1:0] node_u0_hi;
    wire [DATA_WIDTH-1:0] node_u0_lo;
    wire [DATA_WIDTH-1:0] node_u1_hi;
    wire [DATA_WIDTH-1:0] node_u1_lo;
    wire [DATA_WIDTH-1:0] node_u2_hi;
    wire [DATA_WIDTH-1:0] node_u2_lo;
    wire [DATA_WIDTH-1:0] node_u3_hi;
    wire [DATA_WIDTH-1:0] node_u3_lo;
    wire [DATA_WIDTH-1:0] node_u4_hi;
    wire [DATA_WIDTH-1:0] node_u4_lo;
    wire [DATA_WIDTH-1:0] node_u5_hi;
    wire [DATA_WIDTH-1:0] node_u5_lo;
    wire [DATA_WIDTH-1:0] node_u6_hi;
    wire [DATA_WIDTH-1:0] node_u6_lo;
    wire [DATA_WIDTH-1:0] node_u7_hi;
    wire [DATA_WIDTH-1:0] node_u7_lo;
    wire [DATA_WIDTH-1:0] node_u8_hi;
    wire [DATA_WIDTH-1:0] node_u8_lo;
    wire [DATA_WIDTH-1:0] node_u9_hi;
    wire [DATA_WIDTH-1:0] node_u9_lo;
    wire [DATA_WIDTH-1:0] node_u10_hi;
    wire [DATA_WIDTH-1:0] node_u10_lo;
    wire [DATA_WIDTH-1:0] node_u11_hi;
    wire [DATA_WIDTH-1:0] node_u11_lo;
    wire [DATA_WIDTH-1:0] node_u12_hi;
    wire [DATA_WIDTH-1:0] node_u12_lo;

    // Output assignment
    assign c3l = node_u4_lo;
    assign c3h = node_u8_hi;
    assign c3m = node_u8_lo;
    assign c2l = node_u5_lo;
    assign c2h = node_u9_hi;
    assign c2m = node_u9_lo;
    assign c1l = node_u6_lo;
    assign c1h = node_u10_hi;
    assign c1m = node_u10_lo;
    assign c0h = node_u11_hi;
    assign c0m = node_u11_lo;
    assign c0l = node_u7_lo;

    // Column 3
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u0 (
        .data_a(x2_y1),
        .data_b(x2_y0),

        .data_hi(node_u0_hi),
        .data_lo(node_u0_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u1 (
        .data_a(x1_y1),
        .data_b(x1_y0),

        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u2 (
        .data_a(x0_y1),
        .data_b(x0_y0),

        .data_hi(node_u2_hi),
        .data_lo(node_u2_lo)
    );

    // Column 2
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u3 (
        .data_a(xm1_y1),
        .data_b(xm1_y0),

        .data_hi(node_u3_hi),
        .data_lo(node_u3_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u4 (
        .data_a(node_u0_lo),
        .data_b(x2_ym1),

        .data_hi(node_u4_hi),
        .data_lo(node_u4_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u5 (
        .data_a(node_u1_lo),
        .data_b(x1_ym1),

        .data_hi(node_u5_hi),
        .data_lo(node_u5_lo)
    );

    // Column 1
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u6 (
        .data_a(node_u2_lo),
        .data_b(x0_ym1),

        .data_hi(node_u6_hi),
        .data_lo(node_u6_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(xm1_ym1),

        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u8 (
        .data_a(node_u0_hi),
        .data_b(node_u4_hi),

        .data_hi(node_u8_hi),
        .data_lo(node_u8_lo)
    );

    // Column 0
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u9 (
        .data_a(node_u1_hi),
        .data_b(node_u5_hi),

        .data_hi(node_u9_hi),
        .data_lo(node_u9_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u10 (
        .data_a(node_u2_hi),
        .data_b(node_u6_hi),

        .data_hi(node_u10_hi),
        .data_lo(node_u10_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // enable low output
        .HI_MUX(1) // enable high output
    ) node_u11 (
        .data_a(node_u3_hi),
        .data_b(node_u7_hi),

        .data_hi(node_u11_hi),
        .data_lo(node_u11_lo)
    );

endmodule

module node
#(
    parameter DATA_WIDTH = 8,
    parameter LOW_MUX = 1, // disable low output
    parameter HI_MUX = 1 // disable hight output
)(
    input [DATA_WIDTH-1:0] data_a,
    input [DATA_WIDTH-1:0] data_b,

    output reg [DATA_WIDTH-1:0] data_hi,
    output reg [DATA_WIDTH-1:0] data_lo
);


    reg sel0;

    always @(*)
    begin : comparator
        if(data_a < data_b) begin
            sel0 = 1'b0; // data_a : lo / data_b : hi
        end else begin
            sel0 = 1'b1; // data_b : lo / data_a : hi
        end
    end


    always @(*)
    begin : mux_lo_hi
        case (sel0)
            1'b0 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_a;
                if(HI_MUX == 1)
                    data_hi = data_b;
            end
            1'b1 :
            begin
                if(LOW_MUX == 1)
                    data_lo = data_b;
                if(HI_MUX == 1)
                    data_hi = data_a;
            end
            default :
            begin
                data_lo = {DATA_WIDTH{1'b0}};
                data_hi = {DATA_WIDTH{1'b0}};
            end
        endcase
    end

endmodule/* --------------------------------------------------------------------------------




