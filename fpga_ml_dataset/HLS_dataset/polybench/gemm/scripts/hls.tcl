open_project -reset "io1_l2n1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 1 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 2 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 4 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp3"
set_directive_unroll -factor 8 "gemm/lp3"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 1 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p2_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 2 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p4"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p4_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 4 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p8"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p8_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp5"
set_directive_unroll -factor 8 "gemm/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p1n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p1n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 1 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p2n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p2n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 2 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p4n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p4n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 4 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p8n1"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p8n1_d1d2"
set_top gemm
add_files ../src/gemm.h
add_files ../src/gemm.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gemm" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" A
set_directive_resource -core RAM_1P "gemm" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" B
set_directive_resource -core RAM_1P "gemm" C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" C
set_directive_interface -mode ap_fifo "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gemm" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_C
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" buff_D_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gemm" tmp1
set_directive_pipeline "gemm/lprd_2"
set_directive_unroll -factor 8 "gemm/lprd_2"
set_directive_pipeline "gemm/lpwr_2"
set_directive_unroll -factor 8 "gemm/lpwr_2"
set_directive_pipeline "gemm/lp2"
set_directive_unroll -factor 8 "gemm/lp2"
set_directive_pipeline "gemm/lp4"
set_directive_unroll -factor 8 "gemm/lp4"
csynth_design
close_project

