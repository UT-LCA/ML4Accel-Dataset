open_project -reset "io1_l1n1n1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1n1n1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1n1n1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1n1p1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3n1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3n1p1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io1_l1p1n1_l3p1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 1 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 1 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 1 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1n2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1n1p2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1n2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3n1p2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p2n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p1n1_l3p2n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1n2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3n1p2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p2n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io2_l1p2n1_l3p2n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 2 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 2 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n1_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n2_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1n4_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p1_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p2_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1n1p4_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n4_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1n4_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p4_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3n1p4_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p2n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p2n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p4n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p1n1_l3p4n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n4_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1n4_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p4_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3n1p4_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p2n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p2n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p4n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p2n1_l3p4n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n2_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n2_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n4_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1n4_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p2_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p2_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p4_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3n1p4_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p1n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p1n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p2n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p2n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p4n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io4_l1p4n1_l3p4n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 4 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 4 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n1_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n2_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n4_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1n8_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p1_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p2_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p4_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1n8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p2_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p2_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p4_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p4_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p8_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3n1p8_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p1n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p1n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p2n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p2n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p4n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p4n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p8n1_l5n1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1n1p8_l3p8n1_l5n1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp2"
set_directive_unroll -factor 8 "gesummv/lp2"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n4_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n4_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n8_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1n8_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p2_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p2_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p4_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p4_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p8_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3n1p8_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p1n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p1n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p2n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p2n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p4n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p4n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p8n1_l5p1"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p1n1_l3p8n1_l5p1_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 1 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n4_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n4_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n8_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1n8_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p2_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p2_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p4_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p4_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p8_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3n1p8_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p1n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p1n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p2n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p2n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p4n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p4n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p8n1_l5p2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p2n1_l3p8n1_l5p2_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 2 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n2_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n2_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n4_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n4_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n8_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1n8_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p2_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p2_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p4_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p4_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p8_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3n1p8_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p1n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p1n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p2n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p2n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p4n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p4n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p8n1_l5p4"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p4n1_l3p8n1_l5p4_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 4 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n2_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n2_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n4_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n4_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n8_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1n8_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 1 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p2_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p2_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 2 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p4_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p4_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 4 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p8_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3n1p8_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp4"
set_directive_unroll -factor 8 "gesummv/lp4"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p1n1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p1n1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 1 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p2n1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p2n1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 2 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p4n1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p4n1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 4 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p8n1_l5p8"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

open_project -reset "io8_l1p8n1_l3p8n1_l5p8_d1d2"
set_top gesummv
add_files ../src/gesummv.h
add_files ../src/gesummv.c
open_solution "solution"
set_part {xczu9eg-ffvb1156-2-i}
create_clock -period 10 -name default
set_directive_resource -core RAM_1P "gesummv" A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" A
set_directive_resource -core RAM_1P "gesummv" B
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" B
set_directive_resource -core RAM_1P "gesummv" x
set_directive_interface -mode ap_fifo "gesummv" y_out
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 2 "gesummv" buff_B
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_x
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_y_out
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" tmp2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_A
set_directive_array_partition -type cyclic -factor 8 -dim 1 "gesummv" buff_B
set_directive_pipeline "gesummv/lprd_2"
set_directive_unroll -factor 8 "gesummv/lprd_2"
set_directive_pipeline "gesummv/lpwr"
set_directive_unroll -factor 8 "gesummv/lpwr"
set_directive_pipeline "gesummv/lp1"
set_directive_unroll -factor 8 "gesummv/lp1"
set_directive_pipeline "gesummv/lp3"
set_directive_unroll -factor 8 "gesummv/lp3"
set_directive_pipeline "gesummv/lp5"
set_directive_unroll -factor 8 "gesummv/lp5"
csynth_design
close_project

