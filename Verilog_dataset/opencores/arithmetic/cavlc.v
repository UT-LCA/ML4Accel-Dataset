//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_fsm                                                   ////
////                                                              ////
////  Description                                                 ////
////      controls the cavlc parsing process                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-7 18:57    initial revision

`timescale 1ns / 1ns // timescale time_unit/time_presicion

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


module cavlc_fsm
(
    clk,
    rst_n,
    ena,
    start,
    max_coeff_num,
    TotalCoeff,
    TotalCoeff_comb,
    TrailingOnes,
    TrailingOnes_comb,
    ZeroLeft,
    state,
    i,
    idle,
    valid
);
//------------------------
//ports
//------------------------
input  clk;
input  rst_n;
input  ena;
input  start;

input  [4:0]  max_coeff_num;
input  [4:0]  TotalCoeff;
input  [4:0]  TotalCoeff_comb;
input  [1:0]  TrailingOnes;
input  [1:0]  TrailingOnes_comb;
input  [3:0]  ZeroLeft;

output [7:0]  state;
output [3:0]  i;
output idle;
output valid;

//------------------------
//FFs
//------------------------
reg  [7:0]  state;
reg  [3:0]  i;
reg  valid;

//------------------------
//state & i & valid
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    state   <= `cavlc_idle_s;
    i <= 0;
    valid <= 0;
end
else if (ena)
case(state)
    `cavlc_idle_s : begin
        if (start) begin
            state <= `cavlc_read_total_coeffs_s;
            valid <= 0;
        end
        else begin
            state <= `cavlc_idle_s;
        end     
    end
    `cavlc_read_total_coeffs_s : begin
        i <= TotalCoeff_comb -1;
        if (TrailingOnes_comb > 0 && TotalCoeff_comb > 0)
            state <= `cavlc_read_t1s_flags_s;
        else if (TotalCoeff_comb > 0)
            state <= `cavlc_read_level_prefix_s;
        else begin
            state <= `cavlc_idle_s;     
            valid <= 1;
        end
    end
    `cavlc_read_t1s_flags_s : begin
        if (TrailingOnes == TotalCoeff)
            state <= `cavlc_read_total_zeros_s;         
        else begin
            state <= `cavlc_read_level_prefix_s;
            i <= i - TrailingOnes;
        end
    end
    `cavlc_read_level_prefix_s : begin
        state <= `cavlc_read_level_suffix_s;        
    end
    `cavlc_read_level_suffix_s : begin
        state <= `cavlc_calc_level_s;       
    end
    `cavlc_calc_level_s : begin
        if ( i == 0  && TotalCoeff < max_coeff_num)
            state <= `cavlc_read_total_zeros_s;
        else if (i == 0) begin
            state <= `cavlc_read_run_befores_s;
            i <= TotalCoeff - 1;
        end
        else begin
            state <= `cavlc_read_level_prefix_s;
            i <= i - 1;
        end
    end 
    `cavlc_read_total_zeros_s : begin
        state <= `cavlc_read_run_befores_s;
        i <= TotalCoeff - 1;
    end
    `cavlc_read_run_befores_s : begin
        if (i == 0 || ZeroLeft == 0) begin
            state <= `cavlc_idle_s;
            valid <= 1;
        end
        else begin
            state <= `cavlc_read_run_befores_s;
            i <= i - 1;
        end
    end     
endcase

assign idle = state[`cavlc_idle_bit];

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_len_gen                                               ////
////                                                              ////
////  Description                                                 ////
////      generate the number of bits to forward                  ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-7 20:19    initial revision


module cavlc_len_gen
(
    cavlc_state,
    len_read_total_coeffs_comb,
    len_read_levels_comb,
    len_read_total_zeros_comb,
    len_read_run_befores_comb,
    len_comb
);
//------------------------
// ports
//------------------------
input  [7:0] cavlc_state;
input  [4:0] len_read_total_coeffs_comb;
input  [4:0] len_read_levels_comb;
input  [3:0] len_read_total_zeros_comb;
input  [3:0] len_read_run_befores_comb;

output [4:0] len_comb;

//------------------------
// regs
//------------------------
reg [4:0] len_comb;         //number of bits comsumed by cavlc in a cycle

