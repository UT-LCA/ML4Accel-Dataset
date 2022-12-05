`define DEBUG

module pixel_network
#(
    parameter DATA_WIDTH = 8
)(
    input [DATA_WIDTH-1:0] c3h,
    input [DATA_WIDTH-1:0] c3m,
    input [DATA_WIDTH-1:0] c3l,
    input [DATA_WIDTH-1:0] c2h,
    input [DATA_WIDTH-1:0] c2m,
    input [DATA_WIDTH-1:0] c2l,
    input [DATA_WIDTH-1:0] c1h,
    input [DATA_WIDTH-1:0] c1m,
    input [DATA_WIDTH-1:0] c1l,

    output [DATA_WIDTH-1:0] median
);

    wire [DATA_WIDTH-1:0] node_u0_lo;
    wire [DATA_WIDTH-1:0] node_u1_hi;
    wire [DATA_WIDTH-1:0] node_u1_lo;
    wire [DATA_WIDTH-1:0] node_u2_hi;
    wire [DATA_WIDTH-1:0] node_u3_lo;
    wire [DATA_WIDTH-1:0] node_u4_hi;
    wire [DATA_WIDTH-1:0] node_u5_hi;
    wire [DATA_WIDTH-1:0] node_u6_lo;
    wire [DATA_WIDTH-1:0] node_u7_hi;
    wire [DATA_WIDTH-1:0] node_u7_lo;
    wire [DATA_WIDTH-1:0] node_u8_hi;

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u0 (
        .data_a(c3h),
        .data_b(c2h),

        // .data_hi(),
        .data_lo(node_u0_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u1 (
        .data_a(c3m),
        .data_b(c2m),

        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u2 (
        .data_a(c2l),
        .data_b(c1l),

        .data_hi(node_u2_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u3 (
        .data_a(node_u0_lo),
        .data_b(c1h),

        // .data_hi(),
        .data_lo(node_u3_lo)
    );
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u4 (
        .data_a(node_u1_lo),
        .data_b(c1m),

        .data_hi(node_u4_hi)
        // .data_lo()
    );
    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u5 (
        .data_a(c3l),
        .data_b(node_u2_hi),

        .data_hi(node_u5_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u6 (
        .data_a(node_u1_hi),
        .data_b(node_u4_hi),

        // .data_hi(),
        .data_lo(node_u6_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(node_u6_lo),

        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(0), // disable low output
        .HI_MUX(1) // disable hight output
    ) node_u8 (
        .data_a(node_u7_lo),
        .data_b(node_u5_hi),

        .data_hi(node_u8_hi)
        // .data_lo()
    );

    node
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .LOW_MUX(1), // disable low output
        .HI_MUX(0) // disable hight output
    ) node_u9 (
        .data_a(node_u7_hi),
        .data_b(node_u8_hi),

        // .data_hi(),
        .data_lo(median)
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





