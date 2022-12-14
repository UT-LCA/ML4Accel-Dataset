`define DEBUG

module state_machine
#(
    parameter LUT_ADDR_WIDTH = 10,
    parameter IMG_WIDTH = 234,
    parameter IMG_HEIGHT = 234
)(
    input clk, // Clock
    input rst_n, // Asynchronous reset active low

    output reg [LUT_ADDR_WIDTH-1:0] raddr_a,
    output reg [LUT_ADDR_WIDTH-1:0] raddr_b,
    output reg [LUT_ADDR_WIDTH-1:0] raddr_c,
    output reg [LUT_ADDR_WIDTH-1:0] waddr,
    output reg [1:0] window_line_counter,
    output reg [9:0] window_column_counter,
    output reg [9:0] memory_shift
);

    reg valid;

    always @(posedge clk or negedge rst_n)
    begin : out_memory_counter
        if(~rst_n) begin
            waddr <= {LUT_ADDR_WIDTH{1'b0}};
        end else if(valid) begin
            waddr <= waddr + 1'b1;
        end
    end

    always @(posedge clk or negedge rst_n)
    begin : addr_counter
        if(~rst_n) begin
            window_column_counter <= 10'd0;
            window_line_counter <= 2'b00;
            raddr_a <= {LUT_ADDR_WIDTH{1'b0}};
            raddr_b <= {LUT_ADDR_WIDTH{1'b0}};
            raddr_c <= {LUT_ADDR_WIDTH{1'b0}};
        end else begin
            if(window_column_counter != ((IMG_WIDTH/4)-1)) begin
                window_column_counter <= window_column_counter + 1'b1;
                valid <= 1'b1;
                raddr_a <= raddr_a + 1'b1;
                raddr_b <= raddr_b + 1'b1;
                raddr_c <= raddr_c + 1'b1;
            end else begin
                window_column_counter <= 10'd0;
                case (window_line_counter)
                    2'b00 :
                    begin
                        raddr_a <= raddr_a + 1'b1;
                        raddr_b <= raddr_b - window_column_counter;
                        raddr_c <= raddr_c - window_column_counter;
                        window_line_counter = window_line_counter + 1'b1;
                    end
                    2'b01 :
                    begin
                        raddr_b <= raddr_b + 1'b1;
                        raddr_a <= raddr_a - window_column_counter;
                        raddr_c <= raddr_c - window_column_counter;
                        window_line_counter = window_line_counter + 1'b1;
                    end
                    2'b10 :
                    begin
                        raddr_b <= raddr_b - window_column_counter;
                        raddr_a <= raddr_a - window_column_counter;
                        raddr_c <= raddr_c + 1'b1;
                        window_line_counter = 2'b00;
                    end
                    default :
                    begin
                        raddr_a <= {LUT_ADDR_WIDTH{1'b0}};
                        raddr_b <= {LUT_ADDR_WIDTH{1'b0}};
                        raddr_c <= {LUT_ADDR_WIDTH{1'b0}};
                    end
                endcase
            end
        end
    end

endmodule