//------------------------
// len_comb
//------------------------
always @ (*)
case (1'b1) //synthesis parallel_case
    cavlc_state[`cavlc_read_total_coeffs_bit]  : len_comb <= len_read_total_coeffs_comb;
    cavlc_state[`cavlc_read_t1s_flags_bit],  
    cavlc_state[`cavlc_read_level_prefix_bit],
    cavlc_state[`cavlc_read_level_suffix_bit]  : len_comb <= len_read_levels_comb;       
    cavlc_state[`cavlc_read_total_zeros_bit]   : len_comb <= len_read_total_zeros_comb;
    cavlc_state[`cavlc_read_run_befores_bit]   : len_comb <= len_read_run_befores_comb;
    cavlc_state[`cavlc_calc_level_bit],
    cavlc_state[`cavlc_idle_bit]               : len_comb <= 0;
    default                                    : len_comb <= 'bx;
endcase

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_read_levels                                           ////
////                                                              ////
////  Description                                                 ////
////      decode levels for coeffs                                ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


//2011-8-6  initiial revision
//2011-8-19 reverse the order of level

//  include TrailingOnes

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
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_read_run_befores                                      ////
////                                                              ////
////  Description                                                 ////
////       decode runs and combine them with levels               ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-16 initiial revision


module cavlc_read_run_befores
(
    clk,
    rst_n,
    ena,
    sel,
    clr,
    ZeroLeft_init,
    
    rbsp,
    i,
    TotalZeros_comb,
    
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
        
    coeff_0,
    coeff_1,
    coeff_2,
    coeff_3,
    coeff_4,
    coeff_5,
    coeff_6,
    coeff_7,
    coeff_8,
    coeff_9,
    coeff_10,
    coeff_11,
    coeff_12,
    coeff_13,
    coeff_14,
    coeff_15,
    ZeroLeft,
    len_comb
);  
//----------------------
//ports
//----------------------
input   clk;
input   rst_n;
input   ena;
input   sel;
input   clr;
input   ZeroLeft_init;

input   [0:10]  rbsp;
input   [3:0]   i;          //range from TotalCoeff-1 to 0
input   [3:0]   TotalZeros_comb;

input   [8:0]   level_0;
input   [8:0]   level_1;
input   [8:0]   level_2;
input   [8:0]   level_3;
input   [8:0]   level_4;
input   [8:0]   level_5;
input   [8:0]   level_6;
input   [8:0]   level_7;
input   [8:0]   level_8;
input   [8:0]   level_9;
input   [8:0]   level_10;
input   [8:0]   level_11;
input   [8:0]   level_12;
input   [8:0]   level_13;
input   [8:0]   level_14;
input   [8:0]   level_15;

output  [8:0]   coeff_0;
output  [8:0]   coeff_1;
output  [8:0]   coeff_2;
output  [8:0]   coeff_3;
output  [8:0]   coeff_4;
output  [8:0]   coeff_5;
output  [8:0]   coeff_6;
output  [8:0]   coeff_7;
output  [8:0]   coeff_8;
output  [8:0]   coeff_9;
output  [8:0]   coeff_10;
output  [8:0]   coeff_11;
output  [8:0]   coeff_12;
output  [8:0]   coeff_13;
output  [8:0]   coeff_14;
output  [8:0]   coeff_15;

output  [3:0]   ZeroLeft;

output  [3:0]   len_comb;

//----------------------
//regs
//----------------------
reg     [3:0]   run;
reg     [3:0]   len;
reg     [8:0]   coeff;


reg     [3:0]   len_comb;

//----------------------
//FFs
//----------------------
reg     [3:0]   ZeroLeft;

reg     [8:0]   coeff_0;
reg     [8:0]   coeff_1;
reg     [8:0]   coeff_2;
reg     [8:0]   coeff_3;
reg     [8:0]   coeff_4;
reg     [8:0]   coeff_5;
reg     [8:0]   coeff_6;
reg     [8:0]   coeff_7;
reg     [8:0]   coeff_8;
reg     [8:0]   coeff_9;
reg     [8:0]   coeff_10;
reg     [8:0]   coeff_11;
reg     [8:0]   coeff_12;
reg     [8:0]   coeff_13;
reg     [8:0]   coeff_14;
reg     [8:0]   coeff_15;

//----------------------
//run & len
//----------------------
always @(rbsp or ZeroLeft or ena or sel)
if (ena && sel)
case(ZeroLeft)
    0 : begin len <= 0; run <= 0; end
    1 : begin len <= 1; run <= rbsp[0]? 0:1; end
    2 : begin if (rbsp[0]) begin
            run <= 0;
            len <= 1;
        end
        else if (rbsp[1]) begin
            run <= 1;
            len <= 2;
        end 
        else begin
            run <= 2;
            len <= 2;
        end
    end
    3 : begin
        run <= 3 - rbsp[0:1];
        len <= 2;
    end
    4 : begin
        if (rbsp[0:1] != 0) begin
            run <= 3 - rbsp[0:1];
            len <= 2;
        end
        else begin
            run <= rbsp[2]? 3:4;
            len <= 3;
        end
    end
    5 : begin
        if (rbsp[0]) begin
            run <= rbsp[1]? 0:1;
            len <= 2;
        end
        else if (rbsp[1]) begin
            run <= rbsp[2]? 2:3;
            len <= 3;
        end     
        else begin
            run <= rbsp[2]? 4:5;
            len <= 3;       
        end
    end
    6 : begin
        if (rbsp[0:1] == 2'b11) begin
            run <= 0;
            len <= 2;
        end
        else begin
            len <= 3;
            case(rbsp[0:2])
                3'b000 : run <= 1;
                3'b001 : run <= 2;
                3'b011 : run <= 3;
                3'b010 : run <= 4;
                3'b101 : run <= 5;
                default: run <= 6;
            endcase
        end     
    end
    default : begin
        if (rbsp[0:2] != 0) begin
            run <= 7 - rbsp[0:2];
            len <= 3;
        end
        else begin
            case (1'b1)
                rbsp[3] : begin run <= 7;   len <= 4; end
                rbsp[4] : begin run <= 8;   len <= 5; end
                rbsp[5] : begin run <= 9;   len <= 6; end
                rbsp[6] : begin run <= 10;  len <= 7; end
                rbsp[7] : begin run <= 11;  len <= 8; end
                rbsp[8] : begin run <= 12;  len <= 9; end
                rbsp[9] : begin run <= 13;  len <= 10;end
                rbsp[10]: begin run <= 14;  len <= 11;end
                default : begin run <= 'bx; len <='bx;end
            endcase
        end
    end
endcase
else begin
    len <= 0;
    run <= 0;
end

//----------------------
//len_comb
//----------------------
always @(*)
if (i >  0)
    len_comb <= len;
else
    len_comb <= 0;
    
    
//----------------------
//ZeroLeft
//----------------------
always @(posedge clk or negedge rst_n)
if (!rst_n)
    ZeroLeft <= 0;
else if (ena && clr)    //in case TotalCoeff >= max_coeff_num
    ZeroLeft <= 0;
else if (ena && ZeroLeft_init)
    ZeroLeft <= TotalZeros_comb;
else if (ena && sel )//if ZeroLeft == 0, run will be 0
    ZeroLeft <= ZeroLeft - run; 
        
//----------------------
//coeff
//----------------------
always @(*)
if (ena && sel)
case (i)
    0 :coeff <= level_0;
    1 :coeff <= level_1;
    2 :coeff <= level_2;
    3 :coeff <= level_3;
    4 :coeff <= level_4;
    5 :coeff <= level_5;    
    6 :coeff <= level_6;
    7 :coeff <= level_7;
    8 :coeff <= level_8;
    9 :coeff <= level_9;
    10:coeff <= level_10;
    11:coeff <= level_11;       
    12:coeff <= level_12;
    13:coeff <= level_13;
    14:coeff <= level_14;
    15:coeff <= level_15;
endcase
else
    coeff <= 0;

//----------------------
//coeff_0 to coeff_15
//----------------------
always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    coeff_0 <= 0;   coeff_1 <= 0;   coeff_2 <= 0;   coeff_3 <= 0;
    coeff_4 <= 0;   coeff_5 <= 0;   coeff_6 <= 0;   coeff_7 <= 0;
    coeff_8 <= 0;   coeff_9 <= 0;   coeff_10<= 0;   coeff_11<= 0;
    coeff_12<= 0;   coeff_13<= 0;   coeff_14<= 0;   coeff_15<= 0;
end
else if (ena && clr) begin
    coeff_0 <= 0;   coeff_1 <= 0;   coeff_2 <= 0;   coeff_3 <= 0;
    coeff_4 <= 0;   coeff_5 <= 0;   coeff_6 <= 0;   coeff_7 <= 0;
    coeff_8 <= 0;   coeff_9 <= 0;   coeff_10<= 0;   coeff_11<= 0;
    coeff_12<= 0;   coeff_13<= 0;   coeff_14<= 0;   coeff_15<= 0;
end
else if (ena && sel && ZeroLeft > 0)
case (ZeroLeft+i)
    1 :coeff_1  <= coeff;
    2 :coeff_2  <= coeff;
    3 :coeff_3  <= coeff;
    4 :coeff_4  <= coeff;
    5 :coeff_5  <= coeff;
    6 :coeff_6  <= coeff;
    7 :coeff_7  <= coeff;
    8 :coeff_8  <= coeff;
    9 :coeff_9  <= coeff;
    10:coeff_10 <= coeff;
    11:coeff_11 <= coeff;
    12:coeff_12 <= coeff;
    13:coeff_13 <= coeff;
    14:coeff_14 <= coeff;
    default:
    coeff_15    <= coeff;
endcase
else if (ena && sel) begin
    if (i >= 0) coeff_0  <= level_0;
    if (i >= 1) coeff_1  <= level_1;
    if (i >= 2) coeff_2  <= level_2;
    if (i >= 3) coeff_3  <= level_3;
    if (i >= 4) coeff_4  <= level_4;
    if (i >= 5) coeff_5  <= level_5;
    if (i >= 6) coeff_6  <= level_6;
    if (i >= 7) coeff_7  <= level_7;
    if (i >= 8) coeff_8  <= level_8;
    if (i >= 9) coeff_9  <= level_9;
    if (i >= 10)coeff_10 <= level_10;
    if (i >= 11)coeff_11 <= level_11;
    if (i >= 12)coeff_12 <= level_12;
    if (i >= 13)coeff_13 <= level_13;
    if (i >= 14)coeff_14 <= level_14;
    if (i == 15)coeff_15 <= level_15;
end
endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_read_total_coeffs                                     ////
////                                                              ////
////  Description                                                 ////
////      decode total_coeffs and trailing ones                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-7  initial creation
//2011-8-9  optimize output mux



module cavlc_read_total_coeffs
(
    clk,
    rst_n,
    ena,
    start,
    sel,
    rbsp, nC,
    TrailingOnes,
    TotalCoeff,
    TrailingOnes_comb,
    TotalCoeff_comb,
    len_comb
);
//------------------------
//ports
//------------------------
input   clk;
input   rst_n;
input   ena;
input   start;
input   sel;

input   [0:15]   rbsp;
input   signed   [5:0]   nC;

output  [4:0]  TotalCoeff;        //range from 0 to 16
output  [1:0]  TrailingOnes;      //range from 0 to 3   
output  [4:0]  TotalCoeff_comb;   //unsaved result of TotalCoeff_comb
output  [1:0]  TrailingOnes_comb; //unsaved result of TrailingOnes_comb
output  [4:0]  len_comb;          //indicate how many rbsp bit consumed, range from 0 to 16


//------------------------
//regs
//------------------------
reg     [4:0]   TotalCoeff_comb;
reg     [1:0]   TrailingOnes_comb;
reg     [4:0]   len_comb;

//for nC >= 0 && nC < 2
reg     [4:0]   TotalCoeff_1;
reg     [1:0]   TrailingOnes_1;
reg     [4:0]   len_1;

//for nC >= 2 && nC < 4
reg     [4:0]   TotalCoeff_2;
reg     [1:0]   TrailingOnes_2;
reg     [4:0]   len_2;

//for nC >= 4 && nC < 8
reg     [4:0]   TotalCoeff_3;
reg     [1:0]   TrailingOnes_3;
reg     [4:0]   len_3;

//for nC >= 8
reg     [4:0]   TotalCoeff_4;
reg     [1:0]   TrailingOnes_4;
reg     [4:0]   len_4;

//for nC == -1
reg     [4:0]   TotalCoeff_5;
reg     [1:0]   TrailingOnes_5;
reg     [4:0]   len_5;


//------------------------
//FFs
//------------------------
//len is not necessary to be saved
//TotalCoeff & TrailingOnes should be valid when cavlc_state == `cavlc_read_total_coeffs_s
//to do that,combinational result "TotalCoeff_comb & TrailingOnes_comb" are outputed
reg     [0:15]  rbsp_1;         
reg     [0:13]  rbsp_2;
reg     [0:9]   rbsp_3;
reg     [0:5]   rbsp_4;
reg     [0:7]   rbsp_5;

reg     [4:0]   TotalCoeff;
reg     [1:0]   TrailingOnes;

//------------------------
//input mux
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n)
begin
        rbsp_1 <=  0;
        rbsp_2 <=  0;
        rbsp_3 <=  0;
        rbsp_4 <=  0;
        rbsp_5 <=  0;

end
else if (ena && start)
begin
    if (nC[5])
        rbsp_5 <=  rbsp[0:7];
    else if ( nC[4] || nC[3])
        rbsp_4 <= rbsp[0:5];
    else if (nC[2])
        rbsp_3 <= rbsp[0:9];
    else if (nC[1])
        rbsp_2 <= rbsp[0:13];
    else
        rbsp_1 <= rbsp;
end
//------------------------
//nC >= 0 && nC < 2                 
//------------------------
always @(rbsp_1)
case (1'b1) 
rbsp_1[0] : begin
    TrailingOnes_1  <= 0;
    TotalCoeff_1    <= 0;
    len_1           <= 1;
end
rbsp_1[1] : begin
    TrailingOnes_1  <= 1;
    TotalCoeff_1    <= 1;
    len_1           <= 2;
end
rbsp_1[2] : begin
    TrailingOnes_1  <= 2;
    TotalCoeff_1    <= 2;
    len_1           <= 3;
end
rbsp_1[3] : begin
    if (rbsp_1[4] == 'b1) begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 3;
        len_1           <= 5;
    end
    else if (rbsp_1[5] == 'b1) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 1;
        len_1           <= 6;
    end
    else begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 2;
        len_1           <= 6;
    end
end
rbsp_1[4] : begin
    if (rbsp_1[5] == 'b1) begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 4;
        len_1           <= 6;
    end
    else if (rbsp_1[6] == 'b1) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 3;
        len_1           <= 7;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 5;
        len_1           <= 7;
    end
end
rbsp_1[5] : begin
    len_1           <= 8;
    if (rbsp_1[6:7] == 'b11) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 2;
    end
    else if (rbsp_1[6:7] == 'b10) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 3;
    end
    else if (rbsp_1[6:7] == 'b01) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 4;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 6;
    end
end
rbsp_1[6] : begin
    len_1           <= 9;
    if (rbsp_1[7:8] == 2'b11) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 3;
    end
    else if (rbsp_1[7:8] == 2'b10) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 4;
    end
    else if (rbsp_1[7:8] == 2'b01) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 5;
    end
    else  begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 7;
    end
end
rbsp_1[7] : begin
    len_1           <= 10;
    if (rbsp_1[8:9] == 2'b11) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 4;
    end
    else if (rbsp_1[8:9] == 2'b10) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 5;
    end
    else if (rbsp_1[8:9] == 2'b01) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 6;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 8;
    end
end
rbsp_1[8] : begin
    len_1           <= 11;
    if (rbsp_1[9:10] == 2'b11) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 5;
    end
    else if (rbsp_1[9:10] == 2'b10) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 6;
    end
    else if (rbsp_1[9:10] == 2'b01) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 7;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 9;
    end
end
rbsp_1[9] : begin
    len_1           <= 13;
    if (rbsp_1[10:12] == 3'b111) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 6;
    end
    else if (rbsp_1[10:12] == 3'b011) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 7;
    end
    else if (rbsp_1[10:12] == 3'b110) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 7;
    end
    else if (rbsp_1[10:12] == 3'b000) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 8;
    end
    else if (rbsp_1[10:12] == 3'b010) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 8;
    end
    else if (rbsp_1[10:12] == 3'b101) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 8;
    end
    else if (rbsp_1[10:12] == 3'b001) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 9;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 10;
    end
end
rbsp_1[10] : begin
    len_1           <= 14;
    if (rbsp_1[11:13] == 3'b111) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 9;
    end
    else if (rbsp_1[11:13] == 3'b110) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 9;
    end
    else if (rbsp_1[11:13] == 3'b011) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 10;
    end
    else if (rbsp_1[11:13] == 3'b010) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 10;
    end
    else if (rbsp_1[11:13] == 3'b101) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 10;
    end
    else if (rbsp_1[11:13] == 3'b001) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 11;
    end
    else if (rbsp_1[11:13] == 3'b100) begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 11;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 12;
    end
end
rbsp_1[11] : begin
    len_1           <= 15;
    if (rbsp_1[12:14] == 3'b111) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 11;
    end
    else if (rbsp_1[12:14] == 3'b110) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 11;
    end
    else if (rbsp_1[12:14] == 3'b011) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 12;
    end
    else if (rbsp_1[12:14] == 3'b010) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 12;
    end
    else if (rbsp_1[12:14] == 3'b101) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 12;
    end
    else if (rbsp_1[12:14] == 3'b001) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 13;
    end
    else if (rbsp_1[12:14] == 3'b100) begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 13;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 14;
    end
end
rbsp_1[12] : begin
    len_1           <= 16;
    if (rbsp_1[13:15] == 3'b111) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 13;
    end
    else if (rbsp_1[13:15] == 3'b011) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 14;
    end
    else if (rbsp_1[13:15] == 3'b110) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 14;
    end
    else if (rbsp_1[13:15] == 3'b101) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 14;
    end
    else if (rbsp_1[13:15] == 3'b010) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 15;
    end
    else if (rbsp_1[13:15] == 3'b001) begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 15;
    end
    else if (rbsp_1[13:15] == 3'b100) begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 15;
    end
    else begin
        TrailingOnes_1  <= 3;
        TotalCoeff_1    <= 16;
    end
end
rbsp_1[13] : begin
    len_1           <= 16;
    if (rbsp_1[14:15] == 2'b11) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 15;
    end
    else if (rbsp_1[14:15] == 2'b00) begin
        TrailingOnes_1  <= 0;
        TotalCoeff_1    <= 16;
    end
    else if (rbsp_1[14:15] == 2'b10) begin
        TrailingOnes_1  <= 1;
        TotalCoeff_1    <= 16;
    end
    else begin
        TrailingOnes_1  <= 2;
        TotalCoeff_1    <= 16;
    end
end
default : begin
    len_1           <= 15;
    TrailingOnes_1  <= 1;
    TotalCoeff_1    <= 13;
end
endcase

//------------------------
//nC >= 2 && nC < 4
//------------------------
always @(rbsp_2)
case (1'b1) 
rbsp_2[0] : begin
    len_2           <= 2;
    if (rbsp_2[1] == 'b1) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 0;
    end
    else begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 1;
    end
end
rbsp_2[1] : begin
    if (rbsp_2[2] == 'b1) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 2;
        len_2           <= 3;
    end
    else if (rbsp_2[3] == 'b1) begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 3;
        len_2           <= 4;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 4;
        len_2           <= 4;
    end
end
rbsp_2[2] : begin
    if (rbsp_2[3:4] == 'b11) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 2;
        len_2           <= 5;
    end
    else if (rbsp_2[3:4] == 'b10) begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 5;
        len_2           <= 5;
    end
    else if (rbsp_2[4:5] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 1;
        len_2           <= 6;
    end
    else if (rbsp_2[4:5] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 3;
        len_2           <= 6;
    end
    else if (rbsp_2[4:5] == 'b01) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 3;
        len_2           <= 6;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 6;
        len_2           <= 6;
    end
end
rbsp_2[3] : begin
    len_2           <= 6;
    if (rbsp_2[4:5] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 2;
    end
    else if (rbsp_2[4:5] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 4;
    end
    else if (rbsp_2[4:5] == 'b01) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 4;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 7;
    end
end
rbsp_2[4] : begin
    len_2           <= 7;
    if (rbsp_2[5:6] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 3;
    end
    else if (rbsp_2[5:6] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 5;
    end
    else if (rbsp_2[5:6] == 'b01) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 5;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 8;
    end
end
rbsp_2[5] : begin
    len_2           <= 8;
    if (rbsp_2[6:7] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 4;
    end
    else if (rbsp_2[6:7] == 'b00) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 5;
    end
    else if (rbsp_2[6:7] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 6;
    end
    else begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 6;
    end
end
rbsp_2[6] : begin
    len_2           <= 9;
    if (rbsp_2[7:8] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 6;
    end
    else if (rbsp_2[7:8] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 7;
    end
    else if (rbsp_2[7:8] == 'b01) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 7;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 9;
    end
end
rbsp_2[7] : begin
    len_2           <= 11;
    if (rbsp_2[8:10] == 'b111) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 7;
    end
    else if (rbsp_2[8:10] == 'b011) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 8;
    end
    else if (rbsp_2[8:10] == 'b110) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 8;
    end
    else if (rbsp_2[8:10] == 'b101) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 8;
    end
    else if (rbsp_2[8:10] == 'b010) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 9;
    end
    else if (rbsp_2[8:10] == 'b001) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 9;
    end
    else if (rbsp_2[8:10] == 'b100) begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 10;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 11;
    end
end
rbsp_2[8] : begin
    len_2           <= 12;
    if (rbsp_2[9:11] == 'b111) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 9;
    end
    else if (rbsp_2[9:11] == 'b011) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 10;
    end
    else if (rbsp_2[9:11] == 'b110) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 10;
    end
    else if (rbsp_2[9:11] == 'b101) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 10;
    end
    else if (rbsp_2[9:11] == 'b000) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 11;
    end
    else if (rbsp_2[9:11] == 'b010) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 11;
    end
    else if (rbsp_2[9:11] == 'b001) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 11;
    end
    else  begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 12;
    end
end
rbsp_2[9] : begin
    len_2           <= 13;
    if (rbsp_2[10:12] == 'b111) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 12;
    end
    else if (rbsp_2[10:12] == 'b110) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 12;
    end
    else if (rbsp_2[10:12] == 'b101) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 12;
    end
    else if (rbsp_2[10:12] == 'b011) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 13;
    end
    else if (rbsp_2[10:12] == 'b010) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 13;
    end
    else if (rbsp_2[10:12] == 'b001) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 13;
    end
    else if (rbsp_2[10:12] == 'b100) begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 13;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 14;
    end
end
rbsp_2[10] : begin
    if (rbsp_2[11:12] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 14;
        len_2           <= 13;
    end
    else if (rbsp_2[11:12] == 'b10) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 14;
        len_2           <= 13;
    end
    else if (rbsp_2[12:13] == 'b11) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 14;
        len_2           <= 14;
    end
    else if (rbsp_2[12:13] == 'b01) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 15;
        len_2           <= 14;
    end
    else if (rbsp_2[12:13] == 'b00) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 15;
        len_2           <= 14;
    end
    else begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 15;
        len_2           <= 14;
    end
end
rbsp_2[11] : begin
    len_2           <= 14;
    if (rbsp_2[12:13] == 'b11) begin
        TrailingOnes_2  <= 0;
        TotalCoeff_2    <= 16;
    end
    else if (rbsp_2[12:13] == 'b10) begin
        TrailingOnes_2  <= 1;
        TotalCoeff_2    <= 16;
    end
    else if (rbsp_2[12:13] == 'b01) begin
        TrailingOnes_2  <= 2;
        TotalCoeff_2    <= 16;
    end
    else begin
        TrailingOnes_2  <= 3;
        TotalCoeff_2    <= 16;
    end
end
default : begin
    TrailingOnes_2  <= 3;
    TotalCoeff_2    <= 15;
    len_2           <= 13;
end
endcase

//------------------------
// nC >= 4 && nC < 8
//------------------------
always @(rbsp_3)
case (1'b1) 
rbsp_3[0] : begin
    len_3           <= 4;
    case (rbsp_3[1:3])
        'b111 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 0;
        end
        'b110 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 1;
        end
        'b101 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 2;
        end
        'b100 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 3;
        end
        'b011 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 4;
        end
        'b010 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 5;
        end
        'b001 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 6;
        end
        'b000 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 7;
        end
    endcase
end
rbsp_3[1] : begin
    len_3           <= 5;
    case (rbsp_3[2:4])
        'b111 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 2;
        end
        'b100 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 3;
        end
        'b110 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 3;
        end
        'b010 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 4;
        end
        'b011 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 4;
        end
        'b000 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 5;
        end
        'b001 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 5;
        end
        'b101 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 8;
        end
    endcase
end
rbsp_3[2] : begin
    len_3           <= 6;
    case (rbsp_3[3:5])
        3'b111 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 1;
        end
        3'b011 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 2;
        end
        3'b000 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 3;
        end
        3'b110 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 6;
        end
        3'b101 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 6;
        end
        3'b010 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 7;
        end
        3'b001 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 7;
        end
        3'b100 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 9;
        end
    endcase
end
rbsp_3[3] : begin
    len_3           <= 7;
    case (rbsp_3[4:6])
        'b111 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 4;
        end
        'b011 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 5;
        end
        'b001 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 6;
        end
        'b000 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 7;
        end
        'b110 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 8;
        end
        'b101 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 8;
        end

        'b010 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 9;
        end
        'b100 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 10;
        end
    endcase
end
rbsp_3[4] : begin
    len_3           <= 8;
    case (rbsp_3[5:7])
        'b111 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 8;
        end
        'b011 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 9;
        end
        'b110 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 9;
        end
        'b010 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 10;
        end
        'b101 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 10;
        end
        'b001 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 11;
        end
        'b100 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 11;
        end
        'b000 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 12;
        end
    endcase
end
rbsp_3[5] : begin
    len_3           <= 9;
    case (rbsp_3[6:8])
        'b111 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 10;
        end
        'b011 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 11;
        end
        'b110 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 11;
        end
        'b000 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 12;
        end
        'b010 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 12;
        end
        'b101 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 12;
        end
        'b001 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 13;
        end
        'b100 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 13;
        end
    endcase
end
rbsp_3[6] : begin
    if (rbsp_3[7:8] == 'b11)begin
        TrailingOnes_3  <= 1;
        TotalCoeff_3    <= 13;
        len_3           <= 9;
    end
    else if (rbsp_3[7:9] == 'b101)begin
        TrailingOnes_3  <= 0;
        TotalCoeff_3    <= 13;
        len_3           <= 10;
    end
    else if (rbsp_3[7:9] == 'b001)begin
        TrailingOnes_3  <= 0;
        TotalCoeff_3    <= 14;
        len_3           <= 10;
    end
    else if (rbsp_3[7:9] == 'b100)begin
        TrailingOnes_3  <= 1;
        TotalCoeff_3    <= 14;
        len_3           <= 10;
    end
    else if (rbsp_3[7:9] == 'b011)begin
        TrailingOnes_3  <= 2;
        TotalCoeff_3    <= 14;
        len_3           <= 10;
    end
    else if (rbsp_3[7:9] == 'b010)begin
        TrailingOnes_3  <= 3;
        TotalCoeff_3    <= 14;
        len_3           <= 10;
    end
    else begin
        TrailingOnes_3  <= 1;
        TotalCoeff_3    <= 15;
        len_3           <= 10;
    end
end
rbsp_3[7] : begin
    len_3           <= 10;
    case (rbsp_3[8:9])
        'b01 : begin
            TrailingOnes_3  <= 0;
            TotalCoeff_3    <= 15;
        end
        'b11 : begin
            TrailingOnes_3  <= 2;
            TotalCoeff_3    <= 15;
        end
        'b10 : begin
            TrailingOnes_3  <= 3;
            TotalCoeff_3    <= 15;
        end
        'b00 : begin
            TrailingOnes_3  <= 1;
            TotalCoeff_3    <= 16;
        end
    endcase
end
rbsp_3[8] : begin
    len_3           <= 10;
    if (rbsp_3[9] == 'b1)begin
        TrailingOnes_3  <= 2;
        TotalCoeff_3    <= 16;
    end
    else begin
        TrailingOnes_3  <= 3;
        TotalCoeff_3    <= 16;
    end
end
default : begin
    len_3           <= 10;
    TrailingOnes_3  <= 0;
    TotalCoeff_3    <= 16;
end
endcase

//------------------------
// nC > 8
//------------------------
always @(rbsp_4)
begin
    len_4 <= 6;
    if (rbsp_4[0:4] == 5'b00001) begin
        TrailingOnes_4  <= 0;
        TotalCoeff_4    <= 0;
    end
    else begin
        TrailingOnes_4  <= rbsp_4[4:5];
        TotalCoeff_4    <= rbsp_4[0:3] + 1'b1;
    end
end

//------------------------
// nC == -1
//------------------------
always @(rbsp_5)
case (1'b1)
rbsp_5[0] : begin
    TrailingOnes_5  <= 1;
    TotalCoeff_5    <= 1;
    len_5           <= 1;
end
rbsp_5[1] : begin
    TrailingOnes_5  <= 0;
    TotalCoeff_5    <= 0;
    len_5           <= 2;
end
rbsp_5[2] : begin
    TrailingOnes_5  <= 2;
    TotalCoeff_5    <= 2;
    len_5           <= 3;
end
rbsp_5[3] : begin
    len_5           <= 6;
    if (rbsp_5[4:5] == 'b11) begin
        TrailingOnes_5  <= 0;
        TotalCoeff_5    <= 1;
    end
    else if (rbsp_5[4:5] == 'b00) begin
        TrailingOnes_5  <= 0;
        TotalCoeff_5    <= 2;
    end
    else if (rbsp_5[4:5] == 'b10) begin
        TrailingOnes_5  <= 1;
        TotalCoeff_5    <= 2;
    end
    else begin
        TrailingOnes_5  <= 3;
        TotalCoeff_5    <= 3;
    end
end
rbsp_5[4] : begin
    len_5           <= 6;
    if (rbsp_5[5] == 'b1) begin
        TrailingOnes_5  <= 0;
        TotalCoeff_5    <= 3;
    end
    else begin
        TrailingOnes_5  <= 0;
        TotalCoeff_5    <= 4;
    end
end
rbsp_5[5] : begin
    len_5           <= 7;
    if (rbsp_5[6] == 'b1) begin
        TrailingOnes_5  <= 1;
        TotalCoeff_5    <= 3;
    end
    else begin
        TrailingOnes_5  <= 2;
        TotalCoeff_5    <= 3;
    end
end
rbsp_5[6] : begin
    len_5           <= 8;
    if (rbsp_5[7] == 'b1) begin
        TrailingOnes_5  <= 1;
        TotalCoeff_5    <= 4;
    end
    else begin
        TrailingOnes_5  <= 2;
        TotalCoeff_5    <= 4;
    end
end
default : begin
    len_5           <= 7;
    TrailingOnes_5  <= 3;
    TotalCoeff_5    <= 4;
end
endcase

//------------------------
//output mux
//------------------------
//startect a colum according to nC
always @(*)
begin
    if (nC == -1) begin
        TrailingOnes_comb   <= TrailingOnes_5;
        TotalCoeff_comb     <= TotalCoeff_5;
        len_comb            <= len_5;
    end
    else if (nC[4] | nC[3]) begin
        TrailingOnes_comb   <= TrailingOnes_4;
        TotalCoeff_comb     <= TotalCoeff_4;
        len_comb            <= len_4;
    end
    else if (nC[2]) begin
        TrailingOnes_comb   <= TrailingOnes_3;
        TotalCoeff_comb     <= TotalCoeff_3;
        len_comb            <= len_3;
    end
    else if (nC[1]) begin
        TrailingOnes_comb   <= TrailingOnes_2;
        TotalCoeff_comb     <= TotalCoeff_2;
        len_comb            <= len_2;
    end
    else begin
        TrailingOnes_comb   <= TrailingOnes_1;
        TotalCoeff_comb     <= TotalCoeff_1;
        len_comb            <= len_1;
    end
end

//------------------------
//TrailingOnes & TotalCoeff
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    TrailingOnes    <= 0;
    TotalCoeff      <= 0;
end
else if (ena && sel) begin
    TrailingOnes    <= TrailingOnes_comb;
    TotalCoeff      <= TotalCoeff_comb;
end

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_read_total_zeros                                      ////
////                                                              ////
////  Description                                                 ////
////       decode total_zeros                                     ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-14 initial version


module cavlc_read_total_zeros
(
    ena,
    sel,
    chroma_DC_sel,
    rbsp,
    TotalCoeff,
    TotalZeros_comb,
    len_comb
);
//------------------------
//ports
//------------------------
input   ena;
input   sel;
input   chroma_DC_sel;
input   [0:8]   rbsp;
input   [3:0]   TotalCoeff;

output  [3:0]   TotalZeros_comb;
output  [3:0]   len_comb;

//-------------------------
//rregs
//-------------------------
reg     [3:0]   TotalZeros_comb;    //TotalZeros will be saved as ZeroLeft in module cavlc_read_run_befores 
reg     [3:0]   len_comb;


//for  chroma_DC
reg     [0:2]   rbsp_chroma_DC;         
reg     [1:0]   TotalZeros_chroma_DC;
reg     [1:0]   len_chroma_DC;

//for TotalCoeff <= 3
reg     [0:8]   rbsp_LE3;       
reg     [3:0]   TotalZeros_LE3;
reg     [3:0]   len_LE3;

//for TotalCoeff > 3
reg     [0:5]   rbsp_G3;        
reg     [3:0]   TotalZeros_G3;
reg     [2:0]   len_G3;


//----------------------------------------
//input mux
//----------------------------------------
always @(*)
if (ena && sel && chroma_DC_sel) begin
    rbsp_chroma_DC  <= rbsp[0:2];
    rbsp_LE3        <= 'hffff;
    rbsp_G3         <= 'hffff;
end
else if (ena && sel && TotalCoeff[3:2] == 2'b00) begin
    rbsp_chroma_DC  <= 'hffff;
    rbsp_LE3        <= rbsp[0:8];
    rbsp_G3         <= 'hffff;
end
else if (ena && sel)begin
    rbsp_chroma_DC  <= 'hffff;
    rbsp_LE3        <= 'hffff;
    rbsp_G3         <= rbsp[0:5];
end
else begin
    rbsp_chroma_DC  <= 'hffff;
    rbsp_LE3        <= 'hffff;
    rbsp_G3         <= 'hffff;
end

//----------------------------------------
//TotalZeros_chroma_DC & len_chroma_DC
//----------------------------------------
always @(*)
if ( TotalCoeff == 1 && rbsp_chroma_DC[0] ) begin
    TotalZeros_chroma_DC    <= 0;
    len_chroma_DC           <= 1;
end
else if ( TotalCoeff == 1 && rbsp_chroma_DC[1] ) begin
    TotalZeros_chroma_DC    <= 1;
    len_chroma_DC           <= 2;
end
else if ( TotalCoeff == 1 && rbsp_chroma_DC[2] ) begin
    TotalZeros_chroma_DC    <= 2;
    len_chroma_DC           <= 3;
end
else if ( TotalCoeff == 1 ) begin
    TotalZeros_chroma_DC    <= 3;
    len_chroma_DC           <= 3;
end
else if ( TotalCoeff == 2 && rbsp_chroma_DC[0] ) begin
    TotalZeros_chroma_DC    <= 0;
    len_chroma_DC           <= 1;
end
else if ( TotalCoeff == 2 && rbsp_chroma_DC[1] ) begin
    TotalZeros_chroma_DC    <= 1;
    len_chroma_DC           <= 2;
end
else if ( TotalCoeff == 2 ) begin
    TotalZeros_chroma_DC    <= 2;
    len_chroma_DC           <= 2;
end
else if ( rbsp_chroma_DC[0] ) begin
    TotalZeros_chroma_DC    <= 0;
    len_chroma_DC           <= 1;
end
else begin
    TotalZeros_chroma_DC    <= 1;
    len_chroma_DC           <= 1;
end


//---------------------------------
//TotalZeros_LE3 & len_LE3
//---------------------------------
always @(rbsp_LE3 or TotalCoeff)
case (TotalCoeff[1:0])
1 :begin
    case(1'b1)
    rbsp_LE3[0] : begin
        TotalZeros_LE3  <= 0;
        len_LE3         <= 1;   
    end
    rbsp_LE3[1] : begin
        len_LE3         <= 3;
        if (rbsp_LE3[2])
            TotalZeros_LE3  <= 1;
        else
            TotalZeros_LE3  <= 2;
    end
    rbsp_LE3[2] : begin
        len_LE3         <= 4;
        if (rbsp_LE3[3])
            TotalZeros_LE3  <= 3;
        else
            TotalZeros_LE3  <= 4;
    end
    rbsp_LE3[3] : begin
        len_LE3         <= 5;
        if (rbsp_LE3[4])
            TotalZeros_LE3  <= 5;
        else
            TotalZeros_LE3  <= 6;
    end
    rbsp_LE3[4] : begin
        len_LE3         <= 6;
        if (rbsp_LE3[5])
            TotalZeros_LE3  <= 7;
        else
            TotalZeros_LE3  <= 8;
    end
    rbsp_LE3[5] : begin
        len_LE3         <= 7;
        if (rbsp_LE3[6])
            TotalZeros_LE3  <= 9;
        else
            TotalZeros_LE3  <= 10;
    end
    rbsp_LE3[6] : begin
        len_LE3         <= 8;
        if (rbsp_LE3[7])
            TotalZeros_LE3  <= 11;
        else
            TotalZeros_LE3  <= 12;
    end
    rbsp_LE3[7] : begin
        len_LE3         <= 9;
        if (rbsp_LE3[8])
            TotalZeros_LE3  <= 13;
        else
            TotalZeros_LE3  <= 14;
    end
    default : begin
        len_LE3         <= 9;
        TotalZeros_LE3  <= 15;
    end
    endcase
end
2 : begin
    case(1'b1)
    rbsp_LE3[0] : begin
        len_LE3 <= 3;
        case(rbsp_LE3[1:2])
        'b11 :  TotalZeros_LE3  <= 0;
        'b10 :  TotalZeros_LE3  <= 1;
        'b01 :  TotalZeros_LE3  <= 2;
        'b00 :  TotalZeros_LE3  <= 3;
        endcase
    end
    rbsp_LE3[1] : begin
        if (rbsp_LE3[2]) begin
            TotalZeros_LE3  <= 4;
            len_LE3         <= 3;
        end
        else begin
            len_LE3         <= 4;
            if (rbsp_LE3[3])
                TotalZeros_LE3  <= 5;
            else
                TotalZeros_LE3  <= 6;
        end
    end
    rbsp_LE3[2] : begin
        len_LE3         <= 4;
        if (rbsp_LE3[3])
            TotalZeros_LE3  <= 7;
        else
            TotalZeros_LE3  <= 8;
    end
    rbsp_LE3[3] : begin
        len_LE3         <= 5;
        if (rbsp_LE3[4])
            TotalZeros_LE3  <= 9;
        else
            TotalZeros_LE3  <= 10;
    end
    default : begin
        len_LE3 <= 6;
        case(rbsp_LE3[4:5])
        'b11 :  TotalZeros_LE3  <= 11;
        'b10 :  TotalZeros_LE3  <= 12;
        'b01 :  TotalZeros_LE3  <= 13;
        'b00 :  TotalZeros_LE3  <= 14;
        endcase
    end
    endcase
end
3 : begin
    case(1'b1)
    rbsp_LE3[0] : begin
        len_LE3 <= 3;
        case(rbsp_LE3[1:2])
        'b11 :  TotalZeros_LE3  <= 1;
        'b10 :  TotalZeros_LE3  <= 2;
        'b01 :  TotalZeros_LE3  <= 3;
        'b00 :  TotalZeros_LE3  <= 6;
        endcase
    end
    rbsp_LE3[1] : begin
        if (rbsp_LE3[2]) begin
            TotalZeros_LE3  <= 7;
            len_LE3         <= 3;
        end
        else begin
            len_LE3         <= 4;
            if (rbsp_LE3[3])
                TotalZeros_LE3  <= 0;
            else
                TotalZeros_LE3  <= 4;
        end
    end
    rbsp_LE3[2] : begin
        len_LE3         <= 4;
        if (rbsp_LE3[3])
            TotalZeros_LE3  <= 5;
        else
            TotalZeros_LE3  <= 8;
    end
    rbsp_LE3[3] : begin
        len_LE3         <= 5;
        if (rbsp_LE3[4])
            TotalZeros_LE3  <= 9;
        else
            TotalZeros_LE3  <= 10;
    end
    rbsp_LE3[4] : begin
        len_LE3         <= 5;
        TotalZeros_LE3  <= 12;
    end
    default : begin
        len_LE3 <= 6;
        if(rbsp_LE3[5])
            TotalZeros_LE3  <= 11;
        else
            TotalZeros_LE3  <= 13;      
    end
    endcase
end
default : begin
    len_LE3         <= 'bx;
    TotalZeros_LE3  <= 'bx;
end
endcase

//---------------------------------
//TotalZeros_G3 & len_G3
//---------------------------------
always @(rbsp_G3 or TotalCoeff)
case (TotalCoeff)
4 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3  <= 3;
        case(rbsp_G3[1:2])
        'b11 :  TotalZeros_G3   <= 1;
        'b10 :  TotalZeros_G3   <= 4;
        'b01 :  TotalZeros_G3   <= 5;
        'b00 :  TotalZeros_G3   <= 6;
        endcase
    end
    rbsp_G3[1] : begin
        if (rbsp_G3[2]) begin
            TotalZeros_G3   <= 8;
            len_G3          <= 3;
        end
        else begin
            len_G3          <= 4;
            if (rbsp_G3[3])
                TotalZeros_G3   <= 2;
            else
                TotalZeros_G3   <= 3;
        end
    end
    rbsp_G3[2] : begin
        len_G3          <= 4;
        if (rbsp_G3[3])
            TotalZeros_G3   <= 7;
        else
            TotalZeros_G3   <= 9;
    end
    default : begin
        len_G3  <= 5;
        case(rbsp_G3[3:4])
        'b11 :  TotalZeros_G3   <= 0;
        'b10 :  TotalZeros_G3   <= 10;
        'b01 :  TotalZeros_G3   <= 11;
        'b00 :  TotalZeros_G3   <= 12;
        endcase
    end
    endcase
end
5 :begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3  <= 3;
        case(rbsp_G3[1:2])
        'b11 :  TotalZeros_G3   <= 3;
        'b10 :  TotalZeros_G3   <= 4;
        'b01 :  TotalZeros_G3   <= 5;
        'b00 :  TotalZeros_G3   <= 6;
        endcase
    end
    rbsp_G3[1] : begin
        if (rbsp_G3[2]) begin
            TotalZeros_G3   <= 7;
            len_G3          <= 3;
        end
        else begin
            len_G3          <= 4;
            if (rbsp_G3[3])
                TotalZeros_G3   <= 0;
            else
                TotalZeros_G3   <= 1;
        end
    end
    rbsp_G3[2] : begin
        len_G3          <= 4;
        if (rbsp_G3[3])
            TotalZeros_G3   <= 2;
        else
            TotalZeros_G3   <= 8;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 10;
    end
    default : begin
        len_G3  <= 5;
        if (rbsp_G3[4])
            TotalZeros_G3   <= 9;
        else
            TotalZeros_G3   <= 11;
    end
    endcase
end
6 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3  <= 3;
        case(rbsp_G3[1:2])
        'b11 :  TotalZeros_G3   <= 2;
        'b10 :  TotalZeros_G3   <= 3;
        'b01 :  TotalZeros_G3   <= 4;
        'b00 :  TotalZeros_G3   <= 5;
        endcase
    end
    rbsp_G3[1] : begin
        len_G3          <= 3;
        if (rbsp_G3[2])
            TotalZeros_G3   <= 6;
        else
            TotalZeros_G3   <= 7;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 9;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 8;
    end
    rbsp_G3[4] : begin
        len_G3          <= 5;
        TotalZeros_G3   <= 1;
    end
    default : begin
        len_G3  <= 6;
        if (rbsp_G3[5])
            TotalZeros_G3   <= 0;
        else
            TotalZeros_G3   <= 10;
    end
    endcase
end
7 :begin
    case(1'b1)
    rbsp_G3[0] : begin
        if (rbsp_G3[1]) begin
            TotalZeros_G3   <= 5;
            len_G3          <= 2;
        end
        else begin
            len_G3          <= 3;
            if (rbsp_G3[2])
                TotalZeros_G3   <= 2;
            else
                TotalZeros_G3   <= 3;
        end
    end
    rbsp_G3[1] : begin
        len_G3  <= 3;
        if (rbsp_G3[2])
            TotalZeros_G3   <= 4;
        else
            TotalZeros_G3   <= 6;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 8;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 7;
    end
    rbsp_G3[4] : begin
        len_G3          <= 5;
        TotalZeros_G3   <= 1;
    end
    default : begin
        len_G3          <= 6;
        if (rbsp_G3[5])
            TotalZeros_G3   <= 0;
        else
            TotalZeros_G3   <= 9;
    end
    endcase
end
8 :begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3          <= 2;
        if (rbsp_G3[1]) 
            TotalZeros_G3   <= 4;
        else 
            TotalZeros_G3   <= 5;
    end
    rbsp_G3[1] : begin
        len_G3          <= 3;
        if (rbsp_G3[2]) 
            TotalZeros_G3   <= 3;
        else 
            TotalZeros_G3   <= 6;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 7;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 1;
    end
    rbsp_G3[4] : begin
        len_G3          <= 5;
        TotalZeros_G3   <= 2;
    end
    default : begin
        len_G3          <= 6;
        if (rbsp_G3[5])
            TotalZeros_G3   <= 0;
        else
            TotalZeros_G3   <= 8;
    end
    endcase
end
9 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3          <= 2;
        if (rbsp_G3[1]) 
            TotalZeros_G3   <= 3;
        else 
            TotalZeros_G3   <= 4;
    end
    rbsp_G3[1] : begin
        len_G3          <= 2;
        TotalZeros_G3   <= 6;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 5;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 2;
    end
    rbsp_G3[4] : begin
        len_G3          <= 5;
        TotalZeros_G3   <= 7;
    end
    default : begin
        len_G3          <= 6;
        if (rbsp_G3[5])
            TotalZeros_G3   <= 0;
        else
            TotalZeros_G3   <= 1;
    end
    endcase
end
10 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3          <= 2;
        if (rbsp_G3[1]) 
            TotalZeros_G3   <= 3;
        else 
            TotalZeros_G3   <= 4;
    end
    rbsp_G3[1] : begin
        len_G3          <= 2;
        TotalZeros_G3   <= 5;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 2;
    end
    rbsp_G3[3] : begin
        len_G3          <= 4;
        TotalZeros_G3   <= 6;
    end
    default : begin
        len_G3          <= 5;
        if (rbsp_G3[4])
            TotalZeros_G3   <= 0;
        else
            TotalZeros_G3   <= 1;
    end
    endcase
end
11 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3          <= 1;
        TotalZeros_G3   <= 4;
    end
    rbsp_G3[1] : begin
        len_G3          <= 3;
        if (rbsp_G3[2]) 
            TotalZeros_G3   <= 5;
        else 
            TotalZeros_G3   <= 3;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 2;
    end
    default : begin
        len_G3          <= 4;
        if (rbsp_G3[3])
            TotalZeros_G3   <= 1;
        else
            TotalZeros_G3   <= 0;
    end
    endcase
end
12 : begin
    case(1'b1)
    rbsp_G3[0] : begin
        len_G3          <= 1;
        TotalZeros_G3   <= 3;
    end
    rbsp_G3[1] : begin
        len_G3          <= 2;
        TotalZeros_G3   <= 2;
    end
    rbsp_G3[2] : begin
        len_G3          <= 3;
        TotalZeros_G3   <= 4;
    end
    default : begin
        len_G3          <= 4;
        if (rbsp_G3[3])
            TotalZeros_G3   <= 1;
        else
            TotalZeros_G3   <= 0;
    end
    endcase
end
13  :begin
    if (rbsp_G3[0]) begin
        TotalZeros_G3   <= 2;
        len_G3          <= 1;       
    end
    else if (rbsp_G3[1]) begin
        TotalZeros_G3   <= 3;
        len_G3          <= 2;   
    end
    else if (rbsp_G3[2]) begin
        TotalZeros_G3   <= 1;
        len_G3          <= 3;   
    end
    else begin
        TotalZeros_G3   <= 0;
        len_G3          <= 3;       
    end
end
14  : begin
    if (rbsp_G3[0]) begin
        TotalZeros_G3   <= 2;
        len_G3          <= 1;       
    end
    else if (rbsp_G3[1]) begin
        TotalZeros_G3   <= 1;
        len_G3          <= 2;   
    end
    else begin
        TotalZeros_G3   <= 0;
        len_G3          <= 2;       
    end
end
15  : begin
    len_G3  <= 1;
    if (rbsp_G3[0])
        TotalZeros_G3   <= 1;
    else
        TotalZeros_G3   <= 0;
end
default : begin
    len_G3          <= 'bx;
    TotalZeros_G3   <= 'bx;
end
endcase

//---------------------------------
//TotalZeros_comb & len_comb
//---------------------------------
always @(*)
if (ena && sel && chroma_DC_sel) begin
    TotalZeros_comb     <= TotalZeros_chroma_DC;
    len_comb            <= len_chroma_DC;
end
else if (ena && sel && TotalCoeff[3:2] == 2'b00) begin
    TotalZeros_comb     <= TotalZeros_LE3;
    len_comb            <= len_LE3;
end
else if (ena && sel)begin
    TotalZeros_comb     <= TotalZeros_G3;
    len_comb            <= len_G3;
end
else begin
    TotalZeros_comb     <= 0;
    len_comb            <= 0;
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  cavlc_top                                                   ////
////                                                              ////
////  Description                                                 ////
////       top module of cavlc decoder                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - bin qiu, qiubin@opencores.org                         ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

//2011-8-7 initial version


module cavlc_top
(
    clk,
    rst_n,
    ena,
    start,
    rbsp,
    nC,
    max_coeff_num,

    coeff_0,
    coeff_1,
    coeff_2,
    coeff_3,
    coeff_4,
    coeff_5,
    coeff_6,
    coeff_7,
    coeff_8,
    coeff_9,
    coeff_10,
    coeff_11,
    coeff_12,
    coeff_13,
    coeff_14,
    coeff_15,
    TotalCoeff,
    len_comb,
    idle,
    valid
);
//------------------------
// ports
//------------------------
input   clk, rst_n;
input   ena;
input   start;
input   [0:15]  rbsp;
input   signed [5:0]    nC;
input   [4:0]   max_coeff_num;

output  signed [8:0]    coeff_0;
output  signed [8:0]    coeff_1;
output  signed [8:0]    coeff_2;
output  signed [8:0]    coeff_3;
output  signed [8:0]    coeff_4;
output  signed [8:0]    coeff_5;
output  signed [8:0]    coeff_6;
output  signed [8:0]    coeff_7;
output  signed [8:0]    coeff_8;
output  signed [8:0]    coeff_9;
output  signed [8:0]    coeff_10;
output  signed [8:0]    coeff_11;
output  signed [8:0]    coeff_12;
output  signed [8:0]    coeff_13;
output  signed [8:0]    coeff_14;
output  signed [8:0]    coeff_15;
output  [4:0]   TotalCoeff;
output  [4:0]   len_comb;
output  idle;
output  valid;

//------------------------
// cavlc_read_total_coeffs
//------------------------
wire [1:0] TrailingOnes;
wire [4:0] TotalCoeff;
wire [1:0] TrailingOnes_comb;
wire [4:0] TotalCoeff_comb;
wire [4:0] len_read_total_coeffs_comb;
wire [7:0] cavlc_state;

cavlc_read_total_coeffs cavlc_read_total_coeffs(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .start(start),
    .sel(cavlc_state[`cavlc_read_total_coeffs_bit]),
    
    .rbsp(rbsp),
    .nC(nC),
    
    .TrailingOnes(TrailingOnes), 
    .TotalCoeff(TotalCoeff),

    .TrailingOnes_comb(TrailingOnes_comb), 
    .TotalCoeff_comb(TotalCoeff_comb),

    .len_comb(len_read_total_coeffs_comb)
);

//------------------------
// cavlc_read_levels
//------------------------
wire    [4:0]   len_read_levels_comb;
wire    [3:0]   i;

wire    [8:0]   level_0;
wire    [8:0]   level_1;
wire    [8:0]   level_2;
wire    [8:0]   level_3;
wire    [8:0]   level_4;
wire    [8:0]   level_5;
wire    [8:0]   level_6;
wire    [8:0]   level_7;
wire    [8:0]   level_8;
wire    [8:0]   level_9;
wire    [8:0]   level_10;
wire    [8:0]   level_11;
wire    [8:0]   level_12;
wire    [8:0]   level_13;
wire    [8:0]   level_14;
wire    [8:0]   level_15;

cavlc_read_levels cavlc_read_levels(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),  
    .t1s_sel(cavlc_state[`cavlc_read_t1s_flags_bit]),
    .prefix_sel(cavlc_state[`cavlc_read_level_prefix_bit]),
    .suffix_sel(cavlc_state[`cavlc_read_level_suffix_bit]),
    .calc_sel(cavlc_state[`cavlc_calc_level_bit]),
    .TrailingOnes(TrailingOnes), 
    .TotalCoeff(TotalCoeff),
    .i(i),
    .rbsp(rbsp),
    
    .level_0(level_0),
    .level_1(level_1),
    .level_2(level_2),
    .level_3(level_3),
    .level_4(level_4),
    .level_5(level_5),
    .level_6(level_6),
    .level_7(level_7),
    .level_8(level_8),
    .level_9(level_9),
    .level_10(level_10),
    .level_11(level_11),
    .level_12(level_12),
    .level_13(level_13),
    .level_14(level_14),
    .level_15(level_15),
    .len_comb(len_read_levels_comb)
);

//------------------------
// cavlc_read_total_zeros
//------------------------
wire    [3:0]   TotalZeros_comb;
wire    [3:0]   len_read_total_zeros_comb;

cavlc_read_total_zeros cavlc_read_total_zeros(
    .ena(ena),
    .sel(cavlc_state[`cavlc_read_total_zeros_bit]),
    .chroma_DC_sel(nC[5]),
    .rbsp(rbsp[0:8]),
    .TotalCoeff(TotalCoeff[3:0]),
    .TotalZeros_comb(TotalZeros_comb),
    .len_comb(len_read_total_zeros_comb)
);

//------------------------
// read_run_before
//------------------------
wire    [3:0]   ZeroLeft;
wire    [3:0]   len_read_run_befores_comb;

cavlc_read_run_befores cavlc_read_run_befores(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .clr(cavlc_state[`cavlc_read_total_coeffs_bit]),
    .sel(cavlc_state[`cavlc_read_run_befores_bit]),
    .ZeroLeft_init(cavlc_state[`cavlc_read_total_zeros_bit]),
    
    .rbsp(rbsp[0:10]),
    .i(i),
    .TotalZeros_comb(TotalZeros_comb),
    
    .level_0(level_0),
    .level_1(level_1),
    .level_2(level_2),
    .level_3(level_3),
    .level_4(level_4),
    .level_5(level_5),
    .level_6(level_6),
    .level_7(level_7),
    .level_8(level_8),
    .level_9(level_9),
    .level_10(level_10),
    .level_11(level_11),
    .level_12(level_12),
    .level_13(level_13),
    .level_14(level_14),
    .level_15(level_15),
        
    .coeff_0(coeff_0),
    .coeff_1(coeff_1),
    .coeff_2(coeff_2),
    .coeff_3(coeff_3),
    .coeff_4(coeff_4),
    .coeff_5(coeff_5),
    .coeff_6(coeff_6),
    .coeff_7(coeff_7),
    .coeff_8(coeff_8),
    .coeff_9(coeff_9),
    .coeff_10(coeff_10),
    .coeff_11(coeff_11),
    .coeff_12(coeff_12),
    .coeff_13(coeff_13),
    .coeff_14(coeff_14),
    .coeff_15(coeff_15),
    .ZeroLeft(ZeroLeft),
    .len_comb(len_read_run_befores_comb)
);

//------------------------
// cavlc_len_gen
//------------------------
wire [4:0] len_comb;

cavlc_len_gen cavlc_len_gen(
    .cavlc_state(cavlc_state),
    .len_read_total_coeffs_comb(len_read_total_coeffs_comb),
    .len_read_levels_comb(len_read_levels_comb),
    .len_read_total_zeros_comb(len_read_total_zeros_comb),
    .len_read_run_befores_comb(len_read_run_befores_comb),
    .len_comb(len_comb)
);

//------------------------
// fsm
//------------------------
cavlc_fsm cavlc_fsm(
    .clk(clk),
    .rst_n(rst_n),
    .ena(ena),
    .start(start),
    
    .max_coeff_num(max_coeff_num),
    .TotalCoeff(TotalCoeff),
    .TotalCoeff_comb(TotalCoeff_comb),
    .TrailingOnes(TrailingOnes),
    .TrailingOnes_comb(TrailingOnes_comb),
    .ZeroLeft(ZeroLeft),
    .state(cavlc_state),
    .i(i),
    .idle(idle),
    .valid(valid) 
);

endmodule
