`define cavlc_idle_bit     				0
`define cavlc_read_total_coeffs_bit	1
`define cavlc_read_t1s_flags_bit	2
`define cavlc_read_level_prefix_bit     3
`define cavlc_read_level_suffix_bit     4
`define cavlc_calc_level_bit		5
`define cavlc_read_total_zeros_bit  	6
`define cavlc_read_run_befores_bit  	7
`define cavlc_idle_s     		8'b00000001
`define cavlc_read_total_coeffs_s     	8'b00000010
`define cavlc_read_t1s_flags_s		8'b00000100
`define cavlc_read_level_prefix_s     	8'b00001000
`define cavlc_read_level_suffix_s     	8'b00010000
`define cavlc_calc_level_s		8'b00100000
`define cavlc_read_total_zeros_s    	8'b01000000
`define cavlc_read_run_befores_s    	8'b10000000

module cavlc_read_levels (
    clk,
    rst_n,
    ena,
    t1s_sel,
    prefix_sel,
    suffix_sel,
    calc_sel,
    TrailingOnes,
    TotalCoeff,
    rbsp,
    i,
    level_0,
    level_1,
    level_2,
    level_3,
    level_4,
    level_5,
    level_6,
    level_7,
    level_8,
    level_9,
    level_10,
    level_11,
    level_12,
    level_13,
    level_14,
    level_15,
    len_comb
);
//------------------------
// ports
//------------------------
input   clk;
input   rst_n;

input   ena;
input   t1s_sel;
input   prefix_sel;
input   suffix_sel;
input   calc_sel;

input   [1:0]   TrailingOnes;
input   [4:0]   TotalCoeff;
input   [0:15]  rbsp;
input   [3:0]   i;

output  [8:0]   level_0;
output  [8:0]   level_1;
output  [8:0]   level_2;
output  [8:0]   level_3;
output  [8:0]   level_4;
output  [8:0]   level_5;
output  [8:0]   level_6;
output  [8:0]   level_7;
output  [8:0]   level_8;
output  [8:0]   level_9;
output  [8:0]   level_10;
output  [8:0]   level_11;
output  [8:0]   level_12;
output  [8:0]   level_13;
output  [8:0]   level_14;
output  [8:0]   level_15;

output  [4:0]   len_comb;

//------------------------
//  regs
//------------------------
reg     [0:15]  rbsp_internal;        // reduce toggle rate
reg     [3:0]   level_prefix_comb;
reg     [8:0]   level_suffix;
reg     [4:0]   len_comb;

//------------------------
// FFs
//------------------------
reg     [3:0]   level_prefix;
reg     [2:0]   suffixLength;   // range from 0 to 6
reg     [8:0]   level;
reg     [8:0]   level_abs;
reg     [8:0]   level_code_tmp;
reg     [8:0]   level_0, level_1, level_2, level_3, level_4, level_5, level_6, level_7;
reg     [8:0]   level_8, level_9, level_10, level_11, level_12, level_13, level_14, level_15;

//------------------------
// level_prefix_comb
//------------------------
always @(*)
if ((t1s_sel || prefix_sel || suffix_sel)&& ena)
    rbsp_internal <= rbsp;
else
    rbsp_internal <= 'hffff;

always @(*)
if (rbsp_internal[0])         level_prefix_comb <= 0;
else if (rbsp_internal[1])    level_prefix_comb <= 1;
else if (rbsp_internal[2])    level_prefix_comb <= 2;
else if (rbsp_internal[3])    level_prefix_comb <= 3;
else if (rbsp_internal[4])    level_prefix_comb <= 4;
else if (rbsp_internal[5])    level_prefix_comb <= 5;
else if (rbsp_internal[6])    level_prefix_comb <= 6;
else if (rbsp_internal[7])    level_prefix_comb <= 7;
else if (rbsp_internal[8])    level_prefix_comb <= 8;
else if (rbsp_internal[9])    level_prefix_comb <= 9;
else if (rbsp_internal[10])   level_prefix_comb <= 10;
else if (rbsp_internal[11])   level_prefix_comb <= 11;
else if (rbsp_internal[12])   level_prefix_comb <= 12; 
else if (rbsp_internal[13])   level_prefix_comb <= 13; 
else if (rbsp_internal[14])   level_prefix_comb <= 14;
else if (rbsp_internal[15])   level_prefix_comb <= 15;
else                          level_prefix_comb <= 'bx;
    

//------------------------
// level_prefix
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n)
    level_prefix <= 0;
else if (prefix_sel && ena)
    level_prefix <= level_prefix_comb;

//------------------------
// suffixLength
//------------------------
wire first_level;
assign first_level = (i == TotalCoeff - TrailingOnes - 1);

always @(posedge clk or negedge rst_n)
if (!rst_n)
    suffixLength <= 0;
else if (prefix_sel && ena) begin
    if (TotalCoeff > 10 && TrailingOnes < 3 && first_level )  //initialize suffixLength before proceeding first level_suffix
        suffixLength <= 1;
    else if (first_level)
        suffixLength <= 0;
    else if (suffixLength == 0 && level_abs > 2'd3)
        suffixLength <= 2;
    else if (suffixLength == 0)
        suffixLength <= 1;
    else if (  level_abs > (2'd3 << (suffixLength - 1'b1) ) && suffixLength < 6)
        suffixLength <= suffixLength + 1'b1;
