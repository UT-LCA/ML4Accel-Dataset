open_project -reset "io1_l1n1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1n1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1n1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 1 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 2 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 4 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp2"
set_directive_unroll -factor 8 "bicg/lp2"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 1 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p2_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 2 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p4"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p4_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 4 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p8"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p8_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp4"
set_directive_unroll -factor 8 "bicg/lp4"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p1n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p1n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 1 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p2n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p2n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 2 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p4n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p4n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 4 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p8n1"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p8n1_d1d2"
set_top bicg
add_files ../src/bicg.h
add_files ../src/bicg.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "bicg" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" A
set_directive_resource -core RAM_1P "bicg" r
set_directive_resource -core RAM_1P "bicg" p
set_directive_interface -mode ap_fifo "bicg" s_out
set_directive_interface -mode ap_fifo "bicg" q_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "bicg" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_p
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_r
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_s_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_q_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "bicg" buff_A
set_directive_pipeline "bicg/lprd_2"
set_directive_unroll -factor 8 "bicg/lprd_2"
set_directive_pipeline "bicg/lpwr"
set_directive_unroll -factor 8 "bicg/lpwr"
set_directive_pipeline "bicg/lp1"
set_directive_unroll -factor 8 "bicg/lp1"
set_directive_pipeline "bicg/lp3"
set_directive_unroll -factor 8 "bicg/lp3"
csynth_design
close_project

