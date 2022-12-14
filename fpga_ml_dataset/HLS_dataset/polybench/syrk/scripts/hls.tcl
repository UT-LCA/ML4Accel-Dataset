open_project -reset "io1_l2n1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2n1p1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io1_l2p1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 1 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1n2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2n1p2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io2_l2p2n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 2 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n2_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1n4_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p2_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2n1p4_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p1n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p2n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io4_l2p4n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 4 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n2_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n4_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1n8_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p2_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p4_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2n1p8_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp3"
set_directive_unroll -factor 8 "syrk/lp3"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p1n1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p2n1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p4n1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1n8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 1 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p2_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 2 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p4"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p4_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 4 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p8"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4n1p8_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp5"
set_directive_unroll -factor 8 "syrk/lp5"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p1n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p1n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 1 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p2n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p2n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 2 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p4n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p4n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 4 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p8n1"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

open_project -reset "io8_l2p8n1_l4p8n1_d1d2"
set_top syrk
add_files ../src/syrk.h
add_files ../src/syrk.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "syrk" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" A
set_directive_resource -core RAM_1P "syrk" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" B
set_directive_interface -mode ap_fifo "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" C_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "syrk" buff_C_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A0
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_A1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "syrk" buff_C_out
set_directive_pipeline "syrk/lprd_2"
set_directive_unroll -factor 8 "syrk/lprd_2"
set_directive_pipeline "syrk/lpwr_2"
set_directive_unroll -factor 8 "syrk/lpwr_2"
set_directive_pipeline "syrk/lp2"
set_directive_unroll -factor 8 "syrk/lp2"
set_directive_pipeline "syrk/lp4"
set_directive_unroll -factor 8 "syrk/lp4"
csynth_design
close_project