end


//------------------------
// level_suffix
//------------------------
always @(*)
if (suffixLength > 0 && level_prefix <= 14) 
    level_suffix <= {3'b0, rbsp_internal[0:5] >> (3'd6 - suffixLength)};
else if (level_prefix == 14)   //level_prefix == 14 && suffixLength == 0
    level_suffix <= {3'b0, rbsp_internal[0:3] };
else if (level_prefix == 15) 
    level_suffix <= rbsp_internal[3:11];     
else 
    level_suffix <= 0;      

//------------------------
// level_code_tmp
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    level_code_tmp <=  0;
end
else if (suffix_sel && ena) begin
    level_code_tmp <= (level_prefix << suffixLength) + level_suffix + 
    ((suffixLength == 0 && level_prefix == 15) ? 4'd15 : 0);
end


//------------------------
// level
//------------------------
wire    [2:0]   tmp1;

assign tmp1 = (first_level && TrailingOnes < 3)? 2'd2 : 2'd0;

always @(*)
begin
    if (level_code_tmp % 2 == 0) begin
        level <= ( level_code_tmp + tmp1 + 2 ) >> 1;
    end
    else begin
        level <= (-level_code_tmp - tmp1 - 1 ) >> 1;
    end
end

//------------------------
// level_abs
//------------------------
wire level_abs_refresh;
assign level_abs_refresh = calc_sel && ena;

always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    level_abs <= 0;
end
else if (level_abs_refresh) begin
    level_abs <= level[8] ? -level : level;
end

//------------------------
// level regfile
//------------------------
always @ (posedge clk or negedge rst_n)
if (!rst_n) begin
    level_0 <= 0;   level_1 <= 0;   level_2 <= 0;   level_3 <= 0;
    level_4 <= 0;   level_5 <= 0;   level_6 <= 0;   level_7 <= 0;
    level_8 <= 0;   level_9 <= 0;   level_10<= 0;   level_11<= 0;
    level_12<= 0;   level_13<= 0;   level_14<= 0;   level_15<= 0;
end
else if (t1s_sel && ena)
    case (i)
    0 : level_0 <= rbsp_internal[0]? -1 : 1;
    1 : begin
            level_1 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_0 <= rbsp_internal[1]? -1 : 1;
        end
    2 : begin
            level_2 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_1 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_0 <= rbsp_internal[2]? -1 : 1;
        end         
    3 : begin
            level_3 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_2 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_1 <= rbsp_internal[2]? -1 : 1;
        end 
    4 : begin
            level_4 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_3 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_2 <= rbsp_internal[2]? -1 : 1;
        end 
    5 : begin
            level_5 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_4 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_3 <= rbsp_internal[2]? -1 : 1;
        end 
    6 : begin
            level_6 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_5 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_4 <= rbsp_internal[2]? -1 : 1;
        end 
    7 : begin
            level_7 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_6 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_5 <= rbsp_internal[2]? -1 : 1;
        end 
    8 : begin
            level_8 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_7 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_6 <= rbsp_internal[2]? -1 : 1;
        end 
    9 : begin
            level_9 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_8 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_7 <= rbsp_internal[2]? -1 : 1;
        end 
    10: begin
            level_10 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_9 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_8 <= rbsp_internal[2]? -1 : 1;
        end 
    11: begin
            level_11 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_10 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_9 <= rbsp_internal[2]? -1 : 1;
        end 
    12: begin
            level_12 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_11 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_10 <= rbsp_internal[2]? -1 : 1;
        end 
    13: begin
            level_13 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_12 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_11 <= rbsp_internal[2]? -1 : 1;
        end 
    14: begin
            level_14 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_13 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_12 <= rbsp_internal[2]? -1 : 1;
        end 
    15: begin
            level_15 <= rbsp_internal[0]? -1 : 1;
            if (TrailingOnes[1])
                level_14 <= rbsp_internal[1]? -1 : 1;
            if (TrailingOnes == 3)
                level_13 <= rbsp_internal[2]? -1 : 1;
        end 
endcase
else if (calc_sel && ena)
case (i)
    0 :level_0 <= level;
    1 :level_1 <= level;
    2 :level_2 <= level;
    3 :level_3 <= level;
    4 :level_4 <= level;
    5 :level_5 <= level;
    6 :level_6 <= level;
    7 :level_7 <= level;
    8 :level_8 <= level;
    9 :level_9 <= level;
    10:level_10<= level;
    11:level_11<= level;
    12:level_12<= level;
    13:level_13<= level;
    14:level_14<= level;
    15:level_15<= level;
endcase

always @(*)
if(t1s_sel)
    len_comb <= TrailingOnes;
else if(prefix_sel)
    len_comb <= level_prefix_comb + 1;
else if(suffix_sel && suffixLength > 0 && level_prefix <= 14)
    len_comb <= suffixLength;  
else if(suffix_sel && level_prefix == 14)
    len_comb <= 4;
else if(suffix_sel && level_prefix == 15)
    len_comb <= 12;
else
    len_comb <= 0;        

endmodule
